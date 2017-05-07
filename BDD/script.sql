 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------


------------------------------------------------------------
-- Table: Vente
------------------------------------------------------------
CREATE TABLE Vente(
	vente_               NUMBER NOT NULL ,
	logement_            NUMBER  NOT NULL  ,
	logement             NUMBER  NOT NULL  ,
	nouveauproprietaire  NUMBER  NOT NULL  ,
	proprietaire         NUMBER   ,
	agent                NUMBER   ,
	dat                  DATE  NOT NULL  ,
	prix                 NUMBER  NOT NULL  ,
	logement__Logement   NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Vente_Pk PRIMARY KEY (vente_)
);

------------------------------------------------------------
-- Table: Proprietaire
------------------------------------------------------------
CREATE TABLE Proprietaire(
	proprietaire_  NUMBER NOT NULL ,
	nom            VARCHAR2 (30) NOT NULL  ,
	tel            VARCHAR2 (12) NOT NULL  ,
	vente_         NUMBER(10,0)  NOT NULL  ,
	logement_      NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Proprietaire_Pk PRIMARY KEY (proprietaire_)
);

------------------------------------------------------------
-- Table: Locataire 
------------------------------------------------------------
CREATE TABLE Locataire(
	locataire_  NUMBER NOT NULL ,
	nom         VARCHAR2 (30)  ,
	tel         VARCHAR2 (10)  ,
	location_   NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Locataire_Pk PRIMARY KEY (locataire_)
);

------------------------------------------------------------
-- Table: Agent
------------------------------------------------------------
CREATE TABLE Agent(
	agent_     NUMBER NOT NULL ,
	nom        VARCHAR2 (30) NOT NULL  ,
	tel        VARCHAR2 (10) NOT NULL  ,
	salaire    NUMBER   ,
	vente_     NUMBER(10,0)  NOT NULL  ,
	location_  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Agent_Pk PRIMARY KEY (agent_)
);

------------------------------------------------------------
-- Table: Logement
------------------------------------------------------------
CREATE TABLE Logement(
	logement_     NUMBER NOT NULL ,
	proprietaire  NUMBER  NOT NULL  ,
	adresse       VARCHAR2 (200) NOT NULL  ,
	type          VARCHAR2 (11)  ,
	nombrepiece   NUMBER   ,
	vente_        NUMBER(10,0)  NOT NULL  ,
	location_     NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Logement_Pk PRIMARY KEY (logement_)
);

------------------------------------------------------------
-- Table: Location
------------------------------------------------------------
CREATE TABLE Location(
	location_           NUMBER NOT NULL ,
	logement_           NUMBER  NOT NULL  ,
	locataire_          NUMBER   ,
	agent               NUMBER  NOT NULL  ,
	loyer               NUMBER  NOT NULL  ,
	datedebut           DATE   ,
	datefin             DATE   ,
	logement__Logement  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Location_Pk PRIMARY KEY (location_)
);




ALTER TABLE Vente ADD FOREIGN KEY (logement__Logement) REFERENCES Logement(logement_);
ALTER TABLE Proprietaire ADD FOREIGN KEY (vente_) REFERENCES Vente(vente_);
ALTER TABLE Proprietaire ADD FOREIGN KEY (logement_) REFERENCES Logement(logement_);
ALTER TABLE Locataire ADD FOREIGN KEY (location_) REFERENCES Location(location_);
ALTER TABLE Agent ADD FOREIGN KEY (vente_) REFERENCES Vente(vente_);
ALTER TABLE Agent ADD FOREIGN KEY (location_) REFERENCES Location(location_);
ALTER TABLE Logement ADD FOREIGN KEY (vente_) REFERENCES Vente(vente_);
ALTER TABLE Logement ADD FOREIGN KEY (location_) REFERENCES Location(location_);
ALTER TABLE Location ADD FOREIGN KEY (logement__Logement) REFERENCES Logement(logement_);

CREATE SEQUENCE Seq_Vente_vente_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Proprietaire_proprietaire_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Locataire_locataire_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Agent_agent_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Logement_logement_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Location_location_ START WITH 1 INCREMENT BY 1 NOCYCLE;


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

