Alias: $measure-population = http://terminology.hl7.org/CodeSystem/measure-population

Instance: ScreeningDueMeasure
InstanceOf: Measure
Title: "Screening Due Measure"
Usage: #definition

* insert CommonMetadata
* url = "http://cancerscreeningcds.github.io/bcsm-cds/Measure/ScreeningDueMeasure"
* version = "1.0.0"
* name = "ScreeningDueMeasure"
* status = #active
* date = "2025-02-06T17:31:58-05:00"
* description = "Due for routine breast cancer screening."
* library[+] = "http://cancerscreeningcds.github.io/bcsm-cds/Library/ScreeningDue"
* group.population[0].code = $measure-population#initial-population "Initial Population"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Initial Population"
* group.population[+].code = $measure-population#numerator "Numerator"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Numerator"
* group.population[+].code = $measure-population#denominator "Denominator"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Denominator"
* group.population[+].code = $measure-population#denominator-exclusion "Denominator Exclusion"
* group.population[=].criteria.language = #text/cql-identifier
* group.population[=].criteria.expression = "Denominator Exclusion"