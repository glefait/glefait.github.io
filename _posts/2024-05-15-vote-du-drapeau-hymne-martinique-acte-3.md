---
layout: post
title: Vote du drapeau et de l'hymne en Martinique - acte 3, le tribunal administratif
excerpt_separator:  <!--more-->
categories:
  - martinique
tags:
  - security
---

## TL;DR

Après s'être fait éclater par de faux pirates avant de se faire éclater par de vrais hackers, ici, c'est par la voix de la loi, que des forbans sont passés et ont à nouveau frappé la CTM, la condamnant au silence. 
Comme un territoire sans hymne.

Car si le "tac pitac pitac tac" retenti dans les campagnes, frappé sur des canalisations vides, rythmant le passage de l'eau sur un rythme, rien n'est plus défini sur ce qui doit résonner dans les stades pour proclamer que celle-ci ou celui-là, est Martiniquais-e.



![Aline Goder : https://www.martinique.franceantilles.fr/actualite/vielocale/mon-travail-est-respecte-car-jai-ete-formee-par-des-maitres-du-tambour-194110.php](/images/tambour-mq.png)


## Contexte
Dans un premier [article pendant le vote de l’hymne et du drapeau de la Martinique, et l’épisode de la fausse cyber-attaque](https://guillem.lefait.fr/martinique/2023/01/10/drapeau-comme-un-symptome.html), j’avais fait une lancé quelques hypothèses techniques mais j’avais surtout mis l’accent sur la vraie mauvaise gestion de projet. 
Quelques mois après (9 !!), à la suite d’une [procédure administrative (saisie de la CADA, relances diverses), j’ai pu obtenir le code-source](https://guillem.lefait.fr/martinique/2023/10/01/revue-de-code-via-acces-document-administratif.html) qui m'avait permis de vérifier certaines hypothèses (pas de confidentialité des votes) et de mettre en évidence une faille (un attaquant peut lire des fichiers et accéder aux emails des votants).

Si quelques personnes s’étaient interrogées sur la possibilité d’aller devant le tribunal administratif pour contester le vote ou le résultat du vote, pour tout un tas de raisons, parfois fallacieuses, peu ont franchi le pas.

En effet, le tribunal administratif a ceci d’intéressant en comparaison d’une hypothèse formulée au bistrot : il nécessite pour être instruit, la rédaction d’un mémoire en principe un minimum structuré, auquel pourra répondre l’adversaire sur le même principe. Dès lors, il demande un effort dont le résultat s’obtient, à l’inverse du beaujolais, après une maturation certaine.


![Bar brawls : https://magazine.utoronto.ca/research-ideas/culture-society/why-young-men-fight-cause-of-bar-brawls/](/images/drunk-fight.png)

## introduction
Une [première requête](https://justice.pappers.fr/decision/fa5d9a411cfa156955c7e180913c0826808f2350), portée par Me Germany devant le juge des référés, a été rejetée le 13 janvier 2023. Le juge estime alors que puisque “_la collectivité territoriale de Martinique a indiqué avoir procédé aux correctifs nécessaires dès le 4 janvier 2023_” et que la requête “_ne justifie pas que les conditions techniques du déroulement de la consultation par le vote électronique porteraient une atteinte grave et manifestement illégale_“. Ici, en face d’arguments techniques imprécis, la bonne foi de la CTM est supposée.


La même personne portera une [nouvelle requête](https://justice.pappers.fr/decision/9aa32d2b8556eaadd429f7f7e7cf201d6efad59e) le 20 juin 2023 pour faire annuler la délibération de la CTM adoptant l’hymne et le drapeau de la Martinique.
Cette requête sera rejetée puisqu'au-delà du délai de deux mois prévu par l’article R. 421-1 du code de justice administrative. Poursuivant en appel, la conclusion sera similaire : même en étant motivé, il faut l’être dans les temps.

Dans le même temps, un groupe de deux autres personnes fait également appel à Me Germany, une de ces personnes étant directement impactée puisque victime, selon lui, de plagiat par l’un des candidats.
La CTM réponds alors avec trois arguments : 
la juridiction n’est pas compétente
les deux personnes n’ont pas intérêts à agir
les moyens (les arguments des plaignants) ne sont pas fondés

![Tribunal administratif - page 01](/images/ta-hymne-01.png)


Les juges du tribunal détruisent rapidement les deux premiers arguments : le tribunal est compétent et bien sûr que les deux personnes résidant en Martinique ont intérêt à agir.

La suite est plus intéressante.

# le juridique s'interesse à la technique
Le tribunal demande à la CTM des explications concernant les dysfonctionnements constatés par tous et la façon dont elle a invalidé les votes litigieux.
La CTM ne répondra pas. 

Dès lors, on ne peut que constater que le vote est irrégulier. Or si la procédure de consultation de la population est facultative (la CTM aurait pu ne pas la faire) comme la décision a été prise à l’aune d’un vote irrégulier, alors la délibération devient elle-même irrégulière.

Ici, il est important de noter que le silence de la CTM à la demande de précisions de la part du tribunal sur la méthodologie de “correction” d’un vote n’a rien de surprenant. Il est en fait impossible de pouvoir assurer la légitimité du résultat du vote dans les conditions où le vote a été réalisé.
Il ne s’agit ici pas d’incompétence des services informatiques ou même d’une gestion bancale de projet, mais à tout à voir avec une dimension politique qui n’a pas été correctement tranchée : qui peut prendre part au vote et comment (opérationnellement) s’en assurer (dans les conditions techniques définies) ?

Le tribunal essaie enfin de vérifier l’impact potentiel des votes frauduleux en demandant le décompte des voix pour chaque hymne.
Ici encore, la CTM ne répondra pas.
Or contrairement au point précédent, il ne me semble pas impossible qu’avec un résultat fortement en faveur de l’hymne retenu, le tribunal aurait pu conclure que les dysfonctionnements, avérés, ne soient pas de nature à remettre en cause le résultat final. 
Dès lors, cette non-réponse est étrange. Soit l’écart entre les hymnes est très faible et en conséquence la CTM a considéré que répondre conforterait le tribunal à conclure que le vote est irrégulier. Soit la CTM a considéré que la question précédente du tribunal à laquelle elle ne peut répondre, rendait l’issue inéluctable. Soit …

Dans tous les cas, sans réponse à ces deux questions, le tribunal décide d’annuler la décision de la CTM.

![Tribunal administratif - page 03](/images/ta-hymne-02.png)

## Next ?

On peut à nouveau regretter qu’une consultation populaire, qui sur le papier semble un moyen raisonnable de s’assurer de la légitimité d’une décision, se fasse éclater à cause d’une mauvaise organisation.

Au-delà des questions techniques sur l’organisation d’un vote, reste la question principale pour un territoire ouvert au monde : comment définir qui est martiniquais avec suffisamment de détails pour identifier qui l’est (suffisamment ?) et qui ne l’est pas ?

Car outre le drapeau, cette question s’est déjà posée, notamment lors des aides au retour. Qui faut-il aider ? Faut-il être extensif ou restrictif ? Est-ce une qualité (plutôt qu’un défaut) qui peut s’acquérir ou à l’inverse se perdre ? Avoir lu Fanon ou césaire donne-t-il un bonus ?



La CTM a publiquement fait un retour d’expérience concernant la cyber-attaque ce lundi, lors des matinées du Numérique (organisée par la CTM, bravo à eux), ce “nouvel” épisode du “nouveau” vote pourrait amener lui-aussi au partage d’un REX. En effet, la CTM n’est pas la seule collectivité à vouloir consulter sa population pour arbitrer (ou légitimer) une décision politique. Et j’espère qu’en Martinique, la consultation populaire pourra s’étendre à autre chose que le choix d’un drapeau ou d’hymne. Notons ici, que puisqu’un drapeau a été choisi, sauf nouvelle surprise du tribunal administratif, on est déjà à 50% de l’objectif.

Verre à moitié plein ou moitié vide ?
Ceci n’est pas une référence à la crise de l’eau.

![not a pipe, credit to odyssi](/images/this-is-not-a-pipe.png)
