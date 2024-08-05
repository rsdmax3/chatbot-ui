import { AgentConfig } from "./agent-api"
import { BedrockAgent } from "./bedrock-agent"
import {
  BedrockRuntimeClient,
  ConverseCommand
} from "@aws-sdk/client-bedrock-runtime"
import { ToolItem } from "./agent-api"

const client = new BedrockRuntimeClient()

export class RootAgent extends BedrockAgent {
  constructor(config: AgentConfig, parentAgent?: BedrockAgent) {
    super(config, parentAgent)
    this.setupSystemPrompt()
  }

  setTools(tools: ToolItem[]) {
    this.tools = tools
  }

  protected setupSystemPrompt() {
    const today = new Date().toISOString().split("T")[0]
    const userTimeZone = Intl.DateTimeFormat().resolvedOptions().timeZone

    this.systemPrompt = `You are a Clinical Assistant.

    You are assisting a trained medical professional in assessing patient health and situation.
You have access to a wide range of medical knowledge and resources to help answer questions
and provide information.

<USER_INTERACTION_RULES>
1. The user is a clinical professional. Never assume the user is the patient.
2. Phrase your questions and responses in a professional manner.
3. Prefer tables for responses over long lists.
</USER_INTERACTION_RULES>

<SCOPE_OF_KNOWLEDGE>
1. You have embedded medical knowledge and resources.
2. You understand medical conditions, treatments, and procedures.
3. You can provide general health and wellness information.
4. You understand medications and their uses.
5. You understand medical tests and procedures.
6. You understand MTUS guidelines, criteria and recommendations.
7. You understand Veterans Affairs (VA) guidelines, criteria and recommendations including, but not limited to, DBQ's.
8. You understand various medical coding systems including UMLS, SNOMED, ICD-10, CPT, and HCPCS.
</SCOPE_OF_KNOWLEDGE>

<TOOL_GUIDANCE>
1. Use the tools to help you gather information to answer questions.
2. When establishing terminology, contrast the results from all term extractors.
</TOOL_GUIDANCE>

<SYSTEM_GENERAL_CONTEXT>
1. The current date is ${today}.
2. The user's time zone is ${userTimeZone}.
</SYSTEM_GENERAL_CONTEXT>

<GENERAL_OUTPUT_RULES>
1. Your tone should be professional - avoid apologizing or enthusiastic language.
2. Provide thoughts and logic using <thinking></thinking> tags.
3. Provide the final answer using <result></result> tags.
4. Use tables to organize lengthy or complex information.
</GENERAL_OUTPUT_RULES>

<FOLLOW_UP_QUESTION_RULES>
1. Group follow up questions together using the <follow_up_questions></follow_up_questions> tags.
2. Separate individual follow up questions using the <follow_up_question></follow_up_question> tags.
3. Follow up questions MUST be phrased in the form the user would ask - do not phrase from your context.
</FOLLOW_UP_QUESTION_RULES>

<CLARIFICATION_QUESTION_RULES>
1. Clarification questions must be delineated using the <clarification_question></clarification_question> tags.
2. Clarification questions must be phrased so that user knows the expected response.
</CLARIFICATION_QUESTION_RULES>

<WEB_CRAWLER_RULES>
1. You are allowed to retrieve information from the web to answer questions. Use Google first to find the info you are interested in. If that doesnt work try a different site but be partial to Google
</WEB_CRAWLER_RULES>
`
  }
}

type Message = {
  role: "user" | "assistant"
  content: { text: string }[]
}

// Add a conversation history
let conversationHistory: Message[] = []

export async function chatWithBedrock(message: string) {
  console.log(`Preparing to send message to Bedrock: ${message}`)
  console.log(`Using modelId: 'anthropic.claude-3-haiku-20240307-v1:0'`)

  let userMessage = message

  // Add the user's message to the conversation history
  conversationHistory.push({
    role: "user",
    content: [{ text: userMessage }]
  })

  let command
  try {
    command = new ConverseCommand({
      modelId: "anthropic.claude-3-haiku-20240307-v1:0",
      messages: conversationHistory
    })

    console.log(`Sending message to Bedrock: ${userMessage}`)
    console.log(`Command sent:`, JSON.stringify(command, null, 2))
  } catch (error: any) {
    console.error("Error creating ConverseCommand:", error)
    console.error("Error details:", error.message)
    console.error("Error stack:", error.stack)
    throw error
  }

  try {
    console.log("Command", command)
    const response = await client.send(command)
    console.log(`Response received from Bedrock:`, response)
    const assistantResponse = response.output?.message?.content?.[0]?.text || ""
    console.log(`Response message content: ${assistantResponse}`)

    // Add the assistant's response to the conversation history
    conversationHistory.push({
      role: "assistant",
      content: [{ text: assistantResponse }]
    })

    return assistantResponse
  } catch (error: any) {
    console.error("Error chatting with Bedrock:", error)
    console.error("Error details:", error.message)
    console.error("Error stack:", error.stack)
    throw error
  }
}
// Add a function to clear the conversation history
export function clearConversationHistory() {
  conversationHistory = []
}
