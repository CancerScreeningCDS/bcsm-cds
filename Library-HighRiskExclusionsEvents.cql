library HighRiskExclusionsEvents version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers  version '4.0.1' called FHIRHelpers
include DataElements version '1.0.0' called DataElements

context Patient

define "eve-geneticrisk":
  DataElements."de-geneticrisk"

define "eve-chestxrt":
  exists DataElements."de-chestxrtage10to30"

define "eve-hxbreastca":
  exists DataElements."de-hxbreastca"

//TODO: handling for missing dates
define "eve-hxbreastcawithin5y":
  exists DataElements."de-hxbreastca" C 
    where Today() before C.abatement.value + 5 years  

define "eve-atypicalbx":
  DataElements."de-atypicalbx"

define "eve-highlifetimerisk":
  DataElements."de-highlifetimerisk"

define "eve-acsgeneticrisk":
  DataElements."de-acsgeneticrisk"

