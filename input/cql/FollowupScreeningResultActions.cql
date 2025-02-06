library FollowupScreeningResultActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "BiRadsAssessmentCategoriesCS": 'http://hl7.org/fhir/us/breast-radiology/CodeSystem/RadLexCDE'
codesystem "BiopsyResultCS": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/biopsy-result-observation-code-system'

// Act Codes
code "Determine next due date": 'determinenextdue' from "ActCode" display 'Determine next due date'
code "Follow-up radiologist recommendations": 'radiologyrecs' from "ActCode" display 'Follow-up radiologist recommendations'
code "Order interval imaging": 'intervalscreen' from "ActCode" display 'Order interval imaging'
code "Breast biopsy": 'breastbiopsy' from  "ActCode" display 'Breast biopsy'
code "High risk referral": 'highriskreferral' from  "ActCode" display 'High risk referral'
code "Indeterminate breast biopsy referral": 'indeterminatebreastbiopsy' from  "ActCode" display 'Indeterminate breast biopsy referral'
code "Discordant breast biopsy referral": 'discordantbreastbiopsy' from  "ActCode" display 'Discordant breast biopsy referral'
code "Oncologic referral": 'oncreferral' from  "ActCode" display 'Oncologic referral'
// Reason Codes
code "Screening complete": 'screeningcomplete' from "LOCAL" display 'Screening complete'
code "Category0": 'RDE1586_category0IncompleteNeedAdditionalImaging' from "BiRadsAssessmentCategoriesCS" display 'category0needadditionalimaging'
code "Category3": 'RDE1586_category3ProbablyBenignFinding' from "BiRadsAssessmentCategoriesCS" display 'category3,probablybenignfinding'
code "Category4": 'RDE1586_category4SuspiciousAbnormality' from "BiRadsAssessmentCategoriesCS" display 'category4,suspiciousabnormality'
code "Category5": 'RDE1586_category5HighlySuggestiveOfMalignancy' from "BiRadsAssessmentCategoriesCS" display 'category5,highlysuggestiveofmalignancy'
code "Negative": 'Negative' from BiopsyResultCS display 'Normal breast tissue'
code "Benign": 'Benign' from BiopsyResultCS display 'Benign breast finding'
code "Atypical": 'Atypical' from BiopsyResultCS display 'Atypical breast finding'
code "Malignant": 'Malignant' from BiopsyResultCS display 'Malignant breast finding'
code "Indeterminate": 'Indeterminate' from BiopsyResultCS display 'Indeterminate breast finding'
code "Discordant": 'Discordant' from BiopsyResultCS display 'Discordant breast finding'

context Patient

// TODO: add timing to these to trigger 90 day overdue for HEDIS

define "act-updateduedate":
  // TODO: replace this with next due date calculation
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}   

define "act-incompletescreen":
  {
		code: "Follow-up radiologist recommendations",
    reason: "Category0",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	} 

define "act-intervalscreen":
  {
		code: "Order interval imaging",
    reason: "Category3",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-biopsy4":
  {
		code: "Breast biopsy",
    reason: "Category4",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-biopsy5":
  {
		code: "Breast biopsy",
    reason: "Category5",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}    

define "act-benignbiopsy":
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}

define "act-highriskreferral":
  {
		code: "High risk referral",
    reason: "Atypical",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-indeterminatebiopsy":
  {
		code: "Indeterminate breast biopsy referral",
    reason: "Indeterminate",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}

define "act-discordantbiopsy":
  {
		code: "Discordant breast biopsy referral",
    reason: "Discordant",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-oncreferral":
  {
		code: "Oncologic referral",
    reason: "Malignant",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

