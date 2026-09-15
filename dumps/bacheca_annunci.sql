CREATE DATABASE  IF NOT EXISTS `bacheca_annunci` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bacheca_annunci`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: bacheca_annunci
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `amministratore`
--

DROP TABLE IF EXISTS `amministratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amministratore` (
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cognome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DataNascita` date NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `fk_amministratore_credenziali` FOREIGN KEY (`Username`) REFERENCES `credenziali` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amministratore`
--

LOCK TABLES `amministratore` WRITE;
/*!40000 ALTER TABLE `amministratore` DISABLE KEYS */;
INSERT INTO `amministratore` VALUES ('admin1','Matteo','Masini','2002-02-15'),('admin2','Thomas','Masini','2003-10-16');
/*!40000 ALTER TABLE `amministratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `annunci_venduti`
--

DROP TABLE IF EXISTS `annunci_venduti`;
/*!50001 DROP VIEW IF EXISTS `annunci_venduti`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `annunci_venduti` AS SELECT 
 1 AS `IdAnnuncio`,
 1 AS `Titolo`,
 1 AS `Descrizione`,
 1 AS `Prezzo`,
 1 AS `DataPubblicazione`,
 1 AS `Autore`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `annuncio`
--

DROP TABLE IF EXISTS `annuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annuncio` (
  `IdAnnuncio` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descrizione` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prezzo` decimal(10,2) unsigned NOT NULL,
  `DataPubblicazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Venduto` tinyint(1) NOT NULL DEFAULT '0',
  `Autore` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Categoria` int NOT NULL,
  PRIMARY KEY (`IdAnnuncio`),
  KEY `fk_annuncio_utente` (`Autore`),
  KEY `fk_annuncio_categoria` (`Categoria`),
  CONSTRAINT `fk_annuncio_categoria` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`IdCategoria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_annuncio_utente` FOREIGN KEY (`Autore`) REFERENCES `utente_standard` (`Username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annuncio`
--

LOCK TABLES `annuncio` WRITE;
/*!40000 ALTER TABLE `annuncio` DISABLE KEYS */;
INSERT INTO `annuncio` VALUES (1,'Toyota Yaris Cross','Motore 1.2 a benzina',12000.00,'2026-09-05 21:51:56',1,'utente1',1),(2,'Jeans skinny','Vendo jeans Levis',25.00,'2026-09-05 21:59:06',0,'utente2',3),(3,'Aixam macchinetta','Vendo macchinetta aixam per inutilizzo',8000.00,'2026-09-06 13:40:52',1,'utente1',2),(4,'Chiavetta USB','Vendo chiavetta USB per inutilizzo.',7.00,'2026-09-07 13:07:34',0,'utente2',18),(5,'Chiavetta USB Lenovo','Vendo chiavetta USB Lenovo per inutilizzo',15.00,'2026-09-07 13:08:46',0,'utente2',17),(6,'Chiavetta USB Lenovo','Vendo chiavetta USB Lenovo per inutilizzo',10.00,'2026-09-07 13:09:43',1,'utente2',18),(7,'Clarinetto SiB Alysee','Vendo clarinetto in ottime condizioni, prezzo trattabile.',300.00,'2026-09-07 20:03:01',0,'utente1',5),(8,'Lenovo thinkpad 16 gb RAM','Vendo computer causa passaggio a modello successivo',500.00,'2026-09-08 18:54:18',1,'utente3',16),(9,'Sassofono','Vendo sassofono per inutilizzo, prezzo trattabile.',300.00,'2026-09-08 18:55:02',0,'utente3',4);
/*!40000 ALTER TABLE `annuncio` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `blocco_annunci_venduti_update` BEFORE UPDATE ON `annuncio` FOR EACH ROW BEGIN
    IF OLD.Venduto = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile modificare un annuncio contrassegnato come venduto.';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notifica_modifica_annuncio_update` AFTER UPDATE ON `annuncio` FOR EACH ROW BEGIN
    IF NEW.Venduto = 0 AND (OLD.Titolo <> NEW.Titolo OR OLD.Descrizione <> NEW.Descrizione OR OLD.Prezzo <> NEW.Prezzo) THEN
        UPDATE `Monitoraggio`
        SET `Notificato` = 1
        WHERE `IdAnnuncio` = NEW.IdAnnuncio;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rimuovi_monitoraggio_dopo_vendita` AFTER UPDATE ON `annuncio` FOR EACH ROW BEGIN
    IF NEW.Venduto = 1 AND OLD.Venduto = 0 THEN
        DELETE FROM `Monitoraggio` 
        WHERE `IdAnnuncio` = NEW.IdAnnuncio;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `bacheca_pubblica`
--

DROP TABLE IF EXISTS `bacheca_pubblica`;
/*!50001 DROP VIEW IF EXISTS `bacheca_pubblica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bacheca_pubblica` AS SELECT 
 1 AS `IdAnnuncio`,
 1 AS `Titolo`,
 1 AS `Descrizione`,
 1 AS `Prezzo`,
 1 AS `DataPubblicazione`,
 1 AS `Autore`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Padre` int DEFAULT NULL,
  `Amministratore` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdCategoria`),
  UNIQUE KEY `uq_nome_categoria` (`NomeCategoria`),
  KEY `fk_categoria_padre` (`Padre`),
  KEY `fk_categoria_amministratore` (`Amministratore`),
  CONSTRAINT `fk_categoria_amministratore` FOREIGN KEY (`Amministratore`) REFERENCES `amministratore` (`Username`) ON UPDATE CASCADE,
  CONSTRAINT `fk_categoria_padre` FOREIGN KEY (`Padre`) REFERENCES `categoria` (`IdCategoria`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Automobili',NULL,'admin1'),(2,'Macchinette',1,'admin1'),(3,'Abbigliamento',NULL,'admin1'),(4,'Strumenti musicali',NULL,'admin1'),(5,'Clarinetti',4,'admin2'),(6,'Becchino',5,'admin2'),(15,'Informatica',NULL,'admin1'),(16,'Computer',15,'admin1'),(17,'Mouse',16,'admin1'),(18,'Chiavetta USB',16,'admin1');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `controllo_ciclicita_categoria_insert` BEFORE INSERT ON `categoria` FOR EACH ROW BEGIN
    IF NEW.Padre IS NOT NULL AND NEW.IdCategoria IS NOT NULL AND NEW.Padre = NEW.IdCategoria THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Una categoria non puo essere padre di se stessa.';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `controllo_ciclicita_categoria_update` BEFORE UPDATE ON `categoria` FOR EACH ROW BEGIN
    DECLARE v_cursore_padre INT;
    
    IF NEW.Padre IS NOT NULL AND NEW.Padre = NEW.IdCategoria THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Una categoria non puo essere padre di se stessa.';
    END IF;
    
    SET v_cursore_padre = NEW.Padre;
    WHILE v_cursore_padre IS NOT NULL DO
        IF v_cursore_padre = NEW.IdCategoria THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Rilevato ciclo nella gerarchia delle categorie.';
        END IF;
        
        SELECT `Padre` INTO v_cursore_padre
        FROM `Categoria`
        WHERE `IdCategoria` = v_cursore_padre;
    END WHILE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `commento`
--

DROP TABLE IF EXISTS `commento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commento` (
  `Commentatore` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DataOra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Testo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Annuncio` int NOT NULL,
  PRIMARY KEY (`Commentatore`,`DataOra`),
  KEY `fk_commento_annuncio` (`Annuncio`),
  CONSTRAINT `fk_commento_annuncio` FOREIGN KEY (`Annuncio`) REFERENCES `annuncio` (`IdAnnuncio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_commento_utente` FOREIGN KEY (`Commentatore`) REFERENCES `utente_standard` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commento`
--

LOCK TABLES `commento` WRITE;
/*!40000 ALTER TABLE `commento` DISABLE KEYS */;
INSERT INTO `commento` VALUES ('utente1','2026-09-05 22:15:22','Bellissimo jeans, consiglio a tutti!',2),('utente1','2026-09-07 19:36:33','Ottima chiavetta, consiglio a tutti!',4),('utente1','2026-09-07 20:43:50','5 stelle!!',4),('utente3','2026-09-08 18:57:27','Sembra una chiavetta molto funzionale, è da prendere assolutamente!',5),('utente3','2026-09-08 19:02:19','Utente che vende questo bene è gentilissimo!!',5);
/*!40000 ALTER TABLE `commento` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `controllo_commento_insert` BEFORE INSERT ON `commento` FOR EACH ROW BEGIN
    DECLARE v_autore VARCHAR(50);
    DECLARE v_venduto TINYINT(1);
    
    SELECT `Autore`, `Venduto` INTO v_autore, v_venduto
    FROM `Annuncio`
    WHERE `IdAnnuncio` = NEW.Annuncio;
    
    IF v_venduto = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile commentare un annuncio gia contrassegnato come venduto.';
    END IF;
    
    IF NEW.Commentatore = v_autore THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L autore dell annuncio non puo inserire commenti sui propri annunci.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contatto`
--

DROP TABLE IF EXISTS `contatto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contatto` (
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tipo` enum('email','telefono','cellulare') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Valore` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Preferito` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`,`Tipo`,`Valore`),
  CONSTRAINT `fk_contatto_utente` FOREIGN KEY (`Username`) REFERENCES `utente_standard` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contatto`
--

LOCK TABLES `contatto` WRITE;
/*!40000 ALTER TABLE `contatto` DISABLE KEYS */;
INSERT INTO `contatto` VALUES ('utente1','email','matteomasini02@gmail.com',1),('utente1','telefono','333',0),('utente2','email','fili@gmail.com',1),('utente2','email','filipposavi@tiscali.it',0),('utente3','email','thomasmasini@gmail.com',1);
/*!40000 ALTER TABLE `contatto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `controllo_contatto_delete` BEFORE DELETE ON `contatto` FOR EACH ROW BEGIN
    DECLARE v_totale_contatti INT;
    
    SELECT COUNT(*) INTO v_totale_contatti
    FROM `Contatto`
    WHERE `Username` = OLD.Username;
    
    IF v_totale_contatti <= 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile eliminare l unico recapito di contatto memorizzato.';
    END IF;
    
    IF OLD.Preferito = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile eliminare il contatto preferito. Designare prima un altro preferito.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `credenziali`
--

DROP TABLE IF EXISTS `credenziali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenziali` (
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ruolo` enum('standard','amministratore') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenziali`
--

LOCK TABLES `credenziali` WRITE;
/*!40000 ALTER TABLE `credenziali` DISABLE KEYS */;
INSERT INTO `credenziali` VALUES ('admin1','ebcfc99aa881883fd9a06b78b50b140df65f2794470e444d57470345dacdb536','amministratore'),('admin2','804da2dbc2b9d7331b319995b78feca56572aad00243db0f2b10beba4c224d29','amministratore'),('utente1','edf09fe17a5771f479d065c2f06a52bb980bd97f714a7b26a6580535e09946b1','standard'),('utente2','b1ccee3074c91b216ebfb42429c01cd32deb158545119a2c5707126afb6963b6','standard'),('utente3','86f5ffafae69676e571ce6ebc90d7c9eb4a4ee75feb29e7de29bb597f21d8f52','standard');
/*!40000 ALTER TABLE `credenziali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaggio`
--

DROP TABLE IF EXISTS `messaggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaggio` (
  `Mittente` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DataOra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Testo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Annuncio` int NOT NULL,
  `Destinatario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Mittente`,`DataOra`),
  KEY `fk_messaggio_destinatario` (`Destinatario`),
  KEY `fk_messaggio_annuncio` (`Annuncio`),
  CONSTRAINT `fk_messaggio_annuncio` FOREIGN KEY (`Annuncio`) REFERENCES `annuncio` (`IdAnnuncio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_messaggio_destinatario` FOREIGN KEY (`Destinatario`) REFERENCES `utente_standard` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_messaggio_mittente` FOREIGN KEY (`Mittente`) REFERENCES `utente_standard` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggio`
--

LOCK TABLES `messaggio` WRITE;
/*!40000 ALTER TABLE `messaggio` DISABLE KEYS */;
INSERT INTO `messaggio` VALUES ('utente1','2026-09-05 22:13:10','Me lo venderesti a 25?',2,'utente2'),('utente1','2026-09-07 19:36:54','Me la venderesti a 8?',4,'utente2'),('utente1','2026-09-07 20:45:08','è ancora in vendita?',4,'utente2'),('utente1','2026-09-08 19:07:07','Te lo compro subito, pagamento immediato!',5,'utente2'),('utente2','2026-09-05 22:13:59','Si, va benissimo',2,'utente1'),('utente2','2026-09-08 19:00:32','Si, molto volentieri, non è un problema. Sono disposto a scendere massimo a 12',5,'utente3'),('utente3','2026-09-08 18:58:05','Me la potrebbe spedire? A quanto è disposto a scendere?',5,'utente2'),('utente3','2026-09-08 19:01:42','Allora lo acquisto, grazie mille dell\'informazione.',5,'utente2');
/*!40000 ALTER TABLE `messaggio` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `controllo_messaggio_insert` BEFORE INSERT ON `messaggio` FOR EACH ROW BEGIN
    DECLARE v_autore VARCHAR(50);
    DECLARE v_venduto TINYINT(1);
    
    IF NEW.Mittente = NEW.Destinatario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Un utente non puo inviare messaggi privati a se stesso.';
    END IF;
    
    SELECT `Autore`, `Venduto` INTO v_autore, v_venduto
    FROM `Annuncio`
    WHERE `IdAnnuncio` = NEW.Annuncio;
    
    IF v_venduto = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile inviare messaggi per un annuncio gia venduto.';
    END IF;
    
    IF NEW.Mittente <> v_autore AND NEW.Destinatario <> v_autore THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Uno tra mittente e destinatario deve essere l autore dell annuncio.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `monitoraggio`
--

DROP TABLE IF EXISTS `monitoraggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoraggio` (
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdAnnuncio` int NOT NULL,
  `Notificato` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`,`IdAnnuncio`),
  KEY `fk_monitoraggio_annuncio` (`IdAnnuncio`),
  CONSTRAINT `fk_monitoraggio_annuncio` FOREIGN KEY (`IdAnnuncio`) REFERENCES `annuncio` (`IdAnnuncio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_monitoraggio_utente` FOREIGN KEY (`Username`) REFERENCES `utente_standard` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoraggio`
--

LOCK TABLES `monitoraggio` WRITE;
/*!40000 ALTER TABLE `monitoraggio` DISABLE KEYS */;
INSERT INTO `monitoraggio` VALUES ('utente1',2,0),('utente1',4,0),('utente3',5,0);
/*!40000 ALTER TABLE `monitoraggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente_standard`
--

DROP TABLE IF EXISTS `utente_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente_standard` (
  `Username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cognome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DataNascita` date NOT NULL,
  `IndResidenza` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IndFatturazione` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `fk_utente_standard_credenziali` FOREIGN KEY (`Username`) REFERENCES `credenziali` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente_standard`
--

LOCK TABLES `utente_standard` WRITE;
/*!40000 ALTER TABLE `utente_standard` DISABLE KEYS */;
INSERT INTO `utente_standard` VALUES ('utente1','Matteo','Masini','2002-02-15','Roma','Roma'),('utente2','Filippo','Savi','2002-07-31','Roma','Roma'),('utente3','Thomas','Masini','2003-10-16','Roma','Roma');
/*!40000 ALTER TABLE `utente_standard` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `default_fatturazione_insert` BEFORE INSERT ON `utente_standard` FOR EACH ROW BEGIN
    IF NEW.IndFatturazione IS NULL OR TRIM(NEW.IndFatturazione) = '' THEN
        SET NEW.IndFatturazione = NEW.IndResidenza;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'bacheca_annunci'
--
/*!50003 DROP PROCEDURE IF EXISTS `annuncio_venduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `annuncio_venduto`(
    IN p_id_annuncio INT,
    IN p_autore VARCHAR(50)
)
BEGIN
    DECLARE v_autore_effettivo VARCHAR(50);
    DECLARE v_venduto TINYINT(1);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT `Autore`, `Venduto` 
    INTO v_autore_effettivo, v_venduto
    FROM `Annuncio`
    WHERE `IdAnnuncio` = p_id_annuncio;

    IF v_autore_effettivo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Annuncio inesistente.';
    END IF;

    IF v_autore_effettivo <> p_autore THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Operazione non consentita: solo l autore puo contrassegnare l annuncio come venduto.';
    END IF;

    IF v_venduto = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L annuncio risulta gia contrassegnato come venduto.';
    END IF;

    UPDATE `Annuncio`
    SET `Venduto` = 1
    WHERE `IdAnnuncio` = p_id_annuncio;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crea_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crea_categoria`(
    IN p_nome_categoria VARCHAR(50),
    IN p_padre INT,
    IN p_amministratore VARCHAR(50),
    OUT p_id_categoria INT
)
BEGIN
    DECLARE v_cursore_padre INT;
    DECLARE v_nome_padre VARCHAR(50);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM `Amministratore` WHERE `Username` = p_amministratore) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Operazione riservata esclusivamente agli amministratori del sistema.';
    END IF;

    IF EXISTS (SELECT 1 FROM `Categoria` WHERE LOWER(`NomeCategoria`) = LOWER(p_nome_categoria)) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nome categoria gia presente a sistema.';
    END IF;

    -- Verifica e controllo ciclicità sulla gerarchia del padre
    IF p_padre IS NOT NULL THEN
        -- 1. Il padre deve esistere
        SELECT `NomeCategoria` INTO v_nome_padre
        FROM `Categoria`
        WHERE `IdCategoria` = p_padre;

        IF v_nome_padre IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La categoria genitore specificata non esiste.';
        END IF;

        IF LOWER(v_nome_padre) = LOWER(p_nome_categoria) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Una categoria non puo essere definita come sottocategoria di se stessa.';
        END IF;

        SET v_cursore_padre = p_padre;
        WHILE v_cursore_padre IS NOT NULL DO
            SELECT `Padre`, `NomeCategoria` INTO v_cursore_padre, v_nome_padre
            FROM `Categoria`
            WHERE `IdCategoria` = v_cursore_padre;

            IF v_nome_padre IS NOT NULL AND LOWER(v_nome_padre) = LOWER(p_nome_categoria) THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Rilevato ciclo nella gerarchia dei padri: una categoria non puo essere sottocategoria di se stessa.';
            END IF;
        END WHILE;
    END IF;

    INSERT INTO `Categoria` (`NomeCategoria`, `Padre`, `Amministratore`)
    VALUES (p_nome_categoria, p_padre, p_amministratore);

    SET p_id_categoria = LAST_INSERT_ID();

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `genera_report_vendite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `genera_report_vendite`(
    IN p_amministratore VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM `Amministratore` WHERE `Username` = p_amministratore) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Operazione consentita solo agli amministratori.';
    END IF;

    SELECT 
        u.`Username`,
        u.`Nome`,
        u.`Cognome`,
        COUNT(a.`IdAnnuncio`) AS `TotaleAnnunci`,
        COUNT(av.`IdAnnuncio`) AS `AnnunciVenduti`,
        ROUND(
            CASE 
                WHEN COUNT(a.`IdAnnuncio`) = 0 THEN 0.00
                ELSE (COUNT(av.`IdAnnuncio`) * 100.0 / COUNT(a.`IdAnnuncio`))
            END, 2
        ) AS `PercentualeSuccessoVendita`
    FROM `Utente_Standard` u
    LEFT JOIN `Annuncio` a ON u.`Username` = a.`Autore`
    LEFT JOIN `annunci_venduti` av ON a.`IdAnnuncio` = av.`IdAnnuncio`
    GROUP BY u.`Username`, u.`Nome`, u.`Cognome`;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `imposta_contatto_preferito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `imposta_contatto_preferito`(
    IN p_username VARCHAR(50),
    IN p_tipo ENUM('email', 'telefono', 'cellulare'),
    IN p_valore VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF NOT EXISTS (
        SELECT 1 FROM `Contatto` 
        WHERE `Username` = p_username AND `Tipo` = p_tipo AND `Valore` = p_valore
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recapito di contatto specificato non trovato.';
    END IF;

    UPDATE `Contatto`
    SET `Preferito` = 0
    WHERE `Username` = p_username;

    UPDATE `Contatto`
    SET `Preferito` = 1
    WHERE `Username` = p_username AND `Tipo` = p_tipo AND `Valore` = p_valore;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `invio_commento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `invio_commento`(
    IN p_commentatore VARCHAR(50),
    IN p_id_annuncio INT,
    IN p_testo TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF TRIM(IFNULL(p_testo, '')) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Il testo del commento non puo essere vuoto.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM `Utente_Standard` WHERE `Username` = p_commentatore) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Utente commentatore non valido o inesistente.';
    END IF;

    INSERT INTO `Commento` (`Commentatore`, `DataOra`, `Testo`, `Annuncio`)
    VALUES (p_commentatore, CURRENT_TIMESTAMP, p_testo, p_id_annuncio);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `invio_messaggio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `invio_messaggio`(
    IN p_mittente VARCHAR(50),
    IN p_destinatario VARCHAR(50),
    IN p_id_annuncio INT,
    IN p_testo TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF TRIM(IFNULL(p_testo, '')) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Il testo del messaggio non puo essere vuoto.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM `Utente_Standard` WHERE `Username` = p_mittente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mittente non valido o inesistente.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM `Utente_Standard` WHERE `Username` = p_destinatario) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Destinatario non valido o inesistente.';
    END IF;

    INSERT INTO `Messaggio` (`Mittente`, `Destinatario`, `DataOra`, `Testo`, `Annuncio`)
    VALUES (p_mittente, p_destinatario, CURRENT_TIMESTAMP, p_testo, p_id_annuncio);

    COMMIT;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    OUT p_ruolo ENUM('standard', 'amministratore')
)
BEGIN
    DECLARE v_password_hash VARCHAR(255);
    DECLARE v_ruolo ENUM('standard', 'amministratore');

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT `Password`, `Ruolo` 
    INTO v_password_hash, v_ruolo
    FROM `Credenziali` 
    WHERE `Username` = p_username;

    IF v_password_hash IS NULL OR v_password_hash <> SHA2(p_password, 256) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Credenziali non valide.';
    END IF;

    SET p_ruolo = v_ruolo;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifica_annuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_annuncio`(
    IN p_id_annuncio INT,
    IN p_autore VARCHAR(50),
    IN p_nuovo_titolo VARCHAR(100),
    IN p_nuova_descrizione TEXT,
    IN p_nuovo_prezzo DECIMAL(10,2)
)
BEGIN
    DECLARE v_autore_effettivo VARCHAR(50);
    DECLARE v_venduto TINYINT(1);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF p_nuovo_prezzo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Il prezzo dell annuncio non puo essere negativo.';
    END IF;

    SELECT `Autore`, `Venduto` 
    INTO v_autore_effettivo, v_venduto
    FROM `Annuncio`
    WHERE `IdAnnuncio` = p_id_annuncio;

    IF v_autore_effettivo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Annuncio inesistente.';
    END IF;

    IF v_autore_effettivo <> p_autore THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Operazione non consentita: solo l autore puo modificare il proprio annuncio.';
    END IF;

    IF v_venduto = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile modificare un annuncio contrassegnato come venduto.';
    END IF;

    UPDATE `Annuncio`
    SET `Titolo` = p_nuovo_titolo,
        `Descrizione` = p_nuova_descrizione,
        `Prezzo` = p_nuovo_prezzo
    WHERE `IdAnnuncio` = p_id_annuncio;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `monitora_annuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `monitora_annuncio`(
    IN p_username VARCHAR(50),
    IN p_id_annuncio INT
)
BEGIN
    DECLARE v_venduto TINYINT(1);
    DECLARE v_autore VARCHAR(50);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM `Utente_Standard` WHERE `Username` = p_username) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Utente specificato non valido o inesistente.';
    END IF;

    SELECT `Venduto`, `Autore` INTO v_venduto, v_autore
    FROM `Annuncio`
    WHERE `IdAnnuncio` = p_id_annuncio;

    IF v_venduto IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Annuncio inesistente.';
    END IF;

    IF v_venduto = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Impossibile monitorare un annuncio gia venduto.';
    END IF;

    IF v_autore = p_username THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Non e consentito monitorare i propri annunci.';
    END IF;

    IF EXISTS (SELECT 1 FROM `Monitoraggio` WHERE `Username` = p_username AND `IdAnnuncio` = p_id_annuncio) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'L annuncio risulta gia monitorato da questo utente.';
    END IF;

    INSERT INTO `Monitoraggio` (`Username`, `IdAnnuncio`, `Notificato`)
    VALUES (p_username, p_id_annuncio, 0);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pubblicazione_annuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pubblicazione_annuncio`(
    IN p_titolo VARCHAR(100),
    IN p_descrizione TEXT,
    IN p_prezzo DECIMAL(10,2),
    IN p_autore VARCHAR(50),
    IN p_categoria INT,
    OUT p_id_annuncio INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF p_prezzo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Il prezzo dell annuncio non puo essere negativo.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM `Utente_Standard` WHERE `Username` = p_autore) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Autore specificato non valido o inesistente.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM `Categoria` WHERE `IdCategoria` = p_categoria) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Categoria specificata inesistente.';
    END IF;

    INSERT INTO `Annuncio` (`Titolo`, `Descrizione`, `Prezzo`, `Autore`, `Categoria`, `Venduto`)
    VALUES (p_titolo, p_descrizione, p_prezzo, p_autore, p_categoria, 0);

    SET p_id_annuncio = LAST_INSERT_ID();

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrazione_amministratore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrazione_amministratore`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_nome VARCHAR(50),
    IN p_cognome VARCHAR(50),
    IN p_data_nascita DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF EXISTS (SELECT 1 FROM `Credenziali` WHERE `Username` = p_username) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Username gia in uso.';
    END IF;

    INSERT INTO `Credenziali` (`Username`, `Password`, `Ruolo`)
    VALUES (p_username, SHA2(p_password, 256), 'amministratore');

    INSERT INTO `Amministratore` (`Username`, `Nome`, `Cognome`, `DataNascita`)
    VALUES (p_username, p_nome, p_cognome, p_data_nascita);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrazione_contatto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrazione_contatto`(
    IN p_username VARCHAR(50),
    IN p_tipo ENUM('email', 'telefono', 'cellulare'),
    IN p_valore VARCHAR(100),
    IN p_preferito TINYINT(1)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM `Utente_Standard` WHERE `Username` = p_username) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Utente standard non valido o inesistente.';
    END IF;

    IF EXISTS (
        SELECT 1 FROM `Contatto` 
        WHERE `Username` = p_username AND `Tipo` = p_tipo AND `Valore` = p_valore
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recapito di contatto gia presente per questo utente.';
    END IF;

    IF p_preferito = 1 THEN
        UPDATE `Contatto`
        SET `Preferito` = 0
        WHERE `Username` = p_username AND `Preferito` = 1;
    END IF;

    INSERT INTO `Contatto` (`Username`, `Tipo`, `Valore`, `Preferito`)
    VALUES (p_username, p_tipo, p_valore, IFNULL(p_preferito, 0));

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrazione_utente_standard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrazione_utente_standard`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_nome VARCHAR(50),
    IN p_cognome VARCHAR(50),
    IN p_data_nascita DATE,
    IN p_ind_residenza VARCHAR(100),
    IN p_ind_fatturazione VARCHAR(100),
    IN p_contatto_valore VARCHAR(100),
    IN p_contatto_tipo ENUM('email', 'telefono', 'cellulare')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF EXISTS (SELECT 1 FROM `Credenziali` WHERE `Username` = p_username) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Username gia in uso.';
    END IF;

    INSERT INTO `Credenziali` (`Username`, `Password`, `Ruolo`)
    VALUES (p_username, SHA2(p_password, 256), 'standard');

    INSERT INTO `Utente_Standard` (`Username`, `Nome`, `Cognome`, `DataNascita`, `IndResidenza`, `IndFatturazione`)
    VALUES (p_username, p_nome, p_cognome, p_data_nascita, p_ind_residenza, p_ind_fatturazione);

    INSERT INTO `Contatto` (`Username`, `Tipo`, `Valore`, `Preferito`)
    VALUES (p_username, p_contatto_tipo, p_contatto_valore, 1);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resetta_flag_notifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetta_flag_notifica`(
    IN p_username VARCHAR(50),
    IN p_id_annuncio INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    START TRANSACTION;

    IF p_id_annuncio IS NOT NULL THEN
        UPDATE `Monitoraggio`
        SET `Notificato` = 0
        WHERE `Username` = p_username AND `IdAnnuncio` = p_id_annuncio;
    ELSE
        UPDATE `Monitoraggio`
        SET `Notificato` = 0
        WHERE `Username` = p_username;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rimuovi_contatto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rimuovi_contatto`(
    IN p_username VARCHAR(50),
    IN p_tipo ENUM('email', 'telefono', 'cellulare'),
    IN p_valore VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    IF NOT EXISTS (
        SELECT 1 FROM `Contatto` 
        WHERE `Username` = p_username AND `Tipo` = p_tipo AND `Valore` = p_valore
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Recapito di contatto non trovato.';
    END IF;

    DELETE FROM `Contatto`
    WHERE `Username` = p_username AND `Tipo` = p_tipo AND `Valore` = p_valore;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verifica_annunci_modificati` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifica_annunci_modificati`(
    IN p_username VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT 
        a.`IdAnnuncio`,
        a.`Titolo`,
        a.`Prezzo`,
        a.`Autore`
    FROM `Monitoraggio` m
    JOIN `Annuncio` a ON m.`IdAnnuncio` = a.`IdAnnuncio`
    WHERE m.`Username` = p_username AND m.`Notificato` = 1;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_annunci_monitorati` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_annunci_monitorati`(
    IN p_username VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    START TRANSACTION;

    SELECT 
        a.`IdAnnuncio`,
        a.`Titolo`,
        a.`Descrizione`,
        a.`Prezzo`,
        a.`DataPubblicazione`,
        a.`Autore`,
        c.`NomeCategoria` AS `Categoria`,
        m.`Notificato`
    FROM `Monitoraggio` m
    JOIN `Annuncio` a ON m.`IdAnnuncio` = a.`IdAnnuncio`
    JOIN `Categoria` c ON a.`Categoria` = c.`IdCategoria`
    WHERE m.`Username` = p_username;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_annunci_non_venduti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_annunci_non_venduti`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT 
        `IdAnnuncio`,
        `Titolo`,
        `Descrizione`,
        `Prezzo`,
        `DataPubblicazione`,
        `Autore`,
        `Categoria`
    FROM `bacheca_pubblica`
    ORDER BY `DataPubblicazione` DESC;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_annunci_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_annunci_utente`(
    IN p_username VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT 
        a.`IdAnnuncio`,
        a.`Titolo`,
        a.`Descrizione`,
        a.`Prezzo`,
        a.`DataPubblicazione`,
        a.`Venduto`,
        c.`NomeCategoria` AS `Categoria`
    FROM `Annuncio` a
    JOIN `Categoria` c ON a.`Categoria` = c.`IdCategoria`
    WHERE a.`Autore` = p_username
    ORDER BY a.`DataPubblicazione` DESC;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_commenti_annuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_commenti_annuncio`(
    IN p_id_annuncio INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT 
        `Commentatore`,
        `DataOra`,
        `Testo`
    FROM `Commento`
    WHERE `Annuncio` = p_id_annuncio
    ORDER BY `DataOra` ASC;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_messaggi_annuncio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_messaggi_annuncio`(
    IN p_id_annuncio INT,
    IN p_richiedente VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT 
        m.`Mittente`,
        m.`Destinatario`,
        m.`DataOra`,
        m.`Testo`
    FROM `Messaggio` m
    WHERE m.`Annuncio` = p_id_annuncio 
      AND (m.`Mittente` = p_richiedente OR m.`Destinatario` = p_richiedente)
    ORDER BY m.`DataOra` ASC;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_tutte_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_tutte_categorie`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;

    SELECT 
        c.`IdCategoria`,
        c.`NomeCategoria`,
        c.`Padre` AS `IdPadre`,
        p.`NomeCategoria` AS `NomePadre`,
        c.`Amministratore` AS `CreatoDa`
    FROM `Categoria` c
    LEFT JOIN `Categoria` p ON c.`Padre` = p.`IdCategoria`
    ORDER BY c.`IdCategoria` ASC;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `annunci_venduti`
--

/*!50001 DROP VIEW IF EXISTS `annunci_venduti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `annunci_venduti` AS select `annuncio`.`IdAnnuncio` AS `IdAnnuncio`,`annuncio`.`Titolo` AS `Titolo`,`annuncio`.`Descrizione` AS `Descrizione`,`annuncio`.`Prezzo` AS `Prezzo`,`annuncio`.`DataPubblicazione` AS `DataPubblicazione`,`annuncio`.`Autore` AS `Autore`,`annuncio`.`Categoria` AS `Categoria` from `annuncio` where (`annuncio`.`Venduto` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bacheca_pubblica`
--

/*!50001 DROP VIEW IF EXISTS `bacheca_pubblica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bacheca_pubblica` AS select `a`.`IdAnnuncio` AS `IdAnnuncio`,`a`.`Titolo` AS `Titolo`,`a`.`Descrizione` AS `Descrizione`,`a`.`Prezzo` AS `Prezzo`,`a`.`DataPubblicazione` AS `DataPubblicazione`,`a`.`Autore` AS `Autore`,`c`.`NomeCategoria` AS `Categoria` from (`annuncio` `a` join `categoria` `c` on((`a`.`Categoria` = `c`.`IdCategoria`))) where (`a`.`Venduto` = 0) */;
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

-- Dump completed on 2026-09-08 21:14:12
