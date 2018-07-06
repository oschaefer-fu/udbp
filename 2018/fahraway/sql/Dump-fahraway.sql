--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aktivitaet; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.aktivitaet (
    ak_id integer NOT NULL,
    bewert integer,
    bezng character varying(50),
    art character varying(50),
    katgrie character varying(50),
    fabezg character varying(50),
    ort character varying(50),
    vorstzg character varying(50),
    jahrz1 boolean,
    jahrz2 boolean,
    jahrz3 boolean,
    jahrz4 boolean,
    mialt integer,
    dauer integer,
    akpreis numeric(5,2),
    anbietr integer,
    CONSTRAINT bewert_min_max CHECK (((bewert >= 0) AND (bewert <= 10)))
);


ALTER TABLE public.aktivitaet OWNER TO parallels;

--
-- Name: TABLE aktivitaet; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.aktivitaet IS 'Spezifikationen der Aktivitaeten';


--
-- Name: COLUMN aktivitaet.ak_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.ak_id IS 'Aktivitaeten-Nummer';


--
-- Name: COLUMN aktivitaet.bewert; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.bewert IS 'Schuelerbewertung d. Aktivitaet';


--
-- Name: COLUMN aktivitaet.bezng; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.bezng IS 'Bezeich. d. Akt. bei Anbieter';


--
-- Name: COLUMN aktivitaet.art; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.art IS 'Art d. Aktivitaet';


--
-- Name: COLUMN aktivitaet.katgrie; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.katgrie IS 'domaenenbezog. Kategorie';


--
-- Name: COLUMN aktivitaet.fabezg; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.fabezg IS 'tendenz. Fachzugehoerigkeit';


--
-- Name: COLUMN aktivitaet.ort; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.ort IS 'Ort, wo Aktktiv. stattfindet';


--
-- Name: COLUMN aktivitaet.vorstzg; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.vorstzg IS 'Teinamevoraussetzung';


--
-- Name: COLUMN aktivitaet.jahrz1; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.jahrz1 IS 'im Fruehling durchfuehrbar?';


--
-- Name: COLUMN aktivitaet.jahrz2; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.jahrz2 IS 'im Sommer durchfuehrbar?';


--
-- Name: COLUMN aktivitaet.jahrz3; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.jahrz3 IS 'im Herbst durchfuehrbar?';


--
-- Name: COLUMN aktivitaet.jahrz4; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.jahrz4 IS 'im Winter durchfuehrbar?';


--
-- Name: COLUMN aktivitaet.mialt; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.mialt IS 'Mindestalter d. Teilnehmer';


--
-- Name: COLUMN aktivitaet.dauer; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.dauer IS 'Dauer in STUNDEN';


--
-- Name: COLUMN aktivitaet.akpreis; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.aktivitaet.akpreis IS 'Preis je Schueler';


--
-- Name: aktivitaetseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.aktivitaetseq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aktivitaetseq OWNER TO parallels;

--
-- Name: aktivitaetseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.aktivitaetseq OWNED BY public.aktivitaet.ak_id;


--
-- Name: anbieter; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.anbieter (
    an_id integer NOT NULL,
    an_name character varying(50) NOT NULL,
    strasse character varying(50),
    hausnr integer,
    ort character varying(50),
    plz integer,
    url character varying(50),
    email character varying(100),
    telefon character varying(100),
    ansprechperson character varying(100)
);


ALTER TABLE public.anbieter OWNER TO parallels;

--
-- Name: TABLE anbieter; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.anbieter IS 'Anbieter einer Aktivitaet';


--
-- Name: COLUMN anbieter.an_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.an_id IS 'Anbieter-Nummer';


--
-- Name: COLUMN anbieter.an_name; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.an_name IS 'Anbieter-Name';


--
-- Name: COLUMN anbieter.strasse; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.strasse IS 'Straáenname';


--
-- Name: COLUMN anbieter.hausnr; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.hausnr IS 'Hausnummer';


--
-- Name: COLUMN anbieter.ort; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.ort IS 'Wohnort des Anbieters';


--
-- Name: COLUMN anbieter.plz; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.plz IS 'Postleitzahl';


--
-- Name: COLUMN anbieter.url; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.anbieter.url IS 'Internet-Adresse';


--
-- Name: anbieterseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.anbieterseq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anbieterseq OWNER TO parallels;

--
-- Name: anbieterseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.anbieterseq OWNED BY public.anbieter.an_id;


--
-- Name: begleitet; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.begleitet (
    l_id integer NOT NULL,
    f_id integer NOT NULL
);


ALTER TABLE public.begleitet OWNER TO parallels;

--
-- Name: TABLE begleitet; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.begleitet IS 'begleitende Lehrer auf jeweiliger Fahrt';


--
-- Name: COLUMN begleitet.l_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.begleitet.l_id IS 'Index Lehrer';


--
-- Name: COLUMN begleitet.f_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.begleitet.f_id IS 'Index Fahrt';


--
-- Name: fahrt; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.fahrt (
    f_id integer NOT NULL,
    f_name character varying(50),
    von date,
    bis date,
    kl_ku character varying(15),
    f_unterkunft integer
);


ALTER TABLE public.fahrt OWNER TO parallels;

--
-- Name: TABLE fahrt; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.fahrt IS 'Informationen zur Fahrt';


--
-- Name: COLUMN fahrt.kl_ku; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.fahrt.kl_ku IS 'Klasse/Kurs, die Fahrt durchfuehrt';


--
-- Name: fahrtseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.fahrtseq
    START WITH 104
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fahrtseq OWNER TO parallels;

--
-- Name: fahrtseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.fahrtseq OWNED BY public.fahrt.f_id;


--
-- Name: lehrer; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.lehrer (
    l_id integer NOT NULL,
    anrede character varying(10),
    vname character varying(50),
    nname character varying(50),
    telnr integer
);


ALTER TABLE public.lehrer OWNER TO parallels;

--
-- Name: TABLE lehrer; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.lehrer IS 'alle begleit. Lehrer';


--
-- Name: COLUMN lehrer.l_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.lehrer.l_id IS 'Lehrer-Nummer';


--
-- Name: COLUMN lehrer.anrede; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.lehrer.anrede IS 'Herr/Frau/...';


--
-- Name: COLUMN lehrer.vname; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.lehrer.vname IS 'Vorname';


--
-- Name: COLUMN lehrer.nname; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.lehrer.nname IS 'Nachname';


--
-- Name: COLUMN lehrer.telnr; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.lehrer.telnr IS 'Telefonkontakt auf Fahrt';


--
-- Name: lehrerseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.lehrerseq
    START WITH 400
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lehrerseq OWNER TO parallels;

--
-- Name: lehrerseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.lehrerseq OWNED BY public.lehrer.l_id;


--
-- Name: nimmtteil; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.nimmtteil (
    s_id integer NOT NULL,
    f_id integer NOT NULL
);


ALTER TABLE public.nimmtteil OWNER TO parallels;

--
-- Name: TABLE nimmtteil; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.nimmtteil IS 'Zugehoerigkeit Schueler zu jeweiliger Fahrt';


--
-- Name: COLUMN nimmtteil.s_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.nimmtteil.s_id IS 'Index Schueler';


--
-- Name: COLUMN nimmtteil.f_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.nimmtteil.f_id IS 'Index Fahrt';


--
-- Name: ort; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.ort (
    o_id integer NOT NULL,
    entfng integer NOT NULL,
    o_name character varying(50),
    trprtm character varying(50),
    geograf character varying(50),
    ewzahl integer,
    sprache character varying(50),
    schickf integer,
    urb_rur boolean
);


ALTER TABLE public.ort OWNER TO parallels;

--
-- Name: TABLE ort; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.ort IS 'Spezifikationen des Reiseortes';


--
-- Name: COLUMN ort.o_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.o_id IS 'Orts-Nummer';


--
-- Name: COLUMN ort.entfng; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.entfng IS 'Entfernung von Schule';


--
-- Name: COLUMN ort.o_name; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.o_name IS 'Ortsname';


--
-- Name: COLUMN ort.trprtm; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.trprtm IS 'moegliche Transportmittel fur Anreise';


--
-- Name: COLUMN ort.geograf; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.geograf IS 'geograf. Gegebenheiten: Landschaft';


--
-- Name: COLUMN ort.ewzahl; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.ewzahl IS 'Einwohnerzahl';


--
-- Name: COLUMN ort.sprache; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.sprache IS 'primaere Sprache der Region';


--
-- Name: COLUMN ort.schickf; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.schickf IS 'aesthetischer Gesamteindruck';


--
-- Name: COLUMN ort.urb_rur; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.ort.urb_rur IS 'eher urban od. laendlich gepraegt';


--
-- Name: orteseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.orteseq
    START WITH 500
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orteseq OWNER TO parallels;

--
-- Name: orteseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.orteseq OWNED BY public.ort.o_id;


--
-- Name: schueler; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.schueler (
    s_id integer NOT NULL,
    vname character varying(50) NOT NULL,
    nname character varying(50) NOT NULL,
    gebdat date,
    m_w character varying(15)
);


ALTER TABLE public.schueler OWNER TO parallels;

--
-- Name: TABLE schueler; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.schueler IS 'teilnehmender Schueler';


--
-- Name: COLUMN schueler.s_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.schueler.s_id IS 'Schuelernummer';


--
-- Name: COLUMN schueler.vname; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.schueler.vname IS 'Vorname des Schuelers';


--
-- Name: COLUMN schueler.nname; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.schueler.nname IS 'Nachname des Schuelers';


--
-- Name: COLUMN schueler.gebdat; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.schueler.gebdat IS 'Geburtsdatum des Schuelers';


--
-- Name: COLUMN schueler.m_w; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.schueler.m_w IS 'Geschlecht des Schuelers';


--
-- Name: schuelerseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.schuelerseq
    START WITH 300
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schuelerseq OWNER TO parallels;

--
-- Name: schuelerseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.schuelerseq OWNED BY public.schueler.s_id;


--
-- Name: unterkunft; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.unterkunft (
    u_id integer NOT NULL,
    u_name character varying(50),
    typ character varying(50),
    errbar character varying(50),
    kosten numeric(5,2),
    entfkern integer,
    u_ort integer
);


ALTER TABLE public.unterkunft OWNER TO parallels;

--
-- Name: TABLE unterkunft; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.unterkunft IS 'Spezifikationen der Unterkuenfte';


--
-- Name: COLUMN unterkunft.u_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.unterkunft.u_id IS 'Unterkunft-Nummer';


--
-- Name: COLUMN unterkunft.u_name; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.unterkunft.u_name IS 'Unterkunft-Name';


--
-- Name: COLUMN unterkunft.typ; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.unterkunft.typ IS 'Unterkunftstyp';


--
-- Name: COLUMN unterkunft.errbar; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.unterkunft.errbar IS 'Erreichbarkeit NACH Erstanreise z.B. Stadtzentrum';


--
-- Name: COLUMN unterkunft.kosten; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.unterkunft.kosten IS 'Kosten pro Schueler pro Nacht';


--
-- Name: COLUMN unterkunft.entfkern; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.unterkunft.entfkern IS 'Entfernung vom naechsten Stadtkern';


--
-- Name: unterkunftseq; Type: SEQUENCE; Schema: public; Owner: parallels
--

CREATE SEQUENCE public.unterkunftseq
    START WITH 500
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unterkunftseq OWNER TO parallels;

--
-- Name: unterkunftseq; Type: SEQUENCE OWNED BY; Schema: public; Owner: parallels
--

ALTER SEQUENCE public.unterkunftseq OWNED BY public.unterkunft.u_id;


--
-- Name: wirdangeboten; Type: TABLE; Schema: public; Owner: parallels
--

CREATE TABLE public.wirdangeboten (
    ak_id integer NOT NULL,
    f_id integer NOT NULL
);


ALTER TABLE public.wirdangeboten OWNER TO parallels;

--
-- Name: TABLE wirdangeboten; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON TABLE public.wirdangeboten IS 'Zugehoerigkeit Aktivitaeten zu jeweiliger Fahrt';


--
-- Name: COLUMN wirdangeboten.ak_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.wirdangeboten.ak_id IS 'Index Aktivitaet';


--
-- Name: COLUMN wirdangeboten.f_id; Type: COMMENT; Schema: public; Owner: parallels
--

COMMENT ON COLUMN public.wirdangeboten.f_id IS 'Index Fahrt';


--
-- Data for Name: aktivitaet; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.aktivitaet (ak_id, bewert, bezng, art, katgrie, fabezg, ort, vorstzg, jahrz1, jahrz2, jahrz3, jahrz4, mialt, dauer, akpreis, anbietr) FROM stdin;
8	6	Naturfelsen	Klettern	Sport	Sport	ajksfksjfb	Mindesgröße 1.4 m	f	t	t	f	10	5	27.00	999
1	6	Surfen4Fun	Surfen	Sport	Sport	Sankt Peter-Ording	Schwimmabzeichen Bronze	t	t	t	f	14	14	249.00	1
125	6	Ligaspiel	Fussball	Sport	Sport	Berlin	keine	t	t	t	t	6	2	20.00	1004
9	8	Kletterparadies	Klettern	Sport	Sport	Königs Wusterhausen	Mindesgröße 1.4 m	f	t	t	f	10	3	24.00	999
10	3	Schachzenter	Schach	Sport	Sport	Bocholt	keine	t	t	t	t	4	3	12.00	10
99	5	Surfen24/7	Surfen	Sport	Sport	Binz	Schwimmabzeichen Silber	f	t	t	f	14	10	222.00	1
116	6	Religöse Besinnungstage	Meditation	Religion	Religion	Ahaus	keine	t	t	t	t	6	2	29.00	10
115	7	Freak Show	Theater	Kunst/Kultur	Diverse	Leipzig	keine	t	t	t	t	12	3	19.00	1005
13	5	JesuitenKloster	Meditation	Geist & Seele	Religion	Bocholt	keine	t	t	t	t	8	3	0.00	10
114	7	Badminton für Anfänger	Badminton	Sport	Sport	Königs Wusterhausen	keine	t	t	t	t	10	10	50.00	999
113	10	Cat in the Bag	Live Escape Game	Spiel	Diverse	Berlin	keine	t	t	t	t	12	2	15.00	1006
126	8	Wettpaddeln	Paddeln	Sport	Sport	Königs Wusterhausen	Schwimmabzeichen Bronze	f	t	t	f	8	3	10.00	999
23	6	Mole Antonelliana	Museales	Kunst/Kultur	Italienisch	Turin	keine	t	t	t	t	6	2	0.00	\N
11	9	Full Metall Jacket	Paint Ball	Militaer	Diverse	Berlin	Mindesgröße 1.5 m	t	t	t	t	12	4	49.00	999
5	5	Puppe & Co	Theater	Kunst/Kultur	Diverse	Halle	keine	t	t	t	f	0	3	18.00	5
4	7	Theater am Rand	Theater	Kunst/Kultur	Diverse	Leipzig	keine	t	t	t	t	0	3	16.00	4
7	7	Kletterparadies	Klettern	Sport	Sport	ajksfksjfb	Mindestgröße 1.3 m	f	t	t	f	10	4	32.00	999
12	7	Nightknight	Paint Ball	Militaer	Diverse	Taucha	Mindesgröße 1.6 m	t	t	t	f	14	5	57.00	1007
24	6	Arkaden-Tour	Museales	Kunst/Kultur	Geschichte	Turin	keine	t	t	t	t	11	4	0.00	999
3	9	Surfonauten	Surfen	Sport	Sport	Neuharlingersiel	Schwimmabzeichen Bronze	f	t	t	f	12	15	259.00	13
127	5	Like ice in the sunshine	Beachvolleyball	Sport	Sport	Königs Wusterhausen	keine	t	t	t	f	8	3	0.00	999
15	8	North-Kiten	Kitesurfen	Sport	Sport	Neuharlingersiel	Schwimmabzeichen Bronze	f	t	t	f	14	14	249.00	13
\.


--
-- Name: aktivitaetseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.aktivitaetseq', 127, true);


--
-- Data for Name: anbieter; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.anbieter (an_id, an_name, strasse, hausnr, ort, plz, url, email, telefon, ansprechperson) FROM stdin;
5	Puppentheater Halle	Bernahdystr.	89	Halle	6110	www.puppentheater-halle.de	peggy.winter@puppen-theater-halle.de	+49-345-8978909	Peggy Winter
7	Kletterparadies	Hexenwall	66	Goslar	38640	www.kletterparadies-goslar.de	helge.raider@kletterparadies-goslar.de	+49-5325-99821	Helge Raider
8	Naturfelsen	Randstr.	24	Dresden	1067	www.naturfelsen.de	sylvio.brand@naturfelsen.de	+49-351-561849	Silvio Brandt
10	Jesuiten Kloster Bochelt	Jesuitenstr.	2	Bocholt	46395	www.jkb.de	bruder.josef@jkb.de	+49-2874-822671	Bruder Josef
11	Yoga Vidya Gemeinschaft	Hessenweg	58	Ahaus	48683	www.yvg.de	sudeta.Yaivaschi@yvg.de	+49-2561-5709	Sudeta Yaivaschi
4	Off-Theater-Leipzig	Rödelstr.	21	Leipzig	4229	www.off-theater-leipzig.de	mandy.bohne@off-theater-leipzig.de	+49-341-566578	Mandy Bohne
999	selbstorga	nostreet	99	noplace	99999	selbstorga.com	nomail	nophone	self
21	Museo del cinema	Via Montebello	20	Turin	10124	museocinema.it	prenotazioni@museocinema.it	+39-011-8138516	n.n
12	Wassersportcenter X-H2O	Wohldweg	47	Sankt Peter-Ording	25826	x-h2o.de	online-Formular	+49-48-63478800 	Janice Gutson
1	Wassersport Schimmel	Heckenweg	21	Ostseebad Binz	18609	www.wassersport-schimmel.de	mario.schimmel@waschispo.de	+49-38393-221221	Mario Schimmel
2	Neptunsport	Birkenallee	99	Ostseebad Binz	18609	www.neptunsport.org	hans.kafka@neptunsport.de	+49-38393-98229	Hans Kafka
1004	Hertha BSC	Hertastr	3	Berlin	12205	www.hertha.de	info@hertha	+49-30-78244	Peter Boltz
1005	Freak Event	Buntgarnwerke	7	Leipzig	4229	www.freakevent.org	info@freakevent.org	+49-341-927838	Frauke Richter
1006	Escape Event	Marxstr.	123	Berlin	133595	www.escapeevent.de	info@escapeevent.de	+49-30-877477473	Helge Feddersen
1007	Outdoor Events	Strasse des Friedens	99	Tauscha	4001	www.outdoorevents.com	info@outdoorevents.com	+49-3443-1289283	Jimmy Bondi
13	Windloop	Edo-Edzards-Straße	1	Neuharlingersiel	26427	windloop.de	contact@windloop.de	+49 1797884844	Fabbel
3	Nemo-Wassersport	Korallweg	23	Sylt	25980	www.nemo-wassersport.de	doris.alzher@nemo-wassersport.de	+49-4651-34556	Doris Alzher
\.


--
-- Name: anbieterseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.anbieterseq', 1007, true);


--
-- Data for Name: begleitet; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.begleitet (l_id, f_id) FROM stdin;
321	119
334	101
336	101
406	102
336	103
406	101
333	103
336	102
302	135
333	135
337	133
334	119
333	133
334	134
321	134
\.


--
-- Data for Name: fahrt; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.fahrt (f_id, f_name, von, bis, kl_ku, f_unterkunft) FROM stdin;
135	Nordsee	2014-05-23	2014-05-27	10a	509
101	Turin-LK_2017	2017-03-05	2017-03-15	IT-Q3	401
102	Kennlern-7a	2011-09-01	2011-09-03	7a	101
134	Bach & Co	2018-06-07	2018-06-14	8f	201
119	Ich Binz	2013-03-06	2013-03-13	9a	506
133	Münsterland	2014-03-04	2014-03-10	8b	507
103	Berlin	2015-09-03	2015-09-10	9b	\N
\.


--
-- Name: fahrtseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.fahrtseq', 135, true);


--
-- Data for Name: lehrer; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.lehrer (l_id, anrede, vname, nname, telnr) FROM stdin;
312	Frau	Katja	Eggern	302987425
333	Frau	Fiona	Eisenhauner	306834623
334	Frau	Silke	Schmid	30947250
406	Frau	Cora	Frost	77766321
336	Herr	Erkan	Aki	30173025
321	Herr	Alex	Austerlitz	901234567
337	Herr	Tim	Taler	302836139
302	Herr	Tim	Mahler	30827364
304	Herr	Max	Loewe	1512098470
\.


--
-- Name: lehrerseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.lehrerseq', 406, true);


--
-- Data for Name: nimmtteil; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.nimmtteil (s_id, f_id) FROM stdin;
102	101
132	101
233	101
151	102
152	102
155	102
151	119
152	119
155	119
105	103
106	103
111	103
115	134
121	134
122	134
105	133
111	133
106	133
152	135
151	135
155	135
\.


--
-- Data for Name: ort; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.ort (o_id, entfng, o_name, trprtm, geograf, ewzahl, sprache, schickf, urb_rur) FROM stdin;
101	460	Gallnacht	Bus	Mittelgebirge	640	deutsch	2	f
103	705	Trier	Zug/Flug	Flachland	110000	deutsch	4	t
104	696	Ruhpolding	Zug/Flug	Hochgebirge	6904	deutsch	4	f
202	723	Bregenz	Zug/Flug	Hochgebirge	29500	deutsch	4	t
402	1140	Turin	Flug	Voralpen	883000	italienisch	4	t
410	1850	Valetta	Flug	Mittelmeer	5700	maltesisch	5	t
420	1850	Athen	Flug	Mittelmeer	664000	griechisch	3	t
105	40	Königs Wusterhausen	Zug	Wald	36468	deutsch	4	f
100	340	Sankt Peter-Ording	Zug/Bus	Marschland	4101	deutsch	3	f
507	400	Binz	Zug	Ostsee	10000	deutsch	4	t
509	500	Münster	Zug/Flug	Flachland	250000	deutsch	8	t
513	600	Neuharlingersiel	Zug	Nordsee	5000	deutsch	3	f
\.


--
-- Name: orteseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.orteseq', 513, true);


--
-- Data for Name: schueler; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.schueler (s_id, vname, nname, gebdat, m_w) FROM stdin;
115	Fiona	Schulz	2004-01-01	w
121	Anja	Potter	2004-07-22	w
122	Sylwester	Symanski	2004-03-10	m
143	Juliana	Selnava	2005-05-06	w
167	Max	Thalberg	2001-11-30	m
169	Madonna	Swift	2001-11-30	w
170	Dominik	Pfeifer	2001-11-30	m
230	Martin	Fiedler	2002-11-30	m
233	Camelia	Beneventi	2001-11-30	w
243	Sascha	Amani	2001-11-30	w
113	Deniz	Özer	2003-11-30	m
102	Linda	Liste	2003-03-04	w
100	Franz	Fuchs	2003-07-27	m
105	Mesut	Mezul	2000-11-30	m
111	Rudi	Ratlos	2000-07-02	m
106	Susi	Sorglos	2000-01-21	w
152	Radojka	Vuckovic	1998-11-30	w
151	Luca	Freud	1998-03-30	w
155	Tim	Gersten	1999-11-30	m
132	Maik	Theiss	2002-09-10	m
\.


--
-- Name: schuelerseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.schuelerseq', 300, false);


--
-- Data for Name: unterkunft; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.unterkunft (u_id, u_name, typ, errbar, kosten, entfkern, u_ort) FROM stdin;
160	Winklmoosalm	Pension	Reisebus	19.00	8	104
101	Kiez Hölzerner See	Jugendherberge	ÖPNV	10.00	14	105
201	JUFA-Hotel	Hotel	ÖPNV	18.00	2	202
401	Tomato Backpackers Hotel	Jugendherberge	ÖPNV	16.00	0	402
411	Hostel Malti	Jugendherberge	ÖPNV	23.00	3	410
421	Kalithea	Jugendherberge	ÖPNV	12.00	4	420
102	Jugendherberge Trier	Jugendherberge	per pedes	10.00	1	103
506	Ostsee Hostel	Hostel	per pedes	16.00	2	507
507	Zum Kiepenkerl	Pension	per pedes	19.00	2	509
509	Moin Moin	Pension	ÖPNV	19.00	5	513
\.


--
-- Name: unterkunftseq; Type: SEQUENCE SET; Schema: public; Owner: parallels
--

SELECT pg_catalog.setval('public.unterkunftseq', 509, true);


--
-- Data for Name: wirdangeboten; Type: TABLE DATA; Schema: public; Owner: parallels
--

COPY public.wirdangeboten (ak_id, f_id) FROM stdin;
23	101
13	133
4	134
5	134
113	103
114	103
115	134
24	101
11	103
99	119
116	133
12	134
125	103
126	102
127	102
3	135
15	135
\.


--
-- Name: aktivitaet_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.aktivitaet
    ADD CONSTRAINT aktivitaet_pkey PRIMARY KEY (ak_id);


--
-- Name: anbieter_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.anbieter
    ADD CONSTRAINT anbieter_pkey PRIMARY KEY (an_id);


--
-- Name: begleitet_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.begleitet
    ADD CONSTRAINT begleitet_pkey PRIMARY KEY (l_id, f_id);


--
-- Name: fahrt_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.fahrt
    ADD CONSTRAINT fahrt_pkey PRIMARY KEY (f_id);


--
-- Name: lehrer_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.lehrer
    ADD CONSTRAINT lehrer_pkey PRIMARY KEY (l_id);


--
-- Name: nimmtteil_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.nimmtteil
    ADD CONSTRAINT nimmtteil_pkey PRIMARY KEY (s_id, f_id);


--
-- Name: ort_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.ort
    ADD CONSTRAINT ort_pkey PRIMARY KEY (o_id);


--
-- Name: schueler_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.schueler
    ADD CONSTRAINT schueler_pkey PRIMARY KEY (s_id);


--
-- Name: unterkunft_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.unterkunft
    ADD CONSTRAINT unterkunft_pkey PRIMARY KEY (u_id);


--
-- Name: wirdangeboten_pkey; Type: CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.wirdangeboten
    ADD CONSTRAINT wirdangeboten_pkey PRIMARY KEY (ak_id, f_id);


--
-- Name: aktivitaet_anbietr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.aktivitaet
    ADD CONSTRAINT aktivitaet_anbietr_fkey FOREIGN KEY (anbietr) REFERENCES public.anbieter(an_id) ON UPDATE CASCADE;


--
-- Name: begleitet_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.begleitet
    ADD CONSTRAINT begleitet_f_id_fkey FOREIGN KEY (f_id) REFERENCES public.fahrt(f_id);


--
-- Name: begleitet_l_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.begleitet
    ADD CONSTRAINT begleitet_l_id_fkey FOREIGN KEY (l_id) REFERENCES public.lehrer(l_id);


--
-- Name: fahrt_f_unterkunft_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.fahrt
    ADD CONSTRAINT fahrt_f_unterkunft_fkey FOREIGN KEY (f_unterkunft) REFERENCES public.unterkunft(u_id);


--
-- Name: nimmtteil_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.nimmtteil
    ADD CONSTRAINT nimmtteil_f_id_fkey FOREIGN KEY (f_id) REFERENCES public.fahrt(f_id);


--
-- Name: nimmtteil_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.nimmtteil
    ADD CONSTRAINT nimmtteil_s_id_fkey FOREIGN KEY (s_id) REFERENCES public.schueler(s_id);


--
-- Name: unterkunft_u_ort_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.unterkunft
    ADD CONSTRAINT unterkunft_u_ort_fkey FOREIGN KEY (u_ort) REFERENCES public.ort(o_id);


--
-- Name: wirdangeboten_ak_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.wirdangeboten
    ADD CONSTRAINT wirdangeboten_ak_id_fkey FOREIGN KEY (ak_id) REFERENCES public.aktivitaet(ak_id) ON UPDATE CASCADE;


--
-- Name: wirdangeboten_f_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: parallels
--

ALTER TABLE ONLY public.wirdangeboten
    ADD CONSTRAINT wirdangeboten_f_id_fkey FOREIGN KEY (f_id) REFERENCES public.fahrt(f_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

