package main
import "SQL"


func main() {
var conn SQL.Verbindung
var n    int64
conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
n = conn.Ausfuehren ("SELECT wkstnr FROM wettkampfstaetten;")
println (n)
defer conn.Beenden ()
if conn == nil {
println ("Verbindung fehlgeschlagen")
} else {
println ("Verbindung erfolgreich")
}
}

