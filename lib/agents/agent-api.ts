import { Tool } from "@aws-sdk/client-bedrock-runtime"
import { ModelProfileGrade } from "./bedrock-agent"
import { ContentBlock as AWSContentBlock } from "@aws-sdk/client-bedrock-runtime"

type FeatureCheck = {
  can(featureName: string): boolean
}

export type InboundApi = {
  resolveVariables: (request: any) => Promise<string>
  modelGradeOverride?: ModelProfileGrade
  request: any
  context: any
  response: any
  token: any
  features?: FeatureCheck
}

/**
 * ToolItem contains a function that accepts a set of parameters and returns a promise result
 * as well as a tool specification that describes the tool to the model.
 *
 * NOTE: the function specifies the minimum set of parameters that the function must accept but it
 *       will be called with these additions that are from CoPilot:
 *       - request: ChatRequest
 *       - context: ChatContext
 *       - response: ChatResponseStream
 *       - token: CancellationToken
 *
 */
export type ToolItem = {
  func: (
    input: Record<string, any>,
    toolData: Record<string, any>,
    api: InboundApi
  ) => Promise<any>
  guidance: string
  spec: Tool
}

export type AgentConfig = {
  modelGrade: ModelProfileGrade
  profile: string
}

export type ContentBlock = AWSContentBlock
