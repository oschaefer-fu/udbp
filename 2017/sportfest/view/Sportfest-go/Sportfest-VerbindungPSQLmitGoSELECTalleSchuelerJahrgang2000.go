//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen alle Schüler, die Jahrgang 2000 sind in der Sportfest-Datenbank
//	SQL:	select SName from Schueler where Geburtsdatum between '2000-01-01' and '2000-12-31'


package main

import (
  "SQL"
  "fmt"
  )

type alleSchuelerJahrgang2000 struct {
	sname			string
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleSchuelerJahrgang2000
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

   query	=	fmt.Sprintf (`select SName from Schueler where Geburtsdatum between '2000-01-01' and '2000-12-31' `)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.sname)
    fmt.Printf ("%-10s\n",tupel.sname)
    
    }
  rs.Schliessen ()
}
