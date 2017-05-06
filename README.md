
[Source](http://miniclips.free.fr/pdf2/TPApprofondissementBD_SQL_2016_2017_V1.html "Permalink to ")

![][1]

Gabriel MOPOLO-MOKE page 1/3

TP d'approfondissement complément BD

(MCD/MLD Merise, SQL, PLSQL et Procédures

Stockées), M1IMEA 2016 - 2017

Préambule

Le  travail  ici  proposé  fait  suite  aux  enseignements  dispensés  autour  du  cours

complément  BD  (Conception  MCD  MERISE,  SQL,  PLSQL  et  de  l'option  procédural

d'Oracle). L'évaluation de ce TP compte pour 50% dans la note finale. Vous devez Former

des groupes de 2 ou 3 personnes maximum  et  choisir un  sujet  dans la liste  ci-dessous  ou

proposer un sujet qui vous convient. Les groupes doivent être constitués dès le premier cours.

Un sujet doit aussi être choisi à ce moment là.

1. Analyse et conception

Vous définirez, si ce n'est déjà fait, une application appartenant à la liste suivante :

1) Agence de location de bateaux  10) Gestion d'un labo. de chercheurs

2) Agence immobilière  11) Cabinet de notaires

3) Agence bancaire 12) Gestion de la bourse

4) Gestion d'une bibliothèque 13) Gestion d'un cabinet médical

5) Tournois de tennis  14) Gestion d'une agence de voyages

6) Gestion d'une promotion d'étudiants 15) Gestion de salons

7) Gestion des menus d'un restaurant  16) Gestion des anciens étudiants

8) Gestion d'un club sportif  17) Gestion d'une boîte de nuit

9) Tournois de trampoline  18) autres sujets

À  cette  fin,  vous  produirez  un  dossier  d'analyse  et  conception  présentant  les

caractéristiques suivantes :

 Rediger un cahier des charges de deux pages maximums

 Modèle de données

 Définir  le  dictionnaire  de  données.  Pour  chaque  entité  décrire  chacune ses

propriétés : Titre / description / format des données / contraintes

 Définir le Modèle Entité-Association MERISE (en utilisant le logiciel Poweramc

de SYBASE/SAP). Vous devez vous limiter à 10 entités maximum et 5 minimum.

Vous devez ici prendre en compte les contraintes identifiées lors de la description

du dictionnaire de données. Exemple de liens d'association pour deux entités A et

![][2]

Implémentation de la base sous Oracle

Gabriel MOPOLO-MOKE page 2/3

B  ayant  une  liaisons  1 :  N  ou  N-M  (exemple  UN  PILOTE  ASSURE  0,  1  ou

plusieurs VOL, un VOL est assuré par 1 et 1 PILOTE au plus)

 Définir un schéma de données logique en respectant les  contraintes  d'intégrités

d'entité  (PRIMARY  KEY),  de  domaine  (CHECK,  NOT  NULL,  …)  et  de

référence(REFERENCES  /  foreign  key).  Générable  automatiquement  avec

POWERAMC

 Définir un schéma physique  de données en SQL (prévoir les index). Générable

automatiquement avec POWERAMC

 Insérer des lignes de test dans chacune de vos tables.

 Modèle  de  traitements.  Choisir  parmi  vos  tables  deux  d'entres  (A  et  B)  elles  sur

lesquelles les fonctions suivantes vont être spécifiées puis implémentées :

Sur la table A, définir un package plsql ayant le nom de la dite table:

\- ajouter une nouvelle occurence à A : fonction Ainserer;

\- supprimer une occurrence à  A  (Attention : les enregistrements liés dans B doivent

aussi être supprimés) : fonction Asupprimer;

\- modifier des informations sur de A : fonction Amodifier;

\- lister toutes les occurrences de A: fonction Alister;

\- fournir le nombre total des occurrences de A : fonction Atotal ;

\-  Proposer  aussi  une  fonction  avec  une  requête  complexe  de  votre  choix (jointure,

opération de groupe etc) : fonction Acomplexe

Sur la table B, définir un package plsql ayant le nom de la dite table :

\- ajouter une nouvelle occurence à B : fonction Binserer;

\- supprimer une occurrence à B : fonction Bsupprimer;

\- modifier des informations sur de B : fonction Bmodifier;

\- lister toutes les occurrences de B pour une occurrence de A donnée: fonction Blister

Nota : Bien prendre en compte les contraintes, poser au moins un trigger sur la table A

ou B; Bien gérer les erreurs(exceptions), bien choisir les paramètres des fonctions.

2. Implémentation de la base sous Oracle

Dans cette étape, vous implémenterez l'application définie sous Oracle.

Vous assurerez donc les tâches suivantes :

 Créer un utilisateur Oracle qui sera le propriétaire des tables et des packages

 Exécuter le script contenant les tables, indexes, les contraintes, etc.

 Exécuter le script contenant le ou les triggers

 Exécuter le script contenant les insertions dans vos tables

 Coder les fonctions / procedures des deux packages PL/SQL définis plus haut

 Coder les programmes PL/SQL de test des fonctions/procedures des deux packages.

![][3]

Travail à rendre

Gabriel MOPOLO-MOKE page 3/3

3. Travail à rendre

Travail à rendre: un dossier contenant :

- Le cahier des charges

 Le sujet

 Description des fonctionnalités de l'application

 Le modèle de sécurité

- Le dictionnaire de données MERISE
- Le MCD : modèle conceptuel ou le modèle de données (E/A) MERISE
- Le MLD : modèle logique de données (traduction du MCD pour viser la

BD relationnelle Oracle)

- Le schéma relationnel (traduction du MLD vers des scripts SQL Oracle)

 les tables avec les contraintes d'intégrités

 les index

 les données de test (insertions dans les tables)

- Au moins un trigger sur la table A ou B
- Les deux packages (spécification et body) . La partie body doit contenir

l'implémentation de l'ensemble  des fonctions/procédures décrites dans

dans la partie spécification

- Les  programmes  de  test  de  chaque  fonction/procédure  des  deux

packages

Notes importantes

1) Travail à rendre avant le 15 Janvier 2017

2) Former des groupes de 2 ou 3 personnes maximum

3) La note peut  être  différente  en fonction  de  l'implication de  chaque  membre  du

groupe.

[1]: http://miniclips.free.fr/bg1.png
[2]: http://miniclips.free.fr/bg2.png
[3]: http://miniclips.free.fr/bg3.png

  
