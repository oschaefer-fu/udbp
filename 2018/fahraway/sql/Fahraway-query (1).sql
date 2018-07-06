-- Anfragen an die Datenbank Fahraway
-- M. Bertuch (1.-16.), Aiko Czetö (41./42./43.)

-- 1. Frage nach allen Daten von Fahrt.
\echo 'alle Daten von fahrt'  
SELECT * 
FROM fahrt;

-- 2. Frage nach den Attributen bezng, art und katgrie  von Aktivitaet.
\echo 'Attribute bezng, art und katgrie  von aktivitaet'  
SELECT bezng, art, katgrie
FROM aktivitaet;

-- 3. Frage nach den Attributen bezng, art und katgrie von Aktivitaet als Bezeichnung, Art und Kategorie.
\echo 'Attribute bezng, art und katgrie von aktivitaet als Bezeichnung, Art und Kategorie' 
SELECT bezng AS Bezeichnung, art AS Art, katgrie AS Kategorie
FROM aktivitaet;

-- 4. Frage nach bezng, art und kosten von allen Aktivitäten, die nicht mehr als 15 Euro kosten.   
\echo 'bezng, art und kosten von allen Aktivitäten, die nicht mehr als 15 Euro kosten'   
SELECT bezng AS Bezeichnung, art AS Art, katgrie AS Kategorie, akpreis AS Kosten
FROM aktivitaet
WHERE akpreis <= 15;

-- 5. Frage nach dem Namen aller Unterkünfte als Unterkunft, der Entfernung vom Ortskern und den Kosten von allen Unterkünften in einer Entfernung von maximal 1 km vom Ortskern und Übernachtungs-Kosten von maximal 20 €.
\echo 'die Namen aller Unterkünfte als Unterkunft in einer Entfernung von maximal 1 km vom Ortskern und Übernachtungs-Kosten von maximal 20 €'
SELECT u_name AS Unterkunft, entfkern, kosten
FROM unterkunft
WHERE entfkern <= 1 AND kosten <= 20;

-- 6. Frage nach Name und Kategorie aller Aktivitaeten, die man nur im Sommer oder Herbst durchfuehren kann'
\echo '10. Name und Kategorie aller Aktivitaeten, die man nur im Sommer oder Herbst durchfuehren kann'
SELECT bezng, katgrie
FROM aktivitaet
WHERE (jahrz2 OR jahrz3) AND NOT (jahrz1 OR jahrz4);

-- 7. Frage nach den Vor- und Nachnamen aller Schüler und Schülerinnen, die mindestens 16 Jahre alt sind. 
\echo 'die Namen aller Schüler und Schülerinnen, die mindestens 16 Jahre alt sind '
SELECT vname, nname
FROM schueler
WHERE (current_date - gebdat) >= 16*365-4;

-- 8. Frage nach der Anzahl aller erfassten Fahrten.
\echo 'die Anzahl aller erfassten Fahrten'
SELECT COUNT (*)
FROM fahrt;

-- 9. Frage nach der Anzahl aller Orte bis zu einer Entfernung von 400 km.
\echo 'die Anzahl aller Orte bis zu einer Entfernung von 400 km '
SELECT COUNT (*)
FROM ort
WHERE entfng <=  400;

-- 10. Frage nach der durchschnittlichen Entfernung aller Orte.
\echo '9. die durchschnittliche Entfernung der erfassten Orte '
SELECT AVG(entfng) AS "durchschnittliche Entfernung"
FROM ort;

-- 11. Frage nach der Anzahl der städtischen und ländlichen Orte.
\echo '11. Anzahl der städtischen und ländlichen Orte'
SELECT urb_rur, COUNT (*) 
FROM ort 
GROUP BY urb_rur

-- 12. Frage nach der Anzahl der städtischen und ländlichen Orte mit mehr als 100.000 Einwohnern.
\echo '12. Anzahl der städtischen und ländlichen Orte mit mehr als 100000 Einwohnern'
SELECT urb_rur, COUNT (*) 
FROM ort 
WHERE ewzahl > 100000
GROUP BY urb_rur

-- 13. Frage nach der Anzahl der städtische und ländliche Orte mit einer Häufigkeit größer vier.
\echo '13. Anzahl der städtischen und ländlichen Orte mit Häufigkeit größer 4'
SELECT urb_rur, COUNT (*) 
FROM ort 
GROUP BY urb_rur HAVING COUNT(*) > 4;

-- 14. Frage nach der Anzahl der Aktivitäten pro Kategorie in absteigender Reihenfolge.
\echo '14. die Anzahl der Aktivitäten pro Kategorie in absteigender Reihenfolge' 
SELECT  katgrie, COUNT(*)
FROM aktivitaet
GROUP BY katgrie
ORDER BY COUNT(*) DESC;

-- 15. Frage nach der Anzahl aller Anbieter pro Ort in aufsteigender Reihenfolge. 
\echo '15. die Anzahl aller Anbieter pro Ort in aufsteigender Reihenfolge ' 
SELECT COUNT(*), ort 
FROM anbieter
GROUP BY ort
ORDER BY COUNT(*) ASC;


-- 16. Frage nach allen Fahrten mit ihrer Dauer in Tagen. 
\echo '16. Frage nach allen Fahrten mit ihrer Dauer in Tagen'
SELECT f_name, bis-von+1 AS Dauer
FROM fahrt;


-- 17. Frage nach Name, Bewertung und Preis der beliebtesten Aktivitaet.
\echo '17. Name, Bewertung und Preis der beliebtesten Aktivitaet'
SELECT bezng, bewert, akpreis 
FROM aktivitaet WHERE bewert IN 
  (SELECT MAX(bewert) 
   FROM aktivitaet);

-- Anfragen an mehrere Tabellen:

-- 20. Frage nach allen Unterkünften mit ihrem Ort ohne explizit JOIN zu verwenden 
\echo '20. alle Unterkünfte mit ihrem Ort'
SELECT u_name, o_name
FROM unterkunft, ort
WHERE u_ort = o_id;

-- 21. Frage nach allen Unterkünften mit ihrem Ort. Verwende JOIN .. ON.
\echo '21. alle Unterkünfte mit ihrem Ort mit JOIN'
SELECT u_name, o_name
FROM unterkunft JOIN ort ON u_ort = o_id;

-- 22. Frage nach Anrede und Name von Lehrer (einmaliges Auftreten), die schon Fahrten begleitet haben. 
\echo 'Lehrer, die schon einmal gefahren sind'   
SELECT DISTINCT anrede, nname FROM begleitet NATURAL JOIN lehrer


-- 23.  Frage nach den Lehrern, die die Fahrt Turin-LK_2017 begleiten ohne JOIN.
\echo '22. Welche Lehrer begleiten die Fahrt Turin-LK_2017'
SELECT anrede, vname, nname 
FROM lehrer, begleitet, fahrt  
WHERE lehrer.l_id = begleitet.l_id AND begleitet.f_id = fahrt.f_id AND f_name = 'Turin-LK_2017';

-- 24.  Frage nach den Lehrern, die die Fahrt Turin-LK_2017 begleiten mit NATURAL JOIN.
\echo '23. Welche Lehrer begleiten die Fahrt Turin-LK_2017'
SELECT anrede, vname, nname 
FROM lehrer NATURAL JOIN begleitet NATURAL JOIN fahrt  
WHERE f_name = 'Turin-LK_2017';

-- 25. Frage nach allen Fahrten mit ihrer Dauer in Tagen und den Übernachtungskosten pro Schüler.
\echo '24. Fahrten mit ihrer Dauer in Tagen und den Übernachtungskosten pro Schüler'
SELECT f_name, bis-von+1 AS Dauer, (bis-von) * unterkunft.kosten AS Übern_Kosten
FROM fahrt, unterkunft
WHERE fahrt.f_unterkunft = u_id;

-- 26. Frage nach den Taschengeld_Kosten aller Fahrten bei pauschal 5 € pro Tag mal Schickfaktor des Ortes für die Dauer der Fahrten 
\echo '25. Taschengeld_Kosten aller Fahrten bei pauschal 5 € pro Tag mal Schickfaktor des Ortes für die Dauer der Fahrten'
SELECT f_name, o_name, schickf, 5 * schickf * (bis-von) AS Taschengeld_ges
FROM ort, unterkunft, fahrt  
WHERE f_unterkunft = u_id AND u_ort = o_id;

-- 27. Teste, ob es wirklich nach allen eingetragenen Orten Fahrten gegeben hat, durch eine Anfrage nach nicht besuchten Orten. 
\echo '27. nicht besuchte Orte'
SELECT o_name
FROM ort
WHERE NOT EXISTS (
   SELECT o_name
   FROM ort, unterkunft, fahrt
   WHERE ort.o_id = unterkunft.u_id AND unterkunft.u_id = fahrt.f_id
);

-- 28. Frage von allen fahrenden Schuelern nach Unterkunft, dem begleitenden Lehrer und dessen Telefon-Nummer, geordnet nach Schueler-Nachname (verwende kein explizites NATURAL JOIN).
\echo '26. von allen fahrenden Schuelern Unterkunft, begleitender Lehrer und dessen Telefon-Nummer '
SELECT schueler.nname, schueler.vname, unterkunft.u_name, lehrer.anrede, lehrer.nname, lehrer.telnr 
FROM schueler, nimmtteil, fahrt, unterkunft, begleitet, lehrer
WHERE nimmtteil.s_id = schueler.s_id AND begleitet.f_id = fahrt.f_id AND begleitet.l_id = lehrer.l_id AND nimmtteil.f_id = fahrt.f_id AND  fahrt.f_unterkunft = unterkunft.u_id ORDER BY schueler.nname;

-- 29. Frage von allen fahrenden Schuelern nach Unterkunft, dem begleitenden Lehrer und dessen Telefon-Nummer mit dreimal NATURAL JOIN geordnet nach Schuelern (der vierte NJOIN scheitert an gleichlautenden Attributbezeichnern in Schueler und Lehrer und liefert eine leere Tabelle) 
\echo '27. von allen fahrenden Schuelern Unterkunft, begleitender Lehrer und dessen Telefon-Nummer '
SELECT schueler.nname, schueler.vname, unterkunft.u_name, lehrer.anrede, lehrer.nname, lehrer.telnr 
FROM schueler NATURAL JOIN nimmtteil NATURAL JOIN fahrt NATURAL JOIN begleitet, lehrer, unterkunft
WHERE begleitet.l_id = lehrer.l_id AND  fahrt.f_unterkunft = unterkunft.u_id ORDER BY schueler.nname;

-- 30. Wie 29, aber alternative Verkettung in umgekehrter Reihenfolge (vierter NATURAL JOIN wird wieder nicht akzeptiert)
\echo '28. von allen fahrenden Schuelern Unterkunft, begleitender Lehrer und dessen Telefon-Nummer '
SELECT schueler.nname, schueler.vname, unterkunft.u_name, lehrer.anrede, lehrer.nname, lehrer.telnr 
FROM lehrer NATURAL JOIN begleitet NATURAL JOIN fahrt NATURAL JOIN nimmtteil, unterkunft, schueler
WHERE schueler.s_id = nimmtteil.s_id AND unterkunft.u_id = fahrt.f_unterkunft
ORDER BY schueler.nname;

-- 31. Frage von allen in 2017 fahrenden Schuelern nach Unterkunft, dem begleitenden Lehrer und dessen Telefon-Nummer mit dreimal NATURAL JOIN geordnet nach Schueler-Nachname.
\echo '28. von allen in 2017 fahrenden Schuelern Unterkunft, begleitender Lehrer und dessen Telefon-Nummer '
SELECT schueler.nname, schueler.vname, unterkunft.u_name, lehrer.anrede, lehrer.nname, lehrer.telnr 
FROM lehrer NATURAL JOIN begleitet NATURAL JOIN fahrt NATURAL JOIN nimmtteil, schueler, unterkunft WHERE unterkunft.u_id = fahrt.f_unterkunft AND nimmtteil.s_id = schueler.s_id AND EXTRACT (YEAR FROM fahrt.von) = 2017 ORDER BY schueler.nname;


-- 32. Frage nach allen Lehrern und den IDs der eventuell begleitetet Fahrten mit einem OUTER JOIN.
\echo '29. Alle Lehrern und die IDs der eventuell begleiteten Fahrten mit einem OUTER JOIN'
SELECT anrede, vname, nname, f_id
FROM lehrer LEFT OUTER JOIN begleitet ON lehrer.l_id = begleitet.l_id;


-- 40. Frage nach Schueler-ID, Schueler-Nach-/Vorname, Ortsname und Fahrtenname, aller Schueler, die noch nie weiter als 400km gereist sind.
\echo '40. alle SuS, die noch nie weiter als 400km gereist sind'
SELECT schueler.s_id, schueler.nname, schueler.vname , o_name, f_name
FROM schueler NATURAL JOIN nimmtteil NATURAL JOIN fahrt, unterkunft, ort
WHERE  fahrt.f_unterkunft = u_id AND u_ort = o_id AND ort.entfng < 400 ;

-- 41. wie 40, aber als geschachtelte Struktur
\echo '40. alle SuS, die noch nie weiter als 400km gereist sind'
SELECT schueler.s_id, schueler.nname, schueler.vname
FROM schueler
WHERE schueler.s_id IN (
		SELECT nimmtteil.s_id 
		FROM nimmtteil 
		WHERE nimmtteil.f_id IN (
			SELECT fahrt.f_id 
			FROM fahrt 
			WHERE fahrt.f_unterkunft IN (
				SELECT unterkunft.u_id 
				FROM unterkunft 
				WHERE unterkunft.u_ort IN (
					SELECT ort.o_id 
					FROM ort 
					WHERE ort.entfng<400))));

-- 42. Frage nach der Anzahl der SuS, die noch nie weiter als 400km gereist sind.
\echo '41. Anzahl der SuS, die noch nie weiter als 400km gereist sind'
SELECT COUNT (schueler.s_id)
FROM schueler 
WHERE schueler.s_id IN (
		SELECT nimmtteil.s_id 
		FROM nimmtteil 
		WHERE nimmtteil.f_id IN (
			SELECT fahrt.f_id 
			FROM fahrt 
			WHERE fahrt.f_unterkunft IN(
				SELECT unterkunft.u_id 
				FROM unterkunft 
				WHERE unterkunft.u_ort IN (
					SELECT ort.o_id 
					FROM ort 
					WHERE ort.entfng<400))));


-- 43. Aufgabe: erstelle eine Anfrage, die die Ausgabe des php-scripts "Klassenfahrt.php" liefert
\echo '42. Übersichtstabelle einer Fahrt mit den Informationen: Hin-, Rückreisedatum, Unterkunft,'
\echo 'Ort, Entfernung, Unterbringungskosten, Klasse, Aktivität, Typ der Akt., Preis'
SELECT	fahrt.von, 
		fahrt.bis, 
		unterkunft.u_name, 
		ort.o_name, 
		ort.entfng, 
		unterkunft.kosten, 
		fahrt.kl_ku,
		aktivitaet.bezng, 
		aktivitaet.art, 
		anbieter.an_name,  
		aktivitaet.akpreis 
		
 FROM 
		unterkunft 
 LEFT OUTER JOIN 
		ort 
			ON 		unterkunft.u_ort = ort.o_id
 LEFT OUTER JOIN 
		fahrt 
			ON 		fahrt.f_unterkunft = unterkunft.u_id
 NATURAL JOIN 
		wirdangeboten 
 NATURAL JOIN 
		aktivitaet
 LEFT OUTER JOIN 
		anbieter 
			ON 		aktivitaet.anbietr = anbieter.an_id;--



-- to do:
-- nicht anbietende Anbieter

SELECT an_name
FROM anbieter
WHERE NOT EXISTS (
   SELECT an_name
   FROM anbieter, aktivitaet, wirdangeboten
   WHERE anbieter.an_id = aktivitaet.anbietr AND aktivitaet.ak_id = wirdangeboten.ak_id
); 



 




