<?php   
$connect = new mysqli("localhost","root", "", "kino");

if (!$connect){
    echo "Nie". mysqli_connect_error();
}
$logino = mysqli_real_escape_string($connect, $_POST['login']);
    $logi = $connect->prepare("SELECT id FROM `klienci` WHERE `email` = ?");
        $logi ->bind_param("s", $logino);
        $logi ->execute();
        $login_wynik = $logi->get_result();

    if( $login_wynik->num_rows > 0){
            $logi = $login_wynik->fetch_assoc();
            $id = $logi['id'];
            $cena = intval($_POST['miejsca']*21);
            $spr_id = rand(1,4);
            $seans_id = intval($_POST['film']);
            
            $wstaw = $connect->prepare("INSERT INTO `bilety` (seans_id, sprzedawca_id, klient_id, cena)VALUES (?,?,?,?);");
            $wstaw-> bind_param("iiii", $seans_id, $spr_id, $id, $cena);
            
            if($wstaw->execute()){
                echo"Pomyślnie zakupiono bilet<br><a href='form.php'>Powrót</a>";
            }else{
                echo $wstaw->error;
            }
        }else{
            echo "Niepoprawny login<br><a href='form.php'>Powrót</a>";
        }
    ?>