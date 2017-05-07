CREATE OR REPLACE PACKAGE PACKagent is

FUNCTION getAgentById(idAgent number) return agent%rowtype;
PROCEDURE agentinserer (nomAgent varchar, telAgent varchar, salaire number);
---PROCEDURE agentsupprimer (idAgent NUMBER);
PROCEDURE agentmodifier (idAgent NUMBER, nom varchar);
FUNCTION agentlister return agent%rowtype;
END PACKagent;
/


CREATE OR REPLACE PACKAGE BODY PACKagent is

FUNCTION getAgentById(idAgent number) return agent%rowtype IS
  ligneAgent agent%rowtype;
  begin
         select * INTO ligneAgent from agent where agent_= idAgent;

        return (ligneAgent);

          EXCEPTION
                  WHEN NO_DATA_FOUND THEN
                    raise;
                  WHEN OTHERS THEN
                    raise; 
  
  end getAgentById;

PROCEDURE agentinserer (nomAgent varchar, telAgent varchar, salaire number) is
        BEGIN
            INSERT INTO agent  (nom, tel, salaire)
            VALUES (nomAgent,telAgent,salaire);
        END agentinserer;

/*PROCEDURE agentsupprimer (idAgent NUMBER) is
        BEGIN
            ON DELETE CASCADE FROM agent
            WHERE agent_ = idAgent;
        END agentsupprimer;*/


PROCEDURE agentmodifier (idAgent NUMBER, nom IN varchar) is
        BEGIN
            UPDATE agent
            SET nom = nom
            WHERE agent_ = idAgent;
        END agentmodifier;

FUNCTION agentlister return agent%rowtype is
        ligneAgent      agent%rowtype;

        BEGIN
        select * INTO ligneAgent
        from agent;

        Return ligneAgent;
        END agentlister;

END PACKagent;
