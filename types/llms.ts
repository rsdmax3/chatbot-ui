import { ModelProvider } from "."

export type LLMID = AWSLLMID

export type AWSLLMID = "anthropic.claude-3-5-sonnet-20240620-v1:0" // Claude 3.5 Sonnet

export interface LLM {
  modelId: LLMID
  modelName: string
  provider: ModelProvider
  hostedId: string
  platformLink: string
  imageInput: boolean
  pricing?: {
    currency: string
    unit: string
    inputCost: number
    outputCost?: number
  }
}
export const defaultModel: LLM = {
  modelId: "anthropic.claude-3-5-sonnet-20240620-v1:0",
  modelName: "Claude 3.5 Sonnet",
  provider: "aws",
  hostedId: "anthropic.claude-3-5-sonnet-20240620-v1:0",
  platformLink: "https://www.anthropic.com",
  imageInput: true,
  pricing: {
    currency: "USD",
    unit: "1000 tokens",
    inputCost: 0.015,
    outputCost: 0.075
  }
}
