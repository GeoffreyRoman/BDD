create or replace PACKAGE PACKVENTE is

FUNCTION getVenteById(idvente number) return vente%rowtype;
PROCEDURE Venteinserer (newProp number,Pdate date,prixP number,Pproprietaire_ number,Pagent_ number,Plogement_ number);
PROCEDURE Ventesupprimer (idvente NUMBER);
PROCEDURE ventemodifier (idvente NUMBER, Pprix number);
PROCEDURE ventelister ;
END PACKVENTE;
/
create or replace PACKAGE BODY PACKVENTE is


FUNCTION getVenteById(idvente number) return vente%rowtype is
  lignevente vente%rowtype;
  begin
         select * INTO lignevente from vente where vente_= idvente;

        return (lignevente);

          EXCEPTION
                  WHEN NO_DATA_FOUND THEN
                    raise;
                  WHEN OTHERS THEN
                    raise; 
  
  end getventeById;


PROCEDURE Venteinserer (newProp number,Pdate date,prixP number,Pproprietaire_ number,Pagent_ number,Plogement_ number) is 

BEGIN
            INSERT INTO vente  (nouveauProprietaire ,dateAchat ,prix ,proprietaire_ ,agent_ ,logement_ )
            VALUES  (newProp ,Pdate ,prixP ,Pproprietaire_ ,Pagent_ ,Plogement_ );
            update logement set PROPRIETAIRE_ = newProp where logement_ = Plogement_;
        END venteinserer;
        
      
PROCEDURE ventesupprimer (idvente NUMBER) is
        BEGIN
            DELETE FROM vente WHERE vente.vente_ = idvente;
        END ventesupprimer;


PROCEDURE ventemodifier (idvente NUMBER, Pprix number) is
        BEGIN
            UPDATE vente
            SET prix = Pprix
            WHERE vente_ = idvente;
        END ventemodifier;      

PROCEDURE ventelister is
        ligne vente%rowtype;
        
        cursor lignevente  is select *  from vente;
       
        begin
       
        open lignevente;
        loop
        fetch lignevente into ligne;
         EXIT WHEN lignevente%NOTFOUND;
        
        dbms_output.put_line(ligne.vente_ || ',' || ligne.nouveauproprietaire || ',' || ligne.dateachat || ',' || ligne.prix || ',' || ligne.proprietaire_ || ',' || ligne.agent_ || ',' || ligne.logement_);
end loop;

close lignevente;
       
        END ventelister;
        










END PACKVENTE;