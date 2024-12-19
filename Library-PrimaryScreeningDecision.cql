library PrimaryScreeningDecision version '1.0.0'

using FHIR version '4.0.1'

include ScreeningEligible version '1.0.0' called ScreeningEligible
include DecisionToScreen version '1.0.0' called DecisionToScreen

context Patient

define PrimaryScreeningDecision:
    if IsScreeningEligible
    then DecisionToScreen."flow-DecisionToScreen"
    else null

define IsScreeningEligible:
    ScreeningEligible."IsScreeningEligible"
