<?php
$db = mysqli_connect('localhost','root','', 'akukamu');
if (!$db) {
    echo "Eror";
}
$nis = $_POST['NIS'];
$Nama = $_POST['Nama'];
$password = $_POST['Password'];

$sql = "SELECT * FROM login WHERE NIS = '".$nis."' AND Nama = '".$Nama."' AND Password = '".$password."'";

$rs = mysqli_query($db,$sql);
$count = mysqli_num_rows($rs);

if ($count == 1) {
    echo json_encode("Error"); 
} else {
        $tambah = "INSERT INTO login (NIS,Nama,Password)  VALUES ('".$nis."','".$Nama."','".$password."')";

        $query = mysqli_query($db,$tambah);

        if ($query) {
            echo json_encode("Success");
        }
}