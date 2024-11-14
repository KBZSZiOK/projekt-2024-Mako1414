<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../../home/4TIgr1/Pulpit/style.css">
    
    <title>Kino</title>
</head>
<body>
    
    
<?php

$connect = mysqli_connect("localhost","root", "", "kino");


if (!$connect){
    echo "Nie". mysqli_connect_error();
}

echo "Filmy:<br><table border = 1><tr><th>Film</th><th>Reżyser</th><th>Czas trwania</th></tr>";

$wynik = mysqli_query($connect, "SELECT * FROM filmy");

while($row = mysqli_fetch_assoc($wynik)) {
    echo "<tr><td>".$row["tytul"]."</td><td>".$row["rezyser"]."</td><td>".$row["czas_trwania"]."</td></tr>";
  }

  echo "</table>";


?>
</body>
</html>