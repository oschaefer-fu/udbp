<!DOCTYPE html>
<html lang="de">
<form action="index1.php" method="post">
<link rel="stylesheet" type ="text/css" href="style.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Kategorien und ihre Preise </title>
  </head>
  <body>
  <?php 
    try {
      $con  = new PDO ('pgsql:dbname=lewein', 'lewein', '');

      if (isset($_POST['sent'])) {
      //  Hier wird die Bedingung zusammengebastelt
        switch (TRUE) {
			// Hier wird die Eingabe aus der Indexdatei überprüft (leer, nichtleer)
          case ($_POST['kname'] != ""):
            // Die Bedingung aus der SELECT-Anweisung verknüpt mit der 
            // Eingabe aus der Indexdatei
            $bedingung = "KName = :kname";
            // Der 'name' aus der Indexdatei wird hier mit dem 'name'n 
            // aus der Auto-Datei gleichgesetzt
            $array = array( 'kname'  => $_POST['kname'] );
            break;
          default:
            $bedingung = "TRUE";
            break;
        }
      } else {
        $bedingung = "TRUE";
      }
      //  Anfrage vorbereiten
      $query = $con->prepare(
        "SELECT  distinct KName, KTagespreis
         FROM    kategorie
         WHERE   $bedingung
         ORDER BY KTagespreis");
      //  Anfragestring mit Werten belegen und Anfrage ausführen
      $query->execute($array);
    } catch (PDOException $e) {
      echo "Fehler: " . htmlspecialchars ($e->getMessage());
      die();
    }
  ?>
  <table>
  <thead>
    <tr>
      <td colspan="7">
        Preis der gesuchten Kategorie
      </td>
    </tr>
  </head>
  <tbody>
    <tr>
      <th> Kategorie </th>
      <th> Preis   </th>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="7">
        <input type="submit" value="Zurück" />
      </td>
    </tr>
  </tfoot>
  <tbody>
  <?php
    foreach ($query as $zeile) {
      echo "<tr>" .
      //hier werden die Spalteneinträge aus der SELECT-Anweisung eingelesen (kleinschreiben!)
             "<td>" . $zeile['kname'] . "</td>" .
             "<td>" . $zeile['ktagespreis']   . "</td>" .
           "</tr>";
    }
    $con = null;
  ?>
  </tbody>
  </table>
  </body>
</html>
