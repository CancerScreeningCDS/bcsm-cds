library FollowupScreeningResult version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowupScreeningResultEvents version '1.0.0' called Events
include FollowupScreeningResultActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-FollowupScreeningResult":
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


// TODO: add FSH conditional and dynamicValue accessors

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