//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen wann findet der Wettkampf „Kugelstoßen“ statt in der Sportfest-Datenbank
//	SQL:	select SFZeit from Statfinden natural join Wettkaempfe where WName = 'Kugelstoßen'


package main

import (
  "SQL"
  "fmt"
  "time"
  )

type ZeitWettkampfKugelstossen struct {
	SFzeit	time.Time
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   ZeitWettkampfKugelstossen
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

     query	=	fmt.Sprintf (`select SFZeit from Stattfinden natural join Wettkaempfe where WName = 'Kugelstoßen';`)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.SFzeit)
    fmt.Printf ("%10s\n",SQL.Uhrzeit(tupel.SFzeit))
        
    }
  rs.Schliessen ()
}
