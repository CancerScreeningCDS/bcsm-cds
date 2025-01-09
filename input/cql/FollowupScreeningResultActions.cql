library FollowupScreeningResultActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Determine next due date": 'determinenextdue' from "ActCode" display 'Determine next due date'
// Reason Codes
code "Screening complete": 'screeningcomplete' from "ReasonCode" display 'Screening complete'

context Patient

define "act-updateduedate":
  // TODO: replace this with next due date calculation
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}   

define "act-incompletescreen":
  // TODO: Implement logic for act-incompletescreen
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	} 

define "act-intervalscreen":
  // TODO: Implement logic for act-intervalscreen
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-biopsy":
  // TODO: Implement logic for act-biopsy
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-benignbiopsy":
  // TODO: Implement logic for act-benignbiopsy
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}

define "act-highriskreferral":
  // TODO: Implement logic for act-highriskreferral
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-indeterminatebiopsy":
  // TODO: Implement logic for act-indeterminatebiopsy
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-discordantbiopsy":
  // TODO: Implement logic for act-discordantbiopsy
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

define "act-oncreferral":
  // TODO: Implement logic for act-oncreferral
  {
		code: "Determine next due date",
    reason: "Screening complete",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}  

