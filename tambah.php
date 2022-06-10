<?php
    include 'koneksi.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="w-50 border p-3 mt-3">
<form action="tambah.php" method="post">
<label for="id_pegawai">id_pegawai</label>
    <input type="text" id="id_pegawai" name="id_pegawai" class="form-control" required>

    <label for="id_divisi">id_divisi</label>
    <input type="text" id="id_divisi" name="id_divisi" class="form-control" required>

    <label for="id_jabatan">id_jabatan</label>
    <input type="text" id="id_jabatan" name="id_jabatan" class="form-control" required>

    <label for="nama">nama</label>
    <input type="text" id="nama" name="nama" class="form-control" required>

    <label for="alamat">alamat</label>
    <input type="text" id="alamat" name="alamat" class="form-control" required>

    <label for="usia">usia</label>
    <input type="text" id="usia" name="usia" class="form-control" required>

    <label for="id_shift">id_shift </label>
    <input type="text" id="id_shift" name="id_shift" class="form-control" required>

   

<input class="btn btn-success mt-3" type="submit" name="tambah" value="tambah data">

</form>
</div>   

<?php

if(isset($_POST['tambah'])){
$idpegawai=$_POST['id_pegawai'];
$iddivisi=$_POST['id_divisi'];
$idjabatan=$_POST['id_jabatan'];
$nama=$_POST['nama'];
$alamat=$_POST['alamat'];
$usia=$_POST['usia'];
$shift=$_POST['id_shift'];


$sqlget = "select * from pegawai where='$idpegawai'";
$queryget = mysqli_query($conn, $sqlget);
$cek = mysqli_num_rows($queryget);

$sqlInsert="INSERT INTO `pegawai`(`id_pegawai`, `id_divisi`, `id_jabatan`, `nama`, `alamat`, `usia`, `id_shift`) 
values ('$idpegawai','$iddivisi','$idjabatan','$nama','$alamat','$usia','$shift')";

$queryinsert = mysqli_query($conn, $sqlInsert);

if ($cek < 0 && $queryinsert){
echo"
<div class='alert alert-success'>data berhasil <a href='index.php'>lihat data</a></div>
";
}else if($cek > 1){
    echo"
    <div class='alert alert-danger'>data gagal <a href='index.php'>lihat data</a></div>
    ";
}

header("location: index.php");
}
?>



    </body>
    </html>