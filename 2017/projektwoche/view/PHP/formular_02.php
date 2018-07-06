<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

        <head>
                <title>DB-Projektwoche</title>
                <meta http-equiv="content-type" content="text/html;charset=utf-8" />
                <meta name="generator" content="Geany 1.29" />
        </head>

        <body>
                <h1>DB-Projektwoche</h1>
                <p>Zu einem/r beliebigen Ort alle Lehrer(k&uuml;rzel) ausgeben, die dort im Laufe der Projektwoche mindestens einmal anwesend sind.</p>

                <form name="insert" action="formular_02.php" method="POST" > 
                        <label>Ort wählen:
                                <select name="ortid" size="1">
                                        <?php
                                                require './inc/db.php';
                                                $query = "SELECT * FROM ort";
                                                $result = pg_query($query) or die('Abfrage fehlgeschlagen: ' . pg_last_error());
                                                while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
                                                        if (isset($_POST["ortid"]) && $_POST["ortid"] == $line['ortid']) {
                                                                echo "\t<option value=\"".$line['ortid']."\" selected=\"selected\">".$line['name']."</option>\n";
                                                        } else {
                                                                echo "\t<option value=\"".$line['ortid']."\">".$line['name']."</option>\n";
                                                        }
                                                }
                                                // Speicher freigeben
                                                pg_free_result($result);

                                        ?>
                                </select>
                        </label>
                        <input type="submit" value="abfragen">
                </form>

                <?php
                        if (isset($_POST["ortid"])) {
                                $query = "SELECT Kuerzel FROM Lehrer NATURAL JOIN AUFSICHT INNER JOIN ORT ON Aufsicht.Ortid = Ort.Ortid WHERE Ort.ortid = ".$_POST["ortid"]." UNION SELECT Kuerzel FROM Lehrer NATURAL JOIN Kurs INNER JOIN Termin ON Kurs.Kursid = Termin.Kursid INNER JOIN Ort ON Termin.Ortid = Ort.Ortid WHERE Ort.ortid = ".$_POST["ortid"];

                                $result = pg_query($query) or die('Abfrage fehlgeschlagen: ' . pg_last_error());
                                
                                echo "<h2>Ergebnis der SQL-Abfrage: &quot;".htmlspecialchars($query)."&quot;</h2>";
                                
                                // Ergebnisse in HTML ausgeben
                                echo "<table style=\"border: 0.1em solid black;\">\n";
                                
                                $first_row = true;
                                $first_row_count = 0;

                                while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
                                        

                                        // Tabellenheader
                                        if ($first_row) {
                                                $first_row = false;
                                                
                                                echo "\t<thead>\n";

                                                echo "\t\t<tr style=\"border: 0.1em solid black;\">\n";
                                                foreach ($line as $col_value => $row_value) {
                                                        echo "\t\t\t<th style=\"border: 0.1em solid black;\">".$col_value." [<span style=\"font-style: italic;\">".pg_field_table($result, $first_row_count)."</span>]</th>\n";
                                                        $first_row_count++;

                                                }
                                                echo "\t\t</tr>\n";
                                                echo "\t</thead>\n";

                                        }
                                        echo "\t<tbody>\n";
                                        echo "\t\t<tr style=\"border: 0.1em solid black;\">\n";
                                        foreach ($line as $row_value) {
                                                echo "\t\t\t<td style=\"border: 0.1em solid black;\">".$row_value."</td>\n";
                                        }
                                        echo "\t\t</tr>\n";
                                        echo "\t</tbody>\n";
                                }
                                echo "</table>\n";

                                // Speicher freigeben
                                pg_free_result($result);
                        }

                        // Verbindung schließen
                        pg_close($dbconn);
                ?>
        </body>
</html>
