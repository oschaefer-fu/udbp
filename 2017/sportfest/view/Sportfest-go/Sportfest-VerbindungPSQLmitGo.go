package main
import "SQL"
func main() {
var conn SQL.Verbindung
//conn = SQL.PgSQL  ("pi:raspberry@tcp(192.168.2.35/sportfest=")
//conn = SQL.PgSQL  ("user=pi password= ip host=192.168.2.35 dbname=sportfest password=")
conn = SQL.PgSQL  ("user=pi password=ip host=192.168.2.35 dbname=sportfest")
defer conn.Beenden ()
if conn == nil {
println ("Verbindung fehlgeschlagen")
} else {
println ("Verbindung erfolgreich")
}
}
//Allgemein:
//username:password@protocol(address)/dbname?param=value
//Lokale Verbindung, Standardport 3306:
//username:password@/dbname
//Ferner Host:
//username:password@tcp(host:port)/dbname
//Minimal:
//dbname

