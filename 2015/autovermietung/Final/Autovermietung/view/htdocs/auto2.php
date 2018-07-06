<!DOCTYPE html>
<html lang="de">
<form action="index2.php" method="post">
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
          case ($_POST['kname'] != "" AND $_POST['snr'] != ""):
            $bedingung = "SNr = :snr AND KName = :kname";
            $array = array( 'kname' => $_POST['kname'] ,
                            'snr'  => $_POST['snr'] );
            break;
        }
      } else {
        $bedingung = "TRUE";
      }
      //  Anfrage vorbereiten
      $query = $con->prepare(
        "SELECT  distinct KName, AModell
         FROM    auto
         WHERE   $bedingung");
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
        Modelle einer Kategorie in einer Station
      </td>
    </tr>
  </head>
  <tbody>
    <tr>
      <th> Kategorie </th>
      <th> Automodell </th>
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
             "<td>" . $zeile['amodell']   . "</td>" .
           "</tr>";
    }
    $con = null;
  ?>
  </tbody>
  </table>
  </body>
</html>
