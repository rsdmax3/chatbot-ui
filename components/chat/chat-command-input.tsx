import { FC } from "react"
import { CommandPicker } from "./command-picker"
import { ToolPicker } from "./tool-picker"

interface ChatCommandInputProps {}

export const ChatCommandInput: FC<ChatCommandInputProps> = ({}) => {
  return (
    <>
      <CommandPicker />
      <ToolPicker />
    </>
  )
}
