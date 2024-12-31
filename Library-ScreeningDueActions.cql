library ScreeningDueActions version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

context Patient

define "act-determinedue":
  true
  // TODO: Implement logic for act-determinedue

//define "act-overdue":
  // TODO: Implement logic for act-overdue

//define "act-orderscreeningmammo":
  // TODO: Implement logic for act-orderscreeningmammo

//define "act-orderscreeningmri":
  // TODO: Implement logic for act-orderscreeningmri