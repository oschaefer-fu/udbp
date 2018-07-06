//  Autor:  Mirko Hertel
//  Datum:  16.06.2017
//  Zweck:  Suchen alle Schueler in der Sportfest-Datenbank
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
    eingabe string = "Ja"
          )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()
  
	println ("                    Datenbank Sportfest")
	println ("             ")
	println ("             ")
	println ("Abfrage teilnehmender Schüler und Schülerinnen nach Jahrgang und Geschlecht")
	println ("Geben Sie nun Ja und drücken Sie ENTER")
	println ("             ")


	fmt.Scanf ("%s\n", &eingabe)
	if eingabe != "Ja" { rs.Schliessen () }
	println ("             ")
	println ("             ")
	
  query = fmt.Sprintf (`SELECT  * FROM    schueler;`)
  
  rs = conn.Anfrage (query)

  for rs.GibtTupel () {
    rs.LeseTupel (&tupel.snr,&tupel.sname,&tupel.klasse,&tupel.geburtsdatum,&tupel.geschlecht,&tupel.schwimmnachweis)
    fmt.Printf ("%10d %-10s %-5s %-15s %-5s  %-5t\n", tupel.snr,tupel.sname,tupel.klasse,SQL.Datum(tupel.geburtsdatum),tupel.geschlecht,tupel.schwimmnachweis)
    
    }
  rs.Schliessen ()
}
