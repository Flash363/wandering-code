-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2020 at 02:31 AM
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
-- Database: `db_spp`
--
CREATE DATABASE IF NOT EXISTS `sppdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sppdb`;

-- --------------------------------------------------------

--
-- Table structure for table `Grade`
--

DROP TABLE IF EXISTS `Grade`;
CREATE TABLE IF NOT EXISTS `Grade` (
  `ClassID` int(10) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(30) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Grade`
--

INSERT INTO `Grade` (`ClassID`, `ClassName`) VALUES
(3, 'X AKL 1'),
(4, 'X AKL 2'),
(5, 'X AKL 3'),
(6, 'X AKL 4'),
(7, 'XI AKL 1'),
(8, 'XI AKL 2'),
(9, 'XI AKL 3'),
(10, 'XI AKL 4'),
(11, 'XII AKL 1'),
(12, 'XII AKL 2'),
(13, 'XII AKL 3'),
(14, 'XII AKL 4'),
(15, 'X OTKP 1'),
(16, 'X OTKP 2'),
(17, 'X OTKP 3'),
(18, 'X OTKP 4'),
(19, 'XI OTKP 1'),
(20, 'XI OTKP 2'),
(21, 'XI OTKP 3'),
(22, 'XI OTKP 4'),
(23, 'XII OTKP 1'),
(24, 'XII OTKP 2'),
(25, 'XII OTKP 3'),
(26, 'XII OTKP 4'),
(27, 'X TKJ 1'),
(28, 'X TKJ 2'),
(29, 'X TKJ 3'),
(30, 'X TKJ 4'),
(31, 'XI TKJ 1'),
(32, 'XI TKJ 2'),
(33, 'XI TKJ 3'),
(34, 'XI TKJ 4'),
(35, 'XII TKJ 1'),
(36, 'XII TKJ 2'),
(37, 'XII TKJ 3'),
(38, 'XII TKJ 4'),
(39, 'X RPL 1'),
(40, 'X RPL 2'),
(41, 'X RPL 3'),
(42, 'X RPL 4'),
(43, 'XI RPL 1'),
(44, 'XI RPL 2'),
(45, 'XI RPL 3'),
(46, 'XI RPL 4'),
(47, 'XII RPL 1'),
(48, 'XII RPL 2'),
(49, 'XII RPL 3'),
(50, 'XII RPL 4'),
(51, 'X MM 1'),
(52, 'X MM 2'),
(53, 'X MM 3'),
(54, 'X MM 4'),
(55, 'XI MM 1'),
(56, 'XI MM 2'),
(57, 'XI MM 3'),
(58, 'XI MM 4'),
(59, 'XII MM 1'),
(60, 'XII MM 2'),
(61, 'XII MM 3'),
(62, 'XII MM 4'),
(64, 'XI CS 1');

-- --------------------------------------------------------

--
-- Table structure for table `Level`
--

DROP TABLE IF EXISTS `Level`;
CREATE TABLE IF NOT EXISTS `Level` (
  `IdLevel` int(11) NOT NULL AUTO_INCREMENT,
  `LevelName` enum('Administator','Staff','Siswa','') NOT NULL,
  PRIMARY KEY (`IdLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Level`
--

INSERT INTO `Level` (`IdLevel`, `LevelName`) VALUES
(1, 'Administator'),
(2, 'Staff'),
(4, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `MoneyBox`
--

DROP TABLE IF EXISTS `MoneyBox`;
CREATE TABLE IF NOT EXISTS `MoneyBox` (
  `MBoxID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `GradeID` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`MBoxID`),
  KEY `GradeID` (`GradeID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MoneyBox`
--

INSERT INTO `MoneyBox` (`MBoxID`, `StudentID`, `GradeID`, `Balance`) VALUES
(1, 1, 1, 68000),
(2, 2, 2, 25000),
(3, 3, 3, 20000),
(4, 4, 4, 22000),
(5, 5, 5, 0),
(6, 6, 6, 10000),
(7, 7, 7, 9000),
(8, 8, 8, 5000),
(9, 9, 9, 15000),
(10, 10, 10, 30000),
(11, 11, 11, 99530000),
(12, 12, 12, 9000),
(13, 13, 13, 0),
(14, 14, 14, 0),
(15, 15, 15, 90000),
(16, 16, 16, 0),
(17, 17, 17, 0),
(18, 18, 18, 0),
(19, 19, 19, 0),
(20, 20, 20, 0),
(21, 21, 21, 0),
(22, 22, 22, 0),
(23, 23, 23, 0),
(24, 24, 24, 2000),
(25, 25, 25, 1000),
(26, 26, 26, 0),
(27, 27, 27, 0),
(28, 28, 28, 2000),
(29, 29, 29, 0),
(30, 30, 30, 1000),
(31, 31, 31, 7187500),
(32, 32, 32, 11000),
(34, 46, 47, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `Nominal`
--

DROP TABLE IF EXISTS `Nominal`;
CREATE TABLE IF NOT EXISTS `Nominal` (
  `NomID` int(10) NOT NULL AUTO_INCREMENT,
  `SkillCatID` int(11) NOT NULL,
  `AmountPay` int(11) NOT NULL,
  `StartYear` date NOT NULL,
  `EndYear` date NOT NULL,
  PRIMARY KEY (`NomID`),
  KEY `SkillCatID` (`SkillCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Nominal`
--

INSERT INTO `Nominal` (`NomID`, `SkillCatID`, `AmountPay`, `StartYear`, `EndYear`) VALUES
(1, 1, 165000, '2020-08-01', '2021-01-01'),
(2, 2, 160000, '2020-06-01', '2021-06-01'),
(3, 2, 150000, '2020-06-01', '2021-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `Osis`
--

DROP TABLE IF EXISTS `Osis`;
CREATE TABLE IF NOT EXISTS `Osis` (
  `OsisID` int(11) NOT NULL AUTO_INCREMENT,
  `SkillCatID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `AmountPay` int(11) NOT NULL,
  PRIMARY KEY (`OsisID`),
  KEY `SkillCatID` (`SkillCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Osis`
--

INSERT INTO `Osis` (`OsisID`, `SkillCatID`, `StartDate`, `EndDate`, `AmountPay`) VALUES
(1, 1, '2020-06-01', '2021-06-01', 165000),
(2, 2, '2020-06-01', '2021-06-01', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
CREATE TABLE IF NOT EXISTS `Payment` (
  `PayID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `PaymentType` enum('Bulanan','Semester','Tahunan') NOT NULL,
  `StaffID` int(10) NOT NULL,
  `StudentID` int(10) NOT NULL,
  `PayMonth` varchar(10) NOT NULL,
  `PayYear` year(4) NOT NULL,
  `MSubtotals` int(11) NOT NULL,
  `MCash` int(11) DEFAULT NULL,
  `MReturn` int(11) DEFAULT NULL,
  PRIMARY KEY (`PayID`),
  KEY `StaffID` (`StaffID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PaymentDetail`
--

DROP TABLE IF EXISTS `PaymentDetail`;
CREATE TABLE IF NOT EXISTS `PaymentDetail` (
  `PayID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Month` varchar(10) NOT NULL,
  `Nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PBalance`
--

DROP TABLE IF EXISTS `PBalance`;
CREATE TABLE IF NOT EXISTS `PBalance` (
  `IdPBalance` int(11) NOT NULL AUTO_INCREMENT,
  `DateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `StaffID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `AmountPay` int(11) NOT NULL,
  PRIMARY KEY (`IdPBalance`),
  KEY `StaffID` (`StaffID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PracticalWork`
--

DROP TABLE IF EXISTS `PracticalWork`;
CREATE TABLE IF NOT EXISTS `PracticalWork` (
  `PwID` int(11) NOT NULL AUTO_INCREMENT,
  `SkillCatID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `AmountPay` int(11) NOT NULL,
  PRIMARY KEY (`PwID`),
  KEY `SkillCatID` (`SkillCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PracticalWork`
--

INSERT INTO `PracticalWork` (`PwID`, `SkillCatID`, `StartDate`, `EndDate`, `AmountPay`) VALUES
(1, 1, '2020-06-01', '2021-06-01', 165000),
(2, 2, '2020-06-01', '2021-06-01', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `Practice`
--

DROP TABLE IF EXISTS `Practice`;
CREATE TABLE IF NOT EXISTS `Practice` (
  `PracticeID` int(11) NOT NULL AUTO_INCREMENT,
  `SkillCatID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `AmountPay` int(11) NOT NULL,
  PRIMARY KEY (`PracticeID`),
  KEY `SkillCatID` (`SkillCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Practice`
--

INSERT INTO `Practice` (`PracticeID`, `SkillCatID`, `StartDate`, `EndDate`, `AmountPay`) VALUES
(1, 1, '2020-06-01', '2021-06-01', 165000),
(2, 2, '2020-06-01', '2021-06-01', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `SkillCategory`
--

DROP TABLE IF EXISTS `SkillCategory`;
CREATE TABLE IF NOT EXISTS `SkillCategory` (
  `CatID` int(11) NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SkillCategory`
--

INSERT INTO `SkillCategory` (`CatID`, `CatName`) VALUES
(1, 'Bisnis Dan Manajemen'),
(2, 'Teknik Informasi Dan Teknologi'),
(3, 'Elektro');

-- --------------------------------------------------------

--
-- Table structure for table `SkillCompetetion`
--

DROP TABLE IF EXISTS `SkillCompetetion`;
CREATE TABLE IF NOT EXISTS `SkillCompetetion` (
  `CsID` int(11) NOT NULL AUTO_INCREMENT,
  `SkillCatID` int(11) NOT NULL,
  `CsName` varchar(10) NOT NULL,
  `Translasi` varchar(50) NOT NULL,
  PRIMARY KEY (`CsID`),
  KEY `SkillCatID` (`SkillCatID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SkillCompetetion`
--

INSERT INTO `SkillCompetetion` (`CsID`, `SkillCatID`, `CsName`, `Translasi`) VALUES
(1, 2, 'RPL', 'Rekayasa Perangkat Lunak'),
(2, 2, 'TKJ', 'Teknik Komputer Dan Jaringan'),
(3, 2, 'MM', 'Multimedia'),
(4, 1, 'AKL', 'Akutansi Keuangan Dan Lembaga'),
(5, 1, 'OTKP', 'Otorisasi Tata Kelola Perkantoran');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
CREATE TABLE IF NOT EXISTS `Staff` (
  `StaffID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `BirthDate` date NOT NULL,
  `PlaceBirth` varchar(50) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Address` text NOT NULL,
  `Telephone` varchar(15) NOT NULL,
  `IdLevel` int(11) NOT NULL,
  `IdStaffType` int(10) NOT NULL,
  `Password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `IdLevel` (`IdLevel`),
  KEY `IdStaffType` (`IdStaffType`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`StaffID`, `Name`, `BirthDate`, `PlaceBirth`, `Sex`, `Address`, `Telephone`, `IdLevel`, `IdStaffType`, `Password`) VALUES
(1, 'Dio Brando', '2020-08-13', 'Pemalang', 'Laki-laki', 'Muda Muda Muda Muda Muda Muda Muda Muda', '0987654214', 4, 1, '123456789'),
(3, 'Sergey Dmitriev', '2020-08-15', 'Russia', 'Laki-laki', 'Slavv', '735651517572', 1, 1, '12345'),
(4, 'Karunia Awal Ramadhan', '2020-08-23', 'Pemalang', 'Laki-laki', 'Bandelan - Taman', '098712341357', 2, 2, '0987654321'),
(6, 'Steve Rogers', '2020-10-29', 'Russia', 'Laki-laki', 'Slavvv', '874213468753', 1, 1, 'zxcvbnm'),
(7, 'Ethan Hunt', '1990-09-04', 'Finlandia', 'Laki-laki', 'Finlandia', '09876532', 4, 3, '214125151'),
(8, 'Bruce Wayne', '1989-09-01', 'Pemalang', 'Laki-laki', 'Test', '0987341251', 1, 1, '123456789'),
(9, 'Joseph Joestar', '1820-09-16', 'Unknown', 'Laki-laki', 'Ora Ora Ora Ora Ora Ora Ora Ora', '976237501', 1, 1, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `StaffType`
--

DROP TABLE IF EXISTS `StaffType`;
CREATE TABLE IF NOT EXISTS `StaffType` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `StaffType`
--

INSERT INTO `StaffType` (`Id`, `Name`) VALUES
(1, 'Administartor'),
(2, 'Staff'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
CREATE TABLE IF NOT EXISTS `Student` (
  `StudentID` int(10) NOT NULL AUTO_INCREMENT,
  `NISN` varchar(25) NOT NULL,
  `NIS` varchar(25) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `TelpNo` varchar(25) NOT NULL,
  `Address` text NOT NULL,
  `ClassID` int(11) NOT NULL,
  `SppID` int(11) NOT NULL,
  `MBoxID` int(11) NOT NULL,
  `OsisID` int(11) NOT NULL,
  `PwID` int(11) NOT NULL,
  `PcID` int(11) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `ClassID` (`ClassID`),
  KEY `MBoxID` (`MBoxID`),
  KEY `OsisID` (`OsisID`),
  KEY `PcID` (`PcID`),
  KEY `PwID` (`PwID`),
  KEY `SppID` (`SppID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`StudentID`, `NISN`, `NIS`, `Name`, `Gender`, `TelpNo`, `Address`, `ClassID`, `SppID`, `MBoxID`, `OsisID`, `PwID`, `PcID`) VALUES
(1, '21042020001', '7822', 'Agin Mukti Ikfanto', 'Laki-laki', '628351735264', 'Bandelan – Taman', 47, 1, 1, 1, 1, 1),
(2, '21042020002', '7823', 'Ahmad Yusuf K.A', 'Laki-laki', '628351735265', 'Bandelan – Taman', 47, 2, 2, 2, 2, 2),
(3, '21042020003', '7824', 'Andre Kurniawan', 'Laki-laki', '628351735266', 'Bandelan – Taman', 47, 1, 1, 1, 1, 1),
(4, '21042020006', '7827', 'Dewi Nurkhasanah', 'Perempuan', '628351735269', 'Bandelan – Taman', 47, 2, 2, 2, 2, 2),
(5, '21042020007', '7828', 'Dicky Hidayat R.', 'Laki-laki', '628351735270', 'Bandelan – Taman', 47, 1, 1, 1, 1, 1),
(6, '21042020008', '7829', 'Dika Febbi P.P', 'Laki-laki', '628351735271', 'Bandelan – Taman', 47, 2, 2, 2, 2, 2),
(7, '21042020009', '7830', 'Dzulfikar Aidhul Fath', 'Laki-laki', '628351735272', 'Bandelan – Taman', 47, 1, 1, 1, 1, 1),
(8, '21042020011', '7832', 'Ijab Mura', 'Laki-laki', '628351735274', 'Bandelan – Taman', 47, 1, 1, 1, 1, 2),
(9, '21042020013', '7834', 'Intan Putri Apriliani', 'Perempuan', '628351735276', 'Bandelan – Taman', 47, 1, 1, 1, 1, 1),
(10, '21042020014', '7835', 'Iqbal Syaeful Imam', 'Laki-laki', '628351735277', 'Bandelan – Taman', 47, 2, 2, 2, 2, 2),
(11, '21042020015', '7836', 'Karunia Awal Ramadhan', 'Laki-laki', '628351735278', 'Bandelan – Taman', 47, 1, 1, 1, 1, 1),
(12, '21042020016', '7837', 'Miftahul Jannah', 'Perempuan', '628351735279', 'Bandelan – Taman', 47, 2, 2, 2, 2, 2),
(13, '21042020017', '7838', 'Retno Dewi Anggraeni', 'Perempuan', '628351735280', 'Bandelan – Taman', 47, 2, 1, 1, 1, 1),
(14, '21042020018', '7839', 'Reza Tri Aminullah', 'Laki-laki', '628351735281', 'Bandelan – Taman', 47, 1, 2, 2, 2, 2),
(15, '21042020019', '7840', 'Riski Wulandari', 'Perempuan', '628351735282', 'Bandelan – Taman', 47, 2, 1, 1, 1, 1),
(16, '21042020020', '7841', 'Rizky Tegar Pratama', 'Laki-laki', '628351735283', 'Bandelan – Taman', 47, 1, 2, 2, 2, 2),
(17, '21042020021', '7842', 'Sahrul Rozikin', 'Laki-laki', '628351735284', 'Bandelan – Taman', 47, 2, 1, 1, 1, 1),
(18, '21042020022', '7843', 'Septiani', 'Perempuan', '628351735285', 'Bandelan – Taman', 47, 1, 2, 2, 2, 2),
(19, '21042020023', '7844', 'Serly Novia Yuliani', 'Perempuan', '628351735286', 'Bandelan – Taman', 47, 2, 1, 1, 1, 1),
(20, '21042020024', '7845', 'Silvi Nur Indah Sari', 'Perempuan', '628351735287', 'Bandelan – Taman', 47, 1, 2, 2, 2, 2),
(21, '21042020025', '7846', 'Silvia Nadila Ayu Pratiwi', 'Perempuan', '628351735288', 'Bandelan – Taman', 47, 2, 1, 1, 1, 1),
(22, '21042020026', '7847', 'Yoga Pramudita', 'Laki-laki', '628351735289', 'Bandelan – Taman', 47, 1, 2, 2, 2, 2),
(23, '21042020027', '7848', 'Yoshi Ardiansyah', 'Laki-laki', '628351735290', 'Bandelan – Taman', 47, 3, 1, 1, 1, 1),
(24, '21042020028', '7849', 'Harry Potter', 'Laki-laki', '628351735291', 'Bandelan – Taman', 47, 3, 2, 2, 2, 2),
(25, '21042020029', '7850', 'Ethan Hunt', 'Laki-laki', '628351735292', 'Bandelan – Taman', 47, 3, 1, 1, 1, 1),
(26, '21042020030', '7851', 'Christoper', 'Laki-laki', '628351735293', 'Bandelan – Taman', 47, 3, 2, 2, 2, 2),
(27, '21042020031', '7852', 'Iyan Rachman', 'Laki-laki', '628351735294', 'Bandelan – Taman', 47, 3, 1, 1, 1, 1),
(28, '21042020032', '7853', 'Sergey Dmitriev', 'Laki-laki', '628351735295', 'Bandelan – Taman', 47, 1, 2, 2, 2, 2),
(29, '21042020033', '7854', 'Carl Quinn', 'Laki-laki', '628351735296', 'Bandelan – Taman', 5, 1, 1, 1, 1, 1),
(30, '21042020034', '7855', 'Arthur Vroschevik', 'Laki-laki', '628351735297', 'Bandelan – Taman', 5, 2, 2, 2, 2, 2),
(31, '21042020035', '7856', 'Bill Clinton', 'Laki-laki', '628351735298', 'Bandelan – Taman', 3, 1, 1, 1, 1, 1),
(32, '21042020036', '7857', 'Danny', 'Laki-laki', '628351735299', 'Bandelan – Taman', 4, 2, 2, 2, 2, 2),
(33, '21042020037', '7858', 'Egorov', 'Laki-laki', '628351735300', 'Bandelan – Taman', 5, 1, 1, 1, 1, 1),
(34, '21042020038', '7859', 'Benji', 'Laki-laki', '628351735301', 'Bandelan – Taman', 6, 2, 2, 2, 2, 2),
(35, '21042020039', '7860', 'Kevin', 'Laki-laki', '628351735302', 'Bandelan – Taman', 7, 1, 1, 1, 1, 1),
(36, '21042020040', '7861', 'Frank', 'Laki-laki', '628351735303', 'Bandelan – Taman', 8, 1, 1, 1, 1, 2),
(37, '21042020041', '7862', 'Farrel Mathew', 'Laki-laki', '628351735304', 'Bandelan – Taman', 9, 1, 1, 1, 1, 1),
(38, '21042020042', '7863', 'Bob', 'Laki-laki', '628351735305', 'Bandelan – Taman', 10, 2, 2, 2, 2, 2),
(39, '21042020043', '7864', 'Jake', 'Laki-laki', '628351735306', 'Bandelan – Taman', 11, 1, 1, 1, 1, 1),
(40, '21042020044', '7865', 'Peter', 'Laki-laki', '628351735307', 'Bandelan – Taman', 12, 2, 2, 2, 2, 2),
(41, '21042020045', '7866', 'Thomas', 'Laki-laki', '628351735308', 'Bandelan – Taman', 13, 2, 1, 1, 1, 1),
(42, '21042020046', '7867', 'Steve', 'Laki-laki', '628351735309', 'Bandelan – Taman', 14, 1, 2, 2, 2, 2),
(43, '21042020047', '7868', 'Bruce Banner', 'Laki-laki', '628351735310', 'Bandelan – Taman', 15, 2, 1, 1, 1, 1),
(44, '21042020048', '7869', 'Tom', 'Laki-laki', '628351735311', 'Bandelan – Taman', 16, 1, 2, 2, 2, 2),
(45, '21042020049', '7870', 'Stuart', 'Laki-laki', '628351735312', 'Bandelan – Taman', 17, 2, 1, 1, 1, 1),
(46, '21042020050', '7871', 'Nikita', 'Laki-laki', '628351735313', 'Bandelan – Taman', 18, 1, 2, 2, 2, 2),
(47, '21042020051', '7872', 'Angela', 'Laki-laki', '628351735314', 'Bandelan – Taman', 19, 2, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vMoneyBox`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vMoneyBox`;
CREATE TABLE IF NOT EXISTS `vMoneyBox` (
`MBoxID` int(11)
,`StudentID` int(11)
,`NIS` varchar(25)
,`Name` varchar(50)
,`ClassName` varchar(30)
,`Balance` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vRptSop`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vRptSop`;
CREATE TABLE IF NOT EXISTS `vRptSop` (
`PayID` int(11)
,`Date` date
,`PaymentType` enum('Bulanan','Semester','Tahunan')
,`Staff` varchar(50)
,`NIS` varchar(25)
,`Student` varchar(50)
,`Grade` varchar(30)
,`PayMonth` varchar(10)
,`PayYear` year(4)
,`MSubtotals` int(11)
,`MCash` int(11)
,`MReturn` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vRptTabungan`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vRptTabungan`;
CREATE TABLE IF NOT EXISTS `vRptTabungan` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vStaff`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vStaff`;
CREATE TABLE IF NOT EXISTS `vStaff` (
`StaffID` int(10)
,`NameStaff` varchar(50)
,`BirthDate` date
,`PlaceBirth` varchar(50)
,`Sex` varchar(10)
,`Address` text
,`Telephone` varchar(15)
,`LevelName` enum('Administator','Staff','Siswa','')
,`TypeStaff` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vStudent`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vStudent`;
CREATE TABLE IF NOT EXISTS `vStudent` (
`IdSiswa` int(10)
,`NISN` varchar(25)
,`NIS` varchar(25)
,`NamaSiswa` varchar(50)
,`JnsKelamin` varchar(10)
,`NoTelp` varchar(25)
,`Alamat` text
,`Kelas` varchar(30)
,`PbrSPP` int(11)
,`SaldoTabungan` int(11)
,`PbrOsis` int(11)
,`PbrPrakerin` int(11)
,`PbrPraktek` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vTransaction`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vTransaction`;
CREATE TABLE IF NOT EXISTS `vTransaction` (
`PayID` int(11)
,`Date` date
,`PaymentType` enum('Bulanan','Semester','Tahunan')
,`StaffName` varchar(50)
,`NIS` varchar(25)
,`StudentName` varchar(50)
,`Grade` varchar(30)
,`Month` varchar(10)
,`Nominal` int(11)
,`PayMonth` varchar(10)
,`PayYear` year(4)
,`MSubtotals` int(11)
,`MCash` int(11)
,`MReturn` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `vMoneyBox`
--
DROP TABLE IF EXISTS `vMoneyBox`;

DROP VIEW IF EXISTS `vMoneyBox`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vMoneyBox`  AS  select `mb`.`MBoxID` AS `MBoxID`,`mb`.`StudentID` AS `StudentID`,`st`.`NIS` AS `NIS`,`st`.`Name` AS `Name`,`cl`.`ClassName` AS `ClassName`,`mb`.`Balance` AS `Balance` from ((`MoneyBox` `mb` join `Student` `st` on(`mb`.`StudentID` = `st`.`StudentID`)) join `Grade` `cl` on(`mb`.`GradeID` = `cl`.`ClassID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vRptSop`
--
DROP TABLE IF EXISTS `vRptSop`;

DROP VIEW IF EXISTS `vRptSop`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vRptSop`  AS  select `Payment`.`PayID` AS `PayID`,`Payment`.`Date` AS `Date`,`Payment`.`PaymentType` AS `PaymentType`,`Staff`.`Name` AS `Staff`,`Student`.`NIS` AS `NIS`,`Student`.`Name` AS `Student`,`Grade`.`ClassName` AS `Grade`,`Payment`.`PayMonth` AS `PayMonth`,`Payment`.`PayYear` AS `PayYear`,`Payment`.`MSubtotals` AS `MSubtotals`,`Payment`.`MCash` AS `MCash`,`Payment`.`MReturn` AS `MReturn` from (((`Payment` join `Staff` on(`Payment`.`StaffID` = `Staff`.`StaffID`)) join `Student` on(`Payment`.`StudentID` = `Student`.`StudentID`)) join `Grade` on(`Student`.`ClassID` = `Grade`.`ClassID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vRptTabungan`
--
DROP TABLE IF EXISTS `vRptTabungan`;

DROP VIEW IF EXISTS `vRptTabungan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vRptTabungan`  AS  select `pb`.`IdPBalance` AS `IdTransaksi`,`pb`.`Date` AS `Tanggal`,`sf`.`Name` AS `Petugas`,`st`.`NIS` AS `NIS`,`st`.`Name` AS `NamaSiswa`,`pb`.`AmountPay` AS `BesarDana` from ((`PBalance` `pb` join `Staff` `sf` on(`pb`.`StaffID` = `sf`.`StaffID`)) join `Student` `st` on(`pb`.`StudentID` = `st`.`StudentID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vStaff`
--
DROP TABLE IF EXISTS `vStaff`;

DROP VIEW IF EXISTS `vStaff`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vStaff`  AS  select `Staff`.`StaffID` AS `StaffID`,`Staff`.`Name` AS `NameStaff`,`Staff`.`BirthDate` AS `BirthDate`,`Staff`.`PlaceBirth` AS `PlaceBirth`,`Staff`.`Sex` AS `Sex`,`Staff`.`Address` AS `Address`,`Staff`.`Telephone` AS `Telephone`,`Level`.`LevelName` AS `LevelName`,`StaffType`.`Name` AS `TypeStaff` from ((`Staff` join `Level` on(`Staff`.`IdLevel` = `Level`.`IdLevel`)) join `StaffType` on(`Staff`.`IdStaffType` = `StaffType`.`Id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vStudent`
--
DROP TABLE IF EXISTS `vStudent`;

DROP VIEW IF EXISTS `vStudent`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vStudent`  AS  select `st`.`StudentID` AS `IdSiswa`,`st`.`NISN` AS `NISN`,`st`.`NIS` AS `NIS`,`st`.`Name` AS `NamaSiswa`,`st`.`Gender` AS `JnsKelamin`,`st`.`TelpNo` AS `NoTelp`,`st`.`Address` AS `Alamat`,`cl`.`ClassName` AS `Kelas`,`nm`.`AmountPay` AS `PbrSPP`,`mb`.`Balance` AS `SaldoTabungan`,`os`.`AmountPay` AS `PbrOsis`,`pc`.`AmountPay` AS `PbrPrakerin`,`pc`.`AmountPay` AS `PbrPraktek` from ((((((`Student` `st` join `Grade` `cl` on(`st`.`ClassID` = `cl`.`ClassID`)) join `Nominal` `nm` on(`st`.`SppID` = `nm`.`NomID`)) join `MoneyBox` `mb` on(`st`.`MBoxID` = `mb`.`MBoxID`)) join `Osis` `os` on(`st`.`OsisID` = `os`.`OsisID`)) join `PracticalWork` `pc` on(`st`.`PwID` = `pc`.`PwID`)) join `Practice` `pr` on(`st`.`PcID` = `pr`.`PracticeID`)) order by `st`.`StudentID` ;

-- --------------------------------------------------------

--
-- Structure for view `vTransaction`
--
DROP TABLE IF EXISTS `vTransaction`;

DROP VIEW IF EXISTS `vTransaction`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vTransaction`  AS  select `py`.`PayID` AS `PayID`,`py`.`Date` AS `Date`,`py`.`PaymentType` AS `PaymentType`,`sf`.`Name` AS `StaffName`,`st`.`NIS` AS `NIS`,`st`.`Name` AS `StudentName`,`c`.`ClassName` AS `Grade`,`pd`.`Month` AS `Month`,`pd`.`Nominal` AS `Nominal`,`py`.`PayMonth` AS `PayMonth`,`py`.`PayYear` AS `PayYear`,`py`.`MSubtotals` AS `MSubtotals`,`py`.`MCash` AS `MCash`,`py`.`MReturn` AS `MReturn` from ((((`Payment` `py` join `Student` `st` on(`py`.`StudentID` = `st`.`StudentID`)) join `Staff` `sf` on(`py`.`StaffID` = `sf`.`StaffID`)) join `PaymentDetail` `pd` on(`py`.`PayID` = `pd`.`PayID`)) join `Grade` `c` on(`st`.`ClassID` = `c`.`ClassID`)) order by `py`.`PayID` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `MoneyBox`
--
ALTER TABLE `MoneyBox`
  ADD CONSTRAINT `MoneyBox_ibfk_1` FOREIGN KEY (`GradeID`) REFERENCES `Grade` (`ClassID`),
  ADD CONSTRAINT `MoneyBox_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `MoneyBox_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

--
-- Constraints for table `Nominal`
--
ALTER TABLE `Nominal`
  ADD CONSTRAINT `Nominal_ibfk_1` FOREIGN KEY (`SkillCatID`) REFERENCES `SkillCategory` (`CatID`);

--
-- Constraints for table `Osis`
--
ALTER TABLE `Osis`
  ADD CONSTRAINT `Osis_ibfk_1` FOREIGN KEY (`SkillCatID`) REFERENCES `SkillCategory` (`CatID`);

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  ADD CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

--
-- Constraints for table `PBalance`
--
ALTER TABLE `PBalance`
  ADD CONSTRAINT `PBalance_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  ADD CONSTRAINT `PBalance_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);

--
-- Constraints for table `PracticalWork`
--
ALTER TABLE `PracticalWork`
  ADD CONSTRAINT `PracticalWork_ibfk_1` FOREIGN KEY (`SkillCatID`) REFERENCES `SkillCategory` (`CatID`);

--
-- Constraints for table `Practice`
--
ALTER TABLE `Practice`
  ADD CONSTRAINT `Practice_ibfk_1` FOREIGN KEY (`SkillCatID`) REFERENCES `SkillCategory` (`CatID`);

--
-- Constraints for table `SkillCompetetion`
--
ALTER TABLE `SkillCompetetion`
  ADD CONSTRAINT `SkillCompetetion_ibfk_1` FOREIGN KEY (`SkillCatID`) REFERENCES `SkillCategory` (`CatID`);

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`IdLevel`) REFERENCES `Level` (`IdLevel`),
  ADD CONSTRAINT `Staff_ibfk_2` FOREIGN KEY (`IdStaffType`) REFERENCES `StaffType` (`Id`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`MBoxID`) REFERENCES `MoneyBox` (`MBoxID`),
  ADD CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`OsisID`) REFERENCES `Osis` (`OsisID`),
  ADD CONSTRAINT `Student_ibfk_3` FOREIGN KEY (`PcID`) REFERENCES `Practice` (`PracticeID`),
  ADD CONSTRAINT `Student_ibfk_4` FOREIGN KEY (`PwID`) REFERENCES `PracticalWork` (`PwID`),
  ADD CONSTRAINT `Student_ibfk_5` FOREIGN KEY (`SppID`) REFERENCES `Nominal` (`NomID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
