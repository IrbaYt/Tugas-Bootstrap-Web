<?php
    include 'koneksi.php';

    $idpegawai=$_GET['id_pegawai'];
    $sqlget ="SELECT * FROM pegawai Where id_pegawai='$idpegawai'";
    $queryget=mysqli_query($conn, $sqlget);
    $data=mysqli_fetch_array($queryget);
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
<form action="update.php" method="post">
<label for="id_pegawai">id_pegawai</label>
    <input type="text" id="id_pegawai" name="id_pegawai" value="<?php echo "$data[id_pegawai]";?>" class="form-control" readonly>

    <label for="id_divisi">id_divisi</label>
    <input type="text" id="id_divisi" name="id_divisi" value="<?php echo "$data[id_divisi]";?>" class="form-control" required>

    <label for="id_jabatan">id_jabatan</label>
    <input type="text" id="id_jabatan" name="id_jabatan" value="<?php echo "$data[id_jabatan]";?>" class="form-control" required>

    <label for="nama">nama</label>
    <input type="text" id="nama" name="nama" value="<?php echo "$data[nama]";?>" class="form-control" required>

    <label for="alamat">alamat</label>
    <input type="text" id="alamat" name="alamat" value="<?php echo "$data[alamat]";?>" class="form-control" required>

    <label for="usia">usia</label>
    <input type="text" id="usia" name="usia" value="<?php echo "$data[usia]";?>" class="form-control" required>

    <label for="id_shift">id_shift </label>
    <input type="text" id="id_shift" name="id_shift" value="<?php echo "$data[id_shift]";?>" class="form-control" required>

   

<input class="btn btn-success mt-3" type="submit" name="tambah" value="rubah data">

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


$sqlupdate = "UPDATE pegawai 
SET id_pegawai='$idpegawai', id_divisi='$iddivisi', id_jabatan='$idjabatan', nama='$nama', alamat='$alamat', usia='$usia', id_shift='$shift'
WHERE id_pegawai='$idpegawai'";

$queryupdate =mysqli_query($conn, $sqlupdate);

header("location: index.php");


}
?>



    </body>
    </html>