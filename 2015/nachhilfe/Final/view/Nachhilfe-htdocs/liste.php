<!DOCTYPE html>
<html lang="de">
<form action="index.php" method="post">
<link rel="stylesheet" type ="text/css" href="nachhilfe.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Stunden- und Preisübersicht </title>
  </head>
  
  <body>
  
  <?php 
    try {
      
      $con = new PDO ("pgsql:dbname=lewein", "lewein", "niewel");
      
      $name = $_POST['name'];
	  $jahr = $_POST['jahr'];

      if (isset($_POST['sent'])) {
      
        switch (TRUE) {
          case (($jahr != 'alle') AND ($name != '')):
			$bedingung = "schueler.name = :name AND slot.schuljahr = :jahr";
			$array = array ('name' => $name, 'jahr' => $jahr);
			break;
		  case (($jahr == 'alle') AND ($name != '')):
		  	$bedingung = "schueler.name = :name";
		    $array = array ('name' => $name); 
		    break;
		  case (($jahr != 'alle') AND ($name == '')):
			$bedingung = "slot.schuljahr = :jahr";
			$array = array ('jahr' => $jahr); 
			break;
		  default:
			$bedingung = "TRUE";
			break;
		}	
	  } else {
        $bedingung = "TRUE";
      }
	  $erg1 = $con->prepare ("SELECT vorname, name, tag, kw, schuljahr, fname, typname, preis				
							FROM schueler NATURAL JOIN slot NATURAL JOIN stunde NATURAL JOIN typ NATURAL JOIN fach 
							WHERE $bedingung
							ORDER BY name, schuljahr,kw"); 
	  $erg1->execute($array);
	  
	  $erg = $con->prepare ("SELECT vorname, name, SUM(preis) AS summe					
							FROM stunde NATURAL JOIN schueler NATURAL JOIN typ NATURAL JOIN slot
							WHERE $bedingung
							GROUP BY schueler.name, schueler.vorname"); 		
	  $erg->execute ($array);
	  
    } catch (PDOException $e) {
      echo "Fehler: " . htmlspecialchars ($e->getMessage());
      die();
    }
  ?>
  
  <table>
  <thead>
    <tr>
      <td colspan="8">
        Stunden- und Preisübersicht
      </td>
    </tr>
  </head>
  
  <tbody>
    <tr>
      <th> Vorname </th>
      <th> Name   </th>
      <th> Tag   </th>
      <th> KW   </th>
      <th> Jahr   </th>
      <th> Fach   </th>
      <th> Typ  </th>
      <th> Preis   </th>
     </tr>
  </tbody>

  <?php
    foreach ($erg1 as $zeile) {
      echo "<tr>" .
             "<td>" . $zeile['vorname'] . "</td>" .
             "<td>" . $zeile['name']   . "</td>" .
             "<td>" . $zeile['tag']   . "</td>" .
             "<td>" . $zeile['kw']   . "</td>" .
             "<td>" . $zeile['schuljahr'] . "</td>" .
             "<td>" . $zeile['fname']  . "</td>" .
             "<td>" . $zeile['typname']    . "</td>" .
             "<td>" . $zeile['preis']    . "</td>" .
           "</tr>";
    }
    
   ?>

  </table>
  
  <br><br> 
   <table>
   <thead>
     <tr>
       <td colspan="3">
        Gesamtkosten
       </td>
     </tr>
   </head>
  
  <tbody>
    <tr>
      <th> Vorname </th>
      <th> Name   </th>
      <th> Preis   </th>
     </tr>
  </tbody>
  
  <tfoot>
    <tr>
      <td colspan="8">
        <input type="submit" value="Zurück" />
      </td>
    </tr>
  </tfoot>
  
  <?php
    foreach ($erg as $row) {
       echo "<tr>" .
			   "<td align= 'center'>" . $row['vorname']   . "</td>" .
			   "<td align= 'center'>" . $row['name']   . "</td>" .
			   "<td align= 'center'>" . $row['summe']  . "</td>" .
		   "</tr>"; 
	   }
   $con = null;
  ?>	 
    
  </table>

  
</html>
