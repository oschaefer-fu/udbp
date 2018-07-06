<!DOCTYPE html>

<html lang="de">
<form action="./liste.php" method="post">
<link rel="stylesheet" type ="text/css" href="nachhilfe.css"/>

  <body>
	<h1>Datenbank Sch&uuml;ler - Nachhilfe</h1>
	<h2>Formular zur Kostenermittlung</h2>
	<input type="hidden" name="sent" value="1" />
	
	<table>
    <tr>
      <td> Name: </td>
      <td> <input type="text" name="name" size="25" /> </td>
    </tr>
    <tr>
      <td> Jahr: </td>
      <td> <select name="jahr" size="1">
		<option value ="alle"> alle Jahre </option> 
		<option value ="2014"> 2014 </option> 
		<option value ="2015"> 2015 </option> </td>
    </tr>
    <tr>
      <td> </td>
      <td> <input type="submit" value="Absenden" /> </td>
    </tr>
  </table>
	
  </body>
</html>          	

