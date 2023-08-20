-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Aug 07, 2023 at 08:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `service`
--

-- --------------------------------------------------------

--
-- Table structure for table `empoyee`
--

CREATE TABLE `empoyee` (
  `idEmpoyee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `jobtitle_ID` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobtitle`
--

CREATE TABLE `jobtitle` (
  `jobtitle_ID` int(11) NOT NULL,
  `jobtitle1` varchar(45) NOT NULL,
  `jobtitle2` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `namemenu` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order list_orderlist_ID` int(11) NOT NULL,
  `typeffood_idtypeffood` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `idOrder` int(11) NOT NULL,
  `checkin Date Time` date DEFAULT NULL,
  `Checkout Date Time` date DEFAULT NULL,
  `Billed Date Time` date DEFAULT NULL,
  `Totle Cost` int(11) DEFAULT NULL,
  `table_idtable` int(11) NOT NULL,
  `order list_orderlist_ID` int(11) NOT NULL,
  `table_idtable1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order list`
--

CREATE TABLE `order list` (
  `orderlist_ID` int(11) NOT NULL,
  `menuid` int(11) DEFAULT NULL,
  `idOrder` int(11) DEFAULT NULL,
  `idEmpoyee` int(11) DEFAULT NULL,
  `Datetime` date NOT NULL,
  `price` int(11) DEFAULT NULL,
  `empoyee_idEmpoyee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `idtable` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `typeffood`
--

CREATE TABLE `typeffood` (
  `idtypeffood` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empoyee`
--
ALTER TABLE `empoyee`
  ADD PRIMARY KEY (`idEmpoyee`);

--
-- Indexes for table `jobtitle`
--
ALTER TABLE `jobtitle`
  ADD PRIMARY KEY (`jobtitle_ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`,`order list_orderlist_ID`,`typeffood_idtypeffood`),
  ADD KEY `fk_Menu_order list1_idx` (`order list_orderlist_ID`),
  ADD KEY `fk_Menu_typeffood1_idx` (`typeffood_idtypeffood`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`idOrder`,`table_idtable`,`order list_orderlist_ID`,`table_idtable1`),
  ADD KEY `fk_Order_order list1_idx` (`order list_orderlist_ID`),
  ADD KEY `fk_Order_table1_idx` (`table_idtable1`);

--
-- Indexes for table `order list`
--
ALTER TABLE `order list`
  ADD PRIMARY KEY (`orderlist_ID`,`empoyee_idEmpoyee`),
  ADD KEY `fk_order list_empoyee1_idx` (`empoyee_idEmpoyee`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`idtable`);

--
-- Indexes for table `typeffood`
--
ALTER TABLE `typeffood`
  ADD PRIMARY KEY (`idtypeffood`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empoyee`
--
ALTER TABLE `empoyee`
  MODIFY `idEmpoyee` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobtitle`
--
ALTER TABLE `jobtitle`
  MODIFY `jobtitle_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order list`
--
ALTER TABLE `order list`
  MODIFY `orderlist_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_Menu_order list1` FOREIGN KEY (`order list_orderlist_ID`) REFERENCES `order list` (`orderlist_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Menu_typeffood1` FOREIGN KEY (`typeffood_idtypeffood`) REFERENCES `typeffood` (`idtypeffood`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_Order_order list1` FOREIGN KEY (`order list_orderlist_ID`) REFERENCES `order list` (`orderlist_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Order_table1` FOREIGN KEY (`table_idtable1`) REFERENCES `table` (`idtable`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order list`
--
ALTER TABLE `order list`
  ADD CONSTRAINT `fk_order list_empoyee1` FOREIGN KEY (`empoyee_idEmpoyee`) REFERENCES `empoyee` (`idEmpoyee`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
