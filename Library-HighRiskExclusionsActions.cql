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
    reason: "Other genetic marker or syndrome associated with breast cancer",
    documentation: BCSMCommonFunctions.SourceDocumentationACS
	}  

define "act-acshighriskmammo":
  {
		code: "MG Breast Screening",
    timingTiming: {
      event: {},
      repeat: {
        frequency: 1,
        period: 1.0,
        periodUnit: 'a'
      }
    }
	} 

define "act-acshighriskmri":
  {
		code: "MR Breast",
    timingTiming: {
      event: {},
      repeat: {
        frequency: 1,
        period: 1.0,
        periodUnit: 'a'
      }
    }
	} 

define "act-acsgeneticriskmammo":
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmammo".code, "Genetic risk exclusion", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: 30.0, code: 'a'}, {}, "act-acshighriskmammo".timingTiming.repeat)    

define "act-acsgeneticriskmri":
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmri".code, "Genetic risk exclusion", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: 30.0, code: 'a'}, {}, "act-acshighriskmri".timingTiming.repeat)    

define "act-acsmammoafterRT":
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmammo".code, "History of chest radiation ages 10-30 y", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: Ageatleast25and8yafterRT, code: 'a'}, {}, "act-acshighriskmammo".timingTiming.repeat) 

define "act-acsmriafterRT":
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmri".code, "History of chest radiation ages 10-30 y", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: Ageatleast25and8yafterRT, code: 'a'}, {}, "act-acshighriskmri".timingTiming.repeat) 

define "act-acsmammoafterbrca":
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmammo".code, "Previous breast cancer", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: AgeInYears() * 1.0, code: 'a'}, {}, "act-acshighriskmammo".timingTiming.repeat) 

define "act-hxbreastcawithin5y":
  {
		code: "Refer to specialist recommendations",
    reason: "Breast cancer in remission < 5 years",
    documentation: BCSMCommonFunctions.SourceDocumentationOther
	}

define "act-acsmammoatypicalbx":
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmammo".code, "Atypical biopsy high lifetime risk", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: AgeInYears() * 1.0, code: 'a'}, {}, "act-acshighriskmammo".timingTiming.repeat)   

define "act-acsmriatypicalbx":  
  BCSMCommonFunctions.SetRecommendation("act-acshighriskmri".code, "Atypical biopsy high lifetime risk", 
    BCSMCommonFunctions.SourceDocumentationACS, 
    {value: AgeInYears() * 1.0, code: 'a'}, {}, "act-acshighriskmri".timingTiming.repeat)   

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