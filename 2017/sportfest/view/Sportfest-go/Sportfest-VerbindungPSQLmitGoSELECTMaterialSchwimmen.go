//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen in der Sportfest-Datenbank ...welche Materialien werden von der Wettkampfstäte „Schwimmhalle“ benötigt ? 
//	SQL:	select MName from Material natural join Bedarf natural join Wettkampfstaetten natural join stattfinden where WKStName = 'Schwimmhalle'



package main

import (
  "SQL"
  "fmt"
  )

type MaterialSchwimmhalle struct {
	MName		string
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   MaterialSchwimmhalle
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

     query	=	fmt.Sprintf (`select MName from Material 
								natural join Bedarf 
								natural join Wettkampfstaetten 
								natural join stattfinden where WKStName = 'Schwimmhalle' ;`)                     
  
	 rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.MName)
    fmt.Printf ("%10s\n",tupel.MName)
        
    }
  rs.Schliessen ()
}
