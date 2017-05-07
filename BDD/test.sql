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

Declare -- insertion réussi
NumA Agent.agent_%Type := 25;
NomA Agent.nom%Type := 'ESsssLAsN';
TelA Agent.tel%Type := '06122222';
SalaireA Agent.salaire%Type := 1600;
Num2 Agent.agent_%Type;
BEGIN
    PACKagent.agentinserer (NumA, NomA , TelA , SalaireA);
    SELECT agent_ into Num2 FROM Agent WHERE nom = NomA;
    DBMS_OutPut.Put_Line('numA' || NumA || ' NUM2 = ' || Num2);
    IF Num2 = NumA THEN DBMS_OutPut.Put_Line('L agent ' || NomA || ' a ete insere dans la table Agent');
    ELSE
    DBMS_OutPut.Put_Line('L agent ' || NomA || ' n a pas pu être inséré dans la table Agent');
    END IF;
End;
/

/*
Declare -- erreur dans l'insertion 
NumA Agent.agent_%Type := 1; -- On va dire qu'il existe deja
NomA Agent.nom%Type := 'ESLAN';
TelA Agent.tel%Type := '0612222223';
SalaireA Agent.salaire%Type := 1600;
BEGIN
    PACKagent.agentinserer (NumA, NomA , TelA , SalaireA);
EXCEPTION
        WHEN OTHER THEN
                dbms_output.put_line('Erreur lors de l insertion de l agent numéro' || NumA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/
------------------------------------------------------------
-- Test de la fonction agentsupprimer
------------------------------------------------------------
Declare
NumA Agent.agent_%Type := 20; -- existe
BEGIN
    LA := PACKagent.agentsupprimer(NumA);
IF (SELECT num FROM Agent WHERE num = NumA) = 20 THEN raise NO_DATA_FOUND;
ELSE
DBMS_OutPut.Put_Line('L agent ' || LA.nom || ' a était inséré dans la table Agent');
END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de l\'insertion de l\'agent numéro' || NumA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/
Declare
NumA Agent.agent_%Type := 21; -- n'existe pas
BEGIN
IF (SELECT num FROM Agent WHERE num = NumA)%NOFOUND THEN raise NO_DATA_FOUND;
ELSE
DBMS_OutPut.Put_Line('L agent ' || LA.nom || ' a était inséré dans la table Agent');
END IF;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('Erreur lors de l\'insertion de l\'agent numéro' || NumA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
/
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
