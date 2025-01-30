
Instance: PrimaryScreeningDecision
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Primary Screening Decision"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "PrimaryScreeningDecision"
* description = "Primary Screening Decision pathway."
* type = $PDTYPE#eca-rule "ECA Rule"
* library[+] = "Library/PrimaryScreeningDecision|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: Not Screening Eligible
// -----------------------------------------------------------------------------
* insert NotEligibleNotAssignedFemaleAtBirth
* insert NotEligibleCurrentBreastCancer
* insert NotEligibleBreastSymptomsOrFindings
* insert NotEligibleBilateralMastectomy
// -----------------------------------------------------------------------------
// DECISION TO SCREEN
// -----------------------------------------------------------------------------
* insert SDMContinueScreeningAge
* insert Applicability
* insert SDMContinueScreeningLifeExp
* insert Applicability
* insert SDMDelayScreeningLactating
* insert Applicability
// -----------------------------------------------------------------------------
// HIGH RISK EXCLUSIONS
// -----------------------------------------------------------------------------
* insert ACSGeneticRiskMammo
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSGeneticRiskMri
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert SpecialtyReferralGeneticRisk
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSMammoAfterRT
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSMriAfterRT
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSMammoAfterBrca
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert SpecialtyReferralBreastCaWithin5y
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSMammoAtypicalBiopsy
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSAtypicalBiopsy
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
* insert ACSMriAtypicalBiopsyHighRisk
* insert ApplicabilityHighRiskExclusionsRecommendations
* insert Applicability
// -----------------------------------------------------------------------------
// SPECIAL POPULATIONS
// -----------------------------------------------------------------------------
* insert ACSMammoHighRisk
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
* insert ACSMriHighRisk
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
* insert ACSFirstDegGeneticMammo
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
* insert ACSFirstDegGeneticMri
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
* insert BreastImagingHeterogenouslyOrExtremelyDense
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
* insert CompellingFamilyHistory
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
* insert USPSTFRecommendation
* insert ApplicabilitySpecialPopulationsRecommendations
* insert Applicability
// -----------------------------------------------------------------------------
// AVERAGE RISK
// -----------------------------------------------------------------------------
* insert ACSMammoAvgRiskAgeUnder45
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability
* insert ACSMammoAvgRiskAge45to54
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability
* insert ACSMammoAvgRiskAgeOver54
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability
* insert USPSTFAvgRisk
* insert ApplicabilityAverageRiskRecommendations
* insert Applicability

RuleSet: Applicability
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "IsScreeningEligible"