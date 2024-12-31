library ScreeningEligibleActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0' called BCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Eligible for screening": 'eligible' from "ActCode" display 'Eligible for screening'
code "Not eligible for screening": 'noteligible' from "ActCode" display 'Not eligible for screening'
// Reason Codes
code "Eligible for screening reason": 'eligibleforscreening' from "ReasonCode" display 'Eligible for screening'
code "Not assigned female at birth": 'notassignedfemaleatbirth' from "ReasonCode" display 'Not assigned female at birth'
code "Current breast cancer": 'currentbreastcancer' from "ReasonCode" display 'Current breast cancer'
code "Bilateral mastectomy":  'bilatmastectomy' from "ReasonCode" display 'Bilateral mastectomy'
code "Diagnostic testing":  'diagtesting' from "ReasonCode" display 'Diagnostic testing'

context Patient

define "act-eligible":
  {
		code: "Eligible for screening",
    reason: "Eligible for screening reason",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}

define "end-noteligible-notassignedfemaleatbirth":
  {    
		code: "Not eligible for screening",
    reason: "Not assigned female at birth",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}

define "end-noteligible-currentbreastcancer":
  {
		code: "Not eligible for screening",
    reason: "Current breast cancer",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}  

define "end-noteligible-bilatmastectomy":  
  {
		code: "Not eligible for screening",
    reason: "Bilateral mastectomy",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	} 

define "act-dxtesting":
  {
		code: "Not eligible for screening",
    reason: "Diagnostic testing",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	} 

