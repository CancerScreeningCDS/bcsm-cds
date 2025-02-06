Instance: ScreeningEligibleQuestionnaire
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Title: "Screening Eligible"
Usage: #definition
// -----------------------------------------------------------------------------
// This Questionnaire is for screening eligible exclusion.
// -----------------------------------------------------------------------------
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* url = Canonical(ScreeningEligibleQuestionnaire)
* version = "1.0.0"
* name = "ScreeningEligible"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* subjectType = http://hl7.org/fhir/resource-types#Patient "Patient"

* item[+].linkId = "age-in-years"
* item[=].text = "Age in years"
* item[=].type = $ITEMTYPE#integer
* item[=].code = $LNC#30525-0
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].extension[=].valueCoding = $UCUM#[a]

// -----------------------------------------------------------------------------
// This Questionnaire is for primary screening, genetic and high risk referrals
// -----------------------------------------------------------------------------

Instance: BreastCancerRiskQuestionnaire
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Usage: #definition
Title: "Breast Cancer Risk Assessment Questionnaire"
Description: "A questionnaire to assess risk factors related to breast cancer."

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* url = Canonical(BreastCancerRiskQuestionnaire)
* version = "1.0.0"
* name = "BreastCancerRiskQuestionnaire"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* subjectType = http://hl7.org/fhir/resource-types#Patient "Patient"

* item[+].linkId = "currentbreastcancer"
* item[=].text = "Current breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#currentbreastcancer

* item[+].linkId = "bilatmastectomy"
* item[=].text = "Bilateral mastectomy"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#bilatmastectomy

* item[+].linkId = "BreastSymptoms"
* item[=].text = "New or worsening breast symptoms"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#BreastSymptoms

* item[+].linkId = "BreastFindings"
* item[=].text = "New or worsening breast exam findings"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#BreastFindings

* item[+].linkId = "lifeexp"
* item[=].text = "Reduced life expectancy indicator"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#lifeexp

* item[+].linkId = "currentlylactating"
* item[=].text = "Currently lactating"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#currentlylactating

* item[+].linkId = "GeneticMarkerOrSyndrome"
* item[=].text = "Genetic marker or syndrome associated with breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#GeneticMarkerOrSyndrome

* item[+].linkId = "othergeneticrisk"
* item[=].text = "Other genetic marker or syndrome associated with breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#othergeneticrisk
* item[=].enableWhen[+].question = "GeneticMarkerOrSyndrome"
* item[=].enableWhen[=].operator = http://hl7.org/fhir/questionnaire-enable-operator#=
* item[=].enableWhen[=].answerBoolean = true

* item[+].linkId = "chestxrt"
* item[=].text = "History of chest radiation ages 10-30 y"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#chestxrt

* item[+].linkId = "hxbreastca"
* item[=].text = "Previous breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#hxbreastca

* item[+].linkId = "hxbreastcawithin5y"
* item[=].text = "Breast cancer in remission < 5 years"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#hxbreastcawithin5y
* item[=].enableWhen[+].question = "hxbreastca"
* item[=].enableWhen[=].operator = http://hl7.org/fhir/questionnaire-enable-operator#=
* item[=].enableWhen[=].answerBoolean = true

* item[+].linkId = "atypicalbx"
* item[=].text = "Atypical biopsy"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#atypicalbx

* item[+].linkId = "highlifetimerisk"
* item[=].text = "High lifetime risk"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#highlifetimerisk

* item[+].linkId = "firstdeggenetic"
* item[=].text = "First degree relative with genetic marker or syndrome"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#firstdeggenetic

* item[+].linkId = "breastdensitycord"
* item[=].text = "BI-RADS breast density category C or D"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#breastdensitycord

* item[+].linkId = "fhxbreastcarisk"
* item[=].text = "Compelling family history of breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#fhxbreastcarisk

* item[+].linkId = "fhxgenetic"
* item[=].text = "Family history of inherited cancer susceptibility"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#fhxgenetic

* item[+].linkId = "KnownVariantStatus"
* item[=].text = "Known breast cancer variant status"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#KnownVariantStatus
* item[=].enableWhen[+].question = "fhxgenetic"
* item[=].enableWhen[=].operator = http://hl7.org/fhir/questionnaire-enable-operator#=
* item[=].enableWhen[=].answerBoolean = true

* item[+].linkId = "brcageneancestry"
* item[=].text = "Ancestry associated with BRCA1/2 gene mutations"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#brcageneancestry

* item[+].linkId = "fhxbrcaovcatubalperit"
* item[=].text = "Family history of breast, ovarian, tubal, or peritoneal cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#fhxbrcaovcatubalperit

* item[+].linkId = "PersonalRiskFactors"
* item[=].text = "Personal risk factors conferring increased risk of breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#PersonalRiskFactors

* item[+].linkId = "lifetimeriskassessment"
* item[=].text = "Lifetime risk assessment"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#lifetimeriskassessment

* item[+].linkId = "familialriskassessment"
* item[=].text = "Familial risk assessment"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#familialriskassessment

* item[+].linkId = "fhxrisktool"
* item[=].text = "Brief familial risk assessment tool"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#fhxrisktool

* item[+].linkId = "highfamilialrisk"
* item[=].text = "High familial risk"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#highfamilialrisk

* item[+].linkId = "fhxriskassess"
* item[=].text = "Informal familial risk assessment"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#fhxriskassess

* item[+].linkId = "5yriskassessment"
* item[=].text = "5 year risk assessment"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#5yriskassessment

* item[+].linkId = "high5yrisk"
* item[=].text = "High 5 year risk"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#high5yrisk

* item[+].linkId = "higherthanaverage5yrisk"
* item[=].text = "5 year risk at least 1.67%"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#higherthanaverage5yrisk

