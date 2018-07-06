//SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
//Anfrage4...alle Wettkämpfe, die auf dem Sportplatz statfinden.
select WName from Wettkaempfe natural join Wettkampfstaetten where WKStName = 'Sportplatz';

