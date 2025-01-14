library HighRiskReferralEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F

codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'

code "5 year risk assessment result": '5YRiskResult' from "LOCAL" display '5 year risk assessment result'
code "High 5 year risk": 'High5YRisk' from "LOCAL" display 'High 5 year risk'
code "5 year risk at least 1.67%": 'HigherThanAverage5YRisk' from "LOCAL" display '"5 year risk at least 1.67%"'
code "Genetic risk assessment result": 'GeneticRiskResult' from "LOCAL" display 'Genetic risk assessment result'
code "High genetic risk": 'HighGeneticRisk' from "LOCAL" display 'High genetic risk'
code "Personal risk factors conferring increased risk of breast cancer": 'personalriskfactors' from "LOCAL" display 'Personal risk factors conferring increased risk of breast cancer'

context Patient

define "eve-ageAny":
  true

define "eve-ageAtLeast35":
  AgeInYears() >= 35

define "eve-geneticriskpop":
  DataElements."de-geneticrisk"

define "eve-chestxrtpop":
  exists DataElements."de-chestxrtage10to30"

define "eve-atypicalbxpop":
  DataElements."de-atypicalbx"

define "eve-fiveyrriskpop":
  MostRecent5YrRiskAssessmentResultHigh is not null

define "eve-fiveyrrisklowpop":
  MostRecent5YrRiskAssessmentResultHigherThanAverage is not null

define "eve-fhxbrca":  
  MostRecentGeneticRiskAssessmentResultHigh is not null  

define "eve-personalriskfactors":
  MostRecentPersonalRiskFactorAssessment.value is true or 
    Count(DataElements."BiopsyDiagnosticReports") > 1 or
    DataElements."de-breastdensitycord"

define MostRecent5YrRiskAssessmentResultHigh:
  MostRecent5YrRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >=3 or
    R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High 5 year risk"

define MostRecent5YrRiskAssessmentResultHigherThanAverage:
  MostRecent5YrRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >=1.67 and C3F.QuantityValue(R).value <3 
    or R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High 5 year risk"

define MostRecent5YrRiskAssessment:
  C3F.MostRecent([Observation: "5 year risk assessment result"])  

define MostRecentGeneticRiskAssessmentResultHigh:
  MostRecentGeneticRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >5 or
    R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High genetic risk"

define MostRecentGeneticRiskAssessment:
  C3F.MostRecent([Observation: "Genetic risk assessment result"])

define MostRecentPersonalRiskFactorAssessment:
  C3F.MostRecent([Observation: "Personal risk factors conferring increased risk of breast cancer"])   

