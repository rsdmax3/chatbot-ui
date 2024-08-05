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
