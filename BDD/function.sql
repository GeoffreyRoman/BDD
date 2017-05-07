CREATE OR REPLACE PACKAGE PACKagent is

FUNCTION getAgentById(num number) return agent%rowtype;
PROCEDURE agentinserer (num IN NUMBER, nom IN varchar, tel IN varchar, salaire IN number);
--PROCEDURE agentsupprimer (num IN NUMBER);
PROCEDURE agentmodifier (num IN NUMBER, nom_ IN varchar);
END PACKagent;
/


CREATE OR REPLACE PACKAGE BODY PACKagent is

FUNCTION getAgentById(num number) return agent%rowtype IS
  ligneAgent agent%rowtype;
  begin
         select * INTO ligneAgent from agent where agent#=num;

        return (ligneAgent);

          EXCEPTION
                  WHEN NO_DATA_FOUND THEN
                    raise;
                  WHEN OTHERS THEN
                    raise; 
  
  end getAgentById;

PROCEDURE agentinserer (num IN NUMBER, nom IN varchar, tel IN varchar, salaire IN number) is
        BEGIN
            INSERT INTO agent
            VALUES (num, nom, tel, salaire);
        END agentinserer;

/*PROCEDURE agentsupprimer (num IN NUMBER) is
        BEGIN
            ON DELETE CASCADE FROM agent
            WHERE agent_ = num;
        END agentsupprimer;*/


PROCEDURE agentmodifier (num IN NUMBER, nom_ IN varchar) is
        BEGIN
            UPDATE agent
            SET nom = nom
            WHERE agent_ = num;
        END agentmodifier;


PROCEDURE agentlister() is
        Declare
        ligneAgent agent%rowtype;

        BEGIN
        select * INTO ligneAgent
        from agent;

        Return ligneAgent;
        END agentlister;
END PACKagent;
