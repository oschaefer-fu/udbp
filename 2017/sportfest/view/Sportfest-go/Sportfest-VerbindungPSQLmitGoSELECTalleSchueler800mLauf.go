//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen .alle Schüler, die am 800m-Lauf teilnehmen in der Sportfest-Datenbank
//	SQL:	select Sname, Klasse from Schueler natural join Wettkaempfe where WName = '800m Lauf'



package main

import (
  "SQL"
  "fmt"
  )

type alleSchueler800mLauf struct {
	sname			string
	klasse			string
	}

func main() {
  var (
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   alleSchueler800mLauf
    query   string
      )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()

   query	=	fmt.Sprintf (`select Sname , Klasse from Schueler natural join Wettkaempfe where WName = '800m Lauf'; `)                     
  
   rs 		= 	conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.sname,&tupel.klasse)
    fmt.Printf ("%10s %-10s\n",tupel.sname,tupel.klasse)
    
    }
  rs.Schliessen ()
}
