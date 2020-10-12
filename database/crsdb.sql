-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 10, 2020 at 05:31 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` varchar(45) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `designation` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 KEY_BLOCK_SIZE=2;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `f_name`, `l_name`, `designation`, `mobile`, `email`, `password`) VALUES
('1', 'harish', 'barodiya', 'HoD', '9999', 'e@a.com', '2'),
('11', '1', '1', '1', '1', '1', '1'),
('1ww', '1', '1', '1', '1', '1', '1'),
('22', '1', '1', '1', '1', '1', '1'),
('33', '1', '1', '1', '1', '1', '1'),
('333', '1', '1', '1', '1', '1', '1'),
('admin', 'harish', 'barodiya', 'TPO', '99999', 'email', 'admiN'),
('wwww1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `company_name` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `hr_name` varchar(45) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` enum('approved','unapproved') NOT NULL DEFAULT 'unapproved',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 KEY_BLOCK_SIZE=2;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_name`, `userId`, `location`, `hr_name`, `mobile`, `email`, `password`, `status`) VALUES
('1', '1', '1', '1', 1, '1', '1', 'approved'),
('2', '2', '2', '2', 2, '2', '2', 'approved'),
('3', '3', '3', '3', 3, '3', '3', 'approved'),
('4', '4', '4', '4', 4, '4', '4', 'approved'),
('5', '5', '5', '5', 5, '5', '5', 'approved'),
('company', 'C1', 'mnr', 'harish', 9, 'e', '123', 'approved'),
('Infosys', 'infosys', 'Indore', 'hr', 779999999, 'infosys@gmail.com', '123', 'approved'),
('Tata Consultancy Service', 'tcs', 'Indore', 'hr', 99999, 'tcs@gmail.com', '123', 'approved'),
('Wipro', 'wipro', 'Hyderabad', 'hr', 99999, 'wipro@gmail.com', '123', 'unapproved');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
CREATE TABLE IF NOT EXISTS `counter` (
  `recruiter` varchar(10) NOT NULL,
  `vacancy` varchar(10) NOT NULL,
  `placed` varchar(10) NOT NULL,
  `faculty` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`recruiter`, `vacancy`, `placed`, `faculty`) VALUES
('544', '896', '10337', '10');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(45) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `specialization` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `specialization`) VALUES
('1', 'MBA', 'finance'),
('2', 'MBA', 'sales'),
('3', 'MBA', 'hr'),
('4', 'B.Tech.', 'cs'),
('5', 'B.Tech.', 'EC'),
('6', 'MCA', 'CA');

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
CREATE TABLE IF NOT EXISTS `internship` (
  `internship_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `job_profile` varchar(45) NOT NULL,
  `type` enum('home','office') NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `stipend` varchar(45) NOT NULL,
  `last_date` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `openings` varchar(45) NOT NULL,
  `requirements` varchar(1000) NOT NULL,
  `responsibilities` varchar(1000) NOT NULL,
  `link` varchar(500) NOT NULL,
  PRIMARY KEY (`internship_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`internship_id`, `company_id`, `job_profile`, `type`, `location`, `stipend`, `last_date`, `duration`, `openings`, `requirements`, `responsibilities`, `link`) VALUES
(6, 'tcs', 'Developer Intern', 'office', 'Bhawarkua Indore', '2000', '2020-10-31', '2', '5', 'No requirements', 'To develop a software', 'https://www.google.com/search?q=google&oq=google&aqs=chrome.0.69i59j69i60l3j69i65j0l2.3630j0j7&sourceid=chrome&ie=UTF-8'),
(7, 'tcs', 'Software Tester', 'home', NULL, '3000', '2020-10-31', '4', '3', 'Good knowledge of programming', 'Testing Software', 'https://www.google.com/search?q=google&oq=google&aqs=chrome.0.69i59j69i60l3j69i65j0l2.3630j0j7&sourceid=chrome&ie=UTF-8');

-- --------------------------------------------------------

--
-- Table structure for table `internshipfor`
--

DROP TABLE IF EXISTS `internshipfor`;
CREATE TABLE IF NOT EXISTS `internshipfor` (
  `internship_id` int(11) NOT NULL,
  `course_id` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`internship_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internshipfor`
--

INSERT INTO `internshipfor` (`internship_id`, `course_id`) VALUES
(6, '6'),
(7, '4'),
(7, '5'),
(7, '6');

-- --------------------------------------------------------

--
-- Table structure for table `plcmnt_talk`
--

DROP TABLE IF EXISTS `plcmnt_talk`;
CREATE TABLE IF NOT EXISTS `plcmnt_talk` (
  `vacancy_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `venue` enum('online','offline') NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plcmnt_talk`
--

INSERT INTO `plcmnt_talk` (`vacancy_id`, `date`, `time`, `venue`, `address`, `link`) VALUES
(2, '2020-11-06', '01:45:00', 'offline', 'j m', NULL),
(4, '2020-10-22', '01:47:00', 'online', NULL, NULL),
(2, '2020-10-23', '08:00:00', 'online', NULL, NULL),
(5, '2020-10-21', '10:00:00', 'offline', 'Ghar Pr Beth Kar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `enrollment` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `courseId` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` enum('approved','unapproved') NOT NULL DEFAULT 'unapproved',
  PRIMARY KEY (`enrollment`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`enrollment`, `first_name`, `last_name`, `courseId`, `mobile`, `email`, `password`, `status`) VALUES
('1', 'Harish', '1', '6', '1', '1', '123', 'approved'),
('2', '2', '2', '1', '2', '2', '2', 'approved'),
('3', '3', '3', '2', '3', '3', '3', 'approved'),
('En', 'Harish', 'Barodiya', '6', '9753048646', 'hb', '123', 'approved'),
('EN1', 'Harish', 'Baarodiya', '6', '9753048646', 'harish@gmail.com', '123', 'approved'),
('EN2', 'Chitranjan', 'Pawar', '1', '99999999', 'chetan@gmail.com', '123', 'unapproved'),
('EN3', 'Ashvini', 'Singh Thakur', '3', '88888', 'ashvin@gmail.com', '123', 'unapproved'),
('EN4', 'Vinay', 'Jajme', '2', '77777', 'vinay@gmail.com', '123', 'unapproved');

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

DROP TABLE IF EXISTS `vacancy`;
CREATE TABLE IF NOT EXISTS `vacancy` (
  `vacancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(45) DEFAULT NULL,
  `job_profile` varchar(45) DEFAULT NULL,
  `salary` varchar(45) DEFAULT NULL,
  `last_date` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `placement_talk` varchar(45) DEFAULT NULL,
  `online_test` varchar(45) DEFAULT NULL,
  `about` varchar(1000) DEFAULT NULL,
  `more_details` varchar(1000) DEFAULT NULL,
  `register_link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`vacancy_id`),
  KEY `_idx` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacancy`
--

INSERT INTO `vacancy` (`vacancy_id`, `company_id`, `job_profile`, `salary`, `last_date`, `location`, `placement_talk`, `online_test`, `about`, `more_details`, `register_link`) VALUES
(2, 'tcs', 'Software Engineer', '1', '1', '1', '1', '1', '1', '1', '1'),
(3, 'tcs', 'Manager', NULL, '12/10', NULL, NULL, NULL, NULL, NULL, 'google'),
(4, 'tcs', 'Analyst', '3.5 lpa', '10/10/2020', 'Indore', NULL, NULL, NULL, NULL, 'register.com'),
(5, 'tcs', 'Software Tester', '4 lpa', '10/10/2020', 'Hyderabad', 'Will decide soon', NULL, NULL, NULL, 'register.com'),
(6, 'tcs', 'Senior Manager', '4.5 lpa', '31/10/2020', 'India', NULL, NULL, 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking ...', 'Search the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking ...', 'https://www.google.com/search?q=google&oq=google&aqs=chrome.0.69i59j69i60l3j69i65j0l2.3630j0j7&sourceid=chrome&ie=UTF-8'),
(7, 'tcs', 'executive officer', '8 lpa', '2020-10-31', 'in India', NULL, NULL, '\r\nGooglewww.google.co.in\r\nSearch the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking ...\r\nGoogle News\r\nComprehensive, up-to-date news coverage, aggregated from ...\r\nMore results from google.co.in »\r\n', '\r\nGooglewww.google.co.in\r\nSearch the world\'s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\'re looking ...\r\nGoogle News\r\nComprehensive, up-to-date news coverage, aggregated from ...\r\nMore results from google.co.in »\r\n', 'https://www.google.com/search?q=google&oq=google&aqs=chrome.0.69i59j69i60l3j69i65j0l2.3630j0j7&sourceid=chrome&ie=UTF-8');

-- --------------------------------------------------------

--
-- Table structure for table `vacancyfor`
--

DROP TABLE IF EXISTS `vacancyfor`;
CREATE TABLE IF NOT EXISTS `vacancyfor` (
  `vacancy_id` int(11) NOT NULL,
  `course_id` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`vacancy_id`,`course_id`),
  KEY `courseCode` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vacancyfor`
--

INSERT INTO `vacancyfor` (`vacancy_id`, `course_id`) VALUES
(2, '2'),
(2, '3'),
(3, '4'),
(3, '5'),
(4, '4'),
(4, '5'),
(4, '6'),
(5, '4'),
(5, '6'),
(6, '1'),
(6, '2'),
(6, '3'),
(6, '4'),
(6, '5'),
(6, '6'),
(7, '1'),
(7, '2'),
(7, '3'),
(7, '4'),
(7, '5'),
(7, '6');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `internshipfor`
--
ALTER TABLE `internshipfor`
  ADD CONSTRAINT `internshipfor_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacancyfor`
--
ALTER TABLE `vacancyfor`
  ADD CONSTRAINT `vacancyfor_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancy` (`vacancy_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vacancyfor_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
