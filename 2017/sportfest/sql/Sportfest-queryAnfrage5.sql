//SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
//Anfrage5...alle Schüler, die am 800m-Lauf teilnehmen
select SName, Klasse from Schueler natural join Wettkaempfe where WName = '800m Lauf';

