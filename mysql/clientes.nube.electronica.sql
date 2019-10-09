/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.36-MariaDB : Database - clientes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `seriedisco` varchar(500) DEFAULT NULL,
  `activo` varchar(100) DEFAULT 'no',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`codigo`,`nombre`,`ruc`,`seriedisco`,`activo`) values (1,'polo','22222','/B5RFTC2/CN129636BB009D/','si');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
