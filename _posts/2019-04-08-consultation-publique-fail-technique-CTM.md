---
layout: post
title: Consultation pour l'adoption d'un drapeau et d'un hymne représentant la Martinique, l'erreur technique de la CTM.
excerpt_separator:  <!--more-->
categories:
  - wtf
tags:
  - martinique
---
## TLDR;
La CTM mis en place un processus pour choisir un hymne et un drapeau pour représenter la Martinique.
Mais le critère de sélection est le suffrage majoritaire sur une présélection de la CTM, et surtout la consultation est réalisé via un vote électronique mal préparé médiatiquement et techniquement.

<!--more-->

![meme "y u no do your fucking work ?"](/images/why-you-not-do-your-fucking-work.png)


## Partie 1 : la technique, on s'en fout. Ou pas.
Allons directement à l'essentiel. Une consultation de la population est une affaire sérieuse, notamment lorsque l'enjeu est de représenter "son" territoire et donc de sentir soi-même représenté.

Le vote électronique peut-être un moyen efficace de consulter une population mais introduit de nombreux problèmes techniques, comme l'ont montré l'élection "buggée" de Bush en 2000 ou l'abandon du vote électronique en Allemagne, au Royaume-Uni. La France, sur les conseils de l'ANSSI, a elle-meme fait marche arrière lors des élections législatives de 2017 : https://www.reuters.com/article/us-france-election-cyber-idUSKBN16D233.
C'est donc que le sujet est sérieux.

Aussi, l'annonce de la consultation coïncidant avec l'ouverture du scrutin d'une durée de 7 jours, je m'attendais à devoir suivre une procédure particulière d'authentification.
Première surprise avec l'apparition d'un texte clignotant furieusement m'indiquant "1 vote disponible" !

__WTF__ (Trad.: __que diantre__) ? La CTM me (re)connaît et fait mieux que ma DMP créée sur une stack nginx/lua/JS/python/kafka/MongodDB !?!

Avant de voir un peu plus haut "Bienvenue. Votre IP = x.x.x.x".
...

Non ?
...
Tu ne vas pas me dire que la CTM fait une consultation électronique avec un système basée l'utilisation unique d'une IP ?


-- edit --:
Modification de la homepage, l'adresse IP n'apparait plus, la méthode s'appuie t-elle uniquement sur les cookies ?

## Interlude
Jusqu'à ce moment précis, je n'ai pas encore vu les drapeaux ou entendu les hymnes. Lorsque je les découvre, stupeur.

![Drapeaux candidats](/images/ctm-2019-choix-drapeaux.png)

Les propositions artistiques ne sont pas celles que j'attendais. Tant pis, ce n'est pas le sujet.

## Et si l'accès au vote était conditionné à l'IP ?
### Utiliser l'IP (pendant ou à posteriori) = c'est pas bon
Votre adresse IP correspond à l'adresse IP publique qu'un fournisseur d'accès vous a affecté. Dans mon cas (et c'est à peu près vrai pour l'ensemble des FAIs), mon IP est fixe : sauf à ce que je débranche ma box pendant plusieurs heures/jours, je vais conserver mon adresse actuelle.
Néanmoins, avec une connexion mobile, les choses sont différentes. En fait, les (dé)connexions/changement d'antennes font qu'en général, l'adresse IP obtenue "change" régulièrement.

### Petit résumé:
- disponibilité du vote basée si l'IP a été utilisée ou non
- une IP est rattaché à un abonnement et lui-même est rattaché à un équipement
- une IP peut-être fixe ou dynamique

![Déja voté ? Toi non, mais de ton IP oui ...](/images/ctm-deja-vote.png)

### Si on filtre par IP, alors :
- un seul vote à l'intérieur d'un foyer puisque derrière la box (en Wifi) tout le monde obtient la même IP. Une maison de retraite avec une seule IP publique = 1 seul vote.
- un vote par IP disponible: vous pouvez voter chez vous, au siège de votre entreprise et chez McDonald's.
- dans tous les cas, soyez rapide car premier voté, seul à voter !  
- bien sur, si vous souhaitez voter en passant par des proxies ou depuis des machines hébergés sur des serveurs externes, c'est possible en étant organisé.


### Truquons !
Pour truquer un vote par IP, estimons déjà le nombre de votes nécessaires. La Martinique a une population de 365 000 (insee 2019). Voyons large et disons que 500 000 votes seront nécessaire (il est bien sur évident qu'avec 20 ou 30 000 votes, le système sera déjà suffisamment biaisé pour qu'il n'ait plus aucun sens).

L'instance amazon la moins chère coûte entre 0.5 et 3 centimes par heure en fonction des régions (disons alors 3 centimes). Sachant que cette tarification est facturée à la seconde après la première minute et qu'il faut 5 minutes par vote (en étant toujours très très large).
Comme l'équipe technique de la CTM ont essayé de limiter les dégâts, ils ont ajouté le service recaptcha de google. Pour résoudre ces captcha (Machine Learning + crowd sourcing d'indien/chinois), ça coûte entre 1 et 2 dollars les 1000 recaptcha (disons donc 2$ pour ne pas perdre du temps puisque les machines sont facturés en fonction du temps).

### Calculons.
- Hypothèse large: 500 000 * (0.03 / 60 * 5 + 2 / 1000) = 2250$

- Hypothèse réaliste: 100 000 * (0.015 / 60 * 3 + 2 / 1000) = 275$


## Mais le système de validation ne serait-il pas uniquement basé sur les cookies ?

Faisant voter ma compagne pour l'exercice, je me rends compte qu'en changeant de session (et donc en supprimant cache et cookies), on peut effectivement faire l'action de revoter.

Cependant, il est parfois intéressant en sécurité, d'être permissif en amont. L'utilisateur peut alors voter des milliers de fois, néanmoins lors de la prise en compte finale des votes, une déduplication par IP (ou autre identifiant ou combinaison d'empreintes) sera réalisé et l'insertion massive n'aura aucun impact.


## Conclusion:
Le projet gagnant concernant le drapeau obtient 8000€, celui pour l'hymne 10000€. Dans les deux cas, le deuxième et troisième remporte chacun et respectivement 3000 et 2000 euros.

Pour moins de 2500$, on biaise complètement le système en injectant 500 000 votes "malicieux".
En partant sur une hypothèse de biais plus réaliste (100 000 votes injectés, ce qui parait déjà énorme), un budget de moins de 250€ est suffisant.
Enfin, en imaginant qu'aucune déduplication sur IP/empreinte n'existe, alors une attaque est réalisable quasiment à coût nul.

Au delà de la fraude potentielle, on peut s'interroger sur la prise en compte des limitations "basiques": une IP ou un cookie n'est pas un moyen sur d'authentifier quelqu'un. En dehors des sondages sur skyrock, une IP ou un cookie ne devrait pas servir d'autorisation à un vote et encore moins à une consultation publique en ligne.

Considérer les utilisateurs ou les citoyens comme complètement responsables (personne ne va voter ou tenter de voter plusieurs fois) n'est généralement pas la méthode la plus adaptée pour obtenir un résultat indiscutable pour l'ensemble des acteurs, alors qu'obtenir un résultat indiscutable est parfois un moyen simple de sortir par le haut d'une situation contestée.
