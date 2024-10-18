-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Okt 2024 pada 19.35
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketplace`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(2, 'beni customer', 'benicustomer@gmail.com', '$2b$10$aOsLan0efM4Icq4IPTnch.Nvy.xmiEWqryEH4FwqZZVApz7sxjxa.', '2024-10-18 09:13:17', '2024-10-18 09:13:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `merchants`
--

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `merchants`
--

INSERT INTO `merchants` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'beni merchant', 'benimerchant@gmail.com', '$2b$10$gYlgeNvZMg/DCgUEOMdF9ezqQAn99NbI8mL3XImImzBnsI.1Tqsyi', '2024-10-18 09:13:27', '2024-10-18 09:13:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `merchantId` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `merchantId`, `createdAt`, `updatedAt`) VALUES
(1, 'tas', 1000, 1, '2024-10-18 09:28:05', '2024-10-18 09:28:05'),
(5, 'sepatu', 200000, 1, '2024-10-18 17:16:57', '2024-10-18 17:16:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `ongkir` varchar(10) NOT NULL,
  `total` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `customerId`, `productId`, `ongkir`, `total`, `createdAt`, `updatedAt`) VALUES
(5, 2, 1, '0', 1000, '2024-10-18 16:39:08', '2024-10-18 16:39:08'),
(2, 2, 1, '0', 63000000, '2024-10-18 09:34:41', '2024-10-18 09:34:41'),
(3, 2, 1, '0', 63000000, '2024-10-18 09:38:24', '2024-10-18 09:38:24'),
(4, 2, 1, '0', 630000, '2024-10-18 09:38:44', '2024-10-18 09:38:44'),
(6, 2, 1, '0', 1000, '2024-10-18 16:39:18', '2024-10-18 16:39:18'),
(7, 2, 1, '0', 1000, '2024-10-18 17:08:15', '2024-10-18 17:08:15'),
(8, 2, 5, '0', 540000, '2024-10-18 17:21:22', '2024-10-18 17:21:22'),
(9, 2, 5, '', 180000, '2024-10-18 17:22:34', '2024-10-18 17:22:34'),
(10, 2, 1, '', 630000, '2024-10-18 17:23:22', '2024-10-18 17:23:22'),
(11, 2, 5, '', 540000, '2024-10-18 17:24:04', '2024-10-18 17:24:04'),
(12, 2, 1, 'true', 630000, '2024-10-18 17:26:18', '2024-10-18 17:26:18'),
(13, 2, 5, 'true', 180000, '2024-10-18 17:26:28', '2024-10-18 17:26:28'),
(14, 2, 5, 'true', 180000, '2024-10-18 17:27:39', '2024-10-18 17:27:39'),
(15, 2, 5, 'true', 180000, '2024-10-18 17:28:34', '2024-10-18 17:28:34'),
(16, 2, 5, 'true', 180000, '2024-10-18 17:28:53', '2024-10-18 17:28:53');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchantId` (`merchantId`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `productId` (`productId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
