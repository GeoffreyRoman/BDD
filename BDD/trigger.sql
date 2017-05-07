
CREATE OR REPLACE TRIGGER Vente_vente_
	BEFORE INSERT ON Vente 
  FOR EACH ROW 
	WHEN (NEW.vente_ IS NULL) 
	BEGIN
		 select Seq_Vente_vente_.NEXTVAL INTO :NEW.vente_ from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Proprietaire_proprietaire_
	BEFORE INSERT ON Proprietaire 
  FOR EACH ROW 
	WHEN (NEW.proprietaire_ IS NULL) 
	BEGIN
		 select Seq_Proprietaire_proprietaire_.NEXTVAL INTO :NEW.proprietaire_ from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Locataire_locataire_
	BEFORE INSERT ON Locataire 
  FOR EACH ROW 
	WHEN (NEW.locataire_ IS NULL) 
	BEGIN
		 select Seq_Locataire_locataire_.NEXTVAL INTO :NEW.locataire_ from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Agent_agent_
	BEFORE INSERT ON Agent 
  FOR EACH ROW 
	WHEN (NEW.agent_ IS NULL) 
	BEGIN
		 select Seq_Agent_agent_.NEXTVAL INTO :NEW.agent_ from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Logement_logement_
	BEFORE INSERT ON Logement 
  FOR EACH ROW 
	WHEN (NEW.logement_ IS NULL) 
	BEGIN
		 select Seq_Logement_logement_.NEXTVAL INTO :NEW.logement_ from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Location_location_
	BEFORE INSERT ON Location 
  FOR EACH ROW 
	WHEN (NEW.location_ IS NULL) 
	BEGIN
		 select Seq_Location_location_.NEXTVAL INTO :NEW.location_ from DUAL; 
	END;

