library BCSMCommonFunctions version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include FHIRHelpers version '4.0.1' called FHIRHelpers

context Patient

define function SetRecommendationReasonTimingAge(
    recommendation Tuple{code System.Code,
      timingTiming Tuple{event List<System.String>,repeat Tuple{frequency System.Integer,period System.Integer,periodUnit System.String}}},
    reason System.Code,
    timingAge Tuple{value Decimal, code String}) 
    returns Tuple {code System.Code,reason System.Code,timingAge Tuple{value Decimal, code String},
      timingTiming Tuple{event List<System.String>,repeat Tuple{boundsPeriod Tuple{start System.String},frequency System.Integer,period System.Integer,periodUnit System.String}}}: 
  Tuple {
    code: recommendation.code,
    reason: reason,
    timingAge: timingAge,
    timingTiming: {
      event: recommendation.timingTiming.event,
      repeat: {
        boundsPeriod: {
          start: ToString(Patient.birthDate + System.Quantity{value: timingAge.value, unit: FHIRHelpers.ToCalendarUnit(timingAge.code)})
        },
        frequency: recommendation.timingTiming.repeat.frequency,
        period: recommendation.timingTiming.repeat.period,
        periodUnit: recommendation.timingTiming.repeat.periodUnit
      }
    }
  } 