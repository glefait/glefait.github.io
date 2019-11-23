---
layout: post
title: Air Caraibes, une fidélisation ratée
excerpt_separator:  <!--more-->
categories:
  - digital
tags:
  - martinique
---
## TLDR;
Air Caraibes a mis en place plusieurs solutions pour fidéliser sa
clientèle. Si l'intention est bonne et pertinente, la mise en place est 
complètement ratée.

<!--more-->

Devant me déplacer (beaucoup) plus régulièrement vers la France 
hexagonale et parce qu'un partenariat existe avec [MartiniqueTech](https://martiniquetech.com), 
je me suis penché sur Air Caraibes.

## Premier essai : réservation via Martinique Tech
Lors de l'annonce du partenariat avec #mqtech, Air Caraibes avait gagné
quelques points de Karma. Malheureusement, la promesse n'est pas là et
le bilan est négatif.

### Bug 1 : le choix de la classe/tarif ne s'affiche pas correctement

Problème sur la sélection de la classe.

![Si tu caches un truc, caches le bien !](/images/air-caraibes-classe-tarif.png)

Cette partie m'a emmerdée un certain temps car je pensais au départ que
c'était elle qui m'empéchait de poursuivre.

### Bug 2 : la réservation en passant par la zone "association" ne fonctionne pas

Une fois les paramètres sélectionnés, au click, j'obtiens l'erreur
"4002 - 10002".

![Air Caraibes erreur reservation](/images/air-caraibes-erreur-reservation.png)

4002 - 10002 = -6000. Le compte est bon.
Mais je ne sais pas:
* si c'est une erreur du site ou de l'infra Air Caraibes
* si le code d'erreur est lié à amadeus
* ce que je dois faire de cette erreur et si elle est remontée 
directement dans leur système d'information (après tout, je suis loggué,
je pourrais être directement recontacté)

Revenir à la page précédente me fait resaisir l'ensemble des critères du parcours.

### Maladresse 1 : introduire des paramètres de tracking/publicités dans un code fonctionnel

Petit tour sur les codes JS de la page de réservation. 

```
var  eBACustomer = {
	version : "BetelNut_DX_1.3",
	ga : ["UA-3630593-1", "UA-3630593-5"], // Prod
	company : "AirCaraibes",
	compcur: "EUR",
	gaDomain :".aircaraibes.com",
	setAllowLinker : true,
	trackURL : "",
	env:'production',
	tool:'GA',
	siteSpeedSampleRate:50,
	homeDomain:["aircaraibes.com"],
	//sameUrlUsed : true, // If the same URL is used for all the website (BE pages and portal pages)
	modules: {'car':['UA-3630593-1'],//set it to '' to desactivate carTracking
	'hotel':'',//set it to '' to desactivate hotelTracking
	'errorManage': false,//set it to true to use error manage code (example on AA code)
	'fuelCharge': false,
	'doubleClick': true,
	'gaABTesting': ''} // only one account for ABTesting
};
```

Traquer les utilisateurs, c'est super (du moment qu'ils y ont consentis 
librement) __mais__ c'est maladroit de regrouper code de tracking, code 
publicitaire et code fonctionnel au même endroit.

En restant propre (d'un point de vue RGPD), ça implique de gérer toutes
les combinaisons possibles, techniquement c'est moche sauf si le contenu
est compilée en avance et s'adapte à la requête.

D'un point de vue opérationnel, ça augmente très fortement la 
probabilité que le script ou la configuration  fasse l'objet d'une 
entrée dans un [AdBlockeur](https://addons.mozilla.org/fr/firefox/addon/ublock-origin/). 
Si c'est le cas, paf c'est mort pour une 
partie de votre audience.

Néanmoins, même en autorisant tout, ça ne règle pas mon problème de 
réservation.

### Fausse promesse 1 : service pro ? 5% de réduction ? En fait non.

Puisque rien ne me permet de valider ma réservation, je contacte donc le
support "Affaires". On est un week-end, pas de réponse immédiate (sans
que ça soit anormal) = devoir attendre.

J'obtiens une réponse lundi à 9h. Par rapport à ma réservation au prix 
public de 1131 €, j'ai une proposition à 1169 €, qui correspond au prix
public du jour.

Après 14 emails, je finis par comprendre que :
* je n'aurais pas autre chose que le prix public

> La proposition tarifaire est celle disponible en machine.

* je n'aurais pas de geste commercial par rapport à la demande que je
n'ai pas réussi à faire pendant le weekend

Au vue des éléments, je ne vois aucun intérêt à passer par le service 
"Affaires" d'Air Caraibes.

Entre temps, parce que je m'attendais à un fail, j'ai regardé la carte
de membre.

## Première solution pour la fidélisation : la carte de membre
Réponse assez standard dans l'industrie : faire adhérer les clients 
à un programme fidélité qui va leur accorder un certain nombre de 
bénéfices en fonction de leur usage.

C'est bien, sous réserve que l'application ou le service en question ne
soit pas une passoire en terme de sécurité (hmm, hmm, no spoil).

### Bug 3 + 4 : maitriser la regex d'un email et  double validation ratée

Je veux créer un compte. Et comme d'habitude, je suffixe mon addresse
email du service/site sur lequel je suis. Pour Air Caraibes, ça donne
`guillem.lefait+aircaraibes@...`.

![2019, trop dur de gérer les + dans les emails](/images/air-caraibes-email-fucked.png)

Comment font-ils la validation pour ne pas réussir à faire passer cet
email. On est fin 2019, l'utilisation de `+` n'est pas accepté sur un
site marchand ?

La validation est faite en JS, faut donc débugger du code compacté. 

![Méthode 1](/images/air-caraibes-debug-email-validation.png)

On a donc une fonction qui fait un match. Ok, rien de fou. Voyons la regex.

```
EMAIL: new RegExp(/^\s*(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/),
```

Avec la représentation suivante sur [debuggex](https://www.debuggex.com/r/Gj94nlldumPIEfD_)

![Regex1 : mouais](/images/air-caraibes-email-regex1.png)

La regex est compliquée tout en étant permissive pour un environnement
de prod. Néanmoins, elle me valide mon email, so What The Fuck ?

Il y a donc une seconde validation d'email, celle-ci beaucoup plus stricte intégrée dans JQuery.

```
  jQuery.validator.addMethod("validateEmail", function (value, element) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    return emailReg.test(value);
  }); 
```
Sauf que cette regex est écrite avec les pieds. Dans un intervalle, on 
ne mets pas le signe `-` au milieu sans l'échapper.
Dans un mode strict (ce qui convient de faire si on considère qu'on
est sur un environnement de prod et sur un site marchand), cette regex
est invalide. Ce qui est étonnant, c'est que c'est correctement fait 
sur les deux autres intervalles : par chance ?

![Regex2 : NON](/images/air-caraibes-email-regex2.png)

Reste que même corrigée, cette regex empèche plein de chose.
* un nom qui ne contient que des charactères, tiret et point. On 
s'éloigne de ce qui est [réellement valide](https://en.wikipedia.org/wiki/Email_address#Local-part)
* une extension finale de nom de domaine entre 2 et 4 charactères

Résultat un double process, l'un qui autorise des choses qui sont
ensuite interdites.

### Bug 5 : je clique et ça fait rien

J'arrive sur une page qui me propose de créer une carte de fidélité.
Je clique.
Rien.

![Air Caraibes me veut infidèle](/images/air-caraibes-fidelite-impossible.png)

Ca se joue côté serveur, je pourrais tenter des trucs, mais tant pis.


## Conclusions

5 bugs détectés, 1 maladresse dans l'architecture des composants et une
promesse qui n'est pas respectée. Ca fait beaucoup d'autant que je n'ai
pas encore abordé la partie tracking & RGPD.

Dans le post sur la [stratégie digitale du CMT](/digital/2019/11/11/CMT-Strategie-digitale.html), 
je montrais qu'il y a un arbitrage à faire entre l'acquisition et la 
conversion et qu'on privilégie souvent l'acquisition parce que c'est le
plus simple et l'action avec le plus de ROI court terme.

C'est vrai dans un contexte de startup ou tu as besoin de valider une 
idée rapidement. Dans un contexte "branding" (qui me semble être 
l'objectif de la fidélisation pour Air Caraibes), c'est l'inverse.
Et c'est raté.
