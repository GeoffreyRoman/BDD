CREATE USER ADMIN IDENTIFIED BY mdp;
GRANT CONNECT, RESOURCE TO ADMIN;

INSERT into Proprietaire (nom, tel) values('BALBIS', '0655555555');
INSERT into Proprietaire (nom, tel) values( 'ROMAN', '0655555544');
INSERT into Proprietaire (nom, tel) values('TAMZALI', '0659595544');
INSERT into Proprietaire (nom, tel) values('MENEZ', '0659590000');

INSERT into Locataire (nom, tel) values( 'TEMIN', '0659595544');
INSERT into Locataire (nom, tel) values( 'CEVAL', '0655885544');
INSERT into Locataire (nom, tel) values( 'ESLAN', '0659866667');

INSERT into Agent (nom, tel,SALAIRE) values ( 'MOPOLO', '0659595522', 2200);
INSERT into Agent (nom, tel,SALAIRE) values('MIRANDA', '0655885547', 2100);
INSERT into Agent (nom, tel,SALAIRE) values('TETTAMENZI', '0659866688', 1900);

INSERT into Logement (ADRESSE,TYPE,nombrePIECE,proprietaire_) values( '1 chemin des mimosa', 'appartement', 3, 2);
INSERT into Logement (ADRESSE,TYPE,nombrePIECE,proprietaire_) values( '567 rue blala', 'terrain', null, 1);
INSERT into Logement (ADRESSE,TYPE,nombrePIECE,proprietaire_) values( '66 boulevard fleurie', 'appartement', 5, 2);
INSERT into Logement (ADRESSE,TYPE,nombrePIECE,proprietaire_) values( '21 chemin de saint bernard', 'maison', 5, 3);

INSERT into Vente (NOUVEAUPROPRIETAIRE,DATEACHAT,prix,proprietaire_,agent_,logement_) values(4, '10/03/2017', 300000, 2, 2, 1);
INSERT into Vente (NOUVEAUPROPRIETAIRE,DATEACHAT,prix,proprietaire_,agent_,logement_) values( 4, '13/04/2017', 430000, 1, 3, 2);

INSERT into Location (LOYER,DATEDEBUT,datefin,logement_,locataire_,agent_) values( 1400, '13/02/2017', '13/02/2018', 4, 1, 2);
INSERT into Location (LOYER,DATEDEBUT,datefin,logement_,locataire_,agent_) values( 1100, '13/04/2017', '13/04/2018', 3, 2, 3);
