CREATE TABLE beet (
	bnr						integer,	
	lage					integer CHECK (lage < 4 AND lage > 0),
	groesse					float CHECK (groesse > 0),
	schneckenfaktor			integer CHECK (schneckenfaktor < 4 AND schneckenfaktor > 0),
	CONSTRAINT pk_beet PRIMARY KEY (bnr)
);

CREATE TABLE gemuese (
	gnr						integer,	
	gname					varchar,
	familie					varchar,
	lage					integer CHECK (lage < 4 AND lage > 0),
	schneckenbeliebtheit	integer CHECK (schneckenbeliebtheit < 4 AND schneckenbeliebtheit > 0),
	CONSTRAINT pk_gemuese PRIMARY KEY (gnr)
);

CREATE TABLE haendler (
	hnr						integer,
	hname					varchar,
	anschrift				varchar,
	plz						char(5) CHECK (plz ~ '[0-9]{5}'),
	ort						varchar,
	CONSTRAINT pk_haendler PRIMARY KEY (hnr)
);

CREATE TABLE sorten (
	snr						integer,
	sname					varchar,
	eigenschaften			varchar,
	gnr						integer,
	fruehesteranbau			date,
	spaetesteranbau			date,	
	anbaudauer				integer,	
	CONSTRAINT pk_sorten PRIMARY KEY (snr)
);

CREATE TABLE arbeitsschritte (
	anr						integer,
	taetigkeit				varchar,
	CONSTRAINT pk_arbeitsschritte PRIMARY KEY (anr)
);

CREATE TABLE nachbarschaft (
	bnr1					integer	 	REFERENCES beet, 
	bnr2					integer 	REFERENCES beet, 
	CONSTRAINT pk_nachbarschaft PRIMARY KEY (bnr1, bnr2)
);

CREATE TABLE angebautes (
	annr					integer,
	snr						integer,
	bnr						integer,
	tatsaechlicheranbau		date,
	CONSTRAINT pk_angebautes PRIMARY KEY (annr)
);

CREATE TABLE vertraeglichkeit (
	gnr1					integer		REFERENCES gemuese,
	gnr2					integer		REFERENCES gemuese,
	CONSTRAINT pk_vertraeglichkeit PRIMARY KEY (gnr1, gnr2)
);


CREATE TABLE vertrieb (
	hnr						integer		REFERENCES haendler,
	snr						integer		REFERENCES sorten,
	preis					float		CHECK (preis > 0),
	packungseinheit			varchar,
	packungsmenge			float		CHECK (packungsmenge > 0),
	CONSTRAINT pk_vertrieb PRIMARY KEY (hnr, snr)
);

CREATE TABLE erfordern (
	annr					integer		REFERENCES angebautes,
	anr						integer		REFERENCES arbeitsschritte,
	zeitbis					integer		CHECK (zeitbis >= 0),
	CONSTRAINT pk_erfordern PRIMARY KEY (annr, anr, zeitbis)
);

