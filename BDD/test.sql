set serverOutput on;
------------------------------------------------------------
-- Test de la fonction getAgentById
------------------------------------------------------------
Declare
NumA Agent.agent_%Type := 100; --le numéro de l agent a tester est 100, donc normalement inexistant
LA Agent%RowType; --liste des agents
BEGIN
LA := PACKagent.getAgentById(NumA);
DBMS_OutPut.Put_Line('Nom de l agent = ' || LA.nom);
DBMS_OutPut.Put_Line('Salaire de l agent = ' || LA.salaire);
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('L agent n ' || NumA || ' n existe pas');
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/

------------------------------------------------------------
-- Test de la fonction agentinserer
------------------------------------------------------------
Declare --  insertion reussite
NomA Agent.nom%Type := 'ESLAN';
TelA Agent.tel%Type := '061222223';
SalaireA Agent.salaire%Type := 1600;
maxAgent number(2);
nbColonne number(2);
BEGIN
    PACKagent.agentinserer (NomA , TelA , SalaireA);
    SELECT max(agent_) into maxAgent from Agent;
    SELECT count(*) into nbColonne FROM Agent WHERE nom = NomA and agent_ = maxAgent;
    IF nbColonne > 0 THEN DBMS_OutPut.Put_Line('L agent ' || NomA || ' a ete insere dans la table Agent');
    ELSE dbms_output.put_line('Erreur lors de l insertion de l agent numéro' || NomA);
    END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de l insertion de l agent numéro' || NomA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
            
End;
/

Declare -- erreur dans l'insertion 
NomA Agent.nom%Type := 'ESLAN';
SalaireA Agent.salaire%Type := 1600;
maxAgent number(2);
nbColonne number(2);
BEGIN
    PACKagent.agentinserer (NomA , '0612222456723' , SalaireA);
    SELECT max(agent_) into maxAgent from Agent;
    SELECT count(*) into nbColonne FROM Agent WHERE nom = NomA and agent_ = maxAgent;
    IF nbColonne = 0 THEN raise NO_DATA_FOUND;
    END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de l insertion de l agent numéro' || NomA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
        WHEN OTHERS THEN
            dbms_output.put_line('Erreur lors de l insertion de l agent numéro' || NomA);
End;
/


------------------------------------------------------------
-- Test de la fonction agentsupprimer
------------------------------------------------------------
Declare
idAgentASupprimer Agent.agent_%Type; -- existe
nbColonne number(2) ;
BEGIN
    PACKAGENT.agentinserer('Gerard','0626299167',3000);
    SELECT MAX(Agent_)  into idAgentASupprimer from agent;
    SELECT count(*) into nbColonne FROM Agent WHERE agent_ = idAgentASupprimer;
    IF nbColonne = 1 THEN PACKagent.agentsupprimer(idAgentASupprimer);
    DBMS_OutPut.Put_Line('L agent ' || idAgentASupprimer || ' a était supprimer de la table Agent');
    ELSE
    raise NO_DATA_FOUND;
    END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de la suppression de l agent numéro '|| idAgentASupprimer);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/

Declare
idAgentAsupp Agent.agent_%Type := 20; -- existe pas
nbColonne number(2) ;
BEGIN
    SELECT count(*) into nbColonne FROM Agent WHERE agent_ = idAgentAsupp;
    IF nbColonne = 1 THEN PACKagent.agentsupprimer(idAgentAsupp);
    DBMS_OutPut.Put_Line('L agent ' || idAgentAsupp || ' a était supprimer de la table Agent');
    ELSE
    raise NO_DATA_FOUND;
    END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de la suppression de l agent numéro '|| idAgentAsupp);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/


------------------------------------------------------------
-- Test de la fonction agentmodifier
------------------------------------------------------------
Declare
idAgentAModifier Agent.agent_%Type;
NomModif Agent.nom%Type := 'nommodifier';
nbColonne number(2) ;
BEGIN
PACKAGENT.agentinserer('Gerard','0626299167',3000);
SELECT MAX(Agent_) into idAgentAModifier from agent;
PACKagent.agentmodifier (idAgentAModifier, NomModif);
SELECT count(*) into nbColonne FROM Agent WHERE agent_ = idAgentAModifier AND nom = NomModif;
    IF nbColonne != 1 THEN raise NO_DATA_FOUND;
    ELSE 
    DBMS_OutPut.Put_Line('L agent numéro ' || idAgentAModifier || ' a était modifier dans la table Agent');
    END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de modification de l agent numéro ' || idAgentAModifier);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/

Declare
idAgentAModifier varchar(3) :='num'; -- erreur type
NomModif Agent.nom%Type := 'nommodifier';
nbColonne number(2) ;
BEGIN
PACKagent.agentmodifier (idAgentAModifier, NomModif);
SELECT count(*) into nbColonne FROM Agent WHERE agent_ = idAgentAModifier AND nom = NomModif;
    IF nbColonne != 1 THEN raise NO_DATA_FOUND;
    ELSE 
    DBMS_OutPut.Put_Line('L agent numéro ' || idAgentAModifier || ' a était modifier dans la table Agent');
    END IF;
EXCEPTION
        WHEN OTHERS THEN
                dbms_output.put_line('Erreur lors de modification de l agent numéro ' || idAgentAModifier);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/

------------------------------------------------------------
-- Test de la fonction retouragentotal
------------------------------------------------------------
Declare
nbLigne number(3) ;
retouragentotal number(3);
BEGIN
retouragentotal := PACKagent.agentotal;
SELECT count(*) into nbLigne FROM Agent;
    IF nbLigne != retouragentotal THEN raise NO_DATA_FOUND;
    ELSE 
    DBMS_OutPut.Put_Line('Nombre d occurances '|| nbLigne);
    END IF;
EXCEPTION
        WHEN OTHERS THEN
                dbms_output.put_line('Erreur : nombre de ligne attendu par agentotal() pas correct');
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/

Declare --  insertion reussite
newProp Vente.vente_%Type;
Pdate Vente.dateAchat%Type := '12/03/2016';
prixP Vente.prix%Type := 16000;
Pproprietaire_ Vente.proprietaire_%Type;
Pagent_ vente.agent_%Type;
Plogement_ vente.logement_%Type;
maxVente number(2);
nbLigne number(2);
maxProp number(2);
BEGIN
    SELECT max(agent_) into Pagent_ from Agent;
    SELECT max(Logement_) into Plogement_ from Logement;
    SELECT max(Proprietaire_) into Pproprietaire_ from PROPRIETAIRE;
    PACKAGENT.agentinserer('Matou','0626229167',3000);
    SELECT max(Proprietaire_) into newProp from PROPRIETAIRE;
    PACKVente.Venteinserer (newProp, Pdate ,prixP,Pproprietaire_ ,Pagent_ ,Plogement_ );
    SELECT max(vente_) into maxVente from Vente;
    SELECT max(proprietaire_) into maxProp from Vente;
    SELECT count(*) into nbLigne FROM Vente WHERE vente_ = maxVente and logement_ = Plogement_ and newProp = maxProp;
    IF nbLigne > 0 THEN DBMS_OutPut.Put_Line('La vente ' || maxVente || ' a ete insere dans la table Agent');
    ELSE raise NO_DATA_FOUND;
    END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de l insertion de l agent numéro' || maxVente);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
            
End;
/
