library ScreeningEligibleActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements

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
    result: true,
		code: "Eligible for screening",
    reason: "Eligible for screening reason"
	}

define "end-noteligible-notassignedfemaleatbirth":
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Not assigned female at birth"
	}

define "end-noteligible-currentbreastcancer":
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Current breast cancer"
	}  

define "end-noteligible-bilatmastectomy":  
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Bilateral mastectomy"
	} 

define "act-dxtesting":
  {
    result: false,
		code: "Not eligible for screening",
    reason: "Diagnostic testing"
	} 

