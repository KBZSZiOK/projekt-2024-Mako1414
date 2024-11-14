<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    
    <title>Kino</title>
</head>
<body>
    
    
<?php

$connect = new mysqli("localhost","root", "", "kino");


if (!$connect){
    echo "Nie". mysqli_connect_error();
}

$seanse = mysqli_query($connect, "SELECT DISTINCT termin FROM seanse");

if(empty($_POST['termin'])){
echo '<form action="form.php" method="POST">
        Wybierz date:<br>
       <select name="termin">';
    while($row = mysqli_fetch_assoc($seanse)) {
        echo "<option value='".$row["termin"]."'>" . $row["termin"]."</option>";
      }
echo  '</select><br><input type="submit" value="Dalej"></form>';
}
else{
    $terminb = $_POST['termin'];
    
  
    $film = $connect->prepare("SELECT seanse.id, `tytul`, `termin`  FROM `filmy` INNER JOIN `seanse` on filmy.id = seanse.film_id  WHERE `termin` = ?");
    $film ->bind_param("s", $terminb);
    $film ->execute();

    $result = $film->get_result();

    echo '<form action="submit.php" method="POST">
    Login:<input name="login" type="text"><br>    
    Wybierz film:<br>
        <select name="film">';
    while($row = mysqli_fetch_assoc($result)) {
        echo "<option value='".$row["tytul"]."'>" . $row["tytul"]."</option>";
      }


   echo '</select><br>
        Liczba miejsc:<input name="miejsca" type="number">
        <br><input type="submit" value="Kup bilet">
   </form>';


   echo "Filmy:<br><table border = 1><tr><th>seans id</th><th>tytul</th><th>Czas trwania</th></tr>";

while($row = mysqli_fetch_assoc($result)) {
    echo "<tr><td>".$row["id"]."</td><td>".$row["tytul"]."</td><td>".$row["termin"]."</td></tr>";
  }

  echo "</table>";

  }

?>
</body>
</html>