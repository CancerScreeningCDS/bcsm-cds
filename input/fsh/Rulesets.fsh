RuleSet: CPGKnowledgeExtensions
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-knowledgeCapability"
* extension[=].valueCode = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-knowledge-capability#executable "Executable"
* extension[+].url = "http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-knowledgeRepresentationLevel"
* extension[=].valueCode = http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-knowledge-representation-level#structured "Structured"

RuleSet: CommonMetadata
* version = "1.0.0"
* date = "2024-10-22"
* status = http://hl7.org/fhir/publication-status#draft "Draft"
* experimental = true
* publisher = "The Health FFRDC, operated by The MITRE Corporation, in support of the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention."
* copyright = "(C) 2024 The MITRE Corporation. All Rights Reserved. Approved for Public Release: 24-2711. Distribution Unlimited. Unless otherwise noted, this work is available under an Apache 2.0 license. It was produced by the MITRE Corporation for the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention in accordance with the Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931."
* approvalDate =  "2024-10-22"
* lastReviewDate =  "2024-10-22"
* author[+].name = "The Health FFRDC, operated by The MITRE Corporation, in support of the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention."
* editor[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"
* reviewer[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"
* endorser[+].name = "Division of Cancer Prevention and Control, Centers for Disease Control and Prevention"

RuleSet: ACSAvgRiskCitationDocumentationArtifact
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACS"
* documentation[=].display = "Breast Cancer Screening for Women at Average Risk: 2015 Guideline Update From the American Cancer Society"
* documentation[=].citation = "Saslow D, Boetes C, Burke W, Harms S, Leach MO, Lehman CD, Morris E, Pisano E, Schnall M, Sener S, Smith RA, Warner E, Yaffe M, Andrews KS, Russell CA; American Cancer Society Breast Cancer Advisory Group. American Cancer Society guidelines for breast screening with MRI as an adjunct to mammography. CA Cancer J Clin. 2007 Mar-Apr;57(2):75-89."
* documentation[=].url = "https://jamanetwork.com/journals/jama/fullarticle/2463262"

RuleSet: ACSHighRiskCitationDocumentationArtifact
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACS"
* documentation[=].display = "American Cancer Society Recommendations for the Early Detection of Breast Cancer"
* documentation[=].url = "https://www.cancer.org/cancer/types/breast-cancer/screening-tests-and-early-detection/american-cancer-society-recommendations-for-the-early-detection-of-breast-cancer.html"

RuleSet: ACSMriCitationDocumentationArtifact
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "ACS"
* documentation[=].display = "American Cancer Society Guidelines for Breast Screening with MRI as an Adjunct to Mammography"
* documentation[=].citation = "Oeffinger KC, Fontham ETH, Etzioni R, et al. Breast Cancer Screening for Women at Average Risk: 2015 Guideline Update From the American Cancer Society. JAMA. 2015;314(15):1599–1614."
* documentation[=].url = "https://acsjournals.onlinelibrary.wiley.com/doi/full/10.3322/canjclin.57.2.75"

RuleSet: USPSTFScreeningCitationDocumentationArtifact
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USPSTF"
* documentation[=].display = "Screening for Breast Cancer: US Preventive Services Task Force Recommendation Statement"
* documentation[=].citation = "US Preventive Services Task Force. Screening for Breast Cancer: US Preventive Services Task Force Recommendation Statement. JAMA. Published online April 30, 2024."
* documentation[=].url = "https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/breast-cancer-screening"

RuleSet: USPSTFGeneticCitationDocumentationArtifact
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USPSTF"
* documentation[=].display = "BRCA-Related Cancer: Risk Assessment, Genetic Counseling, and Genetic Testing"
* documentation[=].citation = "US Preventive Services Task Force. Risk Assessment, Genetic Counseling, and Genetic Testing for BRCA-Related Cancer: US Preventive Services Task Force Recommendation Statement. JAMA. 2019;322(7):652–665."
* documentation[=].url = "https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/brca-related-cancer-risk-assessment-genetic-counseling-and-genetic-testing"

RuleSet: USPSTFRiskCitationDocumentationArtifact
* documentation[+].type = $RATYPE#citation "Citation"
* documentation[=].label = "USPSTF"
* documentation[=].display = "Breast Cancer: Medication Use to Reduce Risk"
* documentation[=].citation = "US Preventive Services Task Force. Medication Use to Reduce Risk of Breast Cancer: US Preventive Services Task Force Recommendation Statement. JAMA. 2019;322(9):857–867."
* documentation[=].url = "https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/breast-cancer-medications-for-risk-reduction"

RuleSet: ACRTransgenderCitationDocumentationArtifact
* documentation[+].type = $RATYPE#documentation "Documentation"
* documentation[=].label = "ACR"
* documentation[=].display = "ACR Appropriateness Criteria® Transgender Breast Cancer Screening"
* documentation[=].citation = "Brown, Ann, et al. \"ACR appropriateness criteria® transgender breast cancer screening.\" Journal of the American College of Radiology 18.11 (2021): S502-S515."
* documentation[=].url = "https://www.jacr.org/article/S1546-1440(21)00730-4/fulltext"

RuleSet: UCSFTransgenderCitationDocumentationArtifact
* documentation[+].type = $RATYPE#documentation "Documentation"
* documentation[=].label = "UCSF"
* documentation[=].display = "UCSF Transgender Care & Treatment Guidelines: Screening for breast cancer in transgender women"
* documentation[=].url = "https://transcare.ucsf.edu/guidelines/breast-cancer-women"

RuleSet: ScreeningEligibleDocumentationArtifact
* documentation[+].type = $RATYPE#derived-from "Derived From"
* documentation[=].label = "Screening Eligible"
* documentation[=].display = "Individuals who have certain signs or symptoms concerning for breast cancer or other breast diseases are excluded from routine screening pathways and should have diagnostic testing performed."

RuleSet: NCIBCRATDocumentationArtifact
* documentation[+].type = $RATYPE#documentation "Documentation"
* documentation[=].label = "NCI Breast Cancer Risk Assessment Tool"
* documentation[=].display = "National Cancer Institute (NCI) Breast Cancer Risk Assessment Tool"
* documentation[=].url = "https://bcrisktool.cancer.gov/"

RuleSet: BCSCRiskCalculatorDocumentationArtifact
* documentation[+].type = $RATYPE#documentation "Documentation"
* documentation[=].label = "BCSC Risk Calculator"
* documentation[=].display = "Breast Cancer Surveillance Consortium (BCSC) Risk Calculator"
* documentation[=].url = "https://tools.bcsc-scc.ucdavis.edu/BC5yearRisk"