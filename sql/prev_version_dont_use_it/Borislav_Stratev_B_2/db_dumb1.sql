-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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

--
-- Table structure for table `Article_1`
--

DROP TABLE IF EXISTS `Article_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `content` varchar(1256) DEFAULT NULL,
  `Category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Category_id` (`Category_id`),
  CONSTRAINT `Article_1_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article_1`
--

LOCK TABLES `Article_1` WRITE;
/*!40000 ALTER TABLE `Article_1` DISABLE KEYS */;
INSERT INTO `Article_1` VALUES (1,'Liam South','2016-04-01','It should have some content at page 5',4),(2,'Liam South','2016-04-02','It should have some content at page 3',6),(3,'Liam South','2016-04-05','It should have some content at page 4',1),(4,'Liam South','2016-04-04','It should have some content at page 2',2),(5,'Liam South','2016-04-07','It should have some content at page 7',3),(6,'Liam South','2016-04-06','It should have some content at page 6',5),(7,'Liam South','2016-04-03','It should have some content at page 1',7);
/*!40000 ALTER TABLE `Article_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `created_by` varchar(256) DEFAULT NULL,
  `User_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `Category_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `User_part2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Liam South','Liam South',3),(2,'Liam South','Liam South',2),(3,'Liam South','Liam South',6),(4,'Liam South','Liam South',5),(5,'Liam South','Liam South',7),(6,'Liam South','Liam South',1),(7,'Liam South','Liam South',4);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `hash` varchar(16) DEFAULT NULL,
  `User_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_id` (`User_id`),
  CONSTRAINT `Tag_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `User_part2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,11,'9568243231906',4),(2,66,'9568243231904',1),(3,55,'9568243231902',3),(4,33,'9568243231901',7),(5,77,'9568243231903',2),(6,44,'9568243231907',6),(7,22,'9568243231905',5);
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_part1`
--

DROP TABLE IF EXISTS `User_part1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_part1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_part1`
--

LOCK TABLES `User_part1` WRITE;
/*!40000 ALTER TABLE `User_part1` DISABLE KEYS */;
INSERT INTO `User_part1` VALUES (1,'Liam South'),(2,'Liam South'),(3,'Liam South'),(4,'Liam South'),(5,'Liam South'),(6,'Liam South'),(7,'Liam South');
/*!40000 ALTER TABLE `User_part1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_part2`
--

DROP TABLE IF EXISTS `User_part2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_part2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twitter` varchar(6) DEFAULT NULL,
  `dexcription` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_part2`
--

LOCK TABLES `User_part2` WRITE;
/*!40000 ALTER TABLE `User_part2` DISABLE KEYS */;
INSERT INTO `User_part2` VALUES (1,'https:','It should have some description at page 3'),(2,'https:','It should have some description at page 1'),(3,'https:','It should have some description at page 7'),(4,'https:','It should have some description at page 6'),(5,'https:','It should have some description at page 4'),(6,'https:','It should have some description at page 5'),(7,'https:','It should have some description at page 2');
/*!40000 ALTER TABLE `User_part2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-14  7:23:12
