---
layout: post
title: Des codes pays, une concession
excerpt_separator:  <!--more-->
categories:
  - tech
tags:
  - tld
---

## TL;DR

Une [consultation pour gérer les extensions régionales (.mq, .gp, .gf, .re, .yt) via une concession de service public](https://www.marches-publics.gouv.fr/app.php/entreprise/consultation/2792918) s’est (enfin) ouverte.

Point sur l'état actuel avec un focus sur la situation en Martinique.

Quelques remarques sur le marché : du bon (un retour vers la normalité et la cybersécurité), du moins bon (chiffrage peu réaliste du marché, non prise en compte des acteurs locaux) et de l'innatendu (préparer à une re-délégation).

![Metro Traffic Control, by Chris Faust](/images/metro-traffic-control.jpeg)

<!--more-->

## Contexte

La gestion de l’opérateur de registre du .mq est catastrophique depuis bien longtemps. 

Catastrophique sur le plan organisationnel, ce qui m’a conduit, en 2020, dans une [https://guillem.lefait.fr/martinique/2021/06/25/pwn-region-martinique-domain-control.html](expérience d’acquisition d’un domaine mal décommissionné de la CTM suivi d’un avant son transfert à son propriétaire légitime), a une remédiation qui s’est étalée sur plusieurs mois !

Catastrophique d’un point de vue cybersécurité puisque les systèmes étant à la fois obsolète, non sécurisé et non monitoré, j’ai pu mettre en évidence en 2023, une [https://guillem.lefait.fr/security-log#dom-enic-groupe-canal](injection SQL permettant d’exfiltrer la base de production) et ainsi de récupérer les informations de mon compte personnel ainsi que mot de passe, hashé en md5 sans sel ! Notons que le groupe Canal + a été réactif à la suite de la divulgation en apportant des correctifs.

Catastrophique d’un point de vue réglementaire, puisque la situation actuelle ne respecte pas la législation en vigueur et que l’état, pourtant au fait des dysfonctionnements graves, a persisté à temporiser.

Si mes aventures avec le .mq ont commencées il y a quelques années (les joies de la découvertes des spécificités locales), de nombreuses personnes, groupes d'intérêts et associations ont essayé de résoudre la situation depuis au moins une quinzaine d'années.

Je suis d'ailleurs souvent critique avec les collectivités locales mais je leur reconnais sur ce sujet un travail particulier, à la fois du personnel politique et des cadres administratifs.

Ici, c'est l'état qui est défaillant à 100% en respectant pas le cadre qu'il a lui même fixé.

## Concessions ?

Pour revenir à la concession de service publique, plusieurs éléments sont à noter.

__Premièrement__, les aspects cybersécurité sont correctement décrits, y compris le respect de NIS2, un registre étant considéré comme une entité essentielle.
Le nombre de règles cyber et organisationnelles (procédure extrajudiciaire de règlement des litiges, procédure permettant à un tiers de contacter un titulaire ayant demandé l’anonymat, procédure pour la levée d’anonymat, [procédure contradictoire (article L45.6 du CPCE)](https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000028727628))permettent de prendre la mesure de la difficulté de gérer un registre. Et de voir que pour le .mq, on part de zéro.


__Deuxièmement__, le montant de la concession est estimée à 830ke sur 10 ans pour le ".mq".
![tableau des lots sur 10 ans](/images/concession-service-public-extension-regionales-lots-sur-10-ans.png)

Sachant que l’extension rassemble actuellement moins d'un millier de domaines, à périmètre constant, une règle de trois entraine un prix de 80€ par an et par domaine.

On peut considérer que le prix n'est pas important et qu'acheter un .mq, cinq à dix fois plus cher qu'un .fr n'est pas un problème. 

On peut d’ailleurs s’étonner que le marché des extensions régionales soit spécifique. Vu les coûts de maintenance associées à une gestion respectant réellement l’état de l’art et le cadre réglementaire à la fois en terme de cybersécurité et de gouvernance, on aurait pu s’attendre à ce qu’un acteur ne soit en mesure de répondre qu’avec un volume minimal, ce qui n’est pas assuré uniquement avec les extensions régionales, mais qui le devient si on y ajoute le « .fr ».

Bien sur on peut imaginer qu'avec une gestion "normale", on puisse augmenter ce volume, mais en considérant chaque lot indépendamment, il sera quasi impossible de sortir une offre cohérente avec celles proposées actuellement par l'AFNIC, qui offre un [prix de vente identique à chaque extension régionale ultramarine](https://www.afnic.fr/wp-media/uploads/2023/12/afnic-nouveau-tarif-enregistrement-2024.pdf).
![Tarif 2024 de l'AFNIC: 5.07€ HT quelque soit l'extension](/images/afnic-tarif-domaines-2024.png)

Chez OVH, par exemple, le tarif du jour est de 5.59€ HT pour les extensions .fr, .pm, .re et de 5.79€ HT pour les extensions .yt, .tf, .wf, soit une marge d'environ 10%.


__Troisièmement__, et c’est le point qui pique le plus, on se rends compte que l’état gère ce dossier de loin, sans consulter in-fine les acteurs locaux pourtant impliqués.

Martinique Digitale a lancé une consultation sur la gestion du registre en début d'année. Si le projet est toujours en discussion, même si un consensus avait été trouvé, aurait-il eu un impact alors que le marché a été passé sans même prévenir les acteurs locaux ?

Or les règles de l’ICANN indique que la gestion d’une extension doit permettre de rassembler les acteurs impliqués par celle-ci. 
Si la CTM et ses satellites sont utilisateurs du .mq, ce n’est pas le cas, à raison, des structures nationales. 
Dès lors, on pourrait considérer que l’état, en laissant péricliter l’extension aussi longtemps en dehors de tout cadre juridique, a fait preuve d’abandon manifeste dans la gestion de sa souveraineté.

Est-il alors le mieux placé pour définir de façon unilatéral le cadre du marché ?

Un point spécifique m'intéresse : la gestion d'une panne généralisée ou d'une destruction d'infrastructure.
![plan de continuité](concession-service-public-extension-regionales-plan-continuite.png)

Si on ajoute l'augmentation très importante ces derniers mois des actes de sabotages concernant les cables sous-marins, on peut se poser une question simple : si l'europe continentale est déconnectée, est-ce que les extensions ultra-marine restent fonctionnelles ?
Rien dans le document ne précise ce point, ni n'indique si une installation "locale" est souhaitée.


Finalement, __quatrième__ remarque, car il n’aura pas échappé au lecteur attentif, que l’état, dans le document "IB-13-OE-ultra-marins-2025_Cahier des charges mq.pdf" en page 9, indique
> A la demande de l’Etat, l’office d’enregistrement effectue toute démarche auprès de l’Internet Corporation for Assigned Names and Numbers (ICANN) en vue d’une éventuelle re-délégation du domaine « .mq »

Est-ce une façon de laisser respirer les autonomistes et de rêver les indépendantistes ?


Dans tous les cas, espérons qu’à la suite de cette consultation, les décrets adéquats soient enfin promulgués.
Et qu’une gestion normale de cette extension permette d’affirmer, sans risque, l’identité de nos territoires.
