library PertinentHistory version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include BCSMCommonFunctions version '1.0.0' called BCSMCommon
include FHIRHelpers version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include ScreeningDue version '1.0.0'

context Patient

define PertinentHistory:
{
  patientInfo: {
    name: PatientName,
    id: Patient.identifier,
    isPregnant: DataElements.Pregnant,
    dateOfBirth: Patient.birthDate,
    sexAtBirth: BirthSexText,
    age: AgeInYears(),
    gender: GenderText,
    primaryLanguage: LanguageText,
    race: RaceText + '; ' + EthnicityText
  },
  patientHistory: {
    conditions: PertinentConditionsSummary,
    familyMemberHistory: PertinentFamilyMemberHistorySummary,
    observations: PertinentObservationsSummary,
    procedures: PertinentProceduresSummary,
    diagnosticReports: DiagnosticReportsSummary,
    encounters: PertinentEncountersSummary,
    episodeOfCares: PertinentEpisodesOfCareSummary,
    requests: PertinentRequestsSummary
  }
}

//------------------------------------------------------------------------------
// PERTINENT DEMOGRAPHICS
//------------------------------------------------------------------------------

define PatientName:
  if Exists(UsualPatientName) then
    FormatPatientName(First(UsualPatientName))
  else if Exists(OfficialPatientName) then
    FormatPatientName(First(OfficialPatientName))
  else
    FormatPatientName(First(Patient.name))

define UsualPatientName:
  Patient.name N
    where N.use = 'usual'
    return N

define OfficialPatientName:
  Patient.name N
    where N.use = 'official'
    return N

define function FormatPatientName(name FHIR.HumanName):
  First(name.given) + ' ' + name.family

define BirthSexText:
  if DataElements.BirthSexCode = 'F' then 'Female'
  else if DataElements.BirthSexCode = 'M' then 'Male'
  else 'Unknown'  

define GenderText:
  if Exists(DataElements.GenderIdentityExtension) 
  then DataElements.GenderIdentityExtension[0].value.coding[0].code.value
  else Patient.gender.value  

define LanguageText:
  case
    when LanguageTextAbbreviated = 'en' then 'English'
    when LanguageTextAbbreviated = 'es' then 'Spanish'
    when LanguageTextAbbreviated = 'zh' then 'Chinese'
    when LanguageTextAbbreviated = 'fr' then 'French'
    when LanguageTextAbbreviated = 'tl' then 'Tagalog'
    when LanguageTextAbbreviated = 'vi' then 'Vietnamese'
    else 'Unknown'
  end  

define LanguageTextAbbreviated:
  Coalesce( {CommunicationLanguageCode, CommunicationLanguageText, LanguageCode} )

define CommunicationLanguageCode:
  Patient.communication.language.coding.code.value[0]

define CommunicationLanguageText:
  Patient.communication.language.text.value[0]

define LanguageCode:
  Patient.language.value

define RaceText:
  Coalesce(Coalesce(RaceExtensionValues))

define RaceExtensionValues:
  (Patient.extension) E 
    where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
    return (E.extension) X where X.url = 'text' return FHIRHelpers.ToString(X.value as FHIR.string)

define EthnicityText:
  Coalesce(Coalesce(EthnicityExtensionValues))

define EthnicityExtensionValues:
  (Patient.extension) E
    where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity'
    return (E.extension) X where X.url = 'text' return FHIRHelpers.ToString(X.value as FHIR.string)  

//------------------------------------------------------------------------------
// PERTINENT CONDITIONS
//------------------------------------------------------------------------------

define PertinentConditions:
  DataElements.BreastCancerDiagnoses union
  DataElements.BilateralMastectomyConditions union
  DataElements.LeftUnilateralMastectomyConditions union
  DataElements.RightUnilateralMastectomyConditions union
  DataElements.UnilateralMastectomyConditions union
  DataElements.BreastSymptomConditions union
  DataElements.PregnancyDiagnoses union
  DataElements."BRCA-1 Mutation Conditions" union
  DataElements."BRCA-2 Mutation Conditions" union
  DataElements."Li-Fraumeni Syndrome Conditions" union
  DataElements."Cowden Syndrome Conditions" union
  DataElements."Bannayan-Riley-Ruvalcaba Syndrome Conditions" union
	DataElements."de-chestxrt" union
	DataElements.AtypicalBiopsyConditions

define PertinentConditionsSummary:
  (PertinentConditions) C
  return {
    name: Common.ConceptText(C.code),
    value: C.clinicalStatus.coding[0].code.value,
    date: Common.DateTimeText(
      Coalesce(
        C.onset as FHIR.dateTime,
        C.recordedDate
      )
    ),
    reference: 'Condition/' + C.id,
    edited: HasBeenLocallyEdited(C)
  }
  sort by (date as String) desc

//------------------------------------------------------------------------------
// PERTINENT FAMILY MEMBER HISTORY
//------------------------------------------------------------------------------  

define PertinentFamilyMemberHistory:
  DataElements.FamilyMemberBreastOvarianTubalPeritonealCancerCondition union
  DataElements.FamilyMemberGeneticMarkerOrSyndromeConditions

define PertinentFamilyMemberHistorySummary:
  (PertinentFamilyMemberHistory) FMH
    return
      FMH.conditions C return {
        name: Common.ConceptText(FMH.familyMemberHistory.relationship),
        value: Common.ConceptText(C.code),
        onset: Onset(C),
        reference: 'FamilyMemberHistory/' + FMH.familyMemberHistory.id,
        edited: HasBeenLocallyEdited(FMH.familyMemberHistory)
  }
  
//------------------------------------------------------------------------------
// PERTINENT OBSERVATIONS
//------------------------------------------------------------------------------

define PertinentObservations:
  (DataElements.LactatingObservations union
  DataElements.PregnancyObservations union
  DataElements.NewOrWorseningBreastSymptomsObservations union
  DataElements.NewOrWorseningBreastFindingsObservations union
  DataElements.ReducedLifeExpectancyObservations union
  {DataElements.MostRecentGeneticMarkerOrSyndromeObservation} union
  {DataElements.MostRecentLifetimeRiskAssessment} union
  {DataElements.MostRecentFamilialRiskAssessmentObservation} union
  {DataElements.MostRecentFamilialRiskAssessmentResult} union
  {DataElements.FamilyGeneticHistoryAssessmentObservation} union
  {DataElements.KnownGeneticMarkerOrSyndromeStatusObservation} union
  {DataElements.MostRecentBRCAGeneAncestryObservation} union
  {DataElements.MostRecent5YrRiskAssessment} union
  {DataElements.MostRecentPersonalRiskFactorAssessment} union
  {DataElements.MostRecentFirstDegRelativeGeneticObservation})
  except {null}

define PertinentObservationsSummary:
  (PertinentObservations) Obs
  return {
    name: Common.ConceptText(Obs.code),
    value: Common.ConceptText(Obs.value),
    date: Common.ObservationDateString(Obs),
    reference: 'Observation/' + Obs.id,
    edited: HasBeenLocallyEdited(Obs)
  }
  sort by (date as String) desc

//------------------------------------------------------------------------------
// PERTINENT PROCEDURES
//------------------------------------------------------------------------------

define PertinentProcedures:
  DataElements.BilateralMastectomyProcedures union
  DataElements.LeftUnilateralMastectomyProcedures union
  DataElements.RightUnilateralMastectomyProcedures

define PertinentProceduresSummary:
  (PertinentProcedures) P
  return {
    name: Common.ConceptText(P.code),
    value: P.status.value,
    date: Common.ProcedureDateString(P),
    reference: 'Procedure/' + P.id,
    edited: HasBeenLocallyEdited(P)
  } sort by date desc  

//------------------------------------------------------------------------------
// PERTINENT DIAGNOSTIC REPORTS
//------------------------------------------------------------------------------

define DiagnosticReportsSummary:
  (
    BreastImagingDiagnosticReportsSummary
    union BiopsyDiagnosticReportsSummary
  ) D
  sort by date desc

define BreastImagingDiagnosticReportsSummary:
  FormatReports(DataElements.BreastImagingDiagnosticReports, DataElements.BreastImagingObservations, 'Breast Imaging')

define BiopsyDiagnosticReportsSummary:
  FormatReports(DataElements.BiopsyDiagnosticReports, DataElements.BiopsyObservations, 'Breast Biopsy')  

//------------------------------------------------------------------------------
// PERTINENT ENCOUNTERS
//------------------------------------------------------------------------------

define PertinentEncounters:
  DataElements.AllBreastSymptomEncounters

define PertinentEncountersSummary:
  (PertinentEncounters) E
  return {
    name: Common.ConceptText(E.reasonCode[0]),
    value: E.status,
    date: Common.DateTimeText((E.period as FHIR.Period)."start") +
      ' to ' +
      Common.DateTimeText((E.period as FHIR.Period)."end"),
    reference: 'Encounter/' + E.id
  }

//------------------------------------------------------------------------------
// PERTINENT EPISODES OF CARE
//------------------------------------------------------------------------------
  define PertinentEpisodesOfCare:
    DataElements.PregnancyEpisodesOfCare

define PertinentEpisodesOfCareSummary:
  (PertinentEpisodesOfCare) E
  return {
    name: Common.ConceptText(E.type[0]),
    value: E.status.value,
    date:
      displayStartDate(Common.PeriodObject(E.period)."Start") +
      ' to ' +
      displayEndDate(Common.PeriodObject(E.period)."End"),
    reference: 'EpisodeOfCare/' + E.id,
    edited: HasBeenLocallyEdited(E)
  }
  sort by (date as String) desc

//------------------------------------------------------------------------------
// FUNCTIONS
//------------------------------------------------------------------------------

define function HasBeenLocallyEdited(R FHIR.DomainResource):
  R.extension ext
    where
      ext.url = 'http://cancerscreeningcds.github.io/bcsm-cds/StructureDefinition/bcsm-edited'
      and ext.value as FHIR.boolean = true

define function Onset(c FHIR.FamilyMemberHistory.Condition):
  Coalesce( List{
    Common.QuantityText(c.onset as FHIR.Age),
    Common.PeriodObject(c.onset as FHIR.Period),
    Common.RangeObject(c.onset as FHIR.Range),
    (c.onset as FHIR.string).value
  })      

define function FormatReports(DrList List<DiagnosticReport>, ObsList List<Observation>, ReportType String):
  (DrList) D
  let CollatedCodes: BCSMCommon.CollateConclusionCodes(D,ObsList)
  return {
    name: ReportType,
    longName: Common.ConceptText(D.code),
    value: CollatedCodes, //TODO: what to return for report value??
    date: Common.DiagnosticReportDateString(D),
    reference: 'DiagnosticReport/' + D.id,
    edited: HasBeenLocallyEdited(D)
  }      

define function displayStartDate(startDate String):
  if startDate is not null then
    startDate
  else
    'no start date available'

define function displayEndDate(endDate String):
  if endDate is not null then
    endDate
  else
    'no end date available'

//------------------------------------------------------------------------------
// PERTINENT REQUESTS
//------------------------------------------------------------------------------  

define PertinentRequests:
  ScreeningDue.DueOrOverdue

define PertinentRequestsSummary:
  (PertinentRequests) R
    return
  {
    name: Common.ConceptText(R.code),
    intent: R.intent, 
    occurence: R.nextDue,
    flag: R.flag.display,
    plannedRepeat: R.plannedRepeat
  }    
