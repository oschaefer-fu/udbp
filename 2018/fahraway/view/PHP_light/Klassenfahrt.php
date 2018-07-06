/* Aiko Czetö */
<!DOCTYPE html>
<html lang="de">
  <body>
  <?php 
    try {
      $con = new PDO ('pgsql:host=localhost;dbname=fahraway2', 'student', 'lilipass'); /* Anbindung an die PostgreSQL Datenbank */
      
      /* Variablendefinition $erg <= Anfragen (SQL-Queries) */
      
      $erg = $con->query(	"SELECT	fahrt.von, 
									fahrt.bis, 
									unterkunft.u_name, 
									ort.o_name, 
									ort.entfng, 
									unterkunft.kosten, 
									fahrt.kl_ku,
									aktivitaet.bezng, 
									aktivitaet.art, 
									anbieter.an_name,  
									aktivitaet.akpreis 
		
							 FROM 
									unterkunft 
							 LEFT OUTER JOIN 
									ort 
										ON unterkunft.u_ort = ort.o_id
							 LEFT OUTER JOIN 
									fahrt 
										ON fahrt.f_unterkunft = unterkunft.u_id
							 NATURAL JOIN 
									wirdangeboten 
							 NATURAL JOIN 
									aktivitaet
							 LEFT OUTER JOIN 
									anbieter 
										ON aktivitaet.anbietr = anbieter.an_id ");

/* Erschaffung einer HTML-Tabelle: Rahmen + Hintergrundfarbe */	      
      echo "<table border=2 bgcolor=00FF00>	
      

/* Tabellenkopf: Festlegung der Spaltenbezeichnungen */
<tr>

					<th>Abfahrt</th>
					<th>Rückkehr</th>
					<th>Unterkunft</th>
					<th>Ort</th>
					<th>Entfernung</th>
					<th>Kosten/Tag je SchülerIn</th>
					<th>Klasse/Kurs</th>
					<th>Aktivitäten</th>
					<th>Art der Aktivität</th>
					<th>Anbieter</th>
					<th>Preis pro SchülerIn</th>
</tr>";

/*Schreiben der Werte aus Variablen $erg => Tabellenzellen*/

      foreach ($erg as $row) {
        echo "<tr>" .
					"<td>" . $row['von']   			. "</td>" .
					"<td>" . $row['bis']   			. "</td>" .
					"<td>" . $row['u_name'] 		. "</td>" .
					"<td>" . $row['o_name'] 		. "</td>" .
					"<td>" . $row['entfng'] 		. "</td>" .
					"<td>" . $row['kosten'] 		. "</td>" .
					"<td>" . $row['kl_ku'] 			. "</td>" .
					"<td>" . $row['bezng'] 			. "</td>" .
					"<td>" . $row['art']		. "</td>" .
					"<td>" . $row['an_name'] 			. "</td>" .
					"<td>" . $row['akpreis'] 		. "</td>" .
					//"<td>" . $row['???'] 			. "</td>" .
					//"<td>" . $row['???'] 			. "</td>" .
					//"<td>" . $row['Gesamtpreis'] 	. "</td>" .
               "</tr>";
      }
      echo "</table>";
      $con = null;
    } catch (PDOException $e) {
      echo "Fehler: " . htmlspecialchars ($e->getMessage ());
    }
  ?>
  </body>
</html>
