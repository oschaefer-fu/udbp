<!DOCTYPE html>
<html lang="de">
<form action="index4.php" method="post">
<link rel="stylesheet" type ="text/css" href="style.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Verfügbare Kategorien an einer Station zu einem bestimmten Datum </title>
  </head>
  <body>
  <?php 
    try {
      $con  = new PDO ('pgsql:dbname=lewein', 'lewein', '');

      if (isset($_POST['sent'])) {
      //  Hier wird die Bedingung zusammengebastelt
        switch (TRUE) {
          case ($_POST['snr'] != ""):
            $bedingung = "SNr = :snr";
            $array = array( 'snr'  => $_POST['snr'] );
            break;
        }
      } else {
        $bedingung = "TRUE";
      }
      //  Anfrage vorbereiten
      $query = $con->prepare(
        "SELECT ZName, ZPauschale
		FROM Zubehoer
		WHERE $bedingung");
      //AND VBeginn <= '2015-05-10' AND VBeginn + VDauer >= '2015-05-10'
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
        Verfügbare Kategorien an einer Station zu einem bestimmten Datum
      </td>
    </tr>
  </head>
  <tbody>
    <tr>
      <th> Zubehör </th>
      <th> Pauschalpreis </th>
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
             "<td>" . $zeile['zname'] . "</td>" .
             "<td>" . $zeile['zpauschale'] . "</td>" .
           "</tr>";
    }
    $con = null;
  ?>
  </tbody>
  </table>
  </body>
</html>
