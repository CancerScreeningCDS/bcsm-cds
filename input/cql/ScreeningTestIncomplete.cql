library ScreeningTestIncomplete version '1.0.0'

using FHIR version '4.0.1'
include FHIRHelpers  version '4.0.1' called FHIRHelpers

include ScreeningTestIncompleteEvents version '1.0.0' called Events
include DataElements version '1.0.0' called DataElements

context Patient

// TODO: how to handle BI-RADS 0
define "flow-ScreeningTestIncomplete":
  PendingOrders

define PendingOrders:
  Events."eve-pendingorders"  