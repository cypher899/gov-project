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


-- Dumping database structure for dhadkan
CREATE DATABASE IF NOT EXISTS `dhadkan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dhadkan`;

-- Dumping structure for table dhadkan.admins
DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dhadkan.admins: ~0 rows (approximately)
DELETE FROM `admins`;
INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
	(1, 'Admin', 'admin@gmail.com', '$2y$10$.zlx.Qrp5g1MGuKtyFXK1esMc/jDgtkqkrhmiXuPPgjHSZYqQLZby', 'admin', '2025-07-30 21:33:25');

-- Dumping structure for table dhadkan.children
DROP TABLE IF EXISTS `children`;
CREATE TABLE IF NOT EXISTS `children` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dr_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('पुरुष','महिला') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fatherName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobileNo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schoolName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haveAadhar` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `haveShramik` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `aadharPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shramikPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heartStatus` enum('संदिग्ध','संदेह नहीं') COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobileNo` (`mobileNo`),
  KEY `fk_doctor_id` (`dr_id`),
  CONSTRAINT `fk_doctor_id` FOREIGN KEY (`dr_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dhadkan.children: ~2 rows (approximately)
DELETE FROM `children`;
INSERT INTO `children` (`id`, `dr_id`, `name`, `age`, `gender`, `fatherName`, `mobileNo`, `schoolName`, `haveAadhar`, `haveShramik`, `aadharPhoto`, `shramikPhoto`, `heartStatus`, `notes`, `createdat`) VALUES
	(2, 1, 'राहुल शर्मा', 8, 'पुरुष', 'विकास शर्मा', '9876543210', 'सरस्वती विद्यालय', 'yes', 'no', 'uploads/aadhar_1754241361.jpg', '', 'संदेह नहीं', 'स्वस्थ बच्चा', '2025-08-03 17:16:01'),
	(3, 1, 'dgfdgfg', 15, 'पुरुष', 'dsfgvdfgfv', '7894651230', 'fdfvdvdfv', 'yes', 'no', '', '', 'संदेह नहीं', 'fvfvfvfv', '2025-08-03 17:16:28'),
	(4, 1, 'ravi', 15, 'पुरुष', 'kishan', '7896541230', 'avbc', 'yes', 'no', '', '', 'संदेह नहीं', 'normal', '2025-08-03 17:25:12');

-- Dumping structure for table dhadkan.doctors
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospitalType` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hospitalname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience` int DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dhadkan.doctors: ~3 rows (approximately)
DELETE FROM `doctors`;
INSERT INTO `doctors` (`id`, `doctorName`, `hospitalType`, `hospitalname`, `phoneNo`, `experience`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
	(1, 'Dr. Test Doctor', 'Government', 'Test Hospital', '9876543210', 5, 'doctor@gmail.com', '$2y$10$ds2waE14puoHBs4zOMi5cOqSQCV98WpbLjxH78jyzgYvZnlI4z6HW', '2025-07-30 16:41:24', '2025-07-30 16:41:24'),
	(3, 'Dr. Ram', 'सरकारी', 'AIIMS', '8523691470', 7, 'ram@gmail.com', '$2y$10$zAlOzFzW9aYntxPMFi.RaeRd2tfu6hCL1rAyxk897/f2J9HCGhD.K', '2025-08-02 20:56:32', '2025-08-03 11:39:43');

-- Dumping structure for table dhadkan.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `e_dr_id` int NOT NULL,
  `e_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_age` int DEFAULT NULL,
  `e_gender` enum('पुरुष','महिला') COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_mobileNo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_schoolName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_haveAadhar` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_haveShramik` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_aadharPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_shramikPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_heartStatus` enum('संदिग्ध','संदेह नहीं') COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_notes` text COLLATE utf8mb4_unicode_ci,
  `e_createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `e_mobileNo` (`e_mobileNo`),
  KEY `fk_employee_dr_id` (`e_dr_id`),
  CONSTRAINT `fk_employee_dr_id` FOREIGN KEY (`e_dr_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dhadkan.employee: ~2 rows (approximately)
DELETE FROM `employee`;
INSERT INTO `employee` (`e_id`, `e_dr_id`, `e_name`, `e_age`, `e_gender`, `e_mobileNo`, `e_schoolName`, `e_haveAadhar`, `e_haveShramik`, `e_aadharPhoto`, `e_shramikPhoto`, `e_heartStatus`, `e_notes`, `e_createdat`) VALUES
	(1, 1, 'test2', 33, 'पुरुष', '9638520741', 'abcd', 'yes', 'yes', NULL, NULL, 'संदिग्ध', 'need attention', '2025-08-02 18:09:09'),
	(2, 1, 'ramu', 36, 'पुरुष', '8754123690', 'SSIPMT', 'yes', 'yes', NULL, NULL, 'संदिग्ध', 'need attention', '2025-08-03 11:43:15'),
	(3, 1, 'baburao', 35, 'पुरुष', '6547893210', 'avbc', 'yes', 'yes', NULL, NULL, 'संदेह नहीं', 'normal', '2025-08-03 17:27:14');

-- Dumping structure for table dhadkan.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_dr_id` int NOT NULL,
  `t_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_age` int DEFAULT NULL,
  `t_gender` enum('पुरुष','महिला') COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_mobileNo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_schoolName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_haveAadhar` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_haveShramik` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_aadharPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_shramikPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_heartStatus` enum('संदिग्ध','संदेह नहीं') COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_notes` text COLLATE utf8mb4_unicode_ci,
  `t_createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `t_mobileNo` (`t_mobileNo`),
  KEY `fk_teacher_dr_id` (`t_dr_id`),
  CONSTRAINT `fk_teacher_dr_id` FOREIGN KEY (`t_dr_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dhadkan.teacher: ~4 rows (approximately)
DELETE FROM `teacher`;
INSERT INTO `teacher` (`t_id`, `t_dr_id`, `t_name`, `t_age`, `t_gender`, `t_mobileNo`, `t_schoolName`, `t_haveAadhar`, `t_haveShramik`, `t_aadharPhoto`, `t_shramikPhoto`, `t_heartStatus`, `t_notes`, `t_createdat`) VALUES
	(1, 1, 'test1', 7, 'पुरुष', '7894561230', 'ABC School', 'yes', 'no', NULL, NULL, 'संदेह नहीं', 'Normal', '2025-08-02 18:05:16'),
	(2, 1, 'test3', 60, 'पुरुष', '7391865420', 'avbc', 'yes', 'no', NULL, NULL, 'संदेह नहीं', 'normal', '2025-08-03 07:20:57'),
	(3, 1, 'RSD', 45, 'पुरुष', '9563214780', 'SSIPMT', 'yes', 'no', NULL, NULL, 'संदेह नहीं', 'Normal', '2025-08-03 11:42:29'),
	(4, 1, 'dfdfvdsv', 37, 'पुरुष', '5552765776', 'rfgrfgr', 'no', 'no', NULL, NULL, 'संदेह नहीं', '', '2025-08-03 12:56:56'),
	(5, 1, 'rahul', 34, 'पुरुष', '6589741230', 'avbc', 'yes', 'no', NULL, NULL, 'संदिग्ध', 'need attention', '2025-08-03 17:26:35');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
