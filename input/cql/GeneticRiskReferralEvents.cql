library GeneticRiskReferralEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F

codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'

code "Ancestry associated with BRCA1/2 gene mutations": 'brcageneancestry' from "LOCAL" display 'Ancestry associated with BRCA1/2 gene mutations'
code "Family history of breast, ovarian, tubal, or peritoneal cancer": 'fhxbrcaovcatubalperit' from "LOCAL" display 'Family history of breast, ovarian, tubal, or peritoneal cancer'
code "Genetic risk assessment result": 'GeneticRiskResult' from "LOCAL" display 'Genetic risk assessment result'
code "High genetic risk": 'HighGeneticRisk' from "LOCAL" display 'High genetic risk'

context Patient

define "eve-fhxgeneinherited":
  DataElements."de-fhxgeneinherited"

define "eve-knownvariantstatus":
  DataElements."de-knownvariantstatus"

define "eve-fhxbrcaovcatubalperit":
    FamilyHistoryBreastOvarianTubalPeritonealCancerObservation.value is true or
      exists DataElements.FamilyMemberBreastOvarianTubalPeritonealCancer

define FamilyHistoryBreastOvarianTubalPeritonealCancerObservation:  
  C3F.MostRecent(
      [Observation: "Family history of breast, ovarian, tubal, or peritoneal cancer"] R
  )   

define "eve-brcageneancestry":
  C3F.MostRecent(
      [Observation: "Ancestry associated with BRCA1/2 gene mutations"] R
  ).value is true

define "eve-fhxriskresult":
  MostRecentGeneticRiskAssessmentResultHigh is not null

define MostRecentGeneticRiskAssessmentResultHigh:
  MostRecentGeneticRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >5 or
    R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High genetic risk"

define MostRecentGeneticRiskAssessment:
  C3F.MostRecent([Observation: "Genetic risk assessment result"])  

