import React from "react"

type ParsedContent = {
  type: "thinking" | "result" | "text" | "follow_up_questions"
  content: string | string[]
}

export function parseResponse(text: string): ParsedContent[] {
  const regex =
    /<(thinking|result|follow_up_questions)>([\s\S]*?)<\/\1>|([^<]+)/g
  let parsedContent: ParsedContent[] = []
  let match

  while ((match = regex.exec(text)) !== null) {
    if (match[1] === "thinking") {
      parsedContent.push({ type: "thinking", content: match[2].trim() })
    } else if (match[1] === "result") {
      parsedContent.push({ type: "result", content: match[2].trim() })
    } else if (match[1] === "follow_up_questions") {
      const questions = match[2]
        .trim()
        .split("\n")
        .filter(q => q.trim() !== "")
      parsedContent.push({ type: "follow_up_questions", content: questions })
    } else if (match[3]) {
      // Handle markdown content
      parsedContent.push({ type: "text", content: match[3].trim() })
    }
  }

  return parsedContent
}

export function renderParsedContent(
  parsedContent: ParsedContent[]
): React.ReactNode {
  return parsedContent.map((item, index) => {
    switch (item.type) {
      case "thinking":
        return (
          <React.Fragment key={index}>
            <span className="text-gray-400">{item.content}</span>
            {index < parsedContent.length - 1 &&
              parsedContent[index + 1].type === "result" && <br />}
          </React.Fragment>
        )
      case "result":
        return <span key={index}>{item.content}</span>
      case "text":
        return <span key={index}>{item.content}</span>
      case "follow_up_questions":
        // We'll handle rendering of follow-up questions separately
        return null
    }
  })
}
