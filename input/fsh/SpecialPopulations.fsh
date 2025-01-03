////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-SpecialPopulations
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Special Populations"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-SpecialPopulations"
* description = "Special populations logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/SpecialPopulations|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: ACSMammoHighRisk
// -----------------------------------------------------------------------------
* action[+].id = "ACSMammoHighRisk"
* action[=].title = "Annual screeening mammogram starting age 30"
* action[=].description = "Annual screeening mammogram starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMammoHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskCode"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskTimingEvent"
// -----------------------------------------------------------------------------
// Action #2: ACSMriHighRisk
// -----------------------------------------------------------------------------
* action[+].id = "ACSMriHighRisk"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = "Annual screeening MRI starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMriHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskCode"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskTimingEvent"
// -----------------------------------------------------------------------------
// Action #3: ACSFirstDegGeneticMammo
// -----------------------------------------------------------------------------
* action[+].id = "ACSFirstDegGeneticMammo"
* action[=].title = "Annual screeening mammo starting age 30"
* action[=].description = "Annual screeening mammo starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSFirstDegGeneticMammo"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoCode"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoTimingEvent"
// -----------------------------------------------------------------------------
// Action #4: ACSFirstDegGeneticMri
// -----------------------------------------------------------------------------
* action[+].id = "ACSFirstDegGeneticMri"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = "Annual screeening MRI starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSFirstDegGeneticMri"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriCode"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriTimingEvent"
// -----------------------------------------------------------------------------
// Action #5: BreastImagingHeterogenouslyOrExtremelyDense
// -----------------------------------------------------------------------------
* action[+].id = "BreastImagingHeterogenouslyOrExtremelyDense"
* action[=].title = "Perform lifetime risk assessment"
* action[=].description = "Perform lifetime risk assessment"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsBreastImagingHeterogenouslyOrExtremelyDense"
* action[=].definitionCanonical = Canonical(CommunicateRiskAssessment|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "BreastImagingHeterogenouslyOrExtremelyDenseReason"
// -----------------------------------------------------------------------------
// Action #6: CompellingFamilyHistory
// -----------------------------------------------------------------------------
* action[+].id = "CompellingFamilyHistory"
* action[=].title = "Perform lifetime risk assessment"
* action[=].description = "Perform lifetime risk assessment"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsCompellingFamilyHistory"
* action[=].definitionCanonical = Canonical(CommunicateRiskAssessment|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "CompellingFamilyHistoryReason"
// -----------------------------------------------------------------------------
// Action #7: USPSTFRecommendation
// -----------------------------------------------------------------------------
* action[+].id = "USPSTFRecommendation"
* action[=].title = "Biennial screeening mammo starting age 40"
* action[=].description = "Biennial screeening mammo starting age 40"
* action[=] insert USPSTFScreeningCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsUSPSTFRecommendation"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationCode"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationTimingEvent"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateRiskAssessment
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate recommendation for risk assessment"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateRiskAssessment)
* name = "CommunicateRiskAssessment"
* description = "This ActivityDefinition generates a CommunicationRequest recommending risk assessment."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#lifetimeriskassessment "Perform lifetime risk assessment"
* code.text = "Perform lifetime risk assessment"