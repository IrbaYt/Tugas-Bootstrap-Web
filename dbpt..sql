-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2022 pada 13.47
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpt`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_delete_pegawai` (IN `p_id` INT(3))   DELETE FROM pegawai WHERE id_pegawai = p_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_divisi` ()  READS SQL DATA SELECT * FROM divisi$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_jabatan` ()  READS SQL DATA SELECT * FROM jabatan$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_pegawai` ()  READS SQL DATA SELECT * FROM pegawai$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(3) NOT NULL,
  `divisi` varchar(22) NOT NULL,
  `honor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `divisi`, `honor`) VALUES
(1, 'HRD', 5000000),
(2, 'Security', 3500000),
(3, 'Produksi', 4000000),
(4, 'Logistik', 4000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(2) NOT NULL,
  `jabatan` varchar(22) NOT NULL,
  `gaji_pokok` bigint(20) NOT NULL,
  `tunj_jabatan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `jabatan`, `gaji_pokok`, `tunj_jabatan`) VALUES
(1, 'staff', 3000000, 300000),
(2, 'manager', 9000000, 500000),
(3, 'karyawan', 3000000, 200000),
(4, 'supervisor', 5000000, 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(3) NOT NULL,
  `id_divisi` int(3) NOT NULL,
  `id_jabatan` int(3) NOT NULL,
  `nama` varchar(22) NOT NULL,
  `alamat` varchar(22) NOT NULL,
  `usia` varchar(2) NOT NULL,
  `id_shift` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `id_divisi`, `id_jabatan`, `nama`, `alamat`, `usia`, `id_shift`) VALUES
(1, 1, 2, 'japra', 'cileungsi', '22', 2),
(4, 2, 2, 'ahmad', 'jalan satu', '30', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift`
--

CREATE TABLE `shift` (
  `id_shift` int(3) NOT NULL,
  `nama_shift` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `shift`
--

INSERT INTO `shift` (`id_shift`, `nama_shift`) VALUES
(1, 'pagi'),
(2, 'malam');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_detail_pegawai`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_detail_pegawai` (
`id_pegawai` int(3)
,`nama` varchar(22)
,`alamat` varchar(22)
,`usia` varchar(2)
,`divisi` varchar(22)
,`jabatan` varchar(22)
,`honor` bigint(20)
,`gaji_pokok` bigint(20)
,`tunj_jabatan` bigint(20)
,`total` bigint(22)
,`nama_shift` varchar(22)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_detail_pegawai`
--
DROP TABLE IF EXISTS `v_detail_pegawai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_pegawai`  AS SELECT `pegawai`.`id_pegawai` AS `id_pegawai`, `pegawai`.`nama` AS `nama`, `pegawai`.`alamat` AS `alamat`, `pegawai`.`usia` AS `usia`, `divisi`.`divisi` AS `divisi`, `jabatan`.`jabatan` AS `jabatan`, `divisi`.`honor` AS `honor`, `jabatan`.`gaji_pokok` AS `gaji_pokok`, `jabatan`.`tunj_jabatan` AS `tunj_jabatan`, `divisi`.`honor`+ `jabatan`.`gaji_pokok` + `jabatan`.`tunj_jabatan` AS `total`, `shift`.`nama_shift` AS `nama_shift` FROM (((`pegawai` join `divisi` on(`pegawai`.`id_divisi` = `divisi`.`id_divisi`)) join `jabatan` on(`pegawai`.`id_jabatan` = `jabatan`.`id_jabatan`)) join `shift` on(`pegawai`.`id_shift` = `shift`.`id_shift`))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_divisi` (`id_divisi`),
  ADD KEY `id_divisi_2` (`id_divisi`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_jabatan` (`id_jabatan`) USING BTREE,
  ADD KEY `id_divisi_3` (`id_divisi`),
  ADD KEY `id_shift` (`id_shift`);

--
-- Indeks untuk tabel `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id_shift`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `shift`
--
ALTER TABLE `shift`
  MODIFY `id_shift` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_3` FOREIGN KEY (`id_shift`) REFERENCES `shift` (`id_shift`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
