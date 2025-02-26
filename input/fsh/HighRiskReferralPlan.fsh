////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-HighRiskReferral
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "High Risk Referral"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-HighRiskReferral"
* description = """
Women who are at increased risk for breast cancer without current or previous diagnosis of breast cancer or ductal carcinoma in situ (DCIS) can be referred to a breast specialty clinic to consider risk reduction interventions.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/HighRiskReferral|1.0.0"
//TODO: add citations for non-USPSTF, NCCN?
// -----------------------------------------------------------------------------
// Action: HighRiskReferralGenetic
// -----------------------------------------------------------------------------
* action[+].id = "HighRiskReferralGenetic"
* action[=].title = "Referral for high risk breast specialty evaluation"
* action[=].description = """
Consider referral to breast specialist to discuss primary risk reduction interventions.

These may include medications to reduce risk (chemoprevention), risk reducing surgery or enhanced surveillance. Women at greater risk, such as those with a genetic marker or syndrome associated with increased risk of breast cancer, may derive more benefit than harm from risk-reducing medications.
"""
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsHighRiskReferralGenetic"
* action[=].definitionCanonical = Canonical(HighRiskSpecialtyReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: HighRiskReferralChestXRT
// -----------------------------------------------------------------------------
* action[+].id = "HighRiskReferralChestXRT"
* action[=].title = "Referral for high risk breast specialty evaluation"
* action[=].description = """
Consider referral to breast specialist to discuss primary risk reduction interventions.

These may include medications to reduce risk (chemoprevention), risk reducing surgery or enhanced surveillance. Women at greater risk, such as those with a history of chest radiotherapy, may derive more benefit than harm from risk-reducing medications.
"""
//TODO: source NCCN
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsHighRiskReferralChestXRT"
* action[=].definitionCanonical = Canonical(HighRiskSpecialtyReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: HighRiskReferralAtypicalBiopsy
// -----------------------------------------------------------------------------
* action[+].id = "HighRiskReferralAtypicalBiopsy"
* action[=].title = "Referral for high risk breast specialty evaluation"
* action[=].description = """
Consider referral to breast specialist to discuss primary risk reduction interventions.

These may include medications to reduce risk (chemoprevention), risk reducing surgery or enhanced surveillance. Women at greater risk, such as those with a history of past atypical biopsy results, may derive more benefit than harm from risk-reducing medications.
"""
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsHighRiskReferralAtypicalBiopsy"
* action[=].definitionCanonical = Canonical(HighRiskSpecialtyReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: HighRiskReferral5YRiskHigh
// -----------------------------------------------------------------------------
* action[+].id = "HighRiskReferral5YRiskHigh"
* action[=].title = "Referral for high risk breast specialty evaluation"
* action[=].description = """
Refer to high risk breast specialist to discuss primary risk reduction interventions.

These may include medications to reduce risk (chemoprevention), risk reducing surgery or enhanced surveillance. Women at greater risk, such as those with at least a 3% risk for breast cancer in the next 5 years, are likely to derive more benefit than harm from risk-reducing medications.
"""
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsHighRiskReferral5YRiskHigh"
* action[=].definitionCanonical = Canonical(HighRiskSpecialtyReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: HighRiskReferral5YRiskHigherThanAverage
// -----------------------------------------------------------------------------
* action[+].id = "HighRiskReferral5YRiskHigherThanAverage"
* action[=].title = "Consider referral for high risk breast specialty evaluation"
* action[=].description = """
Consider referral to breast specialist to discuss primary risk reduction interventions.

These may include medications to reduce risk (chemoprevention), risk reducing surgery or enhanced surveillance.
"""
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsHighRiskReferral5YRiskHigherThanAverage"
* action[=].definitionCanonical = Canonical(HighRiskSpecialtyReferralRequest|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "HighRiskReferralReason"
// -----------------------------------------------------------------------------
// Action: ConsiderLifeExpectancy
// -----------------------------------------------------------------------------
* action[+].id = "ConsiderLifeExpectancy"
* action[=].title = "Shared decision making for high risk specialty referral based on life expectancy"
* action[=].description = """
Patient may not be a candidate for chemoprevention if estimated life expectancy is < 10 years.

Factors that may impact this estimation should be considered prior to referral. A validated tool such as www.eprognosis.com can help guide decision making.
"""
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsConsiderLifeExpectancy"
* action[=].definitionCanonical = Canonical(CommunicateSDMConsiderLifeExpectancy|1.0.0)
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ConsiderLifeExpectancyCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ConsiderLifeExpectancyReason"
// -----------------------------------------------------------------------------
// Action: HighRiskAssessment 
// -----------------------------------------------------------------------------
* action[+].id = "HighRiskAssessment"
* action[=].title = "Perform 5 year risk assessment"
* action[=].description = """
A 5 year risk assessment, either informal or formal using a validated instrument, will help determine if the patient may benefit from referral for high risk breast specialty evaluation.

Women at higher than average 5 year risk may be candidates for referral to breast specialist to discuss primary risk reduction interventions. These may include medications to reduce risk (chemoprevention), risk reducing surgery or enhanced surveillance.
"""
* action[=] insert USPSTFRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsHighRiskAssessment"
* action[=].selectionBehavior = http://hl7.org/fhir/action-selection-behavior#any
// Sub-action: 5YRiskAssessment
* action[=].action[+].id = "5YRiskAssessment"
* action[=].action[=].title = "Informal 5 year risk assessment"
* action[=].action[=].description = """
Perform assessment based on personal risk factors conferring increased risk of breast cancer.

These may include: increasing age, younger age at menarche, older age at first live birth, nulliparity/lower parity, number of prior breast biopsies, heterogeneously and/or extremely dense breasts.
"""
//TODO: how to incorporate risk criteria here?
* action[=].action[=].definitionCanonical = Canonical(5YearRiskAssessmentRequest|1.0.0)
* action[=].action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "HighRiskAssessmentCode"
* action[=].action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "HighRiskAssessmentReason"
// Sub-action: 5YRiskAssessmentTool
* action[=].action[+].id = "5YRiskAssessmentTool"
* action[=].action[=].title = "5 year risk assessment instrument"
* action[=].action[=].description = """
The NCI Breast Cancer Risk Assessment Tool and the Breast Cancer Surveillance Consortium Risk Calculator are based on models tested in US populations and are publicly available for clinicians and patients to use.
"""
* action[=].action[=] insert NCIBCRATDocumentationArtifact
* action[=].action[=] insert BCSCRiskCalculatorDocumentationArtifact
* action[=].action[=].definitionCanonical = Canonical(5YearRiskAssessmentRequest|1.0.0)
* action[=].action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "HighRiskAssessmentToolCode"
* action[=].action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].action[=].dynamicValue[=].expression.expression = "HighRiskAssessmentToolReason"

////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: HighRiskSpecialtyReferralRequest
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "High Risk Specialty Referral Request"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(HighRiskSpecialtyReferralRequest)
* name = "HighRiskSpecialtyReferralRequest"
* description = "This ActivityDefinition generates a ServiceRequest for high risk breast specialty referral."
* kind = $RRTYPE#ServiceRequest "ServiceRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"

////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: 5YearRiskAssessmentRequest
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "5 Year Risk Assessment Request"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(5YearRiskAssessmentRequest)
* name = "5YearRiskAssessmentRequest"
* description = "This ActivityDefinition generates a ServiceRequest to perform a 5 year risk assessment."
* kind = $RRTYPE#ServiceRequest "ServiceRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"

////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: CommunicateSDMConsiderLifeExpectancy
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Shared Decision Making to Continue Screening"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateSDMConsiderLifeExpectancy)
* name = "CommunicateSDMConsiderLifeExpectancy"
* description = "This ActivityDefinition generates a CommunicationRequest recommending shared decision making on the decision to refer for high risk evaluation."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"

////////////////////////////////////////////////////////////////////////////////////////////////////

