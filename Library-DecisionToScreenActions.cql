library DecisionToScreenActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include HighRiskExclusions version '1.0.0'
include SpecialPopulations version '1.0.0'
include AverageRisk version '1.0.0'
include BCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

// Act Codes
code "Screening Next Due": 'screeningnextdue' from "ActCode" display 'Screening Next Due'
code "Discuss decision to continue screening": 'sdmcontinue' from "ActCode" display 'Shared decision making to continue screening'
code "Discuss delay in screening": 'sdmdelay' from "ActCode" display 'Shared decision making to consider delay in screening'
// Reason Codes
code "Age over 74 years": 'ageover74' from "ReasonCode" display 'Age over 74 years'
code "Reduced life expectancy indicator": 'lifeexp' from "ReasonCode" display 'Reduced life expectancy indicator'
code "Currently lactating": 'currentlylactating' from "ReasonCode" display 'Currently lactating'
code "USPSTF average risk": 'USPSTFaveragerisk' from "ReasonCode" display 'USPSTF average risk'

context Patient

define "act-sdmcontinueage":
  {
		code: "Discuss decision to continue screening",
    reason: "Age over 74 years",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}  

define "act-sdmcontinuelifexp":
  {
		code: "Discuss decision to continue screening",
    reason: "Reduced life expectancy indicator",
    documentation: BCSMCommonFunctions.SourceDocumentationACS
	} 

define "act-lactating":
  {
		code: "Discuss delay in screening",
    reason: "Currently lactating",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	} 

define "act-highriskexclusions":  
  HighRiskExclusions."flow-HighRiskExclusions"

define "act-specialpop":
  if exists "act-highriskexclusions"
  then SpecialPopulations."flow-SpecialPopulations" R where (R.reason ~ "USPSTF average risk") is false
  else SpecialPopulations."flow-SpecialPopulations"

define "act-avgrisk":  
  if not exists "act-highriskexclusions" and not exists "act-specialpop"
  then AverageRisk."flow-AverageRisk" 
  else null  

