---
layout: post
title: Tous antipass, l'application des benêts auto-fichés
excerpt_separator:  <!--more-->
categories:
  - martinique
tags:
  - security
---
## TLDR;

Tous anti-pass est une "web" application, créée par les amis de Philippot, le patriote-en-second, qui rassemble les gens opposés au passe sanitaire.
Le David le moins compétent de Martinique en ayant fait la promotion à son insu, il y avait forcément matière à y regarder de plus près.
Résultat, la base des utilisateurs enregistrée disponible. Deux fois.
Retour sur la divulgation responsable la plus chiante de l'année.

![antipass.fr, liberté de diffuser les données personnelles !](/images/anti-lulz.png)

<!--more-->

Si l'utilisation d'un passe sanitaire peut se discuter en l'évaluant à travers les dimensions de liberté publique, de responsabilité personnelle et de stratégie vaccinale, en période de pandémie ces discussions se heurtent à la réalité.
Lorsqu'on est en phase de (pré) saturation, comme ça été le cas en Juillet 2021 en Martinique, l'objectif n'est plus forcément d'assurer une liberté publique totale, mais de faire en sorte de rester en dessous de la limite qu'est capable d'encaisser le système hospitalier.
C'est à dire pas sans énormément de marge en Martinique.

Or, la grosse masse des gens opposés au passe sanitaire, sont des gens opposés au vaccin, hostile à la science, sans éducation technique/technologique. En fait opposés à Macron. Ce qui est justifié et légitime mais hors-sujet.
En Martinique, s'ajoute la défiance, également légitime, vis à vis d'un état éloigné des problèmes de la population et moins éloigné des problèmes de certains acteurs économique. Mais c'est tout aussi hors-sujet dans une pandémie mondiale.

On le voit en Martinique, les opposants proposent des traitements alternatifs, basés sur rien à part des expériences menés sur des hamsters et des solutions locales qui ont fait l'objet d'un dépôt de brevet (haha big pharma) plutôt que des études.
Je passe sur les idioties entendus : vaccin produit par des satanistes pédophiles, injection de puce 5G. Vu à la "TV".

## En dictature, laisses pas traîner tes PIIs*

* _PII_ Personally Identifiable information

Le petit père du peuple, Macron, en instaurant le passe sanitaire, aurait transformé le pays en dictature.
Qui dit dictature, dit OPSEC (see [thegrugq](https://twitter.com/thegrugq)).
Et utilisation de tor, de VPN, de messagerie et de système sécurisés.

Alors quand l'application des natio-révolutionnaires, en culotte mais sans cerveau, permet d'obtenir la liste des inscrits en 5 minutes chrono, je rigole.


![antipass.fr, liberté de diffuser les données personnelles !](/images/antipasslulz.png)

Une web app, utilisant le Framework [Strapi](https://strapi.io/), mal (non) protégé, permet de récupérer la liste des utilisateurs simplement en utilisant la pagination par défaut.
Et hop, voilà une liste de 2700 personnes : nom, prénom, email, pseudo, date de création de compte, ... . Et qui deviennent 4000 quelques jours plus tard. Quasiment de l'open-data !

On est loin des 60 000 personnes revendiquées, mais Éric Richermoz, m'indiquera que les 60k sont le nombre de personnes enregistrées à leur newsletter et non sur leur Web App. Pourquoi pas.

Se pose alors la question de quoi faire de cette information. Pas longtemps, mais quand même, l'envie de troller s'invite.
Sauf que ces données sont sensibles.
Elles sont relatives à un positionnement en partie politique.

Et si ces personnes sont à l'opposé de mes convictions, elles ont néanmoins le droit au respect de leur vie privée et à la protection de leurs données personnelles.
Comme elles ont le droit d'être soignées au mieux, toutes aussi irresponsables qu'elles soient.

L'alerte est donc envoyée par email. Sans réponse, un tweet permettra d'obtenir un contact et une correction très rapidement.
Une vérification quelques jours plus tard, montrera une deuxième possibilité d'obtenir un sous-ensemble de la base. Ce deuxième point sera aussi résolu rapidement.

## Conclusion

Comme pour la question du vaccin, j'ai le sentiment de voir des gens qui s'agitent sans maîtriser (comprendre) ce qu'ils font (ou disent).
Je ne fais pas de parallèle entre risque en sécurité informatique et risque médical, mais dans les deux cas, ces personnes n'ont pas le niveau.

Bref, chers anti-vaxx/pass, redescendez de vos tabourets.
Et à défaut de vaccin, mettez votre masque correctement.
