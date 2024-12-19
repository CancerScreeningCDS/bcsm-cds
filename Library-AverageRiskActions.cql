library AverageRiskActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0' called BCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'
codesystem "LOINC": 'http://loinc.org'

// Reason Codes
code "ACS average risk": 'ACSaveragerisk' from "ReasonCode" display 'ACS average risk'
code "USPSTF average risk": 'USPSTFaveragerisk' from "ReasonCode" display 'USPSTF average risk'

// Standard codes
code "MG Breast Screening": '24606-6' from "LOINC" display 'MG Breast Screening' 

context Patient

define mammo_annual:
  {
		code: "MG Breast Screening",
    timingTiming: {
      event: {ToString(@2025-01-25)}, //TODO: placeholder for testing nextduedate
      repeat: {
        frequency: 1,
        period: 1,
        periodUnit: 'a'
      }
    }
	} 

define mammo_biennial:
  {
		code: "MG Breast Screening",
    timingTiming: {
      event: {ToString(@2025-01-25)}, //TODO: placeholder for testing nextduedate
      repeat: {
        frequency: 1,
        period: 2,
        periodUnit: 'a'
      }
    }
	}   

//TODO: determine if any codes needed for Offer annual screening mammogram ages 40-44
define "act-acsavgrecs40":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_annual, "ACS average risk", {value: 40.0, code: 'a'})  

define "act-acsavgrecs45":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_annual, "ACS average risk", {value: 40.0, code: 'a'})  

define "act-acsavgrecs55":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_biennial, "ACS average risk", {value: 40.0, code: 'a'})  

define "act-uspstfavgrecs":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_biennial, "USPSTF average risk", {value: 40.0, code: 'a'})