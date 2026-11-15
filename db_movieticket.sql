-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.4.3 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk db_movieticket
CREATE DATABASE IF NOT EXISTS `db_movieticket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_movieticket`;

-- membuang struktur untuk table db_movieticket.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.customers: ~6 rows (lebih kurang)
INSERT INTO `customers` (`customerID`, `name`, `email`, `password`, `phone`) VALUES
	(1, 'Alif Syauqi', 'alif.syauqi@gmail.com', '$2y$10$ybKujJMlw6APzr6scvjLXundasr1H3/ME0EIOvXhtsRyA/MwOCBHW', '081234567890'),
	(2, 'Ahmad Aqil', 'ahmad.aqil@gmail.com', 'password123', '082198765432'),
	(3, 'Ahmad Ashif', 'ahmad.ashif@gmail.com', 'password123', '085712345678'),
	(4, 'Alif Mailana', 'alif.mailana@gmail.com', 'password123', '087812345678'),
	(10, 'Dzaki Nuroahlevi', 'dzaki.nuroahlevi@gmail.com', 'password123', '081311223344'),
	(11, 'Muhammad Aziz', 'muhammad.aziz@gmail.com', 'password123', '085299887766'),
	(17, 'Ihsan Harits', 'ihsan.harits@gmail.com', '$2y$10$bOwMwDmQzevrp6KjIexT5Oq9w56KbJol5ANpXMgfuTiPM6Xrug2Zq', '081902064556');

-- membuang struktur untuk table db_movieticket.genres
CREATE TABLE IF NOT EXISTS `genres` (
  `genreID` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`genreID`),
  UNIQUE KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.genres: ~8 rows (lebih kurang)
INSERT INTO `genres` (`genreID`, `genre_name`) VALUES
	(3, 'Action'),
	(12, 'Animation'),
	(11, 'Biography'),
	(4, 'Comedy'),
	(1, 'Drama'),
	(10, 'Horror'),
	(9, 'Sci-Fi'),
	(2, 'Sport');

-- membuang struktur untuk table db_movieticket.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `movieID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `duration` int NOT NULL,
  `age_rating` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `poster` varchar(255) NOT NULL,
  PRIMARY KEY (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.movies: ~10 rows (lebih kurang)
INSERT INTO `movies` (`movieID`, `title`, `duration`, `age_rating`, `poster`) VALUES
	(1, 'F1', 155, '+13', 'f1.jpg'),
	(2, 'Inception', 148, '+13', 'inception.jpg'),
	(3, 'The Dark Knight', 152, '+13', 'the_dark_knight.jpg'),
	(4, 'Interstellar', 169, '+13', 'interstellar.jpg'),
	(5, 'Avatar: The Way of Water', 192, '+13', 'avatar2.jpg'),
	(6, 'Spider-Man: Across the Spider-Verse', 140, 'SU', 'spiderverse.jpg'),
	(7, 'Oppenheimer', 180, '+17', 'oppenheimer.jpg'),
	(8, 'Dune: Part Two', 166, '+13', 'dune2.jpg'),
	(9, 'Pengabdi Setan 2', 119, '+17', 'pengabdi_setan_2.jpg'),
	(10, 'Agak Laen', 119, '+13', 'agak_laen.jpg');

-- membuang struktur untuk table db_movieticket.movie_genres
CREATE TABLE IF NOT EXISTS `movie_genres` (
  `movieID` int NOT NULL,
  `genreID` int NOT NULL,
  PRIMARY KEY (`movieID`,`genreID`),
  KEY `genreID` (`genreID`),
  CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`) ON DELETE CASCADE,
  CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genreID`) REFERENCES `genres` (`genreID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.movie_genres: ~19 rows (lebih kurang)
INSERT INTO `movie_genres` (`movieID`, `genreID`) VALUES
	(1, 1),
	(3, 1),
	(4, 1),
	(7, 1),
	(1, 2),
	(2, 3),
	(3, 3),
	(5, 3),
	(6, 3),
	(8, 3),
	(10, 4),
	(2, 9),
	(4, 9),
	(5, 9),
	(8, 9),
	(9, 10),
	(10, 10),
	(7, 11),
	(6, 12);

-- membuang struktur untuk table db_movieticket.seat
CREATE TABLE IF NOT EXISTS `seat` (
  `seatID` int NOT NULL AUTO_INCREMENT,
  `studioID` int NOT NULL,
  `seat_code` varchar(10) NOT NULL,
  PRIMARY KEY (`seatID`),
  KEY `studioID` (`studioID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`studioID`) REFERENCES `studio` (`studioID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.seat: ~250 rows (lebih kurang)
INSERT INTO `seat` (`seatID`, `studioID`, `seat_code`) VALUES
	(1, 1, 'A1'),
	(2, 1, 'A2'),
	(3, 1, 'A3'),
	(4, 1, 'A4'),
	(5, 1, 'A5'),
	(6, 1, 'A6'),
	(7, 1, 'A7'),
	(8, 1, 'A8'),
	(9, 1, 'A9'),
	(10, 1, 'A10'),
	(11, 1, 'B1'),
	(12, 1, 'B2'),
	(13, 1, 'B3'),
	(14, 1, 'B4'),
	(15, 1, 'B5'),
	(16, 1, 'B6'),
	(17, 1, 'B7'),
	(18, 1, 'B8'),
	(19, 1, 'B9'),
	(20, 1, 'B10'),
	(21, 1, 'C1'),
	(22, 1, 'C2'),
	(23, 1, 'C3'),
	(24, 1, 'C4'),
	(25, 1, 'C5'),
	(26, 1, 'C6'),
	(27, 1, 'C7'),
	(28, 1, 'C8'),
	(29, 1, 'C9'),
	(30, 1, 'C10'),
	(31, 1, 'D1'),
	(32, 1, 'D2'),
	(33, 1, 'D3'),
	(34, 1, 'D4'),
	(35, 1, 'D5'),
	(36, 1, 'D6'),
	(37, 1, 'D7'),
	(38, 1, 'D8'),
	(39, 1, 'D9'),
	(40, 1, 'D10'),
	(41, 1, 'E1'),
	(42, 1, 'E2'),
	(43, 1, 'E3'),
	(44, 1, 'E4'),
	(45, 1, 'E5'),
	(46, 1, 'E6'),
	(47, 1, 'E7'),
	(48, 1, 'E8'),
	(49, 1, 'E9'),
	(50, 1, 'E10'),
	(51, 2, 'A1'),
	(52, 2, 'A2'),
	(53, 2, 'A3'),
	(54, 2, 'A4'),
	(55, 2, 'A5'),
	(56, 2, 'A6'),
	(57, 2, 'A7'),
	(58, 2, 'A8'),
	(59, 2, 'A9'),
	(60, 2, 'A10'),
	(61, 2, 'B1'),
	(62, 2, 'B2'),
	(63, 2, 'B3'),
	(64, 2, 'B4'),
	(65, 2, 'B5'),
	(66, 2, 'B6'),
	(67, 2, 'B7'),
	(68, 2, 'B8'),
	(69, 2, 'B9'),
	(70, 2, 'B10'),
	(71, 2, 'C1'),
	(72, 2, 'C2'),
	(73, 2, 'C3'),
	(74, 2, 'C4'),
	(75, 2, 'C5'),
	(76, 2, 'C6'),
	(77, 2, 'C7'),
	(78, 2, 'C8'),
	(79, 2, 'C9'),
	(80, 2, 'C10'),
	(81, 2, 'D1'),
	(82, 2, 'D2'),
	(83, 2, 'D3'),
	(84, 2, 'D4'),
	(85, 2, 'D5'),
	(86, 2, 'D6'),
	(87, 2, 'D7'),
	(88, 2, 'D8'),
	(89, 2, 'D9'),
	(90, 2, 'D10'),
	(91, 2, 'E1'),
	(92, 2, 'E2'),
	(93, 2, 'E3'),
	(94, 2, 'E4'),
	(95, 2, 'E5'),
	(96, 2, 'E6'),
	(97, 2, 'E7'),
	(98, 2, 'E8'),
	(99, 2, 'E9'),
	(100, 2, 'E10'),
	(101, 3, 'A1'),
	(102, 3, 'A2'),
	(103, 3, 'A3'),
	(104, 3, 'A4'),
	(105, 3, 'A5'),
	(106, 3, 'A6'),
	(107, 3, 'A7'),
	(108, 3, 'A8'),
	(109, 3, 'A9'),
	(110, 3, 'A10'),
	(111, 3, 'B1'),
	(112, 3, 'B2'),
	(113, 3, 'B3'),
	(114, 3, 'B4'),
	(115, 3, 'B5'),
	(116, 3, 'B6'),
	(117, 3, 'B7'),
	(118, 3, 'B8'),
	(119, 3, 'B9'),
	(120, 3, 'B10'),
	(121, 3, 'C1'),
	(122, 3, 'C2'),
	(123, 3, 'C3'),
	(124, 3, 'C4'),
	(125, 3, 'C5'),
	(126, 3, 'C6'),
	(127, 3, 'C7'),
	(128, 3, 'C8'),
	(129, 3, 'C9'),
	(130, 3, 'C10'),
	(131, 3, 'D1'),
	(132, 3, 'D2'),
	(133, 3, 'D3'),
	(134, 3, 'D4'),
	(135, 3, 'D5'),
	(136, 3, 'D6'),
	(137, 3, 'D7'),
	(138, 3, 'D8'),
	(139, 3, 'D9'),
	(140, 3, 'D10'),
	(141, 3, 'E1'),
	(142, 3, 'E2'),
	(143, 3, 'E3'),
	(144, 3, 'E4'),
	(145, 3, 'E5'),
	(146, 3, 'E6'),
	(147, 3, 'E7'),
	(148, 3, 'E8'),
	(149, 3, 'E9'),
	(150, 3, 'E10'),
	(151, 4, 'A1'),
	(152, 4, 'A2'),
	(153, 4, 'A3'),
	(154, 4, 'A4'),
	(155, 4, 'A5'),
	(156, 4, 'A6'),
	(157, 4, 'A7'),
	(158, 4, 'A8'),
	(159, 4, 'A9'),
	(160, 4, 'A10'),
	(161, 4, 'B1'),
	(162, 4, 'B2'),
	(163, 4, 'B3'),
	(164, 4, 'B4'),
	(165, 4, 'B5'),
	(166, 4, 'B6'),
	(167, 4, 'B7'),
	(168, 4, 'B8'),
	(169, 4, 'B9'),
	(170, 4, 'B10'),
	(171, 4, 'C1'),
	(172, 4, 'C2'),
	(173, 4, 'C3'),
	(174, 4, 'C4'),
	(175, 4, 'C5'),
	(176, 4, 'C6'),
	(177, 4, 'C7'),
	(178, 4, 'C8'),
	(179, 4, 'C9'),
	(180, 4, 'C10'),
	(181, 4, 'D1'),
	(182, 4, 'D2'),
	(183, 4, 'D3'),
	(184, 4, 'D4'),
	(185, 4, 'D5'),
	(186, 4, 'D6'),
	(187, 4, 'D7'),
	(188, 4, 'D8'),
	(189, 4, 'D9'),
	(190, 4, 'D10'),
	(191, 4, 'E1'),
	(192, 4, 'E2'),
	(193, 4, 'E3'),
	(194, 4, 'E4'),
	(195, 4, 'E5'),
	(196, 4, 'E6'),
	(197, 4, 'E7'),
	(198, 4, 'E8'),
	(199, 4, 'E9'),
	(200, 4, 'E10'),
	(201, 5, 'A1'),
	(202, 5, 'A2'),
	(203, 5, 'A3'),
	(204, 5, 'A4'),
	(205, 5, 'A5'),
	(206, 5, 'A6'),
	(207, 5, 'A7'),
	(208, 5, 'A8'),
	(209, 5, 'A9'),
	(210, 5, 'A10'),
	(211, 5, 'B1'),
	(212, 5, 'B2'),
	(213, 5, 'B3'),
	(214, 5, 'B4'),
	(215, 5, 'B5'),
	(216, 5, 'B6'),
	(217, 5, 'B7'),
	(218, 5, 'B8'),
	(219, 5, 'B9'),
	(220, 5, 'B10'),
	(221, 5, 'C1'),
	(222, 5, 'C2'),
	(223, 5, 'C3'),
	(224, 5, 'C4'),
	(225, 5, 'C5'),
	(226, 5, 'C6'),
	(227, 5, 'C7'),
	(228, 5, 'C8'),
	(229, 5, 'C9'),
	(230, 5, 'C10'),
	(231, 5, 'D1'),
	(232, 5, 'D2'),
	(233, 5, 'D3'),
	(234, 5, 'D4'),
	(235, 5, 'D5'),
	(236, 5, 'D6'),
	(237, 5, 'D7'),
	(238, 5, 'D8'),
	(239, 5, 'D9'),
	(240, 5, 'D10'),
	(241, 5, 'E1'),
	(242, 5, 'E2'),
	(243, 5, 'E3'),
	(244, 5, 'E4'),
	(245, 5, 'E5'),
	(246, 5, 'E6'),
	(247, 5, 'E7'),
	(248, 5, 'E8'),
	(249, 5, 'E9'),
	(250, 5, 'E10');

-- membuang struktur untuk table db_movieticket.showtime
CREATE TABLE IF NOT EXISTS `showtime` (
  `showtimeID` int NOT NULL AUTO_INCREMENT,
  `movieID` int NOT NULL,
  `studioID` int NOT NULL,
  `show_date` date NOT NULL,
  `start_time` time NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`showtimeID`),
  KEY `movieID` (`movieID`),
  KEY `studioID` (`studioID`),
  CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `showtime_ibfk_2` FOREIGN KEY (`studioID`) REFERENCES `studio` (`studioID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.showtime: ~35 rows (lebih kurang)
INSERT INTO `showtime` (`showtimeID`, `movieID`, `studioID`, `show_date`, `start_time`, `price`) VALUES
	(1, 1, 1, '2026-10-19', '14:30:00', 50000.00),
	(2, 2, 2, '2026-10-19', '12:00:00', 50000.00),
	(3, 3, 3, '2026-10-19', '13:00:00', 50000.00),
	(4, 4, 4, '2026-10-19', '15:00:00', 50000.00),
	(5, 5, 5, '2026-10-19', '16:30:00', 50000.00),
	(6, 6, 1, '2026-10-19', '18:00:00', 50000.00),
	(7, 7, 2, '2026-10-20', '13:00:00', 50000.00),
	(8, 8, 3, '2026-10-20', '15:30:00', 50000.00),
	(9, 9, 4, '2026-10-20', '19:00:00', 50000.00),
	(10, 10, 5, '2026-10-20', '20:15:00', 50000.00),
	(11, 10, 1, '2026-10-19', '11:00:00', 50000.00),
	(12, 9, 2, '2026-10-19', '09:15:00', 50000.00),
	(13, 8, 2, '2026-10-19', '15:30:00', 50000.00),
	(14, 10, 2, '2026-10-19', '19:15:00', 50000.00),
	(15, 2, 3, '2026-10-19', '09:45:00', 50000.00),
	(16, 1, 3, '2026-10-19', '16:30:00', 50000.00),
	(17, 9, 3, '2026-10-19', '20:00:00', 50000.00),
	(18, 7, 4, '2026-10-19', '11:00:00', 50000.00),
	(19, 3, 4, '2026-10-19', '19:00:00', 50000.00),
	(20, 9, 5, '2026-10-19', '09:30:00', 50000.00),
	(21, 7, 5, '2026-10-19', '12:30:00', 50000.00),
	(22, 5, 1, '2026-10-20', '10:00:00', 50000.00),
	(23, 4, 1, '2026-10-20', '14:15:00', 50000.00),
	(24, 1, 1, '2026-10-20', '18:00:00', 50000.00),
	(25, 9, 2, '2026-10-20', '10:00:00', 50000.00),
	(26, 2, 2, '2026-10-20', '17:00:00', 50000.00),
	(27, 10, 2, '2026-10-20', '20:15:00', 50000.00),
	(28, 10, 3, '2026-10-20', '09:00:00', 50000.00),
	(29, 3, 3, '2026-10-20', '12:00:00', 50000.00),
	(30, 6, 3, '2026-10-20', '19:15:00', 50000.00),
	(31, 8, 4, '2026-10-20', '12:00:00', 50000.00),
	(32, 1, 4, '2026-10-20', '15:30:00', 50000.00),
	(33, 9, 5, '2026-10-20', '10:00:00', 50000.00),
	(34, 7, 5, '2026-10-20', '13:00:00', 50000.00),
	(35, 4, 5, '2026-10-20', '16:30:00', 50000.00);

-- membuang struktur untuk table db_movieticket.studio
CREATE TABLE IF NOT EXISTS `studio` (
  `studioID` int NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) NOT NULL,
  `seat_capacity` int NOT NULL,
  PRIMARY KEY (`studioID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.studio: ~5 rows (lebih kurang)
INSERT INTO `studio` (`studioID`, `studio_name`, `seat_capacity`) VALUES
	(1, 'Studio 1', 50),
	(2, 'Studio 2', 50),
	(3, 'Studio 3', 50),
	(4, 'Studio 4', 50),
	(5, 'Studio 5', 50);

-- membuang struktur untuk table db_movieticket.ticket
CREATE TABLE IF NOT EXISTS `ticket` (
  `ticketID` int NOT NULL AUTO_INCREMENT,
  `transactionID` int NOT NULL,
  `showtimeID` int NOT NULL,
  `seatID` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ticketCode` varchar(100) NOT NULL,
  `ticketStatus` enum('Unused','Used','') NOT NULL,
  PRIMARY KEY (`ticketID`),
  KEY `seat_ibfk_3` (`seatID`),
  KEY `showtime_ibfk_4` (`showtimeID`),
  KEY `transactions_ibfk_5` (`transactionID`),
  CONSTRAINT `seat_ibfk_3` FOREIGN KEY (`seatID`) REFERENCES `seat` (`seatID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `showtime_ibfk_4` FOREIGN KEY (`showtimeID`) REFERENCES `showtime` (`showtimeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transactions_ibfk_5` FOREIGN KEY (`transactionID`) REFERENCES `transactions` (`transactionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.ticket: ~15 rows (lebih kurang)
INSERT INTO `ticket` (`ticketID`, `transactionID`, `showtimeID`, `seatID`, `price`, `ticketCode`, `ticketStatus`) VALUES
	(1, 1, 1, 1, 50000.00, 'TKT001', 'Unused'),
	(2, 2, 2, 2, 50000.00, 'TKT002', 'Unused'),
	(3, 3, 3, 3, 50000.00, 'TKT003', 'Unused'),
	(4, 4, 4, 4, 50000.00, 'TKT004', 'Unused'),
	(5, 5, 5, 5, 50000.00, 'TKT005', 'Unused'),
	(6, 6, 6, 6, 50000.00, 'TKT006', 'Unused'),
	(13, 12, 2, 52, 50000.00, 'TKT-20261010-63EE56', 'Unused'),
	(14, 13, 15, 103, 50000.00, 'TKT25476', 'Unused'),
	(15, 13, 15, 104, 50000.00, 'TKT57505', 'Unused'),
	(16, 14, 16, 113, 50000.00, 'TKT73179', 'Unused'),
	(17, 15, 21, 213, 50000.00, 'TKT42476', 'Unused'),
	(18, 15, 21, 214, 50000.00, 'TKT32794', 'Unused'),
	(19, 16, 16, 122, 50000.00, 'TKT77132', 'Unused'),
	(20, 16, 16, 123, 50000.00, 'TKT60873', 'Unused'),
	(21, 17, 4, 165, 50000.00, 'TKT35412', 'Unused');

-- membuang struktur untuk table db_movieticket.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `transactionID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel db_movieticket.transactions: ~9 rows (lebih kurang)
INSERT INTO `transactions` (`transactionID`, `customerID`, `total`, `payment_method`, `transaction_date`) VALUES
	(1, 1, 50000.00, 'QRIS', '2026-10-18 00:00:00'),
	(2, 2, 50000.00, 'QRIS', '2026-10-18 00:00:00'),
	(3, 3, 50000.00, 'QRIS', '2026-10-19 00:00:00'),
	(4, 4, 50000.00, 'QRIS', '2026-10-19 00:00:00'),
	(5, 10, 50000.00, 'QRIS', '2026-10-19 00:00:00'),
	(6, 11, 50000.00, 'QRIS', '2026-10-19 00:00:00'),
	(12, 1, 50000.00, 'QRIS', '2026-10-10 16:56:26'),
	(13, 2, 100000.00, 'QRIS', '2026-10-13 21:07:56'),
	(14, 2, 50000.00, 'QRIS', '2026-10-13 22:55:42'),
	(15, 17, 100000.00, 'QRIS', '2026-10-18 17:17:33'),
	(16, 17, 100000.00, 'QRIS', '2026-10-19 09:11:39'),
	(17, 17, 50000.00, 'QRIS', '2026-10-19 14:42:58');

-- membuang struktur untuk trigger db_movieticket.cek_kesesuaian_studio
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cek_kesesuaian_studio` BEFORE INSERT ON `ticket` FOR EACH ROW BEGIN
    DECLARE studio_from_showtime INT;
    DECLARE studio_from_seat INT;

    -- Ambil studioID dari tabel showtime berdasarkan jadwal yang dipilih
    SELECT studioID INTO studio_from_showtime 
    FROM showtime 
    WHERE showtimeID = NEW.showtimeID;

    -- Ambil studioID dari tabel seat berdasarkan kursi yang dipilih
    SELECT studioID INTO studio_from_seat 
    FROM seat 
    WHERE seatID = NEW.seatID;

    -- Batalkan transaksi jika ID studio tidak sama
    IF studio_from_showtime != studio_from_seat THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: The selected seat is not in the studio showing this schedule.';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
