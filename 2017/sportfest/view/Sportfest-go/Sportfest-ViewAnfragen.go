//View für UDBP "Sportfest"
// Mirko Hertel

package main 

import (
  "SQL"
  "fmt"
  "time"
  "gfx"
   )

// für die Konstruktion der Abfragen
type abfragen struct {
	snr 			int						//Schülernummer
	sname 			string					//Schülername
	klasse			string					//Klassezugehörigkeit Schüler
	geburtsdatum	time.Time				//Geburtsdatum Schüler
	geschlecht		string					//Geschlecht Schüler
	schwimmnachweis bool					//Schwimmnachweis Schüler true, wenn vorhanden
	}

// Hauptfunktion 
func main () {
	var eingabeAuswahl uint					//Auswahl für Anfrage (1,2)
	var eingabeGeschlecht string			//Geschlecht Schüler (m,w)
	var eingabeSchwimmnachweis string		//Schwimmnachweis (j,n)
	gfx.Fenster(500,500)					//Öffnen gfx-Fenster
	gfx.SpieleSound ("musik1.wav")			//Abspielen Sound
	gfx.LadeBild(50,50 ,"sportfest.bmp")  //Anzeigen Bild Sportfest
	gfx.FensterAus()						//Schliessen gfx-Fenster
	
		
	println ("             Datenbank Sportfest\n")
	println (" Liebe Lernende,\n es stehen Euch derzeit 2 Anfragen an die Sportfest-Datenbank zur Auswahl.\n")
	println (" Anfrage 1:\n Abfrage teilnehmender Schüler und Schülerinnen nach Geschlecht\n")
	println (" Anfrage 2:\n Abfrage teilnehmender Schüler und Schülerinnen nach Schwimmnachweis\n")
	println (" Bitte formuliert schriftlich vorab Eure SQL-Anfrage entsprechend der gewählten  Abfrage\n")
	println (" Wählt nun durch Eingabe von 1 oder 2 Eure Abfrage aus.\n und schließt Eure Auswahl jeweils mit ENTER ab.\n")
	fmt.Print("Bitte gebt nun Eure Auswahl ein: ")
	fmt.Scanln (&eingabeAuswahl)					// Eingabe Auswahl Anfrage (1,2)
	
	switch eingabeAuswahl {							
	
	case 1: fmt.Println ("Ihr habt die Anfrage", eingabeAuswahl, " gewählt.\n")  // wenn Anfrage 1 ausgewählt

	var (																		// Beschreibung und Verbindungsaufbau DB
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   abfragen
    query   string
             )

	conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest") // Anmelden an DB mit Name Passwort
	defer conn.Beenden ()
  
	fmt.Print ("Eingabe Geschlecht (m oder w): ")
	fmt.Scanln (&eingabeGeschlecht)												 // Eingabe Geschlecht (m.w)
		
	if eingabeGeschlecht== "w"{

	query = fmt.Sprintf (`SELECT  * FROM    schueler WHERE  geschlecht='w';`)
  
  } else { if eingabeGeschlecht == "m" {
  
	query = fmt.Sprintf (`SELECT  * FROM    schueler WHERE  geschlecht='m';`)
	
 } 	else { println ("Leider Eingabefehler !") } }

	println ("\nEure Anfrage als SQL-Anfrage lautet :\n")
	println ("\n__________________________________________________________________\n")
	fmt.Printf ("%s\n", query)																		//Anzeige SQL-Anfrage 
	println ("\n__________________________________________________________________\n")
	rs = conn.Anfrage (query)
  
	println ("\nDas Ergebnis Eurer Anfrage:\n")
	println ("     SNR   SName    Klasse Geburtsdatum	Geschlecht Schwimmnachweis\n")
	
  for rs.GibtTupel () {																	//Ergebnisübermittlung von DB
    rs.LeseTupel (&tupel.snr,&tupel.sname,&tupel.klasse,&tupel.geburtsdatum,&tupel.geschlecht,&tupel.schwimmnachweis)
    
    fmt.Printf ("%10d %-10s %-5s %-15s %-5s  %-5t\n", tupel.snr,tupel.sname,tupel.klasse,SQL.Datum(tupel.geburtsdatum),tupel.geschlecht,tupel.schwimmnachweis)
    
    }
    println ("\n Vergleicht das Ergebnis mit Eurer formulierten SQL-Anfrage\n")			
  rs.Schliessen ()


	case 2: fmt.Println ("Ihr habt die Abfrage", eingabeAuswahl, " gewählt.")			//wenn Anfrage 2 ausgewählt
	
	var (																				//Beschreibung und Verbindungsaufbau DB
    conn    SQL.Verbindung
    rs      SQL.Ergebnismenge
    tupel   abfragen
    query   string
             )

  conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
  defer conn.Beenden ()
  
	fmt.Print ("Eingabe Schwimmnachweis (j oder n): ")									//Eingabe Schwimmnachweis (j,n)
	fmt.Scanln (&eingabeSchwimmnachweis)
		
  if eingabeSchwimmnachweis == "j" {

  query = fmt.Sprintf (`SELECT  * FROM    schueler WHERE  schwimmnachweis = 'true' ;`)
  
  } else { if eingabeSchwimmnachweis == "n" {
  
  query = fmt.Sprintf (`SELECT  * FROM    schueler WHERE  schwimmnachweis = 'false' ;`)
 } else { println ("Leider Eingabefehler!") } }

  println ("\nEure Anfrage als SQL-Anfrage lautet :\n")
  println ("\n__________________________________________________________________\n")
  fmt.Printf ("%s\n", query)																	//Anzeige SQL-Anfrage 
  println ("\n__________________________________________________________________\n")
  
  rs = conn.Anfrage (query)
  
  println ("\nDas Ergebnis Eurer Anfrage ist:\n")
  println ("     SNR   SName    Klasse Geburtsdatum	Geschlecht Schwimmnachweis\n", )
  for rs.GibtTupel () {																			//Ergebnisübermittlung von DB
    rs.LeseTupel (&tupel.snr,&tupel.sname,&tupel.klasse,&tupel.geburtsdatum,&tupel.geschlecht,&tupel.schwimmnachweis)
    
    fmt.Printf ("%10d %-10s %-5s %-15s %-5s  %-5t\n", tupel.snr,tupel.sname,tupel.klasse,SQL.Datum(tupel.geburtsdatum),tupel.geschlecht,tupel.schwimmnachweis)
    
    }
    println ("\n Vergleicht das Ergebnis mit Eurer formulierten SQL-Anfrage\n")	
  rs.Schliessen ()

	default: fmt.Println ("Hinweis:Fehlerhafte Eingabe")
} 
}
