-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 08:43 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cari_band`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota_band`
--

CREATE TABLE `anggota_band` (
  `id_anggota` char(5) NOT NULL,
  `id_band` char(5) NOT NULL,
  `nm_anggota` varchar(20) NOT NULL,
  `posisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota_band`
--

INSERT INTO `anggota_band` (`id_anggota`, `id_band`, `nm_anggota`, `posisi`) VALUES
('A0001', 'B0001', 'Halim', 'Pianis'),
('A0002', 'B0001', 'Andhi', 'Vokalis'),
('A0003', 'B0001', 'Rahmat', 'Gitaris'),
('A0004', 'B0002', 'Nindy', 'Vokalis'),
('A0005', 'B0002', 'Hartono', 'Gitaris'),
('A0006', 'B0002', 'Widy', 'Basis'),
('A0007', 'B0003', 'Putra', 'Vokalis'),
('A0008', 'B0003', 'Agung', 'Basis'),
('A0009', 'B0003', 'Raka', 'Pianis'),
('A0010', 'B0004', 'Fauzan', 'Vokalis'),
('A0011', 'B0004', 'Renaldy', 'Drummer'),
('A0012', 'B0004', 'Sandra', 'Gitaris'),
('A0013', 'B0005', 'Adhikara', 'Vokalis'),
('A0014', 'B0005', 'Hilmi', 'Gitaris'),
('A0015', 'B0005', 'Astri', 'Pianis');

-- --------------------------------------------------------

--
-- Table structure for table `band`
--

CREATE TABLE `band` (
  `id_band` char(5) NOT NULL,
  `nm_band` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `desc_band` text NOT NULL,
  `reputasi` set('1','2','3','4','5') NOT NULL,
  `domisili` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `band`
--

INSERT INTO `band` (`id_band`, `nm_band`, `harga`, `desc_band`, `reputasi`, `domisili`) VALUES
('B0001', 'Rockstar', 35000000, 'Pop Rock', '2', 'Jakarta'),
('B0002', 'Roman Picisan', 45000000, 'Pop Rock', '4', 'Solo'),
('B0003', 'Sheila On 11', 50000000, 'Pop', '5', 'Bandung'),
('B0004', 'Jamrut', 40000000, 'Rock', '3', 'Jakarta'),
('B0005', 'De Luna', 30000000, 'Pop', '2', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_cust` char(5) NOT NULL,
  `nm_cust` varchar(20) NOT NULL,
  `nohp_cust` varchar(15) NOT NULL,
  `email_cust` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jns_kelamin` set('L','P') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_cust`, `nm_cust`, `nohp_cust`, `email_cust`, `tgl_lahir`, `jns_kelamin`) VALUES
('C0001', 'Nazif', '081122334455', 'nazif123@gmail.com', '2002-01-01', 'L'),
('C0002', 'Fisya', '087700998877', 'fisya456@gmail.com', '2002-02-02', 'P'),
('C0003', 'Maulida', '081234567890', 'maulidaa@gmail.com', '2002-03-03', 'P'),
('C0004', 'Raziv', '088855554444', 'raziv00@gmail.com', '2002-04-04', 'L'),
('C0005', 'Andhika', '086677779999', 'andika321@gmail.com', '0000-00-00', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `karya_band`
--

CREATE TABLE `karya_band` (
  `id_karya` char(5) NOT NULL,
  `id_band` char(5) NOT NULL,
  `nm_karya` varchar(20) NOT NULL,
  `desc_karya` text NOT NULL,
  `file_karya` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karya_band`
--

INSERT INTO `karya_band` (`id_karya`, `id_band`, `nm_karya`, `desc_karya`, `file_karya`) VALUES
('K0001', 'B0001', 'Hampa', 'Lagu', NULL),
('K0002', 'B0001', 'Lara', 'Video Klip', NULL),
('K0003', 'B0002', 'Ekspektasi', 'Video Klip', NULL),
('K0004', 'B0002', 'Harmoni', 'Lagu', NULL),
('K0005', 'B0003', 'Sudah', 'Lagu', NULL),
('K0006', 'B0003', 'Hidup Ini', 'Lagu', NULL),
('K0007', 'B0004', 'Kisah Kita', 'Video Klip', NULL),
('K0008', 'B0004', 'Persimpangan', 'Lagu', NULL),
('K0009', 'B0005', 'Bersamamu', 'Video Klip', NULL),
('K0010', 'B0005', 'Secukupnya', 'Lagu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` char(5) NOT NULL,
  `id_cust` char(5) NOT NULL,
  `id_band` char(5) NOT NULL,
  `tgl_pmsn` date NOT NULL,
  `tgl_acara` date NOT NULL,
  `lks_acara` varchar(20) NOT NULL,
  `wkt_acara` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_order`, `id_cust`, `id_band`, `tgl_pmsn`, `tgl_acara`, `lks_acara`, `wkt_acara`) VALUES
('A0101', 'C0001', 'B0002', '2021-01-05', '2021-02-15', 'Semarang', '16.00 - 18.00'),
('A0103', 'C0002', 'B0004', '2021-01-12', '2021-03-01', 'Tangerang', '19.00 - 21.00'),
('A0105', 'C0003', 'B0003', '2021-01-15', '2021-03-12', 'Bandung', '20.00 - 22.00'),
('A0107', 'C0004', 'B0001', '2021-02-10', '2021-04-01', 'Jakarta', '10.00 - 12.00'),
('A0109', 'C0005', 'B0005', '2021-03-01', '2021-04-10', 'Bandung', '18.00 - 20.00');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_byr` char(5) NOT NULL,
  `id_order` char(5) NOT NULL,
  `total_byr` int(11) NOT NULL,
  `tgl_byr` date NOT NULL,
  `metode_byr` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_byr`, `id_order`, `total_byr`, `tgl_byr`, `metode_byr`) VALUES
('B0010', 'A0101', 45000000, '2021-01-06', 'Kartu Kredit'),
('B0012', 'A0103', 40000000, '2021-01-12', 'Transfer Bank'),
('B0014', 'A0105', 50000000, '2021-01-16', 'Transfer Bank'),
('B0016', 'A0107', 35000000, '2021-02-10', 'Kartu Kredit'),
('B0018', 'A0109', 30000000, '2021-03-02', 'Transfer Bank');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota_band`
--
ALTER TABLE `anggota_band`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_band_anggota` (`id_band`);

--
-- Indexes for table `band`
--
ALTER TABLE `band`
  ADD PRIMARY KEY (`id_band`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cust`);

--
-- Indexes for table `karya_band`
--
ALTER TABLE `karya_band`
  ADD PRIMARY KEY (`id_karya`),
  ADD KEY `id_band_2` (`id_band`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_cust_1` (`id_cust`),
  ADD KEY `id_band_3` (`id_band`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_byr`),
  ADD KEY `id_order_1` (`id_order`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_band`
--
ALTER TABLE `anggota_band`
  ADD CONSTRAINT `id_band_anggota` FOREIGN KEY (`id_band`) REFERENCES `band` (`id_band`);

--
-- Constraints for table `karya_band`
--
ALTER TABLE `karya_band`
  ADD CONSTRAINT `id_band_2` FOREIGN KEY (`id_band`) REFERENCES `band` (`id_band`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `id_band_3` FOREIGN KEY (`id_band`) REFERENCES `band` (`id_band`),
  ADD CONSTRAINT `id_cust_1` FOREIGN KEY (`id_cust`) REFERENCES `customer` (`id_cust`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `id_order_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
