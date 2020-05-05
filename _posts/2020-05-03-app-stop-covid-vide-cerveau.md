---
layout: post
title: Stop Covid, l'app qui vous vide le cerveau
excerpt_separator:  <!--more-->
categories:
  - digital
tags:
  - digital
---
## TLDR;

![I smell #fail meme](/images/i-smell-fail.png)

L'app de tracking #StopCovid, porté par Cedric O, a tout du projet qui va #fail.
* Des intervenants multiples (avec un historique pas forcément très extraordinaire)
* Des délais courts
* Une scalabilité et une attente importante
* Des options techniques liés à des contraintes politiques (et/ou d'égo)

Pourtant à moitié fracassé par le 1er ministre, ce qui aurait pu être l'occasion de se poser pour repartir sur des bases "meilleures", le projet continu sur sa lancée en direction d'un mur !

Fuck yeah, vas-y Robert, à fond !

<!--more-->

## Utile ou débile ?

Dans son principe, l'enregistrement d'un contact nécessite que deux appareils soient suffisamment proches, l'application ne se focalise donc que sur les contaminations directes.

Elle exclue de fait, la contamination via une surface tierce (exemple : un objet souillé) ou aérienne (une contamination propagée au dela d'un mètre par une climatisation ou un ventilateur).

Sur les contaminations directes, les app de tracking ne peuvent avoir une utilité que lorsque le nombre de tests réalisables est énorme pour deux raisons :

1. Etant imprécise, l'application va générer beaucoup d'alertes (mieux vaux être prévenu par erreur que par prévenu). Si on reçoit une alerte, que doit-on faire ? Rester à la maison ?
2. faute d'adoption à 100% et à cause de l'imprécision technique, il faudra néanmoins continuer à identifier les porteurs asymptomatiques. Or comme ils ne présentent pas de symptômes, ça implique de tester des gens à priori sains.

L'app de tracking va donc nécessiter de pouvoir tester massivement. Sans tests disponibles, elle laisse la décision à chaque individu.

## Alertes à Mal-y-wu !

Le principe actuel semble de détecter l'ensemble des personnes qui sont dans dans un périmètre donné.
Sans pour l'instant considérer les aspects sécuritaires qui permettrait de contourner le système volontairement ou non, cela signifie que l'on recevra une alerte dès lors qu'une personne qu'on a croisé dans les 15 (ou 21) derniers jours est positif au Covid19.

Pour un parisien qui prends le métro, combien de personnes croise-t-il à moins d'un mètre par jour ? 5, 10, 50, 100 ?

Si l'on considère une contamination à moyen terme de l'ordre de 50% de la population d'ici 18 mois, que l'on considère (en simplifiant à l'extrême) que la distribution sera linéaire dans le temps et homogène géographiquement, et qu'on démarre avec 5 à 10% de gens déjà contaminés, ça signifie qu'on va avoir environ (50 - 10) / 18 = 2.2% de gens qui seront contaminés à tout moment.

Si 50% de gens utilisent l'application, on aura à chaque contact "unique" (croiser 10 fois la même personne en 1 heure = 1 seul contact unique), 1.1% de chance de croiser une personne qui est contaminée et qui utilise l'application.

Si chaque personne contaminée est testée et déclenche une alerte, on aura donc 100 - 1.1 = 98.9% de ne pas recevoir d'alerte.

A raison de 10 contacts "uniques" rapprochés par jour, on aura 20% de chance de ne pas recevoir d'alerte au bout de 15 jours, et donc 80% de chance d'en recevoir _au moins_ une. 80% d'avoir une alerte tous les 15 jours ? Ca implique de devoir se tester tous les 15 jours ou d'accepter de passer quelques jours dehors avant de retourner en quarantaine à la maison.

### Mais c'est énorme !

![Mais c'est énorme](/images/mais-cest-enorme.jpg)

C'est énorme sauf que ça implique que l'ensemble des gens contaminés soient testés.

Ca sera donc (beaucoup) moins. Et beaucoup moins intéressant puisque l'information qu'on aura sera extrêmement parcellaire.

Donc soit on sera spammé de notifications, soit on en n'aura pas parce que faute de tests en nombre suffisant, les malades asymptomatiques ne remonteront pas d'information.

## La sécurité, c'est la centralisation !

Selon Cedric O, l'utilisation d'une solution centralisée serait plus sécurisée.
>  Ce risque est notamment dû au fait que, dans le cadre d’une approche « décentralisée », l’ensemble des crypto-identifiants des personnes testées positives circule sur l’ensemble des téléphones possédant l’application, ce qui rend le risque d’identification personnelle d’une personne contaminée beaucoup plus prégnant.

[StopCovid ou encore ?](https://medium.com/@cedric.o/stopcovid-ou-encore-b5794d99bb12)

Deux réponses sont possibles :
1. Si les crypto-identifiants sont surs, il n'y a aucun problème à ce qu'ils soient échangés.
2. Dans une application centralisée, au lieu de stocker uniquement les personnes malades, on pourrait considérer que l'on stocke l'ensemble des contacts (après tout, c'est _dangereux_ de stocker des crypto-identifiants localement).

> Pour le dire encore plus clairement, si vous installez une application de contact tracing selon le protocole DP3T (le protocole « décentralisé » le plus en vogue) vous aurez sur votre téléphone la liste de tous les crypto-identifiants des Français contaminés à l’instant t (voire des Européens si la solution est interopérable)

C'est bien sur faux. Une solution triviale consisterait à demander des informations sur la liste des contacts croisés localement (qui peut s'optimiser en faisant un aller-retour via un Bloom Filter afin de réduire le nombre de clés échangées).

Si l'identifiant est correctement choisi, une attaque par énumération est impossible.
Si vous ne me croyez pas, vous pouvez essayer de parcourir la [liste des clés privé de bitcoin](https://keys.lol/bitcoin/31765993227228627993638556771256527238057272173241266703557205827546087110) et devenir riche.
Ou pas.

![bitcoin rich or not](/images/bitcoin-rich.png)

## SFTU, ça sera open-source !

L'application sera open-source. Le code sera disponible. Bientôt. Plus tard.

Alors qu'ouvrir le code d'une application est à priori une bonne chose, le fait d'indiquer que le projet sera ouvert une fois que le projet sera bien entamé (comprendre à la fin), signifie qu'il ne s'agira "que" de montrer ce qui a été fait, pas de développer _ensemble_.

Impliquer les développeurs ? Obtenir du feedback ? On s'en fout, ça sera open-source à la fin. Quand le projet sera fini et qu'on daignera recevoir les avis du petit peuple des développeurs de tout poil.


## Mais c'est gratuit !

C'est gratuit ? Pas vraiment. Le développement de l'application ne sera pas facturé.
Ce qui ne veut pas dire que ce développement ne fera pas l'objet de subventions diverses et à minima de crédit d'impôt CII/CIR.
Bref, c'est un cadeau à moitié ou au trois-quart subventionné ou remboursé par de l'argent public.

Enfin, et c'est beaucoup plus gênant, on ne sait pas ce que coûtera l'usage de l'application, qui sera en charge de  l'infrastructure, qui s'occupera de maintenir l'application et pendant combien de temps.

## J'y comprends rien mais une app peut pas faire de mal ?

Parler d'un truc qu'on ne maîtrise pas, en utilisant sa reliure d'expert sur un autre sujet est pratique courante.
C'est aussi très pratique lorsque les experts du sujet ne sont pas d'accord avec vous.

> Pour stopper la circulation du virus, il est proposé d’identifier les sujets contacts de patients contagieux pour les isoler le plus tôt possible. Leur identification peut être aidée par des applications d’intelligence artificielle (IA), telles que StopCovid.

[*communiqué de l'académie nationale de médecine au sujet de StopCovid*](http://www.academie-medecine.fr/communique-de-lacademie-nationale-de-medecine-lutilisation-de-smartphones-pour-le-suivi-du-deconfinement-du-covid-19-en-france/)

[![Une AI ? Presque, des IFs !](/images/if-ai.png)](https://twitter.com/iamdevloper/status/830070592611172357)

Quel est le rapport entre de l'IA et l'application StopCovid ? Pour l'instant aucun.

Soit ce qui leur a été présenté ne correspond pas à la réalité actuelle de l'application, soit ils n'ont pas compris le principe de l'application.
Leur avis n'a donc pas plus de valeur que l'avis d'une personne qui n'a pas compris la question ou qui répond à une autre question.

## Gnagnagna, facile de critiquer, ...

Il y a pleins de moyen d'agir et ça a été très bien dit par [Tomas Pueyo](https://medium.com/@tomaspueyo/coronavirus-the-hammer-and-the-dance-be9337092b56).

L'objectif devrait être de pouvoir maîtriser (et réduire) le facteur de contamination.
Une App de tracking batie sur un protocole bancal est un [contresens](https://www.schneier.com/blog/archives/2020/05/me_on_covad-19_.html).

En dehors de la recherche médicale, l'effort devrait être porté vers la massification des tests et la capacité à réduire le facteur de contamination.

Or pour réduire ce facteur, il faut mieux comprendre les conditions qui permettent la contamination. Ce qui se fait via du contact tracing, pas avec une app bricolée par des SSII.

Pour réduire les besoins en tests, des solutions alternatives existent : détecter des signes faibles (changement rythme cardiaque, taux d'oxygène, ...), mélanger des prélévements et faire une recherche binaire en cas de résultat positif, [test des canalisations sanitaires](https://twitter.com/CrowdvBank/status/1254004789488185344) pour évaluer le nombre de personnes contaminées sur un quartier (voire réussir à les traquer en continuant à prélever en suivant les canalisations), ... .

Autre point d'inquiétude, le développement parallèles d'une myriade d'applications de ce style. Exemple à la réunion ou des confrères ultramarins développent une solution adhoc appelée [https://www.franceinter.fr/sciences/covid-19-la-reunion-premier-departement-a-beneficier-d-un-application-d-alerte]("Alertanoo").
