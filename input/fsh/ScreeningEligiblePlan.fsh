////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: flow-ScreeningEligible
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition
Title: "Screening Eligible"
Usage: #definition

* insert CPGKnowledgeExtensions
* insert CommonMetadata
* meta.profile[+] = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition"
* name = "flow-ScreeningEligible"
* description = "Screening eligible logic path."
* type = $PDTYPE#eca-rule
* library[+] = "Library/ScreeningEligible|1.0.0"
// -----------------------------------------------------------------------------
// Top-level action just includes inclusion and exclusion criteria
// -----------------------------------------------------------------------------
* action[+].title = "Screening Eligible Actions"
* action[=].description = "Top level action that defines trigger and criteria for inclusion and exclusion."
* action[=].documentation[+].type = $RATYPE#documentation "Documentation"
* action[=].documentation[=].label = "Inclusions"
* action[=].documentation[=].display = "Appropriate for individuals >= age 18 years"
* action[=].trigger[+].type = $TTYPE#named-event "Named Event"
* action[=].trigger[=].name = "encounter-start" // CDS Hook name
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "CheckIsIncludedAndNotExcluded"
* action[=].condition[=].expression.reference = "Library/ScreeningEligible|1.0.0"
// -----------------------------------------------------------------------------
// Action #1: Screening Eligible
// -----------------------------------------------------------------------------
* action[=].action[+].id = "ScreeningEligible"
* action[=].action[=].title = "Screening Eligible"
* action[=].action[=].description = "Patient is eligible for screening"
* action[=].action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].action[=].condition[=].expression.expression = "IsScreeningEligible"
// -----------------------------------------------------------------------------
// Action #1: Not Screening Eligible
// -----------------------------------------------------------------------------
* action[=].action[+].id = "Not Screening Eligible"
* action[=].action[=].title = "Not Screening Eligible"
* action[=].action[=].description = "Patient is not eligible for screening"
* action[=].action[=].condition[+].kind =  $ACKIND#applicability "Applicability"
* action[=].action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].action[=].condition[=].expression.expression = "IsNotScreeningEligible"
// -----------------------------------------------------------------------------
// Inclusions error
// -----------------------------------------------------------------------------
* action[+].title = "Screening Eligible Missing Data"
* action[=].description = "Top level action that defines missing data for inclusion and exclusion."
* action[=].documentation[+].type = $RATYPE#documentation "Documentation"
* action[=].documentation[=].label = "Inclusions"
* action[=].documentation[=].display = "Error "
* action[=].trigger[+].type = $TTYPE#named-event "Named Event"
* action[=].trigger[=].name = "encounter-start" // CDS Hook name
* action[=].condition[+].kind = $ACKIND#applicability "Applicability"
* action[=].condition[=].expression.language = $EXLANG|4.0.1#text/cql "CQL"
* action[=].condition[=].expression.expression = "MissingAgeOrBirthdate"
* action[=].condition[=].expression.reference = "Library/ScreeningEligible|1.0.0"
* action[=].definitionCanonical = Canonical(ScreeningEligibleQuestionnaire|1.0.0)