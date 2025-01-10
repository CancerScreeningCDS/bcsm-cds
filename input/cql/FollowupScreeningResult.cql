library FollowupScreeningResult version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include FollowupScreeningResultEvents version '1.0.0' called Events
include FollowupScreeningResultActions version '1.0.0' called Actions
include DataElements version '1.0.0' called DataElements

context Patient

define "flow-FollowupScreeningResult":
  {    
    FollowupNonactionableBiradsResult,
    FollowupBirads0Result,
    FollowupBirads3Result,
    FollowupBirads4Or5Result,
    FollowupNegativeBiopsyResult,
    FollowupBenignBiopsyResult,
    FollowupAtypicalBiopsyResult,
    FollowupMalignantBiopsyResult,
    FollowupIndeterminateBiopsyResult,
    FollowupDiscordantBiopsyResult
  }   
  except { null }


// TODO: add FSH conditional and dynamicValue accessors
define FollowupNonactionableBiradsResult:
  if Events."eve-latesttesttype" = 'imaging' and Events."eve-actionablebirads" is false
  then Actions."act-updateduedate"
  else null

define FollowupBirads0Result:
  if Events."eve-latesttesttype" = 'imaging' and Events."eve-biradsscore" ~ Events."Category0"
  then Actions."act-incompletescreen"
  else null 

define FollowupBirads3Result:
  if Events."eve-latesttesttype" = 'imaging' and Events."eve-biradsscore" ~ Events."Category3"
  then Actions."act-intervalscreen"
  else null 

define FollowupBirads4Or5Result:
  if Events."eve-latesttesttype" = 'imaging' and 
    Events."eve-biradsscore" ~ Events."Category4" or
    Events."eve-biradsscore" ~ Events."Category4A" or
    Events."eve-biradsscore" ~ Events."Category4B" or
    Events."eve-biradsscore" ~ Events."Category4C"
  then Actions."act-biopsy4"
  else if Events."eve-latesttesttype" = 'imaging' and
    Events."eve-biradsscore" ~ Events."Category5"
  then Actions."act-biopsy5"
  else null  

define FollowupNegativeBiopsyResult:
  if Events."eve-latesttesttype" = 'biopsy' and Events."eve-biopsyresult" ~ Events."Negative"
  then Actions."act-updateduedate"
  else null

define FollowupBenignBiopsyResult:
  if Events."eve-latesttesttype" = 'biopsy' and Events."eve-biopsyresult" ~ Events."Benign"
  then Actions."act-benignbiopsy"
  else null 

define FollowupAtypicalBiopsyResult:
  if Events."eve-latesttesttype" = 'biopsy' and Events."eve-biopsyresult" ~ Events."Atypical"
  then Actions."act-highriskreferral"
  else null 

define FollowupMalignantBiopsyResult:
  if Events."eve-latesttesttype" = 'biopsy' and Events."eve-biopsyresult" ~ Events."Malignant"
  then Actions."act-oncreferral"
  else null 

define FollowupIndeterminateBiopsyResult:
  if Events."eve-latesttesttype" = 'biopsy' and Events."eve-biopsyresult" ~ Events."Indeterminate"
  then Actions."act-indeterminatebiopsy"
  else null 

define FollowupDiscordantBiopsyResult:
  if Events."eve-latesttesttype" = 'biopsy' and Events."eve-biopsyresult" ~ Events."Discordant"
  then Actions."act-discordantbiopsy"
  else null   