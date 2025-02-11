library FollowupScreeningResultActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0'
include FollowupScreeningResultEvents version '1.0.0' called Events

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "BiopsyResultCS": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/biopsy-result-observation-code-system'

// Act Codes
code "Determine next due date": 'determinenextdue' from "ActCode" display 'Determine next due date'
code "Follow-up radiologist recommendations": 'radiologyrecs' from "ActCode" display 'Follow-up radiologist recommendations'
code "Order interval imaging": 'intervalscreen' from "ActCode" display 'Order interval imaging'
code "Breast biopsy": 'breastbiopsy' from  "ActCode" display 'Breast biopsy'
code "High risk referral": 'highriskreferral' from  "ActCode" display 'High risk referral'
code "Indeterminate breast biopsy referral": 'indeterminatebreastbiopsy' from  "ActCode" display 'Indeterminate breast biopsy referral'
code "Discordant breast biopsy referral": 'discordantbreastbiopsy' from  "ActCode" display 'Discordant breast biopsy referral'
code "Oncologic referral": 'oncreferral' from  "ActCode" display 'Oncologic referral'
// Reason Codes
code "Category0": '397138000' from "SNOMED-CT" display 'Mammography assessment (Category 0) - Need additional imaging evaluation (finding)'
code "Category3": '397143007' from "SNOMED-CT" display 'Mammography assessment (Category 3) - Probably benign finding, short interval follow-up (finding)'
code "Category4": '397144001' from "SNOMED-CT" display 'Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered (finding)'
code "Category5": '397145000' from "SNOMED-CT" display 'Mammography assessment (Category 5) - Highly suggestive of malignancy (finding)'
code "Negative": 'Negative' from BiopsyResultCS display 'Normal breast tissue'
code "Benign": 'Benign' from BiopsyResultCS display 'Benign breast finding'
code "Atypical": 'Atypical' from BiopsyResultCS display 'Atypical breast finding'
code "Malignant": 'Malignant' from BiopsyResultCS display 'Malignant breast finding'
code "Indeterminate": 'Indeterminate' from BiopsyResultCS display 'Indeterminate breast finding'
code "Discordant": 'Discordant' from BiopsyResultCS display 'Discordant breast finding'

context Patient

define "act-incompletescreen":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Follow-up radiologist recommendations", 
    "Category0", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)     

define "act-intervalscreen":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Order interval imaging", 
    "Category3", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)  

define "act-biopsy4": 
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Breast biopsy", 
    "Category4", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)    

define "act-biopsy5":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Breast biopsy", 
    "Category5", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)      

define "act-benignbiopsy":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Determine next due date", 
    "Benign", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)    

define "act-highriskreferral":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "High risk referral", 
    "Atypical", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)    

define "act-indeterminatebiopsy":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Indeterminate breast biopsy referral", 
    "Indeterminate", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)    

define "act-discordantbiopsy":
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Discordant breast biopsy referral", 
    "Discordant", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)    

define "act-oncreferral": 
  BCSMCommonFunctions.SetFollowupRecommendation(
    "Oncologic referral", 
    "Malignant", 
    BCSMCommonFunctions.SourceDocumentationOther, 
    Events.LatestTest.date)    

