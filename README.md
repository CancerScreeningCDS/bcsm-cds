# Breast Cancer Screening and Management (BCSM) Clinical Decision Support (CDS) Implementation Guide

This repository contains clinical decision support (CDS) which provides recommendations for breast cancer screening and management (BCSM). The BCSM CDS is expressed in a computer-interpretable format using health information technology (IT) interoperability standards. When used with health IT systems that support the underlying interoperability standards, the BCSM CDS is capable of providing patient-specific recommendations for breast cancer screening and management decisions. The burden of implementing the BCSM CDS on such health IT systems can be less than what would be needed to develop similar capabilities "from scratch." To verify the correctness of the BCSM CDS, a set of automated tests have been included which use synthetic patient data.

## Cautions and Limitations

This repository contains CDS definitions which are under *active development*. The CDS has not been tested in a clinical environment and should be considered a *work-in-progress*. Per the [Apache-2.0 License under which the BCSM CDS is released](#licenses), *no warranty is made* and *no liability is assumed*.

## Local development

### Pre-requisites

#### Node

To check that Node is installed, use the command:

    $ node -v

To install Node, follow the instructions at https://nodejs.org/en/download/package-manager

#### Java

#### Ruby

### Installing dependencies

    $ npm install

If using the development dependencies from the repository branches, you will also need to delete the `node_modules\encender\node_modules` folder to prevent encender from using the packed version of cql-worker.    

If using VSAC terminology, set the UMLS_API_KEY environment variable to your UMLS profile API key to access the VSAC API in the testing framework.

    $ export UMLS_API_KEY=<value>

### Test

#### CQL tests

    $ npm run cql-to-elm
    $ npm run test-cql

#### $apply operation tests

    $ npm run sushi
    $ npm run test-apply

These are intended for local testing and can only be run after the CQL tests have successfully executed as they use the Bundle outputs from CQL tests as inputs to the $apply operation.

#### Coverage

To run CQL test coverage analysis:

    $ npm run test-cql:coverage

Output will be written to `coverage` folder.    

### Build

Uses templates and scripts from https://github.com/cqframework/sample-content-ig. Automatically creates Library resources and adds both CQL and ELM to content as Base64. 

    $ ./_refresh.sh
    $ ./_genonce.sh

## Feedback

Feedback on this draft work is welcomed and encouraged. Prospective users can either open an issue on GitHub or reach out to the maintainers directly.

## Licenses

(C) 2024 The MITRE Corporation. All Rights Reserved. Approved for Public Release: 24-2711. Distribution Unlimited.

Unless otherwise noted, the BCSM CDS is available under an [Apache 2.0 license](./LICENSE.txt). It was produced by the MITRE Corporation for the Division of Cancer Prevention and Control, Centers for Disease Control and Prevention in accordance with the Statement of Work, contract number 75FCMC18D0047, task order number 75D30123F17931.  

Any LOINC (http://loinc.org) content is copyright &copy; 1995+, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC<sup>&reg;</sup> is a registered United States trademark of Regenstrief Institute, Inc.

The BCSM CDS makes reference to several clinical terminology systems and value sets available through the [Unified Medical Language System (UMLS)](https://www.nlm.nih.gov/research/umls/index.html) and the [Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/), both operated by the United States National Library of Medicine. These resources require an account and license through [UMLS Terminology Services (UTS)](https://uts.nlm.nih.gov/uts/).