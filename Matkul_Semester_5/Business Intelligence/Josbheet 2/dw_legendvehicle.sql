-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2025 at 01:53 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_legendvehicle`
--

-- --------------------------------------------------------

--
-- Table structure for table `dimcustomer`
--

CREATE TABLE `dimcustomer` (
  `id_dimCustomer` int(11) NOT NULL,
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `isCurrent` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimdate`
--

CREATE TABLE `dimdate` (
  `id_dimDate` int(11) NOT NULL,
  `date` date NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dimproduct`
--

CREATE TABLE `dimproduct` (
  `id_dimProduct` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `priorProductName` varchar(70) DEFAULT NULL,
  `productLine` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factorders`
--

CREATE TABLE `factorders` (
  `id_factorder` int(11) NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `id_dimProduct` int(11) NOT NULL,
  `id_dimCustomer` int(11) NOT NULL,
  `id_dimDate` int(11) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` decimal(10,2) NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dimcustomer`
--
ALTER TABLE `dimcustomer`
  ADD PRIMARY KEY (`id_dimCustomer`);

--
-- Indexes for table `dimdate`
--
ALTER TABLE `dimdate`
  ADD PRIMARY KEY (`id_dimDate`);

--
-- Indexes for table `dimproduct`
--
ALTER TABLE `dimproduct`
  ADD PRIMARY KEY (`id_dimProduct`);

--
-- Indexes for table `factorders`
--
ALTER TABLE `factorders`
  ADD PRIMARY KEY (`id_factorder`),
  ADD KEY `fk_factorders_dimproduct` (`id_dimProduct`),
  ADD KEY `fk_factorders_dimcustomer` (`id_dimCustomer`),
  ADD KEY `fk_factorders_dimdate` (`id_dimDate`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dimcustomer`
--
ALTER TABLE `dimcustomer`
  MODIFY `id_dimCustomer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimdate`
--
ALTER TABLE `dimdate`
  MODIFY `id_dimDate` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dimproduct`
--
ALTER TABLE `dimproduct`
  MODIFY `id_dimProduct` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factorders`
--
ALTER TABLE `factorders`
  MODIFY `id_factorder` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factorders`
--
ALTER TABLE `factorders`
  ADD CONSTRAINT `fk_factorders_dimcustomer` FOREIGN KEY (`id_dimCustomer`) REFERENCES `dimcustomer` (`id_dimCustomer`),
  ADD CONSTRAINT `fk_factorders_dimdate` FOREIGN KEY (`id_dimDate`) REFERENCES `dimdate` (`id_dimDate`),
  ADD CONSTRAINT `fk_factorders_dimproduct` FOREIGN KEY (`id_dimProduct`) REFERENCES `dimproduct` (`id_dimProduct`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
