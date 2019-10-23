---
layout: post
title: Laisse pas trainer ton domaine
excerpt_separator:  <!--more-->
categories:
  - startup
tags:
  - startupschool
---

## Si tu veux pas qu'jle prenne

Configuration un peu chelou puisqu'en faisant les premiers tests d'intégration de la dmp, je tombe sur un domaine un peu étrange

> suitedevil.com

qui semble reprendre le contenu de ce blog. Avant que je m'aperçoive que ce domaine était configurée sur l'IP de mon serveur et que le catch-all de nginx le redirigeait sans broncher sur cette partie.
Solution de gnou : générer un certificat SSL pour ce domaine pour absorber tranquillement le traffic puis faire des redirections 301 vers le vrai domaine.


## Premier "client/testeur"

[![https://www.villaveo.com/](/images/logo-villaveo.jpg)](https://www.villaveo.com/)

C'est donc [villaveo](https://www.villaveo.com/), la startup de location saisonnière de villas de luxe qui inaugure la [dmp anonyme](https://anonymous.dmp.io/).


Intéressant de voir des vrais logs arriver !
