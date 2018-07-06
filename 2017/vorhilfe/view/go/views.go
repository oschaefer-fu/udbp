// Autor: Christoph Chi
// Datum: Mo 23. Jan 12:28:40 CET 2017
// Zweck: Erstellen einer Tabelle nach Anfrage durch einen Webserver
// und Einfügen von Daten mit GO

package main

import (
	"SQL"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"strings"
	t "time"
)

//Hilfsfunktion zur Verzögerung. Die Ausführung des Programms stoppt für s Millisekunden.
func Wait(s uint) {
	t.Sleep(t.Millisecond * t.Duration(s))
}

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<html><title>Eingabe Vorhilfe</title><body>\n")
	fmt.Fprintf(w, `<h1>Eingabe-Formular für die Vorhilfe Datenbank</h1>
<form action='/eingabe' method='post' name = 'anfragen'>
<input type = "text" width = "80" name = 'anfrage' value ="Anfrage eingeben"> 
<input type='submit' value="uebergeben"> 
</form>`)
	fmt.Fprintf(w, `
<form action='/view/cafeteria' method='get' name = 'updatecafe'>
<input type='submit' name='viewuc' value="cafeteria"> 
</form>`)
	fmt.Fprintf(w, `
<form action='/view/lehrer' method='get' name = 'updatel'>
<input type='submit' name='viewl' value="lehrer">
</form>`)
	fmt.Fprintf(w, `
<form action='/view/schueler' method='get' name = 'schuelers'>
<input type='submit' name='viewss' value="schuelersucht">
</form>`)

	//<input type='submit' name='view' value="schueler bietet">

	
	io.WriteString(w, "Eingabe verarbeitet!</body></html>")
}

//Die Funktion wertet den übergebenen Formularstring als Anfrage an die psql-Datenbank aus.
//Ist die Eingabe fehlerhaft wird eine Seite mit der fehlerhaften Anfrage und einem zurück-Button angezeigt
//Die Tupel werden als HTML,TeX und csv  formatiert ausgegeben.
func eingabe(w http.ResponseWriter, r *http.Request) {
hello(w,r)
	var ein, anzParameter int
	aus := []string{""} //Slice für die Aufnahme der Parameter aus dem Formular

	r.ParseForm() // Argumente allgemein parsen
	//Debug
	fmt.Println(r.Form)
	//Das Slice für die Parameter initialisieren
	for i := range r.Form {
		anzParameter++
		aus = append(aus, i)
	}



	for k, v := range r.Form {
		fmt.Println("key:", k)
		fmt.Println("val:", strings.Join(v, ""), v)
		aus[ein] = strings.Join(v, "")
		ein++
		fmt.Println(ein, strings.Join(v, ""))

	}
	//hier steht der anfragestring
	anfrage := aus[0]
	//KOntakt zur Datenbank
	conn := SQL.PgSQL("user=lewein dbname=vorhilfe") //im localhost
	//Netzdb
	//conn = SQL.PgSQL ("host= 192.168.2.110 user=lewein password =niewel dbname=lewein")
	defer conn.Beenden()

	fmt.Println("Verbindungstest erfolgreich")
	fmt.Println("tabelle angeben")

	//Anfrage aufbereiten
	s := fmt.Sprintf(`%s`, anfrage)
	fmt.Println(w)
	fmt.Println(s)
	//
	// --------------------Anfrage stellen------------------------------
	//
	rs := conn.Anfrage(s)

	if rs == nil {
		fmt.Println("Fehler in der Anfrage", w)
		fmt.Fprintf(w, "<h1>Fehler in der Anfrage</h1>")
		fmt.Fprintf(w, "<h2>%s</h2>", s)
		
		fmt.Fprintf(w, `
<form action='/hello' method='post' name = 'anfragen'>
<input type='submit' value="zurück zu /hello"> 
</form>
</body></html>`)
		return //die Funktion muss hier abgebrochen werden, sonst läuft die psql-Anfrage ins Leere.
	}
	//Tabellenstil
	fmt.Fprintf(w, "<html><title>Anfrage</title><body><h1>Anfrage</h1>")

	fmt.Fprintf(w, `
<style type="text/css">
  table{
	align:left;
    border-collapse: collapse;
    border: 3px solid black;
  }
  table th{
	border: 4px solid red;
  }
  table td{
    border: 3px solid green;
  }
</style>`)

	anzAttribute := rs.AnzahlAttribute()
	fmt.Printf("Insgesamt gibt es bei dieser Abfrage %d Attribute\n", anzAttribute)
	fmt.Fprintf(w, "<h3>Insgesamt gibt es bei dieser Abfrage %d Attribute<h3>\n", (anzAttribute))
	fmt.Fprintf(w, "<h2>Tabelle aus Anfrage:<br> <bf>%s</bf><h3>\n", s)

	//Alle Attribute Ausgeben
	//Als csv-Datei
	cs, _ := os.Create("./tex/" + s + ".csv")
	defer cs.Close()
	//Als HTML
	fmt.Fprintf(w, "<table>\n<tr>\n")

	fmt.Fprintf(cs, "%s\n", anfrage)

	//Attribute TeX, csv
	for i, att := range rs.Attribute() {
		if i == 0 {
			fmt.Fprintf(cs, att)
		} else {
		fmt.Fprintf(cs, ";%s", att)
		}
	}
	fmt.Fprintf(cs, "\n")

	//Attribute HTML
	for _, att := range rs.Attribute() {
		fmt.Fprintf(w, "<th>%s</th>", att)
	}

	//Ein leeres slice mit genau anzAttribut Fächern
	tup := []string{}
	for i := 0; i < anzAttribute; i++ {
		tup = append(tup, " ")
	}

	for rs.GibtTupel() {
		switch anzAttribute {
		case 1:
			rs.LeseTupel(&tup[0])
		case 2:
			rs.LeseTupel(&tup[0], &tup[1])
		case 3:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2])
		case 4:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3])
		case 5:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4])
		case 6:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5])
		case 7:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5], &tup[6])
		case 8:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5], &tup[6], &tup[7])
		case 9:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5], &tup[6], &tup[7], &tup[8])
		case 10:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5], &tup[6], &tup[7], &tup[8], &tup[9])
		case 11:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5], &tup[6], &tup[7], &tup[8], &tup[9], &tup[10])
		case 12:
			rs.LeseTupel(&tup[0], &tup[1], &tup[2], &tup[3], &tup[4], &tup[5], &tup[6], &tup[7], &tup[8], &tup[9], &tup[10], &tup[11])
		default:

		}
			fmt.Fprintf(w, "</tr>\n<tr>")
		for _, att := range tup {
			fmt.Fprintf(w, "<td>%s\t</td>", att)
		}
		fmt.Fprintf(w, "</tr>\n")

		// CSV-File
		//alle Tupel-Attribute
		for i, ta := range tup {
			if i == 0 {
				fmt.Fprintf(cs, ta)
			} else {
				fmt.Fprintf(cs, ";%s", ta)
			}
		}
		fmt.Fprintf(cs, "\n")
	}

	fmt.Fprintf(w, "</tr>\n</table>\n")
	//--------------------------------------------------

	//Ausgabe des ER-Modells-------------
	sf := fmt.Sprintf("./er-modell.svg")
	dat, _ := ioutil.ReadFile(sf)
	io.WriteString(w, string(dat))
	//---------------------------------

	fmt.Println("Ausgabe der Datei nach Anfrage von ", r.URL.String(), string(r.URL.Path))
	for _, s := range aus {
		fmt.Fprintf(w, "Werte: %s \n", s)
	}
	fmt.Printf("Es wurden %d Parameter übergeben", anzParameter)
	io.WriteString(w, "Eingabe verarbeitet!</body></html>")
}
func viewS(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<html><title>Eingabe Vorhilfe</title><body>\n")
	fmt.Fprintf(w, `<h1>Eingabe-Formular für die Vorhilfe Datenbank</h1>
<form action='/eingabe' method='get' name = 'a'>
<input type = "hidden" width = "80" name = 'a' value ="select raum.rnr,geraete from raum natural join hat natural join ausstattung where geraete ="> 
<label> Geraete
<select name='a' size="10">
<option value="'Beamer'">Beamer</option>
<option value="'Smartboard'">Smartboard</option>
<option value="'Whiteboard'">Whiteboard</option>
<option value="'Waschbecken'">Waschbecken</option>
<option value="'Sitzecke'">Sitzecke</option>
<option value="'Fernseher'">Fernseher</option>
<option value="'Computer'">Computer</option>
<option value="'OH-Projektor'">OH-Projektor</option>
</select>
`)

	//<input type='submit' name='view' value="schueler bietet">
//<form action='/schuelerb' method='get' name = 'lehrer'>
	fmt.Fprintf(w, `
<input type='checkbox' name='a' value=" or geraete = 'Beamer'">Beamer<br>
<input type='checkbox' name='a' value=" or geraete = 'Fernseher'">Fernseher<br>
<input type='checkbox' name='a' value=" or geraete = 'Computer'">Computer<br>
<input type='checkbox' name='a' value=" or geraete = 'Smartboard'">Smartboard<br>
<input type='checkbox' name='a' value=" or geraete ='Waschbecken'">Waschbecken<br>
<input type='checkbox' name='a' value=" or geraete = 'Whiteboard'">Whiteboard<br>
<input type='checkbox' name='a' value="or geraete = 'OH-Projektor'">OHP<br>
<input type='checkbox' name='a' value=" or geraete = 'Tafel'">Tafel<br>
<input type='hidden' name='a' value=";">
<input type='submit' value="Anfrage abschicken"> 
</label>
</form>`)
	io.WriteString(w, "Eingabe verarbeitet!</body></html>")
}
func viewL(w http.ResponseWriter, r *http.Request) {
fmt.Fprintf(w, "<html><title>Gutschrift für Schüler</title><body>\n")
	fmt.Fprintf(w, `<h1>Eingabe-Formular für die Vorhilfe Datenbank</h1>
<form action='/eingabe' method='get' name = 'a'>
<input type = "hidden" width = "80" name = 'a' value ="update konto set kontostand = kontostand +">
<fieldset>
<input type = "radio" name = 'a' value ="1" checked>Teilnahme<br>
<input type = "radio" name = 'a' value ="4">Leitung<br>
</fieldset>
<input type = "hidden" width = "80" name = 'a' value =" where konr ="> 
<input type='text' name='a' value="Kontonr">Kontonr des Schülers<br>
<input type='submit' value="Anfrage abschicken"> 
`)
}

func viewC(w http.ResponseWriter, r *http.Request) {
	//from kschueler as k where  konto.konr= k.konr and
	fmt.Fprintf(w, "<html><title>Verbuchung durch Cafeteria</title><body>\n")
	fmt.Fprintf(w, `<h1>Eingabe-Formular für die Verbuchung durch die Cafeteria</h1>
Das Konto des Schülers wird mit einem Punkt belastet  
<form action='/eingabe' method='get' name = 'a'>
<input type = "hidden" width = "80" name = 'a' value ="update konto set kontostand = kontostand - 1 where konr ="> 
<input type='text' name='a' value="Kontonr">Kontonr des Schülers<br>
<input type='submit' value="Anfrage abschicken"> 
`)
}

func fehler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1> Leider ist ein Fehler in der Anfrage aufgetreten</h1>")
	http.Redirect(w, r, "/hello", 301) //http.StatusSeeOther)
}


//------------------------------------------------
func main() {
	var (
		//	conn          SQL.Verbindung
		//	n                 int64
		//, dateiname, egabe, s string
		port string
	)
	
	port = ":8080"
	http.HandleFunc("/view/schueler", viewS)
	http.HandleFunc("/view/lehrer", viewL)
	http.HandleFunc("/view/cafeteria", viewC)
	http.HandleFunc("/fehler", fehler)
	http.HandleFunc("/eingabe", eingabe)
	http.HandleFunc("/", hello)

	fmt.Println("Starte http-Server auf Port ", port)
	fmt.Println("Warten auf Eingabe ", port)

	go http.ListenAndServe(port, nil)
	//drehe Däumchen
	for {
		Wait(1000)
	}
}

/*
	//Verbindung mit Server

	//  host     = Name/IP-Adresse des Datenbankservers
	//             (Standard: localhost)
	//  port     = Portnummer der DB-Verbindung
	//             (Standard: 5432)
	//  dbname   = Name der Datenbank
	//             (Standard: wie Benutzer)
	//  user     = Benutzername
	//  password = Passwort der Datenbankverbindung
	//             (Standard: leer)
	//  timeout  = Timeout in Sekunden, 0 bedeutet deaktiviert
	//             (Standard: 0)

	conn = SQL.PgSQL("user=lewein dbname=lewein") //im localhost
	//conn = SQL.PgSQL ("host= 192.168.2.110 user=lewein password =niewel dbname=lewein")

	defer conn.Beenden()
	fmt.Println("Verbindungstest erfolgreich")
	fmt.Println("tabelle angeben")
	fmt.Scanln(&dateiname)
	//erzeuge Tabelle
	//erst den Tabellenkopf
	// Initialisiere neuen csv-Reader aus der eingelesenen Datei

	fmt.Println(n, "Zeilen eingefügt")

	//EIngabe mit Scanner, weil auch LIKE möglich sein soll (Leerzeichen)
	scanner := bu.NewReader(os.Stdin)
	egabe, _ = scanner.ReadString('\n')
	egabe = strings.TrimSuffix(egabe, "\n")
	fmt.Println("Geben Sie eine Suchbedingung ein:")
	fmt.Println(" SELECT * FROM (Tabelle) WHERE ...")
	s = egabe
	for s != "" { //EINGABE von Return ohne Wert beendet die Abfrage
		//hier Abfrage, ob native SQL if s[0] == "sql" { s = s - s[0] } else

		//die gesamte Datenbank wird ausgelesen
		s = fmt.Sprintf(`SELECT * FROM %s ;`, dateiname)
		fmt.Println()
		fmt.Println(s)
		rs := conn.Anfrage(s)
		fmt.Println("Gesamte Datenbank auslesen")
		var t, b, c, d string
		for rs.GibtTupel() {
			rs.LeseTupel(&t, &b, &c, &d)
			fmt.Println()
			fmt.Print(rs.Attribute()[0], "=", t, "  ", rs.Attribute()[1], "=", b, "  ", rs.Attribute()[2], "=", c, "  ", rs.Attribute()[3], "=", d) //, rs.Attribute()[2], "=")
			//myui_ntprint(name.([]uint8))
		}
		egabe, _ = scanner.ReadString('\n')
		egabe = strings.TrimSuffix(egabe, "\n")
		s = egabe
	}
}
*/
