<!DOCTYPE html>
<html lang="de">
<form action="auto1.php" method="post">
<link rel="stylesheet" type ="text/css" href="style.css"/>
  <head>
    <meta charset="UTF-8">
    <title> Willkommen in der virtuellen Autovermietung </title>
  </head>
  <body>
  <h1> Suche nach Preisen für Kategorien </h1>
  <input type="hidden" name="sent" value="1" />
Es gibt die Kategorien:<br>
  Kleinwagen, Kompaktklasse, Mittelklasse, obMittelklasse, Oberklasse, Kleinbus, Cabrio<br><br>     
  <table>
    <tr>
     <td> Kategorie: </td>
      <td> <input type="text" name="kname" size="25" /> </td>
        </tr>

   <tr>
      <td> </td>
      <td> <input type="submit" value="Absenden" /> </td>
    </tr>
  </table>
  </body>
</html>

