////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-FollowupScreeningResult
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Followup Screening Result"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-FollowupScreeningResult"
* description = """
Determines next steps, if any, based on result of screening imaging or biopsy. This may be triggered by a diagnostic report being received by the system or an imaging BI-RADS result being documented in a structured manner.
"""
* type = $PDTYPE#eca-rule
* library[+] = "Library/FollowupScreeningResult|1.0.0"

* insert FollowupBirads0Result
* insert FollowupBirads3Result
* insert FollowupBirads4Or5Result
* insert FollowupBenignBiopsyResult
* insert FollowupAtypicalBiopsyResult
* insert FollowupMalignantBiopsyResult
* insert FollowupIndeterminateBiopsyResult
* insert FollowupDiscordantBiopsyResult

RuleSet: FollowupBirads0Result
* action[+].id = "FollowupBirads0Result"
* action[=].title = "Refer to Radiologist recommendations"
* action[=].description = """
Refer to Radiologist recommendations for further evaluation in BI-RADS 0 screening results.

Additional work-up including comparison to prior mammograms or diagnostic imaging may be indicated.
"""
* action[=] insert ACRMammographyReportingCitationDocumentationArtifact
* action[=] insert ACRMriReportingCitationDocumentationArtifact
* action[=] insert ACRUltrasoundReportingCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupBirads0Result"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads0ResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads0ResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads0ResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads0ResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads0ResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads0ResultTimingEvent"

RuleSet: FollowupBirads3Result
* action[+].id = "FollowupBirads3Result"
* action[=].title = "Refer to Radiologist recommendations"
* action[=].description = """
Probably benign finding. Refer to Radiologist recommendations for interval imaging in BI-RADS 3 screening results.

Periodic monitoring, including diagnostic mammogram or ultrasound, is warranted to assess for changes. Monitoring may be recommended at 6, 12 and 24 months until the finding is felt to be stable or resolving or is transitioned to a higher BI-RADS categorization.
"""
* action[=] insert ACRMammographyReportingCitationDocumentationArtifact
* action[=] insert ACRMriReportingCitationDocumentationArtifact
* action[=] insert ACRUltrasoundReportingCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupBirads3Result"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads3ResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads3ResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads3ResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads3ResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads3ResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads3ResultTimingEvent"

RuleSet: FollowupBirads4Or5Result
* action[+].id = "FollowupBirads4Or5Result"
* action[=].title = "Refer for breast biopsy"
* action[=].description = """
Refer for breast biopsy.

Initial modality will typically be image-guided core needle biopsy (guided by mammography, ultrasound, or MRI). In certain conditions, an initial excisional biopsy may be preferable. These may include lesions anatomically unsuitable for needle biopsy or patient anatomic considerations. Refer to resulting Radiologist for recommendations.

In imaging findings that have previously been biopsied and found to be benign, consider referral for excisional biopsy if there have been suspicious interval changes in the lesion.
"""
* action[=] insert ACRMammographyReportingCitationDocumentationArtifact
* action[=] insert ACRMriReportingCitationDocumentationArtifact
* action[=] insert ACRUltrasoundReportingCitationDocumentationArtifact
* action[=] insert ASBrSExcisionalCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupBirads4Or5Result"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads4Or5ResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads4Or5ResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads4Or5ResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads4Or5ResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads4Or5ResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBirads4Or5ResultTimingEvent"

RuleSet: FollowupBenignBiopsyResult
* action[+].id = "FollowupBenignBiopsyResult"
* action[=].title = "Continue routine screening"
* action[=].description = """
Benign lesions without atypia or discordance with imaging can return to routine screening.

Certain specific benign histologies may require additional tissue, including mucin-producing lesions, potential phyllodes tumor, papillary lesions, or radial scars. Refer to pathologist for further recommendations.

Other specific histologies may be considered for excisional biopsy and can be referred to a breast surgeon for evaluation. These may include flat epithelial atypia [FEA], papillary and/or sclerosing lesion, and fibroepithelial lesions (fibroadenoma vs benign phyllodes tumor).
"""
* action[=] insert ASBrSRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupBenignBiopsyResult"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBenignBiopsyResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBenignBiopsyResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBenignBiopsyResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBenignBiopsyResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBenignBiopsyResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupBenignBiopsyResultTimingEvent"

RuleSet: FollowupAtypicalBiopsyResult
* action[+].id = "FollowupAtypicalBiopsyResult"
* action[=].title = "Refer to breast surgeon"
* action[=].description = """
Atypical fndings, including ADH and non-classic LCIS, should be referred for potential excision.

Atypical ductal hyperplasia (ADH) and non-classic lobular carcinoma in situ (LCIS), including pleomorphic or florid LCIS, should be referred to breast surgeon for potential excision.

Classic LCIS and atypical lobular hyperplasia (ALH) are typically candidates for observation with clinical and imaging follow-up but may benefit from excision in certain circumstances.
"""
* action[=] insert ASBrSRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupAtypicalBiopsyResult"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupAtypicalBiopsyResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupAtypicalBiopsyResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupAtypicalBiopsyResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupAtypicalBiopsyResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupAtypicalBiopsyResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupAtypicalBiopsyResultTimingEvent"

RuleSet: FollowupMalignantBiopsyResult
* action[+].id = "FollowupMalignantBiopsyResult"
* action[=].title = "Refer to breast cancer specialist"
* action[=].description = """
Referral to breast surgery or medical oncology as appropriate.
"""
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupMalignantBiopsyResult"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupMalignantBiopsyResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupMalignantBiopsyResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupMalignantBiopsyResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupMalignantBiopsyResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupMalignantBiopsyResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupMalignantBiopsyResultTimingEvent"

RuleSet: FollowupIndeterminateBiopsyResult
* action[+].id = "FollowupIndeterminateBiopsyResult"
* action[=].title = "Refer to breast surgeon"
* action[=].description = """
Indeterminate fndings should be referred for potential excisional biopsy.

A core needle biopsy specimen may be non-diagnostic for a number of reasons (insufficient material, lack of calcifications, hemorrhage).
"""
* action[=] insert ASBrSExcisionalCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupIndeterminateBiopsyResult"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupIndeterminateBiopsyResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupIndeterminateBiopsyResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupIndeterminateBiopsyResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupIndeterminateBiopsyResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupIndeterminateBiopsyResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupIndeterminateBiopsyResultTimingEvent"

RuleSet: FollowupDiscordantBiopsyResult
* action[+].id = "FollowupDiscordantBiopsyResult"
* action[=].title = "Refer to breast surgeon"
* action[=].description = """
Benign histology findings on core needle biopsy that are discordant with imaging findings should be referred for potential excisional biopsy.

A histologic result may be discordant if the pathology result does not account for imaging findings that are suspicious for malignancy. The designation of discordance may require input from radiologist, breast surgeon, and breast pathologist. 

A repeat needle biopsy may be considered if the initial biopsy procedure was felt to be inadequate. Refer to radiologist recommendations for guidance.
"""
* action[=] insert ASBrSRiskCitationDocumentationArtifact
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "NoErrorsHaveOccurred"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].condition[=].expression.expression = "ExistsFollowupDiscordantBiopsyResult"
* action[=].definitionCanonical = Canonical(BreastCancerScreeningServiceRequest|1.0.0)
* action[=].dynamicValue[+].path = "%action.code[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupDiscordantBiopsyResultCode"
* action[=].dynamicValue[+].path = "%action.timingTiming"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupDiscordantBiopsyResultTiming"
* action[=].dynamicValue[+].path = "%action.extension"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupDiscordantBiopsyResultFlag"
* action[=].dynamicValue[+].path = "code.coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupDiscordantBiopsyResultCode"
* action[=].dynamicValue[+].path = "reasonCode[0].coding[0]"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupDiscordantBiopsyResultReason"
* action[=].dynamicValue[+].path = "occurrenceDateTime"
* action[=].dynamicValue[=].expression.language = $EXLANG|4.0.1#text/cql-identifier "CQL Identifier"
* action[=].dynamicValue[=].expression.expression = "FollowupDiscordantBiopsyResultTimingEvent"