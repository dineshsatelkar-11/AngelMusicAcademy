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
-- Create schema angel
--

CREATE DATABASE IF NOT EXISTS angel;
USE angel;

--
-- Definition of table `angel`.`addpdfgallery`
--

DROP TABLE IF EXISTS `angel`.`addpdfgallery`;
CREATE TABLE  `angel`.`addpdfgallery` (
  `lessonid` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `pdfname` varchar(255) DEFAULT NULL,
  `pdfpath` varchar(255) DEFAULT NULL,
  `videodescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`addpdfgallery`
--

/*!40000 ALTER TABLE `addpdfgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `addpdfgallery` ENABLE KEYS */;


--
-- Definition of table `angel`.`admin`
--

DROP TABLE IF EXISTS `angel`.`admin`;
CREATE TABLE  `angel`.`admin` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `angel`.`admin` (`adminId`,`Status`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`imagename`,`imagepath`,`otp`,`receptionPassword`,`registeredDate`,`adminOfBranch_branchId`) VALUES 
 (1,1,'admin','8956276855','Dinesh','admin','admin.jpg',NULL,123,'123','2017-10-27',NULL),
 (2,1,'dineshsatelkar28@gmail.com','9096188458','Dinesh','522143','admin.jpg',NULL,123,'99866','2017-10-27',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `angel`.`admission`
--

DROP TABLE IF EXISTS `angel`.`admission`;
CREATE TABLE  `angel`.`admission` (
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
  `imagepath` varchar(255) DEFAULT NULL,
  `nextPaymentDate` date DEFAULT NULL,
  `remaininFee` int(11) NOT NULL,
  `shiftToOldStudent` int(11) NOT NULL,
  `studentPassword` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AdmissionId`),
  KEY `FK_h6dvctmfb6u6asonuc30hubbs` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_h6dvctmfb6u6asonuc30hubbs` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`admission`
--

/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `angel`.`admission` (`AdmissionId`,`Address`,`AdmissionDate`,`Age`,`BatchTimings`,`ContactNo`,`CourseFee1`,`CourseFee2`,`CourseFee3`,`CourseFee4`,`CourseFee5`,`CourseName`,`CourseName1`,`CourseName2`,`CourseName3`,`CourseName4`,`CourseName5`,`DateofBirth`,`DaysInWeek`,`DueDate`,`Duration`,`Email`,`FirstName`,`Gender`,`Image`,`InstrumentName`,`JoiningDate`,`LastName`,`MiddleName`,`MotherTongue`,`MothersName`,`Nationality`,`NoofCourse`,`Occupation`,`ParentsNo`,`Paymentmodecount`,`Qualification`,`Religion`,`admissionFee`,`admissionNo`,`amountinword`,`imagepath`,`nextPaymentDate`,`remaininFee`,`shiftToOldStudent`,`studentPassword`,`adminOfBranch_adminId`) VALUES 
 (1,'ghjfg','2016-05-18',1,'7 TO 8 ','51511651',100,0,0,0,0,'Guitar ','Guitar','Not Selected','Not Selected','Not Selected','Not Selected','2016-05-18','Monday Tuesday ','2017-12-02',1,'hgdf@fghfg.ghdf','sdrfdg','Male','Chrysanthemum.jpg',NULL,'2016-05-17','dgh','dfgdh','Punjabi','dghdg','fdgdfg',1,'Singer','651651',3,'dfgh','Islam',5000,'CL976371',NULL,'D:\\Garima\\AngelMusicAcademy\\build\\web\\StudentImages\\Chrysanthemum.jpg','2017-12-02',100,1,'294134',2);
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;


--
-- Definition of table `angel`.`admission_studentaccount`
--

DROP TABLE IF EXISTS `angel`.`admission_studentaccount`;
CREATE TABLE  `angel`.`admission_studentaccount` (
  `Admission_AdmissionId` bigint(20) NOT NULL,
  `studentAccount_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_52rhdx0rrfuo05e44tfg7a7gf` (`studentAccount_AccountId`),
  KEY `FK_52rhdx0rrfuo05e44tfg7a7gf` (`studentAccount_AccountId`),
  KEY `FK_lo1a4008hb80jvkoq2eck24n3` (`Admission_AdmissionId`),
  CONSTRAINT `FK_52rhdx0rrfuo05e44tfg7a7gf` FOREIGN KEY (`studentAccount_AccountId`) REFERENCES `studentaccount` (`AccountId`),
  CONSTRAINT `FK_lo1a4008hb80jvkoq2eck24n3` FOREIGN KEY (`Admission_AdmissionId`) REFERENCES `admission` (`AdmissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`admission_studentaccount`
--

/*!40000 ALTER TABLE `admission_studentaccount` DISABLE KEYS */;
INSERT INTO `angel`.`admission_studentaccount` (`Admission_AdmissionId`,`studentAccount_AccountId`) VALUES 
 (1,1),
 (1,2);
/*!40000 ALTER TABLE `admission_studentaccount` ENABLE KEYS */;


--
-- Definition of table `angel`.`bankdetails`
--

DROP TABLE IF EXISTS `angel`.`bankdetails`;
CREATE TABLE  `angel`.`bankdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aadharNo` bigint(20) NOT NULL,
  `bankAccountNo` bigint(20) NOT NULL,
  `bankAddress` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `branchName` varchar(255) DEFAULT NULL,
  `ifscCode` varchar(255) DEFAULT NULL,
  `panNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`bankdetails`
--

/*!40000 ALTER TABLE `bankdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`barcode`
--

DROP TABLE IF EXISTS `angel`.`barcode`;
CREATE TABLE  `angel`.`barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(255) DEFAULT NULL,
  `BarcodePath` varchar(255) DEFAULT NULL,
  `imagename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`barcode`
--

/*!40000 ALTER TABLE `barcode` DISABLE KEYS */;
INSERT INTO `angel`.`barcode` (`id`,`Barcode`,`BarcodePath`,`imagename`) VALUES 
 (1,'982827518','E:\\teju\\blessings- aquarium\\build\\web\\Barcode\\Guitar.png','Guitar.png'),
 (2,'937574904','E:\\teju\\blessings- aquarium\\build\\web\\Barcode\\Guitar.png','Guitar.png'),
 (3,'825586387','E:\\teju\\blessings- aquarium\\build\\web\\Barcode\\dfsgg.png','dfsgg.png');
/*!40000 ALTER TABLE `barcode` ENABLE KEYS */;


--
-- Definition of table `angel`.`batchtime`
--

DROP TABLE IF EXISTS `angel`.`batchtime`;
CREATE TABLE  `angel`.`batchtime` (
  `batchTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `batchTiming` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`batchTimeId`),
  KEY `FK_tn1c447cwurqgm5nf062msgpr` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_tn1c447cwurqgm5nf062msgpr` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`batchtime`
--

/*!40000 ALTER TABLE `batchtime` DISABLE KEYS */;
INSERT INTO `angel`.`batchtime` (`batchTimeId`,`batchTiming`,`adminOfBranch_adminId`) VALUES 
 (1,'7 TO 8',2);
/*!40000 ALTER TABLE `batchtime` ENABLE KEYS */;


--
-- Definition of table `angel`.`branch`
--

DROP TABLE IF EXISTS `angel`.`branch`;
CREATE TABLE  `angel`.`branch` (
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
-- Dumping data for table `angel`.`branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `angel`.`branch` (`branchId`,`adminEmail`,`adminMobileNo`,`adminName`,`adminPassword`,`branchAddress`,`branchAddress1`,`branchAddress2`,`branchName`,`branchRegisteredDate`,`receptionPassword`) VALUES 
 (1,'dineshsatelkar28@gmail.com','8956276855','Dinesh','522143','Kharadi','Kharadi','Kharadi','KHARADI','2017-10-27','99866');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `angel`.`branchproduct`
--

DROP TABLE IF EXISTS `angel`.`branchproduct`;
CREATE TABLE  `angel`.`branchproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `productBarcode` varchar(255) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `productquantity` bigint(20) NOT NULL,
  `admin_adminId` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_am4e67nje14tav0xq8vbb0yhv` (`admin_adminId`),
  KEY `FK_tbrk3l6dmi95krhrismib6m49` (`product_id`),
  CONSTRAINT `FK_am4e67nje14tav0xq8vbb0yhv` FOREIGN KEY (`admin_adminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_tbrk3l6dmi95krhrismib6m49` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`branchproduct`
--

/*!40000 ALTER TABLE `branchproduct` DISABLE KEYS */;
INSERT INTO `angel`.`branchproduct` (`id`,`adminid`,`productBarcode`,`productid`,`productquantity`,`admin_adminId`,`product_id`) VALUES 
 (1,2,'937574904',1,105,2,1),
 (2,2,'825586387',2,231,2,2);
/*!40000 ALTER TABLE `branchproduct` ENABLE KEYS */;


--
-- Definition of table `angel`.`branchsale`
--

DROP TABLE IF EXISTS `angel`.`branchsale`;
CREATE TABLE  `angel`.`branchsale` (
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
-- Dumping data for table `angel`.`branchsale`
--

/*!40000 ALTER TABLE `branchsale` DISABLE KEYS */;
INSERT INTO `angel`.`branchsale` (`id`,`adminid`,`date`,`totalquantity`,`admin_adminId`) VALUES 
 (1,2,'2017-11-02',3,2),
 (2,2,'2017-11-02',50,2),
 (3,2,'2017-11-02',33,2),
 (4,2,'2017-11-02',300,2);
/*!40000 ALTER TABLE `branchsale` ENABLE KEYS */;


--
-- Definition of table `angel`.`branchsale_branchsaledetails`
--

DROP TABLE IF EXISTS `angel`.`branchsale_branchsaledetails`;
CREATE TABLE  `angel`.`branchsale_branchsaledetails` (
  `BranchSale_id` int(11) NOT NULL,
  `branchsaledetails_id` int(11) NOT NULL,
  UNIQUE KEY `UK_t17fokmuh8gsb7f4o6sbay3cr` (`branchsaledetails_id`),
  KEY `FK_t17fokmuh8gsb7f4o6sbay3cr` (`branchsaledetails_id`),
  KEY `FK_n2bsd7ris2d725nm5b0p1lwyn` (`BranchSale_id`),
  CONSTRAINT `FK_n2bsd7ris2d725nm5b0p1lwyn` FOREIGN KEY (`BranchSale_id`) REFERENCES `branchsale` (`id`),
  CONSTRAINT `FK_t17fokmuh8gsb7f4o6sbay3cr` FOREIGN KEY (`branchsaledetails_id`) REFERENCES `branchsaledetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`branchsale_branchsaledetails`
--

/*!40000 ALTER TABLE `branchsale_branchsaledetails` DISABLE KEYS */;
INSERT INTO `angel`.`branchsale_branchsaledetails` (`BranchSale_id`,`branchsaledetails_id`) VALUES 
 (1,5),
 (1,6),
 (2,7),
 (2,8),
 (3,9),
 (3,10),
 (4,11),
 (4,12);
/*!40000 ALTER TABLE `branchsale_branchsaledetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`branchsaledetails`
--

DROP TABLE IF EXISTS `angel`.`branchsaledetails`;
CREATE TABLE  `angel`.`branchsaledetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sgvwpr5w74sgsm2hieb9cl33r` (`product_id`),
  CONSTRAINT `FK_sgvwpr5w74sgsm2hieb9cl33r` FOREIGN KEY (`product_id`) REFERENCES `productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`branchsaledetails`
--

/*!40000 ALTER TABLE `branchsaledetails` DISABLE KEYS */;
INSERT INTO `angel`.`branchsaledetails` (`id`,`date`,`productname`,`productquantity`,`product_id`) VALUES 
 (1,'2017-11-02','Guitar',2,1),
 (2,'2017-11-02','Guitar',1,1),
 (3,'2017-11-02','Guitar',2,1),
 (4,'2017-11-02','Guitar',2,1),
 (5,'2017-11-02','Guitar',2,1),
 (6,'2017-11-02','dfsgg',1,2),
 (7,'2017-11-02','Guitar',20,1),
 (8,'2017-11-02','dfsgg',30,2),
 (9,'2017-11-02','dfsgg',30,2),
 (10,'2017-11-02','Guitar',3,1),
 (11,'2017-11-02','Guitar',100,1),
 (12,'2017-11-02','dfsgg',200,2);
/*!40000 ALTER TABLE `branchsaledetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`classenquiry`
--

DROP TABLE IF EXISTS `angel`.`classenquiry`;
CREATE TABLE  `angel`.`classenquiry` (
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
-- Dumping data for table `angel`.`classenquiry`
--

/*!40000 ALTER TABLE `classenquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `classenquiry` ENABLE KEYS */;


--
-- Definition of table `angel`.`course`
--

DROP TABLE IF EXISTS `angel`.`course`;
CREATE TABLE  `angel`.`course` (
  `courseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) DEFAULT NULL,
  `nooflesson` bigint(20) NOT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `angel`.`course` (`courseId`,`courseName`,`nooflesson`) VALUES 
 (1,'Guitar',20);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


--
-- Definition of table `angel`.`employee`
--

DROP TABLE IF EXISTS `angel`.`employee`;
CREATE TABLE  `angel`.`employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PermanentAddress` varchar(255) DEFAULT NULL,
  `PermanentNo` varchar(255) DEFAULT NULL,
  `alternateNo` varchar(255) DEFAULT NULL,
  `branchid` int(11) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emplyeeNo` varchar(255) DEFAULT NULL,
  `inTime` varchar(255) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `outTime` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `salary` int(11) NOT NULL,
  `Emp_Status` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `bankDetailId_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oqdtrimgdi6qn94qsfxf6oytq` (`bankDetailId_id`),
  CONSTRAINT `FK_oqdtrimgdi6qn94qsfxf6oytq` FOREIGN KEY (`bankDetailId_id`) REFERENCES `bankdetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `angel`.`enquiry`
--

DROP TABLE IF EXISTS `angel`.`enquiry`;
CREATE TABLE  `angel`.`enquiry` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`enquiry`
--

/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;


--
-- Definition of table `angel`.`enquiry_enquirydetail`
--

DROP TABLE IF EXISTS `angel`.`enquiry_enquirydetail`;
CREATE TABLE  `angel`.`enquiry_enquirydetail` (
  `Enquiry_id` int(11) NOT NULL,
  `enquiryDetail_id` int(11) NOT NULL,
  UNIQUE KEY `UK_a667nkoe84p2e33sdvq5nc5x5` (`enquiryDetail_id`),
  KEY `FK_a667nkoe84p2e33sdvq5nc5x5` (`enquiryDetail_id`),
  KEY `FK_dg1bhsqcfgwtv1tv91hbv6lc9` (`Enquiry_id`),
  CONSTRAINT `FK_a667nkoe84p2e33sdvq5nc5x5` FOREIGN KEY (`enquiryDetail_id`) REFERENCES `enquirydetail` (`id`),
  CONSTRAINT `FK_dg1bhsqcfgwtv1tv91hbv6lc9` FOREIGN KEY (`Enquiry_id`) REFERENCES `enquiry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`enquiry_enquirydetail`
--

/*!40000 ALTER TABLE `enquiry_enquirydetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry_enquirydetail` ENABLE KEYS */;


--
-- Definition of table `angel`.`enquirydetail`
--

DROP TABLE IF EXISTS `angel`.`enquirydetail`;
CREATE TABLE  `angel`.`enquirydetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LastFollowupDate` date DEFAULT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `followupDate` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`enquirydetail`
--

/*!40000 ALTER TABLE `enquirydetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquirydetail` ENABLE KEYS */;


--
-- Definition of table `angel`.`event`
--

DROP TABLE IF EXISTS `angel`.`event`;
CREATE TABLE  `angel`.`event` (
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
-- Dumping data for table `angel`.`event`
--

/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


--
-- Definition of table `angel`.`eventapplication`
--

DROP TABLE IF EXISTS `angel`.`eventapplication`;
CREATE TABLE  `angel`.`eventapplication` (
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
-- Dumping data for table `angel`.`eventapplication`
--

/*!40000 ALTER TABLE `eventapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventapplication` ENABLE KEYS */;


--
-- Definition of table `angel`.`exam`
--

DROP TABLE IF EXISTS `angel`.`exam`;
CREATE TABLE  `angel`.`exam` (
  `examId` bigint(20) NOT NULL AUTO_INCREMENT,
  `examDate` datetime DEFAULT NULL,
  `examName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`exam`
--

/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


--
-- Definition of table `angel`.`examapplication`
--

DROP TABLE IF EXISTS `angel`.`examapplication`;
CREATE TABLE  `angel`.`examapplication` (
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
-- Dumping data for table `angel`.`examapplication`
--

/*!40000 ALTER TABLE `examapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `examapplication` ENABLE KEYS */;


--
-- Definition of table `angel`.`instrument`
--

DROP TABLE IF EXISTS `angel`.`instrument`;
CREATE TABLE  `angel`.`instrument` (
  `instrumentId` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentAddedDate` datetime DEFAULT NULL,
  `instrumentDescription` varchar(255) DEFAULT NULL,
  `instrumentImgName` varchar(255) DEFAULT NULL,
  `instrumentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`instrument`
--

/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `angel`.`instrument` (`instrumentId`,`instrumentAddedDate`,`instrumentDescription`,`instrumentImgName`,`instrumentName`) VALUES 
 (1,'2017-11-06 13:05:45',NULL,NULL,'DFGSDFG');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;


--
-- Definition of table `angel`.`instrumentsubcategory`
--

DROP TABLE IF EXISTS `angel`.`instrumentsubcategory`;
CREATE TABLE  `angel`.`instrumentsubcategory` (
  `instrumentSubcategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `instrumentSubcategoryName` varchar(255) DEFAULT NULL,
  `INSTRUMENT` int(11) DEFAULT NULL,
  PRIMARY KEY (`instrumentSubcategoryId`),
  KEY `FK_2dgr56p6htsf65vhym15gm9dd` (`INSTRUMENT`),
  CONSTRAINT `FK_2dgr56p6htsf65vhym15gm9dd` FOREIGN KEY (`INSTRUMENT`) REFERENCES `instrument` (`instrumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`instrumentsubcategory`
--

/*!40000 ALTER TABLE `instrumentsubcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumentsubcategory` ENABLE KEYS */;


--
-- Definition of table `angel`.`lessonpdf`
--

DROP TABLE IF EXISTS `angel`.`lessonpdf`;
CREATE TABLE  `angel`.`lessonpdf` (
  `lessonid` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `pdfname` varchar(255) DEFAULT NULL,
  `pdfpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`lessonpdf`
--

/*!40000 ALTER TABLE `lessonpdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessonpdf` ENABLE KEYS */;


--
-- Definition of table `angel`.`lessonvideo`
--

DROP TABLE IF EXISTS `angel`.`lessonvideo`;
CREATE TABLE  `angel`.`lessonvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `videoname` varchar(255) DEFAULT NULL,
  `videopath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`lessonvideo`
--

/*!40000 ALTER TABLE `lessonvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessonvideo` ENABLE KEYS */;


--
-- Definition of table `angel`.`payment`
--

DROP TABLE IF EXISTS `angel`.`payment`;
CREATE TABLE  `angel`.`payment` (
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `angel`.`payment` (`Id`,`amount`,`bankName`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`transctionNo`,`adminOfBranch_adminId`) VALUES 
 (1,5300,'','Admissionno No- CL976371','2016-05-11','Cash','2016-05-11 00:00:00','Credit','',2),
 (2,200,'','Repair No- RP-1','2017-11-06','Cash','2017-11-06 13:09:38','Credit','',2),
 (3,200,'gsdfgsd','Repair No- RP-1','2017-11-06','Cash','2017-11-06 13:10:22','Credit','stfds',2),
 (4,200,'','Admission No- CL976371','2017-11-06','Cash','2017-11-06 16:16:16','Credit','',2),
 (5,25000,'','Rent No- RE-1','2017-11-06','Cash','2017-11-06 16:32:55','Credit','',2),
 (6,1000,'sdfgsdg','dfgsd','2017-11-07','Card','2017-11-07 11:01:05','Credit','dfsgdfg',2),
 (7,500,'sdfgsdgsdfg','sdfgdsf','2017-11-07','Cash','2017-11-07 11:01:18','Debit','dfsg',2),
 (8,600,'dsfgdsfg','dfsg','2017-11-07','Paytm','2017-11-07 11:01:46','Debit','1313131',2),
 (9,600,'sdfs','dsafasdg','2017-11-07','Cash','2017-11-07 11:01:57','Debit','sdg',2),
 (10,500,'dfjhg','dfsgsdf','2017-11-07','Cash','2017-11-07 11:02:11','Credit','dfbgjb',2);
INSERT INTO `angel`.`payment` (`Id`,`amount`,`bankName`,`paymentAgains`,`paymentDate`,`paymentMode`,`paymentTime`,`paymentType`,`transctionNo`,`adminOfBranch_adminId`) VALUES 
 (11,653,'BJFGB','fdsgb','2017-11-07','Card','2017-11-07 11:02:37','Credit','FGNHKNL',2);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `angel`.`photosvideos`
--

DROP TABLE IF EXISTS `angel`.`photosvideos`;
CREATE TABLE  `angel`.`photosvideos` (
  `galleryId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `insertedDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`galleryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`photosvideos`
--

/*!40000 ALTER TABLE `photosvideos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photosvideos` ENABLE KEYS */;


--
-- Definition of table `angel`.`product`
--

DROP TABLE IF EXISTS `angel`.`product`;
CREATE TABLE  `angel`.`product` (
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
-- Dumping data for table `angel`.`product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `angel`.`productmodel`
--

DROP TABLE IF EXISTS `angel`.`productmodel`;
CREATE TABLE  `angel`.`productmodel` (
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
  `barcode_id` int(11) DEFAULT NULL,
  `branch_branchId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cs43xkv3fkol0t3ex34r7gw26` (`barcode_id`),
  KEY `FK_6cvbhms1ewyhlpceawiew7vd5` (`branch_branchId`),
  CONSTRAINT `FK_6cvbhms1ewyhlpceawiew7vd5` FOREIGN KEY (`branch_branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `FK_cs43xkv3fkol0t3ex34r7gw26` FOREIGN KEY (`barcode_id`) REFERENCES `barcode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`productmodel`
--

/*!40000 ALTER TABLE `productmodel` DISABLE KEYS */;
INSERT INTO `angel`.`productmodel` (`id`,`Cgst`,`Discountper`,`Discription`,`Hsn`,`Igst`,`PurchasePrice`,`Sgst`,`Status`,`UnitPrice`,`productBarcode`,`productname`,`productquantity`,`barcode_id`,`branch_branchId`) VALUES 
 (1,12,0,'jkbjkfgbjkb','123',0,100,14,0,120,'937574904','Guitar',10,2,NULL),
 (2,14.5,0,'kljjknfjkbbfdjhggjhb','131',0,120,10,1,150,'825586387','dfsgg',20,3,NULL);
/*!40000 ALTER TABLE `productmodel` ENABLE KEYS */;


--
-- Definition of table `angel`.`purchase`
--

DROP TABLE IF EXISTS `angel`.`purchase`;
CREATE TABLE  `angel`.`purchase` (
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
-- Dumping data for table `angel`.`purchase`
--

/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;


--
-- Definition of table `angel`.`rent`
--

DROP TABLE IF EXISTS `angel`.`rent`;
CREATE TABLE  `angel`.`rent` (
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
  KEY `FK_d52n7baov991tlfa2gfakej84` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_d52n7baov991tlfa2gfakej84` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`rent`
--

/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `angel`.`rent` (`Id`,`CloseRequest`,`IdProofType`,`Noofinstrument`,`counsellorName`,`customerAddress`,`customerFirstName`,`customerIdProof`,`customerMobileNo`,`email`,`fromDate`,`instrumentFee1`,`instrumentFee2`,`instrumentFee3`,`instrumentFee4`,`instrumentFee5`,`instrumentName`,`instrumentName1`,`instrumentName2`,`instrumentName3`,`instrumentName4`,`instrumentName5`,`noOfDays`,`paidAmount`,`receivedDate`,`remaininFee`,`rentNo`,`securityDeposite`,`adminOfBranch_adminId`) VALUES 
 (1,1,'',1,NULL,'UYGGHYU','hgfghdf','DFXCFGXC','8956276855','GGH@YGJHB.FGDC','2017-11-06',2000,0,0,0,0,'{DFGSDFG}','DFGSDFG','Not Selected','Not Selected','Not Selected','Not Selected',10,25000,'2017-11-06',1000,'RE-1',6000,2);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;


--
-- Definition of table `angel`.`rent_rentdetails`
--

DROP TABLE IF EXISTS `angel`.`rent_rentdetails`;
CREATE TABLE  `angel`.`rent_rentdetails` (
  `Rent_Id` bigint(20) NOT NULL,
  `rentDetails_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mtobe6m57m7rwct3l3yen6k7m` (`rentDetails_AccountId`),
  KEY `FK_mtobe6m57m7rwct3l3yen6k7m` (`rentDetails_AccountId`),
  KEY `FK_ocbpgxvidoramq8yq24076tal` (`Rent_Id`),
  CONSTRAINT `FK_mtobe6m57m7rwct3l3yen6k7m` FOREIGN KEY (`rentDetails_AccountId`) REFERENCES `rentdetails` (`AccountId`),
  CONSTRAINT `FK_ocbpgxvidoramq8yq24076tal` FOREIGN KEY (`Rent_Id`) REFERENCES `rent` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`rent_rentdetails`
--

/*!40000 ALTER TABLE `rent_rentdetails` DISABLE KEYS */;
INSERT INTO `angel`.`rent_rentdetails` (`Rent_Id`,`rentDetails_AccountId`) VALUES 
 (1,1);
/*!40000 ALTER TABLE `rent_rentdetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`rentdetails`
--

DROP TABLE IF EXISTS `angel`.`rentdetails`;
CREATE TABLE  `angel`.`rentdetails` (
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
  `others` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `previousBalance` int(11) NOT NULL,
  `returnAmount` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `totaladvancedfee` int(11) NOT NULL,
  `totalremfee` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`rentdetails`
--

/*!40000 ALTER TABLE `rentdetails` DISABLE KEYS */;
INSERT INTO `angel`.`rentdetails` (`AccountId`,`PaymentMode`,`amountinWord`,`bankname`,`chequeno`,`disamount`,`discper`,`finalamount`,`instrumenttotalfee`,`noofdays`,`noofinstument`,`others`,`paymentDate`,`previousBalance`,`returnAmount`,`return_date`,`totaladvancedfee`,`totalremfee`) VALUES 
 (1,'Cash','Twenty Six Thousand ','','',0,0,26000,20000,10,1,0,'2017-11-06',0,0,'2017-11-06',25000,1000);
/*!40000 ALTER TABLE `rentdetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`repair`
--

DROP TABLE IF EXISTS `angel`.`repair`;
CREATE TABLE  `angel`.`repair` (
  `repairId` bigint(20) NOT NULL AUTO_INCREMENT,
  `CloseRequest` int(11) NOT NULL,
  `IdProofType` varchar(255) DEFAULT NULL,
  `Noofinstrument` int(11) NOT NULL,
  `brandname1` varchar(255) DEFAULT NULL,
  `brandname2` varchar(255) DEFAULT NULL,
  `brandname3` varchar(255) DEFAULT NULL,
  `brandname4` varchar(255) DEFAULT NULL,
  `brandname5` varchar(255) DEFAULT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `customerFirstName` varchar(255) DEFAULT NULL,
  `customerIdProof` varchar(255) DEFAULT NULL,
  `customerMobileNo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
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
  `modelnumber1` varchar(255) DEFAULT NULL,
  `modelnumber2` varchar(255) DEFAULT NULL,
  `modelnumber3` varchar(255) DEFAULT NULL,
  `modelnumber4` varchar(255) DEFAULT NULL,
  `modelnumber5` varchar(255) DEFAULT NULL,
  `problem1` varchar(255) DEFAULT NULL,
  `problem2` varchar(255) DEFAULT NULL,
  `problem3` varchar(255) DEFAULT NULL,
  `problem4` varchar(255) DEFAULT NULL,
  `problem5` varchar(255) DEFAULT NULL,
  `receivedDate` datetime DEFAULT NULL,
  `remaininFee` int(11) NOT NULL,
  `repairNo` varchar(255) DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`repairId`),
  KEY `FK_etxdtf41g3w47177xe8xy1jsg` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_etxdtf41g3w47177xe8xy1jsg` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`repair`
--

/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `angel`.`repair` (`repairId`,`CloseRequest`,`IdProofType`,`Noofinstrument`,`brandname1`,`brandname2`,`brandname3`,`brandname4`,`brandname5`,`counsellorName`,`customerAddress`,`customerFirstName`,`customerIdProof`,`customerMobileNo`,`email`,`instrumentFee1`,`instrumentFee2`,`instrumentFee3`,`instrumentFee4`,`instrumentFee5`,`instrumentName`,`instrumentName1`,`instrumentName2`,`instrumentName3`,`instrumentName4`,`instrumentName5`,`modelnumber1`,`modelnumber2`,`modelnumber3`,`modelnumber4`,`modelnumber5`,`problem1`,`problem2`,`problem3`,`problem4`,`problem5`,`receivedDate`,`remaininFee`,`repairNo`,`returnDate`,`adminOfBranch_adminId`) VALUES 
 (1,0,NULL,1,'gfghcf','Not Selected','Not Selected','Not Selected','Not Selected',NULL,'fghcvghv','dfgs',NULL,'8956211154','fc@cfgc.ghfcgh',500,0,0,0,0,'{DFGSDFG}','DFGSDFG','Not Selected','Not Selected','Not Selected','Not Selected','fjhgjhvg ','Not Selected','Not Selected','Not Selected','Not Selected','vfgghvgh','Not Selected','Not Selected','Not Selected','Not Selected','2017-11-06 13:09:38',100,'RP-1','2017-11-06',2);
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;


--
-- Definition of table `angel`.`repair_repairdetails`
--

DROP TABLE IF EXISTS `angel`.`repair_repairdetails`;
CREATE TABLE  `angel`.`repair_repairdetails` (
  `Repair_repairId` bigint(20) NOT NULL,
  `repairDetails_AccountId` bigint(20) NOT NULL,
  UNIQUE KEY `UK_lr04ouw8nqiok9o82ddkg82mw` (`repairDetails_AccountId`),
  KEY `FK_lr04ouw8nqiok9o82ddkg82mw` (`repairDetails_AccountId`),
  KEY `FK_h0bbwe0uu5wxn6o50y5w9vcty` (`Repair_repairId`),
  CONSTRAINT `FK_h0bbwe0uu5wxn6o50y5w9vcty` FOREIGN KEY (`Repair_repairId`) REFERENCES `repair` (`repairId`),
  CONSTRAINT `FK_lr04ouw8nqiok9o82ddkg82mw` FOREIGN KEY (`repairDetails_AccountId`) REFERENCES `repairdetails` (`AccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`repair_repairdetails`
--

/*!40000 ALTER TABLE `repair_repairdetails` DISABLE KEYS */;
INSERT INTO `angel`.`repair_repairdetails` (`Repair_repairId`,`repairDetails_AccountId`) VALUES 
 (1,2),
 (1,3);
/*!40000 ALTER TABLE `repair_repairdetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`repairdetails`
--

DROP TABLE IF EXISTS `angel`.`repairdetails`;
CREATE TABLE  `angel`.`repairdetails` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `amountinWord` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `disamount` int(11) NOT NULL,
  `discper` int(11) NOT NULL,
  `finalamount` int(11) NOT NULL,
  `instrumenttotalfee` int(11) NOT NULL,
  `noofinstument` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `previousBalance` int(11) NOT NULL,
  `totaladvancedfee` int(11) NOT NULL,
  `totalremfee` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`repairdetails`
--

/*!40000 ALTER TABLE `repairdetails` DISABLE KEYS */;
INSERT INTO `angel`.`repairdetails` (`AccountId`,`PaymentMode`,`amountinWord`,`bankname`,`chequeno`,`disamount`,`discper`,`finalamount`,`instrumenttotalfee`,`noofinstument`,`paymentDate`,`previousBalance`,`totaladvancedfee`,`totalremfee`) VALUES 
 (1,'Cash','Five Hundred  ','','',0,0,500,500,1,'2017-11-06',0,200,300),
 (2,'Cash','Five Hundred  ','','',0,0,500,500,1,'2017-11-06',0,200,300),
 (3,'Cash','Five Hundred  ','gsdfgsd','stfds',0,0,300,500,1,'2017-11-06',300,200,100);
/*!40000 ALTER TABLE `repairdetails` ENABLE KEYS */;


--
-- Definition of table `angel`.`sell`
--

DROP TABLE IF EXISTS `angel`.`sell`;
CREATE TABLE  `angel`.`sell` (
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
-- Dumping data for table `angel`.`sell`
--

/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;


--
-- Definition of table `angel`.`smsmodel`
--

DROP TABLE IF EXISTS `angel`.`smsmodel`;
CREATE TABLE  `angel`.`smsmodel` (
  `smsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `sms` varchar(255) DEFAULT NULL,
  `adminOfBranch_adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`smsId`),
  KEY `FK_82dsj7pnj7788rcyncntl62gp` (`adminOfBranch_adminId`),
  CONSTRAINT `FK_82dsj7pnj7788rcyncntl62gp` FOREIGN KEY (`adminOfBranch_adminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`smsmodel`
--

/*!40000 ALTER TABLE `smsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsmodel` ENABLE KEYS */;


--
-- Definition of table `angel`.`studentaccount`
--

DROP TABLE IF EXISTS `angel`.`studentaccount`;
CREATE TABLE  `angel`.`studentaccount` (
  `AccountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `CourseDuration` int(11) NOT NULL,
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
  `DueDate` date DEFAULT NULL,
  `PaymentMode` varchar(255) DEFAULT NULL,
  `Paymentmodecount` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`studentaccount`
--

/*!40000 ALTER TABLE `studentaccount` DISABLE KEYS */;
INSERT INTO `angel`.`studentaccount` (`AccountId`,`CourseDuration`,`CourseFee1`,`CourseFee2`,`CourseFee3`,`CourseFee4`,`CourseFee5`,`CourseName`,`CourseName1`,`CourseName2`,`CourseName3`,`CourseName4`,`CourseName5`,`DueDate`,`PaymentMode`,`Paymentmodecount`,`admissonnfee`,`amountinWord`,`bankname`,`chequeno`,`course`,`coursetotalfee`,`disamount`,`discper`,`finalamount`,`paymentDate`,`previousBalance`,`totaladvancedfee`,`totalfee`,`totalremfee`) VALUES 
 (1,1,100,0,0,0,0,'Guitar ','Guitar','Not Selected','Not Selected','Not Selected','Not Selected','2017-06-08','Cash',3,5000,'','','',1,300,0,0,5300,'2016-05-11',0,5300,5300,0),
 (2,1,100,0,0,0,0,'Guitar ','Guitar','Not Selected','Not Selected','Not Selected','Not Selected','2017-12-02','Cash',3,0,'Two Hundred  ','','',1,300,0,0,300,'2017-11-06',0,200,300,100);
/*!40000 ALTER TABLE `studentaccount` ENABLE KEYS */;


--
-- Definition of table `angel`.`studentpdf`
--

DROP TABLE IF EXISTS `angel`.`studentpdf`;
CREATE TABLE  `angel`.`studentpdf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PdfGalleryid` int(11) NOT NULL,
  `courseid` bigint(20) NOT NULL,
  `lessonno` int(11) NOT NULL,
  `pdfdescription` varchar(255) DEFAULT NULL,
  `studentid` bigint(20) NOT NULL,
  `uploadedDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`studentpdf`
--

/*!40000 ALTER TABLE `studentpdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentpdf` ENABLE KEYS */;


--
-- Definition of table `angel`.`studentwisevideo`
--

DROP TABLE IF EXISTS `angel`.`studentwisevideo`;
CREATE TABLE  `angel`.`studentwisevideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(20) NOT NULL,
  `dateofvideo` date DEFAULT NULL,
  `lessonno` int(11) NOT NULL,
  `studentid` bigint(20) NOT NULL,
  `uploadedDate` date DEFAULT NULL,
  `videoName` varchar(255) DEFAULT NULL,
  `videoPath` varchar(255) DEFAULT NULL,
  `videodescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`studentwisevideo`
--

/*!40000 ALTER TABLE `studentwisevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentwisevideo` ENABLE KEYS */;


--
-- Definition of table `angel`.`tempimage`
--

DROP TABLE IF EXISTS `angel`.`tempimage`;
CREATE TABLE  `angel`.`tempimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagename` varchar(255) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`tempimage`
--

/*!40000 ALTER TABLE `tempimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempimage` ENABLE KEYS */;


--
-- Definition of table `angel`.`tempsaleforbranch`
--

DROP TABLE IF EXISTS `angel`.`tempsaleforbranch`;
CREATE TABLE  `angel`.`tempsaleforbranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `productquantity` bigint(20) NOT NULL,
  `productBarcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angel`.`tempsaleforbranch`
--

/*!40000 ALTER TABLE `tempsaleforbranch` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempsaleforbranch` ENABLE KEYS */;


--
-- Definition of table `angel`.`user`
--

DROP TABLE IF EXISTS `angel`.`user`;
CREATE TABLE  `angel`.`user` (
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
-- Dumping data for table `angel`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `angel`.`venderregistration`
--

DROP TABLE IF EXISTS `angel`.`venderregistration`;
CREATE TABLE  `angel`.`venderregistration` (
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
-- Dumping data for table `angel`.`venderregistration`
--

/*!40000 ALTER TABLE `venderregistration` DISABLE KEYS */;
INSERT INTO `angel`.`venderregistration` (`Id`,`Address`,`BalanceAmount`,`Email`,`Status`,`city`,`companyPhone`,`contactPersonMob`,`contactPersonName`,`dist`,`gstnnumber`,`pin`,`state`,`vendorname`) VALUES 
 (1,'fghfgh',0,'D@ghvdshg.jhbsdf',0,'fghfgh','613516','vghvghvh','vghvghvhgsdv','fghfgh','dfghfgh','411014','fghdfh','Dinesdvh');
/*!40000 ALTER TABLE `venderregistration` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
