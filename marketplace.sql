-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 18, 2024 at 09:55 AM
-- Server version: 8.3.0
-- PHP Version: 8.3.6

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(2, 'beni customer', 'benicustomer@gmail.com', '$2b$10$aOsLan0efM4Icq4IPTnch.Nvy.xmiEWqryEH4FwqZZVApz7sxjxa.', '2024-10-18 09:13:17', '2024-10-18 09:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
CREATE TABLE IF NOT EXISTS `merchants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'beni merchant', 'benimerchant@gmail.com', '$2b$10$gYlgeNvZMg/DCgUEOMdF9ezqQAn99NbI8mL3XImImzBnsI.1Tqsyi', '2024-10-18 09:13:27', '2024-10-18 09:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `merchantId` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `merchantId` (`merchantId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `merchantId`, `createdAt`, `updatedAt`) VALUES
(1, 'tas', 1000, 1, '2024-10-18 09:28:05', '2024-10-18 09:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `total` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customerId` (`customerId`),
  KEY `productId` (`productId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customerId`, `productId`, `total`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 3000, '2024-10-18 09:31:50', '2024-10-18 09:31:50'),
(2, 2, 1, 63000000, '2024-10-18 09:34:41', '2024-10-18 09:34:41'),
(3, 2, 1, 63000000, '2024-10-18 09:38:24', '2024-10-18 09:38:24'),
(4, 2, 1, 630000, '2024-10-18 09:38:44', '2024-10-18 09:38:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
