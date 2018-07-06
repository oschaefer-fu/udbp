----------------ANFRAGEN AUCH IN RA TPC DRC 
--#1 alles aus tabelle ausstattung *
SELECT * FROM ausstattung; 

--#2 nname aus lehrer *
SELECT nname 
FROM lehrer;

--#3 lehrer mit namen 'Czetö' *
SELECT * 
FROM lehrer 
WHERE nname='Czetö'; 

--#4 alle Raumnummern der Räume im ersten Stock **
SELECT rnr 
FROM raum 
WHERE stock=1;
 
--#5 Nummern aller Räume mit Beamer ***
SELECT rnr 
FROM raum NATURAL JOIN hat NATURAL JOIN ausstattung 
WHERE geraete='Beamer';
-----------------------------

-- 0. Wie ist die Kontonummer einer Schülerin? *
SELECT vname,nname,konr 
FROM schueler natural join konto 
WHERE vname = 'Frieder' AND nname ='Bär';

--- 1a - Welche Schüler haben kein Guthaben ? (Kontostand )*
SELECT vname,nname 
FROM schueler natural join konto 
WHERE kontostand = 0; 

--- 1b- Welche Schüler haben Guthaben **
SELECT vname,nname,kontostand 
FROM schueler natural join konto 
WHERE kontostand > 0;

--- 1c - nach Größe sortiert -( Beginn geringster )
SELECT vname,nname,kontostand 
FROM schueler natural join konto
WHERE kontostand > 0 ORDER BY kontostand ASC;

--- 2.  Auflistung aller „Schüler-Peter“ ? *
SELECT * 
FROM schueler 
WHERE vname = 'Peter';

--- 3.  Liste der Räume im 1. Stock? *
SELECT RNR 
FROM raum 
WHERE stock = 1; 
 
--- 4. Welcher Lehrer ist Klassenlehrer von Gabi Gammel?*
SELECT kuerzel,nname,email 
FROM schueler natural join lehrer 
WHERE schueler.nname = 'Gammel' AND schueler.vname = 'Gabi'; 
-------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxFehlerhaftg
--- 5. Kursliste: Alle Schüler mit Vor-, Nachname,Klassenlehrer und E-Mail* 1/2*
SELECT schueler.nname AS nachname , schueler.vname AS vorname, schueler.email AS email , lehrer.nname AS klassenlehrer 
FROM schueler, lehrer;

SELECT schueler.nname,  schueler.vname, schueler.email,  lehrer.nname AS klassenlehrer 
FROM schueler, lehrer WHERE schueler.LID = lehrer.LID;

SELECT schueler.nname AS nachname , schueler.vname AS vorname, schueler.email AS email , lehrer.nname AS klassenlehrer 
FROM schueler,lehrer WHERE schueler.LID = lehrer.LID;

-- 6.  Liste der Schüler, die bei WEB.de sind ? **
SELECT nname, vname 
FROM schueler 
WHERE email LIKE '%luise.net'; 

-- 6a.  Liste der Lehrer, die bei vim.org sind ? **
SELECT nname,kuerzel 
FROM lehrer 
WHERE email LIKE '%vim.org';

-- 7.  Welcher Schüler ist in einem bestimmten Kurs unter 16 Jahre alt? **
SELECT * 
FROM schueler natural join eingeschrieben 
WHERE age(geb) < '16 year' order by knr;

-- 8. Liste der Schüler, nach Anzahl ihrer anbietenden Kurse sortiert? *** 
-- SELECT *
-- FROM kurs NATURAL JOIN schueler GROUP BY  vname, ms having  max(count(vname)) = count(vname) ;

-- 9. Wie viele Schüler haben „Mathematik“ belegt? *** AAG
SELECT COUNT(*) AS Anzahl_schueler_Mathematik 
FROM ((fach  NATURAL JOIN vermittelt) NATURAL JOIN kurs) AS f, schueler as s, eingeschrieben AS e
WHERE e.sid = s.sid AND f.knr = e.knr AND fname = 'Mathematik'; 
	
-- 10. Wie viele Schüler sind im Kurs 2 eingeschrieben? **
SELECT COUNT(sid) AS Anzahl_eingeschrieben_in_Kurs_2 
FROM eingeschrieben 
WHERE knr = 2;

-- 11. Wer leitet den Kurs 'Mathematik' an welchem Tag?
SELECT sk.knr, sk.vname,sk.nname AS Kursleitung_Mathematik ,sk.wtag
FROM(schueler NATURAL JOIN kurs) AS sk,(vermittelt NATURAL JOIN fach) AS vf
WHERE fname = 'Mathematik' AND sk.knr = vf.knr;
	
-- 12. Liste aller Räume, die min 30 Plätze  ** haben (zusätzlich) mit Beamer *** (mit Views)
SELECT * 
FROM raum 
WHERE anzP > 30;

-- 13. In welchen Räumen gibt es einen Beamer? **
SELECT * 
FROM (raum NATURAL JOIN hat NATURAL JOIN ausstattung) AS rha;

SELECT * 
FROM ausstattung 
WHERE geraete = 'Beamer';

SELECT geraete  = 'Beamer' 
FROM raum NATURAL JOIN hat NATURAL JOIN ausstattung 
WHERE geraete ='Beamer';

-- 14. Welche Raumnummern haben diese? ***
SELECT rnr 
FROM raum NATURAL JOIN hat NATURAL JOIN ausstattung 
WHERE geraete ='Beamer';
SELECT RNR 
FROM raum NATURAL JOIN hat 
WHERE ANR = 2;
SELECT COUNT( * ) AS Raeume_mit_Beamer 
FROM raum NATURAL JOIN hat NATURAL JOIN ausstattung GROUP BY geraete HAVING geraete ='Beamer';

-- 15. Welcher Lehrer macht wann Aufsicht? **
SELECT kuerzel, wtag, zeit
FROM (kurs NATURAL JOIN beaufsichtigt NATURAL JOIN lehrer) ORDER BY kuerzel;

-- 16. Wo ist ein(e) SchülerIn am Montag zu finden?   Schreibt ein/ bietet an select schüler / where wtag = Montag *** 


-- 17. Wie viele Kurse werden am Donnerstag angeboten? *** AGG

-- 18. Wieviele Plätze sind im Kurs "Informatik" noch frei? ***** AGG
SELECT * 
FROM ((fach  NATURAL JOIN vermittelt) NATURAL JOIN kurs ) AS f,schueler as s, eingeschrieben AS e 
WHERE e.sid = s.sid AND f.knr = e.knr AND fname = 'Informatik';
SELECT MAX(f.maxP) - COUNT(fname) AS Freie_Plaetze_Informatik 
FROM ((fach  NATURAL JOIN vermittelt) NATURAL JOIN kurs ) AS f,schueler as s, eingeschrieben AS e 
WHERE e.sid = s.sid AND f.knr = e.knr AND fname = 'Informatik';

-- 22. (im Fach „informatik“, alle Schüler, gleiche Kursnummer ,  und mit max P vergleichen. AGG
-- 23. Alle  Schüler nach Klassenlehrer alphabetisch sortiert in aufsteigenden Jahrgängen?//  group by lehrerID / oder by klassenstufe ****
-- 24. Wie viele Schüler von Klassenlehrer X belegen Mathematik? **** AGG


