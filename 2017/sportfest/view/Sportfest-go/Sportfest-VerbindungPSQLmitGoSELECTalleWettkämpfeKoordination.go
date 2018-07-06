//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen alle Wettkämpfe aus dem Bereich Koordination in der Sportfest-Datenbank
//	SQL:	select WName from Wettkämpfe where Kategorie = 'Koordination'

package main

import (
  "SQL"
  "fmt"
  )

type alleWettkaempfeKoordination struct {
	wkname			string
	
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleWettkaempfeKoordination
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

     query	=	fmt.Sprintf (`select WName from Wettkaempfe where Kategorie = 'Koordination';`)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.wkname)
    fmt.Printf ("%10s\n",tupel.wkname)
        
    }
  rs.Schliessen ()
}
