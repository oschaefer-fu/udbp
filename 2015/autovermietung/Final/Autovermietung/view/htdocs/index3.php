<!DOCTYPE html>
<html lang="de">
<form action="auto3.php" method="post">
<link rel="stylesheet" type ="text/css" href="style.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Willkommen in der virtuellen Autovermietung </title>
  </head>
  <body>
  <h1>Verfügbare Kategorien an einer Station zu einem bestimmten Datum</h1>
  <input type="hidden" name="sent" value="1" />
Datum in der Form: JJJJ-MM-TT<br><br>     
 Es gibt die Stationen:<br>
  1 (Berlin), 2 (Köln), 3 (München))<br><br>     
  <table>
    <tr>
     <td> Datum: </td>
      <td> <input type="text" name="kdatum" size="25" /> </td>
        </tr>
		<tr>
      <td> Stationsnummer: </td>
      <td> <input type="text" name="snr" size="25" /> </td>
    </tr>
   <tr>
      <td> </td>
      <td> <input type="submit" value="Absenden" /> </td>
    </tr>
  </table>
  </body>
</html>

