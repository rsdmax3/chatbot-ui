import { NextResponse } from "next/server"
import fs from "fs"
import path from "path"

const dataDir = path.join(process.cwd(), "data")

export async function GET(
  request: Request,
  { params }: { params: { patientId: string } }
) {
  console.log(`Received GET request for patient ID: ${params.patientId}`)
  const id = params.patientId

  try {
    console.log(`Attempting to read files from ${dataDir}`)
    const files = fs.readdirSync(dataDir).filter(file => file.endsWith(".json"))
    console.log(
      `Filtered files for JSON extension: ${files.length} files found.`
    )
    const patientFile = files.find(file => file.includes(id))

    if (patientFile) {
      console.log(`Patient file found: ${patientFile}`)
      const filePath = path.join(dataDir, patientFile)
      const file = fs.readFileSync(filePath, "utf8")
      console.log(`File read successfully: ${filePath}`)
      const content = JSON.parse(file)
      const patientEntry = content.entry?.find(
        (entry: any) => entry.resource.resourceType === "Patient"
      )

      if (patientEntry) {
        console.log(`Patient entry found in file.`)
        return NextResponse.json(content)
      } else {
        console.error(`Patient data not found in file.`)
        return NextResponse.json(
          { error: "Patient data not found in file" },
          { status: 404 }
        )
      }
    } else {
      console.error(`Patient file not found.`)
      return NextResponse.json({ error: "Patient not found" }, { status: 404 })
    }
  } catch (error) {
    console.error("Error fetching patient data:", error)
    return NextResponse.json(
      { error: "Error fetching patient data" },
      { status: 500 }
    )
  }
}
