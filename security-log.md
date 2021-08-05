---
layout: page
title: Security log
sidebar_link: true
permalink: /security-log
---

# 2021

## Web [CTM](https://www.collectivitedemartinique.mq/)
Identify an SQL injection vulnerable service and multiple information exposure.

* First contact: TBD
* Status: unreported

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
* Status: WIP with the domain registar [Dom-Enic](https://www.dom-enic.com/). Following recommendation, CTM installed a [security.txt](https://www.collectivitedemartinique.mq/.well-known/security.txt).

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
