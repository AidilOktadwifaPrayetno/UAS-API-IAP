-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Bulan Mei 2025 pada 18.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `username`, `password`, `telp`) VALUES
('123', 'Hery', 'hery', 'hery', '12321321'),
('2217020001', 'Haditya Prasetyo S.Kom', 'Haditya', '1234', '081234567890'),
('2217020078', 'Genta', 'genta', 'genta', '081298800998'),
('2217020079', 'MUHAMMAD NADAFFA', 'daffa', 'daffa', '1234'),
('2217020083', 'Fadhil Ramadhan', 'fadhil', '1234', '081234567891');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(5) NOT NULL,
  `tgl_pengaduan` varchar(20) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('KONFIRMASI','PROSES','SELESAI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(46, '2024-12-12', '2217020079', 'Lonteng lantai 3 gedung FST Bocor', '121220243450download (6).jpg', 'PROSES'),
(47, '2024-12-12', '2217020079', 'Monitor di FST Rusak', '121220243754download (5).jpg', 'KONFIRMASI'),
(48, '2024-12-13', '2217020079', 'Atap Bocor', '131220244831logo.png', 'SELESAI'),
(49, '2024-12-13', '2217020079', 'air mati', '131220242252Screenshot 2024-12-13 001727.png', 'SELESAI'),
(50, '2024-12-13', '2217020083', 'ada meja belajar yang patah', '1312202422462024-01-17.jpg', 'SELESAI'),
(51, '2024-12-14', '2217020079', 'Indah\r\n', '1412202405432024-01-17 (2).jpg', 'PROSES'),
(52, '2024-12-14', '2217020001', 'Loteng Gedung FST Bolongg', '141220245008download (6).jpg', 'SELESAI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(5) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp_petugas` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp_petugas`, `level`) VALUES
(1, 'Aidil Oktadwifa Prayetno', 'admin', 'admin', '', 'admin'),
(4, 'Ahmad Fadhil Ramadan', 'fadhil', 'fadhil', '081275677890', 'petugas'),
(5, 'alkhafi kurniawn', 'khafi', '827ccb0eea8a706c4c34a16891f84e7b', '089876543210', 'petugas'),
(6, 'hery', 'petugas', '570c396b3fc856eceb8aa7357f32af1a', '081298800998', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan` varchar(20) NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(43, 46, '2024-12-12', 'Oke saya tinjau', 4),
(44, 48, '2024-12-13', 'Terimakasih atas pengaduannya, akan kami tindak lanjuti', 4),
(45, 49, '2024-12-13', 'okee', 4),
(46, 50, '2024-12-13', 'baik akan kami tindak lanjuti\r\n', 4),
(47, 51, '2024-12-14', 'ok\r\n', 4),
(48, 52, '2024-12-14', 'Ok', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan_lanjut`
--

CREATE TABLE `tanggapan_lanjut` (
  `id_tanggapan_lanjut` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan_lanjut` varchar(20) NOT NULL,
  `tanggapan_lanjut` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tanggapan_lanjut`
--

INSERT INTO `tanggapan_lanjut` (`id_tanggapan_lanjut`, `id_pengaduan`, `tgl_tanggapan_lanjut`, `tanggapan_lanjut`, `id_petugas`) VALUES
(17, 44, '2024-12-12', '', 1),
(18, 45, '2024-12-12', '', 1),
(19, 43, '2024-12-12', 'Done', 4),
(20, 48, '2024-12-13', 'Sudah selesai, terimakasih atas pengaduan annda', 4),
(21, 49, '2024-12-13', 'sudahh selesi dikerjkan', 4),
(22, 50, '2024-12-13', 'sudah diperbaiki, terimakasih atas kontribusinya', 4),
(23, 52, '2024-12-14', 'Sudah selesai diperbaiki', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- Indeks untuk tabel `tanggapan_lanjut`
--
ALTER TABLE `tanggapan_lanjut`
  ADD PRIMARY KEY (`id_tanggapan_lanjut`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `tanggapan_lanjut`
--
ALTER TABLE `tanggapan_lanjut`
  MODIFY `id_tanggapan_lanjut` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
