//SQL Anfragen mit Kommentaren Projekt Datenbank Sportfest
//Anfrage9...welche Materialien werden von der Wettkampfstätte „Schwimmhalle“ benötigt ?
select MName from Material natural join Bedarf natural join Wettkampfstaetten natural join stattfinden where WKStName = 'Schwimmhalle';



