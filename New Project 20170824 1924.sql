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
  `registeredDate` date DEFAULT NULL,
  `adminOfBranch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_se143i5jkhgothoaklyt0eeef` (`adminOfBranch_branchId`),
  CONSTRAINT `FK_se143i5jkhgothoaklyt0eeef` FOREIGN KEY (`adminOfBranch_branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`admin` (`adminId`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`otp`,`receptionPassword`,`registeredDate`,`adminOfBranch_branchId`) VALUES 
 (1,'dineshsatelkar28@gmail.com','8956276855','Dinesh','admin',0,'123','2017-08-14',NULL),
 (2,'dinesh','vgvghv','vghvghv','625700',0,'12132','2017-08-14',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`admission`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`admission`;
CREATE TABLE  `angelmusicacademy`.`admission` (
  `AdmissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `AdmissionDate` date DEFAULT NULL,
  `Age` int(11) NOT NULL,
  `BatchTimings` varchar(255) DEFAULT NULL,
  `ContactNo` varchar(255) DEFAULT NULL,
  `CourseFee1` int(11) NOT NULL,
  `CourseFee2` int(11) NOT NULL,
  `CourseFee3` int(11) NOT NULL,
  `CourseFee4` int(11) NOT NULL,
  `CourseFee5` int(11) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `CourseName1` varchar(255) DEFAULT NULL,
  `CourseName2` varchar(255) DEFAULT NULL,
  `CourseName3` varchar(255) DEFAULT NULL,
  `CourseName4` varchar(255) DEFAULT NULL,
  `CourseName5` varchar(255) DEFAULT NULL,
  `DateofBirth` date DEFAULT NULL,
  `DaysInWeek` varchar(255) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `Duration` int(11) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `InstrumentName` varchar(255) DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `MotherTongue` varchar(255) DEFAULT NULL,
  `MothersName` varchar(255) DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `NoofCourse` int(11) NOT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `ParentsNo` varchar(255) DEFAULT NULL,
  `Paymentmodecount` int(11) NOT NULL,
  `Qualification` varchar(255) DEFAULT NULL,
  `Religion` varchar(255) DEFAULT NULL,
  `admissionFee` int(11) NOT NULL,
  `admissionNo` varchar(255) DEFAULT NULL,
  `amountinword` varchar(255) DEFAULT NULL,
  `nextPaymentDate` date DEFAULT NULL,
  `remaininFee` int(11) NOT NULL,
  `shiftToOldStudent` int(11) NOT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AdmissionId`),
  KEY `FK_h6dvctmfb6u6asonuc30hubbs` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_h6dvctmfb6u6asonuc30hubbs` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`admission`
--

/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseFee1`,`CourseFee2`,`CourseFee3`,`CourseFee4`,`CourseFee5`,`CourseName`,`CourseName1`,`CourseName2`,`CourseName3`,`CourseName4`,`CourseName5`,`DateofBirth`,`DaysInWeek`,`DueDate`,`Duration`,`Email`,`FirstName`,`Gender`,`Image`,`InstrumentName`,`JoiningDate`,`LastName`,`MiddleName`,`MotherTongue`,`MothersName`,`Nationality`,`NoofCourse`,`Occupation`,`ParentsNo`,`Paymentmodecount`,`Qualification`,`Religion`,`admissionFee`,`admissionNo`,`amountinword`,`nextPaymentDate`,`remaininFee`,`shiftToOldStudent`,`adminOfBranch_adminId`) VALUES 
 (1,'sdtg','2017-08-14',0,'1','8956276855',500,0,0,0,0,'Flute ','Flute','Not Selected','Not Selected','Not Selected','Not Selected','2017-08-14','Wednesday Friday ','2017-09-16',1,'dineshsatelkar28@gmail.com','Dinesh','Male','E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\Untitled.png','RTE','2017-08-16','Satelkar','Baban','Hindi','Jayashree','Indian',1,'Singer','7709858584',1,'BE','Christianity',100,'KH/CL-1',NULL,'2017-06-09',0,0,2),
 (2,'rfdsag','2017-08-16',0,'1','46',500,0,0,0,0,'Flute ','Flute','Not Selected','Not Selected','Not Selected','Not Selected','2017-06-16','Wednesday Friday ','2017-09-16',1,'46@d.g','dfgs','Male','E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\001.jpg','RTE','2017-08-16','dfg','gdsfgs','Marathi','Geeta','sd',1,'Singer','45656',1,'BE','Christianity',100,'KH/CL-2',NULL,NULL,200,0,2);
INSERT INTO `angelmusicacademy`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseFee1`,`CourseFee2`,`CourseFee3`,`CourseFee4`,`CourseFee5`,`CourseName`,`CourseName1`,`CourseName2`,`CourseName3`,`CourseName4`,`CourseName5`,`DateofBirth`,`DaysInWeek`,`DueDate`,`Duration`,`Email`,`FirstName`,`Gender`,`Image`,`InstrumentName`,`JoiningDate`,`LastName`,`MiddleName`,`MotherTongue`,`MothersName`,`Nationality`,`NoofCourse`,`Occupation`,`ParentsNo`,`Paymentmodecount`,`Qualification`,`Religion`,`admissionFee`,`admissionNo`,`amountinword`,`nextPaymentDate`,`remaininFee`,`shiftToOldStudent`,`adminOfBranch_adminId`) VALUES 
 (3,'fgtyu','2017-08-21',0,'1','8956276855',500,0,0,0,0,'Flute ','Flute','Not Selected','Not Selected','Not Selected','Not Selected','2017-06-16','Monday Tuesday Wednesday Thursday ','2017-10-25',1,'dineshsatelkar28@gmail.com','Dinesh','Male','E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\administrator.png','RTE','2017-08-25','Satelkar','Baban','Punjabi','Geeta','Indian',1,'Singer','9763830887',1,'BE','Christianity',500,'KH/CL-3',NULL,'2017-10-25',0,1,2);
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`admission_studentaccount`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`admission_studentaccount`;
CREATE TABLE  `angelmusicacademy`.`admission_studentaccount` (
  `Admission_AdmissionId` bigint(20) NOT NULL,
  `studentAccount_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_52rhdx0rrfuo05e44tfg7a7gf` (`studentAccount_AccountId`),
  KEY `FK_52rhdx0rrfuo05e44tfg7a7gf` (`studentAccount_AccountId`),
  KEY `FK_lo1a4008hb80jvkoq2eck24n3` (`Admission_AdmissionId`),
  CONSTRAINT `FK_52rhdx0rrfuo05e44tfg7a7gf` FOREIGN KEY (`studentAccount_AccountId`) REFERENCES `studentaccount` (`AccountId`),
  CONSTRAINT `FK_lo1a4008hb80jvkoq2eck24n3` FOREIGN KEY (`Admission_AdmissionId`) REFERENCES `admission` (`AdmissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`admission_studentaccount`
--

/*!40000 ALTER TABLE `admission_studentaccount` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`admission_studentaccount` (`Admission_AdmissionId`,`studentAccount_AccountId`) VALUES 
 (1,1),
 (2,2),
 (3,3),
 (3,4),
 (3,5);
/*!40000 ALTER TABLE `admission_studentaccount` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`batchtime`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`batchtime`;
CREATE TABLE  `angelmusicacademy`.`batchtime` (
  `batchTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `batchTiming` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`batchTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`batchtime`
--

/*!40000 ALTER TABLE `batchtime` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`batchtime` (`batchTimeId`,`batchTiming`) VALUES 
 (1,'RTYRYTRT');
/*!40000 ALTER TABLE `batchtime` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`branch`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`branch`;
CREATE TABLE  `angelmusicacademy`.`branch` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`branch` (`branchId`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`branchAddress`,`branchAddress1`,`branchAddress2`,`branchName`,`branchRegisteredDate`,`receptionPassword`) VALUES 
 (1,'dinesh','vgvghv','vghvghv','625700','dzasf','gvghv','vghvghv','KHARADI','2017-08-14','12132');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`classenquiry`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`classenquiry`;
CREATE TABLE  `angelmusicacademy`.`classenquiry` (
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
-- Dumping data for table `angelmusicacademy`.`classenquiry`
--

/*!40000 ALTER TABLE `classenquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `classenquiry` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`course`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`course`;
CREATE TABLE  `angelmusicacademy`.`course` (
  `courseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`course` (`courseId`,`courseName`) VALUES 
 (1,'Flute'),
 (2,'fdgdfgh'),
 (3,'fgdhdf'),
 (4,'fgdhgdf');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`employee`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`employee`;
CREATE TABLE  `angelmusicacademy`.`employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PermanentAddress` varchar(255) DEFAULT NULL,
  `PermanentNo` varchar(255) DEFAULT NULL,
  `alternateNo` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emplyeeNo` varchar(255) DEFAULT NULL,
  `inTime` varchar(255) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `outTime` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`employee` (`id`,`Address`,`MobileNo`,`Name`,`PermanentAddress`,`PermanentNo`,`alternateNo`,`designation`,`email`,`emplyeeNo`,`inTime`,`joiningDate`,`outTime`,`qualification`,`salary`) VALUES 
 (1,'uio','8956276855','Dinesh Satelkar','766','766','89786','oyo','dineshsatelkar28@gmail.com',NULL,'74569+','2017-06-15','7889','78+',45664);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`enquiry`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`enquiry`;
CREATE TABLE  `angelmusicacademy`.`enquiry` (
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
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7i50cbqltobg8nkj882gyj65u` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_7i50cbqltobg8nkj882gyj65u` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`enquiry`
--

/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`enquiry` (`id`,`EnquiryDate`,`EnquiryType`,`custRequirement`,`deleteEnquiry`,`email`,`followupDate`,`mobile`,`name`,`offerGivenByShop`,`remove`,`adminOfBranch_adminId`) VALUES 
 (1,'2017-08-17','Rent','sagagadg aesdgfda dffsgsdg ',0,'dinesh@gmail.com','2017-08-17','8956276855','Dinesh Satelkar','dfsgdsfgdsf dfsgsdfg',0,2),
 (2,'2017-08-18','Repair','sgdgdshsb dgfhb cxdtrfgrhb cdfxsrthbsn fydrxhnb fcxd',1,'dineshsatelkar28@gmail.com','2017-08-30','8956276855','Dinesh  Baban Satelkar','yhnbxdfjnfrtjyn ftgyjktmn gthuyj',0,2),
 (3,'2017-08-21','MusicClass','guitae class',1,'dineshsatelkar28@gmail.com','2017-08-23','1234567895','tfdrsyh','500 per month',0,2),
 (4,'2017-08-21','Sell','fdszhg',0,'dineshsatelkar28@gmail.com','2017-08-21','1234567895','Dinesh Satelkar','hdfgh',1,2),
 (5,'2017-08-21','Repair','sdzfth',1,'dinesh@gmail.com','2017-06-15','8956276855','StudentImages','fdsgjfj',0,2),
 (6,'2017-08-21','Rent','gxhfhd',1,'dinesh@gmail.com','2017-06-09','1234567895','Dinesh Satelkar','fghddfgxhdfgh',0,2);
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`enquiry_enquirydetail`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`enquiry_enquirydetail`;
CREATE TABLE  `angelmusicacademy`.`enquiry_enquirydetail` (
  `Enquiry_id` int(11) NOT NULL,
  `enquiryDetail_id` int(11) NOT NULL,
  UNIQUE KEY `UK_a667nkoe84p2e33sdvq5nc5x5` (`enquiryDetail_id`),
  KEY `FK_a667nkoe84p2e33sdvq5nc5x5` (`enquiryDetail_id`),
  KEY `FK_dg1bhsqcfgwtv1tv91hbv6lc9` (`Enquiry_id`),
  CONSTRAINT `FK_a667nkoe84p2e33sdvq5nc5x5` FOREIGN KEY (`enquiryDetail_id`) REFERENCES `enquirydetail` (`id`),
  CONSTRAINT `FK_dg1bhsqcfgwtv1tv91hbv6lc9` FOREIGN KEY (`Enquiry_id`) REFERENCES `enquiry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`enquiry_enquirydetail`
--

/*!40000 ALTER TABLE `enquiry_enquirydetail` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`enquiry_enquirydetail` (`Enquiry_id`,`enquiryDetail_id`) VALUES 
 (4,1);
/*!40000 ALTER TABLE `enquiry_enquirydetail` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`enquirydetail`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`enquirydetail`;
CREATE TABLE  `angelmusicacademy`.`enquirydetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LastFollowupDate` date DEFAULT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `followupDate` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`enquirydetail`
--

/*!40000 ALTER TABLE `enquirydetail` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`enquirydetail` (`id`,`LastFollowupDate`,`counsellorName`,`followupDate`,`remark`) VALUES 
 (1,NULL,'Dinesh','2017-08-21','Call me tommorow');
/*!40000 ALTER TABLE `enquirydetail` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`instrument`
--

/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`instrument` (`instrumentId`,`instrumentAddedDate`,`instrumentDescription`,`instrumentImgName`,`instrumentName`) VALUES 
 (1,'2017-08-14 15:41:32','yey',NULL,'RTE'),
 (2,'2017-08-14 15:41:32','sgdsh',NULL,'dsfghh');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`instrumentsubcategory`
--

/*!40000 ALTER TABLE `instrumentsubcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumentsubcategory` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`payment`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`payment`;
CREATE TABLE  `angelmusicacademy`.`payment` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `paymentAgains` varchar(255) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentMode` varchar(255) DEFAULT NULL,
  `paymentTime` datetime DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT NULL,
  `transctionNo` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ntw8jkw4u7vjwv8qb746919b5` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_ntw8jkw4u7vjwv8qb746919b5` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`payment` (`Id`,`amount`,`bankName`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`transctionNo`,`adminOfBranch_adminId`) VALUES 
 (1,5000,'Bank of aroda','RentKH/RE-633892','2017-08-19','Cash','2017-08-19 22:08:10','Credit','12345685',2),
 (2,5000,'Bank of aroda','RentKH/RE-209837','2017-08-21','Card','2017-08-21 15:24:39','Credit','....',2),
 (3,100,'fdsghy','rasdyter','2017-08-21','Credit','2017-08-21 18:13:06','Cash','gfdh',2),
 (4,100,'...','riksha','2017-08-21','Debit','2017-08-21 21:15:59','Cash','..',2),
 (5,100,'Bank of aroda','Repair No- KH/RP-986122','2017-08-22','Cash','2017-08-22 16:47:03','Credit','12345685',1),
 (6,2000,'','Rent No- KH/RE-209837','2017-08-22','0','2017-08-22 17:20:59','Debit','',1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


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
-- Dumping data for table `angelmusicacademy`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
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
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CloseRequest` int(11) NOT NULL,
  `IdProofType` varchar(255) DEFAULT NULL,
  `Noofinstrument` int(11) NOT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerFirstName` varchar(255) DEFAULT NULL,
  `customerIdProof` varchar(255) DEFAULT NULL,
  `customerMobileNo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `instrumentFee1` int(11) NOT NULL,
  `instrumentFee2` int(11) NOT NULL,
  `instrumentFee3` int(11) NOT NULL,
  `instrumentFee4` int(11) NOT NULL,
  `instrumentFee5` int(11) NOT NULL,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentName1` varchar(255) DEFAULT NULL,
  `instrumentName2` varchar(255) DEFAULT NULL,
  `instrumentName3` varchar(255) DEFAULT NULL,
  `instrumentName4` varchar(255) DEFAULT NULL,
  `instrumentName5` varchar(255) DEFAULT NULL,
  `noOfDays` int(11) NOT NULL,
  `paidAmount` int(11) NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `remaininFee` int(11) NOT NULL,
  `rentNo` varchar(255) DEFAULT NULL,
  `securityDeposite` int(11) NOT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_c1cy08tdbdqd6tkry8dtyjuad` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_c1cy08tdbdqd6tkry8dtyjuad` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`rent`
--

/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`rent` (`Id`,`CloseRequest`,`IdProofType`,`Noofinstrument`,`counsellorName`,`customerAddress`,`customerFirstName`,`customerIdProof`,`customerMobileNo`,`email`,`fromDate`,`instrumentFee1`,`instrumentFee2`,`instrumentFee3`,`instrumentFee4`,`instrumentFee5`,`instrumentName`,`instrumentName1`,`instrumentName2`,`instrumentName3`,`instrumentName4`,`instrumentName5`,`noOfDays`,`paidAmount`,`receivedDate`,`remaininFee`,`rentNo`,`securityDeposite`,`adminOfBranch_adminId`) VALUES 
 (1,0,'Adhar Card',2,NULL,'Kharadi','Dinesh','123','8956276855','dineshsatelkar28@gmail.com','2017-08-19',100,500,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected',10,5000,'2017-08-19',0,'KH/RE-137279',5000,2),
 (2,1,'Pan Card',2,NULL,'Kharadi','Dinesh','123','8956276855','dineshsatelkar28@gmail.com','2017-08-19',200,100,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected',10,10000,'2017-08-19',0,'KH/RE-710257',10000,2),
 (3,1,'Pan Card',2,NULL,'Kharadi','Dinesh','123','8956276855','dineshsatelkar28@gmail.com','2017-08-19',100,200,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected',10,10000,'2017-08-19',0,'KH/RE-841273',10000,2),
 (4,1,'Pan Card',2,NULL,'Kharadi','Dinesh Satelkar','123','8956276855','dinesh@gmail.com','2017-08-19',500,100,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected',5,1000,'2017-08-24',3000,'KH/RE-741069',1000,2);
INSERT INTO `angelmusicacademy`.`rent` (`Id`,`CloseRequest`,`IdProofType`,`Noofinstrument`,`counsellorName`,`customerAddress`,`customerFirstName`,`customerIdProof`,`customerMobileNo`,`email`,`fromDate`,`instrumentFee1`,`instrumentFee2`,`instrumentFee3`,`instrumentFee4`,`instrumentFee5`,`instrumentName`,`instrumentName1`,`instrumentName2`,`instrumentName3`,`instrumentName4`,`instrumentName5`,`noOfDays`,`paidAmount`,`receivedDate`,`remaininFee`,`rentNo`,`securityDeposite`,`adminOfBranch_adminId`) VALUES 
 (5,1,'Pan Card',1,NULL,'Kharadi','Dinesh','123','8956276855','dineshsatelkar28@gmail.com','2017-08-19',1000,0,0,0,0,'{RTE}','RTE','Not Selected','Not Selected','Not Selected','Not Selected',10,5000,'2017-08-31',10000,'KH/RE-633892',5000,2),
 (6,0,'Adhar Card',2,NULL,'Kharadi','Dinesh Satelkar','123','1234567895','dinesh@gmail.com','2017-08-21',100,200,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected',10,5000,'2017-08-22',0,'KH/RE-209837',5000,2);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`rent_rentdetails`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`rent_rentdetails`;
CREATE TABLE  `angelmusicacademy`.`rent_rentdetails` (
  `rent_Id` bigint(20) NOT NULL,
  `rentDetails_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mpclkrp2v40wpfsntn5cuy2q3` (`rentDetails_AccountId`),
  KEY `FK_mpclkrp2v40wpfsntn5cuy2q3` (`rentDetails_AccountId`),
  KEY `FK_hd1b436xabc594epr5vh2h07a` (`rent_Id`),
  CONSTRAINT `FK_hd1b436xabc594epr5vh2h07a` FOREIGN KEY (`rent_Id`) REFERENCES `rent` (`Id`),
  CONSTRAINT `FK_mpclkrp2v40wpfsntn5cuy2q3` FOREIGN KEY (`rentDetails_AccountId`) REFERENCES `rentdetails` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`rent_rentdetails`
--

/*!40000 ALTER TABLE `rent_rentdetails` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`rent_rentdetails` (`rent_Id`,`rentDetails_AccountId`) VALUES 
 (1,1),
 (1,2),
 (2,3),
 (2,4),
 (3,5),
 (3,6),
 (4,7),
 (5,8),
 (6,9),
 (6,10),
 (6,11);
/*!40000 ALTER TABLE `rent_rentdetails` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`rentdetails`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`rentdetails`;
CREATE TABLE  `angelmusicacademy`.`rentdetails` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `disamount` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `finalamount` int(11) NOT NULL,
  `instrumenttotalfee` int(11) NOT NULL,
  `noofdays` int(11) NOT NULL,
  `noofinstument` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `previousBalance` int(11) NOT NULL,
  `totaladvancedfee` int(11) NOT NULL,
  `totalremfee` int(11) NOT NULL,
  `returnAmount` int(11) NOT NULL,
  `others` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`rentdetails`
--

/*!40000 ALTER TABLE `rentdetails` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`rentdetails` (`AccountId`,`PaymentMode`,`amountinWord`,`bankname`,`chequeno`,`disamount`,`discper`,`finalamount`,`instrumenttotalfee`,`noofdays`,`noofinstument`,`paymentDate`,`previousBalance`,`totaladvancedfee`,`totalremfee`,`returnAmount`,`others`) VALUES 
 (1,'Net Banking',NULL,'Bank of aroda','12345685',0,0,11000,6000,0,2,'2017-08-19',0,5000,6000,0,0),
 (2,'Cash',NULL,'Bank of aroda','12345685',0,0,12100,12000,0,2,'2017-08-19',0,7100,0,0,100),
 (3,'Cash',NULL,'Bank of aroda','12345685',0,0,13000,3000,10,2,'2017-08-19',0,10000,3000,0,0),
 (4,'Card',NULL,'Bank of aroda','12345685',0,0,10500,10500,35,2,'2017-08-19',0,500,0,0,0),
 (5,'Cash',NULL,'Bank of aroda','12345685',0,0,13000,3000,10,2,'2017-08-19',0,10000,3000,0,0),
 (6,'Cash',NULL,'Bank of aroda','12345685',0,0,3000,3000,10,2,'2017-08-19',0,0,0,7000,0),
 (7,'Paytm',NULL,'Bank of aroda','12345685',0,0,4000,3000,5,2,'2017-08-19',0,1000,3000,0,0),
 (8,'Cash',NULL,'Bank of aroda','12345685',0,0,15000,10000,10,1,'2017-08-19',0,5000,10000,0,0),
 (9,'Card',NULL,'Bank of aroda','....',300,10,7700,3000,10,2,'2017-08-21',0,5000,2700,0,0);
INSERT INTO `angelmusicacademy`.`rentdetails` (`AccountId`,`PaymentMode`,`amountinWord`,`bankname`,`chequeno`,`disamount`,`discper`,`finalamount`,`instrumenttotalfee`,`noofdays`,`noofinstument`,`paymentDate`,`previousBalance`,`totaladvancedfee`,`totalremfee`,`returnAmount`,`others`) VALUES 
 (10,'Cash',NULL,'Bank of aroda','12345685',0,0,4500,4500,15,2,'2017-08-21',0,0,0,500,0),
 (11,'0',NULL,'','',0,0,3000,3000,10,2,'2017-08-22',0,0,0,2000,0);
/*!40000 ALTER TABLE `rentdetails` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`repair`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`repair`;
CREATE TABLE  `angelmusicacademy`.`repair` (
  `repairId` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdProofType` varchar(255) DEFAULT NULL,
  `Noofinstrument` int(11) NOT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerFirstName` varchar(255) DEFAULT NULL,
  `customerIdProof` varchar(255) DEFAULT NULL,
  `customerMobileNo` varchar(255) DEFAULT NULL,
  `instrumentFee1` int(11) NOT NULL,
  `instrumentFee2` int(11) NOT NULL,
  `instrumentFee3` int(11) NOT NULL,
  `instrumentFee4` int(11) NOT NULL,
  `instrumentFee5` int(11) NOT NULL,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentName1` varchar(255) DEFAULT NULL,
  `instrumentName2` varchar(255) DEFAULT NULL,
  `instrumentName3` varchar(255) DEFAULT NULL,
  `instrumentName4` varchar(255) DEFAULT NULL,
  `instrumentName5` varchar(255) DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `receivedDate` datetime DEFAULT NULL,
  `remaininFee` int(11) NOT NULL,
  `repairNo` varchar(255) DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `CloseRequest` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`repairId`),
  KEY `FK_2owsdbbq3rpfd2vy25c6rr60k` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_2owsdbbq3rpfd2vy25c6rr60k` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`repair`
--

/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`repair` (`repairId`,`IdProofType`,`Noofinstrument`,`counsellorName`,`customerAddress`,`customerFirstName`,`customerIdProof`,`customerMobileNo`,`instrumentFee1`,`instrumentFee2`,`instrumentFee3`,`instrumentFee4`,`instrumentFee5`,`instrumentName`,`instrumentName1`,`instrumentName2`,`instrumentName3`,`instrumentName4`,`instrumentName5`,`problem`,`receivedDate`,`remaininFee`,`repairNo`,`returnDate`,`adminOfBranch_adminId`,`CloseRequest`,`email`) VALUES 
 (1,'Pan Card',2,NULL,'Kharadi','Dinesh','123','8956276855',1000,500,0,0,0,NULL,'RTE','dsfghh','Not Selected','Not Selected','Not Selected','stghgj','2017-08-18 19:08:33',1400,'KH/RP-855050','2017-08-18',2,1,NULL),
 (2,'Pan Card',2,NULL,'Kharadi','Dinesh  Baban Satelkar','123','8956276855',50,850,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected','sdgdfsh fgdj gdhj gfj fghj fgjfgj','2017-08-18 19:13:39',700,'KH/RP-484379','2017-06-15',2,1,NULL),
 (3,'Adhar Card',2,NULL,'Kharadi','Dinesh','123','8956276855',500,100,0,0,0,'{RTE, dsfghh}','RTE','dsfghh','Not Selected','Not Selected','Not Selected','sdafsagsagsg dsfggfd','2017-08-18 20:39:54',250,'KH/RP-345081','2017-06-16',2,1,'sunil@gmail.com'),
 (4,'Pan Card',1,NULL,'Kharadi','StudentImages','123','8956276855',500,0,0,0,0,'{RTE}','RTE','Not Selected','Not Selected','Not Selected','Not Selected','sdgdfsh fgdj gdhj gfj fghj fgjfgj','2017-08-21 15:29:07',200,'KH/RP-986122','2017-08-24',2,1,'dinesh@gmail.com');
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`repair_repairdetails`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`repair_repairdetails`;
CREATE TABLE  `angelmusicacademy`.`repair_repairdetails` (
  `repair_repairId` bigint(20) NOT NULL,
  `repairDetails_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_hwn0xkxnfhap13ak5w9eeyqda` (`repairDetails_AccountId`),
  KEY `FK_hwn0xkxnfhap13ak5w9eeyqda` (`repairDetails_AccountId`),
  KEY `FK_mmgdopngehkhnqffp48nug39e` (`repair_repairId`),
  CONSTRAINT `FK_hwn0xkxnfhap13ak5w9eeyqda` FOREIGN KEY (`repairDetails_AccountId`) REFERENCES `repairdetails` (`AccountId`),
  CONSTRAINT `FK_mmgdopngehkhnqffp48nug39e` FOREIGN KEY (`repair_repairId`) REFERENCES `repair` (`repairId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`repair_repairdetails`
--

/*!40000 ALTER TABLE `repair_repairdetails` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`repair_repairdetails` (`repair_repairId`,`repairDetails_AccountId`) VALUES 
 (1,1),
 (2,2),
 (2,6),
 (3,3),
 (3,4),
 (4,5),
 (4,7);
/*!40000 ALTER TABLE `repair_repairdetails` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`repairdetails`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`repairdetails`;
CREATE TABLE  `angelmusicacademy`.`repairdetails` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `disamount` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `instrumenttotalfee` int(11) NOT NULL,
  `noofinstument` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `previousBalance` int(11) NOT NULL,
  `totaladvancedfee` int(11) NOT NULL,
  `totalremfee` int(11) NOT NULL,
  `finalamount` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`repairdetails`
--

/*!40000 ALTER TABLE `repairdetails` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`repairdetails` (`AccountId`,`PaymentMode`,`amountinWord`,`bankname`,`chequeno`,`disamount`,`discper`,`instrumenttotalfee`,`noofinstument`,`paymentDate`,`previousBalance`,`totaladvancedfee`,`totalremfee`,`finalamount`) VALUES 
 (1,'Cash',NULL,'Bank of aroda','12345685',1500,0,1500,2,'2017-08-18',0,100,1400,0),
 (2,'Card',NULL,'Bank of aroda','12345685',900,0,900,2,'2017-08-18',0,100,800,0),
 (3,'Cash',NULL,'Bank of aroda','12345685',0,0,600,2,'2017-08-18',0,100,500,600),
 (4,'Cash',NULL,'....','12345685',50,0,600,2,'2017-08-18',500,200,250,450),
 (5,'Paytm',NULL,'Bank of aroda','12345685',0,0,500,1,'2017-08-21',0,200,300,500),
 (6,'Cash',NULL,'Bank of aroda','12345685',0,0,900,2,'2017-08-21',800,100,700,800),
 (7,'Cash',NULL,'Bank of aroda','12345685',0,0,500,1,'2017-08-22',300,100,200,300);
/*!40000 ALTER TABLE `repairdetails` ENABLE KEYS */;


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
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellId`),
  KEY `FK_7reih86bnfdv1e3rw0ln8pg2e` (`adminOfBranch_adminId`),
  KEY `FK_n0r749an7fp6vkkl2s75l41r2` (`productId`),
  CONSTRAINT `FK_7reih86bnfdv1e3rw0ln8pg2e` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_n0r749an7fp6vkkl2s75l41r2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`sell`
--

/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;


--
-- Definition of table `angelmusicacademy`.`studentaccount`
--

DROP TABLE IF EXISTS `angelmusicacademy`.`studentaccount`;
CREATE TABLE  `angelmusicacademy`.`studentaccount` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `CourseDuration` int(11) NOT NULL,
  `DueDate` date DEFAULT NULL,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `admissonnfee` int(11) NOT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `course` int(11) NOT NULL,
  `coursetotalfee` int(11) NOT NULL,
  `disamount` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `finalamount` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `previousBalance` int(11) NOT NULL,
  `totaladvancedfee` int(11) NOT NULL,
  `totalfee` int(11) NOT NULL,
  `totalremfee` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angelmusicacademy`.`studentaccount`
--

/*!40000 ALTER TABLE `studentaccount` DISABLE KEYS */;
INSERT INTO `angelmusicacademy`.`studentaccount` (`AccountId`,`CourseDuration`,`DueDate`,`PaymentMode`,`admissonnfee`,`amountinWord`,`bankname`,`chequeno`,`course`,`coursetotalfee`,`disamount`,`discper`,`finalamount`,`paymentDate`,`previousBalance`,`totaladvancedfee`,`totalfee`,`totalremfee`) VALUES 
 (1,1,'2017-06-09','Cash',100,'','','',1,500,0,0,600,'2017-08-14',0,600,600,0),
 (2,1,NULL,'Card',100,'','Bank of aroda','12345685',2,1100,0,0,1200,'2017-08-16',0,1000,1200,200),
 (3,1,'2017-09-25','Net Banking',500,'','Bank of aroda','12345685',2,300,80,10,720,'2017-08-21',0,500,800,220),
 (4,1,'2017-09-25','Cash',0,NULL,'Bank of aroda','12345685',1,0,0,0,220,'2017-08-21',220,220,220,0),
 (5,1,'2017-10-25','Card',0,NULL,'Bank of aroda','12345685',1,500,0,0,500,'2017-08-21',0,500,500,0);
/*!40000 ALTER TABLE `studentaccount` ENABLE KEYS */;


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
