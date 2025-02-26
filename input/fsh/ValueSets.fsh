Alias: $PDACS = http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system
Alias: $SOCS = http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system
Alias: $RecommendationFlagCS = http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/recommendation-flag-code-system

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: PlanDefinitionActionCodeSystem
Id: plan-definition-action-code-system
Title: "Plan Definition Action Code System"
Description: "Code representing plan definition action codes"

* ^experimental = true

* #eligible "Eligible for screening"
* #noteligible "Not eligible for screening"
* #diagtesting "Diagnostic testing"
* #error "An error occurred"
* #missingresultcode "A laboratory test was found without a result"
* #unknownresultcode "A laboratory test was found with an unexpected result code"
* #sdmcontinue "Shared decision making to continue screening"
* #sdmdelay "Shared decision making to delay screening"
* #specialtyreferral "Refer to specialist recommendations"
* #determinenextdue "Determine next due date"
* #lifetimeriskassessment "Lifetime risk assessment"
* #familialriskassessment "Familial risk assessment"
* #fhxrisktool "Brief familial risk assessment tool"
* #fhxriskassess "Informal familial risk assessment"
* #estlifexpectancy "Consider life expectancy"
* #geneticriskreferral "Genetic risk referral"
* #5yriskassessment "5 year risk assessment"
* #highriskreferral "High risk referral"
* #breastbiopsy "Breast biopsy"
* #surgicalreferral "Breast surgeon referral"
* #oncreferral "Oncologic referral"

ValueSet:    PlanDefinitionActionCodes
Id:          plan-definition-action-codes
Title:       "Plan Definition Action Codes"
Description: "This value set includes action codes for Plan Definitions within this implementation guide."
* ^experimental = true
* include codes from system $PDACS

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: ScreeningObservationCodeSystem
Id: screening-observation-code-system
Title: "Screening Observation Code System"
Description: "Code representing breast cancer screening related observations"

* ^experimental = true

* #eligibleforscreening "Eligible for screening"
* #missingageorbirthdate "Missing patient age in years or birth date"
* #notassignedfemaleatbirth "Not assigned female at birth"
* #screeningcomplete "Screening complete"
* #USPSTFaveragerisk "USPSTF average risk"
* #ACSaveragerisk "ACS average risk"
* #currentbreastcancer "Current breast cancer"
* #bilatmastectomy "Bilateral mastectomy"
* #breastsymptomsorfindings "New or worsening breast symptoms or findings"
* #ageover74 "Age over 74 years"
* #lifeexp "Reduced life expectancy indicator"
* #currentlylactating "Currently lactating"
* #othergeneticrisk "Other genetic marker or syndrome associated with breast cancer"
* #hxbreastca "Previous breast cancer"
* #hxbreastcawithin5y "Breast cancer within 5 years"
* #geneticriskexclusion "Genetic risk exclusion"
* #chestxrt "History of chest radiation ages 10-30 y"
* #atypicalbx "Atypical biopsy"
* #atypicalbxhighlifetimerisk "Atypical biopsy high lifetime risk"
* #highlifetimerisk "High lifetime risk"
* #firstdeggenetic "First degree relative with genetic marker or syndrome"
* #breastdensitycord "BI-RADS breast density category C or D"
* #fhxbreastcarisk "Compelling family history of breast cancer"
* #fhxgenetic "Family history of inherited cancer susceptibility"
* #brcageneancestry "Ancestry associated with BRCA1/2 gene mutations"
* #fhxbrcaovcatubalperit "Family history of breast, ovarian, tubal, or peritoneal cancer"
* #highfamilialrisk "High familial risk"
* #high5yrisk "High 5 year risk"
* #higherthanaverage5yrisk "5 year risk at least 1.67%"
* #riskfactors "Personal or family history risk factors"
// not used for reason codes
* #BreastSymptoms "New or worsening breast symptoms"
* #BreastFindings "New or worsening breast exam findings"
* #GeneticMarkerOrSyndrome "Genetic marker or syndrome associated with breast cancer"
* #KnownVariantStatus "Known breast cancer variant status"
* #PersonalRiskFactors "Personal risk factors conferring increased risk of breast cancer"

ValueSet:    PlanDefinitionActionReasonCodes
Id:          plan-definition-action-reason-codes
Title:       "Plan Definition Action Reason Codes"
Description: "This value set includes action reason codes for Plan Definitions within this implementation guide."
* ^experimental = true

* include $SOCS#eligibleforscreening "Eligible for screening"
* include $SOCS#missingageorbirthdate "Missing patient age in years or birth date"
* include $SOCS#notassignedfemaleatbirth "Not assigned female at birth"
* include $SOCS#screeningcomplete "Screening complete"
* include $SOCS#USPSTFaveragerisk "USPSTF average risk"
* include $SOCS#ACSaveragerisk "ACS average risk"
* include $SOCS#currentbreastcancer "Current breast cancer"
* include $SOCS#bilatmastectomy "Bilateral mastectomy"
* include $SOCS#breastsymptomsorfindings "New or worsening breast symptoms or findings"
* include $SOCS#ageover74 "Age over 74 years"
* include $SOCS#lifeexp "Reduced life expectancy indicator"
* include $SOCS#currentlylactating "Currently lactating"
* include $SOCS#othergeneticrisk "Other genetic marker or syndrome associated with breast cancer"
* include $SOCS#hxbreastca "Previous breast cancer"
* include $SOCS#hxbreastcawithin5y "Breast cancer within 5 years"
* include $SOCS#geneticriskexclusion "Genetic risk exclusion"
* include $SOCS#chestxrt "History of chest radiation ages 10-30 y"
* include $SOCS#atypicalbx "Atypical biopsy"
* include $SOCS#atypicalbxhighlifetimerisk "Atypical biopsy high lifetime risk"
* include $SOCS#highlifetimerisk "High lifetime risk"
* include $SOCS#firstdeggenetic "First degree relative with genetic marker or syndrome"
* include $SOCS#breastdensitycord "BI-RADS breast density category C or D"
* include $SOCS#fhxbreastcarisk "Compelling family history of breast cancer"
* include $SOCS#fhxgenetic "Family history of inherited cancer susceptibility"
* include $SOCS#brcageneancestry "Ancestry associated with BRCA1/2 gene mutations"
* include $SOCS#fhxbrcaovcatubalperit "Family history of breast, ovarian, tubal, or peritoneal cancer"
* include $SOCS#highfamilialrisk "High familial risk"
* include $SOCS#high5yrisk "High 5 year risk"
* include $SOCS#higherthanaverage5yrisk "5 year risk at least 1.67%"
* include $SOCS#riskfactors "Personal or family history risk factors"

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: RecommendationFlagCodeSystem
Id: recommendation-flag-code-system
Title: "Recommendation Flag Code System"
Description: "Code representing due/overdue flags"

* ^experimental = true

* #overdue "Overdue"
* #due "Due"
* #not-due "Not due"

ValueSet:    RecommendationFlagCodes
Id:          recommendation-flag-codes
Title:       "Recommendation Flag Codes"
Description: "This value set includes flag codes for recommendation actions within this implementation guide."
* ^experimental = true
* include codes from system $RecommendationFlagCS

////////////////////////////////////////////////////////////////////////////////////////////////////

CodeSystem: BiopsyResultObservationCodeSystem
Id: biopsy-result-observation-code-system
Title: "Biopsy Result Observation Code System"
Description: "Code representing breast cancer biopsy result observations"

* ^experimental = true

* #Negative "Normal breast tissue" 
* #Benign "Benign breast finding" "Benign findings, excluding ADH, LCIS or ALH"
* #Atypical "Atypical breast finding" "Includes atypical ductal hyperplasia (ADH) and lobular neoplasia (lobular carcinoma in situ [LCIS]/atypical lobular hyperplasia [ALH]"
* #Malignant "Malignant breast finding" "Invasive or non-invasive breast malignancy"
* #Indeterminate "Indeterminate breast finding"
* #Discordant "Discordant breast finding"