Instance: HighLevelFlow
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "High Level Flow"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "HighLevelFlow"
* description = "High Level Flow pathway."
* type = $PDTYPE#eca-rule "ECA Rule"

// -----------------------------------------------------------------------------
// PrimaryScreeningDecision
// -----------------------------------------------------------------------------
* action[+].title = "Primary Screening Decision"
* action[=].definitionCanonical = Canonical(PrimaryScreeningDecision|1.0.0)
// -----------------------------------------------------------------------------
// FollowupScreeningResult
// -----------------------------------------------------------------------------
* action[+].title = "Followup Screening Result"
* action[=].definitionCanonical = Canonical(flow-FollowupScreeningResult|1.0.0)
// -----------------------------------------------------------------------------
// GeneticRiskReferral
// -----------------------------------------------------------------------------
* action[+].title = "Genetic Risk Referral"
* action[=].definitionCanonical = Canonical(flow-GeneticRiskReferral|1.0.0)
// -----------------------------------------------------------------------------
// HighRiskReferral
// -----------------------------------------------------------------------------
* action[+].title = "High Risk Referral"
* action[=].definitionCanonical = Canonical(flow-HighRiskReferral|1.0.0)