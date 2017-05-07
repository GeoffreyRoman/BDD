set serverOutput on;
Declare
NumA Agent.agent_%Type := 100; --le numéro de l agent a tester est 100, donc normalement inexistant
LA Agent%RowType; --liste des agents
BEGIN
LA := agent.getAgentById(NumA);
DBMS_OutPut.Put_Line('Nom de l agent = ' || LA.nom);
DBMS_OutPut.Put_Line('Salaire de l agent = ' || LA.salaire);
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('L agent n ' || NumA || ' n existe pas');
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;

Declare
NumA Agent.agent_%Type := 20;
NomA Agent.nom%Type := 'ESLAN';
TelA Agent.tel%Type := '0612222222';
SalaireA Agent.salaire%Type := 1600;
LA Agent%RowType; --liste des agents
BEGIN
LA := agent.agentinserer (NumA, NomA , TelA , SalaireA);
DBMS_OutPut.Put_Line('L agent ' || LA.nom || ' a était inséré dans la table Agent');
EXCEPTION
        WHEN OTHER THEN
                dbms_output.put_line('Erreur lors de l'insertion de l'agent numéro' || NumA);
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
