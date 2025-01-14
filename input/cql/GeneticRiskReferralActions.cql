library GeneticRiskReferralActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0'

codesystem "ActCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-code-system'
codesystem "ReasonCode": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/plan-definition-action-reason-code-system'
codesystem "LOCAL": 'http://cancerscreeningcds.github.io/bcsm-cds/CodeSystem/screening-observation-code-system'

// Act Codes
code "Brief familial risk assessment tool": 'fhxrisktool' from "ActCode" display 'Brief familial risk assessment tool'
code "Perform informal familial risk assessment": 'fhxriskassess' from "ActCode" display 'Perform informal familial risk assessment'
code "Genetic risk referral": 'geneticriskreferral' from  "ActCode" display 'Genetic risk referral'
// Reason Codes
code "Ancestry associated with BRCA1/2 gene mutations": 'brcageneancestry' from "LOCAL" display 'Ancestry associated with BRCA1/2 gene mutations'
code "Family history of breast, ovarian, tubal, or peritoneal cancer": 'fhxbrcaovcatubalperit' from "LOCAL" display 'Family history of breast, ovarian, tubal, or peritoneal cancer'

context Patient

// TODO: add documentation source for USPSTF genetic rec statement
define "act-fhxrisktool":
  {
		code: "Brief familial risk assessment tool",
    reason: "Family history of breast, ovarian, tubal, or peritoneal cancer",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}  

define "act-fhxriskassess":
  {
		code: "Perform informal familial risk assessment",
    reason: "Family history of breast, ovarian, tubal, or peritoneal cancer",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}   

define "act-geneticreferralrisk":
  {
		code: "Genetic risk referral",
    reason: "Family history of breast, ovarian, tubal, or peritoneal cancer",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}

define "act-geneticreferralvariant":
  {
		code: "Genetic risk referral",
    reason: DataElements."Familial genetic history",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	} 

define "act-geneticreferralancestry":
  {
		code: "Genetic risk referral",
    reason: "Ancestry associated with BRCA1/2 gene mutations",
    documentation: BCSMCommonFunctions.SourceDocumentationUSPSTF
	}   

