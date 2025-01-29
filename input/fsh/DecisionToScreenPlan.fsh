////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-DecisionToScreen
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Decision to Screen"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-DecisionToScreen"
* description = "Decision to screen logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/DecisionToScreen|1.0.0"

* insert SDMContinueScreeningAge
* insert SDMContinueScreeningLifeExp
* insert SDMDelayScreeningLactating
// -----------------------------------------------------------------------------
// HIGH RISK EXCLUSIONS
// -----------------------------------------------------------------------------
* insert ACSGeneticRiskMammo
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSGeneticRiskMri
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert SpecialtyReferralGeneticRisk
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSMammoAfterRT
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSMriAfterRT
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSMammoAfterBrca
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert SpecialtyReferralBreastCaWithin5y
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSMammoAtypicalBiopsy
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSAtypicalBiopsy
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert ACSMriAtypicalBiopsyHighRisk
* insert ApplicabilityHighRiskExclusionsRecommendations
// -----------------------------------------------------------------------------
// SPECIAL POPULATIONS
// -----------------------------------------------------------------------------
* insert ACSMammoHighRisk
* insert ApplicabilitySpecialPopulationsRecommendations
* insert ACSMriHighRisk
* insert ApplicabilitySpecialPopulationsRecommendations
* insert ACSFirstDegGeneticMammo
* insert ApplicabilitySpecialPopulationsRecommendations
* insert ACSFirstDegGeneticMri
* insert ApplicabilitySpecialPopulationsRecommendations
* insert BreastImagingHeterogenouslyOrExtremelyDense
* insert ApplicabilitySpecialPopulationsRecommendations
* insert CompellingFamilyHistory
* insert ApplicabilitySpecialPopulationsRecommendations
* insert USPSTFRecommendation
* insert ApplicabilitySpecialPopulationsRecommendations
// -----------------------------------------------------------------------------
// AVERAGE RISK
// -----------------------------------------------------------------------------
* insert ACSMammoAvgRiskAgeUnder45
* insert ApplicabilityAverageRiskRecommendations
* insert ACSMammoAvgRiskAge45to54
* insert ApplicabilityAverageRiskRecommendations
* insert ACSMammoAvgRiskAgeOver54
* insert ApplicabilityAverageRiskRecommendations
* insert USPSTFAvgRisk
* insert ApplicabilityAverageRiskRecommendations

RuleSet: SDMContinueScreeningAge
* action[+].id = "SDMContinueScreeningAge"
* action[=].title = "Shared decision making to continue screening based on age"
* action[=].description = "Shared decision making to continue screening based on age"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsSDMContinueScreeningAge"
* action[=].definitionCanonical = Canonical(CommunicateSDMContinueScreening|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SDMContinueScreeningAgeCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SDMContinueScreeningAgeReason"

RuleSet: SDMContinueScreeningLifeExp
* action[+].id = "SDMContinueScreeningLifeExp"
* action[=].title = "Shared decision making to continue screening based on life expectancy"
* action[=].description = "Shared decision making to continue screening based on life expectancy"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsSDMContinueScreeningLifeExp"
* action[=].definitionCanonical = Canonical(CommunicateSDMContinueScreening|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SDMContinueScreeningLifeExpCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SDMContinueScreeningLifeExpReason"

RuleSet: SDMDelayScreeningLactating
* action[+].id = "SDMDelayScreeningLactating"
* action[=].title = "Shared decision making to delay screening based on lactation status"
* action[=].description = "Shared decision making to delay screening based on lactation status"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsSDMDelayScreeningLactating"
* action[=].definitionCanonical = Canonical(CommunicateSDMDelayScreening|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SDMDelayScreeningLactatingCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SDMDelayScreeningLactatingReason"

RuleSet: ApplicabilityHighRiskExclusionsRecommendations
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsHighRiskExclusionsRecommendations"

RuleSet: ApplicabilitySpecialPopulationsRecommendations
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsSpecialPopulationsRecommendations"

RuleSet: ApplicabilityAverageRiskRecommendations
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsAverageRiskRecommendations"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateSDMContinueScreening
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Shared Decision Making to Continue Screening"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateSDMContinueScreening)
* name = "CommunicateSDMContinueScreening"
* description = "This ActivityDefinition generates a CommunicationRequest recommending shared decision making on the decision to continue screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#sdmcontinue "Shared decision making to continue screening"
* code.text = "Shared decision making to continue screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateSDMDelayScreening
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Shared Decision Making to Delay Screening"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateSDMDelayScreening)
* name = "CommunicateSDMDelayScreening"
* description = "This ActivityDefinition generates a CommunicationRequest recommending shared decision making on the decision to delay screening."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#sdmdelay "Shared decision making to delay screening"
* code.text = "Shared decision making to delay screening"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: BreastScreeningServiceRequest
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Breast Screening Service Request"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(BreastScreeningServiceRequest)
* name = "BreastScreeningServiceRequest"
* description = "This ActivityDefinition generates a ServiceRequest for screening study."
* kind = $RRTYPE#ServiceRequest "ServiceRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"

////////////////////////////////////////////////////////////////////////////////////////////////////
