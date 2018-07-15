-- MySQL dump 10.13  Distrib 5.7.21, for FreeBSD11.1 (amd64)
--
-- Host: localhost    Database: wtest_db
-- ------------------------------------------------------
-- Server version	5.7.21-log

drop database if exists `wtest_db`;
create database `wtest_db`;
use wtest_db;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- Table structure for table `tab1`
--

DROP TABLE IF EXISTS `tab1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab1`
--

LOCK TABLES `tab1` WRITE;
/*!40000 ALTER TABLE `tab1` DISABLE KEYS */;
INSERT INTO `tab1` VALUES (1,'blue');
INSERT INTO `tab1` VALUES (2,'yellow');
INSERT INTO `tab1` VALUES (3,'ruby');
INSERT INTO `tab1` VALUES (4,'red');
INSERT INTO `tab1` VALUES (5,'green');
INSERT INTO `tab1` VALUES (6,'purple');
INSERT INTO `tab1` VALUES (7,'black');
INSERT INTO `tab1` VALUES (8,'white');
INSERT INTO `tab1` VALUES (9,'orange');
INSERT INTO `tab1` VALUES (10,'brown');
INSERT INTO `tab1` VALUES (11,'magenta');
INSERT INTO `tab1` VALUES (12,'grey');
INSERT INTO `tab1` VALUES (13,'cyan');
INSERT INTO `tab1` VALUES (14,'pink');
/*!40000 ALTER TABLE `tab1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab2`
--

DROP TABLE IF EXISTS `tab2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab2`
--

LOCK TABLES `tab2` WRITE;
/*!40000 ALTER TABLE `tab2` DISABLE KEYS */;
INSERT INTO `tab2` VALUES (1,'dog');
INSERT INTO `tab2` VALUES (2,'cat');
INSERT INTO `tab2` VALUES (3,'fox');
INSERT INTO `tab2` VALUES (4,'cow');
INSERT INTO `tab2` VALUES (5,'sheep');
INSERT INTO `tab2` VALUES (6,'horse');
INSERT INTO `tab2` VALUES (7,'chicken');
INSERT INTO `tab2` VALUES (8,'fly');
INSERT INTO `tab2` VALUES (9,'snake');
INSERT INTO `tab2` VALUES (10,'camel');
INSERT INTO `tab2` VALUES (11,'duck');
INSERT INTO `tab2` VALUES (12,'fish');
INSERT INTO `tab2` VALUES (13,'rabbit');
INSERT INTO `tab2` VALUES (14,'panther');
/*!40000 ALTER TABLE `tab2` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-14 10:07:37
