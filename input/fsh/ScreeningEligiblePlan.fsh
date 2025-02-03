////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-ScreeningEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Screening Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-ScreeningEligible"
* description = "Screening eligible logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/ScreeningEligible|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: Screening Eligible
// -----------------------------------------------------------------------------
* action[+].id = "IsScreeningEligible"
* action[=].title = "Screening eligible"
* action[=].description = "Patient is eligible for screening"
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=] insert ScreeningEligibleDocumentationArtifact
* action[=].code = $PDACS#eligible "Eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "IsScreeningEligible"
* action[=].definitionCanonical = Canonical(CommunicateEligible|1.0.0)
// -----------------------------------------------------------------------------
// Action #2: Not Screening Eligible
// -----------------------------------------------------------------------------
* insert NotEligibleNotAssignedFemaleAtBirth
* insert NotEligibleCurrentBreastCancer
* insert NotEligibleBreastSymptomsOrFindings
* insert NotEligibleBilateralMastectomy
// -----------------------------------------------------------------------------
// Inclusions error
// -----------------------------------------------------------------------------
* action[+].title = "Screening Eligible Missing Data"
* action[=].description = "Error due to missing required data for inclusion and exclusion evaluation."
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "MissingAgeOrBirthdate"
* action[=].condition[=].expression.reference = "Library/ScreeningEligible|1.0.0"
* action[=].definitionCanonical = Canonical(ScreeningEligibleQuestionnaire|1.0.0)

RuleSet: NotEligibleNotAssignedFemaleAtBirth
* action[+].id = "NotEligibleCurrentBreastCancer"
* action[=].title = "Not eligible for screening"
* action[=].description = """
  This patient is not eligible for screening.

  Referenced guidelines apply to individuals assigned female at birth. Routine screening of cis-gender individuals assigned male at birth is not recommended. For transgender women, consider specialist referral.

  Additional resources: ACR Appropriateness Criteria® Transgender Breast Cancer Screening; UCSF guidelines 'Screening for breast cancer in transgender women'
  """
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=] insert ScreeningEligibleDocumentationArtifact
* action[=] insert ACRTransgenderCitationDocumentationArtifact
* action[=] insert UCSFTransgenderCitationDocumentationArtifact
* action[=].code = $PDACS#noteligible "Not eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsNotEligibleNotAssignedFemaleAtBirth"
* action[=].definitionCanonical = Canonical(CommunicateNotEligible|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ScreeningEligibleReason"

RuleSet: NotEligibleCurrentBreastCancer
* action[+].id = "NotEligibleCurrentBreastCancer"
* action[=].title = "Not eligible for screening"
* action[=].description = """
  This patient is not eligible for screening and should be referred to a specialist for management.

  This patient has an active condition of breast cancer and does not meet the eligibility requirements for routine breast cancer screening.
  """
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=] insert ScreeningEligibleDocumentationArtifact
* action[=].code = $PDACS#noteligible "Not eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsNotEligibleCurrentBreastCancer"
* action[=].definitionCanonical = Canonical(CommunicateNotEligible|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ScreeningEligibleReason"

RuleSet: NotEligibleBilateralMastectomy
* action[+].id = "NotEligibleBilateralMastectomy"
* action[=].title = "Not eligible for screening"
* action[=].description = """
  This patient is not eligible for screening.

  This patient has had bilateral mastectomy and does not meet the eligibility requirements for routine breast cancer screening.
  """
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=] insert ScreeningEligibleDocumentationArtifact
* action[=].code = $PDACS#noteligible "Not eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsNotEligibleBilateralMastectomy"
* action[=].definitionCanonical = Canonical(CommunicateNotEligible|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ScreeningEligibleReason"

RuleSet: NotEligibleBreastSymptomsOrFindings
* action[+].id = "NotEligibleBreastSymptomsOrFindings"
* action[=].title = "Not eligible for screening"
* action[=].description = """
  This patient is not eligible for screening.

  New breast symptoms or exam findings, or chronic symptoms or findings which have progressively worsened, should undergo diagnostic testing rather than routine screening.
  """
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=] insert ScreeningEligibleDocumentationArtifact
* action[=].code = $PDACS#noteligible "Not eligible for screening"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsNotEligibleBreastSymptomsOrFindings"
* action[=].definitionCanonical = Canonical(CommunicateNotEligible|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ScreeningEligibleReason"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateEligible)
* name = "CommunicateEligible"
* description = "This ActivityDefinition generates a CommunicationRequest containing information about the patient's ineligibility for screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#eligible "Eligible for screening"
* code.text = "Eligible for screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateNotEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Not Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateNotEligible)
* name = "CommunicateNotEligible"
* description = "This ActivityDefinition generates a CommunicationRequest containing information about the patient's ineligibility for screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#noteligible "Not eligible for screening"
* code.text = "Not eligible for screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: ScreeningEligibleQuestionnaireTask
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Screening Eligible Questionnaire Task"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(ScreeningEligibleQuestionnaireTask)
* name = "ScreeningEligibleQuestionnaireTask"
* description = "This ActivityDefinition generates a Questionnaire Task containing a request to complete a questionnaire."
* kind = $RRTYPE#Task "Task"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-activity-type#collect-information "Collect information"
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-collectWith"
* extension[=].valueCanonical = Canonical(ScreeningEligibleQuestionnaire|1.0.0)