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


-- Dumping database structure for mediguru
CREATE DATABASE IF NOT EXISTS `mediguru` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mediguru`;

-- Dumping structure for table mediguru.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `m_id` int NOT NULL,
  `pre_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attend_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_2` (`m_id`),
  CONSTRAINT `fk_2` FOREIGN KEY (`m_id`) REFERENCES `meetings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mediguru.files: ~26 rows (approximately)
DELETE FROM `files`;
INSERT INTO `files` (`id`, `m_id`, `pre_url`, `attend_url`, `post_url`, `registered_url`, `created_at`) VALUES
	(11, 3, NULL, NULL, NULL, 'registered_3_3_1754299749.json', '2025-08-04 09:29:09'),
	(12, 3, NULL, NULL, NULL, 'registered_3_3_1754299877.json', '2025-08-04 09:31:17'),
	(13, 3, NULL, NULL, NULL, 'registered_3_3_1754299910.json', '2025-08-04 09:31:50'),
	(14, 3, NULL, NULL, NULL, 'registered_3_3_1754299997.json', '2025-08-04 09:33:17'),
	(15, 3, NULL, 'attendance_3_3_1754300071.json', NULL, NULL, '2025-08-04 09:34:31'),
	(16, 3, NULL, 'attendance_3_3_1754300110.json', NULL, NULL, '2025-08-04 09:35:10'),
	(17, 3, NULL, 'attendance_3_3_1754300174.json', NULL, NULL, '2025-08-04 09:36:14'),
	(18, 3, NULL, 'attendance_3_3_1754300428.json', NULL, NULL, '2025-08-04 09:40:28'),
	(19, 3, NULL, 'attendance_3_3_1754300447.json', NULL, NULL, '2025-08-04 09:40:47'),
	(20, 3, NULL, 'attendance_3_3_1754305269.json', NULL, NULL, '2025-08-04 11:01:09'),
	(21, 3, NULL, 'attendance_3_3_1754305296.json', NULL, NULL, '2025-08-04 11:01:36'),
	(22, 3, NULL, 'attendance_3_3_1754305570.json', NULL, NULL, '2025-08-04 11:06:10'),
	(23, 3, NULL, 'attendance_3_3_1754305599.json', NULL, NULL, '2025-08-04 11:06:39'),
	(24, 3, NULL, 'attendance_3_3_1754305644.json', NULL, NULL, '2025-08-04 11:07:24'),
	(25, 3, NULL, 'attendance_3_1_1754305739.json', NULL, NULL, '2025-08-04 11:08:59'),
	(26, 3, NULL, 'attendance_3_3_1754319527.json', NULL, NULL, '2025-08-04 14:58:47'),
	(27, 3, NULL, 'attendance_3_3_1754320235.json', NULL, NULL, '2025-08-04 15:10:35'),
	(28, 3, NULL, 'attendance_3_3_1754322134.json', NULL, NULL, '2025-08-04 15:42:14'),
	(29, 3, NULL, 'attendance_3_3_1754322622.json', NULL, NULL, '2025-08-04 15:50:22'),
	(60, 5, NULL, NULL, NULL, 'registered_5_1_1754774286.json', '2025-08-09 21:18:06'),
	(61, 5, NULL, 'attendance_5_1_1754774322.json', NULL, NULL, '2025-08-09 21:18:42'),
	(62, 5, NULL, 'attendance_5_1_1754774387.json', NULL, NULL, '2025-08-09 21:19:47'),
	(63, 3, NULL, 'attendance_3_1_1755202253.json', NULL, NULL, '2025-08-14 20:10:53'),
	(64, 3, NULL, 'attendance_3_1_1755202293.json', NULL, NULL, '2025-08-14 20:11:33'),
	(65, 3, NULL, 'attendance_3_1_1755202328.json', NULL, NULL, '2025-08-14 20:12:08'),
	(66, 3, NULL, 'attendance_3_1_1755202385.json', NULL, NULL, '2025-08-14 20:13:05'),
	(67, 3, NULL, 'attendance_3_1_1755202563.json', NULL, NULL, '2025-08-14 20:16:03');

-- Dumping structure for table mediguru.meetings
DROP TABLE IF EXISTS `meetings`;
CREATE TABLE IF NOT EXISTS `meetings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `topic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hosters` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_1` (`created_by`),
  CONSTRAINT `fk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mediguru.meetings: ~3 rows (approximately)
DELETE FROM `meetings`;
INSERT INTO `meetings` (`id`, `name`, `date`, `time`, `topic`, `hosters`, `created_by`, `created_at`) VALUES
	(3, 'Online Physician Training', '2025-07-31', '03:00:00', 'Snake bite and its management', 'Dr. Kapil Chahal', 3, '2025-08-14 20:17:33'),
	(5, 'Weekly Session of Mediguru - Dengue', '2025-08-07', '15:00:00', 'Dengue - Clinicians Dilemma & One Disease , Many Dimesnsions!!', 'Dr Neha Rastogi panda', 3, '2025-08-14 20:17:13');

-- Dumping structure for table mediguru.meeting_attendance
DROP TABLE IF EXISTS `meeting_attendance`;
CREATE TABLE IF NOT EXISTS `meeting_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `participant_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `login_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attended_time` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_by` int NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_meeting_participant` (`meeting_id`,`participant_name`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `meeting_attendance_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_attendance_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mediguru.meeting_attendance: ~134 rows (approximately)
DELETE FROM `meeting_attendance`;
INSERT INTO `meeting_attendance` (`id`, `meeting_id`, `participant_name`, `login_time`, `attended_time`, `uploaded_by`, `recorded_at`) VALUES
	(750, 5, 'DR PANKAJ KISHORE', '1:48:00 PM', '168 mins', 1, '2025-08-09 21:19:47'),
	(751, 5, 'Dr. Riya suman', '1:49:00 PM', '167 mins', 1, '2025-08-09 21:19:47'),
	(752, 5, 'Dr vikas tiwari', '1:50:00 PM', '166 mins', 1, '2025-08-09 21:19:47'),
	(753, 5, 'Ashish Kumar Sinha', '1:50:00 PM', '165 mins', 1, '2025-08-09 21:19:47'),
	(754, 5, 'Dr Sunil Sahu', '1:51:00 PM', '165 mins', 1, '2025-08-09 21:19:47'),
	(755, 5, 'Dr. Sargam Yerewar', '1:53:00 PM', '163 mins', 1, '2025-08-09 21:19:47'),
	(756, 5, 'Dr Roshan Singh', '1:56:00 PM', '159 mins', 1, '2025-08-09 21:19:47'),
	(757, 5, 'RICKY JAIN', '1:58:00 PM', '158 mins', 1, '2025-08-09 21:19:47'),
	(758, 5, 'Ankur Mukherjee', '1:58:00 PM', '157 mins', 1, '2025-08-09 21:19:47'),
	(759, 5, 'Dr. Sparsh Bais', '1:59:00 PM', '156 mins', 1, '2025-08-09 21:19:47'),
	(760, 5, 'Dr Jyotish tandon', '2:01:00 PM', '155 mins', 1, '2025-08-09 21:19:47'),
	(761, 5, 'Shivendra Singh Marai', '2:04:00 PM', '152 mins', 1, '2025-08-09 21:19:47'),
	(762, 5, 'Nandlal bhuaarya', '2:12:00 PM', '144 mins', 1, '2025-08-09 21:19:47'),
	(763, 5, 'Tanvi Tigga', '2:16:00 PM', '140 mins', 1, '2025-08-09 21:19:47'),
	(764, 5, 'Hari Mohan Singh', '2:16:00 PM', '139 mins', 1, '2025-08-09 21:19:47'),
	(765, 5, 'Bindu dhruw', '2:17:00 PM', '138 mins', 1, '2025-08-09 21:19:47'),
	(766, 5, 'Mayank Sharma', '2:20:00 PM', '135 mins', 1, '2025-08-09 21:19:47'),
	(767, 5, 'Shrawan kumar tiwari', '2:21:00 PM', '135 mins', 1, '2025-08-09 21:19:47'),
	(768, 5, 'Mridula', '2:21:00 PM', '134 mins', 1, '2025-08-09 21:19:47'),
	(769, 5, 'Dr Bhoopesh Kumar Nayak', '2:23:00 PM', '132 mins', 1, '2025-08-09 21:19:47'),
	(770, 5, 'Pushpa shah', '2:25:00 PM', '130 mins', 1, '2025-08-09 21:19:47'),
	(771, 5, 'Alpana Tigga', '2:39:00 PM', '117 mins', 1, '2025-08-09 21:19:47'),
	(772, 5, 'Rahul', '2:49:00 PM', '107 mins', 1, '2025-08-09 21:19:47'),
	(773, 5, 'Manju Dinkar', '2:49:00 PM', '107 mins', 1, '2025-08-09 21:19:47'),
	(774, 5, 'Roshni ratrey rma', '2:50:00 PM', '105 mins', 1, '2025-08-09 21:19:47'),
	(775, 5, 'Sweta Singh', '2:51:00 PM', '105 mins', 1, '2025-08-09 21:19:47'),
	(776, 5, 'Dr Vijay Laxmi Anant', '2:51:00 PM', '105 mins', 1, '2025-08-09 21:19:47'),
	(777, 5, 'DR ASHISH', '2:51:00 PM', '104 mins', 1, '2025-08-09 21:19:47'),
	(778, 5, 'Dr. Ayushi Parmar', '2:54:00 PM', '102 mins', 1, '2025-08-09 21:19:47'),
	(779, 5, 'Dr. Pramila. KÃºmari', '2:54:00 PM', '101 mins', 1, '2025-08-09 21:19:47'),
	(780, 5, 'Richa Verma', '2:55:00 PM', '100 mins', 1, '2025-08-09 21:19:47'),
	(781, 5, 'Dr. Shubham Bhandari', '2:56:00 PM', '99 mins', 1, '2025-08-09 21:19:47'),
	(782, 5, 'Dr Shailendra Kesharwani', '2:57:00 PM', '98 mins', 1, '2025-08-09 21:19:47'),
	(783, 5, 'Shweta Shrivastava', '2:58:00 PM', '98 mins', 1, '2025-08-09 21:19:47'),
	(784, 5, 'Dr Nivedita k Lakra medical officer', '2:59:00 PM', '96 mins', 1, '2025-08-09 21:19:47'),
	(785, 5, 'Ritambhara Sharma', '2:59:00 PM', '96 mins', 1, '2025-08-09 21:19:47'),
	(786, 5, 'Renuka kashyap', '3:01:00 PM', '94 mins', 1, '2025-08-09 21:19:47'),
	(787, 5, 'Rameet Singh Gandhi', '3:02:00 PM', '93 mins', 1, '2025-08-09 21:19:47'),
	(788, 5, 'Dr priti nikhare', '3:03:00 PM', '93 mins', 1, '2025-08-09 21:19:47'),
	(789, 5, 'Nikita Gupta', '3:03:00 PM', '93 mins', 1, '2025-08-09 21:19:47'),
	(790, 5, 'Dr.shakuntala xalxo', '3:03:00 PM', '92 mins', 1, '2025-08-09 21:19:47'),
	(791, 5, 'Dr.Arjun Singh Banjare', '3:04:00 PM', '92 mins', 1, '2025-08-09 21:19:47'),
	(792, 5, 'Dr. Jasmine chawda', '3:09:00 PM', '87 mins', 1, '2025-08-09 21:19:47'),
	(793, 5, 'Manisha Dhimar', '3:12:00 PM', '84 mins', 1, '2025-08-09 21:19:47'),
	(794, 5, 'Dr Shikhar Chepe', '3:16:00 PM', '80 mins', 1, '2025-08-09 21:19:47'),
	(795, 5, 'Dr. Ankit Khandelwal', '3:17:00 PM', '78 mins', 1, '2025-08-09 21:19:47'),
	(796, 5, 'VIRENDRA KUMAR SINHA', '3:19:00 PM', '76 mins', 1, '2025-08-09 21:19:47'),
	(797, 5, 'Vaishali verma', '3:20:00 PM', '76 mins', 1, '2025-08-09 21:19:47'),
	(798, 5, 'Karishma sahu', '3:21:00 PM', '75 mins', 1, '2025-08-09 21:19:47'),
	(799, 5, 'Nidhi', '3:21:00 PM', '75 mins', 1, '2025-08-09 21:19:47'),
	(800, 5, 'Dr vikas singh', '3:23:00 PM', '72 mins', 1, '2025-08-09 21:19:47'),
	(801, 5, 'Rani Sahu', '3:24:00 PM', '72 mins', 1, '2025-08-09 21:19:47'),
	(802, 5, 'Diksha sahu', '3:24:00 PM', '72 mins', 1, '2025-08-09 21:19:47'),
	(803, 5, 'Meera verma', '3:25:00 PM', '70 mins', 1, '2025-08-09 21:19:47'),
	(804, 5, 'Rini Gardia', '3:26:00 PM', '70 mins', 1, '2025-08-09 21:19:47'),
	(805, 5, 'Dr Utkarsh Dev', '3:26:00 PM', '70 mins', 1, '2025-08-09 21:19:47'),
	(806, 5, 'Ashish kumar kewat', '3:26:00 PM', '69 mins', 1, '2025-08-09 21:19:47'),
	(807, 5, 'Shalvi verma', '3:26:00 PM', '69 mins', 1, '2025-08-09 21:19:47'),
	(808, 5, 'Suman banjare', '3:29:00 PM', '67 mins', 1, '2025-08-09 21:19:47'),
	(809, 5, 'Dr amogh', '3:29:00 PM', '67 mins', 1, '2025-08-09 21:19:47'),
	(810, 5, 'Shikha kushwaha', '3:29:00 PM', '67 mins', 1, '2025-08-09 21:19:47'),
	(811, 5, 'Divya Bharti', '3:29:00 PM', '67 mins', 1, '2025-08-09 21:19:47'),
	(812, 5, 'Dr.Uma paikera', '3:33:00 PM', '63 mins', 1, '2025-08-09 21:19:47'),
	(813, 5, 'Kamal Barman', '3:34:00 PM', '62 mins', 1, '2025-08-09 21:19:47'),
	(814, 5, 'Digeshwari sahu', '3:37:00 PM', '59 mins', 1, '2025-08-09 21:19:47'),
	(815, 5, 'Dr.Domar singh banjare', '3:38:00 PM', '57 mins', 1, '2025-08-09 21:19:47'),
	(816, 5, 'Sarita sahu', '3:40:00 PM', '56 mins', 1, '2025-08-09 21:19:47'),
	(817, 5, 'Thaneshwar sahu', '3:43:00 PM', '52 mins', 1, '2025-08-09 21:19:47'),
	(818, 5, 'Fuleshwari yadav', '3:44:00 PM', '52 mins', 1, '2025-08-09 21:19:47'),
	(819, 5, 'Aishwarya verma', '3:46:00 PM', '50 mins', 1, '2025-08-09 21:19:47'),
	(820, 5, 'Ritu Mahidhar', '3:48:00 PM', '48 mins', 1, '2025-08-09 21:19:47'),
	(821, 5, 'Payal verma', '3:49:00 PM', '46 mins', 1, '2025-08-09 21:19:47'),
	(822, 5, 'DR PRITI NARAIN', '3:56:00 PM', '39 mins', 1, '2025-08-09 21:19:47'),
	(823, 5, 'Bhagwat verma', '4:14:00 PM', '22 mins', 1, '2025-08-09 21:19:47'),
	(824, 5, 'Indu dhruw', '4:36:00 PM', '1 mins', 1, '2025-08-09 21:19:47'),
	(1061, 3, 'Dr parmeshwari lal', '14:21:01', '129 minutes', 1, '2025-08-14 20:16:03'),
	(1062, 3, 'Dr Vijay Laxmi Anant', '14:26:47', '123 minutes', 1, '2025-08-14 20:16:03'),
	(1063, 3, 'Nandlal bhuaarya', '14:27:07', '123 minutes', 1, '2025-08-14 20:16:03'),
	(1064, 3, 'Dr. Ankit Khandelwal', '14:27:33', '122 minutes', 1, '2025-08-14 20:16:03'),
	(1065, 3, 'Mridula', '14:27:52', '122 minutes', 1, '2025-08-14 20:16:03'),
	(1066, 3, 'DR PANKAJ KISHORE', '14:28:44', '121 minutes', 1, '2025-08-14 20:16:03'),
	(1067, 3, 'Nikita gupta', '14:29:46', '120 minutes', 1, '2025-08-14 20:16:03'),
	(1068, 3, 'RAHUL TIWARI', '14:31:34', '118 minutes', 1, '2025-08-14 20:16:03'),
	(1069, 3, 'DR.DIVYANK PANDEY', '14:33:28', '116 minutes', 1, '2025-08-14 20:16:03'),
	(1070, 3, 'Dr.Swagata Misra', '14:33:34', '116 minutes', 1, '2025-08-14 20:16:03'),
	(1071, 3, 'Ritambhara Sharma', '14:34:34', '115 minutes', 1, '2025-08-14 20:16:03'),
	(1072, 3, 'Rahul Agrawal', '14:39:18', '110 minutes', 1, '2025-08-14 20:16:03'),
	(1073, 3, 'Dr. Sargam Yerewar', '14:40:31', '109 minutes', 1, '2025-08-14 20:16:03'),
	(1074, 3, 'Shivendra Singh Marai', '14:41:16', '108 minutes', 1, '2025-08-14 20:16:03'),
	(1075, 3, 'Dr Roshan singh', '14:43:34', '106 minutes', 1, '2025-08-14 20:16:03'),
	(1076, 3, 'Dr shweta sonwani', '14:43:43', '106 minutes', 1, '2025-08-14 20:16:03'),
	(1077, 3, 'Dr Shivangi Vaishnav', '14:45:23', '104 minutes', 1, '2025-08-14 20:16:03'),
	(1078, 3, 'Dr Ritika Jenifer', '14:45:43', '104 minutes', 1, '2025-08-14 20:16:03'),
	(1079, 3, 'Dr Sonam Nayak', '14:51:37', '98 minutes', 1, '2025-08-14 20:16:03'),
	(1080, 3, 'Renuka kashyap', '14:51:38', '98 minutes', 1, '2025-08-14 20:16:03'),
	(1081, 3, 'Jasmine chawda', '14:52:03', '97 minutes', 1, '2025-08-14 20:16:03'),
	(1082, 3, 'Dr Jyotish', '14:53:05', '96 minutes', 1, '2025-08-14 20:16:03'),
	(1083, 3, 'RICKY JAIN', '14:54:29', '95 minutes', 1, '2025-08-14 20:16:03'),
	(1084, 3, 'Dr.Arjun Singh Banjare', '14:54:30', '95 minutes', 1, '2025-08-14 20:16:03'),
	(1085, 3, 'Hari Mohan Singh', '14:56:33', '93 minutes', 1, '2025-08-14 20:16:03'),
	(1086, 3, 'Ankur Mukherjee', '14:57:11', '92 minutes', 1, '2025-08-14 20:16:03'),
	(1087, 3, 'Manzer nawab', '14:59:12', '90 minutes', 1, '2025-08-14 20:16:03'),
	(1088, 3, 'Dr.Ashima Anthony', '14:59:22', '90 minutes', 1, '2025-08-14 20:16:03'),
	(1089, 3, 'Dr. Ayushi Parmar', '14:59:39', '90 minutes', 1, '2025-08-14 20:16:03'),
	(1090, 3, 'Ashish Meshram', '14:59:44', '90 minutes', 1, '2025-08-14 20:16:03'),
	(1091, 3, 'Dr.Tanvi Tigga', '15:01:11', '88 minutes', 1, '2025-08-14 20:16:03'),
	(1092, 3, 'Shrawan kumar tiwari', '15:01:19', '88 minutes', 1, '2025-08-14 20:16:03'),
	(1093, 3, 'Pratiksha Yadav', '15:01:42', '88 minutes', 1, '2025-08-14 20:16:03'),
	(1094, 3, 'Dr.Sparsh Bais', '15:01:47', '88 minutes', 1, '2025-08-14 20:16:03'),
	(1095, 3, 'Sweta Singh', '15:02:28', '87 minutes', 1, '2025-08-14 20:16:03'),
	(1096, 3, 'Dr. Ashish Kumar Sinha', '15:03:33', '86 minutes', 1, '2025-08-14 20:16:03'),
	(1097, 3, 'Dr Nivedita k Lakra', '15:04:16', '85 minutes', 1, '2025-08-14 20:16:03'),
	(1098, 3, 'Roshni Ratrey', '15:05:56', '84 minutes', 1, '2025-08-14 20:16:03'),
	(1099, 3, 'Dr priti nikhare', '15:06:44', '83 minutes', 1, '2025-08-14 20:16:03'),
	(1100, 3, 'Richa Verma', '15:07:07', '83 minutes', 1, '2025-08-14 20:16:03'),
	(1101, 3, 'gajendra dongre', '15:07:21', '82 minutes', 1, '2025-08-14 20:16:03'),
	(1102, 3, 'Anandi Nirmala Toppo', '15:07:31', '82 minutes', 1, '2025-08-14 20:16:03'),
	(1103, 3, 'Dr. Riya suman', '15:07:39', '82 minutes', 1, '2025-08-14 20:16:03'),
	(1104, 3, 'Dr Bhoopesh Kumar Nayak', '15:07:51', '82 minutes', 1, '2025-08-14 20:16:03'),
	(1105, 3, 'Dr Ashish Gupta', '15:08:55', '81 minutes', 1, '2025-08-14 20:16:03'),
	(1106, 3, 'Poonam singh', '15:09:27', '80 minutes', 1, '2025-08-14 20:16:03'),
	(1107, 3, 'Dr.shakuntala xalxo', '15:12:05', '77 minutes', 1, '2025-08-14 20:16:03'),
	(1108, 3, 'Dr Amita Howlader', '15:13:45', '76 minutes', 1, '2025-08-14 20:16:03'),
	(1109, 3, 'Rajshree deodhar', '15:13:48', '76 minutes', 1, '2025-08-14 20:16:03'),
	(1110, 3, 'Dr vikas tiwari', '15:14:38', '75 minutes', 1, '2025-08-14 20:16:03'),
	(1111, 3, 'Vaishalee', '15:17:27', '72 minutes', 1, '2025-08-14 20:16:03'),
	(1112, 3, 'Dr Mayank Sharma', '15:24:18', '65 minutes', 1, '2025-08-14 20:16:03'),
	(1113, 3, 'Shalvi verma', '15:28:35', '61 minutes', 1, '2025-08-14 20:16:03'),
	(1114, 3, 'Domar Singh', '15:30:17', '59 minutes', 1, '2025-08-14 20:16:03'),
	(1115, 3, 'Dr. Purnima patel', '15:32:09', '57 minutes', 1, '2025-08-14 20:16:03'),
	(1116, 3, 'Shweta Shrivastava', '15:44:57', '45 minutes', 1, '2025-08-14 20:16:03'),
	(1117, 3, 'Dr Rameet Singh Gandhi', '16:13:56', '16 minutes', 1, '2025-08-14 20:16:03'),
	(1118, 3, 'Shikhar', '16:18:10', '11 minutes', 1, '2025-08-14 20:16:03'),
	(1119, 3, 'Dr Thaneshwar sahu', '16:25:17', '4 minutes', 1, '2025-08-14 20:16:03');

-- Dumping structure for table mediguru.posttest_results
DROP TABLE IF EXISTS `posttest_results`;
CREATE TABLE IF NOT EXISTS `posttest_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` int NOT NULL,
  `total_marks` int NOT NULL DEFAULT '20',
  `percentage` decimal(5,2) GENERATED ALWAYS AS (((`score` * 100.0) / `total_marks`)) STORED,
  `uploaded_by` int NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_meeting_posttest` (`meeting_id`,`name`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `posttest_results_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posttest_results_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mediguru.posttest_results: ~0 rows (approximately)
DELETE FROM `posttest_results`;

-- Dumping structure for table mediguru.pretest_results
DROP TABLE IF EXISTS `pretest_results`;
CREATE TABLE IF NOT EXISTS `pretest_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` int NOT NULL,
  `total_marks` int NOT NULL DEFAULT '20',
  `percentage` decimal(5,2) GENERATED ALWAYS AS (((`score` * 100.0) / `total_marks`)) STORED,
  `uploaded_by` int NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_meeting_pretest` (`meeting_id`,`name`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `pretest_results_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pretest_results_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mediguru.pretest_results: ~0 rows (approximately)
DELETE FROM `pretest_results`;

-- Dumping structure for table mediguru.registered
DROP TABLE IF EXISTS `registered`;
CREATE TABLE IF NOT EXISTS `registered` (
  `id` int NOT NULL AUTO_INCREMENT,
  `m_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `block` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_3` (`m_id`),
  CONSTRAINT `fk_3` FOREIGN KEY (`m_id`) REFERENCES `meetings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mediguru.registered: ~139 rows (approximately)
DELETE FROM `registered`;
INSERT INTO `registered` (`id`, `m_id`, `name`, `designation`, `block`, `phone`) VALUES
	(61, 3, 'Dr parmeshwari lal', 'Medical officer', 'Uphc Kashiram nagar', '9575487977'),
	(62, 3, 'Dr Vijay Laxmi Anant', 'Block medical officer', 'Arang', '9407641343'),
	(63, 3, 'Nandlal bhuaarya', 'Mo', 'Phc rewa', '9424124599'),
	(64, 3, 'Dr. Ankit Khandelwal', 'Medical Officer', 'UCHC GUDHIYARI', '8055812220'),
	(65, 3, 'Mridula', 'Medical officer', 'Hirapur', '9901331599'),
	(66, 3, 'DR PANKAJ KISHORE', 'URBAN BMO', 'UPHC KACHNA', '8223949614'),
	(67, 3, 'Nikita gupta', 'Medical officer', 'Uphc bhanpuri', '9860189044'),
	(68, 3, 'RAHUL TIWARI', 'MO', 'UPHC DEVPURI', '9755206005'),
	(69, 3, 'DR.DIVYANK PANDEY', 'MEDICAL OFFICER', 'UPHC KACHNA', '9399084009'),
	(70, 3, 'Dr.Swagata Misra', 'Medical Officer', 'Uphc Heerapur', '9975925724'),
	(71, 3, 'Ritambhara Sharma', 'Medical officer', 'AAM, INDIAN CLUB. DHOBI TALAB.', '79999056568'),
	(72, 3, 'Rahul Agrawal', 'MO', 'UPHC MATHPURAINA', '9960635646'),
	(73, 3, 'Dr. Sargam Yerewar', 'Medical Officer', 'UHWC Geeta Nagar', '8319675929'),
	(74, 3, 'Shivendra Singh Marai', 'Medical Officer', 'UPHC Bhanpuri', '9981325612'),
	(75, 3, 'Dr Roshan singh', 'Medical officer', 'UPHC RAJATALAB', '7620838695'),
	(76, 3, 'Dr shweta sonwani', 'MO', 'Cmho raipur', '7047420939'),
	(77, 3, 'Dr Shivangi Vaishnav', 'PG Resident', 'CMHO office - Drp posting', '8770109002'),
	(78, 3, 'Dr Ritika Jenifer', 'Medical officer', 'Uphc bhatagaon', '8120511877'),
	(79, 3, 'Dr Sonam Nayak', 'Medical officer', 'PHCSILYARI', '9131502704'),
	(80, 3, 'Renuka kashyap', 'RMA', 'UPHC BORIYAKALA', '9098727892'),
	(81, 3, 'Jasmine chawda', 'Medical officr', 'Gondwara', '9827404800'),
	(82, 3, 'Dr Jyotish', 'Mo', 'Uphc mathpuraina', '7999272268'),
	(83, 3, 'RICKY JAIN', 'RMA', 'PHC FARFOUD', '9826864288'),
	(84, 3, 'Dr.Arjun Singh Banjare', 'Medical Officer', 'UAAM,Satnami Para, Sainath Colony,Raipur', '9754104126'),
	(85, 3, 'Hari Mohan Singh', 'RMA', 'PHC khilora', '8982430000'),
	(86, 3, 'Ankur Mukherjee', 'RMA', 'Siliyari', '9826162056'),
	(87, 3, 'Manzer nawab', 'Rma', 'Phc bhansoj', '9589841185'),
	(88, 3, 'Dr.Ashima Anthony', 'Medical officer', 'Civil hospital rakhi', '9958135478'),
	(89, 3, 'Dr. Ayushi Parmar', 'Medical officer', 'Rajendra nagar Hamar Clinic', '8770777014'),
	(90, 3, 'Ashish Meshram', 'Medical Officer', 'Civil hospital Mana', '7869109233'),
	(91, 3, 'Dr.Tanvi Tigga', 'Medical Officer', 'Civil hospital Rakhi nava Raipur', '7440446616'),
	(92, 3, 'Shrawan kumar tiwari', 'RMA', 'CHC Mandir hasaud', '9131147057'),
	(93, 3, 'Pratiksha Yadav', 'RMA', 'Uphc hirapur', '9589860288'),
	(94, 3, 'Dr.Sparsh Bais', 'Medical officer', 'UPHC Mathpurena', '8600663347'),
	(95, 3, 'Jasmine chawda', 'Medical officer', 'Ayushman arogya mandir gondwara', '9827404800'),
	(96, 3, 'Sweta Singh', 'Rma', 'Phc chandkhuri', '9982909663'),
	(97, 3, 'Dr. Ashish Kumar Sinha', 'Senior Medical Officer', 'C.H.C. Tilda', '9753782300'),
	(98, 3, 'Dr Nivedita k Lakra', 'Medical officer', 'ch mana', '9425227608'),
	(99, 3, 'Roshni Ratrey', 'Rma', 'Hwc kurud kutela', '8103640373'),
	(100, 3, 'Dr priti nikhare', 'Mo', 'UPHC Amaseoni', '8959680826'),
	(101, 3, 'Richa Verma', 'Medical officer', 'Dhobi talab Raipur CG', '7049754622'),
	(102, 3, 'gajendra dongre', 'jila midya prabhari', 'cmho office', '8109012988'),
	(103, 3, 'Anandi Nirmala Toppo', 'Medical officer', 'C.H.C Arang', '9425517977'),
	(104, 3, 'Dr. Riya suman', 'Medical officer', 'Uphc ramnagar', '8085079924'),
	(105, 3, 'Dr Bhoopesh Kumar Nayak', 'Medical Officer', '50 beded Uchc Ayurvedic campus', '9584752376'),
	(106, 3, 'Dr Ashish Gupta', 'Medical Officer', 'UCHC 50 BED HOSPITAL AYURVEDIC CAMPUS', '8871630770'),
	(107, 3, 'Poonam singh', 'Rma', 'phc khairkhunt', '9425262384'),
	(108, 3, 'Dr.shakuntala xalxo', 'MO', 'AAM Jorapara para', '9424143902'),
	(109, 3, 'Dr Amita Howlader', 'Mo', 'Devpuri', '8103718349'),
	(110, 3, 'Rajshree deodhar', 'SMO', 'Kharora', '9131008652'),
	(111, 3, 'Dr vikas tiwari', 'Bmo', 'Chc Dharsiwa', '9424128304'),
	(112, 3, 'Vaishalee', 'Intern', 'Mandir hasaud', '8435056695'),
	(113, 3, 'Dr Mayank Sharma', 'Medical officer', 'UHWC ASHWINI Nagar', '7987170282'),
	(114, 3, 'Shalvi verma', 'Mo', 'Rajatalab', '9970508816'),
	(115, 3, 'Domar Singh', 'MO', 'Uphc ,mowa raipur', '9340676233'),
	(116, 3, 'Dr. Purnima patel', 'MO', 'AAM KABEER NAGAR RAIPUR', '9425266447'),
	(117, 3, 'Shweta Shrivastava', 'Rma', 'Uphc Bhanpuri', '9669980002'),
	(118, 3, 'Dr Rameet Singh Gandhi', 'Medical officer(MO)', 'UPHC Gogaon( Uaam Shivanand Nagar)', '8558976363'),
	(119, 3, 'Shikhar', 'MO', 'UPHC Bhatagaon', '7000698030'),
	(120, 3, 'Dr Thaneshwar sahu', 'MO', 'UPHC RAJATALAB', '7340333412'),
	(121, 3, 'Vedansh Dubey', 'Intern', 'PHC Mandir Hasaud', '7000345613'),
	(122, 3, 'Muskan Rohra', 'Internship', 'Mandir hasod', '8871339754'),
	(123, 3, 'Shivam Garg', 'Intern', 'PHC Mandir Hasod', '+91 7471182867'),
	(124, 5, 'DR PANKAJ KISHORE', 'URBAN BMO', 'UPHC KACHNA', '8223949614'),
	(125, 5, 'Dr. Riya suman', 'Medical officer', 'Uphc ramnagar', '8085079924'),
	(126, 5, 'Dr vikas tiwari', 'BMO', 'Chc Dharsiwa', '9424128304'),
	(127, 5, 'Ashish Kumar Sinha', 'Senior Medical Officer', 'C.H.C. Tilda', '9753782300'),
	(128, 5, 'Dr Sunil Sahu', 'IMO', 'Uphc urla', '7389683097'),
	(129, 5, 'Dr. Sargam Yerewar', 'Medical Officer', 'UHWC Geeta Nagar Raipur', '8319675929'),
	(130, 5, 'Dr Roshan Singh', 'Medical officer', 'UPHC RAJATALAB', '7620838695'),
	(131, 5, 'RICKY JAIN', 'RMA', 'PHC FARFOUD', '9826864288'),
	(132, 5, 'Ankur Mukherjee', 'RMA', 'PHC Siliyari', '9826162056'),
	(133, 5, 'Dr. Sparsh Bais', 'Medical Officer', 'UPHC Mathpurena', '8600663347'),
	(134, 5, 'Dr Jyotish tandon', 'Mo', 'Uphcmathpuraina', '7566291759'),
	(135, 5, 'Shivendra Singh Marai', 'Medical Officer', 'UPHC Bhanpuri Raipur', '9981325612'),
	(136, 5, 'Nandlal bhuaarya', 'Mo', 'Phc rewa', '9424224599'),
	(137, 5, 'Tanvi Tigga', 'Medical Officer', 'Civil hospital rakhi', '7440446616'),
	(138, 5, 'Hari Mohan Singh', 'RMA', 'PHC khilora', '8982430000'),
	(139, 5, 'Bindu dhruw', 'Cho', 'Aam sondra', '7697822272'),
	(140, 5, 'Mayank Sharma', 'Medical officer', 'Ashwini Nagar', '7987170282'),
	(141, 5, 'Shrawan kumar tiwari', 'RMA', 'Chc Mandir hasaud', '9131147057'),
	(142, 5, 'Mridula', 'Medical officer', 'Hirapur', '9901331599'),
	(143, 5, 'Dr Bhoopesh Kumar Nayak', 'Medical officer', '50 Beded UCHC Ayurvedic campus Raipur', '9584752376'),
	(144, 5, 'Pushpa shah', 'RMA', 'Phc Silyari', '9926141823'),
	(145, 5, 'Alpana Tigga', 'Community health officer', 'AAM Giraud', '9340149050'),
	(146, 5, 'Rahul', 'Medical officer', 'UPHC DEVPURI', '9755206005'),
	(147, 5, 'Manju Dinkar', 'CHO', 'AAM charoda', '8964853192'),
	(148, 5, 'Roshni ratrey rma', 'Rma', 'Phc kurud kutela', '8103640373'),
	(149, 5, 'Sweta Singh', 'RMA', 'Phc Chandkhuri', '9981909663'),
	(150, 5, 'Dr Vijay Laxmi Anant', 'BMO arang', 'Chc arang', '9507641343'),
	(151, 5, 'DR ASHISH', 'Medical officer', 'Civil hospital Mana', '7869109233'),
	(152, 5, 'Dr. Ayushi Parmar', 'Medical officer', 'Rajendra nagar Hamar Clinic SSK Raipur Chhattisgarh', '8770777014'),
	(153, 5, 'Dr. Pramila. KÃºmari', 'M O', 'Uphc mowa', '9425586917'),
	(154, 5, 'Richa Verma', 'Medical Officer', 'AAM dhobhi talab Raipur', '7049754622'),
	(155, 5, 'Dr. Shubham Bhandari', 'Medical Officer', 'AAM, Kabir Nagar', '9399409987'),
	(156, 5, 'Pushpa shah', 'Rma', 'Phc Silyari', '9926141823'),
	(157, 5, 'Dr Shailendra Kesharwani', 'Medical Officer', 'AAM Chhattisgarh Nagar', '9425202084'),
	(158, 5, 'Shweta Shrivastava', 'RMA', 'Uphc Bhanpuri', '9669980002'),
	(159, 5, 'Dr Nivedita k Lakra medical officer', 'Medical officer', 'CH mana', '9425227608'),
	(160, 5, 'Ritambhara Sharma', 'Medical officer', 'SSK. INDIAN CLUB. DHOBI TALAB. SAMTA COLONY.', '7999056568'),
	(161, 5, 'Renuka kashyap', 'RMA', 'UPHC BORIAKALA', '9098727892'),
	(162, 5, 'Rameet Singh Gandhi', 'Medical Officer', 'UPHC Gogaon(UAAM Shivanand Nagar)', '8558976363'),
	(163, 5, 'Dr priti nikhare', 'Medical officer', 'UPHC Amaseoni', '8959680826'),
	(164, 5, 'Nikita Gupta', 'Medical officer', 'Uphc bhanpuri', '9860189044'),
	(165, 5, 'Dr.shakuntala xalxo', 'MO', 'AAM Jorapara', '9424143902'),
	(166, 5, 'Dr.Arjun Singh Banjare', 'Medical Officer', 'UAAM Satnami Para, Sainath Colony', '9754104126'),
	(167, 5, 'Dr. Jasmine chawda', 'Medical officer', 'Ayushman arogya mandir gondwara', '9827404800'),
	(168, 5, 'Manisha Dhimar', 'CHO', 'AAM Kukera', '8319555169'),
	(169, 5, 'Dr Shikhar Chepe', 'MO', 'BHATAGAON', '7000698030'),
	(170, 5, 'Dr. Ankit Khandelwal', 'MEDICAL OFFICER', 'UCHC GUDHIYARI', '8055812220'),
	(171, 5, 'VIRENDRA KUMAR SINHA', 'COMMUNITY HEALTH OFFICER', 'AAM PATEWA ABHANPUR', '8770470680'),
	(172, 5, 'Vaishali verma', 'Cho', 'Bhaisa', '7804880312'),
	(173, 5, 'Karishma sahu', 'Community health officer', 'Chandkhuri block arang district raipur Chhatisgarh', '9098436841'),
	(174, 5, 'Nidhi', 'Cho', 'Aam Doma', '7999154894'),
	(175, 5, 'Dr vikas singh', 'Medical officer', 'Uhwc jorapara', '9343747292'),
	(176, 5, 'Rani Sahu', 'CHO', 'AAM SARKHI', '9669531998'),
	(177, 5, 'Diksha sahu', 'CHO', 'AAM Tarpongi block Tilda', '7772003348'),
	(178, 5, 'Meera verma', 'Cho', 'Bhandarpuri', '9399335680'),
	(179, 5, 'Rini Gardia', 'CHO', 'AAM- Aalesur', '7828267001'),
	(180, 5, 'Dr Utkarsh Dev', 'Medical officer', 'Uphc kashiram nagar', '8349422777'),
	(181, 5, 'Ashish kumar kewat', 'Cho', 'Khaprikala', '8602241342'),
	(182, 5, 'Shalvi verma', 'Mo', 'Uphc rajatalab', '9970508816'),
	(183, 5, 'Suman banjare', 'Cho', 'Aam NAKTi', '7974017774'),
	(184, 5, 'Dr amogh', 'Mo', 'Uphc bhatagoan', '7066245575'),
	(185, 5, 'Shikha kushwaha', 'Community health officer', 'Ayushman arogya mandir budeni block tilda raipur', '7828722878'),
	(186, 5, 'Divya Bharti', 'CHO', 'Aam farhada', '7974384747'),
	(187, 5, 'Dr.Uma paikera', 'BMO', 'Tilda', '9993841600'),
	(188, 5, 'Kamal Barman', 'Community Health Officer', 'AAM Samoda', '8319168793'),
	(189, 5, 'Digeshwari sahu', 'Cho', 'Katia', '8223938430'),
	(190, 5, 'Dr.Domar singh banjare', 'Medical officer', 'Phc mowa', '9340676233'),
	(191, 5, 'Sarita sahu', 'CHO', 'AAM Temri', '9340492424'),
	(192, 5, 'Thaneshwar sahu', 'Medical officer', 'Uphc rajatalab', '7340333413'),
	(193, 5, 'Fuleshwari yadav', 'Cho', 'AAM chhataud', '8349700941'),
	(194, 5, 'Aishwarya verma', 'Cho', 'Bangoli', '8319097834'),
	(195, 5, 'Ritu Mahidhar', 'CHO', 'Aam kharora', '7999186136'),
	(196, 5, 'Payal verma', 'CHO', 'Nardaha', '9340258514'),
	(197, 5, 'DR PRITI NARAIN', 'RCH Nodal Officer', 'CMHO Office', '7000104446'),
	(198, 5, 'Bhagwat verma', 'Community health officer', 'Badgaon', '9826938976'),
	(199, 5, 'Indu dhruw', 'Cho', 'Aam Barbanda', '9098710688');

-- Dumping structure for table mediguru.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mediguru.users: ~4 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@mediguru.com', '12345678', 'admin', '2025-07-30 21:33:25', '2025-08-23 19:07:58'),
	(2, 'Doctor', 'doctor@mediguru.com', '12345678', 'doctor', '2025-07-30 21:33:25', '2025-08-03 18:20:23'),
	(3, 'HEALTH OFFICE', 'health@mediguru.com', 'health@123', 'admin', '2025-07-30 21:33:25', '2025-08-24 16:35:13'),
	(4, 'DR. Example', 'drhealth@mediguru.com', 'doctor@123', 'doctor', '2025-07-30 21:33:25', '2025-08-16 05:08:56');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
