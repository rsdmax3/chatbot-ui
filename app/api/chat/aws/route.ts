import { ChatSettings } from "@/types"
import { RootAgent } from "@/lib/agents/root-agent"
import { WebCrawlerToolItem } from "@/lib/agents/WebCralwer"
import { NextRequest, NextResponse } from "next/server"
import { AgentConfig } from "@/lib/agents/agent-api"
import {
  PatientDataToolItem,
  PatientDynamicEvaluationToolItem,
  PatientResourceTypesToolItem
} from "@/lib/agents/patientData"
import { UmlsSearchToolItem } from "@/lib/agents/ULMS"

export const runtime = "edge"

export async function POST(request: NextRequest) {
  console.log("Received POST request")
  const json = await request.json()
  console.log("Request JSON parsed:", json)
  const { chatSettings, messages } = json as {
    chatSettings: ChatSettings
    messages: any[]
  }

  try {
    if (!process.env.AWS_ACCESS_KEY_ID)
      throw new Error("AWS Access Key ID not found")
    if (!process.env.AWS_SECRET_ACCESS_KEY)
      throw new Error("AWS Secret Access Key not found")
    if (!process.env.AWS_SESSION_TOKEN)
      throw new Error("AWS Session Token not found")

    const agentConfig: AgentConfig = {
      modelGrade: "medium-v2",
      profile: "default"
    }

    const rootAgent = new RootAgent(agentConfig)
    rootAgent.setTools([
      WebCrawlerToolItem,
      PatientDataToolItem,
      PatientDynamicEvaluationToolItem,
      PatientResourceTypesToolItem,
      UmlsSearchToolItem
    ])

    // Use the last message as the input for the chat
    const lastMessage = messages[messages.length - 1].content

    const response = await rootAgent.converse(
      { prompt: lastMessage },
      {
        resolveVariables: async () => lastMessage,
        request: {},
        context: {},
        response: {
          markdown: (text: string) => console.log("Markdown:", text),
          progress: (text: string) => console.log("Progress:", text)
        },
        token: {},
        modelGradeOverride: agentConfig.modelGrade,
        features: {
          can: (feature: string) => feature === "documents"
        }
      }
    )

    const markdownResponse = response.content
      ?.filter((item: any) => item.text)
      .map((item: any) => item.text)
      .join("\n\n")

    // Return the markdown response as plain text
    return new NextResponse(markdownResponse, {
      headers: { "Content-Type": "text/plain" }
    })
  } catch (error: any) {
    console.error("Error in AWS Claude chat route:", error)
    return new NextResponse(JSON.stringify({ message: error.message }), {
      status: 500
    })
  }
}
