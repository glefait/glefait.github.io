---
layout: post
title: Document protégé par mot de passe. Really ?
excerpt_separator:  <!--more-->
categories:
  - security
tags:
  - martinique
---
## TLDR;

Un document pdf d'analyse médicale ne s'ouvrait pas avec le mot de passe attendu.
Avec quelques règles sur le format, le mot de passe a été retrouvé en moins de 30 secondes.

On peut dès lors s'interroger sur la pertinence de ce type de protection.

<!--more-->

Un résultat d'analyse du laboratoire Biosanté ne s'ouvrait pas avec le mot de passe normalement adéquat.
Le format du mot de passe est de la forme : ABCddmmyyyy, où :
- ABC sont les trois premières lettres du nom de famille
- dd, mm et yyyy sont respectivement le jour, le mois et l'année de naissance.

Alors qu'un mot de passe alphanumérique de 3 + 8 = 11 caractères pourrait être assez sur, le fait qu'il soit basé sur un format spécifique le rends trivial à être cassé.

Sur une machine standard, le nombre de hash testé par seconde est d'environ 300k par seconde.

En supposant toutes les combinaisons de lettre acceptables, la première partie est donc composé de 26^3 chaines possibles (17256 < 20000).

Concernant la seconde partie, le domaine n'est pas 10^8 mais 366*100.

On a donc un ensemble de 650 millions de clés candidates. Ca semble beaucoup, mais dans le pire des cas, on est à 30 minutes de brute force.

Sur une machine dédiée (ou simplement en utilisant une carte graphique), avec des performances 10 à 100x plus importante, on est à quelques minutes (ou secondes) de calcul.

# We can even do better !

Si l'on connait quelques informations sur le mot de passe, on peut évidemment encore réduire le temps de calcul.

Dans mon cas, en spécifiant des lettres et les chiffres "attendues", le cassage s'est fait en 22 secondes.

    ./pdf2john.pl K200xxxxx.pdf > mon.super.hash
    ./john -2='ABC' -3='12359' -mask='?2?2?2?3?3?3?3?3?3?3?3' mon.super.hash
    Using default input encoding: UTF-8
    Loaded 1 password hash (PDF [MD5 SHA2 RC4/AES 32/64])
    Cost 1 (revision) is 3 for all loaded hashes
    Will run 8 OpenMP threads
    Press 'q' or Ctrl-C to abort, almost any other key for status
    0g 0:00:00:17 58,38% (ETA: 20:40:35) 0g/s 361526p/s 361526c/s 361526C/s ABC31233939..ABC39233939
    ABC12251933      (K200xxxxx.pdf)
    1g 0:00:00:22 DONE (2020-09-06 20:40) 0.04389g/s 359433p/s 359433c/s 359433C/s

# Une protection contre quoi ?

Si le fichier a un mot de passe facilement trouvable, quelle est l'objectif de la "protection" ?

- Un proche peut connaitre facilement nom et date de naissance.

- Une personne ayant piraté un compte email, a probablement également un certain nombre d'indices : l'email, déjà et les différents messages envoyés et reçus.

- Reste les indexeurs automatiques de documents, qu'ils soient en ligne ou sur un appareil.

Dans le cadre d'une prévisualisation via google drive, depuis une addresse gmail, le mot de passe est transmis et semble être stocké tant que le focus est sur l'email.

![password protected document](/images/password-protected-document-password-posted.png)

Est-ce qu'un document protégé mais prévisualisé est crawlé ou indexé ? A priori, ce n'est pas le cas sur google.
