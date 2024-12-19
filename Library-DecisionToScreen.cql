library DecisionToScreen version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DecisionToScreenEvents version '1.0.0' called Events
include DecisionToScreenActions version '1.0.0' called Actions

codesystem "cpg-activity-type-cs": 'http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-activity-type-cs'
code "Record an inference": 'record-inference' from "cpg-activity-type-cs" display 'Record an inference'

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-DecisionToScreen":  
  flatten({
    ({SDMContinueScreeningAge} except { null }),
    ({SDMContinueScreeningLifeExp} except { null }),
    HighRiskExclusions except { null },
    SpecialPopulations except { null },
    ({SDMDelayScreeningLactating} except { null }),
    (if Count(HighRiskExclusions) = 0 and Count(SpecialPopulations) = 0
        then Actions."act-avgrisk" else null)
  })
  except { null }

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
    then Actions."act-sdmcontinuelifexp" as Tuple{code Code, reason Code}
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

define SDMDelayScreeningLactating:
  if Count(Actions."act-highriskexclusions") = 0 and Count(Actions."act-specialpop") = 0
      and Events."eve-lactating" is true
    then Actions."act-lactating" as Tuple{code Code, reason Code}
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
