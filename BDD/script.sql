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