library FollowupScreeningResultEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements
include CSMCommonFunctions version '1.0.0' called CSMCommonFunctions
include BCSMCommonFunctions version '1.0.0' called BCSMCommon

//TODO: validate if this STU1 IG is valid to reference for CS
codesystem "BiRadsAssessmentCategoriesCS": 'http://hl7.org/fhir/us/breast-radiology/CodeSystem/RadLexCDE'
codesystem "BiopsyResultCS": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/biopsy-result-observation-code-system'

code "Category0": 'RDE1586_category0IncompleteNeedAdditionalImaging' from "BiRadsAssessmentCategoriesCS" display 'category0needadditionalimaging'
code "Category2": 'RDE1586_category2BenignFinding' from "BiRadsAssessmentCategoriesCS" display 'category2,benignfinding'
code "Category3": 'RDE1586_category3ProbablyBenignFinding' from "BiRadsAssessmentCategoriesCS" display 'category3,probablybenignfinding'
code "Category4": 'RDE1586_category4SuspiciousAbnormality' from "BiRadsAssessmentCategoriesCS" display 'category4,suspiciousabnormality'
code "Category4A": 'RDE1586_category4ASuspiciousAbnormalityLowLikelihoodOfBeingCancer' from "BiRadsAssessmentCategoriesCS" display 'category4A,suspiciousabnormalitylowlikelihoodofbeingcancer'
code "Category4B": 'RDE1586_category4BSuspiciousAbnormalityModerateLikelihoodOfBeingCancer' from "BiRadsAssessmentCategoriesCS" display 'category 4B,suspiciousabnormality-moderatelikelihoodofbeingcancer'
code "Category4C": 'RDE1586_category4CSuspiciousAbnormalityHighLikelihoodOfBeingCancer' from "BiRadsAssessmentCategoriesCS" display 'category4C,suspiciousabnormality-highlikelihoodofbeingcancer'
code "Category5": 'RDE1586_category5HighlySuggestiveOfMalignancy' from "BiRadsAssessmentCategoriesCS" display 'category5,highlysuggestiveofmalignancy'
code "Category6": 'RDE1586_category6KnownBiopsyProvenMalignancy' from "BiRadsAssessmentCategoriesCS" display 'category6,knownbiopsy-provenmalignancy'
code "Negative": 'Negative' from BiopsyResultCS display 'Normal breast tissue'
code "Benign": 'Benign' from BiopsyResultCS display 'Benign breast finding'
code "Atypical": 'Atypical' from BiopsyResultCS display 'Atypical breast finding'
code "Malignant": 'Malignant' from BiopsyResultCS display 'Malignant breast finding'
code "Indeterminate": 'Indeterminate' from BiopsyResultCS display 'Indeterminate breast finding'
code "Discordant": 'Discordant' from BiopsyResultCS display 'Discordant breast finding'

context Patient

define "eve-latesttesttype":
  LatestTestType

define "eve-actionablebirads":
  (MostRecentBreastImagingBiradsResult ~ "Category2") is false

// TODO: error handling for cases where report has no result annotations
define "eve-biradsscore":
  MostRecentBreastImagingBiradsResult

// TODO: error handling for cases where report has no result annotations
define "eve-biopsyresult":
  MostRecentBreastBiopsyResult

define LatestTestType:
if MostRecentBreastImagingDate is null and MostRecentBreastBiopsyDate is null
  then null
else if MostRecentBreastBiopsyDate is null
  then 'imaging'
else if MostRecentBreastImagingDate is null
  then 'biopsy'
else if MostRecentBreastImagingDate after MostRecentBreastBiopsyDate
  then 'imaging'
else 'biopsy'

define MostRecentBreastImagingDate:
  CSMCommonFunctions.DiagnosticReportDate(DataElements.MostRecentBreastImagingDiagnosticReport) 

define MostRecentBreastBiopsyDate:
  CSMCommonFunctions.DiagnosticReportDate(DataElements.MostRecentBreastBiopsyDiagnosticReport)

define MostRecentBreastImagingBiradsResult:
  BreastImagingBiradsResult(DataElements.MostRecentBreastImagingDiagnosticReport)

define function BreastImagingBiradsResult(report DiagnosticReport):
  report D
    let cC: BCSMCommon.CollateConclusionCodes(D,DataElements.BreastImagingObservations)
    return First(
      cC.coding C
        let c: FHIRHelpers.ToCode(C)
        where 
          c ~ "Category0"
          or c ~ "Category2"
          or c ~ "Category3"
          or c ~ "Category4"     
          or c ~ "Category4A"
          or c ~ "Category4B"
          or c ~ "Category4C"
          or c ~ "Category5"
          or c ~ "Category6"
        return c  
    ) 

define MostRecentBreastBiopsyResult:
  BreastBiopsyResult(DataElements.MostRecentBreastBiopsyDiagnosticReport)  

define function BreastBiopsyResult(report DiagnosticReport):
  report D
    let cC: BCSMCommon.CollateConclusionCodes(D,DataElements.BiopsyObservations)
    return First(
      cC.coding C
        let c: FHIRHelpers.ToCode(C)
        where 
          c ~ "Negative"
          or c ~ "Benign"
          or c ~ "Atypical"
          or c ~ "Malignant"     
          or c ~ "Indeterminate"
          or c ~ "Discordant"
        return c  
    )  
