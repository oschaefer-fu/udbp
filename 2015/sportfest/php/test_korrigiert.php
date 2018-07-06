<!--  Autor:  Holger Huth / Oliver Schäfer
      Datum:  15.06.2015
      Zweck:  Datenbankpraktikum php-Anwendung
-->
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title> Sportfest </title>
</head>
<body>
   <h1> Test Abfrage von Julian aus Schüler </h1>
<?php 
    try {
    //  Öffnen der Datenbankverbindung
    $con  = new PDO ('pgsql:user=lewein, dbname=lewein', 'lewein', '');
    //  Abfrage
    //  1. Schritt: Vorbereiten der Anfrage
    $query = $con->prepare (
      "SELECT  *
       FROM    schueler
       WHERE   SchVorname = :name
      ");
    //  2. Schritt: Belegen der Werte, die durch :<Variablenname>
    //              gekennzeichnet sind.
    //  Hinweis:    array ist eine Funktion, die aus den Parametern
    //              ein Feld baut, das dem execute-Befehl übeergeben
    //              wird.
    $belegung = array('name' => 'Julian');
    //  3. Schritt: Ausführen der fertigen Anfrage
    $query->execute($belegung);
    
    //  4. Schritt: Ausgabe
    //  Hinweise:   - der '.'-Operator konkateniert Zeichenketten 
    //              - Wie in psql schön zu sehen ist, werden alle
    //                Attributnamen in Kleinbuchstaben notiert.
    //                Das muss in "$zeile['<Attributname>']"
    //                berücksichtigt werden, sonst liefert die Anfrage
    //                keine Ergebnisse.
    echo "<b> Ausgabe aller Anfrageergebnisse: </b> <br>"; 
    echo "<table>";
    foreach ($query as $zeile) {
      echo "<tr>" .
             "<td>" . $zeile['schvorname']  . "</td>" .
             "<td>" . $zeile['schnachname'] . "</td>" .
           "</tr>";
    }
    echo "</table>";
    //  Alternativ für einen schnellen Überblick über
    //  das Anfrageergebnis:
    echo "<b> Ausgabe aller Anfrageergebnisse (Draft-Modus): </b> <br>"; 
    $query->execute($belegung);
    foreach ($query as $zeile) {
      print_r ($zeile);
      echo "<br>";
    }
    $con = null;
  } catch (PDOException $err) {
    echo "Fehler: " . $err->getMessage();
  }
?>
</body>
</html>
