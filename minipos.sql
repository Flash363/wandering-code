-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 08, 2020 at 01:09 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minipos`
--
CREATE DATABASE IF NOT EXISTS `minipos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `minipos`;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE IF NOT EXISTS `Admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) DEFAULT NULL,
  `MiddleName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `FullName` varchar(30) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `GenderID` int(11) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `EMail` varchar(25) DEFAULT NULL,
  `Address` text NOT NULL,
  `JoinDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `RoleID` int(11) NOT NULL,
  `Password` varchar(10) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `RoleID` (`RoleID`),
  KEY `GenderID` (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`AdminID`, `FirstName`, `MiddleName`, `LastName`, `FullName`, `GenderID`, `PhoneNumber`, `EMail`, `Address`, `JoinDate`, `RoleID`, `Password`) VALUES
(1, 'Sergey', NULL, 'Dmitriev', 'Sergey Dmitriev', 1, '087623456745', 'sergeydmitry@gmail.com', 'Stalingrad', '2020-10-03 08:41:39', 1, '514785628');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers` (
  `CustID` int(11) NOT NULL AUTO_INCREMENT,
  `CustName` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` varchar(25) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `EMail` varchar(50) NOT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustID`, `CustName`, `Address`, `City`, `State`, `PostalCode`, `Phone`, `EMail`) VALUES
(1, 'Karunia Awal Ramadhan', 'Bandelan-Taman', 'Pemalang', 'Indonesia', '587611', '083862046969', 'karuniaawalramadhan96@gmail.com'),
(2, 'Umum', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
CREATE TABLE IF NOT EXISTS `Employees` (
  `EmpID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) DEFAULT NULL,
  `MidName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `EMail` varchar(30) DEFAULT NULL,
  `GenderID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `Address` text NOT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `GenderID` (`GenderID`),
  KEY `RoleID` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`EmpID`, `FirstName`, `MidName`, `LastName`, `PhoneNumber`, `EMail`, `GenderID`, `RoleID`, `Address`) VALUES
(1, 'Georgy', NULL, 'Zukhov', '87526742447', 'georgyzukhov@email.com', 1, 3, 'Moscow, Russia'),
(2, 'Karunia', 'Awal ', 'Ramadhan', '083862046969', 'ayuwokibyytess@gmail.com', 1, 3, 'Bandelan - Taman'),
(3, 'Intan', 'Putri', 'Apiliani', '75286185689', 'tzuriquwaki@gmail.com', 2, 3, 'Kaligelang'),
(4, 'FlashOP', NULL, NULL, '083862046969', 'flashop@1cak.com', 1, 3, 'Bandelan');

-- --------------------------------------------------------

--
-- Table structure for table `Gender`
--

DROP TABLE IF EXISTS `Gender`;
CREATE TABLE IF NOT EXISTS `Gender` (
  `GenderID` int(11) NOT NULL AUTO_INCREMENT,
  `GenderName` varchar(20) NOT NULL,
  PRIMARY KEY (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Gender`
--

INSERT INTO `Gender` (`GenderID`, `GenderName`) VALUES
(1, 'Laki - laki'),
(2, 'Perempuan'),
(3, 'Anonim');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `Time` time NOT NULL,
  `EmpID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `Freight` int(11) NOT NULL,
  `Subtotal` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `OrdersDetail`
--

DROP TABLE IF EXISTS `OrdersDetail`;
CREATE TABLE IF NOT EXISTS `OrdersDetail` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `BarcodeID` varchar(20) DEFAULT NULL,
  `ProdName` varchar(50) NOT NULL,
  `SellPrice` int(11) NOT NULL,
  `CostPrice` int(11) NOT NULL,
  `Netto` varchar(10) NOT NULL,
  `Stock` smallint(6) NOT NULL DEFAULT 0,
  `UnitID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `ManufacturBy` varchar(50) NOT NULL,
  `ExpireDate` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `UnitID` (`UnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ProductID`, `BarcodeID`, `ProdName`, `SellPrice`, `CostPrice`, `Netto`, `Stock`, `UnitID`, `SupplierID`, `ManufacturBy`, `ExpireDate`) VALUES
(1, '8993035123108', 'Pro-AC Biosulfur Soap', 9700, 7700, '65g', 1997, 1, 1, 'PT. Bukit Perak Indonesia', '2023-11-01'),
(2, '4987176018083', 'Vicks Inhaler', 15000, 12500, '65g', 1998, 1, 3, 'PT. Darya Varia', '2022-12-01'),
(3, '8996001440354', 'Minute M. NB Org 300', 7200, 6200, '65g', 1996, 1, 1, 'PT. NULL', '2021-03-18'),
(4, '8996001440355', 'Malkist Roma Cracker', 5500, 4500, '65g', 1993, 2, 2, 'PT. NULL', '2021-02-03'),
(5, '8996001440356', 'Minute M. NB Mangga ', 7500, 6500, '65g', 1994, 3, 1, 'PT. NULL', '2021-02-04'),
(6, '8996001440357', 'Minute M. Pulpy Orange', 7500, 6500, '65g', 1995, 3, 2, 'PT. NULL', '2021-02-05'),
(7, '8996001440358', 'Nissin Ramen ', 13500, 12000, '65g', 1996, 1, 1, 'PT. NULL', '2021-02-06'),
(8, '8996001440359', 'Indomilk Choco Avocado', 6000, 5500, '65g', 1997, 2, 2, 'PT. NULL', '2021-02-07'),
(9, '8996001440360', 'Sprite Lemon Water', 4500, 3500, '65g', 1996, 3, 1, 'PT. NULL', '2021-02-08'),
(10, '8996001440361', 'Mr. Bread Roti Choco', 6000, 5500, '65g', 1995, 2, 2, 'PT. NULL', '2021-02-09'),
(11, '8996001440362', 'Sidomuncul Susu Jahe', 15500, 14000, '65g', 1998, 1, 1, 'PT. NULL', '2021-02-10'),
(12, '8996001440363', 'Roma Sari Gandum', 12500, 11500, '65g', 1999, 2, 2, 'PT. NULL', '2021-02-11'),
(13, '8996001440364', 'Malkist Roma Keju', 6500, 5500, '65g', 1999, 1, 1, 'PT. NULL', '2021-02-12'),
(14, '8996001440365', 'Malkist Roma Sandwich', 6500, 5500, '65g', 1999, 2, 2, 'PT. NULL', '2021-02-13'),
(15, '8996001440366', 'Sari Roti Sobek Choco', 20000, 19000, '65g', 1999, 1, 1, 'PT. NULL', '2021-02-14'),
(16, '8996001440367', 'Kapal Api Special Mix 1 Renceng', 15000, 13500, '65g', 1999, 2, 2, 'PT. NULL', '2021-02-15'),
(17, '8996001440368', 'ABC Kopi Susu 1 Renceng', 15000, 13500, '65g', 1997, 1, 1, 'PT. NULL', '2021-02-15'),
(18, '8996001440369', 'Pilus Kacang Garuda', 17500, 16000, '65g', 1998, 2, 2, 'PT. NULL', '2021-02-16'),
(19, '8996001440370', 'Pilus Kacang Sukro', 17500, 16000, '65g', 1999, 1, 1, 'PT. NULL', '2021-02-17'),
(20, '8996001440371', 'Pilus Kacang Garuda Hot Pedas', 17500, 16000, '65g', 1999, 2, 2, 'PT. NULL', '2021-02-18'),
(21, '8996001440372', 'Indomie Rendang', 2500, 1200, '65g', 1999, 1, 1, 'PT. NULL', '2021-02-19'),
(22, '8996001440373', 'Indomie Seblak Hot Jeletot', 2500, 1200, '65g', 1999, 2, 2, 'PT. NULL', '2021-02-20'),
(23, '8996001440374', 'Indomie Ayam Bawang', 2500, 1200, '65g', 1999, 1, 1, 'PT. NULL', '2021-02-21'),
(24, '8996001440375', 'Malkist Roma Abon', 5500, 4500, '65g', 1999, 2, 2, 'PT. NULL', '2022-05-27'),
(25, '8996001440376', 'Coca Cola 1 Liter', 23500, 21000, '65g', 1995, 3, 1, 'PT. NULL', '2022-05-28'),
(26, '8996001440377', 'Aqua Botol 250 ML', 3500, 2000, '65g', 1999, 3, 2, 'PT. NULL', '2022-05-29'),
(27, '8996001440378', 'Bintang Zero 0,0% Alcohol', 9900, 8500, '65g', 1997, 13, 1, 'PT. NULL', '2022-05-30'),
(28, '8996001440379', 'Sprite 350 ML', 7500, 6000, '65g', 1995, 3, 2, 'PT. NULL', '2022-05-31'),
(29, '8996001440380', 'Tebs Tea Soda', 9900, 8500, '65g', 1998, 3, 1, 'PT. NULL', '2022-06-01'),
(30, '8996001440381', 'Choco Dairy Milk', 12500, 11000, '65g', 1995, 1, 2, 'PT. NULL', '2022-06-02'),
(31, '8996001440382', 'Kitkat Choco', 6500, 5500, '65g', 1997, 1, 1, 'PT. NULL', '2022-06-03'),
(32, '8996001440383', 'Roma Kelapa', 7000, 5500, '65g', 2000, 2, 2, 'PT. NULL', '2022-06-04'),
(33, '8996001440384', 'Monde Butter Cookies', 29500, 28000, '65g', 2000, 1, 1, 'PT. NULL', '2022-06-05'),
(34, '8996001440385', 'Egg Roll Serena', 29500, 28000, '65g', 1995, 2, 2, 'PT. NULL', '2022-06-06'),
(35, '8996001440386', 'Nissin Wafer', 9500, 8000, '65g', 1998, 1, 1, 'PT. NULL', '2022-06-07'),
(36, '8996001440387', 'Nissin Sus Snack', 9500, 8000, '65g', 1998, 2, 2, 'PT. NULL', '2022-06-08'),
(37, '8996001440388', 'Oreo Choco ', 9500, 8000, '65g', 1997, 1, 1, 'PT. NULL', '2022-06-09'),
(38, '8996001440389', 'Oreo Blueberry Cool ', 9500, 8000, '65g', 1995, 2, 2, 'PT. NULL', '2022-06-10'),
(39, '8996001440390', 'Gilus Mix Rasa Aren 1 Renceng', 11500, 10500, '65g', 1997, 1, 1, 'PT. NULL', '2022-06-12'),
(40, '8996001440391', 'Gilus Mix Rasa Coklat 1 Renceng', 11500, 10500, '65g', 1999, 2, 2, 'PT. NULL', '2022-06-13'),
(41, '8996001440392', 'Gilus Mix Rasa Pandan 1 Renceng', 11500, 10500, '65g', 2000, 1, 1, 'PT. NULL', '2022-06-14'),
(42, '8996001440393', 'Torabika Cappucino 1 Renceng', 11500, 10500, '65g', 2000, 2, 2, 'PT. NULL', '2022-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `ProdUnit`
--

DROP TABLE IF EXISTS `ProdUnit`;
CREATE TABLE IF NOT EXISTS `ProdUnit` (
  `UnitID` int(11) NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(30) NOT NULL,
  PRIMARY KEY (`UnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ProdUnit`
--

INSERT INTO `ProdUnit` (`UnitID`, `UnitName`) VALUES
(1, 'PCS'),
(2, 'SAK'),
(3, 'BOTOL'),
(4, 'BUAH'),
(5, 'DUS'),
(6, 'TABUNG'),
(7, 'GALON'),
(8, 'PACK'),
(9, 'SACHET'),
(10, 'BKS'),
(11, 'PSG'),
(12, 'PAKET'),
(13, 'KALENG');

-- --------------------------------------------------------

--
-- Table structure for table `Promo`
--

DROP TABLE IF EXISTS `Promo`;
CREATE TABLE IF NOT EXISTS `Promo` (
  `DiscountID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscName` varchar(50) NOT NULL,
  `DiscCode` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `DiscountOn` enum('Item','Sales') NOT NULL,
  `MinimumSpend` int(11) NOT NULL,
  `AutoApply` enum('Y','N') NOT NULL,
  `AutoActive` enum('Y','N') NOT NULL,
  `NeverExpire` enum('Y','N') NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Promo`
--

INSERT INTO `Promo` (`DiscountID`, `DiscName`, `DiscCode`, `StartDate`, `EndDate`, `DiscountOn`, `MinimumSpend`, `AutoApply`, `AutoActive`, `NeverExpire`) VALUES
(1, 'Beli 1 Gratis 1', 'TANGGALTUA', '2020-10-25', '2020-10-31', 'Item', 15000, 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
CREATE TABLE IF NOT EXISTS `Role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(25) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`RoleID`, `RoleName`) VALUES
(1, 'Administrator'),
(2, 'Pemilik'),
(3, 'Kasir'),
(4, 'Pengirim');

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
CREATE TABLE IF NOT EXISTS `Sales` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `SaleDate` date NOT NULL,
  `Time` time NOT NULL,
  `EmpID` int(11) NOT NULL,
  `CustID` int(11) NOT NULL,
  `Freight` int(11) NOT NULL,
  `DiscID` int(11) NOT NULL,
  `MTotal` int(11) NOT NULL,
  `MCash` int(11) NOT NULL,
  `MReturn` int(11) NOT NULL,
  PRIMARY KEY (`SaleID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`SaleID`, `SaleDate`, `Time`, `EmpID`, `CustID`, `Freight`, `DiscID`, `MTotal`, `MCash`, `MReturn`) VALUES
(1, '2020-10-07', '10:21:23', 1, 2, 8, 0, 71900, 75000, 3100),
(2, '2020-10-07', '19:46:05', 2, 2, 5, 0, 58900, 60000, 1100),
(3, '2020-10-07', '21:02:37', 1, 2, 2, 0, 59000, 60000, 1000),
(4, '2020-10-08', '08:40:21', 1, 2, 2, 0, 17000, 20000, 3000),
(5, '2020-10-08', '11:59:15', 1, 2, 1, 0, 17500, 20000, 2500),
(6, '2020-10-08', '12:00:51', 1, 2, 2, 0, 22500, 25000, 2500),
(7, '2020-10-08', '12:28:36', 1, 2, 3, 0, 33900, 40000, 6100),
(8, '2020-10-08', '12:28:36', 1, 2, 17, 0, 188700, 190000, 1300),
(9, '2020-10-08', '13:40:34', 1, 2, 2, 0, 12000, 15000, 3000),
(10, '2020-10-08', '13:53:36', 2, 2, 2, 0, 10000, 10000, 0),
(11, '2020-10-08', '13:53:36', 2, 2, 3, 0, 33500, 35000, 1500),
(12, '2020-10-08', '13:57:43', 1, 2, 1, 0, 12500, 15000, 2500),
(13, '2020-10-08', '16:08:29', 1, 2, 12, 0, 110400, 115000, 4600),
(14, '2020-10-08', '16:12:13', 3, 2, 10, 0, 111000, 115000, 4000),
(15, '2020-10-08', '16:24:03', 4, 2, 4, 0, 45000, 50000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `SalesDetail`
--

DROP TABLE IF EXISTS `SalesDetail`;
CREATE TABLE IF NOT EXISTS `SalesDetail` (
  `SaleID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SalesDetail`
--

INSERT INTO `SalesDetail` (`SaleID`, `ProductID`, `Qty`, `Total`) VALUES
(1, 1, 1, 9700),
(1, 2, 1, 15000),
(1, 3, 1, 7200),
(1, 4, 1, 5500),
(1, 5, 1, 7500),
(1, 6, 1, 7500),
(1, 7, 1, 13500),
(1, 8, 1, 6000),
(2, 27, 1, 9900),
(2, 38, 2, 19000),
(2, 31, 1, 6500),
(2, 25, 1, 23500),
(3, 34, 2, 59000),
(4, 28, 1, 7500),
(4, 35, 1, 9500),
(5, 18, 1, 17500),
(6, 17, 1, 15000),
(6, 28, 1, 7500),
(7, 30, 1, 12500),
(7, 29, 1, 9900),
(7, 39, 1, 11500),
(8, 3, 1, 7200),
(8, 4, 1, 5500),
(8, 5, 1, 7500),
(8, 6, 1, 7500),
(8, 7, 1, 13500),
(8, 8, 1, 6000),
(8, 9, 1, 4500),
(8, 10, 1, 6000),
(8, 11, 1, 15500),
(8, 13, 1, 6500),
(8, 14, 1, 6500),
(8, 15, 1, 20000),
(8, 16, 1, 15000),
(8, 17, 1, 15000),
(8, 18, 1, 17500),
(8, 19, 1, 17500),
(8, 20, 1, 17500),
(9, 23, 1, 2500),
(9, 35, 1, 9500),
(10, 26, 1, 3500),
(10, 31, 1, 6500),
(11, 25, 1, 23500),
(11, 21, 1, 2500),
(11, 28, 1, 7500),
(12, 30, 1, 12500),
(13, 1, 1, 9700),
(13, 2, 1, 15000),
(13, 3, 1, 7200),
(13, 4, 1, 5500),
(13, 5, 1, 7500),
(13, 6, 1, 7500),
(13, 7, 1, 13500),
(13, 8, 1, 6000),
(13, 9, 1, 4500),
(13, 10, 1, 6000),
(13, 11, 1, 15500),
(13, 12, 1, 12500),
(14, 28, 2, 15000),
(14, 31, 1, 6500),
(14, 4, 2, 11000),
(14, 25, 2, 47000),
(14, 30, 1, 12500),
(14, 36, 2, 19000),
(15, 22, 1, 2500),
(15, 7, 1, 13500),
(15, 25, 1, 23500),
(15, 24, 1, 5500);

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
CREATE TABLE IF NOT EXISTS `Suppliers` (
  `SupID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(25) DEFAULT NULL,
  `District` varchar(25) DEFAULT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `EMail` varchar(25) DEFAULT NULL,
  `Faximile` varchar(25) NOT NULL,
  PRIMARY KEY (`SupID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`SupID`, `CompanyName`, `Address`, `City`, `District`, `PostalCode`, `PhoneNumber`, `Contact`, `EMail`, `Faximile`) VALUES
(1, 'PT. Bukit Perak Indonesia', 'Jl. Raya Semarang Kendal Km 10.5', 'Semarang', NULL, '', '', 'Gita', NULL, ''),
(2, 'PT. Pabrik Kertas Tjiwi Kimia Tbk.', 'Jl. Raya Surabaya-Mojokerto Km 44 Indonesia', 'Surabaya', NULL, '', '08001368368', 'Riska', 'csd_cmi@app.co.id', ''),
(3, 'PT. Darya Varia', 'Citeureup-Bogor Indonesia', 'Bogor', 'Citeureup', '', '031900291', 'Novie', NULL, ''),
(4, 'PT. Kalbe Farma', 'Bekasi-Indonesia', 'Bekasi', NULL, '876452', '', 'Nuno', NULL, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vProduct`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vProduct`;
CREATE TABLE IF NOT EXISTS `vProduct` (
`IdBarang` int(11)
,`Barcode` varchar(20)
,`NamaBarang` varchar(50)
,`HargaJual` int(11)
,`HargaBeli` int(11)
,`Netto` varchar(10)
,`StokBarang` smallint(6)
,`Satuan` varchar(30)
,`Supplier` varchar(50)
,`TglKadaluarsa` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vSaleDetail`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vSaleDetail`;
CREATE TABLE IF NOT EXISTS `vSaleDetail` (
`SaleID` int(11)
,`SaleDate` date
,`Time` time
,`EmpID` int(11)
,`Cashier` varchar(25)
,`Product` varchar(50)
,`SellPrice` int(11)
,`Qty` int(11)
,`Total` int(11)
,`TotalFreight` int(11)
,`MTotal` int(11)
,`MCash` int(11)
,`MReturn` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `vProduct`
--
DROP TABLE IF EXISTS `vProduct`;

DROP VIEW IF EXISTS `vProduct`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vProduct`  AS  select `pro`.`ProductID` AS `IdBarang`,`pro`.`BarcodeID` AS `Barcode`,`pro`.`ProdName` AS `NamaBarang`,`pro`.`SellPrice` AS `HargaJual`,`pro`.`CostPrice` AS `HargaBeli`,`pro`.`Netto` AS `Netto`,`pro`.`Stock` AS `StokBarang`,`pnr`.`UnitName` AS `Satuan`,`spl`.`CompanyName` AS `Supplier`,`pro`.`ExpireDate` AS `TglKadaluarsa` from ((`Products` `pro` join `ProdUnit` `pnr` on(`pro`.`UnitID` = `pnr`.`UnitID`)) join `Suppliers` `spl` on(`pro`.`SupplierID` = `spl`.`SupID`)) order by `pro`.`ProductID` ;

-- --------------------------------------------------------

--
-- Structure for view `vSaleDetail`
--
DROP TABLE IF EXISTS `vSaleDetail`;

DROP VIEW IF EXISTS `vSaleDetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vSaleDetail`  AS  select `s`.`SaleID` AS `SaleID`,`s`.`SaleDate` AS `SaleDate`,`s`.`Time` AS `Time`,`e`.`EmpID` AS `EmpID`,`e`.`FirstName` AS `Cashier`,`pd`.`ProdName` AS `Product`,`pd`.`SellPrice` AS `SellPrice`,`sd`.`Qty` AS `Qty`,`sd`.`Total` AS `Total`,`s`.`Freight` AS `TotalFreight`,`s`.`MTotal` AS `MTotal`,`s`.`MCash` AS `MCash`,`s`.`MReturn` AS `MReturn` from (((`Sales` `s` join `Employees` `e` on(`s`.`EmpID` = `e`.`EmpID`)) join `SalesDetail` `sd` on(`s`.`SaleID` = `sd`.`SaleID`)) join `Products` `pd` on(`sd`.`ProductID` = `pd`.`ProductID`)) order by `s`.`SaleID` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Admin`
--
ALTER TABLE `Admin`
  ADD CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`RoleID`),
  ADD CONSTRAINT `Admin_ibfk_2` FOREIGN KEY (`GenderID`) REFERENCES `Gender` (`GenderID`);

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `Employees_ibfk_1` FOREIGN KEY (`GenderID`) REFERENCES `Gender` (`GenderID`),
  ADD CONSTRAINT `Employees_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`RoleID`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupID`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`UnitID`) REFERENCES `ProdUnit` (`UnitID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
