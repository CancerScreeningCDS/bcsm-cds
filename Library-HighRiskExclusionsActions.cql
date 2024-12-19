library HighRiskExclusionsActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0' called BCSMCommonFunctions

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'
codesystem "LOINC": 'http://loinc.org'

// Act Codes
code "Refer to specialist recommendations": 'specialtyreferral' from "ActCode" display 'Refer to specialist recommendations'
// Reason Codes
code "Other genetic marker or syndrome associated with breast cancer": 'othergeneticrisk' from "ReasonCode" display 'Other genetic marker or syndrome associated with breast cancer'
code "Genetic risk exclusion": 'geneticriskexclusion' from "ReasonCode" display 'Genetic risk exclusion'
code "History of chest radiation ages 10-30 y": 'chestxrt' from "ReasonCode" display 'History of chest radiation ages 10-30 y'
code "Previous breast cancer": 'hxbreastca' from "ReasonCode" display 'Previous breast cancer'
code "Breast cancer in remission < 5 years": 'hxbreastcawithin5y' from "ReasonCode" display 'Breast cancer in remission < 5 years'
code "Atypical biopsy high lifetime risk": 'atypicalbxhighlifetimerisk' from "ReasonCode" display 'Atypical biopsy high lifetime risk'

// Standard codes
code "MG Breast Screening": '24606-6' from "LOINC" display 'MG Breast Screening' 
code "MR Breast": '30794-2' from "LOINC" display 'MR Breast' 

context Patient

define "act-othergeneticrisk":
  {
		code: "Refer to specialist recommendations",
    reason: "Other genetic marker or syndrome associated with breast cancer"
	}  

define "act-acshighriskmammo":
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

define "act-acshighriskmri":
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

define "act-acsgeneticriskmammo":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmammo", "Genetic risk exclusion", {value: 30.0, code: 'a'})  

define "act-acsgeneticriskmri":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmri", "Genetic risk exclusion", {value: 30.0, code: 'a'})  

define "act-acsmammoafterRT":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmammo", "History of chest radiation ages 10-30 y", {value: Ageatleast25and8yafterRT, code: 'a'})

define "act-acsmriafterRT":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmri", "History of chest radiation ages 10-30 y", {value: Ageatleast25and8yafterRT, code: 'a'})  

define "act-acsmammoafterbrca":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmammo", "Previous breast cancer", {value: AgeInYears() * 1.0, code: 'a'})

define "act-hxbreastcawithin5y":
  {
		code: "Refer to specialist recommendations",
    reason: "Breast cancer in remission < 5 years"
	}

define "act-acsmammoatypicalbx":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmammo", "Atypical biopsy high lifetime risk", {value: AgeInYears() * 1.0, code: 'a'})  

define "act-acsmriatypicalbx":
  BCSMCommonFunctions.SetRecommendationReasonTimingAge("act-acshighriskmri", "Atypical biopsy high lifetime risk", {value: AgeInYears() * 1.0, code: 'a'})  

define "RadiationTherapyCompletionAge":
  First(DataElements."de-chestxrtage10to30" C).abatement as Age //TODO: support for other choice types (dateTime, Period, etc)
  // note these can't be sorted by abatement due to choice types

//TODO: handling for unavailable dates
define Ageatleast25and8yafterRT:
  if 25 years < Age8yafterRT then
    Age8yafterRT.value
  else
    25  

define Age8yafterRT:    
  "RadiationTherapyCompletionAge" + 8 years