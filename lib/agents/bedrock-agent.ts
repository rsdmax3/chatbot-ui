import {
  BedrockRuntimeClient,
  ConverseCommand,
  ConverseCommandInput,
  Message,
  ToolConfiguration
} from "@aws-sdk/client-bedrock-runtime"
import { AgentConfig, InboundApi, ToolItem } from "./agent-api"
import { AwsCredentialIdentity } from "@aws-sdk/types"

// Function to get AWS credentials
function getAwsCredentials(): AwsCredentialIdentity {
  const accessKeyId = process.env.AWS_ACCESS_KEY_ID
  const secretAccessKey = process.env.AWS_SECRET_ACCESS_KEY
  const sessionToken = process.env.AWS_SESSION_TOKEN

  if (!accessKeyId || !secretAccessKey) {
    throw new Error(
      "AWS credentials are not properly configured in environment variables."
    )
  }

  return {
    accessKeyId,
    secretAccessKey,
    sessionToken: sessionToken || undefined
  }
}

export type ModelProfileGrade =
  | "heavy-v1"
  | "medium-v2"
  | "medium-v1"
  | "light-v1"

export type ModelProfileClass = "heavy" | "medium" | "light"

export function modelProfileClassToGrade(
  modelClass: ModelProfileClass
): ModelProfileGrade {
  switch (modelClass) {
    case "heavy":
      return "heavy-v1"
    case "medium":
      return "medium-v2"
    case "light":
      return "light-v1"
  }
}

export type ModelProfile = {
  grade: ModelProfileGrade
  region: string
  modelName: string
}

export function getModelProfile(grade: ModelProfileGrade): ModelProfile {
  // only the opus model is limited to a single region
  //
  switch (grade) {
    case "heavy-v1":
      return {
        grade: "heavy-v1",
        region: "us-west-2",
        modelName: "anthropic.claude-3-opus-20240229-v1:0"
      }
    case "medium-v2":
      return {
        grade: "medium-v2",
        region: "us-east-1",
        modelName: "anthropic.claude-3-5-sonnet-20240620-v1:0"
      }
    case "medium-v1":
      return {
        grade: "medium-v1",
        region: "us-east-1",
        modelName: "anthropic.claude-3-sonnet-20240229-v1:0"
      }
    case "light-v1":
      return {
        grade: "light-v1",
        region: "us-east-1",
        modelName: "anthropic.claude-3-haiku-20240307-v1:0"
      }
  }
}

export function getModelForGrade(grade: ModelProfileGrade): string {
  return getModelProfile(grade).modelName
}

export function getDefaultModel(): string {
  return getModelForGrade("medium-v2")
}

export class BedrockAgent {
  protected config: AgentConfig
  protected _client: BedrockRuntimeClient
  protected _overrideClients: Record<ModelProfileGrade, BedrockRuntimeClient> =
    {} as Record<ModelProfileGrade, BedrockRuntimeClient>
  protected tools: ToolItem[] = []
  private history: Message[] = []
  private _systemPrompt: string = ""
  protected keepsHistory: boolean = true
  protected parentAgent: BedrockAgent | null = null
  public lastFollowup: string[] = []

  get systemPrompt() {
    return this._systemPrompt
  }
  set systemPrompt(value: string) {
    this._systemPrompt = value
  }

  getClient(modelGradeOverride?: ModelProfileGrade) {
    if (!modelGradeOverride) {
      return this._client
    }

    let result = this._overrideClients[modelGradeOverride]
    if (result) {
      return result
    }

    result = new BedrockRuntimeClient({
      region: getModelProfile(modelGradeOverride).region,
      credentials: getAwsCredentials()
    })

    this._overrideClients[modelGradeOverride] = result

    return result
  }

  constructor(config: AgentConfig, parentAgent?: BedrockAgent) {
    this.config = config
    if (parentAgent) {
      this.parentAgent = parentAgent
    }

    const modelSpec = getModelProfile(config.modelGrade)
    const params = {
      region: modelSpec.region,
      credentials: getAwsCredentials()
    }

    this._client = new BedrockRuntimeClient(params)
  }

  trackFollowup(followup: string, api: InboundApi) {
    if (!followup) {
      return
    }
    for (const line of followup
      .split("\n")
      .map(l => l.trim())
      .filter(l => l.length > 0)) {
      let text = line.trim().replace(/^[\s-]+/, "")
      if (text.length > 0) {
        this.lastFollowup.push(text)
      }
    }
    if (this.parentAgent) {
      this.parentAgent.trackFollowup(followup, api)
    }
  }

  buildConverseInput(
    modelGradeOverride?: ModelProfileGrade
  ): ConverseCommandInput {
    let systemPrompt = this.systemPrompt
    const toolsPrompt: string[] = []
    if (this.tools.length > 0) {
      toolsPrompt.push("## TOOL USAGE")
      for (const tool of this.tools) {
        toolsPrompt.push(`### ${tool.spec?.toolSpec?.name}`)
        toolsPrompt.push(tool.guidance)
      }
    }

    if (toolsPrompt.length > 0) {
      systemPrompt += "\n\n" + toolsPrompt.join("\n\n")
    }

    const input: ConverseCommandInput = {
      modelId: getModelForGrade(modelGradeOverride ?? this.config.modelGrade),
      system: [{ text: systemPrompt }],
      inferenceConfig: {
        temperature: 0.4,
        maxTokens: 1024
      },
      messages: this.history,
      toolConfig:
        this.tools.length > 0
          ? ({
              ToolChoice: { auto: {} },
              tools: this.tools.map(tool => tool.spec)
            } as ToolConfiguration)
          : undefined
    }

    console.log(`input`, input)
    return input
  }

  clear() {
    this.history = []
  }

  async converse(query: any, api: InboundApi) {
    this.lastFollowup = []
    if (!this.keepsHistory) {
      this.history = []
    }

    console.log(
      `${this.constructor.name}::converse::history(${this.history.length})`
    )

    if (query.message) {
      this.history.push(query.message)
    } else {
      const promptText = (await api.resolveVariables(query)) ?? query.prompt
      this.history.push({
        role: "user",
        content: [{ text: promptText }]
      })
    }

    let continueConversation = true
    while (continueConversation) {
      const input = this.buildConverseInput(api.modelGradeOverride)
      const command = new ConverseCommand(input)

      try {
        const response = await this.getClient(api.modelGradeOverride).send(
          command
        )

        if (response.output?.message) {
          this.history.push(response.output.message)

          let usedTool = false
          if (response.output.message.content) {
            for (const content of response.output.message.content) {
              if ("toolUse" in content) {
                usedTool = true
                await this.handleToolUse(content.toolUse, api)
              } else if ("text" in content) {
                this.extractFollowUpQuestions(content.text ?? "", api)
                api.response.markdown(content.text ?? "")
              }
            }
          }

          if (!usedTool) {
            continueConversation = false
          } else {
            api.response.progress(
              "Continuing conversation based on tool results..."
            )
          }
        } else {
          continueConversation = false
        }
      } catch (err) {
        console.error("Converse error:", err)
        throw err
      }
    }

    return this.history[this.history.length - 1]
  }

  private async handleToolUse(toolUse: any, api: InboundApi) {
    const toolItem = this.tools.find(
      tool => tool.spec?.toolSpec?.name === toolUse.name
    )
    if (!toolItem) {
      api.response.markdown(`\n\nTool not found: ${toolUse.name}\n`)
      return
    }

    api.response.progress(`Calling ${toolUse.name} tool`)
    const result = await toolItem.func(toolUse.input, toolUse, api)
    if (!result) {
      api.response.markdown(
        `\n\nTool did not return a result: ${toolUse.name}\n`
      )
      return
    }

    this.history.push({
      role: "user",
      content: [
        {
          toolResult: {
            toolUseId: toolUse.toolUseId,
            content: result.content
          }
        }
      ]
    })

    api.response.progress(
      `Tool ${toolUse.name} executed. Reasoning on results...`
    )
  }

  private extractFollowUpQuestions(content: string, api: InboundApi) {
    const followUpRegex = /<follow_up_question>(.*?)<\/follow_up_question>/g
    let match
    while ((match = followUpRegex.exec(content)) !== null) {
      this.lastFollowup.push(match[1].trim())
    }
    this.trackFollowup(content, api)
  }

  asTool(): ToolItem {
    throw new Error(`not implemented`)
  }
}
