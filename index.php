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

    </head>
    <body>

            <!-- form -->
            <div class="container mt-3 ">
            
              <!-- judul -->
              <p class="text-black fs-5 text-center">Data Pegawai</p></div>
                <!-- end judul -->
                <!-- Button add nilai -->
                
                <!-- Table Data nilai -->
                <div class="container">
                <a href="tambah.php" class="btn btn-primary mb-2">Tambah</a>
                <table class="table table-striped table-bordered table-hover">
                  <thead class="table-dark">
                          <th>ID</th>
                          <th>Nama</th>
                          <th>alamat</th>
                          <th>Divisi</th>
                          <th>Jabatan</th>
                          <th>Honor</th>
                          <th>Gaji Pokok</th>
                          <th>Tunj Jabatan</th>
                          <th>Total</th>
                          <th>Shift</th>
                          <th>Aksi</th>
                   </thead>
                   <tbody>
                        <?php
                            $sql = "SELECT * FROM v_detail_pegawai";
                            $data = mysqli_query($conn,$sql);
                            foreach($data as $rows ) : ?>
                          <tr>
                            <td><?php echo $rows['id_pegawai']; ?></td>
                            <td><?php echo $rows['nama'] ?></td>
                            <td><?php echo $rows['alamat'] ?></td>
                            <td><?php echo $rows['divisi'] ?></td>
                            <td><?php echo $rows['jabatan'] ?></td>
                            <td><?php echo $rows['honor'] ?></td>
                            <td><?php echo $rows['gaji_pokok'] ?></td>
                            <td><?php echo $rows['tunj_jabatan'] ?></td>
                            <td><?php echo $rows['total'] ?></td>
                            <td><?php echo $rows['nama_shift'] ?></td>
                            <td>
                            <?php
                              echo "<a href= 'update.php?id_pegawai=$rows[id_pegawai]' class='btn btn-warning btn-sm me-2' > Update </a>";
                              echo "<a href= 'delete.php?id_pegawai=$rows[id_pegawai]' class='btn btn-danger btn-sm' > Delete </a>";
                              ?>
                            </td>
                          </tr>
                        <?php endforeach?>
                    </tbody>
               </table>
              
              </div>
            </div>
        <!-- end -->

        <script>
          if(window.history.replaceState){
            window.history.replaceState(null,null,window.location.href);
          }
        </script>
    </body>
    </html>