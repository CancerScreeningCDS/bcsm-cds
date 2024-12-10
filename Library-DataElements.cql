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

// Standard codes
code "Gender Identity": '76691-5' from "LOINC" display 'Gender identity'
code "Transgender Male Code": 'transgender-male' from "GENDER-IDENTITY" display 'transgender male'
code "Transgender Female Code": 'transgender-female' from "GENDER-IDENTITY" display 'transgender female'
code "Female-to-male Transsexual": '407377005' from "SNOMED-CT" display 'Female-to-male transsexual (finding)'
code "Male-to-female Transsexual": '407376001' from "SNOMED-CT" display 'Male-to-female transsexual (finding)'
code "Left (qualifier value)": '7771000' from "SNOMED-CT" display 'Left (qualifier value)'
code "Right (qualifier value)": '24028007' from "SNOMED-CT" display 'Right (qualifier value)'

// Non-standard or "local" codes
code "New or worsening breast symptoms": 'BreastSymptoms' from "LOCAL" display 'New or worsening breast symptoms'
code "New or worsening breast exam findings": 'BreastFindings' from "LOCAL" display 'New or worsening breast exam findings'
code "Reduced life expectancy indicator": 'ReducedLifeExpectancyIndicator' from "LOCAL" display 'Reduced life expectancy indicator'

//------------------------------------------------------------------------------
// PARAMETERS
//------------------------------------------------------------------------------

parameter ObservationLookbackPeriod default 14 days
parameter SymptomaticLookBack default 14 days

/***** BEGIN CDS LOGIC ********************************************************/

context Patient

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