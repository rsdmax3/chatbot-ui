import { InboundApi, ToolItem } from "./agent-api"

/**
 * select DISTINCT m.RSAB, m.SSN from umls.MRSAB m where m.LAT = 'ENG' order by m.RSAB
 */
const UMLS_SAB_DEFINITIONS = `
"SAB","SSN"
AIR,AI/RHEUM
ALT,Alternative Billing Concepts
AOD,Alcohol and Other Drug Thesaurus
AOT,Authorized Osteopathic Thesaurus
ATC,Anatomical Therapeutic Chemical Classification System
BI,Beth Israel Problem List
CCC,Clinical Care Classification
CCPSS,Clinical Problem Statements
CCS,Clinical Classifications Software
CCSR_ICD10CM,Clinical Classifications Software Refined for ICD-10-CM
CCSR_ICD10PCS,Clinical Classifications Software Refined for ICD-10-PCS
CDCREC,Race & Ethnicity - CDC
CDT,CDT
CHV,Consumer Health Vocabulary
COSTAR,COSTAR
CPM,Medical Entities Dictionary
CPT,CPT - Current Procedural Terminology
CSP,CRISP Thesaurus
CST,COSTART
CVX,Vaccines Administered
DDB,Diseases Database
DRUGBANK,DrugBank
DSM-5,"Diagnostic and Statistical Manual of Mental Disorders, Fifth Edition"
DXP,DXplain
FMA,Foundational Model of Anatomy
GO,Gene Ontology
GS,Gold Standard Drug Database
HCDT,CDT in HCPCS
HCPCS,HCPCS - Healthcare Common Procedure Coding System
HCPT,CPT in HCPCS
HGNC,HUGO Gene Nomenclature Committee
HL7V2.5,HL7 Version 2.5
HL7V3.0,HL7 Version 3.0
HPO,Human Phenotype Ontology
ICD10,ICD-10
ICD10,"International Classification of Diseases and Related Health Problems, Tenth Revision"
ICD10AE,"ICD-10, American English Equivalents"
ICD10AM,"ICD-10, Australian Modification"
ICD10AMAE,"ICD-10, Australian Modification, Americanized English Equivalents"
ICD10CM,"International Classification of Diseases, Tenth Revision, Clinical Modification"
ICD10PCS,ICD-10 Procedure Coding System
ICD9CM,ICD-9-CM
ICD9CM,"International Classification of Diseases, Ninth Revision, Clinical Modification"
ICF,"International Classification of Functioning, Disability and Health"
ICF-CY,"International Classification of Functioning, Disability and Health for Children and Youth"
ICNP,International Classification for Nursing Practice
ICPC,International Classification of Primary Care
ICPC2EENG,"International Classification of Primary Care, 2nd Edition, Electronic"
ICPC2ICD10ENG,ICPC2-ICD10 Thesaurus
ICPC2P,ICPC-2 PLUS
JABL,Congenital Mental Retardation Syndromes
LCH,Library of Congress Subject Headings
LCH_NW,"Library of Congress Subject Headings, Northwestern University subset"
LNC,LOINC
MCM,Glossary of Clinical Epidemiologic Terms
MDR,MedDRA
MED-RT,Medication Reference Terminology
MEDCIN,MEDCIN
MEDLINEPLUS,MedlinePlus Health Topics
MMSL,Multum
MMX,Micromedex
MSH,MeSH
MTH,Metathesaurus Names
MTHCMSFRF,Metathesaurus CMS Formulary Reference File
MTHICD9,ICD-9-CM Entry Terms
MTHICPC2EAE,ICPC2E American English Equivalents
MTHICPC2ICD10AE,"ICPC2E-ICD10 Thesaurus, American English Equivalents"
MTHMST,Minimal Standard Terminology (UMLS)
MTHSPL,FDA Structured Product Labels
MVX,Manufacturers of Vaccines
NANDA-I,NANDA-I Taxonomy
NCBI,NCBI Taxonomy
NCI,NCI Thesaurus
NDDF,FDB MedKnowledge
NEU,Neuronames Brain Hierarchy
NIC,Nursing Interventions Classification
NOC,Nursing Outcomes Classification
NUCCHCPT,National Uniform Claim Committee - Health Care Provider Taxonomy
OMIM,Online Mendelian Inheritance in Man
OMS,Omaha System
ORPHANET,ORPHANET
PCDS,Patient Care Data Set
PDQ,Physician Data Query
PNDS,Perioperative Nursing Data Set
PPAC,Pharmacy Practice Activity Classification
PSY,Psychological Index Terms
QMR,Quick Medical Reference
RAM,Clinical Concepts by R A Miller
RCD,Read Codes
RCDAE,Read Codes Am Engl
RCDSA,Read Codes Am Synth
RCDSY,Read Codes Synth
RXNORM,RXNORM
SNM,SNOMED 1982
SNMI,SNOMED Intl 1998
SNOMEDCT_US,"SNOMED CT, US Edition"
SNOMEDCT_VET,"SNOMED CT, Veterinary Extension"
SOP,Source of Payment Typology
SPN,Standard Product Nomenclature
SRC,Source Terminology Names (UMLS)
ULT,UltraSTAR
UMD,UMDNS
USP,USP Compendial Nomenclature
USPMG,USP Model Guidelines
UWDA,Digital Anatomist
VANDF,National Drug File
WHO,WHOART
`

function headersToMap(headers: Headers) {
  let result: Record<string, string> = {}
  headers.forEach((value, key) => {
    result[key] = value
  })
  return result
}

const UMLS_API_URL = "https://uts-ws.nlm.nih.gov"

async function umlsSearch(
  input: Record<string, any>,
  toolData: Record<string, any>,
  api: InboundApi
) {
  if (!input.terms) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: terms is required"
        }
      ]
    }
  }

  if (typeof input.terms !== "string") {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: terms must be a string"
        }
      ]
    }
  }

  if (input.sabs && !Array.isArray(input.sabs)) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: sabs must be an array"
        }
      ]
    }
  }

  if (!input.pageNumber) {
    input.pageNumber = 1
  }

  const params = new URLSearchParams({
    pageNumber: `${input.pageNumber}`,
    string: input.terms,
    apiKey: process.env.UMLS_API_KEY!
  })
  if (input.sabs) {
    params.set("sabs", input.sabs.join(","))
  }
  const url = `${UMLS_API_URL}/search/current?${params.toString()}`
  const response = await fetch(url, {
    method: "GET"
  })
  let packet = await response.json()
  console.log("umlsSearch", headersToMap(response.headers), packet)
  return {
    role: "user",
    content: [
      {
        json: packet
      }
    ]
  }
}

export const UmlsSearchToolItem: ToolItem = {
  func: umlsSearch,
  guidance: `Search UMLS for terms.

<UMLS_SEARCH_FACTS>
1. The 'ui', 'rootSource' and 'name' useful to the user.
2. URL's returned from this tool can be used with the UmlsDetails tool.
3. The 'uri' fields is not directly useful to the user.
4. Provide the 'ui' (CUI) and 'name' (preferred term) to the user for clarity.
5. 'pageNumber' is optional and defaults to 1.
</UMLS_SEARCH_FACTS>

<UMLS_RELATED_RULES>
1. You are educating the user on the content as well as providing the content.
2. The 'sabs' parameter is optional but, when used, is restricted to the SAB values provided in UMLS_SAB_VALUES.
</UMLS_RELATED_RULES>

<UMLS_SAB_VALUES>
${UMLS_SAB_DEFINITIONS}
</UMLS_SAB_VALUES>

`,
  spec: {
    toolSpec: {
      name: "UmlsSearch",
      description: `UMLS search.`,
      inputSchema: {
        json: {
          type: "object",
          properties: {
            terms: {
              type: "string",
              description: "Terms for discovery."
            },
            pageNumber: {
              type: "number",
              description: "Page number to retrieve.",
              default: 1
            },
            sabs: {
              type: "array",
              items: {
                type: "string"
              },
              description: "SAB values to restrict search."
            }
          },
          required: ["terms"]
        }
      }
    }
  }
}

async function umlsDetails(
  input: Record<string, any>,
  toolData: Record<string, any>,
  api: InboundApi
) {
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

  if (!input.url.startsWith(UMLS_API_URL)) {
    return {
      role: "user",
      content: [
        {
          text: "ERROR: url must be a UMLS URL"
        }
      ]
    }
  }

  const sourceUrl = new URL(input.url)
  sourceUrl.searchParams.set("apiKey", process.env.UMLS_API_KEY!)
  sourceUrl.searchParams.set("language", "ENG")

  const url = sourceUrl.toString()
  const response = await fetch(url, {
    method: "GET"
  })
  let packet = await response.json()
  console.log("umlsDetails", headersToMap(response.headers), packet)
  return {
    role: "user",
    content: [
      {
        json: packet
      }
    ]
  }
}

export const UmlsDetailsToolItem: ToolItem = {
  func: umlsDetails,
  guidance: `Return details on an UMLS url.

<UMLS_DETAILS_FACTS>
1. URL's returned from this tool can be used with the UmlsDetails tool provided they reference ${UMLS_API_URL}.
2. References, when used, should be restricted to English unless the user has requested otherwise.
3. If you have an identifier for a term and a SAB, you can use the UmlsDetails tool to retrieve more information.
</UMLS_DETAILS_FACTS>

<SAMPLE_TERM_URL>
${UMLS_API_URL}/content/current/CUI/C0004238
${UMLS_API_URL}/content/current/source/SNOMEDCT_US/9468002
${UMLS_API_URL}/content/current/source/MSH/D015242
</SAMPLE_TERM_URL>
`,
  spec: {
    toolSpec: {
      name: "UmlsDetails",
      description: `UMLS details retriever.`,
      inputSchema: {
        json: {
          type: "object",
          properties: {
            url: {
              type: "string",
              description: "URL as returned by UmlsSearch."
            }
          },
          required: ["url"]
        }
      }
    }
  }
}
