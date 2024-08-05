import { InboundApi, ToolItem } from "./agent-api"

let PATIENT_FILES_LOADED = false
const PATIENT_FILES: Record<string, Record<string, any>> = {}

export async function buildPatientStore() {
  if (!PATIENT_FILES_LOADED) {
    try {
      console.log("Fetching patient data...")
      const url = `${process.env.NEXT_PUBLIC_API_URL || ""}/api/patients`
      console.log(`Attempting to fetch from: ${url}`)
      const response = await fetch(url)
      console.log(`Fetch response status: ${response.status}`)
      const patientList = await response.json()
      console.log(`Fetched ${patientList.length} patient records`)

      for (const patient of patientList) {
        const sanitizedFirstName = patient.firstName.replace(/\d/g, "")
        const sanitizedLastName = patient.lastName.replace(/\d/g, "")
        PATIENT_FILES[patient.id] = {
          patientID: patient.id,
          firstName: sanitizedFirstName,
          lastName: sanitizedLastName,
          fullName: `${sanitizedFirstName} ${sanitizedLastName}`,
          searchText:
            `${sanitizedFirstName} ${sanitizedLastName} ${patient.id}`.toLowerCase()
        }
      }

      PATIENT_FILES_LOADED = true
      console.log(`Loaded ${Object.keys(PATIENT_FILES).length} patient files`)
    } catch (error) {
      console.error("Error loading patient data:", error)
    }
  }

  return {
    getPatients: () => Object.values(PATIENT_FILES),
    getPatientById: (id: string) => PATIENT_FILES[id] || null
  }
}

async function getPatientData(patientId: string) {
  console.log(`Attempting to fetch patient data for ID: ${patientId}`)
  await buildPatientStore()

  patientId = patientId.toLowerCase()
  let record = PATIENT_FILES[patientId]

  if (record) {
    try {
      console.log(`Fetching patient data for ID: ${patientId}`)
      const url = `${process.env.NEXT_PUBLIC_API_URL || ""}/api/patients/${patientId}`
      console.log(`Attempting to fetch from: ${url}`)
      const response = await fetch(url)
      if (!response.ok) {
        throw new Error("Patient data not found")
      }
      console.log(`Patient data fetched successfully for ID: ${patientId}`)
      return await response.json()
    } catch (error) {
      console.error(`Error fetching patient data for ID: ${patientId}:`, error)
      return null
    }
  }

  // see if we can find a partial match
  //
  const matches = []
  for (const [pid, record] of Object.entries(PATIENT_FILES)) {
    if (pid.includes(patientId)) {
      matches.push(record)
      continue
    }

    if (record.searchText.includes(patientId)) {
      matches.push(record)
    }
  }

  if (matches.length === 0) {
    return null
  }

  //   if (matches.length > 1) {
  //     // make one more pass and see if we can use startsWith
  //     // to find a unique match
  //     //
  //     const startsWith = []
  //     for (const match of matches) {
  //       if (match.searchText.startsWith(patientId)) {
  //         startsWith.push(match)
  //       }
  //     }

  //     if (startsWith.length === 1) {
  //       return JSON.parse(fs.readFileSync(startsWith[0].filename, 'utf8'))
  //     }

  //     console.error(`Ambiguous patient ID: ${patientId}`)
  //     for (const match of matches) {
  //       console.error(`  ${match.patientID} ${match.fullName}`)
  //     }

  //     return null
  //   }

  //   return JSON.parse(fs.readFileSync(matches[0].filename, 'utf8'))
}

function mutateResourceEntry(entry: Record<string, any>) {
  const result = { fullUrl: entry.fullUrl, ...entry.resource }
  return result
}

async function patientResourceTypes(
  input: Record<string, any>,
  toolData: Record<string, any>,
  api: InboundApi
) {
  if (!input.patientId) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: patientId is required"
        }
      ]
    }
  }

  const data = await getPatientData(input.patientId)
  if (!data) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: patientId not found"
        }
      ]
    }
  }

  const resourceTypes: Record<string, number> = {}

  let patientRecord: Record<string, any> | null = null

  for (const entry of data.entry) {
    if (!resourceTypes[entry.resource.resourceType]) {
      resourceTypes[entry.resource.resourceType] = 1
    } else {
      resourceTypes[entry.resource.resourceType]++
    }

    if (entry.resource.resourceType === "Patient") {
      patientRecord = mutateResourceEntry(entry)
    }
  }

  console.log(
    `patientResourceTypes(${input.patientId}) => ${Object.keys(resourceTypes).length} types`
  )

  return {
    role: "agent",
    content: [
      {
        json: {
          patientId: input.patientId,
          resourceTypes: resourceTypes,
          entry: [patientRecord]
        }
      }
    ]
  }
}

export const PatientResourceTypesToolItem: ToolItem = {
  func: patientResourceTypes,
  guidance: `Retrieves patient resource types along with record counts.`,
  spec: {
    toolSpec: {
      name: "PatientResourceTypes",
      description: `Retrieves patient resource types.`,
      inputSchema: {
        json: {
          type: "object",
          properties: {
            patientId: {
              type: "string",
              description: "The patient identifier."
            }
          },
          required: ["patientId"]
        }
      }
    }
  }
}

type DateFilter = {
  prefix: "eq" | "ne" | "gt" | "lt" | "ge" | "le" | "sa" | "eb" | "ap"
  date: string
}

function dateFilter(date: string): DateFilter | null {
  if (date.length < 12) {
    date = "eq" + date
  }
  let prefix = date.slice(0, 2) as DateFilter["prefix"]
  let result = { prefix, date: date.slice(2) }
  return result
}

function dateMatches(date: string, filter: DateFilter) {
  let dateValue = new Date(date)
  let filterValue = new Date(filter.date)
  switch (filter.prefix) {
    case "eq":
      return dateValue.getTime() === filterValue.getTime()
    case "ne":
      return dateValue.getTime() !== filterValue.getTime()
    case "gt":
      return dateValue.getTime() > filterValue.getTime()
    case "lt":
      return dateValue.getTime() < filterValue.getTime()
    case "ge":
      return dateValue.getTime() >= filterValue.getTime()
    case "le":
      return dateValue.getTime() <= filterValue.getTime()
    case "sa":
      return dateValue.getTime() >= filterValue.getTime()
    case "eb":
      return dateValue.getTime() <= filterValue.getTime()
    case "ap":
      return dateValue.getTime() >= filterValue.getTime()
  }

  return false
}

function recordMatches(
  resource: Record<string, any>,
  input: Record<string, any>
) {
  // filter on id
  //
  if (input.id && resource.id !== input.id) {
    return false
  }

  // filter on status
  //
  if (resource.status && input.status && resource.status !== input.status) {
    return false
  }

  // dates can be come in the form of:
  // - resource.onsetDateTime
  // - resource.period.start, resource.period.end
  // - resource.effectiveDateTime
  // - resource.date
  // - resource.billablePeriod.start, resource.billablePeriod.end
  // - resource.authoredOn (MedicationRequest)
  // - resource.performedPeriod.start, resource.performedPeriod.end (Procedure)
  //
  if (input.lowDate) {
    let date =
      resource.onsetDateTime ||
      resource.effectiveDateTime ||
      resource.date ||
      resource.period?.start ||
      resource.billablePeriod?.start ||
      resource.authoredOn ||
      resource.performedPeriod?.start
    if (date && !dateMatches(date, input.lowDate)) {
      return false
    }
  }

  if (input.highDate) {
    let date =
      resource.onsetDateTime ||
      resource.effectiveDateTime ||
      resource.date ||
      resource.period?.end ||
      resource.billablePeriod?.end ||
      resource.authoredOn ||
      resource.performedPeriod?.end
    if (date && !dateMatches(date, input.highDate)) {
      return false
    }
  }

  return true
}

async function patientDynamicEvaluation(
  input: Record<string, any>,
  toolData: Record<string, any>,
  api: InboundApi
) {
  if (!input.patientId) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: patientId is required"
        }
      ]
    }
  }

  if (!input.evaluation) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: evaluation is required"
        }
      ]
    }
  }

  const data = await getPatientData(input.patientId)

  if (!data) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: patientId not found"
        }
      ]
    }
  }

  let result = null
  try {
    // input.evaluation has a function 'function evaluate(data) { ... }'
    // we need to wrap this in a function so we can call it but we have
    // to deal with the function inside a string
    //
    const func = new Function(`return ${input.evaluation}`)()
    if (typeof func !== "function") {
      return {
        role: "user",
        content: [
          {
            text: "ERROR: evaluation is not a function"
          }
        ]
      }
    }

    result = await func(data)

    if (!result) {
      return {
        role: "user",
        content: [
          {
            text: "ERROR: evaluation returned null"
          }
        ]
      }
    }

    if (typeof result !== "object") {
      return {
        role: "user",
        content: [
          {
            text: "ERROR: evaluation did not return an object"
          }
        ]
      }
    }

    console.log(`patientDynamicEvaluation(${input.patientId}) =>`, result)

    // perform a serialization check
    //
    try {
      const serialized = JSON.stringify(result, null, 2)
      console.log(serialized)
    } catch (err: any) {
      return {
        role: "user",
        content: [
          {
            text: "ERROR: evaluation result could not be serialized as JSON"
          },
          {
            json: {
              error: err.message,
              stack: err.stack
            }
          }
        ]
      }
    }

    return {
      role: "user",
      //TODO: bedrock is having trouble serializing the content - we are able to serialize but
      //      it get's itself upset - started 2024-07-19, guessing some underlying change
      //
      // content: [{
      //   json: result,
      // }],
      content: [
        {
          text: JSON.stringify(result, null, 2)
        }
      ]
    }
  } catch (error: any) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: evaluation failed"
        },
        {
          json: {
            error: error.message,
            stack: error.stack
          }
        }
      ]
    }
  }
}

export const PatientDynamicEvaluationToolItem: ToolItem = {
  func: patientDynamicEvaluation,
  guidance: `Evaluates patient records using a supplied JavaScript function.

Use this tool when you require sophisticated data extraction or summarization that is not easily achieved with the PatientData tool.

Use the UmlsSearch tool to find relevant codes for use in the evaluation function if beneficial.

<PATIENT_DYNAMIC_EVALUATION_FACTS>
1. The patient data is supplied as a JSON structure with FHIR resource records.
2. The 'bundle' parameter is the patient data as a FHIR 'Bundle'.
3. Enumerate the 'entry' array to access the patient records.
</PATIENT_DYNAMIC_EVALUATION_FACTS>

<PATIENT_DYNAMIC_EVALUATION_RULES>
1. The function must be a valid JavaScript function.
2. The function must return a validate JSON structure that is easily parsed and understood.
3. The function signature must be 'function evaluate(bundle: any): any'.
</PATIENT_DYNAMIC_EVALUATION_RULES>

`,
  spec: {
    toolSpec: {
      name: "PatientDynamicEvaluation",
      description: `Executes a JavaScript function against a single patient FHIR bundle.`,
      inputSchema: {
        json: {
          type: "object",
          properties: {
            patientId: {
              type: "string",
              description: "The patient identifier."
            },
            evaluation: {
              type: "string",
              description: "The function to execute."
            }
          },
          required: ["patientId", "evaluation"]
        }
      }
    }
  }
}

async function patientData(
  input: Record<string, any>,
  toolData: Record<string, any>,
  api: InboundApi
) {
  if (!input.resourceType) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: resourceType is required"
        }
      ]
    }
  }

  if (!input.patientId) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: patientId is required"
        }
      ]
    }
  }

  if (input.pageNumber && typeof input.pageNumber !== "number") {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: pageNumber must be a number"
        }
      ]
    }
  }

  if (!input.pageNumber || (input.pageNumber && input.pageNumber < 1)) {
    input.pageNumber = 1
  }

  if (input.pageSize && typeof input.pageSize !== "number") {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: pageSize must be a number"
        }
      ]
    }
  }

  if (!input.pageSize || (input.pageSize && input.pageSize < 25)) {
    input.pageSize = 25
  }

  if (input.pageSize > 50) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: pageSize must be 50 or less"
        }
      ]
    }
  }

  if (input.status && typeof input.status !== "string") {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: status must be a string"
        }
      ]
    }
  }

  if (input.lowDateValue) {
    if (!input.lowDateOperator) {
      input.lowDateOperator = "eq"
    }
    input.lowDate = dateFilter(input.lowDateOperator + input.lowDateValue)
  }

  if (input.highDateValue) {
    if (!input.highDateOperator) {
      input.highDateOperator = "eq"
    }
    input.highDate = dateFilter(input.highDateOperator + input.highDateValue)
  }

  const data = await getPatientData(input.patientId)
  if (!data) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: patientId not found"
        }
      ]
    }
  }

  const result = {
    resourceType: "Bundle",
    pageNumber: input.pageNumber,
    pageSize: input.pageSize,
    pageCount: 0,
    totalRecords: 0,
    matchingRecords: 0,
    returnedRecords: 0,
    entry: [] as any[]
  }

  let totalRecords = 0
  for (const entry of data.entry) {
    if (entry.resource.resourceType === input.resourceType) {
      totalRecords++
      if (!recordMatches(entry.resource, input)) {
        continue
      }
      result.entry.push(mutateResourceEntry(entry))
    }
  }

  result.totalRecords = totalRecords
  result.matchingRecords = result.entry.length
  console.log(
    `patientData(${input.patientId}, ${input.resourceType}) => (${result.pageNumber}, ${result.pageSize}) ${result.totalRecords} records`
  )

  // we have the full result set, now we need to paginate
  //
  const start = (input.pageNumber - 1) * input.pageSize
  const end = start + input.pageSize
  result.entry = result.entry.slice(start, end)
  result.returnedRecords = result.entry.length
  result.pageCount = Math.ceil(result.totalRecords / input.pageSize)

  return {
    role: "user",
    content: [
      {
        json: {
          patientId: input.patientId,
          ...result
        }
      }
    ]
  }
}

export const PatientDataToolItem: ToolItem = {
  func: patientData,
  guidance: `Retrieves patient data.`,
  spec: {
    toolSpec: {
      name: "PatientData",
      description: `Retrieves patient data.

<PATIENT_DATA_FACTS>
1. The patient data is supplied as a JSON structure with FHIR resource records.
2. The 'totalRecords' field indicates the total number of records for the resource type.
3. The 'matchingRecords' field indicates the number of records that match the filter criteria.
4. The 'pageCount' field indicates the number of pages of records.
5. The 'pageNumber' field indicates the current page number.
6. The 'returnedRecords' field indicates the number of records returned in the response.
7. The records are chronologically ordered from NEWEST to OLDEST.
8. Date filters do not apply to all resource types - pay attention to the response data for secondary filtering.
9. The maximum value for 'pageSize' is 50.
</PATIENT_DATA_FACTS>

<PATIENT_DATA_RULES>
1. Plan your requests with the expectation that you are able to provide a wholistically complete view of the patient's health record.
2. Use pagination to manage large record sets to ensure you are evaluate ALL content.
3. Use parameters to filter the data to the most relevant records.
4. If the response data does not appear to have what you expect alter your filtering approach and retry.
5. If you receive an error regarding too many records you MUST alter your filtering approach until you have a manageable record count.
</PATIENT_DATA_RULES>

`,
      inputSchema: {
        json: {
          type: "object",
          properties: {
            patientId: {
              type: "string",
              description: "The patient identifier."
            },
            resourceType: {
              type: "string",
              description: "The type of resource to retrieve."
            },
            status: {
              type: "string",
              description: "The status code of the resource."
            },
            lowDateOperator: {
              type: "string",
              description: "Low date filter operator.",
              enum: ["eq", "ne", "gt", "lt", "ge", "le", "sa", "eb", "ap"],
              default: "eq"
            },
            lowDateValue: {
              type: "string",
              description: "Low date value."
            },
            highDateOperator: {
              type: "string",
              description: "High date filter operator.",
              enum: ["eq", "ne", "gt", "lt", "ge", "le", "sa", "eb", "ap"],
              default: "eq"
            },
            highDateValue: {
              type: "string",
              description: "High date value."
            },
            id: {
              type: "string",
              description: "The resource identifier."
            },
            pageNumber: {
              type: "integer",
              description: "The page number to retrieve.",
              default: 1
            },
            pageSize: {
              type: "integer",
              description: "The number of records in the page.",
              default: 25
            }
          },
          required: ["patientId", "resourceType"]
        }
      }
    }
  }
}
