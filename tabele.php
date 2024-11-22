<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kino</title>
</head>
<body>
    
    
<?php

$connect = mysqli_connect("localhost","root", "", "kino");


if (!$connect){
    echo "Nie". mysqli_connect_error();
}

echo "Filmy:<br><table border = 1><tr>
    <th>Film</th>
    <th>Reżyser</th>
    <th>Czas trwania</th></tr>";

$wynik = mysqli_query($connect, "SELECT * FROM filmy");

while($row = mysqli_fetch_assoc($wynik)) {
    echo "<tr><td>".$row["tytul"]."</td><td>".$row["rezyser"]."</td><td>".$row["czas_trwania"]."</td></tr>";
  }
echo "</table>";

echo '<br><br><br>Bilety:<br><table border = 1><tr>
    <th>Film</th>
    <th>Termin</th>
    <th>Sprzedawca Id</th>
    <th>Login klienta</th>
    <th>Cena</th>
    </tr>';

$bilety = mysqli_query($connect, "SELECT `tytul`, `termin`, `sprzedawca_id`, `email`, `cena` FROM `bilety` INNER JOIN `seanse` ON bilety.seans_id = seanse.id INNER JOIN `filmy` ON seanse.film_id = filmy.id INNER JOIN `klienci` ON bilety.klient_id = klienci.id; ");

while($row = mysqli_fetch_assoc($bilety)) {
    echo "<tr><td>".$row["tytul"]."</td><td>".$row["termin"]."</td><td>".$row["sprzedawca_id"]."</td><td>".$row["email"]."</td><td>".$row["cena"]."</td></tr>";
  }
echo "</table>";


?>
</body>
</html>