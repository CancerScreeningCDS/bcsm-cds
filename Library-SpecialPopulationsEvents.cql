library SpecialPopulationsEvents version '1.0.0'

using FHIR version '4.0.1'

include CDSConnectCommonsforFHIRv401 version '1.0.0' called C3F
include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

//------------------------------------------------------------------------------
// CODE SYSTEMS, VALUE SETS, AND CODES
//------------------------------------------------------------------------------

codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "v3-RoleCode": 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'

code "father": 'FTH' from "v3-RoleCode" display 'father'
code "mother": 'MTH' from "v3-RoleCode" display 'mother'
code "child": 'CHILD' from "v3-RoleCode" display 'child'
code "son": 'SONC' from "v3-RoleCode" display 'son'
code "daughter": 'DAUC' from "v3-RoleCode" display 'daughter'
code "natural father": 'NFTH' from "v3-RoleCode" display 'natural father'
code "natural mother": 'NMTH' from "v3-RoleCode" display 'natural mother'
code "natural mother of fetus": 'NMTH' from "v3-RoleCode" display 'natural mother of fetus'
code "natural child": 'NCHILD' from "v3-RoleCode" display 'natural child'
code "natural son": 'SON' from "v3-RoleCode" display 'natural son'
code "natural daughter": 'DAU' from "v3-RoleCode" display 'natural daughter'

concept "FTH": { "father", "natural father" } display 'father'
concept "MTH": { "mother", "natural mother" } display 'mother'
concept "CHILD": { "child", "natural child" } display 'child'
concept "SON": { "son", "natural son" } display 'son'
concept "DAU": { "daughter", "natural daughter" } display 'daughter'

// Non-standard or "local" codes
code "First degree relative with genetic marker or syndrome": 'FirstDegGenetic' from "LOCAL" display 'First degree relative with genetic marker or syndrome'

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
      F.relationship ~ "FTH" or F.relationship ~ "MTH" or F.relationship ~ "CHILD" or F.relationship ~ "SON" or F.relationship ~ "DAU"
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
  DataElements."de-fhxbreastcarisk"
