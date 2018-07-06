//SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
//Anfrage7...welche Schüler des 10. Jahrgangs unterstützen um 09:00 Uhr die Aufsicht ?
select SName from Schueler natural join Aufsichtsunterstuetzung where Klasse = '10' AND UAZeit = '09:00';

