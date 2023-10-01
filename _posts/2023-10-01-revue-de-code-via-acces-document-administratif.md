---
layout: post
title: Retour sur le vote à partir du code obtenu par une demande d'accès à des documents administratifs.
excerpt_separator:  <!--more-->
categories:
  - martinique
tags:
  - security
---

## TL;DR
La confidentialité n'est pas assurée. Ce qui s'oppose aux articles suivants, qui font partie du règlement adopté lors de la plénière du 22 décembre 2022
>[Bien évidemment, le vote est protégé en confidentialité](https://www.youtube.com/live/GL43nmAYgp0?si=X2V20MQwu1A0UZDr&t=12950)
> 
>[La CTM s'engage à l'égard des personnes concernées, à prendre toute précaution utile afin de préserver la sécurité des informations et notamment qu'ells soient communiquées à des tiers non autorisés.](https://www.youtube.com/live/GL43nmAYgp0?si=gr2MmCrbNiO1S4uM&t=13020)

D'une part, en base de données, les votes (choix d'un drapeau/hymne) sont liés aux votants (email, ...).

D'autre part, une faille permettant de lire des fichiers a été identifiée. 
Si elle est exploitable, elle permet de récupérer les informations des votants (mais pas de leur vote).

Un certain nombre de problèmes (captcha, ...) ont néanmoins été corrigés et certaines bonnes pratiques de développement sont utilisés.
![Chien qui aboie, ne grossis pas. Proverbe chinois issue d'une traduction de série Netflix. Dall-e generated](/images/chien-aboie.jpg)

<!--more-->

## Hypothèses à vérifier
Les [trois hypothèses publiées dans un article début janvier](https://guillem.lefait.fr/martinique/2023/01/10/drapeau-comme-un-symptome.html#its-raining-dans-ton-vote) sont :
### Confidentialité 
Dans le point 1., j'indique : "`la CTM se targuait d’avoir un système assurant la confidentialité`" or "`l'email et le choix du votant sont présents simultanément lors d’un appel. On peut en douter si l’email et le choix du votant sont présents simultanément lors d’un appel`"

Les tables fournies, dont le MCD/ER Model est présenté ci-dessous, permettent de voir qu'il y a une relation directe entre la table des votes et la table des utilisateurs. Les colonnes entourées en rouge sont des colonnes utilisées mais non présentes dans le fichier de définition de la base fournie (`drapeaux_hymnes_2022.sql`).
![MCD databases. Les colonnes non fournies sont entourées en rouge.](/images/mcd.png)

On trouve d'ailleurs, dans le fichier `drapeaux_hymnes_2022_be/models/votes.js`, la fonction suivante : 

    export async function getVotesById(id) {
       const r = await pool.query(`
          SELECT vt.id id, utilisateur_id, inscrit_id, date_creation, est_unique, 
             rgpd_ok, code_validation, limesurvey_id    
          FROM vote vt
             JOIN inscrit ins ON vt.inscrit_id = ins.id 
             JOIN contribution con ON ins.contribution_id = con.id  
          WHERE vt.id = $1`, [id]);
       return r.rows[0];
    }

Cette fonction fait une jointure et associe directement `utilisateur_id` et `inscrit_id`.

Dès lors, puisqu'une jointure entre vote et utilisateur est possible et même qu'une fonction spécifique existe pour récupérer simultanément ID utilisateur et ID de choix de vote, il semble difficile de dire que le système peut assurer la confidentialité du vote.

Dans la partie cybersec, nous verrons un second problème concernant la confidentialité.

### Inutilité du captcha et l'arrivée du père Lustucru
Les points 2. et 3 de l'article du 10 janvier, indiquaient "un captcha inutile pour voter" et "une validation par email inutile".
Sur ces sujets, un fix a été détecté le 11.

![Tweet fix captcha](/images/2023-ctm-vote-tweet-captcha-fixed.png)

En effet, au départ, les routes n'étaient pas correctement protégées des appels directs. 
Dans le code fourni, ce n'est plus le cas.

En guise d'exemple, vérifions le flow d'une route. Des notes sont ajoutées :

- point d'entrée : routes/votes.js:addvote' -> controllers/votes.js:create()
- vérifie le captcha google avec verify(req.body.captcha_token)
  - si le captcha est invalide, retourne une 400 avec le message "Token captcha invalide !" (voir **Note 1**)
- vérifie `utilisateurModel.check_token(req.body.token)` et retourne une 400 avec 'Erreur : Token invalide' s'il n'est pas valide
  - la validité (du format ?) du token est vérifié avec ```await pool.query(`select is_valid_uuid($1::text)`,[token])``` (voir **Note 2**)
  - l'email est récupéré depuis la base sans vérification de la présence du token puis le couple <validité, email> est renvoyé :
```
    r = await pool.query(`select mail from mailcheck where uuid =  $1::text`,[token])
    const mail = r.rows[0]['mail']
    console.log(is_valid,mail)
    return [is_valid,mail]
```
- l'email est à nouveau récupéré `utilisateurModel.getMailByToken(req.body.token)` à partir du token depuis la base et la même table, avec cette fois la gestion de l'absence du token (voir **Note 3**) :
```
    const r = await pool.query(`SELECT mail FROM mailcheck WHERE uuid = $1`, [uuid]);  # uuid <=> token précédent
    return r.rows.length === 1? r.rows[0].mail: null;
```
- avec l'email, l'utilisateur est récupéré ou créé s'il n'existe pas
- les votes de l'utilisateur sont récupérés `model.getVotesByUtilisateur(uti_id)`, avec `uti_id` étant l'ID de l`utilisateur` 
- la ligne associée à la table `inscrit` est récupéré via `model.makeVote(req.body.inscrit_id)`
- à partir des votes de l'utilisateur, un booléen indique si l'utilisateur a déjà voté (pour le tour courant : 1 ou 2 et le type de vote : hymne ou drapeau) (Voir **Note 4**). Si l'utilisateur a déjà voté, une exception est lancé "Vous avez déjà voté"
- la liste complète des inscrits pour le tour courant est récupéré dans `inscrits = await inscritModel.getByTour()` (voir **Note 5**) :
```
    const r = await pool.query(`
		SELECT id  
		FROM inscrit 
		WHERE tour_id = ${id}`);
	return r.rows;
```
- puis est vérifié si l'inscrit demandé est bien présent dans ce tour `!inscrits.find(el => el.id == req.body.inscrit_id)`
- un vote est inséré dans la table et l'id est récupéré
- le vote est récupéré à partir de l'ID récupéré précédemment (voir **Notes 6**)
- un mail est envoyé, dans un contexte où le captcha a été validé (voir **Notes 7**)


#### Note 1
Changements entre le 10 janvier et le 11 janvier, on est maintenant post-captcha. (non-public info).
Je n'ai pas trouvé de définition de la méthode "is_valid_uuid". Est-elle définie dans un module postgres custom ? (non public info)
#### Note 3
Requête inutile puisque le mail a déjà été récupéré lors de l'appel précédent (minor perf issue).
#### Note 4
C'est ici étonnant de récupérer l'ensemble des votes de la base pour effectuer un filtre côté backend et non DB (minor perf issue).
#### Note 5
De la même façon, c'est étrange de récupérer pour chaque vote toutes les options de votes possibles, puis de vérifier sa validité côté backend et non directement en DB (minor perf issue).
#### Note 6
Comme pour le 3., on fait une requête alors que toutes les infos ont été récupérées précédemment, sauf le `limesurvey_id` mais qui aurait pu être également récupéré (minor perf issue).
### Note 7
Il n'y a pas de vérification de l'unicité de l'email. Dès lors, il semble toujours possible de pouvoir envoyer un mail à plusieurs destinataires en concaténant plusieurs emails.

### Conclusions

La confidentialité du vote n'est pas assurée.  

Par contre, dans la version de code partagé, l'envoi de mail est bien protégé par un captcha et le vote utilise correctement la validation par email.
Je n'ai d'ailleurs pas retrouvé la route initiale `ssend_email` et n'ayant pas reçu, __à raison__, l'historique git, je ne peux pas vérifier les changements intervenus entre ces dates.

Il y a probablement une multitude d'optimisations de performances possibles, mais vu 1. la volumétrie attendue, 2. le contexte de prod à fixer en urgence ce qui implique la nécessiter de pouvoir débugger rapidement font que les notes du type _minor perf issue_ ne sont pas un sujet s'ils sont le fruit d'un choix. 

Évidemment, les aspects purement techniques (bonne utilisation du captcha) sont plus faciles à résoudre que des aspects d'architecture (comment assurer la confidentialité d'un vote en ligne).
Ce qui était raisonnablement fixable l'a été. 
J'espère qu'il y a pu y avoir un post-mortem extensif et que l'analyse a été présentée au-delà des équipes techniques.

## Cybersec

![Cybersecurité, la partie qui fait peur. bouh.](/images/ctm-piwat.png)

Seul le code du backend et du front-end, "nettoyés" et sans versioning est disponible. 
Je n'ai donc pas d'information sur l'environnement système, ni sur la configuration réseau. 
Le site ayant été désactivé et n'ayant pas fait le fou pendant la période du vote, seul l'analyse du code "métier" fourni est possible.

### The good

On a vu que dans la version du code partagé, les fonctions les plus sensibles (validation de vote, envoi d'email) sont bien protégés derrière le captcha.

De même, les appels à la base de données sont correctement protégés, les requêtes étant paramétrées. 
Les seules requêtes avec intégration directe de chaines, utilisent des chaines internes (statiques ou construites), donc non susceptibles de donner lieu à une injection SQL.

Le code reste assez structuré. 
Les chaînes sensibles (connexion à la base de données ou au serveur email, le secret JWT) proviennent de l'environnement et ne sont pas en dur.

### The bad

Si les routes qui utilisent des mots de passes ou font des accès à la base sont, à priori, sécurisés, ce n'est pas le cas pour la récupération des fichiers.

Regardons la fonction `download`, exposée dans le router "fichier" (`routes.get('/download/:id/:file', controller.download);`), router qui est lui-même ajouté dans l'application (`app.use("/fichiers", fichiersRoutes);`) :

    export async function download(req, res) {
       const file = fs.createReadStream(`resources/contributions/${req.params.id}/${req.params.file}`);
       res.setHeader('Content-Disposition', `attachment: filename="${req.params.file}"`);
       file.pipe(res);
    }

Dans cette fonction, on lit un fichier à partir d'un path statique : `resources/contributions` et de deux paramètres : `id` et `file`, puis on renvoie ce fichier.

Que se passe-t-il, si un attaquant décide de fournir autre chose que les paramètres attendus ?
Par exemple, on pourrait vouloir tester ce qui se passe en essayant de remonter dans l'arborescence (en utilisant `..`).

Or, nous avons deux paramètres qui sont récupérés depuis l'url fourni, qui correspondent initialement au nom d'un répertoire.
On ne peut donc pas remonter directement sur plusieurs niveaux, puisqu'on devrait alors utiliser le caractère `/` qui ne permettrait plus à l'url d'être capturée par le routeur. 
Par contre, on peut _url encoder_ un des deux paramètres pour transformer `../../..` en `..%2F..%2F..`. et ainsi pouvoir se balader librement dans l'arborescence.

Pour tester, installons le backend et démarrons-le avec : 

    drapeaux_hymnes_2022_be$ node drapeaux_hymnes_2022.js

On peut alors jouer avec curl avec l'option `--path-as-is` et demander une route spécifique :

    $ curl --path-as-is 'http://127.0.0.1:3001/fichiers/download/../..%2Fpackage.json'
    {
      "name": "drapeaux_hymnes_2022_be",
      "version": "1.0.0",
      "description": "",
      "main": "drapeaux_hymnes_2022.js",
    [...]

Cette route n'est pas spécialement improbable, on peut considérer que sa découverte ne pose pas de difficulté particulière.
Parmi plusieurs autres informations, elle permet d'identifier le fichier principal de l'application : `drapeaux_hymnes_2022.js`.

Ainsi, au lieu de récupérer l'image d'un drapeau, on peut (sauf couche de protection supplémentaire) récupérer des fichiers du serveur. Est-ce grave ?

### The exploitation

Je pourrais être tenté, un peu facétieusement, de décrire cette faille comme un acte manqué, pour publier ce code en open-source. 
Sauf qu'évidemment, dans ce cadre (les méchants pirates) et à la différence d'une publication open-source (les gentils contributeurs) ou après une demande d'accès à un document administratif, les différentes urls et/ou secrets n'auraient pas été nettoyés.

Comme je n'ai aucune idée de comment le service a été démarré (docker / vm / ... ), ni de la bonne hygiène ou non (surtout en phase de bug fix en prod), je ne ferais pas de spéculation sur ce qui pourrait être trouvé et mené à d'autres pivots.
Néanmoins, une clé ssh sans passphrase qui traine, des mots de passes en dur dans l'historique `git`, des identifiants dans le `bash_history`, nombreux sont des risques réels d'avoir un tel accès.

Concentrons-nous donc sur ce qu'on sait accessible, toujours à priori et sauf couche de protection supplémentaire.

Dans le fichier principal (`drapeaux_hymnes_2022.js`), on trouve le code suivant :

    import dotenv from "dotenv";
    [...]
    dotenv.config();

Un dotenv (`.env`) est un fichier de configuration contenant un ensemble de paramètres de configuration, donc par exemple des mots de passes et urls privées.
C'est pratique puisque ces paramètres n'étant plus visible dans le code, il est possible de faire des revues de code de façon plus sécurisée (en supposant que le .env de prod ne soit pas versionné directement).

Évidemment, si l'attaquant peut lire le `.env`, alors il a directement accès à la configuration. Et donc aux mots de passes.

En dehors des serveurs Postgres et SMTP, qui sont probablement configurés pour n'accepter que des connexions internes (et donc à priori à l'abri, sauf rebond interne), on a un troisième secret intéressant défini dans le `.env`. 

Dans la fonction d'authentification, on peut lire :

    const decodedToken = jwt.verify(token, process.env.JWT_SECRET);
    const utilisateur = await model.getById(decodedToken.id);

Or si l'on contrôle `JWT_SECRET` on peut alors forger n'importe quelle clé d'authentification.
Sous réserve qu'un compte admin existe en base, ce qui est probable vu les routes de récupération de résultats (ex : `routes.get('/resultats', auth, ctrl.getResultats);`), on peut tester différents IDs par simple énumération (le champs `id` de la table `utilisateurs` étant un `SERIAL`).

Maintenant que nous avons accès au rôle admin, que pouvons-nous faire ?

Il y a trois routes protégées par auth :

    # routes/utilisateur.js
    routes.get('/:id', auth, ctrl.getOne);
    # routes/votes.js
    routes.get('/votants', auth, ctrl.getVotants);
    routes.get('/resultats', auth, ctrl.getResultats);

Pour la route des résultats, comme je n'ai pas reçu la description des tables de calcul, ni des scripts qui permettent de les calculer, je ne sais pas si elle est exploitable.

Mais les deux autres routes sont intéressantes. 
La première, qui appelle `getOne`, permets de récupérer une ligne de la table `utilisateur` (qui décrit les votants).
La deuxième, qui appelle `getVotants`, permets de récupérer directement la liste des emails de la table `utilisateur`.

On peut donc récupérer les informations (a minima l'email) des votants.

À ce stade, je ne peux pas dire qu'on peut récupérer le vote d'une personne en particulier.
Peut-être est-ce qu'il y a un script qui permet de le faire. 
Peut-être que le serveur de DB est accessible depuis l'extérieur et qu'on peut s'y connecter avec les identifiants trouvés dans le `.env`.
Ou pas.

### Conclusions

Une faille permettant de lire des fichiers a été identifiée. 
Si elle est exploitable (car non protégé par d'autres couches), elle permet à un attaquant motivé, mais sans difficulté particulière, de récupérer des informations sur les votants, notamment leur email.

Outre le problème de confidentialité, on ouvre la porte à une post-exploitation sur les votants exceptionnelle.
Ayant utilisé une adresse email custom, si j'avais reçu un email sur cette adresse annonçant les résultats, ou tout autre sujet autour du vote, venant d'un domaine sur le theme du vote de la CTM, j'aurais surement cliqué sur un lien présent dans l'email.

Aussi, la criticité n'est pas ici tant dans la possibilité d'extraire les emails, mais dans le fait que ça ouvre un boulevard à une attaque ultérieure des votants, ce qui à mon avis fait preuve d'un _égard_ limité _aux personnes concernées_.


## Annexes

### Frise temporelle

1. 19/01/2023 : demande formulée par email
2. 27/03/2023 : saisie CADA
3. 11/05/2023 : séance et avis positif
4. 26/07/2023 : réception de l'avis CADA
5. 01/09/2023 : réception d'une enveloppe de la CTM contenant :
   - un courrier de Serge Letchimy daté du 25/05/2023
   - une capture d'écran d'échanges de mails internes à la CTM du 31/08/2023
6. 01/09/2023 : email proposant différents moyens de contact
7. 02/09/2023 : idem
8. 13/09/2023 : idem
9. 14/09/2023 : dépôt d'un courrier indiquant plusieurs moyens de contact à plateau Roy
10. 26/09/2023 : réception de l'archive du code
11. 26/06/2023 : vérification du code reçu et confirmation de la réception à la CTM
11. 29/09/2023 : revue de code
12. 01/10/2023 : rédaction article


### Temps

Si je décompose le temps passé sur le sujet, j'obtiens les temps (approximatifs) suivants :

1. test initial : 0.5JH
2. revue de code/cybersec : 0.5JH
3. rédaction article : 0.5JH
4. demande et suivi "administratif" : 1JH

On voit donc que le temps passé à suivre la demande est quasiment le même que celui passé à analyser techniquement la solution.
Pour quel intérêt ? Strictement aucun. C'est simplement une barrière à l'entrée (d'autant qu'elle s'étale sur 9 mois) pour tous ceux qui voudraient réitérer la même démarche.
