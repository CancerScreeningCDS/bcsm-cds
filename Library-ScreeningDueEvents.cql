library ScreeningDueEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CSMCommonFunctions version '1.0.0' called CSMCommonFunctions
include BCSMCommonFunctions version '1.0.0' called BCSMCommonFunctions

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED": 'http://snomed.info/sct'

// Standard codes
code "Breast cancer screening": '268547008' from "SNOMED" display 'Breast cancer screening'
code "MG Breast Screening": '24606-6' from "LOINC" display 'MG Breast Screening' 
code "MR Breast": '30794-2' from "LOINC" display 'MR Breast' 

context Patient

//calculated nextdue logic:
//  +duedate, -interval, -lastreport or +lastreport < duedate = use duedate
//  +duedate, +interval, -lastreport or +lastreport < duedate = use duedate
//  +duedate, -interval, +lastreport > duedate = no prediction
//  +duedate, +interval, +lastreport > duedate = use lastreport + interval
//  -duedate = use CalculateNextDueByCodeAndInterval
// mammogram only and in age range:
//  +duedate, -interval, +lastreport > duedate = use lastreport + 24mos
//  -duedate, -interval, +lastreport = use lastreport + 24mos
//  no activity = use today
//return{
//  activity: Faction
//  activityCode: action.code
//  nextdue: calculated date
//  scheduleddue: action.timingTiming.event
//  scheduledstart: action.timingTiming.repeat.boundsPeriod.start
//  scheduledrepeat: action.timingTiming.repeat
//  lastReportDate: DiagnosticReport date
//  flag: "NOT DUE", "DUE", "OVERDUE", none
//}

define "eve-nextdueexists":
  ActivityScheduledDate(MammogramScheduledActivity.timing) is not null

define "eve-due":
  CarePlanActivitiesDue A where A.flag in {'DUE', 'OVERDUE'}

define CarePlanActivitiesDue:
  BreastCancerScreeningActivities A
  let lastReport: BCSMCommonFunctions.MostRecentDiagnosticReportByCode(First(A.code)),
  lastReportDate: FHIRHelpers.ToDateTime(lastReport.effective) as DateTime,
  nextdue: CalculateActivityNextDue(A)
  return {
    activity: A,
    activityCode: A.code,
    nextDue: nextdue,
    scheduledDue: ActivityScheduledDate(A.timing),
    scheduledStart: ((A.timing as Timing).repeat.bounds as Period).start,
    scheduledRepeat: (A.timing as Timing).repeat,
    lastReportDate: lastReportDate,
    flag: EvaluateFlag(A.timing as FHIR.Timing, nextdue)
  } 

//------------------------------------------------------------------------------
// calculated next due
//------------------------------------------------------------------------------

define function CalculateActivityNextDue(action FHIR.RequestGroup.Action):
  action A
  let lastReport: BCSMCommonFunctions.MostRecentDiagnosticReportByCode(First(A.code)),
  lastReportDate: FHIRHelpers.ToDateTime(lastReport.effective) as DateTime,
  duedate: ActivityScheduledDate(A.timing),
  repeat: Tuple{frequency: FHIRHelpers.ToInteger((A.timing as Timing).repeat.frequency),
        period: FHIRHelpers.ToDecimal((A.timing as Timing).repeat.period),
        periodUnit: FHIRHelpers.ToString((A.timing as Timing).repeat.periodUnit)}
  return
    case
      // -duedate = use CalculateNextDueByCodeAndInterval
      when duedate is null then 
        BCSMCommonFunctions.CalculateNextDueByCodeAndInterval(
          First(A.code), 
          FHIRHelpers.ToDateTime(((A.timing as Timing).repeat.bounds as Period).start),
          repeat)
      // +duedate, -repeat, -lastreport or +lastreport < duedate = use duedate
      when BCSMCommonFunctions.RepeatIsValid(repeat) is false and (lastReport is null or lastReportDate < duedate) then duedate
      // +duedate, +repeat, -lastreport or +lastreport < duedate = use duedate
      when BCSMCommonFunctions.RepeatIsValid(repeat) and (lastReport is null or lastReportDate < duedate) then duedate
      // +duedate, -repeat, +lastreport > duedate = no prediction
      when BCSMCommonFunctions.RepeatIsValid(repeat) is false and lastReport is not null and lastReportDate > duedate then null
      // +duedate, +repeat, +lastreport > duedate = use lastreport + repeat
      when BCSMCommonFunctions.RepeatIsValid(repeat) and lastReport is not null and lastReportDate > duedate then
        date from BCSMCommonFunctions.AddIntervalToDateTime(lastReportDate, repeat)
      // Default case if none of the above conditions are met      
      else null
    end    

//------------------------------------------------------------------------------
// Care plan/Request group
//------------------------------------------------------------------------------

define BreastCancerScreeningRequestGroup:
  if MostRecentActiveBreastCancerScreeningCarePlan.activity[0].reference.reference is not null
    and StartsWith(MostRecentActiveBreastCancerScreeningCarePlan.activity[0].reference.reference,'RequestGroup/')
  then
    FHIRHelpers.resolve(MostRecentActiveBreastCancerScreeningCarePlan.activity[0].reference) as FHIR.RequestGroup
  else null      

define BreastCancerScreeningCarePlan:
  MostRecentActiveBreastCancerScreeningCarePlan

define MostRecentActiveBreastCancerScreeningCarePlan:
  Last(ActiveBreastCancerScreeningCarePlans C sort by Coalesce(
    start of period,
    created)
  )      

define ActiveBreastCancerScreeningCarePlans:
  [CarePlan] C
    where C.status in {'active', 'draft'}
      and exists C.category cat where cat ~ "Breast cancer screening"   

//------------------------------------------------------------------------------
// Activity
//------------------------------------------------------------------------------

define MammogramScheduledActivity:
  NextScheduledActivityByCode(BreastCancerScreeningActivities, "MG Breast Screening")    

define BreastCancerScreeningActivities:
  BreastCancerScreeningRequestGroup.action A

define function NextScheduledActivityByCode(activities List<FHIR.RequestGroup.Action>, code Code):
  NextScheduledActivity(activities A where exists A.code C where C ~ ToConcept(code))

define function NextScheduledActivity(activities List<FHIR.RequestGroup.Action>):
  Last(activities A sort by ActivityScheduledDate(timing))

//------------------------------------------------------------------------------
// scheduled due date
//------------------------------------------------------------------------------

define function ActivityScheduledDate(timing Choice<FHIR.Timing,FHIR.Period>):
  Coalesce(
    MostRecentTimingEvent(timing as FHIR.Timing),
    (timing as FHIR.Period)."start".value,
    (timing as FHIR.Period)."end".value
  )

define function MostRecentTimingEvent(timing FHIR.Timing):
  Last(timing.event E sort asc).value 

//------------------------------------------------------------------------------
// scheduled frequency
//------------------------------------------------------------------------------

define function TimingIsAnnual(timing FHIR.Timing):
  if timing.repeat.frequency = 1 and timing.repeat.period = 1 and timing.repeat.periodUnit = 'a' 
  then true else false

define function TimingIsBiennial(timing FHIR.Timing):
  if timing.repeat.frequency = 1 and timing.repeat.period = 2 and timing.repeat.periodUnit = 'a' 
  then true else false

//------------------------------------------------------------------------------
// flag due/overdue
//------------------------------------------------------------------------------

define function EvaluateFlag(timing FHIR.Timing, nextDueDate DateTime):
  case
    when TimingIsAnnual(timing)
      then EvaluateFlagAnnual(nextDueDate)
    when TimingIsBiennial(timing)
      then EvaluateFlagBiennial(nextDueDate)
    else EvaluateFlagDefault(nextDueDate)
  end

define function EvaluateFlagDefault(nextDueDate DateTime):
  if nextDueDate < Today() - 3 months then
    'OVERDUE'
  else if nextDueDate <= Today() + 2 months or nextDueDate >= Today() - 3 months then
    'DUE'
  else
    'NOT DUE'  

define function EvaluateFlagBiennial(nextDueDate DateTime):
  EvaluateFlagDefault(nextDueDate)

define function EvaluateFlagAnnual(nextDueDate DateTime):
  if nextDueDate < Today() - 2 months then
    'OVERDUE'
  else if nextDueDate <= Today() + 2 months or nextDueDate >= Today() - 2 months then
    'DUE'
  else
    'NOT DUE'   

