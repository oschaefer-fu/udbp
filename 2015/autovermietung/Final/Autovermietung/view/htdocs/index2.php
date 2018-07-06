<!DOCTYPE html>
<html lang="de">
<form action="auto2.php" method="post">
<link rel="stylesheet" type ="text/css" href="style.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Willkommen in der virtuellen UAutovermietung </title>
  </head>
  <body>
  <h1> Modelle einer Kategorie in einer Station</h1>
  <input type="hidden" name="sent" value="1" />
Es gibt die Kategorien:<br>
  Kleinwagen, Kompaktklasse, Mittelklasse, obMittelklasse, Oberklasse, Kleinbus, Cabrio<br><br>     
 Es gibt die Stationen:<br>
  1 (Berlin), 2 (Köln), 3 (München))<br><br>     
  <table>
    <tr>
     <td> Kategorie: </td>
      <td> <input type="text" name="kname" size="25" /> </td>
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

