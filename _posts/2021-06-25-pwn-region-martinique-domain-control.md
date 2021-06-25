---
layout: post
title: PwN region-martinique.mq - Domain control
excerpt_separator:  <!--more-->
categories:
  - martinique
tags:
  - security
---
## TLDR;

Le domaine **region-martinique.mq** est devenu obsolète avec la transformation de la région Martinique en Collectivité de Martinique (et ses domaines associés **ctm.mq** et **collectivitedemartinique.mq**).

Obsolète, mais toujours utilisé, parfois dans des (vieux) documents toujours à disposition du public. Parfois sur des sites de satellites ou de structures "partenaires". Parfois sur des sites du [service public](https://lannuaire.service-public.fr/martinique/martinique/service-local_172876).

Mais que se passe t-il lorsque ce domaine obsolète est acheté par un tiers ? On entre alors dans une autre dimension : la récupération de traffic et d'emails fantômes.

![The Battle, Conrad Marcarelli](/images/the-battle-conrad-marcarelli.jpg)

<!--more-->

Ainsi sur le site de **[service-public.fr](https://https://www.service-public.fr/)**, le très officiel site de l'administration Française, en cherchant Martinique et en allant sur "Services de l'assemblée", on arrive sur la page qui donne les informations suivantes :

![Page de la CTM, Service Public, Juin 2021](/images/service-public-martinique.png)

Tiens, un email en **region-martinique.mq**. 
Tiens, ce domaine est disponible à l'achat.
Tiens, c'est étrange, malgré le fait que le domaine soit disponible à l'achat, les entrées DNS sont toujours actives (si tu achètes un domaine un an, tant que personne ne le rachète, c'est bon, tu peux garder ta config !).

Si je l'achète, vais-je recevoir des messages adressés au sous-préfet, des poèmes adressé à notre petit Chaben du peuple ?
Vais-je recevoir des appels APIs sur des données publiées en open-data par la CTM mais malheureusement sur le mauvais domaine ?
Vais-je recevoir des appels étranges permettant au grand Pilotin de piloter des tuyaux depuis un QG sous-marin ? 

Comme toutes ces hypothèses sont intéressantes, sortons la CB.
Après une transaction de 30€ (domaine) + 15€ (frais d'installation), soit 48.33€ TTC, me voilà propriétaire du domaine.
Enfin plus ou moins. Parce l'achat n'est pas immédiatement validé. En attendant, je configure les DNS à minima pour gérer le web.

3 jours plus tard, l'achat est validé. C'est parti ! En fait, non. Les DNS n'ont pas été pris en compte.
Suit une période de presque 1 mois, ou je n'ai aucune réponse à mes demandes de suivi et ou je n'arrive pas à trouver quelqu'un qui n'est pas uniquement intéressé par le fonctionnement de mon abonnement Canal Plus.
Finalement, le 8 juin, après avoir réussi à joindre quelqu'un par téléphone (merci à lui) qui m'a indiqué une adresse email différente, puis a fait suivre le message en interne, en m'indiquant :

> Nous avons transmis votre courriel auprès de notre support technique afin de vérifier si la configuration peut être gérée par nos équipes.
> Nous reviendrons vers vous aussitôt que nous aurons un retour.

Evidemment (ou pas), je n'ai jamais eu de réponse. Néanmoins, dans la semaine du 14 Juin, la modification DNS a finalement été activé.

![Data incoming !](/images/zz-top-gimme-all-your-data.jpg)

Puisque le traffic web arrive bien et semble assez limité, je décide de passer sur l'email.
Après avoir installé postfix et configuré un catchall pour récupérer localement l'ensemble du traffic email, C'est parti.
Le premier test est d'utiliser le service [haveibeenpwned](https://haveibeenpwned.com/) sur le domaine pour avoir une idée du nombre de comptes sur lesquel il est possible d'obtenir des informations supplémentaires.

![haveibeenpwned, domain check](/images/haveibeenpwned-region-martinique.png)
Le résultat est conforme à ce qui est attendu.

Sauf que l'un des premiers messages que je réceptionne vient du senat, et relance un certain Michel C. au sujet d'un questionnaire concernant le CESECE.
Je reçois des messages contenant en PJ des demandes de RSA, de congé maladie, de certificat médical d'aptitude à la conduite, de demande de mise en congé pour préparer la Gold Cup, de création d'une association cultuelle avec les PV de présence, des notifications de banque ou d'activation de compte Apple Pay, l'information que les licences Teams ouvertes au début du confinement arrivent à expiration, ... .   
Je vois aussi des tentatives de connexion pour se connecter à la messagerie.

Bref, même si le traffic est réduit et contient 90% de spams, étant donné la taille de la structure initiale, les 10% restant sont clairement problématiques.

Ici un attaquant malveillant aurait pu :
1. récupérer l'ensemble des mots de passe en simulant la connexion, ce qui aurait probablement permis de rebondir sur d'autres services en réutilisant le mot de passe
2. envoyer des emails directs ou en réponse à des messages pour faciliter le déploiement d'un logiciel malveillant
3. tenter de se connecter à divers services dont l'email était un moyen de connexion

# Contact à la CTM ?

Comme d'habitude, impossible de savoir qui contacter à la CTM. Quelque soit le sujet, je n'ai jamais obtenu une réponse en contactant la ctm par l'adresse "officielle".

Un premier tweet tôt le matin, histoire de tenter de les forcer à répondre. Comme d'habitude, silence radio.
Un email en fin d'après-midi, en signalant ce que je voyais passer. Idem.

Finalement, c'est par un contact d'un réseau, que j'arrive à avoir confirmation que le message sera transmis en interne.
Et je suis appelé le lundi dans la soirée, par M.S. Le problème est expliqué et compris. 
J'informe que je suis bien sur disposé à rendre (transférer) le domaine à son propriétaire légitime. Le mardi, je renvoi le formulaire de transfert à Dom-Enic qui semble réagir et réponds :

> Nous vous remercions pour votre retour, le document a été transmis auprès du département concerné.
> Nous reviendrons vers vous aussitôt que le transfert sera effectué. 

Aujourd'hui, vendredi, je suis toujours propriétaire du domaine.
La configuration MX a donc été modifiée pour renvoyer vers des serveurs temporaires de la CTM.
Les emails collectées sont en cours de suppression sécurisée (via `srm`). 
Cette solution a été choisie par M.S et si elle m'arrange, je sais aussi que ça signifie qu'il y a des personnes qui ont envoyés des messages divers, attendant une réponse, qui n'arrivera jamais.



# That's ongoing !

L'opération est toujours en cours. Prochaines étapes :
1. Fin de la suppression des emails (ETA probablement le 27)
2. Finalisation du transfert (ETA : juillet ?)
3. Le remboursement du domaine sera versé à une association en perso directement par S.M vu la difficulté de le faire via les canaux de la CTM
4. Mise en place d'un fichier security.txt par la CTM
5. Decommissionnement propre du domaine par la CTM. Sinon, l'année prochaine je recommence.

## Conclusions

1. Un domaine, notamment s'il est utilisé par un service public doit être décommissionné correctement. Si personne n'a le temps en interne, embauchez deux ou trois "jeunes" pendant l'été. Et souffrez de payer le service 1 ou 2 années de plus, le temps d'être sur à 100% que le maximum a été fait.
2. Si quelqu'un contrôle votre domaine, c'est compliqué. Si le gestionnaire de domaine est inactif, même en cas d'urgence, c'est plus que compliqué.
3. Trop de données personnelles transitent par email. Ce n'est pas la bonne méthode, d'autant plus lorsque les données sont sensibles (données médicales ou d'association cultuelle) et que les destinataires appartiennent à des organisations différentes.
4. Qui est responsable lorsqu'un domaine est abandonné ? Les utilisateurs qui continuent d'utiliser des emails, l'organisation qui a abandonné le domaine, l'entité qui a repris le domaine ? 

