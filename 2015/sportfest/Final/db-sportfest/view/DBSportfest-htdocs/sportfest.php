<!DOCTYPE html>
<html lang="de">
<form action="index.php" method="post">
<link rel="stylesheet" type ="text/css" href="style.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Wettkämpfe der Schüler </title>
  </head>
  <body>
  <?php 
    try {
      $con  = new PDO ('pgsql:dbname=lewein', 'lewein', '');

		$name = $_POST['name'];
		$vorname = $_POST['vorname'];
		

        switch (TRUE) {
          case ($name != "" AND $vorname != ""):
            $bedingung = "schname = :name AND schvorname = :vorname";
            $array = array( 'name' => $name ,
                            'vorname'  => $vorname );
            break;
          case ($name == "" AND $vorname != ""):
            $bedingung = "schvorname = :vorname";
            $array = array( 'vorname'  => $vorname );
            break;
          case ($name != "" AND $vorname == ""):
            $bedingung = "schname = :name";
            $array = array( 'name'  => $name );
            break;
          default:
            $bedingung = "TRUE";
            break;
       }

      $query = $con->prepare(
        "SELECT SchName,SchVorname,KlName,
				WettName,WettKlasse,Geschlecht,Termin,AnlagenName
         FROM   schueler NATURAL JOIN nimmtteil 
				NATURAL JOIN Wettkampf
				NATURAL JOIN findetstatt
				NATURAL JOIN Sportanlage
         WHERE   $bedingung
         ORDER BY SchID");
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
      <td colspan="8">
        Wettkämpfe der Schüler
      </td>
    </tr>
  </head>
  <tbody>
    <tr>
      <th> Name </th>
      <th> Vorname   </th>
      <th> Klasse   </th>
      <th> Wettkampf   </th>
      <th> Wettklasse </th>
      <th> Geschl  </th>
      <th> Termin</th>
       <th> Anlage</th>

    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="8">
        <input type="submit" value="Zurück" />
      </td>
    </tr>
  </tfoot>
  <tbody>
  <?php
    foreach ($query as $zeile) {
      echo "<tr>" .
             "<td>" . $zeile['schname'] . "</td>" .
             "<td>" . $zeile['schvorname']   . "</td>" .
             "<td>" . $zeile['klname']   . "</td>" .
             "<td>" . $zeile['wettname']   . "</td>" .
             "<td>" . $zeile['wettklasse'] . "</td>" .
             "<td>" . $zeile['geschlecht']  . "</td>" .
             "<td>" . $zeile['termin']  . "</td>" .
             "<td>" . $zeile['anlagenname']  . "</td>" .
           "</tr>";
    }
    $con = null;
  ?>
  </tbody>
  </table>
  </body>
</html>
