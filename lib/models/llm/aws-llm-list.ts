import { LLM } from "@/types/llms"

const CLAUDE_3_5_SONNET_AWS: LLM = {
  modelId: "anthropic.claude-3-5-sonnet-20240620-v1:0",
  modelName: "Claude 3.5 Sonnet AWS",
  provider: "aws",
  hostedId: "anthropic.claude-3-5-sonnet-20240620-v1:0",
  platformLink:
    "https://aws.amazon.com/blogs/machine-learning/claude-3-5-sonnet-now-available/",
  imageInput: true,
  pricing: {
    currency: "USD",
    unit: "1M tokens",
    inputCost: 3,
    outputCost: 15
  }
}

export const AWS_LLM_LIST: LLM[] = [CLAUDE_3_5_SONNET_AWS]
