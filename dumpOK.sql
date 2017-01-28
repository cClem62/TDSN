--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administration; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE administration (
    id integer NOT NULL,
    libelle character varying(45),
    etat character varying(45)
);


ALTER TABLE administration OWNER TO tdsn;

--
-- Name: amitiees; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE amitiees (
    utilisateura integer NOT NULL,
    utilisateurb integer NOT NULL,
    date date
);


ALTER TABLE amitiees OWNER TO tdsn;

--
-- Name: jaime; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE jaime (
    jaime_id integer NOT NULL,
    publi_id integer NOT NULL,
    utilisateur integer
);


ALTER TABLE jaime OWNER TO tdsn;

--
-- Name: jaime_jaime_id_seq; Type: SEQUENCE; Schema: public; Owner: tdsn
--

CREATE SEQUENCE jaime_jaime_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jaime_jaime_id_seq OWNER TO tdsn;

--
-- Name: jaime_jaime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdsn
--

ALTER SEQUENCE jaime_jaime_id_seq OWNED BY jaime.jaime_id;


--
-- Name: publications; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE publications (
    idpublication integer NOT NULL,
    utilisateur integer NOT NULL,
    contenu text,
    date text
);


ALTER TABLE publications OWNER TO tdsn;

--
-- Name: publications_idpublication_seq; Type: SEQUENCE; Schema: public; Owner: tdsn
--

CREATE SEQUENCE publications_idpublication_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publications_idpublication_seq OWNER TO tdsn;

--
-- Name: publications_idpublication_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdsn
--

ALTER SEQUENCE publications_idpublication_seq OWNED BY publications.idpublication;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE user_roles (
    email character varying(80) NOT NULL,
    role_name text
);


ALTER TABLE user_roles OWNER TO tdsn;

--
-- Name: utilisateurs; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE utilisateurs (
    idutilisateur integer NOT NULL,
    email character varying(80),
    nom character varying(80),
    prenom character varying(80),
    datenaissance date,
    mdp character varying(40)
);


ALTER TABLE utilisateurs OWNER TO tdsn;

--
-- Name: utilisateurs_idutilisateur_seq; Type: SEQUENCE; Schema: public; Owner: tdsn
--

CREATE SEQUENCE utilisateurs_idutilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateurs_idutilisateur_seq OWNER TO tdsn;

--
-- Name: utilisateurs_idutilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tdsn
--

ALTER SEQUENCE utilisateurs_idutilisateur_seq OWNED BY utilisateurs.idutilisateur;


--
-- Name: visibilitee; Type: TABLE; Schema: public; Owner: tdsn; Tablespace: 
--

CREATE TABLE visibilitee (
    utilisateur integer NOT NULL,
    libelle character varying(45)
);


ALTER TABLE visibilitee OWNER TO tdsn;

--
-- Name: jaime_id; Type: DEFAULT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY jaime ALTER COLUMN jaime_id SET DEFAULT nextval('jaime_jaime_id_seq'::regclass);


--
-- Name: idpublication; Type: DEFAULT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY publications ALTER COLUMN idpublication SET DEFAULT nextval('publications_idpublication_seq'::regclass);


--
-- Name: idutilisateur; Type: DEFAULT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY utilisateurs ALTER COLUMN idutilisateur SET DEFAULT nextval('utilisateurs_idutilisateur_seq'::regclass);


--
-- Data for Name: administration; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY administration (id, libelle, etat) FROM stdin;
\.


--
-- Data for Name: amitiees; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY amitiees (utilisateura, utilisateurb, date) FROM stdin;
1	2	2016-01-01
3	1	2016-01-01
3	2	2017-01-01
2	3	2017-01-01
1	3	2017-01-01
2	1	0201-01-01
\.


--
-- Data for Name: jaime; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY jaime (jaime_id, publi_id, utilisateur) FROM stdin;
1	7	1
3	16	2
4	17	2
5	17	2
6	17	2
7	17	2
1	17	2
2	17	2
3	17	2
8	17	2
9	17	2
10	17	2
11	17	2
12	17	2
13	17	2
14	17	2
15	17	2
16	17	2
17	17	2
18	17	2
19	17	2
20	17	2
\.


--
-- Name: jaime_jaime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tdsn
--

SELECT pg_catalog.setval('jaime_jaime_id_seq', 20, true);


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY publications (idpublication, utilisateur, contenu, date) FROM stdin;
6	2	Bonjour	2017-04-01
7	2	Salut les amis !!	2017-04-01
11	2	Test d'accênts et de n'importe quoi	2017-04-01
12	2	J'aime les moches ahah ! :) lôve	2017-04-01
10	2	J'aime les hommes mûrs	2017-04-10
13	2	Génial ce nouveau facebook, j'adore même..	2017-04-01
14	2	"Pas les mamans" comme dirait aurélia !	2017-04-01
15	2	Aller je travaille un peu, histoire de me réveiller !	2017-04-01
16	2	J'aime la FRANCE	2017-04-02
17	2	C'est dur comme projet !! 	2017-04-02
\.


--
-- Name: publications_idpublication_seq; Type: SEQUENCE SET; Schema: public; Owner: tdsn
--

SELECT pg_catalog.setval('publications_idpublication_seq', 16, true);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY user_roles (email, role_name) FROM stdin;
cantraine.clement@gmail.com	membre
parsy.pauline@gmail.com	membre
\.


--
-- Data for Name: utilisateurs; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY utilisateurs (idutilisateur, email, nom, prenom, datenaissance, mdp) FROM stdin;
1	parsy.pauline@gmail.com	Parsy	Pauline	1996-01-03	aa
2	cantraine.clement@gmail.com	Cantraine	Clément	1996-04-14	aa
3	remi.cantraine@orange.fr	Cantraine	Rémi	1999-03-17	aa
4	nathalie.duprez@hotmail.fr	Duprez	Nathalie	1969-06-11	aa
\.


--
-- Name: utilisateurs_idutilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: tdsn
--

SELECT pg_catalog.setval('utilisateurs_idutilisateur_seq', 4, true);


--
-- Data for Name: visibilitee; Type: TABLE DATA; Schema: public; Owner: tdsn
--

COPY visibilitee (utilisateur, libelle) FROM stdin;
\.


--
-- Name: administration_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY administration
    ADD CONSTRAINT administration_pkey PRIMARY KEY (id);


--
-- Name: amitiees_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY amitiees
    ADD CONSTRAINT amitiees_pkey PRIMARY KEY (utilisateura, utilisateurb);


--
-- Name: jaime_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY jaime
    ADD CONSTRAINT jaime_pkey PRIMARY KEY (jaime_id, publi_id);


--
-- Name: publications_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (idpublication);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (email);


--
-- Name: utilisateurs_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY utilisateurs
    ADD CONSTRAINT utilisateurs_pkey PRIMARY KEY (idutilisateur);


--
-- Name: visibilitee_pkey; Type: CONSTRAINT; Schema: public; Owner: tdsn; Tablespace: 
--

ALTER TABLE ONLY visibilitee
    ADD CONSTRAINT visibilitee_pkey PRIMARY KEY (utilisateur);


--
-- Name: fk_amitiees_utilisateursa; Type: FK CONSTRAINT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY amitiees
    ADD CONSTRAINT fk_amitiees_utilisateursa FOREIGN KEY (utilisateura) REFERENCES utilisateurs(idutilisateur);


--
-- Name: fk_amitiees_utilisateursb; Type: FK CONSTRAINT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY amitiees
    ADD CONSTRAINT fk_amitiees_utilisateursb FOREIGN KEY (utilisateurb) REFERENCES utilisateurs(idutilisateur);


--
-- Name: fk_jaime_publications; Type: FK CONSTRAINT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY jaime
    ADD CONSTRAINT fk_jaime_publications FOREIGN KEY (publi_id) REFERENCES publications(idpublication) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_jaime_utilisateurs; Type: FK CONSTRAINT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY jaime
    ADD CONSTRAINT fk_jaime_utilisateurs FOREIGN KEY (utilisateur) REFERENCES utilisateurs(idutilisateur);


--
-- Name: fk_publication_utilisateurs; Type: FK CONSTRAINT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY publications
    ADD CONSTRAINT fk_publication_utilisateurs FOREIGN KEY (utilisateur) REFERENCES utilisateurs(idutilisateur);


--
-- Name: fk_visibilite_utilisateurs; Type: FK CONSTRAINT; Schema: public; Owner: tdsn
--

ALTER TABLE ONLY visibilitee
    ADD CONSTRAINT fk_visibilite_utilisateurs FOREIGN KEY (utilisateur) REFERENCES utilisateurs(idutilisateur);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

