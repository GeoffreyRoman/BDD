create or replace PACKAGE PACKagent is

FUNCTION getAgentById(idAgent number) return agent%rowtype;
PROCEDURE agentinserer (nomAgent varchar, telAgent varchar, salaire number);
PROCEDURE agentsupprimer (idAgent NUMBER);
PROCEDURE agentmodifier (idAgent NUMBER, nom_ varchar);
PROCEDURE agentlister ;
FUNCTION agentotal return number;
procedure agentComplexe(idAgent NUMBER);
END PACKagent;
/

create or replace PACKAGE BODY PACKagent is

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
        
PROCEDURE agentsupprimer (idAgent NUMBER) is
        BEGIN
            DELETE FROM LOCATION WHERE LOCATION.agent_ = idAgent;
            DELETE FROM vente WHERE vente.agent_ = idAgent;
            DELETE FROM Agent WHERE agent_ = idAgent;
        END agentsupprimer;



PROCEDURE agentmodifier (idAgent NUMBER, nom_ IN varchar) is
        BEGIN
            UPDATE agent
            SET nom = nom_
            WHERE agent_ = idAgent;
        END agentmodifier;
        
    

PROCEDURE agentlister is
         nomA agent.nom%type;
          idA agent.agent_%type;
           salA agent.salaire%type;
            telA agent.tel%type;
        cursor ligneAgent  is select agent_,nom,tel,salaire  from agent;
       
        begin
       
        open ligneAgent;
        loop
        fetch ligneAgent into idA,nomA,telA,salA;
         EXIT WHEN ligneAgent%NOTFOUND;
        
        dbms_output.put_line(idA || ',' || nomA || ',' || telA || ',' || salA);
end loop;

close ligneAgent;
       
        END agentlister;
        
        
function agentotal return number is 
    nbColonne number ;
    begin
    SELECT count(*) into nbColonne FROM Agent;
    
    return (nbColonne);
end agentotal;
        
procedure agentComplexe(idAgent NUMBER)  is -- Affiche le nom de tous les prorpetaire qui ont un bien vendu par l'agent passe en parametres

      nomProp proprietaire.nom%type;
      
      idprop logement.proprietaire_%type;
      
       idVente agent.nom%type;
       
        cursor prop is select logement.proprietaire_ from logement,vente where logement.logement_ = vente.LOGEMENT_;
      
        begin  
        open prop;
        loop
        fetch prop into idprop;
        exit when prop%notFound;
        Select nom into nomProp from proprietaire where PROPRIETAIRE_=idprop;
       
      
       
        dbms_output.put_line(nomProp);
        end loop;

 END agentComplexe;


END PACKagent;
/