library DecisionToScreen version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DecisionToScreenEvents version '1.0.0' called Events
include DecisionToScreenActions version '1.0.0' called Actions

codesystem "cpg-activity-type-cs": 'http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-activity-type-cs'
codesystem "LOINC": 'http://loinc.org'

code "Record an inference": 'record-inference' from "cpg-activity-type-cs" display 'Record an inference'
code "MG Breast Screening": '24606-6' from "LOINC" display 'MG Breast Screening' 
code "MR Breast": '30794-2' from "LOINC" display 'MR Breast' 

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-DecisionToScreen":  
  flatten({
    {SDMContinueScreeningAge} except { null },
    {SDMContinueScreeningLifeExp} except { null },
    HighRiskExclusions except { null },
    SpecialPopulations except { null },
    {SDMDelayScreeningLactating} except { null },
    AverageRisk except { null }
  })
  except { null }

define ExistsMammogramRecommendations:
  exists "flow-DecisionToScreen" R where R.code ~ "MG Breast Screening"

define ExistsMriRecommendations:
  exists "flow-DecisionToScreen" R where R.code ~ "MR Breast"  

define SDMContinueScreeningAge:
  if Events."eve-AgeOver74" is true
    then Actions."act-sdmcontinueage"
    else null

define ExistsSDMContinueScreeningAge:
  SDMContinueScreeningAge is not null

define SDMContinueScreeningAgeCode:
  SDMContinueScreeningAge.code

define SDMContinueScreeningAgeReason:
  SDMContinueScreeningAge.reason

define SDMContinueScreeningLifeExp:
  if Events."eve-LifeExp" is true
    then Actions."act-sdmcontinuelifexp"
    else null

define ExistsSDMContinueScreeningLifeExp:
  SDMContinueScreeningLifeExp is not null

define SDMContinueScreeningLifeExpCode:
  SDMContinueScreeningLifeExp.code  

define SDMContinueScreeningLifeExpReason:
  SDMContinueScreeningLifeExp.reason  

define HighRiskExclusions:
  Actions."act-highriskexclusions"  

define SpecialPopulations:
  Actions."act-specialpop"

define AverageRisk:  
  Actions."act-avgrisk" 

define SDMDelayScreeningLactating:
  if not exists HighRiskExclusions
      and Events."eve-lactating" is true
  then Actions."act-lactating"
  else null

define ExistsSDMDelayScreeningLactating:
  SDMDelayScreeningLactating is not null

define SDMDelayScreeningLactatingCode:
  SDMDelayScreeningLactating.code   

define SDMDelayScreeningLactatingReason:
  SDMDelayScreeningLactating.reason

define InferenceCode:
  "Record an inference"   

define InferenceObservation:
  CreateObservation(Actions."Screening Next Due", FHIR.dateTime {value: Now()}) 
  
define function CreateObservation(code System.Code, value FHIR.dateTime):
  FHIR.Observation {
    status: ObservationStatus{value: 'final'},
    issued: FHIR.instant{value: Now()},
    subject: FHIR.Reference {reference: FHIR.string { value: 'Patient/' + Patient.id }},
    code: FHIR.CodeableConcept {
      coding: {
        FHIR.Coding {
          system: FHIR.uri { value: code.system},
          code: FHIR.code { value: code.code },
          display: FHIR.string { value: code.display }
        }
      }
    },    
    value: value
  }
