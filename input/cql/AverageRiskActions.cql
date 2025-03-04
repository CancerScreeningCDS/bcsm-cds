/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2024 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library AverageRiskActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0' called BCSMCommon

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "LOINC": 'http://loinc.org'

// Reason Codes
code "ACS average risk": 'ACSaveragerisk' from "LOCAL" display 'ACS average risk'
code "USPSTF average risk": 'USPSTFaveragerisk' from "LOCAL" display 'USPSTF average risk'

// Standard codes
code "MG Breast Screening": '24606-6' from "LOINC" display 'MG Breast Screening' 

context Patient

define mammo_annual:
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

define mammo_biennial:
  {
		code: "MG Breast Screening",
    timingTiming: {
      event: {},
      repeat: {
        frequency: 1,
        period: 2.0,
        periodUnit: 'a'
      }
    }
	}   

define "act-acsavgrecs40":
  BCSMCommon.SetRecommendation(mammo_annual.code, "ACS average risk", 
    BCSMCommon.SourceDocumentationACS, {value: 40.0, code: 'a'}, null, mammo_annual.timingTiming.repeat)  

define "act-acsavgrecs45":
  BCSMCommon.SetRecommendation(mammo_annual.code, "ACS average risk", 
    BCSMCommon.SourceDocumentationACS, {value: 40.0, code: 'a'}, null, mammo_annual.timingTiming.repeat)    

define "act-acsavgrecs55":
  BCSMCommon.SetRecommendation(mammo_biennial.code, "ACS average risk", 
    BCSMCommon.SourceDocumentationACS, {value: 40.0, code: 'a'}, null, mammo_biennial.timingTiming.repeat)    

define "act-uspstfavgrecs":
  BCSMCommon.SetRecommendation(mammo_biennial.code, "USPSTF average risk", 
    BCSMCommon.SourceDocumentationUSPSTF, {value: 40.0, code: 'a'}, null, mammo_biennial.timingTiming.repeat)