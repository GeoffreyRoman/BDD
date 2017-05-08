---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------


------------------------------------------------------------
-- Table: Vente
------------------------------------------------------------
CREATE TABLE Vente(
	vente_               NUMBER NOT NULL ,
	nouveauproprietaire  NUMBER  NOT NULL  ,
	dateAchat            DATE  NOT NULL  ,
	prix                 NUMBER  NOT NULL  ,
	proprietaire_        NUMBER(10,0)  NOT NULL  ,
	agent_               NUMBER(10,0)  NOT NULL  ,
	logement_            NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Vente_Pk PRIMARY KEY (vente_)
);

------------------------------------------------------------
-- Table: Proprietaire
------------------------------------------------------------
CREATE TABLE Proprietaire(
	proprietaire_  NUMBER NOT NULL ,
	nom            VARCHAR2 (30) NOT NULL  ,
	tel            VARCHAR2 (12) NOT NULL  ,
	CONSTRAINT Proprietaire_Pk PRIMARY KEY (proprietaire_)
);

------------------------------------------------------------
-- Table: Locataire 
------------------------------------------------------------
CREATE TABLE Locataire(
	locataire_  NUMBER NOT NULL ,
	nom         VARCHAR2 (30)  ,
	tel         VARCHAR2 (10)  ,
	CONSTRAINT Locataire_Pk PRIMARY KEY (locataire_)
);

------------------------------------------------------------
-- Table: Agent
------------------------------------------------------------
CREATE TABLE Agent(
	agent_   NUMBER NOT NULL ,
	nom      VARCHAR2 (30) NOT NULL  ,
	tel      VARCHAR2 (10) NOT NULL  ,
	salaire  NUMBER   ,
	CONSTRAINT Agent_Pk PRIMARY KEY (agent_)
);

------------------------------------------------------------
-- Table: Logement
------------------------------------------------------------
CREATE TABLE Logement(
	logement_      NUMBER NOT NULL ,
	adresse        VARCHAR2 (200) NOT NULL  ,
	type           VARCHAR2 (12)  CONSTRAINT type_logement CHECK (type IN('maison','appartement', 'terrain')),
	nombrepiece    NUMBER   ,
	proprietaire_  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Logement_Pk PRIMARY KEY (logement_)
);

------------------------------------------------------------
-- Table: Location
------------------------------------------------------------
CREATE TABLE Location(
	location_   NUMBER NOT NULL ,
	loyer       NUMBER  NOT NULL  ,
	datedebut   DATE   ,
	datefin     DATE   ,
	logement_   NUMBER(10,0)  NOT NULL  ,
	locataire_  NUMBER(10,0)  NOT NULL  ,
	agent_      NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Location_Pk PRIMARY KEY (location_)
);




ALTER TABLE Vente ADD FOREIGN KEY (proprietaire_) REFERENCES Proprietaire(proprietaire_);
ALTER TABLE Vente ADD FOREIGN KEY (agent_) REFERENCES Agent(agent_);
ALTER TABLE Vente ADD FOREIGN KEY (logement_) REFERENCES Logement(logement_);
ALTER TABLE Logement ADD FOREIGN KEY (proprietaire_) REFERENCES Proprietaire(proprietaire_);
ALTER TABLE Location ADD FOREIGN KEY (logement_) REFERENCES Logement(logement_);
ALTER TABLE Location ADD FOREIGN KEY (locataire_) REFERENCES Locataire(locataire_);
ALTER TABLE Location ADD FOREIGN KEY (agent_) REFERENCES Agent(agent_);

CREATE SEQUENCE Seq_Vente_vente_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Proprietaire_proprietaire_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Locataire_locataire_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Agent_agent_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Logement_logement_ START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Location_location_ START WITH 1 INCREMENT BY 1 NOCYCLE;
