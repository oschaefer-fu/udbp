//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen ..welche Schüler des 10. Jahrgangs unterstützen um 09:00 Uhr die Aufsicht  in der Sportfest-Datenbank
//	SQL:	select SName from Schueler natural join Aufsichtsunterstuetzung where Klasse = '10' AND UAZeit = '09:00'



package main

import (
  "SQL"
  "fmt"
    )

type alleSchuelerAufsichtsunterstuetzung struct {
	sname			string
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleSchuelerAufsichtsunterstuetzung
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

   query	=	fmt.Sprintf (`select SName from Schueler natural join Aufsichtsunterstuetzung where Klasse = '10' AND UAZeit = '09:00' ; `)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.sname)
    fmt.Printf ("%-10s\n",tupel.sname)
    
    }
  rs.Schliessen ()
}
