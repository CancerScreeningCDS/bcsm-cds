library AverageRisk version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include AverageRiskEvents version '1.0.0' called Events
include AverageRiskActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-AverageRisk":
  {    
    ACSMammoAvgRiskAgeUnder45,
    ACSMammoAvgRiskAge45to54,
    ACSMammoAvgRiskAgeOver54,
    USPSTFAvgRisk
  }   
  except { null }

define ACSMammoAvgRiskAgeUnder45:
  if Events."eve-ageUnder40" or Events."eve-age40to44" is true
  then Actions."act-acsavgrecs40" else null

define ExistsACSMammoAvgRiskAgeUnder45:
  ACSMammoAvgRiskAgeUnder45 is not null

define ACSMammoAvgRiskAgeUnder45Code:    
  ACSMammoAvgRiskAgeUnder45 R return R.code

define ACSMammoAvgRiskAgeUnder45Timing:    
  ACSMammoAvgRiskAgeUnder45 R return R.timingTiming

define ACSMammoAvgRiskAgeUnder45TimingEvent:    
  ACSMammoAvgRiskAgeUnder45Timing R return First(R.event)    

define ACSMammoAvgRiskAge45to54:
  if Events."eve-Age45to54" is true
  then Actions."act-acsavgrecs45" else null  

define ExistsACSMammoAvgRiskAge45to54:
  ACSMammoAvgRiskAge45to54 is not null

define ACSMammoAvgRiskAge45to54Code:    
  ACSMammoAvgRiskAge45to54 R return R.code

define ACSMammoAvgRiskAge45to54Timing:    
  ACSMammoAvgRiskAge45to54 R return R.timingTiming

define ACSMammoAvgRiskAge45to54TimingEvent:    
  ACSMammoAvgRiskAge45to54Timing R return First(R.event)    

define ACSMammoAvgRiskAgeOver54:
  if Events."eve-AgeOver54" is true
  then Actions."act-acsavgrecs55" else null

define ExistsACSMammoAvgRiskAgeOver54:
  ACSMammoAvgRiskAgeOver54 is not null

define ACSMammoAvgRiskAgeOver54Code:    
  ACSMammoAvgRiskAgeOver54 R return R.code

define ACSMammoAvgRiskAgeOver54Timing:    
  ACSMammoAvgRiskAgeOver54 R return R.timingTiming

define ACSMammoAvgRiskAgeOver54TimingEvent:    
  ACSMammoAvgRiskAgeOver54Timing R return First(R.event)    

define USPSTFAvgRisk:
  Actions."act-uspstfavgrecs"  

define ExistsUSPSTFAvgRisk:
  USPSTFAvgRisk is not null

define USPSTFAvgRiskCode:    
  USPSTFAvgRisk R return R.code

define USPSTFAvgRiskTiming:    
  USPSTFAvgRisk R return R.timingTiming

define USPSTFAvgRiskTimingEvent:    
  USPSTFAvgRiskTiming R return First(R.event)