---
layout: post
title: 30k$ grant from Digital Ocean
excerpt_separator:  <!--more-->
categories:
  - startup
tags:
  - startupschool
---

## Credit on the accout, no worry to build infrastructure

J'ai reçu l'acceptation de Digital Ocean de leur offre de 30 000 dollars pour les participants de la SUS 2018. Et ça fait du bien.

![30000$ de crédit !](/images/30k-grant-from-digital-ocean.png)

A court terme, ça va me permettre d'aller systématiquement sur des solutions techniques qui ne seront pas forcément optimisées en terme de performances (en terme de ROI service / coût) mais qui seront les plus simples à développer.

Deux exemples:
1. Envoyer/récupérer des résultats du front (nginx) vers une DB mémoir (redis). La solution la plus optimale en terme de ressource, c'est de développer en LUA, mais c'est fastidieux. A l'inverse, la solution la plus simple et en plus ré-utilisable, c'est d'avoir une API.

2. Envoyer des données de nginx vers une DB calcul (pour l'instant MongoDB). La solution la plus économique en ressource est sans doute de passer par des logs qui seront ingérés selon une fréquence donnée (minute, quart-d'heure, heure, jour). Mais ça implique de stocker des logs, les transférer, déclencher des traitements à la réception, ... .
A l'inverse la solution technique la plus simple est d'utiliser une file de message, comme kafka. Mais cette solution nécessite de nouvelles machines dédiées.

Thanks to [Digital Ocean](https://www.digitalocean.com/), I can avoid early micro-optimisation and focus on building the product.

## Deuxième "client/testeur"

[![https://www.carfully.fr/](/images/logo-carfully.svg)](https://www.carfully.fr/)

C'est donc [carfully](https://www.carfully.fr/), la startup de location de voiture pour les particuliers et professionnel qui accède à la béta privée de la [dmp anonyme](https://anonymous.dmp.io/).

Les deux premiers clients étant sur un segment tourisme, il y aura sans doute des choses intéressantes à découvrir sur les audiences et à analyser.
