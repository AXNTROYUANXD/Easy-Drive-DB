-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `CAR`
--

DROP TABLE IF EXISTS `CAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAR` (
  `registrationNo` varchar(5) NOT NULL,
  `checkDate` datetime DEFAULT NULL,
  `carCondition` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`registrationNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAR`
--

LOCK TABLES `CAR` WRITE;
/*!40000 ALTER TABLE `CAR` DISABLE KEYS */;
INSERT INTO `CAR` VALUES ('C0001','2000-01-05 21:00:00','good'),('C0002','2000-01-06 21:00:00','tyre flat'),('C0003','2000-01-07 21:00:00','brake is broken'),('C0004','2000-01-05 21:30:00','good'),('C0005','2000-02-05 21:30:00','good'),('C0006','2002-01-04 21:00:00','good'),('C0007','2002-01-05 21:00:00','tyre flat'),('C0008','2002-01-06 21:00:00','good'),('C0009','2006-02-04 21:00:00','tyre flat'),('C0010','2006-02-05 21:00:00','good'),('C0011','2006-02-06 21:00:00','good'),('C0012','2020-02-04 21:00:00','good'),('C0013','2020-02-05 21:00:00','brake is broken'),('C0014','2020-02-06 21:00:00','good'),('C0015','2020-02-06 21:00:00','good'),('C0016','2020-03-03 19:30:00','tyre flat');
/*!40000 ALTER TABLE `CAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARREGISTRATION`
--

DROP TABLE IF EXISTS `CARREGISTRATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARREGISTRATION` (
  `staffNo` varchar(5) NOT NULL,
  `registrationNo` varchar(5) NOT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `registrationNo_idx` (`registrationNo`),
  CONSTRAINT `registrationNo` FOREIGN KEY (`registrationNo`) REFERENCES `CAR` (`registrationNo`),
  CONSTRAINT `staffNo2` FOREIGN KEY (`staffNo`) REFERENCES `STAFF` (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARREGISTRATION`
--

LOCK TABLES `CARREGISTRATION` WRITE;
/*!40000 ALTER TABLE `CARREGISTRATION` DISABLE KEYS */;
INSERT INTO `CARREGISTRATION` VALUES ('A0001','C0001'),('A0002','C0002'),('A0003','C0003'),('A0005','C0004'),('A0007','C0005'),('A0008','C0006'),('A0009','C0007'),('A0011','C0008'),('A0012','C0009'),('A0013','C0010'),('A0017','C0011'),('A0018','C0012'),('A0019','C0013'),('A0021','C0014'),('A0022','C0015'),('A0023','C0016');
/*!40000 ALTER TABLE `CARREGISTRATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `clientNo` varchar(5) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `gender` char(6) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`clientNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('A0001','Logan','Scoot','1981-04-20','male',39),('A0002','Gemma','Ramirez','1980-02-21','female',40),('A0003','Bryan','Hall','1995-09-16','male',26),('A0004','Benjamin','Torres','1991-03-24','male',29),('A0005','Judy','Allen','1987-11-13','female',33),('A0006','Bill','Willimson','1975-03-13','male',45);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTREGISTRATION`
--

DROP TABLE IF EXISTS `CLIENTREGISTRATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTREGISTRATION` (
  `registerDate` datetime NOT NULL,
  `payMethod` char(15) DEFAULT NULL,
  `OFFICE_officeNo` varchar(5) NOT NULL,
  `CLIENT_clientNo` varchar(5) NOT NULL,
  PRIMARY KEY (`registerDate`),
  KEY `fk_CLIENTREGISTRATION_OFFICE1_idx` (`OFFICE_officeNo`),
  KEY `fk_CLIENTREGISTRATION_CLIENT1_idx` (`CLIENT_clientNo`),
  CONSTRAINT `fk_CLIENTREGISTRATION_CLIENT1` FOREIGN KEY (`CLIENT_clientNo`) REFERENCES `CLIENT` (`clientNo`),
  CONSTRAINT `fk_CLIENTREGISTRATION_OFFICE1` FOREIGN KEY (`OFFICE_officeNo`) REFERENCES `OFFICE` (`officeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTREGISTRATION`
--

LOCK TABLES `CLIENTREGISTRATION` WRITE;
/*!40000 ALTER TABLE `CLIENTREGISTRATION` DISABLE KEYS */;
INSERT INTO `CLIENTREGISTRATION` VALUES ('1995-06-23 07:00:00','Single','A0005','A0006'),('1999-12-05 07:00:00','Single','A0001','A0001'),('1999-12-06 07:00:00','Interchangeable','A0001','A0002'),('2007-06-09 06:30:00','Interchangeable','A0004','A0005'),('2011-06-04 07:00:00','Single','A0003','A0004'),('2014-06-02 07:30:00','Single','A0002','A0003');
/*!40000 ALTER TABLE `CLIENTREGISTRATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEARNING`
--

DROP TABLE IF EXISTS `LEARNING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEARNING` (
  `clientNo` varchar(5) NOT NULL,
  `lessonStartTime` datetime NOT NULL,
  `lessonNo` int DEFAULT NULL,
  PRIMARY KEY (`clientNo`,`lessonStartTime`),
  KEY `lessonStartTime` (`lessonStartTime`),
  CONSTRAINT `clientNo1` FOREIGN KEY (`clientNo`) REFERENCES `CLIENT` (`clientNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEARNING`
--

LOCK TABLES `LEARNING` WRITE;
/*!40000 ALTER TABLE `LEARNING` DISABLE KEYS */;
INSERT INTO `LEARNING` VALUES ('A0001','1999-12-08 09:00:00',4),('A0001','1999-12-08 10:00:00',3),('A0001','1999-12-09 09:00:00',2),('A0001','1999-12-09 10:00:00',1),('A0002','1999-12-10 10:00:00',1),('A0002','1999-12-10 15:00:00',2),('A0002','1999-12-11 10:00:00',3),('A0002','1999-12-11 15:00:00',4),('A0003','2014-06-05 13:00:00',1),('A0003','2014-06-05 14:00:00',2),('A0003','2014-06-06 09:00:00',3),('A0003','2014-06-07 09:00:00',4),('A0004','2011-06-10 16:00:00',1),('A0004','2011-06-10 17:00:00',2),('A0004','2011-06-11 16:00:00',3),('A0004','2011-06-11 17:00:00',4),('A0005','2007-06-20 18:00:00',1),('A0005','2007-06-20 19:00:00',2),('A0005','2007-06-21 18:00:00',3),('A0005','2007-06-21 19:00:00',4),('A0006','1995-07-01 08:00:00',1),('A0006','1995-07-01 15:00:00',2),('A0006','1995-07-02 08:00:00',3),('A0006','1995-07-02 15:00:00',4);
/*!40000 ALTER TABLE `LEARNING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEARNINGCAR`
--

DROP TABLE IF EXISTS `LEARNINGCAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEARNINGCAR` (
  `registrationNo` varchar(5) NOT NULL,
  `clientNo` varchar(5) NOT NULL,
  PRIMARY KEY (`registrationNo`,`clientNo`),
  KEY `clientNo_idx` (`clientNo`),
  CONSTRAINT `clientNo2` FOREIGN KEY (`clientNo`) REFERENCES `CLIENT` (`clientNo`),
  CONSTRAINT `registrationNo1` FOREIGN KEY (`registrationNo`) REFERENCES `CAR` (`registrationNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEARNINGCAR`
--

LOCK TABLES `LEARNINGCAR` WRITE;
/*!40000 ALTER TABLE `LEARNINGCAR` DISABLE KEYS */;
INSERT INTO `LEARNINGCAR` VALUES ('C0001','A0001'),('C0002','A0002'),('C0003','A0002'),('C0006','A0003'),('C0009','A0004'),('C0011','A0005'),('C0012','A0005'),('C0014','A0006');
/*!40000 ALTER TABLE `LEARNINGCAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEARNINGMILEAGE`
--

DROP TABLE IF EXISTS `LEARNINGMILEAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEARNINGMILEAGE` (
  `clientNo` varchar(5) NOT NULL,
  `lessonStartTime` datetime NOT NULL,
  `mileage` float DEFAULT NULL,
  PRIMARY KEY (`clientNo`,`lessonStartTime`),
  KEY `lessonStartTime_idx` (`lessonStartTime`),
  CONSTRAINT `clientNo3` FOREIGN KEY (`clientNo`) REFERENCES `CLIENT` (`clientNo`),
  CONSTRAINT `lessonStartTime1` FOREIGN KEY (`lessonStartTime`) REFERENCES `LEARNING` (`lessonStartTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEARNINGMILEAGE`
--

LOCK TABLES `LEARNINGMILEAGE` WRITE;
/*!40000 ALTER TABLE `LEARNINGMILEAGE` DISABLE KEYS */;
INSERT INTO `LEARNINGMILEAGE` VALUES ('A0001','1999-12-08 09:00:00',21),('A0001','1999-12-08 10:00:00',23),('A0001','1999-12-09 09:00:00',24),('A0001','1999-12-09 10:00:00',25),('A0002','1999-12-10 10:00:00',14),('A0002','1999-12-10 15:00:00',14),('A0002','1999-12-11 10:00:00',15),('A0002','1999-12-11 15:00:00',21),('A0003','2014-06-05 13:00:00',21),('A0003','2014-06-05 14:00:00',24),('A0003','2014-06-06 09:00:00',12),('A0003','2014-06-07 09:00:00',14),('A0004','2011-06-10 16:00:00',15),('A0004','2011-06-10 17:00:00',21),('A0004','2011-06-11 16:00:00',21),('A0004','2011-06-11 17:00:00',16),('A0005','2007-06-20 18:00:00',17),('A0005','2007-06-20 19:00:00',13),('A0005','2007-06-21 18:00:00',4),('A0005','2007-06-21 19:00:00',16),('A0006','1995-07-01 08:00:00',12),('A0006','1995-07-01 15:00:00',15),('A0006','1995-07-02 08:00:00',25),('A0006','1995-07-02 15:00:00',22);
/*!40000 ALTER TABLE `LEARNINGMILEAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGERPHONE`
--

DROP TABLE IF EXISTS `MANAGERPHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MANAGERPHONE` (
  `staffNo` varchar(5) NOT NULL,
  `phoneNumber` char(20) DEFAULT NULL,
  PRIMARY KEY (`staffNo`),
  CONSTRAINT `staffNo1` FOREIGN KEY (`staffNo`) REFERENCES `OFFICE_has_STAFF(MANAGER)` (`STAFF_staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGERPHONE`
--

LOCK TABLES `MANAGERPHONE` WRITE;
/*!40000 ALTER TABLE `MANAGERPHONE` DISABLE KEYS */;
INSERT INTO `MANAGERPHONE` VALUES ('A0001','1410286271'),('A0007','2083461911'),('A0011','1210283625'),('A0016','1310183613'),('A0021','1511836211');
/*!40000 ALTER TABLE `MANAGERPHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFICE`
--

DROP TABLE IF EXISTS `OFFICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFICE` (
  `officeNo` varchar(5) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `MANAGER_staffNo` varchar(5) NOT NULL,
  `officeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`officeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFICE`
--

LOCK TABLES `OFFICE` WRITE;
/*!40000 ALTER TABLE `OFFICE` DISABLE KEYS */;
INSERT INTO `OFFICE` VALUES ('A0001','Glasgow','145 Kelvinhaugh St, Glasgow','A0001','Bearsden'),('A0002','London','385-389 Oxford St, London','A0007','Bridge'),('A0003','Birmingham','256 Colebrook St, Birmingham','A0011','Oxley'),('A0004','Edinburgh','023 Chambers St, Edinburgh','A0016','Ingliston'),('A0005','Liverpool','029 Dale St, Liverpool','A0021','Albion');
/*!40000 ALTER TABLE `OFFICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFICE_has_STAFF(MANAGER)`
--

DROP TABLE IF EXISTS `OFFICE_has_STAFF(MANAGER)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFICE_has_STAFF(MANAGER)` (
  `OFFICE_officeNo` varchar(5) NOT NULL,
  `STAFF_staffNo` varchar(5) NOT NULL,
  PRIMARY KEY (`OFFICE_officeNo`,`STAFF_staffNo`),
  KEY `fk_OFFICE_has_STAFF_STAFF1_idx` (`STAFF_staffNo`),
  KEY `fk_OFFICE_has_STAFF_OFFICE1_idx` (`OFFICE_officeNo`),
  CONSTRAINT `fk_OFFICE_has_STAFF_OFFICE1` FOREIGN KEY (`OFFICE_officeNo`) REFERENCES `OFFICE` (`officeNo`),
  CONSTRAINT `fk_OFFICE_has_STAFF_STAFF1` FOREIGN KEY (`STAFF_staffNo`) REFERENCES `STAFF` (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFICE_has_STAFF(MANAGER)`
--

LOCK TABLES `OFFICE_has_STAFF(MANAGER)` WRITE;
/*!40000 ALTER TABLE `OFFICE_has_STAFF(MANAGER)` DISABLE KEYS */;
INSERT INTO `OFFICE_has_STAFF(MANAGER)` VALUES ('A0001','A0001'),('A0002','A0007'),('A0003','A0011'),('A0004','A0016'),('A0005','A0021');
/*!40000 ALTER TABLE `OFFICE_has_STAFF(MANAGER)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STAFF` (
  `staffNo` varchar(5) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` char(6) DEFAULT NULL,
  `staffType` varchar(45) DEFAULT NULL,
  `OFFICE_officeNo` varchar(5) NOT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `fk_INSTRUCTOR_OFFICE_idx` (`OFFICE_officeNo`),
  CONSTRAINT `fk_INSTRUCTOR_OFFICE` FOREIGN KEY (`OFFICE_officeNo`) REFERENCES `OFFICE` (`officeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES ('A0001','John','Davids','1964-04-21',56,'male','Senior Instructor','A0001'),('A0002','Emma','Miller','1987-06-12',33,'female','Senior Instructor','A0001'),('A0003','James','Brown','1982-01-23',38,'male','Instructor','A0001'),('A0004','Alex','Thomas','1962-12-12',58,'male','Instructor','A0001'),('A0005','Betty','Jones','1991-08-23',29,'female','Administrative Staff','A0001'),('A0006','Chase','Walker','1993-02-11',27,'male','Administrative Staff','A0001'),('A0007','Ryan','Smith','1978-01-31',42,'male','Senior Instructor','A0002'),('A0008','Lily','Williams','1984-04-20',36,'female','Senior Instructor','A0002'),('A0009','Black','Wilson','1994-05-18',26,'male','Instructor','A0002'),('A0010','Cora','Clark','1990-06-06',30,'female','Administrative Staff','A0002'),('A0011','Nicola','Jackson','1975-07-18',45,'female','Senior Instructor','A0003'),('A0012','Jack','Lewis','1981-04-23',39,'male','Senior Instructor','A0003'),('A0013','Justin','Lee','1994-09-08',26,'male','Instructor','A0003'),('A0014','Nelly','Adams','1995-05-05',25,'female','Administrative Staff','A0003'),('A0015','Lucas','Evans','1989-10-18',31,'male','Administrative Staff','A0003'),('A0016','Sean','Green','1960-01-03',60,'male','Administrative Staff','A0004'),('A0017','Hunter','Phillips','1976-09-30',44,'male','Senior Instructor','A0004'),('A0018','James','Brown','1987-11-28',33,'nale','Senior Instructor','A0004'),('A0019','Louise','Backer','1988-10-03',32,'female','Instructor','A0004'),('A0020','Judy','Mitchell','1981-07-25',39,'female','Administrative Staff','A0004'),('A0021','Jack','Lee','1961-06-30',59,'male','Senior Instructor','A0005'),('A0022','Andrew','Moore','1973-02-16',47,'male','Instructor','A0005'),('A0023','Eric','Martin','1975-04-26',45,'male','Instructor','A0005'),('A0024','Arthur','Morgan','1984-09-13',36,'male','Administrative Staff','A0005');
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST`
--

DROP TABLE IF EXISTS `TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST` (
  `clientNo` varchar(5) NOT NULL,
  `testStartTime` datetime NOT NULL,
  `failReason` varchar(300) DEFAULT NULL,
  `pickUp` char(3) DEFAULT NULL,
  PRIMARY KEY (`testStartTime`,`clientNo`),
  KEY `clientNo_idx` (`clientNo`),
  CONSTRAINT `clientNo` FOREIGN KEY (`clientNo`) REFERENCES `CLIENT` (`clientNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST`
--

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
INSERT INTO `TEST` VALUES ('A0006','1995-07-01 10:00:00','not wearing a seat belt','Yes'),('A0006','1995-07-03 10:00:00','operation mistake','Yes'),('A0006','1995-07-12 10:00:00','operation mistake','No'),('A0006','1995-07-15 10:00:00','operation mistake','No'),('A0001','2000-01-09 14:00:00','','Yes'),('A0002','2000-01-12 14:00:00','operation mistake','Yes'),('A0002','2000-01-15 14:00:00','operation mistake','Yes'),('A0002','2000-01-20 14:00:00','not wearing a seat belt','Yes'),('A0002','2000-01-24 14:00:00','operation mistake','Yes'),('A0005','2007-07-01 15:00:00','','Yes'),('A0004','2011-07-01 09:00:00','','No'),('A0003','2014-07-01 13:00:00','operation mistake','Yes'),('A0003','2014-07-03 13:00:00','','No');
/*!40000 ALTER TABLE `TEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIMETABLE`
--

DROP TABLE IF EXISTS `TIMETABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIMETABLE` (
  `timeTableNo` varchar(45) NOT NULL,
  `staffNo` varchar(5) NOT NULL,
  `lessonStartTime` datetime DEFAULT NULL,
  `testStartTime` datetime DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `weekNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`timeTableNo`,`staffNo`),
  KEY `lessonStartTime_idx` (`lessonStartTime`),
  KEY `registerDate_idx` (`registerDate`),
  KEY `testStartTime_idx` (`testStartTime`),
  KEY `staffNo` (`staffNo`),
  CONSTRAINT `lessonStartTime` FOREIGN KEY (`lessonStartTime`) REFERENCES `LEARNING` (`lessonStartTime`),
  CONSTRAINT `registerDate` FOREIGN KEY (`registerDate`) REFERENCES `CLIENTREGISTRATION` (`registerDate`),
  CONSTRAINT `staffNo` FOREIGN KEY (`staffNo`) REFERENCES `STAFF` (`staffNo`),
  CONSTRAINT `testStartTime` FOREIGN KEY (`testStartTime`) REFERENCES `TEST` (`testStartTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIMETABLE`
--

LOCK TABLES `TIMETABLE` WRITE;
/*!40000 ALTER TABLE `TIMETABLE` DISABLE KEYS */;
INSERT INTO `TIMETABLE` VALUES ('1','A0001',NULL,NULL,'1999-12-05 07:00:00','1999-49'),('10','A0002','1999-12-11 15:00:00',NULL,NULL,'1999-50'),('11','A0003',NULL,'2000-01-09 14:00:00',NULL,'2000-02'),('12','A0003',NULL,'2000-01-12 14:00:00',NULL,'2000-03'),('13','A0003',NULL,'2000-01-15 14:00:00',NULL,'2000-03'),('14','A0003',NULL,'2000-01-20 14:00:00',NULL,'2000-04'),('15','A0003',NULL,'2000-01-24 14:00:00',NULL,'2000-05'),('16','A0007',NULL,NULL,'2014-06-02 07:30:00','2014-23'),('17','A0008','2014-06-05 13:00:00',NULL,NULL,'2014-23'),('18','A0008','2014-06-05 14:00:00',NULL,NULL,'2014-23'),('19','A0008','2014-06-06 09:00:00',NULL,NULL,'2014-23'),('2','A0001','1999-12-08 09:00:00',NULL,NULL,'1999-50'),('20','A0008','2014-06-07 09:00:00',NULL,NULL,'2014-23'),('21','A0009',NULL,'2014-07-03 13:00:00',NULL,'2014-27'),('22','A0012',NULL,NULL,'2011-06-04 07:00:00','2011-23'),('23','A0012','2011-06-10 16:00:00',NULL,NULL,'2011-24'),('24','A0012','2011-06-10 17:00:00',NULL,NULL,'2011-24'),('25','A0012','2011-06-11 16:00:00',NULL,NULL,'2011-24'),('26','A0012','2011-06-11 17:00:00',NULL,NULL,'2011-24'),('27','A0011',NULL,'2011-07-01 09:00:00',NULL,'2011-27'),('28','A0016',NULL,NULL,'2007-06-09 06:30:00','2007-23'),('29','A0017','2007-06-20 18:00:00',NULL,NULL,'2007-25'),('3','A0001','1999-12-08 10:00:00',NULL,NULL,'1999-50'),('30','A0018','2007-06-20 19:00:00',NULL,NULL,'2007-25'),('31','A0018','2007-06-21 18:00:00',NULL,NULL,'2007-25'),('32','A0018','2007-06-21 19:00:00',NULL,NULL,'2007-25'),('33','A0019',NULL,'2007-07-01 15:00:00',NULL,'2007-26'),('34','A0021',NULL,NULL,'1995-06-23 07:00:00','1995-26'),('35','A0021','1995-07-01 08:00:00',NULL,NULL,'1995-27'),('36','A0021','1995-07-01 15:00:00',NULL,NULL,'1995-27'),('37','A0021','1995-07-02 08:00:00',NULL,NULL,'1995-27'),('38','A0021','1995-07-02 15:00:00',NULL,NULL,'1995-27'),('39','A0023',NULL,'1995-07-01 10:00:00',NULL,'1995-27'),('4','A0001','1999-12-09 09:00:00',NULL,NULL,'1999-50'),('40','A0023',NULL,'1995-07-03 10:00:00',NULL,'1995-28'),('41','A0023',NULL,'1995-07-12 10:00:00',NULL,'1995-29'),('42','A0023',NULL,'1995-07-15 10:00:00',NULL,'1995-29'),('43','A0009',NULL,'2014-07-01 13:00:00',NULL,'2014-27'),('5','A0001','1999-12-09 10:00:00',NULL,NULL,'1999-50'),('6','A0003',NULL,NULL,'1999-12-06 07:00:00','1999-50'),('7','A0003','1999-12-10 10:00:00',NULL,NULL,'1999-50'),('8','A0002','1999-12-10 15:00:00',NULL,NULL,'1999-50'),('9','A0002','1999-12-11 10:00:00',NULL,NULL,'1999-50');
/*!40000 ALTER TABLE `TIMETABLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-28 20:57:29
