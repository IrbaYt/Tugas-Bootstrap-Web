<?php
include 'koneksi.php';

$idpegawai = $_GET['id_pegawai'];
$sqldelete ="DELETE FROM pegawai where id_pegawai='$idpegawai' ";
mysqli_query($conn, $sqldelete);

header ("location: index.php");
?>