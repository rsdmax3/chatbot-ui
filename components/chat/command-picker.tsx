import { ChatbotUIContext } from "@/context/context"
import { FC, useContext, useEffect, useRef } from "react"
import { buildPatientStore } from "@/lib/agents/patientData"
import { createTempMessages } from "../chat/chat-helpers"

interface CommandPickerProps {}

export const CommandPicker: FC<CommandPickerProps> = ({}) => {
  const {
    isCommandPickerOpen,
    setIsCommandPickerOpen,
    focusCommand,
    slashCommand,
    setChatMessages,
    chatMessages,
    chatSettings,
    selectedAssistant
  } = useContext(ChatbotUIContext)

  const itemsRef = useRef<(HTMLDivElement | null)[]>([])

  useEffect(() => {
    if (focusCommand && itemsRef.current[0]) {
      itemsRef.current[0].focus()
    }
  }, [focusCommand])

  const handleOpenChange = (isOpen: boolean) => {
    setIsCommandPickerOpen(isOpen)
  }

  const handleSelectCommand = async (command: string) => {
    if (command === "/patients") {
      const patientStore = await buildPatientStore()
      const patientList = patientStore.getPatients()

      const patientTable = `
| ID | First Name | Last Name |
|----|------------|-----------|
${patientList.map(p => `| ${p.patientID || "N/A"} | ${p.firstName} | ${p.lastName} |`).join("\n")}
`
      const content = `Available patients:\n${patientTable}`

      const { tempAssistantChatMessage } = createTempMessages(
        content,
        chatMessages,
        chatSettings!,
        [],
        false,
        setChatMessages,
        selectedAssistant
      )

      setChatMessages(prev => [...prev, tempAssistantChatMessage])
    }
    handleOpenChange(false)
  }

  return (
    <>
      {isCommandPickerOpen && (
        <div className="bg-background flex flex-col space-y-1 rounded-xl border-2 p-2 text-sm">
          <div
            ref={ref => {
              itemsRef.current[0] = ref
            }}
            tabIndex={0}
            className="hover:bg-accent focus:bg-accent flex cursor-pointer flex-col rounded p-2 focus:outline-none"
            onClick={() => handleSelectCommand("/patients")}
          >
            <div className="font-bold">/patients</div>
            <div className="truncate text-sm opacity-80">
              View patient information
            </div>
          </div>
        </div>
      )}
    </>
  )
}
