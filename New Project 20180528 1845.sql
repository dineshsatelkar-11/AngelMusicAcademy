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
-- Create schema ange
--

CREATE DATABASE IF NOT EXISTS ange;
USE ange;

--
-- Definition of table `ange`.`accounthistory`
--

DROP TABLE IF EXISTS `ange`.`accounthistory`;
CREATE TABLE  `ange`.`accounthistory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `paymentAgains` varchar(255) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentMode` varchar(255) DEFAULT NULL,
  `paymentTime` datetime DEFAULT NULL,
  `transctionNo` varchar(255) DEFAULT NULL,
  `ExternalAccount_id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_f3q7ufxctkj0ml34ee0nuge3b` (`ExternalAccount_id`),
  KEY `FK_x23x0pjkf4fbjbiti6cthwsv` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_f3q7ufxctkj0ml34ee0nuge3b` FOREIGN KEY (`ExternalAccount_id`) REFERENCES `externalaccount` (`id`),
  CONSTRAINT `FK_x23x0pjkf4fbjbiti6cthwsv` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`accounthistory`
--

/*!40000 ALTER TABLE `accounthistory` DISABLE KEYS */;
INSERT INTO `ange`.`accounthistory` (`Id`,`amount`,`bankName`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`transctionNo`,`ExternalAccount_id`,`adminOfBranch_adminId`) VALUES 
 (1,200,'sdfg','kadence guitar ','2018-05-09','Cash','2018-05-09 17:18:55','1234567',1,2),
 (2,500,'sdfg','kadence guitar ','2018-05-09','Paytm','2018-05-09 18:27:24','1234567',2,2),
 (3,1200,'','kadence guitar ','2018-05-09','Paytm','2018-05-09 18:39:57','',4,2);
/*!40000 ALTER TABLE `accounthistory` ENABLE KEYS */;


--
-- Definition of table `ange`.`addmodel`
--

DROP TABLE IF EXISTS `ange`.`addmodel`;
CREATE TABLE  `ange`.`addmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelName` varchar(255) DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`addmodel`
--

/*!40000 ALTER TABLE `addmodel` DISABLE KEYS */;
INSERT INTO `ange`.`addmodel` (`id`,`ModelName`,`deletestatus`) VALUES 
 (1,'40C',1),
 (2,'SDFSAF',1),
 (3,'DSAFSDAF',1),
 (4,'40C',0);
/*!40000 ALTER TABLE `addmodel` ENABLE KEYS */;


--
-- Definition of table `ange`.`addpdfgallery`
--

DROP TABLE IF EXISTS `ange`.`addpdfgallery`;
CREATE TABLE  `ange`.`addpdfgallery` (
  `lessonid` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `pdfname` varchar(255) DEFAULT NULL,
  `pdfpath` varchar(255) DEFAULT NULL,
  `videodescription` varchar(255) DEFAULT NULL,
  `course_courseId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`lessonid`),
  KEY `FK_7pbf6luras0sbcddl2e51oq7m` (`course_courseId`),
  CONSTRAINT `FK_7pbf6luras0sbcddl2e51oq7m` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`addpdfgallery`
--

/*!40000 ALTER TABLE `addpdfgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `addpdfgallery` ENABLE KEYS */;


--
-- Definition of table `ange`.`admin`
--

DROP TABLE IF EXISTS `ange`.`admin`;
CREATE TABLE  `ange`.`admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `Status` int(11) NOT NULL,
  `adminEmail` varchar(255) DEFAULT NULL,
  `adminMobileNo` varchar(255) DEFAULT NULL,
  `adminName` varchar(255) DEFAULT NULL,
  `adminPassword` varchar(255) DEFAULT NULL,
  `imagename` varchar(255) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `receptionPassword` varchar(255) DEFAULT NULL,
  `registeredDate` date DEFAULT NULL,
  `adminOfBranch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_se143i5jkhgothoaklyt0eeef` (`adminOfBranch_branchId`),
  CONSTRAINT `FK_se143i5jkhgothoaklyt0eeef` FOREIGN KEY (`adminOfBranch_branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `ange`.`admin` (`adminId`,`Status`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`imagename`,`imagepath`,`otp`,`receptionPassword`,`registeredDate`,`adminOfBranch_branchId`) VALUES 
 (1,1,'admin','8956276855','admin','admin','admin.jpg','1',123,'adminn','2018-04-16',NULL),
 (2,1,'dinesh@gmail.com','8956276855','Dinesh','599969','438689','2',0,'23623','2018-04-16',1),
 (3,1,'accedeprojects2015@gmail.com','8983728319','dfgdsg','150976','admin.jpg','2',0,'33609','2018-05-04',2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `ange`.`admission`
--

DROP TABLE IF EXISTS `ange`.`admission`;
CREATE TABLE  `ange`.`admission` (
  `AdmissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `AdmissionDate` date DEFAULT NULL,
  `Age` double NOT NULL,
  `BatchTimings` varchar(255) DEFAULT NULL,
  `ContactNo` varchar(255) DEFAULT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `DateofBirth` date DEFAULT NULL,
  `DateofBirthsmsdate` date DEFAULT NULL,
  `DaysInWeek` varchar(255) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Month` varchar(255) DEFAULT NULL,
  `Year` int(11) NOT NULL,
  `admissionFee` int(11) NOT NULL,
  `admissionNo` varchar(255) DEFAULT NULL,
  `birthdaysmsstatus` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `disamount` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `duedateSmsdate` date DEFAULT NULL,
  `duedateSmsstatus` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `finalamount` int(11) NOT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  `nextPaymentDate` date DEFAULT NULL,
  `noofBatchTimeselect` int(11) NOT NULL,
  `noofDaysselect` int(11) NOT NULL,
  `noofcourseselect` int(11) NOT NULL,
  `remaininFee` int(11) NOT NULL,
  `shiftToOldStudent` int(11) NOT NULL,
  `studentPassword` varchar(255) DEFAULT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `packageCourse_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`AdmissionId`),
  KEY `FK_6wi0kxd2bdx5ml580d1qoquu1` (`CustomerAccount_Id`),
  KEY `FK_h6dvctmfb6u6asonuc30hubbs` (`adminOfBranch_adminId`),
  KEY `FK_6l99gid64bicese8dd5921har` (`packageCourse_Id`),
  CONSTRAINT `FK_6l99gid64bicese8dd5921har` FOREIGN KEY (`packageCourse_Id`) REFERENCES `packagecourse` (`Id`),
  CONSTRAINT `FK_6wi0kxd2bdx5ml580d1qoquu1` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_h6dvctmfb6u6asonuc30hubbs` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`admission`
--

/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `ange`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseName`,`DateofBirth`,`DateofBirthsmsdate`,`DaysInWeek`,`DueDate`,`Email`,`FirstName`,`Gender`,`Image`,`JoiningDate`,`LastName`,`Month`,`Year`,`admissionFee`,`admissionNo`,`birthdaysmsstatus`,`day`,`disamount`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`fee`,`finalamount`,`imagepath`,`nextPaymentDate`,`noofBatchTimeselect`,`noofDaysselect`,`noofcourseselect`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`packageCourse_Id`) VALUES 
 (1,'sdfdsg dfgdfsgs','2018-04-16',600724371,'[7 TO 8]','8956276855','[Guitar]','2011-05-06','2018-04-16','[Monday, Tuesday, Wednesday]','2019-04-16','accedeprojects2015@gmail.com','accede','Male','Student.jpg',NULL,'Nimgare','May',2011,100,'CL1001',1,6,0,0,'2018-04-16',1,150,1100,NULL,'2018-06-17',1,3,1,0,1,'982132',1,2,2),
 (2,NULL,'2018-04-16',694464777,'[Ljava.lang.String;@fa79360','7020883247','[Ljava.lang.String;@26c8d347','2010-04-05','2018-04-16','[Ljava.lang.String;@79b47dcc','2019-04-16','accedeprojects2015@gmail.com','accede','Male','Student.jpg',NULL,'Nimgare','Apr',2010,100,'CL1002',1,5,0,0,'2018-04-16',1,1000,1100,NULL,'2018-04-18',1,2,1,1000,1,'348104',2,2,1),
 (3,'viman nagar ,pune','2018-04-16',435029382,'[Ljava.lang.String;@4d5c9075','7418526935','[Ljava.lang.String;@6ecc65a3','2013-04-05','2018-04-16','[Ljava.lang.String;@4f05d4f8','2019-04-16','accedeprojects2015@gmail.com','accede','Male','Student.jpg',NULL,'Nimgare','Apr',2013,100,'CL1003',1,5,0,0,'2018-04-16',1,1000,1100,NULL,'2018-04-17',1,2,1,100,1,'703624',3,2,1);
INSERT INTO `ange`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseName`,`DateofBirth`,`DateofBirthsmsdate`,`DaysInWeek`,`DueDate`,`Email`,`FirstName`,`Gender`,`Image`,`JoiningDate`,`LastName`,`Month`,`Year`,`admissionFee`,`admissionNo`,`birthdaysmsstatus`,`day`,`disamount`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`fee`,`finalamount`,`imagepath`,`nextPaymentDate`,`noofBatchTimeselect`,`noofDaysselect`,`noofcourseselect`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`packageCourse_Id`) VALUES 
 (4,'viman nagar ,pune','2018-04-16',788441318,'[Ljava.lang.String;@7ee4982d','8529637415','[Ljava.lang.String;@79a6a724','2009-03-04','2018-04-16','[Ljava.lang.String;@16857fba','2019-04-27','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-04-27','Nimgare','Mar',2009,100,'CL1004',1,4,0,0,'2018-04-16',1,1000,1100,NULL,'2018-04-28',1,2,1,100,1,'514990',4,2,1),
 (5,'Old Sangvi Pune 411027','2018-04-16',2118292681,'[Ljava.lang.String;@1bc0884b','9766828175','[Ljava.lang.String;@51919c03','1993-10-16','2018-04-16','[Ljava.lang.String;@14068894','2019-04-21','ronitgawali@gmail.com','Ronit','Male','Student.jpg','2018-04-21','Gawali','Oct',1993,100,'CL1005',1,16,0,0,'2018-04-16',1,1000,1100,NULL,'2018-04-22',1,2,1,0,1,'242504',5,2,1),
 (6,'Karad Jhilla','2018-04-16',1964194054,'[7 TO 8]','9405249779','[Guitar, Vocal]','1995-07-29','2018-04-16','[Monday, Tuesday]','2019-07-16','shubhadap29@gmail.com','Shubh','Female','Student.jpg','2018-07-16','Patil','Jul',1995,100,'CL1006',1,29,0,0,'2018-04-16',1,1000,1100,NULL,'2018-07-17',1,2,2,0,1,'867007',6,2,1);
INSERT INTO `ange`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseName`,`DateofBirth`,`DateofBirthsmsdate`,`DaysInWeek`,`DueDate`,`Email`,`FirstName`,`Gender`,`Image`,`JoiningDate`,`LastName`,`Month`,`Year`,`admissionFee`,`admissionNo`,`birthdaysmsstatus`,`day`,`disamount`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`fee`,`finalamount`,`imagepath`,`nextPaymentDate`,`noofBatchTimeselect`,`noofDaysselect`,`noofcourseselect`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`packageCourse_Id`) VALUES 
 (7,'viman nagar ,pune','2018-04-17',946053326,'[7 TO 8]','7894561235','[Guitar, Vocal]','2007-05-09','2018-04-17','[Monday, Tuesday]','2019-04-20','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-04-20','Nimgare','May',2007,100,'CL1007',1,9,0,0,'2018-04-17',1,1000,1100,NULL,'2018-04-21',1,2,11,0,1,'529294',7,2,1),
 (8,'viman nagar ,pune','2018-04-18',694640693,'[7 TO 8]','976245737','[Guitar, Vocal]','2010-04-06','2018-04-18','[Monday, Tuesday]','2019-04-20','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-04-20','Ghosh','Apr',2010,100,'CL1008',1,6,0,0,'2018-04-18',1,1000,1100,NULL,'2018-04-21',1,2,11,0,1,'809287',8,2,1),
 (9,'viman nagar ,pune','2018-04-18',515215415,'[7 TO 8]','8788019374','[Guitar, Vocal]','2012-05-03','2018-04-18','[Monday, Tuesday]','2019-04-20','accedeprojects2015@gmail.com','accede','Female','Student.jpg','2018-04-20','Nimgare','May',2012,100,'CL1009',1,3,0,0,'2018-04-18',1,1000,1100,NULL,'2018-04-23',1,2,11,-500,1,'262944',9,2,1);
INSERT INTO `ange`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseName`,`DateofBirth`,`DateofBirthsmsdate`,`DaysInWeek`,`DueDate`,`Email`,`FirstName`,`Gender`,`Image`,`JoiningDate`,`LastName`,`Month`,`Year`,`admissionFee`,`admissionNo`,`birthdaysmsstatus`,`day`,`disamount`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`fee`,`finalamount`,`imagepath`,`nextPaymentDate`,`noofBatchTimeselect`,`noofDaysselect`,`noofcourseselect`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`packageCourse_Id`) VALUES 
 (10,'viman nagar ,pune','2018-04-18',1111982764,'[7 TO 8]','741852654','[Guitar, Vocal]','2005-06-08','2018-04-18','[Monday, Tuesday]','2019-04-21','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-04-21','Nimgare','Jun',2005,100,'CL1010',1,8,0,0,'2018-04-18',1,1000,1100,NULL,'2018-04-22',1,2,11,0,1,'209364',10,2,1),
 (11,'viman nagar ,pune','2018-04-18',536063335,'[7 TO 8]','8983728314','[Guitar, Vocal]','2012-02-05','2018-04-18','[Monday, Tuesday]','2019-04-21','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-04-21','Nimgare','Feb',2012,100,'CL1011',1,5,0,0,'2018-04-18',1,1000,1100,NULL,'2018-04-22',1,2,2,150,1,'972559',11,2,1),
 (12,'viman nagar ,pune','2018-04-28',589534822,'[7 TO 8]','9517536545','[Guitar, Vocal]','2011-07-04','2018-04-28','[Monday, Tuesday]','2019-04-30','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-04-30','Nimgare','Jul',2011,100,'CL1012',1,4,0,0,'2018-04-28',1,1000,1100,NULL,'2018-05-01',1,2,2,0,1,'220236',17,2,1);
INSERT INTO `ange`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseName`,`DateofBirth`,`DateofBirthsmsdate`,`DaysInWeek`,`DueDate`,`Email`,`FirstName`,`Gender`,`Image`,`JoiningDate`,`LastName`,`Month`,`Year`,`admissionFee`,`admissionNo`,`birthdaysmsstatus`,`day`,`disamount`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`fee`,`finalamount`,`imagepath`,`nextPaymentDate`,`noofBatchTimeselect`,`noofDaysselect`,`noofcourseselect`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`packageCourse_Id`) VALUES 
 (13,'viman nagar ,pune','2018-04-30',739360119,'[7 TO 8]','9856276855','[Guitar, Vocal]','2009-10-11','2018-04-30','[Monday, Tuesday]','2019-04-30','accedeprojects2015@gmail.com','Dinesh','Male','Student.jpg','2018-04-30','Satelkar','Oct',2009,100,'CL1013',1,11,0,0,'2018-04-30',1,1000,1100,NULL,'2018-12-26',1,2,2,0,1,'876509',22,2,1),
 (14,'viman nagar ,pune','2018-04-30',676422408,'[7 TO 8]','7020883248','[Guitar, Vocal]','2010-07-04','2018-04-30','[Monday, Tuesday]','2019-05-31','accedeprojects2015@gmail.com','accede','Male','Student.jpg','2018-05-31','Nimgare','Jul',2010,100,'CL1014',1,4,0,0,'2018-04-30',1,1000,1100,NULL,'2018-06-30',1,2,2,1000,1,'768318',23,2,1),
 (15,'viman nagar ,pune','2018-05-03',533179408,'[7 TO 8]','9637531595','[Guitar, Vocal]','2012-03-03','2018-05-03','[Monday, Tuesday]','2019-05-18','accedeprojects2015@gmail.com','sdf','','Student.jpg','2018-05-18','sdf','Mar',2012,100,'CL1015',1,3,0,0,'2018-05-03',1,1000,1100,NULL,'2018-06-17',1,2,2,0,1,'872934',26,2,1);
INSERT INTO `ange`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseName`,`DateofBirth`,`DateofBirthsmsdate`,`DaysInWeek`,`DueDate`,`Email`,`FirstName`,`Gender`,`Image`,`JoiningDate`,`LastName`,`Month`,`Year`,`admissionFee`,`admissionNo`,`birthdaysmsstatus`,`day`,`disamount`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`fee`,`finalamount`,`imagepath`,`nextPaymentDate`,`noofBatchTimeselect`,`noofDaysselect`,`noofcourseselect`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`packageCourse_Id`) VALUES 
 (16,'viman nagar ,pune','2018-05-03',691303865,'[7 TO 8]','8462539765','[Guitar, Vocal]','2010-05-05','2018-05-03','[Monday, Tuesday]','2019-05-08','accedeprojects2015@gmail.com','fdhfdh','Male','Student.jpg','2018-05-08','fdghfdgh','May',2010,100,'CL1016',1,5,0,0,'2018-05-03',1,1000,1100,NULL,'2018-06-07',1,2,2,1000,1,'668983',27,2,1),
 (17,'viman nagar ,pune','2018-05-03',590963408,'[7 TO 8]','8983728316','[Guitar, Vocal]','2011-07-03','2018-05-03','[Tuesday, Wednesday]','2019-05-18','accedeprojects2015@gmail.com','Raju Dalvi','Male','Student.jpg','2018-05-18',NULL,'Jul',2011,100,'CL1017',1,3,0,0,'2018-05-03',1,1000,1100,NULL,'2018-06-17',1,2,2,1000,1,'433619',31,2,1),
 (18,'viman nagar ,pune','2018-05-18',1307516244,'[7 TO 8]','6546541651','[Guitar]','2003-04-04','2018-05-18','[Monday, Tuesday]','2018-05-27','accedeprojects2015@gmail.com','Raju Dalvi','Male','702896image.png','2018-05-26',NULL,'Apr',2003,100,'CL1018',1,4,0,0,'2018-05-18',1,1000,1100,'/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT/StudentImages/702896image.png','2018-06-25',1,2,1,0,1,'184536',38,2,1);
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;


--
-- Definition of table `ange`.`admission_studentaccount`
--

DROP TABLE IF EXISTS `ange`.`admission_studentaccount`;
CREATE TABLE  `ange`.`admission_studentaccount` (
  `Admission_AdmissionId` bigint(20) NOT NULL,
  `studentAccount_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_52rhdx0rrfuo05e44tfg7a7gf` (`studentAccount_AccountId`),
  KEY `FK_52rhdx0rrfuo05e44tfg7a7gf` (`studentAccount_AccountId`),
  KEY `FK_lo1a4008hb80jvkoq2eck24n3` (`Admission_AdmissionId`),
  CONSTRAINT `FK_52rhdx0rrfuo05e44tfg7a7gf` FOREIGN KEY (`studentAccount_AccountId`) REFERENCES `studentaccount` (`AccountId`),
  CONSTRAINT `FK_lo1a4008hb80jvkoq2eck24n3` FOREIGN KEY (`Admission_AdmissionId`) REFERENCES `admission` (`AdmissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`admission_studentaccount`
--

/*!40000 ALTER TABLE `admission_studentaccount` DISABLE KEYS */;
INSERT INTO `ange`.`admission_studentaccount` (`Admission_AdmissionId`,`studentAccount_AccountId`) VALUES 
 (1,1),
 (1,8),
 (1,10),
 (1,28),
 (1,29),
 (1,30),
 (1,32),
 (1,33),
 (2,2),
 (2,9),
 (3,3),
 (4,4),
 (5,5),
 (6,6),
 (7,7),
 (8,11),
 (8,12),
 (8,13),
 (8,25),
 (8,26),
 (8,27),
 (9,14),
 (9,15),
 (9,16),
 (9,17),
 (9,18),
 (9,19),
 (9,20),
 (10,21),
 (11,22),
 (11,23),
 (11,24),
 (12,31),
 (13,34),
 (13,35),
 (13,36),
 (13,38),
 (13,39),
 (13,40),
 (13,41),
 (13,42),
 (14,43),
 (15,44),
 (16,45),
 (17,46),
 (18,47);
/*!40000 ALTER TABLE `admission_studentaccount` ENABLE KEYS */;


--
-- Definition of table `ange`.`advanceamount`
--

DROP TABLE IF EXISTS `ange`.`advanceamount`;
CREATE TABLE  `ange`.`advanceamount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DueDate` date DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentTime` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iabrqfp2u7qs524i2ic0cgona` (`CustomerAccount_Id`),
  CONSTRAINT `FK_iabrqfp2u7qs524i2ic0cgona` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`advanceamount`
--

/*!40000 ALTER TABLE `advanceamount` DISABLE KEYS */;
INSERT INTO `ange`.`advanceamount` (`id`,`DueDate`,`amount`,`paymentDate`,`paymentTime`,`reason`,`CustomerAccount_Id`) VALUES 
 (1,'2018-05-26',5000,'2018-05-19','2018-05-19 15:41:59','dsfsdfsdf',1),
 (2,'2018-05-26',70000,'2018-05-19','2018-05-19 15:46:57','dsfsdfsdf',3),
 (3,'2018-05-26',1200,'2018-05-19','2018-05-19 15:47:29','dsfsdfsdf',5),
 (4,'2018-05-30',5000,'2018-05-21','2018-05-21 12:17:47','gUIATRE',5);
/*!40000 ALTER TABLE `advanceamount` ENABLE KEYS */;


--
-- Definition of table `ange`.`assignpaymenthistory`
--

DROP TABLE IF EXISTS `ange`.`assignpaymenthistory`;
CREATE TABLE  `ange`.`assignpaymenthistory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` int(11) NOT NULL,
  `Course` varchar(255) DEFAULT NULL,
  `admin` tinyblob,
  `dateupload` date DEFAULT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_av1dnpli60dmi8hq6a03l2ksb` (`admin_adminId`),
  CONSTRAINT `FK_av1dnpli60dmi8hq6a03l2ksb` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`assignpaymenthistory`
--

/*!40000 ALTER TABLE `assignpaymenthistory` DISABLE KEYS */;
INSERT INTO `ange`.`assignpaymenthistory` (`Id`,`Amount`,`Course`,`admin`,`dateupload`,`admin_adminId`) VALUES 
 (1,500,'Guitar',NULL,'2018-05-12',2),
 (2,500,'Guitar',NULL,'2018-05-12',2),
 (3,5000,'Vocal',NULL,'2018-05-12',2),
 (4,500,'Guitar',NULL,'2018-05-12',3),
 (5,6000,'Vocal',NULL,'2018-05-12',3),
 (6,1000,'Guitar',NULL,'2018-05-19',2);
/*!40000 ALTER TABLE `assignpaymenthistory` ENABLE KEYS */;


--
-- Definition of table `ange`.`assignpdfadmin`
--

DROP TABLE IF EXISTS `ange`.`assignpdfadmin`;
CREATE TABLE  `ange`.`assignpdfadmin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Course` varchar(255) DEFAULT NULL,
  `totalAmount` int(11) NOT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  `dateupload` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_qm04cd3jrfcn9dmnpu79ccmou` (`admin_adminId`),
  CONSTRAINT `FK_qm04cd3jrfcn9dmnpu79ccmou` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`assignpdfadmin`
--

/*!40000 ALTER TABLE `assignpdfadmin` DISABLE KEYS */;
INSERT INTO `ange`.`assignpdfadmin` (`Id`,`Course`,`totalAmount`,`admin_adminId`,`dateupload`) VALUES 
 (1,'Guitar',6500,2,'2018-05-12'),
 (2,'Vocal',6500,3,'2018-05-12');
/*!40000 ALTER TABLE `assignpdfadmin` ENABLE KEYS */;


--
-- Definition of table `ange`.`assignpdfadmin_assignpaymenthistory`
--

DROP TABLE IF EXISTS `ange`.`assignpdfadmin_assignpaymenthistory`;
CREATE TABLE  `ange`.`assignpdfadmin_assignpaymenthistory` (
  `AssignPDFAdmin_Id` int(11) NOT NULL,
  `assignPaymentHistory_Id` int(11) NOT NULL,
  UNIQUE KEY `UK_4y1lkqomjishh73n0vaulnfbe` (`assignPaymentHistory_Id`),
  KEY `FK_4y1lkqomjishh73n0vaulnfbe` (`assignPaymentHistory_Id`),
  KEY `FK_lj0ggvbwausihv00yg5f844vh` (`AssignPDFAdmin_Id`),
  CONSTRAINT `FK_4y1lkqomjishh73n0vaulnfbe` FOREIGN KEY (`assignPaymentHistory_Id`) REFERENCES `assignpaymenthistory` (`Id`),
  CONSTRAINT `FK_lj0ggvbwausihv00yg5f844vh` FOREIGN KEY (`AssignPDFAdmin_Id`) REFERENCES `assignpdfadmin` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`assignpdfadmin_assignpaymenthistory`
--

/*!40000 ALTER TABLE `assignpdfadmin_assignpaymenthistory` DISABLE KEYS */;
INSERT INTO `ange`.`assignpdfadmin_assignpaymenthistory` (`AssignPDFAdmin_Id`,`assignPaymentHistory_Id`) VALUES 
 (1,2),
 (1,3),
 (1,6),
 (2,4),
 (2,5);
/*!40000 ALTER TABLE `assignpdfadmin_assignpaymenthistory` ENABLE KEYS */;


--
-- Definition of table `ange`.`bankdetails`
--

DROP TABLE IF EXISTS `ange`.`bankdetails`;
CREATE TABLE  `ange`.`bankdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aadharNo` bigint(20) NOT NULL,
  `bankAccountNo` bigint(20) NOT NULL,
  `bankAddress` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `branchName` varchar(255) DEFAULT NULL,
  `ifscCode` varchar(255) DEFAULT NULL,
  `panNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`bankdetails`
--

/*!40000 ALTER TABLE `bankdetails` DISABLE KEYS */;
INSERT INTO `ange`.`bankdetails` (`id`,`aadharNo`,`bankAccountNo`,`bankAddress`,`bankName`,`branchName`,`ifscCode`,`panNumber`) VALUES 
 (1,513545641,4134563456,'fdseffrd','dwsad','sadwa','ds','se'),
 (2,123654789651,18880100014885,'viman nagar ,pune','no','samarth Nagar','BARB0SAMART','fat121k');
/*!40000 ALTER TABLE `bankdetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`barcode`
--

DROP TABLE IF EXISTS `ange`.`barcode`;
CREATE TABLE  `ange`.`barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(255) DEFAULT NULL,
  `BarcodePath` varchar(255) DEFAULT NULL,
  `imagename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`barcode`
--

/*!40000 ALTER TABLE `barcode` DISABLE KEYS */;
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (1,'440623295','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/378062image.png.png','378062image.png.png'),
 (2,'741469704','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/986177image.png.png','986177image.png.png'),
 (3,'667906517','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/380382image.png.png','380382image.png.png'),
 (4,'802612915','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/849603image.png.png','849603image.png.png'),
 (5,'91088990','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/526045image.png.png','526045image.png.png'),
 (6,'211407509','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/426071image.png.png','426071image.png.png'),
 (7,'125888293','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/444330image.png.png','444330image.png.png'),
 (8,'935022885','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/937601image.png.png','937601image.png.png'),
 (9,'995755458','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/536595image.png.png','536595image.png.png');
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (10,'70143632','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/930033image.png.png','930033image.png.png'),
 (11,'508832377','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/395898image.png.png','395898image.png.png'),
 (12,'942055923','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/879962image.png.png','879962image.png.png'),
 (13,'647494488','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/359013image.png.png','359013image.png.png'),
 (14,'927612175','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/171550image.png.png','171550image.png.png'),
 (15,'22380637','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/899354image.png.png','899354image.png.png'),
 (16,'766269576','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/391855image.png.png','391855image.png.png'),
 (17,'966380112','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/477198image.png.png','477198image.png.png'),
 (18,'113495415','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/795430image.png.png','795430image.png.png');
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (19,'809427167','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/912844image.png.png','912844image.png.png'),
 (20,'196026960','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/285385image.png.png','285385image.png.png'),
 (21,'197262204','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/972849image.png.png','972849image.png.png'),
 (22,'44574043','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/445711image.png.png','445711image.png.png'),
 (23,'760902217','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/134655image.png.png','134655image.png.png'),
 (24,'649429654','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/767954image.png.png','767954image.png.png'),
 (25,'569362886','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/812163image.png.png','812163image.png.png'),
 (26,'228772263','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/698180image.png.png','698180image.png.png'),
 (27,'400752261','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/892273image.png.png','892273image.png.png');
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (28,'348887452','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/181477image.png.png','181477image.png.png'),
 (29,'707328106','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/413533image.png.png','413533image.png.png'),
 (30,'413129369','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/162183image.png.png','162183image.png.png'),
 (31,'390043661','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/215251image.png.png','215251image.png.png'),
 (32,'992945768','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/903183image.png.png','903183image.png.png'),
 (33,'839451592','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/194288image.png.png','194288image.png.png'),
 (34,'219773706','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/271637image.png.png','271637image.png.png'),
 (35,'826644226','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/873882image.png.png','873882image.png.png'),
 (36,'735325178','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/662027image.png.png','662027image.png.png');
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (37,'805129367','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/842390image.png.png','842390image.png.png'),
 (38,'680381097','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/770255image.png.png','770255image.png.png'),
 (39,'738210411','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/934748image.png.png','934748image.png.png'),
 (40,'391765826','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/453718image.png.png','453718image.png.png'),
 (41,'580770992','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/963749image.png.png','963749image.png.png'),
 (42,'359581969','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/571577image.png.png','571577image.png.png'),
 (43,'23393295','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/782050image.png.png','782050image.png.png'),
 (44,'276432020','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/699052image.png.png','699052image.png.png'),
 (45,'751435542','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/947674image.png.png','947674image.png.png');
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (46,'666350472','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/363474image.png.png','363474image.png.png'),
 (47,'350503672','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/206143image.png.png','206143image.png.png'),
 (48,'793466895','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/698703image.png.png','698703image.png.png'),
 (49,'571390869','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/490396image.png.png','490396image.png.png'),
 (50,'245713298','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/393241image.png.png','393241image.png.png'),
 (51,'876098502','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/871392image.png.png','871392image.png.png'),
 (52,'418198651','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/824768image.png.png','824768image.png.png'),
 (53,'502754541','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/460687image.png.png','460687image.png.png'),
 (54,'484662119','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/978399image.png.png','978399image.png.png');
INSERT INTO `ange`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (55,'581080272','/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/534958image.png.png','534958image.png.png');
/*!40000 ALTER TABLE `barcode` ENABLE KEYS */;


--
-- Definition of table `ange`.`batchtime`
--

DROP TABLE IF EXISTS `ange`.`batchtime`;
CREATE TABLE  `ange`.`batchtime` (
  `batchTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `batchTiming` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`batchTimeId`),
  KEY `FK_tn1c447cwurqgm5nf062msgpr` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_tn1c447cwurqgm5nf062msgpr` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`batchtime`
--

/*!40000 ALTER TABLE `batchtime` DISABLE KEYS */;
INSERT INTO `ange`.`batchtime` (`batchTimeId`,`batchTiming`,`adminOfBranch_adminId`) VALUES 
 (1,'7 TO 8',2);
/*!40000 ALTER TABLE `batchtime` ENABLE KEYS */;


--
-- Definition of table `ange`.`batchtimings`
--

DROP TABLE IF EXISTS `ange`.`batchtimings`;
CREATE TABLE  `ange`.`batchtimings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batchTiming` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`batchtimings`
--

/*!40000 ALTER TABLE `batchtimings` DISABLE KEYS */;
INSERT INTO `ange`.`batchtimings` (`id`,`batchTiming`) VALUES 
 (1,'7'),
 (2,'8');
/*!40000 ALTER TABLE `batchtimings` ENABLE KEYS */;


--
-- Definition of table `ange`.`branch`
--

DROP TABLE IF EXISTS `ange`.`branch`;
CREATE TABLE  `ange`.`branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `adminEmail` varchar(255) DEFAULT NULL,
  `adminMobileNo` varchar(255) DEFAULT NULL,
  `adminName` varchar(255) DEFAULT NULL,
  `adminPassword` varchar(255) DEFAULT NULL,
  `branchAddress` varchar(255) DEFAULT NULL,
  `branchAddress1` varchar(255) DEFAULT NULL,
  `branchAddress2` varchar(255) DEFAULT NULL,
  `branchName` varchar(255) DEFAULT NULL,
  `branchRegisteredDate` date DEFAULT NULL,
  `receptionPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `ange`.`branch` (`branchId`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`branchAddress`,`branchAddress1`,`branchAddress2`,`branchName`,`branchRegisteredDate`,`receptionPassword`) VALUES 
 (1,'dinesh@gmail.com','8956276855','Dinesh','599969','Kharadi','Pune','Kharadi  Pune','VISHRATWADI','2018-04-16','23623'),
 (2,'accedeprojects2015@gmail.com','8983728319','dfgdsg','150976','viman nagar ,pune','Maharashtra','Vishrantvadi Pune 411015','LOHEGAON','2018-05-04','33609');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchclassproduct`
--

DROP TABLE IF EXISTS `ange`.`branchclassproduct`;
CREATE TABLE  `ange`.`branchclassproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Modelid` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `catid` bigint(20) NOT NULL,
  `colorModelid` int(11) NOT NULL,
  `productBarcode` varchar(255) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `productquantity` bigint(20) NOT NULL,
  `subcatid` bigint(20) NOT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lrn4yrr7bfcptwrlrnv0qh6l6` (`admin_adminId`),
  KEY `FK_a0u9ud4w5lsfaqp9ch7fmw1ss` (`product_id`),
  CONSTRAINT `FK_a0u9ud4w5lsfaqp9ch7fmw1ss` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`),
  CONSTRAINT `FK_lrn4yrr7bfcptwrlrnv0qh6l6` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchclassproduct`
--

/*!40000 ALTER TABLE `branchclassproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchclassproduct` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchclasssale`
--

DROP TABLE IF EXISTS `ange`.`branchclasssale`;
CREATE TABLE  `ange`.`branchclasssale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `totalquantity` bigint(20) NOT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o504da0jsl9wiinguw99qu9xk` (`admin_adminId`),
  CONSTRAINT `FK_o504da0jsl9wiinguw99qu9xk` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchclasssale`
--

/*!40000 ALTER TABLE `branchclasssale` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchclasssale` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchclasssale_branchclassselldetails`
--

DROP TABLE IF EXISTS `ange`.`branchclasssale_branchclassselldetails`;
CREATE TABLE  `ange`.`branchclasssale_branchclassselldetails` (
  `BranchClassSale_id` int(11) NOT NULL,
  `branchsaledetails_id` int(11) NOT NULL,
  UNIQUE KEY `UK_6rx7goh8ypnwnufr5fc8rqs32` (`branchsaledetails_id`),
  KEY `FK_6rx7goh8ypnwnufr5fc8rqs32` (`branchsaledetails_id`),
  KEY `FK_qf1vbnnx7q00t46el1c513uch` (`BranchClassSale_id`),
  CONSTRAINT `FK_6rx7goh8ypnwnufr5fc8rqs32` FOREIGN KEY (`branchsaledetails_id`) REFERENCES `branchclassselldetails` (`id`),
  CONSTRAINT `FK_qf1vbnnx7q00t46el1c513uch` FOREIGN KEY (`BranchClassSale_id`) REFERENCES `branchclasssale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchclasssale_branchclassselldetails`
--

/*!40000 ALTER TABLE `branchclasssale_branchclassselldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchclasssale_branchclassselldetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchclassselldetails`
--

DROP TABLE IF EXISTS `ange`.`branchclassselldetails`;
CREATE TABLE  `ange`.`branchclassselldetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cgst` float NOT NULL,
  `Discountper` float NOT NULL,
  `Hsn` varchar(255) DEFAULT NULL,
  `Igst` float NOT NULL,
  `PurchasePrice` float NOT NULL,
  `Sgst` float NOT NULL,
  `UnitPrice` float NOT NULL,
  `date` date DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oy2t5uj7ntd0j6a69dxvyupxa` (`product_id`),
  CONSTRAINT `FK_oy2t5uj7ntd0j6a69dxvyupxa` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchclassselldetails`
--

/*!40000 ALTER TABLE `branchclassselldetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchclassselldetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchproduct`
--

DROP TABLE IF EXISTS `ange`.`branchproduct`;
CREATE TABLE  `ange`.`branchproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `productBarcode` varchar(255) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `productquantity` bigint(20) NOT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `Modelid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `catid` bigint(20) NOT NULL,
  `colorModelid` int(11) NOT NULL,
  `subcatid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_am4e67nje14tav0xq8vbb0yhv` (`admin_adminId`),
  KEY `FK_tbrk3l6dmi95krhrismib6m49` (`product_id`),
  CONSTRAINT `FK_am4e67nje14tav0xq8vbb0yhv` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_tbrk3l6dmi95krhrismib6m49` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchproduct`
--

/*!40000 ALTER TABLE `branchproduct` DISABLE KEYS */;
INSERT INTO `ange`.`branchproduct` (`id`,`adminid`,`productBarcode`,`productid`,`productquantity`,`admin_adminId`,`product_id`,`Modelid`,`brandid`,`catid`,`colorModelid`,`subcatid`) VALUES 
 (2,2,'802612915',2,2,2,2,2,1,2,1,2),
 (3,2,'91088990',3,3,2,3,2,2,2,2,2);
/*!40000 ALTER TABLE `branchproduct` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchsale`
--

DROP TABLE IF EXISTS `ange`.`branchsale`;
CREATE TABLE  `ange`.`branchsale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `totalquantity` bigint(20) NOT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qk7j1r48vy821gfc2yo0rh6ed` (`admin_adminId`),
  CONSTRAINT `FK_qk7j1r48vy821gfc2yo0rh6ed` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchsale`
--

/*!40000 ALTER TABLE `branchsale` DISABLE KEYS */;
INSERT INTO `ange`.`branchsale` (`id`,`adminid`,`date`,`totalquantity`,`admin_adminId`) VALUES 
 (3,2,'2018-05-17',10,2),
 (4,2,'2018-05-17',4,2);
/*!40000 ALTER TABLE `branchsale` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchsale_branchsaledetails`
--

DROP TABLE IF EXISTS `ange`.`branchsale_branchsaledetails`;
CREATE TABLE  `ange`.`branchsale_branchsaledetails` (
  `BranchSale_id` int(11) NOT NULL,
  `branchsaledetails_id` int(11) NOT NULL,
  UNIQUE KEY `UK_t17fokmuh8gsb7f4o6sbay3cr` (`branchsaledetails_id`),
  KEY `FK_t17fokmuh8gsb7f4o6sbay3cr` (`branchsaledetails_id`),
  KEY `FK_n2bsd7ris2d725nm5b0p1lwyn` (`BranchSale_id`),
  CONSTRAINT `FK_n2bsd7ris2d725nm5b0p1lwyn` FOREIGN KEY (`BranchSale_id`) REFERENCES `branchsale` (`id`),
  CONSTRAINT `FK_t17fokmuh8gsb7f4o6sbay3cr` FOREIGN KEY (`branchsaledetails_id`) REFERENCES `branchsaledetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchsale_branchsaledetails`
--

/*!40000 ALTER TABLE `branchsale_branchsaledetails` DISABLE KEYS */;
INSERT INTO `ange`.`branchsale_branchsaledetails` (`BranchSale_id`,`branchsaledetails_id`) VALUES 
 (3,3),
 (4,4);
/*!40000 ALTER TABLE `branchsale_branchsaledetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`branchsaledetails`
--

DROP TABLE IF EXISTS `ange`.`branchsaledetails`;
CREATE TABLE  `ange`.`branchsaledetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `Cgst` float NOT NULL,
  `Discountper` float NOT NULL,
  `Hsn` varchar(255) DEFAULT NULL,
  `Igst` float NOT NULL,
  `PurchasePrice` float NOT NULL,
  `Sgst` float NOT NULL,
  `UnitPrice` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sgvwpr5w74sgsm2hieb9cl33r` (`product_id`),
  CONSTRAINT `FK_sgvwpr5w74sgsm2hieb9cl33r` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`branchsaledetails`
--

/*!40000 ALTER TABLE `branchsaledetails` DISABLE KEYS */;
INSERT INTO `ange`.`branchsaledetails` (`id`,`date`,`productname`,`productquantity`,`product_id`,`Cgst`,`Discountper`,`Hsn`,`Igst`,`PurchasePrice`,`Sgst`,`UnitPrice`) VALUES 
 (3,'2018-05-17','NA',10,2,0,0,NULL,0,0,0,0),
 (4,'2018-05-17','NA',4,3,0,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `branchsaledetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`brand`
--

DROP TABLE IF EXISTS `ange`.`brand`;
CREATE TABLE  `ange`.`brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Brand` varchar(255) DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`brand`
--

/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `ange`.`brand` (`id`,`Brand`,`deletestatus`) VALUES 
 (1,'SFDHGFDHFGHFGH',1),
 (2,'GFHFDGHGFH',1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;


--
-- Definition of table `ange`.`category`
--

DROP TABLE IF EXISTS `ange`.`category`;
CREATE TABLE  `ange`.`category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `ange`.`category` (`id`,`Category`,`deletestatus`) VALUES 
 (1,'SDFVGHV',1),
 (2,'DFGHFDGH',1),
 (3,'GHDFGH',1),
 (4,'GFHFHGF',1),
 (5,'FGHFG',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `ange`.`classenquiry`
--

DROP TABLE IF EXISTS `ange`.`classenquiry`;
CREATE TABLE  `ange`.`classenquiry` (
  `ClassEnquiryId` int(11) NOT NULL AUTO_INCREMENT,
  `BatchTiming` varchar(255) DEFAULT NULL,
  `Days` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `Mobile` varchar(255) DEFAULT NULL,
  `InstrumentName_instrumentId` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClassEnquiryId`),
  KEY `FK_fuym1s3cx0ohhehpbh53jj6j3` (`InstrumentName_instrumentId`),
  KEY `FK_sgr8ha8emt79hh7tyagqsb0uf` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_fuym1s3cx0ohhehpbh53jj6j3` FOREIGN KEY (`InstrumentName_instrumentId`) REFERENCES `instrument` (`instrumentId`),
  CONSTRAINT `FK_sgr8ha8emt79hh7tyagqsb0uf` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`classenquiry`
--

/*!40000 ALTER TABLE `classenquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `classenquiry` ENABLE KEYS */;


--
-- Definition of table `ange`.`colormodel`
--

DROP TABLE IF EXISTS `ange`.`colormodel`;
CREATE TABLE  `ange`.`colormodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ColorName` varchar(255) DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`colormodel`
--

/*!40000 ALTER TABLE `colormodel` DISABLE KEYS */;
INSERT INTO `ange`.`colormodel` (`id`,`ColorName`,`deletestatus`) VALUES 
 (1,'XCDFHFX',1),
 (2,'DFHFGH',1),
 (3,'FGHFGDF',1),
 (4,'DFHFGHFGHF',1);
/*!40000 ALTER TABLE `colormodel` ENABLE KEYS */;


--
-- Definition of table `ange`.`course`
--

DROP TABLE IF EXISTS `ange`.`course`;
CREATE TABLE  `ange`.`course` (
  `courseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) DEFAULT NULL,
  `nooflesson` bigint(20) NOT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `ange`.`course` (`courseId`,`courseName`,`nooflesson`) VALUES 
 (1,'Guitar',10),
 (2,'Vocal',10);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


--
-- Definition of table `ange`.`customeraccount`
--

DROP TABLE IF EXISTS `ange`.`customeraccount`;
CREATE TABLE  `ange`.`customeraccount` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountBalance` float NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `IdProofType` varchar(255) DEFAULT NULL,
  `customerIdProof` varchar(255) DEFAULT NULL,
  `AdvanceAmount` float NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_n6pfnm0gkvpxdn9fnygwc0x6b` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_n6pfnm0gkvpxdn9fnygwc0x6b` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`customeraccount`
--

/*!40000 ALTER TABLE `customeraccount` DISABLE KEYS */;
INSERT INTO `ange`.`customeraccount` (`Id`,`AccountBalance`,`Address`,`Email`,`MobileNo`,`Name`,`adminOfBranch_adminId`,`Image`,`IdProofType`,`customerIdProof`,`AdvanceAmount`) VALUES 
 (1,29700,'sdfdsg dfgdfsgs','accedeprojects2015@gmail.com','8956276855','accede',2,'Student.jpg','Pan Card','dfgdf',0),
 (2,1000,'hgfgjhghj','sd@df.df','7020883247','Dijen',2,'Student.jpg',NULL,NULL,0),
 (3,70000,'viman nagar ,pune','accedeprojects2015@gmail.com','7418526935','accede',2,'Student.jpg','NA','NA',0),
 (4,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8529637415','accede',2,'Student.jpg','NA','NA',0),
 (5,0,'Old Sangvi','ronitgawali@gmail.com','9766828175','Ronit Gawali',2,'Student.jpg','NA','NA',6200),
 (6,0,'Karad Jhilla','shubhadap29@gmail.com','9405249779','Shubh',2,'Student.jpg','NA','NA',0),
 (7,100,'sdgfvshgdvfhg','d@vacsd.sdhf','7894561235','Sub',2,'Student.jpg','NA','NA',0),
 (8,110,'sjhdghjhbdsjkfg','musicofindia2@gmail.com','976245737','Akshay D',2,'Student.jpg','NA','NA',0),
 (9,5600,'sdufgdsf','shubh@gmail.com','8788019374','Shubhada Patil',2,'Student.jpg','NA','NA',0);
INSERT INTO `ange`.`customeraccount` (`Id`,`AccountBalance`,`Address`,`Email`,`MobileNo`,`Name`,`adminOfBranch_adminId`,`Image`,`IdProofType`,`customerIdProof`,`AdvanceAmount`) VALUES 
 (10,1100,'viman nagar ,pune','accedeprojects2015@gmail.com','741852654','accede',2,'Student.jpg',NULL,'NA',0),
 (11,150,'viman nagar ,pune','accedeprojects2015@gmail.com','8983728314','accede',2,'Student.jpg',NULL,'NA',0),
 (15,0,'viman nagar ,pune','accedeprojects2015@gmail.com','9607048314','Raju',2,'Student.jpg',NULL,'NA',0),
 (16,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8983728319','accede',2,'Student.jpg',NULL,'NA',0),
 (17,0,'viman nagar ,pune','accedeprojects2015@gmail.com','9517536545','accede',2,'Student.jpg',NULL,'NA',0),
 (18,0,'asdadfff','accedeprojects2015@gmail.com','8983728315','accede',2,'Student.jpg',NULL,'NA',0),
 (19,0,NULL,NULL,'5666','accede',2,'Student.jpg',NULL,'NA',0),
 (20,0,'sdfaf','','1516','afdsf',2,'Student.jpg',NULL,'NA',0),
 (21,0,'sadf','sadf','8852963741','sdf',2,'Student.jpg',NULL,'NA',0),
 (22,2400,'viman nagar ,pune','accedeprojects2015@gmail.com','9856276855','Dinesh',2,'Student.jpg',NULL,'NA',0);
INSERT INTO `ange`.`customeraccount` (`Id`,`AccountBalance`,`Address`,`Email`,`MobileNo`,`Name`,`adminOfBranch_adminId`,`Image`,`IdProofType`,`customerIdProof`,`AdvanceAmount`) VALUES 
 (23,0,'viman nagar ,pune','accedeprojects2015@gmail.com','7020883248','accede',2,'Student.jpg',NULL,'NA',0),
 (24,8000,'werf','tushar@gmail.com','848494246','tushar',2,'Student.jpg','Adhar Card','777774444111',0),
 (25,0,'wserf erf ','shubh','7848091032','shubh',2,'Student.jpg',NULL,'NA',0),
 (26,0,'viman nagar ,pune','accedeprojects2015@gmail.com','9637531595','sdf',2,'Student.jpg',NULL,'NA',0),
 (27,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8462539765','fdhfdh',2,'Student.jpg',NULL,'NA',0),
 (28,0,'viman nagar ,pune','accedeprojects2015@gmail.com','7855556241','Dinesh Satelkar',2,'Student.jpg',NULL,'NA',0),
 (29,0,'viman nagar ,pune','accedeprojects2015@gmail.com','7855556242','Dinesh Satelkar',2,'Student.jpg',NULL,'NA',0),
 (30,0,'viman nagar ,pune','accedeprojects2015@gmail.com','7458745874','Raju Dalvi',2,'Student.jpg',NULL,'NA',0),
 (31,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8983728316','Raju Dalvi',2,'Student.jpg',NULL,'NA',0);
INSERT INTO `ange`.`customeraccount` (`Id`,`AccountBalance`,`Address`,`Email`,`MobileNo`,`Name`,`adminOfBranch_adminId`,`Image`,`IdProofType`,`customerIdProof`,`AdvanceAmount`) VALUES 
 (32,0,'viman nagar ,pune','accedeprojects2015@gmail.com','9988665544','Dinesh Satelkar',2,'Student.jpg','NA','NA',0),
 (33,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8837333333','Raju Dalvi',2,'Student.jpg','NA','NA',0),
 (34,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8983728311','Raju Dalvi',2,'Student.jpg','NA','NA',0),
 (35,0,'viman nagar ,pune','accedeprojects2015@gmail.com','8983728312','Dinesh Satelkar',2,'Student.jpg','NA','NA',0),
 (36,0,'viman nagar ,pune','accedeprojects2015@gmail.com','7983728319','RAJU DALVI',2,'Student.jpg','NA','NA',0),
 (37,0,'viman nagar ,pune','accedeprojects2015@gmail.com','7447726773','OM SAI BROADBAND',2,'Student.jpg','NA','NA',0),
 (38,0,'viman nagar ,pune','accedeprojects2015@gmail.com','6546541651','Raju Dalvi',2,'702896image.png','NA','NA',0),
 (39,0,'viman nagar ,pune','accedeprojects2DFG015@gmail.com','8856552631','gshgd',2,'Student.jpg','NA','NA',0);
/*!40000 ALTER TABLE `customeraccount` ENABLE KEYS */;


--
-- Definition of table `ange`.`customersale`
--

DROP TABLE IF EXISTS `ange`.`customersale`;
CREATE TABLE  `ange`.`customersale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `amount_inword` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `cust_addre` varchar(255) DEFAULT NULL,
  `customername` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `discount_amount` float NOT NULL,
  `grandtotal` float NOT NULL,
  `grosstotal` float NOT NULL,
  `mobilenumber` varchar(255) DEFAULT NULL,
  `other_charges` float NOT NULL,
  `productquanity` bigint(20) NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  `Advance_Amount` float NOT NULL,
  `Discount_Per` float NOT NULL,
  `balamt` float NOT NULL,
  `net_Advance_Amount` float NOT NULL,
  `paidamt` float NOT NULL,
  `nextPaymentDate` date DEFAULT NULL,
  `CloseRequest` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cjidw3ye7hbfg7qha9qnkotoo` (`CustomerAccount_Id`),
  KEY `FK_iobf5grdnceqpsjh8nknuunou` (`admin_adminId`),
  CONSTRAINT `FK_cjidw3ye7hbfg7qha9qnkotoo` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_iobf5grdnceqpsjh8nknuunou` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`customersale`
--

/*!40000 ALTER TABLE `customersale` DISABLE KEYS */;
INSERT INTO `ange`.`customersale` (`id`,`PaymentMode`,`amount_inword`,`bankname`,`chequeno`,`cust_addre`,`customername`,`date`,`discount_amount`,`grandtotal`,`grosstotal`,`mobilenumber`,`other_charges`,`productquanity`,`CustomerAccount_Id`,`admin_adminId`,`Advance_Amount`,`Discount_Per`,`balamt`,`net_Advance_Amount`,`paidamt`,`nextPaymentDate`,`CloseRequest`) VALUES 
 (1,'Cash','Ten  Thousand ','NA','NA','Old Sangvi','Ronit Gawali','2018-05-22',0,10000,10000,'9766828175',0,2,5,2,6200,0,300,3800,3500,'2018-05-22',1),
 (2,'Cash','Twenty Five Thousand ','NA','NA','Old Sangvi','Ronit Gawali','2018-05-22',0,25000,25000,'9766828175',0,5,5,2,6200,0,0,18800,18800,'2018-05-22',0),
 (3,'Cash','Six Thousand ','NA','NA','viman nagar ,pune','accede','2018-05-25',0,6000,6000,'8983728314',0,2,11,2,0,0,-7000,6000,13000,'2018-05-25',1);
/*!40000 ALTER TABLE `customersale` ENABLE KEYS */;


--
-- Definition of table `ange`.`customersale_customersaledetails`
--

DROP TABLE IF EXISTS `ange`.`customersale_customersaledetails`;
CREATE TABLE  `ange`.`customersale_customersaledetails` (
  `CustomerSale_id` int(11) NOT NULL,
  `CustomerSaleDetails_id` int(11) NOT NULL,
  UNIQUE KEY `UK_m8ctd6eij9hy53e45cqcj58j5` (`CustomerSaleDetails_id`),
  KEY `FK_m8ctd6eij9hy53e45cqcj58j5` (`CustomerSaleDetails_id`),
  KEY `FK_375f4vmpunv5608pg3bgxxf6r` (`CustomerSale_id`),
  CONSTRAINT `FK_375f4vmpunv5608pg3bgxxf6r` FOREIGN KEY (`CustomerSale_id`) REFERENCES `customersale` (`id`),
  CONSTRAINT `FK_m8ctd6eij9hy53e45cqcj58j5` FOREIGN KEY (`CustomerSaleDetails_id`) REFERENCES `customersaledetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`customersale_customersaledetails`
--

/*!40000 ALTER TABLE `customersale_customersaledetails` DISABLE KEYS */;
INSERT INTO `ange`.`customersale_customersaledetails` (`CustomerSale_id`,`CustomerSaleDetails_id`) VALUES 
 (1,1),
 (2,2),
 (3,3),
 (3,4);
/*!40000 ALTER TABLE `customersale_customersaledetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`customersaledetails`
--

DROP TABLE IF EXISTS `ange`.`customersaledetails`;
CREATE TABLE  `ange`.`customersaledetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PurchasePrice` float NOT NULL,
  `date` date DEFAULT NULL,
  `gross_amount` float NOT NULL,
  `mrpprice` float NOT NULL,
  `productquantity` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ks74pona9e8d61fi7a7j14a6a` (`product_id`),
  CONSTRAINT `FK_ks74pona9e8d61fi7a7j14a6a` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`customersaledetails`
--

/*!40000 ALTER TABLE `customersaledetails` DISABLE KEYS */;
INSERT INTO `ange`.`customersaledetails` (`id`,`PurchasePrice`,`date`,`gross_amount`,`mrpprice`,`productquantity`,`product_id`) VALUES 
 (1,0,'2018-05-22',10000,5000,2,2),
 (2,0,'2018-05-22',25000,5000,5,2),
 (3,0,'2018-05-25',5000,5000,1,2),
 (4,0,'2018-05-25',1000,1000,1,3);
/*!40000 ALTER TABLE `customersaledetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`employee`
--

DROP TABLE IF EXISTS `ange`.`employee`;
CREATE TABLE  `ange`.`employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `Emp_Status` int(11) NOT NULL,
  `Intime` time DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Outtime` time DEFAULT NULL,
  `PermanentAddress` varchar(255) DEFAULT NULL,
  `PermanentNo` varchar(255) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `alternateNo` varchar(255) DEFAULT NULL,
  `branchid` int(11) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emplyeeNo` varchar(255) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `salary` int(11) NOT NULL,
  `bankDetailId_id` bigint(20) DEFAULT NULL,
  `Admin_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oqdtrimgdi6qn94qsfxf6oytq` (`bankDetailId_id`),
  KEY `FK_cgwmaql774918j6yq40v4dk5l` (`Admin_adminId`),
  CONSTRAINT `FK_cgwmaql774918j6yq40v4dk5l` FOREIGN KEY (`Admin_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_oqdtrimgdi6qn94qsfxf6oytq` FOREIGN KEY (`bankDetailId_id`) REFERENCES `bankdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `ange`.`employee` (`id`,`Address`,`Emp_Status`,`Intime`,`MobileNo`,`Name`,`Outtime`,`PermanentAddress`,`PermanentNo`,`Status`,`alternateNo`,`branchid`,`designation`,`email`,`emplyeeNo`,`joiningDate`,`qualification`,`salary`,`bankDetailId_id`,`Admin_adminId`) VALUES 
 (1,'viman nagar ,pune',1,'13:00:00','8983728319','accede','12:59:00','9890989030','9890989030',1,'8983728319',1,'gfgcbbnvbnn','accedeprojects2015@gmail.com','AN13760','2018-05-26','BA',6000,1,1),
 (2,'viman nagar ,pune',1,'01:00:00','8983728319','accede','13:00:00','9890989030','9890989030',0,'8983728319',1,'gfgcbbnvbnn','accedeprojects2015@gmail.com','AN86752','2018-05-16','4TH',5000,2,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `ange`.`employeeactivehistory`
--

DROP TABLE IF EXISTS `ange`.`employeeactivehistory`;
CREATE TABLE  `ange`.`employeeactivehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) DEFAULT NULL,
  `activedate` date DEFAULT NULL,
  `activetime` time DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3a3s69uj7v9o8043y6egxcqly` (`employee_id`),
  CONSTRAINT `FK_3a3s69uj7v9o8043y6egxcqly` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`employeeactivehistory`
--

/*!40000 ALTER TABLE `employeeactivehistory` DISABLE KEYS */;
INSERT INTO `ange`.`employeeactivehistory` (`id`,`Status`,`activedate`,`activetime`,`employee_id`) VALUES 
 (7,'Deactivated','2018-05-14','17:59:40',1),
 (8,'Deactivated','2018-05-14','18:07:55',2),
 (9,'Activated','2018-05-14','18:07:57',2),
 (10,'Deactivated','2018-05-14','18:07:59',2),
 (11,'Activated','2018-05-14','18:08:00',1),
 (12,'Deactivated','2018-05-14','18:08:01',1),
 (13,'Activated','2018-05-14','18:08:02',1),
 (14,'Deactivated','2018-05-14','18:08:03',1),
 (15,'Activated','2018-05-14','18:08:03',1);
/*!40000 ALTER TABLE `employeeactivehistory` ENABLE KEYS */;


--
-- Definition of table `ange`.`employeepayment`
--

DROP TABLE IF EXISTS `ange`.`employeepayment`;
CREATE TABLE  `ange`.`employeepayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actualSalary` int(11) NOT NULL,
  `incentive` int(11) NOT NULL,
  `month` varchar(255) DEFAULT NULL,
  `noOfDays` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `salaryDate` date DEFAULT NULL,
  `totalamount` int(11) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pi8h47vif8cwyrwlutoioxxmh` (`employee_id`),
  CONSTRAINT `FK_pi8h47vif8cwyrwlutoioxxmh` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`employeepayment`
--

/*!40000 ALTER TABLE `employeepayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeepayment` ENABLE KEYS */;


--
-- Definition of table `ange`.`employeesalary`
--

DROP TABLE IF EXISTS `ange`.`employeesalary`;
CREATE TABLE  `ange`.`employeesalary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `salary` int(11) NOT NULL,
  `salaryUpdateDate` date DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f5p3g41166blny3j1x2jj5281` (`employee_id`),
  CONSTRAINT `FK_f5p3g41166blny3j1x2jj5281` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`employeesalary`
--

/*!40000 ALTER TABLE `employeesalary` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesalary` ENABLE KEYS */;


--
-- Definition of table `ange`.`enquiry`
--

DROP TABLE IF EXISTS `ange`.`enquiry`;
CREATE TABLE  `ange`.`enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EnquiryDate` date DEFAULT NULL,
  `EnquiryType` varchar(255) DEFAULT NULL,
  `custRequirement` varchar(255) DEFAULT NULL,
  `deleteEnquiry` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `followupDate` date DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `offerGivenByShop` varchar(255) DEFAULT NULL,
  `remove` int(11) NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `Reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tpj2yroloiswylyepnvduc1rx` (`CustomerAccount_Id`),
  KEY `FK_7i50cbqltobg8nkj882gyj65u` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_7i50cbqltobg8nkj882gyj65u` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_tpj2yroloiswylyepnvduc1rx` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`enquiry`
--

/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `ange`.`enquiry` (`id`,`EnquiryDate`,`EnquiryType`,`custRequirement`,`deleteEnquiry`,`email`,`followupDate`,`mobile`,`name`,`offerGivenByShop`,`remove`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`Reference`) VALUES 
 (1,'2018-04-20','Repair','jko',1,'accedeprojects2015@gmail.com','2018-05-24','8983728319','accede','jopp',0,NULL,2,'News Paper'),
 (2,'2018-04-20','Sell','gc',1,'accedeprojects2015@gmail.com','2018-05-23','8983728319','accede','rtt',0,NULL,2,'News Paper'),
 (3,'2018-04-20','Sell','dghnj',1,'accedeprojects2015@gmail.com','2018-05-18','8983728319','accede','fdcghj',0,NULL,2,'News Paper'),
 (4,'2018-04-30','MusicClass','ghkhgjk',1,'accedeprojects2015@gmail.com','2018-04-30','8983728319','accede','fghkfghk',1,NULL,2,'News Paper'),
 (5,'2018-05-02','MusicClass','Class',1,'tushar','2018-05-19','848494246','Tushar Gawali','NA',1,NULL,2,'Friend'),
 (6,'2018-05-02','MusicClass','saee',1,'shubh','2018-05-25','7840910352','Shubh','sdfsdf',1,NULL,2,'Friend');
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;


--
-- Definition of table `ange`.`enquiry_enquirydetail`
--

DROP TABLE IF EXISTS `ange`.`enquiry_enquirydetail`;
CREATE TABLE  `ange`.`enquiry_enquirydetail` (
  `Enquiry_id` int(11) NOT NULL,
  `enquiryDetail_id` int(11) NOT NULL,
  UNIQUE KEY `UK_a667nkoe84p2e33sdvq5nc5x5` (`enquiryDetail_id`),
  KEY `FK_a667nkoe84p2e33sdvq5nc5x5` (`enquiryDetail_id`),
  KEY `FK_dg1bhsqcfgwtv1tv91hbv6lc9` (`Enquiry_id`),
  CONSTRAINT `FK_a667nkoe84p2e33sdvq5nc5x5` FOREIGN KEY (`enquiryDetail_id`) REFERENCES `enquirydetail` (`id`),
  CONSTRAINT `FK_dg1bhsqcfgwtv1tv91hbv6lc9` FOREIGN KEY (`Enquiry_id`) REFERENCES `enquiry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`enquiry_enquirydetail`
--

/*!40000 ALTER TABLE `enquiry_enquirydetail` DISABLE KEYS */;
INSERT INTO `ange`.`enquiry_enquirydetail` (`Enquiry_id`,`enquiryDetail_id`) VALUES 
 (1,4),
 (2,5),
 (3,6),
 (5,11),
 (6,7),
 (6,8),
 (6,9),
 (6,10);
/*!40000 ALTER TABLE `enquiry_enquirydetail` ENABLE KEYS */;


--
-- Definition of table `ange`.`enquirydetail`
--

DROP TABLE IF EXISTS `ange`.`enquirydetail`;
CREATE TABLE  `ange`.`enquirydetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LastFollowupDate` date DEFAULT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `followupDate` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`enquirydetail`
--

/*!40000 ALTER TABLE `enquirydetail` DISABLE KEYS */;
INSERT INTO `ange`.`enquirydetail` (`id`,`LastFollowupDate`,`counsellorName`,`followupDate`,`remark`) VALUES 
 (1,NULL,'fdhfdfgh fghddf','2018-05-02','dsfgdsfg  dfsgdf dfgsdfghdfs'),
 (2,NULL,'fdhfdfgh fghddf','2018-05-02','dsfgdsfg  dfsgdf dfgsdfghdfs'),
 (3,NULL,'fdhfdfgh fghddf','2018-05-02','dsfgdsfg  dfsgdf dfgsdfghdfs'),
 (4,NULL,'dsfgsdfg','2018-05-02','dfshfdg fdhgfgh'),
 (5,NULL,'sdfsdf','2018-05-02','sdfdsaf'),
 (6,NULL,'gfhj','2018-05-02','fghjgfhj'),
 (7,NULL,'dsfdsg','2018-05-04','fdgdfg'),
 (8,NULL,'dsfdsg','2018-05-04','fdgdfg'),
 (9,NULL,'dfhfgh','2018-05-04','fghfgh dfgdfg'),
 (10,NULL,'dfhfgh','2018-05-04','fghfgh dfgdfg'),
 (11,NULL,'fghjghj','2018-05-04','fgjhfdgj');
/*!40000 ALTER TABLE `enquirydetail` ENABLE KEYS */;


--
-- Definition of table `ange`.`event`
--

DROP TABLE IF EXISTS `ange`.`event`;
CREATE TABLE  `ange`.`event` (
  `eventId` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventAgeCategory` varchar(255) DEFAULT NULL,
  `eventCreatedDate` datetime DEFAULT NULL,
  `eventDate` datetime DEFAULT NULL,
  `eventImgName` varchar(255) DEFAULT NULL,
  `eventName` varchar(255) DEFAULT NULL,
  `eventRules` varchar(255) DEFAULT NULL,
  `eventVenue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`event`
--

/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


--
-- Definition of table `ange`.`eventapplication`
--

DROP TABLE IF EXISTS `ange`.`eventapplication`;
CREATE TABLE  `ange`.`eventapplication` (
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
  `eventNo` varchar(255) DEFAULT NULL,
  `user` tinyblob,
  `event_eventId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`eventApplicationId`),
  KEY `FK_5rlm6vfeis980t8p9pjsvn7mn` (`event_eventId`),
  CONSTRAINT `FK_5rlm6vfeis980t8p9pjsvn7mn` FOREIGN KEY (`event_eventId`) REFERENCES `event` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`eventapplication`
--

/*!40000 ALTER TABLE `eventapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventapplication` ENABLE KEYS */;


--
-- Definition of table `ange`.`exam`
--

DROP TABLE IF EXISTS `ange`.`exam`;
CREATE TABLE  `ange`.`exam` (
  `examId` bigint(20) NOT NULL AUTO_INCREMENT,
  `examDate` datetime DEFAULT NULL,
  `examName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`exam`
--

/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


--
-- Definition of table `ange`.`examapplication`
--

DROP TABLE IF EXISTS `ange`.`examapplication`;
CREATE TABLE  `ange`.`examapplication` (
  `examApplicationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `appliedDate` datetime DEFAULT NULL,
  `examno` varchar(255) DEFAULT NULL,
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
-- Dumping data for table `ange`.`examapplication`
--

/*!40000 ALTER TABLE `examapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `examapplication` ENABLE KEYS */;


--
-- Definition of table `ange`.`externalaccount`
--

DROP TABLE IF EXISTS `ange`.`externalaccount`;
CREATE TABLE  `ange`.`externalaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountHolderName` varchar(255) DEFAULT NULL,
  `Active` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Mobileno` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_12a1ymp90rwpvv0wy64h91hw2` (`adminOfBranch_adminId`),
  KEY `FK_24n4fh4g7empqynoe9tyte4n9` (`CustomerAccount_Id`),
  CONSTRAINT `FK_12a1ymp90rwpvv0wy64h91hw2` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_24n4fh4g7empqynoe9tyte4n9` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`externalaccount`
--

/*!40000 ALTER TABLE `externalaccount` DISABLE KEYS */;
INSERT INTO `ange`.`externalaccount` (`id`,`AccountHolderName`,`Active`,`Address`,`Designation`,`Email`,`Mobileno`,`adminOfBranch_adminId`,`CustomerAccount_Id`) VALUES 
 (1,'ACCEDE','1','viman nagar ,pune','ergtrey','accedeprojects2015@gmail.com','8983728319',2,35),
 (2,'RAJU DALVI','1','viman nagar ,pune','fdffgfcfgcf@hg.ytf','accedeprojects2015@gmail.com','7983728319',2,36),
 (4,'OM SAI BROADBAND','1','viman nagar ,pune','fdffgfcfgcf@hg.ytf','accedeprojects2015@gmail.com','7447726773',2,37);
/*!40000 ALTER TABLE `externalaccount` ENABLE KEYS */;


--
-- Definition of table `ange`.`instrument`
--

DROP TABLE IF EXISTS `ange`.`instrument`;
CREATE TABLE  `ange`.`instrument` (
  `instrumentId` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentAddedDate` datetime DEFAULT NULL,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentRentCost` int(11) NOT NULL,
  PRIMARY KEY (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`instrument`
--

/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `ange`.`instrument` (`instrumentId`,`instrumentAddedDate`,`instrumentName`,`instrumentRentCost`) VALUES 
 (11,'2018-04-21 13:17:51','GUITAR',500),
 (12,'2018-04-21 13:18:11','HARMONIUM',600),
 (13,'2018-05-07 12:46:08','VIOLIN',500),
 (14,'2018-05-07 12:46:13','TABLA',200),
 (15,'2018-05-07 12:46:17','SAXOPHONE',60),
 (16,'2018-05-07 12:46:41','TABLADGS',50),
 (17,'2018-05-07 12:46:48','SAXOPHONEH',60),
 (18,'2018-05-07 12:46:54','VIOLINDS',500),
 (19,'2018-05-07 12:46:59','HARMONIUMSDZG',100),
 (20,'2018-05-07 12:47:03','HARMONIUMSDZFG',200),
 (21,'2018-05-07 12:47:40','TABLADFG',200),
 (22,'2018-05-07 12:48:01','VIOLINDFZG',100),
 (23,'2018-05-07 12:48:05','SAXOPHONEFDZG',200),
 (24,'2018-05-07 12:48:09','SAXOPHONEFZDSG',100),
 (25,'2018-05-07 12:48:15','TABLADFGDFZ',100);
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;


--
-- Definition of table `ange`.`instrumentrepair`
--

DROP TABLE IF EXISTS `ange`.`instrumentrepair`;
CREATE TABLE  `ange`.`instrumentrepair` (
  `instrumentId` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentRepairCost` int(11) NOT NULL,
  PRIMARY KEY (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`instrumentrepair`
--

/*!40000 ALTER TABLE `instrumentrepair` DISABLE KEYS */;
INSERT INTO `ange`.`instrumentrepair` (`instrumentId`,`instrumentName`,`instrumentRepairCost`) VALUES 
 (2,'KEYBOARD',200),
 (3,'GUITAR',200),
 (4,'PIONO',50),
 (5,'TABLA',100),
 (6,'VIOLIN',600),
 (7,'FIRST STRING',100),
 (8,'KEYBOARDTGH',200),
 (9,'ASDG',100),
 (10,'ADFSG',200),
 (11,'ADFGDAG',500),
 (12,'TABLAADG',500),
 (13,'ASDGA',200);
/*!40000 ALTER TABLE `instrumentrepair` ENABLE KEYS */;


--
-- Definition of table `ange`.`instrumentsubcategory`
--

DROP TABLE IF EXISTS `ange`.`instrumentsubcategory`;
CREATE TABLE  `ange`.`instrumentsubcategory` (
  `instrumentSubcategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `instrumentSubcategoryName` varchar(255) DEFAULT NULL,
  `INSTRUMENT` int(11) DEFAULT NULL,
  PRIMARY KEY (`instrumentSubcategoryId`),
  KEY `FK_2dgr56p6htsf65vhym15gm9dd` (`INSTRUMENT`),
  CONSTRAINT `FK_2dgr56p6htsf65vhym15gm9dd` FOREIGN KEY (`INSTRUMENT`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`instrumentsubcategory`
--

/*!40000 ALTER TABLE `instrumentsubcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumentsubcategory` ENABLE KEYS */;


--
-- Definition of table `ange`.`lessonpdf`
--

DROP TABLE IF EXISTS `ange`.`lessonpdf`;
CREATE TABLE  `ange`.`lessonpdf` (
  `lessonid` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `pdfname` varchar(255) DEFAULT NULL,
  `pdfpath` varchar(255) DEFAULT NULL,
  `course_courseId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`lessonid`),
  KEY `FK_39h94o307d0kfhwuid853l60f` (`course_courseId`),
  CONSTRAINT `FK_39h94o307d0kfhwuid853l60f` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`lessonpdf`
--

/*!40000 ALTER TABLE `lessonpdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessonpdf` ENABLE KEYS */;


--
-- Definition of table `ange`.`lessonvideo`
--

DROP TABLE IF EXISTS `ange`.`lessonvideo`;
CREATE TABLE  `ange`.`lessonvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `videoname` varchar(255) DEFAULT NULL,
  `videopath` varchar(255) DEFAULT NULL,
  `course_courseId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_elmpxvlgpjb61x0yy41bltqa7` (`course_courseId`),
  CONSTRAINT `FK_elmpxvlgpjb61x0yy41bltqa7` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`lessonvideo`
--

/*!40000 ALTER TABLE `lessonvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessonvideo` ENABLE KEYS */;


--
-- Definition of table `ange`.`packagecourse`
--

DROP TABLE IF EXISTS `ange`.`packagecourse`;
CREATE TABLE  `ange`.`packagecourse` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Status` int(11) NOT NULL,
  `courseDuration` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fee` int(11) NOT NULL,
  `noofBatchTimes` int(11) NOT NULL,
  `noofcourse` int(11) NOT NULL,
  `noofdays` int(11) NOT NULL,
  `packagename` varchar(255) DEFAULT NULL,
  `paymentMode` int(11) NOT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_3x3fsdd80blfvl5tj8c6gq34v` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_3x3fsdd80blfvl5tj8c6gq34v` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`packagecourse`
--

/*!40000 ALTER TABLE `packagecourse` DISABLE KEYS */;
INSERT INTO `ange`.`packagecourse` (`Id`,`Status`,`courseDuration`,`description`,`fee`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packagename`,`paymentMode`,`adminOfBranch_adminId`) VALUES 
 (1,1,1,'dfhgfd safdcgfac cahgscdv bv',1000,1,1,2,'2 Days 1 Batch',1,2),
 (2,0,1,'sdfgdfgsdafsda dfsgdsgdfg',150,1,3,4,'3 Days 1 Batch',1,2);
/*!40000 ALTER TABLE `packagecourse` ENABLE KEYS */;


--
-- Definition of table `ange`.`payment`
--

DROP TABLE IF EXISTS `ange`.`payment`;
CREATE TABLE  `ange`.`payment` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `paymentAgains` varchar(255) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentMode` varchar(255) DEFAULT NULL,
  `paymentTime` datetime DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ntw8jkw4u7vjwv8qb746919b5` (`adminOfBranch_adminId`),
  KEY `FK_6mb7ccqhy19gv7mssycxmq4i5` (`CustomerAccount_Id`),
  CONSTRAINT `FK_6mb7ccqhy19gv7mssycxmq4i5` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_ntw8jkw4u7vjwv8qb746919b5` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (27,2000,'Rent No- RE-1','2018-04-24','Cash','2018-04-24 15:58:12','Credit',2,'Customer Rent Payment',1),
 (28,5000,'Rent No- RP-2','2018-04-24','Cash','2018-04-24 16:26:13','Credit',2,'Customer Rent Payment',1),
 (29,5000,'Rent No- RP-3','2018-04-24','Cash','2018-04-24 17:45:18','Credit',2,'Customer Rent Payment',9),
 (30,5000,'Rent No- RP-4','2018-04-24','Cash','2018-04-24 19:06:55','Debit',2,'Customer Rent Payment',9),
 (31,2000,'Rent No- RP-4','2018-04-24','Cash','2018-04-24 19:09:32','Credit',2,'Customer Rent Payment',1),
 (32,5000,'Rent No- RP-4','2018-04-24','Cash','2018-04-24 19:10:19','Debit',2,'Customer Rent Payment',9),
 (33,5000,'Rent No- RP-4','2018-04-24','Cash','2018-04-24 19:11:27','Debit',2,'Customer Rent Payment',9),
 (34,5000,'Rent No- RP-4','2018-04-24','Cash','2018-04-24 19:21:20','Debit',2,'Customer Rent Payment',1),
 (35,2000,'Rent No- RP-4','2018-04-24','Cash','2018-04-24 19:22:16','Debit',2,'Customer Rent Payment',1);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (36,2000,'Rent No- RP-4','2018-04-25','Cash','2018-04-25 16:00:03','Debit',2,'Customer Rent Payment',1),
 (37,50,'Repair No- RP-1','2018-04-25','Cash','2018-04-25 17:17:04','Credit',2,'Customer Repair Payment',11),
 (38,200,'Repair No- RP-2','2018-04-25','Cash','2018-04-25 17:18:32','Credit',2,'Customer Repair Payment',11),
 (39,200,'Repair No- RP-3','2018-04-25','Cash','2018-04-25 17:21:22','Credit',2,'Customer Repair Payment',11),
 (40,200,'Repair No- RP-4','2018-04-25','Cash','2018-04-25 17:22:12','Credit',2,'Customer Repair Payment',11),
 (41,200,'Repair No- RP-5','2018-04-25','Cash','2018-04-25 17:22:29','Credit',2,'Customer Repair Payment',11),
 (42,200,'Repair No- RP-6','2018-04-25','Cash','2018-04-25 17:23:56','Credit',2,'Customer Repair Payment',11),
 (43,200,'Repair No- RP-7','2018-04-25','Cash','2018-04-25 17:29:14','Credit',2,'Customer Repair Payment',11),
 (44,200,'Repair No- RP-8','2018-04-25','Cash','2018-04-25 17:30:17','Credit',2,'Customer Repair Payment',11);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (45,100,'Repair No- RP-9','2018-04-25','Cash','2018-04-25 17:31:50','Credit',2,'Customer Repair Payment',11),
 (46,100,'Repair No- RP-10','2018-04-25','Cash','2018-04-25 18:03:25','Credit',2,'Customer Repair Payment',17),
 (47,1100,'Admissionno No- CL1012','2018-04-28','Cash','2018-04-28 12:16:50','Credit',2,'Student Admission Payment',17),
 (48,100,'Rent No- RP-4','2018-04-28','Cash','2018-04-28 14:17:50','Credit',2,'Customer Rent Payment',1),
 (49,100,'Rent No- RE-5','2018-04-28','Cash','2018-04-28 14:22:07','Credit',2,'Customer Rent Payment',1),
 (50,1090,'Admissionno No- CL1001','2018-04-28','Cash','2018-04-28 17:19:58','Credit',2,'Student Monthly Course Payment',1),
 (51,1000,'Admissionno No- CL1001','2018-04-28','Cash','2018-04-28 17:21:41','Credit',2,'Student Monthly Course Payment',1),
 (52,1100,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 10:54:03','Credit',2,'Student Admission Payment',22),
 (53,1000,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:03:28','Credit',2,'Student Monthly Course Payment',22);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (54,1000,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:03:55','Credit',2,'Student Monthly Course Payment',22),
 (55,500,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:24:41','Credit',2,'Student Monthly Course Payment',22),
 (56,500,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:24:41','Credit',2,'Student Monthly Course Payment',22),
 (57,500,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:24:41','Credit',2,'Student Monthly Course Payment',22),
 (58,500,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:24:41','Credit',2,'Student Monthly Course Payment',22),
 (59,100,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:26:33','Credit',2,'Student Monthly Course Payment',22),
 (60,500,'Admissionno No- CL1013','2018-04-30','Cash','2018-04-30 11:27:39','Credit',2,'Student Monthly Course Payment',22),
 (61,100,'Admissionno No- CL1014','2018-04-30','Cash','2018-04-30 13:42:59','Credit',2,'Student Admission Payment',23);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (62,0,'Admissionno No- CL1015','2018-05-03','Cash','2018-05-03 10:28:04','Credit',2,'Student Admission Payment',26),
 (63,100,'Admissionno No- CL1016','2018-05-03','Cash','2018-05-03 10:31:51','Credit',2,'Student Admission Payment',27),
 (64,500,'Rent No- RE-6','2018-05-03','Cash','2018-05-03 10:33:06','Credit',2,'Customer Rent Payment',1),
 (65,500,'Rent No- RE-7','2018-05-03','Cash','2018-05-03 10:37:16','Credit',2,'Customer Rent Payment',1),
 (66,5000,'Rent No- RE-7','2018-05-03','Cash','2018-05-03 10:50:27','Credit',2,'Customer Rent Payment',1),
 (67,5000,'Rent No- RE-8','2018-05-03','Cash','2018-05-03 10:51:12','Credit',2,'Customer Rent Payment',1),
 (68,5000,'Rent No- RE-9','2018-05-03','Cash','2018-05-03 10:51:57','Credit',2,'Customer Rent Payment',1),
 (69,500,'Rent No- RE-9','2018-05-03','Cash','2018-05-03 10:54:01','Credit',2,'Customer Rent Payment',1),
 (70,500,'Rent No- RE-10','2018-05-03','Cash','2018-05-03 10:55:49','Credit',2,'Customer Rent Payment',1);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (71,500,'Rent No- RE-11','2018-05-03','Cash','2018-05-03 10:56:41','Credit',2,'Customer Rent Payment',1),
 (72,500,'Rent No- RE-12','2018-05-03','Cash','2018-05-03 10:57:05','Credit',2,'Customer Rent Payment',1),
 (73,500,'Rent No- RE-13','2018-05-03','Cash','2018-05-03 11:16:36','Credit',2,'Customer Rent Payment',1),
 (74,200,'Repair No- RP-11','2018-05-03','Cash','2018-05-03 11:34:06','Credit',2,'Customer Repair Payment',1),
 (75,100,'Repair No- RP-12','2018-05-03','Cash','2018-05-03 11:39:29','Credit',2,'Customer Repair Payment',1),
 (76,100,'Admissionno No- CL1017','2018-05-03','Cash','2018-05-03 13:07:24','Credit',2,'Student Admission Payment',31),
 (77,3000,'Rent No- RE-13','2018-05-03','Cash','2018-05-03 14:02:35','Credit',2,'Customer Rent Payment',24),
 (78,3000,'Rent No- RE-14','2018-05-03','Cash','2018-05-03 14:06:50','Credit',2,'Customer Rent Payment',24),
 (79,3000,'Rent No- RE-14','2018-05-03','Cash','2018-05-03 14:08:54','Credit',2,'Customer Rent Payment',24);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (80,200,'Repair No- RP-13','2018-05-03','Cash','2018-05-03 14:10:49','Credit',2,'Customer Repair Payment',24),
 (81,2000,'Rent No- RE-15','2018-05-03','Cash','2018-05-03 14:28:13','Credit',2,'Customer Rent Payment',24),
 (82,2000,'Rent No- RE-15','2018-05-03','Cash','2018-05-03 14:28:36','Debit',2,'Customer Rent Payment',24),
 (83,200,'ACCEDEkadence guitar ','2018-05-09','Cash','2018-05-09 17:18:55','Debit',2,NULL,35),
 (84,500,'RAJU DALVIkadence guitar ','2018-05-09','Paytm','2018-05-09 18:27:24','Debit',2,'Vendor Amount',36),
 (85,1200,'OM SAI BROADBANDkadence guitar ','2018-05-09','Paytm','2018-05-09 18:39:57','Debit',2,'Vendor Amount',37),
 (86,100,'Admissionno No- CL1018','2018-05-18','Cash','2018-05-18 15:37:09','Credit',2,'Student Admission Payment',38),
 (87,10000,'Sell No- 1','2018-05-22','Cash','2018-05-22 13:43:51','Credit',2,NULL,NULL),
 (88,25000,'Sell No- 2','2018-05-22','Cash','2018-05-22 13:46:24','Credit',2,NULL,NULL);
INSERT INTO `ange`.`payment` (`Id`,`amount`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`adminOfBranch_adminId`,`Description`,`CustomerAccount_Id`) VALUES 
 (89,6000,'Sell No- 3','2018-05-25','Cash','2018-05-25 17:03:01','Credit',2,NULL,NULL),
 (90,5000,'Rent No- RE-16','2018-05-26','Cash','2018-05-26 14:05:10','Credit',2,'Customer Rent Payment',1),
 (91,600,'Rent No- RE-16','2018-05-26','Cash','2018-05-26 14:06:00','Credit',2,'Customer Rent Payment',1),
 (92,5000,'Rent No- RE-17','2018-05-26','Cash','2018-05-26 14:42:36','Credit',2,'Customer Rent Payment',1),
 (93,2500,'Rent No- RE-17','2018-05-26','Cash','2018-05-26 14:42:53','Debit',2,'Customer Rent Payment',1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `ange`.`paymentfollowup`
--

DROP TABLE IF EXISTS `ange`.`paymentfollowup`;
CREATE TABLE  `ange`.`paymentfollowup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nextfollowupdate` date DEFAULT NULL,
  `requestClosedDate` date DEFAULT NULL,
  `requestDate` date DEFAULT NULL,
  `requeststatus` int(11) NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `typeofoffollowup` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jr4bxygg6yi1iahenmaxcidvr` (`CustomerAccount_Id`),
  KEY `FK_nohmyg41t11bdyqxlivr725bx` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_jr4bxygg6yi1iahenmaxcidvr` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_nohmyg41t11bdyqxlivr725bx` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`paymentfollowup`
--

/*!40000 ALTER TABLE `paymentfollowup` DISABLE KEYS */;
INSERT INTO `ange`.`paymentfollowup` (`id`,`nextfollowupdate`,`requestClosedDate`,`requestDate`,`requeststatus`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`typeofoffollowup`) VALUES 
 (1,'2018-04-21',NULL,'2018-04-16',1,1,2,NULL),
 (2,'2018-04-28',NULL,'2018-04-16',1,2,2,NULL),
 (3,'2018-04-21',NULL,'2018-04-16',1,3,2,NULL),
 (4,'2018-04-28',NULL,'2018-04-16',1,4,2,NULL),
 (5,'2018-04-28',NULL,'2018-04-16',1,6,2,NULL),
 (6,'2018-04-19',NULL,'2018-04-17',1,7,2,NULL),
 (7,'2018-04-20',NULL,'2018-04-17',1,2,2,NULL),
 (8,'2018-04-25',NULL,'2018-04-18',1,1,2,NULL),
 (9,'2018-04-20',NULL,'2018-04-18',1,8,2,NULL),
 (10,'2018-04-20',NULL,'2018-04-18',1,8,2,NULL),
 (11,'2018-04-20',NULL,'2018-04-18',1,9,2,NULL),
 (12,'2018-04-21',NULL,'2018-04-18',1,9,2,NULL),
 (13,'2018-04-20',NULL,'2018-04-18',1,9,2,NULL),
 (14,'2018-04-27',NULL,'2018-04-18',1,9,2,NULL),
 (15,'2018-04-20',NULL,'2018-04-18',1,10,2,NULL),
 (16,'2018-04-20',NULL,'2018-04-18',1,11,2,NULL),
 (17,'2018-04-20',NULL,'2018-04-18',1,11,2,NULL),
 (18,'2018-06-15',NULL,'2018-04-18',1,11,2,NULL);
INSERT INTO `ange`.`paymentfollowup` (`id`,`nextfollowupdate`,`requestClosedDate`,`requestDate`,`requeststatus`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`typeofoffollowup`) VALUES 
 (19,'2018-04-21',NULL,'2018-04-18',1,8,2,NULL),
 (20,'2018-04-21',NULL,'2018-04-18',1,8,2,NULL),
 (21,'2018-04-20',NULL,'2018-04-18',1,8,2,NULL),
 (22,'2018-04-19',NULL,'2018-04-18',1,1,2,NULL),
 (23,'2018-04-28',NULL,'2018-04-18',1,1,2,NULL),
 (24,'2018-04-10','2018-04-19','2018-04-18',0,1,2,NULL),
 (25,'2018-04-29',NULL,'2018-04-24',1,1,2,NULL),
 (26,'2018-04-29',NULL,'2018-04-24',1,9,2,NULL),
 (27,'2018-04-25',NULL,'2018-04-25',1,11,2,NULL),
 (28,'2018-04-25',NULL,'2018-04-25',1,11,2,NULL),
 (29,'2018-04-25',NULL,'2018-04-25',1,11,2,NULL),
 (30,'2018-04-25',NULL,'2018-04-25',1,11,2,NULL),
 (31,'2018-04-25',NULL,'2018-04-25',1,11,2,NULL),
 (32,'2018-04-25',NULL,'2018-04-25',1,17,2,NULL),
 (33,'2018-04-25',NULL,'2018-04-28',1,1,2,NULL),
 (34,'2018-04-25',NULL,'2018-04-30',1,22,2,NULL),
 (35,'2018-04-25',NULL,'2018-04-30',1,22,2,NULL),
 (36,'2018-04-25',NULL,'2018-04-30',1,22,2,NULL);
INSERT INTO `ange`.`paymentfollowup` (`id`,`nextfollowupdate`,`requestClosedDate`,`requestDate`,`requeststatus`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`typeofoffollowup`) VALUES 
 (37,'2018-04-25',NULL,'2018-04-30',1,22,2,NULL),
 (38,'2018-04-25',NULL,'2018-04-30',1,22,2,NULL),
 (39,'2018-04-25',NULL,'2018-04-30',1,22,2,NULL),
 (40,'2018-04-25',NULL,'2018-04-30',1,23,2,NULL),
 (41,'2018-05-05',NULL,'2018-05-03',1,26,2,NULL),
 (42,'2018-05-05',NULL,'2018-05-03',1,27,2,NULL),
 (43,'2018-05-08',NULL,'2018-05-03',1,1,2,NULL),
 (44,'2018-05-08',NULL,'2018-05-03',1,1,2,NULL),
 (45,'2018-05-06',NULL,'2018-05-03',1,1,2,NULL),
 (46,'2018-05-07',NULL,'2018-05-03',1,1,2,NULL),
 (47,'2018-05-03',NULL,'2018-05-03',1,1,2,NULL),
 (48,'2018-05-03',NULL,'2018-05-03',1,1,2,NULL),
 (49,'2018-05-05',NULL,'2018-05-03',1,31,2,'Music Class'),
 (50,'2018-05-06',NULL,'2018-05-03',1,24,2,'Rent'),
 (51,'2018-05-03',NULL,'2018-05-03',1,24,2,NULL),
 (52,'2018-05-06',NULL,'2018-05-03',1,24,2,'Rent'),
 (53,'2018-05-20',NULL,'2018-05-18',1,38,2,'Music Class'),
 (54,'2018-05-28',NULL,'2018-05-25',1,7,2,'Music Class');
INSERT INTO `ange`.`paymentfollowup` (`id`,`nextfollowupdate`,`requestClosedDate`,`requestDate`,`requeststatus`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`typeofoffollowup`) VALUES 
 (55,'2018-05-28',NULL,'2018-05-25',1,22,2,'Music Class'),
 (56,'2018-05-28',NULL,'2018-05-25',1,22,2,'Music Class'),
 (57,'2018-06-28',NULL,'2018-05-25',1,38,2,'Music Class'),
 (58,'2018-05-29',NULL,'2018-05-25',1,8,2,'Music Class'),
 (59,'2018-05-29',NULL,'2018-05-25',1,6,2,'Music Class'),
 (60,'2018-05-28',NULL,'2018-05-25',1,26,2,'Music Class'),
 (61,'2018-05-24',NULL,'2018-05-25',1,10,2,'Music Class'),
 (62,'2018-05-25',NULL,'2018-05-25',1,11,2,'Sell'),
 (63,'2018-05-31',NULL,'2018-05-26',1,1,2,'Rent'),
 (64,'2018-05-31',NULL,'2018-05-26',1,1,2,'Rent');
/*!40000 ALTER TABLE `paymentfollowup` ENABLE KEYS */;


--
-- Definition of table `ange`.`paymentfollowupmessage`
--

DROP TABLE IF EXISTS `ange`.`paymentfollowupmessage`;
CREATE TABLE  `ange`.`paymentfollowupmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `followupdate` date DEFAULT NULL,
  `PaymentFollowup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stprxcji3s0vj5730whupwd2v` (`PaymentFollowup_id`),
  CONSTRAINT `FK_stprxcji3s0vj5730whupwd2v` FOREIGN KEY (`PaymentFollowup_id`) REFERENCES `paymentfollowup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`paymentfollowupmessage`
--

/*!40000 ALTER TABLE `paymentfollowupmessage` DISABLE KEYS */;
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (1,'Student Previous Payment,\nAdmission No:-. CL1001\nPrevious Amount. 90\nPaid Amount. 10\nBalance Amount. 90\n','2018-04-18',24),
 (2,'Followup Remark','2018-04-19',24),
 (3,'dzdfdsf dfgd fdg','2018-04-19',24),
 (4,NULL,'2018-04-19',24),
 (5,'sdf sdfsdf','2018-04-19',5),
 (6,'sdfs','2018-04-19',5),
 (7,'7ytjuity7ui','2018-04-19',5),
 (8,'tymuytu','2018-04-19',1),
 (9,'uioiuo','2018-04-19',1),
 (10,'dsfsdf dsfdsgsdtd dfgdfgdfg','2018-04-19',1),
 (11,'sdfsdfs','2018-04-19',1),
 (12,'fsasdfsd','2018-04-19',1),
 (13,'esrdgtrdtyrdyrd fytrt yryt yrt','2018-04-19',5),
 (14,'xfgdfgd dfsgfdg','2018-04-19',4),
 (15,'asDasda sadsa d','2018-04-19',2),
 (16,'tyutyo','2018-04-20',3),
 (17,'tytyo','2018-04-20',12),
 (18,'Customer Rent,\nRent No:-. RP-2\nMobile No:-. 8956276855\nTotal Rent  Amount. 2500\nDeposite Amount. 5000\nDue Date . Sun Apr 29 16:26:13 IST 2018\n','2018-04-29',25),
 (19,'Customer Rent,\nRent No:-. RP-3\nMobile No:-. 8788019374\nTotal Rent  Amount. 4950\nDeposite Amount. 5000\nDue Date . Sun Apr 29 17:45:18 IST 2018\n','2018-04-29',26),
 (20,'Cust Visit shop at 8 pm','2018-04-25',8);
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (21,'Customer Repair,\nrepair No:-. RP-4\nMobile No:-. 8983728314\nTotal Repair  Amount. 200\nPaid Amount. 200\nReturn Date . Fri Apr 27 00:00:00 IST 2018\n','2018-04-25',27),
 (22,'Customer Repair,\nrepair No:-. RP-5\nMobile No:-. 8983728314\nTotal Repair  Amount. 200\nPaid Amount. 200\nReturn Date . Fri Apr 27 00:00:00 IST 2018\n','2018-04-25',28),
 (23,'Customer Repair,\nrepair No:-. RP-6\nMobile No:-. 8983728314\nTotal Repair  Amount. 200\nPaid Amount. 200\nReturn Date . Fri Apr 27 00:00:00 IST 2018\n','2018-04-25',29),
 (24,'Customer Repair,\nrepair No:-. RP-8\nMobile No:-. 8983728314\nTotal Repair  Amount. 200\nPaid Amount. 200\nReturn Date . Fri Apr 27 00:00:00 IST 2018\n','2018-04-25',30),
 (25,'Customer Repair,\nrepair No:-. RP-9\nMobile No:-. 8983728314\nTotal Repair  Amount. 800\nPaid Amount. 100\nReturn Date . Fri Apr 27 00:00:00 IST 2018\n','2018-04-25',31),
 (26,'Customer Repair,\nrepair No:-. RP-10\nMobile No:-. 9517536545\nTotal Repair  Amount. 200\nPaid Amount. 100\nReturn Date . Fri Apr 27 00:00:00 IST 2018\n','2018-04-25',32),
 (27,'Customer Rent,\nRent No:-. RE-5\nMobile No:-. 8956276855\nTotal Rent  Amount. 11000\nDeposite Amount. 100\nDue Date . Tue May 08 14:22:07 IST 2018\n','2018-05-08',33);
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (28,'Student Course Payment,\nAdmission No:-. CL1013\nMobile No:-. 9856276855\nTotal Fee Amount. 1000\nPaid Amount. 500\nBalance Amount. 500\n','2018-04-30',35),
 (29,'Student Course Payment,\nAdmission No:-. CL1013\nMobile No:-. 9856276855\nTotal Fee Amount. 1000\nPaid Amount. 500\nBalance Amount. 500\n','2018-04-30',35),
 (30,'Student Course Payment,\nAdmission No:-. CL1013\nMobile No:-. 9856276855\nTotal Fee Amount. 1000\nPaid Amount. 500\nBalance Amount. 500\n','2018-04-30',36),
 (31,'Student Course Payment,\nAdmission No:-. CL1013\nMobile No:-. 9856276855\nTotal Fee Amount. 1000\nPaid Amount. 500\nBalance Amount. 500\n','2018-04-30',37),
 (32,'Student Course Payment,\nAdmission No:-. CL1013\nMobile No:-. 9856276855\nTotal Fee Amount. 1500\nPaid Amount. 100\nBalance Amount. 1400\n','2018-04-30',38),
 (33,'Student Course Payment,\nAdmission No:-. CL1013\nMobile No:-. 9856276855\nTotal Fee Amount. 2400\nPaid Amount. 500\nBalance Amount. 1900\n','2018-04-30',39),
 (34,'Student Admission,\nAdmission No:-. CL1014\nMobile No:-. 7020883248\nTotal Fee Amount. 1100\nPaid Amount. 100\nBalance Amount. 1000\n','2018-05-02',40);
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (35,'asfvsdaf','2018-05-01',18),
 (36,'Student Admission,\nAdmission No:-. CL1015\nMobile No:-. 9637531595\nTotal Fee Amount. 1100\nPaid Amount. 0\nBalance Amount. 1100\n','2018-05-05',41),
 (37,'Student Admission,\nAdmission No:-. CL1016\nMobile No:-. 8462539765\nTotal Fee Amount. 1100\nPaid Amount. 100\nBalance Amount. 1000\n','2018-05-05',42),
 (38,'Customer Rent,\nRent No:-. RE-6\nMobile No:-. 8956276855\nTotal Rent  Amount. 5500\nDeposite Amount. 500\nDue Date . Tue May 08 10:33:06 IST 2018\n','2018-05-08',43),
 (39,'Customer Rent,\nRent No:-. RE-8\nMobile No:-. 8956276855\nTotal Rent  Amount. 5500\nDeposite Amount. 5000\nDue Date . Tue May 08 10:51:12 IST 2018\n','2018-05-08',44),
 (40,'Customer Rent,\nRent No:-. RE-11\nMobile No:-. 8956276855\nTotal Rent  Amount. 3300\nDeposite Amount. 500\nDue Date . Sun May 06 10:56:41 IST 2018\n','2018-05-06',45),
 (41,'Customer Rent,\nRent No:-. RE-12\nMobile No:-. 8956276855\nTotal Rent  Amount. 4400\nDeposite Amount. 500\nDue Date . Mon May 07 10:57:05 IST 2018\n','2018-05-07',46),
 (42,'Customer Repair,\nrepair No:-. RP-11\nMobile No:-. 8956276855\nTotal Repair  Amount. 800\nPaid Amount. 200\nReturn Date . Fri May 18 00:00:00 IST 2018\n','2018-05-03',47);
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (43,'Customer Repair,\nrepair No:-. RP-12\nMobile No:-. 8956276855\nTotal Repair  Amount. 450\nPaid Amount. 100\nReturn Date . Fri May 11 00:00:00 IST 2018\n','2018-05-03',48),
 (44,'Student Admission,\nAdmission No:-. CL1017\nMobile No:-. 8983728316\nTotal Fee Amount. 1100\nPaid Amount. 100\nBalance Amount. 1000\n','2018-05-05',49),
 (45,'Customer Rent,\nRent No:-. RE-14\nMobile No:-. 848494246\nTotal Rent  Amount. 3300\nDeposite Amount. 3000\nDue Date . Sun May 06 14:06:50 IST 2018\n','2018-05-06',50),
 (46,'Customer Repair,\nrepair No:-. RP-13\nMobile No:-. 848494246\nTotal Repair  Amount. 400\nPaid Amount. 200\nReturn Date . Sat May 05 00:00:00 IST 2018\n','2018-05-03',51),
 (47,'Customer Rent,\nRent No:-. RE-15\nMobile No:-. 848494246\nTotal Rent  Amount. 1500\nDeposite Amount. 2000\nDue Date . Sun May 06 14:28:13 IST 2018\n','2018-05-06',52),
 (48,'Student Admission,\nAdmission No:-. CL1018\nMobile No:-. 6546541651\nTotal Fee Amount. 1100\nPaid Amount. 100\nBalance Amount. 1000\n','2018-05-20',53),
 (49,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Wed May 16 00:00:00 IST 2018\nTill Date:-. Mon May 28 00:00:00 IST 2018\nPrevious Balance. 100\nDeduction Amount. 100\n','2018-05-25',54);
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (50,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Tue May 08 00:00:00 IST 2018\nTill Date:-. Mon May 28 00:00:00 IST 2018\nPrevious Balance. 1900\nDeduction Amount. 1900\n','2018-05-25',55),
 (51,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Tue May 15 00:00:00 IST 2018\nTill Date:-. Mon May 28 00:00:00 IST 2018\nPrevious Balance. 0\nDeduction Amount. 0\n','2018-05-25',56),
 (52,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Wed May 02 00:00:00 IST 2018\nTill Date:-. Thu Jun 28 00:00:00 IST 2018\nPrevious Balance. 1000\nDeduction Amount. 1000\n','2018-05-25',57),
 (53,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Tue May 01 00:00:00 IST 2018\nTill Date:-. Tue May 29 00:00:00 IST 2018\nPrevious Balance. 10\nDeduction Amount. 10\n','2018-05-25',58),
 (54,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Wed May 09 00:00:00 IST 2018\nTill Date:-. Tue May 29 00:00:00 IST 2018\nPrevious Balance. 100\nDeduction Amount. 100\n','2018-05-25',59),
 (55,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Tue May 08 00:00:00 IST 2018\nTill Date:-. Mon May 28 00:00:00 IST 2018\nPrevious Balance. 1100\nDeduction Amount. 1100\n','2018-05-25',60);
INSERT INTO `ange`.`paymentfollowupmessage` (`id`,`Description`,`followupdate`,`PaymentFollowup_id`) VALUES 
 (56,'Student Shifted to Old Student-Rejoin or not request ,\nFrom Date:-. Tue May 08 00:00:00 IST 2018\nTill Date:-. Thu May 24 00:00:00 IST 2018\nPrevious Balance. 1100\nDeduction Amount. 1100\n','2018-05-25',61),
 (57,'Customer Sell,\nSell No:-. 3\nMobile No:-. 8983728314\nTotal Billing Amount. 6000\nPaid Amount. 3000.00.0\nBalance Amount. 3000.0\n','2018-05-25',62),
 (58,'Customer Rent,\nRent No:-. RE-16\nMobile No:-. 8956276855\nTotal Rent  Amount. 3500\nDeposite Amount. 5000\nDue Date . Thu May 31 14:05:10 IST 2018\n','2018-05-31',63),
 (59,'Customer Rent,\nRent No:-. RE-17\nMobile No:-. 8956276855\nTotal Rent  Amount. 2500\nDeposite Amount. 5000\nDue Date . Thu May 31 14:42:36 IST 2018\n','2018-05-31',64);
/*!40000 ALTER TABLE `paymentfollowupmessage` ENABLE KEYS */;


--
-- Definition of table `ange`.`photosvideos`
--

DROP TABLE IF EXISTS `ange`.`photosvideos`;
CREATE TABLE  `ange`.`photosvideos` (
  `galleryId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `insertedDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`galleryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`photosvideos`
--

/*!40000 ALTER TABLE `photosvideos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photosvideos` ENABLE KEYS */;


--
-- Definition of table `ange`.`previousstudent`
--

DROP TABLE IF EXISTS `ange`.`previousstudent`;
CREATE TABLE  `ange`.`previousstudent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(255) DEFAULT NULL,
  `joiningdate` date DEFAULT NULL,
  `mobilenumber` varchar(255) DEFAULT NULL,
  `studentname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`previousstudent`
--

/*!40000 ALTER TABLE `previousstudent` DISABLE KEYS */;
/*!40000 ALTER TABLE `previousstudent` ENABLE KEYS */;


--
-- Definition of table `ange`.`product`
--

DROP TABLE IF EXISTS `ange`.`product`;
CREATE TABLE  `ange`.`product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `HSN_Code` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `cgst` float NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `igst` float NOT NULL,
  `modelNo` varchar(255) DEFAULT NULL,
  `productAddedDate` datetime DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `quentity` int(11) NOT NULL,
  `sellPrice` float NOT NULL,
  `sgst` float NOT NULL,
  `transportCharge` float NOT NULL,
  `unitPrice` float NOT NULL,
  `instrumentName_instrumentId` int(11) DEFAULT NULL,
  `instrumentSubcategory_instrumentSubcategoryId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_blfaaktcimlnj1slxgptnvabp` (`instrumentName_instrumentId`),
  KEY `FK_9uymriyi6jec7umxty1bkwhn8` (`instrumentSubcategory_instrumentSubcategoryId`),
  CONSTRAINT `FK_9uymriyi6jec7umxty1bkwhn8` FOREIGN KEY (`instrumentSubcategory_instrumentSubcategoryId`) REFERENCES `instrumentsubcategory` (`instrumentSubcategoryId`),
  CONSTRAINT `FK_blfaaktcimlnj1slxgptnvabp` FOREIGN KEY (`instrumentName_instrumentId`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `ange`.`productmodel`
--

DROP TABLE IF EXISTS `ange`.`productmodel`;
CREATE TABLE  `ange`.`productmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cgst` float NOT NULL,
  `Discountper` float NOT NULL,
  `Discription` varchar(255) DEFAULT NULL,
  `Hsn` varchar(255) DEFAULT NULL,
  `Igst` float NOT NULL,
  `PurchasePrice` float NOT NULL,
  `Sgst` float NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `UnitPrice` float NOT NULL,
  `productBarcode` varchar(255) DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `Model_id` int(11) DEFAULT NULL,
  `barcode_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `colorModel_id` int(11) DEFAULT NULL,
  `subCategory_id` bigint(20) DEFAULT NULL,
  `Modelid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `catid` bigint(20) NOT NULL,
  `colorModelid` int(11) NOT NULL,
  `subcatid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_63w0kobmvtkes8ija7bc7lms1` (`Model_id`),
  KEY `FK_cs43xkv3fkol0t3ex34r7gw26` (`barcode_id`),
  KEY `FK_11vjln5i3im3h9njsj2lj5fe` (`brand_id`),
  KEY `FK_fgw7j8r15630jg72qyrh4qrii` (`category_id`),
  KEY `FK_sm6opnl6wd4qytm9l4eyrgyxo` (`colorModel_id`),
  KEY `FK_qmnqrqsrha1j7lfccdrjhjkfe` (`subCategory_id`),
  CONSTRAINT `FK_11vjln5i3im3h9njsj2lj5fe` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_63w0kobmvtkes8ija7bc7lms1` FOREIGN KEY (`Model_id`) REFERENCES `addmodel` (`id`),
  CONSTRAINT `FK_cs43xkv3fkol0t3ex34r7gw26` FOREIGN KEY (`barcode_id`) REFERENCES `barcode` (`id`),
  CONSTRAINT `FK_fgw7j8r15630jg72qyrh4qrii` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_qmnqrqsrha1j7lfccdrjhjkfe` FOREIGN KEY (`subCategory_id`) REFERENCES `subcategory` (`id`),
  CONSTRAINT `FK_sm6opnl6wd4qytm9l4eyrgyxo` FOREIGN KEY (`colorModel_id`) REFERENCES `colormodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`productmodel`
--

/*!40000 ALTER TABLE `productmodel` DISABLE KEYS */;
INSERT INTO `ange`.`productmodel` (`id`,`Cgst`,`Discountper`,`Discription`,`Hsn`,`Igst`,`PurchasePrice`,`Sgst`,`Status`,`UnitPrice`,`productBarcode`,`productname`,`productquantity`,`Model_id`,`barcode_id`,`brand_id`,`category_id`,`colorModel_id`,`subCategory_id`,`Modelid`,`brandid`,`catid`,`colorModelid`,`subcatid`) VALUES 
 (2,0,0,'NA','NA',0,0,0,0,5000,'802612915','NA',10,2,4,1,2,1,2,2,1,2,1,2),
 (3,0,0,'NA','NA',0,0,0,1,1000,'91088990','NA',21,2,5,2,2,2,2,2,2,2,2,2),
 (5,0,0,'NA','NA',0,0,0,1,0,'125888293','NA',25,2,7,1,3,3,1,2,1,3,3,1),
 (32,0,0,'NA','NA',0,0,0,1,0,'219773706','NA',0,1,34,1,2,1,2,1,1,2,1,2),
 (33,0,0,'NA','NA',0,0,0,1,0,'826644226','NA',0,1,35,1,2,2,2,1,1,2,2,2),
 (34,0,0,'NA','NA',0,0,0,1,0,'735325178','NA',0,1,36,1,2,3,2,1,1,2,3,2),
 (35,0,0,'NA','NA',0,0,0,1,0,'805129367','NA',0,1,37,1,2,4,2,1,1,2,4,2),
 (36,0,0,'NA','NA',0,0,0,1,0,'680381097','NA',0,2,38,1,2,2,2,2,1,2,2,2),
 (37,0,0,'NA','NA',0,0,0,1,0,'738210411','NA',0,2,39,1,2,3,2,2,1,2,3,2),
 (38,0,0,'NA','NA',0,0,0,1,0,'391765826','NA',0,2,40,1,2,4,2,2,1,2,4,2),
 (39,0,0,'NA','NA',0,0,0,1,0,'580770992','NA',0,3,41,1,2,1,2,3,1,2,1,2);
INSERT INTO `ange`.`productmodel` (`id`,`Cgst`,`Discountper`,`Discription`,`Hsn`,`Igst`,`PurchasePrice`,`Sgst`,`Status`,`UnitPrice`,`productBarcode`,`productname`,`productquantity`,`Model_id`,`barcode_id`,`brand_id`,`category_id`,`colorModel_id`,`subCategory_id`,`Modelid`,`brandid`,`catid`,`colorModelid`,`subcatid`) VALUES 
 (40,0,0,'NA','NA',0,0,0,1,0,'359581969','NA',0,3,42,1,2,2,2,3,1,2,2,2),
 (41,0,0,'NA','NA',0,0,0,1,0,'23393295','NA',0,3,43,1,2,3,2,3,1,2,3,2),
 (42,0,0,'NA','NA',0,0,0,1,0,'276432020','NA',0,3,44,1,2,4,2,3,1,2,4,2),
 (43,0,0,'NA','NA',0,0,0,1,0,'751435542','NA',0,1,45,2,2,1,2,1,2,2,1,2),
 (44,0,0,'NA','NA',0,0,0,1,0,'666350472','NA',0,1,46,2,2,2,2,1,2,2,2,2),
 (45,0,0,'NA','NA',0,0,0,1,0,'350503672','NA',0,1,47,2,2,3,2,1,2,2,3,2),
 (46,0,0,'NA','NA',0,0,0,1,0,'793466895','NA',0,1,48,2,2,4,2,1,2,2,4,2),
 (47,0,0,'NA','NA',0,0,0,1,0,'571390869','NA',0,2,49,2,2,1,2,2,2,2,1,2),
 (48,0,0,'NA','NA',0,0,0,1,0,'245713298','NA',0,2,50,2,2,3,2,2,2,2,3,2),
 (49,0,0,'NA','NA',0,0,0,1,0,'876098502','NA',0,2,51,2,2,4,2,2,2,2,4,2),
 (50,0,0,'NA','NA',0,0,0,1,0,'418198651','NA',0,3,52,2,2,1,2,3,2,2,1,2);
INSERT INTO `ange`.`productmodel` (`id`,`Cgst`,`Discountper`,`Discription`,`Hsn`,`Igst`,`PurchasePrice`,`Sgst`,`Status`,`UnitPrice`,`productBarcode`,`productname`,`productquantity`,`Model_id`,`barcode_id`,`brand_id`,`category_id`,`colorModel_id`,`subCategory_id`,`Modelid`,`brandid`,`catid`,`colorModelid`,`subcatid`) VALUES 
 (51,0,0,'NA','NA',0,0,0,1,0,'502754541','NA',0,3,53,2,2,2,2,3,2,2,2,2),
 (52,0,0,'NA','NA',0,0,0,1,0,'484662119','NA',0,3,54,2,2,3,2,3,2,2,3,2),
 (53,0,0,'NA','NA',0,0,0,1,0,'581080272','NA',0,3,55,2,2,4,2,3,2,2,4,2);
/*!40000 ALTER TABLE `productmodel` ENABLE KEYS */;


--
-- Definition of table `ange`.`purchase`
--

DROP TABLE IF EXISTS `ange`.`purchase`;
CREATE TABLE  `ange`.`purchase` (
  `purchaseId` int(11) NOT NULL AUTO_INCREMENT,
  `productAddedDate` datetime DEFAULT NULL,
  `quentity` int(11) NOT NULL,
  `sellPrice` float NOT NULL,
  `totalPrice` float NOT NULL,
  `transportCharge` float NOT NULL,
  `unitPrice` float NOT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchaseId`),
  KEY `FK_erpnntvytys21b1wkvl33e2ho` (`productId`),
  CONSTRAINT `FK_erpnntvytys21b1wkvl33e2ho` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`purchase`
--

/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


--
-- Definition of table `ange`.`purchasedetails`
--

DROP TABLE IF EXISTS `ange`.`purchasedetails`;
CREATE TABLE  `ange`.`purchasedetails` (
  `PurchaseDetailId` bigint(20) NOT NULL AUTO_INCREMENT,
  `FinalAmount` float NOT NULL,
  `PurchasePrice` float NOT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Quantity` bigint(20) NOT NULL,
  `Total` float NOT NULL,
  `cgstamount` float NOT NULL,
  `cgstper` float NOT NULL,
  `igstamount` float NOT NULL,
  `igstper` float NOT NULL,
  `sgstamount` float NOT NULL,
  `sgstper` float NOT NULL,
  `taxableAmount` float NOT NULL,
  `productModel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`PurchaseDetailId`),
  KEY `FK_41jqm9uosyfxo36ku5xnai8q0` (`productModel_id`),
  CONSTRAINT `FK_41jqm9uosyfxo36ku5xnai8q0` FOREIGN KEY (`productModel_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`purchasedetails`
--

/*!40000 ALTER TABLE `purchasedetails` DISABLE KEYS */;
INSERT INTO `ange`.`purchasedetails` (`PurchaseDetailId`,`FinalAmount`,`PurchasePrice`,`Purchase_Date`,`Quantity`,`Total`,`cgstamount`,`cgstper`,`igstamount`,`igstper`,`sgstamount`,`sgstper`,`taxableAmount`,`productModel_id`) VALUES 
 (1,29500,5000,'2018-05-21',5,25000,2250,9,0,0,2250,9,4500,3);
/*!40000 ALTER TABLE `purchasedetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`purchaseproduct`
--

DROP TABLE IF EXISTS `ange`.`purchaseproduct`;
CREATE TABLE  `ange`.`purchaseproduct` (
  `PurchaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GSTType` varchar(255) DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `discountamount` float NOT NULL,
  `grandTotal` float NOT NULL,
  `grandTotalGst` float NOT NULL,
  `grandTotalinword` varchar(255) DEFAULT NULL,
  `grandcgst` float NOT NULL,
  `grandigst` float NOT NULL,
  `grandsgst` float NOT NULL,
  `grandtotalquantity` float NOT NULL,
  `gstpercenatge` float NOT NULL,
  `invoiceID` varchar(255) DEFAULT NULL,
  `othercharges` float NOT NULL,
  `vendorid` bigint(20) DEFAULT NULL,
  `paymentmode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `FK_7vhjehcvwvflu6a837oqnswsi` (`vendorid`),
  CONSTRAINT `FK_7vhjehcvwvflu6a837oqnswsi` FOREIGN KEY (`vendorid`) REFERENCES `venderregistration` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`purchaseproduct`
--

/*!40000 ALTER TABLE `purchaseproduct` DISABLE KEYS */;
INSERT INTO `ange`.`purchaseproduct` (`PurchaseID`,`GSTType`,`Purchase_Date`,`discountamount`,`grandTotal`,`grandTotalGst`,`grandTotalinword`,`grandcgst`,`grandigst`,`grandsgst`,`grandtotalquantity`,`gstpercenatge`,`invoiceID`,`othercharges`,`vendorid`,`paymentmode`) VALUES 
 (1,'1','2018-05-21',0,29500,4500,'Twenty Nine Thousand Five Hundred  ',2250,0,2250,5,18,'30254',0,1,'Cash');
/*!40000 ALTER TABLE `purchaseproduct` ENABLE KEYS */;


--
-- Definition of table `ange`.`purchaseproduct_purchasedetails`
--

DROP TABLE IF EXISTS `ange`.`purchaseproduct_purchasedetails`;
CREATE TABLE  `ange`.`purchaseproduct_purchasedetails` (
  `PurchaseProduct_PurchaseID` bigint(20) NOT NULL,
  `purchaseDetails_PurchaseDetailId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_fnmbfxsrl546ssseewoo743s4` (`purchaseDetails_PurchaseDetailId`),
  KEY `FK_fnmbfxsrl546ssseewoo743s4` (`purchaseDetails_PurchaseDetailId`),
  KEY `FK_54c0kej5qo7v8woaho19280sn` (`PurchaseProduct_PurchaseID`),
  CONSTRAINT `FK_54c0kej5qo7v8woaho19280sn` FOREIGN KEY (`PurchaseProduct_PurchaseID`) REFERENCES `purchaseproduct` (`PurchaseID`),
  CONSTRAINT `FK_fnmbfxsrl546ssseewoo743s4` FOREIGN KEY (`purchaseDetails_PurchaseDetailId`) REFERENCES `purchasedetails` (`PurchaseDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`purchaseproduct_purchasedetails`
--

/*!40000 ALTER TABLE `purchaseproduct_purchasedetails` DISABLE KEYS */;
INSERT INTO `ange`.`purchaseproduct_purchasedetails` (`PurchaseProduct_PurchaseID`,`purchaseDetails_PurchaseDetailId`) VALUES 
 (1,1);
/*!40000 ALTER TABLE `purchaseproduct_purchasedetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`purchasetemp`
--

DROP TABLE IF EXISTS `ange`.`purchasetemp`;
CREATE TABLE  `ange`.`purchasetemp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FinalAmount` float NOT NULL,
  `PurchasePrice` float NOT NULL,
  `Quantity` bigint(20) NOT NULL,
  `Total` float NOT NULL,
  `cgstamount` float NOT NULL,
  `cgstper` float NOT NULL,
  `igstamount` float NOT NULL,
  `igstper` float NOT NULL,
  `mrpprice` float NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `sgstamount` float NOT NULL,
  `sgstper` float NOT NULL,
  `taxableAmount` float NOT NULL,
  `Model_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `colorModel_id` int(11) DEFAULT NULL,
  `subCategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oho2jqojic8i60lmd3pmf92mt` (`Model_id`),
  KEY `FK_c1anw52m80ewa3igr82gqj0mc` (`brand_id`),
  KEY `FK_3o6cyfm9k2ufnj61851yp7ark` (`category_id`),
  KEY `FK_o9gk11heg1spvmh3ija0nv6tr` (`colorModel_id`),
  KEY `FK_f97ue07ow6hgqidtwdbkrb18l` (`subCategory_id`),
  CONSTRAINT `FK_3o6cyfm9k2ufnj61851yp7ark` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_c1anw52m80ewa3igr82gqj0mc` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_f97ue07ow6hgqidtwdbkrb18l` FOREIGN KEY (`subCategory_id`) REFERENCES `subcategory` (`id`),
  CONSTRAINT `FK_o9gk11heg1spvmh3ija0nv6tr` FOREIGN KEY (`colorModel_id`) REFERENCES `colormodel` (`id`),
  CONSTRAINT `FK_oho2jqojic8i60lmd3pmf92mt` FOREIGN KEY (`Model_id`) REFERENCES `addmodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`purchasetemp`
--

/*!40000 ALTER TABLE `purchasetemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasetemp` ENABLE KEYS */;


--
-- Definition of table `ange`.`rent`
--

DROP TABLE IF EXISTS `ange`.`rent`;
CREATE TABLE  `ange`.`rent` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CloseRequest` int(11) NOT NULL,
  `FinalAmount` int(11) NOT NULL,
  `IdProofType` varchar(255) DEFAULT NULL,
  `Paid_ByCust` int(11) NOT NULL,
  `Return_by_Shop` int(11) NOT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `customerIdProof` varchar(255) DEFAULT NULL,
  `discamt` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `duedateSmsdate` date DEFAULT NULL,
  `duedateSmsstatus` int(11) NOT NULL,
  `extraDays` int(11) NOT NULL,
  `fromDate` datetime DEFAULT NULL,
  `noOfDays` int(11) NOT NULL,
  `other` int(11) NOT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `receivedDate` datetime DEFAULT NULL,
  `rentNo` varchar(255) DEFAULT NULL,
  `requestClosedDate` date DEFAULT NULL,
  `securityDeposite` int(11) NOT NULL,
  `totalamt` int(11) NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_a6t1xtqo7bvotfbh5mh51w2ju` (`CustomerAccount_Id`),
  KEY `FK_d52n7baov991tlfa2gfakej84` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_a6t1xtqo7bvotfbh5mh51w2ju` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_d52n7baov991tlfa2gfakej84` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`rent`
--

/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `ange`.`rent` (`Id`,`CloseRequest`,`FinalAmount`,`IdProofType`,`Paid_ByCust`,`Return_by_Shop`,`amountinWord`,`customerIdProof`,`discamt`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`extraDays`,`fromDate`,`noOfDays`,`other`,`paymode`,`receivedDate`,`rentNo`,`requestClosedDate`,`securityDeposite`,`totalamt`,`CustomerAccount_Id`,`adminOfBranch_adminId`) VALUES 
 (1,0,1000,'Adhar Card',0,1000,'0','Adhar Card',0,0,'2018-04-24',1,0,'2018-04-24 15:58:12',2,0,'Cash','2018-04-27 16:00:03','RE-1','2018-04-24',2000,1000,1,2),
 (2,0,0,'Adhar Card',0,5000,'0','Adhar Card',0,0,'2018-04-24',1,0,'2018-04-24 16:26:13',5,0,'Cash','2018-04-29 19:21:20','RE-2','2018-04-24',5000,0,1,2),
 (3,0,4950,'Adhar Card',0,50,'0','Adhar Card',550,10,'2018-04-24',1,0,'2018-04-24 17:45:18',5,0,'Cash','2018-04-29 19:11:27','RE-3','2018-04-24',5000,5500,9,2),
 (4,0,11000,'Pan Card',10900,0,'0','Pan Card',0,0,'2018-04-28',1,0,'2018-04-28 14:17:50',10,0,'Cash','2018-05-08 14:17:50','RE-4','2018-04-28',100,11000,1,2),
 (5,0,11000,'Pan Card',10900,0,'0','Pan Card',0,0,'2018-04-28',1,0,'2018-04-28 14:22:07',10,0,'Cash','2018-05-08 14:22:07','RE-5','2018-04-28',100,11000,1,2);
INSERT INTO `ange`.`rent` (`Id`,`CloseRequest`,`FinalAmount`,`IdProofType`,`Paid_ByCust`,`Return_by_Shop`,`amountinWord`,`customerIdProof`,`discamt`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`extraDays`,`fromDate`,`noOfDays`,`other`,`paymode`,`receivedDate`,`rentNo`,`requestClosedDate`,`securityDeposite`,`totalamt`,`CustomerAccount_Id`,`adminOfBranch_adminId`) VALUES 
 (6,0,5500,'Adhar Card',5000,0,'0','Adhar Card',0,0,'2018-05-03',1,0,'2018-05-03 10:33:06',5,0,'Cash','2018-05-08 10:37:16','RE-7','2018-05-03',500,5500,1,2),
 (7,0,5500,'Pan Card',0,0,'0','Pan Card',0,0,'2018-05-03',1,0,'2018-05-03 10:50:27',5,0,'Cash','2018-05-08 10:51:57','RE-6','2018-05-03',5500,5500,1,2),
 (8,1,5500,'Pan Card',500,0,'0','Pan Card',0,0,'2018-05-03',1,0,'2018-05-03 10:51:12',5,0,'Cash','2018-05-08 10:51:12','RE-8','2018-05-03',5000,5500,1,2),
 (9,1,1100,'Pan Card',600,0,'0','Pan Card',0,0,'2018-05-03',1,0,'2018-05-03 10:54:01',1,0,'Cash','2018-05-04 10:54:01','RE-9','2018-05-03',500,1100,1,2),
 (10,1,3300,'Adhar Card',2800,0,'0','Adhar Card',0,0,'2018-05-03',1,0,'2018-05-03 10:55:49',3,0,'Cash','2018-05-06 10:55:49','RE-10','2018-05-03',500,3300,1,2),
 (11,1,3300,'Adhar Card',2800,0,'0','Adhar Card',0,0,'2018-05-03',1,0,'2018-05-03 10:56:41',3,0,'Cash','2018-05-06 10:56:41','RE-11','2018-05-03',500,3300,1,2);
INSERT INTO `ange`.`rent` (`Id`,`CloseRequest`,`FinalAmount`,`IdProofType`,`Paid_ByCust`,`Return_by_Shop`,`amountinWord`,`customerIdProof`,`discamt`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`extraDays`,`fromDate`,`noOfDays`,`other`,`paymode`,`receivedDate`,`rentNo`,`requestClosedDate`,`securityDeposite`,`totalamt`,`CustomerAccount_Id`,`adminOfBranch_adminId`) VALUES 
 (12,0,4400,'Driving License',0,0,'0','Driving License',0,0,'2018-05-03',1,0,'2018-05-03 10:57:05',4,0,'Cash','2018-05-07 11:16:36','RE-12','2018-05-03',4400,4400,1,2),
 (13,1,3300,'Adhar Card',300,0,'0','Adhar Card',0,0,'2018-05-03',1,0,'2018-05-03 14:02:35',3,0,'Cash','2018-05-06 14:02:35','RE-13','2018-05-03',3000,3300,24,2),
 (14,0,5500,'Adhar Card',0,0,'0','Adhar Card',0,0,'2018-05-03',1,0,'2018-05-03 14:06:50',3,0,'Cash','2018-05-06 14:08:54','RE-14','2018-05-03',5500,5500,24,2),
 (15,0,1500,'Adhar Card',0,0,'0','Adhar Card',0,0,'2018-05-03',1,0,'2018-05-03 14:28:13',3,0,'Cash','2018-05-06 14:28:36','RE-15','2018-05-03',2000,1500,24,2),
 (16,0,5600,'Pan Card',0,0,'0','Pan Card',0,0,'2018-05-26',1,0,'2018-05-26 14:05:10',5,0,'Cash','2018-05-31 14:06:00','RE-16','2018-05-26',5600,5600,1,2);
INSERT INTO `ange`.`rent` (`Id`,`CloseRequest`,`FinalAmount`,`IdProofType`,`Paid_ByCust`,`Return_by_Shop`,`amountinWord`,`customerIdProof`,`discamt`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`extraDays`,`fromDate`,`noOfDays`,`other`,`paymode`,`receivedDate`,`rentNo`,`requestClosedDate`,`securityDeposite`,`totalamt`,`CustomerAccount_Id`,`adminOfBranch_adminId`) VALUES 
 (17,0,2500,'Pan Card',0,0,'0','Pan Card',0,0,'2018-05-26',1,0,'2018-05-26 14:42:36',5,0,'Cash','2018-05-31 14:42:53','RE-17','2018-05-26',5000,2500,1,2);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;


--
-- Definition of table `ange`.`rent_rentdetails`
--

DROP TABLE IF EXISTS `ange`.`rent_rentdetails`;
CREATE TABLE  `ange`.`rent_rentdetails` (
  `Rent_Id` bigint(20) NOT NULL,
  `rentDetails_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mtobe6m57m7rwct3l3yen6k7m` (`rentDetails_AccountId`),
  KEY `FK_mtobe6m57m7rwct3l3yen6k7m` (`rentDetails_AccountId`),
  KEY `FK_ocbpgxvidoramq8yq24076tal` (`Rent_Id`),
  CONSTRAINT `FK_mtobe6m57m7rwct3l3yen6k7m` FOREIGN KEY (`rentDetails_AccountId`) REFERENCES `rentdetails` (`AccountId`),
  CONSTRAINT `FK_ocbpgxvidoramq8yq24076tal` FOREIGN KEY (`Rent_Id`) REFERENCES `rent` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`rent_rentdetails`
--

/*!40000 ALTER TABLE `rent_rentdetails` DISABLE KEYS */;
INSERT INTO `ange`.`rent_rentdetails` (`Rent_Id`,`rentDetails_AccountId`) VALUES 
 (1,1),
 (3,5),
 (3,6),
 (4,7),
 (4,8),
 (6,9),
 (6,10),
 (7,11),
 (7,12),
 (9,13),
 (9,14),
 (10,15),
 (10,16),
 (12,17),
 (12,18),
 (13,19),
 (13,20),
 (14,21),
 (14,22),
 (15,23),
 (16,24),
 (16,25),
 (17,26);
/*!40000 ALTER TABLE `rent_rentdetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`rentdetails`
--

DROP TABLE IF EXISTS `ange`.`rentdetails`;
CREATE TABLE  `ange`.`rentdetails` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentRentCost` int(11) NOT NULL,
  `noofdays` int(11) NOT NULL,
  `totalamount` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`rentdetails`
--

/*!40000 ALTER TABLE `rentdetails` DISABLE KEYS */;
INSERT INTO `ange`.`rentdetails` (`AccountId`,`instrumentName`,`instrumentRentCost`,`noofdays`,`totalamount`) VALUES 
 (1,'GUITAR',500,2,1000),
 (2,'GUITAR',500,5,2500),
 (3,'GUITAR',500,5,2500),
 (4,'HARMONIUM',600,5,3000),
 (5,'GUITAR',500,5,2500),
 (6,'HARMONIUM',600,5,3000),
 (7,'GUITAR',500,10,5000),
 (8,'HARMONIUM',600,10,6000),
 (9,'GUITAR',500,5,2500),
 (10,'HARMONIUM',600,5,3000),
 (11,'GUITAR',500,5,2500),
 (12,'HARMONIUM',600,5,3000),
 (13,'GUITAR',500,1,500),
 (14,'HARMONIUM',600,1,600),
 (15,'GUITAR',500,3,1500),
 (16,'HARMONIUM',600,3,1800),
 (17,'GUITAR',500,4,2000),
 (18,'HARMONIUM',600,4,2400),
 (19,'GUITAR',500,3,1500),
 (20,'HARMONIUM',600,3,1800),
 (21,'GUITAR',500,3,1500),
 (22,'HARMONIUM',600,3,1800),
 (23,'GUITAR',500,3,1500),
 (24,'GUITAR',500,5,2500),
 (25,'TABLA',200,5,1000),
 (26,'GUITAR',500,5,2500);
/*!40000 ALTER TABLE `rentdetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`repair`
--

DROP TABLE IF EXISTS `ange`.`repair`;
CREATE TABLE  `ange`.`repair` (
  `repairId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Bal` int(11) NOT NULL,
  `CloseRequest` int(11) NOT NULL,
  `FinalAmount` int(11) NOT NULL,
  `Paid` int(11) NOT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `discamt` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `duedateSmsdate` date DEFAULT NULL,
  `duedateSmsstatus` int(11) NOT NULL,
  `extraDays` int(11) NOT NULL,
  `fromDate` datetime DEFAULT NULL,
  `noOfDays` int(11) NOT NULL,
  `other` int(11) NOT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `receivedDate` datetime DEFAULT NULL,
  `repairNo` varchar(255) DEFAULT NULL,
  `requestClosedDate` date DEFAULT NULL,
  `totalamt` int(11) NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`repairId`),
  KEY `FK_3djnpfeo6fd4yf6g2neses570` (`CustomerAccount_Id`),
  KEY `FK_etxdtf41g3w47177xe8xy1jsg` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_3djnpfeo6fd4yf6g2neses570` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_etxdtf41g3w47177xe8xy1jsg` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`repair`
--

/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `ange`.`repair` (`repairId`,`Bal`,`CloseRequest`,`FinalAmount`,`Paid`,`amountinWord`,`discamt`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`extraDays`,`fromDate`,`noOfDays`,`other`,`paymode`,`receivedDate`,`repairNo`,`requestClosedDate`,`totalamt`,`CustomerAccount_Id`,`adminOfBranch_adminId`) VALUES 
 (1,2550,0,2600,50,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:17:04',0,0,'Cash','2018-04-25 00:00:00','RP-1','2018-04-26',2600,11,2),
 (2,0,1,200,200,'Two Hundred  ',0,0,'2018-04-25',1,0,'2018-04-25 17:18:32',0,0,'Cash','2018-04-27 00:00:00','RP-2','2018-04-25',200,11,2),
 (3,200,0,400,200,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:21:21',0,0,'Cash','2018-04-25 00:00:00','RP-3','2018-04-26',400,11,2),
 (4,0,1,200,200,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:22:12',0,0,'Cash','2018-04-27 00:00:00','RP-4','2018-04-25',200,11,2),
 (5,0,1,200,200,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:22:29',0,0,'Cash','2018-04-27 00:00:00','RP-5','2018-04-25',200,11,2),
 (6,0,1,200,200,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:23:56',0,0,'Cash','2018-04-27 00:00:00','RP-6','2018-04-25',200,11,2),
 (7,0,1,200,200,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:29:14',0,0,'Cash','2018-04-27 00:00:00','RP-7','2018-04-25',200,11,2);
INSERT INTO `ange`.`repair` (`repairId`,`Bal`,`CloseRequest`,`FinalAmount`,`Paid`,`amountinWord`,`discamt`,`discper`,`duedateSmsdate`,`duedateSmsstatus`,`extraDays`,`fromDate`,`noOfDays`,`other`,`paymode`,`receivedDate`,`repairNo`,`requestClosedDate`,`totalamt`,`CustomerAccount_Id`,`adminOfBranch_adminId`) VALUES 
 (8,0,1,200,200,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:30:17',0,0,'Cash','2018-04-27 00:00:00','RP-8','2018-04-25',200,11,2),
 (9,700,1,800,100,'0',0,0,'2018-04-25',1,0,'2018-04-25 17:31:50',0,0,'Cash','2018-04-27 00:00:00','RP-9','2018-04-25',800,11,2),
 (10,100,0,200,100,'One Hundred  ',0,0,'2018-04-25',1,0,'2018-04-25 18:03:25',0,0,'Cash','2018-04-27 00:00:00','RP-10','2018-05-10',200,17,2),
 (11,600,0,800,400,'0',0,0,'2018-05-03',1,0,'2018-05-03 11:34:06',0,0,'Cash','2018-05-18 00:00:00','RP-11','2018-05-03',800,1,2),
 (12,0,0,450,450,'0',0,0,'2018-05-03',1,0,'2018-05-03 11:39:29',0,0,'Cash','2018-05-11 00:00:00','RP-12','2018-05-03',450,1,2),
 (13,0,0,800,800,'0',0,0,'2018-05-03',1,0,'2018-05-03 14:10:48',0,0,'Cash','2018-05-03 00:00:00','RP-13','2018-05-03',800,24,2);
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;


--
-- Definition of table `ange`.`repair_repairdetails`
--

DROP TABLE IF EXISTS `ange`.`repair_repairdetails`;
CREATE TABLE  `ange`.`repair_repairdetails` (
  `Repair_repairId` bigint(20) NOT NULL,
  `repairDetails_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_lr04ouw8nqiok9o82ddkg82mw` (`repairDetails_AccountId`),
  KEY `FK_lr04ouw8nqiok9o82ddkg82mw` (`repairDetails_AccountId`),
  KEY `FK_h0bbwe0uu5wxn6o50y5w9vcty` (`Repair_repairId`),
  CONSTRAINT `FK_h0bbwe0uu5wxn6o50y5w9vcty` FOREIGN KEY (`Repair_repairId`) REFERENCES `repair` (`repairId`),
  CONSTRAINT `FK_lr04ouw8nqiok9o82ddkg82mw` FOREIGN KEY (`repairDetails_AccountId`) REFERENCES `repairdetails` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`repair_repairdetails`
--

/*!40000 ALTER TABLE `repair_repairdetails` DISABLE KEYS */;
INSERT INTO `ange`.`repair_repairdetails` (`Repair_repairId`,`repairDetails_AccountId`) VALUES 
 (1,1),
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,6),
 (6,7),
 (7,8),
 (8,9),
 (9,10),
 (9,11),
 (10,12),
 (11,13),
 (11,14),
 (12,15),
 (12,16),
 (12,17),
 (13,18),
 (13,19);
/*!40000 ALTER TABLE `repair_repairdetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`repairdetails`
--

DROP TABLE IF EXISTS `ange`.`repairdetails`;
CREATE TABLE  `ange`.`repairdetails` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `instrumentBrand` varchar(255) DEFAULT NULL,
  `instrumentModel` varchar(255) DEFAULT NULL,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentRepairCost` int(11) NOT NULL,
  `instrumentRemark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`repairdetails`
--

/*!40000 ALTER TABLE `repairdetails` DISABLE KEYS */;
INSERT INTO `ange`.`repairdetails` (`AccountId`,`instrumentBrand`,`instrumentModel`,`instrumentName`,`instrumentRepairCost`,`instrumentRemark`) VALUES 
 (1,'dfg','dsfg','KEYBOARD',2000,NULL),
 (2,'dsfg','dfsg','VIOLIN',600,NULL),
 (3,'','','GUITAR',200,NULL),
 (4,'','String 1, String 2','GUITAR',400,NULL),
 (5,'','','GUITAR',200,NULL),
 (6,'','','GUITAR',200,NULL),
 (7,'','','GUITAR',200,NULL),
 (8,'','','GUITAR',200,NULL),
 (9,'','','GUITAR',200,NULL),
 (10,'dfg','dfg','KEYBOARD',200,NULL),
 (11,'dfg','dfg','VIOLIN',600,NULL),
 (12,'','','GUITAR',200,NULL),
 (13,'','','KEYBOARD',200,NULL),
 (14,'','','VIOLIN',600,NULL),
 (15,'','','KEYBOARD',200,NULL),
 (16,'','','GUITAR',200,NULL),
 (17,'','','PIONO',50,NULL),
 (18,'wed','asd','KEYBOARD',500,NULL),
 (19,'wqe','dsf','GUITAR',300,NULL);
/*!40000 ALTER TABLE `repairdetails` ENABLE KEYS */;


--
-- Definition of table `ange`.`sell`
--

DROP TABLE IF EXISTS `ange`.`sell`;
CREATE TABLE  `ange`.`sell` (
  `sellId` bigint(20) NOT NULL AUTO_INCREMENT,
  `counsellorName` varchar(255) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerAlternateNo` varchar(255) DEFAULT NULL,
  `customerFirstName` varchar(255) DEFAULT NULL,
  `customerLastName` varchar(255) DEFAULT NULL,
  `customerMiddleName` varchar(255) DEFAULT NULL,
  `customerMobileNo` varchar(255) DEFAULT NULL,
  `discount` float NOT NULL,
  `quentity` int(11) NOT NULL,
  `sellDate` datetime DEFAULT NULL,
  `sellNo` varchar(255) DEFAULT NULL,
  `sellPrice` float NOT NULL,
  `totalPrice` float NOT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellId`),
  KEY `FK_7reih86bnfdv1e3rw0ln8pg2e` (`adminOfBranch_adminId`),
  KEY `FK_n0r749an7fp6vkkl2s75l41r2` (`productId`),
  CONSTRAINT `FK_7reih86bnfdv1e3rw0ln8pg2e` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_n0r749an7fp6vkkl2s75l41r2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`sell`
--

/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;


--
-- Definition of table `ange`.`sellpaymenthistory`
--

DROP TABLE IF EXISTS `ange`.`sellpaymenthistory`;
CREATE TABLE  `ange`.`sellpaymenthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `paidamt` float NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `CustomerSale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lrp3dgeu2vgmly9sskqdwx184` (`CustomerAccount_Id`),
  KEY `FK_jlylknvcxj0cr5u3g0kwitj1p` (`CustomerSale_id`),
  CONSTRAINT `FK_jlylknvcxj0cr5u3g0kwitj1p` FOREIGN KEY (`CustomerSale_id`) REFERENCES `customersale` (`id`),
  CONSTRAINT `FK_lrp3dgeu2vgmly9sskqdwx184` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`sellpaymenthistory`
--

/*!40000 ALTER TABLE `sellpaymenthistory` DISABLE KEYS */;
INSERT INTO `ange`.`sellpaymenthistory` (`id`,`date`,`paidamt`,`CustomerAccount_Id`,`CustomerSale_id`) VALUES 
 (1,'2018-05-22',2000,5,1),
 (2,'2018-05-22',1500,5,1),
 (3,'2018-05-25',3000,11,3),
 (4,'2018-05-25',10000,11,3);
/*!40000 ALTER TABLE `sellpaymenthistory` ENABLE KEYS */;


--
-- Definition of table `ange`.`smsmodel`
--

DROP TABLE IF EXISTS `ange`.`smsmodel`;
CREATE TABLE  `ange`.`smsmodel` (
  `smsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `sms` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`smsId`),
  KEY `FK_82dsj7pnj7788rcyncntl62gp` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_82dsj7pnj7788rcyncntl62gp` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`smsmodel`
--

/*!40000 ALTER TABLE `smsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsmodel` ENABLE KEYS */;


--
-- Definition of table `ange`.`studentaccount`
--

DROP TABLE IF EXISTS `ange`.`studentaccount`;
CREATE TABLE  `ange`.`studentaccount` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Batches` varchar(255) DEFAULT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `Days` varchar(255) DEFAULT NULL,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `courseDuration` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disamount` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `finalamount` int(11) NOT NULL,
  `nextPaymentDate` date DEFAULT NULL,
  `noofBatchTimes` int(11) NOT NULL,
  `noofcourse` int(11) NOT NULL,
  `noofdays` int(11) NOT NULL,
  `packageFee` int(11) NOT NULL,
  `packagename` varchar(255) DEFAULT NULL,
  `paid` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `previousBalance` int(11) NOT NULL,
  `totalremfee` int(11) NOT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `FeeType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AccountId`),
  KEY `FK_a0q8xa9j76hr21ifi4wwtjm78` (`CustomerAccount_Id`),
  CONSTRAINT `FK_a0q8xa9j76hr21ifi4wwtjm78` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`studentaccount`
--

/*!40000 ALTER TABLE `studentaccount` DISABLE KEYS */;
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (1,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-17',1,1,2,1000,'2 Days 1 Batch',1000,'2018-04-16',0,100,1,'Previous Payment'),
 (2,'[Ljava.lang.String;@fa79360','[Ljava.lang.String;@26c8d347','[Ljava.lang.String;@79b47dcc','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-17',1,1,2,1000,'2 Days 1 Batch',100,'2018-04-16',0,1000,2,'Previous Payment'),
 (3,'[Ljava.lang.String;@4d5c9075','[Ljava.lang.String;@6ecc65a3','[Ljava.lang.String;@4f05d4f8','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-17',1,1,2,1000,'2 Days 1 Batch',1000,'2018-04-16',0,100,3,'Previous Payment'),
 (4,'[Ljava.lang.String;@7ee4982d','[Ljava.lang.String;@79a6a724','[Ljava.lang.String;@16857fba','Card','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-28',1,1,2,1000,'2 Days 1 Batch',1000,'2018-04-16',0,100,4,'Previous Payment');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (5,'[Ljava.lang.String;@1bc0884b','[Ljava.lang.String;@51919c03','[Ljava.lang.String;@14068894','Cash','',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-22',1,1,2,1000,'2 Days 1 Batch',1100,'2018-04-16',0,0,5,'Previous Payment'),
 (6,'[7 TO 8]','[Guitar]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-07-17',1,1,2,1000,'2 Days 1 Batch',1000,'2018-04-16',0,100,6,'Previous Payment'),
 (7,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-21',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-17',0,100,7,'Previous Payment'),
 (8,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',100,'2018-04-17',1000,1000,1,'Previous Payment');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (9,'[Ljava.lang.String;@fa79360','[Ljava.lang.String;@26c8d347','[Ljava.lang.String;@79b47dcc','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,2000,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-17',1000,1000,2,'Previous Payment'),
 (10,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-18',1000,500,1,'Previous Payment'),
 (11,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-21',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-18',0,100,8,'Previous Payment'),
 (12,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,100,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',100,'2018-04-18',100,0,8,'Previous Payment');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (13,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Fifty ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,100,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',50,'2018-04-18',100,50,8,'Previous Payment'),
 (14,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-21',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-18',0,100,9,'Admission'),
 (15,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Fifty ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,100,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',50,'2018-04-18',100,50,9,'Previous Payment'),
 (16,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1050,'2018-04-22',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-18',1000,50,9,'Monthly Payment'),
 (17,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Fifty ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,50,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',50,'2018-04-18',50,0,9,'Previous Payment');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (18,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-04-23',1,2,2,1000,'2 Days 1 Batch',100,'2018-04-18',1000,900,9,'Monthly Payment'),
 (19,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Nine Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,900,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',900,'2018-04-18',900,0,9,'Previous Payment'),
 (20,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,0,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-18',0,-500,9,'Previous Payment'),
 (21,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','0',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-22',1,2,2,1000,'2 Days 1 Batch',0,'2018-04-18',0,1100,10,'Admission'),
 (22,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Card','Six Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-04-22',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-18',0,600,11,'Admission');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (23,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Four Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,600,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',400,'2018-04-18',600,200,11,'Previous Balance'),
 (24,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Fifty ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,200,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',50,'2018-04-18',200,150,11,'Previous Balance'),
 (25,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Twenty Five',365,'dfhgfd safdcgfac cahgscdv bv',0,0,50,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',25,'2018-04-18',50,25,8,'Previous Balance'),
 (26,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Ten ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,25,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',10,'2018-04-18',25,15,8,'Previous Balance'),
 (27,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five',365,'dfhgfd safdcgfac cahgscdv bv',0,0,15,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',5,'2018-04-18',15,10,8,'Previous Balance');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (28,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,500,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',100,'2018-04-18',500,400,1,'Previous Balance'),
 (29,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','Three Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,400,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',300,'2018-04-18',400,100,1,'Previous Balance'),
 (30,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','Ten ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,100,'2018-04-18',1,2,2,1000,'2 Days 1 Batch',10,'2018-04-18',100,90,1,'Previous Balance'),
 (31,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-05-01',1,2,2,1000,'2 Days 1 Batch',1100,'2018-04-28',0,0,17,'Admission');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (32,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','One Thousand Ninety ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1090,'2018-05-18',1,2,2,1000,'2 Days 1 Batch',1090,'2018-04-28',90,0,1,'Monthly Payment'),
 (33,'[Ljava.lang.String;@62165336','[Ljava.lang.String;@187f5504','[Ljava.lang.String;@1a7b5ef5','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-06-17',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-28',0,0,1,'Monthly Payment'),
 (34,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-05-30',1,2,2,1000,'2 Days 1 Batch',1100,'2018-04-30',0,0,22,'Admission'),
 (35,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-06-29',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-30',0,0,22,'Monthly Payment');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (36,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-07-29',1,2,2,1000,'2 Days 1 Batch',1000,'2018-04-30',0,0,22,'Monthly Payment'),
 (37,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-08-28',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-30',0,500,22,'Monthly Payment'),
 (38,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-08-28',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-30',0,500,22,'Monthly Payment'),
 (39,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-09-27',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-30',0,500,22,'Monthly Payment'),
 (40,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1000,'2018-10-27',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-30',0,500,22,'Monthly Payment');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (41,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1500,'2018-11-26',1,2,2,1000,'2 Days 1 Batch',100,'2018-04-30',500,1400,22,'Monthly Payment'),
 (42,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','Five Hundred  ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,2400,'2018-12-26',1,2,2,1000,'2 Days 1 Batch',500,'2018-04-30',1400,1900,22,'Monthly Payment'),
 (43,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-06-30',1,2,2,1000,'2 Days 1 Batch',100,'2018-04-30',0,1000,23,'Admission'),
 (44,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','0',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-06-17',1,2,2,1000,'2 Days 1 Batch',0,'2018-05-03',0,1100,26,'Admission'),
 (45,'[7 TO 8]','[Guitar, Vocal]','[Monday, Tuesday]','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-06-07',1,2,2,1000,'2 Days 1 Batch',100,'2018-05-03',0,1000,27,'Admission');
INSERT INTO `ange`.`studentaccount` (`AccountId`,`Batches`,`CourseName`,`Days`,`PaymentMode`,`amountinWord`,`courseDuration`,`description`,`disamount`,`discper`,`finalamount`,`nextPaymentDate`,`noofBatchTimes`,`noofcourse`,`noofdays`,`packageFee`,`packagename`,`paid`,`paymentDate`,`previousBalance`,`totalremfee`,`CustomerAccount_Id`,`FeeType`) VALUES 
 (46,'[7 TO 8]','[Guitar, Vocal]','[Tuesday, Wednesday]','Cash','One Thousand ',365,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-06-17',1,2,2,1000,'2 Days 1 Batch',100,'2018-05-03',0,1000,31,'Admission'),
 (47,'[7 TO 8]','[Guitar]','[Monday, Tuesday]','Cash','One Thousand ',1,'dfhgfd safdcgfac cahgscdv bv',0,0,1100,'2018-06-25',1,1,2,1000,'2 Days 1 Batch',100,'2018-05-18',0,1000,38,'Admission');
/*!40000 ALTER TABLE `studentaccount` ENABLE KEYS */;


--
-- Definition of table `ange`.`studentpdf`
--

DROP TABLE IF EXISTS `ange`.`studentpdf`;
CREATE TABLE  `ange`.`studentpdf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PdfGalleryid` int(11) NOT NULL,
  `courseid` bigint(20) NOT NULL,
  `pdfdescription` varchar(255) DEFAULT NULL,
  `studentid` bigint(20) NOT NULL,
  `uploadedDate` date DEFAULT NULL,
  `pdfname` varchar(255) DEFAULT NULL,
  `UploadCoursePdfModel_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4upx0r6oq96x1r0uc8qk059a7` (`UploadCoursePdfModel_Id`),
  CONSTRAINT `FK_4upx0r6oq96x1r0uc8qk059a7` FOREIGN KEY (`UploadCoursePdfModel_Id`) REFERENCES `uploadcoursepdfmodel` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`studentpdf`
--

/*!40000 ALTER TABLE `studentpdf` DISABLE KEYS */;
INSERT INTO `ange`.`studentpdf` (`id`,`PdfGalleryid`,`courseid`,`pdfdescription`,`studentid`,`uploadedDate`,`pdfname`,`UploadCoursePdfModel_Id`) VALUES 
 (1,3,1,'fgjjfgjfjg',1,'2018-05-11','fdgdh',3),
 (2,3,1,'fgjjfgjfjg',1,'2018-05-11','fdgdh',3),
 (3,7,1,'http://www.mediafire.com/file/aq4n7nrfdwan3yy/File-Transfer-and-Chat-Project-in-Java.zip',1,'2018-05-11','Guitar_PDF',7);
/*!40000 ALTER TABLE `studentpdf` ENABLE KEYS */;


--
-- Definition of table `ange`.`studentvanishhistory`
--

DROP TABLE IF EXISTS `ange`.`studentvanishhistory`;
CREATE TABLE  `ange`.`studentvanishhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balanceamount` int(11) NOT NULL,
  `deductionamount` int(11) NOT NULL,
  `fromDate` date DEFAULT NULL,
  `tillDate` date DEFAULT NULL,
  `Admission_AdmissionId` bigint(20) DEFAULT NULL,
  `CustomerAccount_Id` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kqnneaess3vuiyqjovsd1ej7c` (`Admission_AdmissionId`),
  KEY `FK_2crp7ftopwjvh19j4sgi6rio5` (`CustomerAccount_Id`),
  KEY `FK_3p4r06f602owlw3ftmthulswc` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_2crp7ftopwjvh19j4sgi6rio5` FOREIGN KEY (`CustomerAccount_Id`) REFERENCES `customeraccount` (`Id`),
  CONSTRAINT `FK_3p4r06f602owlw3ftmthulswc` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_kqnneaess3vuiyqjovsd1ej7c` FOREIGN KEY (`Admission_AdmissionId`) REFERENCES `admission` (`AdmissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`studentvanishhistory`
--

/*!40000 ALTER TABLE `studentvanishhistory` DISABLE KEYS */;
INSERT INTO `ange`.`studentvanishhistory` (`id`,`balanceamount`,`deductionamount`,`fromDate`,`tillDate`,`Admission_AdmissionId`,`CustomerAccount_Id`,`adminOfBranch_adminId`,`Status`) VALUES 
 (1,100,100,'2018-05-16','2018-05-30',7,7,2,'Shifted to Old'),
 (2,1900,1900,'2018-05-08','2018-05-30',13,22,2,'Shifted to Regular'),
 (3,0,0,'2018-05-15','2018-05-30',13,22,2,'Shifted to Old'),
 (4,1000,1000,'2018-05-02','2018-06-30',18,38,2,'Shifted to Old'),
 (5,10,10,'2018-05-01','2018-05-31',8,8,2,'Shifted to Old'),
 (6,100,100,'2018-05-09','2018-05-31',6,6,2,'Shifted to Old'),
 (7,1100,1100,'2018-05-08','2018-05-30',15,26,2,'Shifted to Old'),
 (8,1100,1100,'2018-05-08','2018-05-26',10,10,2,'Shifted to Old'),
 (9,0,0,'2018-05-25','2018-05-25',10,10,2,'Shifted to Regular');
/*!40000 ALTER TABLE `studentvanishhistory` ENABLE KEYS */;


--
-- Definition of table `ange`.`studentwisevideo`
--

DROP TABLE IF EXISTS `ange`.`studentwisevideo`;
CREATE TABLE  `ange`.`studentwisevideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `dateofvideo` date DEFAULT NULL,
  `studentid` bigint(20) NOT NULL,
  `uploadedDate` date DEFAULT NULL,
  `videoName` varchar(255) DEFAULT NULL,
  `videoPath` varchar(255) DEFAULT NULL,
  `videodescription` varchar(255) DEFAULT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`studentwisevideo`
--

/*!40000 ALTER TABLE `studentwisevideo` DISABLE KEYS */;
INSERT INTO `ange`.`studentwisevideo` (`id`,`courseid`,`dateofvideo`,`studentid`,`uploadedDate`,`videoName`,`videoPath`,`videodescription`,`CourseName`) VALUES 
 (1,1,'2018-05-12',1,'2018-05-11',NULL,'gfhjghjjgh','fcghfdh','Guitar'),
 (2,1,'2018-05-19',1,'2018-05-14',NULL,'https://www.youtube.com/embed/t3M_nCSxSvg?rel=0','sadfsadf','Guitar');
/*!40000 ALTER TABLE `studentwisevideo` ENABLE KEYS */;


--
-- Definition of table `ange`.`subcategory`
--

DROP TABLE IF EXISTS `ange`.`subcategory`;
CREATE TABLE  `ange`.`subcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) DEFAULT NULL,
  `SubCategory` varchar(255) DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5b2vyd3kt0wv79g77oi40dgkf` (`cat_id`),
  CONSTRAINT `FK_5b2vyd3kt0wv79g77oi40dgkf` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`subcategory`
--

/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `ange`.`subcategory` (`id`,`Category`,`SubCategory`,`deletestatus`,`cat_id`) VALUES 
 (1,'GHDFGH','GUITAR',1,NULL),
 (2,'DFGHFDGH','ASFD',1,NULL),
 (3,'GFHFHGF','ASDF',0,NULL),
 (4,'GHDFGH','SDFSF',0,NULL),
 (5,'FGHFG','ARWEF',0,NULL),
 (6,'GHDFGH','GUIAR',1,NULL);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;


--
-- Definition of table `ange`.`tempcustomersell`
--

DROP TABLE IF EXISTS `ange`.`tempcustomersell`;
CREATE TABLE  `ange`.`tempcustomersell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productBarcode` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `total` float NOT NULL,
  `branchProduct_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ehphyw31j6rkr734yyibxlhqa` (`branchProduct_id`),
  CONSTRAINT `FK_ehphyw31j6rkr734yyibxlhqa` FOREIGN KEY (`branchProduct_id`) REFERENCES `branchproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`tempcustomersell`
--

/*!40000 ALTER TABLE `tempcustomersell` DISABLE KEYS */;
INSERT INTO `ange`.`tempcustomersell` (`id`,`productBarcode`,`productquantity`,`total`,`branchProduct_id`) VALUES 
 (1,'802612915',1,5000,2),
 (2,'91088990',1,1000,3);
/*!40000 ALTER TABLE `tempcustomersell` ENABLE KEYS */;


--
-- Definition of table `ange`.`tempimage`
--

DROP TABLE IF EXISTS `ange`.`tempimage`;
CREATE TABLE  `ange`.`tempimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagename` varchar(255) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`tempimage`
--

/*!40000 ALTER TABLE `tempimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempimage` ENABLE KEYS */;


--
-- Definition of table `ange`.`tempsaleforbranch`
--

DROP TABLE IF EXISTS `ange`.`tempsaleforbranch`;
CREATE TABLE  `ange`.`tempsaleforbranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `availableproductquantity` bigint(20) NOT NULL,
  `productBarcode` varchar(255) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `productModel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ajukygym75cyr7lqghr8b5hmm` (`productModel_id`),
  CONSTRAINT `FK_ajukygym75cyr7lqghr8b5hmm` FOREIGN KEY (`productModel_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`tempsaleforbranch`
--

/*!40000 ALTER TABLE `tempsaleforbranch` DISABLE KEYS */;
INSERT INTO `ange`.`tempsaleforbranch` (`id`,`availableproductquantity`,`productBarcode`,`productid`,`productname`,`productquantity`,`productModel_id`) VALUES 
 (33,16,'91088990',3,'NA',5,3),
 (34,25,'125888293',5,'NA',5,5);
/*!40000 ALTER TABLE `tempsaleforbranch` ENABLE KEYS */;


--
-- Definition of table `ange`.`uploadcoursepdfmodel`
--

DROP TABLE IF EXISTS `ange`.`uploadcoursepdfmodel`;
CREATE TABLE  `ange`.`uploadcoursepdfmodel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(255) DEFAULT NULL,
  `nameofpdf` varchar(255) DEFAULT NULL,
  `pdflink` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`uploadcoursepdfmodel`
--

/*!40000 ALTER TABLE `uploadcoursepdfmodel` DISABLE KEYS */;
INSERT INTO `ange`.`uploadcoursepdfmodel` (`Id`,`course`,`nameofpdf`,`pdflink`,`courseName`) VALUES 
 (1,'1','fdgdh','fgjjfgjfjg',NULL),
 (2,'1','fdgdh','fgjjfgjfjg','Guitar'),
 (3,'2','fdgdh','fgjjfgjfjg','Vocal'),
 (4,'2','fdgdh','fgjjfgjfjg','Vocal'),
 (5,'1','fdgdhfdhfgh','fgjjfgjfjg','Guitar'),
 (6,'1','dfshsfghgh','fdshjsfghfsgh','Guitar'),
 (7,'1','Guitar_PDF','http://www.mediafire.com/file/aq4n7nrfdwan3yy/File-Transfer-and-Chat-Project-in-Java.zip','Guitar'),
 (8,'1',NULL,NULL,'Guitar'),
 (9,'1','fdgdhfdhfgh','fgjjfgjfjg','Guitar'),
 (10,'1','fdgdhfdhfgh','fdshjsfghfsgh','Guitar'),
 (11,'1',NULL,NULL,'Guitar'),
 (12,'1',NULL,NULL,'Guitar'),
 (13,'1','fdgdhfdhfgh','fdshjsfghfsgh','Guitar'),
 (14,'1','lesson1','dfhfghjfg fgghj','Guitar');
/*!40000 ALTER TABLE `uploadcoursepdfmodel` ENABLE KEYS */;


--
-- Definition of table `ange`.`user`
--

DROP TABLE IF EXISTS `ange`.`user`;
CREATE TABLE  `ange`.`user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `AdmissionMode` varchar(255) DEFAULT NULL,
  `balance` float NOT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `firstInstallment` float NOT NULL,
  `firstInstallmentDate` date DEFAULT NULL,
  `jrno` varchar(255) DEFAULT NULL,
  `lastInstallment` float NOT NULL,
  `lastInstallmentDate` date DEFAULT NULL,
  `secondInstallment` float NOT NULL,
  `secondInstallmentDate` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `totalFees` float NOT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userAge` int(11) NOT NULL,
  `userAttendingDays` varchar(255) DEFAULT NULL,
  `userAttendingTime` varchar(255) DEFAULT NULL,
  `userCourse` varchar(255) DEFAULT NULL,
  `userDOB` date DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userGender` varchar(255) DEFAULT NULL,
  `userLastName` varchar(255) DEFAULT NULL,
  `userMiddleName` varchar(255) DEFAULT NULL,
  `userMobileNo` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userNextVisitReminder` datetime DEFAULT NULL,
  `userParentMobileNo` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userRegisteredDate` datetime DEFAULT NULL,
  `userSubject` varchar(255) DEFAULT NULL,
  `userBranch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_7onhpacmqkhnwcbfpcmmxf5wd` (`userBranch_branchId`),
  CONSTRAINT `FK_7onhpacmqkhnwcbfpcmmxf5wd` FOREIGN KEY (`userBranch_branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `ange`.`venderregistration`
--

DROP TABLE IF EXISTS `ange`.`venderregistration`;
CREATE TABLE  `ange`.`venderregistration` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `BalanceAmount` float NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `companyPhone` varchar(255) DEFAULT NULL,
  `contactPersonMob` varchar(255) DEFAULT NULL,
  `contactPersonName` varchar(255) DEFAULT NULL,
  `dist` varchar(255) DEFAULT NULL,
  `gstnnumber` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `vendorname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`venderregistration`
--

/*!40000 ALTER TABLE `venderregistration` DISABLE KEYS */;
INSERT INTO `ange`.`venderregistration` (`Id`,`Address`,`BalanceAmount`,`Email`,`Status`,`city`,`companyPhone`,`contactPersonMob`,`contactPersonName`,`dist`,`gstnnumber`,`pin`,`state`,`vendorname`) VALUES 
 (1,'viman nagar ,pune',35400,'accedeprojects2015@gmail.com',1,'pune','46516651','6546541651','fdghfgh','thane','651121312','411014','Maharashtra','Salman Shekh');
/*!40000 ALTER TABLE `venderregistration` ENABLE KEYS */;


--
-- Definition of table `ange`.`vendortransaction`
--

DROP TABLE IF EXISTS `ange`.`vendortransaction`;
CREATE TABLE  `ange`.`vendortransaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Reason` varchar(255) DEFAULT NULL,
  `TransactionAmount` float NOT NULL,
  `TransactionType` varchar(255) DEFAULT NULL,
  `Transaction_Date` date DEFAULT NULL,
  `Vendor_Id` bigint(20) NOT NULL,
  `vendorid_Id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mqbt11f7rtlevn21yw2sxmd4i` (`vendorid_Id`),
  CONSTRAINT `FK_mqbt11f7rtlevn21yw2sxmd4i` FOREIGN KEY (`vendorid_Id`) REFERENCES `venderregistration` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ange`.`vendortransaction`
--

/*!40000 ALTER TABLE `vendortransaction` DISABLE KEYS */;
INSERT INTO `ange`.`vendortransaction` (`id`,`Reason`,`TransactionAmount`,`TransactionType`,`Transaction_Date`,`Vendor_Id`,`vendorid_Id`) VALUES 
 (1,'Purchase order against=:30254',5900,'Credit','2018-05-15',1,1),
 (2,'Purchase order against=:30254',29500,'Credit','2018-05-21',1,1);
/*!40000 ALTER TABLE `vendortransaction` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
