library GeneticRiskReferral version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include GeneticRiskReferralEvents version '1.0.0' called Events
include GeneticRiskReferralActions version '1.0.0' called Actions

context Patient

define "flow-GeneticRiskReferral":
  {{    
    Coalesce(
      GeneticReferralVariant,
      GeneticReferralAncestry,
      GeneticReferralRisk
    )
  } except { null }, 
  GeneticRiskAssessment}
  except { null, {} }

define GeneticReferralVariant:
  if Events."eve-fhxgeneinherited" is true and Events."eve-knownvariantstatus" is false
  then Actions."act-geneticreferralvariant" else null  

define GeneticReferralAncestry:
  if Events."eve-brcageneancestry" is true
  then Actions."act-geneticreferralancestry" else null    

// TODO: when to reassess family hx vs use last recorded assessment? each cycle vs when new fam hx documented?
define GeneticRiskAssessment:
  if Events."eve-fhxbrcaovcatubalperit" is true and Events."MostRecentGeneticRiskAssessment" is null
  then {Actions."act-fhxrisktool", Actions."act-fhxriskassess"} else null   

// TODO: look into querying encounters or consult notes to determine if referral already happened
define GeneticReferralRisk:
  if Events."eve-fhxriskresult" is true
  then Actions."act-geneticreferralrisk" else null