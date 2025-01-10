library FollowupScreeningResultEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements
include CSMCommonFunctions version '1.0.0' called CSMCommonFunctions

//TODO: validate if this STU1 IG is valid to reference for CS
codesystem "BiRadsAssessmentCategoriesCS": 'http://hl7.org/fhir/us/breast-radiology/CodeSystem/BiRadsAssessmentCategoriesCS'
codesystem "BiopsyResultCS": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/biopsy-result-observation-code-system'

code "Category0": 'Category0' from "BiRadsAssessmentCategoriesCS" display 'Category 0 (Incomplete)'
code "Category2": 'Category2' from "BiRadsAssessmentCategoriesCS" display 'Category 2 (Benign)'
code "Category3": 'Category3' from "BiRadsAssessmentCategoriesCS" display 'Category 3 (Probably Benign)'
code "Category4": 'Category4' from "BiRadsAssessmentCategoriesCS" display 'Category 4 (Suspicious)'
code "Category4A": 'Category4A' from "BiRadsAssessmentCategoriesCS" display 'Category 4A (Low suspicion)'
code "Category4B": 'Category4B' from "BiRadsAssessmentCategoriesCS" display 'Category 4B (Moderate suspicion)'
code "Category4C": 'Category4C' from "BiRadsAssessmentCategoriesCS" display 'Category 4C (High suspicion)'
code "Category5": 'Category5' from "BiRadsAssessmentCategoriesCS" display 'Category 5 (Highly Suggestive of Malignancy)'
code "Category6": 'Category6' from "BiRadsAssessmentCategoriesCS" display 'Category 6 (Known Biopsy-Proven Malignancy)'
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
    let cC: DataElements.CollateConclusionCodes(D,DataElements.BreastImagingObservations)
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
    let cC: DataElements.CollateConclusionCodes(D,DataElements.BiopsyObservations)
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
