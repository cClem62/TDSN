-- Creator:       MySQL Workbench 6.3.8/ExportSQLite Plugin 0.1.0
-- Author:        Clément Cantraine
-- Caption:       TDSN
-- Project:       Name of the project
-- Changed:       2017-01-04 09:14
-- Created:       2017-01-04 08:25

DROP TABLE if exists user_roles ;
DROP TABLE if exists visibilitee ;
DROP TABLE if exists amitiees;
DROP TABLE if exists jaime;
DROP TABLE if exists publications;	
DROP TABLE if exists utilisateurs ;

--
-- TABLE utilisateurs
-- VALIDATE

CREATE TABLE utilisateurs(
   idutilisateur SERIAL NOT NULL,
   email VARCHAR(80) NOT NULL,
   nom VARCHAR(80),
   prenom VARCHAR(80),
   datenaissance DATE,
   dateinscription DATE,
   photoprofil VARCHAR(100),
   photocouverture VARCHAR(100),
   mdp VARCHAR(40),
  CONSTRAINT pk_utilisateurs PRIMARY KEY (idutilisateur)
);

-- ON = OK
-- TABLE user_roles
-- VALIDATE
CREATE TABLE user_roles(
email text NOT NULL,
role_name text NOT NULL,
CONSTRAINT pk_user_roles PRIMARY KEY (email)
);

-- ON = O
-- TABLE visibilite
-- VALIDATE
CREATE TABLE visibilitee(
  utilisateur SERIAL NOT NULL,
  libelle VARCHAR(45),
  CONSTRAINT pk_visibilitee PRIMARY KEY (utilisateur),
  CONSTRAINT fk_visibilitee_utilisateurs FOREIGN KEY (utilisateur) REFERENCES utilisateurs(idUtilisateur)
  ON DELETE CASCADE
);

-- ON = OK
-- TABLE amitiees
-- VALIDATE
CREATE TABLE amitiees(
  utilisateura SERIAL NOT NULL,
  utilisateurb SERIAL NOT NULL,
  date DATE,
  CONSTRAINT pk_amitiees PRIMARY KEY (utilisateura,utilisateurb),
  CONSTRAINT fk_usera
    FOREIGN KEY (utilisateura)
    REFERENCES utilisateurs(idutilisateur)
    ON DELETE CASCADE,
  CONSTRAINT fk_userb
    FOREIGN KEY (utilisateurb)
    REFERENCES utilisateurs(idutilisateur)
    ON DELETE CASCADE
);


-- ON ??
-- TABLE publications
-- VALIDATE
CREATE TABLE publications(
  idPublication SERIAL NOT NULL,
  utilisateur SERIAL NOT NULL,
  contenu TEXT NOT NULL,
  date TIMESTAMP,
  CONSTRAINT pk_publications PRIMARY KEY(idPublication),
  CONSTRAINT fk_publications_utilisateurs
    FOREIGN KEY(utilisateur)
    REFERENCES utilisateurs(idUtilisateur)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- ON ??
-- TABLE jaime
-- VALIDATE
CREATE TABLE jaime(
  publi_id SERIAL NOT NULL,
  utilisateur SERIAL NOT NULL,
  CONSTRAINT pk_jaime PRIMARY KEY(publi_id, utilisateur),
  CONSTRAINT fk_jaime_publications
    FOREIGN KEY(publi_id)
    REFERENCES publications(idPublication)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

