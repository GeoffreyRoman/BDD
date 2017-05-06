set serverOutput on;
Declare
NumA Agent.agent#%Type := 100; --le numéro de l agent a tester est 100, donc normalement inexistant
LA Agent%RowType; --liste des agents
BEGIN
LA := agent.getAgentById(NumA);
DBMS_OutPut.Put_Line('Nom de l agent = ' || LA.nom);
DBMS_OutPut.Put_Line('Salaire de l agent = ' || LA.salaire);
EXCEPTION
        WHEN NO_DATA_FOUND THEN
                dbms_output.put_line('L agent n ' || NumP || ' n existe pas');
                dbms_output.put_line('SQLCode =  ' || SQLCode);
                dbms_output.put_line('SQLCode =  ' || sqlerrm);
End;
