-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 11:42 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_parking_lot`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` char(10) NOT NULL,
  `parking_id` char(3) NOT NULL,
  `booking_datetime` datetime DEFAULT NULL,
  `citizen_id` char(13) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `parking_time` int(11) DEFAULT NULL,
  `parking_price` float DEFAULT NULL,
  `totalprice` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `citizen_id` char(13) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `car_brand` varchar(50) DEFAULT NULL,
  `license_plate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parking_category`
--

CREATE TABLE `parking_category` (
  `parkingcat_id` char(2) NOT NULL,
  `parkingcat_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parking_category`
--

INSERT INTO `parking_category` (`parkingcat_id`, `parkingcat_name`) VALUES
('01', 'Hospital Employee Parking Lot'),
('02', 'Inner Patient Parking Lot'),
('03', 'Emergency Patient Parking Lot'),
('04', 'Outer Patient Parking Lot');

-- --------------------------------------------------------

--
-- Table structure for table `parking_lots`
--

CREATE TABLE `parking_lots` (
  `parking_id` char(3) NOT NULL,
  `parkingcat_id` char(2) NOT NULL,
  `citizen_id` char(13) NOT NULL,
  `parking_time` int(11) DEFAULT NULL,
  `parking_price` float DEFAULT NULL,
  `totalprice` float DEFAULT NULL,
  `empty_space` int(11) DEFAULT NULL,
  `parking_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `parking_id` (`parking_id`),
  ADD KEY `citizen_id` (`citizen_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`citizen_id`);

--
-- Indexes for table `parking_category`
--
ALTER TABLE `parking_category`
  ADD PRIMARY KEY (`parkingcat_id`);

--
-- Indexes for table `parking_lots`
--
ALTER TABLE `parking_lots`
  ADD PRIMARY KEY (`parking_id`),
  ADD KEY `parkingcat_id` (`parkingcat_id`),
  ADD KEY `citizen_id` (`citizen_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`parking_id`) REFERENCES `parking_lots` (`parking_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`citizen_id`) REFERENCES `customer` (`citizen_id`) ON UPDATE CASCADE;

--
-- Constraints for table `parking_lots`
--
ALTER TABLE `parking_lots`
  ADD CONSTRAINT `parking_lots_ibfk_1` FOREIGN KEY (`parkingcat_id`) REFERENCES `parking_category` (`parkingcat_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `parking_lots_ibfk_2` FOREIGN KEY (`citizen_id`) REFERENCES `customer` (`citizen_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
