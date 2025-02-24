Alias: $EnableBehaviorCS = http://hl7.org/fhir/questionnaire-enable-behavior

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: ScreeningEligibleQuestionnaire
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Title: "Screening Eligible"
Usage: #definition

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

//this is queried from pertinent history
/*
* item[+].linkId = "currentbreastcancer"
* item[=].text = "Current breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#currentbreastcancer
* item[=].readOnly = true 
*/

//this is queried from pertinent history
/*
* item[+].linkId = "bilatmastectomy"
* item[=].text = "Bilateral mastectomy"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#bilatmastectomy
* item[=].readOnly = true
*/

* item[+].linkId = "BreastSymptoms"
* item[=].text = "New or worsening breast symptoms"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#BreastSymptoms

* item[+].linkId = "BreastFindings"
* item[=].text = "New or worsening breast exam findings"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#BreastFindings

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: BreastCancerDecisionToScreenQuestionnaire
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Usage: #definition
Title: "Breast Cancer Decision to Screen Questionnaire"
Description: "A questionnaire to assess factors related to breast cancer routine screening."

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* url = Canonical(BreastCancerDecisionToScreenQuestionnaire)
* version = "1.0.0"
* name = "BreastCancerDecisionToScreenQuestionnaire"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* subjectType = http://hl7.org/fhir/resource-types#Patient "Patient"

* item[+].linkId = "lifeexp"
* item[=].text = "Reduced life expectancy indicator"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#lifeexp

// user observation only
* item[+].linkId = "currentlylactating"
* item[=].text = "Currently lactating"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#currentlylactating

* item[+].linkId = "GeneticMarkerOrSyndrome"
* item[=].text = "Genetic marker or syndrome associated with breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#GeneticMarkerOrSyndrome

* item[+].linkId = "geneticriskexclusion"
* item[=].text = "Genetic risk exclusion"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#geneticriskexclusion
* item[=].enableWhen[+].question = "GeneticMarkerOrSyndrome"
* item[=].enableWhen[=].operator = http://hl7.org/fhir/questionnaire-enable-operator#=
* item[=].enableWhen[=].answerBoolean = true
* item[=].enableBehavior = $EnableBehaviorCS#all

* item[+].linkId = "othergeneticrisk"
* item[=].text = "Other genetic marker or syndrome associated with breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#othergeneticrisk
* item[=].enableWhen[+].question = "GeneticMarkerOrSyndrome"
* item[=].enableWhen[=].operator = http://hl7.org/fhir/questionnaire-enable-operator#=
* item[=].enableWhen[=].answerBoolean = true
* item[=].enableBehavior = $EnableBehaviorCS#all

* item[+].linkId = "chestxrt"
* item[=].text = "History of chest radiation ages 10-30 y"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#chestxrt

//this is queried from pertinent history
/*
* item[+].linkId = "hxbreastca"
* item[=].text = "Previous breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#hxbreastca
*/

* item[+].linkId = "hxbreastcawithin5y"
* item[=].text = "Breast cancer in remission < 5 years"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#hxbreastcawithin5y
* item[=].enableWhen[+].question = "hxbreastca"
* item[=].enableWhen[=].operator = http://hl7.org/fhir/questionnaire-enable-operator#=
* item[=].enableWhen[=].answerBoolean = true
* item[=].enableBehavior = $EnableBehaviorCS#all

//this is queried from pertinent history
/*
* item[+].linkId = "atypicalbx"
* item[=].text = "Atypical biopsy"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#atypicalbx
*/

// user observation only
* item[+].linkId = "firstdeggenetic"
* item[=].text = "First degree relative with genetic marker or syndrome"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#firstdeggenetic

//this is queried from pertinent history
/*
* item[+].linkId = "breastdensitycord"
* item[=].text = "BI-RADS breast density category C or D"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#breastdensitycord
*/

* item[+].linkId = "fhxbreastcarisk"
* item[=].text = "Compelling family history of breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#fhxbreastcarisk

* item[+].linkId = "lifetimeriskassessment"
* item[=].text = "Lifetime risk assessment"
* item[=].type = $ITEMTYPE#choice
* item[=].code = $PDACS#lifetimeriskassessment
* item[=].answerOption[+].valueCoding = $SOCS#highlifetimerisk "High lifetime risk"

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: BreastCancerGeneticRiskReferralQuestionnaire
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Usage: #definition
Title: "Breast Cancer Genetic Risk Referral Questionnaire"
Description: "A questionnaire to assess familial risk factors related to breast cancer."

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* url = Canonical(BreastCancerGeneticRiskReferralQuestionnaire)
* version = "1.0.0"
* name = "BreastCancerGeneticRiskReferralQuestionnaire"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* subjectType = http://hl7.org/fhir/resource-types#Patient "Patient"

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
* item[=].enableBehavior = $EnableBehaviorCS#all

* item[+].linkId = "brcageneancestry"
* item[=].text = "Ancestry associated with BRCA1/2 gene mutations"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#brcageneancestry

* item[+].linkId = "fhxbrcaovcatubalperit"
* item[=].text = "Family history of breast, ovarian, tubal, or peritoneal cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#fhxbrcaovcatubalperit

* item[+].linkId = "familialriskassessment"
* item[=].text = "Familial risk assessment"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#familialriskassessment

* item[+].linkId = "fhxrisktool"
* item[=].text = "Brief familial risk assessment tool"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#fhxrisktool
* item[=].answerOption[+].valueCoding = $SOCS#highfamilialrisk "High familial risk"

//this is queried from pertinent history
/*
* item[+].linkId = "fhxriskassess"
* item[=].text = "Informal familial risk assessment"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $PDACS#fhxriskassess
*/

////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: BreastCancerHighRiskReferralQuestionnaire
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Usage: #definition
Title: "Breast Cancer High Risk Referral Questionnaire"
Description: "A questionnaire to assess risk factors related to breast cancer."

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* url = Canonical(BreastCancerHighRiskReferralQuestionnaire)
* version = "1.0.0"
* name = "BreastCancerHighRiskReferralQuestionnaire"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* subjectType = http://hl7.org/fhir/resource-types#Patient "Patient"

* item[+].linkId = "GeneticMarkerOrSyndrome"
* item[=].text = "Genetic marker or syndrome associated with breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#GeneticMarkerOrSyndrome

* item[+].linkId = "chestxrt"
* item[=].text = "History of chest radiation ages 10-30 y"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#chestxrt

//this is queried from pertinent history
/*
* item[+].linkId = "atypicalbx"
* item[=].text = "Atypical biopsy"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#atypicalbx
*/

* item[+].linkId = "fhxbreastcarisk"
* item[=].text = "Compelling family history of breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#fhxbreastcarisk

// user observation only
* item[+].linkId = "PersonalRiskFactors"
* item[=].text = "Personal risk factors conferring increased risk of breast cancer"
* item[=].type = $ITEMTYPE#boolean
* item[=].code = $SOCS#PersonalRiskFactors

* item[+].linkId = "5yriskassessment"
* item[=].text = "5 year risk assessment"
* item[=].type = $ITEMTYPE#choice
* item[=].code = $PDACS#5yriskassessment
* item[=].answerOption[+].valueCoding = $SOCS#high5yrisk "High 5 year risk"
* item[=].answerOption[+].valueCoding = $SOCS#higherthanaverage5yrisk "5 year risk at least 1.67%"

