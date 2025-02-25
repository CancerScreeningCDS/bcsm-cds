////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-AverageRisk
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Average Risk"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-AverageRisk"
* description = """
Patient population identified as average risk. Provides criteria to determine age to start, screening modality, and screening interval for these populations of patients.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/AverageRisk|1.0.0"

* insert ACSMammoAvgRiskAgeUnder45
* insert ACSMammoAvgRiskAge45to54
* insert ACSMammoAvgRiskAgeOver54
* insert USPSTFAvgRisk

RuleSet: ACSMammoAvgRiskAgeUnder45
* action[+].id = "ACSMammoAvgRiskAgeUnder45"
* action[=].title = "Annual screening mammogram starting age 40"
* action[=].description = """
Women between 40 and 44 have the option to start screening with a mammogram every year.
"""
* action[=] insert ACSAvgRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoAvgRiskAgeUnder45"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Code"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Timing"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Flag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Code"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45Reason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeUnder45TimingEvent"

RuleSet: ACSMammoAvgRiskAge45to54
* action[+].id = "ACSMammoAvgRiskAge45to54"
* action[=].title = "Annual screening mammogram starting age 40"
* action[=].description = "Annual screening mammogram is recommended for women 45 to 54."
* action[=] insert ACSAvgRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoAvgRiskAge45to54"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAge45to54Code"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAge45to54Timing"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAge45to54Flag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAge45to54Code"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAge45to54Reason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAge45to54TimingEvent"

RuleSet: ACSMammoAvgRiskAgeOver54
* action[+].id = "ACSMammoAvgRiskAgeOver54"
* action[=].title = "Biennial screening mammogram after age 54"
* action[=].description = """
Biennial screening mammogram is recommended after age 54.

Women 55 and older can switch to a mammogram every other year, or they can choose to continue yearly mammograms. Screening should continue as long as a woman is in good health and is expected to live at least 10 more years.
"""
* action[=] insert ACSAvgRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoAvgRiskAgeOver54"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeOver54Code"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeOver54Timing"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeOver54Flag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeOver54Code"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeOver54Reason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAvgRiskAgeOver54TimingEvent"

RuleSet: USPSTFAvgRisk
* action[+].id = "USPSTFAvgRisk"
* action[=].title = "Biennial screening mammogram starting age 40"
* action[=].description = "Biennial screening mammogram starting at age 40"
* action[=] insert USPSTFScreeningCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsUSPSTFAvgRisk"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "USPSTFAvgRiskTimingEvent"

////////////////////////////////////////////////////////////////////////////////////////////////////