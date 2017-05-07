CREATE OR REPLACE PACKAGE PACKagent iS

FUNCTION getAgentById(num number) return agent%rowtype;
FUNCTION agentinserer (num IN NUMBER, nom IN varchar, tel IN varchar, salaire IN number);
FUNCTION agentsupprimer (num IN NUMBER);
FUNCTION agentmodifier (num IN NUMBER, nom_ IN varchar);
FUNCTION agentlister();
END PACKagent;
/


CREATE OR REPLACE PACKAGE BODY PACKagent iS

FUNCTION getAgentById(num number)
return agent%rowtype IS
  ligneAgent agent%rowtype;
  begin
         select * INTO ligneAgent from agent where agent#=num;

          RETURN (ligneAgent);

          EXCEPTION
                  WHEN NO_DATA_FOUND THEN
                    raise;
                  WHEN OTHERS THEN
                    raise; 
  
end getAgentById;

FUNCTION agentinserer (num IN NUMBER, nom IN varchar, tel IN varchar, salaire IN number)
        BEGIN
            INSERT INTO agent
            VALUES (num, nom, tel, salaire);
        END agentinserer;

FUNCTION agentsupprimer (num IN NUMBER)
        BEGIN
            ON DELETE CASCADE FROM agent
            WHERE agent_ = num;
        END agentsupprimer;


FUNCTION agentmodifier (num IN NUMBER, nom_ IN varchar)
        BEGIN
            UPDATE agent
            SET nom = nom
            WHERE agent_ = num;
        END agentmodifier;


FUNCTION agentlister()
        Declare
        ligneAgent agent%rowtype;

        BEGIN
        select * INTO ligneAgent
        from agent;

        Return ligneAgent;
        END agentlister;
END PACKagent;
/
