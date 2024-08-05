import { InboundApi, ToolItem } from "./agent-api"

async function webCrawler(
  input: Record<string, any>,
  toolData: Record<string, any>,
  api: InboundApi
) {
  const ALLOWED_DOMAINS: string[] = [
    // from https://github.com/abachaa/LiveQA_MedicalTask_TREC2017/blob/master/TestDataset/TREC-2017-LiveQA-Medical-Test-Questions-w-summaries.xml
    //
    "gov",
    "thelancet.com",
    "cvs.com",
    "novo-pi.com",
    "rarediseases.org",
    "aao.org",
    "loinc.org",
    "mdpi.com",
    "en.wikipedia.org",
    "maximus.com",
    "maximus.com/leadership",
    "wikipedia.org",
    "google.com"
  ]

  console.log(`modelGradeOverride: ${api.modelGradeOverride}`)

  const FULL_SET = [...ALLOWED_DOMAINS]

  if (!input.url) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: url is required"
        }
      ]
    }
  }

  if (typeof input.url !== "string") {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: url must be a string"
        }
      ]
    }
  }

  let url: URL
  try {
    url = new URL(input.url)
  } catch (err: any) {
    return {
      role: "user",
      content: [
        {
          text: `ERROR: Invalid URL format.`
        }
      ]
    }
  }

  console.log(`url: ${url}`)

  if (!FULL_SET.some(domain => url.hostname.endsWith(domain))) {
    return {
      role: "user",
      content: [
        {
          text: `ERROR: Domain is not on the allowed list for this API.`
        }
      ]
    }
  }

  try {
    const webResponse = await fetch(url)

    // we now want the content type so we can differentiate between the various formats
    // we have special support for per https://docs.aws.amazon.com/bedrock/latest/APIReference/API_runtime_DocumentBlock.html
    // extensions: pdf | csv | doc | docx | xls | xlsx | html | txt | md
    //
    const contentType = webResponse.headers.get("content-type")
    const content: Uint8Array = new Uint8Array(await webResponse.arrayBuffer())
    const documentName = new Date()
      .toISOString()
      .replace(/:/g, "-")
      .replace(/\./g, "-")

    let result = {
      role: "user",
      content: [
        {
          document: {
            format: "html",
            name: documentName,
            source: {
              bytes: content
            }
          }
        }
      ]
    }

    if (contentType?.includes("text/html")) {
      result.content[0].document.format = "html"
    } else if (contentType?.includes("application/pdf")) {
      result.content[0].document.format = "pdf"
    } else if (contentType?.includes("text/plain")) {
      result.content[0].document.format = "txt"
    } else if (contentType?.includes("text/markdown")) {
      result.content[0].document.format = "md"
    } else if (
      contentType?.includes(
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      )
    ) {
      result.content[0].document.format = "docx"
    } else if (contentType?.includes("application/msword")) {
      result.content[0].document.format = "doc"
    } else if (contentType?.includes("application/vnd.ms-excel")) {
      result.content[0].document.format = "xls"
    } else if (
      contentType?.includes(
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      )
    ) {
      result.content[0].document.format = "xlsx"
    } else if (contentType?.includes("text/csv")) {
      result.content[0].document.format = "csv"
    } else if (contentType?.includes("application/json")) {
      result.content[0].document.format = "json"
    } else {
      // no special handling, assume original value of html
      //
    }

    console.log(
      `webCrawler(${input.url}) => ${result.content[0].document.format} (${content.length} bytes)`
    )

    // morph the result into something more model friendly (text or json)
    //
    if (result.content[0].document.format === "html") {
      const text = new TextDecoder().decode(content)
      // @ts-expect-error
      result.content = [{ text }]
    } else if (result.content[0].document.format === "json") {
      const text = new TextDecoder().decode(content)
      // @ts-expect-error
      result.content = [{ json: JSON.parse(text) }]
    } else {
      // try to make text
      //
      const text = new TextDecoder().decode(content)
      // @ts-expect-error
      result.content = [{ text }]
    }

    return result
  } catch (err: any) {
    console.error(url)
    console.error(err)
    return {
      role: "user",
      content: [
        {
          text: `ERROR: Unable to retrieve web page.`
        }
      ]
    }
  }
}

export const WebCrawlerToolItem: ToolItem = {
  func: webCrawler,
  guidance: `Retrieves content from a web page based on a URL.`,
  spec: {
    toolSpec: {
      name: "WebCrawler",
      description: `Retrieves web page content.`,
      inputSchema: {
        json: {
          type: "object",
          properties: {
            url: {
              type: "string",
              description: "The URL to retrieve."
            }
          },
          required: ["url"]
        }
      }
    }
  }
}
