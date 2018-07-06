\copy (SELECT * FROM beet) TO 'beet.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM nachbarschaft) TO 'nachbarschaft.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM sorten) TO 'sorten.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM gemuese) TO 'gemuese.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM angebautes) TO 'angebautes.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM haendler) TO 'haendler.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM vertrieb) TO 'vertrieb.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM vertraeglichkeit) TO 'vertraeglichkeit.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM arbeitsschritte) TO 'arbeitsschritte.csv' DELIMITER ',' CSV HEADER;
\copy (SELECT * FROM erfordern) TO 'erfordern.csv' DELIMITER ',' CSV HEADER;

