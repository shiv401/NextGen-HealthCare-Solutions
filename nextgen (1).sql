-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 05:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nextgen`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingid` int(255) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `Gender` text NOT NULL,
  `Slot` text NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) NOT NULL,
  `Doctor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingid`, `Name`, `Email`, `contact`, `Gender`, `Slot`, `Date`, `Time`, `Doctor`) VALUES
(4, 'Prateek Gupta', 'prateekgupta715@gmail.com', '7007783340', 'male', 'morning', '2022-12-20', '21:30', 'Shivam Sacham'),
(5, 'Suraj', 'suraj@gmail.com', '7658276987', 'male', 'morning', '2022-12-22', '01:51', 'Naveen Srivastava'),
(6, 'Prateek Gupta', 'prateekgupta715@gmail.com', '7007783340', 'male', 'morning', '2022-12-20', '03:00', 'Walter White');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(10) NOT NULL,
  `Name` text NOT NULL,
  `Specialization` text NOT NULL,
  `Contact` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `Name`, `Specialization`, `Contact`, `Email`) VALUES
(1, 'Dr. Walter White', 'CMO', 987654321, 'walter123@nextgen.com'),
(2, 'Dr. Sarah Johnson', 'Anesthesiology', 987654322, 'sarah.johnson@nextgen.com'),
(3, 'Dr. William Anderson', 'Cardiology', 735872162, 'will@nextgen.com'),
(4, 'Dr. Amanda Jepson', 'Neuroscience', 886761341, 'amy@nextgen.com'),
(5, 'Dr. Narendra Rai', 'Pediatrics', 816237658, 'narendra_rai@nextgen.com'),
(6, 'Dr. Shivam Sachan', 'Gastroenterology', 762437647, 'shivam1991@nextgen.com'),
(7, 'Dr. Muneel Abbas Rizvi', 'Traumatology and Surgery', 735741741, 'rizvi_muneel@nextgen.com'),
(8, 'Dr. Naveen Srivastava', 'Urology and Renal Transplant', 123654563, 'naveen@nextgen.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `contact`, `username`, `email`, `password`) VALUES
(22, '7007783340', 'Prateek715', 'prateekgupta715@gmail.com', '123'),
(23, '7007783340', 'Prateek75', 'prateekgupta75@gmail.com', '1234'),
(24, '8767646782', 'Shivam', 'shivam2001@gmail.com', 'shiv'),
(25, '6387659113', 'Rashi', 'rashi@gmail.com', 'rashi'),
(26, '7658276987', 'Suraj', 'suraj@gmail.com', 'suraj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingid`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
