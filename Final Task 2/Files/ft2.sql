-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student_assignment_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment_tb`
--

DROP TABLE IF EXISTS `assignment_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_tb` (
  `shortname` varchar(50) NOT NULL,
  `due_date` date NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_tb`
--

LOCK TABLES `assignment_tb` WRITE;
/*!40000 ALTER TABLE `assignment_tb` DISABLE KEYS */;
INSERT INTO `assignment_tb` VALUES ('DBSYS101','2025-04-21','http://assignments.com/dbsys101'),('WEBDEV202','2025-05-12','http://assignments.com/webdev202');
/*!40000 ALTER TABLE `assignment_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_tb`
--

DROP TABLE IF EXISTS `student_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_tb` (
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_tb`
--

LOCK TABLES `student_tb` WRITE;
/*!40000 ALTER TABLE `student_tb` DISABLE KEYS */;
INSERT INTO `student_tb` VALUES ('Casey'),('Jordan');
/*!40000 ALTER TABLE `student_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tb`
--

DROP TABLE IF EXISTS `submission_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_tb` (
  `username` varchar(50) NOT NULL,
  `shortname` varchar(50) NOT NULL,
  `version` int(11) NOT NULL,
  `submit_date` date NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`username`,`shortname`,`version`),
  KEY `shortname` (`shortname`),
  CONSTRAINT `submission_tb_ibfk_1` FOREIGN KEY (`username`) REFERENCES `student_tb` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `submission_tb_ibfk_2` FOREIGN KEY (`shortname`) REFERENCES `assignment_tb` (`shortname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tb`
--

LOCK TABLES `submission_tb` WRITE;
/*!40000 ALTER TABLE `submission_tb` DISABLE KEYS */;
INSERT INTO `submission_tb` VALUES ('Casey','WEBDEV202',1,'2025-05-12','Submission by Casey'),('Jordan','DBSYS101',1,'2025-04-21','First Submission by Jordan'),('Jordan','DBSYS101',2,'2025-04-21','Updated Submission by Jordan');
/*!40000 ALTER TABLE `submission_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-10 22:44:27
