-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jan 2023 pada 15.18
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_acumalaka`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `harga` varchar(60) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `keterangan`, `id_kategori`, `harga`, `stok`, `gambar`) VALUES
(40, 'Baju afa iyah', 'Baju keren ni gan', 8, '890000', 20, 'Screenshot_2023-01-09_151241.jpg'),
(41, 'Kemeja Keren', 'Kemeja ga ada obat paling keren sedunia persilatan', 9, '100000', 40, 'Screenshot_2023-01-14_142449.jpg'),
(42, 'Celana Joger', 'Celana joger mantap', 10, '100000', 70, 'Screenshot_2023-01-14_142809.jpg'),
(43, 'Celana Pendek ', 'Nyaman dipakai', 11, '50000', 12, 'Screenshot_2023-01-14_144719.jpg'),
(44, 'Topi Keren', 'Nyaman dipakai diluar ruangan', 12, '20000', 50, 'Screenshot_2023-01-14_144848.jpg'),
(45, 'Baju Komputer', 'Baju kaos berkualitas', 8, '98000', 40, 'Mockup_baju2.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(120) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `no_telpon` int(13) NOT NULL,
  `jasper` varchar(50) NOT NULL,
  `bukti_bayar` varchar(60) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `resi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `id_user`, `nama`, `id_ongkir`, `alamat`, `no_telpon`, `jasper`, `bukti_bayar`, `tgl_pesan`, `resi`) VALUES
(29, 12, 'fadilz', 3, 'Ngawi', 89865765, '', 'image.jpg', '2023-01-14 18:01:54', 'JNE--REG54872834'),
(30, 12, 'sasa', 2, 'Sleman Tengah', 87684, '', 'image.jpg', '2023-01-14 18:01:42', 'jntx12345858675'),
(31, 12, 'fadilza', 3, 'Ngawi', 896898, '', 'image13.jpg', '2023-01-14 18:03:37', 'Belum Tersedia'),
(32, 12, 'Ilyas', 2, 'NGawi barat', 894798433, '', 'image.jpg', '2023-01-14 21:51:07', 'jntt-876876'),
(33, 12, 'Sabi', 4, 'Yogya CuyRill ', 2147483647, 'JNT', 'Screenshot_2023-01-09_1514245.jpg', '2023-01-20 16:57:47', 'Belum Tersedia'),
(34, 12, 'Afa iyah', 4, 'Bogor barat', 2147483647, 'POS INDONESIA', 'Screenshot_2023-01-09_1514246.jpg', '2023-01-20 17:00:31', 'Belum Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(8, 'Baju Kaos'),
(9, 'Baju Kemeja'),
(10, 'Celana Panjang'),
(11, 'Celana Pendek'),
(12, 'Topi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `provinsi`, `ongkir`) VALUES
(2, 'Riau', 15000),
(3, 'Ngawi', 8000),
(4, 'Jabar', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_invoice`, `id_barang`, `nama_barang`, `jumlah`, `harga`) VALUES
(24, 29, 40, 'Baju afa iyah', 1, 890000),
(25, 30, 41, 'Kemeja Keren', 2, 100000),
(26, 31, 40, 'Baju afa iyah', 1, 890000),
(27, 32, 40, 'Baju afa iyah', 1, 890000),
(28, 33, 40, 'Baju afa iyah', 1, 890000),
(29, 34, 42, 'Celana Joger', 1, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(10, 'Shady', 'aryashady24@gmail.com', 'default.jpg', '$2y$10$lMOSZM.OODrYTMFl8WIaq.b06ESJjsEiYO89LrpHMQAbTYh.zagCC', 2, 1, 1671123105),
(12, 'arya', 'arya@gmail.com', 'default.jpg', '$2y$10$sYXkb3Zwcz/fBWsU6jY4T.bZx3XvCbBjpOsju.D/DrM4Pd/l/RLvi', 2, 1, 1671242726),
(13, 'fadil', 'fadil@gmail.com', 'default.jpg', '$2y$10$VSZVoxqUFjoJjIk6QnquEOgLg830LM2/mw5vVYbPeq6HhGeh3EuQW', 2, 1, 1671252061),
(14, 'admin', 'admin@gmail.com', 'default.jpg', '$2y$10$GyU2iZKLCrtukx1NGGFVS.pNZGh4O.IrDni7DZMvEJuER3p9BHZOW', 1, 1, 1672830309);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_ongkir` (`id_ongkir`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_invoice` (`id_invoice`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`id_ongkir`) REFERENCES `ongkir` (`id_ongkir`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
