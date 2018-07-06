package main

//  Autor:  Michael Reichelt
//  Datum:  30.05.2018
//  Zweck:  Suchen in einer Datenbank
//          Ausgabe über das gfx-Paket von Stefan Schmidt,
//          Einlesen der Benutzereingaben und Ausgabe über das felder-Paket

import (
  "SQL"
  "gfx"
  "felder"
  //"strconv"
  "fmt"
  //."time"
)

type abfrage struct {
  schulfachnaehe   	 string
  sbewertung   string
  pname		 string
  fname 		 string
  lname string
}

func main() {
  var (
    conn      SQL.Verbindung
    rs        SQL.Ergebnismenge
    tupel     abfrage
    query ,query1    string
    eingabe   string
    suche1,suche2,suche3     felder.Feld
	anzeige1, anzeige2, anzeige3 , anzeige4, anzeige5 felder.Feld
	taste 	  uint16
	ex, ey, ax, ay int
  )

  conn = SQL.PgSQL ("host=127.0.0.1 user=lewein dbname=praktikum password=niewel")
  defer conn.Beenden ()

// Aufbau Fenster
  gfx.Fenster (1024, 768)
	// Überschrift
	gfx.SetzeFont (felder.FONTPATH_FELD, 18)
	gfx.SchreibeFont        (gfx.Grafikspalten ()/2-4*11, 2, "Praktikum")
	
	// Eingabefeld
	ex = int(gfx.Grafikspalten ()/2)
	ey = 60
	gfx.Rechteck(5,uint16(ey-30),gfx.Grafikspalten ()-10,80)
	gfx.SetzeFont (felder.FONTPATH_DESC, 14)
	gfx.SchreibeFont        (10, uint16(ey-28), "Suche:")
	suche1 =   felder.New 	(10									,  ey, 30, 'l', "Gib das Fach ein:")
	suche2 =   felder.New 	(ex  -15*int(felder.FONTWIDTH)-2	,  ey, 30, 'l', "Gib die Firma ein:")
	suche3 =   felder.New 	(ex*2-30*int(felder.FONTWIDTH)-10  	,  ey, 30, 'l', "Gib die Bewertung ein:")
	// Ausgabefelder
	ax = int(gfx.Grafikspalten ()/2-15*felder.FONTWIDTH-2)
	ay = 160
	anzeige1 = felder.New 	(ax, ay    , 30, 'l', "Schulfachnähe:")
	anzeige2 = felder.New 	(ax, ay+ 40, 10, 'l', "Schülerbewertung:")
	anzeige3 = felder.New 	(ax, ay+ 80, 30, 'l', "Praktikum:")
	anzeige4 = felder.New 	(ax, ay+120, 30, 'l', "Firma:")
	anzeige5 = felder.New 	(ax, ay+160, 30, 'l', "Betreuer:")
	// Fusszeile
	gfx.SetzeFont (felder.FONTPATH_DESC, 12)
	gfx.SchreibeFont        (gfx.Grafikspalten ()-16*6, gfx.Grafikzeilen ()-14, "ESC für Beenden!")
	
for taste!=felder.ESCAPE {
	query = fmt.Sprintf (`
		SELECT DISTINCT   
			taetigkeitsbereich.schulfachnaehe, 
			schueler.sbewertung, 
			praktikum.pname, 
			firma.fname, 
			angebot.bname
		FROM    
			public.taetigkeitsbereich, 
			public.schueler, 
			public.praktikum, 
			public.einsatzbereich, 
			public.angebot, 
			public.firma
		WHERE 
			schueler.pnr = praktikum.pnr AND
			praktikum.pnr = angebot.pnr AND
			einsatzbereich.tnr = taetigkeitsbereich.tnr AND
			angebot.pnr = einsatzbereich.pnr AND
			angebot.fnr = firma.fnr` )
	eingabe = suche1.Edit ()
	if !suche1.IstLeer() {
		query1 = fmt.Sprintf (` AND 
			taetigkeitsbereich.schulfachnaehe = '%s' `, eingabe)
		query = query+query1
	}
	eingabe = suche2.Edit ()
	if !suche2.IstLeer() {
		query1 = fmt.Sprintf (` AND 
			firma.fname = '%s' `, eingabe)
		query = query+query1
	}
	eingabe = suche3.Edit ()	
	if !suche3.IstLeer() {
		query1 = fmt.Sprintf (` AND 
			schueler.sbewertung = '%s' `, eingabe)
		query = query+query1
	}
	query1 = fmt.Sprintf (` ;`)
	query = query+query1
	
	
							 
fmt.Printf ("%s\n\n", query)//;fmt.Println (eingabe);fmt.Println (taste)
	rs = conn.Anfrage (query)
//gfx.TastaturLesen1 (); gfx.TastaturLesen1 ()
	for rs.GibtTupel () && taste!=felder.ESCAPE {
		rs.LeseTupel (&tupel.schulfachnaehe, &tupel.sbewertung, &tupel.pname, &tupel.fname, &tupel.lname)
		anzeige1.Schreibe (tupel.schulfachnaehe)
		anzeige2.Schreibe (tupel.sbewertung)
		anzeige3.Schreibe (tupel.pname)
		anzeige4.Schreibe (tupel.fname)
		anzeige5.Schreibe (tupel.lname)
		
		
		gfx.TastaturLesen1 (); taste,_,_ = gfx.TastaturLesen1 ()
	}
	
	suche1.Leere()
	suche2.Leere()
	suche3.Leere()
	anzeige1.Leere()
	anzeige2.Leere()
	anzeige3.Leere()
	anzeige4.Leere()
	anzeige5.Leere()
	
}	
	rs.Schliessen ()
  
}
