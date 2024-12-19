library SpecialPopulationsActions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0' called BCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'
codesystem "LOINC": 'http://loinc.org'

// Act Codes
code "Perform lifetime risk assessment": 'lifetimeriskassessment' from "ActCode" display 'Perform lifetime risk assessment'
// Reason Codes
code "High lifetime risk": 'highlifetimerisk' from "ReasonCode" display 'High lifetime risk'
code "First degree relative with genetic marker or syndrome": 'firstdeggenetic' from "ReasonCode" display 'First degree relative with genetic marker or syndrome'
code "BI-RADS breast density category C or D": 'breastdensitycord' from "ReasonCode" display 'BI-RADS breast density category C or D'
code "Compelling family history of breast cancer": 'fhxbreastcarisk' from "ReasonCode" display 'Compelling family history of breast cancer'
code "USPSTF average risk": 'USPSTFaveragerisk' from "ReasonCode" display 'USPSTF average risk'

// Standard codes
code "MG Breast Screening": '24606-6' from "LOINC" display 'MG Breast Screening' 
code "MR Breast": '30794-2' from "LOINC" display 'MR Breast' 

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

define mri_annual:
  {
		code: "MR Breast",
    timingTiming: {
      event: {ToString(@2025-01-25)}, //TODO: placeholder for testing nextduedate
      repeat: {
        frequency: 1,
        period: 1,
        periodUnit: 'a'
      }
    }
	}

define "act-acshighriskmammo":  
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_annual, "High lifetime risk", {value: 30.0, code: 'a'})  

define "act-acshighriskmri":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mri_annual, "High lifetime risk", {value: 30.0, code: 'a'})  

define "act-firstdeggeneticmammo":  
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_annual, "First degree relative with genetic marker or syndrome", {value: 30.0, code: 'a'})  

define "act-firstdeggeneticmri":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mri_annual, "First degree relative with genetic marker or syndrome", {value: 30.0, code: 'a'})    

define "act-breastdensitycord":
  {
		code: "Perform lifetime risk assessment",
    reason: "BI-RADS breast density category C or D"
	}  

define "act-fhxbreastcarisk":
  {
		code: "Perform lifetime risk assessment",
    reason: "Compelling family history of breast cancer"
	}   

define "act-uspstfrecs":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge(mammo_biennial, "USPSTF average risk", {value: 40.0, code: 'a'})  