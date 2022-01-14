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
-- Definition of table `angelmusicacademy`.`admin`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`admin`;
CREATE TABLE  `angelmusicacademy`.`admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminEmail` varchar(255) DEFAULT NULL,
  `adminMobileNo` varchar(255) DEFAULT NULL,
  `adminName` varchar(255) DEFAULT NULL,
  `adminPassword` varchar(255) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `registeredDate` datetime DEFAULT NULL,
  `adminOfBranch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_52e0bt94mc1o70g038xud8hqr` (`adminOfBranch_branchId`),
  CONSTRAINT `FK_52e0bt94mc1o70g038xud8hqr` FOREIGN KEY (`adminOfBranch_branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`admin` (`adminId`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`otp`,`registeredDate`,`adminOfBranch_branchId`) VALUES 
 (1,'sd@gmail.com',NULL,NULL,'admin',22222,NULL,NULL),
 (2,'dinesh@gmail.com','8956276855','DINESH','987783',0,'2017-05-17 14:20:25',5),
 (3,'r@gmail.com','7894561235','RAVEENA','209009',0,'2017-05-17 15:06:06',6);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


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
  `admin_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`branchId`),
  KEY `FK_4fd2vj72meb2gp57vumg59y4u` (`admin_adminId`),
  CONSTRAINT `FK_4fd2vj72meb2gp57vumg59y4u` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`branch` (`branchId`,`branchAddress`,`branchName`,`branchRegisteredDate`,`admin_adminId`) VALUES 
 (5,'pimpari pune','PIMPARI','2017-05-17 14:20:25',2),
 (6,'Kharadi Pune -14','KHARDI','2017-05-17 15:06:06',3);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`event`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`event`;
CREATE TABLE  `angelmusicacademy`.`event` (
  `eventId` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventAgeCategory` varchar(255) DEFAULT NULL,
  `eventCreatedDate` datetime DEFAULT NULL,
  `eventDate` datetime DEFAULT NULL,
  `eventImgName` varchar(255) DEFAULT NULL,
  `eventName` varchar(255) DEFAULT NULL,
  `eventRules` varchar(255) DEFAULT NULL,
  `eventVenue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`event`
--

/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`eventapplication`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`eventapplication`;
CREATE TABLE  `angelmusicacademy`.`eventapplication` (
  `eventApplicationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicantAddress` varchar(255) DEFAULT NULL,
  `applicantAgeCategory` varchar(255) DEFAULT NULL,
  `applicantDOB` date DEFAULT NULL,
  `applicantEmail` varchar(255) DEFAULT NULL,
  `applicantGender` varchar(255) DEFAULT NULL,
  `applicantMobileNo` varchar(255) DEFAULT NULL,
  `applicantMusicTeacherName` varchar(255) DEFAULT NULL,
  `applicantName` varchar(255) DEFAULT NULL,
  `applicantPerformanceForm` varchar(255) DEFAULT NULL,
  `applicantPhotoName` varchar(255) DEFAULT NULL,
  `applicantSchoolName` varchar(255) DEFAULT NULL,
  `appliedOn` date DEFAULT NULL,
  `event_eventId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`eventApplicationId`),
  KEY `FK_5rlm6vfeis980t8p9pjsvn7mn` (`event_eventId`),
  CONSTRAINT `FK_5rlm6vfeis980t8p9pjsvn7mn` FOREIGN KEY (`event_eventId`) REFERENCES `event` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`eventapplication`
--

/*!40000 ALTER TABLE `eventapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventapplication` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`exam`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`exam`;
CREATE TABLE  `angelmusicacademy`.`exam` (
  `examId` bigint(20) NOT NULL AUTO_INCREMENT,
  `examDate` datetime DEFAULT NULL,
  `examName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`exam`
--

/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`examapplication`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`examapplication`;
CREATE TABLE  `angelmusicacademy`.`examapplication` (
  `examApplicationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `appliedDate` datetime DEFAULT NULL,
  `teacherName` varchar(255) DEFAULT NULL,
  `exam_examId` bigint(20) DEFAULT NULL,
  `user_userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`examApplicationId`),
  KEY `FK_88h6f4ngfgen2qbcpuvq1kjov` (`exam_examId`),
  KEY `FK_suf2cwtlto2rihpcpeauucspg` (`user_userId`),
  CONSTRAINT `FK_88h6f4ngfgen2qbcpuvq1kjov` FOREIGN KEY (`exam_examId`) REFERENCES `exam` (`examId`),
  CONSTRAINT `FK_suf2cwtlto2rihpcpeauucspg` FOREIGN KEY (`user_userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`examapplication`
--

/*!40000 ALTER TABLE `examapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `examapplication` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`instrument`
--

/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`photosvideos`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`photosvideos`;
CREATE TABLE  `angelmusicacademy`.`photosvideos` (
  `galleryId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `insertedDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`galleryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`photosvideos`
--

/*!40000 ALTER TABLE `photosvideos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photosvideos` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`subject`
--

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`subject` (`subjectId`,`subjectDescription`,`subjectName`,`subjectRegisteredDate`) VALUES 
 (4,'dsfghgjkjhhjkhhgurtyujfghjh','GUITAR','2017-05-17 14:58:46'),
 (5,'sfdscbgfnbjkh','KEYBORD','2017-05-17 14:58:59'),
 (6,'qscftyjkl','DRUM','2017-05-17 14:59:12');
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
  `balance` float NOT NULL,
  `firstInstallment` float NOT NULL,
  `firstInstallmentDate` date DEFAULT NULL,
  `jrno` varchar(255) DEFAULT NULL,
  `lastInstallment` float NOT NULL,
  `lastInstallmentDate` date DEFAULT NULL,
  `secondInstallment` float NOT NULL,
  `secondInstallmentDate` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `totalFees` float NOT NULL,
  `userBranch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_7onhpacmqkhnwcbfpcmmxf5wd` (`userBranch_branchId`),
  CONSTRAINT `FK_7onhpacmqkhnwcbfpcmmxf5wd` FOREIGN KEY (`userBranch_branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`user` (`userId`,`userAddress`,`userAge`,`userAttendingDays`,`userAttendingTime`,`userBranch`,`userDOB`,`userEmail`,`userMobileNo`,`userName`,`userPassword`,`userSubject`,`userRegisteredDate`,`balance`,`firstInstallment`,`firstInstallmentDate`,`jrno`,`lastInstallment`,`lastInstallmentDate`,`secondInstallment`,`secondInstallmentDate`,`status`,`totalFees`,`userBranch_branchId`) VALUES 
 (8,'Kharadi',24,'Monday,Wednesday,Thursday,Saturday','5 T0 6 PM',NULL,'1992-11-11','dinesh@gmail.com','8956276855','DINESH','dinesh','GUITAR','2017-05-17 15:08:30',5000,5000,'2017-05-17','AMA-635993',0,NULL,5000,'2017-07-08','ACTIVE',10000,5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
