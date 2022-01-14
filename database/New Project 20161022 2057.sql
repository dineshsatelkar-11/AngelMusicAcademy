-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.20


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema angelmusicacademy
--

CREATE DATABASE IF NOT EXISTS angelmusicacademy;
USE angelmusicacademy;

--
-- Definition of table `angelmusicacademy`.`batchtime`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`batchtime`;
CREATE TABLE  `angelmusicacademy`.`batchtime` (
  `batchTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `batchTiming` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`batchTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`batchtime`
--

/*!40000 ALTER TABLE `batchtime` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`batchtime` (`batchTimeId`,`batchTiming`) VALUES 
 (2,'10 T0 11 AM'),
 (3,'11 T0 12 PM'),
 (4,'12 T0 01 PM'),
 (5,'4 T0 5 PM'),
 (6,'5 T0 6 PM'),
 (7,'6 T0 7 PM'),
 (8,'7 T0 8 PM'),
 (9,'8 T0 9 PM');
/*!40000 ALTER TABLE `batchtime` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`branch`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`branch`;
CREATE TABLE  `angelmusicacademy`.`branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `branchAddress` varchar(255) DEFAULT NULL,
  `branchName` varchar(255) DEFAULT NULL,
  `branchRegisteredDate` datetime DEFAULT NULL,
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`branch` (`branchId`,`branchAddress`,`branchName`,`branchRegisteredDate`) VALUES 
 (1,'pune\'s branch address','PUNE','2016-10-20 17:41:28'),
 (2,'mumbai\'s branch address','MUMBAI','2016-10-20 17:42:11'),
 (3,'Nashik\'s branch address','NASHIK','2016-10-20 17:42:44'),
 (4,'Ahamadnagar\'s branch address','AHAMADNAGAR','2016-10-21 16:17:02');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`instrument`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`instrument`;
CREATE TABLE  `angelmusicacademy`.`instrument` (
  `instrumentId` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentAddedDate` datetime DEFAULT NULL,
  `instrumentDescription` varchar(255) DEFAULT NULL,
  `instrumentImgName` varchar(255) DEFAULT NULL,
  `instrumentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`instrument`
--

/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`instrument` (`instrumentId`,`instrumentAddedDate`,`instrumentDescription`,`instrumentImgName`,`instrumentName`) VALUES 
 (1,'2016-10-21 15:35:40','Strings Desc','stringf.png','STRINGS'),
 (2,'2016-10-21 15:36:36','KeyboardDesc','keyboard2.jpg','KEYBOARD'),
 (3,'2016-10-21 15:37:54','Voice Desc','voice.jpg','VOICE');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`subject`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`subject`;
CREATE TABLE  `angelmusicacademy`.`subject` (
  `subjectId` bigint(20) NOT NULL AUTO_INCREMENT,
  `subjectDescription` varchar(255) DEFAULT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectRegisteredDate` datetime DEFAULT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`subject`
--

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`subject` (`subjectId`,`subjectDescription`,`subjectName`,`subjectRegisteredDate`) VALUES 
 (1,'Indian Classical','Vocal (Indian Classical)','2016-10-20 15:12:19'),
 (2,'desc of tabla','Tabla','2016-10-20 15:21:07'),
 (3,'Desc Of Harmonium','Harmonium','2016-10-20 15:54:32');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`user`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`user`;
CREATE TABLE  `angelmusicacademy`.`user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userAddress` varchar(255) DEFAULT NULL,
  `userAge` int(11) NOT NULL,
  `userAttendingDays` varchar(255) DEFAULT NULL,
  `userAttendingTime` varchar(255) DEFAULT NULL,
  `userBranch` varchar(255) DEFAULT NULL,
  `userDOB` date DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userMobileNo` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userSubject` varchar(255) DEFAULT NULL,
  `userRegisteredDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`user` (`userId`,`userAddress`,`userAge`,`userAttendingDays`,`userAttendingTime`,`userBranch`,`userDOB`,`userEmail`,`userMobileNo`,`userName`,`userPassword`,`userSubject`,`userRegisteredDate`) VALUES 
 (1,'lohagon',25,'Tuesday','10 TO 11 PM','NASHIK','1991-12-05','roshanpatil@gmail.com','8308238755','Roshan Ganapati Patil','123456789','VOCAL',NULL),
 (2,'Rpworld',22,'Monday,Tuesday,Friday','07 TO 08 PM','MUMBAI','1994-04-03','starlifemarketing@gmail.com','9146641078','sam','123456','TABALA',NULL),
 (3,'Kalewadi',25,'Monday,Thursday,Saturday','10 TO 11 AM','PUNE','1991-10-06','sdfgdfgd@gmail.com','9146641078','Suyash Gore','123456789','VOCAL,TABALA,HARMONIUM,FLUTE',NULL),
 (4,'Kalewadi',25,'Monday,Thursday,Saturday','10 TO 11 AM','PUNE','2016-10-20','sdfgdfgd@gmail.com','9146641078','Suyash Gore','3456345','VOCAL,TABALA,HARMONIUM,FLUTE','2016-10-20 14:02:39'),
 (5,'bhosari',25,'Monday,Thursday,Friday','4 T0 5 PM','NASHIK','1991-10-01','sdfgdfgd@gmail.com','8308238755','GAURAV FASE','345345345345','Vocal (Indian Classical),Tabla,Harmonium','2016-10-21 16:22:02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
