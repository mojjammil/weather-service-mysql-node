-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2018 at 09:26 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weatherservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE `sensors` (
  `sensor_ID` int(11) NOT NULL,
  `station_ID` int(11) DEFAULT NULL,
  `sensor_name` varchar(255) DEFAULT NULL,
  `measurementUnit` varchar(2) DEFAULT NULL,
  `latest_data` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`sensor_ID`, `station_ID`, `sensor_name`, `measurementUnit`, `latest_data`) VALUES
(1, 1, 'sensor4', 'F', 19),
(2, 2, 'sensor4', 'F', NULL),
(3, NULL, 'sensor5', NULL, NULL),
(4, NULL, 'sensor5', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_data`
--

CREATE TABLE `sensor_data` (
  `data_ID` int(11) NOT NULL,
  `measurementTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sensor_ID` int(11) DEFAULT NULL,
  `measurement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_data`
--

INSERT INTO `sensor_data` (`data_ID`, `measurementTime`, `sensor_ID`, `measurement`) VALUES
(1, '2018-10-08 11:13:45', 2, 19),
(2, '2018-10-08 11:19:55', 76, 21),
(3, '2018-10-08 11:24:23', 77, 21),
(4, '2018-10-08 11:25:15', 78, 25);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `station_ID` int(11) NOT NULL,
  `connection_type` varchar(25) DEFAULT NULL,
  `error` varchar(25) DEFAULT NULL,
  `GPS` varchar(25) DEFAULT NULL,
  `manager_ID` int(11) DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL,
  `station_name` varchar(8) DEFAULT NULL,
  `status_pulse_interval` int(11) DEFAULT NULL,
  `data_pulse_interval` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`station_ID`, `connection_type`, `error`, `GPS`, `manager_ID`, `state`, `station_name`, `status_pulse_interval`, `data_pulse_interval`) VALUES
(0, NULL, NULL, NULL, NULL, 'Off', 'station5', NULL, '2018-10-08 11:31:47'),
(1, 'mobile', 'none', '60.17, 50.16', 1, 'error', 'station1', 5, '2018-10-08 11:56:56'),
(2, 'mobile', 'none', '80.17, 90.16', 1, 'error', 'station2', 6, '2018-10-08 11:47:40'),
(3, 'mobile', 'none', '90.17, 50.16', 1, 'on', 'station3', 5, '2018-10-08 11:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `station_manager`
--

CREATE TABLE `station_manager` (
  `managerID` int(11) NOT NULL,
  `managerName` varchar(25) DEFAULT NULL,
  `manager_address` varchar(25) DEFAULT NULL,
  `station_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station_manager`
--

INSERT INTO `station_manager` (`managerID`, `managerName`, `manager_address`, `station_ID`) VALUES
(1, 'John', 'Finance', 1),
(2, 'Mary', 'IT', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sensors`
--
ALTER TABLE `sensors`
  ADD PRIMARY KEY (`sensor_ID`);

--
-- Indexes for table `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`data_ID`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`station_ID`);

--
-- Indexes for table `station_manager`
--
ALTER TABLE `station_manager`
  ADD PRIMARY KEY (`managerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sensors`
--
ALTER TABLE `sensors`
  MODIFY `sensor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `data_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
