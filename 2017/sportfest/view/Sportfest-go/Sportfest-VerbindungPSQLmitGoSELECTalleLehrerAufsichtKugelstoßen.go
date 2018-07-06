//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen ...welcher Lehrer beaufsichtigt den Wettkampf „Kugelstoßen“ ? in der Sportfest-Datenbank
//	SQL:	select PNr, LName from Lehrer natural join Wettkaempfe natural join Wettkampfstaetten natural join statfinden where WName = 'Kugelstoßen'




package main

import (
  "SQL"
  "fmt"
    )

type alleLehrerAufsichtKugelstossen struct {
	PNr				int
	LName			string
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleLehrerAufsichtKugelstossen
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

   query	=	fmt.Sprintf (`select PNr, LName from Lehrer 
								natural join Wettkaempfe natural join Wettkampfstaetten natural join
								stattfinden where WName = 'Kugelstoßen' ; `)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.PNr,&tupel.LName)
    fmt.Printf ("%2d %-10s\n",tupel.PNr,tupel.LName)
    
    }
  rs.Schliessen ()
}
