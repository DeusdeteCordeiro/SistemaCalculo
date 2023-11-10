-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_de_dados_calculo
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calculo`
--

DROP TABLE IF EXISTS `calculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculo` (
  `SEQ` int NOT NULL,
  `ID` int NOT NULL,
  `ID_CLIENTE` int DEFAULT NULL,
  `ID_INDICE` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `HISTORICO` varchar(500) DEFAULT NULL,
  `DEBITO` decimal(10,2) DEFAULT NULL,
  `CREDITO` decimal(10,2) DEFAULT NULL,
  `SALDO` decimal(10,2) DEFAULT NULL,
  `TAXA_JURO` decimal(10,2) DEFAULT NULL,
  `DIAS` int DEFAULT NULL,
  `VALOR_JURO` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SEQ`,`ID`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  KEY `ID_INDICE` (`ID_INDICE`),
  CONSTRAINT `calculo_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`id`),
  CONSTRAINT `calculo_ibfk_2` FOREIGN KEY (`ID_INDICE`) REFERENCES `indice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculo`
--

LOCK TABLES `calculo` WRITE;
/*!40000 ALTER TABLE `calculo` DISABLE KEYS */;
INSERT INTO `calculo` VALUES (1,1,1,NULL,'2023-01-01','SALDO INICIAL',20578.73,NULL,-20578.73,NULL,1,-9.22),(2,1,1,NULL,'2023-01-02','IOC',114.06,NULL,-28692.79,NULL,1,-9.26),(3,1,1,NULL,'2023-01-03','CHEQUE',6372.17,NULL,-35064.96,NULL,3,-33.93),(4,1,1,NULL,'2023-01-06','DEPÓSITO',NULL,125438.00,90373.04,NULL,27,NULL);
/*!40000 ALTER TABLE `calculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf_cnpj` varchar(20) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'José','1111','123456'),(2,'João','2222',NULL),(3,'Maria','3333','123132');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexador`
--

DROP TABLE IF EXISTS `indexador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indexador` (
  `id` int NOT NULL,
  `nome_indexador` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexador`
--

LOCK TABLES `indexador` WRITE;
/*!40000 ALTER TABLE `indexador` DISABLE KEYS */;
INSERT INTO `indexador` VALUES (1,'IGPM'),(2,'IPCA');
/*!40000 ALTER TABLE `indexador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indice`
--

DROP TABLE IF EXISTS `indice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indice` (
  `id` int NOT NULL,
  `id_indexador` int NOT NULL,
  `mes` int NOT NULL,
  `ano` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_indexador` (`id_indexador`),
  CONSTRAINT `indice_ibfk_1` FOREIGN KEY (`id_indexador`) REFERENCES `indexador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indice`
--

LOCK TABLES `indice` WRITE;
/*!40000 ALTER TABLE `indice` DISABLE KEYS */;
INSERT INTO `indice` VALUES (1,1,1,2023,0.05),(2,2,1,2023,0.01);
/*!40000 ALTER TABLE `indice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'banco_de_dados_calculo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-10 11:04:58
