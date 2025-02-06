library ScreeningDueActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'

// Act Codes
code "Determine next due date": 'determinenextdue' from "ActCode" display 'Determine next due date'
// Reason Codes
code "Age 40-74 without screening in past 27 months": 'noscreening27mo' from "LOCAL" display 'Age 40-74 without screening in past 27 months'

context Patient

define "act-determinedue":
  {
		code: "Determine next due date",
    reason: "Age 40-74 without screening in past 27 months",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	} 