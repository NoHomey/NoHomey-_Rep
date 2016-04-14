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
-- Table structure for table `Article_15`
--

DROP TABLE IF EXISTS `Article_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article_15` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(256) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `Category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Category_id` (`Category_id`),
  CONSTRAINT `Article_15_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `Category_part2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article_15`
--

LOCK TABLES `Article_15` WRITE;
/*!40000 ALTER TABLE `Article_15` DISABLE KEYS */;
INSERT INTO `Article_15` VALUES (1,'qweqwe1233','https://github.com/thebravoman/elsys-db-practices/pull/7','2016-04-06',2),(2,'qweqwe1235','https://github.com/thebravoman/elsys-db-practices/pull/5','2016-04-05',5),(3,'qweqwe1234','https://github.com/thebravoman/elsys-db-practices/pull/4','2016-04-03',1),(4,'qweqwe1231','https://github.com/thebravoman/elsys-db-practices/pull/6','2016-04-07',7),(5,'qweqwe1232','https://github.com/thebravoman/elsys-db-practices/pull/2','2016-04-04',4),(6,'qweqwe1236','https://github.com/thebravoman/elsys-db-practices/pull/1','2016-04-01',6),(7,'qweqwe1237','https://github.com/thebravoman/elsys-db-practices/pull/3','2016-04-02',3);
/*!40000 ALTER TABLE `Article_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article_15_Tag`
--

DROP TABLE IF EXISTS `Article_15_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article_15_Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tag_id` int(11) NOT NULL,
  `Article_15_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Tag_id` (`Tag_id`),
  KEY `Article_15_id` (`Article_15_id`),
  CONSTRAINT `Article_15_Tag_ibfk_1` FOREIGN KEY (`Tag_id`) REFERENCES `Tag` (`id`),
  CONSTRAINT `Article_15_Tag_ibfk_2` FOREIGN KEY (`Article_15_id`) REFERENCES `Article_15` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article_15_Tag`
--

LOCK TABLES `Article_15_Tag` WRITE;
/*!40000 ALTER TABLE `Article_15_Tag` DISABLE KEYS */;
INSERT INTO `Article_15_Tag` VALUES (1,6,1),(2,5,4),(3,2,3),(4,3,6),(5,1,5),(6,7,7),(7,4,2);
/*!40000 ALTER TABLE `Article_15_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category_part1`
--

DROP TABLE IF EXISTS `Category_part1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category_part1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_part1`
--

LOCK TABLES `Category_part1` WRITE;
/*!40000 ALTER TABLE `Category_part1` DISABLE KEYS */;
INSERT INTO `Category_part1` VALUES (1,'It should have some description at page 7'),(2,'It should have some description at page 5'),(3,'It should have some description at page 3'),(4,'It should have some description at page 2'),(5,'It should have some description at page 6'),(6,'It should have some description at page 1'),(7,'It should have some description at page 4');
/*!40000 ALTER TABLE `Category_part1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category_part2`
--

DROP TABLE IF EXISTS `Category_part2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category_part2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` double(16,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category_part2`
--

LOCK TABLES `Category_part2` WRITE;
/*!40000 ALTER TABLE `Category_part2` DISABLE KEYS */;
INSERT INTO `Category_part2` VALUES (1,44.44000000),(2,77.77000000),(3,22.22000000),(4,33.33000000),(5,66.66000000),(6,11.11000000),(7,55.55000000);
/*!40000 ALTER TABLE `Category_part2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `second_priority` float(8,4) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,3.3000,66),(2,5.5000,44),(3,6.6000,11),(4,2.2000,22),(5,1.1000,77),(6,7.7000,33),(7,4.4000,55);
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(256) DEFAULT NULL,
  `twitter` varchar(6) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `Category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Category_id` (`Category_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `Category_part2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'qweqwe1231','https:','Liam South',3),(2,'qweqwe1237','https:','Liam South',5),(3,'qweqwe1235','https:','Liam South',4),(4,'qweqwe1233','https:','Liam South',6),(5,'qweqwe1232','https:','Liam South',2),(6,'qweqwe1236','https:','Liam South',7),(7,'qweqwe1234','https:','Liam South',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-14  2:26:46
