library BCSMCommonFunctions version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include FHIRHelpers version '4.0.1' called FHIRHelpers

context Patient

define SourceDocumentationACS:
  {
    label: 'ACS'
  }

define SourceDocumentationUSPSTF:
  {
    label: 'USPSTF'
  }

define SourceDocumentationOther:
  {
    label: 'Other'
  }    

define function SetRecommendation(          
    code System.Code,
    reason System.Code,
    documentation Tuple{label System.String},
    timingAge Tuple{value Decimal, code String},
    event List<System.String>,
    repeat Tuple{frequency System.Integer,period System.Integer,periodUnit System.String}) 
    returns Tuple {code System.Code,reason System.Code,documentation Tuple{label System.String},timingAge Tuple{value Decimal, code String},
      timingTiming Tuple{event List<System.String>,repeat Tuple{boundsPeriod Tuple{start System.String},frequency System.Integer,period System.Integer,periodUnit System.String}}}: 
  Tuple {
    code: code,
    reason: reason,
    documentation: documentation,
    timingAge: timingAge,
    timingTiming: {
      event: event,
      repeat: {
        boundsPeriod: {
          start: ToString(Patient.birthDate + System.Quantity{value: timingAge.value, unit: FHIRHelpers.ToCalendarUnit(timingAge.code)})
        },
        frequency: repeat.frequency,
        period: repeat.period,
        periodUnit: repeat.periodUnit
      }
    }
  }

define function AggregateRecommendationsByCode(recommendations List<Choice<Tuple{code Code,reason Code}, 
  Tuple{code System.Code,reason System.Code,timingAge Tuple{value Decimal, code String},
    timingTiming Tuple{event List<String>,repeat Tuple{boundsPeriod Tuple{start System.String},frequency System.Integer,period System.Integer,periodUnit System.String}}}>>)
  returns List<Tuple{code Code, value List<Any>}>:
  // For each unique code, create a  Tuple with the code and the List of associated values
  distinct(recommendations.code) actCode
  return
  {
    code: actCode,
    value: recommendations R where R.code ~ actCode
  }   