-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 05, 2021 at 09:39 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `habitats-nomades`
--

-- --------------------------------------------------------

--
-- Table structure for table `assoc_peuples_habitats`
--

CREATE TABLE `assoc_peuples_habitats` (
  `assoc_id` int(11) NOT NULL,
  `assoc_peuple_id` int(1) DEFAULT NULL,
  `assoc_hab_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assoc_peuples_habitats`
--

INSERT INTO `assoc_peuples_habitats` (`assoc_id`, `assoc_peuple_id`, `assoc_hab_id`) VALUES
(1, 4, 8),
(2, 5, 12),
(3, 6, 12),
(4, 7, 12),
(5, 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(1) NOT NULL,
  `cat_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'hutte'),
(2, 'tente'),
(3, 'habitation tsigane');

-- --------------------------------------------------------

--
-- Table structure for table `habitats`
--

CREATE TABLE `habitats` (
  `hab_id` int(11) NOT NULL,
  `hab_name` varchar(255) DEFAULT NULL,
  `hab_cat_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `habitats`
--

INSERT INTO `habitats` (`hab_id`, `hab_name`, `hab_cat_id`) VALUES
(1, 'hutte écran', 1),
(2, 'bateau maison', 1),
(3, 'hutte conique', 1),
(4, 'voûte', 1),
(5, 'hutte coupolaire', 1),
(6, 'igloo', 1),
(7, 'tente noire', 2),
(8, 'yourte', 2),
(9, 'tente des Bédoins', 2),
(10, 'tente noire des montagnards du Maroc', 2),
(11, 'tente en peau des Touareg', 2),
(12, 'tipi', 2);

-- --------------------------------------------------------

--
-- Table structure for table `peuples`
--

CREATE TABLE `peuples` (
  `peuple_id` int(1) NOT NULL,
  `peuple_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peuples`
--

INSERT INTO `peuples` (`peuple_id`, `peuple_name`) VALUES
(1, 'bédoin'),
(2, 'mongole'),
(3, 'kirghiz'),
(4, 'turkmène'),
(5, 'apache'),
(6, 'cheyennes'),
(7, 'comanches'),
(8, 'sioux');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assoc_peuples_habitats`
--
ALTER TABLE `assoc_peuples_habitats`
  ADD PRIMARY KEY (`assoc_id`),
  ADD KEY `assoc_peuple_id` (`assoc_peuple_id`),
  ADD KEY `assoc_hab_id` (`assoc_hab_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `habitats`
--
ALTER TABLE `habitats`
  ADD PRIMARY KEY (`hab_id`),
  ADD KEY `hab_cat_id` (`hab_cat_id`);

--
-- Indexes for table `peuples`
--
ALTER TABLE `peuples`
  ADD PRIMARY KEY (`peuple_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assoc_peuples_habitats`
--
ALTER TABLE `assoc_peuples_habitats`
  ADD CONSTRAINT `assoc_peuples_habitats_ibfk_1` FOREIGN KEY (`assoc_peuple_id`) REFERENCES `peuples` (`peuple_id`),
  ADD CONSTRAINT `assoc_peuples_habitats_ibfk_2` FOREIGN KEY (`assoc_hab_id`) REFERENCES `habitats` (`hab_id`);

--
-- Constraints for table `habitats`
--
ALTER TABLE `habitats`
  ADD CONSTRAINT `habitats_ibfk_1` FOREIGN KEY (`hab_cat_id`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
