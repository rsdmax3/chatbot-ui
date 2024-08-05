import { LLM } from "@/types"
import { AWS_LLM_LIST } from "./aws-llm-list"

export const LLM_LIST: LLM[] = [...AWS_LLM_LIST]

export const LLM_LIST_MAP: Record<string, LLM[]> = {
  aws: AWS_LLM_LIST
}
