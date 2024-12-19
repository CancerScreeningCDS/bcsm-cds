library DataElements version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include CSMCommonFunctions version '1.0.0' called Common
include FHIRHelpers  version '4.0.1' called FHIRHelpers

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'
codesystem "ICD-9": 'http://hl7.org/fhir/sid/icd-9-cm'
codesystem "ICD-10": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "GENDER-IDENTITY": 'http://hl7.org/fhir/gender-identity'
codesystem "CONDCLINSTATUS": 'http://terminology.hl7.org/CodeSystem/condition-clinical'
//TODO: validate of this STU1 IG is valid to reference for VS
codesystem "MGBreastDensityCS": 'http://hl7.org/fhir/us/breast-radiology/CodeSystem/MGBreastDensityCS'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'

code "Condition inactive code": 'inactive' from "CONDCLINSTATUS" display 'Inactive'
code "Condition remission code": 'remission' from "CONDCLINSTATUS" display 'Remission'
code "Condition resolved code": 'resolved' from "CONDCLINSTATUS" display 'Resolved'

concept "Condition inactive": { "Condition inactive code" } display 'Inactive'
concept "Condition remission": { "Condition remission code" } display 'Remission'
concept "Condition resolved": { "Condition resolved code" } display 'Resolved'

// Breast diagnoses, procedures, and observations
valueset "INVASIVE BREAST CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.185'
// TODO: replace placeholder value set OID
valueset "NON-INVASIVE BREAST CANCER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
valueset "BILATERAL MASTECTOMY": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1068'
valueset "LEFT UNILATERAL MASTECTOMY": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1069'
valueset "RIGHT UNILATERAL MASTECTOMY": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1070'
valueset "UNILATERAL MASTECTOMY": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1071'
valueset "BILATERAL MASTECTOMY PROCEDURE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1005'
valueset "LEFT UNILATERAL MASTECTOMY PROCEDURE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1133'
valueset "RIGHT UNILATERAL MASTECTOMY PROCEDURE": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1134'
// TODO: replace placeholder value set OID
valueset "BRCA1 Gene Mutation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1444.3.203'
// TODO: replace placeholder value set OID
valueset "BRCA2 Gene Mutation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1444.3.204'
// TODO: replace placeholder value set OID
valueset "Li-Fraumeni Syndrome": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
// TODO: replace placeholder value set OID
valueset "Cowden Syndrome": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
// TODO: replace placeholder value set OID
valueset "Bannayan-Riley-Ruvalcaba Syndrome": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.1240.2017.3.2.1022'
// TODO: replace placeholder value set OID
valueset "Biopsy Atypical Results": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.235'

// Standard codes
code "Gender Identity": '76691-5' from "LOINC" display 'Gender identity'
code "Transgender Male Code": 'transgender-male' from "GENDER-IDENTITY" display 'transgender male'
code "Transgender Female Code": 'transgender-female' from "GENDER-IDENTITY" display 'transgender female'
code "Female-to-male Transsexual": '407377005' from "SNOMED-CT" display 'Female-to-male transsexual (finding)'
code "Male-to-female Transsexual": '407376001' from "SNOMED-CT" display 'Male-to-female transsexual (finding)'
code "Left (qualifier value)": '7771000' from "SNOMED-CT" display 'Left (qualifier value)'
code "Right (qualifier value)": '24028007' from "SNOMED-CT" display 'Right (qualifier value)'
code "History of radiation therapy to chest": '77941000119104' from "SNOMED-CT" display 'History of radiation therapy to chest'
code "Biopsy Report": '66110-8' from "LOINC" display 'Breast Pathology biopsy report'
code "Breast Imaging Report": '10193-1' from "LOINC" display 'Physical findings of Breasts Narrative'
code "Heterogeneously dense": 'HeterogeneouslyDense' from "MGBreastDensityCS" display 'Heterogeneously dense'
code "Extremely dense": 'ExtremelyDense' from "MGBreastDensityCS" display 'Extremely dense'

// Non-standard or "local" codes
code "New or worsening breast symptoms": 'BreastSymptoms' from "LOCAL" display 'New or worsening breast symptoms'
code "New or worsening breast exam findings": 'BreastFindings' from "LOCAL" display 'New or worsening breast exam findings'
code "Reduced life expectancy indicator": 'ReducedLifeExpectancyIndicator' from "LOCAL" display 'Reduced life expectancy indicator'
code "Genetic marker or syndrome associated with breast cancer": 'GeneticMarkerOrSyndrome' from "LOCAL" display 'Genetic marker or syndrome associated with breast cancer'
code "Lifetime risk assessment result": 'LifetimeRiskResult' from "LOCAL" display 'Lifetime risk assessment result'
code "High lifetime risk": 'HighLifetimeRisk' from "LOCAL" display 'High lifetime risk'
code "Familial risk assessment": 'FamilialRiskAssessment' from "LOCAL" display 'Familial risk criteria'

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

parameter ObservationLookbackPeriod default 14 days
parameter SymptomaticLookBack default 14 days

/***** BEGIN CDS LOGIC ********************************************************/

context Patient

define function ValuesFromObservation(D DiagnosticReport, ObsList List<Observation>):
  (ObsList) O
  where
    Exists( (D.result ) R where Last(Split(R.reference,'/')) =  O.id ) or
    Exists( (O.basedOn) oB where AnyTrue((D.basedOn) dB return dB = oB ) )
  return O.value as FHIR.CodeableConcept

define function CollateConclusionCodes(D DiagnosticReport, ObsList List<Observation>):
  D.conclusionCode union
  ValuesFromObservation(D, ObsList)

// if a DiagnosticReport.code has target code, then call orignial CollateConclusionCodes
// if a DiagnosticReport.code does not have target code, then return values from matched Observations
define function CollateConclusionCodes(D DiagnosticReport, ObsList List<Observation>, code System.Code):
  if FHIRHelpers.ToConcept(D.code) ~ code then
    CollateConclusionCodes(D, ObsList)
  else
    ValuesFromObservation(D, ObsList)  

define AllCompletedDiagnosticReport:
  Common.CompletedDiagnosticReport([DiagnosticReport])    

//------------------------------------------------------------------------------
// Assigned female at birth
//------------------------------------------------------------------------------

define "de-female":
  Female or TransgenderMale
    
define BirthSex:
  (Patient.extension) E
    where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex'

define BirthSexPresent:
  Exists(BirthSex)

define FemaleBirthSex:
  Exists(
    (BirthSex) E
      where E.value = 'F'
  )

define UnknownBirthSex:
  exists(
    (BirthSex) E
      where (
        E.value = 'ASKU' or
        E.value = 'OTH' or
        E.value = 'UNK'
      )
  )

define BirthSexMissingOrUnknown:
  not BirthSexPresent or
  UnknownBirthSex

define BirthSexCode:
  if BirthSexMissingOrUnknown then 'Unknown'
  else Coalesce(BirthSex.value.value)

define BirthSexText:
  if BirthSexCode = 'F' then 'Female'
  else if BirthSexCode = 'M' then 'Male'
  else 'Unknown'

define FemaleGender:
  Patient.gender.value = 'female'

define Female:
  FemaleBirthSex or
  (BirthSexMissingOrUnknown and FemaleGender)

define GenderIdentityExtension:
  (Patient.extension) E
    where
      E.url = 'http://hl7.org/fhir/StructureDefinition/patient-genderIdentity' or
      E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity'

define TransgenderMaleExtension:
  (GenderIdentityExtension) E
    where
      E.value as FHIR.CodeableConcept ~ "Transgender Male Code" or
      E.value as FHIR.CodeableConcept ~ "Female-to-male Transsexual"

define TransgenderFemaleExtension:
  (GenderIdentityExtension) E
    where
      E.value as FHIR.CodeableConcept ~ "Transgender Female Code" or
      E.value as FHIR.CodeableConcept ~ "Male-to-female Transsexual"      

define GenderIdentityObservation:
  [Observation: "Gender Identity"]

define TransgenderMaleObservation:
  (GenderIdentityObservation) O
  where O.value as FHIR.CodeableConcept ~ "Transgender Male Code"
  or O.value as FHIR.CodeableConcept ~ "Female-to-male Transsexual"

define TransgenderFemaleObservation:
  (GenderIdentityObservation) O
    where O.value as FHIR.CodeableConcept ~ "Transgender Female Code"
    or O.value as FHIR.CodeableConcept ~ "Male-to-female Transsexual"    

define TransgenderMale:
  Exists(TransgenderMaleExtension) or Exists(TransgenderMaleObservation)

define TransgenderFemale:
  Exists(TransgenderFemaleExtension) or Exists(TransgenderFemaleObservation)  

define FemaleorTransgenderMale:
  Female or TransgenderMale

define GenderText:
  if Exists(GenderIdentityExtension) then GenderIdentityExtension[0].value.coding[0].code.value
  else Patient.gender.value

//------------------------------------------------------------------------------
// Current breast cancer
//------------------------------------------------------------------------------

define "de-breastca":
  exists BreastCancerDiagnoses C
    where C.clinicalStatus !~ "Condition inactive"
      and C.clinicalStatus !~ "Condition remission"
      and C.clinicalStatus !~ "Condition resolved"

define BreastCancerDiagnoses:
  (Common.ValidCondition([Condition: "INVASIVE BREAST CANCER"]) union
  Common.ValidCondition([Condition: "NON-INVASIVE BREAST CANCER"]))

//------------------------------------------------------------------------------
// History of bilateral mastectomy
//------------------------------------------------------------------------------

define "de-mastectomy":
  BilateralMastectomy or (LeftUnilateralMastectomy and RightUnilateralMastectomy)

define BilateralMastectomy:
  exists Common.ValidCondition([Condition: "BILATERAL MASTECTOMY"]) or 
  exists C3F.Completed([Procedure: "BILATERAL MASTECTOMY PROCEDURE"])

define LeftUnilateralMastectomy:
  exists Common.ValidCondition([Condition: "LEFT UNILATERAL MASTECTOMY"]) or
  exists C3F.Completed([Procedure: "LEFT UNILATERAL MASTECTOMY PROCEDURE"]) or
  exists (Common.ValidCondition([Condition: "UNILATERAL MASTECTOMY"]) as List<Condition>) C
    where
      exists C.bodySite bs where bs ~ "Left (qualifier value)" or
      exists (C.bodySite.extension E
        where E.url = 'http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier'
          and E.value as CodeableConcept ~ "Left (qualifier value)")   

define RightUnilateralMastectomy:
  exists Common.ValidCondition([Condition: "RIGHT UNILATERAL MASTECTOMY"]) or
  exists C3F.Completed([Procedure: "RIGHT UNILATERAL MASTECTOMY PROCEDURE"]) or 
  exists (Common.ValidCondition([Condition: "UNILATERAL MASTECTOMY"]) as List<Condition>) C
    where
      exists C.bodySite bs where bs ~ "Right (qualifier value)" or
      exists (C.bodySite.extension E
        where E.url = 'http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier'
          and E.value as CodeableConcept ~ "Right (qualifier value)")

//------------------------------------------------------------------------------
// Breast symptoms
//------------------------------------------------------------------------------

// TODO: move this to events
define "de-breastsymptoms":
  NewOrWorseningBreastSymptoms


// TODO: look into how to associate with current encounter rather than arbitrary lookback period
define NewOrWorseningBreastSymptoms:
  C3F.MostRecent(
    C3F.ObservationLookBack(
      NewOrWorseningBreastSymptomsObservations R
        where R.value is true,
      SymptomaticLookBack
    )
  ) is not null  

define NewOrWorseningBreastSymptomsObservations:
  C3F.ObservationLookBack(
    [Observation: "New or worsening breast symptoms"],
    ObservationLookbackPeriod
  )  

//------------------------------------------------------------------------------
// Breast exam findings
//------------------------------------------------------------------------------

// TODO: move this to events
define "de-breastfindings":
  NewOrWorseningBreastFindings

define NewOrWorseningBreastFindings:
  C3F.MostRecent(
    C3F.ObservationLookBack(
      NewOrWorseningBreastFindingsObservations R
        where R.value is true,
      SymptomaticLookBack
    )
  ) is not null

define NewOrWorseningBreastFindingsObservations:
  C3F.ObservationLookBack(
    [Observation: "New or worsening breast exam findings"],
    ObservationLookbackPeriod
  )    

//------------------------------------------------------------------------------
// Life expectancy
//------------------------------------------------------------------------------

define "de-lifeexp":
  ReducedLifeExpectancy

define ReducedLifeExpectancy:
  C3F.MostRecent(
    C3F.ObservationLookBack(
      ReducedLifeExpectancyObservations R
        where R.value is true,
      SymptomaticLookBack
    )
  ) is not null

define ReducedLifeExpectancyObservations:
  C3F.ObservationLookBack(
    [Observation: "Reduced life expectancy indicator"],
    ObservationLookbackPeriod
  )   

//define "de-hospice":
  // TODO: Implement logic for de-hospice

//define "de-palliative":
  // TODO: Implement logic for de-palliative

//define "de-snpltc":
  // TODO: Implement logic for de-snpltc

//define "de-frailtydementiamed":
  // TODO: Implement logic for de-frailtydementiamed

//define "de-frailtyadvillness":
  // TODO: Implement logic for de-frailtyadvillness

//------------------------------------------------------------------------------
// Genetic syndrome
//------------------------------------------------------------------------------

define "de-geneticrisk":
  GeneticMarkerOrSyndrome or "de-acsgeneticrisk"

define GeneticMarkerOrSyndrome:
  C3F.MostRecent(
      [Observation: "Genetic marker or syndrome associated with breast cancer"] R
        where R.value is true
  ) is not null

define "de-acsgeneticrisk":
  exists "BRCA-1 Mutation Conditions" or exists "BRCA-2 Mutation Conditions" or
    exists "Li-Fraumeni Syndrome Conditions" or exists "Cowden Syndrome Conditions" or
    exists "Bannayan-Riley-Ruvalcaba Syndrome Conditions"

define "BRCA-1 Mutation Conditions":
  Common.ValidCondition([Condition: code in "BRCA1 Gene Mutation"])

define "BRCA-2 Mutation Conditions":
  Common.ValidCondition([Condition: code in "BRCA2 Gene Mutation"])

define "Li-Fraumeni Syndrome Conditions":
  Common.ValidCondition([Condition: code in "Li-Fraumeni Syndrome"])

define "Cowden Syndrome Conditions":
  Common.ValidCondition([Condition: code in "Cowden Syndrome"])

define "Bannayan-Riley-Ruvalcaba Syndrome Conditions":
  Common.ValidCondition([Condition: code in "Bannayan-Riley-Ruvalcaba Syndrome"])

//------------------------------------------------------------------------------
// Chest XRT
//------------------------------------------------------------------------------

define "de-chestxrt":
  Common.ValidCondition([Condition: code ~ "History of radiation therapy to chest"])

//TODO: figure out the math with dateTime, Period, etc
define "de-chestxrtage10to30":
  "de-chestxrt" C 
    where C.onset as Age is not null and C.onset.value >= 10 and C.onset.value <= 30 and C.onset.code = 'a'
    or C.abatement as Age is not null and C.abatement.value >= 10 and C.abatement.value <= 30 and C.abatement.code = 'a'  

//------------------------------------------------------------------------------
// Previous breast cancer
//------------------------------------------------------------------------------

define "de-hxbreastca":
  BreastCancerDiagnoses C
    where C.clinicalStatus ~ "Condition inactive"
      or C.clinicalStatus ~ "Condition remission"
      or C.clinicalStatus ~ "Condition resolved"  

//------------------------------------------------------------------------------
// Previous breast cancer
//------------------------------------------------------------------------------      

define "de-atypicalbx":
  exists Common.ValidCondition([Condition: "Biopsy Atypical Results"]) or
    exists AtypicalBiopsyResults

define AtypicalBiopsyResults:
  BiopsyDiagnosticReports D
    let cC: CollateConclusionCodes(D,BiopsyObservations)
    where cC in "Biopsy Atypical Results"

define BiopsyDiagnosticReports:
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, BiopsyObservations, "Biopsy Report")
    ) > 0

define BiopsyObservations:
  [Observation: "Biopsy Report"]

//------------------------------------------------------------------------------
// High lifetime risk
//------------------------------------------------------------------------------   

define "de-highlifetimerisk":
  MostRecentLifetimeRiskAssessmentResultHigh is not null

define MostRecentLifetimeRiskAssessmentResultHigh:
  MostRecentLifetimeRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >20 or
    R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High lifetime risk"

define MostRecentLifetimeRiskAssessment:
  C3F.MostRecent([Observation: "Lifetime risk assessment result"])

//------------------------------------------------------------------------------
// BI-RADS breast density category C or D
//------------------------------------------------------------------------------  

define "de-breastdensitycord":  
  exists BreastImagingHeterogenouslyOrExtremelyDenseResults

define BreastImagingHeterogenouslyOrExtremelyDenseResults:
  BreastImagingDiagnosticReports D
    let cC: CollateConclusionCodes(D,BreastImagingObservations)
    where exists(cC.coding C where FHIRHelpers.ToCode(C) ~ "Heterogeneously dense") 
      or exists (cC.coding C where FHIRHelpers.ToCode(C) ~ "Extremely dense")

define BreastImagingDiagnosticReports:
  AllCompletedDiagnosticReport B
  where 
    Count(
      CollateConclusionCodes(B, BreastImagingObservations, "Breast Imaging Report")
    ) > 0

define BreastImagingObservations:
  [Observation: "Breast Imaging Report"]

//------------------------------------------------------------------------------
// Compelling family history of breast cancer
//------------------------------------------------------------------------------  

define "de-fhxbreastcarisk":
  FamilyHistoryAssessmentObservations

define FamilyHistoryAssessmentObservations:  
  C3F.MostRecent(
      [Observation: "Familial risk assessment"] R
        where R.value is true
  ) is not null  

//TODO: add observations for assessment tool output structured documentation
// Output of validated brief familial risk assessment tool is positive
 
//TODO: add FamilyMemberHistory for individual criteria
// 'Informal familial risk criteria' exist
