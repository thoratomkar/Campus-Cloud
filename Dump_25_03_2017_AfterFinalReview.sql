-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: kkdb
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `acad_year`
--

DROP TABLE IF EXISTS `acad_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acad_year` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acadYear` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `endMonth` int(11) DEFAULT NULL,
  `endYear` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `startMonth` int(11) DEFAULT NULL,
  `startYear` int(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isCurrent` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g0fx2vit3uoeti8shr1ra8t7q` (`org_id`),
  KEY `FK_e6e4htt21r5cgk6ve5uh6g30d` (`orgId`),
  CONSTRAINT `FK_e6e4htt21r5cgk6ve5uh6g30d` FOREIGN KEY (`orgId`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_g0fx2vit3uoeti8shr1ra8t7q` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acad_year`
--

LOCK TABLES `acad_year` WRITE;
/*!40000 ALTER TABLE `acad_year` DISABLE KEYS */;
INSERT INTO `acad_year` VALUES (1,'January 2010 - December 2011','2016-06-20 23:45:26',12,2011,'',1,2010,'2017-03-22 10:07:46','\0','fff',1,NULL),(2,'January 2011 - January 2012','2016-06-21 22:43:37',1,2012,'',1,2011,'2017-03-22 10:07:42','\0','dsss',1,NULL),(3,'July 2016 - May 2017','2016-06-21 22:43:54',5,2017,'\0',7,2016,'2016-09-21 23:55:16','\0','ds',2,NULL),(4,'January 2011 - March 2012','2016-06-26 19:11:28',3,2012,'\0',1,2011,'2016-06-26 19:11:39','\0','Year 1',2,NULL),(5,'June 2011 - April 2012','2016-06-26 21:23:33',4,2012,'\0',6,2011,'2016-06-26 21:34:31','\0','test',2,NULL),(6,'March 2011 - March 2012','2016-06-26 21:34:22',3,2012,'\0',3,2011,'2016-06-26 21:34:28','\0','11d',3,NULL),(7,'January 2010 - February 2013','2016-09-18 12:24:27',2,2013,'',1,2010,'2017-03-22 10:07:36','\0','hi',1,NULL),(8,'January 2010 - February 2012','2016-09-18 12:30:09',2,2012,'\0',1,2010,'2016-09-18 12:37:01','\0','jkrjekwl',2,NULL),(9,'March 2011 - March 2015','2016-09-18 12:31:13',3,2015,'',3,2011,'2017-03-22 10:07:33','\0','erwrwe',1,NULL),(10,'January 2010 - February 2014','2016-09-18 12:32:02',2,2014,'',1,2010,'2017-03-22 10:07:29','\0','rewrwe',1,NULL),(11,'January 2011 - January 2013','2016-09-18 12:35:21',1,2013,'',1,2011,'2017-03-22 10:06:27','\0','ggret',1,NULL),(12,'February 2010 - April 2016','2016-09-18 12:35:53',4,2016,'\0',2,2010,'2016-09-18 12:36:51','\0','fefre',2,NULL),(13,'January 2010 - February 2014','2016-09-18 12:36:28',2,2014,'\0',1,2010,'2016-09-18 12:36:48','\0','ggrtr',3,NULL),(14,'January 2010 - December 2011','2016-09-18 20:23:56',12,2011,'\0',1,2010,'2016-09-21 23:59:53','\0','Year j',3,NULL),(15,'January 2011 - January 2015','2016-09-21 00:07:51',1,2015,'\0',1,2011,'2016-09-21 00:34:30','\0','Year Test',2,NULL),(16,'February 2010 - March 2015','2016-09-21 00:33:42',3,2015,'\0',2,2010,'2016-09-21 00:34:26','\0','tretre',2,NULL),(17,'February 2010 - March 2012','2016-09-21 23:22:04',3,2012,'',2,2010,'2017-03-22 10:06:23','\0','year r',1,NULL),(18,'January 2016 - December 2016','2016-09-21 23:55:09',12,2016,'',1,2016,'2017-03-22 10:06:19','','year 2',1,NULL),(19,'January 2016 - January 2017','2017-03-12 20:40:27',1,2017,'\0',1,2016,'2017-03-12 20:40:27','\0','Test Acad Year',NULL,NULL),(20,'January 2016 - January 2017','2017-03-12 20:47:03',1,2017,'\0',1,2016,'2017-03-12 20:47:03','\0','Sample Acad Year',NULL,NULL),(21,'January 2017 - December 2017','2017-03-12 20:49:17',12,2017,'',1,2017,'2017-03-22 10:06:17','\0','Sample Acad new',1,NULL),(22,'January 2017 - December 2017','2017-03-12 20:49:17',12,2017,'',1,2017,'2017-03-12 20:49:29','\0','Sample Acad new',1,NULL),(23,'January 2011 - February 2019','2017-03-12 20:49:45',2,2019,'',1,2011,'2017-03-22 10:06:05','\0','Sample Acad new1',1,NULL),(24,'June 2016 - June 2017','2017-03-22 10:08:06',6,2017,'\0',6,2016,'2017-03-22 10:08:06','\0','Year 1',1,NULL);
/*!40000 ALTER TABLE `acad_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `rollno` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `w1` varchar(255) DEFAULT NULL,
  `w2` varchar(255) DEFAULT NULL,
  `w3` varchar(255) DEFAULT NULL,
  `w4` varchar(255) DEFAULT NULL,
  `w5` varchar(255) DEFAULT NULL,
  `w6` varchar(255) DEFAULT NULL,
  `w7` varchar(255) DEFAULT NULL,
  `w8` varchar(255) DEFAULT NULL,
  `w9` varchar(255) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `ay_id` bigint(20) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gn0e2hnk39w000cyoqc3m4v08` (`student_id`),
  KEY `FK_qc1ytyr24x747ft3uxbp83qfu` (`ay_id`),
  KEY `FK_6v0y3xp76wk26ksrhwbpih8vy` (`batch_id`),
  KEY `FK_9sbemvo08313pupi22kae4q7x` (`course_id`),
  KEY `FK_77foriakxn37msrx6v2t4o4l2` (`org_id`),
  KEY `FK_2jqwui723hd5l4mra873a91kl` (`section_id`),
  KEY `FK_apgy3jkqj9kd8aofw5axjv6sx` (`subject_id`),
  CONSTRAINT `FK_2jqwui723hd5l4mra873a91kl` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `FK_6v0y3xp76wk26ksrhwbpih8vy` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FK_77foriakxn37msrx6v2t4o4l2` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_9sbemvo08313pupi22kae4q7x` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_apgy3jkqj9kd8aofw5axjv6sx` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK_gn0e2hnk39w000cyoqc3m4v08` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FK_qc1ytyr24x747ft3uxbp83qfu` FOREIGN KEY (`ay_id`) REFERENCES `acad_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2017-03-12 00:41:30','\0','1234','Mathematics','2017-03-12 00:41:30','P','P','A','P','P','P','A','A','P',6,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ay_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `testDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_otmrwawkg5lf3qn9gtpusosmj` (`ay_id`),
  KEY `FK_rpau2kg6ki7yd5yajovj96itf` (`course_id`),
  KEY `FK_rhh58rbuscuurotpqh1rnbtd1` (`org_id`),
  KEY `FK_jug0isngdo8bp8noph8wi54n6` (`batch_id`),
  CONSTRAINT `FK_jug0isngdo8bp8noph8wi54n6` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FK_otmrwawkg5lf3qn9gtpusosmj` FOREIGN KEY (`ay_id`) REFERENCES `acad_year` (`id`),
  CONSTRAINT `FK_rhh58rbuscuurotpqh1rnbtd1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_rpau2kg6ki7yd5yajovj96itf` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (1,'MFM','2017-03-09 13:53:34','Finance Management ','\0','FIN','Finance','2017-03-09 13:53:34',18,8,1,NULL,NULL,NULL,NULL),(2,'S8','2017-03-22 10:13:20','S8','\0','S8','Semester 8','2017-03-22 10:13:20',24,9,1,NULL,NULL,'2019-05-05 00:00:00','2018-04-01 00:00:00');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5iwej8etrt2f1vi3ysl2q5fpw` (`org_id`),
  CONSTRAINT `FK_5iwej8etrt2f1vi3ysl2q5fpw` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (2,'MATHS','2017-02-26 23:20:29',NULL,'','Maths','Maths','2017-03-22 10:11:57',1),(3,'SCI','2017-02-26 23:21:01',NULL,'','Science','Science','2017-03-22 10:11:54',1),(8,'MBA','2017-02-26 23:36:12','','','Test','Masters','2017-03-22 10:11:51',1),(9,'INFT','2017-03-22 10:11:00','INFT','\0','INFT','Information Technology','2017-03-22 10:11:00',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `es` int(11) DEFAULT NULL,
  `ia1` int(11) DEFAULT NULL,
  `ia2` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  `rollno` varchar(255) DEFAULT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `tw` int(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_86x8lqmndhbj3rbtqwwiil3qr` (`student_id`),
  CONSTRAINT `FK_86x8lqmndhbj3rbtqwwiil3qr` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(45) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Configuration','CONF',0,'2016-06-05 20:06:33','2016-09-26 23:58:16'),(2,'Academics','ACAD',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(3,'Student','STUDENT',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(4,'Admission','ADMI',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(5,'Fees','FEES',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(6,'Human Resource','HR',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(7,'Communication','COMM',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(8,'Library','LIB',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(9,'Reports','REP',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(10,'Academic Year','AY',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(11,'Roles And Accesses','RNA',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(12,'Test','TST',0,'2017-01-25 21:16:46','2017-01-25 21:16:46'),(13,'Permission','PMS',0,'2017-02-12 12:20:15','2017-02-12 12:20:15'),(14,'Modules','MOD',0,'2017-02-12 12:23:56','2017-02-12 12:23:56'),(15,'Operation','OP',0,'2017-02-12 12:24:07','2017-02-12 12:24:07'),(16,'Organization','ORG',0,'2017-02-14 23:24:03','2017-02-14 23:24:03'),(17,'Admin','ADMIN',0,'2017-02-16 23:49:11','2017-02-16 23:49:11'),(18,'Superadmin','SUPERADMIN',0,'2017-02-16 23:49:25','2017-02-16 23:49:38'),(19,'Marks','MARKS',0,'2017-03-04 19:55:47','2017-03-04 19:55:47'),(22,'Parent','PARENT',0,'2017-03-04 19:55:47','2017-03-04 19:55:47'),(23,'Teacher','TEACHER',0,'2017-03-04 19:55:47','2017-03-04 19:55:47');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (1,'VIEW1',1,'2016-06-05 20:06:33','2016-09-27 23:05:17'),(2,'CREATE',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(3,'EDIT',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(4,'DELETE',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(5,'LIST',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(99998,'A',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(99999,'SA',0,'2016-06-05 20:06:33','2016-06-05 20:06:33'),(100000,'VIEW',0,'2016-09-27 23:05:25','2016-09-27 23:05:25'),(100001,'ALL',0,'2017-01-29 17:09:31','2017-01-29 17:09:31'),(100002,'ROLE',0,'2017-02-16 23:50:04','2017-02-16 23:50:04');
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `tagLine` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'VIT','2017-02-14 00:22:29','\0','Vidyalankar',NULL,'2017-02-14 00:22:29'),(2,'VESIT','2017-02-14 00:30:12','\0','Vivekananda',NULL,'2017-02-14 00:30:12'),(3,'VJTI','2017-02-22 23:35:26','','Veermata Jeejabai Inst of tech',NULL,'2017-02-22 23:38:46'),(4,'VIT1','2017-03-08 20:15:22','\0','Vidyalankar1',NULL,'2017-03-08 20:15:22'),(5,'TO','2017-03-08 20:24:37','\0','testorg',NULL,'2017-03-08 20:24:37'),(6,'TO1','2017-03-08 20:26:40','\0','testorg1',NULL,'2017-03-08 20:26:40');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `Module_Id` int(11) DEFAULT NULL,
  `Operation_Id` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `userRole_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bll0yiogbddaxmnhstq7u5ru3` (`Module_Id`),
  KEY `FK_rf1vcb0viarsj2vngn8i58hyy` (`Operation_Id`),
  CONSTRAINT `FK_bll0yiogbddaxmnhstq7u5ru3` FOREIGN KEY (`Module_Id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_rf1vcb0viarsj2vngn8i58hyy` FOREIGN KEY (`Operation_Id`) REFERENCES `operations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'VIEW_CONF',1,100000,0,'2017-01-29 10:41:05','2017-01-29 12:38:18',NULL),(2,'ALL_CONF',1,100001,0,'2017-01-29 17:09:52','2017-01-29 17:09:52',NULL),(3,'ALL_MOD',14,100001,0,'2017-02-12 12:24:33','2017-02-12 12:24:33',NULL),(4,'ALL_PMS',13,100001,0,'2017-02-12 12:34:41','2017-02-12 12:34:41',NULL),(5,'ALL_AY',10,100001,0,'2017-02-12 12:36:25','2017-02-12 12:36:25',NULL),(6,'ALL_OP',15,100001,0,'2017-02-12 12:38:01','2017-02-12 12:38:01',NULL),(7,'CREATE_ORG',16,2,0,'2017-02-14 23:24:42','2017-02-14 23:24:42',NULL),(8,'ROLE_ADMIN',17,100002,0,'2017-02-16 23:50:19','2017-02-16 23:50:19',NULL),(9,'ROLE_SUPERADMIN',18,100002,0,'2017-02-16 23:50:31','2017-02-16 23:50:31',NULL),(10,'ALL_ACAD',2,100001,0,'2017-02-18 10:49:56','2017-02-18 11:01:11',NULL),(11,'ALL_MARKS',19,100001,0,'2017-03-04 19:56:03','2017-03-04 19:56:03',NULL),(12,'ROLE_STUDENT',NULL,NULL,0,'2017-03-04 19:55:47','2017-03-04 19:55:47',NULL),(13,'ROLE_PARENT',NULL,NULL,0,'2017-03-04 19:55:47','2017-03-04 19:55:47',NULL),(14,'ROLE_TEACHER',NULL,NULL,0,'2017-03-04 19:55:47','2017-03-04 19:55:47',NULL);
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(5,'ROLE_PARENT'),(3,'ROLE_STUDENT'),(1,'ROLE_SUPERADMIN'),(4,'ROLE_TEACHER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_privileges`
--

DROP TABLE IF EXISTS `roles_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_ROLES_PRIVILEGES_ROLE_ID_idx` (`role_id`),
  KEY `FK_ROLES_PRIVILEGES_PRIVILEGE_ID_idx` (`privilege_id`),
  CONSTRAINT `FK_33w32xb8jfm3ocotvvecs3kuj` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_ROLES_PRIVILEGES_PRIVILEGE_ID` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_privileges`
--

LOCK TABLES `roles_privileges` WRITE;
/*!40000 ALTER TABLE `roles_privileges` DISABLE KEYS */;
INSERT INTO `roles_privileges` VALUES (1,1,1),(2,2,1),(11,1,2),(15,5,1),(16,1,3),(17,1,4),(18,1,5),(19,1,6),(20,2,7),(21,2,8),(22,1,9),(23,2,10),(24,2,11);
/*!40000 ALTER TABLE `roles_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `isPassed` bit(1) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `test_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gvjw318pgvimxhnyh708dxfqo` (`student_id`),
  KEY `FK_n9brt3t1u8ofjbl0e90etmbmv` (`org_id`),
  KEY `FK_k0wioeqfnhfxgs4xxemrdbpno` (`test_id`),
  CONSTRAINT `FK_gvjw318pgvimxhnyh708dxfqo` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FK_k0wioeqfnhfxgs4xxemrdbpno` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`),
  CONSTRAINT `FK_n9brt3t1u8ofjbl0e90etmbmv` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,'2017-03-12 00:04:02','','2017-03-12 00:15:44',6,'\0',60,'Failed',1,1),(2,'2017-03-12 00:15:57','','2017-03-12 20:52:44',6,'',75,'Passed',1,1),(3,'2017-03-12 20:52:54','','2017-03-22 10:23:01',6,'\0',45,'Failed',1,1),(4,'2017-03-22 10:23:13','\0','2017-03-22 10:23:13',15,'',17,'Passed',1,3);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ay_id` bigint(20) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jjatvny0yvkpp1mwx0wak1foj` (`ay_id`),
  KEY `FK_tlob7l6t2tmqeqljqalkheqbg` (`batch_id`),
  KEY `FK_lgx3bjarobql8e6j5lk27m95t` (`org_id`),
  CONSTRAINT `FK_jjatvny0yvkpp1mwx0wak1foj` FOREIGN KEY (`ay_id`) REFERENCES `acad_year` (`id`),
  CONSTRAINT `FK_lgx3bjarobql8e6j5lk27m95t` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_tlob7l6t2tmqeqljqalkheqbg` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'fd','2017-03-09 13:54:07','fds1','\0','fdsf','hi','2017-03-09 13:54:07',18,1,1),(2,'D2','2017-03-22 10:14:11','D2','\0','D2','Division 2','2017-03-22 10:14:11',24,2,1);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `contactNumber` varchar(255) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `enrollDate` datetime DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ay_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `rollNo` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `loginUserName` varchar(255) DEFAULT NULL,
  `batchid` bigint(20) DEFAULT NULL,
  `classid` bigint(20) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `parentcontact` varchar(255) DEFAULT NULL,
  `studentcontact` varchar(255) DEFAULT NULL,
  `studentname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p6e3c3ex6robx5dk60lcpkgpl` (`org_id`),
  KEY `FK_b8st28cgr087vu2mnha3xn0l5` (`ay_id`),
  KEY `FK_43kbhkhu6nmfod6dvon1x133m` (`course_id`),
  KEY `FK_g6m1pf7viokvq6mdq773o1ew` (`section_id`),
  KEY `FK_dabbm97nytnnteeimf0gqq4kk` (`batch_id`),
  CONSTRAINT `FK_43kbhkhu6nmfod6dvon1x133m` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_b8st28cgr087vu2mnha3xn0l5` FOREIGN KEY (`ay_id`) REFERENCES `acad_year` (`id`),
  CONSTRAINT `FK_dabbm97nytnnteeimf0gqq4kk` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FK_g6m1pf7viokvq6mdq773o1ew` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `FK_p6e3c3ex6robx5dk60lcpkgpl` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (6,'2017-03-11 00:03:44','','2017-03-22 10:14:33',1,'3213213123',NULL,'pradip@gm.com',NULL,'pradip','1','','pingle','','1',NULL,8,1,1,'1234','pradip pingle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'2017-03-12 23:35:41','','2017-03-12 23:35:50',1,'85984954584','2018-11-03 00:00:00','om@jkr.com',NULL,'Omkar','1','','Thorat','','1',NULL,8,1,1,'1234','Omkar  Thorat',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'2017-03-12 23:36:35','','2017-03-22 10:14:30',1,'7483784375','2017-07-03 00:00:00','rwerw@gmail.com',NULL,'OM','1','','THORAT','','1',NULL,8,1,1,'56565','OM  THORAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2017-03-16 00:47:56','','2017-03-22 10:14:26',1,'32121443111','2018-03-03 00:00:00','rwerh@rwewr.com',NULL,'f','Male','','ew','','Mr.',NULL,8,1,1,'12345','f  ew',13,'username1',NULL,NULL,NULL,NULL,NULL,NULL),(15,'2017-03-22 10:16:06','\0','2017-03-22 10:16:06',1,'8652821077','1997-02-02 00:00:00','nirajskhot@gmail.com',NULL,'Niraj','Male','','Khot','Shekhar','Mr.',NULL,9,2,2,'13118C0045','Niraj Shekhar Khot',14,'niraj.khot',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_guardian`
--

DROP TABLE IF EXISTS `student_guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_guardian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `homeAddress` varchar(255) DEFAULT NULL,
  `income` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `officeAddress` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `loginUserName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_guardian`
--

LOCK TABLES `student_guardian` WRITE;
/*!40000 ALTER TABLE `student_guardian` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f9ix6ckeywbj1sjc8cxovldoe` (`org_id`),
  CONSTRAINT `FK_f9ix6ckeywbj1sjc8cxovldoe` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'MATHS1','2017-03-04 23:03:15','Very complex in nature','','MATHS','Mathematics','2017-03-04 23:03:33',1),(2,'MATHS1','2017-03-04 23:04:00','complex in nature','','MATHS','Mathematics','2017-03-22 10:11:39',1),(3,'BDA','2017-03-22 10:11:34','BDA','\0','BDA','Big Data Analytics','2017-03-22 10:11:34',1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `testDate` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `ay_id` bigint(20) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `maxScore` int(11) DEFAULT NULL,
  `passingScore` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fiwdmq6i7xl1jyko44o1q1t38` (`ay_id`),
  KEY `FK_4lqsy4wampfvr9mtmu0vin22v` (`batch_id`),
  KEY `FK_m8l730xcdsyg41rs3aoovpt6t` (`course_id`),
  KEY `FK_e0b16av62yvag7xqvpafi80em` (`org_id`),
  KEY `FK_sf1t91nv4q48t7v3oosv1l4r4` (`subject_id`),
  CONSTRAINT `FK_4lqsy4wampfvr9mtmu0vin22v` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FK_e0b16av62yvag7xqvpafi80em` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK_fiwdmq6i7xl1jyko44o1q1t38` FOREIGN KEY (`ay_id`) REFERENCES `acad_year` (`id`),
  CONSTRAINT `FK_m8l730xcdsyg41rs3aoovpt6t` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_sf1t91nv4q48t7v3oosv1l4r4` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'TST1','2017-03-11 23:32:15','Sample Test1','','Test1','Test1',NULL,'2017-03-22 10:19:44',18,1,8,1,2,100,50),(2,'TST','2017-03-12 22:09:55','sample test2','','Test','Test2',NULL,'2017-03-22 10:19:41',18,1,8,1,2,100,45),(3,'IA1BDA','2017-03-22 10:22:48','IA1','\0','IA1','Internal Assessment 1 - Big Data Analytics','2018-08-02 00:00:00','2017-03-22 10:22:48',24,2,9,1,3,20,8);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classid` bigint(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `slot1` varchar(255) DEFAULT NULL,
  `slot2` varchar(255) DEFAULT NULL,
  `slot3` varchar(255) DEFAULT NULL,
  `slot4` varchar(255) DEFAULT NULL,
  `slot5` varchar(255) DEFAULT NULL,
  `slot6` varchar(255) DEFAULT NULL,
  `slot7` varchar(255) DEFAULT NULL,
  `slot8` varchar(255) DEFAULT NULL,
  `slot9` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pn8sfotfgr2rsiakpqp1wibn9` (`org_id`),
  CONSTRAINT `FK_pn8sfotfgr2rsiakpqp1wibn9` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,1,'2017-03-12 00:40:01','Monday','','s1','s2','s3','s4','s5','s6','s7','s8','s9','2017-03-22 15:11:49',1),(2,1,'2017-03-17 00:32:50','Tuesday','\0','A','A','A','A','A','A','A','A','A','2017-03-17 00:32:50',1);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_org_assoc`
--

DROP TABLE IF EXISTS `user_org_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_org_assoc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isDeleted` bit(1) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i79pkwuh5x5u02r6kqibc4h4w` (`user_id`,`org_id`),
  KEY `FK_nqtktlid1terknryqogy783ol` (`org_id`),
  CONSTRAINT `FK_nqtktlid1terknryqogy783ol` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_org_assoc`
--

LOCK TABLES `user_org_assoc` WRITE;
/*!40000 ALTER TABLE `user_org_assoc` DISABLE KEYS */;
INSERT INTO `user_org_assoc` VALUES (1,'\0',1,4),(2,'\0',2,5),(3,'\0',3,6),(4,'\0',4,4),(5,'\0',5,8),(6,'\0',6,8),(8,'\0',1,13),(9,'\0',1,14);
/*!40000 ALTER TABLE `user_org_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `UK_a9dydk3dj4qb8cvmjijqnrg5t` (`role_id`,`user_id`),
  KEY `user_id_fk_idx` (`user_id`),
  KEY `role_id_fk_idx` (`role_id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1,'\0'),(2,2,2,'\0'),(3,4,2,'\0'),(4,5,2,'\0'),(5,6,2,'\0'),(6,7,2,'\0'),(7,8,2,'\0'),(12,13,3,'\0'),(13,14,3,'\0');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `lastLogin` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `contact_email` varchar(255) NOT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'superadmin','superadmin','2015-10-06 11:30:05','2015-10-06 11:30:07',1,'',NULL,NULL),(2,'admin','admin','2015-10-06 11:30:05','2015-10-06 11:30:07',1,'',NULL,NULL),(4,'igtadmin','admin','2017-02-12 11:47:48','2017-02-12 11:47:48',1,'agtadmin@gmail.com','\0','2017-02-12 11:47:48'),(5,'pgtadmin','admin','2017-02-12 11:51:11','2017-02-12 11:51:11',1,'pgtadmin@gmail.com','\0','2017-02-12 11:51:11'),(6,'sgtadmin','admin','2017-02-22 23:30:25','2017-02-22 23:30:25',1,'sgt@gmai.com','\0','2017-02-22 23:30:25'),(7,'agtadmin','admin','2017-02-22 23:42:11','2017-02-22 23:42:11',1,'agt@gmail.com','\0','2017-02-22 23:42:11'),(8,'testadmin','admin','2017-03-08 20:24:06','2017-03-08 20:24:06',1,'testadmin@gmail.com','\0','2017-03-08 20:24:06'),(13,'username1','India1234','2017-03-16 00:47:56','2017-03-16 00:47:56',1,'rwerh@rwewr.com','\0','2017-03-16 00:47:56'),(14,'niraj.khot','India1234','2017-03-22 10:16:06','2017-03-22 10:16:06',1,'nirajskhot@gmail.com','\0','2017-03-22 10:16:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-25 10:10:54
