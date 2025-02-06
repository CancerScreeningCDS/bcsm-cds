////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-SpecialPopulations
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Special Populations"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-SpecialPopulations"
* description = """Patient population that have been identified as higher than average risk or otherwise requiring specific consideration within a particular guideline. 

Provides criteria to determine age to start, screening modality, and screening interval for these populations of patients.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/SpecialPopulations|1.0.0"

* insert ACSMammoHighRisk
* insert ACSMriHighRisk
* insert ACSFirstDegGeneticMammo
* insert ACSFirstDegGeneticMri
* insert BreastImagingHeterogenouslyOrExtremelyDense
* insert CompellingFamilyHistory
* insert USPSTFRecommendation

RuleSet: ACSMammoHighRisk
* action[+].id = "ACSMammoHighRisk"
* action[=].title = "Annual screeening mammogram starting age 30"
* action[=].description = """
An annual screening mammogram starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on certain risk factors should get a mammogram every year, typically starting at age 30.
"""
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoHighRiskTimingEvent"

RuleSet: ACSMriHighRisk
* action[+].id = "ACSMriHighRisk"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = """
An annual screening MRI starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on certain risk factors should get a breast MRI every year, typically starting at age 30.
"""
* action[=] insert ACSMriCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMriHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriHighRiskTimingEvent"

RuleSet: ACSFirstDegGeneticMammo
* action[+].id = "ACSFirstDegGeneticMammo"
* action[=].title = "Annual screeening mammo starting age 30"
* action[=].description = """
An annual screening mammogram starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on certain risk factors should get a mammogram every year, typically starting at age 30.
"""
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSFirstDegGeneticMammo"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMammoTimingEvent"

RuleSet: ACSFirstDegGeneticMri
* action[+].id = "ACSFirstDegGeneticMri"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = """
An annual screening MRI starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on certain risk factors should get a breast MRI every year, typically starting at age 30.
"""
* action[=] insert ACSMriCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSFirstDegGeneticMri"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSFirstDegGeneticMriTimingEvent"

RuleSet: BreastImagingHeterogenouslyOrExtremelyDense
* action[+].id = "BreastImagingHeterogenouslyOrExtremelyDense"
* action[=].title = "Perform lifetime risk assessment"
* action[=].description = """
Consider performing assessment of lifetime risk, as defined by models largely dependent on family history.

If estimated lifetime risk is >20%, based on informal assessment or assessment using validated risk model, then patient is eligible for annual screening mammogram starting at age 30 and supplemental screening with annual screening MRI. Otherwise, patient can be offered annual screening mammogram starting at age 40.

Validated tools include BRCAPRO, Claus, BOADICEA [Breast and Ovarian Analysis of Disease Incidence and Carrier Estimation Algorithm], and Tyrer-Cuzick.
"""
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsBreastImagingHeterogenouslyOrExtremelyDense"
* action[=].definitionCanonical = Canonical(CommunicateRiskAssessment|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "BreastImagingHeterogenouslyOrExtremelyDenseReason"

RuleSet: CompellingFamilyHistory
* action[+].id = "CompellingFamilyHistory"
* action[=].title = "Perform lifetime risk assessment"
* action[=].description = """
Consider performing assessment of lifetime risk, as defined by models largely dependent on family history.

If estimated lifetime risk is >20%, based on informal assessment or assessment using validated risk model, then patient is eligible for annual screening mammogram starting at age 30 and supplemental screening with annual screening MRI. Otherwise, patient can be offered annual screening mammogram starting at age 40.

Validated tools include BRCAPRO, Claus, BOADICEA [Breast and Ovarian Analysis of Disease Incidence and Carrier Estimation Algorithm], and Tyrer-Cuzick.
"""
//TODO: add tool links
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsCompellingFamilyHistory"
* action[=].definitionCanonical = Canonical(CommunicateRiskAssessment|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "CompellingFamilyHistoryReason"

RuleSet: USPSTFRecommendation
* action[+].id = "USPSTFRecommendation"
* action[=].title = "Biennial screeening mammo starting age 40"
* action[=].description = "Biennial screeening mammogram starting at age 40"
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsUSPSTFRecommendation"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFRecommendationReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
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