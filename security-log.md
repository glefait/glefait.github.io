---
layout: page
title: Security log
sidebar_link: true
permalink: /security-log
---

# 2025

## TBC
Presence of personal data on an indexed public website.

* First contact: 2025-03-05
* Status: in progress

# 2024
## Cap Nord
Presence of personal data through an indirect join between "anonymised" datasets in an invitation to tender of more than 100 millions euros.

* First contact: 2024-02-23
* Status: solved

# 2023

## AFNIC
Undeleted data that exposes personal and sensitive data in breach of their own GDPR contract.

* First contact: 2023-12-06
* Status: informally acknowledged by phone - solved

## International mobility platform 
SQL injection that allows to extract a platform production database.

* First contact: 2023-11-16
* Status: acknowledged - solved

## [CTM](https://www.collectivitedemartinique.mq/)
SQL injection that allows to extract (deprecated ?) database on a territorial collectivity sub-entity

* First contact: 2023-11-17
* Status: no answser, email sent again the 2023-12-11. 

## Large Group in Martinique and beyond
Unprotected route in mobile app that allows to access customer receipts for a large retailer in Martinique.

* First contact: 2023-10-31
* Status: solved.

## Espace Sud
SQL injection that allows to extract production database + configuration file disclosure on a territorial collectivity subdomain

* First contact: 2023-10-23
* Status: solved.

## Large Group in Martinique and beyond.
SQL injection that allows to extract production database of a for a large retailer in Martinique.

* First contact: 2023-10-18
* Status: acknowledged

## Dom-Enic (Groupe Canal+).
SQL injection that allows to extract production database for a critical web-facing service (`.mq` and `.gf` registrar).

* First contact: 2023-10-16
* Status: acknowledged

## Web [CTM](https://www.collectivitedemartinique.mq/)
Identify a local file access on a voting application that can allow an attacker to read arbitrary file on server (like configuration files) and access voting personal details (name, email) through the use of a token 

* First contact: 2023-10-01
* Status: [published directly](https://guillem.lefait.fr/martinique/2023/10/01/revue-de-code-via-acces-document-administratif.html) as the application is now offline. Never ackowledged by the CTM.


# 2022

## Web lib
Identify data leak (personnal details + partial credit card details) on wrongly implemented (and badly secured) websites using the payzen lib.

* First contact: 2022-12-09
* Status: acknowledged

## Web [CTM](https://www.collectivitedemartinique.mq/)
Identify a debug plugin activated that can provide database credentials when exception is generated

* First contact: 2022-12-03
* Status: acknowledged

## App [Carrefour Martinique](https://play.google.com/store/apps/details?id=com.carrefourmq)
Identify an unsolved data leak that can allow a person to use the reward of another person

* First contact: 2022-09-05
* Status: reported

# 2021

## Web [CTM](https://www.collectivitedemartinique.mq/)
Identify an SQL injection vulnerable service and multiple information exposure.

* First contact: TBD
* Status: domain deactivated

## Web [CTM](https://www.collectivitedemartinique.mq/)
Identify an SQL injection vulnerable service.

* First contact: 29th July 2021.
* Status: WIP

## Web [Cesecem](https://www.cesecem.mq/)
Identify an accessible installation plugin page that could allow to insert external content on an institutional website.

* First contact: 28th July 2021.
* Resolved: 28th July 2021.

## Web [TousAntiPass](https://www.tousantipass.fr/)
Identify two leaks of personal data that allow to retrieve the user database through simple pagination (completely in the first case, partially in the second case).

* First contact: 21st July 2021 + 25th July 2021
* Resolved: 23rd July 2021 + 26th July 2021

## Org [CTM](https://www.collectivitedemartinique.mq/)
Identify a deprecated (but still used) domain not renewed. PoC (traffic + email catchall) that domain acquisition could create confidentiality, privacy and security issues. Domain is being transfered back to CTM.

* First contact: 20th June 2021.
* Resolved: between 2021-10-04 and 2022-02-19. Following recommendation, CTM installed a [security.txt](https://www.collectivitedemartinique.mq/.well-known/security.txt).

# 2020

## Web, [Orange](https://www.orange.fr/)
Identify the leak of personal data through dorking.

* First contact: 13th December 2020.
* Resolved: ?. No answer from Orange. Problem looks fixed and robots.txt was added as recommended.

## Web, [SFR Caraibes](https://www.sfrcaraibe.fr/)
Identify the leak of personal data when, while being loggued, through a modified query to a webservice. Found a sha1 password sent on the account page. Confirmed and solved.

* First contact: 4th September 2020.
* Resolved: 9th september

## Web, [Odyssi](https://www.odyssi.fr/)
Identify the leak of personal data when, unlogged, through a modified query to a webservice. Confirmed and solved.

* First contact: 25th June 2020.
* Resolved: 26th June 2020.

## Web/Internet gateway, [SFR](https://www.sfr.fr/)
Report 6 vulnerabilities (at least 1 already reported) on the SFR gateway. Reviewed, asked to test the next beta version.

* First contact: 8th June 2020.
* Status: 2 of the 6 vulnerability have been fixed.

# 2019

## Web, [espace sud](http://espacesud.fr)
Report the installation of a variant of the malware crypper on their website. Confirmed and solved.

* First contact: 28th November 2019.
* Resolved: December 2019

## App, [Carrefour Martinique](https://play.google.com/store/apps/details?id=com.carrefourmq)
Identify that the fidelity customer QR Code is an ID. Report shows it is possible to generate an ID, use it at the point of sale and 1. uses the credit associated to that user to pay for groceries, 2. obtain personal data on that user. Confirmed and solved.

* First contact: 16th September 2019.
* Resolved: 16th December 2019
