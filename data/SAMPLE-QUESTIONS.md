# Sample questions

## Big single shot

Copy the contents of this and give it a try

```text
@medical Perform the following assessment for patient p456:

1. for each VA DBQ tell me the name of the DBQ being reviewed
2. Within that DBQ for each DBQ question assess the patient data and provide a positive, negative or N/A indicator
3. For each question assessment provide the decision, supporting reasoning and links to the clinical data that was used
4. After completing all the above steps for each DBQ provide a summary of outcomes and recommendations

You may call the patient data tool as many times as required to complete the task. The patient data only contains clinical data and does not contain the questions themselves.
```

## Bit by bit

```text

@medical get me started

@medical p123

-- picking one of the generated follow up questions
--
@medical Can you show me the basic demographic information for patient p123?

-- picking one of the generated follow up questions
--
@medical Are there any records of the patient's last hospital visit?

-- picking one of the generated follow up questions
--
@medical Were there any treatments or procedures performed during the final emergency room visit?

-- manual question
--
@medical who were the providers for that last visit?

```
