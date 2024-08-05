import { NextResponse } from "next/server"
import fs from "fs"
import path from "path"

console.log("Loading patient list...")
export async function GET() {
  console.log("GET /api/patients - Fetching patient list")
  try {
    const dataDir = path.join(process.cwd(), "data")
    console.log(`Data directory: ${dataDir}`)

    const files = fs.readdirSync(dataDir).filter(file => file.endsWith(".json"))
    console.log(`Found ${files.length} patient files`)

    const patientList = files.reduce<
      Array<{ id: string; firstName: string; lastName: string }>
    >((acc, file) => {
      try {
        const content = JSON.parse(
          fs.readFileSync(path.join(dataDir, file), "utf8")
        )
        const patientEntry = content.entry?.find(
          (entry: any) => entry.resource.resourceType === "Patient"
        )

        if (patientEntry) {
          const patient = patientEntry.resource
          acc.push({
            id: patient.id,
            firstName: patient.name[0].given[0],
            lastName: patient.name[0].family
          })
        } else {
          console.log(`Skipping file ${file}: No patient data found`)
        }
      } catch (error) {
        console.error(
          `Error processing file ${file}:`,
          error instanceof Error ? error.message : String(error)
        )
      }
      return acc
    }, [])

    console.log(`Returning ${patientList.length} patients`)
    return NextResponse.json(patientList)
  } catch (error) {
    console.error("Error fetching patient list:", error)
    return NextResponse.json(
      { error: "Error fetching patient list" },
      { status: 500 }
    )
  }
}
