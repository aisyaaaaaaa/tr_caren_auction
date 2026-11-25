-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2026 at 07:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbauction`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

CREATE TABLE `tbadmin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`id`, `nama`, `password`) VALUES
(1, 'admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tbbarang`
--

CREATE TABLE `tbbarang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi_barang` varchar(256) NOT NULL,
  `harga_awal` double NOT NULL,
  `harga_bids` double DEFAULT NULL,
  `harga_akhir` double DEFAULT NULL,
  `harga_buyout` double NOT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `status_lelang` varchar(50) NOT NULL DEFAULT 'pending',
  `id_pemilik` int(11) DEFAULT NULL,
  `foto_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbbarang`
--

INSERT INTO `tbbarang` (`id`, `nama_barang`, `deskripsi_barang`, `harga_awal`, `harga_bids`, `harga_akhir`, `harga_buyout`, `tgl_mulai`, `tgl_akhir`, `status_lelang`, `id_pemilik`, `foto_barang`) VALUES
(1, 'Toyota Avanza', 'Mobil ini biasa digunakan untuk keluarga, dapat menampung hingga 7 sampai 8 orang keren.', 120000000, 150000000, 150000000, 150000000, '2024-11-01', '2024-11-02', 'sold', 1, '../gambar/background.jpeg'),
(2, 'Honda CR-V', 'mobil ini pernah dipakai pak jokowi untuk menjemput jan ethes', 200000000, 100000000, 100000000, 100000000, '2024-11-03', '2024-11-04', 'sold', 2, '../gambar/d.png'),
(21, 'flelle', '1000', 100, NULL, NULL, 20000, NULL, NULL, 'on_going', NULL, '../gambar/signature.png'),
(22, 'flelle', '1000', 100, NULL, NULL, 20000, NULL, NULL, 'on_going', NULL, '../gambar/a.jpg'),
(23, 'Feli', 'keren', 1000, NULL, NULL, 2000, NULL, NULL, 'on_going', NULL, '../gambar/b.jpg'),
(24, 'h', '1', 2, NULL, NULL, 3, NULL, NULL, 'on_going', NULL, '../gambar/c.jpg'),
(26, 'debor', 'baik', 1000, NULL, NULL, 1000000, NULL, NULL, 'on_going', NULL, '../gambar/e.png'),
(27, 'ahsdvhasd', 'asjkdbajk', 1000, NULL, NULL, 10000, NULL, NULL, 'on_going', NULL, '../gambar/f.png'),
(28, 'ahsdvhasd', 'asjkdbajk', 1000, NULL, NULL, 10000, NULL, NULL, 'on_going', NULL, '../gambar/g.png'),
(29, 'hdhd', 'skks', 1000, NULL, NULL, 20000, NULL, NULL, 'sold', NULL, '../gambar/h.png'),
(30, 'Barang Baru', 'Barang ini sangat bagus', 2000, NULL, NULL, 5000000, NULL, NULL, 'pending', NULL, '../gambar/harold.jpg'),
(31, 'doraemon', 'coba aja', 20000, NULL, NULL, 2000000, NULL, NULL, 'pending', NULL, '../gambar/674d65461a3f4.png'),
(32, 'Honda CIVIC', 'Honda Civic adalah mobil kompak dari Honda yang dikenal dengan desain sporty, performa handal, dan efisiensi bahan bakar tinggi. Cocok untuk penggunaan harian dengan fitur modern dan kenyamanan berkendara.', 170000000, NULL, NULL, 318000000, NULL, NULL, 'pending', NULL, '../gambar/674d6a56717c5.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tbpembayaran`
--

CREATE TABLE `tbpembayaran` (
  `id_pembayaran` varchar(3) NOT NULL,
  `status_pembayaran` varchar(10) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `id_pembeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbuser`
--

CREATE TABLE `tbuser` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `no_rekening` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbuser`
--

INSERT INTO `tbuser` (`id`, `nama`, `password`, `no_rekening`) VALUES
(1, 'Vicko', '11111111', '1234567890'),
(2, 'Felicia', '22222222', '0987654321'),
(3, 'Aisya', '33333333', '6789012345'),
(5, 'Debora', '44444444', '5643245678'),
(6, 'Yere', '1', '123456987');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bid`
--

CREATE TABLE `tb_bid` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `bid_amount` decimal(50,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_bid`
--

INSERT INTO `tb_bid` (`id`, `id_barang`, `bid_amount`, `created_at`, `user_id`) VALUES
(11, 21, 200.00, '2024-11-27 10:04:18', NULL),
(12, 21, 500.00, '2024-11-27 10:04:29', NULL),
(13, 22, 200.00, '2024-11-27 10:40:58', 1),
(14, 22, 500.00, '2024-11-27 10:41:02', 1),
(15, 24, 10000.00, '2024-11-27 11:28:08', 3),
(16, 24, 200000.00, '2024-11-27 11:28:51', 1),
(17, 21, 100000000.00, '2024-11-27 13:31:08', 1),
(18, 22, 700.00, '2024-11-27 13:31:39', 1),
(19, 21, 3000000000000000000000.00, '2024-11-27 13:32:17', 3),
(20, 23, 200000000000.00, '2024-11-30 16:16:07', 1),
(21, 23, 2000000000000000000.00, '2024-11-30 16:16:18', 1),
(22, 24, 260000.00, '2024-11-30 16:44:12', 5),
(23, 27, 400000.00, '2024-11-30 17:09:26', 1),
(24, 29, 30000.00, '2024-12-02 11:07:55', 3),
(25, 26, 50000.00, '2024-12-02 11:15:50', 3),
(26, 28, 30000.00, '2024-12-02 11:16:22', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tbbarang_tbuser` (`id_pemilik`);

--
-- Indexes for table `tbpembayaran`
--
ALTER TABLE `tbpembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `fk_tbpembayaran_tbuser` (`id_pembeli`);

--
-- Indexes for table `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bid`
--
ALTER TABLE `tb_bid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbadmin`
--
ALTER TABLE `tbadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbbarang`
--
ALTER TABLE `tbbarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_bid`
--
ALTER TABLE `tb_bid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD CONSTRAINT `fk_tbbarang_tbuser` FOREIGN KEY (`id_pemilik`) REFERENCES `tbuser` (`id`);

--
-- Constraints for table `tbpembayaran`
--
ALTER TABLE `tbpembayaran`
  ADD CONSTRAINT `fk_tbpembayaran_tbuser` FOREIGN KEY (`id_pembeli`) REFERENCES `tbuser` (`id`);

--
-- Constraints for table `tb_bid`
--
ALTER TABLE `tb_bid`
  ADD CONSTRAINT `tb_bid_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbbarang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
