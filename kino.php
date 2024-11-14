<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../../home/4Tigr1/Pulpit/style.css">
    <title>Kino</title>
</head>
<body>
    
    
<?php

echo "Witamy na stronie kina!<br>
<ul>
<li>Test</li>
<li>Test</li>
<li>Test</li>
<li>Test</li>
<li>Test</li>
</ul><br>";

$connect = mysqli_connect("localhost","root", "", "kino");


if (!$connect){
    echo "Nie". mysqli_connect_error();
}

$wynik = mysqli_query($connect, "SELECT * FROM filmy");

while($row = mysqli_fetch_assoc($wynik)) {
    echo "id: " . $row["id"]. " - Name: " . $row["tytul"]. " rezyser: " . $row["rezyser"]." Czas trwania:" . $row["czas_trwania"]. "<br>";
  }

?>
</body>
</html>