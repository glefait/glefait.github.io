---
layout: page
title: Security log
sidebar_link: true
permalink: /security-log
---

# 2020

## Web/Internet gateway, [SFR](https://www.sfr.fr/) 
Testing a SFR Internet Gateway beta firmware. 2 of the 6 vulnerability have been fixed. WIP PoC for the others.

## Web, [SFR Caraibes](https://www.sfrcaraibe.fr/)
Identify the leak of personal data when, while being loggued, through a modified query to a webservice. Found a sha1 password sent on the account page. Confirmed and solved.

## Web, [Odyssi](https://www.odyssi.fr/)
Identify the leak of personal data when, unlogged, through a modified query to a webservice. Confirmed and solved.

## Web/Internet gateway, [SFR](https://www.sfr.fr/) 
Report 6 vulnerabilities (at least 1 already reported) on the SFR gateway. Reviewed, asked to test the next beta version.

# 2019

## Web, [espace sud](http://espacesud.fr)
Report the installation of a variant of the malware crypper on their website. Confirmed and solved.

## App, [Carrefour Martinique](https://play.google.com/store/apps/details?id=com.carrefourmq)
Identify that the fidelity customer QR Code is an ID. Report shows it is possible to generate an ID, use it at the point of sale and 1. uses the credit associated to that user to pay for groceries, 2. obtain personal data on that user. Confirmed and solved.
