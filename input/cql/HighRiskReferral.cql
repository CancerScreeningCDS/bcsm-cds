library HighRiskReferral version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include HighRiskReferralEvents version '1.0.0' called Events
include HighRiskReferralActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-HighRiskReferral":
  {
    HighRiskReferral,
    ConsiderLifeExpectancy,
    HighRiskAssessment
  }
  except { null, {} }

define ConsiderLifeExpectancy:
  if HighRiskReferral is not null
  then Actions."act-estlifexpectancy" else null

define HighRiskReferral: 
  Coalesce(
    HighRiskReferralGenetic,
    HighRiskReferralChestXRT,
    HighRiskReferralAtypicalBiopsy,
    HighRiskReferral5YRiskHigh,
    HighRiskReferral5YRiskHigherThanAverage
  )

// TODO: look into querying encounters or consult notes to determine if referral already happened
define HighRiskReferralGenetic:  
  if Events."eve-ageAny" and Events."eve-geneticriskpop"
  then Actions."act-HighRiskReferralGenetic" else null

define HighRiskReferralChestXRT:  
  if Events."eve-ageAny" and Events."eve-chestxrtpop"
  then Actions."act-HighRiskReferralChestXRT" else null

define HighRiskReferralAtypicalBiopsy:  
  if Events."eve-ageAny" and Events."eve-atypicalbxpop"
  then Actions."act-HighRiskReferralAtypicalBiopsy" else null

define HighRiskReferral5YRiskHigh:
  if Events."eve-ageAtLeast35" and Events."eve-fiveyrriskpop"
  then Actions."act-HighRiskReferral" else null

define HighRiskReferral5YRiskHigherThanAverage:
  if Events."eve-ageAtLeast35" and Events."eve-fiveyrrisklowpop"
  then Actions."act-ConsiderHighRiskReferral" else null

// TODO: when to reassess risk vs use last recorded assessment? each cycle vs when new hx documented?
define HighRiskAssessment:
  if HighRiskReferral is null and 
    Events."eve-ageAtLeast35" and (Events."eve-fhxbrca" or Events."eve-personalriskfactors")
    and Events."MostRecent5YrRiskAssessment" is null
  then {Actions."act-5YRiskAssessment",Actions."act-5YRiskAssessmentTool"} else null
