import { getServerProfile } from "@/lib/server/server-chat-helpers"
import { ChatSettings } from "@/types"
import { RootAgent } from "@/lib/agents/root-agent"
import { WebCrawlerToolItem } from "@/lib/agents/WebCralwer"
import { NextRequest, NextResponse } from "next/server"
import { AgentConfig } from "@/lib/agents/agent-api"
import { parseResponse } from "@/lib/agents/parser"
import {
  PatientDataToolItem,
  PatientDynamicEvaluationToolItem,
  PatientResourceTypesToolItem
} from "@/lib/agents/patientData"

export const runtime = "edge"

const agentConfig: AgentConfig = {
  modelGrade: "medium-v2",
  profile: "default"
}

export async function POST(request: NextRequest) {
  console.log("Received POST request")
  const json = await request.json()
  console.log("Request JSON parsed:", json)
  const { chatSettings, messages } = json as {
    chatSettings: ChatSettings
    messages: any[]
  }

  try {
    const profile = await getServerProfile()

    // Set AWS credentials in the environment
    process.env.AWS_ACCESS_KEY_ID = profile.aws_access_key_id || ""
    process.env.AWS_SECRET_ACCESS_KEY = profile.aws_secret_access_key || ""
    process.env.AWS_SESSION_TOKEN = profile.aws_session_token || ""

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
      PatientResourceTypesToolItem
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
