<!DOCTYPE html>
<html lang="de">
<form action="index3.php" method="post">
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
          case ($_POST['kdatum'] != "" AND $_POST['snr'] != ""):
            $bedingung = "SNr = :snr";
            $array = array( 'kdatum' => $_POST['kdatum'] ,
                            'snr'  => $_POST['snr'] );
            break;
        }
      } else {
        $bedingung = "TRUE";
      }
      //  Anfrage vorbereiten
      $query = $con->prepare(
        "SELECT KName
		FROM Vertrag
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
      <th> Kategorie </th>
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
             "<td>" . $zeile['kname'] . "</td>" .
           "</tr>";
    }
    $con = null;
  ?>
  </tbody>
  </table>
  </body>
</html>
