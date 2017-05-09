CREATE USER ADMIN IDENTIFIED BY mdp;
GRANT CONNECT, RESOURCE TO ADMIN;

INSERT into Proprietaire values(1, 'BALBIS', '0655555555');
INSERT into Proprietaire values(2, 'ROMAN', '0655555544');
INSERT into Proprietaire values(3, 'TAMZALI', '0659595544');
INSERT into Proprietaire values(4, 'MENEZ', '0659590000');

INSERT into Locataire values(1, 'TEMIN', '0659595544');
INSERT into Locataire values(2, 'CEVAL', '0655885544');
INSERT into Locataire values(3, 'ESLAN', '0659866667');

INSERT into Agent values(1, 'MOPOLO', '0659595522', 2200);
INSERT into Agent values(2, 'MIRANDA', '0655885547', 2100);
INSERT into Agent values(3, 'TETTAMENZI', '0659866688', 1900);

INSERT into Logement values(1, '1 chemin des mimosa', 'appartement', 3, 2);
INSERT into Logement values(2, '567 rue blala', 'terrain', null, 1);
INSERT into Logement values(3, '66 boulevard fleurie', 'appartement', 5, 2);
INSERT into Logement values(4, '21 chemin de saint bernard', 'maison', 5, 3);

INSERT into Vente values(1, 4, '10/03/2017', 300000, 2, 2, 1);
INSERT into Vente values(2, 4, '13/04/2017', 430000, 1, 3, 2);

INSERT into Location values(1, 1400, '13/02/2017', '13/02/2018', 4, 1, 2);
INSERT into Location values(2, 1100, '13/04/2017', '13/04/2018', 3, 2, 3);
