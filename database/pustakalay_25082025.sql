-- --------------------------------------------------------
-- Host:                         143.110.189.33
-- Server version:               8.0.41 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pustakalay
CREATE DATABASE IF NOT EXISTS `pustakalay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pustakalay`;

-- Dumping structure for table pustakalay.books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_count` int NOT NULL,
  `bl_id` int NOT NULL,
  `b_createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`b_id`),
  KEY `fk_lib_2` (`bl_id`),
  CONSTRAINT `fk_lib_2` FOREIGN KEY (`bl_id`) REFERENCES `login` (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustakalay.books: ~4 rows (approximately)
DELETE FROM `books`;
INSERT INTO `books` (`b_id`, `b_title`, `b_author`, `b_genre`, `b_count`, `bl_id`, `b_createdAt`, `b_updatedAt`) VALUES
	(1, 'demo book 1', 'demo', 'राजनीति', 21, 6, '2025-08-09 20:33:02', '2025-08-16 17:52:04'),
	(2, 'harry potter part 1', 'JK Bowling', 'कहानी', 3, 6, '2025-08-10 18:12:57', '2025-08-17 06:40:44'),
	(3, 'dummybook', 'writer', 'साहित्य', 2, 6, '2025-08-16 04:40:28', '2025-08-16 04:41:40'),
	(5, 'harry potter part 2', 'JK Rowling ', 'कहानी', 2, 7, '2025-08-17 06:38:31', '2025-08-17 06:43:41');

-- Dumping structure for table pustakalay.destination
DROP TABLE IF EXISTS `destination`;
CREATE TABLE IF NOT EXISTS `destination` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `tb_id` int NOT NULL,
  `t_destination` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tb_count` int NOT NULL,
  `t_createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`t_id`),
  KEY `fk_book_2` (`tb_id`),
  CONSTRAINT `fk_book_2` FOREIGN KEY (`tb_id`) REFERENCES `books` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustakalay.destination: ~3 rows (approximately)
DELETE FROM `destination`;
INSERT INTO `destination` (`t_id`, `tb_id`, `t_destination`, `tb_count`, `t_createdAt`, `t_updatedAt`) VALUES
	(1, 1, 'Collectorate', 5, '2025-08-09 21:31:48', '2025-08-09 21:31:48'),
	(2, 2, 'CHMO', 1, '2025-08-16 17:46:23', '2025-08-16 17:46:23'),
	(3, 5, 'child department', 1, '2025-08-17 06:43:41', '2025-08-17 06:43:41');

-- Dumping structure for table pustakalay.donations
DROP TABLE IF EXISTS `donations`;
CREATE TABLE IF NOT EXISTS `donations` (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `du_id` int NOT NULL,
  `dl_id` int NOT NULL,
  `db_id` int NOT NULL,
  `d_count` int NOT NULL,
  `d_createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `d_updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`d_id`),
  KEY `fk_user_3` (`du_id`),
  KEY `fk_lib_4` (`dl_id`),
  KEY `fk_book_1` (`db_id`),
  CONSTRAINT `fk_book_1` FOREIGN KEY (`db_id`) REFERENCES `books` (`b_id`),
  CONSTRAINT `fk_lib_4` FOREIGN KEY (`dl_id`) REFERENCES `login` (`l_id`),
  CONSTRAINT `fk_user_3` FOREIGN KEY (`du_id`) REFERENCES `donors` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustakalay.donations: ~11 rows (approximately)
DELETE FROM `donations`;
INSERT INTO `donations` (`d_id`, `du_id`, `dl_id`, `db_id`, `d_count`, `d_createdat`, `d_updatedat`) VALUES
	(1, 1, 6, 1, 5, '2025-08-09 21:01:35', '2025-08-09 21:01:35'),
	(2, 1, 6, 1, 5, '2025-08-10 17:18:52', '2025-08-10 17:18:52'),
	(3, 2, 6, 1, 5, '2025-08-10 17:19:55', '2025-08-10 17:19:55'),
	(4, 2, 6, 1, 5, '2025-08-10 18:03:59', '2025-08-10 18:03:59'),
	(5, 3, 6, 1, 5, '2025-08-10 18:07:29', '2025-08-10 18:07:29'),
	(6, 4, 6, 2, 1, '2025-08-10 18:13:31', '2025-08-10 18:13:31'),
	(7, 5, 6, 3, 2, '2025-08-16 04:41:40', '2025-08-16 04:41:40'),
	(8, 4, 6, 1, 1, '2025-08-16 17:52:04', '2025-08-16 17:52:04'),
	(9, 6, 7, 2, 2, '2025-08-17 06:39:19', '2025-08-17 06:39:19'),
	(10, 6, 7, 5, 3, '2025-08-17 06:39:19', '2025-08-17 06:39:19'),
	(11, 6, 7, 2, 1, '2025-08-17 06:40:44', '2025-08-17 06:40:44');

-- Dumping structure for table pustakalay.donors
DROP TABLE IF EXISTS `donors`;
CREATE TABLE IF NOT EXISTS `donors` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `u_mobile` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ul_id` int NOT NULL,
  `u_createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`u_id`),
  KEY `fk_lib_1` (`ul_id`),
  CONSTRAINT `fk_lib_1` FOREIGN KEY (`ul_id`) REFERENCES `login` (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustakalay.donors: ~7 rows (approximately)
DELETE FROM `donors`;
INSERT INTO `donors` (`u_id`, `u_name`, `u_mobile`, `ul_id`, `u_createdat`, `u_updatedat`) VALUES
	(1, 'demo user 1', '9999999999', 6, '2025-08-09 20:32:31', '2025-08-09 20:32:31'),
	(2, 'demo2', '8888888888', 6, '2025-08-10 17:19:27', '2025-08-10 17:19:27'),
	(3, 'tanmay', '5623865649', 6, '2025-08-10 18:06:51', '2025-08-10 18:06:51'),
	(4, 'Yashwant Nayak', '6260064660', 6, '2025-08-10 18:12:05', '2025-08-10 18:12:05'),
	(5, 'dummy donor', '9876543210', 6, '2025-08-16 04:39:05', '2025-08-16 17:11:34'),
	(6, 'shreyansh', '9292929292', 7, '2025-08-17 06:37:14', '2025-08-17 06:37:14'),
	(7, 'tanmay', '6261193015', 6, '2025-08-24 03:37:15', '2025-08-24 03:37:15');

-- Dumping structure for table pustakalay.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_path` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_user_id` int NOT NULL,
  `f_lib_id` int NOT NULL,
  `f_createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `f_updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`f_id`),
  KEY `fk_user_2` (`f_user_id`),
  KEY `fk_lib_3` (`f_lib_id`),
  CONSTRAINT `fk_lib_3` FOREIGN KEY (`f_lib_id`) REFERENCES `login` (`l_id`),
  CONSTRAINT `fk_user_2` FOREIGN KEY (`f_user_id`) REFERENCES `donors` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustakalay.files: ~14 rows (approximately)
DELETE FROM `files`;
INSERT INTO `files` (`f_id`, `f_path`, `f_user_id`, `f_lib_id`, `f_createdat`, `f_updatedat`) VALUES
	(1, 'cert_1_compressed_scaled_478bb90d-86ed-4026-a6bb-d1cf327641f91870572987420853004_1754846329.jpg', 1, 6, '2025-08-10 17:18:49', '2025-08-10 17:18:49'),
	(2, 'cert_1_compressed_scaled_478bb90d-86ed-4026-a6bb-d1cf327641f91870572987420853004_1754846329.jpg', 1, 6, '2025-08-10 17:18:52', '2025-08-10 17:18:52'),
	(3, 'cert_2_compressed_scaled_87234d06-b168-4eec-8468-7ad1714f18f1848701094182617319_1754846390.jpg', 2, 6, '2025-08-10 17:19:50', '2025-08-10 17:19:50'),
	(4, 'cert_2_compressed_scaled_87234d06-b168-4eec-8468-7ad1714f18f1848701094182617319_1754846390.jpg', 2, 6, '2025-08-10 17:19:55', '2025-08-10 17:19:55'),
	(5, 'cert_2_compressed_scaled_72029e79-3c61-4f3b-abed-4ad15dae91907660022380241410617_1754849036.jpg', 2, 6, '2025-08-10 18:03:56', '2025-08-10 18:03:56'),
	(6, 'cert_2_compressed_scaled_72029e79-3c61-4f3b-abed-4ad15dae91907660022380241410617_1754849036.jpg', 2, 6, '2025-08-10 18:03:59', '2025-08-10 18:03:59'),
	(7, 'cert_3_compressed_scaled_3cd5bfc6-2041-40d8-a009-10899bdf250e1118689246943174121_1754849248.jpg', 3, 6, '2025-08-10 18:07:28', '2025-08-10 18:07:28'),
	(8, 'cert_3_compressed_scaled_3cd5bfc6-2041-40d8-a009-10899bdf250e1118689246943174121_1754849248.jpg', 3, 6, '2025-08-10 18:07:29', '2025-08-10 18:07:29'),
	(9, 'cert_4_compressed_scaled_136d9ee6-befa-41ff-ac4b-7d7e476d0d3a5372653274120727383_1755366719.jpg', 4, 6, '2025-08-16 17:51:59', '2025-08-16 17:51:59'),
	(10, 'cert_4_compressed_scaled_136d9ee6-befa-41ff-ac4b-7d7e476d0d3a5372653274120727383_1755366719.jpg', 4, 6, '2025-08-16 17:52:04', '2025-08-16 17:52:04'),
	(11, 'cert_6_compressed_scaled_938b7094-a4cd-4e7d-98d4-bf6762d5fedc844026301700568654_1755412752.jpg', 6, 7, '2025-08-17 06:39:12', '2025-08-17 06:39:12'),
	(12, 'cert_6_compressed_scaled_938b7094-a4cd-4e7d-98d4-bf6762d5fedc844026301700568654_1755412752.jpg', 6, 7, '2025-08-17 06:39:19', '2025-08-17 06:39:19'),
	(13, 'cert_6_compressed_scaled_c9ec95b4-6795-465e-b486-e3a26b11ff9c3193679810861142290_1755412840.jpg', 6, 7, '2025-08-17 06:40:40', '2025-08-17 06:40:40'),
	(14, 'cert_6_compressed_scaled_c9ec95b4-6795-465e-b486-e3a26b11ff9c3193679810861142290_1755412840.jpg', 6, 7, '2025-08-17 06:40:44', '2025-08-17 06:40:44');

-- Dumping structure for table pustakalay.login
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `l_id` int NOT NULL AUTO_INCREMENT,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_role` enum('admin','librarian') COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `l_updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pustakalay.login: ~3 rows (approximately)
DELETE FROM `login`;
INSERT INTO `login` (`l_id`, `l_name`, `l_email`, `l_password`, `l_mobile`, `l_role`, `l_createdAt`, `l_updatedAt`) VALUES
	(1, 'S_Admin', 'sadmin@example.com', '123456', '9999999999', 'admin', '2025-08-09 19:30:08', '2025-08-09 21:31:20'),
	(2, 'Admin', 'admin@example.com', '12345678', '9999999998', 'admin', '2025-08-09 19:30:08', '2025-08-24 16:42:05'),
	(6, 'Librarian One', 'lib1@example.com', 'lib123', '9999999999', 'librarian', '2025-08-09 20:04:13', '2025-08-17 06:26:13'),
	(7, 'Librarian Two', 'lib2@example.com', 'lib456', '9999955555', 'librarian', '2025-08-17 06:34:29', '2025-08-17 06:35:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
