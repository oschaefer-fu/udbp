//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen alleSchueler in der Sportfest-Datenbank
package main

import (
  "SQL"
  "fmt"
  "time"
)

type alleSchueler struct {
	snr 			int
	sname			string
	klasse			string
	geburtsdatum	time.Time
	geschlecht		string
	schwimmnachweis bool
}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleSchueler
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

  //query = fmt.Sprintf (`SELECT  *
  //                     FROM    schueler;`)
   query	=	fmt.Sprintf (`SELECT  *  FROM    schueler Where schwimmnachweis = true;`)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.snr,&tupel.sname,&tupel.klasse,&tupel.geburtsdatum,&tupel.geschlecht,&tupel.schwimmnachweis)
    fmt.Printf ("%2d %-10s %-10s %-10s %-5s %-10s\n",tupel.snr,tupel.sname,tupel.klasse,tupel.geburtsdatum,tupel.geschlecht,tupel.schwimmnachweis)
    
    }
  rs.Schliessen ()
}
