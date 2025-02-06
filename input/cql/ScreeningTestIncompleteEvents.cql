library ScreeningTestIncompleteEvents version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include DataElements version '1.0.0' called DataElements
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include BCSMCommonFunctions version '1.0.0' called BCSMCommonFunctions

// TODO: add diagnostic imaging orders, biopsy, referrals in addition to screening

context Patient

define "eve-pendingorders":
  PendingOrdersWithoutSubsequentReport O
    return O.request

define PendingOrdersWithoutSubsequentReport:
  PendingOrdersSubsequentReportDate O
    where O.lastReportDate is null
    or (O.request.occurrence as FHIR.dateTime is not null and O.lastReportDate <= O.request.occurrence as FHIR.dateTime)
    or (O.request.occurrence as FHIR.Period is not null 
      and (O.lastReportDate in C3F.PeriodToInterval(O.request.occurrence as FHIR.Period)) is not true
    )

//TODO: determine how to look for non-test result, like specialty consult note
define PendingOrdersSubsequentReportDate:
  PendingOrdersWithoutDiagnosticReport O
  let lastReport: BCSMCommonFunctions.MostRecentDiagnosticReportByCode(O.code),
  lastReportDate: Common.DiagnosticReportDate(lastReport)
  return {
    request: O,
    lastReportDate: lastReportDate
  }

define PendingOrdersWithoutDiagnosticReport:
  if not exists DataElements.BreastCancerScreeningDiagnosticReports
    then ActiveBreastCancerScreeningOrders
  else
    from ActiveBreastCancerScreeningOrders O,
      DataElements.BreastCancerScreeningDiagnosticReports DR
    where not Exists (DR.basedOn B where B.reference = 'ServiceRequest/' + O.id)
    return O

define ActiveBreastCancerScreeningOrders:
  [ServiceRequest: DataElements."BREAST CANCER SCREENING ORDERS"] O
    where O.status in {'active'}
    and O.intent in {'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order'}