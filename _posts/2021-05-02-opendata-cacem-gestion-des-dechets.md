---
layout: post
title: Opendata - démonstration avec la gestion des déchets de la Cacem
excerpt_separator:  <!--more-->
categories:
  - opendata 
tags:
  - martinique
---
## TLDR;

Petite PoC pour montrer que la création d'un jeu de données est simple/rapide, permet d'identifier des problèmes potentiels ainsi que permettre toute sorte de réutilisations.
C'est aussi une obligation légale.

Un dépot github a été créé pour l'occasion, en espérant qu'il ne reste pas le seul très longtemps.

Enfin, reflexions sur le [programme de _Managers de territoires_](https://www.collectivitedemartinique.mq/wp-content/uploads/2021/04/AAP-MOFWAZAJ-MANAGERS-DE-TERRITOIRES.pdf) initiée par la CTM.

![Shit data in, shit data out. So FU data.](/images/shit-in-shit-out-no-data-solution.png)

<!--more-->

En dehors d'une participation à [Madininair](https://www.madininair.fr/), la [Cacem](http://www.cacem.fr/) ne publie rien en open data.
C'est pourtant une obligation légale.

## Open data = obligation légale pour les collectivités
Depuis le 7 octobre 2018, comme [le résume la CNIL](https://www.cnil.fr/en/node/114283), les collectivités territoriales de plus de 3500 habitants et employant plus de 50 agents (en équivalent temps plein) sont tenues de mettre en ligne :
- les documents qu'elles communiquent en application des procédures prévues par le CRPA, ainsi que leurs versions mises à jour ;
- les documents qui figurent dans le répertoire des informations publiques (RIP) ;
- les bases de données, mises à jour de façon régulière, qu'elles produisent ou qu'elles reçoivent et qui ne font pas l'objet d'une diffusion publique par ailleurs ;
- les données, mises à jour de façon régulière, dont la publication présente un intérêt économique, social, sanitaire ou environnemental.
- les règles définissant les principaux traitements algorithmiques utilisés dans l'accomplissement de leurs missions, lorsque ces traitements fondent des décisions individuelles.

La Cacem, avec ses [158.944 habitants](http://www.cacem.fr/lagglo/histoire-competences.html), dépasse donc le seuil de 3500 habitants, sans qu'aucun jeu de données ne soit ouvert.

La loi ? Bof, on est loin.

## Action Directe

Peut-être que personne à la Cacem, mais ça vaut pour l'ensemble des autres collectivités et administrations de Martinique, ne sait comment démarrer un tel projet.
Peut-être que faute de budget (185 millions en 2019) ou faute de personnel (466 agents en 2019), la Cacem n'a pas les ressources pour démarrer un tel projet.

Puisqu'une demande d'accès à des documents (réseau d'eau) n'a pas abouti, une requête à la [CADA](https://www.cada.fr/) a été faite. __C'est le baton__.
L'année dernière, après avoir fait face à des réponses absurdes d'[Odyssi](https://www.odyssi.fr/) pour obtenir des documents, une plainte a la CNIL avait fait rapidement avancer les choses.

Mais le baton, seul, peut ne pas suffire. Alors offrons __la carotte__.
Pour montrer à quel point la constitution d'un jeu de données est accessible, j'ai créé un [dépôt github](https://github.com/glefait/opendata-cacem-dechets).
Celui-ci se contente d'aller chercher et combiner des données venant du site [collecte-dechets.cacem.fr](https://collecte-dechets.cacem.fr).
De ces données, une analyse triviale est réalisée pour identifier des [données potentiellement incomplètes](https://github.com/glefait/opendata-cacem-dechets/blob/main/data/analyse/collectes-manquantes.csv).

L'exercice est simple, l'implémentation est packagée de façon excessivement poussée (package python + docker + docker-compose, really ?), mais qui pourrait être réutilisé pour combiner des données déjà accessible sur l'intranet de la Cacem.

## Managers de territoires
La CTM s'est décidée à mettre du pognon dans le numérique.
Et pour une fois, pas pour installer de la fibre, chose qu'elle fait depuis 10 ou 20 ans sans que jamais une priorisation soit mise sur le déploiement jusqu'à l'abonné final.
Pour être taquin, on pourrait demander un petit graphe présentant, par an, le budget "fibre" vs le nombre d'abonnés fibre "CTM" avec un contrat activé.

Cette fois, la CTM investi dans le soft numérique.
C'est à dire dans ce qui passera dans les tuyaux.
On pourrait, et j'en ai vraiment envie, critiquer le fait que l'argent investi (un ticket de 150k€ par projet pour 4 solutions et 25k€ par projet pour 2 autres solutions) se fasse sans prise de participation au capital.
Et soit donc de la distribution de cash. Mais ce n'est pas le sujet du jour.

> L’aide prend la forme d’une subvention forfaitaire de 40 000 € sur 2 ans par Manager. 
> Son coût estimatif est de 600 000€ et pourra permettre le recrutement de 15 managers répartis équitablement sur le territoire.

![French Money, Larry Rivers, https://www.artic.edu/artworks/98352/french-money](/images/french-money-larry-rivers.jpg)

Le Manager de territoires, ça ressemble vaguement à un [Entrepreneur d'Intérêt Général](https://entrepreneur-interet-general.etalab.gouv.fr) (EIG).
Sauf que l'EIG réalise une mission d'intérêt public, préalablement identifiée, sur une période réduite (1 an).

Le manager de territoires semble s'addresser aux TPEs:
> Au travers de cet appel à projets, la Collectivité Territoriale de Martinique souhaite accompagner les 3 communautés d’agglomération à :
> - renforcer leur __politique de soutien aux TPE__ à travers le numérique
> - dynamiser les actions collectives numériques notamment dans les __zones d’activités__
> - apporter une __solution de proximité aux entreprises__ à travers des ressources humaines dédiées au numérique.

Ainsi le premier exemple choisi, _un community manager_, est assez parlant et vient empiéter sur une activité économique privée.

C'est un non-sens parce que ça va/peut écraser l'activité économique de quelques entreprises du numérique présente sur ce créneau.
Qui ne pourront probablement pas ouvrir leur gueule publiquement, parce que Alfred Marie-Jeanne est redoutée.
Et que la critique d'une collectivité peut signifier la mise au banc de marchés futurs.

C'est un non-sens parce qu'avant de proposer une aide sur le numérique, la CTM et les différentes collectivités devraient se concentrer sur l'amélioration de leur propre structure. 
\#paille \#poutre ?
Et de leur respect de leurs obligations légales, par exemple sur l'open data, le RGPD et la sécurisation de leurs système d'information.

C'est en ouvrant des marchés pour améliorer les bien communs que sont les services publics et para-publics et respecter leurs obligations légales, que l'on permettra aux acteurs économiques locaux d'exister et de pouvoir se développer correctement.
Sans empiéter sur des activités privées.
Sans soupoudrage d'argent public sans contrepartie parce qu'il y a des budgets à liquider.
