-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2020 at 03:37 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_ticket_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `count`
--

CREATE TABLE `count` (
  `Admin` int(11) NOT NULL,
  `Recip` int(11) DEFAULT NULL,
  `Cust` int(11) DEFAULT NULL,
  `Plane` int(11) DEFAULT NULL,
  `Flight` int(11) DEFAULT NULL,
  `Ticket` int(11) DEFAULT NULL,
  `Payment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `count`
--

INSERT INTO `count` (`Admin`, `Recip`, `Cust`, `Plane`, `Flight`, `Ticket`, `Payment`) VALUES
(1, 0, 1, 8, 8, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `creditcard_info`
--

CREATE TABLE `creditcard_info` (
  `paymentID` varchar(10) NOT NULL,
  `ccNo` varchar(20) DEFAULT NULL,
  `ccType` varchar(20) DEFAULT NULL,
  `ccHolder` varchar(45) DEFAULT NULL,
  `ccBank` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cust_info`
--

CREATE TABLE `cust_info` (
  `custID` varchar(10) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(10) DEFAULT NULL,
  `passport` varchar(10) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `profimg` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cust_info`
--

INSERT INTO `cust_info` (`custID`, `fname`, `lname`, `address`, `gender`, `dob`, `nic`, `passport`, `city`, `email`, `contact`, `profimg`) VALUES
('C0001', 'A', 'B', 'ghg', 'Female', '2019-01-03', '987678765v', '1234567890', 'dsfgf', 'gfhf@fgf.com', '0717876780', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `destination_info`
--

CREATE TABLE `destination_info` (
  `destination` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `destination_info`
--

INSERT INTO `destination_info` (`destination`) VALUES
('China'),
('Dubai'),
('India'),
('Japan'),
('Malayasia'),
('Qatar'),
('Singapore'),
('U.S.A');

-- --------------------------------------------------------

--
-- Table structure for table `flight_info`
--

CREATE TABLE `flight_info` (
  `flightID` varchar(10) NOT NULL,
  `planeID` varchar(10) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `destination` varchar(20) DEFAULT NULL,
  `dep_time` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_info`
--

INSERT INTO `flight_info` (`flightID`, `planeID`, `source`, `destination`, `dep_time`, `price`) VALUES
('F0001', 'P0002', 'Sri Lanka', 'Dubai', '02:15', 85000),
('F0002', 'P0004', 'Sri Lanka', 'China', '21:30', 54000),
('F0003', 'P0006', 'Sri Lanka', 'Singapore', '06:00', 30000),
('F0004', 'P0003', 'Sri Lanka', 'India', '21:00', 25000),
('F0005', 'P0005', 'Sri Lanka', 'Malayasia', '02:45', 44000),
('F0006', 'P0001', 'Sri Lanka', 'Japan', '06:00', 60000),
('F0007', 'P0007', 'Sri Lanka', 'Qatar', '05:00', 85000),
('F0008', 'P0008', 'Sri Lanka', 'U.S.A', '04:00', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `logininfo`
--

CREATE TABLE `logininfo` (
  `userID` varchar(10) NOT NULL,
  `userName` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `accessType` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logininfo`
--

INSERT INTO `logininfo` (`userID`, `userName`, `password`, `accessType`) VALUES
('001', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `paymentID` varchar(10) NOT NULL,
  `method` varchar(12) DEFAULT NULL,
  `payAmnt` varchar(10) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`paymentID`, `method`, `payAmnt`, `date`) VALUES
('P0001', 'Cash', '59400', '2019-01-14');

-- --------------------------------------------------------

--
-- Table structure for table `plane_info`
--

CREATE TABLE `plane_info` (
  `planeID` varchar(10) NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `nseats` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plane_info`
--

INSERT INTO `plane_info` (`planeID`, `model`, `company`, `nseats`) VALUES
('P0001', 'Boeing 747', 'Sri Lankan Airlines', '400'),
('P0002', 'AirBus A380', 'Delta Airlines', '560'),
('P0003', 'MCDonnell Douglas', 'Air Asia', '620'),
('P0004', 'Boeing 767', 'Mihin Lanka', '567'),
('P0005', 'Airbus A320neo', 'Sri Lankan Airlines', '150'),
('P0006', 'Airbus A340', 'Sri Lankan Airlines', '314'),
('P0007', 'Airbus A340', 'Qatar Airways', '350'),
('P0008', 'Boeing 767', 'Sri Lankan Airways', '567');

-- --------------------------------------------------------

--
-- Table structure for table `source_info`
--

CREATE TABLE `source_info` (
  `source` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `source_info`
--

INSERT INTO `source_info` (`source`) VALUES
('America'),
('Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_info`
--

CREATE TABLE `ticket_info` (
  `ticketID` varchar(10) NOT NULL,
  `FlightID` varchar(10) DEFAULT NULL,
  `custID` varchar(10) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `t_price` int(11) DEFAULT NULL,
  `paymentID` varchar(10) DEFAULT NULL,
  `flight_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_info`
--

INSERT INTO `ticket_info` (`ticketID`, `FlightID`, `custID`, `class`, `t_price`, `paymentID`, `flight_date`) VALUES
('T0001', 'F0002', 'C0001', 'Economy', 59400, 'P0001', '2019-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `userID` varchar(10) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(10) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `profimg` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`userID`, `fname`, `lname`, `address`, `gender`, `dob`, `nic`, `city`, `email`, `contact`, `profimg`) VALUES
('001', 'John', 'Doe', '101 Road,NY', 'Male', '1999-06-02', '123456789v', 'NY', 'johndoe@example.com', '0123456789', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `count`
--
ALTER TABLE `count`
  ADD PRIMARY KEY (`Admin`);

--
-- Indexes for table `creditcard_info`
--
ALTER TABLE `creditcard_info`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `cust_info`
--
ALTER TABLE `cust_info`
  ADD PRIMARY KEY (`custID`);

--
-- Indexes for table `destination_info`
--
ALTER TABLE `destination_info`
  ADD PRIMARY KEY (`destination`);

--
-- Indexes for table `flight_info`
--
ALTER TABLE `flight_info`
  ADD PRIMARY KEY (`flightID`),
  ADD KEY `planeID_idx` (`planeID`),
  ADD KEY `fk_source_idx` (`source`),
  ADD KEY `fk_destination_idx` (`destination`);

--
-- Indexes for table `logininfo`
--
ALTER TABLE `logininfo`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `plane_info`
--
ALTER TABLE `plane_info`
  ADD PRIMARY KEY (`planeID`);

--
-- Indexes for table `source_info`
--
ALTER TABLE `source_info`
  ADD PRIMARY KEY (`source`);

--
-- Indexes for table `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD PRIMARY KEY (`ticketID`),
  ADD KEY `fk_flightid_idx` (`FlightID`),
  ADD KEY `fk_custid_idx` (`custID`),
  ADD KEY `fk_paymentID_idx` (`paymentID`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `nic_UNIQUE` (`nic`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_info`
--
ALTER TABLE `flight_info`
  ADD CONSTRAINT `fk_destination` FOREIGN KEY (`destination`) REFERENCES `destination_info` (`destination`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_planeid` FOREIGN KEY (`planeID`) REFERENCES `plane_info` (`planeID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_source` FOREIGN KEY (`source`) REFERENCES `source_info` (`source`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD CONSTRAINT `fk_custid` FOREIGN KEY (`custID`) REFERENCES `cust_info` (`custID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_flightid` FOREIGN KEY (`FlightID`) REFERENCES `flight_info` (`flightID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_paymentID` FOREIGN KEY (`paymentID`) REFERENCES `payment_info` (`paymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `logininfo` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
