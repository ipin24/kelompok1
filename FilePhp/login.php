<?php
$db = mysqli_connect('localhost','root','', 'akukamu');

$nis = $_POST['NIS'];
$password = $_POST['Password'];

$sql = "SELECT * FROM login WHERE NIS = '".$nis."' AND Password = '".$password."'";

$rs = mysqli_query($db,$sql);
$count = mysqli_num_rows($rs);

if ($count == 1) {
    echo json_encode("Success"); 
} else {
    echo json_encode("Error"); 
}