<?php
$host     = "mysql";
$user     = "root";
$password = "rootpassword";
$database = "db_movieticket";

$koneksi = mysqli_connect($host, $user, $password, $database);

if (!$koneksi) {
    die("Koneksi ke database gagal: " . mysqli_connect_error());
}
?>
