library ScreeningDue version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningDueEvents version '1.0.0' called Events
include ScreeningDueActions version '1.0.0' called Actions
include ScreeningEligible version '1.0.0'

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-ScreeningDue":
  if DetermineNextDueDate is not null
    then {DetermineNextDueDate}
    else DueOrOverdue

define DetermineNextDueDate:
  if Events."eve-nextdueexists" is false and Events."eve-noscreening27mo"
    then Actions."act-determinedue"
    else null

define DueOrOverdue:    
  Events."eve-due"

//------------------------------------------------------------------------------
// MEASURE
//------------------------------------------------------------------------------  

define "Initial Population":
  ScreeningEligible.IsIncludedAndNotExcluded

define "Denominator":
	"Initial Population"

define "Denominator Exclusion":
  ScreeningEligible.IsNotScreeningEligible
	//TODO: add Hospice."Has Hospice"

define "Numerator":
  DueOrOverdue