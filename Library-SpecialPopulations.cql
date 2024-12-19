library SpecialPopulations version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include SpecialPopulationsEvents version '1.0.0' called Events
include SpecialPopulationsActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-SpecialPopulations":
  ACSRecommendations union {USPSTFRecommendation}

define ACSRecommendations:
  {    
    ACSMammoHighRisk,
    ACSMriHighRisk,
    ACSFirstDegGeneticMammo,
    ACSFirstDegGeneticMri,
    BreastImagingHeterogenouslyOrExtremelyDense,
    CompellingFamilyHistory
  }   
  except { null }

define ACSMammoHighRisk:
  if Events."eve-highlifetimerisk" is true
  then Actions."act-acshighriskmammo" else null       

define ExistsACSMammoHighRisk:
  ACSMammoHighRisk is not null

define ACSMammoHighRiskCode:    
  ACSMammoHighRisk R return R.code

define ACSMammoHighRiskTiming:    
  ACSMammoHighRisk R return R.timingTiming

define ACSMammoHighRiskTimingEvent:    
  ACSMammoHighRiskTiming R return First(R.event)  

define ACSMriHighRisk:
  if Events."eve-highlifetimerisk" is true
  then Actions."act-acshighriskmri" else null       

define ExistsACSMriHighRisk:
  ACSMriHighRisk is not null

define ACSMriHighRiskCode:    
  ACSMriHighRisk R return R.code

define ACSMriHighRiskTiming:    
  ACSMriHighRisk R return R.timingTiming

define ACSMriHighRiskTimingEvent:    
  ACSMriHighRiskTiming R return First(R.event)   

define ACSFirstDegGeneticMammo:
  if Events."eve-firstdeggenetic" is true
  then Actions."act-firstdeggeneticmammo" else null  

define ExistsACSFirstDegGeneticMammo:
  ACSFirstDegGeneticMammo is not null

define ACSFirstDegGeneticMammoCode:    
  ACSFirstDegGeneticMammo R return R.code

define ACSFirstDegGeneticMammoTiming:    
  ACSFirstDegGeneticMammo R return R.timingTiming

define ACSFirstDegGeneticMammoTimingEvent:    
  ACSFirstDegGeneticMammoTiming R return First(R.event)    

define ACSFirstDegGeneticMri:
  if Events."eve-firstdeggenetic" is true
  then Actions."act-firstdeggeneticmri" else null  

define ExistsACSFirstDegGeneticMri:
  ACSFirstDegGeneticMri is not null

define ACSFirstDegGeneticMriCode:    
  ACSFirstDegGeneticMri R return R.code

define ACSFirstDegGeneticMriTiming:    
  ACSFirstDegGeneticMri R return R.timingTiming

define ACSFirstDegGeneticMriTimingEvent:    
  ACSFirstDegGeneticMriTiming R return First(R.event)    

define BreastImagingHeterogenouslyOrExtremelyDense:
  if Events."eve-breastdensitycord" is true
    then Actions."act-breastdensitycord"
    else null

define ExistsBreastImagingHeterogenouslyOrExtremelyDense:
  BreastImagingHeterogenouslyOrExtremelyDense is not null

define BreastImagingHeterogenouslyOrExtremelyDenseCode:
  BreastImagingHeterogenouslyOrExtremelyDense.code

define BreastImagingHeterogenouslyOrExtremelyDenseReason:
  BreastImagingHeterogenouslyOrExtremelyDense.reason

define CompellingFamilyHistory:
  if Events."eve-fhxbreastcarisk" is true
    then Actions."act-fhxbreastcarisk"
    else null

 define ExistsCompellingFamilyHistory:
  CompellingFamilyHistory is not null

define CompellingFamilyHistoryCode:
  CompellingFamilyHistory.code

define CompellingFamilyHistoryReason:
  CompellingFamilyHistory.reason 

define USPSTFRecommendation:
  if exists ACSRecommendations 
    then Actions."act-uspstfrecs"
    else null

define ExistsUSPSTFRecommendation:
  USPSTFRecommendation is not null

define USPSTFRecommendationCode:    
  USPSTFRecommendation R return R.code

define USPSTFRecommendationTiming:    
  USPSTFRecommendation R return R.timingTiming

define USPSTFRecommendationTimingEvent:    
  USPSTFRecommendationTiming R return First(R.event)    