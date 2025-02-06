////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-GeneticRiskReferral
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Genetic Risk Referral"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-GeneticRiskReferral"
* description = """
Risk assessment for women who have family history that may be associated with an increased risk for potentially harmful mutations in breast cancer susceptibility genes to determine who should receive referral for genetic counseling and, if indicated after counseling, testing.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/GeneticRiskReferral|1.0.0"
//TODO: add citations for non-BRCA variants not addressed in USPSTF, NCCN?
// -----------------------------------------------------------------------------
// Action: GeneticReferralVariant
// -----------------------------------------------------------------------------
* action[+].id = "GeneticReferralVariant"
* action[=].title = "Referral for genetic risk counseling"
* action[=].description = """
Referral for genetic counseling if not previously evaluated for variant of concern based on known family history.

Any blood relative with known BRCA1/BRCA2 variants, Li-Fraumeni syndrome (TP53 variant), Cowden or Bannayan-Riley-Ruvalcaba syndromes (PTEN variants), and other variants known to be associated with increased risk of development of breast cancer. Variants may include ATM, BARD1, CDH1, CHEK2, NF1, PALB2, RAD51C, RAD51D, STK11.
"""
* action[=] insert USPSTFGeneticCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsGeneticReferralVariant"
* action[=].definitionCanonical = Canonical(GeneticCounselingReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "GeneticRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "GeneticRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: GeneticReferralAncestry
// -----------------------------------------------------------------------------
* action[+].id = "GeneticReferralAncestry"
* action[=].title = "Referral for genetic risk counseling"
* action[=].description = """
Referral for genetic counseling if not previously consulted, or if limited panel was done and additional testing may be warranted.

Can offer referral to individuals who have one grandparent identified as of Ashkenazi Jewish ancestry, irrespective of cancer history in the family and without additional risk factors.
"""
//TODO: source NCCN
* action[=] insert USPSTFGeneticCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsGeneticReferralAncestry"
* action[=].definitionCanonical = Canonical(GeneticCounselingReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "GeneticRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "GeneticRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: GeneticReferralRisk
// -----------------------------------------------------------------------------
* action[+].id = "GeneticReferralRisk"
* action[=].title = "Referral for genetic risk counseling"
* action[=].description = """
Referral for genetic counseling if not previously consulted, or if limited panel was done and additional testing may be warranted.

Women with a positive result on family history based risk assessment should receive genetic counseling and, if indicated after counseling, genetic testing.
"""
* action[=] insert USPSTFGeneticCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsGeneticReferralRisk"
* action[=].definitionCanonical = Canonical(GeneticCounselingReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "GeneticRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "GeneticRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: GeneticRiskAssessment 
// -----------------------------------------------------------------------------
* action[+].id = "GeneticRiskAssessment"
* action[=].title = "Perform genetic risk assessment"
* action[=].description = """
A genetic risk assessment, either informal or formal using a validated instrument, will help determine if the patient may benefit from referral for genetic risk counseling and testing.

Women with a positive result on the risk assessment tool should receive genetic counseling and, if indicated after counseling, genetic testing.
"""
* action[=] insert USPSTFGeneticCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsGeneticRiskAssessment"
* action[=].selectionBehavior = http://hl7.org/fhir/action-selection-behavior#any
// Sub-action: fhxriskassess
* action[=].action[+].id = "FhxGeneticRiskAssessment"
* action[=].action[=].title = "Informal genetic risk assessment"
* action[=].action[=].description = """
Perform assessment based on criteria in first- or second-degree blood relatives known to be associated with increased risk of inherited breast cancer susceptibility variant.
"""
//TODO: how to incorporate risk criteria here?
* action[=].action[=].definitionCanonical = Canonical(GeneticRiskAssessmentRequest|1.0.0)
* action[=].action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "GeneticRiskAssessmentCode"
* action[=].action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "GeneticRiskAssessmentReason"
// Sub-action: fhxrisktool
* action[=].action[+].id = "FhxGeneticRiskAssessmentTool"
* action[=].action[=].title = "Genetic risk assessment instrument"
* action[=].action[=].description = """
Tools evaluated by the USPSTF include the Ontario Family History Assessment Tool, Manchester Scoring System, Referral Screening Tool, Pedigree Assessment Tool, 7-Question Family History Screening Tool, International Breast Cancer Intervention Study instrument (Tyrer-Cuzick), and brief versions of BRCAPRO. 
"""
//TODO: online links for these tools
* action[=].action[=].definitionCanonical = Canonical(GeneticRiskAssessmentRequest|1.0.0)
* action[=].action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "GeneticRiskAssessmentToolCode"
* action[=].action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "GeneticRiskAssessmentToolReason"

////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: GeneticCounselingReferralRequest
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Genetic Counseling Referral Request"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(GeneticCounselingReferralRequest)
* name = "GeneticCounselingReferralRequest"
* description = "This ActivityDefinition generates a ServiceRequest for genetic counseling referral."
* kind = $RRTYPE#ServiceRequest "ServiceRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"

////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: GeneticRiskAssessmentRequest
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Genetic Risk Assessment Request"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(GeneticRiskAssessmentRequest)
* name = "GeneticRiskAssessmentRequest"
* description = "This ActivityDefinition generates a ServiceRequest to perform a genetic risk assessment."
* kind = $RRTYPE#ServiceRequest "ServiceRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"

////////////////////////////////////////////////////////////////////////////////////////////////////

