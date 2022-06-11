/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 5.0.27-community : Database - meditracker
*********************************************************************
Server version : 5.0.27-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `meditracker`;

USE `meditracker`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `appointmentsmaster` */

DROP TABLE IF EXISTS `appointmentsmaster`;

CREATE TABLE `appointmentsmaster` (
  `AppointmentID` int(11) NOT NULL auto_increment,
  `DoctorName` varchar(50) default NULL,
  `DoctorID` int(10) default NULL,
  `Designation` varchar(50) default NULL,
  `AppointmentGivento` varchar(50) default NULL,
  `PatientID` int(10) default NULL,
  `NameOfPatient` varchar(50) default NULL,
  `NameOfCharity` varchar(50) default NULL,
  `DateOfAppointment` date default NULL,
  `NoOfHours` int(10) default NULL,
  PRIMARY KEY  (`AppointmentID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `dischargesmaster` */

DROP TABLE IF EXISTS `dischargesmaster`;

CREATE TABLE `dischargesmaster` (
  `NameOfPatient` varchar(50) default NULL,
  `PatientID` int(10) NOT NULL,
  `Age` int(10) default NULL,
  `Sex` varchar(10) default NULL,
  `Occupation` varchar(50) default NULL,
  `Natureofillness` varchar(50) default NULL,
  `DateOfAdmission` date default NULL,
  `DateOfDischarge` date default NULL,
  `RoomID` int(10) default NULL,
  `ConsultantDoctor` varchar(50) default NULL,
  `ReferedByDoctor` varchar(50) default NULL,
  `Insurance` varchar(50) default NULL,
  PRIMARY KEY  (`PatientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `doctorsmaster` */

DROP TABLE IF EXISTS `doctorsmaster`;

CREATE TABLE `doctorsmaster` (
  `DoctorName` varchar(50) default NULL,
  `DoctorID` int(10) NOT NULL auto_increment,
  `DateOfJoin` date default NULL,
  `Designation` varchar(50) default NULL,
  `PhoneNumber` varchar(50) default NULL,
  `Experience` int(10) default NULL,
  `HolidayinWeek` varchar(50) default NULL,
  `WorkingHours` varchar(50) default NULL,
  `ChargesPerHour` double default NULL,
  PRIMARY KEY  (`DoctorID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `inpatientmaster` */

DROP TABLE IF EXISTS `inpatientmaster`;

CREATE TABLE `inpatientmaster` (
  `NameOfPatient` varchar(50) default NULL,
  `Natureofillness` varchar(50) default NULL,
  `DateOfAdmission` date default NULL,
  `ReferedByDoctor` varchar(50) default NULL,
  `RoomID` int(10) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `insurancemaster` */

DROP TABLE IF EXISTS `insurancemaster`;

CREATE TABLE `insurancemaster` (
  `InsuranceID` int(10) NOT NULL auto_increment,
  `NameOfPatient` varchar(50) default NULL,
  `NameOfApplicant` varchar(50) default NULL,
  `WorkingAtCompany` varchar(50) default NULL,
  `EmployeeID` varchar(50) default NULL,
  `RelationWithPatient` varchar(50) default NULL,
  `Natureofillness` varchar(50) default NULL,
  `DateOfAdmission` date default NULL,
  `DateOfDischarge` date default NULL,
  `PeriodofStayinHospital` varchar(50) default NULL,
  `AmountClaimed` double default NULL,
  `Place` varchar(50) default NULL,
  `PolicyNumber` varchar(50) default NULL,
  `ClaimNumber` varchar(50) default NULL,
  PRIMARY KEY  (`InsuranceID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `UserID` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Auth` int(11) NOT NULL,
  PRIMARY KEY  (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `patientsmaster` */

DROP TABLE IF EXISTS `patientsmaster`;

CREATE TABLE `patientsmaster` (
  `NameOfPatient` varchar(50) default NULL,
  `PatientID` int(10) NOT NULL auto_increment,
  `Age` int(10) default NULL,
  `Sex` varchar(10) default NULL,
  `Occupation` varchar(50) default NULL,
  `Contactnumbers` varchar(50) default NULL,
  `Natureofillness` varchar(50) default NULL,
  `DateOfAdmission` date default NULL,
  `AdmissionAs` varchar(50) default NULL,
  `Insurance` varchar(50) default NULL,
  `GaurdianName` varchar(50) default NULL,
  `RelationWithPatient` varchar(50) default NULL,
  `ReferedByDoctor` varchar(50) default NULL,
  `RoomID` varchar(10) default NULL,
  PRIMARY KEY  (`PatientID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `roomsmaster` */

DROP TABLE IF EXISTS `roomsmaster`;

CREATE TABLE `roomsmaster` (
  `RoomID` int(10) NOT NULL,
  `Category` varchar(50) default NULL,
  `NoOfBeds` int(50) default NULL,
  `ChargesPerDay` double default NULL,
  `VisitorsAllowed` varchar(50) default NULL,
  `VisitingHours` varchar(50) default NULL,
  `Status` varchar(50) default NULL,
  PRIMARY KEY  (`RoomID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
