/*  
  Author: CMS Alliance to Modernize Healthcare, operated by THE MITRE Corporation.

  (C) 2024 The MITRE Corporation. All Rights Reserved. 
  Approved for Public Release: 24-2711. 
  Distribution Unlimited.

  Unless otherwise noted, this work is available under an Apache 2.0 license. 
  It was produced by the MITRE Corporation for the Division of Cancer Prevention 
  and Control, Centers for Disease Control and Prevention in accordance with the 
  Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.
*/

library ScreeningDue version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningDueEvents version '1.0.0' called Events
include ScreeningEligible version '1.0.0'
include Hospice version '1.0.0'

context Patient

//------------------------------------------------------------------------------
// RECOMMENDATIONS
//------------------------------------------------------------------------------

define "flow-ScreeningDue":
  (Events."eve-nextdueexists" is false and Events."eve-noscreening27mo")
    or exists DueOrOverdue

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
	  or Hospice."Has Hospice"

define "Numerator":
  "flow-ScreeningDue"