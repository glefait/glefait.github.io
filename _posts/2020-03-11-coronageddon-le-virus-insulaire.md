---
layout: post
title: Coronageddon, le virus et l'insularité
excerpt_separator:  <!--more-->
categories:
  - santé, data
tags:
  - martinique
---
## TLDR;

![Coronavirus ou Carmageddon, pourquoi choisir ?. Licence CC](/images/coronageddon.png)

Ce rappel de jeunesse, le jeu Carmageddon datant de 1997, permet de se rendre compte du temps qui passe. Et plus le temps passe, plus une personne est exposée à l'impact du Coronavirus : impact faible pour les biens portants et les moins de 60 ans, impact probablement important pour l'économie, impact important pour les personnes vulnérables et impact (très) grave pour les services hospitaliers.

Jusqu'à quelques jours, ça _me_ paraissait être une information faisant consensus. Jusqu'à discuter avec des parents en sortie de crèche et avec des client(e)s d'un salon de coiffure.

<!--more-->

Pour une cliente, le Coronavirus est juste une grippe qui n'arrivera jamais en Martinique. C'est une mauvaise blague et il faut arrêter avec ça.

Pour un parent, la situation n'est pas de nature à annuler un déplacement en France, prévu fin Mars, pour animer un séminaire dans une grosse boite.

Or dans un phénomène exponentiel, lorsque tu commences à sentir les effets, il est probablement trop tard (cf, [la légende de l'échiquier de Sissa](https://fr.wikipedia.org/wiki/Probl%C3%A8me_de_l%27%C3%A9chiquier_de_Sissa)).

# Know your ennemies

On peut ne pas être satisfait du traitement médiatique du sujet, néanmoins, un tour rapide des différentes positions permet de voir qui anticipe quoi.

```
Ya got to know
Ya got to know
That when I say go, go, go
```
> Rage Against The Machine: Know Your Enemy

Pour Trump, le virus est une fake news, une grippe qui aura un vaccin rapidement à moins que le virus ne disparaisse miraculeusement. Aux US, la CDC fait l'objet de très fortes critiques pour avoir, par pression politique, limité l'accès aux tests.
En Chine, la première réaction a été de cacher autant que possible l'épidémie. Même réaction en Iran, l'ampleur de la crise est cachée jusqu'à ce qu'elle ne puisse plus être cachée.
En France, les réactions ont été mitigés et probablement pas à la hauteur : les militaires qui ont rapatriés les Français bloqués en Chine ont propagé l'épidémie. La réserve de masque FFP2, normalement suffisante n'est en fait pas suffisante (15 millions) et les autorités proposent de porter deux masques chirurgicaux "normaux" à la place, sans que les stocks ne soient non plus assurés. Les grands rassemblements sont interdits mais pas les transports en commun.
Dans plusieurs pays, les tests commencent à être abandonnés, indiquant la non possibilité de contenir les exposés au virus.

En terme de réactions, la Chine puis l'Italie ont finalement appliqués des zones de quarantaines géantes.
Trump a annoncé hier que les non résidents venant d’Europe (donc pas le UK) seront refoulés du traffic aérien.
Un grand nombre de boites, surtout celles qui y sont habituées et donc plutôt les boites tech, proposent de passer en télétravail ou de préparer à y passer complètement à court terme.
Le MIT ferme son campus jusqu'à la fin du semestre. D'autres grandes universités transitionnent massivement vers des cours en ligne pour une durée indéterminée.

Des initiatives diverses fleurissent pour engager, d'abord ceux qui le peuvent, à limiter leur impact : [#StayTheFuckHome](https://staythefuckhome.com/).


# Pourquoi c'est un sujet pour moi
Je ne suis pas vieux.
> Okay boomer !

Okay noob, je ne suis pas _si_ vieux. Globalement en bonne santé.
Je télé-travaille à 100% depuis quasiment 3 ans.
Mon risque strictement personnel est donc très faible.
Néanmoins, dès lors que vous êtes en contact avec une personne fragile, et c'est mon cas, le risque devient impossible à ignorer.

Sans tomber dans la paranoïa, en fonction des besoins, il peut-être nécessaire de se préparer à entrer en quarantaine préventive.
Vivre en Martinique implique de pouvoir vivre quelques jours en autonomie pendant la saison cyclonique, mais dans le cas présent, la durée de cette quarantaine n'aura probablement rien à voir avec le fait de pouvoir rester cloisonné 3 jours chez soi.

Faut-il prévoir 15 jours, 1 mois, 2 mois ou plus ?

Pour une personne fragile, dont l'objectif est de ne pas tomber malade, de tomber malade le plus tard possible en espérant le développement d'un vaccin, et dans tous les cas d'essayer de ne tomber malade qu'une fois que le système hospitalier sera à nouveau en mesure d'assurer des soins spécialisés, la durée de cette quarantaine risque d'être très, très longue.


# En martinique, il fait chaud, on s'en fou, non ?

Il y a trois particularités qui permettent d'avoir une situation moins problématique qu'ailleurs.
- Climat tropical : -10 points de propagation
- Transport publics limités : -10 points de propagation
- Insularité : +25 points de temps

L'utilisation généralisée de la voiture plutôt que d'un transport en commun et le fait qu'à priori et le climat, à priori moins favorable pour le virus, sont des facteurs intéressants. On en reviendrait presque à apprécier les retards de livraison du TCSP.

L'insularité permet également d'imaginer, sauf à accueillir l'ensemble des italiens croisiéristes contaminés pour leur vendre notre rhum à tout prix (coucou les malins députés et sénateurs qui ont introduit le [Duty Free pour les croisiéristes subventionnés](/tourisme/2019/11/26/dutyfree-la-niche-fiscale-de-la-resignation.html) avec nos impôts), que notre territoire va se retrouver en décalage du pic d'intensité sur les autres territoires. C'est intéressant puisque ça permet de gagner du temps et donc à la fois de mieux comprendre le virus et d'avoir eu le temps d'évaluer l'impact de telle ou telle politique.

D'autres particularités sont beaucoup moins favorables :
- Population agée : +20 points de population fragile
- Episode de brume de sable aléatoire : +5 points de dommage
- Nombre de lits : -10 points de soin

Si le virus a un impact d'autant plus fort sur les personnes âgées (15% de mortalité sur les 80 ans et plus), il est évident qu'un territoire avec une proportion de "vieux" va être plus impacté. Avec les chiffres de mortalités actuels, on est à un peu plus de 8000 morts.

La brume de sable pourrait avoir un rôle négatif en affaiblissant davantage les personnes à risques.


# Nombre de décès estimés

Attention, la modélisation est grossière, avec probablement une marge d'erreur importante des deux côtés, et avec des paramètres à affiner (d’où la marge importante dans les résultats).
Avec une courbe puissance, on peut modéliser le taux de mortalité en fonction de l'âge avec la fonction suivante `y = 0.000000014 * x^4.737`

Age   | taux de mortalité
------|----:
80+   | 14.8
70-79 |  8.0
60-79 |  3.6
50-79 |  1.3
40-79 |  0.4
0-40  |  0.2


En fonction des données actuellement disponible ([démographie de la martinique venant de l'insee](https://www.insee.fr/fr/statistiques/3695641#titre-bloc-4) et des taux de mortalité ci-dessus), on peut estimer le nombre de décès entre 8000 et 13000, soit entre 2 et 3% de la population, probablement réparti sur un peu plus d'une année.


Sur une année "normale", ce nombre est de [moins d'un pourcent](https://www.insee.fr/fr/statistiques/3695641#titre-bloc-4).
On risque donc d'avoir au moins le double de décès habituels pendant deux ans.


# Changements organisationnels probables
- Essor du télétravail
- Développement des systèmes de livraison à domicile et des points de collectes
- Gestion de rendez-vous et d'accès sans file d'attente
- Services faiblement dégradés (personnel réduit, rupture potentielle de la chaîne d'approvisionnement)
- Impact majeur sur le tourisme en général et sur l'industrie de la croisière en particulier
