//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen alle Wettkämpfe, die auf dem Sportplatz stattfinden in der Sportfest-Datenbank
//	SQL:	select WName from Wettkaempfe natural join Wettkampfstaetten where WKStName = 'Sportplatz'


package main

import (
  "SQL"
  "fmt"
  )

type alleWettkaempfeSportplatz struct {
	WName		string
	
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleWettkaempfeSportplatz
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

     query	=	fmt.Sprintf (`select WNAME from Wettkaempfe natural join Wettkampfstaetten where WKStName = 'Sportplatz';`)                     
  
	 rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.WName)
    fmt.Printf ("%10s\n",tupel.WName)
        
    }
  rs.Schliessen ()
}
