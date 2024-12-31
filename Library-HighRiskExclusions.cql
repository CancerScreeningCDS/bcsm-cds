library HighRiskExclusions version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include HighRiskExclusionsEvents version '1.0.0' called Events
include HighRiskExclusionsActions version '1.0.0' called Actions

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-HighRiskExclusions":
  {    
    ACSGeneticRiskMammo,
    ACSGeneticRiskMri,
    SpecialtyReferralGeneticRisk,
    ACSMammoAfterRT,
    ACSMriAfterRT,
    ACSMammoAfterBrca,
    SpecialtyReferralBreastCaWithin5y,
    ACSMammoAtypicalBiopsyHighRisk,
    ACSMriAtypicalBiopsyHighRisk
  }   
  except { null }

define SpecialtyReferralGeneticRisk:
  if Events."eve-geneticrisk" is true
  then if Events."eve-acsgeneticrisk" is false
    then Actions."act-othergeneticrisk" else null
  else null    

define ExistsSpecialtyReferralGeneticRisk:  
  SpecialtyReferralGeneticRisk is not null

define SpecialtyReferralGeneticRiskReason:
  SpecialtyReferralGeneticRisk R return R.reason

define ACSGeneticRiskMammo:
  if Events."eve-geneticrisk" is true
    then if Events."eve-acsgeneticrisk" is true
      then Actions."act-acsgeneticriskmammo" else null
    else null    

define ExistsACSGeneticRiskMammo:
  ACSGeneticRiskMammo is not null

define ACSGeneticRiskMammoCode:    
  ACSGeneticRiskMammo R return R.code

define ACSGeneticRiskMammoTiming:    
  ACSGeneticRiskMammo R return R.timingTiming

define ACSGeneticRiskMammoTimingEvent:    
  ACSGeneticRiskMammoTiming R return First(R.event)

define ACSGeneticRiskMri:
  if Events."eve-geneticrisk" is true
    then if Events."eve-acsgeneticrisk" is true
      then Actions."act-acsgeneticriskmri" else null
    else null       

define ExistsACSGeneticRiskMri:
  ACSGeneticRiskMri is not null

define ACSGeneticRiskMriCode:    
  ACSGeneticRiskMri R return R.code

  define ACSGeneticRiskMriTiming:    
  ACSGeneticRiskMri R return R.timingTiming

define ACSGeneticRiskMriTimingEvent:    
  ACSGeneticRiskMriTiming R return First(R.event)

define ACSMammoAfterRT:
  if Events."eve-chestxrt" is true
    then Actions."act-acsmammoafterRT" else null    

define ExistsACSMammoAfterRT:
  ACSMammoAfterRT is not null

define ACSMammoAfterRTCode:    
  ACSMammoAfterRT R return R.code

define ACSMammoAfterRTTiming:    
  ACSMammoAfterRT R return R.timingTiming

define ACSMammoAfterRTTimingEvent:    
  ACSMammoAfterRTTiming R return First(R.event)

define ACSMriAfterRT:
  if Events."eve-chestxrt" is true
    then Actions."act-acsmriafterRT" else null    

define ExistsACSMriAfterRT:
  ACSMriAfterRT is not null

define ACSMriAfterRTCode:    
  ACSMriAfterRT R return R.code

  define ACSMriAfterRTTiming:    
  ACSMriAfterRT R return R.timingTiming

define ACSMriAfterRTTimingEvent:    
  ACSMriAfterRTTiming R return First(R.event)  

define ACSMammoAfterBrca:
  if Events."eve-hxbreastca" is true
    then if Events."eve-hxbreastcawithin5y" is false
      then Actions."act-acsmammoafterbrca" else null
    else null       

define ExistsACSMammoAfterBrca:
  ACSMammoAfterBrca is not null

define ACSMammoAfterBrcaCode:    
  ACSMammoAfterBrca R return R.code

define ACSMammoAfterBrcaTiming:    
  ACSMammoAfterBrca R return R.timingTiming

define ACSMammoAfterBrcaTimingEvent:    
  ACSMammoAfterBrcaTiming R return First(R.event)

define SpecialtyReferralBreastCaWithin5y:
  if Events."eve-hxbreastca" is true
    then if Events."eve-hxbreastcawithin5y" is true
      then Actions."act-hxbreastcawithin5y" else null
    else null  

define ExistsSpecialtyReferralBreastCaWithin5y:  
  SpecialtyReferralBreastCaWithin5y is not null

define SpecialtyReferralBreastCaWithin5yReason:
  SpecialtyReferralBreastCaWithin5y R return R.reason

define ACSMammoAtypicalBiopsyHighRisk:
  if Events."eve-geneticrisk" is false and Events."eve-chestxrt" is false and Events."eve-hxbreastca" is false
    then if Events."eve-atypicalbx" is true and Events."eve-highlifetimerisk" is true
      then Actions."act-acsmammoatypicalbx" else null
    else null       

define ExistsACSMammoAtypicalBiopsyHighRisk:
  ACSMammoAtypicalBiopsyHighRisk is not null

define ACSMammoAtypicalBiopsyHighRiskCode:    
  ACSMammoAtypicalBiopsyHighRisk R return R.code

define ACSMammoAtypicalBiopsyHighRiskTiming:    
  ACSMammoAtypicalBiopsyHighRisk R return R.timingTiming

define ACSMammoAtypicalBiopsyHighRiskTimingEvent:    
  ACSMammoAtypicalBiopsyHighRiskTiming R return First(R.event)  

define ACSMriAtypicalBiopsyHighRisk:
  if Events."eve-geneticrisk" is false and Events."eve-chestxrt" is false and Events."eve-hxbreastca" is false
    then if Events."eve-atypicalbx" is true and Events."eve-highlifetimerisk" is true
      then Actions."act-acsmriatypicalbx" else null
    else null       

define ExistsACSMriAtypicalBiopsyHighRisk:
  ACSMriAtypicalBiopsyHighRisk is not null

define ACSMriAtypicalBiopsyHighRiskCode:    
  ACSMriAtypicalBiopsyHighRisk R return R.code

define ACSMriAtypicalBiopsyHighRiskTiming:    
  ACSMriAtypicalBiopsyHighRisk R return R.timingTiming

define ACSMriAtypicalBiopsyHighRiskTimingEvent:    
  ACSMriAtypicalBiopsyHighRiskTiming R return First(R.event)   