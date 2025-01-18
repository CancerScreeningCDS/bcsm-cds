////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-HighRiskExclusions
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "High Risk Exclusions"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-HighRiskExclusions"
* description = "High risk exclusions logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/HighRiskExclusions|1.0.0"

* insert ACSGeneticRiskMammo
* insert ACSGeneticRiskMri
* insert SpecialtyReferralGeneticRisk
* insert ACSMammoAfterRT
* insert ACSMriAfterRT
* insert ACSMammoAfterBrca
* insert SpecialtyReferralBreastCaWithin5y
* insert ACSMammoAtypicalBiopsyHighRisk
* insert ACSMriAtypicalBiopsyHighRisk

RuleSet: ACSGeneticRiskMammo
* action[+].id = "ACSGeneticRiskMammo"
* action[=].title = "Annual screeening mammogram starting age 30"
* action[=].description = "Annual screeening mammogram starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSGeneticRiskMammo"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoTimingEvent"

RuleSet: ACSGeneticRiskMri
* action[+].id = "ACSGeneticRiskMri"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = "Annual screeening MRI starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSGeneticRiskMri"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriTimingEvent"

RuleSet: SpecialtyReferralGeneticRisk
* action[+].id = "SpecialtyReferralGeneticRisk"
* action[=].title = "Recommendation for speciality referral"
* action[=].description = "Recommendation for speciality referral"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsSpecialtyReferralGeneticRisk"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SpecialtyReferralGeneticRiskReason"

RuleSet: ACSMammoAfterRT
* action[+].id = "ACSMammoAfterRT"
* action[=].title = "Annual screeening mammogram starting age 30"
* action[=].description = "Annual screeening mammogram starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMammoAfterRT"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTTimingEvent"

RuleSet: ACSMriAfterRT
* action[+].id = "ACSMriAfterRT"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = "Annual screeening MRI starting age 30"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMriAfterRT"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTTimingEvent"

RuleSet: ACSMammoAfterBrca
* action[+].id = "ACSMammoAfterBrca"
* action[=].title = "Annual screeening mammogram after 5 years in remission"
* action[=].description = "Annual screeening mammogram after 5 years in remission"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMammoAfterBrca"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaTimingEvent"

RuleSet: SpecialtyReferralBreastCaWithin5y
* action[+].id = "SpecialtyReferralBreastCaWithin5y"
* action[=].title = "Refer to Oncologic care plan"
* action[=].description = "If previous breast cancer within 5 years may require enhanced surveillance including diagnostic mammogram. Refer to patient's Oncologic treatment team or Survivorship Care Plan for patient specific guidance."
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsSpecialtyReferralBreastCaWithin5y"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "SpecialtyReferralBreastCaWithin5yReason"

RuleSet: ACSMammoAtypicalBiopsyHighRisk
* action[+].id = "ACSMammoAtypicalBiopsyHighRisk"
* action[=].title = "Annual screeening mammogram in past atypical biopsy with high lifetime risk"
* action[=].description = "Annual screeening mammogram in past atypical biopsy with high lifetime risk"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMammoAtypicalBiopsyHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyHighRiskTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyHighRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyHighRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyHighRiskTimingEvent"

RuleSet: ACSMriAtypicalBiopsyHighRisk
* action[+].id = "ACSMriAtypicalBiopsyHighRisk"
* action[=].title = "Annual screeening MRI in past atypical biopsy with high lifetime risk"
* action[=].description = "Annual screeening MRI in past atypical biopsy with high lifetime risk"
* action[=] insert ACSCitationActionDocumentation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "ExistsACSMriAtypicalBiopsyHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskTiming"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskTimingEvent"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: CommunicateSpecialtyReferral
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity
Title: "Communicate Recommendation to refer to specialist"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableactivity"
* url = Canonical(CommunicateSpecialtyReferral)
* name = "CommunicateSpecialtyReferral"
* description = "This ActivityDefinition generates a CommunicationRequest recommending specialty referral."
* kind = $RRTYPE#CommunicationRequest "CommunicationRequest"
* intent = $RINTENT#proposal "Proposal"
* priority = $RPRIOR#routine "Routine"
* code = $PDACS#specialtyreferral "Refer to specialist recommendations"
* code.text = "Refer to specialist recommendations"