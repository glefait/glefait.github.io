---
layout: post
title: Back dans les bacs
excerpt_separator:  <!--more-->
categories:
  - startup
tags:
  - startupschool
---

![Startup School](/images/startup-school-by-ycombinator.png "Startup School by YCombinator")

Le 20 aout, comme beaucoup, j'ai reçu deux mails de [startupschool](https://startupschool.org), le cours de création de startup de Y Combinator:

* Startup School Advisor Track: You are in!
* Apologies - Startup School Acceptance Error

Finalement, à la suite de ce cafouillage, l'ensemble des inscrits ont été admis, même si à priori, pour les "admis-recalés", il n'y aura pas de mentoring.

C'est donc le moment de (re)prendre le temps de bloguer.


## Keep it simple: static blog for the win

Les besoins sont très simples: pouvoir ajouter des posts. Pas besoin d'avoir un CMS complet, de gestion dynamique de contenu ou de gérer des commentaires.

Jekyll fait le job et plutôt bien.


![Jekyll](/images/logo-jekyll.png "Jekyll")

Faire un post consiste à créer et éditer un fichier.
Pour le déploiement, un `commit` suivi d'un deploy sur un repo `bare` avec un `hook` suffit.

    $ git add .
    $ git commit -m '1st post'
    $ git push deploy master

Avec un coût de maintenance et des besoins d'infrastructure quasi nul.

Pour un deploiement direct sur github et sur le bare:

    $ git remote set-url --add --push origin nymq:/www/www-guillem.git
    $ git remote set-url --add --push origin git@github.com:glefait/www-guillem.git

`git lfs` ne marche pas nativement avec un git bare, il faudrait installer un serveur lfs. Les images seront donc pour l'instant dans git.
