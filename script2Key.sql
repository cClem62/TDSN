-- Creator:       MySQL Workbench 6.3.8/ExportSQLite Plugin 0.1.0
-- Author:        Clément Cantraine
-- Caption:       TDSN
-- Project:       Name of the project
-- Changed:       2017-01-04 09:14
-- Created:       2017-01-04 08:25

DROP TABLE if exists user_roles ;
DROP TABLE if exists visibilitee ;
DROP TABLE if exists amitiees;
DROP TABLE if exists publications;
DROP TABLE if exists jaime;
DROP TABLE if exists utilisateurs ;

--
-- TABLE utilisateurs
-- VALIDATE

CREATE TABLE utilisateurs(
   idutilisateur INTEGER NOT NULL,
   email VARCHAR(80) NOT NULL,
   nom VARCHAR(80),
   prenom VARCHAR(80),
   datenaissance DATE,
   mdp VARCHAR(40),
  CONSTRAINT pk_utilisateurs PRIMARY KEY (idutilisateur, email)
);

-- ON = OK
-- TABLE user_roles
-- VALIDATE
CREATE TABLE user_roles(
id_user INTEGER NOT NULL,
email text NOT NULL,
role_name text NOT NULL,
CONSTRAINT pk_user_roles PRIMARY KEY (id_user,email),
CONSTRAINT fk_user_roles_utilisateurs FOREIGN KEY(id_user,email) REFERENCES utilisateurs(idutilisateur,email)
ON DELETE CASCADE
);

-- ON = O
-- TABLE visibilite
-- VALIDATE
CREATE TABLE visibilitee(
  utilisateur INTEGER NOT NULL,
  email text NOT NULL,
  libelle VARCHAR(45),
  CONSTRAINT pk_visibilitee PRIMARY KEY (utilisateur,email),
  CONSTRAINT fk_visibilitee_utilisateurs FOREIGN KEY (utilisateur,email) REFERENCES utilisateurs(idUtilisateur,email)
  ON DELETE CASCADE
);

-- ON = OK
-- TABLE amitiees
-- VALIDATE
CREATE TABLE amitiees(
  utilisateura INTEGER NOT NULL,
  emaila text NOT NULL,
  utilisateurb INTEGER NOT NULL,
  emailb text NOT NULL,
  date DATE,
  CONSTRAINT pk_amitiees PRIMARY KEY (utilisateura,emaila,utilisateurb,emailb),
  CONSTRAINT fk_usera
    FOREIGN KEY (utilisateura, emaila)
    REFERENCES utilisateurs(idutilisateur,email),
  CONSTRAINT fk_userb
    FOREIGN KEY (utilisateura,emaila)
    REFERENCES utilisateurs(idutilisateur,email)
    ON DELETE CASCADE
);


-- ON ??
-- TABLE publications
-- VALIDATE
CREATE TABLE publications(
  idPublication INTEGER NOT NULL,
  utilisateur INTEGER NOT NULL,
  email text NOT NULL,
  contenu TEXT NOT NULL,
  date TIMESTAMP,
  CONSTRAINT pk_publications PRIMARY KEY(idPublication),
  CONSTRAINT fk_publications_utilisateurs
    FOREIGN KEY(utilisateur,email)
    REFERENCES utilisateurs(idUtilisateur,email)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- ON ??
-- TABLE jaime
-- VALIDATE
CREATE TABLE jaime(
  publi_id INTEGER NOT NULL,
  utilisateur INTEGER NOT NULL,
  CONSTRAINT pk_jaime PRIMARY KEY(publi_id, utilisateur),
  CONSTRAINT fk_jaime_publications
    FOREIGN KEY(publi_id)
    REFERENCES publications(idPublication)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

