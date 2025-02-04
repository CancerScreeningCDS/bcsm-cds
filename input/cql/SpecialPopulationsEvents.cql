library SpecialPopulationsEvents version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------
valueset "FIRST DEGREE FAMILY MEMBER": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1032.92'

codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'
codesystem "v3-RoleCode": 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'

// Non-standard codes
code "First degree relative with genetic marker or syndrome": 'firstdeggenetic' from "ReasonCode" display 'First degree relative with genetic marker or syndrome'

context Patient

define "eve-highlifetimerisk":
  DataElements."de-highlifetimerisk"

define "eve-firstdeggenetic":
  FirstDegRelativeGeneticMarkerOrSyndromeObservation or exists FirstDegRelativeGeneticMarkerOrSyndrome

define "FirstDegRelativeGeneticMarkerOrSyndromeObservation":
  C3F.MostRecent(
      [Observation: "First degree relative with genetic marker or syndrome"] R
        where R.value is true
  ) is not null

define "FirstDegRelativeGeneticMarkerOrSyndrome":
  [FamilyMemberHistory] F
    where 
      F.relationship in "FIRST DEGREE FAMILY MEMBER"
      and (
        exists (F.condition C
          where 
          C.code in DataElements."BRCA1 Gene Mutation" or C.code in DataElements."BRCA2 Gene Mutation" or
          C.code in DataElements."Li-Fraumeni Syndrome" or C.code in DataElements."Cowden Syndrome" or
          C.code in DataElements."Bannayan-Riley-Ruvalcaba Syndrome"
        )
      )  

define "eve-breastdensitycord":
  DataElements."de-breastdensitycord"

define "eve-fhxbreastcarisk":
  DataElements."de-fhxbreastcarisk" or DataElements."de-fhxrisk"
