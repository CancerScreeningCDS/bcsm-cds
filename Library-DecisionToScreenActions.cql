library DecisionToScreenActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Discuss decision to continue screening": 'sdmcontinue' from "ActCode" display 'Shared decision making to continue screening'
code "Discuss delay in screening": 'sdmdelay' from "ActCode" display 'Shared decision making to consider delay in screening'
// Reason Codes
code "Age over 74 years": 'ageover74' from "ReasonCode" display 'Age over 74 years'
code "Reduced life expectancy indicator": 'lifeexp' from "ReasonCode" display 'Reduced life expectancy indicator'
code "Currently lactating": 'currentlylactating' from "ReasonCode" display 'Currently lactating'

context Patient

define "act-sdmcontinueage":
  {
		code: "Discuss decision to continue screening",
    reason: "Age over 74 years"
	}  

define "act-sdmcontinuelifexp":
  {
		code: "Discuss decision to continue screening",
    reason: "Reduced life expectancy indicator"
	} 

define "act-lactating":
  {
		code: "Discuss delay in screening",
    reason: "Currently lactating"
	} 

define "act-highriskexclusions":
  // TODO: Implement logic for eve-highriskexclusions
  {}

define "act-specialpop":
  // TODO: Implement logic for eve-specialpop
  {}  

define "act-avgrisk":
  // TODO: Implement logic for act-avgrisk
  {}

