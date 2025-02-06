library HighRiskReferralEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F

codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

code "High 5 year risk": 'high5yrisk' from "ReasonCode" display 'High 5 year risk'
code "5 year risk at least 1.67%": 'higherthanaverage5yrisk' from "ReasonCode" display '5 year risk at least 1.67%'

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

define "eve-LifeExp":
  DataElements."de-lifeexp"  

define "eve-fiveyrriskpop":
  MostRecent5YrRiskAssessmentResultHigh is not null

define "eve-fiveyrrisklowpop":
  MostRecent5YrRiskAssessmentResultHigherThanAverage is not null

define "eve-fhxbrca":  
  DataElements."de-fhxbreastcarisk"

define "eve-personalriskfactors":
  DataElements.MostRecentPersonalRiskFactorAssessment.value is true or 
    Count(DataElements."BiopsyDiagnosticReports") > 1 or
    DataElements."de-breastdensitycord"

define MostRecent5YrRiskAssessmentResultHigh:
  DataElements.MostRecent5YrRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >=3 or
    R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High 5 year risk"

define MostRecent5YrRiskAssessmentResultHigherThanAverage:
  DataElements.MostRecent5YrRiskAssessment R where 
    R.value as FHIR.Quantity is not null and C3F.QuantityValue(R).value >=1.67 and C3F.QuantityValue(R).value <3 
    or R.value as FHIR.CodeableConcept is not null and C3F.ConceptValue(R) ~ "High 5 year risk"
