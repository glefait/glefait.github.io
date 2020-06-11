---
layout: post
title: Vulnérabilités et divulgation responsable
excerpt_separator:  <!--more-->
categories:
  - sécurité
tags:
  - martinique, app, pirates des caraibes
---
## TLDR;

Identifier des bugs ou des problèmes de sécurité sur des infrastructures tierces arrive.

Parfois par hasard, parfois parce qu'on les cherche.

Néanmoins, dans le cadre d'une divulgation responsable, l'étape qui reste problématique est la prise de contact initiale.

Retour d'expérience en Martinique et tour d'horizon des solutions pour favoriser la divulgation responsable.

<!--more-->

Septembre 2019, je découvre l'application [Carrefour Martinique](https://play.google.com/store/apps/details?id=com.carrefourmq) et deux problèmes de sécurité.

Fin novembre, préparant ma visite à un forum sur les [données géographiques](https://www.geomartinique.fr/accueil/les_actualites/12_130/5e_journee_de_linformation_geographique__quotgeodata_le_pouvoir_de_la_donneequot), je m'aperçois qu'un petit gredin a installé une variante de [crypper](https://blog.malwarebytes.com/threat-analysis/2019/03/plugin-vulnerabilities-exploited-traffic-monetization-schemes/) sur le site d'[espace sud](http://www.espacesud.fr/).

Mai 2020, agacé par la configuration de ma box [SFR Caraïbes](https://www.sfrcaraibe.fr/mtq), je regarde d'un peu plus près et identifie 6 problèmes de sécurité.

# Call fucking who ?

![Call me maybe](/images/call-me-maybe.jpg)

A chaque fois, les étapes *qui contacter* jusqu'à *j'ai confirmation que ce j'ai remonté a bien été pris en compte* ont été fastidieuses.

Pour Carrefour, ça a pris quasiment 3 mois. Un contact informel a été rapidement pris, mais aucun retour avant un long moment. La situation a été débloquée lorsque j'ai ajouté le DPO dans la boucle.

Pour Espace Sud, j'ai du appeler le standard téléphonique, entrer en relation avec l'équipe informatique, à qui j'ai fini par envoyer un log.
Depuis ? Aucun retour.

Pour SFR, il a fallu presque 10 jours et quelques tweets énervés pour finalement avoir un contact qui s'est occupé de le redistribuer en interne, encore une fois par le contact DPO (avec un retour de l'[ANSSI](https://www.cert.ssi.gouv.fr/) en 30 minutes avec un numéro de ticket).

Si prendre contact et réaliser le suivi prends largement plus de temps que l'identification d'une vulnérabilité et la rédaction d'un rapport, c'est qu'il y a un problème.

Sachant qu'au bout, un simple remerciement n'est même pas acquis, la conséquence est que ce genre de remontées n'est pas systématique.

Pas de complexe à avoir, c'est la même chose partout et c'est dommage.

# This is america !

![Martinique is the new America ?](/images/this-is-america.jpg)

Comment faire mieux ?

1. Créez un fichier [.well_known/security.txt](https://securitytxt.org/) ainsi qu'une adresse email dédiée à la sécurité. Ca prends 10 minutes ([exemple](/.well_known/security.txt)). Disons 2 heures en prenant le temps de définir le champs `Policy`, qui permet de spécifier le périmètre d'analyse acceptable et le format attendu : un rapport précis ou un retour informel au plus tôt.

2. Traitez les remontées en répondant rapidement (après avoir filtré le spam et la merde). Rien de pire que ne pas savoir si le message a bien été reçu ou s'il a atterrit dans une poubelle.

3. Définissez dès que possible si le problème remontée est réel, s'il sera corrigée et à quelle échéance.
