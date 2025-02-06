library GeneticRiskReferralEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F

codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'

code "Family history of inherited cancer susceptibility": 'fhxgenetic' from "ReasonCode" display 'Family history of inherited cancer susceptibility'
code "Ancestry associated with BRCA1/2 gene mutations": 'brcageneancestry' from "ReasonCode" display 'Ancestry associated with BRCA1/2 gene mutations'
code "Familial risk assessment": 'familialriskassessment' from "ActCode" display 'Familial risk assessment'
code "High genetic risk": 'highgeneticrisk' from "ReasonCode" display 'High genetic risk'

context Patient

define "eve-fhxgeneinherited":
  DataElements."de-fhxgeneinherited"

define "eve-knownvariantstatus":
  DataElements."de-knownvariantstatus"

define "eve-fhxbrcaovcatubalperit":
    DataElements.FamilyHistoryBreastOvarianTubalPeritonealCancerObservation.value is true or
      exists DataElements.FamilyMemberBreastOvarianTubalPeritonealCancer

define "eve-brcageneancestry":
  DataElements.MostRecentBRCAGeneAncestryObservation.value is true

define "eve-fhxriskresult":
  DataElements."de-fhxbreastcarisk"



