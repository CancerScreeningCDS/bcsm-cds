library PrimaryScreeningDecision version '1.0.0'

using FHIR version '4.0.1'

include ScreeningEligible version '1.0.0' called ScreeningEligible
include DecisionToScreen version '1.0.0' called DecisionToScreen

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define PrimaryScreeningDecision:
  Flatten({ "flow-ScreeningEligible", "flow-DecisionToScreen" }
      except { null }
  )

define "flow-ScreeningEligible":
  ScreeningEligible."flow-ScreeningEligible"

define "flow-DecisionToScreen":
  if IsScreeningEligible then DecisionToScreen."flow-DecisionToScreen" 
    else null

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------      

define CheckIsIncludedAndNotExcluded:
  ScreeningEligible.CheckIsIncludedAndNotExcluded

define IsScreeningEligible:
  ScreeningEligible."IsScreeningEligible"

define IsNotScreeningEligible:
  ScreeningEligible.IsNotScreeningEligible

define ScreeningEligibleCode:
  ScreeningEligible.ScreeningEligibleCode

define ScreeningEligibleReason:
  ScreeningEligible.ScreeningEligibleReason     

//------------------------------------------------------------------------------
// DYNAMIC VALUES DECISION TO SCREEN
//------------------------------------------------------------------------------  

define ExistsMammogramRecommendations:
  DecisionToScreen.ExistsMammogramRecommendations

define ExistsMriRecommendations:
  DecisionToScreen.ExistsMriRecommendations

define ExistsSDMContinueScreeningAge:
  DecisionToScreen.ExistsSDMContinueScreeningAge

define SDMContinueScreeningAgeCode:
  DecisionToScreen.SDMContinueScreeningAgeCode

define SDMContinueScreeningAgeReason:
  DecisionToScreen.SDMContinueScreeningAgeReason

define ExistsSDMContinueScreeningLifeExp:
  DecisionToScreen.ExistsSDMContinueScreeningLifeExp

define SDMContinueScreeningLifeExpCode:
  DecisionToScreen.SDMContinueScreeningLifeExpCode

define SDMContinueScreeningLifeExpReason:
  DecisionToScreen.SDMContinueScreeningLifeExpReason

define ExistsSDMDelayScreeningLactating:
  DecisionToScreen.ExistsSDMDelayScreeningLactating

define SDMDelayScreeningLactatingCode:
  DecisionToScreen.SDMDelayScreeningLactatingCode

define SDMDelayScreeningLactatingReason:
  DecisionToScreen.SDMDelayScreeningLactatingReason

define ExistsHighRiskExclusionsRecommendations:
  exists DecisionToScreen.HighRiskExclusionsRecommendations

define ExistsSpecialPopulationsRecommendations:
  exists DecisionToScreen.SpecialPopulationsRecommendations

define ExistsAverageRiskRecommendations:
  exists DecisionToScreen.AverageRiskRecommendations      

//------------------------------------------------------------------------------
// DYNAMIC VALUES HIGH RISK EXCLUSIONS
//------------------------------------------------------------------------------

define ExistsSpecialtyReferralGeneticRisk:
  DecisionToScreen.ExistsSpecialtyReferralGeneticRisk

define SpecialtyReferralGeneticRiskReason:
  DecisionToScreen.SpecialtyReferralGeneticRiskReason

define ExistsACSGeneticRiskMammo:
  DecisionToScreen.ExistsACSGeneticRiskMammo

define ACSGeneticRiskMammoCode:
  DecisionToScreen.ACSGeneticRiskMammoCode

define ACSGeneticRiskMammoReason:
  DecisionToScreen.ACSGeneticRiskMammoReason

define ACSGeneticRiskMammoTiming:
  DecisionToScreen.ACSGeneticRiskMammoTiming

define ACSGeneticRiskMammoTimingEvent:
  DecisionToScreen.ACSGeneticRiskMammoTimingEvent

define ExistsACSGeneticRiskMri:
  DecisionToScreen.ExistsACSGeneticRiskMri

define ACSGeneticRiskMriCode:
  DecisionToScreen.ACSGeneticRiskMriCode

define ACSGeneticRiskMriReason:
  DecisionToScreen.ACSGeneticRiskMriReason

define ACSGeneticRiskMriTiming:
  DecisionToScreen.ACSGeneticRiskMriTiming

define ACSGeneticRiskMriTimingEvent:
  DecisionToScreen.ACSGeneticRiskMriTimingEvent

define ExistsACSMammoAfterRT:
  DecisionToScreen.ExistsACSMammoAfterRT

define ACSMammoAfterRTCode:
  DecisionToScreen.ACSMammoAfterRTCode

define ACSMammoAfterRTReason:
  DecisionToScreen.ACSMammoAfterRTReason

define ACSMammoAfterRTTiming:
  DecisionToScreen.ACSMammoAfterRTTiming

define ACSMammoAfterRTTimingEvent:
  DecisionToScreen.ACSMammoAfterRTTimingEvent

define ExistsACSMriAfterRT:
  DecisionToScreen.ExistsACSMriAfterRT

define ACSMriAfterRTCode:
  DecisionToScreen.ACSMriAfterRTCode

define ACSMriAfterRTReason:
  DecisionToScreen.ACSMriAfterRTReason

define ACSMriAfterRTTiming:
  DecisionToScreen.ACSMriAfterRTTiming

define ACSMriAfterRTTimingEvent:
  DecisionToScreen.ACSMriAfterRTTimingEvent

define ExistsACSMammoAfterBrca:
  DecisionToScreen.ExistsACSMammoAfterBrca

define ACSMammoAfterBrcaCode:
  DecisionToScreen.ACSMammoAfterBrcaCode

define ACSMammoAfterBrcaReason:
  DecisionToScreen.ACSMammoAfterBrcaReason

define ACSMammoAfterBrcaTiming:
  DecisionToScreen.ACSMammoAfterBrcaTiming

define ACSMammoAfterBrcaTimingEvent:
  DecisionToScreen.ACSMammoAfterBrcaTimingEvent

define ExistsSpecialtyReferralBreastCaWithin5y:
  DecisionToScreen.ExistsSpecialtyReferralBreastCaWithin5y

define SpecialtyReferralBreastCaWithin5yReason:
  DecisionToScreen.SpecialtyReferralBreastCaWithin5yReason

define ExistsACSMammoAtypicalBiopsyHighRisk:
  DecisionToScreen.ExistsACSMammoAtypicalBiopsyHighRisk

define ACSMammoAtypicalBiopsyHighRiskCode:
  DecisionToScreen.ACSMammoAtypicalBiopsyHighRiskCode

define ACSMammoAtypicalBiopsyHighRiskReason:
  DecisionToScreen.ACSMammoAtypicalBiopsyHighRiskReason

define ACSMammoAtypicalBiopsyHighRiskTiming:
  DecisionToScreen.ACSMammoAtypicalBiopsyHighRiskTiming

define ACSMammoAtypicalBiopsyHighRiskTimingEvent:
  DecisionToScreen.ACSMammoAtypicalBiopsyHighRiskTimingEvent

define ExistsACSMriAtypicalBiopsyHighRisk:
  DecisionToScreen.ExistsACSMriAtypicalBiopsyHighRisk

define ACSMriAtypicalBiopsyHighRiskCode:
  DecisionToScreen.ACSMriAtypicalBiopsyHighRiskCode

define ACSMriAtypicalBiopsyHighRiskReason:
  DecisionToScreen.ACSMriAtypicalBiopsyHighRiskReason

define ACSMriAtypicalBiopsyHighRiskTiming:
  DecisionToScreen.ACSMriAtypicalBiopsyHighRiskTiming

define ACSMriAtypicalBiopsyHighRiskTimingEvent:
  DecisionToScreen.ACSMriAtypicalBiopsyHighRiskTimingEvent

//------------------------------------------------------------------------------
// DYNAMIC VALUES SPECIAL POPULATIONS
//------------------------------------------------------------------------------

define ExistsACSMammoHighRisk:
  DecisionToScreen.ExistsACSMammoHighRisk

define ACSMammoHighRiskCode:
  DecisionToScreen.ACSMammoHighRiskCode

define ACSMammoHighRiskReason:
  DecisionToScreen.ACSMammoHighRiskReason

define ACSMammoHighRiskTiming:
  DecisionToScreen.ACSMammoHighRiskTiming

define ACSMammoHighRiskTimingEvent:
  DecisionToScreen.ACSMammoHighRiskTimingEvent

define ExistsACSMriHighRisk:
  DecisionToScreen.ExistsACSMriHighRisk

define ACSMriHighRiskCode:
  DecisionToScreen.ACSMriHighRiskCode

define ACSMriHighRiskReason:
  DecisionToScreen.ACSMriHighRiskReason

define ACSMriHighRiskTiming:
  DecisionToScreen.ACSMriHighRiskTiming

define ACSMriHighRiskTimingEvent:
  DecisionToScreen.ACSMriHighRiskTimingEvent

define ExistsACSFirstDegGeneticMammo:
  DecisionToScreen.ExistsACSFirstDegGeneticMammo

define ACSFirstDegGeneticMammoCode:
  DecisionToScreen.ACSFirstDegGeneticMammoCode

define ACSFirstDegGeneticMammoReason:
  DecisionToScreen.ACSFirstDegGeneticMammoReason

define ACSFirstDegGeneticMammoTiming:
  DecisionToScreen.ACSFirstDegGeneticMammoTiming

define ACSFirstDegGeneticMammoTimingEvent:
  DecisionToScreen.ACSFirstDegGeneticMammoTimingEvent

define ExistsACSFirstDegGeneticMri:
  DecisionToScreen.ExistsACSFirstDegGeneticMri

define ACSFirstDegGeneticMriCode:
  DecisionToScreen.ACSFirstDegGeneticMriCode

define ACSFirstDegGeneticMriReason:
  DecisionToScreen.ACSFirstDegGeneticMriReason

define ACSFirstDegGeneticMriTiming:
  DecisionToScreen.ACSFirstDegGeneticMriTiming

define ACSFirstDegGeneticMriTimingEvent:
  DecisionToScreen.ACSFirstDegGeneticMriTimingEvent

define ExistsBreastImagingHeterogenouslyOrExtremelyDense:
  DecisionToScreen.ExistsBreastImagingHeterogenouslyOrExtremelyDense

define BreastImagingHeterogenouslyOrExtremelyDenseCode:
  DecisionToScreen.BreastImagingHeterogenouslyOrExtremelyDenseCode

define BreastImagingHeterogenouslyOrExtremelyDenseReason:
  DecisionToScreen.BreastImagingHeterogenouslyOrExtremelyDenseReason

define ExistsCompellingFamilyHistory:
  DecisionToScreen.ExistsCompellingFamilyHistory

define CompellingFamilyHistoryCode:
  DecisionToScreen.CompellingFamilyHistoryCode

define CompellingFamilyHistoryReason:
  DecisionToScreen.CompellingFamilyHistoryReason

define ExistsUSPSTFRecommendation:
  DecisionToScreen.ExistsUSPSTFRecommendation

define USPSTFRecommendationCode:
  DecisionToScreen.USPSTFRecommendationCode

define USPSTFRecommendationReason:
  DecisionToScreen.USPSTFRecommendationReason

define USPSTFRecommendationTiming:
  DecisionToScreen.USPSTFRecommendationTiming

define USPSTFRecommendationTimingEvent:
  DecisionToScreen.USPSTFRecommendationTimingEvent

//------------------------------------------------------------------------------
// DYNAMIC VALUES AVERAGE RISK
//------------------------------------------------------------------------------

define ExistsACSMammoAvgRiskAgeUnder45:
  DecisionToScreen.ExistsACSMammoAvgRiskAgeUnder45

define ACSMammoAvgRiskAgeUnder45Code:
  DecisionToScreen.ACSMammoAvgRiskAgeUnder45Code

define ACSMammoAvgRiskAgeUnder45Reason:
  DecisionToScreen.ACSMammoAvgRiskAgeUnder45Reason

define ACSMammoAvgRiskAgeUnder45Timing:
  DecisionToScreen.ACSMammoAvgRiskAgeUnder45Timing

define ACSMammoAvgRiskAgeUnder45TimingEvent:
  DecisionToScreen.ACSMammoAvgRiskAgeUnder45TimingEvent

define ExistsACSMammoAvgRiskAge45to54:
  DecisionToScreen.ExistsACSMammoAvgRiskAge45to54

define ACSMammoAvgRiskAge45to54Code:
  DecisionToScreen.ACSMammoAvgRiskAge45to54Code

define ACSMammoAvgRiskAge45to54Reason:
  DecisionToScreen.ACSMammoAvgRiskAge45to54Reason

define ACSMammoAvgRiskAge45to54Timing:
  DecisionToScreen.ACSMammoAvgRiskAge45to54Timing

define ACSMammoAvgRiskAge45to54TimingEvent:
  DecisionToScreen.ACSMammoAvgRiskAge45to54TimingEvent

define ExistsACSMammoAvgRiskAgeOver54:
  DecisionToScreen.ExistsACSMammoAvgRiskAgeOver54

define ACSMammoAvgRiskAgeOver54Code:
  DecisionToScreen.ACSMammoAvgRiskAgeOver54Code

define ACSMammoAvgRiskAgeOver54Reason:
  DecisionToScreen.ACSMammoAvgRiskAgeOver54Reason

define ACSMammoAvgRiskAgeOver54Timing:
  DecisionToScreen.ACSMammoAvgRiskAgeOver54Timing

define ACSMammoAvgRiskAgeOver54TimingEvent:
  DecisionToScreen.ACSMammoAvgRiskAgeOver54TimingEvent

define ExistsUSPSTFAvgRisk:
  DecisionToScreen.ExistsUSPSTFAvgRisk

define USPSTFAvgRiskCode:
  DecisionToScreen.USPSTFAvgRiskCode

define USPSTFAvgRiskReason:
  DecisionToScreen.USPSTFAvgRiskReason

define USPSTFAvgRiskTiming:
  DecisionToScreen.USPSTFAvgRiskTiming

define USPSTFAvgRiskTimingEvent:
  DecisionToScreen.USPSTFAvgRiskTimingEvent