-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: acme-jobs
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2a5vcjo3stlfcwadosjfq49l1` (`user_account_id`),
  CONSTRAINT `FK_2a5vcjo3stlfcwadosjfq49l1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (4,0,3);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXnhikaa2dj3la6o2o7e9vo01y0` (`moment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (381,0,'2020-01-14 09:00:00.000000',NULL,'Descripción del Anuncio de Prueba 01','Anuncio de Prueba 01'),(382,0,'2020-01-14 09:00:00.000000','http://www.example2.com','Descripción del Anuncio de Prueba 02','Anuncio de Prueba 02'),(383,0,'2020-01-14 09:00:00.000000','http://www.example3.com','Descripción del Anuncio de Prueba 03','Anuncio de Prueba 03');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anonymous`
--

DROP TABLE IF EXISTS `anonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anonymous` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6lnbc6fo3om54vugoh8icg78m` (`user_account_id`),
  CONSTRAINT `FK_6lnbc6fo3om54vugoh8icg78m` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymous`
--

LOCK TABLES `anonymous` WRITE;
/*!40000 ALTER TABLE `anonymous` DISABLE KEYS */;
INSERT INTO `anonymous` VALUES (2,0,1);
/*!40000 ALTER TABLE `anonymous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_record`
--

DROP TABLE IF EXISTS `audit_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(1024) DEFAULT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `auditor_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXrc4ws05g8xybytvf60fgv6o5m` (`moment`),
  KEY `IDXof878cqun8l1ynh0ao94bw3au` (`status`),
  KEY `FKdcrrgv6rkfw2ruvdja56un4ji` (`auditor_id`),
  KEY `FKlbvbyimxf6pxvbhkdd4vfhlnd` (`job_id`),
  CONSTRAINT `FKdcrrgv6rkfw2ruvdja56un4ji` FOREIGN KEY (`auditor_id`) REFERENCES `auditor` (`id`),
  CONSTRAINT `FKlbvbyimxf6pxvbhkdd4vfhlnd` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_record`
--

LOCK TABLES `audit_record` WRITE;
/*!40000 ALTER TABLE `audit_record` DISABLE KEYS */;
INSERT INTO `audit_record` VALUES (406,0,'prueba','2019-11-02 09:00:00.000000','published','Prueba',404,362);
/*!40000 ALTER TABLE `audit_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clqcq9lyspxdxcp6o4f3vkelj` (`user_account_id`),
  CONSTRAINT `FK_clqcq9lyspxdxcp6o4f3vkelj` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (404,0,403,'auditor1','auditor1');
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_request`
--

DROP TABLE IF EXISTS `auditor_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditor_request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX7u6rn1f09a74ihkev0ltgqy1j` (`status`),
  KEY `FK49gx0x5hlvlehwyvgesb15kw3` (`user_id`),
  CONSTRAINT `FK49gx0x5hlvlehwyvgesb15kw3` FOREIGN KEY (`user_id`) REFERENCES `authenticated` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_request`
--

LOCK TABLES `auditor_request` WRITE;
/*!40000 ALTER TABLE `auditor_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditor_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticated`
--

DROP TABLE IF EXISTS `authenticated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticated` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h52w0f3wjoi68b63wv9vwon57` (`user_account_id`),
  CONSTRAINT `FK_h52w0f3wjoi68b63wv9vwon57` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticated`
--

LOCK TABLES `authenticated` WRITE;
/*!40000 ALTER TABLE `authenticated` DISABLE KEYS */;
INSERT INTO `authenticated` VALUES (5,0,3),(351,0,349),(354,0,352),(357,0,355),(360,0,358),(386,0,384),(389,0,387),(392,0,390),(395,0,393),(405,0,403),(408,0,407),(410,0,409);
/*!40000 ALTER TABLE `authenticated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticated_message_thread`
--

DROP TABLE IF EXISTS `authenticated_message_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticated_message_thread` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhvu9g2iuqsx6gafs5krdpmyn7` (`thread_id`),
  KEY `FKoty5ev3qmyc4tvvf90prwyb8s` (`user_id`),
  CONSTRAINT `FKhvu9g2iuqsx6gafs5krdpmyn7` FOREIGN KEY (`thread_id`) REFERENCES `message_thread` (`id`),
  CONSTRAINT `FKoty5ev3qmyc4tvvf90prwyb8s` FOREIGN KEY (`user_id`) REFERENCES `authenticated` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticated_message_thread`
--

LOCK TABLES `authenticated_message_thread` WRITE;
/*!40000 ALTER TABLE `authenticated_message_thread` DISABLE KEYS */;
INSERT INTO `authenticated_message_thread` VALUES (414,0,413,410),(415,0,412,410),(416,0,411,408);
/*!40000 ALTER TABLE `authenticated_message_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `targeturl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `goal_bronze` varchar(255) DEFAULT NULL,
  `goal_gold` varchar(255) DEFAULT NULL,
  `goal_silver` varchar(255) DEFAULT NULL,
  `reward_bronze_amount` double DEFAULT NULL,
  `reward_bronze_currency` varchar(255) DEFAULT NULL,
  `reward_gold_amount` double DEFAULT NULL,
  `reward_gold_currency` varchar(255) DEFAULT NULL,
  `reward_silver_amount` double DEFAULT NULL,
  `reward_silver_currency` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXnr284tes3x8hnd3h716tmb3fr` (`deadline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge`
--

LOCK TABLES `challenge` WRITE;
/*!40000 ALTER TABLE `challenge` DISABLE KEYS */;
INSERT INTO `challenge` VALUES (378,0,'2030-12-31 09:00:00.000000','This is a description 2.0','-Silver: Look that.','-Gold: Look this. -Silver: Look that. +Bronze: Look something','-Gold: Look this',1000,'EUROS',3000,'EUROS',2000,'EUROS','Sample challenge 01'),(379,0,'2030-12-31 09:00:00.000000','This is a description 2.0','-Silver: Look that.','-Gold: Look this. -Silver: Look that. +Bronze: Look something','-Gold: Look this',1000,'EUROS',3000,'EUROS',2000,'EUROS','Sample challenge 01'),(380,0,'2030-12-31 09:00:00.000000','This is a description 2.0','-Silver: Look that.','-Gold: Look this. -Silver: Look that. +Bronze: Look something','-Gold: Look this',1000,'EUROS',3000,'EUROS',2000,'EUROS','Sample challenge 03');
/*!40000 ALTER TABLE `challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commercial_banner`
--

DROP TABLE IF EXISTS `commercial_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commercial_banner` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `targeturl` varchar(255) DEFAULT NULL,
  `sponsor_id` int(11) NOT NULL,
  `credit_card_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfp0yot74q1m8ofbclq3nlfidw` (`credit_card_id`),
  KEY `FK_q9id3wc65gg49afc5tlr1c00n` (`sponsor_id`),
  CONSTRAINT `FK_q9id3wc65gg49afc5tlr1c00n` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`id`),
  CONSTRAINT `FKfp0yot74q1m8ofbclq3nlfidw` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commercial_banner`
--

LOCK TABLES `commercial_banner` WRITE;
/*!40000 ALTER TABLE `commercial_banner` DISABLE KEYS */;
INSERT INTO `commercial_banner` VALUES (426,0,'https://i.imgur.com/2eVF1HG.png','Slogan del banner comercial 01','http://www.targerurl01.com',385,396),(427,0,'https://i.imgur.com/fihihcF.png','Slogan del banner comercial 02','http://www.targerurl01.com',388,397),(428,0,'https://i.imgur.com/8YcXhS0.png','Slogan del banner comercial 03','http://www.targerurl01.com',388,397),(429,0,'https://i.imgur.com/2eVF1HG.png','Slogan del banner comercial 03','http://www.targerurl01.com',388,397),(430,0,'https://i.imgur.com/MtBRoNP.png','Slogan del banner comercial 03','http://www.targerurl01.com',388,397),(431,0,'https://i.imgur.com/NGLSjk6.png','Slogan del banner comercial 03','http://www.targerurl01.com',388,397),(432,0,'https://i.imgur.com/fihihcF.png','Slogan del banner comercial 03','http://www.targerurl01.com',388,397);
/*!40000 ALTER TABLE `commercial_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_record`
--

DROP TABLE IF EXISTS `company_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `incorporated` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nameceo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX9pkce3d1y6w47wadap5s5xptc` (`stars`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_record`
--

LOCK TABLES `company_record` WRITE;
/*!40000 ALTER TABLE `company_record` DISABLE KEYS */;
INSERT INTO `company_record` VALUES (371,0,'Jajajajaja manolo','anom@gmail.es',_binary '','ManoloSL','Manolo','+4 9999999999','Agronomo',5,'http://www.manolo.com'),(372,0,'Jajajajaja manolo','anoma@gmail.es',_binary '\0','ManoloSL','Manolo','(9979) 999998','Agronomo',5,'http://www.manolo.com'),(373,0,'Jajajajaja manolo','anomb@gmail.es',_binary '','ManoloSL','Manolo','99992319','Agronomo',5,'http://www.manolo.com');
/*!40000 ALTER TABLE `company_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `spam_threshold` double DEFAULT NULL,
  `spam_words` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (6,0,1,'sex,sexo,viagra,cialis,nigeria,you’ve won,has ganado,million dollar,millón de dolares');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6cyha9f1wpj0dpbxrrjddrqed` (`user_account_id`),
  CONSTRAINT `FK_6cyha9f1wpj0dpbxrrjddrqed` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expiration_month` int(11) NOT NULL,
  `expiration_year` int(11) NOT NULL,
  `holder` varchar(255) DEFAULT NULL,
  `sponsor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31l5hvh7p1nx1aw6v649gw3rc` (`sponsor_id`),
  CONSTRAINT `FK31l5hvh7p1nx1aw6v649gw3rc` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (396,0,'VISA','4376925573423858',900,12,2019,'Paco Diaz',385),(397,0,'MasterCard','4465307888273140',992,12,2020,'Paco Diaz',388),(398,0,'Visa','4123082495348825',321,6,2024,'Elizabeth Hernandez',391),(399,0,'Visa','4940340389540035',830,12,2022,'Juana Martínez',394);
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duty`
--

DROP TABLE IF EXISTS `duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duty` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `percentage` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs2uoxh4i5ya8ptyefae60iao1` (`job_id`),
  CONSTRAINT `FKs2uoxh4i5ya8ptyefae60iao1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duty`
--

LOCK TABLES `duty` WRITE;
/*!40000 ALTER TABLE `duty` DISABLE KEYS */;
INSERT INTO `duty` VALUES (420,0,'desc2',25,'tituloooooo2',361),(421,0,'desc3',75,'tituloooooo3',361),(422,0,'desc',100,'tituloooooo',362),(423,0,'desc4',100,'tituloooooo4',363),(424,0,'desc5',100,'tituloooooo5',364),(425,0,'desc6',100,'tituloooooo6',365);
/*!40000 ALTER TABLE `duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_na4dfobmeuxkwf6p75abmb2tr` (`user_account_id`),
  CONSTRAINT `FK_na4dfobmeuxkwf6p75abmb2tr` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (350,0,349,'company','sector01'),(353,0,352,'company2','sector02');
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (433);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor_record`
--

DROP TABLE IF EXISTS `investor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investor_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXk2t3uthe649ao1jllcuks0gv4` (`stars`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor_record`
--

LOCK TABLES `investor_record` WRITE;
/*!40000 ALTER TABLE `investor_record` DISABLE KEYS */;
INSERT INTO `investor_record` VALUES (374,0,'Juan Pérez','Social',3,'Statement test 001'),(375,0,'Manuel Cañizares','Social',2,'Statement test 002'),(376,0,'John Doe','Deportivo',1,'Statement test 003'),(377,0,'Jane Doe','Judicial',5,'Statement test 004');
/*!40000 ALTER TABLE `investor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `salary_amount` double DEFAULT NULL,
  `salary_currency` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `employer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bos0omdc9s5vykasqjhwaq65m` (`reference_number`),
  KEY `IDX28ur9xm72oo1df9g14xhnh8h3` (`status`),
  KEY `IDXal59yunywnkwi09ps7jxpr18c` (`deadline`,`status`),
  KEY `FK3rxjf8uh6fh2u990pe8i2at0e` (`employer_id`),
  CONSTRAINT `FK3rxjf8uh6fh2u990pe8i2at0e` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (361,0,'2030-12-31 09:00:00.000000','description1','http://www.manolo.com','EEEE-JJJJ',2000,'EUROS','draft','titulo',350),(362,0,'2031-12-31 09:00:00.000000','description2','http://www.manolo2.com','EHHA-JHHG',100,'EUROS','published','titulo2',353),(363,0,'2032-12-31 09:00:00.000000','description3','http://www.manolo3.com','EAAA-JGGG',500,'EUROS','published','titulo3',350),(364,0,'2040-06-21 08:00:00.000000','description4','http://www.manolo4.com','EBBB-JKKK',300,'EUROS','published','titulo4',350),(365,0,'2042-08-11 08:00:00.000000','description5','http://www.manolo5.com','FMMM-KLLL',1000,'EUROS','published','titulo5',353);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application`
--

DROP TABLE IF EXISTS `job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creation_moment` datetime(6) DEFAULT NULL,
  `justification` varchar(1024) DEFAULT NULL,
  `qualifications` varchar(1024) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `skills` varchar(1024) DEFAULT NULL,
  `statement` varchar(1024) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_moment` datetime(6) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4n3tt315wwa2rf3bav14bdmg1` (`reference_number`),
  KEY `IDX71m7fwbhckbwa0qnuf1jt8h1k` (`status`),
  KEY `FK5tcniavarhbbxc7sl99x3au6o` (`job_id`),
  KEY `FKccrwleo6webtpabw26oblobch` (`worker_id`),
  CONSTRAINT `FK5tcniavarhbbxc7sl99x3au6o` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `FKccrwleo6webtpabw26oblobch` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
INSERT INTO `job_application` VALUES (366,0,'2018-12-31 09:00:00.000000','','qsad','EEEE-JJJJ:WWWW','skills','abc','pending',NULL,362,356),(367,0,'2019-10-21 08:00:00.000000','','qsafwafad','EEEE-JJJJ:WWRR','skilfawfals','afawfdbc','pending',NULL,362,359),(368,0,'2019-11-21 09:00:00.000000','','qsafwafad','EHHE-JHHJ:WWRR','skilfawfals','afawfdbc','pending',NULL,363,356),(369,0,'2019-11-21 09:00:00.000000','','qsafwafad','EAAE-JBBJ:WVPR','skilfawfals','afawfdbc','pending',NULL,362,356),(370,0,'2019-10-21 08:00:00.000000','','qsafwafad','EMME-JEEJ:WWOO','skilfawfals','afawfdbc','pending',NULL,365,359);
/*!40000 ALTER TABLE `job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(1024) DEFAULT NULL,
  `creation_moment` datetime(6) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq851een84mnkrhyssa05q7je` (`thread_id`),
  KEY `FKik4epe9dp5q6uenarfyia7xin` (`user_id`),
  CONSTRAINT `FKik4epe9dp5q6uenarfyia7xin` FOREIGN KEY (`user_id`) REFERENCES `authenticated` (`id`),
  CONSTRAINT `FKq851een84mnkrhyssa05q7je` FOREIGN KEY (`thread_id`) REFERENCES `message_thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (417,0,'This is the first message','2016-04-04 22:03:00.000000','Pim, Pam, Pum','message1',411,408),(418,0,'This is the first message','2016-04-05 22:03:00.000000','Pim, Pam, Pum','message2',413,410),(419,0,'this is a message','2016-04-06 22:03:00.000000','Pim, Pam, Pum','message3',412,410);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_thread`
--

DROP TABLE IF EXISTS `message_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_thread` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creation_moment` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKljabur1weonvmg511atm2ql6` (`owner_id`),
  CONSTRAINT `FKljabur1weonvmg511atm2ql6` FOREIGN KEY (`owner_id`) REFERENCES `authenticated` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_thread`
--

LOCK TABLES `message_thread` WRITE;
/*!40000 ALTER TABLE `message_thread` DISABLE KEYS */;
INSERT INTO `message_thread` VALUES (411,0,'2016-04-04 22:06:00.000000','thread1',408),(412,0,'2016-04-06 22:06:00.000000','thread2',410),(413,0,'2016-04-04 22:06:00.000000','thread3',410);
/*!40000 ALTER TABLE `message_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_commercial_banner`
--

DROP TABLE IF EXISTS `non_commercial_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_commercial_banner` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `targeturl` varchar(255) DEFAULT NULL,
  `sponsor_id` int(11) NOT NULL,
  `jingleurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2l8gpcwh19e7jj513or4r9dvb` (`sponsor_id`),
  CONSTRAINT `FK_2l8gpcwh19e7jj513or4r9dvb` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_commercial_banner`
--

LOCK TABLES `non_commercial_banner` WRITE;
/*!40000 ALTER TABLE `non_commercial_banner` DISABLE KEYS */;
INSERT INTO `non_commercial_banner` VALUES (400,0,'https://i.imgur.com/fihihcF.png','Slogan del banner no comercial 01','http://www.targerurlnocomercial01.com',385,'http://www.jingleurl01.com'),(401,0,'https://i.imgur.com/NGLSjk6.png','Slogan del banner no comercial 02','http://www.targerurlnocomercial02.com',388,'http://www.jingleurl02.com'),(402,0,'https://i.imgur.com/MtBRoNP.png','Slogan del banner no comercial 03','http://www.targerurlnocomercial03.com',385,'http://www.jingleurl03.com');
/*!40000 ALTER TABLE `non_commercial_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creationmoment` datetime(6) DEFAULT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `money_max_amount` double DEFAULT NULL,
  `money_max_currency` varchar(255) DEFAULT NULL,
  `money_min_amount` double DEFAULT NULL,
  `money_min_currency` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iex7e8fs0fh89yxpcnm1orjkm` (`ticker`),
  KEY `IDXq2o9psuqfuqmq59f0sq57x9uf` (`deadline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (201,0,'2016-04-04 22:03:00.000000','2020-04-04 22:03:00.000000',3400,'EUROS',2000,'EUROS','Test about text','OABCD-12344','oferta1'),(202,0,'2016-04-04 22:03:00.000000','2020-04-04 22:03:00.000000',3000,'EUROS',2000,'EUROS','Test about text','OABCD-12343','oferta2'),(203,0,'2016-04-04 22:03:00.000000','2020-04-04 22:03:00.000000',7000,'EUROS',1000,'EUROS','Test about text','OABCD-12345','oferta5');
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participa`
--

DROP TABLE IF EXISTS `participa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participa` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10eml2dvl5sxkas6wmq8l6lv9` (`thread_id`),
  KEY `FKqeth7xtvxhkh9pit38e23vf0j` (`user_id`),
  CONSTRAINT `FK10eml2dvl5sxkas6wmq8l6lv9` FOREIGN KEY (`thread_id`) REFERENCES `message_thread` (`id`),
  CONSTRAINT `FKqeth7xtvxhkh9pit38e23vf0j` FOREIGN KEY (`user_id`) REFERENCES `authenticated` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participa`
--

LOCK TABLES `participa` WRITE;
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
INSERT INTO `participa` VALUES (242,0,241,238),(243,0,240,238),(244,0,239,236);
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b1gwnjqm6ggy9yuiqm0o4rlmd` (`user_account_id`),
  CONSTRAINT `FK_b1gwnjqm6ggy9yuiqm0o4rlmd` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creation_moment` datetime(6) DEFAULT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reward_amount` double DEFAULT NULL,
  `reward_currency` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9mxq3powq8tqctclj0fbi2nih` (`ticker`),
  KEY `IDXlrvsw21ylkdqa1shrkwg1yssx` (`deadline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (195,0,'2019-10-15 08:30:00.000000','2020-01-20 22:30:00.000000','This is request 1',1000,'EUROS','Rabcd-01000','request1'),(196,0,'2019-09-10 09:45:00.000000','2020-01-25 22:30:00.000000','This is request 2',2500,'EUROS','RAbCd-01001','request2'),(197,0,'2019-08-05 10:50:00.000000','2020-01-30 22:30:00.000000','This is request 3',5000,'EUROS','RABCD-01002','request3');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `organisation_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_20xk0ev32hlg96kqynl6laie2` (`user_account_id`),
  CONSTRAINT `FK_20xk0ev32hlg96kqynl6laie2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (385,0,384,'Organisation Sponsor 1, Inc.'),(388,0,387,'Organisation Sponsor 2, Inc.'),(391,0,390,'Organisation Sponsor 3, Inc.'),(394,0,393,'Organisation Sponsor 4, Inc.');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `identity_email` varchar(255) DEFAULT NULL,
  `identity_name` varchar(255) DEFAULT NULL,
  `identity_phone_area_code` varchar(255) DEFAULT NULL,
  `identity_phone_country_code` int(11) DEFAULT NULL,
  `identity_phone_number` varchar(255) DEFAULT NULL,
  `identity_surname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,0,_binary '\0','john.doe@acme.com','John',NULL,NULL,NULL,'Doe','$2a$05$H8YWLTQSDq/1MKv/AB0jA.cAWr4rBVO1.wNk4ALS/ApD9HcK6z7Im','anonymous'),(3,0,_binary '','administrator@acme.com','Administrator',NULL,NULL,NULL,'Acme.com','$2a$05$m9S5GcRKvpcaVq/4nH8W9uYn..USQ35Mw6kQD7hNhDUqJVT3Emac.','administrator'),(349,0,_binary '','john.doe@acme.com','John',NULL,NULL,NULL,'Doe','$2a$05$MAW4bVv1lCSOCAVIs7tuH.1iWPd89GM95IHIOF.ajAqlrgHWVIlhm','employer1'),(352,0,_binary '','john2.doe@acme.com','John',NULL,NULL,NULL,'Doe','$2a$05$ifs.vToowwCwFXFyE0g2leM.AoO2TsL29iUUcy3v4qHUUlIq.3RSa','employer2'),(355,0,_binary '','johnd.doe@acme.com','Johnd',NULL,NULL,NULL,'Doedd','$2a$05$OATcMIhvg2xr/1NIk4M1.OZ3MA5UtvTzeYJ1ZtMC2HrGQefAHCER2','worker1'),(358,0,_binary '','pacoe@acme.com','Paco',NULL,NULL,NULL,'Arroyo','$2a$05$wLY12u3gOne1osPDMK8wu.isOeDA4E1pkQTu8H/2RNpvL6FzyEYbu','worker2'),(384,0,_binary '','sponsor1@acme.com','Sponsor1',NULL,NULL,NULL,'Sponsor','$2a$05$vyI1VL.ZNycCIfnu9Yo.B.24gs8nDVTNG64R8Y7gXI01R.zPQMHn.','sponsor1'),(387,0,_binary '','sponsor2@acme.com','Sponsor2',NULL,NULL,NULL,'Sponsor','$2a$05$ueTbkviEe7JBrLq9cy9nguX8ImnNFKRCOqNwAqmM3O7qxQAET.4ee','sponsor2'),(390,0,_binary '','sponsor3@acme.com','Sponsor3',NULL,NULL,NULL,'Sponsor','$2a$05$eQTS5aQghTxDwhMOQg2gLOg/Iet44XH2elR2876bQaLnr2fccYizm','sponsor3'),(393,0,_binary '','sponsor4@acme.com','Sponsor4',NULL,NULL,NULL,'Sponsor','$2a$05$xEaBdjf5rUCQwP87xGrA8eBk5o9hNX6nAfEdw9P73s6LULI2SH1j2','sponsor4'),(403,0,_binary '','audii.thor@acme.com','Audii',NULL,NULL,NULL,'Thor','$2a$05$gXrXq31gBhxvpdFKJPN8HuhExUrHNAGRha/SgpbeQHfhLB64Hjf7m','auditor1'),(407,0,_binary '','authenticated1@acme.com','Authenticated1',NULL,NULL,NULL,'Authenticated','$2a$05$eXY.fnx10f8TB5xlWHdX2u4nqo3eWqXaaLmEFqO80RfSYN4hvjI0u','authenticated1'),(409,0,_binary '','authenticated1@acme.com','Authenticated2',NULL,NULL,NULL,'Authenticated','$2a$05$zaLlkEywr4yonSMXgQsP4.vwry0OAFuRU5/1O1fMLjLr9TLHoOP1C','authenticated2');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `qualifications` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l5q1f33vs2drypmbdhpdgwfv3` (`user_account_id`),
  CONSTRAINT `FK_l5q1f33vs2drypmbdhpdgwfv3` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (356,0,355,'arriba','skills1, skills2'),(359,0,358,'españa','skills1, skills2, skills3');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-14 12:18:32
