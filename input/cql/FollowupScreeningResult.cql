library FollowupScreeningResult version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowupScreeningResultEvents version '1.0.0' called Events
include FollowupScreeningResultActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements
include BCSMCommonFunctions version '1.0.0' called BCSMCommon

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-FollowupScreeningResult":
  if Errors then {}
  else
    {    
      FollowupBirads0Result,
      FollowupBirads3Result,
      FollowupBirads4Or5Result,
      FollowupBenignBiopsyResult,
      FollowupAtypicalBiopsyResult,
      FollowupMalignantBiopsyResult,
      FollowupIndeterminateBiopsyResult,
      FollowupDiscordantBiopsyResult
    }   
    except { null }

define FollowupBirads0Result:
  if Events."eve-latesttest".result ~ Events."Category0"
  then Actions."act-incompletescreen"
  else null 

define FollowupBirads3Result:
  if Events."eve-latesttest".result ~ Events."Category3"
  then Actions."act-intervalscreen"
  else null 

define FollowupBirads4Or5Result:
  if Events."eve-latesttest".result ~ Events."Category4" or
    Events."eve-latesttest".result ~ Events."Category4A" or
    Events."eve-latesttest".result ~ Events."Category4B" or
    Events."eve-latesttest".result ~ Events."Category4C"
  then Actions."act-biopsy4"
  else if Events."eve-latesttest".result ~ Events."Category5"
  then Actions."act-biopsy5"
  else null  

define FollowupBenignBiopsyResult:
  if Events."eve-latesttest".result ~ Events."Benign"
  then Actions."act-benignbiopsy"
  else null 

define FollowupAtypicalBiopsyResult:
  if Events."eve-latesttest".result ~ Events."Atypical"
  then Actions."act-highriskreferral"
  else null 

define FollowupMalignantBiopsyResult:
  if Events."eve-latesttest".result ~ Events."Malignant"
  then Actions."act-oncreferral"
  else null 

define FollowupIndeterminateBiopsyResult:
  if Events."eve-latesttest".result ~ Events."Indeterminate"
  then Actions."act-indeterminatebiopsy"
  else null 

define FollowupDiscordantBiopsyResult:
  if Events."eve-latesttest".result ~ Events."Discordant"
  then Actions."act-discordantbiopsy"
  else null   

//------------------------------------------------------------------------------
// ERRORS
//------------------------------------------------------------------------------     

define Errors:
  ErrorBreastBiopsyWithNoConclusionCodes or
    ErrorBreastImagingWithNoConclusionCodes or
    ErrorDiagnosticReportWithUnsupportedConclusionCode

//TODO: add error codes to IG
define ErrorBreastBiopsyWithNoConclusionCodes:
  Events."eve-latesttest".type = 'biopsy' and 
  Message(DataElements.MostRecentBreastBiopsyDiagnosticReportNoConclusionCodes, 
    DataElements.MostRecentBreastBiopsyDiagnosticReportNoConclusionCodes,
    'http://example.org/CodeSystem/plan-definition-action-reason-code-system/missingresultcode',
    'Warning', 
    'A laboratory test was found without a result. Please review patient record to resolve.')  

define ErrorBreastImagingWithNoConclusionCodes:
  Events."eve-latesttest".type = 'imaging' and 
    Message(DataElements.MostRecentBreastImagingDiagnosticReportNoConclusionCodes, 
    DataElements.MostRecentBreastImagingDiagnosticReportNoConclusionCodes,
    'http://example.org/CodeSystem/plan-definition-action-reason-code-system/missingresultcode',
    'Warning', 
    'An imaging test was found without a result. Please review patient record to resolve.')      

define ErrorDiagnosticReportWithUnsupportedConclusionCode:  
  Message(Events."eve-latesttest".result is null, 
    Events."eve-latesttest".result is null,
    'http://example.org/CodeSystem/plan-definition-action-reason-code-system/unknownresultcode',
    'Warning', 
    'A laboratory test was found with an unexpected result code. Please review patient record to resolve.')   

//------------------------------------------------------------------------------
// DYNAMIC VALUES
//------------------------------------------------------------------------------    

// TODO: add FSH conditional and dynamicValue accessors