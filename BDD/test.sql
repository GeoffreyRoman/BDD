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
TelA Agent.tel%Type := '0612222223';
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
idAgentAsupp Agent.agent_%Type := 1; -- existe
nbColonne number(2) ;
BEGIN
    SELECT count(*) into nbColonne FROM Agent WHERE agent_ = idAgentAsupp;
    DBMS_OutPut.Put_Line( nbColonne );
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

Declare
idAgentAsupp Agent.agent_%Type := 20; -- existe pas
nbColonne number(2) ;
BEGIN
    SELECT count(*) into nbColonne FROM Agent WHERE agent_ = idAgentAsupp;
    DBMS_OutPut.Put_Line( nbColonne );
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
/*
------------------------------------------------------------
-- Test de la fonction agentmodifier
------------------------------------------------------------
Declare
NumA Agent.agent_%Type := 20;
NomModif Agent.nom%Type := 'ASLAN';
BEGIN
PACKagent.agentmodifier (NumA, NomModif);
IF (SELECT nom FROM Agent WHERE num = NumA) != NomModif THEN raise NO_DATA_FOUND;
ELSE
DBMS_OutPut.Put_Line('L agent numéro ' || NumA || ' a était modifier dans la table Agent');
END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de modification de l\'agent numéro' || NumA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/

*/
