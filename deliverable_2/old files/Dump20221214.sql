-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: erasmusdb
-- ------------------------------------------------------
-- Server version	8.0.25

DROP SCHEMA IF EXISTS `erasmusdb`;
CREATE SCHEMA `erasmusdb`;
USE `erasmusdb`;

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
-- Table structure for table `accommodation`
--

DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation` (
  `listing_id` int NOT NULL,
  `price` int NOT NULL,
  `type` enum('Private_Room','Shared_Room','Private_Apartment','Private_Dorm','Shared_Dorm') NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip` int NOT NULL,
  `website` text,
  `phone_number` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
INSERT INTO `accommodation` VALUES (10,635,'Private_Room','Victoria 8','Madrid',28012,'www.vict8ap.es','0002359868754'),(36,585,'Private_Room','Victoria 10','Madrid',28012,'www.vict10.es','001545564786'),(57,150,'Private_Dorm','Wesoła 32','Krakow',28493,'www.wesola.pl','0005354653156'),(563,700,'Private_Apartment','Rua dos Marnotos 53','Aveiro',5400233,'www.marnotosap.pt','003659856512'),(4693,200,'Private_Room','Via Fornovo 33','Rome',9134,'www.fornap.it','005123456835'),(7979,800,'Private_Dorm','Valeria 30','Madrid',29203,'www.valeria30.es','005343584453'),(23829,230,'Private_Dorm','Ovos Moles 10','Aveiro',3383923,'www.ovosmoles.pt','0005434545338'),(34738,600,'Private_Apartment','Positano 89','Naples',39200,'www.positano.it','0007861534545');
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `accommodation_BEFORE_INSERT` BEFORE INSERT ON `accommodation` FOR EACH ROW BEGIN
	IF (NEW.price <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at price';
	END IF;
    IF (NEW.listing_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at listing_id';
	END IF; 
	IF (NEW.type NOT IN ('Private_Room', 'Shared_Room', 'Private_Apartment', 'Private_Dorm', 'Shared_Dorm')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at type';
	END IF; 
    IF (NEW.phone_number NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `accommodation_BEFORE_UPDATE` BEFORE UPDATE ON `accommodation` FOR EACH ROW BEGIN
	IF (NEW.price <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at price';
	END IF;
    IF (NEW.listing_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at listing_id';
	END IF; 
	IF (NEW.type NOT IN ('Private_Room', 'Shared_Room', 'Private_Apartment', 'Private_Dorm', 'Shared_Dorm')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at type';
	END IF; 
    IF (NEW.phone_number NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `application_no` int NOT NULL,
  `submition_date` date NOT NULL,
  `cv` varchar(50) NOT NULL,
  `ToR` varchar(50) NOT NULL,
  `Motivational_letter` varchar(50) NOT NULL,
  `mobility_semester` enum('Winter','Spring') NOT NULL,
  `students_id` int DEFAULT NULL,
  `erasmus_code` char(11) DEFAULT NULL,
  PRIMARY KEY (`application_no`),
  KEY `students_id_idx` (`students_id`),
  KEY `erasmus_code_idx` (`erasmus_code`),
  CONSTRAINT `erasmus_code` FOREIGN KEY (`erasmus_code`) REFERENCES `receiving_institutions` (`erasmus_code`),
  CONSTRAINT `students_id` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (9666,'2022-10-10','/home/data/an_0009666/cv_0009666.pdf','/home/data/an_0009666/tor_0009666.pdf','/home/data/an_0009666/ml_0009666.pdf','Spring',9666,'PL KRAKOW 1'),(564156,'2022-09-14','/home/data/an_564156/cv_564156.pdf','/home/data/an_565894/tor_565894.pdf','/home/data/an_565894/ml_565894.pdf','Spring',9775,'I  ROMA  1'),(876378,'2022-10-10','/home/data/an_0876378/cv_0876378.pdf','/home/data/an_0876378/tor_0876378.pdf','/home/data/an_0876378/ml_0876378.pdf','Spring',18189,'FR PARIS 1'),(1293820,'2022-10-09','/home/data/an_1293820/cv_1293820.pdf','/home/data/an_1293820/tor_1293820.pdf','/home/data/an_1293820/ml_1293820.pdf','Winter',39204,'ES MADRID 1'),(1929299,'2022-10-10','/home/data/an_1929299/cv_1929299.pdf','/home/data/an_1929299/tor_1929299.pdf','/home/data/an_1929299/ml_1929299.pdf','Spring',12345,'FR PARIS 1'),(5658193,'2022-09-15','/home/data/an_5658193/cv_5658193.pdf','/home/data/an_5658193/tor_5658193.pdf','/home/data/an_5658193/ml_5658193.pdf','Winter',8080,'P AVEIRO 1'),(5658194,'2022-09-15','/home/data/an_5658194/cv_565894.pdf','/home/data/an_564156/tor_564156.pdf','/home/data/an_564156/ml_564156.pdf','Winter',9733,'ES MADRID 1'),(6458468,'2022-09-21','/home/data/an_6458468/cv_6458468.pdf','/home/data/an_6458468/tor_6458468.pdf','/home/data/an_6458468/ml_6458468.pdf','Winter',9686,'P AVEIRO 1'),(7382039,'2022-10-10','/home/data/an_7382039/cv_7382039.pdf','/home/data/an_7382039/tor_7382039.pdf','/home/data/an_7382039/ml_7382039.pdf','Winter',39203,'P PORTO 1');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `applications_BEFORE_INSERT` BEFORE INSERT ON `applications` FOR EACH ROW BEGIN
	IF (NEW.application_no <= 0) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at application_no';
		END IF;
	IF (NEW.students_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at students_id';
	END IF;
	IF (NEW.mobility_semester NOT IN ('Winter', 'Spring')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at mobility_semester';
	END IF;
	IF (NEW.cv NOT LIKE ("%.pdf") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid CV file format, insert pdf';
	END IF;
    IF (NEW.ToR NOT LIKE ("%.pdf") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid ToR file format, insert pdf';
	END IF;
    IF (NEW.Motivational_letter NOT LIKE ("%.pdf") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid Motivational_letter file format, insert pdf';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `applications_BEFORE_UPDATE` BEFORE UPDATE ON `applications` FOR EACH ROW BEGIN
	IF (NEW.application_no <= 0) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at application_no';
		END IF;
	IF (NEW.students_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at students_id';
	END IF;
	IF (NEW.mobility_semester NOT IN ('Winter', 'Spring')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at mobility_semester';
	END IF;
    IF (NEW.cv NOT LIKE ("%.pdf") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid CV file format, insert pdf';
	END IF;
    IF (NEW.ToR NOT LIKE ("%.pdf") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid ToR file format, insert pdf';
	END IF;
    IF (NEW.Motivational_letter NOT LIKE ("%.pdf") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid Motivational_letter file format, insert pdf';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auth_ects_coordinators`
--

DROP TABLE IF EXISTS `auth_ects_coordinators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_ects_coordinators` (
  `email` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `department` varchar(60) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_ects_coordinators`
--

LOCK TABLES `auth_ects_coordinators` WRITE;
/*!40000 ALTER TABLE `auth_ects_coordinators` DISABLE KEYS */;
INSERT INTO `auth_ects_coordinators` VALUES ('alkis@ece.auth.gr','Alkiviadis Chatzopoulos','2310256819','ece'),('kostaspap@civil.auth.gr','Konstantinos Papastratou','2310699487','scd'),('mariapap@meng.auth.gr','Maria Papadopoulou','2310947382','meng'),('marpap@dent.auth.gr','Maria Pappou','2310384920','dent'),('nikolpap@med.auth.gr','Nikoleta Pappou','2310930239','med'),('nikosnikl@csd.auth.gr','Nikolaos Nikolaou','2310655623','csd'),('panpan@bio.auth.gr','Panagiotis Panagiotou','2310739039','bio');
/*!40000 ALTER TABLE `auth_ects_coordinators` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auth_ects_coordinators_BEFORE_INSERT` BEFORE INSERT ON `auth_ects_coordinators` FOR EACH ROW BEGIN
	IF (NEW.email NOT LIKE '%auth.gr') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at  email, it should be the academic email';
	END IF; 
    IF (NEW.phone NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auth_ects_coordinators_BEFORE_UPDATE` BEFORE UPDATE ON `auth_ects_coordinators` FOR EACH ROW BEGIN
	IF (NEW.email NOT LIKE '%auth.gr') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at email, it should be the academic email';
	END IF; 
    IF (NEW.phone NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `field_of_study` varchar(60) NOT NULL,
  `building_#` int DEFAULT NULL,
  `website` text NOT NULL,
  `erasmus_code` char(11) NOT NULL,
  PRIMARY KEY (`field_of_study`,`erasmus_code`),
  KEY `fk_Departments_Receiving_Institutions1_idx` (`erasmus_code`),
  CONSTRAINT `fk_Departments_Receiving_Institutions1` FOREIGN KEY (`erasmus_code`) REFERENCES `receiving_institutions` (`erasmus_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('biology',NULL,'www.biocarlos.es','ES MADRID 1'),('biology',3,'www.uabiology.fr','FR PARIS 1'),('biology',90,'www.bioio.pl','PL KRAKOW 1'),('computer science',4,'www.carloscomscence.es','ES MADRID 1'),('computer science',3,'www.uacomscience.pt','P AVEIRO 1'),('electrical engineering',9,'www.eeng.pt','P PORTO 1'),('languages',3,'www.lang.pt','P AVEIRO 1'),('medicine',NULL,'www.medua.pt','P AVEIRO 1');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erasmus_offices`
--

DROP TABLE IF EXISTS `erasmus_offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erasmus_offices` (
  `email` varchar(60) NOT NULL,
  `head` varchar(60) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `erasmus_code` char(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_Erasmus_Offices_Receiving_Institutions1_idx` (`erasmus_code`),
  CONSTRAINT `fk_Erasmus_Offices_Receiving_Institutions1` FOREIGN KEY (`erasmus_code`) REFERENCES `receiving_institutions` (`erasmus_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erasmus_offices`
--

LOCK TABLES `erasmus_offices` WRITE;
/*!40000 ALTER TABLE `erasmus_offices` DISABLE KEYS */;
INSERT INTO `erasmus_offices` VALUES ('franceeras@france.fr','Jean Rochefort','00338432156847','FR PARIS 1'),('germanyeras@france.fr','Daniel Brühl','00338432156890','FR PARIS 1'),('italyeras@italy.it','Giancarlo Giannini','03915300742890','I NAPLES 2'),('pollanderas@polland.pl','Dagmara Domińczyk','00486909000101','PL KRAKOW 1'),('porteras@portugal.pt','Nuno Lopes','03514788531564','P PORTO 1'),('romaeras@italy.it','Giancarlo Giannini','03985461685364','I  ROMA  1'),('spaineras@spain.es','Ester Expósito Gayoso','00346578423215','ES MADRID 1'),('sweedwneras@france.fr','Linda Källgren','00338409056847','FR PARIS 1');
/*!40000 ALTER TABLE `erasmus_offices` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `erasmus_offices_BEFORE_INSERT` BEFORE INSERT ON `erasmus_offices` FOR EACH ROW BEGIN
	IF (NEW.phone_number NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `erasmus_offices_BEFORE_UPDATE` BEFORE UPDATE ON `erasmus_offices` FOR EACH ROW BEGIN
		IF (NEW.phone_number NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `la_infos`
--

DROP TABLE IF EXISTS `la_infos`;
/*!50001 DROP VIEW IF EXISTS `la_infos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `la_infos` AS SELECT 
 1 AS `la_no`,
 1 AS `erasmus_office_email`,
 1 AS `auth_ects_coordinators_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `learning_agreements`
--

DROP TABLE IF EXISTS `learning_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning_agreements` (
  `la_no` int NOT NULL,
  `status` enum('Pending','Submitted','Signed_by_AUTH','Approved') NOT NULL,
  `signature_date_auth _ects_coordinators` date DEFAULT NULL,
  `signature_date_eras mus_offices` date DEFAULT NULL,
  `students_id` int DEFAULT NULL,
  `email_erasmus_offices` varchar(60) DEFAULT NULL,
  `email_auth_ects_coordinators` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`la_no`),
  KEY `fk_Learning_Agreements_Students1_idx` (`students_id`),
  KEY `fk_Learning_Agreements_Erasmus_Offices1_idx` (`email_erasmus_offices`),
  KEY `fk_Learning_Agreements_AUTH_ECTS_Coordinators1_idx` (`email_auth_ects_coordinators`),
  CONSTRAINT `fk_Learning_Agreements_AUTH_ECTS_Coordinators1` FOREIGN KEY (`email_auth_ects_coordinators`) REFERENCES `auth_ects_coordinators` (`email`),
  CONSTRAINT `fk_Learning_Agreements_Erasmus_Offices1` FOREIGN KEY (`email_erasmus_offices`) REFERENCES `erasmus_offices` (`email`),
  CONSTRAINT `fk_Learning_Agreements_Students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_agreements`
--

LOCK TABLES `learning_agreements` WRITE;
/*!40000 ALTER TABLE `learning_agreements` DISABLE KEYS */;
INSERT INTO `learning_agreements` VALUES (9039,'Approved','2022-09-05','2022-09-10',8080,'porteras@portugal.pt','mariapap@meng.auth.gr'),(449090,'Pending',NULL,NULL,39203,'porteras@portugal.pt','marpap@dent.auth.gr'),(495090,'Pending',NULL,NULL,12345,'franceeras@france.fr','kostaspap@civil.auth.gr'),(938494,'Approved','2022-09-30','2022-10-05',39203,'germanyeras@france.fr','marpap@dent.auth.gr'),(1685135,'Submitted',NULL,NULL,9775,'romaeras@italy.it','alkis@ece.auth.gr'),(2930484,'Submitted',NULL,NULL,9666,'pollanderas@polland.pl','nikolpap@med.auth.gr'),(4564565,'Signed_by_AUTH','2022-09-19',NULL,9686,'porteras@portugal.pt','kostaspap@civil.auth.gr'),(6846615,'Submitted',NULL,NULL,9733,'spaineras@spain.es','alkis@ece.auth.gr'),(7830329,'Approved','2022-10-01','2022-10-15',18189,'franceeras@france.fr','marpap@dent.auth.gr');
/*!40000 ALTER TABLE `learning_agreements` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `learning_agreements_BEFORE_INSERT` BEFORE INSERT ON `learning_agreements` FOR EACH ROW BEGIN
	IF (NEW.email_auth_ects_coordinators NOT LIKE '%auth.gr') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at email_auth_ects_coordinators, it should be the academic email';
	END IF;
	IF (NEW.students_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at students_id';
	END IF;
	IF (NEW.la_no <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at la_no';
	END IF;
	IF (NEW.status NOT IN ('Pending', 'Submitted', 'Signed_by_AUTH', 'Approved')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at status';
	END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `learning_agreements_BEFORE_UPDATE` BEFORE UPDATE ON `learning_agreements` FOR EACH ROW BEGIN
	IF (NEW.email_auth_ects_coordinators NOT LIKE '%auth.gr') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at email_auth_ects_coordinators, it should be the academic email';
	END IF;
	IF (NEW.students_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at students_id';
	END IF;
	IF (NEW.la_no <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at la_no';
	END IF;
    	IF (NEW.status NOT IN ('Pending', 'Submitted', 'Signed_by_AUTH', 'Approved')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at status';
	END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `learning_agreements_has_subjects`
--

DROP TABLE IF EXISTS `learning_agreements_has_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning_agreements_has_subjects` (
  `Learning_Agreements_la_no` int NOT NULL,
  `Subjects_field_of_study` varchar(60) NOT NULL,
  `Subjects_erasmus_code` char(11) NOT NULL,
  `Subjects_subject_code` varchar(30) NOT NULL,
  PRIMARY KEY (`Learning_Agreements_la_no`,`Subjects_field_of_study`,`Subjects_erasmus_code`,`Subjects_subject_code`),
  KEY `fk_Learning_Agreements_has_Subjects_Subjects1_idx` (`Subjects_field_of_study`,`Subjects_erasmus_code`,`Subjects_subject_code`),
  KEY `fk_Learning_Agreements_has_Subjects_Learning_Agreements1_idx` (`Learning_Agreements_la_no`),
  CONSTRAINT `fk_Learning_Agreements_has_Subjects_Learning_Agreements1` FOREIGN KEY (`Learning_Agreements_la_no`) REFERENCES `learning_agreements` (`la_no`),
  CONSTRAINT `fk_Learning_Agreements_has_Subjects_Subjects1` FOREIGN KEY (`Subjects_field_of_study`, `Subjects_erasmus_code`, `Subjects_subject_code`) REFERENCES `subjects` (`field_of_study`, `erasmus_code`, `subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_agreements_has_subjects`
--

LOCK TABLES `learning_agreements_has_subjects` WRITE;
/*!40000 ALTER TABLE `learning_agreements_has_subjects` DISABLE KEYS */;
INSERT INTO `learning_agreements_has_subjects` VALUES (9039,'electrical engineering','P PORTO 1','934'),(449090,'medicine','P AVEIRO 1','37396'),(495090,'electrical engineering','P PORTO 1','748'),(938494,'electrical engineering','P PORTO 1','748'),(1685135,'computer science','P AVEIRO 1','167'),(1685135,'electrical engineering','P PORTO 1','662'),(2930484,'electrical engineering','P PORTO 1','662'),(4564565,'electrical engineering','P PORTO 1','662'),(6846615,'medicine','P AVEIRO 1','98'),(7830329,'medicine','P AVEIRO 1','98');
/*!40000 ALTER TABLE `learning_agreements_has_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `learning_agreements_has_subjects_BEFORE_INSERT` BEFORE INSERT ON `learning_agreements_has_subjects` FOR EACH ROW BEGIN
	IF (NEW.Learning_Agreements_la_no <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at Learning_Agreements_la_no';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `learning_agreements_has_subjects_BEFORE_UPDATE` BEFORE UPDATE ON `learning_agreements_has_subjects` FOR EACH ROW BEGIN
	IF (NEW.Learning_Agreements_la_no <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at Learning_Agreements_la_no';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `receiving_institutions`
--

DROP TABLE IF EXISTS `receiving_institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiving_institutions` (
  `erasmus_code` char(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `website` varchar(30) NOT NULL,
  `country` varchar(60) NOT NULL,
  `street` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `zip` int DEFAULT NULL,
  PRIMARY KEY (`erasmus_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiving_institutions`
--

LOCK TABLES `receiving_institutions` WRITE;
/*!40000 ALTER TABLE `receiving_institutions` DISABLE KEYS */;
INSERT INTO `receiving_institutions` VALUES ('ES BARCEL 1','University of Barcelona','www.baruni.es','Spain','Gaudi 78','Barcelona',7872090),('ES MADRID 1','University of Madrid','www.unimad.es','Spain','Carlos the 3d 30','Madrid',87678),('FR PARIS 1','Universite de Paris','www.uparis.fr','France','Rue du Louvre 90','Paris',9868),('FR TOULOU 1','INSA Toulouse','www.touluni.fr','France','Rue du Universite 90','Toulouse',99989),('I  ROMA  1','Sapienza University of Rome','www.rome.it','Italy','Piazzale Aldo Moro 5','Rome',185),('I NAPLES 2','University of Naples Federico II','www.naples.it','Italy','C.so Umberto I 40','Naples',80138),('P AVEIRO 1','Universidade de Aveiro','www.ua.pt','Portugal','Rua dos Ovos Moles 3','Aveiro',5400908),('P PORTO 1','Universidade de Aveiro','www.up.pt','Portugal','Rua dos Pastel de Natas 56','Porto',22029),('PL KRAKOW 1','University of Krakow','www.krakowuni.pl','Poland','Wokdwe90','Krakow',83939);
/*!40000 ALTER TABLE `receiving_institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiving_institutions_has_accommodation`
--

DROP TABLE IF EXISTS `receiving_institutions_has_accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiving_institutions_has_accommodation` (
  `Receiving_Institutions_erasmus_code` char(11) NOT NULL,
  `Accommodation_listing_id` int NOT NULL,
  PRIMARY KEY (`Receiving_Institutions_erasmus_code`,`Accommodation_listing_id`),
  KEY `fk_Receiving_Institutions_has_Accommodation_Accommodation1_idx` (`Accommodation_listing_id`),
  KEY `fk_Receiving_Institutions_has_Accommodation_Receiving_Insti_idx` (`Receiving_Institutions_erasmus_code`),
  CONSTRAINT `fk_Receiving_Institutions_has_Accommodation_Accommodation1` FOREIGN KEY (`Accommodation_listing_id`) REFERENCES `accommodation` (`listing_id`),
  CONSTRAINT `fk_Receiving_Institutions_has_Accommodation_Receiving_Institu1` FOREIGN KEY (`Receiving_Institutions_erasmus_code`) REFERENCES `receiving_institutions` (`erasmus_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiving_institutions_has_accommodation`
--

LOCK TABLES `receiving_institutions_has_accommodation` WRITE;
/*!40000 ALTER TABLE `receiving_institutions_has_accommodation` DISABLE KEYS */;
INSERT INTO `receiving_institutions_has_accommodation` VALUES ('ES MADRID 1',10),('ES MADRID 1',36),('PL KRAKOW 1',57),('P AVEIRO 1',563),('I  ROMA  1',4693),('ES MADRID 1',7979),('P AVEIRO 1',23829),('I NAPLES 2',34738);
/*!40000 ALTER TABLE `receiving_institutions_has_accommodation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `receiving_institutions_has_accommodation_BEFORE_INSERT` BEFORE INSERT ON `receiving_institutions_has_accommodation` FOR EACH ROW BEGIN
	IF (NEW.Accommodation_listing_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at Accommodation_listing_id';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `receiving_institutions_has_accommodation_BEFORE_UPDATE` BEFORE UPDATE ON `receiving_institutions_has_accommodation` FOR EACH ROW BEGIN
	IF (NEW.Accommodation_listing_id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at Accommodation_listing_id';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL,
  `name` varchar(60) NOT NULL,
  `semester` int NOT NULL,
  `department` varchar(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (8080,'Maria Chatzipetrou',9,'ece','mchatzipe@ece.auth.gr','00306980878019'),(9666,'Georgia Amanatiadou',7,'law','gamanat@law.auth.gr','00306985369215'),(9686,'Evgenia Stavrianidou',9,'bio','estavrian@bio.auth.gr','00306971594301'),(9733,'Theodoros Lioupis',9,'meng','tklioupis@meng.auth.gr','00306980872010'),(9775,'Dimitris Barbarousis',9,'med','dimitrimi@med.auth.gr','00306978788191'),(12345,'Nikolaos Karras',11,'bio','nikkar@bio.auth.gr','00306987543682'),(18189,'Konstantina Pakou',7,'ece','kwnpap@ece.auth.gr','00306978098765'),(39203,'Maria Politou',11,'ece','marpol@ece.auth.gr','00306989372830'),(39204,'Anastasia Koulidou',5,'bio','anakoul@bio.auth.gr','00306978362538');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `students_BEFORE_INSERT` BEFORE INSERT ON `students` FOR EACH ROW BEGIN
	IF (NEW.semester < 4) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the minimum semester for Erasmus+Studies is 4';
	END IF;
	IF (NEW.email NOT LIKE '%auth.gr') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at email, it should be the academic email';
	END IF; 
	IF (NEW.id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at id';
	END IF;
    IF (NEW.phone_number NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `students_BEFORE_UPDATE` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN
	IF (NEW.semester < 4) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'the minimum semester for Erasmus+Studies is 4';
	END IF;
	IF (NEW.email NOT LIKE '%auth.gr') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at email, it should be the academic email';
	END IF; 
	IF (NEW.id <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at id';
	END IF;
    IF (NEW.phone_number NOT LIKE ("00%") )THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid phone number, add country code';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `students_decision`
--

DROP TABLE IF EXISTS `students_decision`;
/*!50001 DROP VIEW IF EXISTS `students_decision`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_decision` AS SELECT 
 1 AS `students_id`,
 1 AS `student_name`,
 1 AS `erasmus_code`,
 1 AS `receiving_institutions_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_code` varchar(30) NOT NULL,
  `ECTS` int NOT NULL,
  `semester` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `field_of_study` varchar(60) NOT NULL,
  `erasmus_code` char(11) NOT NULL,
  PRIMARY KEY (`field_of_study`,`erasmus_code`,`subject_code`),
  KEY `fk_Subjects_Departments1_idx` (`field_of_study`,`erasmus_code`),
  CONSTRAINT `fk_Subjects_Departments1` FOREIGN KEY (`field_of_study`, `erasmus_code`) REFERENCES `departments` (`field_of_study`, `erasmus_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('167',7,1,'Calculus','computer science','P AVEIRO 1'),('EE89',4,2,'Operating Systems','computer science','P AVEIRO 1'),('662',4,3,'Physics','electrical engineering','P PORTO 1'),('748',4,8,'Data Analysis','electrical engineering','P PORTO 1'),('934',5,7,'Electric Circuits','electrical engineering','P PORTO 1'),('936',3,5,'Slavic History','languages','P AVEIRO 1'),('37396',6,6,'Biochemistry','medicine','P AVEIRO 1'),('98',6,2,'Anatomy 1','medicine','P AVEIRO 1');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subjects_BEFORE_INSERT` BEFORE INSERT ON `subjects` FOR EACH ROW BEGIN
	IF (NEW.semester <= 0 OR NEW.semester >12) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at semester';
	END IF;
	IF (NEW.ECTS <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at ECTS';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subjects_BEFORE_UPDATE` BEFORE UPDATE ON `subjects` FOR EACH ROW BEGIN
	IF (NEW.semester <= 0 OR NEW.semester >12) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at semester';
	END IF;
	IF (NEW.ECTS <= 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data at ECTS';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `total_subjects`
--

DROP TABLE IF EXISTS `total_subjects`;
/*!50001 DROP VIEW IF EXISTS `total_subjects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_subjects` AS SELECT 
 1 AS `name`,
 1 AS `field_of_study`,
 1 AS `subject_code`,
 1 AS `title`,
 1 AS `ECTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `la_infos`
--

/*!50001 DROP VIEW IF EXISTS `la_infos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `la_infos` AS select `learning_agreements`.`la_no` AS `la_no`,`erasmus_offices`.`email` AS `erasmus_office_email`,`auth_ects_coordinators`.`email` AS `auth_ects_coordinators_email` from ((`erasmus_offices` join `learning_agreements` on((`erasmus_offices`.`email` = `learning_agreements`.`email_erasmus_offices`))) join `auth_ects_coordinators` on((`auth_ects_coordinators`.`email` = `learning_agreements`.`email_auth_ects_coordinators`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `students_decision`
--

/*!50001 DROP VIEW IF EXISTS `students_decision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_decision` AS select `students`.`id` AS `students_id`,`students`.`name` AS `student_name`,`receiving_institutions`.`erasmus_code` AS `erasmus_code`,`receiving_institutions`.`name` AS `receiving_institutions_name` from ((`students` join `applications` on((`applications`.`students_id` = `students`.`id`))) join `receiving_institutions` on((`receiving_institutions`.`erasmus_code` = `applications`.`erasmus_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_subjects`
--

/*!50001 DROP VIEW IF EXISTS `total_subjects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_subjects` AS select `receiving_institutions`.`name` AS `name`,`departments`.`field_of_study` AS `field_of_study`,`subjects`.`subject_code` AS `subject_code`,`subjects`.`title` AS `title`,`subjects`.`ECTS` AS `ECTS` from ((`receiving_institutions` join `departments` on((`receiving_institutions`.`erasmus_code` = `departments`.`erasmus_code`))) join `subjects` on(((`subjects`.`erasmus_code` = `departments`.`erasmus_code`) and (`subjects`.`field_of_study` = `departments`.`field_of_study`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14  0:32:26
