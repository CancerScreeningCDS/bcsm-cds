////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-HighRiskExclusions
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "High Risk Exclusions"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-HighRiskExclusions"
* description = """
Clinical characteristics that have been identified in the USPSTF breast screening recommendation statement as indicative of higher than average risk and therefore excluded from recommendation statement patient population. Provides criteria to determine age to start and age to stop, screening modality, and screening interval for these populations of patients.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/HighRiskExclusions|1.0.0"

* insert ACSGeneticRiskMammo
* insert ACSGeneticRiskMri
* insert SpecialtyReferralGeneticRisk
* insert ACSMammoAfterRT
* insert ACSMriAfterRT
* insert ACSMammoAfterBrca
* insert SpecialtyReferralBreastCaWithin5y
* insert ACSMammoAtypicalBiopsy
* insert ACSAtypicalBiopsy
* insert ACSMriAtypicalBiopsyHighRisk

RuleSet: ACSGeneticRiskMammo
* action[+].id = "ACSGeneticRiskMammo"
* action[=].title = "Annual screeening mammogram starting age 30"
* action[=].description = """
An annual screening mammogram starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on known genetic markers or syndromes should get a mammogram every year, typically starting at age 30.
"""
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSGeneticRiskMammo"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMammoTimingEvent"

RuleSet: ACSGeneticRiskMri
* action[+].id = "ACSGeneticRiskMri"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = """
An annual screening MRI starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on known genetic markers or syndromes should get a breast MRI every year, typically starting at age 30.
"""
* action[=] insert ACSMriCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSGeneticRiskMri"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSGeneticRiskMriTimingEvent"

RuleSet: SpecialtyReferralGeneticRisk
* action[+].id = "SpecialtyReferralGeneticRisk"
* action[=].title = "Refer to specialist recommendations"
* action[=].description = """
A number of other genetic variants are known to be associated with an increased risk of developing of breast cancer. For known personal history of these variants, refer to the consulting geneticist or to high risk breast specialist for guidance on routine screening. 

Variants may include ATM, BARD1, CDH1, CHEK2, NF1, PALB2, RAD51C, RAD51D, STK11.
"""
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsSpecialtyReferralGeneticRisk"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "SpecialtyReferralGeneticRiskReason"

RuleSet: ACSMammoAfterRT
* action[+].id = "ACSMammoAfterRT"
* action[=].title = "Annual screeening mammogram"
* action[=].description = """
An annual screening mammogram starting 8 years after radiotherapy and no earlier than age 25 is recommended.

Refer to patient's Oncologic treatment team or Survivorship Care Plan for patient specific guidance.
"""
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoAfterRT"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterRTTimingEvent"

RuleSet: ACSMriAfterRT
* action[+].id = "ACSMriAfterRT"
* action[=].title = "Annual screeening MRI"
* action[=].description = """
An annual screening MRI starting 8 years after radiotherapy and no earlier than age 25 is recommended.

Refer to patient's Oncologic treatment team or Survivorship Care Plan for patient specific guidance.
"""
* action[=] insert ACSMriCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier" 
* action[=].condition[=].expression.expression = "ExistsACSMriAfterRT"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAfterRTTimingEvent"

RuleSet: ACSMammoAfterBrca
* action[+].id = "ACSMammoAfterBrca"
* action[=].title = "Annual screeening mammogram"
* action[=].description = "Annual screeening mammogram after 5 years in remission from breast cancer is recomended."
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoAfterBrca"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAfterBrcaTimingEvent"

RuleSet: SpecialtyReferralBreastCaWithin5y
* action[+].id = "SpecialtyReferralBreastCaWithin5y"
* action[=].title = "Refer to Oncologic care plan"
* action[=].description = """
Previous breast cancer within 5 years may require enhanced surveillance including diagnostic mammogram. 

Refer to patient's Oncologic treatment team or Survivorship Care Plan for patient specific guidance.
"""
//TODO: Add citation
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsSpecialtyReferralBreastCaWithin5y"
* action[=].definitionCanonical = Canonical(CommunicateSpecialtyReferral|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "SpecialtyReferralBreastCaWithin5yReason"

RuleSet: ACSMammoAtypicalBiopsy
* action[+].id = "ACSMammoAtypicalBiopsy"
* action[=].title = "Annual screeening mammogram starting age 30"
* action[=].description = """
An annual screening mammogram starting at age 30 is recommended.

Women who are at higher than average risk for breast cancer based on past atypical biopsy should get a mammogram every year, typically starting at age 30.

"""
* action[=] insert ACSHighRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMammoAtypicalBiopsy"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMammoAtypicalBiopsyTimingEvent"

RuleSet: ACSAtypicalBiopsy
* action[+].id = "ACSAtypicalBiopsy"
* action[=].title = "Perform lifetime risk assessment"
* action[=].description = """
Consider performing assessment of lifetime risk. 

If estimated lifetime risk is >20%, patient may be eligible for supplemental screening with annual screening MRI.
"""
* action[=] insert ACSMriCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSAtypicalBiopsy"
* action[=].definitionCanonical = Canonical(CommunicateRiskAssessment|1.0.0)
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSAtypicalBiopsyReason"

RuleSet: ACSMriAtypicalBiopsyHighRisk
* action[+].id = "ACSMriAtypicalBiopsyHighRisk"
* action[=].title = "Annual screeening MRI starting age 30"
* action[=].description = "An annual screening MRI starting at age 30 is recommended in patients with past atypical biopsy and lifetime risk > 20-25%."
* action[=] insert ACSMriCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsACSMriAtypicalBiopsyHighRisk"
* action[=].definitionCanonical = Canonical(BreastScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "ACSMriAtypicalBiopsyHighRiskReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
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