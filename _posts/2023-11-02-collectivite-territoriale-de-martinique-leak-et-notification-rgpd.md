---
layout: post
title: Discussion avec la CTM autour de la notification post-leak 
excerpt_separator:  <!--more-->
categories:
  - martinique
tags:
  - security
---

## TL;DR

Si personne n'est à l'abri de se faire hacker, cet évènement peut être l'occasion d'une prise de conscience.
Et à défaut de pouvoir revenir en arrière sur un vol de données, de prendre ses responsabilités à la fois sur la sécurisation de son SI et dans le suivi du leak, en communiquant aux personnes affectées par ce vol de données, de façon claire et précise.

Or, la CTM, sur cette communication n'a pas montré une quelconque prise de conscience.
La communication est globale au lieu d'être individuelle (par facilité ... certains pourraient dire par flemme), et présente délibérément une histoire de bisounours bien moins critique que la réalité, annihilant ainsi la chance pour les personnes affectées de se sentir menacées et donc concernées.

Néanmoins, contrairement à d'habitude, la CTM m'a répondu. Voyons donc si une amélioration est possible.

![hacking a kettle, credits packetlabs.net](/images/hackable_kettle.jpg)
<!--more-->

## Contexte

Dans une présentation au [CESECEM](https://fr.wikipedia.org/wiki/Conseil_%C3%A9conomique,_social,_environnemental,_de_la_culture_et_de_l%27%C3%A9ducation_de_Martinique), le 19 juin, j'alertais sur le risque autour de l'utilisation des données personnelles et m'étonnait déjà du silence de la CTM autour de la publication des données volées.
![presentation cesecem](/images/presentation-cesecem-19-06-2023.png)

Tombant par hasard sur le site de la CTM, réactivé à l'arrache, je découvre [un document](https://www.collectivitedemartinique.mq/2023/09/15/information-importante-sur-lattaque-informatique-du-16-mai-2023/) qui semble être une notification publique.

Le 23 octobre, dans un email envoyé au DPO de la CTM, je demandais :
1. si la CTM considérait que le document présenté sur le site servait de communication publique ([article 34. du RGPD](https://www.cnil.fr/fr/reglement-europeen-protection-donnees/chapitre4#Article34))
2. des détails ayant permis de considérer que la communication aux personnes concernées exigerait un effort disproportionné, puisque j'avais proposé de discuter d'un prototype permettant de faire cette communication, sans jamais avoir eu de réponse
3. pourquoi la description des données ayant fuité était largement minimisé, réduisant ainsi la perception du risque par les personnes concernées 

[L'email envoyé est présenté en Annexe](#mon-email-du-23-octobre).

J'ai pu confirmer lors d'un appel téléphonique que mon email avait bien été reçu. Pas si obvious vu mes [précédentes aventures](/martinique/2023/10/01/revue-de-code-via-acces-document-administratif.html#frise-temporelle). 

## Analyse de la réponse de la CTM (du 31 octobre)

Certaines banalités ou déclarations d'intention sans démonstration d'une quelconque réalité sont ignorés, néanmoins, [l'email reçu dans sa forme originale est présenté en Annexe](#la-réponse-de-la-ctm-du-31-octobre).

Extrayons donc les informations pertinentes :
> - une notification initiale, puis une notification complémentaires de la violation de données ont été faites à la (CNIL) ;
> - conformément à son obligation d’information issue du RGPD, la CTM à adresser une lettre circulaire aux agents en poste (siège et terrain) et réaliser une communication publique via son site web qui est en construction


Les réponses transmises ne contiennent pas de réponse directe à mes questions, et en plus, **je n'avais pas moi-même** séparé les problématiques 1 et 2 dans mon premier email.

Allons-y néanmoins.
### Sur la communication publique (1)

> conformément à son obligation d’information issue du RGPD, la CTM à adresser une lettre circulaire aux agents en poste (siège et terrain) et réaliser une communication publique via son site web qui est en construction

Le document est bien une communication publique, telle que décrite dans l'article 34.3.c. 
On comprend par ailleurs qu'une circulaire a également été transmise aux agents de la CTM.

Voyons donc les conséquences de l'utilisation de cet article.

### Sur l'effort disproportionné nécessitant une communication globale (2)
![so manyfiles cant read'em all](/images/so-many-files-cant-read-em-all.png)

Ici aucune réponse claire dans l'email reçu le 31.

Il est indiqué que l'ANSSI est venu aider et que la CTM a mobilisé une cellule de gestion de crise et d'experts en cybersécurité. 
La CTM indique une deuxième fois avoir fait appel à des experts en cybersécurité, pour les accompagner cette fois.

Est-ce que l'ANSSI, les experts en cybersécurité ou l'autorité de contrôle ont conseillé à la CTM de considérer que l'effort de communication individuel était disproportionné ou est-ce la CTM elle-même qui a pris cette décision ?
Dans tous les cas, sur quelle(s) base(s) et à partir de quelle(s) analyse(s) ?
Impossible de le savoir avec la réponse transmise qui semble utiliser le fait qu'une enquête judiciaire soit en cours pour ne pas donner de détails.

#### Analyse personnelle

Deux possibilités, soit la CTM est parvenue seule à cette analyse, soit l'ANSSI, la CNIL ou un prestataire lui a recommandé de faire une notification globale.

Dans les deux cas, une analyse doit avoir été faite. Voyons donc les [guidelines de l'EDPB concernant les fuites de données](https://edpb.europa.eu/our-work-tools/documents/public-consultations/2022/guidelines-92022-personal-data-breach_en).

> (83) The GDPR states that communication of a breach to individuals should be made __“without undue delay,” which means as soon as possible__.

> (88) In principle, the relevant breach should be communicated to the affected data subjects directly, unless doing so would involve a __disproportionate effort__. In such a case, there shall instead be a public communication or similar measure whereby the data subjects are informed in an equally effective manner
>
> (90) Examples of transparent communication methods include direct messaging (e.g. email, SMS, direct message), prominent website banners or notification, postal communications and prominent advertisements in print media. __A notification solely confined within a press release or corporate blog would not be an effective means of communicating a breach to an individual__.
>
> (94) Controllers might therefore wish to contact and consult the supervisory authority not only to seek advice about informing data subjects about a breach in accordance with Article 34, but also on the  appropriate messages to be sent to, and the most appropriate way to contact, individuals.
> 
> 

Je passe sur la nécessité de prévenir rapidement, notamment parce qu'elle nécessite à minima de pouvoir réouvrir certains services.

Le point (90), sur la communication "transparente", indique qu'un post sur un blog n'est pas suffisant et que cette communication doit être réalisée sur plusieurs médias de façon à accroitre la couverture du message de notification.
Suivant pourtant l'actualité locale, je n'ai vu aucune communication autour de ce sujet.
Or dans un article de [juin dans le journal France-Antilles](https://www.martinique.franceantilles.fr/actualite/politique/cyberattaque-a-la-ctm-des-donnees-ont-bien-ete-derobees-939184.php), le discours semblait différent :
> Les équipes techniques de la CTM, accompagnées d'experts en cybersécurité et en gestion de crise, sont mobilisées pour identifier les données impactées et notifier, le cas échéant, les personnes concernées, « dans les plus brefs délais ».
![article France-Antilles](/images/france-antilles-juin-2023-ctm-notification.png)

__Dès lors, cette communication, sans publicité sur un site en construction, respecte-t-elle ces principes ?__

Le point (94) indique que cette communication peut être faite avec et/ou validé par l'autorité. Encore faut-il que cette autorité se base sur une déclaration sincère et extensive de la fuite de données.

Le point (88) est ici le point majeur puisqu'il définit la possibilité d'avoir une communication globale (et non individuelle) si cette communication individuelle nécessiterait un effort disproportionné.

La définition du terme disproportionné est renvoyé dans le point (97) à sa description dans les [guidelines sur la transparence, WP260, revision 1](https://ec.europa.eu/newsroom/article29/items/622227).
On peut y lire, point (61) :

> la dérogation ne devrait pas être systématiquement revendiquée par les responsables du traitement qui ne traitent pas des données à caractère personnel à des fins archivistiques dans l’intérêt public, à des fins de recherche scientifique ou historique, ou à des fins statistiques.

La dérogation étant ici la non-communication de données personnelles dans le cas d'un droit d'accès.
Les données personnelles ayant fuité, n'étant pas collecté à des fins archivistiques, statistiques ou de recherche, elle ne peut revendiquer simplement cette dérogation, sans justification.

sur le point (62) :
> Dès lors, il s’ensuit que l’impossibilité ou les efforts disproportionnés découlent généralement de circonstances qui ne s’appliquent pas si les données à caractère personnel sont collectées auprès de la personne concernée. En d’autres termes, l’impossibilité ou les efforts disproportionnés doivent être directement liés au fait que les données à caractère personnel ont été collectées autrement qu’auprès de la personne concernée.

Or dans les données ayant fuité, pour probablement une grande partie d'entre-elles, elles sont bien des données directement collectées par la CTM. 
Il s'agit ici de pouvoir facilement identifier un point de contact, donnée évidemment disponible pour les bénéficiaires d'aides de la CTM.

Le point (64) décrit alors qu'une mise en balance (qui est le fondement du RGPD) entre les intérêts des personnes concernées et l'effort pour le responsable de traitement pour les fournir.
> (Le) responsable du traitement [...] devrait mettre en balance les efforts qui lui sont demandés pour communiquer les informations à la personne concernée et l’incidence et les effets sur la personne concernée dans le cas où celle-ci ne recevrait pas ces informations. Cette mise en balance devrait être documentée par le responsable du traitement conformément à ses obligations de responsabilité.

__Dès lors, une mise en balance a dû être faite. Et l'intérêt des personnes a été jugé moins important que l'intérêt de la CTM a ne pas faire l'effort de fournir une notification personnalisée.__

### Sur la caractérisation de la fuite (3)

![do not worry, it's just a drop of water](/images/just-a-drop-of-water.png)

Ici encore, aucune réponse. 
Au vu du décalage entre l'information apportée au public par la CTM et la réalité, 3 mois après l'attaque, on pourrait considérer que cette communication publique, minimisant l'impact potentiel de la cyber-attaque, doit être écartée car non sincère.

De la même façon, on peut se demander qui a accompagné la CTM dans la rédaction de ce document et s'il a été réellement relu et validé par l'ANSSI, les experts en cybersécurité ou l'autorité de contrôle.

#### Analyse personnelle
Toujours en partant des guidelines de l'EDPB

>
> (85) When notifying individuals, Article 34(2) GDPR specifies that “_The communication [...] shall describe [...] the nature of the personal data breach and contain at least the information and measures referred to in points (b), (c) and (d) of Article 33(3)._”
> 
> (86) According to this provision, the controller should at least provide the following information: 
>   - [...]
>   -  __a description of the likely consequences of the breach; and__
> 


Dans l'article [34.3.c du RGPD](https://gdpr-info.eu/art-33-gdpr/), complété ici par les points (85) et (86), font références à l'[article 33.3](https://gdpr-info.eu/art-33-gdpr/), dont le point c) nous intéresse, faisant référence à des conséquences probables.

Or en indiquant que les données "peut s'agit (sic) de nom ou de prénom de certains administrés ou collaborateurs, d'adresses postales ou de numéros de sécurité sociale", sans mentionner la présence de données d'identités, bancaires, etc ... qui peuvent servir à usurper l'identité, ni de données plus "sensibles" (informations de santé ou sociales) moins monétisable, mais dont la divulgation peut entrainer des risques, notamment sur des publics déjà fragiles (personne en difficulté, handicapé, agé, mineure, ...).
Les risques probables sont minorés.

__Cette communication ne permet pas aux personnes concernées de prendre conscience des risques ou de l'intérêt d'exercer leurs droits.__

On peut d'ailleurs s'interroger sur l'illustration des risques donnés en exemple, puisque le document fait référence à des risques (SMS, appels, emails) sans que ces données soient présentées comme des données ayant fuité.



## Follow-up 1

Evidemment, les réponses apportées ne me satisfont pas puisqu'elles ne répondent pas à 2 questions sur 3. 
Néanmoins, aussi insatisfaisante soit-elle, une réponse a été apportée, et ce, dans un délai raisonnable. 
Je considère donc qu'il y a un espace de dialogue possible.

Je considère également, que si la CTM a réellement la _volonté déterminée d’inscrire ses activités dans le respect des principes qui président à la protection des données personnelles_, alors ce dialogue sera productif.

### Plus de précisions, plus de transparence, moins de bullshit
[![precision needed](/images/you-need-precision-anthony-vincent.gif)](https://www.youtube.com/watch?si=Kb4lQ5ZFVHt_TP-B&t=26&v=7Wm5sMKwg8k&feature=youtu.be)

Voici donc une nouvelle série de questions, que j'envoie aujourd'hui (le 2 novembre 2023).

1. Est-ce que l'ANSSI et/ou l'autorité de contrôle a été consulté sur l'utilisation du mécanisme de communication publique ? Si c'est le cas, est-ce eux qui vous ont conseillé d'utiliser ce mécanisme (au lieu d'une notification individuelle) ?
2. Comment la balance (WP260, point 64) entre les intérêts des personnes concernées et l'effort de la CTM a-t-elle été faite ? Pourriez-vous me transmettre ce document ?
3. Est-ce que l'ANSSI et/ou l'autorité de contrôle et/ou les experts en cybersécurité a été consulté sur le contenu de la communication ?
4. Comment la liste des types de données ayant fuité a-t-elle été construite ?
5. Est-ce que cette liste d'information venant d'analyses "techniques" a été filtré par une instance administrative ou politique ?
6. Puisque l'information sur les données ayant fuité est très incomplète et ne permets pas aux personnes concernées de prendre conscience de l'impact éventuel, quelles sont les actions correctives prévues ?
7. En quoi la communication sur le site de la collectivité, a priori sans autre communication respecte-t-elle le point 90 des guidelines de l'EDPB sur la fuite de données ? Est-t-il prévue une communication plus large prévue que la publication sur le site en construction de la CTM ?
8. Y a t-il une action en cours pour notifier individuellement les personnes dont des données personnelles sensibles ont fuité.



## Annexes

### Mon email du 23 octobre

> Bonjour, j'ai lu avec attention le document présenté sur l'url : https://www.collectivitedemartinique.mq/2023/09/15/information-importante-sur-lattaque-informatique-du-16-mai-2023/
>
> J'ai plusieurs questions, que je vais résumer ci-dessous (un thread twitter un peu brouillon est également présent sur : https://twitter.com/guillem_lefait/status/1716100775984726263) :
>
> 1) J'aimerais savoir quel est le status de ce document. En effet vous indiquez "de manière préventive, nous faisons le choix d'informer l'ensemble de nos agents, administrés et fournisseurs", faut-il alors en déduire que vous considérez ce document, publié plus de 3 mois après la publication du leak sur le darknet, sur un site en construction et sur lequel apparaissait superman jusqu'à ce matin du 23 octobre 2023 : (voir : https://web.archive.org/web/20231022152828/https://www.collectivitedemartinique.mq/elementor-8/ ), comme une réponse adéquate à vos obligations suivant l'article 34 du RGPD ?
>
> Si vous considérez que la communication aux personnes concernées exigerait un effort disproportionné, pourriez-vous me faire parvenir votre analyse visant à le démontrer ? En effet, ayant travaillé sur un prototype visant à répondre à ce besoin, l'effort quoique conséquent me semble loin d'être disproportionné. D'autant que cette communication pourrait être spécifique uniquement pour les personnes dont les documents les plus sensibles (carte d'identité non expirée, ...) ont effectivement été dérobés. Ceci est d'autant plus incompréhensible que j'ai proposé d'en discuter avec la CTM début septembre, sans recevoir la moindre réponse.
>
> 2) Concernant les informations délivrées dans ce document, vous indiquez : "des données de la CTM ont été dérobées par les attaquants. Il peut s'agir de nom ou prénom de certains administrés ou collaborateurs, d'adresses postales ou de numéros de sécurité sociale."
>
> A quel moment sont mentionnés les documents d'identité ? Ou les dossiers médicaux ? Ou les comptes-rendus sociaux ? Ou les informations bancaires ? Ou des bulletins de salaires ? Ou les communications (emails) ?
>
> Les données publiées ne pouvant être moindres que celles dérobées, l'information que vous présentez est fausse. Et en minimisant la portée de ce leak, vous risquez de mettre davantage en difficulté les collaborateurs et administrés.

### La réponse de la CTM du 31 octobre

(les phrases en gras (et les fautes) sont présentes dans le mail)

> Comme suite à notre échange téléphonique du 25 octobre, vous trouvez ci-après les réponses à votre mail du lundi 23 octobre 2023 15:58.
>
> __Sur le statut du document__
>
>Le document est en ligne via https://www.collectivitedemartinique.mq/
>
>Vous faites état d’une page présente sur le site en construction le 23 octobre en passant par l’url https://www.collectivitedemartinique.mq/elementor-8/.
>
>Après vérification, il s’agissait d’une page de tests, qui depuis a été désactivée.
>
>
> __Sur les obligations relatives à l'article 34 du RGPD__
>
>Vous souhaitez des clarifications sur le début de phrase « de manière préventive, nous faisons le choix d'informer l'ensemble de nos agents, administrés et fournisseurs"
>
>Nous attirons votre attention sur le fait que la phrase complète était : « De manière préventive, nous faisons le choix d’informer l’ensemble de nos agents, administrés et fournisseurs, __qu’ils soient ou non concernés par cette violation de données__ et vous appelons à faire preuve de vigilance dans les prochains mois. »
>
>Nous  vous rappelons,  que comme l’indique ce courrier, la collectivité territoriale de Martinique (CTM) a été victime d’une attaque informatique. Ce type d’acte malveillant est malheureusement particulièrement courant, les pirates informatiques développant des méthodes de plus en plus sophistiquées et à même de contourner les dispositifs de sécurité les plus pointus.
>
>Dès la découverte de l’attaque, la CTM a engagé de nombreuses actions techniques et organisationnelles pour éviter la propagation de celle-ci notamment et rempli les obligations légales :
>
> -    isolation du système informatique de la collectivité pour limiter les conséquences de l’attaque ;
> -    mobilisation d’une cellule de gestion de crise et d’experts en cybersécurité pour identifier les causes et les conséquences de l’attaque (investigations numériques) ;
> -    information du Préfet ;
> -    activation de ressources techniques de l’Agence nationale de la sécurité des systèmes d’information (ANSSI) ;
> -    __une notification initiale, puis une notification complémentaires de la violation de données ont été faites à la Commission nationale de l’informatique et des libertés (CNIL) ;__
> -    __dépôt de plainte auprès du procureur de la République.__
>
> Nous avons également fait appel à des experts en cybersécurité pour nous accompagner.
>
>
>Dans cette circonstance, __conformément à son obligation d’information issue du RGPD, la CTM à adresser une lettre circulaire aux agents en poste (siège et terrain) et réaliser une communication publique via son site web qui est en construction__.
>
> 
>
>Vous sollicitez que la CTM vous fasse parvenir les analyses effectuées, mais nous vous rappelons qu’une enquête pénale est en cours, à la suite de notre dépôt de plainte auprès du procureur de la République de Paris.
>
> 
>
>La CTM est mobilisée pour lutter contre les conséquences de cette cyber attaque pour ses agents et les usagers, des investigations sont en cours et l’enquête pénale n’est pas clôturée. 
>
> 
>
>La CTM confirme ainsi sa volonté déterminée d’inscrire ses activités dans le respect des principes qui président à la protection des données personnelles. 