-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2020 at 02:28 AM
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
CREATE DATABASE IF NOT EXISTS `posdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `posdb`;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE IF NOT EXISTS `Admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `GenderID` int(11) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `EMail` varchar(50) DEFAULT NULL,
  `Address` text NOT NULL,
  `JoinDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `RoleID` int(11) NOT NULL,
  `Password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `RoleID` (`RoleID`),
  KEY `GenderID` (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`AdminID`, `FullName`, `GenderID`, `PhoneNumber`, `EMail`, `Address`, `JoinDate`, `RoleID`, `Password`) VALUES
(1, 'Sergey Dmitriev', 1, '087623456745', 'sergeydmitry@gmail.com', 'Stalingrad', '2020-10-03 08:41:39', 1, '514785628'),
(2, 'Karunia Awal Ramadhan', 1, '083862046969', 'karuniaawalramadhan96@gmail.com', 'Bandelan - Taman', '2020-10-13 11:47:08', 1, '853478910');

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
  `EMail` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

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
  `Stock` smallint(6) DEFAULT 0,
  `UnitID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `ExpireDate` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `UnitID` (`UnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ProductID`, `BarcodeID`, `ProdName`, `SellPrice`, `CostPrice`, `Netto`, `Stock`, `UnitID`, `SupplierID`, `ExpireDate`) VALUES
(1, '8993035123108', 'Pro-AC Biosulfur Soap', 9700, 7700, '65g', 55, 1, 5, '2023-11-01'),
(2, '4987176018083', 'Vicks Inhaler', 15000, 12500, '65g', 55, 1, 5, '2022-12-01'),
(3, '8996001440354', 'Minute M. NB Org 300', 7200, 6200, '65g', 55, 1, 5, '2021-03-18'),
(4, '8996001440355', 'Malkist Roma Cracker', 5500, 4500, '65g', 55, 1, 5, '2021-02-03'),
(5, '8996001440356', 'Minute M. NB Mangga ', 7500, 6500, '65g', 55, 1, 5, '2021-02-04'),
(6, '8996001440357', 'Minute M. Pulpy Orange', 7500, 6500, '65g', 55, 1, 5, '2021-02-05'),
(7, '8996001440358', 'Nissin Ramen ', 13500, 12000, '65g', 55, 1, 5, '2021-02-06'),
(8, '8996001440359', 'Indomilk Choco Avocado', 6000, 5500, '65g', 55, 1, 5, '2021-02-07'),
(9, '8996001440360', 'Sprite Lemon Water', 4500, 3500, '65g', 55, 1, 5, '2021-02-08'),
(10, '8996001440361', 'Mr. Bread Roti Choco', 6000, 5500, '65g', 55, 1, 5, '2021-02-09'),
(11, '8996001440362', 'Sidomuncul Susu Jahe', 15500, 14000, '65g', 55, 1, 5, '2021-02-10'),
(12, '8996001440363', 'Roma Sari Gandum', 12500, 11500, '65g', 55, 1, 5, '2021-02-11'),
(13, '8996001440364', 'Malkist Roma Keju', 6500, 5500, '65g', 55, 1, 5, '2021-02-12'),
(14, '8996001440365', 'Malkist Roma Sandwich', 6500, 5500, '65g', 55, 1, 5, '2021-02-13'),
(15, '8996001440366', 'Sari Roti Sobek Choco', 20000, 19000, '65g', 55, 1, 5, '2021-02-14'),
(16, '8996001440367', 'Kapal Api Special Mix 1 Renceng', 15000, 13500, '65g', 5, 1, 5, '2021-02-15'),
(17, '8996001440368', 'ABC Kopi Susu 1 Renceng', 15000, 13500, '65g', 5, 1, 5, '2021-02-15'),
(18, '8996001440369', 'Pilus Kacang Garuda', 17500, 16000, '65g', 5, 1, 5, '2021-02-16'),
(19, '8996001440370', 'Pilus Kacang Sukro', 17500, 16000, '65g', 5, 1, 5, '2021-02-17'),
(20, '8996001440371', 'Pilus Kacang Garuda Hot Pedas', 17500, 16000, '65g', 5, 1, 5, '2021-02-18'),
(21, '8996001440372', 'Indomie Rendang', 2500, 1200, '65g', 5, 1, 5, '2021-02-19'),
(22, '8996001440373', 'Indomie Seblak Hot Jeletot', 2500, 1200, '65g', 5, 1, 5, '2021-02-20'),
(23, '8996001440374', 'Indomie Ayam Bawang', 2500, 1200, '65g', 5, 1, 5, '2021-02-21'),
(24, '8996001440375', 'Malkist Roma Abon', 5500, 4500, '65g', 5, 1, 5, '2022-05-27'),
(25, '8996001440376', 'Coca Cola 1 Liter', 23500, 21000, '65g', 5, 1, 5, '2022-05-28'),
(26, '8996001440377', 'Aqua Botol 250 ML', 3500, 2000, '65g', 5, 1, 5, '2022-05-29'),
(27, '8996001440378', 'Bintang Zero 0,0% Alcohol', 9900, 8500, '65g', 5, 1, 5, '2022-05-30'),
(28, '8996001440379', 'Sprite 350 ML', 7500, 6000, '65g', 5, 1, 5, '2022-05-31'),
(29, '8996001440380', 'Tebs Tea Soda', 9900, 8500, '65g', 5, 1, 5, '2022-06-01'),
(30, '8996001440381', 'Choco Dairy Milk', 12500, 11000, '65g', 5, 1, 5, '2022-06-02'),
(31, '8996001440382', 'Kitkat Choco', 6500, 5500, '65g', 5, 1, 5, '2022-06-03'),
(32, '8996001440383', 'Roma Kelapa', 7000, 5500, '65g', 5, 1, 5, '2022-06-04'),
(33, '8996001440384', 'Monde Butter Cookies', 29500, 28000, '65g', 5, 1, 5, '2022-06-05'),
(34, '8996001440385', 'Egg Roll Serena', 29500, 28000, '65g', 5, 1, 5, '2022-06-06'),
(35, '8996001440386', 'Nissin Wafer', 9500, 8000, '65g', 5, 1, 5, '2022-06-07'),
(36, '8996001440387', 'Nissin Sus Snack', 9500, 8000, '65g', 5, 1, 5, '2022-06-08'),
(37, '8996001440388', 'Oreo Choco ', 9500, 8000, '65g', 5, 1, 5, '2022-06-09'),
(38, '8996001440389', 'Oreo Blueberry Cool ', 9500, 8000, '65g', 5, 1, 5, '2022-06-10'),
(39, '8996001440390', 'Gilus Mix Rasa Aren 1 Renceng', 11500, 10500, '65g', 5, 1, 5, '2022-06-12'),
(40, '8996001440391', 'Gilus Mix Rasa Coklat 1 Renceng', 11500, 10500, '65g', 5, 1, 5, '2022-06-13'),
(41, '8996001440392', 'Gilus Mix Rasa Pandan 1 Renceng', 11500, 10500, '65g', 5, 1, 5, '2022-06-14'),
(42, '8996001440393', 'Torabika Cappucino 1 Renceng', 11500, 10500, '65g', 5, 1, 5, '2022-06-15'),
(43, '8996001440394', 'MSI GE Raider 9GSE', 32999000, 30000000, '1Kg', 5, 5, 5, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
CREATE TABLE IF NOT EXISTS `Stock` (
  `NotesID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `Unit` varchar(10) NOT NULL,
  `StockIn` int(11) NOT NULL,
  `StockOut` int(11) NOT NULL,
  `CostPrice` int(11) NOT NULL,
  PRIMARY KEY (`NotesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
CREATE TABLE IF NOT EXISTS `Suppliers` (
  `SupID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `EMail` varchar(50) DEFAULT NULL,
  `Faximile` varchar(50) NOT NULL,
  PRIMARY KEY (`SupID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Suppliers`
--

INSERT INTO `Suppliers` (`SupID`, `CompanyName`, `Address`, `City`, `District`, `ZipCode`, `PhoneNumber`, `Contact`, `EMail`, `Faximile`) VALUES
(1, 'PT. Bukit Perak Indonesia', 'Jl. Raya Semarang Kendal Km 10.5', 'Semarang', NULL, '', '', 'Gita', NULL, ''),
(2, 'PT. Pabrik Kertas Tjiwi Kimia Tbk.', 'Jl. Raya Surabaya-Mojokerto Km 44 Indonesia', 'Surabaya', NULL, '', '08001368368', 'Riska', 'csd_cmi@app.co.id', ''),
(3, 'PT. Darya Varia', 'Citeureup-Bogor Indonesia', 'Bogor', 'Citeureup', '', '031900291', 'Novie', NULL, ''),
(4, 'PT. Kalbe Farma', 'Bekasi-Indonesia', 'Bekasi', NULL, '876452', '', 'Nuno', NULL, ''),
(5, 'PT. ABCD', 'Stalingrad', 'Stalingrad', 'Stalingrad', '', '75286185689', 'Zukhov', NULL, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vAdmin`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vAdmin`;
CREATE TABLE IF NOT EXISTS `vAdmin` (
`AdminID` int(11)
,`FullName` varchar(30)
,`Gender` varchar(20)
,`Phone` varchar(20)
,`EMail` varchar(50)
,`Address` text
,`Role` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vEmployees`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vEmployees`;
CREATE TABLE IF NOT EXISTS `vEmployees` (
`EmpID` int(11)
,`FirstName` varchar(25)
,`MidName` varchar(25)
,`LastName` varchar(25)
,`PhoneNumber` varchar(15)
,`EMail` varchar(50)
,`GenderName` varchar(20)
,`RoleName` varchar(25)
,`Address` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vOrdersDetail`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vOrdersDetail`;
CREATE TABLE IF NOT EXISTS `vOrdersDetail` (
`OrderID` int(11)
,`OrderDate` date
,`Time` time
,`Cashier` varchar(25)
,`Suppliers` varchar(100)
,`ProductID` int(11)
,`Products` varchar(50)
,`CostPrice` int(11)
,`Qty` int(11)
,`Freight` int(11)
,`TotalPrice` int(11)
,`Subtotal` int(11)
);

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
,`Supplier` varchar(100)
,`TglKadaluarsa` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vSaleInvoice`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vSaleInvoice`;
CREATE TABLE IF NOT EXISTS `vSaleInvoice` (
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
-- Stand-in structure for view `vSalesDetail`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vSalesDetail`;
CREATE TABLE IF NOT EXISTS `vSalesDetail` (
`SaleID` int(11)
,`SaleDate` date
,`Cashier` varchar(25)
,`Customers` varchar(50)
,`ProductID` int(11)
,`Product` varchar(50)
,`SellPrice` int(11)
,`Qty` int(11)
,`Total` int(11)
,`QtyTotal` int(11)
,`MTotal` int(11)
,`MCash` int(11)
,`MReturn` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `vAdmin`
--
DROP TABLE IF EXISTS `vAdmin`;

DROP VIEW IF EXISTS `vAdmin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vAdmin`  AS  select `ad`.`AdminID` AS `AdminID`,`ad`.`FullName` AS `FullName`,`gdr`.`GenderName` AS `Gender`,`ad`.`PhoneNumber` AS `Phone`,`ad`.`EMail` AS `EMail`,`ad`.`Address` AS `Address`,`rol`.`RoleName` AS `Role` from ((`Admin` `ad` join `Gender` `gdr` on(`ad`.`GenderID` = `gdr`.`GenderID`)) join `Role` `rol` on(`ad`.`RoleID` = `rol`.`RoleID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vEmployees`
--
DROP TABLE IF EXISTS `vEmployees`;

DROP VIEW IF EXISTS `vEmployees`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vEmployees`  AS  select `emp`.`EmpID` AS `EmpID`,`emp`.`FirstName` AS `FirstName`,`emp`.`MidName` AS `MidName`,`emp`.`LastName` AS `LastName`,`emp`.`PhoneNumber` AS `PhoneNumber`,`emp`.`EMail` AS `EMail`,`Gender`.`GenderName` AS `GenderName`,`Role`.`RoleName` AS `RoleName`,`emp`.`Address` AS `Address` from ((`Employees` `emp` join `Gender` on(`emp`.`GenderID` = `Gender`.`GenderID`)) join `Role` on(`emp`.`RoleID` = `Role`.`RoleID`)) order by `emp`.`EmpID` ;

-- --------------------------------------------------------

--
-- Structure for view `vOrdersDetail`
--
DROP TABLE IF EXISTS `vOrdersDetail`;

DROP VIEW IF EXISTS `vOrdersDetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vOrdersDetail`  AS  select `Orders`.`OrderID` AS `OrderID`,`Orders`.`OrderDate` AS `OrderDate`,`Orders`.`Time` AS `Time`,`Employees`.`FirstName` AS `Cashier`,`Suppliers`.`CompanyName` AS `Suppliers`,`OrdersDetail`.`ProductID` AS `ProductID`,`Products`.`ProdName` AS `Products`,`Products`.`CostPrice` AS `CostPrice`,`OrdersDetail`.`Qty` AS `Qty`,`Orders`.`Freight` AS `Freight`,`OrdersDetail`.`Total` AS `TotalPrice`,`Orders`.`Subtotal` AS `Subtotal` from ((((`Orders` join `Employees` on(`Orders`.`EmpID` = `Employees`.`EmpID`)) join `Suppliers` on(`Orders`.`SupplierID` = `Suppliers`.`SupID`)) join `OrdersDetail` on(`Orders`.`OrderID` = `OrdersDetail`.`OrderID`)) join `Products` on(`OrdersDetail`.`ProductID` = `Products`.`ProductID`)) order by `Orders`.`OrderID` ;

-- --------------------------------------------------------

--
-- Structure for view `vProduct`
--
DROP TABLE IF EXISTS `vProduct`;

DROP VIEW IF EXISTS `vProduct`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vProduct`  AS  select `pro`.`ProductID` AS `IdBarang`,`pro`.`BarcodeID` AS `Barcode`,`pro`.`ProdName` AS `NamaBarang`,`pro`.`SellPrice` AS `HargaJual`,`pro`.`CostPrice` AS `HargaBeli`,`pro`.`Netto` AS `Netto`,`pro`.`Stock` AS `StokBarang`,`pnr`.`UnitName` AS `Satuan`,`spl`.`CompanyName` AS `Supplier`,`pro`.`ExpireDate` AS `TglKadaluarsa` from ((`Products` `pro` join `ProdUnit` `pnr` on(`pro`.`UnitID` = `pnr`.`UnitID`)) join `Suppliers` `spl` on(`pro`.`SupplierID` = `spl`.`SupID`)) order by `pro`.`ProductID` ;

-- --------------------------------------------------------

--
-- Structure for view `vSaleInvoice`
--
DROP TABLE IF EXISTS `vSaleInvoice`;

DROP VIEW IF EXISTS `vSaleInvoice`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vSaleInvoice`  AS  select `s`.`SaleID` AS `SaleID`,`s`.`SaleDate` AS `SaleDate`,`s`.`Time` AS `Time`,`e`.`EmpID` AS `EmpID`,`e`.`FirstName` AS `Cashier`,`pd`.`ProdName` AS `Product`,`pd`.`SellPrice` AS `SellPrice`,`sd`.`Qty` AS `Qty`,`sd`.`Total` AS `Total`,`s`.`Freight` AS `TotalFreight`,`s`.`MTotal` AS `MTotal`,`s`.`MCash` AS `MCash`,`s`.`MReturn` AS `MReturn` from (((`Sales` `s` join `Employees` `e` on(`s`.`EmpID` = `e`.`EmpID`)) join `SalesDetail` `sd` on(`s`.`SaleID` = `sd`.`SaleID`)) join `Products` `pd` on(`sd`.`ProductID` = `pd`.`ProductID`)) order by `s`.`SaleID` ;

-- --------------------------------------------------------

--
-- Structure for view `vSalesDetail`
--
DROP TABLE IF EXISTS `vSalesDetail`;

DROP VIEW IF EXISTS `vSalesDetail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vSalesDetail`  AS  select `Sales`.`SaleID` AS `SaleID`,`Sales`.`SaleDate` AS `SaleDate`,`Employees`.`FirstName` AS `Cashier`,`Customers`.`CustName` AS `Customers`,`SalesDetail`.`ProductID` AS `ProductID`,`Products`.`ProdName` AS `Product`,`Products`.`SellPrice` AS `SellPrice`,`SalesDetail`.`Qty` AS `Qty`,`SalesDetail`.`Total` AS `Total`,`Sales`.`Freight` AS `QtyTotal`,`Sales`.`MTotal` AS `MTotal`,`Sales`.`MCash` AS `MCash`,`Sales`.`MReturn` AS `MReturn` from ((((`Sales` join `Employees` on(`Sales`.`EmpID` = `Employees`.`EmpID`)) join `Customers` on(`Sales`.`CustID` = `Customers`.`CustID`)) join `SalesDetail` on(`Sales`.`SaleID` = `SalesDetail`.`SaleID`)) join `Products` on(`Products`.`ProductID` = `SalesDetail`.`ProductID`)) ;

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
