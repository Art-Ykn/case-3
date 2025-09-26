CREATE DATABASE  IF NOT EXISTS `turizm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `turizm`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: turizm
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `заказы_туров`
--

DROP TABLE IF EXISTS `заказы_туров`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказы_туров` (
  `ID_заказа` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_клиента` int unsigned NOT NULL,
  `ID_страны` int unsigned NOT NULL,
  `ID_типа` int unsigned NOT NULL,
  `ID_агентства` int unsigned NOT NULL,
  `Дата_отправления` date NOT NULL,
  `Продолжительность_дней` int unsigned NOT NULL,
  `Стоимость` decimal(10,2) NOT NULL,
  `Дата_оформления` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_заказа`),
  KEY `ID_клиента` (`ID_клиента`),
  KEY `ID_страны` (`ID_страны`),
  KEY `ID_типа` (`ID_типа`),
  KEY `ID_агентства` (`ID_агентства`),
  CONSTRAINT `заказы_туров_ibfk_1` FOREIGN KEY (`ID_клиента`) REFERENCES `клиенты` (`ID_клиента`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `заказы_туров_ibfk_2` FOREIGN KEY (`ID_страны`) REFERENCES `страны` (`ID_страны`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `заказы_туров_ibfk_3` FOREIGN KEY (`ID_типа`) REFERENCES `типы_туров` (`ID_типа`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `заказы_туров_ibfk_4` FOREIGN KEY (`ID_агентства`) REFERENCES `туристические_агентства` (`ID_агентства`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказы_туров`
--

LOCK TABLES `заказы_туров` WRITE;
/*!40000 ALTER TABLE `заказы_туров` DISABLE KEYS */;
INSERT INTO `заказы_туров` VALUES (1,1,1,1,1,'2025-06-15',10,75000.00,'2025-09-24 20:38:51');
/*!40000 ALTER TABLE `заказы_туров` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиенты`
--

DROP TABLE IF EXISTS `клиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `клиенты` (
  `ID_клиента` int unsigned NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Телефон` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_клиента`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиенты`
--

LOCK TABLES `клиенты` WRITE;
/*!40000 ALTER TABLE `клиенты` DISABLE KEYS */;
INSERT INTO `клиенты` VALUES (1,'Иванов Иван','+79001112233',NULL);
/*!40000 ALTER TABLE `клиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `страны`
--

DROP TABLE IF EXISTS `страны`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `страны` (
  `ID_страны` int unsigned NOT NULL AUTO_INCREMENT,
  `Название_страны` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_страны`),
  UNIQUE KEY `Название_страны` (`Название_страны`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `страны`
--

LOCK TABLES `страны` WRITE;
/*!40000 ALTER TABLE `страны` DISABLE KEYS */;
INSERT INTO `страны` VALUES (2,'Италия'),(1,'Турция');
/*!40000 ALTER TABLE `страны` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `типы_туров`
--

DROP TABLE IF EXISTS `типы_туров`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `типы_туров` (
  `ID_типа` int unsigned NOT NULL AUTO_INCREMENT,
  `Название_типа` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_типа`),
  UNIQUE KEY `Название_типа` (`Название_типа`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `типы_туров`
--

LOCK TABLES `типы_туров` WRITE;
/*!40000 ALTER TABLE `типы_туров` DISABLE KEYS */;
INSERT INTO `типы_туров` VALUES (1,'Пляжный'),(2,'Экскурсионный');
/*!40000 ALTER TABLE `типы_туров` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `туристические_агентства`
--

DROP TABLE IF EXISTS `туристические_агентства`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `туристические_агентства` (
  `ID_агентства` int unsigned NOT NULL AUTO_INCREMENT,
  `Название_агентства` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Телефон` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_агентства`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `туристические_агентства`
--

LOCK TABLES `туристические_агентства` WRITE;
/*!40000 ALTER TABLE `туристические_агентства` DISABLE KEYS */;
INSERT INTO `туристические_агентства` VALUES (1,'Солнышко Трэвел','+71234567890',NULL);
/*!40000 ALTER TABLE `туристические_агентства` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-25  1:46:53
