/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.25-MariaDB : Database - aaaaa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `producto` varchar(145) NOT NULL,
  `codigoAlterno` varchar(45) DEFAULT NULL,
  `codigoBarras` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `pvp` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `unidades` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `observacion` varchar(245) DEFAULT NULL,
  `minimo` varchar(45) DEFAULT NULL,
  `maximo` varchar(45) DEFAULT NULL,
  `garantia` varchar(245) DEFAULT NULL,
  `Modelos_Codigo` int(100) NOT NULL,
  `Modelos_Marcas_Codigo` int(100) NOT NULL,
  `b1` varchar(45) DEFAULT NULL,
  `b2` varchar(45) DEFAULT NULL,
  `b3` varchar(45) DEFAULT NULL,
  `b4` varchar(45) DEFAULT NULL,
  `b5` varchar(45) DEFAULT NULL,
  `b6` varchar(45) DEFAULT NULL,
  `b7` varchar(45) DEFAULT NULL,
  `b8` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codigo`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`),
  UNIQUE KEY `producto` (`producto`),
  KEY `fk_Productos_Modelos1_idx` (`Modelos_Codigo`,`Modelos_Marcas_Codigo`),
  CONSTRAINT `fk_Productos_Modelos1` FOREIGN KEY (`Modelos_Codigo`, `Modelos_Marcas_Codigo`) REFERENCES `modelos` (`Codigo`, `Marcas_Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
