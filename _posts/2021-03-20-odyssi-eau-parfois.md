---
layout: post
title: Odyssi, eau parfois ?
excerpt_separator:  <!--more-->
categories:
  - digital
tags:
  - martinique
---
## TLDR;

Odyssi a un système d'alerte coupure sur son site internet et sur twitter.
De façon étrange, les alertes ne sont pas publiés exhaustivement des deux côtés : des alertes sont donc publiées sur les deux, d'autres uniquement sur le site et d'autres uniquement sur twitter.


![Caribbean Sea, Jamaica. Iroshi Sugimoto](/images/iroshi-sugimoto_caribbean-sea-jamaica.jpg)

<!--more-->

Regardons la liste des derniers incidents, publiés à la fois sur le site internet ou via le compte twitter d'Odyssi.

| Date | Ville/quartier  | Site | Tweet |
| ---- |:----------------|:-----|:------|
| 2021-03-19 | FdF | [2674](https://www.odyssi.fr/coupure/2674) | [tweet](https://twitter.com/ODYSSI_972/status/1372952421777936387/photo/1) |
| 2021-03-18 | St Joseph | - | [tweet](https://twitter.com/ODYSSI_972/status/1372250030019645442/photo/1) |
| 2021-03-17 | FdF | - | [tweet](https://twitter.com/ODYSSI_972/status/1372217687598858240/photo/1) |
| 2021-03-16 | FdF | [2673](https://www.odyssi.fr/coupure/2673) | [tweet](https://twitter.com/ODYSSI_972/status/1371816870681141248/photo/1) |
| 2021-03-16 | Lamentin | - | [tweet](https://twitter.com/ODYSSI_972/status/1371830599560929281/photo/1) |
| 2021-03-15 | FdF | - | [tweet](https://twitter.com/ODYSSI_972/status/1371454982533287944/photo/1) |
| 2021-03-13->14 | FdF | [2670](https://www.odyssi.fr/coupure/2670) | [tweet](https://twitter.com/ODYSSI_972/status/1370835540887678981) |
| 2021-03-13->14 | Lamentin | [2671](https://www.odyssi.fr/coupure/2671) | [tweet](https://twitter.com/ODYSSI_972/status/1370913531424559104/photo/1) |
| 2021-03-13 | Lamentin | [2668](https://www.odyssi.fr/coupure/2668) | - |
| 2021-03-12->13 | FdF + Lamentin | [2661](https://www.odyssi.fr/coupure/2661) | - |
| 2021-03-11 | FdF | [2667](https://www.odyssi.fr/coupure/2667) | [tweet](https://twitter.com/ODYSSI_972/status/1370021019193253894/photo/1) |
| 2021-03-10->12 | St Joseph | [2665](https://www.odyssi.fr/coupure/2665) | [tweet](https://twitter.com/ODYSSI_972/status/1369678348264353794) |

Plusieurs remarques :
1. Il manque un nombre important de pannes sur le site Internet
2. La description des pannes ne suit aucun format, ni dans la forme, ni sur le fond.
3. Sur twitter, le tweet est une image. Ca permet d'échapper à la limite du nombre de charactères, mais ça rends l'analyse automatisée impossible

Améliorations possibles
1. Synchroniser l'envoi d'alerte quelque soit le support
2. Formaliser la description des pannes, fournir une version utilisable (ex: JSON), ajouter des mises à jour, avec des dates pour permettre le suivi
3. Dans les tweets, fournir un lien vers le site Internet
