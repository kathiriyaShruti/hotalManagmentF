-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 14, 2023 at 09:35 AM
-- Server version: 5.7.40
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurentms`
--

-- --------------------------------------------------------

--
-- Table structure for table `acroom`
--

DROP TABLE IF EXISTS `acroom`;
CREATE TABLE IF NOT EXISTS `acroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acroom`
--

INSERT INTO `acroom` (`id`, `roomno`, `roomtype`, `price`, `detail`, `img`, `status`) VALUES
(133, 1, 'Delux', 700, 'nice', 'ac2.jpeg', 'un book'),
(134, 11, 'Ac', 900, 'very nice', 'ac4.jpg', 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `addfood`
--

DROP TABLE IF EXISTS `addfood`;
CREATE TABLE IF NOT EXISTS `addfood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `foodtype` varchar(50) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addfood`
--

INSERT INTO `addfood` (`id`, `name`, `foodtype`, `detail`, `price`, `img`) VALUES
(108, 'manchurian', 'Chines', 'yummy', 100, 'dhosa.png'),
(107, 'khishti', 'Chines', 'yummy', 300, 'chillipasta.jpg'),
(109, 'fgh', 'Chines', 'yummy', 300, 'coldcoffee.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_edit`
--

DROP TABLE IF EXISTS `admin_edit`;
CREATE TABLE IF NOT EXISTS `admin_edit` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_edit`
--

INSERT INTO `admin_edit` (`admin_id`, `roomno`, `roomtype`) VALUES
(1, 121, 'deluxAC'),
(3, 523, 'nonAC'),
(4, 122, 'deluxAC'),
(5, 524, 'nonAC');

--
-- Triggers `admin_edit`
--
DROP TRIGGER IF EXISTS `Audit_ac`;
DELIMITER $$
CREATE TRIGGER `Audit_ac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'AC') THEN
            INSERT INTO acroom

    SET  
	roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	price = 900,

	status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Audit_delux`;
DELIMITER $$
CREATE TRIGGER `Audit_delux` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
     IF ( NEW.roomtype = 'deluxAC') THEN
        INSERT INTO deluxacroom
           SET
    
            roomno = NEW.roomno,

            roomtype =  NEW.roomtype,

           price = 1100,

           status = 'un book';
      
            
      END IF;
   
    

    

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Audit_nonac`;
DELIMITER $$
CREATE TRIGGER `Audit_nonac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'nonAC') THEN
            INSERT INTO nonac

    SET  
	    roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	   price = 700,

	   status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `card details`
--

DROP TABLE IF EXISTS `card details`;
CREATE TABLE IF NOT EXISTS `card details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardno` bigint(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card details`
--

INSERT INTO `card details` (`id`, `cardno`, `cvv`) VALUES
(1, 1111111111111111, 111),
(2, 2222222222222222, 222),
(5, 123412341234, 123);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `mobile`, `address`, `message`) VALUES
(3, 'neel', 'neel@gmail.com', 1223344558, 'sarasnagar', 'food is not good'),
(4, 'jasprit', 'jasprit@gmail.com', 9889988998, 'chandan nagar', 'what is the price of AC room?'),
(5, 'harsh', 'harsh@gmail.com', 1234567899, 'burud goan', 'room pricw'),
(6, '222', 'shruti@gmail.com', 4545465, '8,Dharmajivan house kalakunj Nana varacha Surat', 'xghc\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `feedback` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `feedback`) VALUES
(1, 'shruti', 'nice');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `full_name` text NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `full_name`, `phone`, `address`) VALUES
(5, 'rohiy', 336366363, 'munoooo'),
(6, 'giri', 5555666677, 'pune'),
(19, 'virat', 102030405, 'burud goan road'),
(23, 'Yash pokharna ', 7768561235, 'burud goan road'),
(24, 'Yash pokharna ', 7765898978, 'burud goan road'),
(25, 'unnatti ', 9421197320, 'saras nagar nali me'),
(26, 'jasprit ', 9889988998, 'chandan nagar'),
(27, 'Yash pokharna ', 1223344558, 'burud goan road'),
(28, 'harsh', 1223344558, 'burud goan road'),
(29, 'BHADRESHBHAI', 9825880386, '8,Dharmajivan house kalakunj Nana varacha Surat'),
(30, 'shruti', 5656565656, 'kalakunj'),
(31, 'BHADRESHBHAI', 9825880386, '8,Dharmajivan house kalakunj Nana varacha Surat');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
CREATE TABLE IF NOT EXISTS `hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hno` int(11) NOT NULL,
  `hallyype` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`id`, `hno`, `hallyype`, `price`, `detail`, `image`, `status`) VALUES
(5, 1, 'Anniversary', 20000, 'fully ac hall', 'hall2.jpg', 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `hall_details`
--

DROP TABLE IF EXISTS `hall_details`;
CREATE TABLE IF NOT EXISTS `hall_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `members` int(11) NOT NULL,
  `function` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hall_details`
--

INSERT INTO `hall_details` (`id`, `name`, `address`, `state`, `city`, `email`, `date`, `members`, `function`) VALUES
(1, 'BHADRESHBHAI', '8,Dharmajivan house kalakunj Nana varacha Surat', 'Gujarat', 'Surat', 'manishkathirya4758@email.com', '2023-02-18 00:00:00', 89, 'marriage'),
(3, 'BHADRESHBHAI', '8,Dharmajivan house kalakunj Nana varacha Surat', 'Gujarat', 'Surat', 'manishkathirya4758@email.com', '2023-03-04 00:00:00', 12, 'marriage'),
(4, 'BHADRESHBHAI', '8,Dharmajivan house kalakunj Nana varacha Surat', 'Gujarat', 'Surat', 'manishkathirya4758@email.com', '2023-04-02 00:00:00', 12, 'marriage'),
(5, 'BHADRESHBHAI', '8,Dharmajivan house kalakunj Nana varacha Surat', 'Gujarat', 'Surat', 'manishkathirya4758@email.com', '2023-04-02 00:00:00', 21, 'marriage');

-- --------------------------------------------------------

--
-- Table structure for table `registered_users`
--

DROP TABLE IF EXISTS `registered_users`;
CREATE TABLE IF NOT EXISTS `registered_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `gen` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `mno` bigint(10) NOT NULL,
  `adno` bigint(12) NOT NULL,
  `status` varchar(25) DEFAULT NULL,
  `resettoken` varchar(255) DEFAULT NULL,
  `resettokenexpire` date DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_users`
--

INSERT INTO `registered_users` (`id`, `name`, `username`, `gen`, `email`, `password`, `address`, `city`, `state`, `mno`, `adno`, `status`, `resettoken`, `resettokenexpire`) VALUES
(5, 'BHADRESHBHAI', 'sk', 'Male', 'mk@email.com', '$2y$10$bny5HHs8VJ7eqPYni1yOoOApYnftvVfqCYHzTYc6XOXB7qRbb5WtC', '8,Dharmajivan house kalakunj Nana varacha Surat', 'Surat', 'Gujarat', 9825880386, 123412345678, '1', NULL, NULL),
(6, 'sk', 'sk1', 'Female', 'shrutikathiriya1413@gmail.com', '$2y$10$kyNrPEpZ0f9i6N7iWXTUPOrPe.spa/myD7Q2OviXIvRgRI6tBICAe', 'kalakunj', 'surat', 'gujarat', 9825880386, 121212121212, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room booking`
--

DROP TABLE IF EXISTS `room booking`;
CREATE TABLE IF NOT EXISTS `room booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `cout` varchar(20) NOT NULL,
  `members` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `no of rooms` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room booking`
--

INSERT INTO `room booking` (`id`, `name`, `address`, `state`, `city`, `email`, `cin`, `cout`, `members`, `roomtype`, `no of rooms`) VALUES
(93, 'harsh', 'burud goan', 'maharashtra', 'Ahmednagar', 'harsh@gmail.com', '2021-12-11', '2021-12-12', 1, 'Delux AC', 1),
(94, 'skk', '8,Dharmajivan', 'Gujarat', 'Surat', 'manishkathirya4758@email.com', '2023-04-02', '2023-04-09', 10, 'Ac rooms', 4),
(95, 'skk', '8,Dharmajivan', 'Gujarat', 'Surat', 'manishkathirya4758@email.com', '2023-04-02', '2023-04-09', 10, 'Ac rooms', 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
