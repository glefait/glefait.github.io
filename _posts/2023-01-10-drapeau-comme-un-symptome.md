---
layout: post
title: L'organisation pour le vote (version 2023) d'un drapeau et un hymne, le symbole d'un symptôme. Et inversement.
excerpt_separator:  <!--more-->
categories:
  - martinique
tags:
  - security
---
## TLDR;

- captcha inutiles pour les bots
- spam d'emails party 
- vote sans validation et sans captcha qui implique un leak de données personnelles et permets d'empêcher quelqu'un de voter


> Les bidons veulent le guidon : laissez les donc
> 
> Qu'ils se cassent les dents, aidons les : Boum dedans

![Superposition bidons: https://twitter.com/superposition17/status/1171040157149159425](/images/superposition-bidons.jpeg)


<!--more-->

# Contexte

Contexte bâclé, on verra si j'enrichi plus tard.

## 2019, un vote pour la forme 

Voir [billet sur le vote 2019 organisé par la CTM](https://guillem.lefait.fr/wtf/2019/04/08/consultation-publique-fail-technique-CTM.html)

## 2023, premier tour embrumé

### Identité

Qui peut voter ? Les critères sont imprécis. Peut-être volontairement, mais ils révèlent à minima la difficulté de définir l'identité Martiniquaise.

### Ici, pas d'open-data, mais de l'open-voting

On ne peut pas dire que l'open-data soit le fort de ~~france~~ la Martinique. Par contre, organiser des votes sans sécurité, c'est une récidive.

### Aspect RGPD

Est-ce que parler de portabilité des données a un sens lors d'un vote pour un hymne sans qu'aucune information personnelle, en dehors de l'email fourni qui sert de clé potentielle de déduplication, ne soit demandée ?

La réponse est non.

## 2023, update pendant le premier tour

Au vu du fiasco, deux choses ont été ajoutées.

Premièrement un captcha.

Deuxièmement, une validation de l'accès au vote par email.

Ces deux points ne règlent rien, d'autant plus dans la façon dont ils ont été implémentés, mais si `Débouya pa péché`, on pourrait rajouter `Malprop, péché`.

# Second tour, la technique, aveugle, te regarde dans les yeux.


## Elle te dit, "ta gueule, t'as TOR" ?

TOR, le dark web, le réseau des pirates ([qui acceptent une ré-identification possible](https://fr.wikipedia.org/wiki/Tor_(r%C3%A9seau)#Failles_possibles)).

Sans parler de l'intérêt inhérent et réel de TOR, on peut se poser la question d'accepter des connexions via ce réseau lors d'une consultation qui fait l'objet d'une fraude avérée.

Incidemment, outre le vote en lui-même puisqu'on pourrait imaginer (on peut rêver) qu'un flag TOR soit associé à un contexte de vote, il est alors facile de dissimuler une "opération" d'attaque qui viserait outre le vote, à faire tomber l'infrastructure (_fiable et robuste_). 

## Michelle a perdu son CAPTCHA

L'une des solutions pour limiter l'utilisation de bot, serait d'utiliser un captcha, en l'occurrence, celui de Google.
Outre le fait que le contournement de captcha se fait aisément à un coût négligeable (de l'ordre de quelques euros pour 1000 résolutions), encore faut-il que le système de captcha soit correctement implémenté.

Un tel système peut fonctionner de deux façons différentes, soit en protégeant l'accès à une ressource, soit en associant un score (la probabilité que la demande soit celle d'un bot) à une ressource, ce qui permet ensuite et à postériori de définir un seuil et d'exclure (ou d'ignorer) les requêtes avec un score en dessous du seuil défini.

Ici, c'est la première solution qui a (semble avoir) été retenue. En effet, le bouton "je valide mon vote" n'apparaît que lorsque le captcha a été validé.

Or, un bot n'est pas un utilisateur classique. Et peut donc appeler directement les routes d'inscription, ce qui permet d'envoyer un email qui doit ensuite être validé.

On peut donc voir le captcha comme une sorte de marelle qui va être proposée aux "humains", alors que les bots se contenteront de faire un pas de côté.


## It's raining emails

La validation d'email se fait en deux étapes. Premièrement sur la route ssend_email, côté serveur, un `token` [uuid v4](https://fr.wikipedia.org/wiki/Universally_unique_identifier#Version_4) est généré et est envoyé à l'email défini.

Dans l'email envoyé, un lien utilisant le token redirige vers une route spécifique (qui vérifie que le token est bien à valider) et autorise à passer à l'étape de vote proprement dite. Le token joue ici le rôle de validation : on ne sait pas si la personne derrière l'écran est une personne qui est censée voter, mais à minima, elle est passée par l'étape de validation de l'email.

Evidemment, un envoi de mail est plutôt sensible. Mal paramétré, on pourrait au choix : 
1. multiplier les envois sur une adresse
2. envoyer massivement des emails à énormément de monde. Rappelons qu'ici on n'est pas protégé par le captcha.

Pour ce faire, on peut appeler la route, ou simplement exécuter un morceau de JS.

Et pour faciliter les choses (et maximiser l'impact négatif), on peut envoyer des emails à plusieurs adresses avec un seul appel simplement en les séparant par ";".

Derrière TOR.
Sans captcha.

Plusieurs risques :

1. péter l'infra email. Combien d'emails à envoyer pour avoir un impact et lequel : marquer le serveur comme spammeur, coût financier, ... ?

2. Faire voter des gens aléatoirement. Si 0.1% des gens cliquent sur du spam, combien vont cliquer pour aller voter pour le drapeau de la Martinique ? Disons 0.01%, soit 1 personne sur 10000, donc 10 millions de mails pour 1000 répondants random.

3. Casser l'infra de vote. Je ne parle pas ici de l'envoi de mail mais de la partie back-office. Quelle volumétrie la DB peut-elle absorber ? 


## It's raining Dans Ton Vote

Donc on peut envoyer pleins d'emails en sautant comme des cabris au dessus du captcha.

Mais peut-on voter directement ? Après tout, pourquoi s'embêter ?

Là, on rentre dans du subtil. Comme la CTM ne m'a pas contacté, je n'ai pas l'autorisation de "jouer" avec leur système. 
Et que je n'ai donc que deux essais pour vérifier la faisabilité technique.

Il y a donc une méthode `createVote` qui va traiter le triplet `<mail, inscrit_id, token>` (plus deux autres champs inutiles : `rgpd_ok` et `est_unique` que l'on peut positionner à 1 directement) et faire un post sur une route dédiée. Ici `inscrit_id` correspond à l'ID du drapeau ou de l'hymne, dont les IDs sont récupérables via une route accessible.

Première remarque, le mail est présent en même temps que le token. C'est étrange si l'on considère que le token est lui-même une vérification de l'email.
D'autant plus que la CTM se targuait d'avoir un système assurant la confidentialité. On peut en douter si l'email et le choix du votant sont présents simultanément lors d'un appel.

Deuxièmement, pas besoin de captcha pour valider le vote.

Troisièmement et plus improbable, pas besoin non plus de la validation par email. Peut-être que cette validation est utilisée pour détecter les votes invalides, néanmoins, il est possible d'insérer des votes directement.
Ce faisant, il y a deux impacts.

1. On peut savoir qui a voté pour un hymne et/ou pour un drapeau, puisqu'en cas de vote sur le même email, on reçoit le message suivant : `message:	"Vous avez déjà voté pour un hymne !"`. On fait mieux en termes de confidentialité.

2. On peut également et probablement voter pour un autre email que le sien. Peu importe que le vote soit ensuite considéré comme invalide, on va alors empêcher de voter la personne dont l'email a été utilisé (puisqu'avec le point 1., son vote sera considéré comme un doublon).



## En Martinique, personne ne vous entends crier
Et avec la baisse de la population et l'augmentation de l'âge moyen, (HEIN ? QU'EST-CE QU'IL A DIT MARAJO ?), ça ne fera qu'empirer.

Que faut-il faire pour remonter des problèmes à la CTM (et ailleurs par la même occasion, n'est-ce pas la CACEM et GBH) ?

J'ai envoyé un mail le 03 décembre 2022 remontant deux problèmes.
Le premier concernant l'expiration (depuis le 1er janvier 2022) du fichier [security.txt](https://www.collectivitedemartinique.mq/.well-known/security.txt), dont j'avais demandé l'ajout comme condition pour [rendre le domain region-martinique.mq](https://guillem.lefait.fr/martinique/2021/06/25/pwn-region-martinique-domain-control.html) à la CTM (la deuxième condition étant de verser le prix du domaine à une association).
Le deuxième concerne l'activation d'un module de debug en prod qui permet, entre autres, d'obtenir des informations de configuration de la DB.

J'ai fait part de mes doutes assez tôt.
J'ai à nouveau fait part d'une non-résolution de certains points.

Zéro prise de contact. Aucune méthodologie de remontée de problème définie.

> I BON KON SA


# So what ?

Faut-il y voir autre chose qu'un projet mal géré ?

Peut-être.

Déjà, il y a l'accumulation de projets mal gérés. 
Ensuite, en dehors du raté sur la partie "technique/sécurité", on voit que les ratés sont également sur des sujets réglementaires (non maîtrise du RGPD) et sur la communication (les vilains hackers qui ont cyber-attacké notre infrastructure fiable et robuste).
Or, il s'agit du deuxième vote en trois ans, sur le même sujet. En répétant les mêmes erreurs de délires techniques d'un et de légitimité.

Finalement, quel message de rassemblement lors du choix d'un hymne et d'un drapeau, lorsqu'on oppose mauvaise foi et dévalorisation à une remontée d'erreurs ?

> "Ta maison est en feu ! Ce n'était peut-être pas une bonne idée de stocker des barils d'essence dans la cheminée."

> "Vil gredin, tu cherches à semer l'effroi dans notre bonne ville fiable et robuste, sans doute pour voler nos goyaves !"



Rappelons simplement que lors de la prochaine séance plénière de la CTM, en sus de la validation du vote, se tiendra également le second round de l'affaire "[AM2P](https://www.pappers.fr/entreprise/am2p-etablissement-public-administratif-agence-martiniquaise-des-parcours-200051746)", [le premier round n'ayant permis à personne de comprendre de quoi il s'agissait](https://youtu.be/GL43nmAYgp0?t=40198).
Il est question d'argent public, d'une décision prise sans autorisation au moment du changement de mandature, de dispositions réglementaires mal suivies qui conduisent à devoir payer, pour rien, plus de 800k€ à la [SARL CAPS, centre d'affaires de la pointe Simon](https://www.pappers.fr/entreprise/caps-ctre-d-affaires-de-la-pointe-simon-483886909).

Une bonne séance à venir ...