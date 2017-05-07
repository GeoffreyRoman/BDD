CREATE OR REPLACE PACKAGE agent is

getAgentByIdByID(num IN number);
agentinserer (num IN NUMBER, nom IN varchar, tel IN varchar, salaire IN number);
agentsupprimer (num IN NUMBER);
agentmodifier (num IN NUMBER, nom_ IN varchar);
agentlister();

END agent;

Create Sequence seq_agt
Start With 1;
-- pour la clef primaire

FUNCTION getAgentByIdByID(num IN number) return agent%rowtype IS

ligneAgent     agent%rowtype;

begin
select * INTO ligneAgent
from agent
where agent_=num;
RETURN(ligneAgent);

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
