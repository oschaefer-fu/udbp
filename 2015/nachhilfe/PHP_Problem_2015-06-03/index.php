<!DOCTYPE html>

<html lang="de">
<form action="./index.php" method="post">

  <body>
	<p>Name:  <input type="text" name="name" /> <input type="submit" value="absenden" /> </p>
	
  <?php 
    
	$name = $_POST['name'];
		
	echo "<br><br>";
           
    try {
      
      $con = new PDO ("pgsql:dbname=lewein", "lewein", "niewel");
      $erg = $con->prepare ("SELECT name, preis					
							FROM stunde NATURAL JOIN schueler NATURAL JOIN typ
							WHERE schueler.name = :name"); 		//ohne SUM(preis) und GROUP BY werden wenigstens die Zeilen angezeigt.
							//GROUP BY schueler.name"); 		
	  $erg->execute (
		array ($name)
	  );
	
      echo "<table  border = '1' width='50%'> 
        <colgroup> <col width='3*'> <col width='2*'> </colgroup>
		<tr> <th>Name</th> <th>Kosten</th> </tr>";
   
      foreach ($erg as $row) {
     
      echo "<tr>" .
			   "<td>" . $row['name']   . "</td>" .
			   "<td>" . $row['preis']  . "</td>" .
		   "</tr>"; 
		 }
		 
      echo "</table>";
	  echo "<br/>";
      $con = null;
	  
    } catch (PDOException $e) {
      echo "Fehler: " . htmlspecialchars ($e->getMessage ());
      exit ();
    }
  ?>
  </body>
</html>          	

