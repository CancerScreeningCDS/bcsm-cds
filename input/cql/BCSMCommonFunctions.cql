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

library BCSMCommonFunctions version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include FHIRHelpers version '4.0.1' called FHIRHelpers
include CSMCommonFunctions version '1.0.0' called CSMCommonFunctions

codesystem "FlagCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/recommendation-flag-code-system'

code "OVERDUE" : 'overdue' from "FlagCode" display 'Overdue'
code "DUE" : 'due' from "FlagCode" display 'Due'
code "NOT DUE" : 'not-due' from "FlagCode" display 'Not due'
codesystem "cpg-activity-type-cs": 'http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-activity-type-cs'
code "Record an inference": 'record-inference' from "cpg-activity-type-cs" display 'Record an inference'

parameter "OverdueDefault" System.Quantity default 3 months
parameter "DueDefault" System.Quantity default 2 months
parameter "OverdueAnnual" System.Quantity default 2 months
parameter "DueAnnual" System.Quantity default 2 months
parameter "OverdueFollowup" System.Quantity default 90 days

context Patient

//------------------------------------------------------------------------------
// Recommendation model
//------------------------------------------------------------------------------

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
    event System.DateTime,
    repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}) 
    returns Tuple {code System.Code,reason System.Code,documentation Tuple{label System.String},timingAge Tuple{value Decimal, code String},
      timingTiming Tuple{event List<System.String>,repeat Tuple{boundsPeriod Tuple{start System.String},frequency System.Integer,period System.Decimal,periodUnit System.String}},
      flag System.Code
    }: 
  code C
  let startDate: if timingAge is not null then CalculateStartDateByAge(timingAge) else null,
  nextdue: if event is not null then event 
    else CalculateNextDueByCodeAndInterval(ToConcept(C), startDate, repeat),
  timingTiming: {
      event: {ToString(nextdue)},
      repeat: {
        boundsPeriod: {
          start: ToString(startDate)
        },
        frequency: repeat.frequency,
        period: repeat.period,
        periodUnit: repeat.periodUnit
      }
    },
  flag: EvaluateFlag(repeat, nextdue)    
  return      
  Tuple {
    code: C,
    reason: reason,
    documentation: documentation,
    timingAge: timingAge,
    timingTiming: timingTiming,
    flag: flag
  }

define function CalculateStartDateByAge(timingAge Tuple{value Decimal, code String}): 
  Patient.birthDate + System.Quantity{value: (timingAge.value), unit: FHIRHelpers.ToCalendarUnit(timingAge.code)}

define function SetFollowupRecommendation(          
    code System.Code,
    reason System.Code,
    documentation Tuple{label System.String},
    event System.DateTime)
    returns Tuple {code System.Code,reason System.Code,documentation Tuple{label System.String},
      timingTiming Tuple{event List<System.String>},
      flag System.Code
    }: 
  code C
  let nextdue: event,
  timingTiming: {
      event: {ToString(nextdue)}
    },
  flag: EvaluateFollowupFlag(nextdue)    
  return      
  Tuple {
    code: C,
    reason: reason,
    documentation: documentation,
    timingTiming: timingTiming,
    flag: flag
  }  

//------------------------------------------------------------------------------
// Calculated next due date
//------------------------------------------------------------------------------
//  +startDate, +repeat, +lastreport = use startDate if > lastreport else lastreport + repeat
//  +startDate, +repeat, -lastreport = use startDate
//  +startDate, -repeat, +lastreport = use startDate if > lastreport else no prediction (non-repeating and ?completed)
//  +startDate, -repeat, -lastreport = use startDate
//  -startDate, +repeat, +lastreport = use lastreport + repeat
//  -startDate, +repeat, -lastreport = use today
//  -startDate, -repeat, +lastreport = no prediction (non-repeating and ?completed)
//  -startDate, -repeat, -lastreport = use today
define function CalculateNextDueByCodeAndInterval(code Concept, 
    startDate DateTime,
    repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}):
  code C
  let lastReport: MostRecentDiagnosticReportByCode(C)
  return
    case
      // +startDate, +repeat, +lastReport
      when startDate is not null and RepeatIsValid(repeat) and lastReport is not null then
        if startDate > FHIRHelpers.ToDateTime(lastReport.effective) as DateTime then startDate 
        else date from AddIntervalToDateTime(FHIRHelpers.ToDateTime(lastReport.effective) as DateTime, repeat)
      // +startDate, +repeat, -lastReport
      when startDate is not null and RepeatIsValid(repeat) and lastReport is null then
        startDate
      // +startDate, -repeat, +lastReport
      when startDate is not null and repeat is null and lastReport is not null then
        if startDate > FHIRHelpers.ToDateTime(lastReport.effective) as DateTime then startDate else null
      // +startDate, -repeat, -lastReport
      when startDate is not null and repeat is null and lastReport is null then
        startDate
      // -startDate, +repeat, +lastReport
      when startDate is null and RepeatIsValid(repeat) and lastReport is not null then
        date from AddIntervalToDateTime(FHIRHelpers.ToDateTime(lastReport.effective) as DateTime, repeat)
      // -startDate, +repeat, -lastReport
      when startDate is null and RepeatIsValid(repeat) and lastReport is null then
        Today()
      // -startDate, -repeat, +lastReport
      when startDate is null and RepeatIsValid(repeat) is false and lastReport is not null then
        null
      // -startDate, -repeat, -lastReport
      when startDate is null and RepeatIsValid(repeat) is false and lastReport is null then
        Today()
      else null  
    end

define function RepeatIsValid(repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}):
  repeat.frequency is not null and repeat.period is not null and repeat.periodUnit is not null

define function MostRecentDiagnosticReportByCode(code Concept):
    CSMCommonFunctions.MostRecentDiagnosticReport(DiagnosticReportsByCode(code))
    
define function DiagnosticReportsByCode(concept Concept):
  [DiagnosticReport] R
    where R.code ~ concept  

define function MostRecentDiagnosticReportByVS(vs System.ValueSet):
    CSMCommonFunctions.MostRecentDiagnosticReport(DiagnosticReportsByVS(vs))

define function DiagnosticReportsByVS(vs System.ValueSet):
  [DiagnosticReport: vs] R

define function AddIntervalToDateTime(startDateTime System.DateTime, 
    repeat Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}):
  startDateTime + System.Quantity {
    value: (repeat.frequency * repeat.period) * 1.0,
    unit: FHIRHelpers.ToCalendarUnit(repeat.periodUnit)
  }

//------------------------------------------------------------------------------
// scheduled frequency
//------------------------------------------------------------------------------

define function EvaluateInterval(repeat Choice<FHIR.Timing.Repeat, Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}>):
  case
    when IntervalIsUnknown(repeat)
      then 'Unknown'
    when IntervalIsAnnual(repeat)
      then 'Annual'
    when IntervalIsBiennial(repeat)
      then 'Biennial'
    else 'Other'
  end

define function IntervalIsAnnual(repeat Choice<FHIR.Timing.Repeat, Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}>):
  if repeat.frequency.value = 1 and repeat.period.value = 1 and repeat.periodUnit.value = 'a' 
  then true else false

define function IntervalIsBiennial(repeat Choice<FHIR.Timing.Repeat, Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}>):
  if repeat.frequency.value = 1 and repeat.period.value = 2 and repeat.periodUnit.value = 'a' 
  then true else false

 define function IntervalIsUnknown(repeat Choice<FHIR.Timing.Repeat, Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}>):
  if repeat is null or repeat.frequency is null
  then true else false 

//------------------------------------------------------------------------------
// flag due/overdue
//------------------------------------------------------------------------------

define function EvaluateFlag(repeat Choice<FHIR.Timing.Repeat, Tuple{frequency System.Integer,period System.Decimal,periodUnit System.String}>, 
    nextDueDate DateTime):
  case
    when IntervalIsAnnual(repeat)
      then EvaluateFlagAnnual(nextDueDate)
    when IntervalIsBiennial(repeat)
      then EvaluateFlagBiennial(nextDueDate)
    else EvaluateFlagDefault(nextDueDate)
  end

define function EvaluateFlagDefault(nextDueDate DateTime):
  if nextDueDate < Today() - (OverdueDefault) then
    "OVERDUE"
  else if nextDueDate <= Today() + (DueDefault) and nextDueDate >= Today() - (OverdueDefault) then
    "DUE"
  else
    "NOT DUE"

define function EvaluateFlagBiennial(nextDueDate DateTime):
  EvaluateFlagDefault(nextDueDate)

define function EvaluateFlagAnnual(nextDueDate DateTime):
  if nextDueDate < (Today() - OverdueAnnual) then
    "OVERDUE"
  else if nextDueDate <= (Today() + DueAnnual) and nextDueDate >= (Today() - OverdueAnnual) then
    "DUE"
  else
    "NOT DUE" 

define function EvaluateFollowupFlag(nextDueDate DateTime):
  if nextDueDate < Today() - (OverdueFollowup) then
    "OVERDUE"
  else if nextDueDate <= Today() + (DueDefault) and nextDueDate >= Today() - (OverdueFollowup) then
    "DUE"
  else
    "NOT DUE"    

//------------------------------------------------------------------------------
// Create extension
//------------------------------------------------------------------------------
define function CreateExtension(url String, coding Code):
  {    
    url: url,
    valueCodeableConcept: {
      coding: { coding }
    } 
  }

define function CreateRecommendationFlagExtension(coding Code):
  {{    
    url: 'http://cancerscreeningcds.github.io/bcsm-cds/StructureDefinition/csm-recommendation-flag',
    valueCodeableConcept: {
      coding: { coding }
    } 
  }}

//------------------------------------------------------------------------------
// Group recommendations
//------------------------------------------------------------------------------

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

//------------------------------------------------------------------------------
// Diagnostic report results
//------------------------------------------------------------------------------
// Aggregate result codes -
//  DiagnosticReport.conclusionCode[]
//  Observatio.value where DiagnosticReport.result[].reference = Observation
//  Observatio.value where Observation.basedOn = DiagnosticReport.basedOn (request)

// if a DiagnosticReport.code has target code, then call original CollateConclusionCodes
// if a DiagnosticReport.code does not have target code, then return values from matched Observations
define function CollateConclusionCodes(D DiagnosticReport, ObsList List<Observation>, code System.Code):
  if FHIRHelpers.ToConcept(D.code) ~ code then
    CollateConclusionCodes(D, ObsList)
  else
    ValuesFromObservation(D, ObsList)  

define function CollateConclusionCodes(D DiagnosticReport, ObsList List<Observation>):
  D.conclusionCode union
  ValuesFromObservation(D, ObsList)

define function ValuesFromObservation(D DiagnosticReport, ObsList List<Observation>):
  (ObsList) O
  where
    Exists( (D.result ) R where Last(Split(R.reference,'/')) =  O.id ) or
    Exists( (O.basedOn) oB where AnyTrue((D.basedOn) dB return dB = oB ) )
  return O.value as FHIR.CodeableConcept

//------------------------------------------------------------------------------
// Local observations
//------------------------------------------------------------------------------  

define function MostRecentLocalObservation(observations List<FHIR.Observation>, encounter String, ObservationLookbackPeriod System.Quantity):
  C3F.MostRecent(
    (observations O where encounter is not null and O.encounter.reference = encounter)
    union
    (C3F.ObservationLookBack(
      observations,
      ObservationLookbackPeriod
    )) except { null }
  )

define function SortedObservations(obs List<FHIR.Observation>):
  obs o sort by Coalesce(
    (effective as FHIR.dateTime).value,
    (effective as FHIR.instant).value,
    (effective as FHIR.Period)."end".value,
    (effective as FHIR.Period)."start".value,
    (issued as FHIR.instant).value
  ) desc   

//------------------------------------------------------------------------------
// Service requests
//------------------------------------------------------------------------------
define function ServiceRequestsWithOrderIntent(requests List<ServiceRequest>):
  requests O
    where O.intent in {'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order'}  

define function ServiceRequestWithOrderIntent(request ServiceRequest):
  request.intent in {'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order'}