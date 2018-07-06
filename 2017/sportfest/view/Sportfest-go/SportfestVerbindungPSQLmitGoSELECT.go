package main
import "SQL"


func main() {
var conn SQL.Verbindung
var rs   int64
var SNr 			int		
var	SName			string
var	Klasse			string
//var	Geburtsdatum	time
var	Geschlecht		string
var	Schwimmnachweis bool

conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
rs = conn.Ausfuehren ("SELECT * FROM schueler;")
for rs.GibtTupel () {
	rs.LeseTupel (&tupel.SName,&tupel.Klasse,&tupel.Geburtsdatum,&tupel.Geschlecht,&tupel.Schwimmnachweis)
	println (SName,Klasse,Geburtsdatum,Geschlecht,Schwimmnachweis)
}// rs.Schliessen ()
defer conn.Beenden ()
if conn == nil {
println ("Verbindung fehlgeschlagen")
} else {
println ("Verbindung erfolgreich")
}
}

/*SNr 			INTEGER			PRIMARY KEY,
	SName			VARCHAR(32)		NOT NULL,
	Klasse			VARCHAR(32),
	Geburtsdatum		DATE,
	Geschlecht		CHAR(1),
	Schwimmnachweis 	BOOLEAN
	* */
	
