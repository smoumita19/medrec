# ************************************************************
# Sequel Ace SQL dump
# Version 20033
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.25)
# Database: medrec
# Generation Time: 2022-06-19 05:59:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table appointmentsmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `appointmentsmaster`;

CREATE TABLE `appointmentsmaster` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(50) DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  `AppointmentGivento` varchar(50) DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `NameOfPatient` varchar(50) DEFAULT NULL,
  `NameOfCharity` varchar(50) DEFAULT NULL,
  `DateOfAppointment` date DEFAULT NULL,
  `NoOfHours` int DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



# Dump of table billingmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `billingmaster`;

CREATE TABLE `billingmaster` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `NameOfPatient` varchar(50) DEFAULT NULL,
  `AdmissionFee` int DEFAULT NULL,
  `PeriodofStayinHospital` int DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `RoomRent` int DEFAULT NULL,
  `ReferedByDoctor` varchar(50) DEFAULT NULL,
  `DoctorFee` int DEFAULT NULL,
  `TotalCharge` int DEFAULT NULL,
  PRIMARY KEY (`BillID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;



# Dump of table dischargesmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dischargesmaster`;

CREATE TABLE `dischargesmaster` (
  `NameOfPatient` varchar(50) DEFAULT NULL,
  `PatientID` int NOT NULL,
  `Age` int DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Occupation` varchar(50) DEFAULT NULL,
  `Natureofillness` varchar(50) DEFAULT NULL,
  `DateOfAdmission` date DEFAULT NULL,
  `DateOfDischarge` date DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `ConsultantDoctor` varchar(50) DEFAULT NULL,
  `ReferedByDoctor` varchar(50) DEFAULT NULL,
  `Insurance` varchar(50) DEFAULT NULL,
  `BillAmount` int DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table doctorsmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doctorsmaster`;

CREATE TABLE `doctorsmaster` (
  `DoctorName` varchar(50) DEFAULT NULL,
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `DateOfJoin` date DEFAULT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `Experience` int DEFAULT NULL,
  `HolidayinWeek` varchar(50) DEFAULT NULL,
  `WorkingHours` varchar(50) DEFAULT NULL,
  `ChargesPerHour` double DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



# Dump of table inpatientmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inpatientmaster`;

CREATE TABLE `inpatientmaster` (
  `NameOfPatient` varchar(50) DEFAULT NULL,
  `Natureofillness` varchar(50) DEFAULT NULL,
  `DateOfAdmission` date DEFAULT NULL,
  `ReferedByDoctor` varchar(50) DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `InsuranceID` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table insurancemaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `insurancemaster`;

CREATE TABLE `insurancemaster` (
  `InsuranceID` int NOT NULL AUTO_INCREMENT,
  `NameOfPatient` varchar(50) DEFAULT NULL,
  `NameOfApplicant` varchar(50) DEFAULT NULL,
  `WorkingAtCompany` varchar(50) DEFAULT NULL,
  `EmployeeID` varchar(50) DEFAULT NULL,
  `RelationWithPatient` varchar(50) DEFAULT NULL,
  `Natureofillness` varchar(50) DEFAULT NULL,
  `DateOfAdmission` date DEFAULT NULL,
  `DateOfDischarge` date DEFAULT NULL,
  `PeriodofStayinHospital` varchar(50) DEFAULT NULL,
  `AmountClaimed` double DEFAULT NULL,
  `Place` varchar(50) DEFAULT NULL,
  `PolicyNumber` varchar(50) DEFAULT NULL,
  `ClaimNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;



# Dump of table login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `UserID` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Auth` int NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table patientsmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patientsmaster`;

CREATE TABLE `patientsmaster` (
  `NameOfPatient` varchar(50) DEFAULT NULL,
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `Age` int DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Occupation` varchar(50) DEFAULT NULL,
  `Contactnumbers` varchar(50) DEFAULT NULL,
  `Natureofillness` varchar(50) DEFAULT NULL,
  `DateOfAdmission` date DEFAULT NULL,
  `AdmissionAs` varchar(50) DEFAULT NULL,
  `Insurance` varchar(50) DEFAULT NULL,
  `GaurdianName` varchar(50) DEFAULT NULL,
  `RelationWithPatient` varchar(50) DEFAULT NULL,
  `ReferedByDoctor` varchar(50) DEFAULT NULL,
  `RoomID` varchar(10) DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `InsuranceID` int DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;



# Dump of table roomsmaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roomsmaster`;

CREATE TABLE `roomsmaster` (
  `RoomID` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(50) DEFAULT NULL,
  `ChargesPerDay` double DEFAULT NULL,
  `VisitorsAllowed` varchar(50) DEFAULT NULL,
  `VisitingHours` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RoomID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
