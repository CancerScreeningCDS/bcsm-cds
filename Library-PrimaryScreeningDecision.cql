library PrimaryScreeningDecision version '1.0.0'

using FHIR version '4.0.1'

include ScreeningEligible version '1.0.0' called ScreeningEligible

context Patient

define IsScreeningEligible:
    ScreeningEligible."IsScreeningEligible"