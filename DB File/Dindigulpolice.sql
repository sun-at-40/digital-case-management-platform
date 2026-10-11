-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2021 at 04:33 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ghpolice`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_table`
--

CREATE TABLE `case_table` (
  `case_id` varchar(20) NOT NULL,
  `statement` varchar(200) NOT NULL,
  `caseid` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `staffid` varchar(30) NOT NULL,
  `case_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `cid` varchar(20) NOT NULL DEFAULT 'Not Yet',
  `complete_date` date NOT NULL,
  `diary_of_action` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `case_table`
--

INSERT INTO `case_table` (`case_id`, `statement`, `caseid`, `date_added`, `staffid`, `case_type`, `status`, `cid`, `complete_date`, `diary_of_action`) VALUES
('210707101', '<p>The Victim had gone for a morning walk and was supposed to return by 7:30 am , not finding him at home after waiting till 9:am the victim"s father recives a call regarding a dead body found', 56, '2022-07-07 10:56:23', '110', 'Murder Case', 'Completed', '110','2023-10-10','Case has been Solved and Closed'),
('210707102', '<p>The suspect identified as Nanya Elizabeth, a 42-year-old, female teacher, lured the male victim to her room at the staff quarters. While in the room, she caused the victim to remove his clothes </p>\r\n', 57, '2022-07-23 09:20:49', '112', 'Defilement', 'Not Completed', '112','not completed','Case has yet not been Solved but we are very close to catch the culprit'),
('210713103', '<p>victim has lost her Two-wheeler vehicle near ittagi petrol pump </p>\r\n', 58, '2022-04-30 09:27:48', '115','Theft Case', 'Completed', '115','2022-12-20','Case has been Solved and Closed'),
('210728101', '<p>The client Hrithik kapoor was with two friends at another friend’s house. Everyone was drinking heavily. An altercation broke out around the pool during which one of the client’s friends was bashed and left to drown  </p>\r\n', 59, '2022-03-28 13:12:57', '111', 'Murder Case','Completed', '111','2022-08-21','Case has been Solved and Closed'),
('210728102', '<p>The special investigation team conducting a further probe in the assault case on Tuesday recorded the statement of osama bin latin at the Aluva police club. </p>\r\n', 60, '2022-01-10 13:14:41', '116', 'Assault Case', 'Not Completed', '116','','Case has yet not been Solved but we are very close to catch the culprit');


-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `case_id` varchar(20) NOT NULL,
  `comp_name` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `occupation` varchar(20) NOT NULL,
  `region` varchar(50) NOT NULL,
  `district` varchar(100) NOT NULL,
  `loc` varchar(50) NOT NULL,
  `addrs` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `complaint` (`case_id`, `comp_name`, `tel`, `occupation`, `region`, `district`, `loc`, `addrs`, `age`, `gender`, `date_added`) VALUES
('210707101', 'Ramesh Kumar', '234567', 'Dancer', 'Dindigul Region', 'Dindigul District', 'Near govt school', 'Poshery Nagar, Dindigul', 22, 'Male', '2022-07-07 10:56:23'),
('210707102', 'Vivek Chinnsamy', '345678', 'Engineer', 'Madurai Region', 'Madurai District', 'Theatre backside', 'Hse No. 30, Urban Madurai', 33, 'Male', '2022-07-23 09:20:49'),
('210713103', 'Urmila shaikh', '567890', 'Teacher', 'Dindigul Region', 'Palani District','backwaters', 'Gokul Colony, Dindigul', 45, 'Female', '2022-04-30 09:27:48'),
('210728101', 'Hrithik Rajan', '0509797', 'Actor', 'Madurai Region', 'Theni District', 'Mall road', 'Hse No. 40/G, Madurai', 55, 'Male', '2022-03-28 13:12:57'),
('210728102', 'Deepak Suman', '0597797', 'Doctor', 'Dindigul Region', 'Dindigul District', 'station road', 'Hse No. 60/G, Dindigul', 89, 'Male', '2022-01-10 13:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `crime_type`
--

CREATE TABLE `crime_type` (
  `id` int(11) NOT NULL,
  `des` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crime_type`
--

INSERT INTO `crime_type` (`id`, `des`) VALUES
(1, 'Domestic Violence'),
(2, 'Murder Case'),
(3, 'Assault'),
(4, 'Theft Case'),
(5, 'Defilement'),
(6, 'Robbing'),
(7, 'Fraud'),
(8, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `investigation`
--

CREATE TABLE `investigation` (
  `case_id` varchar(20) NOT NULL,
  `investigator` varchar(20) NOT NULL,
  `statement2` text NOT NULL,
  `assigned_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status2` varchar(100) NOT NULL,
  `completed_date` varchar(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investigation`
--

INSERT INTO `investigation` (`case_id`, `investigator`, `statement2`, `assigned_date`, `status2`, `completed_date`, `id`) VALUES
('210707101', '005', '<p>the investigation has led to arrest of suspects! the actual culprit is found</p>\r\n', '2021-07-07 11:03:58', 'completed', '2023-10-10', 55),
('210707102', '006', '<p> the investigation is at hold since there is shortage of evidence and unclear facts','2022-07-23 09:20:49','Not Completed','',56);
-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `staffid` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `othernames` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `staffid`, `status`, `password`, `surname`, `othernames`) VALUES
(0, '110', 'CID', 'bfe3717a25ec12409245bdc87acdec7c14f7f556', 'MD Kaif ', 'Shaikh'),
(0, '101', 'Admin', '22a9a3e7ac3d8e83fa23b904e24075954e8edea2','Harsh','Agarwal'),
(0, '100', 'Admin', '8200cffe614c724f9be4ef3116dcd665c35ff6d0', 'Darsh', 'Jain'),
(0, '113', 'DGP', '6c4c154b5c2a941365102cb59239ebb60f34734e', 'Akshat', 'Jain'),
(0, '114', 'DGP', '1d34439b0c9916222f2d6555791ef9f4fd36ea82', 'Aman', 'Usmani'),
(0, '115', 'CID', 'b988ea286006bbe8d569568bab58edb20fa932e7', 'Girish', 'Sukali'),
(0, '116', 'CID', '913af5073c78738f122fc557c95cf083c8ada99e', 'Abusufiyan', 'Attar'),
(0, '117', 'DGP', '9d209f343c090914a64b31fd8637a9cd74a1b0c2', 'Musaveer', 'Bijapur');


--
-- Table structure for table `case_evidence` (crime scene photos & exhibits)
--

CREATE TABLE IF NOT EXISTS `case_evidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `case_id` varchar(20) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `category` varchar(30) NOT NULL DEFAULT 'Crime Scene',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `uploaded_by` varchar(30) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  INDEX (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for tables `case_resolution` and `case_accused` (solved-case remarks & accused with photo)
--

CREATE TABLE IF NOT EXISTS `case_resolution` (
  `case_id` varchar(20) NOT NULL PRIMARY KEY,
  `remarks` text NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `case_accused` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `case_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `alias_name` varchar(100) NOT NULL DEFAULT '',
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `role_in_crime` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(64) NOT NULL DEFAULT '',
  `added_by` varchar(30) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  INDEX (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `case_table`
--
ALTER TABLE `case_table`
  ADD PRIMARY KEY (`caseid`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `crime_type`
--
ALTER TABLE `crime_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investigation`
--
ALTER TABLE `investigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`staffid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `case_table`
--
ALTER TABLE `case_table`
  MODIFY `caseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `crime_type`
--
ALTER TABLE `crime_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `investigation`
--
ALTER TABLE `investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Demo seed data: 7 more CID officers and ~160 cases (2025-2026) with complaints, investigations,
-- resolution remarks and accused records. Default password for new staff: <staffid>@Dgl2026
USE dindigulpolice;

INSERT INTO userlogin (id, staffid, status, password, surname, othernames) VALUES
(0, '120', 'CID', 'd43e4b26644d0b2774604ba1b945607c2f616d58', 'Murugesan', 'Shanmugam'),
(0, '121', 'CID', 'dabe9a97518e274bf331b18753bd151b19161832', 'Meenakshi', 'Sundaram'),
(0, '122', 'CID', '92b11e8dffb7fa25121fb9c29080d773768be653', 'Karthikeyan', 'Rajan'),
(0, '123', 'CID', 'b3b653992759ad900967770688850eb226c82952', 'Tamilselvi', 'Arumugam'),
(0, '124', 'CID', '90a892519a8a873a3e7773c77b81de6c4da06cdf', 'Pandiarajan', 'Velusamy'),
(0, '125', 'CID', '4b721474e238c1e84eeed2ca2a9319587091099d', 'Gowri', 'Shankar'),
(0, '126', 'CID', 'd2240fe4be799e68b14b5118a290714efc6b324e', 'Saravanan', 'Mathiazhagan'),
(0, '118', 'DGP', '13a7a6254275a3ca8b392e11a76b0008cb1ca613', 'Lakshmi', 'Narayanan');

INSERT INTO case_table (case_id, statement, date_added, staffid, case_type, status, cid, complete_date, diary_of_action) VALUES
('250417101', '<p>Cyber harassment on social media reported from T Nagar</p>', '2025-04-17 10:55:00', '114', 'Others', 'Not Completed', '125', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('260529101', '<p>Highway robbery of a lorry driver close to Gandhipuram</p>', '2026-05-29 08:54:00', '113', 'Robbing', 'Completed', '110', '2026-07-16', 'Case has been Solved and Closed'),
('260921101', '<p>Mobile phone and wallet stolen at Velachery market</p>', '2026-09-21 14:11:00', '113', 'Theft Case', 'Not Yet', 'Not Yet', '0000-00-00', ''),
('250717101', '<p>Victim attacked with iron rod at T Nagar</p>', '2025-07-17 10:39:00', '113', 'Assault', 'Completed', '121', '2025-08-08', 'Case has been Solved and Closed'),
('260615101', '<p>Shopkeeper robbed at knife-point near T Nagar</p>', '2026-06-15 14:09:00', '118', 'Robbing', 'Completed', '126', '2026-07-27', 'Case has been Solved and Closed'),
('250724101', '<p>Land document forgery complaint at Velachery</p>', '2025-07-24 14:42:00', '113', 'Fraud', 'Not Completed', '123', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('251005101', '<p>Elderly mother harassed by son at Anna Nagar</p>', '2025-10-05 13:59:00', '113', 'Domestic Violence', 'Completed', '121', '2025-10-27', 'Case has been Solved and Closed'),
('260216101', '<p>Mobile phone and wallet stolen at Peraiyur Road market</p>', '2026-02-16 08:19:00', '118', 'Theft Case', 'Not Completed', '123', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('250525101', '<p>House burgled at Palani Bus Stand while family was away</p>', '2025-05-25 12:14:00', '118', 'Theft Case', 'Completed', '121', '2025-06-22', 'Case has been Solved and Closed'),
('250308101', '<p>Highway robbery of a lorry driver close to Begampur</p>', '2025-03-08 15:07:00', '114', 'Robbing', 'Completed', '126', '2025-04-09', 'Case has been Solved and Closed'),
('260510101', '<p>House burgled at Usilampatti Town while family was away</p>', '2026-05-10 08:03:00', '113', 'Theft Case', 'Completed', '125', '2026-06-23', 'Case has been Solved and Closed'),
('250116101', '<p>Gold chain snatched near Old Bus Stand</p>', '2025-01-16 10:37:00', '113', 'Theft Case', 'Not Completed', '110', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('260424101', '<p>Group clash outside a TASMAC shop near T Nagar</p>', '2026-04-24 14:20:00', '114', 'Assault', 'Completed', '122', '2026-06-12', 'Case has been Solved and Closed'),
('260808101', '<p>Victim attacked with iron rod at Usilampatti Town</p>', '2026-08-08 14:49:00', '114', 'Assault', 'Not Completed', '110', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('251005102', '<p>Elderly mother harassed by son at Adivaram</p>', '2025-10-05 08:53:00', '113', 'Domestic Violence', 'Completed', '124', '2025-12-11', 'Case has been Solved and Closed'),
('260602101', '<p>Land document forgery complaint at Periyar Bus Stand</p>', '2026-06-02 17:17:00', '117', 'Fraud', 'Not Completed', '126', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('250720101', '<p>Two men robbed a bank customer outside Bodinayakanur Market</p>', '2025-07-20 10:41:00', '113', 'Robbing', 'Completed', '121', '2025-08-17', 'Case has been Solved and Closed'),
('260716101', '<p>Shopkeeper robbed at knife-point near Kallimandayam</p>', '2026-07-16 15:01:00', '117', 'Robbing', 'Completed', '115', '2026-08-11', 'Case has been Solved and Closed'),
('260320101', '<p>Group clash outside a TASMAC shop near Thallakulam</p>', '2026-03-20 17:22:00', '118', 'Assault', 'Completed', '121', '2026-04-05', 'Case has been Solved and Closed'),
('250210101', '<p>Dispute over land boundary ended in grievous assault at T Nagar</p>', '2025-02-10 12:53:00', '113', 'Assault', 'Completed', '115', '2025-03-28', 'Case has been Solved and Closed'),
('260729101', '<p>Gold chain snatched near Old Bus Stand</p>', '2026-07-29 11:34:00', '118', 'Theft Case', 'Completed', '121', '2026-08-14', 'Case has been Solved and Closed'),
('260901101', '<p>Two-wheeler stolen from outside Velachery</p>', '2026-09-01 09:51:00', '117', 'Theft Case', 'Not Completed', '121', '0000-00-00', 'Suspects identified; search teams deployed.'),
('250727101', '<p>Group clash outside a TASMAC shop near Thallakulam</p>', '2025-07-27 14:05:00', '114', 'Assault', 'Not Completed', '126', '0000-00-00', 'Suspects identified; search teams deployed.'),
('250606101', '<p>Group clash outside a TASMAC shop near Nagal Nagar</p>', '2025-06-06 13:23:00', '118', 'Assault', 'Completed', '124', '2025-07-30', 'Case has been Solved and Closed'),
('251212101', '<p>Two-wheeler stolen from outside T Nagar</p>', '2025-12-12 11:41:00', '118', 'Theft Case', 'Not Completed', '116', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('260131101', '<p>Elderly mother harassed by son at Old Bus Stand</p>', '2026-01-31 13:54:00', '113', 'Domestic Violence', 'Not Completed', '110', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250613101', '<p>Elderly mother harassed by son at Market Yard</p>', '2025-06-13 15:12:00', '113', 'Domestic Violence', 'Completed', '115', '2025-07-28', 'Case has been Solved and Closed'),
('260216102', '<p>Two-wheeler stolen from outside T Nagar</p>', '2026-02-16 12:05:00', '114', 'Theft Case', 'Completed', '116', '2026-04-02', 'Case has been Solved and Closed'),
('251022101', '<p>House burgled at Dindigul Fort while family was away</p>', '2025-10-22 14:32:00', '117', 'Theft Case', 'Completed', '121', '2025-11-12', 'Case has been Solved and Closed'),
('260808102', '<p>Gold chain snatched near Dindigul Fort</p>', '2026-08-08 10:46:00', '118', 'Theft Case', 'Completed', '125', '2026-08-31', 'Case has been Solved and Closed'),
('260108101', '<p>Elderly mother harassed by son at Gandhi Road</p>', '2026-01-08 15:26:00', '118', 'Domestic Violence', 'Completed', '120', '2026-01-30', 'Case has been Solved and Closed'),
('250207101', '<p>Online job-offer fraud reported from Peraiyur Road</p>', '2025-02-07 14:56:00', '113', 'Fraud', 'Not Completed', '124', '0000-00-00', 'Suspects identified; search teams deployed.'),
('260228101', '<p>Group clash outside a TASMAC shop near Palani Bus Stand</p>', '2026-02-28 15:22:00', '117', 'Assault', 'Completed', '120', '2026-03-28', 'Case has been Solved and Closed'),
('250206101', '<p>Group clash outside a TASMAC shop near Velachery</p>', '2025-02-06 15:57:00', '118', 'Assault', 'Completed', '110', '2025-03-20', 'Case has been Solved and Closed'),
('260726101', '<p>Old enmity led to fatal attack at Cumbum Road</p>', '2026-07-26 08:09:00', '113', 'Murder Case', 'Completed', '110', '2026-09-05', 'Case has been Solved and Closed'),
('250708101', '<p>Mobile phone and wallet stolen at Market Yard market</p>', '2025-07-08 14:04:00', '117', 'Theft Case', 'Not Completed', '124', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250730101', '<p>Gold chain snatched near Peraiyur Road</p>', '2025-07-30 12:18:00', '113', 'Theft Case', 'Not Completed', '126', '0000-00-00', 'Suspects identified; search teams deployed.'),
('260921102', '<p>Highway robbery of a lorry driver close to Kodaikanal Road</p>', '2026-09-21 11:29:00', '114', 'Robbing', 'Not Completed', '121', '0000-00-00', 'Suspects identified; search teams deployed.'),
('251113101', '<p>Land document forgery complaint at Peelamedu</p>', '2025-11-13 16:20:00', '114', 'Fraud', 'Completed', '125', '2025-12-18', 'Case has been Solved and Closed'),
('250124101', '<p>Mobile phone and wallet stolen at Market Yard market</p>', '2025-01-24 08:14:00', '117', 'Theft Case', 'Completed', '126', '2025-02-28', 'Case has been Solved and Closed'),
('251123101', '<p>Land document forgery complaint at Velachery</p>', '2025-11-23 14:00:00', '113', 'Fraud', 'Completed', '126', '2026-01-16', 'Case has been Solved and Closed'),
('250208101', '<p>Mobile phone and wallet stolen at RS Puram market</p>', '2025-02-08 10:08:00', '118', 'Theft Case', 'Completed', '121', '2025-03-04', 'Case has been Solved and Closed'),
('260427101', '<p>Land document forgery complaint at Cumbum Road</p>', '2026-04-27 14:07:00', '117', 'Fraud', 'Completed', '126', '2026-06-23', 'Case has been Solved and Closed'),
('251102101', '<p>Land document forgery complaint at T Nagar</p>', '2025-11-02 12:58:00', '117', 'Fraud', 'Completed', '124', '2026-01-13', 'Case has been Solved and Closed'),
('251029101', '<p>Online job-offer fraud reported from Periyar Bus Stand</p>', '2025-10-29 10:07:00', '118', 'Fraud', 'Completed', '121', '2025-11-13', 'Case has been Solved and Closed'),
('251222101', '<p>Elderly mother harassed by son at Cumbum Road</p>', '2025-12-22 08:50:00', '117', 'Domestic Violence', 'Completed', '110', '2026-02-04', 'Case has been Solved and Closed'),
('260916101', '<p>Online job-offer fraud reported from Meenakshi Amman Temple Street</p>', '2026-09-16 14:36:00', '113', 'Fraud', 'Not Completed', '115', '0000-00-00', 'Suspects identified; search teams deployed.'),
('261007101', '<p>House burgled at Usilampatti Town while family was away</p>', '2026-10-07 12:27:00', '117', 'Theft Case', 'Not Yet', 'Not Yet', '0000-00-00', ''),
('260222101', '<p>Wife reports repeated abuse by husband and in-laws at Begampur</p>', '2026-02-22 17:02:00', '113', 'Domestic Violence', 'Not Completed', '115', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('251231101', '<p>Online job-offer fraud reported from Gandhipuram</p>', '2025-12-31 12:10:00', '118', 'Fraud', 'Completed', '122', '2026-03-01', 'Case has been Solved and Closed'),
('260626101', '<p>Gold chain snatched near Market Yard</p>', '2026-06-26 11:27:00', '117', 'Theft Case', 'Completed', '125', '2026-07-14', 'Case has been Solved and Closed'),
('251018101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at RS Puram</p>', '2025-10-18 17:47:00', '113', 'Fraud', 'Completed', '121', '2025-11-20', 'Case has been Solved and Closed'),
('260617101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Tirupparankundram</p>', '2026-06-17 09:20:00', '117', 'Fraud', 'Completed', '126', '2026-08-21', 'Case has been Solved and Closed'),
('260423101', '<p>Mobile phone and wallet stolen at Cumbum Road market</p>', '2026-04-23 09:09:00', '117', 'Theft Case', 'Completed', '123', '2026-06-13', 'Case has been Solved and Closed'),
('250105101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Peraiyur Road</p>', '2025-01-05 14:08:00', '113', 'Fraud', 'Completed', '126', '2025-03-03', 'Case has been Solved and Closed'),
('250330101', '<p>House burgled at Velachery while family was away</p>', '2025-03-30 14:24:00', '118', 'Theft Case', 'Completed', '110', '2025-05-08', 'Case has been Solved and Closed'),
('250520101', '<p>Land document forgery complaint at Peraiyur Road</p>', '2025-05-20 08:47:00', '117', 'Fraud', 'Not Completed', '124', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('250215101', '<p>Gold chain snatched near Periyakulam</p>', '2025-02-15 11:58:00', '118', 'Theft Case', 'Completed', '120', '2025-03-05', 'Case has been Solved and Closed'),
('260112101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Usilampatti Town</p>', '2026-01-12 15:59:00', '118', 'Fraud', 'Completed', '126', '2026-02-12', 'Case has been Solved and Closed'),
('250318101', '<p>Victim attacked with iron rod at Meenakshi Amman Temple Street</p>', '2025-03-18 16:53:00', '114', 'Assault', 'Completed', '126', '2025-05-27', 'Case has been Solved and Closed'),
('250330102', '<p>Victim attacked with iron rod at T Nagar</p>', '2025-03-30 10:51:00', '114', 'Assault', 'Completed', '110', '2025-05-04', 'Case has been Solved and Closed'),
('260323101', '<p>Wife reports repeated abuse by husband and in-laws at RS Puram</p>', '2026-03-23 15:02:00', '118', 'Domestic Violence', 'Not Completed', '122', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('251208101', '<p>Two-wheeler stolen from outside Gandhipuram</p>', '2025-12-08 15:52:00', '114', 'Theft Case', 'Not Completed', '123', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250406101', '<p>Mobile phone and wallet stolen at Velachery market</p>', '2025-04-06 13:36:00', '117', 'Theft Case', 'Completed', '124', '2025-05-09', 'Case has been Solved and Closed'),
('251105101', '<p>Two men robbed a bank customer outside Peelamedu</p>', '2025-11-05 09:28:00', '117', 'Robbing', 'Not Completed', '125', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('250923101', '<p>Victim attacked with iron rod at Gandhipuram</p>', '2025-09-23 14:22:00', '117', 'Assault', 'Completed', '110', '2025-11-10', 'Case has been Solved and Closed'),
('260615102', '<p>Mobile phone and wallet stolen at Palani Bus Stand market</p>', '2026-06-15 13:51:00', '114', 'Theft Case', 'Completed', '123', '2026-07-19', 'Case has been Solved and Closed'),
('260518101', '<p>Mobile phone and wallet stolen at Market Yard market</p>', '2026-05-18 14:20:00', '113', 'Theft Case', 'Completed', '125', '2026-06-24', 'Case has been Solved and Closed'),
('250624101', '<p>Highway robbery of a lorry driver close to Kallimandayam</p>', '2025-06-24 16:20:00', '113', 'Robbing', 'Completed', '122', '2025-08-11', 'Case has been Solved and Closed'),
('250306101', '<p>Victim attacked with iron rod at Kodaikanal Road</p>', '2025-03-06 12:58:00', '114', 'Assault', 'Completed', '110', '2025-04-08', 'Case has been Solved and Closed'),
('260109101', '<p>Two-wheeler stolen from outside Kodaikanal Road</p>', '2026-01-09 13:27:00', '117', 'Theft Case', 'Completed', '125', '2026-02-01', 'Case has been Solved and Closed'),
('251123102', '<p>Group clash outside a TASMAC shop near RS Puram</p>', '2025-11-23 10:20:00', '113', 'Assault', 'Completed', '120', '2026-01-03', 'Case has been Solved and Closed'),
('260726102', '<p>Highway robbery of a lorry driver close to Velachery</p>', '2026-07-26 09:39:00', '118', 'Robbing', 'Completed', '120', '2026-08-30', 'Case has been Solved and Closed'),
('260425101', '<p>Mobile phone and wallet stolen at T Nagar market</p>', '2026-04-25 12:13:00', '114', 'Theft Case', 'Not Completed', '124', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250309101', '<p>Group clash outside a TASMAC shop near Cumbum Road</p>', '2025-03-09 14:33:00', '113', 'Assault', 'Not Completed', '120', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('251130101', '<p>Cyber harassment on social media reported from Bodinayakanur Market</p>', '2025-11-30 11:03:00', '117', 'Others', 'Completed', '116', '2026-01-21', 'Case has been Solved and Closed'),
('250504101', '<p>Highway robbery of a lorry driver close to Gandhipuram</p>', '2025-05-04 08:29:00', '113', 'Robbing', 'Completed', '116', '2025-05-30', 'Case has been Solved and Closed'),
('260622101', '<p>Group clash outside a TASMAC shop near Dindigul Fort</p>', '2026-06-22 12:48:00', '117', 'Assault', 'Completed', '116', '2026-07-22', 'Case has been Solved and Closed'),
('250809101', '<p>Two men robbed a bank customer outside Cumbum Road</p>', '2025-08-09 11:43:00', '113', 'Robbing', 'Completed', '124', '2025-10-24', 'Case has been Solved and Closed'),
('260323102', '<p>Minor girl reported harassed near Peraiyur Road; POCSO case registered</p>', '2026-03-23 12:48:00', '113', 'Defilement', 'Completed', '125', '2026-04-15', 'Case has been Solved and Closed'),
('260902101', '<p>Shopkeeper robbed at knife-point near Cumbum Road</p>', '2026-09-02 13:46:00', '117', 'Robbing', 'Not Completed', '110', '0000-00-00', 'Awaiting forensic report; investigation in progress.'),
('250425101', '<p>Mobile phone and wallet stolen at Goripalayam market</p>', '2025-04-25 17:31:00', '117', 'Theft Case', 'Completed', '120', '2025-06-06', 'Case has been Solved and Closed'),
('250906101', '<p>Two-wheeler stolen from outside Cumbum Road</p>', '2025-09-06 16:21:00', '113', 'Theft Case', 'Completed', '124', '2025-10-14', 'Case has been Solved and Closed'),
('260811101', '<p>Mobile phone and wallet stolen at Kodaikanal Road market</p>', '2026-08-11 13:23:00', '114', 'Theft Case', 'Completed', '120', '2026-09-12', 'Case has been Solved and Closed'),
('260227101', '<p>Land document forgery complaint at Palani Bus Stand</p>', '2026-02-27 09:09:00', '114', 'Fraud', 'Completed', '116', '2026-04-08', 'Case has been Solved and Closed'),
('250703101', '<p>Online job-offer fraud reported from Periyakulam</p>', '2025-07-03 11:23:00', '114', 'Fraud', 'Completed', '122', '2025-08-14', 'Case has been Solved and Closed'),
('250418101', '<p>Land document forgery complaint at Kodaikanal Road</p>', '2025-04-18 17:47:00', '113', 'Fraud', 'Completed', '120', '2025-05-11', 'Case has been Solved and Closed'),
('250305101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at RM Colony</p>', '2025-03-05 17:18:00', '117', 'Fraud', 'Completed', '122', '2025-04-12', 'Case has been Solved and Closed'),
('260913101', '<p>Online job-offer fraud reported from RM Colony</p>', '2026-09-13 16:46:00', '113', 'Fraud', 'Not Completed', '124', '0000-00-00', 'Awaiting forensic report; investigation in progress.'),
('251224101', '<p>House burgled at Goripalayam while family was away</p>', '2025-12-24 17:03:00', '117', 'Theft Case', 'Completed', '123', '2026-02-11', 'Case has been Solved and Closed'),
('251108101', '<p>Mobile phone and wallet stolen at Kodaikanal Road market</p>', '2025-11-08 17:28:00', '118', 'Theft Case', 'Completed', '122', '2025-12-11', 'Case has been Solved and Closed'),
('260112102', '<p>Gold chain snatched near T Nagar</p>', '2026-01-12 09:14:00', '113', 'Theft Case', 'Completed', '124', '2026-04-02', 'Case has been Solved and Closed'),
('260130101', '<p>Complaint under POCSO received from Peraiyur Road</p>', '2026-01-30 15:25:00', '118', 'Defilement', 'Not Completed', '122', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('251014101', '<p>Elderly mother harassed by son at Kallimandayam</p>', '2025-10-14 14:10:00', '118', 'Domestic Violence', 'Completed', '124', '2025-11-23', 'Case has been Solved and Closed'),
('251206101', '<p>Gold chain snatched near Velachery</p>', '2025-12-06 17:58:00', '113', 'Theft Case', 'Not Completed', '115', '0000-00-00', 'Awaiting forensic report; investigation in progress.'),
('260809101', '<p>Victim attacked with iron rod at RS Puram</p>', '2026-08-09 15:57:00', '114', 'Assault', 'Completed', '120', '2026-09-07', 'Case has been Solved and Closed'),
('251208102', '<p>Mobile phone and wallet stolen at Peelamedu market</p>', '2025-12-08 09:34:00', '117', 'Theft Case', 'Not Completed', '122', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('260104101', '<p>Dispute over land boundary ended in grievous assault at Cumbum Road</p>', '2026-01-04 08:05:00', '118', 'Assault', 'Completed', '121', '2026-01-18', 'Case has been Solved and Closed'),
('250118101', '<p>Body found with injury marks near Spencer Compound; foul play suspected</p>', '2025-01-18 13:15:00', '114', 'Murder Case', 'Completed', '115', '2025-02-24', 'Case has been Solved and Closed'),
('250907101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Bodinayakanur Market</p>', '2025-09-07 11:54:00', '117', 'Fraud', 'Not Completed', '116', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('251031101', '<p>House burgled at RM Colony while family was away</p>', '2025-10-31 11:30:00', '114', 'Theft Case', 'Not Completed', '110', '0000-00-00', 'Suspects identified; search teams deployed.'),
('250826101', '<p>Gold chain snatched near Usilampatti Town</p>', '2025-08-26 12:10:00', '114', 'Theft Case', 'Not Completed', '126', '0000-00-00', 'Suspects identified; search teams deployed.'),
('250412101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Velachery</p>', '2025-04-12 09:02:00', '113', 'Fraud', 'Completed', '122', '2025-05-26', 'Case has been Solved and Closed'),
('250113101', '<p>Body found with injury marks near Kodaikanal Road; foul play suspected</p>', '2025-01-13 11:50:00', '117', 'Murder Case', 'Completed', '125', '2025-02-14', 'Case has been Solved and Closed'),
('250405101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Cumbum Road</p>', '2025-04-05 13:32:00', '118', 'Fraud', 'Completed', '110', '2025-05-15', 'Case has been Solved and Closed'),
('260408101', '<p>Mobile phone and wallet stolen at Market Yard market</p>', '2026-04-08 14:28:00', '114', 'Theft Case', 'Completed', '124', '2026-06-28', 'Case has been Solved and Closed'),
('260930101', '<p>Online job-offer fraud reported from RS Puram</p>', '2026-09-30 15:11:00', '118', 'Fraud', 'Not Completed', '122', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('260427102', '<p>Victim attacked with iron rod at Market Yard</p>', '2026-04-27 12:33:00', '114', 'Assault', 'Not Completed', '126', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('251116101', '<p>Online job-offer fraud reported from Market Yard</p>', '2025-11-16 15:27:00', '117', 'Fraud', 'Completed', '121', '2025-11-29', 'Case has been Solved and Closed'),
('251225101', '<p>Group clash outside a TASMAC shop near Peraiyur Road</p>', '2025-12-25 10:50:00', '114', 'Assault', 'Completed', '121', '2026-01-18', 'Case has been Solved and Closed'),
('260923101', '<p>Two men robbed a bank customer outside Gandhipuram</p>', '2026-09-23 10:50:00', '117', 'Robbing', 'Not Completed', '123', '0000-00-00', 'Awaiting forensic report; investigation in progress.'),
('260506101', '<p>Two-wheeler stolen from outside Anna Nagar</p>', '2026-05-06 15:39:00', '114', 'Theft Case', 'Completed', '124', '2026-07-19', 'Case has been Solved and Closed'),
('250327101', '<p>Online job-offer fraud reported from Market Yard</p>', '2025-03-27 13:27:00', '117', 'Fraud', 'Completed', '120', '2025-04-18', 'Case has been Solved and Closed'),
('250918101', '<p>Complaint under POCSO received from Goripalayam</p>', '2025-09-18 08:26:00', '117', 'Defilement', 'Completed', '120', '2025-10-14', 'Case has been Solved and Closed'),
('260823101', '<p>Highway robbery of a lorry driver close to Tirupparankundram</p>', '2026-08-23 11:32:00', '113', 'Robbing', 'Not Completed', '122', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('260424102', '<p>Online job-offer fraud reported from Dindigul Fort</p>', '2026-04-24 11:59:00', '118', 'Fraud', 'Completed', '121', '2026-05-23', 'Case has been Solved and Closed'),
('250919101', '<p>Missing person complaint from RS Puram</p>', '2025-09-19 16:12:00', '118', 'Others', 'Not Completed', '123', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('260807101', '<p>Land document forgery complaint at Goripalayam</p>', '2026-08-07 08:37:00', '117', 'Fraud', 'Completed', '125', '2026-09-19', 'Case has been Solved and Closed'),
('250810101', '<p>Elderly mother harassed by son at Kallimandayam</p>', '2025-08-10 14:06:00', '118', 'Domestic Violence', 'Completed', '122', '2025-09-25', 'Case has been Solved and Closed'),
('260702101', '<p>Gold chain snatched near Periyakulam</p>', '2026-07-02 12:10:00', '117', 'Theft Case', 'Not Completed', '121', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('251016101', '<p>Land document forgery complaint at RS Puram</p>', '2025-10-16 15:24:00', '117', 'Fraud', 'Completed', '121', '2025-11-09', 'Case has been Solved and Closed'),
('260907101', '<p>Minor girl reported harassed near Velachery; POCSO case registered</p>', '2026-09-07 15:05:00', '118', 'Defilement', 'Not Completed', '126', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('260910101', '<p>Two-wheeler stolen from outside Peelamedu</p>', '2026-09-10 15:38:00', '118', 'Theft Case', 'Not Completed', '126', '0000-00-00', 'Suspects identified; search teams deployed.'),
('250428101', '<p>Wife reports repeated abuse by husband and in-laws at Market Yard</p>', '2025-04-28 09:17:00', '118', 'Domestic Violence', 'Completed', '125', '2025-05-22', 'Case has been Solved and Closed'),
('250618101', '<p>Elderly mother harassed by son at Tirupparankundram</p>', '2025-06-18 12:46:00', '117', 'Domestic Violence', 'Completed', '124', '2025-08-24', 'Case has been Solved and Closed'),
('250301101', '<p>Two-wheeler stolen from outside RS Puram</p>', '2025-03-01 11:02:00', '113', 'Theft Case', 'Not Completed', '123', '0000-00-00', 'Suspects identified; search teams deployed.'),
('250220101', '<p>Two-wheeler stolen from outside Bodinayakanur Market</p>', '2025-02-20 09:24:00', '118', 'Theft Case', 'Completed', '121', '2025-03-17', 'Case has been Solved and Closed'),
('250817101', '<p>Victim attacked with iron rod at Goripalayam</p>', '2025-08-17 11:05:00', '113', 'Assault', 'Completed', '121', '2025-09-07', 'Case has been Solved and Closed'),
('260403101', '<p>Victim attacked with iron rod at Adivaram</p>', '2026-04-03 08:43:00', '114', 'Assault', 'Completed', '122', '2026-05-22', 'Case has been Solved and Closed'),
('251101101', '<p>Body found with injury marks near Peraiyur Road; foul play suspected</p>', '2025-11-01 15:23:00', '114', 'Murder Case', 'Completed', '121', '2025-11-23', 'Case has been Solved and Closed'),
('260701101', '<p>Body found with injury marks near Spencer Compound; foul play suspected</p>', '2026-07-01 17:58:00', '114', 'Murder Case', 'Not Completed', '125', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250726101', '<p>Minor girl reported harassed near Peraiyur Road; POCSO case registered</p>', '2025-07-26 17:21:00', '117', 'Defilement', 'Completed', '123', '2025-09-02', 'Case has been Solved and Closed'),
('250815101', '<p>Gold chain snatched near Usilampatti Town</p>', '2025-08-15 08:26:00', '113', 'Theft Case', 'Not Completed', '126', '0000-00-00', 'Suspects identified; search teams deployed.'),
('251215101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Peraiyur Road</p>', '2025-12-15 13:13:00', '114', 'Fraud', 'Completed', '116', '2026-01-23', 'Case has been Solved and Closed'),
('250109101', '<p>Group clash outside a TASMAC shop near Thallakulam</p>', '2025-01-09 16:14:00', '117', 'Assault', 'Completed', '120', '2025-02-02', 'Case has been Solved and Closed'),
('260528101', '<p>Minor girl reported harassed near Usilampatti Town; POCSO case registered</p>', '2026-05-28 08:20:00', '113', 'Defilement', 'Not Completed', '122', '0000-00-00', 'Suspects identified; search teams deployed.'),
('251004101', '<p>House burgled at Kallimandayam while family was away</p>', '2025-10-04 17:41:00', '117', 'Theft Case', 'Completed', '116', '2025-11-28', 'Case has been Solved and Closed'),
('250108101', '<p>Mobile phone and wallet stolen at Peelamedu market</p>', '2025-01-08 11:36:00', '118', 'Theft Case', 'Completed', '124', '2025-02-24', 'Case has been Solved and Closed'),
('260512101', '<p>Highway robbery of a lorry driver close to Meenakshi Amman Temple Street</p>', '2026-05-12 10:22:00', '114', 'Robbing', 'Not Completed', '116', '0000-00-00', 'Evidence under analysis; one suspect questioned.'),
('260328101', '<p>Two-wheeler stolen from outside Usilampatti Town</p>', '2026-03-28 15:50:00', '118', 'Theft Case', 'Completed', '126', '2026-05-31', 'Case has been Solved and Closed'),
('260503101', '<p>Highway robbery of a lorry driver close to Dindigul Fort</p>', '2026-05-03 13:06:00', '117', 'Robbing', 'Completed', '121', '2026-05-17', 'Case has been Solved and Closed'),
('251101102', '<p>Mobile phone and wallet stolen at Begampur market</p>', '2025-11-01 11:40:00', '118', 'Theft Case', 'Completed', '115', '2025-12-09', 'Case has been Solved and Closed'),
('250505101', '<p>Land document forgery complaint at Peraiyur Road</p>', '2025-05-05 12:18:00', '114', 'Fraud', 'Completed', '115', '2025-06-14', 'Case has been Solved and Closed'),
('260907102', '<p>Two-wheeler stolen from outside Periyakulam</p>', '2026-09-07 10:57:00', '114', 'Theft Case', 'Not Completed', '126', '0000-00-00', 'Suspects identified; search teams deployed.'),
('260531101', '<p>House burgled at Kallimandayam while family was away</p>', '2026-05-31 11:37:00', '118', 'Theft Case', 'Completed', '120', '2026-06-22', 'Case has been Solved and Closed'),
('251210101', '<p>Victim cheated of Rs. 2.5 lakh in a fake chit-fund scheme at Anna Nagar</p>', '2025-12-10 12:03:00', '113', 'Fraud', 'Not Completed', '120', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('260202101', '<p>Gold chain snatched near Cumbum Road</p>', '2026-02-02 17:38:00', '118', 'Theft Case', 'Not Completed', '124', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('260827101', '<p>Victim attacked with iron rod at Cumbum Road</p>', '2026-08-27 16:34:00', '114', 'Assault', 'Not Completed', '125', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('251016102', '<p>Land document forgery complaint at Bodinayakanur Market</p>', '2025-10-16 12:04:00', '113', 'Fraud', 'Not Completed', '110', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250106101', '<p>Minor girl reported harassed near Usilampatti Town; POCSO case registered</p>', '2025-01-06 14:24:00', '118', 'Defilement', 'Completed', '123', '2025-02-13', 'Case has been Solved and Closed'),
('250324101', '<p>Dispute over land boundary ended in grievous assault at Old Bus Stand</p>', '2025-03-24 11:13:00', '114', 'Assault', 'Completed', '120', '2025-04-14', 'Case has been Solved and Closed'),
('251029102', '<p>Gold chain snatched near Peraiyur Road</p>', '2025-10-29 14:00:00', '117', 'Theft Case', 'Completed', '126', '2025-12-14', 'Case has been Solved and Closed'),
('260707101', '<p>Gold chain snatched near Usilampatti Town</p>', '2026-07-07 12:06:00', '113', 'Theft Case', 'Completed', '125', '2026-08-18', 'Case has been Solved and Closed'),
('260221101', '<p>Body found with injury marks near RM Colony; foul play suspected</p>', '2026-02-21 14:06:00', '117', 'Murder Case', 'Completed', '116', '2026-04-02', 'Case has been Solved and Closed'),
('250405102', '<p>Mobile phone and wallet stolen at Anna Nagar market</p>', '2025-04-05 16:29:00', '118', 'Theft Case', 'Completed', '122', '2025-06-05', 'Case has been Solved and Closed'),
('250822101', '<p>Two-wheeler stolen from outside Bodinayakanur Market</p>', '2025-08-22 12:31:00', '113', 'Theft Case', 'Completed', '115', '2025-09-29', 'Case has been Solved and Closed'),
('260731101', '<p>Gold chain snatched near RS Puram</p>', '2026-07-31 10:07:00', '114', 'Theft Case', 'Not Completed', '125', '0000-00-00', 'FIR registered; scene inspected and statements recorded.'),
('250507101', '<p>Highway robbery of a lorry driver close to Nagal Nagar</p>', '2025-05-07 08:31:00', '113', 'Robbing', 'Not Completed', '126', '0000-00-00', 'Witnesses examined; CCTV footage being collected.'),
('260605101', '<p>Victim attacked with iron rod at Nagal Nagar</p>', '2026-06-05 13:57:00', '118', 'Assault', 'Completed', '125', '2026-06-27', 'Case has been Solved and Closed'),
('250721101', '<p>House burgled at Bodinayakanur Market while family was away</p>', '2025-07-21 11:45:00', '114', 'Theft Case', 'Completed', '110', '2025-09-04', 'Case has been Solved and Closed');

INSERT INTO complaint (case_id, comp_name, tel, occupation, region, district, loc, addrs, age, gender, date_added) VALUES
('250417101', 'Dhanapal', '9202585323', 'Teacher', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 34, 'Female', '2025-04-17 10:55:00'),
('260529101', 'Ramesh Kumar', '9339479730', 'Mechanic', 'Coimbatore Region', 'Coimbatore District', 'Gandhipuram', 'Gandhipuram, Coimbatore District', 22, 'Female', '2026-05-29 08:54:00'),
('260921101', 'Kannan', '9760618965', 'Driver', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 62, 'Male', '2026-09-21 14:11:00'),
('250717101', 'Pushpa Devi', '9482995764', 'Mechanic', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 28, 'Female', '2025-07-17 10:39:00'),
('260615101', 'Nirmala', '9439510172', 'Mechanic', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 44, 'Female', '2026-06-15 14:09:00'),
('250724101', 'Rajendran', '9290626091', 'Teacher', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 54, 'Female', '2025-07-24 14:42:00'),
('251005101', 'Arivazhagan', '9488803842', 'Mechanic', 'Madurai Region', 'Madurai District', 'Anna Nagar', 'Anna Nagar, Madurai District', 63, 'Female', '2025-10-05 13:59:00'),
('260216101', 'Balamurugan', '9511990937', 'Weaver', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 36, 'Female', '2026-02-16 08:19:00'),
('250525101', 'Anbazhagan', '9226029464', 'Trader', 'Dindigul Region', 'Palani District', 'Palani Bus Stand', 'Palani Bus Stand, Palani District', 53, 'Female', '2025-05-25 12:14:00'),
('250308101', 'Jayanthi', '9790257105', 'Trader', 'Dindigul Region', 'Dindigul District', 'Begampur', 'Begampur, Dindigul District', 37, 'Male', '2025-03-08 15:07:00'),
('260510101', 'Lakshmi Priya', '9901087831', 'Tailor', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 44, 'Female', '2026-05-10 08:03:00'),
('250116101', 'Vijayalakshmi', '9450171827', 'Farmer', 'Dindigul Region', 'Oddanchatram', 'Old Bus Stand', 'Old Bus Stand, Oddanchatram', 22, 'Female', '2025-01-16 10:37:00'),
('260424101', 'Dhanapal', '9618105294', 'Shopkeeper', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 65, 'Male', '2026-04-24 14:20:00'),
('260808101', 'Parvathi', '9244053829', 'Tailor', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 41, 'Female', '2026-08-08 14:49:00'),
('251005102', 'Valliammal', '9704432188', 'Engineer', 'Dindigul Region', 'Palani District', 'Adivaram', 'Adivaram, Palani District', 56, 'Female', '2025-10-05 08:53:00'),
('260602101', 'Manikandan', '9606887558', 'Farmer', 'Madurai Region', 'Madurai District', 'Periyar Bus Stand', 'Periyar Bus Stand, Madurai District', 40, 'Male', '2026-06-02 17:17:00'),
('250720101', 'Nirmala', '9423895352', 'Trader', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 21, 'Female', '2025-07-20 10:41:00'),
('260716101', 'Chinnasamy', '9304855224', 'Trader', 'Dindigul Region', 'Oddanchatram', 'Kallimandayam', 'Kallimandayam, Oddanchatram', 46, 'Female', '2026-07-16 15:01:00'),
('260320101', 'Vijayalakshmi', '9929291701', 'Teacher', 'Madurai Region', 'Madurai District', 'Thallakulam', 'Thallakulam, Madurai District', 46, 'Male', '2026-03-20 17:22:00'),
('250210101', 'Saraswathi', '9216787106', 'Mechanic', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 61, 'Male', '2025-02-10 12:53:00'),
('260729101', 'Gayathri', '9954639442', 'Teacher', 'Dindigul Region', 'Oddanchatram', 'Old Bus Stand', 'Old Bus Stand, Oddanchatram', 42, 'Male', '2026-07-29 11:34:00'),
('260901101', 'Manikandan', '9917418196', 'Tailor', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 51, 'Female', '2026-09-01 09:51:00'),
('250727101', 'Kalaiselvi', '9613175335', 'Nurse', 'Madurai Region', 'Madurai District', 'Thallakulam', 'Thallakulam, Madurai District', 37, 'Female', '2025-07-27 14:05:00'),
('250606101', 'Revathi', '9813748230', 'Engineer', 'Dindigul Region', 'Dindigul District', 'Nagal Nagar', 'Nagal Nagar, Dindigul District', 39, 'Female', '2025-06-06 13:23:00'),
('251212101', 'Sivakumar', '9505739710', 'Clerk', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 20, 'Female', '2025-12-12 11:41:00'),
('260131101', 'Saraswathi', '9610770037', 'Tailor', 'Dindigul Region', 'Oddanchatram', 'Old Bus Stand', 'Old Bus Stand, Oddanchatram', 58, 'Male', '2026-01-31 13:54:00'),
('250613101', 'Parvathi', '9869713454', 'Teacher', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 20, 'Male', '2025-06-13 15:12:00'),
('260216102', 'Gayathri', '9918352065', 'Shopkeeper', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 52, 'Male', '2026-02-16 12:05:00'),
('251022101', 'Anbazhagan', '9533964947', 'Clerk', 'Dindigul Region', 'Dindigul District', 'Dindigul Fort', 'Dindigul Fort, Dindigul District', 46, 'Female', '2025-10-22 14:32:00'),
('260808102', 'Manikandan', '9684130311', 'Farmer', 'Dindigul Region', 'Dindigul District', 'Dindigul Fort', 'Dindigul Fort, Dindigul District', 46, 'Female', '2026-08-08 10:46:00'),
('260108101', 'Pushpa Devi', '9121480592', 'Trader', 'Dindigul Region', 'Palani District', 'Gandhi Road', 'Gandhi Road, Palani District', 62, 'Female', '2026-01-08 15:26:00'),
('250207101', 'Ganesan', '9304651273', 'Nurse', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 59, 'Female', '2025-02-07 14:56:00'),
('260228101', 'Nirmala', '9402449712', 'Shopkeeper', 'Dindigul Region', 'Palani District', 'Palani Bus Stand', 'Palani Bus Stand, Palani District', 38, 'Male', '2026-02-28 15:22:00'),
('250206101', 'Rajendran', '9594140417', 'Student', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 25, 'Female', '2025-02-06 15:57:00'),
('260726101', 'Parvathi', '9914328295', 'Teacher', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 39, 'Female', '2026-07-26 08:09:00'),
('250708101', 'Kalaiselvi', '9229950117', 'Shopkeeper', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 38, 'Female', '2025-07-08 14:04:00'),
('250730101', 'Ilango', '9485040450', 'Farmer', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 19, 'Female', '2025-07-30 12:18:00'),
('260921102', 'Sivakumar', '9638479876', 'Tailor', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 20, 'Female', '2026-09-21 11:29:00'),
('251113101', 'Nirmala', '9839032581', 'Tailor', 'Coimbatore Region', 'Coimbatore District', 'Peelamedu', 'Peelamedu, Coimbatore District', 27, 'Male', '2025-11-13 16:20:00'),
('250124101', 'Kalaiselvi', '9132281813', 'Engineer', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 34, 'Female', '2025-01-24 08:14:00'),
('251123101', 'Kannan', '9935241811', 'Nurse', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 23, 'Male', '2025-11-23 14:00:00'),
('250208101', 'Sivakumar', '9230420870', 'Tailor', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 24, 'Female', '2025-02-08 10:08:00'),
('260427101', 'Arivazhagan', '9404719169', 'Student', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 21, 'Female', '2026-04-27 14:07:00'),
('251102101', 'Kannan', '9355116384', 'Student', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 23, 'Female', '2025-11-02 12:58:00'),
('251029101', 'Balamurugan', '9988878524', 'Clerk', 'Madurai Region', 'Madurai District', 'Periyar Bus Stand', 'Periyar Bus Stand, Madurai District', 30, 'Male', '2025-10-29 10:07:00'),
('251222101', 'Revathi', '9203831132', 'Engineer', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 64, 'Female', '2025-12-22 08:50:00'),
('260916101', 'Saraswathi', '9331837154', 'Mechanic', 'Madurai Region', 'Madurai District', 'Meenakshi Amman Temple Street', 'Meenakshi Amman Temple Street, Madurai District', 64, 'Male', '2026-09-16 14:36:00'),
('261007101', 'Vijayalakshmi', '9614176767', 'Engineer', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 61, 'Female', '2026-10-07 12:27:00'),
('260222101', 'Vijayalakshmi', '9134901488', 'Shopkeeper', 'Dindigul Region', 'Dindigul District', 'Begampur', 'Begampur, Dindigul District', 23, 'Male', '2026-02-22 17:02:00'),
('251231101', 'Nirmala', '9787429894', 'Tailor', 'Coimbatore Region', 'Coimbatore District', 'Gandhipuram', 'Gandhipuram, Coimbatore District', 47, 'Female', '2025-12-31 12:10:00'),
('260626101', 'Gayathri', '9208142101', 'Tailor', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 65, 'Male', '2026-06-26 11:27:00'),
('251018101', 'Balamurugan', '9190678447', 'Student', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 63, 'Female', '2025-10-18 17:47:00'),
('260617101', 'Kalaiselvi', '9556353771', 'Engineer', 'Madurai Region', 'Madurai District', 'Tirupparankundram', 'Tirupparankundram, Madurai District', 50, 'Male', '2026-06-17 09:20:00'),
('260423101', 'Chinnasamy', '9261111580', 'Mechanic', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 21, 'Female', '2026-04-23 09:09:00'),
('250105101', 'Nirmala', '9790392467', 'Engineer', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 41, 'Male', '2025-01-05 14:08:00'),
('250330101', 'Sumathi', '9668546858', 'Engineer', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 54, 'Female', '2025-03-30 14:24:00'),
('250520101', 'Muthukumar', '9825574296', 'Engineer', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 35, 'Male', '2025-05-20 08:47:00'),
('250215101', 'Pushpa Devi', '9344626983', 'Driver', 'Madurai Region', 'Theni District', 'Periyakulam', 'Periyakulam, Theni District', 41, 'Male', '2025-02-15 11:58:00'),
('260112101', 'Sivakumar', '9308853268', 'Nurse', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 23, 'Male', '2026-01-12 15:59:00'),
('250318101', 'Jayanthi', '9558065531', 'Driver', 'Madurai Region', 'Madurai District', 'Meenakshi Amman Temple Street', 'Meenakshi Amman Temple Street, Madurai District', 52, 'Male', '2025-03-18 16:53:00'),
('250330102', 'Muthukumar', '9417830739', 'Tailor', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 19, 'Female', '2025-03-30 10:51:00'),
('260323101', 'Sivakumar', '9321317965', 'Student', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 22, 'Male', '2026-03-23 15:02:00'),
('251208101', 'Kannan', '9378618398', 'Tailor', 'Coimbatore Region', 'Coimbatore District', 'Gandhipuram', 'Gandhipuram, Coimbatore District', 52, 'Female', '2025-12-08 15:52:00'),
('250406101', 'Manikandan', '9351101921', 'Student', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 48, 'Female', '2025-04-06 13:36:00'),
('251105101', 'Ganesan', '9787450904', 'Weaver', 'Coimbatore Region', 'Coimbatore District', 'Peelamedu', 'Peelamedu, Coimbatore District', 22, 'Female', '2025-11-05 09:28:00'),
('250923101', 'Sivakumar', '9376338664', 'Tailor', 'Coimbatore Region', 'Coimbatore District', 'Gandhipuram', 'Gandhipuram, Coimbatore District', 40, 'Female', '2025-09-23 14:22:00'),
('260615102', 'Thenmozhi', '9874820947', 'Driver', 'Dindigul Region', 'Palani District', 'Palani Bus Stand', 'Palani Bus Stand, Palani District', 25, 'Female', '2026-06-15 13:51:00'),
('260518101', 'Dhanapal', '9703324996', 'Engineer', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 35, 'Male', '2026-05-18 14:20:00'),
('250624101', 'Pushpa Devi', '9145580173', 'Tailor', 'Dindigul Region', 'Oddanchatram', 'Kallimandayam', 'Kallimandayam, Oddanchatram', 67, 'Female', '2025-06-24 16:20:00'),
('250306101', 'Thenmozhi', '9585315005', 'Teacher', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 58, 'Female', '2025-03-06 12:58:00'),
('260109101', 'Valliammal', '9453375195', 'Teacher', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 53, 'Male', '2026-01-09 13:27:00'),
('251123102', 'Ganesan', '9666798221', 'Clerk', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 49, 'Male', '2025-11-23 10:20:00'),
('260726102', 'Vijayalakshmi', '9622967189', 'Student', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 54, 'Male', '2026-07-26 09:39:00'),
('260425101', 'Vijayalakshmi', '9918734692', 'Shopkeeper', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 51, 'Female', '2026-04-25 12:13:00'),
('250309101', 'Rajendran', '9644556550', 'Engineer', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 67, 'Male', '2025-03-09 14:33:00'),
('251130101', 'Valliammal', '9262075219', 'Farmer', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 26, 'Female', '2025-11-30 11:03:00'),
('250504101', 'Chinnasamy', '9259964825', 'Trader', 'Coimbatore Region', 'Coimbatore District', 'Gandhipuram', 'Gandhipuram, Coimbatore District', 39, 'Male', '2025-05-04 08:29:00'),
('260622101', 'Valliammal', '9250397927', 'Shopkeeper', 'Dindigul Region', 'Dindigul District', 'Dindigul Fort', 'Dindigul Fort, Dindigul District', 25, 'Female', '2026-06-22 12:48:00'),
('250809101', 'Jayanthi', '9571284709', 'Weaver', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 55, 'Female', '2025-08-09 11:43:00'),
('260323102', 'Gayathri', '9534386819', 'Driver', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 58, 'Female', '2026-03-23 12:48:00'),
('260902101', 'Valliammal', '9446708555', 'Student', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 56, 'Female', '2026-09-02 13:46:00'),
('250425101', 'Thenmozhi', '9742927876', 'Teacher', 'Madurai Region', 'Madurai District', 'Goripalayam', 'Goripalayam, Madurai District', 55, 'Male', '2025-04-25 17:31:00'),
('250906101', 'Sivakumar', '9690797944', 'Teacher', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 23, 'Male', '2025-09-06 16:21:00'),
('260811101', 'Balamurugan', '9180581948', 'Engineer', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 53, 'Male', '2026-08-11 13:23:00'),
('260227101', 'Chinnasamy', '9885431899', 'Weaver', 'Dindigul Region', 'Palani District', 'Palani Bus Stand', 'Palani Bus Stand, Palani District', 52, 'Male', '2026-02-27 09:09:00'),
('250703101', 'Parvathi', '9790701061', 'Shopkeeper', 'Madurai Region', 'Theni District', 'Periyakulam', 'Periyakulam, Theni District', 59, 'Female', '2025-07-03 11:23:00'),
('250418101', 'Muthukumar', '9566264842', 'Clerk', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 23, 'Female', '2025-04-18 17:47:00'),
('250305101', 'Kannan', '9225207921', 'Student', 'Dindigul Region', 'Dindigul District', 'RM Colony', 'RM Colony, Dindigul District', 66, 'Female', '2025-03-05 17:18:00'),
('260913101', 'Gayathri', '9502929716', 'Weaver', 'Dindigul Region', 'Dindigul District', 'RM Colony', 'RM Colony, Dindigul District', 67, 'Female', '2026-09-13 16:46:00'),
('251224101', 'Muthukumar', '9849003052', 'Engineer', 'Madurai Region', 'Madurai District', 'Goripalayam', 'Goripalayam, Madurai District', 67, 'Male', '2025-12-24 17:03:00'),
('251108101', 'Valliammal', '9114906177', 'Weaver', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 22, 'Male', '2025-11-08 17:28:00'),
('260112102', 'Dhanapal', '9373491081', 'Weaver', 'Chennai Region', 'Chennai District', 'T Nagar', 'T Nagar, Chennai District', 28, 'Female', '2026-01-12 09:14:00'),
('260130101', 'Pushpa Devi', '9472617121', 'Nurse', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 38, 'Female', '2026-01-30 15:25:00'),
('251014101', 'Saraswathi', '9733466210', 'Driver', 'Dindigul Region', 'Oddanchatram', 'Kallimandayam', 'Kallimandayam, Oddanchatram', 43, 'Male', '2025-10-14 14:10:00'),
('251206101', 'Vijayalakshmi', '9544444390', 'Tailor', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 34, 'Male', '2025-12-06 17:58:00'),
('260809101', 'Gayathri', '9959359634', 'Shopkeeper', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 49, 'Female', '2026-08-09 15:57:00'),
('251208102', 'Thenmozhi', '9522414124', 'Teacher', 'Coimbatore Region', 'Coimbatore District', 'Peelamedu', 'Peelamedu, Coimbatore District', 51, 'Male', '2025-12-08 09:34:00'),
('260104101', 'Nirmala', '9226755847', 'Shopkeeper', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 67, 'Female', '2026-01-04 08:05:00'),
('250118101', 'Nirmala', '9234982679', 'Clerk', 'Dindigul Region', 'Dindigul District', 'Spencer Compound', 'Spencer Compound, Dindigul District', 52, 'Female', '2025-01-18 13:15:00'),
('250907101', 'Dhanapal', '9751418439', 'Nurse', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 64, 'Female', '2025-09-07 11:54:00'),
('251031101', 'Ramesh Kumar', '9380969149', 'Teacher', 'Dindigul Region', 'Dindigul District', 'RM Colony', 'RM Colony, Dindigul District', 47, 'Male', '2025-10-31 11:30:00'),
('250826101', 'Saraswathi', '9764994567', 'Student', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 20, 'Female', '2025-08-26 12:10:00'),
('250412101', 'Saraswathi', '9156383019', 'Shopkeeper', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 64, 'Female', '2025-04-12 09:02:00'),
('250113101', 'Sumathi', '9375491540', 'Weaver', 'Dindigul Region', 'Palani District', 'Kodaikanal Road', 'Kodaikanal Road, Palani District', 57, 'Male', '2025-01-13 11:50:00'),
('250405101', 'Jayanthi', '9433932060', 'Tailor', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 32, 'Male', '2025-04-05 13:32:00'),
('260408101', 'Kannan', '9303592464', 'Trader', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 65, 'Female', '2026-04-08 14:28:00'),
('260930101', 'Selvarani', '9115533574', 'Weaver', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 31, 'Male', '2026-09-30 15:11:00'),
('260427102', 'Muthukumar', '9187265049', 'Driver', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 46, 'Female', '2026-04-27 12:33:00'),
('251116101', 'Saraswathi', '9552768612', 'Shopkeeper', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 22, 'Male', '2025-11-16 15:27:00'),
('251225101', 'Ganesan', '9883843274', 'Driver', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 35, 'Female', '2025-12-25 10:50:00'),
('260923101', 'Chinnasamy', '9279977016', 'Clerk', 'Coimbatore Region', 'Coimbatore District', 'Gandhipuram', 'Gandhipuram, Coimbatore District', 46, 'Female', '2026-09-23 10:50:00'),
('260506101', 'Balamurugan', '9500038085', 'Mechanic', 'Madurai Region', 'Madurai District', 'Anna Nagar', 'Anna Nagar, Madurai District', 46, 'Male', '2026-05-06 15:39:00'),
('250327101', 'Rajendran', '9200020701', 'Tailor', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 43, 'Female', '2025-03-27 13:27:00'),
('250918101', 'Vijayalakshmi', '9368238986', 'Weaver', 'Madurai Region', 'Madurai District', 'Goripalayam', 'Goripalayam, Madurai District', 47, 'Female', '2025-09-18 08:26:00'),
('260823101', 'Ganesan', '9226968427', 'Mechanic', 'Madurai Region', 'Madurai District', 'Tirupparankundram', 'Tirupparankundram, Madurai District', 53, 'Male', '2026-08-23 11:32:00'),
('260424102', 'Saraswathi', '9156810786', 'Student', 'Dindigul Region', 'Dindigul District', 'Dindigul Fort', 'Dindigul Fort, Dindigul District', 51, 'Female', '2026-04-24 11:59:00'),
('250919101', 'Pushpa Devi', '9217329557', 'Driver', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 61, 'Female', '2025-09-19 16:12:00'),
('260807101', 'Nirmala', '9369540315', 'Mechanic', 'Madurai Region', 'Madurai District', 'Goripalayam', 'Goripalayam, Madurai District', 23, 'Female', '2026-08-07 08:37:00'),
('250810101', 'Manikandan', '9956723788', 'Engineer', 'Dindigul Region', 'Oddanchatram', 'Kallimandayam', 'Kallimandayam, Oddanchatram', 51, 'Female', '2025-08-10 14:06:00'),
('260702101', 'Jayanthi', '9751175010', 'Student', 'Madurai Region', 'Theni District', 'Periyakulam', 'Periyakulam, Theni District', 35, 'Male', '2026-07-02 12:10:00'),
('251016101', 'Rajendran', '9717793551', 'Farmer', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 23, 'Female', '2025-10-16 15:24:00'),
('260907101', 'Ilango', '9877694860', 'Shopkeeper', 'Chennai Region', 'Chennai District', 'Velachery', 'Velachery, Chennai District', 23, 'Male', '2026-09-07 15:05:00'),
('260910101', 'Gayathri', '9553321329', 'Student', 'Coimbatore Region', 'Coimbatore District', 'Peelamedu', 'Peelamedu, Coimbatore District', 49, 'Female', '2026-09-10 15:38:00'),
('250428101', 'Thenmozhi', '9412268807', 'Shopkeeper', 'Dindigul Region', 'Oddanchatram', 'Market Yard', 'Market Yard, Oddanchatram', 38, 'Female', '2025-04-28 09:17:00'),
('250618101', 'Ganesan', '9122960625', 'Driver', 'Madurai Region', 'Madurai District', 'Tirupparankundram', 'Tirupparankundram, Madurai District', 63, 'Female', '2025-06-18 12:46:00'),
('250301101', 'Senthil Murugan', '9421020050', 'Driver', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 59, 'Male', '2025-03-01 11:02:00'),
('250220101', 'Anbazhagan', '9693049844', 'Shopkeeper', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 27, 'Male', '2025-02-20 09:24:00'),
('250817101', 'Ramesh Kumar', '9759540055', 'Tailor', 'Madurai Region', 'Madurai District', 'Goripalayam', 'Goripalayam, Madurai District', 59, 'Male', '2025-08-17 11:05:00'),
('260403101', 'Selvarani', '9193289923', 'Farmer', 'Dindigul Region', 'Palani District', 'Adivaram', 'Adivaram, Palani District', 59, 'Male', '2026-04-03 08:43:00'),
('251101101', 'Dhanapal', '9993471067', 'Shopkeeper', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 23, 'Male', '2025-11-01 15:23:00'),
('260701101', 'Sivakumar', '9484296122', 'Shopkeeper', 'Dindigul Region', 'Dindigul District', 'Spencer Compound', 'Spencer Compound, Dindigul District', 53, 'Female', '2026-07-01 17:58:00'),
('250726101', 'Revathi', '9727912573', 'Weaver', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 50, 'Female', '2025-07-26 17:21:00'),
('250815101', 'Kalaiselvi', '9661175201', 'Engineer', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 48, 'Female', '2025-08-15 08:26:00'),
('251215101', 'Ramesh Kumar', '9246681957', 'Student', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 28, 'Female', '2025-12-15 13:13:00'),
('250109101', 'Jayanthi', '9489081788', 'Engineer', 'Madurai Region', 'Madurai District', 'Thallakulam', 'Thallakulam, Madurai District', 40, 'Female', '2025-01-09 16:14:00'),
('260528101', 'Anbazhagan', '9675811674', 'Farmer', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 24, 'Male', '2026-05-28 08:20:00'),
('251004101', 'Chinnasamy', '9263080363', 'Mechanic', 'Dindigul Region', 'Oddanchatram', 'Kallimandayam', 'Kallimandayam, Oddanchatram', 43, 'Male', '2025-10-04 17:41:00'),
('250108101', 'Nirmala', '9110368003', 'Engineer', 'Coimbatore Region', 'Coimbatore District', 'Peelamedu', 'Peelamedu, Coimbatore District', 24, 'Male', '2025-01-08 11:36:00'),
('260512101', 'Pushpa Devi', '9735172742', 'Driver', 'Madurai Region', 'Madurai District', 'Meenakshi Amman Temple Street', 'Meenakshi Amman Temple Street, Madurai District', 28, 'Male', '2026-05-12 10:22:00'),
('260328101', 'Gayathri', '9469272618', 'Shopkeeper', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 44, 'Female', '2026-03-28 15:50:00'),
('260503101', 'Selvarani', '9568923514', 'Driver', 'Dindigul Region', 'Dindigul District', 'Dindigul Fort', 'Dindigul Fort, Dindigul District', 55, 'Male', '2026-05-03 13:06:00'),
('251101102', 'Senthil Murugan', '9136232297', 'Tailor', 'Dindigul Region', 'Dindigul District', 'Begampur', 'Begampur, Dindigul District', 36, 'Female', '2025-11-01 11:40:00'),
('250505101', 'Senthil Murugan', '9840631769', 'Nurse', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 60, 'Female', '2025-05-05 12:18:00'),
('260907102', 'Dhanapal', '9630433445', 'Trader', 'Madurai Region', 'Theni District', 'Periyakulam', 'Periyakulam, Theni District', 60, 'Female', '2026-09-07 10:57:00'),
('260531101', 'Saraswathi', '9717749142', 'Weaver', 'Dindigul Region', 'Oddanchatram', 'Kallimandayam', 'Kallimandayam, Oddanchatram', 24, 'Female', '2026-05-31 11:37:00'),
('251210101', 'Arivazhagan', '9236880737', 'Weaver', 'Madurai Region', 'Madurai District', 'Anna Nagar', 'Anna Nagar, Madurai District', 62, 'Female', '2025-12-10 12:03:00'),
('260202101', 'Lakshmi Priya', '9785669225', 'Student', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 53, 'Male', '2026-02-02 17:38:00'),
('260827101', 'Kalaiselvi', '9900515834', 'Student', 'Madurai Region', 'Theni District', 'Cumbum Road', 'Cumbum Road, Theni District', 38, 'Female', '2026-08-27 16:34:00'),
('251016102', 'Sumathi', '9400702897', 'Shopkeeper', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 33, 'Male', '2025-10-16 12:04:00'),
('250106101', 'Rajendran', '9869444494', 'Farmer', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 34, 'Female', '2025-01-06 14:24:00'),
('250324101', 'Arivazhagan', '9237553697', 'Student', 'Dindigul Region', 'Oddanchatram', 'Old Bus Stand', 'Old Bus Stand, Oddanchatram', 53, 'Female', '2025-03-24 11:13:00'),
('251029102', 'Ramesh Kumar', '9751417507', 'Nurse', 'Madurai Region', 'Usilampatti', 'Peraiyur Road', 'Peraiyur Road, Usilampatti', 44, 'Female', '2025-10-29 14:00:00'),
('260707101', 'Nirmala', '9496842378', 'Teacher', 'Madurai Region', 'Usilampatti', 'Usilampatti Town', 'Usilampatti Town, Usilampatti', 29, 'Male', '2026-07-07 12:06:00'),
('260221101', 'Anbazhagan', '9687063755', 'Weaver', 'Dindigul Region', 'Dindigul District', 'RM Colony', 'RM Colony, Dindigul District', 62, 'Female', '2026-02-21 14:06:00'),
('250405102', 'Kalaiselvi', '9720299620', 'Trader', 'Madurai Region', 'Madurai District', 'Anna Nagar', 'Anna Nagar, Madurai District', 60, 'Female', '2025-04-05 16:29:00'),
('250822101', 'Kannan', '9510017171', 'Nurse', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 66, 'Male', '2025-08-22 12:31:00'),
('260731101', 'Pushpa Devi', '9914276878', 'Nurse', 'Coimbatore Region', 'Coimbatore District', 'RS Puram', 'RS Puram, Coimbatore District', 47, 'Female', '2026-07-31 10:07:00'),
('250507101', 'Kannan', '9987229900', 'Mechanic', 'Dindigul Region', 'Dindigul District', 'Nagal Nagar', 'Nagal Nagar, Dindigul District', 45, 'Female', '2025-05-07 08:31:00'),
('260605101', 'Sumathi', '9555443905', 'Mechanic', 'Dindigul Region', 'Dindigul District', 'Nagal Nagar', 'Nagal Nagar, Dindigul District', 47, 'Male', '2026-06-05 13:57:00'),
('250721101', 'Pushpa Devi', '9887903166', 'Teacher', 'Madurai Region', 'Theni District', 'Bodinayakanur Market', 'Bodinayakanur Market, Theni District', 32, 'Female', '2025-07-21 11:45:00');

INSERT INTO investigation (case_id, investigator, statement2, assigned_date, status2, completed_date) VALUES
('250417101', '125', '<p>Suspects identified; search teams deployed.</p>', '2025-04-18 10:55:00', 'Not Completed', ''),
('260529101', '110', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-05-30 08:54:00', 'completed', '2026-07-16'),
('250717101', '121', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-07-18 10:39:00', 'completed', '2025-08-08'),
('260615101', '126', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-06-16 14:09:00', 'completed', '2026-07-27'),
('250724101', '123', '<p>Suspects identified; search teams deployed.</p>', '2025-07-25 14:42:00', 'Not Completed', ''),
('251005101', '121', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-10-06 13:59:00', 'completed', '2025-10-27'),
('260216101', '123', '<p>Evidence under analysis; one suspect questioned.</p>', '2026-02-17 08:19:00', 'Not Completed', ''),
('250525101', '121', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-05-26 12:14:00', 'completed', '2025-06-22'),
('250308101', '126', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-03-09 15:07:00', 'completed', '2025-04-09'),
('260510101', '125', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-05-11 08:03:00', 'completed', '2026-06-23'),
('250116101', '110', '<p>Suspects identified; search teams deployed.</p>', '2025-01-17 10:37:00', 'Not Completed', ''),
('260424101', '122', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-04-25 14:20:00', 'completed', '2026-06-12'),
('260808101', '110', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-08-09 14:49:00', 'Not Completed', ''),
('251005102', '124', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-10-06 08:53:00', 'completed', '2025-12-11'),
('260602101', '126', '<p>Suspects identified; search teams deployed.</p>', '2026-06-03 17:17:00', 'Not Completed', ''),
('250720101', '121', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-07-21 10:41:00', 'completed', '2025-08-17'),
('260716101', '115', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2026-07-17 15:01:00', 'completed', '2026-08-11'),
('260320101', '121', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-03-21 17:22:00', 'completed', '2026-04-05'),
('250210101', '115', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-02-11 12:53:00', 'completed', '2025-03-28'),
('260729101', '121', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-07-30 11:34:00', 'completed', '2026-08-14'),
('260901101', '121', '<p>Awaiting forensic report; investigation in progress.</p>', '2026-09-02 09:51:00', 'Not Completed', ''),
('250727101', '126', '<p>Evidence under analysis; one suspect questioned.</p>', '2025-07-28 14:05:00', 'Not Completed', ''),
('250606101', '124', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-06-07 13:23:00', 'completed', '2025-07-30'),
('251212101', '116', '<p>Witnesses examined; CCTV footage being collected.</p>', '2025-12-13 11:41:00', 'Not Completed', ''),
('260131101', '110', '<p>Witnesses examined; CCTV footage being collected.</p>', '2026-02-01 13:54:00', 'Not Completed', ''),
('250613101', '115', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-06-14 15:12:00', 'completed', '2025-07-28'),
('260216102', '116', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2026-02-17 12:05:00', 'completed', '2026-04-02'),
('251022101', '121', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-10-23 14:32:00', 'completed', '2025-11-12'),
('260808102', '125', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-08-09 10:46:00', 'completed', '2026-08-31'),
('260108101', '120', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-01-09 15:26:00', 'completed', '2026-01-30'),
('250207101', '124', '<p>Evidence under analysis; one suspect questioned.</p>', '2025-02-08 14:56:00', 'Not Completed', ''),
('260228101', '120', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-03-01 15:22:00', 'completed', '2026-03-28'),
('250206101', '110', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-02-07 15:57:00', 'completed', '2025-03-20'),
('260726101', '110', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-07-27 08:09:00', 'completed', '2026-09-05'),
('250708101', '124', '<p>Suspects identified; search teams deployed.</p>', '2025-07-09 14:04:00', 'Not Completed', ''),
('250730101', '126', '<p>Awaiting forensic report; investigation in progress.</p>', '2025-07-31 12:18:00', 'Not Completed', ''),
('260921102', '121', '<p>Witnesses examined; CCTV footage being collected.</p>', '2026-09-22 11:29:00', 'Not Completed', ''),
('251113101', '125', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-11-14 16:20:00', 'completed', '2025-12-18'),
('250124101', '126', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-01-25 08:14:00', 'completed', '2025-02-28'),
('251123101', '126', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-11-24 14:00:00', 'completed', '2026-01-16'),
('250208101', '121', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-02-09 10:08:00', 'completed', '2025-03-04'),
('260427101', '126', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-04-28 14:07:00', 'completed', '2026-06-23'),
('251102101', '124', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-11-03 12:58:00', 'completed', '2026-01-13'),
('251029101', '121', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-10-30 10:07:00', 'completed', '2025-11-13'),
('251222101', '110', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-12-23 08:50:00', 'completed', '2026-02-04'),
('260916101', '115', '<p>Suspects identified; search teams deployed.</p>', '2026-09-17 14:36:00', 'Not Completed', ''),
('260222101', '115', '<p>Awaiting forensic report; investigation in progress.</p>', '2026-02-23 17:02:00', 'Not Completed', ''),
('251231101', '122', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-01-01 12:10:00', 'completed', '2026-03-01'),
('260626101', '125', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-06-27 11:27:00', 'completed', '2026-07-14'),
('251018101', '121', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-10-19 17:47:00', 'completed', '2025-11-20'),
('260617101', '126', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2026-06-18 09:20:00', 'completed', '2026-08-21'),
('260423101', '123', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-04-24 09:09:00', 'completed', '2026-06-13'),
('250105101', '126', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-01-06 14:08:00', 'completed', '2025-03-03'),
('250330101', '110', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-03-31 14:24:00', 'completed', '2025-05-08'),
('250520101', '124', '<p>Witnesses examined; CCTV footage being collected.</p>', '2025-05-21 08:47:00', 'Not Completed', ''),
('250215101', '120', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-02-16 11:58:00', 'completed', '2025-03-05'),
('260112101', '126', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-01-13 15:59:00', 'completed', '2026-02-12'),
('250318101', '126', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-03-19 16:53:00', 'completed', '2025-05-27'),
('250330102', '110', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-03-31 10:51:00', 'completed', '2025-05-04'),
('260323101', '122', '<p>Suspects identified; search teams deployed.</p>', '2026-03-24 15:02:00', 'Not Completed', ''),
('251208101', '123', '<p>Witnesses examined; CCTV footage being collected.</p>', '2025-12-09 15:52:00', 'Not Completed', ''),
('250406101', '124', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-04-07 13:36:00', 'completed', '2025-05-09'),
('251105101', '125', '<p>Suspects identified; search teams deployed.</p>', '2025-11-06 09:28:00', 'Not Completed', ''),
('250923101', '110', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-09-24 14:22:00', 'completed', '2025-11-10'),
('260615102', '123', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2026-06-16 13:51:00', 'completed', '2026-07-19'),
('260518101', '125', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-05-19 14:20:00', 'completed', '2026-06-24'),
('250624101', '122', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-06-25 16:20:00', 'completed', '2025-08-11'),
('250306101', '110', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-03-07 12:58:00', 'completed', '2025-04-08'),
('260109101', '125', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-01-10 13:27:00', 'completed', '2026-02-01'),
('251123102', '120', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-11-24 10:20:00', 'completed', '2026-01-03'),
('260726102', '120', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2026-07-27 09:39:00', 'completed', '2026-08-30'),
('260425101', '124', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-04-26 12:13:00', 'Not Completed', ''),
('250309101', '120', '<p>FIR registered; scene inspected and statements recorded.</p>', '2025-03-10 14:33:00', 'Not Completed', ''),
('251130101', '116', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-12-01 11:03:00', 'completed', '2026-01-21'),
('250504101', '116', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-05-05 08:29:00', 'completed', '2025-05-30'),
('260622101', '116', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2026-06-23 12:48:00', 'completed', '2026-07-22'),
('250809101', '124', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-08-10 11:43:00', 'completed', '2025-10-24'),
('260323102', '125', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-03-24 12:48:00', 'completed', '2026-04-15'),
('260902101', '110', '<p>Evidence under analysis; one suspect questioned.</p>', '2026-09-03 13:46:00', 'Not Completed', ''),
('250425101', '120', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-04-26 17:31:00', 'completed', '2025-06-06'),
('250906101', '124', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-09-07 16:21:00', 'completed', '2025-10-14'),
('260811101', '120', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2026-08-12 13:23:00', 'completed', '2026-09-12'),
('260227101', '116', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2026-02-28 09:09:00', 'completed', '2026-04-08'),
('250703101', '122', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-07-04 11:23:00', 'completed', '2025-08-14'),
('250418101', '120', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-04-19 17:47:00', 'completed', '2025-05-11'),
('250305101', '122', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-03-06 17:18:00', 'completed', '2025-04-12'),
('260913101', '124', '<p>Witnesses examined; CCTV footage being collected.</p>', '2026-09-14 16:46:00', 'Not Completed', ''),
('251224101', '123', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-12-25 17:03:00', 'completed', '2026-02-11'),
('251108101', '122', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-11-09 17:28:00', 'completed', '2025-12-11'),
('260112102', '124', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-01-13 09:14:00', 'completed', '2026-04-02'),
('260130101', '122', '<p>Suspects identified; search teams deployed.</p>', '2026-01-31 15:25:00', 'Not Completed', ''),
('251014101', '124', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-10-15 14:10:00', 'completed', '2025-11-23'),
('251206101', '115', '<p>FIR registered; scene inspected and statements recorded.</p>', '2025-12-07 17:58:00', 'Not Completed', ''),
('260809101', '120', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2026-08-10 15:57:00', 'completed', '2026-09-07'),
('251208102', '122', '<p>Suspects identified; search teams deployed.</p>', '2025-12-09 09:34:00', 'Not Completed', ''),
('260104101', '121', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-01-05 08:05:00', 'completed', '2026-01-18'),
('250118101', '115', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-01-19 13:15:00', 'completed', '2025-02-24'),
('250907101', '116', '<p>FIR registered; scene inspected and statements recorded.</p>', '2025-09-08 11:54:00', 'Not Completed', ''),
('251031101', '110', '<p>Awaiting forensic report; investigation in progress.</p>', '2025-11-01 11:30:00', 'Not Completed', ''),
('250826101', '126', '<p>Suspects identified; search teams deployed.</p>', '2025-08-27 12:10:00', 'Not Completed', ''),
('250412101', '122', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-04-13 09:02:00', 'completed', '2025-05-26'),
('250113101', '125', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-01-14 11:50:00', 'completed', '2025-02-14'),
('250405101', '110', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-04-06 13:32:00', 'completed', '2025-05-15'),
('260408101', '124', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-04-09 14:28:00', 'completed', '2026-06-28'),
('260930101', '122', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-10-01 15:11:00', 'Not Completed', ''),
('260427102', '126', '<p>Suspects identified; search teams deployed.</p>', '2026-04-28 12:33:00', 'Not Completed', ''),
('251116101', '121', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-11-17 15:27:00', 'completed', '2025-11-29'),
('251225101', '121', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-12-26 10:50:00', 'completed', '2026-01-18'),
('260923101', '123', '<p>Suspects identified; search teams deployed.</p>', '2026-09-24 10:50:00', 'Not Completed', ''),
('260506101', '124', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2026-05-07 15:39:00', 'completed', '2026-07-19'),
('250327101', '120', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-03-28 13:27:00', 'completed', '2025-04-18'),
('250918101', '120', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-09-19 08:26:00', 'completed', '2025-10-14'),
('260823101', '122', '<p>Awaiting forensic report; investigation in progress.</p>', '2026-08-24 11:32:00', 'Not Completed', ''),
('260424102', '121', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-04-25 11:59:00', 'completed', '2026-05-23'),
('250919101', '123', '<p>Suspects identified; search teams deployed.</p>', '2025-09-20 16:12:00', 'Not Completed', ''),
('260807101', '125', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2026-08-08 08:37:00', 'completed', '2026-09-19'),
('250810101', '122', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-08-11 14:06:00', 'completed', '2025-09-25'),
('260702101', '121', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-07-03 12:10:00', 'Not Completed', ''),
('251016101', '121', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-10-17 15:24:00', 'completed', '2025-11-09'),
('260907101', '126', '<p>Suspects identified; search teams deployed.</p>', '2026-09-08 15:05:00', 'Not Completed', ''),
('260910101', '126', '<p>Evidence under analysis; one suspect questioned.</p>', '2026-09-11 15:38:00', 'Not Completed', ''),
('250428101', '125', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-04-29 09:17:00', 'completed', '2025-05-22'),
('250618101', '124', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-06-19 12:46:00', 'completed', '2025-08-24'),
('250301101', '123', '<p>Suspects identified; search teams deployed.</p>', '2025-03-02 11:02:00', 'Not Completed', ''),
('250220101', '121', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-02-21 09:24:00', 'completed', '2025-03-17'),
('250817101', '121', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-08-18 11:05:00', 'completed', '2025-09-07'),
('260403101', '122', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2026-04-04 08:43:00', 'completed', '2026-05-22'),
('251101101', '121', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-11-02 15:23:00', 'completed', '2025-11-23'),
('260701101', '125', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-07-02 17:58:00', 'Not Completed', ''),
('250726101', '123', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-07-27 17:21:00', 'completed', '2025-09-02'),
('250815101', '126', '<p>Awaiting forensic report; investigation in progress.</p>', '2025-08-16 08:26:00', 'Not Completed', ''),
('251215101', '116', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-12-16 13:13:00', 'completed', '2026-01-23'),
('250109101', '120', '<p>Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.</p>', '2025-01-10 16:14:00', 'completed', '2025-02-02'),
('260528101', '122', '<p>Witnesses examined; CCTV footage being collected.</p>', '2026-05-29 08:20:00', 'Not Completed', ''),
('251004101', '116', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-10-05 17:41:00', 'completed', '2025-11-28'),
('250108101', '124', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-01-09 11:36:00', 'completed', '2025-02-24'),
('260512101', '116', '<p>Awaiting forensic report; investigation in progress.</p>', '2026-05-13 10:22:00', 'Not Completed', ''),
('260328101', '126', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2026-03-29 15:50:00', 'completed', '2026-05-31'),
('260503101', '121', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2026-05-04 13:06:00', 'completed', '2026-05-17'),
('251101102', '115', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-11-02 11:40:00', 'completed', '2025-12-09'),
('250505101', '115', '<p>Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.</p>', '2025-05-06 12:18:00', 'completed', '2025-06-14'),
('260907102', '126', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-09-08 10:57:00', 'Not Completed', ''),
('260531101', '120', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2026-06-01 11:37:00', 'completed', '2026-06-22'),
('251210101', '120', '<p>FIR registered; scene inspected and statements recorded.</p>', '2025-12-11 12:03:00', 'Not Completed', ''),
('260202101', '124', '<p>FIR registered; scene inspected and statements recorded.</p>', '2026-02-03 17:38:00', 'Not Completed', ''),
('260827101', '125', '<p>Witnesses examined; CCTV footage being collected.</p>', '2026-08-28 16:34:00', 'Not Completed', ''),
('251016102', '110', '<p>FIR registered; scene inspected and statements recorded.</p>', '2025-10-17 12:04:00', 'Not Completed', ''),
('250106101', '123', '<p>Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.</p>', '2025-01-07 14:24:00', 'completed', '2025-02-13'),
('250324101', '120', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2025-03-25 11:13:00', 'completed', '2025-04-14'),
('251029102', '126', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-10-30 14:00:00', 'completed', '2025-12-14'),
('260707101', '125', '<p>Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.</p>', '2026-07-08 12:06:00', 'completed', '2026-08-18'),
('260221101', '116', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2026-02-22 14:06:00', 'completed', '2026-04-02'),
('250405102', '122', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-04-06 16:29:00', 'completed', '2025-06-05'),
('250822101', '115', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2025-08-23 12:31:00', 'completed', '2025-09-29'),
('260731101', '125', '<p>Witnesses examined; CCTV footage being collected.</p>', '2026-08-01 10:07:00', 'Not Completed', ''),
('250507101', '126', '<p>Awaiting forensic report; investigation in progress.</p>', '2025-05-08 08:31:00', 'Not Completed', ''),
('260605101', '125', '<p>Accused identified from fingerprints at the scene and arrested; stolen articles recovered.</p>', '2026-06-06 13:57:00', 'completed', '2026-06-27'),
('250721101', '110', '<p>Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.</p>', '2025-07-22 11:45:00', 'completed', '2025-09-04');

INSERT INTO case_resolution (case_id, remarks, updated_by, updated_at) VALUES
('260529101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '110', '2026-07-16 12:00:00'),
('250717101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '121', '2025-08-08 12:00:00'),
('260615101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '126', '2026-07-27 12:00:00'),
('251005101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '121', '2025-10-27 12:00:00'),
('250525101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '121', '2025-06-22 12:00:00'),
('250308101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '126', '2025-04-09 12:00:00'),
('260510101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '125', '2026-06-23 12:00:00'),
('260424101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '122', '2026-06-12 12:00:00'),
('251005102', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '124', '2025-12-11 12:00:00'),
('250720101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '121', '2025-08-17 12:00:00'),
('260716101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '115', '2026-08-11 12:00:00'),
('260320101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '121', '2026-04-05 12:00:00'),
('250210101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '115', '2025-03-28 12:00:00'),
('260729101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '121', '2026-08-14 12:00:00'),
('250606101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '124', '2025-07-30 12:00:00'),
('250613101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '115', '2025-07-28 12:00:00'),
('260216102', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '116', '2026-04-02 12:00:00'),
('251022101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '121', '2025-11-12 12:00:00'),
('260808102', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '125', '2026-08-31 12:00:00'),
('260108101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '120', '2026-01-30 12:00:00'),
('260228101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '120', '2026-03-28 12:00:00'),
('250206101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '110', '2025-03-20 12:00:00'),
('260726101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '110', '2026-09-05 12:00:00'),
('251113101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '125', '2025-12-18 12:00:00'),
('250124101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '126', '2025-02-28 12:00:00'),
('251123101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '126', '2026-01-16 12:00:00'),
('250208101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '121', '2025-03-04 12:00:00'),
('260427101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '126', '2026-06-23 12:00:00'),
('251102101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '124', '2026-01-13 12:00:00'),
('251029101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '121', '2025-11-13 12:00:00'),
('251222101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '110', '2026-02-04 12:00:00'),
('251231101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '122', '2026-03-01 12:00:00'),
('260626101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '125', '2026-07-14 12:00:00'),
('251018101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '121', '2025-11-20 12:00:00'),
('260617101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '126', '2026-08-21 12:00:00'),
('260423101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '123', '2026-06-13 12:00:00'),
('250105101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '126', '2025-03-03 12:00:00'),
('250330101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '110', '2025-05-08 12:00:00'),
('250215101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '120', '2025-03-05 12:00:00'),
('260112101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '126', '2026-02-12 12:00:00'),
('250318101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '126', '2025-05-27 12:00:00'),
('250330102', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '110', '2025-05-04 12:00:00'),
('250406101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '124', '2025-05-09 12:00:00'),
('250923101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '110', '2025-11-10 12:00:00'),
('260615102', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '123', '2026-07-19 12:00:00'),
('260518101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '125', '2026-06-24 12:00:00'),
('250624101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '122', '2025-08-11 12:00:00'),
('250306101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '110', '2025-04-08 12:00:00'),
('260109101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '125', '2026-02-01 12:00:00'),
('251123102', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '120', '2026-01-03 12:00:00'),
('260726102', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '120', '2026-08-30 12:00:00'),
('251130101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '116', '2026-01-21 12:00:00'),
('250504101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '116', '2025-05-30 12:00:00'),
('260622101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '116', '2026-07-22 12:00:00'),
('250809101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '124', '2025-10-24 12:00:00'),
('260323102', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '125', '2026-04-15 12:00:00'),
('250425101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '120', '2025-06-06 12:00:00'),
('250906101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '124', '2025-10-14 12:00:00'),
('260811101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '120', '2026-09-12 12:00:00'),
('260227101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '116', '2026-04-08 12:00:00'),
('250703101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '122', '2025-08-14 12:00:00'),
('250418101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '120', '2025-05-11 12:00:00'),
('250305101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '122', '2025-04-12 12:00:00'),
('251224101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '123', '2026-02-11 12:00:00'),
('251108101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '122', '2025-12-11 12:00:00'),
('260112102', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '124', '2026-04-02 12:00:00'),
('251014101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '124', '2025-11-23 12:00:00'),
('260809101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '120', '2026-09-07 12:00:00'),
('260104101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '121', '2026-01-18 12:00:00'),
('250118101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '115', '2025-02-24 12:00:00'),
('250412101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '122', '2025-05-26 12:00:00'),
('250113101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '125', '2025-02-14 12:00:00'),
('250405101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '110', '2025-05-15 12:00:00'),
('260408101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '124', '2026-06-28 12:00:00'),
('251116101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '121', '2025-11-29 12:00:00'),
('251225101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '121', '2026-01-18 12:00:00'),
('260506101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '124', '2026-07-19 12:00:00'),
('250327101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '120', '2025-04-18 12:00:00'),
('250918101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '120', '2025-10-14 12:00:00'),
('260424102', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '121', '2026-05-23 12:00:00'),
('260807101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '125', '2026-09-19 12:00:00'),
('250810101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '122', '2025-09-25 12:00:00'),
('251016101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '121', '2025-11-09 12:00:00'),
('250428101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '125', '2025-05-22 12:00:00'),
('250618101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '124', '2025-08-24 12:00:00'),
('250220101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '121', '2025-03-17 12:00:00'),
('250817101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '121', '2025-09-07 12:00:00'),
('260403101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '122', '2026-05-22 12:00:00'),
('251101101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '121', '2025-11-23 12:00:00'),
('250726101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '123', '2025-09-02 12:00:00'),
('251215101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '116', '2026-01-23 12:00:00'),
('250109101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '120', '2025-02-02 12:00:00'),
('251004101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '116', '2025-11-28 12:00:00'),
('250108101', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '124', '2025-02-24 12:00:00'),
('260328101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '126', '2026-05-31 12:00:00'),
('260503101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '121', '2026-05-17 12:00:00'),
('251101102', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '115', '2025-12-09 12:00:00'),
('250505101', 'Eyewitness statements and call records led to the arrest of the accused; chargesheet filed.', '115', '2025-06-14 12:00:00'),
('260531101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '120', '2026-06-22 12:00:00'),
('250106101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '123', '2025-02-13 12:00:00'),
('250324101', 'Bank trail and IP logs traced the fraud to the accused; money partly recovered and chargesheet filed.', '120', '2025-04-14 12:00:00'),
('251029102', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '126', '2025-12-14 12:00:00'),
('260707101', 'Suspects traced through CCTV footage and mobile tower data; arrested and recovered property.', '125', '2026-08-18 12:00:00'),
('260221101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '116', '2026-04-02 12:00:00'),
('250405102', 'Informer tip-off and forensic evidence confirmed the culprit; remanded to judicial custody.', '122', '2025-06-05 12:00:00'),
('250822101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '115', '2025-09-29 12:00:00'),
('260605101', 'Confession of the accused corroborated by medical and forensic reports; case closed with chargesheet.', '125', '2026-06-27 12:00:00'),
('250721101', 'Accused identified from fingerprints at the scene and arrested; stolen articles recovered.', '110', '2025-09-04 12:00:00');

INSERT INTO case_accused (case_id, name, alias_name, age, gender, address, role_in_crime, photo, added_by, added_at) VALUES
('260529101', 'Sakthivel', 'Kutty', 29, 'Male', 'RS Puram, Coimbatore District', 'Main accused', '', '110', '2026-07-16 12:00:00'),
('250717101', 'Ayyanar', '', 41, 'Male', 'Velachery, Chennai District', 'Main accused', '', '121', '2025-08-08 12:00:00'),
('250717101', 'Kalimuthu', 'Pallu', 22, 'Male', 'Velachery, Chennai District', 'Conspirator', '', '121', '2025-08-08 12:00:00'),
('260615101', 'Mookan', 'Gunda', 20, 'Male', 'T Nagar, Chennai District', 'Accomplice', '', '126', '2026-07-27 12:00:00'),
('251005101', 'Mookan', 'Kutty', 31, 'Male', 'Anna Nagar, Madurai District', 'Main accused', '', '121', '2025-10-27 12:00:00'),
('250525101', 'Mari', 'Kutty', 45, 'Male', 'Palani Bus Stand, Palani District', 'Conspirator', '', '121', '2025-06-22 12:00:00'),
('250525101', 'Kalimuthu', 'Pallu', 42, 'Male', 'Palani Bus Stand, Palani District', 'Main accused', '', '121', '2025-06-22 12:00:00'),
('250308101', 'Vellaichamy', 'Kaali', 39, 'Male', 'Spencer Compound, Dindigul District', 'Main accused', '', '126', '2025-04-09 12:00:00'),
('250308101', 'Velmurugan', 'Gunda', 22, 'Male', 'Nagal Nagar, Dindigul District', 'Main accused', '', '126', '2025-04-09 12:00:00'),
('260510101', 'Pechimuthu', 'Gunda', 39, 'Male', 'Peraiyur Road, Usilampatti', 'Conspirator', '', '125', '2026-06-23 12:00:00'),
('260510101', 'Kalimuthu', 'Thambi', 26, 'Male', 'Usilampatti Town, Usilampatti', 'Accomplice', '', '125', '2026-06-23 12:00:00'),
('260424101', 'Ayyanar', 'Anna', 19, 'Male', 'Velachery, Chennai District', 'Accomplice', '', '122', '2026-06-12 12:00:00'),
('260424101', 'Pechimuthu', 'Gunda', 35, 'Male', 'Velachery, Chennai District', 'Conspirator', '', '122', '2026-06-12 12:00:00'),
('251005102', 'Vellaichamy', 'Kutty', 50, 'Male', 'Adivaram, Palani District', 'Main accused', '', '124', '2025-12-11 12:00:00'),
('251005102', 'Sudalaimuthu', 'Thambi', 42, 'Male', 'Gandhi Road, Palani District', 'Accomplice', '', '124', '2025-12-11 12:00:00'),
('250720101', 'Kalimuthu', 'Raja', 43, 'Male', 'Cumbum Road, Theni District', 'Main accused', '', '121', '2025-08-17 12:00:00'),
('260716101', 'Kumaresan', 'Gunda', 37, 'Male', 'Kallimandayam, Oddanchatram', 'Receiver of stolen property', '', '115', '2026-08-11 12:00:00'),
('260320101', 'Kumaresan', 'Kaali', 37, 'Male', 'Thallakulam, Madurai District', 'Accomplice', '', '121', '2026-04-05 12:00:00'),
('260320101', 'Perumal', 'Anna', 39, 'Male', 'Tirupparankundram, Madurai District', 'Main accused', '', '121', '2026-04-05 12:00:00'),
('250210101', 'Velmurugan', 'Kutty', 47, 'Male', 'Velachery, Chennai District', 'Receiver of stolen property', '', '115', '2025-03-28 12:00:00'),
('250210101', 'Sudalaimuthu', 'Raja', 30, 'Male', 'Velachery, Chennai District', 'Main accused', '', '115', '2025-03-28 12:00:00'),
('260729101', 'Ayyanar', 'Anna', 22, 'Male', 'Market Yard, Oddanchatram', 'Accomplice', '', '121', '2026-08-14 12:00:00'),
('250606101', 'Alagarsamy', 'Kutty', 43, 'Male', 'Nagal Nagar, Dindigul District', 'Receiver of stolen property', '', '124', '2025-07-30 12:00:00'),
('250613101', 'Sakthivel', '', 53, 'Male', 'Old Bus Stand, Oddanchatram', 'Main accused', '', '115', '2025-07-28 12:00:00'),
('250613101', 'Kumaresan', 'Raja', 34, 'Male', 'Kallimandayam, Oddanchatram', 'Main accused', '', '115', '2025-07-28 12:00:00'),
('260216102', 'Rasu', 'Kutty', 48, 'Male', 'T Nagar, Chennai District', 'Receiver of stolen property', '', '116', '2026-04-02 12:00:00'),
('260216102', 'Pechimuthu', '', 24, 'Male', 'T Nagar, Chennai District', 'Main accused', '', '116', '2026-04-02 12:00:00'),
('251022101', 'Mari', '', 49, 'Male', 'Dindigul Fort, Dindigul District', 'Main accused', '', '121', '2025-11-12 12:00:00'),
('260808102', 'Alagarsamy', 'Pallu', 52, 'Male', 'Spencer Compound, Dindigul District', 'Main accused', '', '125', '2026-08-31 12:00:00'),
('260808102', 'Kumaresan', 'Kaali', 43, 'Male', 'Spencer Compound, Dindigul District', 'Accomplice', '', '125', '2026-08-31 12:00:00'),
('260108101', 'Pechimuthu', 'Kaali', 43, 'Male', 'Adivaram, Palani District', 'Accomplice', '', '120', '2026-01-30 12:00:00'),
('260108101', 'Rasu', 'Pallu', 53, 'Male', 'Gandhi Road, Palani District', 'Accomplice', '', '120', '2026-01-30 12:00:00'),
('260228101', 'Karuppasamy', 'Kaali', 34, 'Male', 'Gandhi Road, Palani District', 'Main accused', '', '120', '2026-03-28 12:00:00'),
('250206101', 'Kumaresan', 'Pallu', 45, 'Male', 'Velachery, Chennai District', 'Accomplice', '', '110', '2025-03-20 12:00:00'),
('260726101', 'Vellaichamy', 'Anna', 53, 'Male', 'Cumbum Road, Theni District', 'Receiver of stolen property', '', '110', '2026-09-05 12:00:00'),
('251113101', 'Ayyanar', '', 27, 'Male', 'Gandhipuram, Coimbatore District', 'Conspirator', '', '125', '2025-12-18 12:00:00'),
('251113101', 'Sakthivel', 'Pallu', 27, 'Male', 'Peelamedu, Coimbatore District', 'Receiver of stolen property', '', '125', '2025-12-18 12:00:00'),
('250124101', 'Vellaichamy', '', 48, 'Male', 'Market Yard, Oddanchatram', 'Main accused', '', '126', '2025-02-28 12:00:00'),
('251123101', 'Perumal', 'Gunda', 42, 'Male', 'Velachery, Chennai District', 'Main accused', '', '126', '2026-01-16 12:00:00'),
('251123101', 'Kumaresan', '', 22, 'Male', 'Velachery, Chennai District', 'Accomplice', '', '126', '2026-01-16 12:00:00'),
('250208101', 'Pechimuthu', 'Kutty', 47, 'Male', 'Gandhipuram, Coimbatore District', 'Accomplice', '', '121', '2025-03-04 12:00:00'),
('250208101', 'Sakthivel', '', 19, 'Male', 'RS Puram, Coimbatore District', 'Main accused', '', '121', '2025-03-04 12:00:00'),
('260427101', 'Velmurugan', 'Kaali', 20, 'Male', 'Bodinayakanur Market, Theni District', 'Main accused', '', '126', '2026-06-23 12:00:00'),
('251102101', 'Perumal', '', 30, 'Male', 'T Nagar, Chennai District', 'Receiver of stolen property', '', '124', '2026-01-13 12:00:00'),
('251029101', 'Muniyandi', 'Anna', 28, 'Male', 'Periyar Bus Stand, Madurai District', 'Main accused', '', '121', '2025-11-13 12:00:00'),
('251029101', 'Sudalaimuthu', 'Kaali', 42, 'Male', 'Thallakulam, Madurai District', 'Receiver of stolen property', '', '121', '2025-11-13 12:00:00'),
('251222101', 'Sakthivel', 'Gunda', 29, 'Male', 'Periyakulam, Theni District', 'Main accused', '', '110', '2026-02-04 12:00:00'),
('251222101', 'Karuppasamy', 'Pallu', 29, 'Male', 'Cumbum Road, Theni District', 'Receiver of stolen property', '', '110', '2026-02-04 12:00:00'),
('251231101', 'Kalimuthu', 'Thambi', 34, 'Male', 'Peelamedu, Coimbatore District', 'Accomplice', '', '122', '2026-03-01 12:00:00'),
('260626101', 'Sakthivel', '', 23, 'Male', 'Kallimandayam, Oddanchatram', 'Accomplice', '', '125', '2026-07-14 12:00:00'),
('251018101', 'Mari', 'Pallu', 24, 'Male', 'Gandhipuram, Coimbatore District', 'Accomplice', '', '121', '2025-11-20 12:00:00'),
('260617101', 'Karuppasamy', 'Raja', 38, 'Male', 'Anna Nagar, Madurai District', 'Conspirator', '', '126', '2026-08-21 12:00:00'),
('260423101', 'Mari', 'Raja', 26, 'Male', 'Cumbum Road, Theni District', 'Accomplice', '', '123', '2026-06-13 12:00:00'),
('260423101', 'Sudalaimuthu', 'Kaali', 25, 'Male', 'Cumbum Road, Theni District', 'Accomplice', '', '123', '2026-06-13 12:00:00'),
('250105101', 'Sakthivel', 'Kaali', 52, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '126', '2025-03-03 12:00:00'),
('250105101', 'Mari', '', 49, 'Male', 'Peraiyur Road, Usilampatti', 'Main accused', '', '126', '2025-03-03 12:00:00'),
('250330101', 'Velmurugan', 'Thambi', 32, 'Male', 'T Nagar, Chennai District', 'Conspirator', '', '110', '2025-05-08 12:00:00'),
('250330101', 'Alagarsamy', 'Raja', 43, 'Male', 'Velachery, Chennai District', 'Conspirator', '', '110', '2025-05-08 12:00:00'),
('250215101', 'Kalimuthu', 'Raja', 19, 'Male', 'Bodinayakanur Market, Theni District', 'Conspirator', '', '120', '2025-03-05 12:00:00'),
('250215101', 'Kalimuthu', 'Pallu', 38, 'Male', 'Cumbum Road, Theni District', 'Conspirator', '', '120', '2025-03-05 12:00:00'),
('260112101', 'Ayyanar', 'Anna', 42, 'Male', 'Peraiyur Road, Usilampatti', 'Accomplice', '', '126', '2026-02-12 12:00:00'),
('260112101', 'Vellaichamy', 'Pallu', 19, 'Male', 'Usilampatti Town, Usilampatti', 'Receiver of stolen property', '', '126', '2026-02-12 12:00:00'),
('250318101', 'Kumaresan', 'Anna', 30, 'Male', 'Anna Nagar, Madurai District', 'Receiver of stolen property', '', '126', '2025-05-27 12:00:00'),
('250318101', 'Vellaichamy', 'Kaali', 22, 'Male', 'Anna Nagar, Madurai District', 'Receiver of stolen property', '', '126', '2025-05-27 12:00:00'),
('250330102', 'Mari', 'Thambi', 32, 'Male', 'Velachery, Chennai District', 'Receiver of stolen property', '', '110', '2025-05-04 12:00:00'),
('250330102', 'Perumal', 'Gunda', 25, 'Male', 'T Nagar, Chennai District', 'Main accused', '', '110', '2025-05-04 12:00:00'),
('250406101', 'Velmurugan', 'Gunda', 53, 'Male', 'T Nagar, Chennai District', 'Main accused', '', '124', '2025-05-09 12:00:00'),
('250923101', 'Perumal', 'Raja', 46, 'Male', 'RS Puram, Coimbatore District', 'Receiver of stolen property', '', '110', '2025-11-10 12:00:00'),
('260615102', 'Sudalaimuthu', 'Kutty', 45, 'Male', 'Kodaikanal Road, Palani District', 'Conspirator', '', '123', '2026-07-19 12:00:00'),
('260615102', 'Kumaresan', 'Anna', 29, 'Male', 'Palani Bus Stand, Palani District', 'Conspirator', '', '123', '2026-07-19 12:00:00'),
('260518101', 'Alagarsamy', 'Thambi', 48, 'Male', 'Old Bus Stand, Oddanchatram', 'Main accused', '', '125', '2026-06-24 12:00:00'),
('250624101', 'Vellaichamy', 'Kaali', 25, 'Male', 'Market Yard, Oddanchatram', 'Receiver of stolen property', '', '122', '2025-08-11 12:00:00'),
('250306101', 'Ayyanar', '', 31, 'Male', 'Kodaikanal Road, Palani District', 'Receiver of stolen property', '', '110', '2025-04-08 12:00:00'),
('260109101', 'Velmurugan', 'Kaali', 24, 'Male', 'Adivaram, Palani District', 'Accomplice', '', '125', '2026-02-01 12:00:00'),
('251123102', 'Pechimuthu', 'Raja', 49, 'Male', 'Gandhipuram, Coimbatore District', 'Receiver of stolen property', '', '120', '2026-01-03 12:00:00'),
('260726102', 'Ayyanar', 'Anna', 20, 'Male', 'T Nagar, Chennai District', 'Receiver of stolen property', '', '120', '2026-08-30 12:00:00'),
('260726102', 'Karuppasamy', 'Gunda', 27, 'Male', 'T Nagar, Chennai District', 'Main accused', '', '120', '2026-08-30 12:00:00'),
('251130101', 'Rasu', 'Pallu', 32, 'Male', 'Bodinayakanur Market, Theni District', 'Receiver of stolen property', '', '116', '2026-01-21 12:00:00'),
('251130101', 'Perumal', 'Kutty', 30, 'Male', 'Bodinayakanur Market, Theni District', 'Main accused', '', '116', '2026-01-21 12:00:00'),
('250504101', 'Ayyanar', '', 24, 'Male', 'Gandhipuram, Coimbatore District', 'Main accused', '', '116', '2025-05-30 12:00:00'),
('250504101', 'Alagarsamy', 'Kaali', 52, 'Male', 'Gandhipuram, Coimbatore District', 'Main accused', '', '116', '2025-05-30 12:00:00'),
('260622101', 'Alagarsamy', 'Gunda', 30, 'Male', 'Spencer Compound, Dindigul District', 'Main accused', '', '116', '2026-07-22 12:00:00'),
('250809101', 'Pechimuthu', 'Anna', 49, 'Male', 'Bodinayakanur Market, Theni District', 'Main accused', '', '124', '2025-10-24 12:00:00'),
('250809101', 'Kalimuthu', 'Gunda', 44, 'Male', 'Bodinayakanur Market, Theni District', 'Main accused', '', '124', '2025-10-24 12:00:00'),
('260323102', 'Vellaichamy', 'Kutty', 45, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '125', '2026-04-15 12:00:00'),
('250425101', 'Perumal', 'Pallu', 32, 'Male', 'Meenakshi Amman Temple Street, Madurai District', 'Conspirator', '', '120', '2025-06-06 12:00:00'),
('250425101', 'Ayyanar', 'Raja', 23, 'Male', 'Tirupparankundram, Madurai District', 'Conspirator', '', '120', '2025-06-06 12:00:00'),
('250906101', 'Kumaresan', 'Pallu', 54, 'Male', 'Periyakulam, Theni District', 'Accomplice', '', '124', '2025-10-14 12:00:00'),
('260811101', 'Mookan', '', 28, 'Male', 'Palani Bus Stand, Palani District', 'Conspirator', '', '120', '2026-09-12 12:00:00'),
('260227101', 'Sudalaimuthu', 'Kaali', 28, 'Male', 'Gandhi Road, Palani District', 'Receiver of stolen property', '', '116', '2026-04-08 12:00:00'),
('260227101', 'Sakthivel', 'Pallu', 21, 'Male', 'Gandhi Road, Palani District', 'Main accused', '', '116', '2026-04-08 12:00:00'),
('250703101', 'Karuppasamy', 'Gunda', 27, 'Male', 'Cumbum Road, Theni District', 'Accomplice', '', '122', '2025-08-14 12:00:00'),
('250418101', 'Muniyandi', 'Thambi', 20, 'Male', 'Palani Bus Stand, Palani District', 'Main accused', '', '120', '2025-05-11 12:00:00'),
('250305101', 'Velmurugan', 'Kutty', 36, 'Male', 'Begampur, Dindigul District', 'Receiver of stolen property', '', '122', '2025-04-12 12:00:00'),
('250305101', 'Rasu', 'Raja', 51, 'Male', 'Begampur, Dindigul District', 'Main accused', '', '122', '2025-04-12 12:00:00'),
('251224101', 'Mookan', 'Thambi', 38, 'Male', 'Goripalayam, Madurai District', 'Accomplice', '', '123', '2026-02-11 12:00:00'),
('251108101', 'Kalimuthu', 'Raja', 24, 'Male', 'Palani Bus Stand, Palani District', 'Main accused', '', '122', '2025-12-11 12:00:00'),
('260112102', 'Rasu', 'Kaali', 37, 'Male', 'T Nagar, Chennai District', 'Conspirator', '', '124', '2026-04-02 12:00:00'),
('260112102', 'Mookan', 'Anna', 49, 'Male', 'T Nagar, Chennai District', 'Accomplice', '', '124', '2026-04-02 12:00:00'),
('251014101', 'Velmurugan', 'Kaali', 53, 'Male', 'Market Yard, Oddanchatram', 'Accomplice', '', '124', '2025-11-23 12:00:00'),
('251014101', 'Sakthivel', 'Thambi', 21, 'Male', 'Market Yard, Oddanchatram', 'Receiver of stolen property', '', '124', '2025-11-23 12:00:00'),
('260809101', 'Mari', 'Raja', 38, 'Male', 'Gandhipuram, Coimbatore District', 'Receiver of stolen property', '', '120', '2026-09-07 12:00:00'),
('260809101', 'Alagarsamy', 'Anna', 46, 'Male', 'Peelamedu, Coimbatore District', 'Accomplice', '', '120', '2026-09-07 12:00:00'),
('260104101', 'Sakthivel', 'Kutty', 41, 'Male', 'Bodinayakanur Market, Theni District', 'Conspirator', '', '121', '2026-01-18 12:00:00'),
('250118101', 'Mari', 'Thambi', 37, 'Male', 'Begampur, Dindigul District', 'Conspirator', '', '115', '2025-02-24 12:00:00'),
('250118101', 'Kumaresan', 'Kaali', 21, 'Male', 'Begampur, Dindigul District', 'Conspirator', '', '115', '2025-02-24 12:00:00'),
('250412101', 'Karuppasamy', 'Kaali', 47, 'Male', 'T Nagar, Chennai District', 'Conspirator', '', '122', '2025-05-26 12:00:00'),
('250412101', 'Ayyanar', 'Gunda', 38, 'Male', 'Velachery, Chennai District', 'Conspirator', '', '122', '2025-05-26 12:00:00'),
('250113101', 'Mookan', 'Raja', 40, 'Male', 'Palani Bus Stand, Palani District', 'Accomplice', '', '125', '2025-02-14 12:00:00'),
('250113101', 'Karuppasamy', 'Pallu', 19, 'Male', 'Gandhi Road, Palani District', 'Receiver of stolen property', '', '125', '2025-02-14 12:00:00'),
('250405101', 'Sudalaimuthu', 'Kaali', 22, 'Male', 'Periyakulam, Theni District', 'Main accused', '', '110', '2025-05-15 12:00:00'),
('260408101', 'Mari', '', 27, 'Male', 'Market Yard, Oddanchatram', 'Conspirator', '', '124', '2026-06-28 12:00:00'),
('251116101', 'Velmurugan', 'Kutty', 38, 'Male', 'Kallimandayam, Oddanchatram', 'Main accused', '', '121', '2025-11-29 12:00:00'),
('251225101', 'Velmurugan', 'Pallu', 24, 'Male', 'Usilampatti Town, Usilampatti', 'Main accused', '', '121', '2026-01-18 12:00:00'),
('251225101', 'Sakthivel', 'Pallu', 27, 'Male', 'Peraiyur Road, Usilampatti', 'Conspirator', '', '121', '2026-01-18 12:00:00'),
('260506101', 'Karuppasamy', 'Pallu', 27, 'Male', 'Thallakulam, Madurai District', 'Accomplice', '', '124', '2026-07-19 12:00:00'),
('250327101', 'Mari', 'Thambi', 54, 'Male', 'Market Yard, Oddanchatram', 'Receiver of stolen property', '', '120', '2025-04-18 12:00:00'),
('250918101', 'Perumal', 'Gunda', 37, 'Male', 'Tirupparankundram, Madurai District', 'Accomplice', '', '120', '2025-10-14 12:00:00'),
('260424102', 'Sudalaimuthu', 'Thambi', 31, 'Male', 'Nagal Nagar, Dindigul District', 'Accomplice', '', '121', '2026-05-23 12:00:00'),
('260807101', 'Pechimuthu', 'Raja', 29, 'Male', 'Thallakulam, Madurai District', 'Main accused', '', '125', '2026-09-19 12:00:00'),
('260807101', 'Alagarsamy', 'Kutty', 28, 'Male', 'Thallakulam, Madurai District', 'Accomplice', '', '125', '2026-09-19 12:00:00'),
('250810101', 'Kalimuthu', 'Anna', 35, 'Male', 'Kallimandayam, Oddanchatram', 'Accomplice', '', '122', '2025-09-25 12:00:00'),
('250810101', 'Muniyandi', 'Raja', 53, 'Male', 'Market Yard, Oddanchatram', 'Receiver of stolen property', '', '122', '2025-09-25 12:00:00'),
('251016101', 'Muniyandi', 'Pallu', 48, 'Male', 'Peelamedu, Coimbatore District', 'Main accused', '', '121', '2025-11-09 12:00:00'),
('251016101', 'Kumaresan', 'Kaali', 51, 'Male', 'Peelamedu, Coimbatore District', 'Main accused', '', '121', '2025-11-09 12:00:00'),
('250428101', 'Muniyandi', 'Raja', 53, 'Male', 'Old Bus Stand, Oddanchatram', 'Accomplice', '', '125', '2025-05-22 12:00:00'),
('250618101', 'Velmurugan', 'Anna', 28, 'Male', 'Thallakulam, Madurai District', 'Receiver of stolen property', '', '124', '2025-08-24 12:00:00'),
('250220101', 'Ayyanar', 'Kaali', 23, 'Male', 'Periyakulam, Theni District', 'Main accused', '', '121', '2025-03-17 12:00:00'),
('250220101', 'Karuppasamy', 'Kaali', 54, 'Male', 'Periyakulam, Theni District', 'Accomplice', '', '121', '2025-03-17 12:00:00'),
('250817101', 'Velmurugan', 'Thambi', 51, 'Male', 'Periyar Bus Stand, Madurai District', 'Main accused', '', '121', '2025-09-07 12:00:00'),
('250817101', 'Kalimuthu', 'Kaali', 53, 'Male', 'Tirupparankundram, Madurai District', 'Receiver of stolen property', '', '121', '2025-09-07 12:00:00'),
('260403101', 'Ayyanar', 'Raja', 23, 'Male', 'Kodaikanal Road, Palani District', 'Conspirator', '', '122', '2026-05-22 12:00:00'),
('260403101', 'Vellaichamy', 'Anna', 28, 'Male', 'Kodaikanal Road, Palani District', 'Receiver of stolen property', '', '122', '2026-05-22 12:00:00'),
('251101101', 'Sakthivel', 'Raja', 31, 'Male', 'Peraiyur Road, Usilampatti', 'Accomplice', '', '121', '2025-11-23 12:00:00'),
('250726101', 'Rasu', 'Kaali', 37, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '123', '2025-09-02 12:00:00'),
('250726101', 'Vellaichamy', 'Thambi', 44, 'Male', 'Peraiyur Road, Usilampatti', 'Conspirator', '', '123', '2025-09-02 12:00:00'),
('251215101', 'Sudalaimuthu', 'Gunda', 24, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '116', '2026-01-23 12:00:00'),
('250109101', 'Mookan', 'Anna', 47, 'Male', 'Meenakshi Amman Temple Street, Madurai District', 'Conspirator', '', '120', '2025-02-02 12:00:00'),
('250109101', 'Mookan', 'Anna', 52, 'Male', 'Goripalayam, Madurai District', 'Main accused', '', '120', '2025-02-02 12:00:00'),
('251004101', 'Alagarsamy', 'Thambi', 35, 'Male', 'Old Bus Stand, Oddanchatram', 'Conspirator', '', '116', '2025-11-28 12:00:00'),
('250108101', 'Pechimuthu', 'Gunda', 28, 'Male', 'Peelamedu, Coimbatore District', 'Main accused', '', '124', '2025-02-24 12:00:00'),
('250108101', 'Kalimuthu', 'Gunda', 48, 'Male', 'Gandhipuram, Coimbatore District', 'Receiver of stolen property', '', '124', '2025-02-24 12:00:00'),
('260328101', 'Sakthivel', 'Raja', 30, 'Male', 'Peraiyur Road, Usilampatti', 'Accomplice', '', '126', '2026-05-31 12:00:00'),
('260328101', 'Pechimuthu', 'Raja', 46, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '126', '2026-05-31 12:00:00'),
('260503101', 'Sakthivel', 'Gunda', 20, 'Male', 'Begampur, Dindigul District', 'Conspirator', '', '121', '2026-05-17 12:00:00'),
('260503101', 'Sakthivel', 'Anna', 26, 'Male', 'Begampur, Dindigul District', 'Accomplice', '', '121', '2026-05-17 12:00:00'),
('251101102', 'Pechimuthu', 'Raja', 44, 'Male', 'Spencer Compound, Dindigul District', 'Main accused', '', '115', '2025-12-09 12:00:00'),
('251101102', 'Rasu', 'Pallu', 40, 'Male', 'Dindigul Fort, Dindigul District', 'Receiver of stolen property', '', '115', '2025-12-09 12:00:00'),
('250505101', 'Ayyanar', 'Gunda', 45, 'Male', 'Usilampatti Town, Usilampatti', 'Receiver of stolen property', '', '115', '2025-06-14 12:00:00'),
('260531101', 'Muniyandi', 'Anna', 41, 'Male', 'Old Bus Stand, Oddanchatram', 'Conspirator', '', '120', '2026-06-22 12:00:00'),
('260531101', 'Sudalaimuthu', 'Anna', 39, 'Male', 'Market Yard, Oddanchatram', 'Receiver of stolen property', '', '120', '2026-06-22 12:00:00'),
('250106101', 'Alagarsamy', 'Kutty', 53, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '123', '2025-02-13 12:00:00'),
('250106101', 'Karuppasamy', 'Anna', 52, 'Male', 'Peraiyur Road, Usilampatti', 'Main accused', '', '123', '2025-02-13 12:00:00'),
('250324101', 'Sudalaimuthu', 'Kaali', 54, 'Male', 'Kallimandayam, Oddanchatram', 'Accomplice', '', '120', '2025-04-14 12:00:00'),
('251029102', 'Sudalaimuthu', 'Raja', 37, 'Male', 'Peraiyur Road, Usilampatti', 'Main accused', '', '126', '2025-12-14 12:00:00'),
('260707101', 'Karuppasamy', 'Kaali', 30, 'Male', 'Usilampatti Town, Usilampatti', 'Conspirator', '', '125', '2026-08-18 12:00:00'),
('260221101', 'Alagarsamy', 'Pallu', 43, 'Male', 'Nagal Nagar, Dindigul District', 'Conspirator', '', '116', '2026-04-02 12:00:00'),
('260221101', 'Karuppasamy', 'Anna', 28, 'Male', 'Dindigul Fort, Dindigul District', 'Receiver of stolen property', '', '116', '2026-04-02 12:00:00'),
('250405102', 'Rasu', 'Kutty', 52, 'Male', 'Anna Nagar, Madurai District', 'Conspirator', '', '122', '2025-06-05 12:00:00'),
('250822101', 'Kalimuthu', '', 39, 'Male', 'Cumbum Road, Theni District', 'Accomplice', '', '115', '2025-09-29 12:00:00'),
('250822101', 'Kumaresan', 'Gunda', 48, 'Male', 'Cumbum Road, Theni District', 'Receiver of stolen property', '', '115', '2025-09-29 12:00:00'),
('260605101', 'Kumaresan', 'Pallu', 33, 'Male', 'RM Colony, Dindigul District', 'Accomplice', '', '125', '2026-06-27 12:00:00'),
('250721101', 'Karuppasamy', 'Kutty', 40, 'Male', 'Bodinayakanur Market, Theni District', 'Accomplice', '', '110', '2025-09-04 12:00:00');

-- Demo photos (AI-generated, files in uploads/)
UPDATE case_accused SET photo='f82531fbf0904416a7f3576b1b350ba7.jpg' WHERE id=2;
UPDATE case_accused SET photo='dab466e12fb64c87bc50d7a165fb6e97.jpg' WHERE id=3;
UPDATE case_accused SET photo='8d2f091507ad4bad8999f1c915787107.jpg' WHERE id=4;
UPDATE case_accused SET photo='942c2abacea24db2920506e37aa15123.jpg' WHERE id=5;
UPDATE case_accused SET photo='99c0c129148242d597953114f604f9c4.jpg' WHERE id=6;
UPDATE case_accused SET photo='23ad9ec441124958877a7d6aecada1d9.jpg' WHERE id=7;
UPDATE case_accused SET photo='15f186dfc3b04d9a85bc372e9ca541dd.jpg' WHERE id=8;
UPDATE case_accused SET photo='ac71b831ba2d4d8098814a6ff4c17c80.jpg' WHERE id=10;
UPDATE case_accused SET photo='c5a87bfb08bb48ae8af22154f4b14304.jpg' WHERE id=11;
UPDATE case_accused SET photo='8d7d361a4e3646afa7a98b3d13e8428a.jpg' WHERE id=12;
UPDATE case_accused SET photo='a5bf5de3365940dba5e6476baa1fe8f0.jpg' WHERE id=13;
UPDATE case_accused SET photo='61187ffaf563404da9464164a8fb69f8.jpg' WHERE id=14;
UPDATE case_accused SET photo='55c5e448e1fd4bc39104c41315d9acd6.jpg' WHERE id=15;
UPDATE case_accused SET photo='aacab6f599e04d178fc811842096b770.jpg' WHERE id=16;
UPDATE case_accused SET photo='5431e355caf64dc88876953416d2a4b9.jpg' WHERE id=17;
UPDATE case_accused SET photo='220845fcb287486b91c6ea1f0a0aeab9.jpg' WHERE id=18;
UPDATE case_accused SET photo='ec6ef49317c64330a89c7b17d82ce7c8.jpg' WHERE id=19;
UPDATE case_accused SET photo='f8eddaadda044c2a8109de27f16593ef.jpg' WHERE id=20;
UPDATE case_accused SET photo='8cb428034b524b4b99de968d4b34054b.jpg' WHERE id=21;
UPDATE case_accused SET photo='90440f190a604e959573ad0d73983289.jpg' WHERE id=24;
UPDATE case_accused SET photo='efc8213fd96c4e4aa82372be2b3bf19e.jpg' WHERE id=25;
UPDATE case_accused SET photo='79c7e4d4cb1a46f98b0dbece8a881122.jpg' WHERE id=27;
UPDATE case_accused SET photo='6843fe61995f49ed81b36c0a3588bc21.jpg' WHERE id=28;
UPDATE case_accused SET photo='c1a252a758ba4174a75a4ed669c1baa2.jpg' WHERE id=29;
UPDATE case_accused SET photo='0f2a30b197fa40d1a82d8c2941d3d03d.jpg' WHERE id=30;
UPDATE case_accused SET photo='22757d7fdbf94edaaec526af2a07d658.jpg' WHERE id=31;
UPDATE case_accused SET photo='9fa38a36942e4709afed53dc39ec7d7d.jpg' WHERE id=32;
UPDATE case_accused SET photo='59c0e50330474c73a0cf92f0d94a540c.jpg' WHERE id=33;
UPDATE case_accused SET photo='926e31f3b6ac4888bf8d9dd10f29ffd9.jpg' WHERE id=34;
UPDATE case_accused SET photo='5b054f2531b1458ea9c2da9552048416.jpg' WHERE id=35;
UPDATE case_accused SET photo='403e782ce45b480293bf5fc2dca2a111.jpg' WHERE id=36;
UPDATE case_accused SET photo='4a3a01a823724bdd86cce1f7057067d8.jpg' WHERE id=37;
UPDATE case_accused SET photo='977ab2f8692f4ab2878c923b2259b702.jpg' WHERE id=38;
UPDATE case_accused SET photo='b92413321aaf4345a6d8027872df5f3b.jpg' WHERE id=39;
UPDATE case_accused SET photo='b2a87f693edc4d22ba5e539c06cd278e.jpg' WHERE id=40;
UPDATE case_accused SET photo='165e729fd0cc438db6501d91b35d83d0.jpg' WHERE id=41;
UPDATE case_accused SET photo='8bfca10939884f029e333e3eaabb3f5a.jpg' WHERE id=42;
UPDATE case_accused SET photo='845bbb74775048f79dd61d2650af50dc.jpg' WHERE id=44;
UPDATE case_accused SET photo='8a2914bf5bdc487591fbdbe994bb93bd.jpg' WHERE id=45;
UPDATE case_accused SET photo='c59bb97b417645c78e3ea1fd562e24d8.jpg' WHERE id=46;
UPDATE case_accused SET photo='b5d1cf29f0e6497c9a476c6600a8f310.jpg' WHERE id=48;
UPDATE case_accused SET photo='86b9bcc39785409ca77f02af661a1136.jpg' WHERE id=49;
UPDATE case_accused SET photo='3230dea32ee64e8c9fccde37ba2cce1d.jpg' WHERE id=50;
UPDATE case_accused SET photo='5d60fd7228eb44e9ab7acd606620e240.jpg' WHERE id=51;
UPDATE case_accused SET photo='b995fd0295424e70aa8fa0c45c5d67f8.jpg' WHERE id=52;
UPDATE case_accused SET photo='5817fde8c7c142ab8fb47d63e4a56cbb.jpg' WHERE id=53;
UPDATE case_accused SET photo='583f4c8f6be64f5c813d13feb4135281.jpg' WHERE id=55;
UPDATE case_accused SET photo='d50b014c7a194c86bccf316e4eeb15e9.jpg' WHERE id=56;
UPDATE case_accused SET photo='900ee0cc9b3e47eda2f52c8d85d06a53.jpg' WHERE id=57;
UPDATE case_accused SET photo='2c26afd0821041129b1fd2f42cbef145.jpg' WHERE id=58;
UPDATE case_accused SET photo='8619d1df2cc1473d85f8648b369771d7.jpg' WHERE id=59;
UPDATE case_accused SET photo='17b161f57b764702a4b33f1c27746e72.jpg' WHERE id=60;
UPDATE case_accused SET photo='e103453b6d8c484c8167816ed3e89348.jpg' WHERE id=61;
UPDATE case_accused SET photo='3f345265392f4355941075a7093510ab.jpg' WHERE id=62;
UPDATE case_accused SET photo='6b8bf74fb59543dd828c7459a80d4daf.jpg' WHERE id=63;
UPDATE case_accused SET photo='3f65239a2d6a4fdc927d763188f69f39.jpg' WHERE id=64;
UPDATE case_accused SET photo='6c5e6248ad514b74b8bbf5bacf41e2f3.jpg' WHERE id=65;
UPDATE case_accused SET photo='b2ddbe191dc24c068a0157e8187464a1.jpg' WHERE id=66;
UPDATE case_accused SET photo='6c6aceb1df6049b4a99e3a1c0263d797.jpg' WHERE id=67;
UPDATE case_accused SET photo='065d5acf11284416bcf98f7132383a41.jpg' WHERE id=69;
UPDATE case_accused SET photo='86e2c80b5b64495bbc93eb9fcc685a75.jpg' WHERE id=70;
UPDATE case_accused SET photo='140134abab944c1895a968de82271560.jpg' WHERE id=72;
UPDATE case_accused SET photo='dec03bf38f7848f59083c5844482e0a4.jpg' WHERE id=73;
UPDATE case_accused SET photo='05c94306013944739a2056b50f40ebd1.jpg' WHERE id=75;
UPDATE case_accused SET photo='c4664fe4877f417b850c6bcc65cef52e.jpg' WHERE id=76;
UPDATE case_accused SET photo='8c3233959b904041b5eb632df32d6574.jpg' WHERE id=77;
UPDATE case_accused SET photo='9bcd13a452784984995a44e6f22442dd.jpg' WHERE id=78;
UPDATE case_accused SET photo='21fd8da111974afba45209f4b8b8abdb.jpg' WHERE id=80;
UPDATE case_accused SET photo='031cd66995de4f9198c030c114e456d9.jpg' WHERE id=81;
UPDATE case_accused SET photo='3c59c6d6cc63457b9c9a5da879fa8b36.jpg' WHERE id=83;
UPDATE case_accused SET photo='bcf1930722ac4706ab726fd8f7c4b43e.jpg' WHERE id=84;
UPDATE case_accused SET photo='11980bc70a774da087ce98f8f65968ca.jpg' WHERE id=86;
UPDATE case_accused SET photo='6d1e0e79ed9a4c488c01318719284742.jpg' WHERE id=87;
UPDATE case_accused SET photo='de17f5d7d490469390fe273ff9b1400b.jpg' WHERE id=88;
UPDATE case_accused SET photo='c3cd630967e94d2c8aae7b766a0cab64.jpg' WHERE id=89;
UPDATE case_accused SET photo='221a7c7b33c84a04b6e580b3d16172fd.jpg' WHERE id=90;
UPDATE case_accused SET photo='60492f3d13b54b9e95ae970c05b86d83.jpg' WHERE id=92;
UPDATE case_accused SET photo='8f03395353774eb58d46f6156fce1f06.jpg' WHERE id=94;
UPDATE case_accused SET photo='9d49a81c82ea4dffbd00024f2eb04ec0.jpg' WHERE id=95;
UPDATE case_accused SET photo='41afdf6ce80f4d6abe1633b5353d0b95.jpg' WHERE id=96;
UPDATE case_accused SET photo='4c55b0901d9a4340a88d111af8a057bb.jpg' WHERE id=97;
UPDATE case_accused SET photo='4011278bb7c0417b84eaab92f8c214cf.jpg' WHERE id=98;
UPDATE case_accused SET photo='678612f378f7489c9a7aa72631413bbf.jpg' WHERE id=99;
UPDATE case_accused SET photo='1914011c6f5441219d22758c4657e3c5.jpg' WHERE id=101;
UPDATE case_accused SET photo='77879b15cebf4586b3bd37e87c2481d6.jpg' WHERE id=102;
UPDATE case_accused SET photo='3dcf5f02cc3b46e3bc3e82370d935f6b.jpg' WHERE id=103;
UPDATE case_accused SET photo='d6a23816acd147c58d8985d499dc71b3.jpg' WHERE id=104;
UPDATE case_accused SET photo='7a7ca50f55c245a19ff9861183543068.jpg' WHERE id=105;
UPDATE case_accused SET photo='092ff195b8844df19d8aaba462143f8d.jpg' WHERE id=106;
UPDATE case_accused SET photo='f9c7b575aaa245d29764e31076b5228d.jpg' WHERE id=107;
UPDATE case_accused SET photo='83185b220ba84363a654f6e335afdfaa.jpg' WHERE id=108;
UPDATE case_accused SET photo='f3f25a5cb7974a48aa6cdd011e9b8240.jpg' WHERE id=109;
UPDATE case_accused SET photo='c4a6200502ca4e74888c5bcf701a47a6.jpg' WHERE id=110;
UPDATE case_accused SET photo='4353d336d29f4f8b80fcb1335723bdb1.jpg' WHERE id=111;
UPDATE case_accused SET photo='044e8370675847f0b1126cebf13e9e0d.jpg' WHERE id=112;
UPDATE case_accused SET photo='eadbdb56b4364612aef11d37e8788c97.jpg' WHERE id=113;
UPDATE case_accused SET photo='0faf62a6f9664fb0965bfa96f1e62a92.jpg' WHERE id=114;
UPDATE case_accused SET photo='b85c43ebddc249d4b4853dfffb806df7.jpg' WHERE id=115;
UPDATE case_accused SET photo='cf3341cc8a804059871ac3ad00ff93e0.jpg' WHERE id=118;
UPDATE case_accused SET photo='a87c56089c6348219e58dca943f66ee2.jpg' WHERE id=119;
UPDATE case_accused SET photo='7ef6ca333a7c4cea889a7c6b666da65b.jpg' WHERE id=120;
UPDATE case_accused SET photo='fe6e98ab05af4ff1a945b2a143007d97.jpg' WHERE id=122;
UPDATE case_accused SET photo='f7d53fb3ebaa4f95945bf9f9f0f37ef6.jpg' WHERE id=123;
UPDATE case_accused SET photo='37e86ea9c7d3432d9dac412935434394.jpg' WHERE id=124;
UPDATE case_accused SET photo='7b8ed52088f2461087533535e41dbdee.jpg' WHERE id=125;
UPDATE case_accused SET photo='bbd914c590f7451da9a23f16c9a9f3f5.jpg' WHERE id=126;
UPDATE case_accused SET photo='53570e27a62b4a9db4b06824d89aaed2.jpg' WHERE id=127;
UPDATE case_accused SET photo='8a4630a45c2d4949b1c15411fe5b1b9d.jpg' WHERE id=129;
UPDATE case_accused SET photo='1846a98a9857453098204ffbc72ad76e.jpg' WHERE id=130;
UPDATE case_accused SET photo='2cd2421003f8481c9395209486d8529e.jpg' WHERE id=131;
UPDATE case_accused SET photo='b3a970f27c6a4a2d97d0ee7ff414ecc2.jpg' WHERE id=132;
UPDATE case_accused SET photo='4d22be84ae5d4fd197cc348550faf4fa.jpg' WHERE id=134;
UPDATE case_accused SET photo='8d921f230e1b4828a44f8a1efe128ecf.jpg' WHERE id=135;
UPDATE case_accused SET photo='3f52194c3bf4467cb357b00f6e6752df.jpg' WHERE id=136;
UPDATE case_accused SET photo='0ee380ee026443dbaee6ce3b470fdd9b.jpg' WHERE id=137;
UPDATE case_accused SET photo='be4d3145d0c149738dc33854014b7566.jpg' WHERE id=138;
UPDATE case_accused SET photo='3b0fe5f9c48f43a4858126f04f392f17.jpg' WHERE id=139;
UPDATE case_accused SET photo='ece4443e185a48f392b281c1fe25b293.jpg' WHERE id=140;
UPDATE case_accused SET photo='f05d820ed74948a4923469723f561be2.jpg' WHERE id=141;
UPDATE case_accused SET photo='ed5f10bc2eca464691b30855bec0554c.jpg' WHERE id=143;
UPDATE case_accused SET photo='b7a59531323b4fda980bb3211ffae13f.jpg' WHERE id=144;
UPDATE case_accused SET photo='66949483e17f4123b6dbb8b7f6e85371.jpg' WHERE id=145;
UPDATE case_accused SET photo='de7503fae8cf467aabbd59ff0703a691.jpg' WHERE id=147;
UPDATE case_accused SET photo='53d65b39c20e4573a9b561513d9d9987.jpg' WHERE id=150;
UPDATE case_accused SET photo='acfebefc2cd3402ea8150bb0cfc99faa.jpg' WHERE id=151;
UPDATE case_accused SET photo='20f64f756f0e48d29c41f0f3e5cb225f.jpg' WHERE id=152;
UPDATE case_accused SET photo='59899a066d0f4db8b28e4da30f3755b2.jpg' WHERE id=154;
UPDATE case_accused SET photo='4c4fb1878da14ea7a30238302092e25d.jpg' WHERE id=155;
UPDATE case_accused SET photo='ff25cfed2dad43caa8573fe90119bcd2.jpg' WHERE id=156;
UPDATE case_accused SET photo='f42c21332a344c809a92c73e9525c898.jpg' WHERE id=157;
UPDATE case_accused SET photo='e8a0c0fb543e43eb8c6beddc801fcbb0.jpg' WHERE id=158;
UPDATE case_accused SET photo='2458ba8f8aff4a998f52a22e15448e6e.jpg' WHERE id=159;
UPDATE case_accused SET photo='cd99974a681d48f9ae755e4e79b0242c.jpg' WHERE id=161;
UPDATE case_accused SET photo='90e50e9a35084a44a7ddb3383be71bee.jpg' WHERE id=162;
UPDATE case_accused SET photo='0e572e22e39c495795479b8104fa9f3a.jpg' WHERE id=163;
UPDATE case_accused SET photo='bce20afd06b448478a644f66744f9b20.jpg' WHERE id=164;
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260916101','8ffd3fb78c97410daa53b21f902965d4.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','115');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250220101','0de281891bb64af992d22bc2342ad85f.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','121');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250105101','bbec2155a1e449d0871b178363520c52.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','126');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('251231101','9044d79812ac4085a52cb7f21207c0b7.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','122');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260726101','1e54cc2f75944c689ae8bad161c3a63a.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','110');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260921102','4ab8657c778746eab45bf043143508ed.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','121');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260902101','1e6f6dcd81534c3994e135b21c402d04.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','110');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('251212101','c3c5396a31624dc59cfebd6e72ef2880.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','116');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260425101','f6a8e4dd33784c2cb7ce45f271d23f38.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','124');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250118101','d943cce3e0dd46d2aad8dac859331cee.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','115');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('251208101','b12ab0870a544c399f869126f76b25d6.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','123');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260109101','816bd0f5d1204c0ba7e9b44e4448fde7.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','125');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250505101','1b1527d825634213b89dcdd8c55bf203.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','115');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250108101','2239aef30cb44d82aa281801585e4fdd.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','124');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250721101','c9651c0a8956421c8207594d8960f6fb.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','110');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250412101','3494070dec05430fb27cc7727875ef80.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','122');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260702101','6fd8bdbe73b148fa8fb6d7e06687dca3.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','121');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260506101','22d13144d6d646b9819552d23b8e3af5.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','124');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('251101101','9f059c0c2f944e9a8c195f036db12f83.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','121');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250207101','0f745579c94746feac60813342307e2f.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','124');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260930101','3cc8dbf1597f4ad7b713aae1273a0515.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','122');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260626101','f854784a9b5c4f029f44fc822f3b0fc4.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','125');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250109101','04c65eca73f24eb8b5fcc9acfac47bb9.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','120');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250606101','1294b6305c634a64bd4f49498c4dccf2.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','124');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('210713103','2e7fc5971b1e4359b4a90a18eb8be08e.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','115');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250730101','0d0eeb8d0ce543bfba828d566322c511.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','126');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250330102','668a8aa9d62c4d89b14ee935d1793ac4.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','110');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250703101','1ef18bda796c4abeaf73d277e81bf414.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','122');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('251101102','78f4f5b8125c4a6f863886c3d35cd674.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','115');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250324101','064d042952654a028eb4d3c2c697b2c9.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','120');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250507101','b3e0ee2c7f2f44edb0606b7efe8d604d.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','126');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('250724101','054ad4fb7def4fdca365d11a1c5a0115.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','123');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260510101','b9ff4f72e3af4234b934acf36cba2f23.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','125');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260104101','bcd0dfd98dff4e668691b5e090a89324.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','121');
INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES ('260823101','83b3882f5b9f4fe0860bde11624b0f19.jpg','scene.jpg','Crime Scene','Scene of occurrence photographed by investigating officer','122');
