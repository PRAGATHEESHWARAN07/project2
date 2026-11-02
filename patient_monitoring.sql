-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2025 at 10:39 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `patient_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `userid`, `hospital_name`, `doctor_name`, `appointment_date`, `appointment_time`, `purpose`) VALUES
(2, 'a', 'Psg', 'Manoj', '2025-10-05', '15:30:00', 'Fever'),
(3, 'dg', 'Kmch', 'Venket', '2025-10-06', '10:35:00', 'Headach');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE IF NOT EXISTS `reminders` (
  `reminder_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `frequency` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `times` time DEFAULT NULL,
  `instructions` text,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reminder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`reminder_id`, `userid`, `medicine_name`, `dosage`, `frequency`, `start_date`, `end_date`, `times`, `instructions`, `status`, `created_at`) VALUES
(12, 'a', 'God', '100', 'Night', '2025-10-04', '2025-10-05', '14:30:00', 'Take 1', 'not taken', '2025-10-03 15:00:43'),
(13, 'a', 'Jk', '100', 'Night', '2025-10-04', '2025-10-05', '14:29:00', 'Cchc', 'not taken', '2025-10-03 15:31:35'),
(14, 'dg', 'Godme', '100', 'Night', '2025-10-03', '2025-10-04', '17:45:00', '1 tablet', 'not taken', '2025-10-03 17:41:10'),
(15, 'dg', 'Gov', 'Vv', 'Vv', '2025-10-03', '2025-10-03', '17:54:51', 'C ', 'pending', '2025-10-03 17:54:58'),
(16, 'dg', 'Fh', 'Cv', 'Vv', '2025-10-04', '2025-10-04', '12:11:35', 'Cc', 'taken', '2025-10-04 12:11:44'),
(17, 'dg', 'Colpal 250', '250', 'Afternoon', '2025-10-04', '2025-10-06', '12:29:00', '1 tablet', 'not taken', '2025-10-04 12:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mob` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `name`, `address`, `mob`, `email`, `dob`, `password`) VALUES
('a', 'A', 'Cbe', '9003502338', 'ravimca37@gmail.com', '1998-08-22', '113'),
('dg', 'dg', 'dg', '900', 'xv', '1998-09-29', '111'),
('F', 'V', 'C', '9003502338', 'V@gmail.com', '2000-12-04', '222'),
('Venket', 'Venket', 'Cbe', '9001531235', 'Venket@gmail.com', '1995-07-26', '123');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
