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
  `receptionPassword` varchar(255) DEFAULT NULL,
  `registeredDate` datetime DEFAULT NULL,
  `adminOfBranch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_52e0bt94mc1o70g038xud8hqr` (`adminOfBranch_branchId`),
  CONSTRAINT `FK_52e0bt94mc1o70g038xud8hqr` FOREIGN KEY (`adminOfBranch_branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`admin` (`adminId`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`otp`,`receptionPassword`,`registeredDate`,`adminOfBranch_branchId`) VALUES 
 (2,'adsf','8956276855','asdef','708729',0,'708729','2017-07-17 00:00:00',NULL),
 (3,'dsfghd','8956276855','sdfgh','299863',0,'299863','2017-07-17 00:00:00',5),
 (4,'dineshsatelkar28@gmail.com','dfg','retg','620326',0,'620326','2017-07-17 00:00:00',6),
 (5,'dineshsatelkar2d8@gmail.com','7894561235','tyui','597318',0,'597318','2017-07-17 00:00:00',7),
 (6,'ery','ery','erty','228691',0,'228691','2017-07-17 00:00:00',8),
 (7,'dineshsatelkar258@gmail.com','8956276855','Dinesh','158869',0,'158869','2017-07-18 00:00:00',9);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`batchtime`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`batchtime`;
CREATE TABLE  `angelmusicacademy`.`batchtime` (
  `batchTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `batchTiming` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`batchTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`batchtime`
--

/*!40000 ALTER TABLE `batchtime` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`batchtime` (`batchTimeId`,`batchTiming`) VALUES 
 (1,'7DSXGF'),
 (2,'ASDGTFSDG');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`branch` (`branchId`,`branchAddress`,`branchName`,`branchRegisteredDate`,`admin_adminId`) VALUES 
 (4,'ewrf','SAEDRF','2017-07-17 00:00:00',2),
 (5,'dsfghd','DFRH','2017-07-17 00:00:00',3),
 (6,'ret','DRFTG','2017-07-17 00:00:00',4),
 (7,'tyu','YU','2017-07-17 00:00:00',5),
 (8,'erty','4R6T5','2017-07-17 00:00:00',6),
 (9,'Kharadi','KHARADI','2017-07-18 00:00:00',7);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`course`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`course`;
CREATE TABLE  `angelmusicacademy`.`course` (
  `courseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) DEFAULT NULL,
  `SUBJECT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `FK_3aqgyo19ypaw7iasouejpsfi7` (`SUBJECT`),
  CONSTRAINT `FK_3aqgyo19ypaw7iasouejpsfi7` FOREIGN KEY (`SUBJECT`) REFERENCES `subject` (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`course` (`courseId`,`courseName`,`SUBJECT`) VALUES 
 (1,'gfhdh',NULL),
 (2,'ytdudytgutu',NULL),
 (3,'szdfgsgfdh',NULL),
 (4,'adsfvsd',NULL),
 (5,'fdyutyur',1),
 (6,'yip0u8p-0p-09',1),
 (7,'rsetyer',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `eventNo` varchar(255) DEFAULT NULL,
  `user` tinyblob,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`instrument`
--

/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`instrument` (`instrumentId`,`instrumentAddedDate`,`instrumentDescription`,`instrumentImgName`,`instrumentName`) VALUES 
 (1,'2017-07-18 15:33:57','dfsgdfsg',NULL,'SDADSFG'),
 (2,'2017-07-18 15:34:59','gdfsgdsf',NULL,'SADFSA'),
 (3,'2017-07-18 15:45:20','sdfgsg',NULL,'SDF');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`instrumentsubcategory`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`instrumentsubcategory`;
CREATE TABLE  `angelmusicacademy`.`instrumentsubcategory` (
  `instrumentSubcategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `instrumentSubcategoryName` varchar(255) DEFAULT NULL,
  `INSTRUMENT` int(11) DEFAULT NULL,
  PRIMARY KEY (`instrumentSubcategoryId`),
  KEY `FK_2dgr56p6htsf65vhym15gm9dd` (`INSTRUMENT`),
  CONSTRAINT `FK_2dgr56p6htsf65vhym15gm9dd` FOREIGN KEY (`INSTRUMENT`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`instrumentsubcategory`
--

/*!40000 ALTER TABLE `instrumentsubcategory` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`instrumentsubcategory` (`instrumentSubcategoryId`,`instrumentSubcategoryName`,`INSTRUMENT`) VALUES 
 (1,'dsfgdfh',1),
 (2,'sdfghdd',2),
 (3,'dsfdda',1);
/*!40000 ALTER TABLE `instrumentsubcategory` ENABLE KEYS */;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`photosvideos`
--

/*!40000 ALTER TABLE `photosvideos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photosvideos` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`product`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`product`;
CREATE TABLE  `angelmusicacademy`.`product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `modelNo` varchar(255) DEFAULT NULL,
  `productAddedDate` datetime DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `quentity` int(11) NOT NULL,
  `sellPrice` float NOT NULL,
  `transportCharge` float NOT NULL,
  `unitPrice` float NOT NULL,
  `instrumentName_instrumentId` int(11) DEFAULT NULL,
  `instrumentSubcategory_instrumentSubcategoryId` bigint(20) DEFAULT NULL,
  `HSN_Code` varchar(255) DEFAULT NULL,
  `cgst` float NOT NULL,
  `igst` float NOT NULL,
  `sgst` float NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_blfaaktcimlnj1slxgptnvabp` (`instrumentName_instrumentId`),
  KEY `FK_9uymriyi6jec7umxty1bkwhn8` (`instrumentSubcategory_instrumentSubcategoryId`),
  CONSTRAINT `FK_9uymriyi6jec7umxty1bkwhn8` FOREIGN KEY (`instrumentSubcategory_instrumentSubcategoryId`) REFERENCES `instrumentsubcategory` (`instrumentSubcategoryId`),
  CONSTRAINT `FK_blfaaktcimlnj1slxgptnvabp` FOREIGN KEY (`instrumentName_instrumentId`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`product` (`productId`,`brand`,`color`,`modelNo`,`productAddedDate`,`productName`,`quentity`,`sellPrice`,`transportCharge`,`unitPrice`,`instrumentName_instrumentId`,`instrumentSubcategory_instrumentSubcategoryId`,`HSN_Code`,`cgst`,`igst`,`sgst`) VALUES 
 (1,'gfhj','fghj','ghfj','2017-07-19 12:26:16','hfgcj',10,10,10,50,NULL,1,'',5,1,1),
 (2,'asdfg','asdg','sdag','2017-07-19 12:29:37','dase',10,4,40,5,1,3,'',10,10,10),
 (3,'fgdj','dfgj','fgdj','2017-07-19 12:40:22','gf',10,100,50,100,2,2,'',10.5,12.5,11.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`purchase`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`purchase`;
CREATE TABLE  `angelmusicacademy`.`purchase` (
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
-- Dumping data for table `angelmusicacademy`.`purchase`
--

/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`rent`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`rent`;
CREATE TABLE  `angelmusicacademy`.`rent` (
  `rentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `advancedPaid` bigint(20) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `balanceAmount` bigint(20) NOT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerAlternateNo` varchar(255) DEFAULT NULL,
  `customerContactNo` varchar(255) DEFAULT NULL,
  `customerIdProof` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `discount` bigint(20) NOT NULL,
  `fromDate` date DEFAULT NULL,
  `noOfDays` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `rentNo` varchar(255) DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `totalAmount` bigint(20) NOT NULL,
  `instrumentName_instrumentId` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rentId`),
  KEY `FK_norcu4tjmjk9jskli2rx13ybi` (`instrumentName_instrumentId`),
  KEY `FK_c1cy08tdbdqd6tkry8dtyjuad` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_c1cy08tdbdqd6tkry8dtyjuad` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_norcu4tjmjk9jskli2rx13ybi` FOREIGN KEY (`instrumentName_instrumentId`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`rent`
--

/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`rent` (`rentId`,`advancedPaid`,`amount`,`balanceAmount`,`customerAddress`,`customerAlternateNo`,`customerContactNo`,`customerIdProof`,`customerName`,`discount`,`fromDate`,`noOfDays`,`quantity`,`rentNo`,`toDate`,`totalAmount`,`instrumentName_instrumentId`,`adminOfBranch_adminId`) VALUES 
 (1,5,546,454,'56+','56','546','45+','65+ 56+ 56+',546,'2020-09-21',546,456,'AMARENT-980234','2019-08-20',546,2,NULL);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`repair`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`repair`;
CREATE TABLE  `angelmusicacademy`.`repair` (
  `repairId` bigint(20) NOT NULL AUTO_INCREMENT,
  `advancePaid` bigint(20) NOT NULL,
  `balanceAmount` bigint(20) NOT NULL,
  `billing` varchar(255) DEFAULT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerAlternateNo` varchar(255) DEFAULT NULL,
  `customerFirstName` varchar(255) DEFAULT NULL,
  `customerLastName` varchar(255) DEFAULT NULL,
  `customerMiddleName` varchar(255) DEFAULT NULL,
  `customerMobileNo` varchar(255) DEFAULT NULL,
  `discount` bigint(20) NOT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `receivedDate` datetime DEFAULT NULL,
  `repairNo` varchar(255) DEFAULT NULL,
  `repairingCost` bigint(20) NOT NULL,
  `returnDate` date DEFAULT NULL,
  `instrumentName_instrumentId` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`repairId`),
  KEY `FK_hwge7i7uvnm47yxfrdl852rtd` (`instrumentName_instrumentId`),
  KEY `FK_2owsdbbq3rpfd2vy25c6rr60k` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_2owsdbbq3rpfd2vy25c6rr60k` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_hwge7i7uvnm47yxfrdl852rtd` FOREIGN KEY (`instrumentName_instrumentId`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`repair`
--

/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`repair` (`repairId`,`advancePaid`,`balanceAmount`,`billing`,`counsellorName`,`customerAddress`,`customerAlternateNo`,`customerFirstName`,`customerLastName`,`customerMiddleName`,`customerMobileNo`,`discount`,`problem`,`quantity`,`receivedDate`,`repairNo`,`repairingCost`,`returnDate`,`instrumentName_instrumentId`,`adminOfBranch_adminId`) VALUES 
 (1,786,786,'45','tyui','456','45','65eyu7','tyuty','tutyu','6587',456,'rtesver',76,'2017-07-19 18:53:26','AMARE-477277',0,'2061-07-19',1,NULL),
 (2,54,54,'56','ytfuny','546+','56','47886dhyyu','tfgu','ytfuy','53643',54,'56+',56,'2017-07-19 18:53:52','AMARE-483754',0,'2017-07-19',3,NULL);
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`sell`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`sell`;
CREATE TABLE  `angelmusicacademy`.`sell` (
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
  `productId` int(11) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellId`),
  KEY `FK_n0r749an7fp6vkkl2s75l41r2` (`productId`),
  KEY `FK_7reih86bnfdv1e3rw0ln8pg2e` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_7reih86bnfdv1e3rw0ln8pg2e` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_n0r749an7fp6vkkl2s75l41r2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`sell`
--

/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`sell` (`sellId`,`counsellorName`,`customerAddress`,`customerAlternateNo`,`customerFirstName`,`customerLastName`,`customerMiddleName`,`customerMobileNo`,`discount`,`quentity`,`sellDate`,`sellNo`,`sellPrice`,`totalPrice`,`productId`,`adminOfBranch_adminId`) VALUES 
 (1,'dfgdf','gdfg','12','fdg','fgd','dfg','4654651',16,16,'2017-07-19 18:52:28','AMASELL-173042',64,61,1,NULL);
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`subject`
--

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`subject` (`subjectId`,`subjectDescription`,`subjectName`,`subjectRegisteredDate`) VALUES 
 (1,'asdfrs dfgdf','WIND','2017-07-18 13:07:58');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`user`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`user`;
CREATE TABLE  `angelmusicacademy`.`user` (
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
-- Dumping data for table `angelmusicacademy`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
