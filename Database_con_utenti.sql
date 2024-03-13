CREATE DATABASE  IF NOT EXISTS `farmaciadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `farmaciadb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: farmaciadb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cassetto`
--

DROP TABLE IF EXISTS `cassetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cassetto` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `numero_scaffale` int NOT NULL,
  PRIMARY KEY (`numero`,`numero_scaffale`),
  KEY `cassetto_numero_scaffale_idx` (`numero_scaffale`),
  CONSTRAINT `cassetto_numero_scaffale` FOREIGN KEY (`numero_scaffale`) REFERENCES `scaffale` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cassetto`
--

LOCK TABLES `cassetto` WRITE;
/*!40000 ALTER TABLE `cassetto` DISABLE KEYS */;
INSERT INTO `cassetto` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(38,4),(39,4),(40,4),(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,6),(52,6),(53,6),(54,6),(55,6),(56,6),(57,6),(58,6),(59,6),(60,6),(61,7),(62,7),(63,7),(64,7),(65,7),(66,7),(67,7),(68,7),(69,7),(70,7),(71,8),(72,8),(73,8),(74,8),(75,8),(76,8),(77,8),(78,8),(79,8),(80,8),(81,9),(82,9),(83,9),(84,9),(85,9),(86,9),(87,9),(88,9),(89,9),(90,9),(91,10),(92,10),(93,10),(94,10),(95,10),(96,10),(97,10),(98,10),(99,10),(100,10),(102,11),(101,21);
/*!40000 ALTER TABLE `cassetto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cassetto_BEFORE_INSERT` BEFORE INSERT ON `cassetto` FOR EACH ROW BEGIN
		declare var_limite_cassetto int;
        declare var_num_cassetti int;
        set var_limite_cassetto=10;
        
		select count(numero)
        from cassetto
        where new.numero_scaffale=numero_scaffale
        group by(numero_scaffale)
        into var_num_cassetti;
        
        if var_num_cassetti+1>var_limite_cassetto then
				
                signal sqlstate '45001' set message_text ='lo scaffale non può avere altri cassetti';
        
        end if;
        
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cassetto_BEFORE_UPDATE` BEFORE UPDATE ON `cassetto` FOR EACH ROW BEGIN
		
		declare var_limite_cassetto int;
        declare var_num_cassetti int;
        set var_limite_cassetto=10;
        
		select count(numero)
        from cassetto
        where new.numero_scaffale=numero_scaffale
        group by(numero_scaffale)
        into var_num_cassetti;
        
        if var_num_cassetti+1>var_limite_cassetto then
				
                signal sqlstate '45002' set message_text ='lo scaffale non può avere altri cassetti';
        
        end if;
        

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ditta_fornitrice`
--

DROP TABLE IF EXISTS `ditta_fornitrice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ditta_fornitrice` (
  `nome` char(20) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ditta_fornitrice`
--

LOCK TABLES `ditta_fornitrice` WRITE;
/*!40000 ALTER TABLE `ditta_fornitrice` DISABLE KEYS */;
INSERT INTO `ditta_fornitrice` VALUES ('alfasigma'),('compra'),('ditta_1'),('ditta_10'),('ditta_2'),('ditta_3'),('ditta_4'),('ditta_5'),('ditta_6'),('ditta_7'),('ditta_8'),('ditta_9'),('farma'),('reumo'),('saila'),('spendi');
/*!40000 ALTER TABLE `ditta_fornitrice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ditta_info`
--

DROP TABLE IF EXISTS `ditta_info`;
/*!50001 DROP VIEW IF EXISTS `ditta_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ditta_info` AS SELECT 
 1 AS `nome`,
 1 AS `indirizzo`,
 1 AS `recapito`,
 1 AS `tipo`,
 1 AS `contatti_preferiti`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `elenco_degli_usi`
--

DROP TABLE IF EXISTS `elenco_degli_usi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elenco_degli_usi` (
  `usi_possibili` char(35) NOT NULL,
  PRIMARY KEY (`usi_possibili`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elenco_degli_usi`
--

LOCK TABLES `elenco_degli_usi` WRITE;
/*!40000 ALTER TABLE `elenco_degli_usi` DISABLE KEYS */;
INSERT INTO `elenco_degli_usi` VALUES ('detergente per il viso'),('diverticolite'),('dolori delle ossa'),('febbre'),('mal di gola'),('raffreddore');
/*!40000 ALTER TABLE `elenco_degli_usi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `via` varchar(30) NOT NULL,
  `nome_ditta` char(20) NOT NULL,
  `preferito` tinyint NOT NULL,
  PRIMARY KEY (`via`,`nome_ditta`),
  KEY `indirizzo_nome_ditta_idx` (`nome_ditta`),
  CONSTRAINT `indirizzo_nome_ditta` FOREIGN KEY (`nome_ditta`) REFERENCES `ditta_fornitrice` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES ('via cavour 5','farma',1),('via davi 10','reumo',1),('via david 11','reumo',0),('via gorizia 16','saila',1),('via numero 1','ditta_1',1),('via numero 10','ditta_10',1),('via numero 2','ditta_2',1),('via numero 3','ditta_3',1),('via numero 4','ditta_4',1),('via numero 5','ditta_5',1),('via numero 6','ditta_6',1),('via numero 7','ditta_7',1),('via numero 8','ditta_8',1),('via numero 9','ditta_9',1),('via roma 220','spendi',1),('via toro 7','compra',1),('via trento 15','saila',0),('viale degli eroi di rodi 203','alfasigma',0),('viale marconi 11','alfasigma',1);
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicinale`
--

DROP TABLE IF EXISTS `medicinale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicinale` (
  `nome` char(20) NOT NULL,
  `medicinale_mutuabile` tinyint NOT NULL,
  `ricetta_medica` tinyint NOT NULL,
  `numero_scorte` int DEFAULT '0',
  `nome_ditta` char(20) NOT NULL,
  PRIMARY KEY (`nome`,`nome_ditta`),
  KEY `medicinale_nome_ditta_idx` (`nome_ditta`),
  CONSTRAINT `medicinale_nome_ditta` FOREIGN KEY (`nome_ditta`) REFERENCES `ditta_fornitrice` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicinale`
--

LOCK TABLES `medicinale` WRITE;
/*!40000 ALTER TABLE `medicinale` DISABLE KEYS */;
INSERT INTO `medicinale` VALUES ('golia',0,0,120,'farma'),('medicinale_1',1,0,10,'ditta_1'),('medicinale_1',1,0,10,'ditta_2'),('medicinale_2',0,1,10,'ditta_1'),('medicinale_2',1,0,10,'ditta_2'),('medicinale_2',1,1,10,'ditta_3'),('normix',1,1,5,'alfasigma'),('oki',1,1,20,'compra'),('reumo',0,0,50,'saila'),('rifacol',1,1,5,'ditta_5'),('sopirol',1,1,30,'farma'),('tachidol',1,1,300,'ditta_1'),('tachidol',1,1,30,'farma');
/*!40000 ALTER TABLE `medicinale` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `medicinale_BEFORE_INSERT` BEFORE INSERT ON `medicinale` FOR EACH ROW BEGIN
		if(new.numero_scorte<0) THEN
			signal sqlstate '45003'
			set message_text = "Le scorte non pososno essere negative";
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `medicinale_BEFORE_UPDATE` BEFORE UPDATE ON `medicinale` FOR EACH ROW BEGIN
		if(new.numero_scorte<0) THEN
			signal sqlstate '45004'
			set message_text = "Le scorte non pososno essere negative";
		END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `medicinali_info`
--

DROP TABLE IF EXISTS `medicinali_info`;
/*!50001 DROP VIEW IF EXISTS `medicinali_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `medicinali_info` AS SELECT 
 1 AS `nome_medicinale`,
 1 AS `medicinale_mutuabile`,
 1 AS `ricetta_medica`,
 1 AS `numero_scorte`,
 1 AS `nome_ditta`,
 1 AS `via_preferita_ditta`,
 1 AS `recapito_preferito_ditta`,
 1 AS `tipologia_recapito_della_ditta`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `posizione`
--

DROP TABLE IF EXISTS `posizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posizione` (
  `Id_scatola_medicinale` int NOT NULL,
  `numero_cassetto` int NOT NULL,
  `numero_scaffale` int NOT NULL,
  PRIMARY KEY (`Id_scatola_medicinale`,`numero_cassetto`,`numero_scaffale`),
  KEY `posizione_numero_cassetto_scaffale_idx` (`numero_cassetto`,`numero_scaffale`),
  CONSTRAINT `posizione_id_medicinale` FOREIGN KEY (`Id_scatola_medicinale`) REFERENCES `scatola_medicinali_non_vendute` (`id`),
  CONSTRAINT `posizione_numero_cassetto_scaffale` FOREIGN KEY (`numero_cassetto`, `numero_scaffale`) REFERENCES `cassetto` (`numero`, `numero_scaffale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posizione`
--

LOCK TABLES `posizione` WRITE;
/*!40000 ALTER TABLE `posizione` DISABLE KEYS */;
INSERT INTO `posizione` VALUES (31,1,1),(32,1,1),(33,1,1),(34,2,1),(35,2,1),(36,2,1),(37,2,1),(38,2,1),(39,2,1),(40,2,1),(41,3,1),(42,3,1);
/*!40000 ALTER TABLE `posizione` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `posizione_BEFORE_INSERT` BEFORE INSERT ON `posizione` FOR EACH ROW BEGIN
		declare var_limite_scatole int;
        declare var_num_scatole int;
        set var_limite_scatole=30;
        
		select count(Id_scatola_medicinale)
        from posizione
        where new.numero_cassetto=numero_cassetto
        group by(numero_cassetto)
        into var_num_scatole;
        
        if var_num_scatole+1>var_limite_scatole then
				
                signal sqlstate '45005' set message_text ='lo scaffale non può avere altri cassetti';
        
        end if;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `posizione_BEFORE_UPDATE` BEFORE UPDATE ON `posizione` FOR EACH ROW BEGIN
		declare var_limite_scatole int;
        declare var_num_scatole int;
        set var_limite_scatole=30;
        
		select count(Id_scatola_medicinale)
        from posizione
        where new.numero_cassetto=numero_cassetto
        group by(numero_cassetto)
        into var_num_scatole;
        
        if var_num_scatole+1>var_limite_scatole then
				
                signal sqlstate '45006' set message_text ='lo scaffale non può avere altri cassetti';
        
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recapito`
--

DROP TABLE IF EXISTS `recapito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recapito` (
  `recapito` varchar(25) NOT NULL,
  `tipo` enum('fax','telefono','email') NOT NULL,
  `nome_ditta` char(20) NOT NULL,
  `preferito` tinyint NOT NULL,
  PRIMARY KEY (`recapito`,`nome_ditta`),
  KEY `recapito_nome_ditta_idx` (`nome_ditta`),
  CONSTRAINT `recapito_nome_ditta` FOREIGN KEY (`nome_ditta`) REFERENCES `ditta_fornitrice` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recapito`
--

LOCK TABLES `recapito` WRITE;
/*!40000 ALTER TABLE `recapito` DISABLE KEYS */;
INSERT INTO `recapito` VALUES ('065885444','telefono','alfasigma',0),('091301223','telefono','reumo',0),('091302711','telefono','reumo',1),('101010101010','telefono','ditta_10',1),('111111','telefono','ditta_1',1),('222222','telefono','ditta_2',1),('333333','telefono','ditta_3',1),('333390302711','telefono','farma',1),('3384232487','telefono','saila',1),('38020273011','telefono','compra',1),('39030123016','telefono','spendi',1),('444444','telefono','ditta_4',1),('555555','telefono','ditta_5',1),('666666','telefono','ditta_6',1),('777777','telefono','ditta_7',1),('888888','telefono','ditta_8',1),('999999','telefono','ditta_9',1),('info@alfasigma.com','email','alfasigma',1),('saila@libero.it','email','saila',0);
/*!40000 ALTER TABLE `recapito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scaffale`
--

DROP TABLE IF EXISTS `scaffale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scaffale` (
  `numero` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scaffale`
--

LOCK TABLES `scaffale` WRITE;
/*!40000 ALTER TABLE `scaffale` DISABLE KEYS */;
INSERT INTO `scaffale` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21);
/*!40000 ALTER TABLE `scaffale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `scatola_medicinali_info`
--

DROP TABLE IF EXISTS `scatola_medicinali_info`;
/*!50001 DROP VIEW IF EXISTS `scatola_medicinali_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `scatola_medicinali_info` AS SELECT 
 1 AS `id_scatola_medicinale`,
 1 AS `medicinale`,
 1 AS `ditta`,
 1 AS `scadenza`,
 1 AS `mutuabilità`,
 1 AS `necessità_ricetta`,
 1 AS `cassetto`,
 1 AS `scaffale`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scatola_medicinali_non_vendute`
--

DROP TABLE IF EXISTS `scatola_medicinali_non_vendute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scatola_medicinali_non_vendute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_ditta` char(20) NOT NULL,
  `nome_medicinale` char(20) NOT NULL,
  `data_scadenza` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scatola_med_nome_ditta_idx` (`nome_ditta`),
  KEY `scatola_med_nome_medicinale_idx` (`nome_medicinale`),
  CONSTRAINT `scatola_med_nome_ditta` FOREIGN KEY (`nome_ditta`) REFERENCES `medicinale` (`nome_ditta`),
  CONSTRAINT `scatola_med_nome_medicinale` FOREIGN KEY (`nome_medicinale`) REFERENCES `medicinale` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scatola_medicinali_non_vendute`
--

LOCK TABLES `scatola_medicinali_non_vendute` WRITE;
/*!40000 ALTER TABLE `scatola_medicinali_non_vendute` DISABLE KEYS */;
INSERT INTO `scatola_medicinali_non_vendute` VALUES (31,'ditta_1','medicinale_1','2024-12-12'),(32,'ditta_1','medicinale_1','2024-12-12'),(33,'ditta_1','medicinale_1','2024-12-12'),(34,'ditta_2','medicinale_1','2025-01-01'),(35,'ditta_2','medicinale_1','2025-01-01'),(36,'ditta_2','medicinale_1','2025-01-01'),(37,'ditta_2','medicinale_1','2025-01-01'),(38,'ditta_3','medicinale_2','2024-12-12'),(39,'ditta_3','medicinale_2','2024-12-12'),(40,'ditta_3','medicinale_2','2024-12-12'),(41,'ditta_3','medicinale_2','2024-12-12'),(42,'ditta_3','medicinale_2','2024-12-12');
/*!40000 ALTER TABLE `scatola_medicinali_non_vendute` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `scatola_medicinali_non_vendute_BEFORE_INSERT` BEFORE INSERT ON `scatola_medicinali_non_vendute` FOR EACH ROW BEGIN
		if new.data_scadenza<now() then
        
				signal sqlstate '45007' set message_text ='Il medecinale inserito è già scaduto';
       
        end if;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `scatola_medicinali_non_vendute_BEFORE_UPDATE` BEFORE UPDATE ON `scatola_medicinali_non_vendute` FOR EACH ROW BEGIN
		if new.data_scadenza<now() then
        
				signal sqlstate '45008' set message_text ='Il medecinale inserito è già scaduto';
       
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `scatole_medicinali_vendute`
--

DROP TABLE IF EXISTS `scatole_medicinali_vendute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scatole_medicinali_vendute` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nome_medicinale` char(20) NOT NULL,
  `nome_ditta` char(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `scatole_vendute_nome_ditta_idx` (`nome_ditta`),
  KEY `scatole_vendute_nome_medicinale_idx` (`nome_medicinale`),
  CONSTRAINT `scatole_vendute_nome_ditta` FOREIGN KEY (`nome_ditta`) REFERENCES `medicinale` (`nome_ditta`),
  CONSTRAINT `scatole_vendute_nome_medicinale` FOREIGN KEY (`nome_medicinale`) REFERENCES `medicinale` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scatole_medicinali_vendute`
--

LOCK TABLES `scatole_medicinali_vendute` WRITE;
/*!40000 ALTER TABLE `scatole_medicinali_vendute` DISABLE KEYS */;
INSERT INTO `scatole_medicinali_vendute` VALUES (1,'rifacol','ditta_5'),(4,'tachidol','farma'),(5,'tachidol','ditta_1'),(6,'golia','farma'),(7,'tachidol','ditta_1'),(12,'sopirol','farma'),(13,'reumo','saila'),(14,'reumo','saila');
/*!40000 ALTER TABLE `scatole_medicinali_vendute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usi`
--

DROP TABLE IF EXISTS `usi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usi` (
  `elenco_utilizzi` char(35) NOT NULL,
  `nome_medicinale` char(20) NOT NULL,
  `nome_ditta` char(20) NOT NULL,
  PRIMARY KEY (`elenco_utilizzi`,`nome_medicinale`,`nome_ditta`),
  KEY `usi_nome_medicinale_idx` (`nome_medicinale`),
  KEY `usi_nome_ditta_idx` (`nome_ditta`),
  CONSTRAINT `usi_elenco_degli_usi` FOREIGN KEY (`elenco_utilizzi`) REFERENCES `elenco_degli_usi` (`usi_possibili`),
  CONSTRAINT `usi_nome_ditta` FOREIGN KEY (`nome_ditta`) REFERENCES `medicinale` (`nome_ditta`),
  CONSTRAINT `usi_nome_medicinale` FOREIGN KEY (`nome_medicinale`) REFERENCES `medicinale` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usi`
--

LOCK TABLES `usi` WRITE;
/*!40000 ALTER TABLE `usi` DISABLE KEYS */;
/*!40000 ALTER TABLE `usi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `codice_fiscale` varchar(16) NOT NULL,
  `password` varchar(20) NOT NULL,
  `ruolo` enum('amministrazione','medico') NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES ('BNCGIU95L55F839W','cane','medico'),('RSSMRA95A01H501S','pippo','amministrazione');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendita_con_codice_fiscale`
--

DROP TABLE IF EXISTS `vendita_con_codice_fiscale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendita_con_codice_fiscale` (
  `id_scatola_medicinali` int NOT NULL AUTO_INCREMENT,
  `codice_fiscale` varchar(16) NOT NULL,
  PRIMARY KEY (`id_scatola_medicinali`),
  CONSTRAINT `vendita_con_codice_fiscale_id_scatola` FOREIGN KEY (`id_scatola_medicinali`) REFERENCES `scatole_medicinali_vendute` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendita_con_codice_fiscale`
--

LOCK TABLES `vendita_con_codice_fiscale` WRITE;
/*!40000 ALTER TABLE `vendita_con_codice_fiscale` DISABLE KEYS */;
INSERT INTO `vendita_con_codice_fiscale` VALUES (4,'1111111111111111'),(5,'gvnbrn58c04g274k'),(7,'gvnbrn58c04g274k'),(14,'null');
/*!40000 ALTER TABLE `vendita_con_codice_fiscale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'farmaciadb'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `scatole_di_medicinali_scadute` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `scatole_di_medicinali_scadute` ON SCHEDULE EVERY 1 DAY STARTS '2024-01-11 17:24:15' ON COMPLETION PRESERVE ENABLE COMMENT 'Elimina dal database le scatole di medicinali scadute' DO delete from scatola_medicinali where (data_scadenza < now() ) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'farmaciadb'
--
/*!50003 DROP PROCEDURE IF EXISTS `assegna_usi_medicinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assegna_usi_medicinale`(in var_nome_medicinale char(20), in var_elenco_utilizzi char(20), in var_nome_ditta char(20))
BEGIN
		set transaction isolation level read uncommitted;
        start transaction;
				insert into usi(nome_medicinale,nome_ditta,elenco_utilizzi)
				values(var_nome_medicinale,var_nome_ditta,var_elenco_utilizzi);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `effettua_vendita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `effettua_vendita`(in var_scatola_medicinale int, in var_codice_fiscale varchar(16))
BEGIN
		declare var_nome_medicinale_temp char(20);
        declare var_id_scatola_venduta int;
        declare var_ditta_fornitrice_temp char(20);
        declare exit handler for sqlexception
        begin
				rollback;
                resignal;
        end;
        set transaction isolation level  repeatable read;
        START transaction;
        
				select nome_ditta,nome_medicinale
				from scatola_medicinali_non_vendute
				where var_scatola_medicinale=id
				into var_ditta_fornitrice_temp,var_nome_medicinale_temp;
				
				insert into scatole_medicinali_vendute(nome_ditta,nome_medicinale)
				values (var_ditta_fornitrice_temp,var_nome_medicinale_temp);
				
				if var_codice_fiscale is not null then
					call effettua_vendita_con_codice_fiscale(last_insert_id(),var_codice_fiscale);
				end if;
				
				call elimina_scatola_medicinali(var_scatola_medicinale);
        
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `effettua_vendita_con_codice_fiscale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `effettua_vendita_con_codice_fiscale`(in var_scatola_medicinale int, in var_codice_fiscale varchar(16))
BEGIN
		set transaction isolation level read uncommitted;
        start transaction;
				insert into vendita_con_codice_fiscale(id_scatola_medicinali,codice_fiscale)
				values(var_scatola_medicinale,var_codice_fiscale);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `elimina_scatola_medicinali` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elimina_scatola_medicinali`(in var_id_scatola_medicinali int)
BEGIN
		declare exit handler for sqlexception
        BEGIN
				rollback;
                resignal;
        END;
		
        set transaction isolation level read uncommitted;
		start transaction;
				DELETE from posizione
				where var_id_scatola_medicinali=Id_scatola_medicinale;
				
				DELETE from scatola_medicinali_non_vendute
				where var_id_scatola_medicinali=id;
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_cassetto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_cassetto`(in var_numero_scaffale int,out var_id_cassetto int)
BEGIN
		set transaction isolation level repeatable read;
		start transaction;
			insert into cassetto(numero_scaffale)
			values(var_numero_scaffale);
		
			set var_id_cassetto=last_insert_id();
			
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_ditta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_ditta`(in var_nome char(20),in var_recapito varchar(25),in var_tipo varchar(20) ,in var_indirizzo varchar(30))
BEGIN
		
        
        
        declare var_preferito tinyint;
        declare exit handler for sqlexception
		begin
				rollback;
				resignal;
		end;
        
        
        set var_preferito=1;
        start transaction;
        INSERT into ditta_fornitrice(nome)
			value (var_nome);
			
			call farmaciadb.inserisci_indirizzo(var_indirizzo,var_nome, var_preferito);
			call farmaciadb.inserisci_recapito(var_recapito,var_tipo,var_nome, var_preferito);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_indirizzo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_indirizzo`(in var_indirizzo varchar(30), in var_nome_ditta char(20), in var_preferito tinyint )
BEGIN
		set transaction isolation level read uncommitted;
        start transaction;
				Insert into indirizzo(via,nome_ditta,preferito)
				values(var_indirizzo,var_nome_ditta,var_preferito);
        commit;
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_medicinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_medicinale`(in var_nome char(20),in var_medicinale_mutuabile tinyint, in var_ricetta_medica tinyint,in var_numero_scorte int, in var_nome_ditta char(20))
BEGIN
		
        Set transaction isolation level read uncommitted;
        start transaction;
			insert into medicinale(nome,medicinale_mutuabile,ricetta_medica,numero_scorte,nome_ditta)
			values(var_nome,var_medicinale_mutuabile,var_ricetta_medica,var_numero_scorte,var_nome_ditta);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_recapito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_recapito`(in var_recapito varchar(25), in var_tipo varchar(20),in var_nome_ditta char(20), in var_preferito tinyint)
BEGIN
		set transaction isolation level read uncommitted;
        insert into recapito(recapito,tipo,nome_ditta,preferito)
        values(var_recapito,var_tipo,var_nome_ditta,var_preferito);
         
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_scaffale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_scaffale`(out var_id_scaffale int)
BEGIN
		
		
        start transaction;
		
				insert into scaffale()
				value();
				
				set var_id_scaffale=last_insert_id();
		
        commit;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_scatola_medicinali` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_scatola_medicinali`(in var_nome_ditta char(20), in var_nome_medicinale char(20),in var_numero_scaffale int, in var_numero_cassetto int,in var_data_scadenza date,out var_id_scatola_medicinali int)
BEGIN
	
	
		declare exit handler for sqlexception
        begin
				rollback;
                resignal;
        end;
	
        START TRANSACTION;
		
				insert into scatola_medicinali_non_vendute(nome_ditta,nome_medicinale,data_scadenza)
				values(var_nome_ditta,var_nome_medicinale,var_data_scadenza);
				
                set var_id_scatola_medicinali=last_insert_id();
				
                
			
        
				insert into posizione(id_scatola_medicinale,numero_scaffale,numero_cassetto)
                values(var_id_scatola_medicinali,var_numero_scaffale,var_numero_cassetto);
                
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_usi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_usi`(in var_usi_possibili char(20))
BEGIN
		set transaction isolation level read uncommitted;
        start transaction;
				insert into elenco_degli_usi (usi_possibili)
				values(var_usi_possibili);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_utente`(in var_codice_fiscale varchar(16), in var_password varchar(20), in var_ruolo ENUM('amministrazione', 'medico'))
BEGIN
		set transaction isolation level read uncommitted;
        start transaction;
				insert into utenti(codice_fiscale,password,ruolo)
				values(var_codice_fiscale,var_password,var_ruolo);
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in var_codice_fiscale varchar(16), in var_password varchar(20),out var_tipo int)
BEGIN
		declare tipologie enum ("amministrazione","medico");
        
        select ruolo
        from utenti
        where codice_fiscale=var_codice_fiscale and utenti.password=var_password
        into tipologie;
        
        if tipologie ="amministrazione" then
			set var_tipo=1;
        elseif tipologie = "medico" then
			set var_tipo=2;
		else 
			set var_tipo=3;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_giacenza_magazzino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `report_giacenza_magazzino`()
BEGIN
		Set transaction read only;
        start transaction;
				Select nome, nome_ditta,numero_scorte
				from medicinale;
		commit;
        
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_medicinali_in_scadenza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `report_medicinali_in_scadenza`()
BEGIN
		set transaction read only;
	    start transaction;
			SELECT id_scatola_medicinale,scadenza,scaffale,cassetto
			from scatola_medicinali_info ;
		commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Resetta_Farmacia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Resetta_Farmacia`(in var_utente_cf varchar(16), in password varchar(20))
BEGIN
		declare tipologie enum ("amministrazione","medico");
        
        set transaction isolation level serializable;
        start transaction;
			
            select ruolo
			from utenti
			where codice_fiscale=var_codice_fiscale and utenti.password=var_password
			into tipologie;
			
			if tipologie ="amministrazione" then
				delete from indirizzo;
				delete from recapito;
				delete from posizione;
				delete from cassetto;
				delete from scaffale;
				delete from utenti;
				delete from scatole_medicinali_non_vendute;
				delete from vendita_con_codice_fiscale;
				delete from scatole_medicinali_vendute;
				delete from usi;
				delete from elenco_degli_usi;
				delete from medicinale;
				delete from ditta_fornitrice;
			else 
				signal sqlstate '45010' set message_text ='Non sei autorizzato ad effettuare il reset.';
			end if;
            
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trova_posizione_scatole_da_medicinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trova_posizione_scatole_da_medicinale`(in var_nome_medicinale char(20))
BEGIN
			set transaction read only;
            start transaction;
					select id_scatola_medicinale,ditta,cassetto,scaffale
					from scatola_medicinali_info
					where var_nome_medicinale=medicinale;
            commit;
            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_indirizzi_ditta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_indirizzi_ditta`(in var_nome_ditta char(20))
BEGIN
		set transaction read only;
        start transaction;
				select*
				from indirizzo
				where nome_ditta=var_nome_ditta;
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_info_ditta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_info_ditta`(in var_nome_ditta char(20))
BEGIN
		set transaction read only;
        start transaction;
				select *
				from ditta_info
				where nome=var_nome_ditta;
        commit;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_info_medicinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_info_medicinale`(in var_nome_medicinale char(20))
BEGIN
		set transaction read only;
        start transaction;
				select *
				from medicinali_info
				where nome_medicinale=var_nome_medicinale;
        commit;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_info_scatola_medicinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_info_scatola_medicinale`(in var_id_scatola_medicinali int)
BEGIN
		set transaction read only;
        start transaction;
				select *
				from scatola_medicinali_info
				where id_scatola_medicinale= var_id_scatola_medicinali;
        commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_recapiti_ditta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_recapiti_ditta`(in var_nome_ditta char(20))
BEGIN
		set transaction read only;
        start transaction;
				select *
				from recapito
				where nome_ditta=var_nome_ditta;
        commit;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_usi_medicinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_usi_medicinale`(in var_nome_medicinale char(20), in var_nome_ditta char(20))
BEGIN
		set transaction read only;
        start transaction;
				select*
				from usi
				where var_nome_medicinale=nome_medicinale and var_nome_ditta=nome_ditta;
        commit;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ditta_info`
--

/*!50001 DROP VIEW IF EXISTS `ditta_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ditta_info` AS select `ditta_fornitrice`.`nome` AS `nome`,`indirizzo`.`via` AS `indirizzo`,`recapito`.`recapito` AS `recapito`,`recapito`.`tipo` AS `tipo`,`indirizzo`.`preferito` AS `contatti_preferiti` from ((`ditta_fornitrice` join `indirizzo` on((`ditta_fornitrice`.`nome` = `indirizzo`.`nome_ditta`))) join `recapito` on((`ditta_fornitrice`.`nome` = `recapito`.`nome_ditta`))) where ((`indirizzo`.`preferito` = 1) and (`recapito`.`preferito` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `medicinali_info`
--

/*!50001 DROP VIEW IF EXISTS `medicinali_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicinali_info` AS select `medicinale`.`nome` AS `nome_medicinale`,`medicinale`.`medicinale_mutuabile` AS `medicinale_mutuabile`,`medicinale`.`ricetta_medica` AS `ricetta_medica`,`medicinale`.`numero_scorte` AS `numero_scorte`,`medicinale`.`nome_ditta` AS `nome_ditta`,`indirizzo`.`via` AS `via_preferita_ditta`,`recapito`.`recapito` AS `recapito_preferito_ditta`,`recapito`.`tipo` AS `tipologia_recapito_della_ditta` from (((`medicinale` join `ditta_fornitrice` on((`medicinale`.`nome_ditta` = `ditta_fornitrice`.`nome`))) join `indirizzo` on((`ditta_fornitrice`.`nome` = `indirizzo`.`nome_ditta`))) join `recapito` on((`recapito`.`nome_ditta` = `ditta_fornitrice`.`nome`))) where ((`indirizzo`.`preferito` = 1) and (`recapito`.`preferito` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `scatola_medicinali_info`
--

/*!50001 DROP VIEW IF EXISTS `scatola_medicinali_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `scatola_medicinali_info` AS select `scatola_medicinali_non_vendute`.`id` AS `id_scatola_medicinale`,`scatola_medicinali_non_vendute`.`nome_medicinale` AS `medicinale`,`scatola_medicinali_non_vendute`.`nome_ditta` AS `ditta`,`scatola_medicinali_non_vendute`.`data_scadenza` AS `scadenza`,`medicinale`.`medicinale_mutuabile` AS `mutuabilità`,`medicinale`.`ricetta_medica` AS `necessità_ricetta`,`posizione`.`numero_cassetto` AS `cassetto`,`posizione`.`numero_scaffale` AS `scaffale` from ((`scatola_medicinali_non_vendute` join `medicinale` on(((`scatola_medicinali_non_vendute`.`nome_ditta` = `medicinale`.`nome_ditta`) and (`scatola_medicinali_non_vendute`.`nome_medicinale` = `medicinale`.`nome`)))) join `posizione` on((`posizione`.`Id_scatola_medicinale` = `scatola_medicinali_non_vendute`.`id`))) */;
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

/*!CREATE USER 'login_user'@'localhost' IDENTIFIED BY 'login_user'*/;
/*!GRANT SELECT,EXECUTE ON farmaciadb.* TO 'login_user'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.login TO 'login_user'@'localhost'*/;

/*!CREATE USER 'amministratore'@'localhost' IDENTIFIED BY 'amministratore'*/;
/*!GRANT SELECT, INSERT, DELETE, EXECUTE ON farmaciadb.* TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_ditta TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_indirizzo TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_medicinale TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_recapito TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_cassetto TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_scaffale TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_scatola_medicinali TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.inserisci_usi TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.visualizza_info_ditta TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.visualizza_info_medicinale TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.visualizza_recapiti_ditta TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.visualizza_indirizzi_ditta TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.visualizza_usi_medicinale TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.report_giacenza_magazzino TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.report_medicinali_in_scadenza TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.assegna_usi_medicinale TO 'amministratore'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.elimina_scatola_medicinali TO 'amministratore'@'localhost'*/;

/*!CREATE USER 'personale_medico'@'localhost' IDENTIFIED BY 'personale_medico'*/;
/*!GRANT SELECT, EXECUTE ON farmaciadb.* TO 'personale_medico'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.effettua_vendita TO 'personale_medico'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.effettua_vendita_con_codice_fiscale TO 'personale_medico'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.trova_posizione_scatole_da_medicinale TO 'personale_medico'@'localhost'*/;
/*!GRANT EXECUTE ON PROCEDURE farmaciadb.visualizza_info_scatola_medicinale TO 'personale_medico'@'localhost'*/;

-- Dump completed on 2024-03-13 11:22:42
