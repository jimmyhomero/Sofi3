/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.25-MariaDB : Database - aaaa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `bodegas` */

DROP TABLE IF EXISTS `bodegas`;

CREATE TABLE `bodegas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `bodegaID` varchar(45) DEFAULT NULL,
  `bodega` varchar(145) DEFAULT NULL,
  `descripcion` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `bodegas` */

insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (1,'1','Principal','BodegaPrincipal'),(2,'2','QUITO','bodega2'),(3,'3','MANA','bodega3'),(4,'4','PORTOVIEJO','bodega4'),(5,'5','SANTO DOMINGO','bodega5'),(6,'6','BELGICA','bodega6'),(7,'7','PARIS','bodega7'),(8,'8','INES',NULL);

/*Table structure for table `cajas` */

DROP TABLE IF EXISTS `cajas`;

CREATE TABLE `cajas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `caja` varchar(95) DEFAULT NULL,
  `descripcion` varchar(345) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `fechaApertura` date DEFAULT NULL,
  `fechaCierre` date DEFAULT NULL,
  `saldoInicial` double DEFAULT '0',
  `totalcierre` double DEFAULT NULL,
  `cajero` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cajas` */

insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (1,'CAJA GENERAL','CAJA GENERAL ',1,'2017-11-05',NULL,0,NULL,NULL),(2,'CAJA QUITO','CAJA QUITO',1,'2017-11-07',NULL,0,0,NULL),(3,'CAJA LOJA','CAJA LOJA',1,NULL,NULL,0,NULL,NULL);

/*Table structure for table `cajasdetalle` */

DROP TABLE IF EXISTS `cajasdetalle`;

CREATE TABLE `cajasdetalle` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(245) DEFAULT NULL,
  `VALOR` varchar(45) DEFAULT NULL,
  `TIPO` varchar(45) DEFAULT NULL,
  `DOCUMENTO` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(245) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CodigoDocumento` int(11) DEFAULT NULL,
  `Cajas_Codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*Data for the table `cajasdetalle` */

insert  into `cajasdetalle`(`codigo`,`detalle`,`VALOR`,`TIPO`,`DOCUMENTO`,`Descripcion`,`fecha`,`CodigoDocumento`,`Cajas_Codigo`) values (1,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-08 12:48:17',1,1),(2,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 12:55:44',2,1),(3,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 12:57:19',3,1),(4,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 22:01:48',4,1),(5,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','31.7','INGRESO ','TICKET','---','2018-04-08 22:04:06',5,1),(6,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 22:07:17',6,1),(7,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 22:13:57',7,1),(8,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 22:19:07',8,1),(9,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','900.0','INGRESO ','TICKET','---','2018-04-08 22:20:30',9,1),(10,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','482.1','INGRESO ','TICKET','---','2018-04-08 22:22:21',10,1),(11,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','562.4','INGRESO ','TICKET','---','2018-04-08 22:23:25',11,1),(12,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','102.0','INGRESO ','TICKET','---','2018-04-08 22:23:51',12,1),(13,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','5.2','INGRESO ','TICKET','---','2018-04-08 22:25:50',13,1),(14,'INGRESO POR FACURA TICKET - EFECTIVO # 000000001 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.4','INGRESO ','TICKET','---','2018-04-08 22:30:43',14,1),(15,'INGRESO POR FACURA TICKET - EFECTIVO # 000000002 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','TICKET','---','2018-04-08 22:50:05',15,1),(16,'INGRESO POR FACURA TICKET - EFECTIVO # 000000003 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','TICKET','---','2018-04-08 22:50:26',16,1),(17,'INGRESO POR FACURA TICKET - EFECTIVO # 000000004 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','TICKET','---','2018-04-08 22:56:47',17,1),(18,'INGRESO POR FACURA TICKET - EFECTIVO # 000000005 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 23:46:55',18,1),(19,'INGRESO POR FACURA TICKET - EFECTIVO # 000000006 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-08 23:52:31',19,1),(20,'INGRESO POR FACURA TICKET - EFECTIVO # 000000007 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','5.2','INGRESO ','TICKET','---','2018-04-08 23:57:42',20,1),(21,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000002 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','FACTURA','---','2018-04-08 23:58:24',1,1),(22,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000003 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','FACTURA','---','2018-04-09 00:00:14',2,1),(23,'INGRESO POR FACURA TICKET - EFECTIVO # 000000008 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','TICKET','---','2018-04-09 12:00:29',22,1),(24,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000004 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','FACTURA','---','2018-04-09 12:01:14',3,1),(25,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000005 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','FACTURA','---','2018-04-09 12:03:10',4,1),(26,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000006 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','FACTURA','---','2018-04-09 12:09:55',5,1),(27,'INGRESO POR FACURA TICKET - EFECTIVO # 000000010 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','TICKET','---','2018-04-09 17:53:42',24,1),(28,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000009 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','5.0','INGRESO ','FACTURA','---','2018-04-11 16:27:17',6,1),(29,'INGRESO POR FACURA TICKET - EFECTIVO # 000000012 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-12 14:11:25',26,1),(30,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000010 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','18.0','INGRESO ','FACTURA','---','2018-04-12 14:12:55',7,1),(31,'INGRESO POR FACURA TICKET - EFECTIVO # 000000014 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','TICKET','---','2018-04-12 14:45:31',28,1),(32,'INGRESO POR FACURA TICKET - EFECTIVO # 000000015 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-12 15:14:42',29,1),(33,'INGRESO POR FACURA TICKET - EFECTIVO # 000000016 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','26.5','INGRESO ','TICKET','---','2018-04-12 15:25:30',30,1),(34,'INGRESO POR FACURA TICKET - EFECTIVO # 000000017 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-12 17:13:23',31,1),(35,'INGRESO POR FACURA TICKET - EFECTIVO # 000000018 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','28.2','INGRESO ','TICKET','---','2018-04-12 17:15:50',32,1),(36,'INGRESO POR FACURA TICKET - EFECTIVO # 000000019 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','19.7','INGRESO ','TICKET','---','2018-04-12 23:57:52',33,1),(37,'INGRESO POR FACURA TICKET - EFECTIVO # 000000020 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','16.7','INGRESO ','TICKET','---','2018-04-12 23:58:49',34,1),(38,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000011 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','FACTURA','---','2018-04-13 00:00:47',8,1),(39,'INGRESO POR FACURA TICKET - EFECTIVO # 000000022 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-13 00:07:29',36,1),(40,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000012 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','FACTURA','---','2018-04-13 00:07:46',9,1),(41,'INGRESO POR FACURA TICKET - EFECTIVO # 000000024 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-13 00:13:13',38,1),(42,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000013 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','FACTURA','---','2018-04-13 00:17:19',10,1),(43,'INGRESO POR FACURA TICKET - EFECTIVO # 000000026 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-13 07:39:02',40,1),(44,'INGRESO POR FACURA TICKET - EFECTIVO # 000000027 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','TICKET','---','2018-04-13 07:41:54',41,1),(45,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000014 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','15.0','INGRESO ','FACTURA','---','2018-04-13 07:42:22',11,1),(46,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000015 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','FACTURA','---','2018-04-13 07:45:23',12,1),(47,'INGRESO POR FACURA TICKET - EFECTIVO # 000000030 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','TICKET','---','2018-04-13 08:02:59',44,1),(48,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000016 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','FACTURA','---','2018-04-13 08:03:15',13,1),(49,'INGRESO POR FACURA TICKET - EFECTIVO # 000000032 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','TICKET','---','2018-04-13 08:07:46',46,1),(50,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000017 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','FACTURA','---','2018-04-13 08:08:17',14,1),(51,'INGRESO POR FACURA TICKET - EFECTIVO # 000000034 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','TICKET','---','2018-04-13 14:40:36',48,1),(52,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000018 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','FACTURA','---','2018-04-13 14:41:18',15,1),(53,'INGRESO POR FACURA TICKET - EFECTIVO # 000000036 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.0','INGRESO ','TICKET','---','2018-04-13 15:25:58',50,1),(54,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000019 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','3.5','INGRESO ','FACTURA','---','2018-04-13 15:26:14',16,1),(55,'INGRESO POR FACURA TICKET - EFECTIVO # 000000037 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-13 15:46:40',52,1),(56,'INGRESO POR FACURA FACTURA - EFECTIVO # 001-001-000000020 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','FACTURA','---','2018-04-13 15:46:51',17,1),(57,'INGRESO POR FACURA TICKET - EFECTIVO # 000000040 EN EQUIPO: DESKTOP-OQEODUI USUARIO: JIMM','1.7','INGRESO ','TICKET','---','2018-04-13 16:20:28',55,1);

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(200) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `categorias` */

insert  into `categorias`(`codigo`,`categoria`,`descripcion`) values (1,'LAPTOP','AUTO');

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(50) NOT NULL,
  `Nombres` varchar(200) NOT NULL,
  `Telefono` varchar(200) DEFAULT NULL,
  `Celular` varchar(200) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `Direccion` varchar(350) DEFAULT NULL,
  `Provincia` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Nacionalidad` varchar(100) DEFAULT NULL,
  `PagoPredeterminado` int(100) DEFAULT NULL,
  `TipoCliente` int(100) DEFAULT NULL,
  `VendedorPredeterminado` int(100) DEFAULT NULL,
  `Observaciones` varchar(400) DEFAULT NULL,
  `Nacimiento` varchar(20) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `huella` varchar(25) DEFAULT NULL,
  `estadoCivil` varchar(30) DEFAULT NULL,
  `empresa` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `Cedula` (`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (1,'1722239967001','CARRION TORRES JIMMY HOMERO','','0992669329','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO / SAN MIGUEL LOTE 145 Y AV. QUITO',' SANTO DOMINGO ',' SANTO DOMINGO ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','ACT',NULL),(2,'2390021227001','IMPORTADORA Y DISTRIBUIDORA COSMO BELLEZA IMPOCOSMOBELLEZA S.A.','','0992669329','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. 29 DE MAYO SN Y LOJA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','',NULL),(4,'1.718792656E9','MAYTE FREIRE','2.3741085E7','','','EL EMPALME','STO DGO','STO DGO',NULL,0,0,0,'RUTA4\n','1000-01-01','null',NULL,NULL,NULL),(5,'1.718554569E9','PAMELA BURRIN','','9.8756936E7','pamelov@hotmail.com','3 DE DICIEMBRE','MANABI','PORTOVIEJO',NULL,0,0,0,'RUTA4\nMala cliente no credito','1000-01-01','null',NULL,NULL,NULL),(13,'1717148371','QUINTANA ALBIÃ‘O SHEICY ELIZABETH','','','','KM 4 1/2 VIA QUEVEDO','STO DGO TSACHIL/SANTO DOMINGO/ABRAHAM CALAZACON','','ECUATORIANA',0,0,0,NULL,'06-01-1982','F','V4333V4222','SOLTERO',NULL),(14,'2300364730','SACON MENDOZA FREDY FERNANDO','','','','SECT 5 0 COOP STA MARTHA','STO DGO TSACHIL/SANTO DOMINGO/RIO VERDE','','ECUATORIANA',0,0,0,NULL,'23-08-1998','M','V4444E2142','SOLTERO',NULL),(15,'1722239967','CARRION TORRES JIMMY HOMERO','','','','COOP STA MARTHA SN COOP STA MA','STO DGO TSACHIL/SANTO DOMINGO/RIO VERDE','','ECUATORIANA',0,0,0,NULL,'21-03-1988','M','V2343V2242','SOLTERO',NULL),(16,'1722423967001','GETIAL GETIAL RICARDO MIGUEL','','','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. QUITO 516 Y AMBATO Y LATACUNGA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','ACT',NULL),(17,'9999999999999','COSUMIDOR FINAL','999999999','999999999',NULL,'CONSUMIDOR DINAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `color` */

insert  into `color`(`codigo`,`color`) values (1,'NEGRO'),(2,'AZUL'),(3,'VERDE'),(4,'AMARILLO'),(5,'ROJO'),(6,'GRIS'),(7,'PLOMO'),(8,'LILA'),(9,'NARANJA'),(10,'ROSADO');

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) DEFAULT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documentoID` varchar(5) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '0',
  `fechain` varchar(45) DEFAULT NULL,
  `calveAcceso` varchar(100) DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '0',
  `DescripcionElectronica` varchar(100) DEFAULT NULL,
  `autorizado` int(1) NOT NULL DEFAULT '0',
  `establecimiento` varchar(10) DEFAULT NULL,
  `ptoEmision` varchar(10) DEFAULT NULL,
  `secfactura` varchar(50) DEFAULT NULL,
  `formaPago` varchar(50) DEFAULT NULL,
  `efectivo` double DEFAULT NULL,
  `cambio` double DEFAULT NULL,
  `Proveedores_codigo` int(100) NOT NULL,
  `nota_codigo` int(11) DEFAULT NULL,
  `Autorizacion` varchar(75) DEFAULT NULL,
  `sustento` varchar(200) DEFAULT NULL,
  `sustentoID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Codigo`,`Proveedores_codigo`),
  KEY `fk_Factura_usuarios1_idx` (`Usuarios_Codigo`),
  KEY `fk_facturas_copy1_Proveedores1_idx` (`Proveedores_codigo`),
  CONSTRAINT `fk_Factura_usuarios10` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_copy1_Proveedores1` FOREIGN KEY (`Proveedores_codigo`) REFERENCES `proveedores` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `compras` */

insert  into `compras`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documentoID`,`tipo_documento`,`descuento`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`,`autorizado`,`establecimiento`,`ptoEmision`,`secfactura`,`formaPago`,`efectivo`,`cambio`,`Proveedores_codigo`,`nota_codigo`,`Autorizacion`,`sustento`,`sustentoID`) values (1,'2018-03-15','2018-03-15 21:52:22','12.0','3.75','31.25','0.00','35.00','8.100000000000001','1','Factura','0.00',4,'DESKTOP-OQEODUI','001-001-002255632',0,'2018-03-15 00:00:00','000100100122255555522',0,NULL,0,'001','001','002255632','EFECTIVO',0,0,2,NULL,NULL,'CrÃƒÂ©dito Tributario para declaraciÃƒÂ³n de IVA (servicios y bienes distintos de inventarios y activos fijos)','01'),(2,'2018-03-15','2018-03-15 21:53:23','12.0','27.32','227.68','0.00','255.00','57.8','1','Factura','0.00',4,'DESKTOP-OQEODUI','001-001-002255632',0,'2018-03-15 00:00:00','000100100122255555522',0,NULL,0,'001','001','002255632','EFECTIVO',0,0,2,NULL,NULL,'CrÃƒÂ©dito Tributario para declaraciÃƒÂ³n de IVA (servicios y bienes distintos de inventarios y activos fijos)','01'),(3,'2018-04-11','2018-04-11 16:25:39','12.0','2.14','17.86','0.00','20.00','5.0','1','Factura','0.00',4,'DESKTOP-OQEODUI','001-002-0000002',0,'2018-04-11 00:00:00','25555542222255555',0,NULL,0,'001','002','0000002','EFECTIVO',0,0,3,NULL,NULL,'CrÃƒÂ©dito Tributario para declaraciÃƒÂ³n de IVA (servicios y bienes distintos de inventarios y activos fijos)','01');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT '1',
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `config` */

insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (1,'IVA','12',NULL,NULL,NULL,NULL,NULL),(2,'UTILIDAD','30',NULL,NULL,NULL,NULL,NULL),(3,'MONEDA','DOALRES AMERICANOS',NULL,NULL,NULL,NULL,NULL),(4,'PERMITIR FACTURAR SIN STCOCK','SI',NULL,NULL,NULL,NULL,NULL),(6,'NUMERO DE VECES QUE SE IMPRIMIRA FACTURA','1',NULL,NULL,NULL,NULL,NULL),(7,'DOCUMENTO PREDETERMINADO','TICKET',NULL,NULL,NULL,NULL,NULL),(8,'DIR_CONFIG','ASDASD',NULL,NULL,NULL,NULL,NULL),(9,'SERVIDOR','192.168.1.1',NULL,NULL,NULL,NULL,NULL),(10,'ELECTRONICA','NO',NULL,NULL,NULL,NULL,NULL),(11,'FE_SOLO_FIRMA_DOC','0',NULL,NULL,NULL,NULL,NULL),(12,'PERIODO','2018',NULL,NULL,NULL,NULL,NULL),(13,'GENERADOS','C:\\Sofi\\electronica\\generados',NULL,NULL,NULL,NULL,NULL),(14,'FIRMADOS','C:\\Sofi\\electronica\\firmados',NULL,NULL,NULL,NULL,NULL),(15,'AUTORIZADOS','C:\\Sofi\\electronica\\autorizados',NULL,NULL,NULL,NULL,NULL),(16,'GENERADOS_SHEYLA','C:\\Sofi\\electronica\\generados_sheyla',NULL,NULL,NULL,NULL,NULL),(17,'LOGO_ELECTRONICA','C:\\Sofi\\electronica\\logo.png',NULL,NULL,NULL,NULL,NULL),(18,'FIRMA','C:\\Sofi\\electronica\\firma.p12',NULL,NULL,NULL,NULL,NULL),(19,'PKPASSWORD','C:\\Sofi\\electronica\\clave.txt',NULL,NULL,NULL,NULL,NULL),(20,'CACERT','C:\\Sofi\\electronica\\cacerts',NULL,NULL,NULL,NULL,NULL),(21,'METODO DE VALORACION DE INVENTARIO','U.E.P.S',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `config_equipos` */

DROP TABLE IF EXISTS `config_equipos`;

CREATE TABLE `config_equipos` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL,
  `equipos_Codigo` int(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_config_equipos_equipos1_idx` (`equipos_Codigo`),
  CONSTRAINT `fk_config_equipos_equipos1` FOREIGN KEY (`equipos_Codigo`) REFERENCES `equipos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `config_equipos` */

insert  into `config_equipos`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`,`equipos_Codigo`) values (1,'IMPRESORA TICKETS','\\\\10.123.1.250\\Generic / Text Only',NULL,NULL,NULL,NULL,NULL,20),(2,'IMPRESORA FACTURAS','\\\\10.123.1.250\\EPSON L380 Series',NULL,NULL,NULL,NULL,NULL,20),(3,'FORMA DE PAGO PREDETERMINADA','EFECTIVO',NULL,NULL,NULL,NULL,NULL,20),(4,'BODEGA PREDETERMINADA EN COMPRA','1-Principal',NULL,NULL,NULL,NULL,NULL,20),(5,'BODEGA PREDETERMINADA EN VENTA','1-Principal',NULL,NULL,NULL,NULL,NULL,20),(7,'VER IMAAGEN ','No Asignada',NULL,NULL,NULL,NULL,NULL,20),(8,'FACTURA TIRILLAS O CON FORMATO','GRANDE',NULL,NULL,NULL,NULL,NULL,20),(9,'TICKET TIRILLAS O CON FORMATO','GRANDE',NULL,NULL,NULL,NULL,NULL,20),(10,'PROFORMA TIRILLAS O CON FORMATO','GRANDE',NULL,NULL,NULL,NULL,NULL,20);

/*Table structure for table `config_usuarios` */

DROP TABLE IF EXISTS `config_usuarios`;

CREATE TABLE `config_usuarios` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL,
  `Usuarios_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_config_Usuarios_usuarios1_idx` (`Usuarios_codigo`),
  CONSTRAINT `fk_config_Usuarios_usuarios1` FOREIGN KEY (`Usuarios_codigo`) REFERENCES `usuarios` (`Tipo_Usuario_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `config_usuarios` */

/*Table structure for table `cxc` */

DROP TABLE IF EXISTS `cxc`;

CREATE TABLE `cxc` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(55) DEFAULT NULL,
  `descripcion` varchar(345) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `abono` varchar(45) DEFAULT NULL,
  `saldo` varchar(45) DEFAULT NULL,
  `facturas_codigo` int(11) NOT NULL,
  `formasPagoV_codigo` int(11) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `diasCredito` varchar(45) DEFAULT NULL,
  `diasAtrazo` varchar(45) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Clientes_Codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_Pagos_facturas1_idx` (`facturas_codigo`),
  KEY `fk_Pagos_formasPagoV1_idx` (`formasPagoV_codigo`),
  CONSTRAINT `fk_Pagos_facturas1` FOREIGN KEY (`facturas_codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_formasPagoV1` FOREIGN KEY (`formasPagoV_codigo`) REFERENCES `formaspagov` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cxc` */

/*Table structure for table `cxp` */

DROP TABLE IF EXISTS `cxp`;

CREATE TABLE `cxp` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(55) DEFAULT NULL,
  `descripcion` varchar(345) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `abono` varchar(45) DEFAULT NULL,
  `saldo` varchar(45) DEFAULT NULL,
  `compras_codigo` int(11) NOT NULL,
  `formasPagoc_codigo` int(11) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `diasCredito` varchar(45) DEFAULT NULL,
  `diasAtrazo` varchar(45) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proveedores_Codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_Pagos_compras1_idx` (`compras_codigo`),
  KEY `fk_Pagos_formasPagoc1_idx` (`formasPagoc_codigo`),
  CONSTRAINT `fk_Pagos_compras1` FOREIGN KEY (`compras_codigo`) REFERENCES `compras` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_formasPagoV1f` FOREIGN KEY (`formasPagoc_codigo`) REFERENCES `formaspagoc` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cxp` */

/*Table structure for table `datosempresa` */

DROP TABLE IF EXISTS `datosempresa`;

CREATE TABLE `datosempresa` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(45) DEFAULT NULL,
  `nombre` varchar(75) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `direccion` varchar(85) DEFAULT NULL,
  `slogan` varchar(45) DEFAULT NULL,
  `cedula2` varchar(45) DEFAULT NULL,
  `nombre2` varchar(45) DEFAULT NULL,
  `direccion2` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `observacion` varchar(145) DEFAULT NULL,
  `imagen` longblob,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `datosempresa` */

insert  into `datosempresa`(`codigo`,`ruc`,`nombre`,`telefono`,`celular`,`mail`,`direccion`,`slogan`,`cedula2`,`nombre2`,`direccion2`,`telefono2`,`observacion`,`imagen`) values (2,'1722239967001','COMPUECONOMIA','0992669329','0992669329','homer_loading@homail.com','Santo Domingo','LO MISMO PERO MAS BARATO','1722239967','JImmy Carrion','cooperativa gran colombia','3700917','observacion','observacion');

/*Table structure for table `detallecompra` */

DROP TABLE IF EXISTS `detallecompra`;

CREATE TABLE `detallecompra` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL,
  `compras_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_DetalleFactura_Productos1_idx` (`Productos_Codigo`),
  KEY `fk_detallecompra_compras1_idx` (`compras_codigo`),
  CONSTRAINT `fk_DetalleFactura_Productos10` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallecompra_compras1` FOREIGN KEY (`compras_codigo`) REFERENCES `compras` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `detallecompra` */

insert  into `detallecompra`(`codigo`,`cantidad`,`detalle`,`iva`,`descuento`,`valorUnitario`,`valorTotal`,`Productos_Codigo`,`Observaciones`,`compras_codigo`) values (1,'10','YOGURT TONY','3.75','0','3.12','31.25',37,NULL,1),(2,'10','MR POLLO 3 LIBRAS','15.27','5','13.39','127.23',38,NULL,2),(3,'20','YOGURT TONY','7.50','0','3.12','62.50',37,NULL,2),(4,'25','LECHE CONDENSADA','4.55','0','1.52','37.95',36,NULL,2),(5,'10','LECHE CONDENSADA','2.14','0','1.79','17.86',36,NULL,3);

/*Table structure for table `detallefactura` */

DROP TABLE IF EXISTS `detallefactura`;

CREATE TABLE `detallefactura` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `Factura_Codigo` int(100) NOT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`Factura_Codigo`),
  KEY `fk_DetalleFactura_Factura1_idx` (`Factura_Codigo`),
  KEY `fk_DetalleFactura_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_DetalleFactura_Factura1` FOREIGN KEY (`Factura_Codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleFactura_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `detallefactura` */

insert  into `detallefactura`(`codigo`,`cantidad`,`detalle`,`iva`,`descuento`,`valorUnitario`,`valorTotal`,`Factura_Codigo`,`Productos_Codigo`,`Observaciones`) values (1,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',1,36,NULL),(2,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',2,36,NULL),(3,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',3,38,NULL),(4,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',4,38,NULL),(5,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',4,36,NULL),(6,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',5,38,NULL),(7,'1','LECHE CONDENSADA','0.54','0','4.46','4.46',6,36,NULL),(8,'1','MIGUEL','0.32','0','2.68','2.68',7,39,NULL),(9,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',7,38,NULL),(10,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',8,36,NULL),(11,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',9,36,NULL),(12,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',10,39,NULL),(13,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',11,38,NULL),(14,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',12,39,NULL),(15,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',13,36,NULL),(16,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',14,39,NULL),(17,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',15,39,NULL),(18,'1','YOGURT TONY','0.38','0','3.12','3.12',16,37,NULL),(19,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',17,36,NULL);

/*Table structure for table `detalleproforma` */

DROP TABLE IF EXISTS `detalleproforma`;

CREATE TABLE `detalleproforma` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `proforma_Codigo` int(100) NOT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`proforma_Codigo`),
  KEY `fk_Detalleproforma_proforma1_idx` (`proforma_Codigo`),
  KEY `fk_Detalleproforma_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_Detalleproforma_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalleproforma_proforma1` FOREIGN KEY (`proforma_Codigo`) REFERENCES `proformas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `detalleproforma` */

insert  into `detalleproforma`(`codigo`,`cantidad`,`detalle`,`iva`,`descuento`,`valorUnitario`,`valorTotal`,`proforma_Codigo`,`Productos_Codigo`,`Observaciones`) values (1,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',1,36,NULL),(2,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',1,36,NULL),(3,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',1,36,NULL),(4,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',1,38,NULL),(5,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',2,38,NULL),(6,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',3,36,NULL),(7,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',4,36,NULL),(8,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',5,38,NULL),(9,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',6,38,NULL),(10,'1','YOGURT TONY','0.38','0','3.12','3.12',7,37,NULL),(11,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',8,38,NULL),(12,'1','MIGUEL','0.32','0','2.68','2.68',9,39,NULL),(13,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',10,39,NULL);

/*Table structure for table `detalleretencion` */

DROP TABLE IF EXISTS `detalleretencion`;

CREATE TABLE `detalleretencion` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ejercicio` varchar(45) DEFAULT NULL,
  `base` double DEFAULT NULL,
  `impuesto` varchar(45) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `porcentaje` double DEFAULT NULL,
  `Retencion_codigo` int(11) NOT NULL,
  `retenido` double DEFAULT NULL,
  PRIMARY KEY (`codigo`,`Retencion_codigo`),
  KEY `fk_detalleRetencion_Retencion1_idx` (`Retencion_codigo`),
  CONSTRAINT `fk_detalleRetencion_Retencion1` FOREIGN KEY (`Retencion_codigo`) REFERENCES `retencion` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalleretencion` */

/*Table structure for table `detalleticket` */

DROP TABLE IF EXISTS `detalleticket`;

CREATE TABLE `detalleticket` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `ticket_Codigo` int(100) NOT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`ticket_Codigo`),
  KEY `fk_Detalleticket_ticket1_idx` (`ticket_Codigo`),
  KEY `fk_Detalleticket_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_Detalleticket_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalleticket_ticket1` FOREIGN KEY (`ticket_Codigo`) REFERENCES `tickets` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `detalleticket` */

insert  into `detalleticket`(`codigo`,`cantidad`,`detalle`,`iva`,`descuento`,`valorUnitario`,`valorTotal`,`ticket_Codigo`,`Productos_Codigo`,`Observaciones`) values (1,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',1,36,NULL),(2,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',2,36,NULL),(3,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',3,36,NULL),(4,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',4,36,NULL),(5,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',5,36,NULL),(6,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',6,38,NULL),(7,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',7,36,NULL),(8,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',8,38,NULL),(9,'10','MR POLLO 3 LIBRAS','16.07','0','13.39','133.93',9,38,NULL),(10,'25','MR POLLO 3 LIBRAS','40.18','0','13.39','334.82',10,38,NULL),(11,'35','MR POLLO 3 LIBRAS','56.25','0','13.39','468.75',11,38,NULL),(12,'10','LECHE CONDENSADA','1.82','0','1.52','15.18',12,36,NULL),(13,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',13,36,NULL),(14,'1','YOGURT TONY','0.38','0','3.12','3.12',13,37,NULL),(15,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',14,36,NULL),(16,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',14,36,NULL),(17,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',15,38,NULL),(18,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',16,38,NULL),(19,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',17,38,NULL),(20,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',18,36,NULL),(21,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',18,38,NULL),(22,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',19,36,NULL),(23,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',19,38,NULL),(24,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',20,36,NULL),(25,'1','YOGURT TONY','0.38','0','3.12','3.12',20,37,NULL),(26,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',22,38,NULL),(27,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',24,38,NULL),(28,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',26,36,NULL),(29,'1','MIGUEL','0.32','0','2.68','2.68',28,39,NULL),(30,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',29,36,NULL),(31,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',30,38,NULL),(32,'1','SAPOLIO 6 EN 1','0.91','0','7.59','7.59',30,40,NULL),(33,'1','MIGUEL','0.32','0','2.68','2.68',30,39,NULL),(34,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',31,36,NULL),(35,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',32,39,NULL),(36,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',32,36,NULL),(37,'1','MR POLLO 3 LIBRAS','1.61','0','13.39','13.39',32,38,NULL),(38,'1','SAPOLIO 6 EN 1','0.91','0','7.59','7.59',32,40,NULL),(39,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',33,36,NULL),(40,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',33,39,NULL),(41,'1','SAPOLIO 6 EN 1','0.91','0','7.59','7.59',33,40,NULL),(42,'1','YOGURT TONY','0.38','0','3.12','3.12',33,37,NULL),(43,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',33,39,NULL),(44,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',34,39,NULL),(45,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',34,36,NULL),(46,'1','SAPOLIO 6 EN 1','0.91','0','7.59','7.59',34,40,NULL),(47,'1','YOGURT TONY','0.38','0','3.12','3.12',34,37,NULL),(48,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',36,36,NULL),(49,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',38,36,NULL),(50,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',40,36,NULL),(51,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',41,39,NULL),(52,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',44,39,NULL),(53,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',46,39,NULL),(54,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',48,39,NULL),(55,'1','MIGUEL GETIAL EL PILASDE LA CASA','0.32','0','2.68','2.68',50,39,NULL),(56,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',52,36,NULL),(57,'1','LECHE CONDENSADA','0.18','0','1.52','1.52',55,36,NULL);

/*Table structure for table `equipos` */

DROP TABLE IF EXISTS `equipos`;

CREATE TABLE `equipos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `NombreReal` varchar(45) DEFAULT NULL,
  `nombreSoft` varchar(80) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(245) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `responsable` varchar(145) DEFAULT NULL,
  `serie` varchar(545) DEFAULT NULL,
  `secuencia1` varchar(45) DEFAULT NULL,
  `secuencia2` varchar(45) DEFAULT NULL,
  `secuencia3` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `Cajas_Codigo` int(11) NOT NULL,
  `Cajas_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `NombreReal` (`NombreReal`),
  UNIQUE KEY `nombreSof` (`nombreSoft`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `equipos` */

insert  into `equipos`(`Codigo`,`NombreReal`,`nombreSoft`,`Ubicacion`,`Descripcion`,`usuario`,`responsable`,`serie`,`secuencia1`,`secuencia2`,`secuencia3`,`ip`,`Cajas_Codigo`,`Cajas_nombre`) values (20,'DESKTOP-OQEODUI','ventas ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'192.168.56.1',1,'CAJA GENERAL');

/*Table structure for table `facturas` */

DROP TABLE IF EXISTS `facturas`;

CREATE TABLE `facturas` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) DEFAULT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Clientes_codigo` int(100) NOT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '0',
  `fechain` varchar(45) DEFAULT NULL,
  `calveAcceso` varchar(100) DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '0',
  `DescripcionElectronica` varchar(100) DEFAULT NULL,
  `autorizado` int(1) NOT NULL DEFAULT '0',
  `establecimiento` varchar(10) DEFAULT NULL,
  `ptoEmision` varchar(10) DEFAULT NULL,
  `secfactura` varchar(10) DEFAULT NULL,
  `formaPago` varchar(50) DEFAULT NULL,
  `efectivo` double DEFAULT NULL,
  `cambio` double DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_Factura_Clientes1_idx` (`Clientes_codigo`),
  KEY `fk_Factura_usuarios1_idx` (`Usuarios_Codigo`),
  CONSTRAINT `fk_Factura_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `facturas` */

insert  into `facturas`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`,`autorizado`,`establecimiento`,`ptoEmision`,`secfactura`,`formaPago`,`efectivo`,`cambio`) values (1,'2018-04-08','2018-04-08 23:58:24','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000002',0,'2018-04-08 00:00:00','0804201801172223996700110010010000000020018794116',0,NULL,0,'001','001','000000002','EFECTIVO',3,1.3),(2,'2018-04-09','2018-04-09 00:00:14','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000003',0,'2018-04-09 00:00:00','0904201801172223996700110010010000000030018794116',0,NULL,0,'001','001','000000003','EFECTIVO',2,0.3),(3,'2018-04-09','2018-04-09 12:01:14','12.0','1.61','13.39','0.00','15.00','4.41','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000004',0,'2018-04-09 00:00:00','0904201801172223996700110010010000000040018794111',0,NULL,0,'001','001','000000004','EFECTIVO',21,6),(4,'2018-04-09','2018-04-09 12:03:10','12.0','1.79','14.91','0.00','16.70','4.61','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000005',0,'2018-04-09 00:00:00','0904201801172223996700110010010000000050018794117',0,NULL,0,'001','001','000000005','EFECTIVO',17,0.3),(5,'2018-04-09','2018-04-09 12:09:55','12.0','1.61','13.39','0.00','15.00','4.41','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000006',0,'2018-04-09 00:00:00','0904201801172223996700110010010000000060018794112',0,NULL,0,'001','001','000000006','EFECTIVO',20,5),(6,'2018-04-11','2018-04-11 16:27:17','12.0','0.54','4.46','0.00','5.00','3.5','FACTURA','0.00',16,4,'DESKTOP-OQEODUI','001-001-000000009',0,'2018-04-11 00:00:00','1104201801172223996700110010010000000090018794116',0,NULL,0,'001','001','000000009','EFECTIVO',6,1),(7,'2018-04-12','2018-04-12 14:12:55','12.0','1.93','16.07','0.00','18.00','6.42','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000010',0,'2018-04-12 00:00:00','1204201801172223996700110010010000000100018794116',0,NULL,0,'001','001','000000010','EFECTIVO',20,2),(8,'2018-04-12','2018-04-13 00:00:47','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000011',0,'2018-04-12 00:00:00','1204201801172223996700110010010000000110018794111',0,NULL,0,'001','001','000000011','EFECTIVO',2,0.3),(9,'2018-04-13','2018-04-13 00:07:46','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000012',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000120018794111',0,NULL,0,'001','001','000000012','EFECTIVO',2,0.3),(10,'2018-04-13','2018-04-13 00:17:19','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000013',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000130018794117',0,NULL,0,'001','001','000000013','EFECTIVO',3,0),(11,'2018-04-13','2018-04-13 07:42:22','12.0','1.61','13.39','0.00','15.00','4.41','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000014',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000140018794112',0,NULL,0,'001','001','000000014','EFECTIVO',20,5),(12,'2018-04-13','2018-04-13 07:45:23','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000015',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000150018794118',0,NULL,0,'001','001','000000015','EFECTIVO',3,0),(13,'2018-04-13','2018-04-13 08:03:15','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000016',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000160018794113',0,NULL,0,'001','001','000000016','EFECTIVO',2,0.3),(14,'2018-04-13','2018-04-13 08:08:17','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000017',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000170018794119',0,NULL,0,'001','001','000000017','EFECTIVO',3,0),(15,'2018-04-13','2018-04-13 14:41:18','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000018',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000180018794114',0,NULL,0,'001','001','000000018','EFECTIVO',3,0),(16,'2018-04-13','2018-04-13 15:26:14','12.0','0.38','3.12','0.00','3.50','0.81','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000019',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000190018794111',0,NULL,0,'001','001','000000019','EFECTIVO',4,0.5),(17,'2018-04-13','2018-04-13 15:46:51','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','001-001-000000020',0,'2018-04-13 00:00:00','1304201801172223996700110010010000000200018794115',0,NULL,0,'001','001','000000020','EFECTIVO',3,1.3);

/*Table structure for table `formaspagoc` */

DROP TABLE IF EXISTS `formaspagoc`;

CREATE TABLE `formaspagoc` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `formaspagoc` */

insert  into `formaspagoc`(`codigo`,`FormaPago`,`descripcion`) values (1,'EFECTIVO',NULL),(2,'CREDITO',NULL),(3,'TRANSFERENCIA',NULL),(4,'MIXTO',NULL);

/*Table structure for table `formaspagov` */

DROP TABLE IF EXISTS `formaspagov`;

CREATE TABLE `formaspagov` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `formaspagov` */

insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (1,'EFECTIVO',NULL),(2,'CREDITO',NULL),(3,'TRANSFERENCIA',NULL),(4,'MIXTO',NULL);

/*Table structure for table `kardex` */

DROP TABLE IF EXISTS `kardex`;

CREATE TABLE `kardex` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `fechaevento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bodega` varchar(45) DEFAULT NULL,
  `detalle` varchar(300) DEFAULT NULL,
  `incantidad` varchar(45) DEFAULT NULL,
  `incosto` varchar(45) DEFAULT NULL,
  `inpvp` varchar(45) DEFAULT NULL,
  `outcantidad` varchar(45) DEFAULT NULL,
  `outcosto` varchar(45) DEFAULT NULL,
  `outpvp` varchar(45) DEFAULT NULL,
  `saldocantidad` varchar(45) DEFAULT NULL,
  `saldocosto` varchar(45) DEFAULT NULL,
  `saldopvp` varchar(45) DEFAULT NULL,
  `productos_Codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_KARDEX_productos1_idx` (`productos_Codigo`),
  CONSTRAINT `fk_KARDEX_productos1` FOREIGN KEY (`productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `kardex` */

insert  into `kardex`(`codigo`,`fecha`,`fechaevento`,`bodega`,`detalle`,`incantidad`,`incosto`,`inpvp`,`outcantidad`,`outcosto`,`outpvp`,`saldocantidad`,`saldocosto`,`saldopvp`,`productos_Codigo`) values (16,'2018-03-15','2018-03-15 21:49:50','1','INVENTARIO INICIAL IMPORTADO ','0.0','1.50','1.7','0',NULL,NULL,'0.0','1.8','3.5',36),(17,'2018-03-15','2018-03-15 21:49:51','1','INVENTARIO INICIAL IMPORTADO ','12.0','2.69','3.5','0',NULL,NULL,'12.0','','',37),(18,'2018-03-15','2018-03-15 21:49:51','1','INVENTARIO INICIAL IMPORTADO ','1.0','10.59','15.0','0',NULL,NULL,'1.0','17.0','',38),(19,'2018-03-15','2018-03-15 21:52:22','3','INGRESO -- Factura 001-001-002255632','10','2.69','3.5','0',NULL,NULL,NULL,NULL,NULL,37),(20,'2018-03-15','2018-03-15 21:53:23','3','INGRESO -- Factura 001-001-002255632','10','10.59','15.0','0',NULL,NULL,NULL,NULL,NULL,38),(21,'2018-03-15','2018-03-15 21:53:24','3','INGRESO -- Factura 001-001-002255632','20','2.69','3.5','0',NULL,NULL,NULL,NULL,NULL,37),(22,'2018-03-15','2018-03-15 21:53:24','3','INGRESO -- Factura 001-001-002255632','25','1.50','1.7','0',NULL,NULL,NULL,NULL,NULL,36),(23,'2018-04-08','2018-04-08 12:48:17','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(24,'2018-04-08','2018-04-08 12:55:44','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(25,'2018-04-08','2018-04-08 12:57:19','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(26,'2018-04-08','2018-04-08 22:01:48','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(27,'2018-04-08','2018-04-08 22:04:08','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(28,'2018-04-08','2018-04-08 22:08:02','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(29,'2018-04-08','2018-04-08 22:13:58','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(30,'2018-04-08','2018-04-08 22:19:18','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(31,'2018-04-08','2018-04-08 22:20:36','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'10','10.59','15.0',NULL,NULL,NULL,38),(32,'2018-04-08','2018-04-08 22:22:34','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'25','10.59','15.0',NULL,NULL,NULL,38),(33,'2018-04-08','2018-04-08 22:23:25','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'35','10.59','15.0',NULL,NULL,NULL,38),(34,'2018-04-08','2018-04-08 22:23:54','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'10','1.50','1.7',NULL,NULL,NULL,36),(35,'2018-04-08','2018-04-08 22:25:51','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(36,'2018-04-08','2018-04-08 22:25:52','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','2.69','3.5',NULL,NULL,NULL,37),(37,'2018-04-08','2018-04-08 22:30:44','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(38,'2018-04-08','2018-04-08 22:30:45','1','SALIDA -- TICKET 000000001','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(39,'2018-04-08','2018-04-08 22:50:06','1','SALIDA -- TICKET 000000002','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(40,'2018-04-08','2018-04-08 22:50:27','1','SALIDA -- TICKET 000000003','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(41,'2018-04-08','2018-04-08 22:56:48','1','SALIDA -- TICKET 000000004','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(42,'2018-04-08','2018-04-08 23:46:56','1','SALIDA -- TICKET 000000005','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(43,'2018-04-08','2018-04-08 23:46:57','1','SALIDA -- TICKET 000000005','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(44,'2018-04-08','2018-04-08 23:52:32','1','SALIDA -- TICKET 000000006','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(45,'2018-04-08','2018-04-08 23:52:33','1','SALIDA -- TICKET 000000006','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(46,'2018-04-08','2018-04-08 23:57:43','1','SALIDA -- TICKET 000000007','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(47,'2018-04-08','2018-04-08 23:57:44','1','SALIDA -- TICKET 000000007','0',NULL,NULL,'1','2.69','3.5',NULL,NULL,NULL,37),(48,'2018-04-08','2018-04-08 23:58:25','1','SALIDA -- FACTURA 001-001-000000002','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(49,'2018-04-09','2018-04-09 00:00:14','1','SALIDA -- FACTURA 001-001-000000003','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(50,'2018-04-09','2018-04-09 12:00:29','1','SALIDA -- TICKET 000000008','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(51,'2018-04-09','2018-04-09 12:01:14','1','SALIDA -- FACTURA 001-001-000000004','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(52,'2018-04-09','2018-04-09 12:03:11','1','SALIDA -- FACTURA 001-001-000000005','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(53,'2018-04-09','2018-04-09 12:03:11','1','SALIDA -- FACTURA 001-001-000000005','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(54,'2018-04-09','2018-04-09 12:09:55','1','SALIDA -- FACTURA 001-001-000000006','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(55,'2018-04-09','2018-04-09 17:53:43','1','SALIDA -- TICKET 000000010','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(56,'2018-04-11','2018-04-11 16:25:40','1','INGRESO -- Factura 001-002-0000002','10','1.50','2','0',NULL,NULL,NULL,NULL,NULL,36),(57,'2018-04-11','2018-04-11 16:27:17','1','SALIDA -- FACTURA 001-001-000000009','0',NULL,NULL,'1','1.50','5',NULL,NULL,NULL,36),(58,'2018-04-12','2018-04-12 14:11:25','1','SALIDA -- TICKET 000000012','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(59,'2018-04-12','2018-04-12 14:12:56','1','SALIDA -- FACTURA 001-001-000000010','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(60,'2018-04-12','2018-04-12 14:12:56','1','SALIDA -- FACTURA 001-001-000000010','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(61,'2018-04-12','2018-04-12 14:45:31','1','SALIDA -- TICKET 000000014','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(62,'2018-04-12','2018-04-12 15:14:42','1','SALIDA -- TICKET 000000015','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(63,'2018-04-12','2018-04-12 15:25:30','1','SALIDA -- TICKET 000000016','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(64,'2018-04-12','2018-04-12 15:25:30','1','SALIDA -- TICKET 000000016','0',NULL,NULL,'1','5','8,50',NULL,NULL,NULL,40),(65,'2018-04-12','2018-04-12 15:25:30','1','SALIDA -- TICKET 000000016','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(66,'2018-04-12','2018-04-12 17:13:23','1','SALIDA -- TICKET 000000017','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(67,'2018-04-12','2018-04-12 17:15:50','1','SALIDA -- TICKET 000000018','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(68,'2018-04-12','2018-04-12 17:15:50','1','SALIDA -- TICKET 000000018','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(69,'2018-04-12','2018-04-12 17:15:50','1','SALIDA -- TICKET 000000018','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(70,'2018-04-12','2018-04-12 17:15:50','1','SALIDA -- TICKET 000000018','0',NULL,NULL,'1','5','8,50',NULL,NULL,NULL,40),(71,'2018-04-12','2018-04-12 23:57:52','1','SALIDA -- TICKET 000000019','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(72,'2018-04-12','2018-04-12 23:57:52','1','SALIDA -- TICKET 000000019','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(73,'2018-04-12','2018-04-12 23:57:52','1','SALIDA -- TICKET 000000019','0',NULL,NULL,'1','5','8,50',NULL,NULL,NULL,40),(74,'2018-04-12','2018-04-12 23:57:53','1','SALIDA -- TICKET 000000019','0',NULL,NULL,'1','2.69','3.5',NULL,NULL,NULL,37),(75,'2018-04-12','2018-04-12 23:57:53','1','SALIDA -- TICKET 000000019','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(76,'2018-04-12','2018-04-12 23:58:49','1','SALIDA -- TICKET 000000020','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(77,'2018-04-12','2018-04-12 23:58:49','1','SALIDA -- TICKET 000000020','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(78,'2018-04-12','2018-04-12 23:58:49','1','SALIDA -- TICKET 000000020','0',NULL,NULL,'1','5','8,50',NULL,NULL,NULL,40),(79,'2018-04-12','2018-04-12 23:58:49','1','SALIDA -- TICKET 000000020','0',NULL,NULL,'1','2.69','3.5',NULL,NULL,NULL,37),(80,'2018-04-12','2018-04-13 00:00:47','1','SALIDA -- FACTURA 001-001-000000011','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(81,'2018-04-13','2018-04-13 00:07:29','1','SALIDA -- TICKET 000000022','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(82,'2018-04-13','2018-04-13 00:07:46','1','SALIDA -- FACTURA 001-001-000000012','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(83,'2018-04-13','2018-04-13 00:13:13','1','SALIDA -- TICKET 000000024','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(84,'2018-04-13','2018-04-13 00:17:19','1','SALIDA -- FACTURA 001-001-000000013','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(85,'2018-04-13','2018-04-13 07:39:02','1','SALIDA -- TICKET 000000026','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(86,'2018-04-13','2018-04-13 07:41:54','1','SALIDA -- TICKET 000000027','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(87,'2018-04-13','2018-04-13 07:42:23','1','SALIDA -- FACTURA 001-001-000000014','0',NULL,NULL,'1','10.59','15.0',NULL,NULL,NULL,38),(88,'2018-04-13','2018-04-13 07:45:24','1','SALIDA -- FACTURA 001-001-000000015','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(89,'2018-04-13','2018-04-13 08:02:59','1','SALIDA -- TICKET 000000030','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(90,'2018-04-13','2018-04-13 08:03:15','1','SALIDA -- FACTURA 001-001-000000016','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(91,'2018-04-13','2018-04-13 08:07:46','1','SALIDA -- TICKET 000000032','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(92,'2018-04-13','2018-04-13 08:08:18','1','SALIDA -- FACTURA 001-001-000000017','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(93,'2018-04-13','2018-04-13 14:40:36','1','SALIDA -- TICKET 000000034','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(94,'2018-04-13','2018-04-13 14:41:18','1','SALIDA -- FACTURA 001-001-000000018','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(95,'2018-04-13','2018-04-13 15:25:58','1','SALIDA -- TICKET 000000036','0',NULL,NULL,'1','0.99','3',NULL,NULL,NULL,39),(96,'2018-04-13','2018-04-13 15:26:14','1','SALIDA -- FACTURA 001-001-000000019','0',NULL,NULL,'1','2.69','3.5',NULL,NULL,NULL,37),(97,'2018-04-13','2018-04-13 15:46:40','1','SALIDA -- TICKET 000000037','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(98,'2018-04-13','2018-04-13 15:46:52','1','SALIDA -- FACTURA 001-001-000000020','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36),(99,'2018-04-13','2018-04-13 16:21:11','1','SALIDA -- TICKET 000000040','0',NULL,NULL,'1','1.50','1.7',NULL,NULL,NULL,36);

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `evento` varchar(200) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `logs` */

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `marcas` */

insert  into `marcas`(`Codigo`,`Marca`,`Descripcion`) values (1,'DEL VALLE','AUTO'),(2,'GENERAL','AUTO'),(3,'LEXMARK','AUTO'),(4,'TONY','AUTO'),(5,'MR POLLO','AUTO-IMPORTADO'),(6,'DELL','AUTO'),(7,'MIGUEL','AUTO'),(8,'SAPOLIO','AUTO');

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(75) NOT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `modelos` */

insert  into `modelos`(`Codigo`,`Modelo`,`Descripcion`,`Marcas_Codigo`) values (1,'JUGOS DE FRUTA','AUTO',1),(2,'GENERAL','AUTO',2),(3,'LACTEOS','AUTO',4),(4,'CARNES','AUTO-IMPORTADAO',5),(5,'INSPIRON','AUTO',6),(6,'GETIAL','AUTO',7),(7,'AROMATIZANTE','AUTO',8);

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `codigo` int(200) NOT NULL AUTO_INCREMENT,
  `Permiso` varchar(45) NOT NULL,
  `Tipos_Usuarios_codigo` int(100) NOT NULL,
  PRIMARY KEY (`codigo`,`Tipos_Usuarios_codigo`),
  KEY `fk_Permisos_Tipos_de Usuarios_idx` (`Tipos_Usuarios_codigo`),
  CONSTRAINT `fk_Permisos_Tipos_de Usuarios` FOREIGN KEY (`Tipos_Usuarios_codigo`) REFERENCES `tipos_usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permisos` */

/*Table structure for table `plan` */

DROP TABLE IF EXISTS `plan`;

CREATE TABLE `plan` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) DEFAULT NULL,
  `cuenta` varchar(200) DEFAULT NULL,
  `id1` varchar(45) DEFAULT NULL,
  `id2` varchar(45) DEFAULT NULL,
  `id3` varchar(45) DEFAULT NULL,
  `debe` double DEFAULT NULL,
  `haber` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `descripcion` varchar(405) DEFAULT NULL,
  `plan_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_plan_plan_idx` (`plan_codigo`),
  CONSTRAINT `fk_plan_plan` FOREIGN KEY (`plan_codigo`) REFERENCES `plan` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plan` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `producto` varchar(145) NOT NULL,
  `codigoAlterno` varchar(45) DEFAULT NULL,
  `codigoBarras` varchar(45) DEFAULT NULL,
  `base` double DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `impuesto` varchar(20) DEFAULT NULL,
  `iva12` double DEFAULT NULL,
  `iva14` double DEFAULT NULL,
  `iva0` double DEFAULT NULL,
  `ice` double DEFAULT NULL,
  `ProductoOServicio` int(11) DEFAULT NULL,
  `costoConIVA` double DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `pvp` varchar(45) DEFAULT NULL,
  `cantidad` int(45) DEFAULT NULL,
  `unidades` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `observacion` varchar(245) DEFAULT NULL,
  `minimo` varchar(45) DEFAULT NULL,
  `maximo` varchar(45) DEFAULT NULL,
  `garantia` varchar(245) DEFAULT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `imagen` longblob,
  `Modelos_Codigo` int(100) NOT NULL,
  `Modelos_Marcas_Codigo` int(100) NOT NULL,
  `b1` varchar(45) DEFAULT '0',
  `b2` varchar(45) DEFAULT '0',
  `b3` varchar(45) DEFAULT '0',
  `b4` varchar(45) DEFAULT '0',
  `b5` varchar(45) DEFAULT '0',
  `b6` varchar(45) DEFAULT '0',
  `b7` varchar(45) DEFAULT '0',
  `b8` varchar(45) DEFAULT '0',
  `b9` varchar(45) DEFAULT '0',
  `b10` varchar(45) DEFAULT '0',
  `b11` varchar(45) DEFAULT '0',
  `b12` varchar(45) DEFAULT '0',
  `b13` varchar(45) DEFAULT '0',
  `b14` varchar(45) DEFAULT '0',
  `b16` varchar(45) DEFAULT '0',
  `b17` varchar(45) DEFAULT '0',
  `b18` varchar(45) DEFAULT '0',
  `b19` varchar(45) DEFAULT '0',
  `b20` varchar(45) DEFAULT '0',
  `p1` double DEFAULT '0',
  `p2` double DEFAULT '0',
  `p3` double DEFAULT '0',
  `p4` double DEFAULT '0',
  `p5` double DEFAULT '0',
  `p6` double DEFAULT '0',
  `p7` double DEFAULT '0',
  `p9` double DEFAULT '0',
  `p10` double DEFAULT '0',
  PRIMARY KEY (`Codigo`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`),
  UNIQUE KEY `producto` (`producto`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

insert  into `productos`(`Codigo`,`producto`,`codigoAlterno`,`codigoBarras`,`base`,`costo`,`impuesto`,`iva12`,`iva14`,`iva0`,`ice`,`ProductoOServicio`,`costoConIVA`,`utilidad`,`pvp`,`cantidad`,`unidades`,`ubicacion`,`observacion`,`minimo`,`maximo`,`garantia`,`serie`,`imagen`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`,`b1`,`b2`,`b3`,`b4`,`b5`,`b6`,`b7`,`b8`,`b9`,`b10`,`b11`,`b12`,`b13`,`b14`,`b16`,`b17`,`b18`,`b19`,`b20`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p9`,`p10`) values (36,'LECHE CONDENSADA','111475.0','1.23123131313E11',1.34,'1.50','IVA 12.0',0.16,NULL,0,NULL,1,NULL,'0.20','1.7',-33,'SIXPACK',NULL,'1 - Predeterminada del prodcuto LECHE CONDENSADA desde el archivo de importacion',NULL,NULL,NULL,NULL,NULL,3,4,'-31','0','25','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',20,33.33,133.33,0,0,0,0,0,0),(37,'YOGURT TONY','CA-5589','1.23123123123E11',2.4,'2.69','IVA 12.0',0.29,NULL,0,NULL,1,NULL,'0.81','3.5',-4,'',NULL,'1 - Predeterminada del prodcuto YOGURT TONY desde el archivo de importacion',NULL,NULL,NULL,NULL,NULL,3,4,'7','0','30','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',-100,-100,-100,0,0,0,0,0,0),(38,'MR POLLO 3 LIBRAS','MP23','3.21313123E8',10.59,'10.59','IVA 0',0,NULL,0,NULL,1,NULL,'4.41','15.0',-81,'FUNDA',NULL,'1 - Predeterminada del prodcuto MR POLLO 3 LIBRAS desde el archivo de importacion',NULL,NULL,NULL,NULL,NULL,4,5,'-85','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',60.53,-100,-100,0,0,0,0,0,0),(39,'MIGUEL GETIAL EL PILASDE LA CASA','','113094631956',0.88,'0.99','IVA 12',0.11,NULL,0,NULL,1,NULL,'203,03','3',-11,'UNIDADES',' ,  ,  ,  , ','','','','SIN GARANTIA',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿþ\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 75\nÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0LÂ\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0å…<SE8WŠ}RÑKLBR\ZZCH¦\Zy¦šE\r¥Å¥ bŠx¦\nx ÒÓiÔCM4ãÒ˜hBi”ãIV!H´ÁOZ‰Vž)‹O 8RÓih\04†”ši¤1))M%\0”´”JJZm!Ž¢š)Â˜‡ŠZh§P!)\r:šhÓEIŒpéN¦Ž”á@M4êi 4”\Z)ôÁO	´‚–™!E´J)h ¥£´\0P(¥¤0´Q@ÂšiM!¤mLj{u¨Ú˜ÈÚ£5#Tf‚„¢Š)¢X£­-–­°¢ŠZd1;ÒâŠZ¢XQE-T‹Ö£\"Ô²Ña*ÂUd«	R2qA¤¦µDÝjV¨›­0#=*&©MFÕq&D\rP=NÕÖ±0‘ZJ§/z¹%T–¶FLË¹ïYS÷­kšÊœu­àa3=úš„Ôî9¨HæµFM¢—`Ó„¤Å?“\\,6ŠSIL¢Š(\0¢Š(\0¢Š(QE\0™¥¢ŠQOUÍ\ZWŠ6Ôë{T‚éRäm\Z-•1F*Ñ€úTm(R	Qh‚Šq\\SjŒZ°QE(¥Å ¢—”€(¢”qÛ4ÀZyB*Í‚Æò‘Ñ	+0ÎO¥lM¥XÃ`™%Õî1ÇÊÆ½³Žôœ¬4ŽpŠLTÒ£#ÊWØŠˆÐQEÅ`¢ŒQŠ@%¥¢€ŒRÒ@ì&(ÅH4ï.•ÊQ!Å1Ž£+EÄâ6Š\rÅ`¢Š(\0¥¢@Ð´QE\"‚’–Šbž¨M¹5¡ijd`\0©”¬8Æä0Û=+R×Mg#å­7F.GË]e‡‡Éäý+†®\"Û”è®§)k¤>ZÓLÀûµÛA ír¤“HÚ¿v¼ê˜†Îêj(â\ZÇhéU&¶\0+®º±ØËX—pí¦[gE“G+wn\0<VÌx&º‹Ð\05Ï]“^	3ÏÄA0j:žZ„×z<É	IKEP„¢–’Q@‚Š( Š( Š( Š(¤ES\0£´P;	E-„¢Š(QE\0QE\0´ f€*Ìï\"¥»•Å†ç¥kÙém&>Z»¥éfR¿-wšG‡÷ÊWZöØê§O«9k=°elÁ >åz—‡€QòV¢è`/Ü¯>¥Y³¦.1<ÌèÅGÝª³iÛGÝ¯O¸ÑÀv°/ôÍ üµÎêI=N¸N,óË›\\gŠÄ¼ƒâ»]B×a<W1~˜ÍuP›aV)£—¸LTœ`Ö•×SYÒu¯Z›Ðò*«2*JSEjs‰ES\0¢Š(\0¢Š(QE\0f–’Š-QHŠ( ŠZ1@	E.( aV MÄTÖ´¬cÜàTIÙvmé>c¯éZ»oË\\ç‡lƒ2q^µ¡X\0«Åyudå+Ÿ\n,éºBª¯Ë[ÑiªÝ«¶–ÁTqZ®.ŽyUf3iã+>ïNOÕ†*¬ð§ŠU0ÊÁ\n­3Íu];¾Zàõ{]…¸¯bÕmFâ¼ÓÄ6ûwq\\J²=\nUn3Ô>RkväÖþ­Ãµss7&½jCš¼µ sL¥\'šJë8ØSÑriƒ­YrÂ“cH½eldaÅvš6“¼¯ËXú5žö^+Ô¼=¥‚å¯:½MlŽÈ%rÆ‘¡\rªv×[i£*¨ùkCMÓÂ¢üµ½\r¨P8¬#EËs9Õ0—KP>íG6š0~Zê<éPËnéU,.„Æ³¹ÁßiøŠåum„ñ^›j6ž+‰Ö`Ú\Z¸gIÅôk\\óëñ·5Ëê\rÖº}]¶³W7Ìy®Ì4u§¡HžM\\ËÍèòœç¡Ž´ñMêòÏU‹KIKL@i¦œi¦ÈÚšiç¥0ÐPQI@¤…<S<P…- ¥ @iN4Æ¦„0ÒRšmR$QR-F*E¡ §Š`§Š@--%€))OJJ„4”¦’€\nm-%!¡\r%¢Š)Âš)Â1ÂMêÓN¦š4ÑE†8S…0SÅšiÔÓ@†šJSIHcÅ8t¦\nxéLLx§\nh§\nd±hRÐ ¢Š)(¢Š\0)i( QIE\nCKÚÒTmR5FÔTf¤4ÊcJ(¥H–Â–KTfÂŠ(ª%‡zZ( ‘h¢Š`\"Ôb¤Z–R\'J°•Y*Ìu#\'¦‘iM!j…ªv¨\Z˜šcSÏJªÑ2\"jêv¨µ‰„ŠÒU9jä•RQZ£&f\\÷¬©Ç&µîZË™y5¼Ldg¸æ£òÉ«~^OJµ“9éTæ‘*\r™«=ªe´oJé-tbøùkZ/’>åa,JFñ p¦Ñ±Ò¡{r;W¡KáòÜý+&óE(ÉJ8”Å*ÈEFEl]Ø´däVd‘í®¨É3šQ±\r´•¡EP ¢Š(\0¢Š(QE(\rUÉ«0Å¸ô¨â\\‘Z¶äŽ+\Z“²;ðÔyØCižÕml¸éWííøUÑ\0ÇJá}O¥¡µ0^ÏÚ©MmŽÕÓÉ\0ÇJÎ¹„sÅ:u‰Ä`cmjXðj¹5©s	¬÷ß	]5ˆ¥ÊÈ©hÅ.*Î;	E-%\0˜¥¢€”cŒÒRPÃ0àŠÒÓ5ýGDý›rð™>ñë>\ZÊ­*n@y_Zµx‰,ùƒjBÃ*…¾è¡]^\\_]Iqs+K4‡,ìrI¨\\T¦8Ö5>`cžTv­ít©4™g–æX/ÄQÊ¿Ôö¤Ý‚×2h§£íGRÝßÒƒˆÖM§ct4Ä2—S¹ f—oÅ\0GF)Åi´\0¸§ªÓ*U¤ÊDŠµ Jjš\ZÍ›Å!Œ•­Y5P˜IH¦ÔÖ£=kTs°¢Š(´RQš:ŠJ(Å¥šmIÉ¤«h·0®»EÓ<Æ_–°ô«}ò+Óü5¦†*v×yô:©ÆÊæ®‹¡•®ÒËEUQòÕ­#OUEùk¥‚Ô*Ž+‘Rr	Õ±„ºR÷jµÎ˜6Ÿ–ºï c¥VžØ<RžAF»¹æú–Ÿ€x®/T·Ùž+ÖuKAµ¸¯:×àÚŠäön2;éVº<óQ;s\\ÝÓrk Õ›ijåîæ5êáã¡Ïˆ™RC“Q\Z{i•Ü=°¢Š*‰\n(¢…QHAE.(Åa(¢ŠÁEP!(¥¢˜	KIK@ÂŠ( aEPQEQE\0´‚”P2H×&·t»O1×ŠÈ·\\°®ÓÃö»Ýx®zÒ²7¥³¬ðö‘»aÛ^™¤é*¨¿-cxnÄ_–½ÂØ*+‚1çf³´#·ÓÕT|µgìkŽ• ‘€:Sö{WJ ¬só³\nâÄx®wSÓÆÓÅw2F¬mFÜ<W-jÚ•V™äzÕ¦ÍÜWª®ÒÕë>!·\07å:èÚÍYP¤w:—‰É]7Ìk=ÎM[ºo˜Õ\"kØ‚ÐójJìmQZ‰ESQE\0QE\0QE\0QE-\0QE \nZJ)ŒZ(¢…QH§ZÙÓ2­c\'ZÚÒÛ­eWcZ{ž£áx)ÅzÞ¼W“ø^A”¯ZÑœlZò×ÆtUØé \\(«\0T·ËSƒÅzPµŽ)‹‘SÅC!âœ¶aêh\n5y—‰c^½7Sp«Ì|M(ÚõæTK˜í¢Ï&Ö¸v®^n¦º]ió#W11ä×¡AhEg©	¢ŠL×AÎ9zÕûEËŠ ½kFËïŠ™ì\\7;ÏÀ“ŠõïÛ\0‹ÅyW†ˆÜ•ì\Z6%y3ÖgT¾®³ˆV‚/V×E]Zï¤•Ž)=Cm1×Š–˜õ«Ze^Æ\nšáuô[Šï¯HÚkñ€¯^ux«tdy>¿&×záoeËžk°ñŸ;×tÙs]hh]i‘o÷¢¡ÍÙc–çª\nZAK^!î±E-%-\0ÓN4ÓHh©†ži†‰š)\r-0)Â˜:ÓÅ!´ÑN B\ZŒÓÍ0ÓBi¹¥4•dŽ\"Ôc­H´˜\nx¦Šu Š(¤Hi{Ò\Z4ÒRšJ\0)\r-! hm%-%!Š)â™N	êh§PHii\r\02Š(¤RSÅ0S…\0:šii\r\04ÒRšm\08\Zt¨ÅH()Âš)â™\"ÒÒ\nZQE\n(¢E´\0Rw¥¢ˆi\r)¦šCÕSÍ1¨¦\Z{S\r¥QVˆbÒÒRŠ¢\0RÑ@¦HRÒw¥¦HQE\0S×­2œ´™H°•b:¬•b:C,­)¦­:ˆž¡jª¦MÒ¢j•ºTMV‰‘T/S\Z…ëX˜È­%T—½\\’ªKÞµ‰“3®ZÎtËVœã9ªëç­/dgk‘ÛZoqÅu\ZVæòÔ:UŽ÷W¢èzH!~Zä­Qì¢”UÊºo‡Á)úWC€»~à®OÓUT|µ±’Ò¹Õ7\"%ZÇ\r6€»OÉX\Z—‡ÀS„ý+Öd²R:VMþš¬‡å¡Óq­sÀufï’¸›ëS+ÝüA¤®Æ;kÊµÛŒÜWV«½˜TJJçëƒL«7	µVï^’w8ÚŠ(ª$(¢Š\0(¢Š\0)ËÖ›NZL¤[€|Õ·f£ŠÄ€àÖÅ¤˜ÅrÖ=ŒI›ÐŠ²1Š¡¼u«\"N+Í’w>ª•EaïŒVuÈàÕ·“Š¡rü\ZºkS:õ)‘t5—\'SZr¨$gŸJÍ/ÏL×§M;#Œ¨œ´#\"Šqæãu­>âš\\qÒŽ†Øæ˜®\"\"±;œ\'M4‘ÚžË„Î£ à\Z@%bŒS)h¤\0\rŒœ“N íŽzNô†H\nlårÝŽzUÌ4Ð4P³yHõb9ÅPíŠÕÐµ»ù.­Ò7tÈ¡—žø4ŸôêT‡Ë1´o³ò¶z¥X‚Ø:²žÞ¾´–ó	ï¥–ß.ãšÑ7‘Ç¥À~Ï’9rîz¸=8¤ïÐŒ‹ëilî\Z	âh¥P2­î2åUpHÎ8¥¯_K©jR]Ê»I\n¸Ï@\0²ùÅ5°1A©WëPz•ÇQM…ÇƒƒŠxzcwzÓwb¦Å©n¦1¦î¦³R±NC­2”šJ´dØQIFh$Z(¤Í0Š(¤1jhGÌ*õ<xReGs«Ðc\r\"×°ø^Üm^+È¼>ÃÌZö_8Ú•çVøŽÅðž‰§D+]ŠÌÓÈØ+UÑI+sÜvÚ†Eâ§¨¤<\ZÒIX”`êq^gâUÂ½zv¦ÀFÕæ(m~kÌ©ÌvÑlò}m°í\\¬íÉ®“[|ÈÕÌJ~jôh/tÎ³ÔˆÒQA®ƒ˜))h4Ä%-%-\nZJZC\n(¢…Q@„¢Š(QE\0QE\0QE\0QEÀJ)h ˜¥¢‚”RRŠ‹Öcæè^@Y+Ï-+Ð<5(•ÉˆØê¤{?‡£Z×oj (®Ã³\Zs]Õ£‚‚±¢ÑKê8§S¸§f»NqŒ8¬Ëð6\ZÒv5‘¨J\Zç¬Õ!¹Áx\r^;â‡jõŸ\\\r¯Íx÷ˆ&Ý#W-y—´NFäüÆª\Z±9Ë\Z¯^¬v8¤õ\nJZJdQ@Q@Q@Q@Q@-%-\0QE\n(¢€\nZJ(ÊpkRÂM²-eVmäÚÂ¢jèÒÌõ/\rÞ…dæ½kC½šùûF¿òÝy¯MÐuå«Ê«\\ìø‘ì¶·”sW–@EqZ~¬¬£æ­¸µ#ïV°¯c–TÙ¶dVâpªyª¨®>õe_jªª~j\'_@63W½\nÍyg‰/ƒoæ·õ½hmoš¼Ï[Ô÷–ù«\'9q*9ÍRmÒ75‡!É«wSnbsTXä×«N6G%I]4QEjf(«Ö†@Uˆ[TÉ]©è~¹\nÉÍz÷‡îÁDæ¼G¼òÝy¯Pðþ¬\0Qº¼ªÑå•ÎµïDö{)QÍi+ñ\\f™©«\"üÕÐC|¤kjUUŽYÁÜÕÝQ»€*¯Ú×j­ÅòªžkYVV!AŒÔ\'5ç>%¼~k¢ÕõUUoš¼ÇÄZ®âÃurJ\\ò:éÆÚœf¿>éšãçl±­RçÌ‘¹¬9&½\n1²2«+±”RQ[ž¬)Ô‚”W†{âÒÑE\0!¦šq¦šC#4ÃOja cM(¤4¢˜ñLñ@´‚–j3O4ÃT„Æ\ZJSH*‰*E¨ÅJ´˜\nu4S©\0¢”ô¤ š\0)´êm ÒRšJ†Š\rIKHi)â˜)Â1âŸMêÓN¦š4ÑA¤¤1E<S)Ã¥Hii\r\00ÒS6€T‚£õ Dƒ­:˜)ôÉ)i¢œ(QE\0RÒRÒcŠJZ\0(¤ šEi§¥8Ó\Z€\Zj6§šcP1†›Þœi´Ð1)h¥«Fl;Ð(¢™ÑEÄÃ½-%-2E¤¥¤ œ´ÚrÒe\"d«	U–¬%HË+O¨ÔÔ”cTSµBÔÀ…ª&©Z£n•H™µDõ+T/[DÆEwª²Õ§ª²ô5ª2eG4¶ñåÅ,½jK_¾)Ëa-Î·A¶ËÅz†‰j¯ç~Æå¯QÑ±±k‰ë!Ôz¬ (â®ªT0}ÑVGJí¦•Ž)1Œ•Næ TñWÉª·å55°EœV»lmÅy‰­‚³ñ^Ó­‘åµyŠË×¦uÇcË/“l†³ZÕÔ~ù¬£Ö½ˆlrÏq´QEh@QE( RÐ0¥”\nC,FØ5~	¶‘Íe©ÅL’YÊ7:hÕqfü7XÇ5h]æ¹Å¸#¡¡®Xÿ\0Ísº=8f(éùÍgß]ùs†#Š£i4÷a$OÐU	™ž^X±ÏRj©Ð³ÔÏ˜¹BÑ¢K‡ùrIêi&E…¼°Á˜}â*Ä‚[X6à¦á}j…t£Çnã–VBvœd`Ó;ÔÑ&HèZ0y÷¨,HéL@Ý}©cÎìÓžhœR‚@¦®-$iP›\'Íåçý…kZøxø†9nì!„9ùä ì£ð®O5vÃR»Óäßkq$Gý–Æj\\_A§ÜÚÖ¼5Œ¶©mtÓ	oãî¿u¬)á{9J²àƒƒ‘RZí¤F36U÷Žz\Z›V¿:Õÿ\0›+XÀÚ½ð94’kpvèR‚ÒK©|¸×ç<L’ÞHÇÌ¥NpAê+kÃw6ßjqu\"Æás0à‘ØÒë\Z‚kæâLG€\0:Å;»Ø,­s®1Æ)81ŸQZ±Ûˆî\\W‹‚ŒSéNñý•qÄÛ •C‚;dg_[ŠZ]¤W·F)&Œd{ûT2³ÝH#nˆ÷8pEHIäôÄaÀ#¨5=Ìë3!\\…\0j¨m¬JÒ¨ßž	Ç&€-_\\Ç<Ìb„EUsÜ\0	üjŸðŠò}\r%Ãx£9<\nhúÓãr™ÀŒr(Ä,eŽi·˜e*F=ª%\'­X›÷‘#(è\Z+HMÐ’–’‚BŠ(¦EPKIE\0-KÃTTå84™HêtYöJµëž½\0/5áöì×¡øwTØWæ¯?jvSwV=óL¹ƒšÝŽ@EyÎ«‹óWWm¨©QóTS­c)ÓfùqŠ¯4 )ª&ýqÖ¨^jJª~j¹×V!Sd\Z½Ð·5å^\'¼8Íu:æ®·Í^[¯ê[Ë|ÕÍÎGTcÊŽSV›tÍ`¹É«×“osYìy¯Vš²9j;±´QEhdQE–Š)Œ)i(¤ÑIš(Å¤ÍP ¢Š(\0¢Š(\0¢Š(\0¢ŠJ`-&h¢€Ñš( ¢’–Š(Ì\r†×hW{y®-µôû£k\Z°º7§+3Þ<9©\r‰óW¢i÷¡s^¡k>^ßš½I×EùëÎ»ƒ6œy‘êQÎëR†+·Ö”¨ùªËk·ïÖª¾†“7\'º\n:×9«jQ¾j§{­¨SóW­kÃÖ3¨å¢5…;þ$ÔÜ7W–ê÷;änkoZÕLŒß5q×sïcÍtáéÛQÕ••Š’œµGJÇ4•ÞŽF%QA!EPES\0¢Š)\0QE\0QEÀ(¢Š@-RS-QHaES\0§«`Ó)E!šV·%`×U¥k2¿5pÊä\Z·\rÑL`Ö))Ó©cØôßm/ú×C‰ÑûÏÖ¼BÛUtÇÍZqë¬Þ?pKú*qg¯ÉâA·ýgëXš‡ˆòõ¯=}yˆûçóª\ZÃ¾~cJ8i=Ãž(ßÕ5²û¾oÖ¹ÛÃ#jïÉùª‹ÈXõ®êTTL*U¸Hù5ÍÒ‘ÎØQE)ÊØ4Ú\0+[‚Œ9®·HÕÌe~jáðjõ½ÑB0kž­%#zs±íZWˆp«—ýk©µñ\n•=xEž®Éš·-õöP>Ö¸%FIètû²= ëë·ïþµyâƒó×™6>ÿ\0ëT®uö`~Ö¥S“X£ªÖ5ýÁ€Ö¸[T23|ÕVóUi3óV÷ÉæºèÐ¶¬ÎuÑ\r¸˜»j©9¥fÉ¦f»R±ÈÝÅ¢“4S°XáH)ExGÐ‹EP!\r4Ó4ÒS\r=©†‚„ QH)ˆx§Š`§\n\0x¥¦Ž´´\0†£4óL4Ð˜ÃET@ñR-F*E¤ÆH)Âš)i\0ê)3KHšii\r\04ÒRšJ\0(¢’‚””´”†ñL§Š\0x§SGJZ-4ÒÒ\Z\0m6M ¤:œ:S9i\0ñHh Ð!¦›Ji(¢ž:S=iˆx§ö¦\nj	RŠAK@Eb€\nZ))\0´¦RÐ1))i)\0”Æ§SMcLjy¨Í\04ÒRšCM	€¥¤¢­±h¢–™!ESB–S©’\'jJSÒÐ0§-2ž)\r-XJ®¦§J’‹*jJ…\rL#t¨Z¦j‰©ˆªéSµBÝ*™T/S5BÝ+X˜Èê¬êÔ•R^õ´L™J^´@øqI9ª¢]¯VÕÑ7Ôîô ®¼×§è—`¢ó^¥ßùn9¯BÐõ€ÕÃR..åµÌ^µœÕÕ“Šã¬5Ue5lG¨©z®lŽYA›- ÇZ¡u8\nyª²j*ZÄÔueT?5MJ·`Ê:õà·5ä~$»_šêõýdaº¼ÃZ¿ó†iPƒ”®nýØœýëîsYÇ­X÷1ªæ½x«#ŽOQ(¢–¬Å¢Š\0(¢Š@´”´\r\0¥Í%ã·ÒœÔu \0|p\rqñy±©db¥†2)ƒålút¡›qcÓ=ªÔBÞhÐU”|Ç=h$ŠI<Ò2X×&™s\"I+: OE©¤ìrJFr:P„’<b1‹ü#ùÔdñÅI\rÄ¶Ûü¦Ú]J“íPÐIEÄõ‚Xžœb™E\0.NsR#¹S†õj1ŽôòÀ±`û\n\0DÊ°eÚsVï¥K‰ÖxÕSxË\"Œ=ñP(¤Ö’MªÇ!9^F1Š\0¸¦)`œý¥€ˆ-ñ\ncK4Ñùd—D^„òRé@b9A¥aÜô¦óÞšBI4Äär™ëƒÁ\0õ¦Ñ@Àõã¥”ïJ ¢§¸¶km¡Ù0Ý…9À¨pA bäŽ*í…ïÙY²ŠÊ}ET	”Ý‘ô£8Z[‚2”äpß0úTxÏJÉ¹1\'&£Æ(¦›N4†	ES\0¢Š(QE)E%-\0X†B¬+ Ó5k™bŠµ•Hs#XNÇ¬é\ZùM£ë]}ŸˆÆÑó×†ÚêM>c[6úë(ûõçTÃ»èvFq{žÎ|D6ýÿ\0Ö²¯üD6œ=y±ñcïÕ+m˜š³T$ÙWŠ:-_\\.ç®#Q¾2±æ¢ºÔ\ZLüÕ™,¥wQ£ÊsÔ©}†ÈûCJM%u¤s6QE\n(¢€\n(¢€\n(¢€\n(¢€\n)(¦!h¤¢€ŠJ(\0¢Š(\0¢Š(QE\0QE\0RÒQ@E%\0¢§ŠB§­AJ\r&†™»e¨4D|ÕÔéÚû ?ë^z’«Q]²÷®z”TáVÇ­Ûxœ…?ëV›ÅoúÏÖ¼š=MÔ}êê²cï\ZæxSojB½ñ)`~Ö¹mGZi3ó×=. íüF©Ép[½i:DÊ¯bÍÕÙ‘ŽMg;dÐÌM0×\\ccšR¸RRÒb¬€¢Š(QE\0QE\0QE\0QE\0QE.(\0¤Å-€)1KE0\n(¢…Q@Q@86)´\nC¹*ÊEH\'>µ^ŠV\Z‘`Î}i†Rj*(å0âÙ¦ÒfŠv&áš(¢QL4´”´)êÄS(¤4Ë)9êÂÝ°ïYù¥\rPâ™jm\ZloïTOtÇ½RÞiRPCsdÏ1=êÙ¤Í%ZFm†h¢Šd…QLY¢’”W‚}´QEÓM8Ó\r!Œja§µFh”\n(Æ<S…4S…Ji-\0Æ\Za§ša¦‰chP*‰*E¨ÅJ)1êh§R\0¢–ŠBÒÓ{S†’–’!¢Š\nBR\ZZ)Jp¦Ó…\0H)i¢A i\r-! cM7½)¦š‡\np¦´ñHc…A \ZJSÖ’€OZe=iˆ’Ú˜*A@…¢S…\nZJZ\0(¢Š@–’–‰Hii¦!\r0ÓÏJŒÐ1¦˜iÍL4CIAëER%…-U™±h¤¥ AKIÞ”u¦!@¥¤êbÓM8ÓM\0%8u¦ÒŠCD«S!¨¦SHe„52š®¦¦5SûS\Z˜ˆ^ j°õ]ê‘,…ªéRµDÕ¬LdA%T—½Zz«/C[DÉ”.;Öd­ƒZW=\rdÎy5´Q”™47F6ë]›¬˜Èù«Œi6štwl‡ƒJt”…\Z–=Oñ&Ð>zÞ‡ÄÃoß¯ƒVtÇÍWÓ^p>ñ®IaŸCNx³×§ñ0Ú~zçõ/nS‡ýk€“]r>ñ¬ëUß?5Â¾ êEz®²dÏÍ\\¥ÝÉ‘4É®™Éæª3d×u:J&©pc“L¢ŠÝ…-%-\0QE\0QJ)\0QE))i(\0§,„)^ÔÊ)ˆ\\õ¡X«dRSÕ2rN(ö*ÃpëéH0ÝúRù™EjàôäÔlw(NÜpN}é´ô‰ž@ƒ\0“Ôž*xÒ,ìvä²Œ“ô \nÅH4¡	 UèíÐ£Ês´tæ‹,ÎóJv¬i•\\u=…+…Š^^\'¥GV$,~SŒžH	”ÀJU#¡üé0E9\0Þ7Žô\0»ô¦žqN`ÈQZ\06ÈÈ¦®7ôïRË3LˆÉ(»WØTT\08éEÃvqžqRL\"3¸ƒw•Ÿ—\\{ÐxÅ§Ò’‚ã<Ô‘©bp3ŽO°¨éØeÈéë@‰dW½@$µ$ ³ OAÚ˜¥·‡?6ëÍ]p%·’we» ©¬X¤`âëL?t\nîý(Î#æ˜œ¶)Ì˜Ps×µF‡æ¥-“@i\r.sE E)¤¦ ¢ŠJ\0Z(¢Q@Ç\nPqM¥¤4ÉB*U¸#½VÍ¤âR‘oíMëLiÉïUóFir¡ó1ìäÓ	¤¢ªÄ¶QE1Q@Q@‚Š( aEPEP!\r¦’€\n(¢€\n(¢€\n(¢…QŠ\0(¥¢€ŠZ((¢Š\0(¢Š\0Z(¢iA¤¢Çï4o4Ê(°î;q4™¤ Ñ`\n(¢˜‚Š( ’–Š%bŒP;-P ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QÒ–ŠQE\0%Q@‚Š( Š( Š( –Š)(¢Š\0(¢Š\0(¢Š\0J(ïE1Q@Q@²)ÔÑN¯ú ¢Š(\r1©æ˜i\0Æ¨ÍHÕ¦1´¢’”P1Âž)‚ž(ÂƒÒŠ\ri¦œi¦©Ä¢’–™#ÅH*1R\nLŠu4S©ZCE„ÓJi)ŒCIJi((¢ŠE!(¢Š¢’”Râœ:SE8P ¦š}0ÐM4Ó6‚\nx¦\nx Ðh¢†\Zi§ša bŠzÔbž´ÀT‚£ñÒ‚G\n}4RŠ-Š \n(4PKIÚŠC\nCKM4FéQš{S\rÔÃN4ÃLïEU\"´fŠ*ˆ\nZ(\0w¥¢Šd±Â–’–i†žzÓ\r0ÒŠm(¤4Jµ*Ô+R­&Q:ÔÊjºÔÊi—µ4ÒƒHiˆ…Å@õaúUwH–Wz…úTÏP½jŒd@ýê¤½\rZ~õVZÚ&,Ï¸èk&ã½k\\t5“qÞ·”Ìù5lTÒõªí[#/˜E/œ}j*LÓ°®Lf>´Ã!4ÌÒQa\\Ri(¢˜‚Š( –Š(QE(¤E(Ò’ŠèWèzS(4P ¥D.NNM%(b\0ži…Ä¤¥?J(zx\'Ò˜\r8>E\09]ámË€zr)ÑÆ¨s·=é±°a¸zU’è¬%ÜZLäÑiˆ£4ûåÉÀ¬.-@yœƒÆj#rF6€£©#©üi®CBdf9\'\0\n\0Õ´·»½‰ãŸ¼€½fHQ\'iä“ÔÓ­˜¸e$ˆÀùÈ<Óne†YÈÊ‰xEÎxõ4­¨,Ög \n^öW\n„ã\0Uk¨£ŽUŽ3’ûŽ´Ä¹ò‘U@Ê’sÞ£.Ò};Ó°\r•H9a‚i#;>b2=(–W‘²ç&š™=ø¦\"BåJ·=8¤–S+3‘Ëœt¨ÏŒ¯J\0e%=FOBqM4\0ƒ¯4ã€NÞ³B&öÆ@ïš1ž((Çâ?†¥(â$®ð=é‰P–\0rOARËŽFLä¯ûÔ±DÐ«\\±hù}Éªä’wu-É 	T[w–Á±V’ìzÕV^©÷­d”.‹(’<»QÏjL„¡s÷G|TnNÐ¿_igbØ`CŸ0©%¾µžßxæš9¥c¸î\0¥ ëNUã4Ä6–‚1IHh\r6M=iƒ\nNÔw¢EPE¢€\n(¢€\n(¢…Q@Q@Q@\'zZ(\0¢Š(QE(¢Š\0(¢Ð ¢Š(\0¢Š(\0¢—µ%\0´QAAEPEPEP ¢Š((¥¤ ¢Š(QE(¢Š\0)i)hQE€J)M%1Q@Q@Q@Q@Q@Q@Q@‚Š( Š( aEPKE(¢Š@QE\0”´PQEÄ´\n)(¢Š\0(¢ŠQE\0QE\0QE½w¢˜‚”RRÐEP3Ö:š)ÕàŸBQE Ó\r<Ó\rÕSÚ˜iŒi¥‡­À}8S<RáA Ph¦šiÆ˜zU\"X”¢’–¨‘â¤©Kâ–RŠCŠ)h¦ÒÒPM%)¤ aIKIHaIGj(S…4S… )Ã¥0Sè\Zi§SM\04ÓOZq¦šáL§\nH:RÓA§R¦™N4Ã@NÊx (§-0SÅ2I(¦Šp¤!h¢—½0\nJSÖ’\0¢E Ò\ZSM=(Òi†œi†‚†ša§\Za¦€)i)jÑ›\n¨ÈŠ( ¥¤¥Ð…¥ RÐ!†šiÆ˜i€RŠm( h•jQQ-H*J%SR©¨©TÒph4ÐiÔÉ#n•^N•eª»Ž*‘,ªõÕ‡ªïZÄÆDU$«OUd­¢bÊ\rdÜw­kŽõ•qÞ·‰ŒŒÙzÕv«õªÍÞ¶Fa¤¥4•D…Q@Q@‚Š( bÒÒRÒ()h&€9ëé@\n[hÀ¨É©ŽÅOï9ü…C@	@ QRCù‘IÆâ\0 CJàâ…éZ—º{ZC!;~VÚ{Õ	áhÖ<‘œzPÀ€œš( Sèãi	3“ô¤âJ\r ã#œR)Û@	Þž£wz½w>”Ú=œ6–“%ú’ngyr¯èöª*|¶Œ¯qëH•”ÈvýÞÔÜðyü)‰QØP4À¾ÈÂ	ëïLPIéM\'4åb¼÷ 	¤‡l+\"ƒŽœ÷4\"9‡@9>õrÖQ¦Ï=Ó¹‘GîP3êj].ßípÈŒÈ¤Œï~Â¦ã2Ù0€÷4ÎqŠµp›Wz{Ó®-ü¨•€ã¥;…Šª3œœSÆçÛ\ZŒöô…Ay<¶8­oìñm\Z2¨rq\'Œg¡46	nQlWÉ…‰®%aÓè+>µ.MåZ@£9ù¿ˆŸéU. ò&xœ¦Tã+Ò„†5ÞÁ{Và³Y„î~ìC·­1ª«×¡=@«±1È°¨ 3êÆ†Á„}Kp\\TåIœEŒ²¯P)‹ 2n™ïQÜL²\"…õ÷ ;	$}™O\0úv­(mÁ°ËdFÝ7õ”:ÕÆ½¸’Þfra‹;W°Í\r&“aµ·…å|šÐž˜màW‘3Ô÷¨\ZÚ&µµ)“ã\"Œàö=˜–MFÞÍ%X¶³±ÅMÊD\Z…Œ¢ñá8F@7g¢ûVCÆvOÓÞµ5ÉZYÓy >Fr}sÞ²þùË¶=é¢X¦÷Çz™ád Ži€ˆ_÷o¸‘×aƒH³å˜ôô¦ä!ŽVgÚÊQýê«V®—h_a­UÇ šiôÓLBQE\0QE\0QE\0´QE\n(¢‚‚Š( Š( Š( Š( Š( Š( Š( ÒÒ\ZQE\0QE\0-Q@ÂŠ( aEPE´\0QE€Š( ’–ŠÀÒRÒP!h¢Š\0(RÐ0¢Š)(¢Š\0(¢Š\0J(¢˜-%-\0†–ÐEP ¢Š(\0¢Š(\0¢Š(QE(¢ŠQE\0-\n(\0¢Š)\0QE(¢ŠbÐ(¢ERQE(¢Š\0(¢Š\0(¢Š\0(¢Š\'z(¢˜‚–’Š\0Z)3E=dS©¢^	ôEP1¦šiÆ˜i\rja§µ0ÓÃÖ–Š)€áNÑN„:ƒE˜\r4ÓN4Úh†%(¤¥D ¨Ö¤#)Âš)E EP1))i¦€ÓiÆšh\0 ÑA ¤%QH`)E%(¤Å:š)ÔÄ-4Ó©\rC\r4Ó4Ò))Â›J( §SE:4ÃR\Za ÓÅ2ž´Á’\nx¦-<PHñNÑNu(¦ÒŠ\0SIKE ŠZJ@!¦”óLj\nC\r0ÓÍFhÓM§\ZmRKH)j‘›EµD…QR1iE%(ªáJi( ‘†˜iæ˜iˆLÓ…2œ()­H*5©K(x©Ô\"ž\r \'SRf¡SRL@j;ÔÆ¡’©Ê’Uw«2Ug­be\"»ÕY*ÓÕY;ÖÑ1eŽõ•qÞµgèk*ã½m²Žj»w«2õªÍ[£‘šJSITHQE\0QE)i)h´P(¤P«Öœ±À¦¨ËëS1À*ŸO© Ømi¬1ŠáÚáQÃ\ZK‚ÉÏA€1@ÇQVò#š9‘OîØŸZ«ŒW_-	#Žh¿m=½ý´Ð2¡3L]¥?Ã\\ÕÔ­$§pä¾µ,WMà7ÞÅVo¾OZIXmÜŽ”™¤=sEQ NZŽ´¸ã4íŒª0àÐ^jEË©Aõ*yªÇ 2Žž´Ï»‚4,V“O’D›–1—ÇaPUÆºò¦I­Âv€Ëœ‚{ÕV}ìÌ@œñ@\r¢ŠQÖ€$RÒa3ÆsW’C¢#w@*¼òC¸,)´*œòN9?$nK\nLfõ¥’”¹Õn³Œ•AÈöp°¤ù’BÐ“¸D vÕk‹’ÅTòŒf«vC¤ã4’eùu(Žxü¸ÐåTäÕ“qÛ±ºye¼fÇ–\nÍ‚0¿¼g)ÁjXbV†IüÀ¬½õ4™™;*÷ÇZ®@8ù²}é­!9æš§“šv$ž&eÈ?xãëR&×…€à÷¨dí-€iêÄB@ÀÀçÞ‘ÇAL§B‘ëH\0ñÖ˜„ÍJŽB•ù¸5j)ˆÐ°¸KiÃ•‡\0ú\ZC9k‰Ž\\¶IªYÀã­H®¡»¾•6*ä÷Èü»zð*¦pÜÔÍn½ª¾i¡Ç9©’B¾õ\0\'­=_Ã»PŽù!s•ÅFF3H\r<—4¦šwZ1H«\r¤§â“\nÃqE;˜ ,%´SQE0\n(íE\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nCKHhQE\0QE\0´QE\n(¢…Q@E%€Z)( ¤£4SQE\0QE(¢Š\0(ÍP1h¢ŠQE \n(¢€\nJ3E0\n(¢€ÑE\0QE\n(¢€\n(¢Qš\0(¢Š\0(¢Š\n\n(¢€\n\\ÒQ@ÖŠJZ\0(¢Š@™¥4”À(¢Š(¢’–ÂŠ(¦0¢Š)(¤Í ¢’Š\03ESQE\0QE\0QEë#­:š)kÁ>„Z(¢4ÃO4ÃHhcTmOja¦€mŠ0)â˜)Â¤4Pi‰4ÓN4Ú¢RŠJQLCÅH*1R\n‘Ž¥‚”RÔRRÐ1))M%\04ÒRšJ\0J\rè\Z\n(¤5%@¤¥ §v¦\nx BÓii\r\Zi¦œi¦‚”¢’”P1âÚš)Ô€i¦\Zy¦š`%(¦Ó…\0H´ñQ­H($x§\nh§\n8QE\0´´”´€))i¦ˆiÖžj3HcZ˜ÔãLj4ÒPi*‘,Z(¢­±h¤¢›ê)-HÅ¥¤¥ªáA Ph$cTdÓÚ£&˜	žiëQÓÖ¢e©F½*ARP´ ÓM\0ÐÊj@j5(4	’f¢~ôüÓ\Z©ÊÒwªÏVž«8­be\"³ÕY{Õ·j¬µ´LYŸqÐÖUÇzÖ¸èk*àu­¢c32^µYªÌ½j³Vèçdf’”ÒUQE\0QE\0´”á@ŠR0phÈ«\n±=¼ÌÙ2\06Æ‘B|«q&AßÓÖ‹c²xÜ¨`pzVÎÆ‡ËØŠ6ŒÖ ¶n—{aŸ¯µ dI	ïÉ\" QçJF:Ž*Í×–Ò3ª•$äÀUxË›#èI¡	XÌ®‘¡ØíàT¬L8‘ƒíN½´kfSÛ¹t¥hâm=ŽÖ3†É9è)€Ëxc”²—*Ì§gO¥WLyªîç¥µœA<2ÜÃê3EÙW¹–DUØ¾‚Êž\\Í`{S1Î)ò«\r™¿:@	\\€Iš`[°Ž..3å“ómëŠ·uœi¶Ý¦óË Ç®j­¼m¿( î^>µsR•\'·ŽHÛ¶EKÜ¥±VÛcÈÐÌÆRŽ0{\ZÏe*ÅOZVÊà‚pzPd,ÛÞõ¦‰\rÙM§µ!Çjäç™¦R®I Œ\Z(\0©Ë¬p„S¹›’}=ª½\0µe\'l#b\\)Ê¡è©ª´´!v•¹4ç$3·¥FŠNHíJX˜ÆI ¾òM!àâd‘î)gM’:zúÐÿ\0&ÀiPÍÄ­zä‰b* Ï=ò*¤$r¯ØcÖ¡BTCKm9ïJÀ6N\0bš“ÀÍI ÏÍëNæØÈ­ÊœLˆàSisÆ)\0(¥…Æáž”¯Ç;P–!@íœÔc“JrE\'J\0qÆ:÷¤ëIGJ`=NÉ=ªÅÌrE±d]­·80ê;Ò¼Œä–$ŸSIÝiûiª8Ô£¥Cf‘C6ÓJÔ½©¦•Ê±)1RRNâh”ò)¦ÈhJLS±IL›%Š`QE\0f’Š\0Z)( ¢’Š\0Z))h\0¢Š(\0¢Š(\0¤4´”(¢Š\0(¢Š\0;ÒÒQ@Ð´QE\0QE\0QE\n(¢€\n(¢Q@Q@‚Š( aEP0¥¤¢E%\0´”QLŠ( Š( Š( AEPEP ¤¢Š\0(¢Š\0)i( ¢Š(QE\0QE\0RÒQ@Å¢’Š\0(¢ŠQE\0´”´†QE\0%QLAEPE¢RPÒQE\0QE\0¢Š(Ö…-4\Z\\×‚}¹¢ŠCH\0Ó\r8Ó\rC\Z˜iíL4Æ6E˜‡\np¦ŠQ@¢ŠC@˜†›Ji\rQ)Â›Niˆx§Š`§ŠLc…(¤¥ --%\0\ZJ\r%Òv¥4†€›N¦ÐR’Š*F¢›J) §ŠŒSÅ’M4€i¦\Zq¦š„§\nm(¤Q ¥¦Ž”ê˜iæ˜i€ÚQHiE\0Hµ ¨–¥8SÅ1iâJ):€\n(¢!¥4†5§µ0Ð1†˜M8Ó\r\0%”µH–w¢Š´C\nZ)(bBÒÒ\nZ‘‹N¤¥BM4êi ’6¨˜ÔQ\Z \n‘j!R¥ DËR\n*ARËIJi´\0ðj@jiàÐÀÓM 4TˆdOUÜU‡¨V‘1‘UÅU—½\\qU%kh˜ÈÏ¸èk*ã½k\\+&ã½o	’õª­V¥êj«VèÁŒ4Úq¦ÕQE\0QE\0à)´áÖ€·9©­cüäþ5	9*Í 	™\0ã†M\"æ<| ¡ÇÖ’+pÍ‚ÃÔ‘UÙ™wç£µjÕJÌˆFwŽ™Å.ƒD{·M÷W®{Š‰SÍ/Ž	4¹ÔœjcŠB¹ê0qLF…¬Ÿm’ÚÉÙUŒ±íVo-â´¸¹šŽ¥½ýk-Õb‘B¾G\\ŽÕigÍ›£Œ†9\rèiXi™G­8¾åÁ¤q†<æ›TI<Ä\Z9ÉUíR€b„\\FGUsÍO\rÏ•m4;Aó1ÉíHú,sÝÞ­”*\ZYsådãæª’Kó6rF^œÔv—’Ù^Áu–¤v æ›q+Os$Ï÷¤bÇ¦‹j;„¸(\nôî*\ZRI”Ä-%PõäÑIKŽ3@	KE“@HYãy\0ùS¯4Ð7t¥9ÙíBätâ€&‡fÇRó÷qÞ£Ø¸<0íH=E,Œç¹ë@Ñ²…ÊãpÈúR,0y4ð¬é»wÝìi›xÍ!ØWå#ð u£ýhÇ<Ó¸X±µJ¤g¨& /Ç>ô£wNÔÖ<R\rÅ©32A$víBF\\c\\vy£dÓ™JñŠ@	ÀÁÇµ‡ÉØÂôÌO­8ªç‚qCÑôÅa”åÇS×ÞPM\08œui;ÓÈÞ@Îieà}®0qž9 Nµ.ìŠ®3ž)êrzÔ´h˜ýÔ„Ò\ZLÒ±Wš3MÍ-p¤4´™¦!¸¢–Ša)´úm2l%QLBQE(¢Š\0(¢Š´”´\0QE\0QE\0R\ZZC@‚Š( Š( Š( Š( –’Š\0ZJ( Š( Š( ¢’Š\0Z(¢€–’–€\n(¢…Q@ÂŠ( Š( AEPEP0¢Š(\0¢Š(RQE\n(¢€\n(¢€\n(¢€\n(¢€\nZJZ‚Š( aEPEPEP ¢Š(E”´†QA ¢ŽôS(¢Š	\n(¢€\n(¢€\n(¢€\n(¢Q@¬­OÍWV©¯\nÇÑ¢\Z)CM4ãL4\r4ÃO4Ã@\r¥P)€áNÑN\0êCKHhBc\r\ZCTCS…0SÅ1ñLñIŒu(¤¢¤RQE\0!¤¥¤ b\ZNô¦’€ÓiM% ¤¥4”†%(¢@\nx¨ÅH(êCKHh3M4ãM4†„¥ÚQ@ÇŠx¨Å<R\04ÓN4Ó@\r4¢ÒŠ`=jAQŠPHñNÁOu(¦Ó…\0-QH\0Ò\ZZC@Æ5FzTQµÔÃÖžÔÃ@\r¥¢Š´CŠ(ªDQC\ZKIKH\np¦Šp BÓM:˜ÔÉ#n•TQ\Z¡H•J”1¢téRŠ*QPX†™O4Ã@	OSQÓ 	A¥Í0\Z\\Õ\"X×¨š¤cQµi¤ª²÷«oU%ï[DÂF}ÇCY=ë^~†²n{Öñ1‘—/zªÝêÔÝê«ÖèÁŒ¦šu4ÕQE\0QE\0å¦ÒŠ\0{¹ÍMü¾Y\'i<â¡ÆGÒ¤…ˆ`­\"‡HÀ=¨,K¯SŽ:Ñ0c9\0[§ÿ\0-‘dÊHœ€GZ2ãvåR£ÐÒ\\gR ŽÝéZC(%ºÔ‘Áê(\0l‚	©R|[´[G\'9¦œ<|ŒÆ¡éLC‰ã¥6Š(sFi(ï@ÚŠ3F	¦QKE –ƒ‚xQ@3KÚœÇ\"Ÿäœgµ+\"ô¸8ÍKä9]ÁNßZ–(RA´çpô¥ÌŠQdr1H2ÈéVÒÙ–m‘ž™5Í©·R’D|Þ¹ìE.u{ìÝ®Sdó	p@ïŠcFGãV!¶2¡#¦yö«Ñé.ÐyÉ eqÏÖ¥Í-Ç\ZNFF\n¦œÒp8>µ¡uï#a.¥Hú|’Â^B±)Eè~Éô3?Þœf¬ÏbV(Á8¨Ö2‡,	Õm.U¢4M´úQ&ú1]JinyÍ6{vÊ°äVõœÆÎ4ñ$}w³ô«Q[Zê3ÈéŠ1´ö¬Ý[3UAIyœÔE™<¥@rrxæ®¢·r¨Ä³ #=zÔ´Ò•­Œ‘¿$HäŠÍ¸…íd‘K«s€ØæŽu\'dÉÅjR|r¸Éõ©\rœ¢4!H\rÜš¹n±d‡æN~õoÃkm\"§˜¤qS:Ü¥ÃÏ©ÈÉdÑgžEWhqžý«®»€y©²Ótkü^µ—si+3¼h6Ÿn”áZû“<=¶0Œxêhe\nqœÖ„–,©–9b3ÅUÔï[©¦sJ›D È”ÊÌ»I\'ÒžU˜6…†jH<¦GL±8Êg?UÌì@¤ÆÙÇZvTŒcÖ‰1Ÿ•·åMO¼22(NGRbžXýÞÃ¥4Ž(ÆQ“KŠJ\nÑE&hisM¥¤Ò\Z( ¤¥¤¦KŠZJb\n(¢RÐ1)h¢€\n(¢€\n(¢€\nCKI@‚Š( Š( Š( Š( Š( Š( Š)(h¢Š\0(¢Š\0(¢Š\0(¢Š\0Z)( ¢’Š\0\\ÑIE¸´QE\0QE\0QE\n)i(\0¢Š(RRÒP ¢Š(\0¢Š(QE(¢Š\0)i( hZ(¢…Q@Q@Q@‚Š( –’–€\nJZ\rÒÒP ¢Š(QE\0QE\0QE\0QE-\0%´P=)¬+V|rU¤zñ\Z>…2Ð4ê‰ZŸš’€ÓM)4Òii¦\Zq54ÀZ74 ÐÅ8S§Š@:ÑHj‘,i¤¥4•D°ñLñ@‡Šx¦\nx¤Æ8RŠAJ*@Z(ÍJCJi\r\0%!¥¤ cM\Z(\ZÓih¤0 RS¨áO©±âšiE! \Za§µ0Ð1(”¢ÇŠx¦\np \Za§\ZCH\ZLŠ‘zTbž´	’\nx¨Å<PHáJ:ÒRŽ´wz))i)¦”Ò\Z1©Nji dmM§54Ó%QÚ©Å¢ŽôU\"Š)(\ZRŠJQH\np¦Šp –-1©Æ˜ÔÐˆš¢=jV¨Z¤ *T\"¦JÑa:T¢¢J”T!¨ÍHÕ Í\0ÓM¡ 4ìÔ@Òæ©ÇL&‚i„ÖˆÆCªKVžªË[DÆF}ÇCY=ëbã¡¬‹žõ¼L$eÍÔÕV«Su5U«t`Èé´ãMª (¢–€–Š(\03Í-%†L¸(­ŽAæ¥±Æ@õ¨îàÔ‘º‚x<gÒ€	Ûi9ÊñHÓK,€¹ÜÝÉ§E8‰‚H»ãÎN88¤›ÊÜÍà§îƒÔP!Ør9ÖNsÏ½ä6CÖà¯\"˜ƒ9O¦2=éäƒÍh`,½ñ@QR:ÆÈO^¦“š\0J(¥ ¥š]¤\0H ¥š)ê£4®RCp\n~Ì6q*ÂUHc¸žÔä!YNÒÉŸ›¶EK‘j#@H©•P÷©cS/8ÀÏA[ÇdÅš#qùcaÓñ¦É§Ü™˜…D^Ø5‹¨t*:ÂäÇ‘ŒÇ»=)±0Šå¥Œ™£g£Ëy.ù+ÙˆÎê•´Æ±.Ï*2çÅ\'8­\nT¤õcžæ-@G²GEÃsZ‘iñÞÚ‰(2õüj¶™y§\"þúÞA êTu­kk8îK\\™…¯t8÷®YÉ¦uB	«³ëE¹³u¸Ž\"ˆG>†­Ù^My\n¤vc\n¸-ÐqS\\kC›}EÄ$ìXùY*\rAå„™Ä“1ÚvôÛ“ä„”T­½»%ÍÓ‰¸	üArMOtÖ’¤K0u„¶<Ý¼Ó’,ÝFÊí³û»@-[éñºíiƒ&0ªëÐÔÊi4_#hÃŒi™míœKÞi`ý*I µ6¨mâYÙùc`õªwž»]HÃLn2H5¯m£ÏœÂ»fû¬wdêj¤â’i‘ÉèÑŠ5‘B¢S µZ:u€¸ŠIeŒ	$è\0À®ÚøUm¤m JÄ|Å†0}«]`hÕcQ†NÂ¢uc´M)Ó—Ú9èô©mØ5±m§†JŽ]ebd_sõ®¨E•;=x¨Z$ë\"ð½Ç­eíYº¤Œ7ÑD‘E±BqÖ™%ŒŠŠ…Ê¶p8®’Aòà¯Nj¨¦•YÎÕt\ZJ«ê_³Fd¶Ž±mãï\ZÆžÎñä’Wr¨=;×b`NNsQKb6ÈÈn)Â«DÊ’’8CjøÚïŒ÷õ¥·€ÄZÞhƒ£†Eu-dŒ ìÎ9àTOf€ä¼w­Õ{œïq×6@Jê\0éš¥‡”Î=k¯–Î\0YœrÜ\Z¥u¤©8‡—Œç×D+®§%\\+ÝÃ)\'!H¥*Wõ¥ufÐúíúU)!1…<’{WLf™Ç*n/QŒ\0\rœŽx¤´«œäŽ;ŠsaòçŠ£2&R)1VˆfŒdp;â aÏJDh¥<i(QE%4RRÐ0¤¥¢	E¢˜‚Š( Š( Š( Š( Š( ÒÒ\ZQE\0QE\0QE\0QE\0QE\0è£½\0QE\0QE\0QE(¢ŠQE\0QE\0QE\0QE\0´”PÑIK@QABŠCJ(4\0”QE\nJZJQE\0QE\0QE\n(¢…Q@E%-\0QE\n(¢€\n)( ¢Š(\0¥¤¢IE))i)ˆ(¢ŠQE\0QE\0RÑ@´R) ¢—P;Â=YŽJ *TzòZ=´Í4|Ô¡ª„rÔâ_zÍ¢Ó,–¦¨L£Ö¢i…£¹;=F_Þ«´þõŸÞšˆs÷ûÓƒûÕ?Þœ³ûÓå24ª@ÕEf©ÖJN#¹g4Q§n©°…¤£4U(§\nh§\n\0x§Š`§Š–1ÂMê@-”P\0i\r-! b””´†€ÒRšm ¤¢ŽôŠ\nQIJ(Âž)‚ž(%Ž¤4PhÃL5!¨Í!´¢’”RáO)‚œ(Ý©JZCHšAJi;ÓÂ¤ZŒSÖ\nx¦\nrÐHêQIJ(ÂŠ(†ÓN¦š\0a¦\Zq¦\Z4Ó\r8ÓM4&QEZ!‹E%-2B’–’ÅïKIJ(ÔáM¥¦KÓ\r<ô¦\ZDÕëRµDzÕL•ëS%h°•\'j*Z‚†7J‰ªV¨Z€\Zi3A¢˜ÅÍ¦Òfš%ŠM74MÍi)Æ«ÉS1¨$ï[DÂEú\ZÉ¹ïZÓô5“sÞ·‰„Œ©ºšªÕjn¦ªµnŽvDi)OZJ¢BŠ( –RÐJ)PdÑ´Ò­7<ÑILã ÔáJ¨Üã5[8§†\'ð B’AÎ 9;°})0G&€Ww#4\0˜Ãa²(ÇŠvòÇ“ô¦´ûÐ`úQN`éŒž£µ3½\0´ž”ý€†Éï@ÐÁOÚqx§$[—vqVm­Vlåöc¹-¤TbÙU#,jÜvÐàù“Àé¶¤[}¤„ýêå­½«7áÀùT.AúÖr™¼)÷m§Ã0«¢ãŽù5n]*â;u’à¤q¸ŸÄÔÈî¢YØ¥q³îï\\–üªýˆ»7ku~àÆNH9üc9Ks¢DW·µkX“pî 3\Z½mK´ŠóJÝ\0è•mìŒ—¤G3ÈØ\nµ·i£C\nˆ¤lÈy&¹gTë…;	e‰L0®:ã4ËxÚä«ÍnFHdWéŠÒ¾¶óo­ì¡ˆyyÜçÔ\nº–ß#Êîí‘À›¨’5TÊW6‘G7žÛˆÈ\n¸±f–mjõ­-ªŒöâ»Km=Z-îVLŒëPÍ¤)–3\"0ISƒQ\nª;•*|Ú#›²ð¼dŸhPË“ó¦µàÐaKT„£ ä[H˜ŒG¡}jxÆß»×Ö¦uäÇ\ZQŽÈÍM&Ù\'R7e\0Šºö0Êêì»‚zTùÁ;ˆÏ­ˆR`\ZÉÍ²¹HŒ®ï%>b¸ËT)ÇŒ`c­¤ŒÝ©\n“È£˜9H•FNN*@$fÇZ˜©#“‚;ÕgyäíØÑqØ!e##ûÄÒ°Rr½\'–@V-¸žÞ”¿ptûÔÊ ¡äÕb\0æ­HpÃÁïQ»<qNã±1Ã1Jràþ5!P1´Ry`¸,\'ÐÑp#hŽÞ˜ãVX·ƒ¼Œ•|¡äƒùÕv\\ƒši‰£)­AlpÊÞ½ªaØHÆ+PÆƒÓÒ¢’ Ê}kE2i\"WÈtÈÇz¡s¦¬œŽ8­çˆ…ädUSÎTåkxTkcžt“Üå®4éP^}@ª&6Œò85Ø:(Ü ôªwZdn™†º¡_¹ÃSÖ\'>—O/\0 Ç!‚?•G,{vÀî©®ìžÆÒG­Va´ðG­tÅ§ª8¥f0æ™R1È\0ö¦\Z¢FÑKI@QLbÑE€(4PzP!(¢Šb\n(¢Q@Q@ÂŠ( ÒÒP ¢Š(\0¢ŠZ\0J(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢Q@Q@ÂŠ(í@Q@Q@Q@Q@EP0¢Š(\0¢ŠJ\0ZJ( AEPEP ¤¥¢…Q@	KE\0RÒRÐEPIKI@Q@Q@ERQEÀJ(¢Q@RÐRÑE\nZ)iÁEPPQEÙ\Znì\Z‘…BÜW–{Ë&*A6;Õ2Ø¦™)ò‡1q§÷¨ãÞª¼¾õYæ÷«Œ•KçÞ¢75A¦÷¨ŒÞõª¦bêš_h÷§­Ç½dùÇÖž³{ÑìÄ«qÜ{Õ˜ç¬ŸÞ­GqïYÊ™¬j›©6{ÔË&k9ýêÜsV.Êw4SÁª©&je5\rrQOÁO€x§Š`§Š–1ÂM§R\0¢Š)€R\Z(¤1)ZZC@i¦œi´‚’Š)´”¢ñLê	cé\r†i†ži†‚Ê@Ç\nx¦\nx RP)i\0ÃIÞ”ÒSÂž´ÁOx§Ž´ÁN}- ¥ BŠZAJ)\0\Za§\Zié@Æ\ZaéO5P1¦šiM!ªBaEèªFlZJZJb\n(¢Å¥Úp w¥¤êbšzS©¦„&DÕ©Z£5Dˆ*d¨…L”˜Ñ:T©‰Rv©(ª©Ú¡j\0ŒÒRšJc\ni§Ò@ÓM<Ši¤Ld†\Z†N•9¨$­âsÈ¥?CY=ë^~†²n{Öñ0‘•7SU\Z­ÍÞª5nŒ$DzÒRšJ¢Š)h)@Í£4p@$óÚ‚r;Ò\0zÐrii£§zP¤œb†R§­1	ž)A4”š9¸ïL§Üp)1Î	Å\0\nH9\Z9\'š‘a¾bH§ ìÂç ¢ãDXÇSR¢)S’?­:@ŽÌT})„¨<d`R¸XpeŒ¡}š|9o•ïpF(ˆÅŒ¾I€;Õ¸ØM‰¤HQ!À9\'Ò¥³H WTJ#”è1M/4 ¡#€£­2s,ÊªýOç]´Há!¤ˆl\\í\'$þUŒä¢tSƒ‘ŸæÇ§F‚B\ZFäÆqïšÔÓmå¿´œGn°¤ÇišN {\n~›§àý¡íÅÍÃœü*þÐ›yã¶Ø3Üú}rÔ¬–‹s²•õ{¶V0Ø/“l†i;¸ñ«—¬î²2ïtá@Wì­;Žì÷ÅjE#’+’U]îvFšJÅ]>ÛìñpÒ0Ë±ëA)cëODDÅFÉæ|£å õ¬\\®ZBuYžMƒ,xö§yj\"ØÔJäã?“ÜóJã°B‚ÝÀ¦Èï÷TŒSœ3¹+ÆsŽ´ç†5Ž=ŽZN¯‘øR„Mœs‚M!\rÛŠ’DbÈ#Ú˜¹zbE$Ž})åF0F3Å\"68cóf¦\n_ïQp 1láHÅ<Ò‚‡‘‘MXø ·Â€… †`>µ‹ó+Ú¬¬9Éê;S,Žâ‹YA\0¿J6ÿ\06F)åvµBÛ•²[å&˜É6¢ä1\'=3QÃ‘´ýÌã·½ Q÷óÏ÷iÜD*ÄÊÙäqO.ÉÎ8éM †©Œ\0 ý}j6@3îiá¥éŒŒw¦–GŒlÉoâw¦\"Ueë’*2„¨Ê~4ödl.ÖSÞšK>_?Zh ÏOlU	#!°G û]rÇkŽÕ‰ÁËô­\"Ìä®f˜ËúTeF9ƒÐÕâvœªóž*¤$Œï[&bâSš™q´{VUÆ’™ÉàžãµlGjl‘îZÒq1%-ÑÇÜÛ$ ãÖ«•«~öÐäºŸCX²!1ì+ºæG™V—# Áî(ÅXpGÐÔdzŠÒæ$T•#Û4Ã@Q@!¥¤ ’–Šd‰KIE\0-”PEPÑIE\0QE\0QE\0´”PÑEÀ1IKE\0%´PQE€(¢Š\0(¢Š\0(¢Š\0(¢Š\0JZ( Š( Š( Š( Š( Š( –’Š\0ZJ( Š( Š)(h¢Š\0(¢Š\0(¢Š\0(¢Š\0( Q@-%-\0QE\0”´”\0QE\0QE\0´RQ@Q@Q@Q@-PK@¢‘HZ)( aFh¢€4RQ@Ë*»Š´zT2\nò‘í2£Ô,p*y5ô­Q› sUdcV\\Uim	•Ùª\"Õ#Š„Öèå“q¥QQš«rÂÉïS¤Øª!ªE|T¸–¦jG?½]†jÄI1W\"—Þ±”ˆT7b—¥]³X°KZ0É\\³‰Õ\\ÑSR\n¯Têk&hJ)â¢ž\rK)\np¨Á§fÇÒ\Z@hÍ\nJZJ@ÚZJ!¤¥4”„¤¢ŠC”SiA cÅ8S<P&:’”R\Z4Ó\r<÷¦\Z†ÑE%)â£ði ¢\Z\r \Zi)MÀ<SE8P\"ANÁN’”SA¥Ï½Fi¥©¥¨äÓ	¦¦3Ña&£&˜ÒZa’‚ä„ÒT[éwÓH–Éh¦¥¨†>“½&ih\0¢ÑHbŠu4S…\0:–RÓSM:šh%‘ša§µFj„(©’¡2R\Z,\'J’£^•\'j’†5BÕ3T-@È%8ÒS\0£¢Š@0Ši!„V‘3‘\n¯%Zj¯ ­âsH¡0àÖEÍlOÐÖEÏzÞ\'<Œ©»Õ6«“u5M«¡HˆÒS6¨€¥¢”\n„àqEfÇcŽ¿…9cã,ÁGëI¼v^iƒæ>´`ˆ0Ë+ôÛÒ¢ecÈZtqù²\0\0\0u&¤s\ZœF§#©Í!¶cžÔ€óRÉËú\n7“˜ð=©€Þ£Ž1IÞÇZz•Áùi€ D#;‹oì\0â–?•×ëÍ!O“Ž*H¡,‹´f¥±¥qÒªB‹‰;ò@þjfc#¸÷4lË€1žäÔë\0qåª1ojMØµÅ‚Ú9Ü”Ý„\\çxúU¸´Û‰Ëõîs€+[M³U—ËH™bÜÖÅ•°½%Uš8AÀëï\\•+ÛcºŽ\Zú²¾›¦Agk½¢ó$†Å]´ÒâxpcÃË>9>Õ¯\r¹UòÉGj°\0C…É®Ömž„)$´*ÛØÉPTö&­˜2à6	Ï5)i`àc4E>mÛ½`ÛfÉpc®\0T§\0–=…(Œcï\0iê©;ŽsíSq\\\0ÄäñÇµ—ÿ\0JD™@}ÀäŒT{×j–Ÿû½Å ,È˜°\'²Š¨ ÄW\',Ý½)ë#o;sL|.{¹þ#L,[–âi\\)#î…ùG[ñZdn­…Ü3ŒÔà¨Ár>†ZÃ•d®â0Ë4ÕØŽ3Ï*ÎWXzàtZy»E\\ÕœŒn=h°®Æ~GLž‚‘Äq§úÝÍœmª_¶6{®Ú£†ñ¢\rå¬d¿²çôX5#1¶I/Ç¦9„d²·$tÅK1‰-’zâ•\"]¼/½!ú•¼Ì`Š|„ÀôhD„á†1íÖ—ËÜ¤`@\\Î‘\\‘È¤½85u¢eÀ\0êi<’ÃÆ;b˜îf2aÏËO\nc<TíqtÅG\"0!T€\r0¹	…L˜{ÓŒ`®@éÌ\n°ÜH÷ÐÁ d=05Œƒ…` óVÆpAÆ*\'‹æÀa‚)Ü< ;õÉ¤.î˜=½\r/ÌK.q·õ¨ä.£-’=ª¢6’N*¼Ã<(ú\n¶\\ØÏ­DJ†$¯8ªL–ŠÄ¹QŠ„†ç“Ú®ùy‰ÁÏJ¬Ã,{\ZÖ,É¢¿\\pp(dÝÊã+ e*Qì ó«¹\r2¬±Ú²¯-P ù\0ç%‡ZÚnF«¼YBC×Þ¶§6Žz”Ô‘ÍÉ>B‡AÚ£s	ˆ(LH	,ùëíŠÐ¿²T`ë{â³Ýcˆƒ’AêQ]°•ÑæTƒ‹+8¨ÍY)Ž=WaÍhŒ†QKI@QLBQJi(QE\0QE\0QE\0QE\0QE\0QE\0P(¢˜EP ¢Š(\0¢Š(\0¤¥¤ aER\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢’–€\n(¢€\n(¢€\n(¢€EPEPEPEPEPE%-\0QE\0QE\0QE\0QE\0´”PÑE\0RQE\0QE\0QE\0QE\0QE\0QE\0´”´\0QEZ))i‚Š( aF)@§¥p°ÜQNÙEÏQQ¸§)¥aÅyG°ŠRŠ¬â¯HµQÇ5¤Xš+0¨jËŠ…ke$Q‘*»­_tªÒ%o³‰PŠmJËŠŒŠÕ4%(4””É%VÅYñTÁ©Qª\Z.25`“¥jA\'JÁ†JÑ‚\\b¹ç²œÍØ¤â¬+ÖTSZ°³Zæq:Tô¢JÏûH}¤zŠžB¹!-(–³>Ò=E8\\Z9s\ZbJpzÎ[ëR¬â¥Ä‹Û©sUV_z>jZ)2jJhj\\Ò(\r4ÒÒ\ZE	IA¢Å¥ÚZ\0x§Š`§ŠÇR\Z( ša§ša c)3Ji(Ôài” Ò 4´Àis@E&hÍ\0.iÂ™š3Šbd Ó¨wQæE‰\'ÝAz¬fÅD×ôùDÙlÉŠcL*‹ÜûÕwºµj¹š\r8õ¨ZàzÖkÞZ®÷žõj›!ÔF«\\Za¸µŽ×žôÏµûÕû\"}ª6ÅÀõ§,ùïX‚ïÞ¥K¯z=½ª6Ö\\Ôªõ‘Î{Õ˜ç÷©p)Jæjp5Q%¦WÍCE&ME058\Z†XêQH)Ec©Ô”½¨”ÓN¦ž•D²6¦\Z{S\r2E2T\"¦JE\"ÂÔ½ª%©{R(ª&©Z¢jC#4”ãIH\0QKE4M!¥4†´‰”ˆÚ«ÉÞ¬1ªòVñ9äQŸ¡¬›žõ­?zÉºï[ÄÂFTÝMSz¹?STÞ·G<ˆ%-d…Rãµ\0\0fŒ{ÓÔÜzc4|ªy¤vàóúR«Ç­K·pi\0*\0â qæ€$.@ìm„ÊÄ|ÜÞ™å³.á÷ÆM$‡-Ïn8 ˜õ©ÓËh˜á¾QÆ}j»6P.Ð?­L\0XÀ\rž2hFTžÔªq“Ð\n9ÏZv2„Ò\Zn8b8=*dBî‘¨8$Žõ5º©\n²‚qÈž¡Êùjg¥C‘´`ìL¶^C—`©õâ´tË2_Ì!•ØäzÇK3Óœ /½oØÙÇ\n\'È§³Ò¸j×èzT°öÕ[i­\Z•ó7oääóZPÙ$XÁ	‘È_JTP[$Sï?6W&¸¥&Îå‰-‚€\nƒƒÓÔT²\r©¸rÝ¨p¡†)í…#ùÖm•`bVQ¼u\"˜$\0Ž:ÒóNJâœxgÒØ~ÿ\0—qöD=A\'4ø”¨ÜÜŒñïJÌÛˆP\0¤¤ÆË€	ïš•”6YÊ‚ÜñÚ£Š4\rÊr½ûSŠäõÍ& \0GÒƒàžwzÔª¨ØRqB±T,ŸÂíÁ .GäBeo/ /\\Óã‰e8\0w5nXw]+dL§*\r ŸJd‹æ<¥¶!\'>Zöö¤ÉR¸ÖŽ8˜ !ñüC¥@ÑrjeE]å±ÅXb–)“‹`É…ÜÎ}=©¤\rØ®±¼¬x$t§,@7–æMK	_DŠ¬£$o§®ÕPIˆæ‹˜bÛlƒó7û=*@©\ZŸïÊÓæžàí‰aò°»Þ¡19ŒÈfEÃcYÍ>Ry¯¸á¹Éî)£9ÉbK–\rˆã-íšEÜ€¡;ùŠÓñ¥aÜä…gLÃtÓ‰%„ew…h)d(¾¥…E(ÚT\rËÚ€EGDeÚYç¸¨6\0äŽõqŠ’GÞaÛ­BÉ»  õ¡ŠÂY˜^¸Í$ƒa%yð=*eÜŠrÇ¿€7¼Qq”dëíQ´ƒh%\r]{P[ƒÁâ£6ÅN{ƒši•r¢rIã)åþíLÐ•ù¾è¨ß“¸·Ê*€…Ð$§åÞ¨K‹!AéZ¥r¹ÎW–0Ã’yÓ3Ë`‚ù\rž€Tr0\'pš°ðºIüM\'“˜cýªÓD´@‘7TR®3´sëV$È8¨Y°0G5iÑU£ù³ÔT$•äê*ã.WUxÛq Î´‹3’*Ë\nH¬­ÓÖ±ïtñ\"]à³º;ŠèÀÛsQ<Ê;\nÚGsU¤¦Ž?afê>•)‚0kCP´ky7 ùIì*²nrz6xÅwÆWWG•(¸»2¡¤5+Œdcv5D¢Š)ˆ\r%)¤ AEPEPEPEPEPEPEP!h¤¢˜EPEPIKI@ÂŠ(¤EPEPEPEPEPEPEPEPEPEP0¢–’Q@Q@Q@Q@Q@Q@Q@Q@E%\0QE\0QE\0w¢Š(\0¢Š(\0¥¢Š\01F(¢€–Š(QE-! ¢Œfž‚¬4\nxJz¦jxá\'µC‘qƒd+jU„žÕv+R{U¸ìÏ¥e*‰¢Ù•öséEn}‹ÚŠŸjiì1¶jn¢©ÄõmErÉÅŒuª²-^aš­\"Ò‹)”\\TDU‡\nÙ2Ô%Z\"£e­2”nPu¨jô‰UkhÈåœJÄRTŒ)†µF-)àâ™J(b,£Õ¸åÅg+b¦Y+7šÆv5R|w©…Ï½d	}éÞw½féšª¦¡º÷¦›¯zÌ3{Ó|ïz=˜{cWí^ôáwïXþq§	½èöböÆÚÝûÕ„º÷®}g÷©’ãê#HÖ:8î}êÊNzçc¹÷«±\\ûÖ2¦o\n—7RJ”5eÅ8=êÚIšÁÆÇB•Ëy¢£VÈ§f¡–…¤¤¢‘BÓ…2œ\r )â˜)â¢’Š!¦58Ó\r!¦›Ji¦€4¹¦Òf˜f”5Gš3JÀKº“uGºµ;ÉSKâ¡i1UÞp;Õ(ä[3c½D×õBK¬wª²]ûÖ±¦e*‰\ZOt=j³Ýã½fIwïUžç=ëhÒ0•cJKÏz­%ß½g=Á=ê›ÞµTŒ%X¼÷^õ\\{Õ#-0ÈkU\'U—çÖ“Ï>µKy£y§ÈG´eá9õ©VãÞ³wšp’‡ªŒÙŽçÞ®EsïX	/½YŽ|w¬¥LÚN’+Œ÷«‘ÍžõÎÃqÓšÐ†ã§5Ï8Xê„îm+æ¥³â—=êÒ>k£tË@Ó…D¦¥#)OJAKA!M4êiª#jŒõ©Z£Å2E2u¨…Ji\r¥íQ%KÚ‘dmQ5JÕR\Zi(4R¢”Ò\n)¡1¦šzÓ©¦´‰”ˆÚ«ÉV\Z«I[Äç‘Nn†²n{Ö¬Ý\re\\÷­âa#*~õMêäýMSjÞ\'<ˆZ(=h«$)W¯4€f•r#­ &,¡\0\0†\'’i€ÇŒãÖ–Q‚9žN)\0Ïcš\0’iä—å,\0‚¡ í\0u§ ‰=($òôì(\0`Ê€gð¦Æ\0|¿ v¡A\'sgnjÕÇÙŠˆ‘„Å¹cÓO—bÔ£¦=}iñ1H 0Á\'µ`œ(¸$I$‹ä¤j¼ŽKôè•ÝÂªäšš$‘-Ò·´ý-cYÎrx¬gQE4¨ÊL‹NÒ÷yˆØ#†«vÛC‚6Œ(.Gs×5r\"Œ{Õ¨ÝÐ—ÈûµçT­&zô¨Æ(sD§ËF6p@ïRˆÉBãúS–\"\0g?1äVcÀ}£“\\Í³¡\"1åQŒ×Þ§)´}ÑÒ F2‚üÝòæ¤bÌƒŒ‚¥”/™Œ.^µ,‡xSƒH¡x]¹luÍX0²¨N1RÀ‚(Iv#*p»»sB©cÈâžÎ°´6z\Z›Ê·ÞÏjEvKf!2üÌU}@É¤&Uó8Þ#CÔÐåUÈ‡ç^¦¬Iº\'_,ŽNê‘¤D(ð\rqÍ¸x¡‚>2ï)Ú¿…In<°ïW|\0ÏéíN¶†ÆIí((	ÀÍ>å’o(ª·˜NYó£Ð\n¥¡\r· ²È¶“86ba¥·6¡¨\"hã‘ÒâG„°8››éVÞ6¶Ž	÷§¹\ZòTç‚jHe¸ŠI–ePîÙ—róš7ÓB²Ú\"\"–yHa’\nóô¥6áŸ÷´*ü!~N=@~KµX|¼)cÉ~§Mg\r9ÍÁáÉú{RÑ1§&†ÚéVP¥6’HQ™^y›b¿<qÖ¤Ä¦XãDb[ïƒQËk-Ã)‰ääñõ¡#AF,îÊ\0àŸsWÍry{²ÓHá#\0ãËÎ95Én	ÜHf.M>9LyÄîTTmç(1Žy8¨¹It\Z‘’çÔ·§´l	ùLgÏj™U£àt>´ù†Iäã±Í+Œ‘v„fÏqQ4nË€§>• °îŒç€£8¦ˆò0nôž´‚æoÙûî!³Éèòû)Éî*éFiJ8¦mòäó×Ú‚®Tò@M Ýé¨†6 õ#ŒT³Œ>}ù¥\nŸÆ•ÌL™ù‰RsÈéM) ;FëV¼ÆÚSƒž•_s1ï€iŽä¥\0aƒîzÕfL:¹®ÌŠÀg½W’0@ubXv¦‡r¹PÎÊTŒTep	?@M]0!€† l³i (Ën£#ÚªJ6¯\0ŽzV™W¦}ª´åBœŽsŒU§¨š3‰`7\r3Ííp95kìîTüÊ;óUÌ\\î`õ­.ˆµ†ÚI=1Ç½@ÿ\07QVŒc§Ó5ŠcäŒæ©2Z*²‘É´‰†0éR6JãŒT#;ÀÀ­ÆM/¡o)ü±¸zW3&c—î²¶k´Æs‘ÈïXz™“/žœô®š-£8ñ4n¹‘‡&íçx9÷¨M\\m¥\nru&«È„u5Ø™æ´Bi)M%P„¢Š(QE\0QE\0QE\0QE\0QKE\0%Q@Q@QLŠ( AKšJ(sIE(¢Š@QE\0QE\0QK@%-\0”QE\0QE\n(¢€\n(¤ bÑE\0Ræ’Š\03EPEPEPEPEPEPEPEP ¢Š(QE\0QE\0\Z(¢€\n( ÐEPÑE\0QE\0QE†…Å(š•S4›-!ª•:Eš’8sÚ¯CmžÕ”§c¢®A¾{Uøm3Ž*Ô½8­mñŽ+šuNêt\nÐÚcUØí}ªÔPU¤‹Í)Q¦‘KìÃÒŠÒò¨©æerœ\\MÍ_‰³Yq5h@ÕÓ4pA–ñ‘PÈ¼U•äS$^+¡±™*Õvveª¬+h²)¤T¸¤Å]Åb»¦j´‰WÙ*Ž®21œÇZ……^‘*³®+¢,äœlAE)•f\"æ—4Ú3E‚ä›ÍGš(°\\~ãI»Þ›EŽÝFêfisE…r@æž²T¥Í+\r2êKïV¢ŸÞ²•±S¤•‰¬gczzÑ†|÷®n¹­(\'®YÀí§PßŽLÔá²+2³W#zå”luÆW,æ“4ÐiÕ™ ´¢›Nx§Š`§Š8Q@ Ò¦£4óL4i¦\Zy¦\Z`%%’˜š3M4ÆlS°®<¶*—ê9$ÅS–z¸Æær•‰e¸÷ªRÜûÔOïT¤žºaLå©T±%Ï½U{z®òæ¡i+¢09eQ“´ÙïP´µcMÍh¢`æ<¹4ÒÙïMÍ%U‰¸ìÒf’ŠqsFi( BæŒÒQ@\rŠ•$ªù§I¢“/Ç.;Õø\'éÍb£â­E.+)DÞœìtPOïZ1IœW;Ý+VÞnœ×%Hôçsf6«\nj„Oš¸\\í&L)i¢œ)šiÔÓL†1©”ö¦w¦!EL•©Ó­\"‘:Ô©‰RcŠE5BÕ3T\rHc	¤Í!4™æ€$¥íL—4\0\Za§\ZkV‘2‘Uy*vªòw®ˆœÒ)ÍÐÖUÏzÕ›¡¬«Žõ´L$eOÔÕ6«“÷ªo[£Dh õ¤«$pé@8¤\Z\0z!œcŽy50Pœ0 ‘ÅCmn•n=Óœ\rŠH\'Ò“$x¹Î¬ÙÄfº‰TÁG@EA˜4¯¶?QM&ÞWh‚Wê)=@qd2B 8Á¨fÃœ 8íšcóÓ¡«pùK™#\rÃ¢úÐÝ†•ÆCi+!;r+oN²†¤;UW“YŸo`„`ð)Ë3D–RôÇQXËšGU>H» Kt•Q>øûåºjšÒf’rT)x\'ÔÖM¼¬‘†ÓLp€ž¾æºx–Þ\n\0Íœqú×K#Ð¤®Z…ŽXçúUÈÉ)Œ`vªáŠ£Œw5aE^zp\rrÉqEˆ¿?Î¬\"åðÎ0\0¨ÏÝ`ÔÑ”núVlÐw‘€=©Ä\0Äœ“J\\±Úœžôó1n)\0¨	l÷úu©Y‡BOµ3rªýìsÅFcwÒ¤; çQnåò3‘CÊrúS>bÀýh5\ZI	ÂM‰¸\0t§—UÆÀÖÍ/ƒ’;Ðˆ\Z3óÄõ$õ©•Y[r§ ð*$‹*¤œxÖ®DÉÉäãœÒÜÈYÆãÑqÆ(Ž-ÛC>>cR0]€mmÇò©í´“ª•UÈÀ\'Úžä·dCË³¾_<r*G2Ìí*ó“ó–=jrw\ZCfhÇÎÃS>ôèã´‡¡–d\"ôvúÕ(¶fä–¶Ô§<S’%»„q•Ç#µ-½¬ÇihÈvó$ Ò;JÐ¬g…ÆéBùìŠ{[D÷XO:â`\0ŒGÐwÍ>^Ä{GmJOe!V|)õ(p$8ÛLBó2¯Û5}í\'h­¸Ê6Éút©›~îYãŠp¹o=°Ì~”ù>Ñu(BdhÄpF$^€Óí­\'\ræÉh|†m¢V#\\Õˆgó¥(ŒZ$_ÝGg.~½(…‹fY\"#9„o §Ê\'\'Ðl¢0Ì²ã áKwºTb‚	ù‡ñåVP°”@ZÝ€ó[“TÚd&?´0å’õ©°ÓèI%±F_;ä9j®ðÛ«oŠV’0v³Çó«_h”Û˜‚„)ÃÔÕY<™#Vb­¸q´ôúÒÐ¨ß©[tiqµ‰\nGð*•$Pq¸€Þµqf•B#B™\'‘š„‚ÌÄ€O¦0*_‘¢)ÈÍƒè{\ZŠMñÄŽèÁ¾8©ž7Áb0«#I_÷c =©CA¹]~F¦#lŒ®AäÔ€p±#µ0‚°>N†˜Èœ`uòi§ËÇ?v‘Ôr	Ç¥WÜYNå çõ ¤‡í<ñQìj9¥hûd\Zt2?2ðzULïàuëŽõ]“p!ºÕ¢¸~@¦}i®Š8šiˆÎ9/åœ/¹ïP‹v(ê§pªôÈ¬67j;½x«L–RpF0jW .ç­^`$ù‚ãžÕ(aÁ=*“Ÿ\"¨<¯åTÝIéÆ+Rx~^¤ŸJ¬ËŸ”Îµ‹3h¬rî}3L–5xˆ#ëRˆÆü‘·9¦ÉÀéÍRfm¶¡jðÉþÏb*‹ šéuÞâ=Á€ÚÏ,¦6*ãwl\Zô)Oš\'“^Ÿ,Š†›R8ù0ÖÇ;\Zh¢Šd…Q@‚Š( Š( aEPKIE\0QE\0QE\0QE\0Ph Š( Š)(h¢Š\0(¢Š\0(¢Š\0)i( ¢’Š\0ZJ( Š( AEPIKE\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢Q@ÂŠ( Š( Š( ŽôQ@Râ˜Q@QH”RS…&R$EÍ[Š<š‚5­tÎ+ÊÇU(Üš3Ž+R~œS-âéZqGÒ¸ªLôéSHX¡µ\\Ž,RF•eEs¶t¤*%L«MQRRP¸¢E <æ3Í_·n•˜‡š¿nÜŠô&&×)Ì¹VJñ\\¯s¥³§Z¤ãšÔ8¬ùšÖ,L¯Š\\S±Jªâ¶˜ñæ¬ ÇBbq3¥‹Ú©É+bHò:U)¢ö­¡3ž¥3)×nTÅWeæºbîqÊ6#¢”ŠJ£0¢Š)€Ph¢€ŠZ($J(ÅZplS)E L³Õè%÷¬µl\Z³â³”M¡;Öótæ´á“\"¹ûy:V­¼•ÇR\'£Jw5•³RƒU\"j°\rr´u\"Jp¦\nx©(p©F)âP(4€a¦\Zy¦\Z4Ó\r8ÓM4M%)¤ªÆ5R¹Àª’¶TQ-M-gÍ-K;õ¬ù^º¡’¤Èå’ª»Ó²jë]1Gåq¬Æ˜M)¤5¢1bf’ƒEQ,(¢ŠQE\0QE\n(¢…QHR£â ði4Rf„2tæµ-æéXQ½hA\'JÂq:©LèíåéÍhÄý+\nÚ^•«œWâwFW4TÔ‚«ÆÕ05™cé\r\Z	Õ=©†˜…<}jS§ZE\"ÂT¦£J’‘DOUÞ¬½V’µ74­M ƒN¨Á§ÐZa§SM\\L¤FÕ^Nõaª+¢\'4Š3\re\\÷­i‡ZË¹ï[DÂFDýMSj»?STš·F\"4”¦’¬G4GjTÀ`HÈÏ4rŒƒÓŠœ.Æ·nÇ{Š…ˆgÜíRµÁiKŽ½©\0ÖmÃ¦3ÐzSQºçøÏï7H~^â¦‘üðÆ-±¢úžM&ÊK¹^FÛÆsJaeMÎpOAQuúÔŠÎêAúÐ+–ÆR4HËIÔžÂŸeæû¤zöYÜ›O2P ³.ÕÈéš—$\"ªä³}ò+9CSWN™VàJîÛº(Çë]„-¹¦gyÀ¬(ÊZÇ, Èü±þèì+oMpdä(àgúW\rnç©Aô4•[“ÐTÁ±ÀŠfô%U~‡ªU›\0\0\0ë\\líC•ŽIþuhÈÀƒƒÆjj)qZŸ’¨IaÐwÍK(µ	Tàýê°îB¯½S¶W9ó’yÍN]H*xö5pWI9ÀÏ¡¨Ô)ê‚\'#kñížµ*GŒ•^@í@Æî`Ù‘[{dÞ¦B€1ßŠ®×0Ç|–¥‰•†qý(Ü‰[sÇ;\n°«»–,m·túw©þâJ†ÏRKeyÚ¹ùy5fÕ°¤†1‚i®UÑ#ÚS-—õcé@ýÜf3µFì–~”rÖì†x£É’þí£uPüžýÉ5»¯ï<ÀÎBü9çÞk†mÖÊÜïn£ðªD½\r]¶ÿ\0cd·…cÚ»n$\'å$wüjq$žn-¦G+ÂŽ¹5ID)2[Ioo¸\"þ6ñW\nºÚEd‰¸øT_zÕ3™«h?Áq*K4.HÃ6ì€iÓjf_.â¹\\!TÚ£ÐžõVá-Ã¤ñydåJrÍïíN²¹™áv0œÜ:îò‡½	ÙØ—«‹t·–ð\"-Ã’*‘Æ@nùÜjK³> ÌS\r»˜³nçéQO0žèF&šý8	*Æp9Æ;R®Ô‘ð•F(limrG¹‘­cE}òÆÑ‚µ•§sœTgž>ñ´øvÌìàÅ|do›ð¨æxÃb# rÙ©nú”’ÙR³(Ž(ÒTXœmöç­1t€É1V9ÂÆ½?\Zq·h`/²8À‚à·ä*ÊT¶ñÆ“ó\ZWØs¢|À)`Nry5‰o\0NJð\r9Ép\'9É§‚ÛY$\n\"RàòÇÚ•ŠÙ¶néÞ¢”s„ï×5nHÇ\rŸ‘þ`Î¡¦O\n²ÆÊ#Œž»Oó©±I™—;Ýµù†*}ƒƒèjìŠZB® xoj¯:üÛ‰Ç¥+\Z¦FÅXª‚â£Ø¦3ŒñïSìWaòá€àô×[©ŒsëL.T‘Y¶ä*ÛŒc=êfb9bqšãò ž:PZ u\\GAU†är£©Zµ f%@ÇÔ¥GLúŸJh‹1y)Iby\'¥9ãbx^£‘Lvà)b¨ä`ëQîÇÊF}*G×$ô¨L{Ilûb©ð#$üµ™ÀÂð©kqQmRØÈÅR$VUa¸ž}*“tb¬\r[‘~_2<zuªÅ°yžøªD²¹Mè3ÕÆÊc?Ö§brH¦Ÿœœb´L†ŠRF]HUùG9Åsš•»A#3«ô\"º¶.7&0æ±5rbnøè+¦ŒìÎ<D9¢s¥x¨È óSÁ õ¨›­w#Êhe\ZJ¢BŠ( Š)h\0¢Š((¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0))h ¢–ŠQE\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢Š(QE\0QE\0QE\0QE\0´”Q@Q@Q@z))h\0ÅQ@Q@%-\0QE\0QE\0QE\0RÑE0QŠ)q@	E-\0˜¢–“½ \nzõ¦Ó‡ZL¤Z‹µj[••jÕ¶=+š¡Ý@Ù·\nÐˆV}·AZ1WÏR¤:Š‰*u“5¢ž\"Šx†SöÑ@^5rÝ¹G<Õ˜½9-\Z/SzØä\n¾V³- V¤c\"¸æµ:¢ÊÓ\'ZÎ•pk^eâ³æNh‹)”vóOU§mæœ­±$ Z]´ð´í´®Uˆ2*¤ÑqZEj	œdL¢bMR‘+fxë:dÁ5×NGXSjg\\TDWBg+Ch§b’™\"QKI@‚Š( AIKE0Š( BŠš6æ¡å85-™£óZ–Òt¬H›¥iÛ¿\"¹êDí£#ràUÕ<Ve»qZž+†Hô`ô\'Zx¨Ö¤“4)â£ú\0}\n\r!\r4ÃO4Ã@Æ\Zi§\Zi¦€i¦ž”úaªB!”Õ	ÛŠ»)¬ëƒÖµ‚3›(NÝj„‡š·1æ©=vAu¦Râµ­ÌyH¦V\nÓj“!Ä‚’žE6¨É¡(¢Šd…QHŠ(¦ ¢Š(\0¢Š(RŠJ)*\Z·ÕjxÛš™#H3nÚ^•±o&@®rÞNElZÉÒ¸êDï¥#v&ÈeMgÀù¯Fk•£¡\n\r  ÒQš{Tf˜‡\n*S¥\"ÊT½ª$©{T1úUi*ËtªòS³S*F1ŽáLúÂšiÝ©µq2Ö¨$©Û¥@õ´NyæéYw=ëVn••sÞ·‰„Œ‰úš¤õz~¦¨½nŒ¤¥4•d‹Bã<ŒûQJU€ô §XÔs–ïM\nÞY|£ŒûÔ|æÐñÉç¥&x S—il>põ©E¤‚.Ó±¾éõ¤1ŠÁ#ÆÜ·­<û?#OZ`Bø\n¤ÔÉ¾Ø6cÉe dp=è`‰\\	 „F9A’SOµ¸•Þ8Ñ3ƒŸÆ¢¶GV uÕ~ÅL&1–$ª;VsÑB÷D¬\ZGÚÿ\0x¾Qé]VšÈÐ #búûW94æ>C\'ÌÞ¬}+¤µuVù_9÷Ï½qVz–{—‘BåíÆz÷5fVMÇ•èFˆ8gëVTƒœr\0®&Îä(³3cÐ\Z~ÞOÏjn×ÏïíC1@I8ÍK-¢mNsè*xÐ7$`ã“Q–U`ªA÷ÿ\01Šž:æ¡0sË1éL]í…àzâ¤Í;†”Î;úÒ\0\0ÆävïŠ\r”Or³û1íN‰¢,<Ôr˜ê½I©Ã·.@êÙé@›dáed‡;ºj°¡¡”o„m#~ýÀ’*Š9~C’ÇI©Hû8deÃ‚j.KW~Ñ;yÆòåÎãÀ2Å$ñË1Qå)ùŽqŠquùlßwÚš‘îVÉ*ƒ‘Ÿâ¡´-E@\"Ú±¾0r*Ìw!·HÀ<Ç˜ñU÷/›’\\t§AÓsÆ÷¥pjåÛÙ.VXá˜©h”}ÎTgßÖ¢@%ˆE+0‹2ÿ\0z˜\níÙàs‚z“V-¦Ù8áB…ÚsÎÚ«‘k\"_-<­îþQà$(„îþ•iŒñ®Ò*Ÿõ#•#ßZ#(Ï 8FsÎ;RÀámŒCÊóœJ¤ÌÚîN.åÜNÑ\0»DqŒ\nb±E2d)äõ&˜Û^_õEØ`^€ýjaˆ‘\"”ßÕjWlVHG1I Q!Ïþf€©ÌFE7¹$àLª¶!ùÎyn´c|}B±98š`#MàÇ½‰ç¥.Šr#Â•nÂšU[R’w\nIÍ1b•PfhÉ +”jâ‘K8 c(2MF#Râ%.ËŒå”ñõ©&UUáBtï‘U§ûU´[žo•—vå?¥ ¼‰J»¡,”åHã5ÞÃwQE9›YÈ\'‰Êá@¥2™a`ªÛÀÁÇ™I29cI¼>Ü`ô¨VÖkŸ7f7 Ï^´Éî|¸ÌLœŸz’=E.X·’ce<€i$iï%¡Y’h™Q€Î2	ãšV\"Y<Ÿ,ª€ps“ëVÊn/‘êGZnrü£‚iå\'ƒß“ÔTLŠ=*ü‘teqÁûµÆXn\0H¤ÌÆOÞaŽÑëQ˜œcëÖ´$„³\rØÂåF~”Ó*å\"@„wÏ­Cå3|­ŽkU6íêA¨%ˆ0\'²š¤Âæq·ÁÀ Ÿjâ!Ggš¾ÊØSÜŠ…ÇÌ7:fÀÏh·ûÕµoµ‰K\0Ãc¥l2áˆÕyîÀ?Zµ+	«•œ~ìíäÿ\0*„Ë‚ëVÛpÎ¡¨^Ÿ(õH–S+Ÿº?LuÜ›GÞªÄ…XsŒÔMû³’2=ªÑ®êJFHëY“²K.9`Ö¬®‘2ôn¢²õ8ØN\'EÁ†·¦sÔ0.íÛyd\\úãµgºâ¶f&HÛ\0ZÉ‘H$\Zî¦ôÔó+E\'t@i)Ç­6¶9ØQE(¢–ÄÅ´P;	IKE1	ESQFh Š(¤EPEP ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RÒQ@ES´P)h˜£¸¢	E-%\0áÖ›J:ÐÊE˜ºÖ¥·jËŠ´íJæ¨vPÜÛ¶è+J*Ì¶<\nÑŒ×ÏVBòU„ªˆÂ¬+ŠÉ£[–¤QP«{ÔÊjl;ÅfŠ,<¤ðjh›T-Öæ½^‡‹³7,ß¥mBrs¶’r9­ËwÊŠä¨Ž˜2ÄƒŠ£*õ«äåj´£šÉhjP+Í9V¥)NXê›)	Nòê`”ý•7U“­^eªÒ\ni‰™Ó%gN•­*Ö|Ë]f\"eHµ]…]™j£Žk²,àš# ÒÒU˜‰E-Ä6Š( AEP!(¥¢˜	NÚQHh±éZ6íÒ³#<ÕûsXÌé¤õ6í›¥iBx¬›cÒµ!í\\3G©ObÐ©Fµ ¬¨ñOÁN†<RÒ\n(†˜iÆšia¤Å)¤¦i†¤4Æ¦„Ê³VmÁëZ3w¬ËŽõ¼j³\ZªÕfnµY«²\'÷à) Ô‹M‚\ZV£dÅXÅ5–„ÂQ)²ÔDb­:Ô,µ¢g<¢CHiÄRU˜´%Q@‚Š(¦EP ¢Š)(¢Š\0QR!æ¢§Íh¿ã­k\'JÃ‰«NÙúW=DuR‘Ñ[¿JÒˆñX¶¯À­h[\\SGtYlRšjšq¨(ª3R5FháS%Bµ2R)’¥¨’¥©(cÕy*ËtªÒS»Ôf¥j„õ c…8S8SL§v¦\Z¸™HCP½Jj­âsÈ«7zÊ¹ïZ’÷¬»žõ´LddÏÔÕ«Óõ5IëtsÈ„ÒRšJ²©UË.Î:/sLQR2–u\n:ô›ý¡2ü†ÉÚ\rFJ€~^{R•*øÛÆ¤o™¹é@¾^àI;jSrþRD¼*æ›»Í:Ç\ZýÔQ’i%Œ#OÌ1@ÅÂ!àï\'ƒéS4“Øêv“Á¨á\nèÃ$2ŒŠµ\rÁM’H¼žB°á©1¡‘¿ïBn##ØV·î,Ü}šígà|Ø )ük<M¬æ@C±\r•¥^ŒwHWŒéïYLÞ›4`òRéî;Ç–€õÍo[Çµp«±dçÉ¬[y£š`‘§™/\0í(îkzÆÜ«nn²k‚³±èÐ]†e\nWog¥J¨bù•³ß>´àI\n qHn,O·=+¨6oUÎI?z¦…#¸æ^ÇáH,H*8§lIè=)1ŒÁQ÷zžÔô;£;Ž\0æ˜ªÑ>ÎyÐ\0å˜‘žŠ)H²~ñV1øzÔŸ(#$ž¥Wòö€B°>¢­Åå4`Áþt0%äÎÓÁ«3Æ‰l6¶KämÇ\"™n±ï>iÀqÚš»ÝI9<ðOZB_åQ\ZHYxÜâ•Iscny$óSÆò…X÷…<ûR,J@ù—<0â“$¾RtäqO)\ZÛ©óKHÇžý)a@Ê1ÎijcÕÈÏoSHB)1|§k26œâ¬ÛH°îv½@j ¦@Ûc ©äô¥%w(i2û t¦+Üs…¹Ç+ÛŠm“Ã,Ž‘³\0ƒ$°êiŠU8#w&¦‚i&’V;{tÉ-!<°=Í4\'¢-ÅStcæ9%Ž8úw©œ9`-ÃrNZÚV{â±´ò°Ê«ÅcO,®ÁvOÁû€òO|â«dd÷&I\0‡›wa€Ÿ­YÞm¹¶mŒÄòHÜ@öÅW3GRö`nèÇºúTpÝK\n‚vTl#çÖ„íÔ—ô%I\0ga$á3\0Š½¾\nÅrD‰‚Wi¾†© †,ÙÆNNìŸZ‘	TÃÄržÔ“è7¥­ÓÝH-¤RT1Ú>¹5Ý”Ç)mÉÁMÜSdvk€%“b•Àe¤hA#-Ž¤ÐØÒ¶ãü·XGÑ*i6Ì…aŽ¼U}í€6Olf¤IR9 hóÑ‰Î¥+•‘É¾nï2QŸ—?J’/.8Ü<\'{Ÿ–@àÊ•ËÊ9còŽ84Šë³dªJŽAô¢ám\n·¶sIÂ(5µ­Ô@´€…\'ÓƒZÈ˜;¶²ŒqšQ—$Ž¡IâùúÚ6<®8ç4Õ>fUÓ\r×\"®È^1ó\0ôÛÐTÀ	9 \"ÂªíÚy¨¼¢v}*Ü©»œjbŒ\0ö#µ¤ÊŽ7–Ï_j®#\n¸ÆóZ-P¸àg­U‘Ÿ˜o¿^i™L‘)Â€Øëž*¢[È’Jo”œ€kUcÚ…˜{RƒÁFE4;™èŸ.3ÅFÑƒž•}ö£c¯‘¸c­rƒCÁíUÌ\nXäcéZÞFðAÃÜUIã’r0;\n¤2Ú\r®Xdö9*äž•§(;CíÎzsÒ±ï‹ƒæÆNÐ0WÖµŠ¹\r•ä($mêEG…%ˆ8àc­6KˆÂg1œÈqU³o2¡AÃ(nO¸­Ô$öF.¬SÕŽuWVr9ô¨%ËHlóž˜«o¶¸RÈèÁº\0y^Qµ·ÄÁ“†íUÑ2”Y™-©ŒÈÁïXwI²Bç][…¶Ì¸9¬\rB\\8í]Te©Éˆ†šì9¦T®1QšëGžÄ¢Š”RRÐPQKIHbRRšJh†%QLAES´†Š(QE€(¢ŠQE\0QE0\n(¢€\n(¢€\n(¢Q@Q@Q@Q@ÂŠJZ\0(¢ŠQE\n(¢€\n(ïE\0QKL¢–Š\0J(¢Q@‚Š( aEPEPEPEPEPEPÑEÀZQIK@E¢	EPRŠJZÑb>Õ¥nqŠÌŒÕè„ÎÊ,Ûð_IEbÅ.X[Œw®9@ô#;#egµ2ÜZÂ^ôñwïSìÊö§B—Ö§IÇ­s©wïVc»÷©tÆªEd}«ÞŠžB¹Î!Å5N\rI ëP“ƒ^‚Øòä_·“VÕ¬Ük›‰ðkNÚ|cšÊ¤niNGB²du¤~j¤3d\n°5ÈÕŽ¨°Ûšz¥*ŒÔè™¨lÑ\rT§«)Ž¦ã(ÈµNQZR§BU«‰,¡ ªS/ZÐ‘jœËÅog4dÎ*“ŠÐ¸j„•ÛÏ«¹\r%)¤­Nv\Z))ˆ))i\r\0QE\n(¢€°P:ÑJ(XúÕûz£«öâ²™ÑIjk[v­H{Ve°éZpŠà¨z”ö--H½*5©`Í‡\nx¦\nx¤…- ¥ ša§ša bRRšJ@!¨Ú¤¦5RRaY—­jÌ+6ázÖðf3Z3j£Ué–©¸®Èœ3C©ÔU\"Õ2bÉER-<sPk¹­@ëVÊÔ.µqfS‰M†)„U‡Z…†\rh™Í$GE)¤ª3\n(¢€\n(¢˜QHŠ(¦J\r´0&ŒóZíÈ¬Ô<ÕÈšÊhÚè-¥l[·¹ûGé[VíÒ¸ª#¾›5ÓEâ¤Ï°ÓQšy¦ÐŽµ2TS¥!¢Ò\Z–¡J—<T”#Uy*v¨$ \níQ\Z•úT&˜Àu§Še-11Ý©¦—µ4Ö‘1˜ÓQ?zÔO[DÂEY{ÖeÏCZrô5™sÞ¶‰„Œ‰úš¤ýjôýj‹õ­Ñ„ˆ*&çÇ£©P\r„cš¢De)ó¨RÈêýÇ4¨¥÷g šhvãÆ€,4Ëno@\"p»‰þ#Ú¢X™ÌýÞia,ˆ²‚ÑîÜPœO2¤³\"„SÑ{\n\0lS=«™QŠ¹”çTA#Ì’~b©ÉÆŸo4C8š#0Ä|ð§ÔÓ6ýžA½~le@¤2ú]ÇcxÓ[FS#aVÀ#š¯F‘Z@Z=Ç(½M[†[v Àa+”ÈÇjŠgó®©\ZD™Âªð*JElH‘Aá³ô­î$™XÈä3tÍ5mŒÏ™œ4Q6/RMh]EŒ\Z(ö#aEe9#¢”ã¬ãXÜÜ³2Â£XúW]jÃÉ†\nç#$ÝÃŒýš.HÆw7jÞÓQÃÈA9ÚÃ~Å[UsÐ¥£±¡íà3uäãµMÁlöÒ™;1ûÄäTÙ·Hùï\\líD±G!È/ÁëšBÃÉÊ°É8çÒ¤8î\"ª±Ý°ö©2Á#%Föì*2_í=MMÏJ{ª$Q¶±<Žæ‚ˆãVo¼Ç#îÔ¨a }ÖÁö¥]¨ä“O@K8÷¤üµHy`{‘Þ¬.Ñ\ZìÉÏPJ…P¼¸àœtÏZ•dfc\"ŒR%@N¢§¬±&ò>nzsU¿{\Zå‡Sß¦	8Îrï@‹\r´\0ñ‚Äœdð3MYŒÀ ;Ys»Ž¿FÉ*ÙÞFFõT@Dž¨¼×ù’ÊQBáT8¦Fò…9 Àõ§\0ì t÷©R&U$ü¹éÔQqìC\ZÃy<ÕàŽ_yÀ>€qL…qÁ!}íVQw·\\R%²0—ò÷Æ:äqšlnâeU\'$q·µZò–EÛŒg®M?ìÌ²*ÆÊ½)“tExå¹àÕ:G·	ÆAI\0EÜ0IÜI\'½ZT.vÝäç\'µ;ÙUÂ8úŽ”*o$ž1ÐU§ECˆd\"·>‚ûÄfï$ri4.b”ˆ7r3ŽÔí¿( }jvÚáC9RB:š6í-ŠV•&Fv\ràu¥E‰ãlKÎ~î9`†È `Þ¡ebÀ:\0Þ(Â•ÝðGÞ5\'—µ²…Xžô©\noQ#”ã œTªòì3)êÁqMÙ\Z˜Ùš6Þ•ô\"2ÊÊ7¹n1ôñºP!gás´c¥FÛ_8…1\\‰@)åÇ#ð¦m\nr€>`Â®¶Ô\\€Cu\0ŠiÞü ¼=h°s×0<ðW)ò.ì°#ÐUÇ-),è¨Ê.úÔkµŽSÌ<vShŠ;Žxã\0qK$i(Ú¸\0õ©ÊCÁàÒí(¤˜ÆIç=h°îfˆDnsßµÏÊSx\"§b\ZC»˜¨˜¥ÏÊ½956.äÆW¸õ¨@ŒƒŽ}ªÁt1Æpzç­U30b\"õVˆÐ®AÜ@öNvò˜Š½…&u<ËL\rÇ\'\'•& c|;pI|V‘…Èr°·7Ð;0U\'<*ô¬™”ç2nEcê	N)š…Í˜Å»	¡^¢F’¥a$mœÑj{cR7”u=ñšê§HçR¶¤Ñ»JO\"Œ*œÖ0‚N^<t3[¯cçB]uH¾c€\Z@ŸzÊ»´‚vO3«÷ÁÞå]´ÚZUnõ)­ÛFÛÁ\rh[ë­Är¢²÷aÁ¬y+|¼zâ™×¥já¹ŒjJ;3¯[”¹ŒyR+ =;ý*¸U”ã8§¥s\\Ëk(t8 æ¶b¼ûVXžOozÁÓpwGTk)«=Ìy†Š„ÕûØY|pj‰ÑtqÉYØe-UêJZERP\ZJZJd1(¢Šb\n(¢Q@ÂŠZJ\0(¢ŠQE0\n(¢€\n(¢€\n(¢€\n(¢ÂŠ( Š( ¥¤¥ Š( Š( Š( ŠZJ\0(¢ŠQKLŠ( Š( ’–Š%´P ¢Š(1E-! aER\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¥”´ÀZ(¢€ŠJ3@IE€)i)h\Z%Ž­ÆÕM*Ôu”Žšl¶¯Å?y¨TT¡I¬ltÝŽó\r89¤“OÑ µ²\Z™&\"¢òÏ¥H©Ðjè¹çš*®Mr¢¹™FQUZ®Ê:ÕGpfSC°jÜ2b©w©#l\Z¦®D]™»o/JÒ‰ò+ÞJ×¶|â¹*Dë§#N.@«±¥SƒœV”+\\²7Dˆ”2qV8¡ÓŠ™“/³å^MkN½k6eæ´ˆŒù­PŸ€kBn3YwOŒÖôÕÌæìŒÛƒÉªjÔí’j“šï‚<ÚQ”QEjd”´†‚’Š)ˆ(¢Š`QE\0áM§IF+BÜtª1•¥n:VÓIjiÛ•¥ªã¥hÄ8®ž”„Âž)¢ŸX³Qiâ™O€p§SE-Ó\r<Ó\r\04ÑA¤¤M4êCLEiGBuÍiH2*œ«šÖ,‰#tëT9­Y“­R‘+ª9g‘Z\0©Y1MÛZÜÇ”UëR(âš«R¨©l´„+šÖ¬cŠk-	Ä¢ëUÝjó­VuÅksN%R)µ+-FEhŽv†ÑKIL€¢Š(\0¢Š(\0¢Š(\0¢Š)€ñÖ¬ÂÜÕQSFy¨‘qfÍ«ò+rÙøÎ[7\"¶í\\•QÝI›q6EOš§p*Ð<W+:P\Za§\ZiëHc–¦Jjt¤4XZ”t¨R¥‘@ÕÔÆ¡z\0®ý*V j6—4”´ÄÅÍ0ÒÒ\ZÒ&R\ZMDæ¤5VÑ9äW–³.{Ö”ë:ã½mõªOÖ¯OÖ¨¿zÞ\'<ˆªefxÂd5	©¡åuŠ0Y@*‰oîÙŠR#1‡÷™ùjš(PC2´ª­ŽÕl¨#Æ9úÐ€tÜa@\'afíR½³Â±;àî]Øô§±ŠHc@Y{¹=Ïµ\0W@]ÈÅ]ŽÕŒq_L?ÑËlÉïíTw<sÚ¦ŠAÿ\0-Ôª;\ZLh™FeÌC`\"•Y§uBûS8Î(³Äÿ\0hÙ»h#¾F)Öð¼‰&IPŸ1©5,´J—ErÂ2|µ<dõ#½jXÈVádc¹1’+&ÖÞ!\"opû˜úVêÃv“ìl¹\\u…[412­ÜJ²~ï™#ç•=«~ýùŸvýý<×/`«ˆ|ÓÔï”ÿ\0*éí”gÎE®:ºhzUõ5>`8¤tÜSæ<†>•THXy\\b®¥Æë{rbæþõr3¨Œ+°­H\n•	\rý)¼\\w 8Þ6©àrjYC¶#…*9éÏ™`ã½1˜\0+n=ið)…K)8÷ ˆÇA ÔõÚ¡Ë)ÿ\0`zTi(*±)aŒ™1J€;âFe\\qÇ$Ò¾ibŒg¸Š”¬r2¡ÜS¦)dH¢)•ù€ÉÇzŠóž=¨Ø7&2ˆ·‘Â“ŒzP\'˜…L‘Àj¯(ipO%ºÔðF1ÆM&++}3ïH±*±“\'v:b¬ˆÎÜ\'Næ¥Ž-òª–Çfé@¹¬Sû‘Pã¯©Ðç!¤ŒƒŽv3\0NÖÉÁ4^Z—á]ºö¤\"Žãev8éß¤±m*#]èãpÛÕG½3)!/&wF\0UƒŠKÁ(¤¿PGo¥RFM¶ >bùVöìòä’äöö¾F`¼Ñ -™ð*jË—VùÐö§¢AË\"À2M5n¢w[¥Ä>a…\Z2¥y(A.~´ókš›ò«6KS.f’R£îÆœ\0WÒèc‘C•ü‰³°ðLBFå¡^¬iñÂ¹!LyÏ43l¹\"LäöÍU7Æö8âµŽHXœÙ`>”É³e‡\"$+´tÆOSK\ZÇ2ØW…ÇZ›p‰ŒL©¼üãš#€H·’wmŸ ¥mBú‚œ“\"ž€ã™’7Dl&}:UÈw#p¥7ÞnÞÆ’PáÝ™‹»sÇJV\Zz•!‰Z1¶]ÍÑ”Ž•:ÄÑ(“Øþ%ÅJ±ùÃ3±@Àãñ¤…a$Ç;nÏP§õ¦¢\'\"å&Ùd·bÇ®OÞ	å	l8\\þ•{ìÈÌ#†I#F íÏÌ)Dá…Ô;ö\'2jù^Äó¢¼hLX‰Ìœò­ü&žmÙ#\\1èÀuZ|)¸nU ªó·úÓÑƒn3†õ©°6úí“dxl*’ýtÙc‘Ø<l†Þ­›X¤BìÅr0z“ëô¨*&ÐX1ã5|¤óv(OÏ\"»îdB:RŒÊrÀ°ã­‘¹‹FÎ;¨ëùTÈÆ}ÂÙbE\\0íÅAªèb\0Äó‘Täm­Œ)Ï§4¬Ñ\\ÎŠ&‚ÿ\0\n>y¨n®-íA2„,\n?•&†™Q˜ÿ\0¹ÚIÆMsWú„B%/vL	ÌQ·ÌkZú+›Å.¸Š%%Ü(Éjþ]Â[YIn[øæAÀïóWE8\\™ÎÅ»‘4ïi.jr@É?b^x„iêUXŠÊk+U¾Š+§‹íSÌ€gpn3\\ü‘´Ì]QÛ\'\0žõÛN‚ÝœUk½‘³©x¦mF=³Æ	=*:æTeÓýd«’µú+G’äa\0êyô¤6÷H-Æ\0„;VÞêÑ{ÏVB~Êlq’Îyü…fÎÄ9ù²=zU“(\"<\0.iŒ\"\0›žZ­Ó)îæ—%¹À«Ï&Ùnês÷˜õ‚ÂWÀDäò\0§ÌS}\nÊ«\'\0m>õ<<o¹O#¨¥¸³krªänÇ@iÐ\\er½2j[ºÐ¸ÆÏRÔ±¼–ï‘Û5ŽÂºdòŠœã×±¬[¤	;SÒ•7Ð+GfU4RšJØç–›KšC’ŠJ\0\r%S%‰IKE1	KE\0QE\0QE\0QEÄQE\0QE\0QE\0QE \n(¢…Q@Q@¸¢€RRÒÒ„¢ŒQŠ`¢Š)€”RÒPHQE˜…¢Š(\0¥¢Š”´PQE(¢Š\0(¢Š\0);ÒÑ@Ä¢Š)\0QE\0QE\0QE\0RÒQ@EPESh¤¢€ŠJ(h¤§\nLh‘[ˆUhÅ\\ˆV2:i¢Â-N«LAÅLµ‹gZCÕ*P”Ô52Ô”0¥0ŠœŠ…¨BcvÑFh¦\"¬Â©H*üÂ©J)Á“QZU84Œ)ls nElZ·JÂ„Ö½£t®zˆé¤Î‚Øô­kqÒ±­q[–ÝpÌëEÄ^(uâ¤AÅ+Ž+!™³¯ZË¸ÍkÎ8¬‹£ŒÖ‘*å±šÅº““ZwŒÖËäší£–´Šs6IªäóRHÙ5	®Ø£‚NâÑIKTHPh¤4\0RRÒP ¥¤¥¦ERS×­2ž´˜\"ÌC‘ZvãšÎ„r+RØt®z‡]iÛŽ*ücŠ§\0â¯ â¸¦zØSé‚Y3Aâ”SE8RÂM´\0†šiÆ˜h)(4P0¤4¢ƒÒ=Tu«mUdïZDL£2Õ)¯ËT¤­àc$Ve¦m©Z›ZÜÅ¡ SÀ¤§\n PE( Ò uªÎµu‡]Ö´‹0š)8¨XsVœsUÜs[Eœ²DF’œi*ÌX”QE\n(¢€\n(¢˜‚Š(¤1EJ‡š„TŠy¡\ZíÒ¶m¥`ÂÜÖµ«ô®jˆë¤Î‚â®)â³ ~_FÈ®9#µR\Z3Gz‚‡(©–¢Z•i‰–¥Ô€Ò¦¢zÔm@5BÕ;T,(¦’šM4§¥4Ö‘2†¢jÔm[Dæ‘ZNõqÞ´dïY×ëX™HÊŸ­Pz¿qÔÕ®ˆœò\"5fÜMý¤#åCcŒÕsV!G˜Ä XÙñ¹Ê¾õL”BÛ‰$÷©/’	nÕ-ÐA;$rQÀaÐÔjïˆÊyZJ	­Ø»í‘xÚz‘OŽâ6X·B¡Uv¶Þ÷¦4QÆ†A0.Ã‘š$¡/P)‚xÃ;É\Z•ˆŸ—4æ”(j•ì:ûÔ¹’Dò±•€jK„ŽUFRÃa\nö\\í×d*”÷4¶Å•Ò\\n°{œRÈñ˜#WS±3ŠT…ÕØÅ“†=*^Å­ÉÍ°î$V ?/jÔÓ¶%£Ün 0ÎãØÖe¡yY‰8P2A«¢á%l×8ôƒXO]ªVZ“éÎgi™‹&î8É®¬b±®AÆZ±ãóM²¿Ê;¦}kVGlTìO$×\rWvz4cd_@^ßÖ¬(\0sUm%D¸$qVœoryàW3ÜêCK[œ\n³&vXÔIÈ«UuBØ>žµfÒM¯“¼þu :XX£¯ S”®ÅYÖq¾”ó P\098 â¡(¾^Xg\r\"w,$kÁBÍŽì*0ÌrGj¬ÐÄõÞ§ø²ÝjxeÚÂB03Å0±#²Œ’Ô¥ƒà`är6ì|äç±ÄÃ<õjC\"Ž’s\',z¿ gdª8\0u¨QÊËå!$Ë\n˜Ê…,xÔZä¹DHmŒß1íS‰I@	oj¢²Ái³\Zv\'©©!œ‚Àacn\0?y;\\†ÉÉUˆ9÷«PFd\\ŒÕ3-´cÌ’@®NÐ¬y\'éVVâÙÕyÉaŸ–ŽVK–…¿\',2ØÉ\"¤ò•¢8Ùõ¦Ay¨©m¿K\Zb]¥vcò€>÷¹¦¢G1„F¥‡-ØÔõI+\0Þ¬ÿ\0¬•!‰I“ßµ[·ƒcùhÚÉrÙÏ½8ÂäÊ¥Œ«‹XoDvlî\rÐ{úUÈb†Ú4PþcËçó5r%o:F•dÜvà¯,GSô§6w?1Ã*qÇZÓ’ÚêßB‘\\¨‘P’qùPD)Ïîå\'1Æ½Iõ©$[I\'FYÚHÔcç=MN–é¤*_÷€¶à:\n|¯b9—¡YYàÜ®ãËoi’l[¥\"@©Œ(ç5u¼»Fh£\"FèÒ6sž¿­Â[å£Iå`÷¤ã )êAåâ%•³\"–ÇùÔ’Z¯ÚmÔº²eÉíVÒ“ÍØ±‚ÎqøŠŒÚÜD\0†RU¿„õ§ÈO>»•dXâjÈ8‘	È>ôJ¿ºLyn‹ó/÷—=ªÄÑíYq²BAL÷H™m”’.âG¨¥n…]ZäR¢!Y¢ Í—@Üž)gxãQ\"®ð_$à_JšmÓBÑ÷¾FÌÞ”‡rˆãbªÝ\\v˜—˜çTŠç6ó#‰*Ý×Ú¡ØÒ©¤`«zúÒ¾#’u…>C†ó=ý¨Ê(²À \'Þ¡ï`[\\U‰b—qÝÂpCê*°–!ÎÕ*Ž£`ÇNy4<Ó:F7`‚_héP“‚îÒï/ÐvZ›®…(¾¤s,›³î\\–éŒV%Ö &ms£09Å_¿ýë‡¸šG‰F<¥àjÆÔ®;|ýž$*ÈØà(õ4bŠ÷®2„E~\\×9y¯YiºÃ™3ðŸv©ªšž²-íäg	#7\nˆ¼}I®-¦g¹›j¹8LŽ+ª•$õfu&ÖˆÓ¼Ô¦»™]ä23¶ÿ\0º=«>mNT$ùh¨Ù\\tçÔUK‘s\ZªLYTüÁ:÷ªÁ°K2zq]‘ŒR8¥)7©`ˆ$‰ó~ÐÎ6ñòÞ¯}Ž[gYÌd.á¸c\0÷¦ÙY;âYœŽ>EîkzÂÑ®VY&ŒÉ¸\0]†JŠ‰Õ±¤(ßR¥ƒ]íeÏ‘\'\'‚i/,|µ1Gœä„?wêk£‹O\r	‰AŠ6õþu~5c_&ppYÈë\\î½Î˜ÐÒÇ‡&Ð÷­å(á#ÿ\0ëUë](ã“äì‹¦+¬k’O2Lœ§­2TŽÞ6H@$òI9¨uäÍ#B(ä$Òî¼µå×¯°«¢ÖE²x!Š4ÿ\0¦›y5¤Ðíé7rZ©ÝÛ	Øy’>È@ØÍ?hÞáìÒ9‰ X¢‘‡”òƒÎÞH¬¹²GÌk®}‹˜ü°*ßÞ³n#ŠQ÷¹ùEtB¡„é6Fc\'Šf£nÊ¢N£8«aî†ß½íÞ¦šÝ§áçŸÄVªV•ÌeÂÇ4i)ì0H=E2ºN¢’Šqh¤¢Ü(¢’˜‚Š( AEPEPESQE-\0RQ@ÂŠ( Š(¤ ¢Š(\0¢Š(QE\0RÑE\0´QH«.(—‡a(¥ÅP1´”êm1%-%2XQEÉE\0´QE\n(¢€\n(¢€\nJZJQE\0”Q@ÂŠ(¤EPEPEPEPÑE\0QE\0QE\0QE\0S€æš*EÒe\"hÅ^‰zUX–´!N•„ÙÙJ$Š*AOXø§yuÎ®PJ°‚£HñV‘i\\9Fâ¡u«»3Lh¨LN%´U¿&Š|Âå3¦j”¢´%jŒ¢”TE\'Ó;Ô®*#ÖºQÈÉâ85§jÜŠÉCÍh[?\"³šÐÒ›:k6Î+~Ðä\næl_8®ŽÍ²yõÛkGÒ‰:QÝ¦Êx¬P¸<V%ãõ­k¦àÖëõ­ µô1¯$äÖ4í’kBíù5•)ë^%¡ÁVDi”æ¦×AÊÂ–’Š`-!¥¤ AIKI@-%-0\n(¢Â¤AÍ0T±ŠLhµ\0æµ-»Vl#šÓ·ãÍPë¤jAÒ®\'J£â®!®9#¾$âLœ+&h8S…4RŠ@<RÓE:€ÓM8ÓM\04ÑE)\r-! šªÉÞ­5U’´D²œµJCW&ªRu­àc\"4ÜÐÆ›šÔÅ±ôáQƒO\r´‚–Æ‘P¸©ÏJ†J¤g\"¤‚«8«RUg­ârL€ÒS6´G;Š( AEPE’˜EPNi´áHh³sZvÏÒ²c<Õûvæ²š7¦Î‚Ùø£dV-³ô­8Ÿ¥qMðeàiâ¡FÍJµ“4Dª*U¨–¥Z’‰¤§ŠCša§\Zi ˜T-SµBÔ\r\ZJq¦ÓBb\Zm8ÓkH˜ÈCÒ¢n†¥¨Þ¶‰Ï\"´ë:ã½hÉÞ³î;Ö±2‘‘qÖ¨?Z¿qÖ¨¿S]9äDiÊr˜-òŽqL4g=ªÉ.G4/)`¡@?Åô¤·ŒNqócƒOÞe±\0œ:œ¥9UHŒ( óûžÕ# 12Æ7\'^\"å1³ø¸&¦š}¸ÁÆ* ¡¤hÜíeéõ ,(`\\|Í´œ;Uëh`7*û8ÏÓ­Df{„ŠÌ2Ç\nÜ­[¶ŠHí•äF‹\'Ì­Ã2ÔIè\\F¼ÒÇb-ñ²9$0ûßEW6¯˜²qòöÜ*Î£nr[Üy¶ã•vôô©-˜!•Ù¶J!<cÚ¡?t×–íÒüà—!Z\'ÂÃ•$ö©¾ÍäÞHw\rÐü›ç“Yñ<ž-Íå1-ÇsÚ¶´ÛQå&àG9úûÖU%mNŠ1»±©jŒUIäŸÖµDjcU1ŒUhª9¹«R>xí^tåvz°¨ªÓ\"ñòóš´	äš¯ov\rœ®jìG,YqŽ˜¬Ù¡\"™à—ƒV·\"(^H nÏ¥D`Iëšs ðy#Ú•ÄXVÚ¤l=rzSÚ&l¸Nzõ¨¨-òî\0t§I„Ú©†$n8íH–¡’`ÎØ^¸©#“|±ÑÆ{S3€8Öœßºª	\\cŽôd’:¤¨ÎûOeîjÄ¡•²ìcÝÂŽõ©“å¬¬²Üºtë¶¹iu««˜ÖØ‚ÍÔç[S¢Þ¦3¬‘ÒI«Ih¦ýÔ,6ù§€M6Îi®\"2 t@qçÉÀ¹ï·Iv©åZ‰^3†•ÛŒAW_T¸Ž2K•‘q´áé[{+hbê­ÍˆÒY.VHnB[Ærds–sí[p<ní$Gtò7ð}}k¶œ]Ýùò&1÷ñŽÙ®Zë>rÉë!Aa5×1íëG²dû].t¶þR1‘f\r™FHo­[†ø:Êîvnú\nàtëaiâ¿ß-’£\0}ªì¾%ó©fÇxmÉ0ê ô£Ø»ê£Ð Õ­QKÉ.× \ní\\{U‹]bÍÑe7QËÉÚã­yÊø†ër\\Md‘4j»‚ä‘ÜçÖ·¢ñÙ’&YTœ6|¸£Ú—³h.žÇojÖÖ¯3Ã¸$§–nxõ«¶ÌÒÅç\'–ì­€ƒ‚­y¤>-Ò&´iuÄã÷Î~_Â­ÇãË³y’Æo\'níß:ãŽE5.„É_c¼¸¹¼ò‰6Ì‘©uÜ=j_´ˆÒXo.FCccð6ûWžCãX„(¶°Íiô–qÆîüýjü7ž+¨ØÜ¥ÙeÚÎª0~”ö#gl÷q„Ä[¹ÄiŒa1LŽ:oô©ž0Ò€u5‹oâX®¿u1‘.!;„“.ÇÒ¥“V–Þc8¸Žf$¼O¿¥/1(½Ó6õhÊ\\‚>a–¹[¬2•e[øý+\"AàA&\'$	vû“RA1dinÁ†ù•>eëRä5eÔO\n¬«Ä¹U=….Q|÷xÁ%¶{U1/Ÿ’7¼S÷N÷\"Ü«\n}N*”‘/ O$^\\C` ©ô\0tªîWäe}¯“»ØSäbW2•aù{T2J†Lco§¥g\'©¬P‘®¡ó”$¨SCH¼£drFG&¡i:!™†N;Të#ÀŒòŽ_¯áQÐ¶…!›¶\nŽî* wb7\09ÛMf|n$Ž@ì*7å8=EKcHVr çÖ£#j €}i…,IÇ¥UiWhåç÷©¹v šfFÜ4Ä”Ã½s:mÎ£dJ:±ä“ë[—’  6HûÞ‚¹Ûæ\'žB’É8Ï÷šª,´¬sZ¥ ‘KM˜ÔàÆŸÇ!õ#Ò³NÛFó7y—H3as³ÜúUýFæYgb´Ç™ŽžÃÚª}†o%‘Nœâ®¨»-Hq¹2¯š^lÍw6NI©í4Ùd‘IBOCž1[VºZÅ†TÝ\'v#’+fÚ×`\0 ¹=iÊ¿D¡Õ™ö:ZÀæF ¿Lã¥m[Z\0KFHçÒ¬Áeæ•Ø6’qÏzÒKG¶SÝ×ƒ\\Ò›fÜ©¢¶EÃŽ§jYUQðƒþ•$ÀÇà9ÍPv‘÷nÜ}ë6îRE{†$”/Æ+ÆaÜ\'wZÓš)0$sŽj”çÊÁ#p­\"ÆÑPÈÎB“õ¨412GÃg–Í,Í³-Ž½*pAƒŒV©Æyh°ð~~äš¨äƒ’»ŽpN*rÀƒšXâ\'æåûÖ‰ØÍêgÍlˆ¥ÐíçMrŽTç\"µÞš&Ú {âªKlÊ‹ŽsW™Ê)	†å\rÈÍR5·¬@ÅRà÷;y5ŠÂ½\nnèòjÇ–M¥ ÒU™E%\0´”Q@Q@Q@Q@QLAKIK@	ERQE\0QE\0QE(¢– ¢Š1H«)h¥ vœ\0RÒ\ZAŠ)h bR\ZSM AIKILBRRÒS%…QLBÑE)i( ¢’–…Q@%-%\n(¤ Š(¤0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¥¢Š\0QR\'ZˆTˆy©eÄ»jÓzVd‘ZöÃ8®j‡}Ki ‹Ú¥‰8«:år;”J«L©SyTáÃå“Ë©ÂRì£˜\\¥+ÚŠ±²Š9ƒ”ç¦Õ	GZÑš³æïZÀæ¨SzˆÔÎ:ÔFºQÉ Z¹`Š¦*ÄGšRC‰ÐØ¿JélŸ\\…”œŠél¥àWXpgG|´Ù[Š‚2¢–Gâ¹Z5F}ÛpkŸ½=krèç5‡v3šÚžâ–Æ×$Öl‚µ®SšÍ•0kÐ¦Î\nˆ¨Â›RºÔDVèæbQEÄRRÐIKI@‚Š( ¢Šp `5:-5¬\"T6\\Q,#~ŒU4«Ø¬d®tÁØÓ‰ñWë&91Vã—Þ¹¥²4Õª@jœrU•lÖ\r&J)Â˜\r8\Z‘´Ú\\Ð\0i(¤4JLÐi)Ph4™¥4ÄFÕZAVA ªBftÂ¨Ê+JQT%¼¦Sjniì)†·G;)â£õ40D‚”SE.ip5†¤cPHj‘œÙ^CUž§óUœó[Dä›#4”¦’´0bQE(¢Š`%-PEP ¥¤¥†H‡š»tª\ny«Q5D‘¬³lý+RÈ¬(¥jA\'Jåš;a#Z6«*j„MWc9®y	–V¥Z…*u™hp§R\nu\0&i¦L4††µ@Õ3T-ADf’‚i*‘,\r6”ÒV‘1†£j~j6­¢sÈ‚JÎ¸ïZ2t¬ëŽõ¬L¤dÜU«÷Aëxœò!4‚ƒÖVI~ÝŒ0Éäû\npsöSÊp	¨íK\'ÜÆææ›* eBÇ åš§¨jò7š6¯½\\¶°’h.5	gŽ„¡ºÈIÆEµŠm…[`¢2dòâ\'\nÌ=)1¢ËJ]¤I°º”–:¶§\ZÆÁ2›nŒƒìjµÌPÙ]É\r¼ÆN\0fíJrZ¬ì« %QIùj[EÅ2è+/ÚH“×éM²ÁŽFØF2AÇÞb8q££ÆÊ¡œïå\Zm´ÈËÈZ(—hÚ1‘X=š:’ÙÆ‹$‹>åo˜ëé[Úzâ]™è;Ö6fv”¹<[–å•™°3Ó&¹ë>‡f:\\Ò2;ƒÚ¬y%“#©¨U‚„’G9«p9\nÈß¥q³º!\Z˜ÈÁù±V‰\"2Ã:S\'ÈXü‡ï`óJHì¸;GCPPåb>]ùaNgÜÊI\0Ÿ»Š„­Àù~õ4HASÏN;P&$‘öœ©Úœf¬™w_­Kq3™¢MÛŸ9Ú{ÖF£x«¾=ã~2XïŠq‹“3”¬µ4>Ø±€ÒüÞXású‡ˆäûpD\0°<GY¨M}º=ÀÏCÆ\0÷ªP¬s$®\\ÄTüËÔŸjì§A-drT®ö‰^âæ[‹ù.§m®…\'!jK$Šb|Ögbrª[ho¯µZÐÐ¶«Ñé¶÷m>U×ÌƒÝªôú0i¥¼ÖPy ´~TQì+¦éhrjÝÅÒÔÙjL†%Ÿå8ÛQGsSµî‚ºD–Ê.â;‘K|’óúÕ\r>ÇLû\0’kˆžBÄ0•·1ˆjâËIžÒÅæŸƒ½ŽOÓÒ–—ÔNïaÑê°Z>le’)ÀÃ.8¬¹!šá˜L²\\*Èpüì®¦žÖ—M#Aqqj¼È`\røÔö)™.œïà‘\ZK·CëEÒØ}L›>ÚhDjMÃ´x#\'éR[É°”Árv¼NpÈ}k~Á}o<š„pÇpÜ­ÄìX±ôõ\r¥–›yWSM\ZÜ822ò1ïKžÊÌ¥NúœÄú¦©.ût˜íÇ<òÕ³\"Óô¯´Glˆ›\09ù·ä:Ò:-´“¡òÛ—>SNÞÙ XÝèâ;UF!‰Y–YAíƒÀ©uSÑ\Z-‹ÞJ}äÝOÊ¢\Z™R·–+(\rÁÉSÂ»æK}I|«ˆ£2ÛŽ67|Vü\"Æ+¼[\\‰m”eå”tÓhõ	Q•ôd\ZMÞ‰<±Ãö™-`wÁIœº&{àÖüV¶ó–[{»YvüªÈ¿)Ú³äðŒ!$æÎY8?B*TÓŸK– ¥c‰¹I•SéžÕ”e±¤#%¹ySWóawk Q“2\0zbŸe«[:HÆ9,çnùNÐ~*$k.¢\ZÎªÑ±ÅÜ³úgÔUÛf[i^xâ¶¸±”ñÊ€¢þe&¬iÍû]gP·ktº2	@\nøý3Þµ¾Ð±ÌÁœ†\'û¿ZÀ‰c·ÚmP‹ÆbåSì*úKn˜š8¶ÿ\0x‘XI—ÊoÛÜª“ÈKÎ:b¬Å,Dq‰rx~Ø¬K[‰0A\\ñJÐY6 Àù{JŽa8\ZÍ0d!»pƒ¿áT§0¬¥Y¶¾2Ø¤™”>Iã¢˜M+Ò0‘ãæõªr¹™\"³«yv\0…?‰§<»Ø3I½ÿ\0‹\'½H…5ìápìzš¯3ª¡“É**^ƒZ±û”,„Ê7XzJ‹võòÂ¨Üs“×ä`]`ŽýI¤—iÆqÔÔ¶ZC]ØGzÎ¹vŒÀžÒ­HÃÎqYWoÆò{Ò4Š!º¾X–L°\0zW/}|Ó©q!9=«ºœæbcŒœu5—žæË@=ëh$µ)¢ÐËóa³ïZ0Ú—\n	 u«Y¨ÚËÔöô­`	npè\0¢S¬TŠÍ\\®Õ\'<V•½ -™Œp¿ZšäŒ¬¡ö¢üÄõ«1…ÞÒ\0ev?0cÀúT$)K±?Ùäòâo$§ê;Ñ4`³°P¶P)%¹¶²E30ý\0ëô¬YuCT¹km6\'ûëüÔÕØÉ]—n^8“Iêk\"ëQ†8ÆÅgç­I¡Éš\\]\\§.Q£qÈã5\\XÈGàžõ64RVÜÆº¼Áùv¯QY3ÏpPŒŸ©®†åa·²¨cX÷76¬øó£à.z\ZÖ	ôB”‘…=ÕÐP	Qþrýì0ìjÕÊÆK\"²ƒÞ±¥\"Ú`ÈA=ÅtÅ&Œ%+ji\0ù!¹Ï¥XŒ”ÀÉ\nN0Z¥\rÌrco^ätÍO0sS$ÊŒ“4Bæ\" Ò£h˜£aò˜äTð.v·\\õ54±!B§…5ŠvfÖ9]N6ÈŽkše®ÖæÔobz\\þ¡§¬J]?\Zô(TV±åâi6îŒR)µ#\Zeuœ,J(¢Q@Q@Q@Q@Q@Q@‚Š( aEPEPEPKIÚ–¡E.))àR-	Š\\RÑH«´R	E-%\0Ä4ÓN¤\"˜„¤¥¤4ÉÒÑL–%Q@…¢’–˜‚Š( –’–€\n(¢…%PIE\0QE€(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(£´À))h ž½i”åëI`<ŠÙ´ç‰äVÕ™é\\µNü;6à®*qUmº\nÑx®	3ÔŽÄ~](Ž¬„¥òé\\eo.—eYòè1Ñp*ì¢¬ytQq”õŸ/SZ÷¬ù{×M3Š¡QÇ53\naÒ™ÌÑ*XÎ\r0ŠUëL“NÕðEt6Rô®ZÁ½e\'JæªŽŠléà“ TÎÙFÝøhœŠãgB*\\w¬›…ÎkZqÖ³fZ¸1n#ëY“GÖ·\'ZÌ+ª9ªDÊu¨b®Ê¼ÕWÕqÉšm<ŠmhfÄ¢Š(´\ZJ(\0¢N4\0 TÈ™¢4Í\\ŠÔ¶iq‘ÅíV*ž8qÚ¤)X¹(•ˆÅ7~)òqšªíŠi\\NV,¬µf)½ë+Ìæ¦ŽZ™@Ò\rØe÷«±ÉXPÍïZÍï\\ÓÙ	ÜÕVÍH\rRŽJ°¯šÁ£dË–˜\Zœ\rHÅ¦šZJ!¤ Ñ@Â–›Ní@†‘QH8©È¨œSB(Ê*„£­iJ*„ÃšÞr(8æ¡<U‰5]«¡Ò\0iÀÔy 5;r`Ô»ªÔn¢ÁÌ9š¡v¥f¨]ªÒ2”ˆÜÕv<Ô®jkTsI=i)i\rQ›\n(¢QLBw¥¤4´JZJZ\0(Q@<f«Š‘5,¸³Fæ´ zÇ‰ªüÒ°š:©ÈÛòhÂx¬{wéZ6k’hê‹4#©Ö«ÅVV±fÈu- Ò¦šiÆšiŒŒÔMRš‰¨¤¥4”Ð˜†šiÆ˜kH˜ÈCQ±§“QµmžD2w¬ûŽõ~NõŸqÞ´‰”Œ«ŽõBN¦¯ÜU	:×DNy\Z\rH1š²I£f:Õ•Œ<`‘Îy5Z6!ÀÎ*è‘c,±òØÀcÚ“9	™!-u#\0ö©b´Cl’CJp*¼QìT|	¶ÐZk˜†ÏåPËEË»ƒk+vq»H†H8|†ÇOQPïš@Å¤-ô=jÍŽö¹F‘¾ïÌóŸj—±qÜÜµŽÕ­¦Vy/o˜Èï.Gõ¬ËrfŽNŒã¹©šqçÅåî1˜¡èZ£hc)3L»dnb	õ¬N„[ÒàuÙ†wr=«^!ëšÏµÌ¨ÏN3ëW!3‚A®JŽîç£EY$kì\\9ùjÔJ®2Ì@=j¼G0\0y\rÞ­@»ÕKc¥r³© 88L-J0íâ’=À’¤pp)àmLžýj7Ë3²©l/¥=åK`@°\0ïLŒílþõ&6ñ€\0ê{PK2®oEªîußs\'	ƒ÷}«˜6s]ÝL÷#$Ë&p Ù­ÉmRfû:ùp†ÚÒž˜ö¨5d•ã¶Õ¢„å†ÍuS|¦UÌ¿³\\ë3*EnðØF3^¤Õ­JÍš‚bcB!Â®êzŠNBYy’mÉÚ‹øúV\\ÐÈÎÕäQüß3©/»ò­“lçqDöº²Á‡ÔWN‹§.õ¾\ZÓ‹€Ú¢½Î>äÏ¹‡áWSC‰öíG’!Ê)cü«j×D›Ê*Xå^!–úž´[lÅì»˜¶z5Û[–“Ç1€@÷ïW-tÉUÙšÇ\n£ô­öÓ´ûvG¸Ò|²OÌÐÿ\0ª¯Á¦Ä5½à7*%líš‡TjÅÓ£Ô­í¦îåÉ”†“Ù©&Ð¯¥´QmÖ2™\r´gñ®…,ã‰ËÍå• €ÉÁ®%¤;b1ÃÍ¼:Œ6}ê=£*G?e¢êQª	#°1Bœm2\Z±k§ ²0ÜiÑ~ñ²Ì£§°®•¢³{H¥šÕáêvýï­^µ´‚U@Wr°ÈàsíEÛ%ÊÈãÓJ¶yh5ØªG#Þ’{ØfX¤Ùqchù:×rúeªÀîÑáÇEVj\"Åš±²3s¶&ïRÓ[Ž5Øä®,DÀ¼Š#ÊÀ}ï­U—OˆO#Ë˜òNxsí]£[	&%Ý2äƒÐqT’¾W˜®þ^ãµ¿QSsE$r2éSy£n\"rA<\ZÙÑá0Énž7 þÐ>5‰ŠÄ·\0õ\\éÒylJàÅ.fh¬ÌU³o³™OîÉî([Fe”‘€F@þðô­cnñpÁH<’yÅj1’¬I=sÀs\\v!‚è¥’æ6†$J±ÍXŠéE¾ß,3†þòö¦¼	È\'šO$t5-•`“äUÆµ\\H 2Œà­fÂ¬ŠA“œš¹%íëPÇdjÅ!‚x«ßfmÃ{v‚OcT-ØíöÍh@¤Täçœö«‰Ï=6àÌ£\nƒ¿ÖšÖë,Y<²0AÎ}*rø`3óg¯Zd¸‘Ô3’ØþÅU‘šl¡8w¢¨1Š†F`U©„è£°ÍgÜ‹„`H=}k9ÇR¤ïŽÀ¬;ù¾R:VµÃ|œšço¦Ì…G4EjlŠ®w…§z·HŸÒ«Å÷0V¯C\Zäv«ld±º¨\n9ê*Üª7²Á¹Ï ÔIjXåN9éWâ[‰ÊÛ…}‹Èò‚}Í	)\"u*öÁV_˜\rûAZ{‹…–HmL´`n?Ã=ØÓ$72ZZ4\"â$ýýâ.D)Ü?ÅUbƒO`áã°-’ìpÒ7÷›×ØVŠ\';•ö-ZÚ#ÊæÍ›j¦\'»‘¹—=Q3Ð}*üïk§X:y°ZCÊ[¾¾µËÝëÓßÙÜA¡iÍ<ª—l¼¨úöå:æ³¨ê’“5Ã˜Á#jž8®št\\Îz•Tw=3\\øefª.ØdvRQž¢¸mgâ§¨Éû³å(<`bº}jÓEÖ~Ùë:§‰¦ºÖmÀŠÞ0a9ÿ\0W³è3ž¼\nò¦Vã=\ruSÃÁjrË\'¢Ð·.³}>ï2á›w\\š¯‰æŒÈ2Ž§Ò˜WIàøb¸º¸·”Œ œÖ’jºBŠ”ä“g:.fB?xÜtÉ«&ý¤\\>;÷­]OCS<­\n ñŽõ…=£ÂûrÒ”e	Žp©LÐ¶¹n6¿«ZÑæ®jå¢wûÖå…ÑÞ sëYÕ†šáê]Ù}ª6C÷zÕÂáÉgÔŠ«b›¢åñì*Ê®Ù‰\'§N+Ì–ç¦¶3.b ²ã5‡~¤Û6zŽ+¥¼L†\'ó®zðnŠUàãšé¢ÎjËC“”aBjy¾ñ¨\rz‘Øñ¥¸”QE2BŠ( Š( Š( Š( Š( Š( AEPEP0¢Š(\0¢Š(\0¥¢Š‡\np¦\nx©4C©i)i†–ÐEP!(¢Šb\Zi¦œi¦™,J(¢™J(¢Q@E%-0\n(¢EP1(¢Š\0J(¢€\n)i)\0QE-0Š(¤EPEPEPEPEPÑEÄQE\0áM¥i1¢Ü\'¥lY·\"±\"5­hÜŠç¨ŽÚS¤µ=+R.k\ZÑø¯p+Ïš=X=Š¹©Sc5aEdhGåûRêÀZ\nÑp*ù~ÔTûh \nzÏ—½_Ÿ½Q“­vÀà™]…FELE4ŠÙ3ˆH¦ô4öÓZ¤C,BpkfÉúVgšÔ´|YÔZ\ZSgQlü\n¾\"±­eàsZq¾EpÉju!%BaZr*”Ã­2çk6qÖµ\'ïY³÷®ˆM²ŠªÂ®J:ÕF®¨œsEvÃRµFkT`ÆQKITHQE(P*hÓ&‘5rsÚ¥²â®:sZ0ÁíKoN+F8p:V‘Ó°*F^q´V}Ã`\Z˜êT´EÛ­Q‘ù«½Qv®ˆ£šr~)É%W&”6)´J‘£Ø«ÑOŽõŠ’U˜åÇzÊP:!RÆüSûÕ¸æÏzÀŠz¹Ç½sJ™Ù\n¦êIS+æ²b¸÷«i6k	@Þ2¹wu¨LÔª,Zc©3Iš3ABÒŠnisHCª7©*6¦„U—½P˜V„µFa[D‰òõª¯Ö­J9ª¯Öº\"rÌŒš3Hi„Ö¨Å±û©S7RNÄóf¨˜Ò“Q±¦‘œ˜Æ5§56´F,JCKIL€¢Š(\0¢Š)€QE\0QE! ¢Š(E8\Ze8Re\"ÄmWa~Eg!æ®DÝ+9#h3jÙúV½»t¬fäVÍ³p+Ž¢;i³^V’©ÂjêW3:%!¥\ZFi¦ži†€#j‰ªV¨š‘\ZJSM¦„ÀÓ\r8Ó¥i	\r5T•VÑ0‘ÕŽõ ý\rgÜw­be#*â¨IÖ¯ÜU	:Öñ9ä@i)¦Š²	TóS†ÊƒÓµ@µna™É^~”˜É£vŠHŠ¦ÇƒO<Ô2äîïž¦£ŽWó0¼€9ã5qÎq$‘Ÿ-n:Vrv4‚¸ØO“ä²í;AÉÇ^*H|»›YCyà€tÆy¦Îât‘Ñví8UQŒ\n-1Ñ»k1ç=ª[ÐÕ-K ‚hŽÏ™G\\wõ«q¹•æ|É$<³u5End{¨ÖcºrMh¬ÈóáP*×Œ´GE;6XVÊŒ¦3úU˜×%FsÏì`ö5,c,0yê+’G¡l[7È#îM]L.QN1Ï5JÛ	·OZÓ•Î[¨ë™±!\n`n9©A\rÕ~PØ©#PÑëÐqíC\r‘.ìÖb¹DÄÞiebG­.Ö»+,mÃeöñ»ÛéV<²í×mKö¸íÈ\n›øä”Ð6Ui¬4ØâP	Óhê{\0+…¼¹Ô5]@â)#€œ\"¨à{šê\'ŠîéÃÌ±–-”M¹TÃÖ¦µŠîâ_-£p€ñ»ø\nè§%\rLg˜–ZQöÉbž79Úà¶ßé]E†—hm´ØÈÊòþJ³\r½Ä.E»FOt—•5(hÈa${O@W ¥*£m„[(”ªßZGÓï…üéÏoa.¾at ñMd,À`¼\0M5aºc&ßÔ\\‘YÜ«£Uù‡ÚænàJy>Ôáem$Ee‚&VûËëQ/˜¸/( }ª2TÈÈÐpz0¤ä5ëB‘<j‘ HØa1ÁÅ^[°÷(®‡’ªdÅ7ÊP|¸û ÔÈìH%zjWr×s4Ï+Eè‡¡=…^E•–öâI]p»O(¾Þ•…„È	\'# ÍlBYâ‘ÚhÑ‘GzÖg5EbóÆ³>Ð<·A´¼Ÿ1#ëTnÔÄÊüëÈ(ÜT³Igå7q¢Žvg­Q»¾°’7^ÄfÀùWµT‰‚w!“\n7d“ŒŸ­VYäAˆ]×wR¦£óá•p²†~˜­U88^bt¥Ü»æí`Çõæ¦Ë‘‹H	Çä?\nÇ3íc¸c¦qOlÃÞ”î7KÉ†]Ø ò;Ômk\"`…=³ÓÚ¡ŠG0ùƒ{Ž¦¬Í V(Wdd¡›õ£ ¬Ó± V;£\'Ò£%\n0ENÛÔ‘ Çzªî¢ly[\0ês×éH´ÃÍ>`^Z‡×òªŒñ»åWÞŸì8ÏáRU˜‰ÛŽ„÷­mPÇ=³Žµ“o9Æ+J\'ÙwsÖšf3Fœ`dp¨«ÈãúÒÊª‘»JO–~ZˆN\Z4Gqµ†~aÒ§W˜!HènŽWs&~›ÛaÐƒµe\\7G>â·.Ëä“Œ‘Ú±.-Â‚à¶[“žÆ°–çM6bÝd`8ô¬)QšbVýÑÂ¶kŸ2¶NqN\'A4( äÕèÑr8U~è#¦9­=ìGƒÂ¶(ì®li¶Ï<R˜Ç—ÆHîjK”kaojvÞ¹È•Èm«ÜûV“l‚‡Í;BóúWã\ry­,,bßtÜ»vÐšÚ+[#’îL›X×ítûhíÑTìmÑÇIW_Æ£Ðü=?‰®\rÆ»<Þ@_1aFîqƒ\\÷‡åÒm…ýö³3M©eE´qÃ¾ïé]–ñ­íÒÏEØ§sr~µ²I=HœekAÞ›¤Ãmcsiº%¬¨\"EÀÇ¿­|éã\r\r;Ä×P-ÄpF\\®1´úWª‰·Ì[JŽÃø×â‘7Œn’æèvAÉúÖ­³aªnÏ+•Ds2|¥‡qÞ£Á5ê×^Ò¦ð}®‘\rœ\"ö)Œ²ê1æ0Áwz…`ÅáØù³2ö\']Z…‰XI¶q*¬Ä*‚Iì+´ðš>Œ³\\\\¦×•vª‘Î*Ì	m`ªÖ¶IóeY•rÃñ¨n‘®âfÑädw¬jVçVètSÃò;½ÄÔgyw<h˜\'ŸQXÓÆ­º7€îÇ&·þÂ×¢U]¯ÜŠŽkTò—<¿LÖqš‰¼éóØ°IÀ\'5«¦éª­»¡«ëh¢0«¶Ñ`ZsªÚ&T]ÉaFŒaxúÕÒ\"±<Óz¨©U³Ø’½=ë•êt¢…Þí¸x¬Œ{‚?\Zèï2TðrkûpB@Îx­è½NzËC‰—ï\Z„Õ‰Ô¬®Á«šõ‘âKq´QE2BŠ( Š( Š( Š( Š( Š( AEPEP0¢Š(\0¢Š(\0¥¤¥ hQN˜)ÔŠL}-4Ræ¤Ñ1Ô”Q@\\)3E%š	¦õ¦ ¤4R\Zd¶\Z))QE\0QE\0QE\0-QL–’–€ÑA¢€\n(¢€\n(¢€\n(¢€\nJZJ\0(£R\0¢Š(\0¢Š(\0¢Š(\0¢ŠZ`QE\nZJZ\n(€š3Íi[61Yhy«öíƒYMž§Ehü\nÙ·~•ÏZ?JÙ·~•ÁQµ)hlÄÕm\rgDüUÈÛŠçhÝ2ÚÒµ1Z•›Š‘¢™ºŠ`p3wªOÖ®ÍÞª°®È!\"˜Â¬m¦:Ö‰™´TqQµNãŠ„ÖˆÉ‚UÛy0EQjh›I\\\"ÎŠÖnœÖ´2äW3m/JÙ·—\\u\"uÁÜÕÝ‘U¦§£äSdäVHÐÍœVdâµ§^+:eë[Á™ÉRŠ¦õ¡2óTd5ÕqÔD\rQ\Z•ª#[#4”ãM5D0©SJ‚†±\ndÖ¥´]*•¸­{eŒÙ½4]‚,•cØð\0¥‘ð+Ÿs£bµÃ`\ZÉ¹“­\\º—¯5‘q\'ZÚ1©\"´Ï“UXÔŽÜÔ$ÖéÍˆM¤¢™#Á§«â¢Í.i4Re´—êÌsûÖhlT‹%C‰¬jXÙŠãÞ®EqïX).;Õ¨ç÷¬eLé…S Ž|÷«+-aEqïW#¸÷®i@ë…KšÁóNÝTR\\Ôë%dÑ²w,ƒKQ+f¤¤wÚ˜Ý)Ô@¥ªS\n¿ ª’­iKFd«U$£*Õ9×DYÏ8”Ú¢nµ3Œ\ZºÖñ9f&i3M&›º®Æ-Ž&˜MÓIªH–Æ“M4¦’¨Í…%S$(¢Š@\'zZNô´À(¢Š\0(¤´\0QE\0RŠJZ‡©æ¬Äj¨©ã54‹5m›¥mÚ·¹ûvé[vÒ¹*#¶“7 =*ôunx~3\\ŒêDâƒ@ ÒÓQš‘ª6 Ú¢j•ª& dF›N4ÚhLCLjsSZµ‰Œ†ÔmRS\ZµF ~•Bã½_“¡ª÷­bc#&â¨IÔÕûŽ¦¨IÔÖñ0‘u¦Óš›VA*cv	pº¯WÆï¥PSSÅœŠLhÖ…UÝ úÓíYÙ•§5RˆÙ1“Ú­Z»£\0¸lž¹¬doOräÉn ‹ìá÷ƒûÍÇ¿µE\r´——q&Ï•y`xù{Ô³)HSžsJí(e-×ƒŽ3Y&tr•¥D@Ås—$è*ôÆ?>%‹8U¹ªrƒ±X’@oËÚŸH.‚GriKb¡ñ\Z“€¾êh·)ŒóQõ}¹Ï¥Y…Nà;W$F&¤1ç¡äVšà;Vmš·Áç¥jDØBØ†¹dl[YÁŒð@«D¯—°Oz§¼4ÀG€˜ç<Õ¿”0\0’¢¡‰•K‹ÏOš£’)×›\0?Ý5eÁ,p@ô[F\'Fq#ü8âš)HšŠGû³+`ñ»}*r¦é]‹œ¯bqüªÓÂ‘«´©õ99©’ÕãpL²*‘Ð\Z«’Ìñm\n¨PÒnê7œMUXÜ Ã·8ŠÒ;ãc¼CÐÒ©ÊdßÁéô£˜!2Î=é²pUø´Ær	ät¨L¥ÏLÒ\ZA4ÎÏò’0yÏzNï›•\'¦*œ×PAy˜è:Ölš´“!ãËN€ž´(¶S7eº·¶LÍ ž1TŽ´Û‘lž¦²£„ÈT’Xú±­Hm°\0g8ªåH–=n/®°7˜GªðMhiúMÝì®<Ù$y©ëyg§ÉHá~uðéYwôÍ3p‚,Üä‰d\'©ö«„%-‘ÏR­–‡LÞD&\r)‚ßtýkçO‡O²ö}íÜk˜—âF±«YÝÜ[ÏmX l1\nò}s\\½×Ä=jêYe–]Í Á,+£ê³{ë£»;‹‹a\0¡V##iéP	¦·“tWrƒŽ1?Î¸?øLõ2w<Ÿ¹\"­[ø¶âv\"[}ÿ\0îÐðµ5XÊlî­õË«JÊÊÝÀ«ip­&#bpxÏÉXë‘J£ËsTö­›kˆîB\rØôÁ„©µ¹Ñ§ª:{®v‚~™ïW‘Ü³I…e[†,¤`®>ð>µr2VEFR3Ü÷¬Ú+sQP²qÁõÍG-»¤üÞùÍ[³‹{v€3ÍX¸‰¤žáERÈI?tþ½.Wc>k3%bSBxô§0Ø*lÔÎ¬¨ÔñéHì§$gŠ†h™bÆ@À«±eî1ÅS…ÁŠ·	?…\"$j[ºÊªf]ûCÜÕ•X`±8äçÞ¨BÆ1Ð÷«\"BÄ‘“ô­c#žKQ.\"Âe\0#Ö².AÚ}+JYG˜P‚3Y—.ÄŽô¤];œýêáˆÏô¬	ŸCÞºK°¯’Ãðƒt¸lŽ(H–@ë^Ë÷]W¿JÃ‚\\ºŒ?Zé-\0h·ŽTué=Å\'¡bÿ\0W6\Z\\÷®ŠÆ5ùCsÏjóa¾Õ®ŒÓHÈ³1•×<ê\nôÆ³è‘D#VW”n9ç²-ôµùHDJ£ëZÆ\\¨Ê)nUÑtkKuE!ä »[ŽÕÑZÃj±L¢7h\nUzsUšÒÜF]¦lBŸ\"ÈsŒžÕbM¡Sí²¨a½„m€ÜtÅ=õ	=šÆ1gtF rwŒžÂ¤š)ŒÉvðÛ³¦J#×ØÔ°‰aa²ä2©ÎÉ”2îíJÓMÄ’KLØáð°¤-LÛÛD´Ón`´kmé†\'<’xÅGgµ­™8	‡ƒø²9©®ãIˆg…Ac¸åzš÷òþµ<Å¨™¶6ÅHãÎXTSZù~bœÞ¢´ƒmÁPÀ TS©|ïÍÚš$cù^P(€àöªff|ŸZÜû;ç9æ›öS1Å5 hÍ{eeÀ\\QVc·&0\nƒ·¾*ìvÅV¥NcÚ¸Æì;ÒrŒæ(	à)ÎFàŒyè­X‘FqÔTr #Ž¾¾”ÓQ™ÀÎ:V5òŒ`/>•ÑÜ/ØJÄ¹P…›qçŽ•µ\'©E¡Áê(éöô<Õ­ýz\Z9At<Vk×¦ïÄª­&ˆè ÑVdQE\0QE\0QE\0QE\n(¢€\n(¢€\n(¢…Q@Q@˜¥ AJ))E\nZJZE!ÀÒŠm:‘hZ)( aHMÒP ¤¢ƒL›…%S$)(¢Q@Q@Q@ES\0¥¤¥ 4Ph AEPEP0¢Š(QE(¢Š\0))h ¢–Š\0JZJZ\0(¢ŠQE\0´”PÑÞ’–^µräU%ëVb<ÖrFz›V¯Ò¶mßXÍÒ¶mÛ¥qTG©FZ0½^«*«Ñ7ÌÑÔ™ ­N/U•ñHÒTX«’ï¢ªù‚Švœ”ƒ& ÙÍ[uÉ¤×Bg$‘[eE\"ÕãZU«L†Œù5«Rj»\nÙIâœ§RRŽµD¢ì\rÍkÛ?JÅ„ò+RÙºVÑM›Q6EJFEV€ô«È¹Èô:\n2ÇT&Š·Õ9 öªŒ£žž.µ4uÐÜAíYsÃÏJê§3š¤w	zX°zUfJé‹8¥RSÊ‘M5fM*d¨jE¦$h[šÖ·~bBØ­eÀŒÑ¼²²àT3MÇZ«çàUygÏz…G1·g5™3äÔÓKš¦í[EXç”®134¤ÓkC0¢Š(\0¢Š)\0¹¥›FhÉUÈ©RJ­šp4š)H¾“VâŸÞ²UñS$¾õ” o\n–7\"¸÷«‘ÍžõƒÕr)ýëžTÎÈU7J°­šÉŠj»™®yFÇDerè4•\Z6jLæ³±dl3UjÙ¨\\U 3åNµFe­IV³çÍme36QÍUsVæëTœ×\\\nŒŒži¹¡35²9Ûši4RS&áE†˜‚Š( ¢Š;ÐRÑE\0Rb–€\n(¢Q@ÂŠ( \n–3PŠ‘5,´hÛ·\"¶­¥`Ày±hý+š¢;)3 ¶nhÆk&ÙºVœG\\RGb-©¥¦)©*JiR\ZaTMS°¨XP2M§šiéM	Œ4Æ©\Z˜Õ¤Ld3µ4Óé†¶F ~õB~õ}ûÕûÖ±1‘“qÔÖ|Mh\\uªu­âa\"»SiíÖ™V@àjdnGqP\nzšLeÄ\'\0ö«ð†µRˆqèhÛÈF\0^‡5”Íéî_0åcy·ªŸZ†c&ÕM¤€Ùç §­Ì‡(wc<U¨h|ÖP¬HÛ‚à×6Ç_Äeyª»ò2;/¿­KŽò4­œð*!JK\0¸ô§G ÈSëÇ½[ØQßSbÞ@O#š¸¬‚fÛ6éŸZ¾„08®I­OB›ÐÙ´Àa“ÏZÒ„ˆW‡dug&æÎjÅ\'ãŠä‘º.ÚDÀ(çéV‚m-PY±sò°÷5tD\0Ý“ŸNÕ›[‚§\n	Çzh·›²lP06Š²Ä\"©S×ÖŒAÞ„É*€!VXõnù©K¾ÐÌüôÅOµAÁÇ®iNOéL›<åíf-T€bAÀ«’)Á sê+6RIÉ§­Äqm9àtÍfÜÜ:T|¿Þ5=ÅÂ&ƒÚ¹ûÛõß.~ï½iÜˆc)šS$Œ\\úšÒ…\0H+™›UòX¨ž V|ºõíÉ1@DaFKz\nêT%#	â!ÎâmNÎÀ–™€wšÄ¿ñ|ÓÃ\"Ø@Dw~;šâÃÏypŠò<…¸9¯Kð‡$Ôm-t ˆ¡$3\\NzóÐ\n×ØBž²Ôäx‰OmÄøŽMVÂ—w,]PgaÀäW;‚[æ9\'¹¯ ümðò-I¶0˜ÂFÑÕ°1ŸÒ¼\"âÙ žH\\aãb¦ºhÍ5c’¤\\îkx>ëÃ¶:ÓIâm9ï¬ŒeUQÊío^5‰t±d’òáwcDä¢çžüSpE4)-[)Êã¡·3Hª£šíþZA/‹£†XVU+‚­Ð×-ÑE	Tá^ù®ËáíÕ¾~ú•âlb$<sëXU—ºÎštï±Ýø›á–•x$»ÓØ\\˜„cµ¿\nãì¼3­X_¥¼À0q˜\\t>Æº­Sâ’¡†ÚËzsŠÎþßñöÙ­Ì~ù^JâsvÔî¥NH¥¡sew,Pº¬oµˆéŸ­töwvÚ´JÖ÷I#(ÀC÷”×=-Î¢l¤¶§xã=óëYóYê_¸–ÊÍátù¼È×\0ýk;)\r5©èÖÒI¯˜ ”þ*¹{r%H¶•ÙÈïX^Ö^ýôAo\0áÇ«Y•”¶ü\r¾µƒºÐ†µÔiÃ«1ÁcÔbª®K°ÍhòÙwåyÅQaûöãhŠ‚âÇGž¦®ÄøÍgrqÜUˆäÁ9éëHm\ZÈJõêjhç`ØÀëÞ³VpÐ‘U%×bK.5bSï{ÓDò7±Ð’Ò«½ž9¬ùâÆF8§Eyæ |mÈéNrJ‚O©»¢i˜WVìrO­cÝÂAéÅt·8=:VMÊÆä¨ûÃµ(³tÎtÉåJqZ×ò!¸íU.í¶å€ã?­26é‘óVh4tRºÎ°¶FÜóïWdµŽEW·%Qožkž†_—i=ë^ÂèÇˆÜä7•BemžTRKöq$œtëÅ5 (\n1“±•ø+Ž•yNÀ¬\\mÉä\ZšXKÈ­\"ù¡{°ëõ«HÅË¡œðÈÕŒ;ã5(ƒïn(…G@:Õã€áX|¼ÐT’î	‡+‘ÆUG#Þ†…Îb´\nñ3²³v5XZ.9µ^ÙÁßÔn\ZYb+´…\0µ™ª‘öq‚1Ï¥5­o+ÏnkNH6¶AƒËšCæ3˜ÉùFH¤6ª‹÷y«ïò÷c\"˜ªYwŸcJå\\Ïò¹#=*6P¬«žMh²mÏF¾`\'W½0¹žñäãè1Ò¢(üßi<x\'žµTÄI%±šwBæ6#+Ôv5‰z±ò:õÓK´dr}ë\ní$\nÿ\02ûÖ´ÙWG+¨Cö½>H£\rß“ßÉ8¯@ÿ\0W}Ý„s´Œps\\~±gö-FX±…ÎGÒ½Zèy8šv÷Œ£IN4Úê8B–’–€Š( Š( Š( Š( AEP0¢Š(\0¢–Š\0J(¢€\n( PKE\0RÐ)i‚”RâŠEŠCÒ‰E\Zb’–’‚XRRÒS$(¢ŠQGz\0(¢Š\0)i)iŒ(¢Š\0)i)h\r´”\0QE(¢Š\0(¢ŠQE\0QE\0QE\0QE\0QE\n(¢€\n(¢€\n(¢€\n(¢€*xÏ5\\T±žjd\\^¦­³t­›cÀ¬+cÈ­«SÀ®:¨ôh3^#VÑñT¢<U€ÕÊÎÔË^n*7š /P¼””AÈŸÍ¢©ù´Ur‹˜ƒfM<ER*Ô»8¥rNDÅPœu­9†fÏÔÖ2‘BAÍ@Â¬È*»\nÝ´BEœE ëWrlX‹­i[ž•›z¬¦kjÝºV¤<X¶ïÒµíŸ8®9£¥2à\"¡–Ž•v ©\Z,Ž•ìQÏ\\[õâ²®-úñ]Lðuâ²® Æx­a2eœÄÐrxª2C[÷àž+>X¹®¸Lä©LÈxê&JÒx½ª‹ÚºŽi@¡¶œµ;EŠaLUÜÅÄtgi$Àª€bž˜Ö…³-C$µz›4Ò vÍ@ÆœÆ£&©ØRQE1Q@Q@QH–’Š`8\ZplTt¹¥a¦YI*Ìsb³Á©êMc;MïZÏÓšÀŽ\\Uèf÷®yÀì§Tè\"“5e[5‘Ý*ürf¹e®2¹n£~”ªÜSXÔ\Zeèk6àõ­³.ZÚš1¨ÌéRÕ©5MÏ5ÛyÕ4”RV§;\n(¢˜%-%\n(¢Q@Q@Q@QHŠ(¦EPÓÔóQŠp4™H¹t­kWéX±5i[>¬*#¦“:;gàV¬-Å`ÚÉÀ­x¥qMñz\ZHjQU£jNk#AÔÒ)ôÓ@0¨XqSµBô€©´æ¦Õ!1LjÓ\Z´‰Œ†S\ZŸÚ˜Õ²0‘ÕûÕ÷ª3÷­bc#&ã©¬ù:Ö…ÀëYòu­âa\"¦w§µ2¬€\"õ¨éÀÒ\Z.Âp85§iµÎ	!R+\Z’nC\Z­²üÄç¨¬j‹Ñ*«nN‡°©Y6ÀžM¼i\n.ÑƒÀñœ7ž9ÏË·µr6w¤P¸BdÝ»ïU}ì¦çœã¥\\»VXÁlcVtsÔ}+HêŒå£4 Ü«»8jÐ…ñâÀæ³âù”uÜ{T±NDÁ[¥c5sª›²6­¥&B\n‘Žõ¯€§Ö-±ÜI9ãµ¡ûÀ!Àjä™×æŒ$7,I;ð+£8VQÙk\ZÄlŽ\0èkX\rñŒµŒž¤Ëqè°2\0HéRùe‡ LTQ©Y6“Ÿ­Z÷¤–F±„9?ŽM:HÁ$œsÐSÞ2à\\T[J‚?Zd•¥P29â²®ž5)ËcšÑ¸Ér¹¬»ˆK¶wtíT\"cÝ:¸Š¢ç,OQô¬’[.‘_]¼WO=¤oË¦ñž„uªQÝMÙâ\\Dü©Ž+xI œnp÷WR˜ä†\nÞldþu\ržŸy$3I!üäúW\\š<çŒƒÐt5¥ý–b³1\r4Ü}3Úºþ²¢¬Ž7…¼¯&qZ.Ÿ+t‘9òÆàý\05ÛøÄ7:NØmÐLØß¦?\Z°4Mí\02BŠ7ªö«ñÙ­¿Î-ãÚ8ÚWƒõ¬jVS5…c~Nð+²6Ð9,8®Äš¦¯w>¡ý™·9ò’{×Sšú„¶ÐNZ;cóˆû:ŽƒÚ­ø–+CG¼’DA+7—p‘ \0 àŽ*!6Ó\"Tà´±çþð†ý©mq©J×v\'Ï\n‚¾g¶AÍ%ï„tÃ¯Ü¤I<PI3bÝÂ!<)=x¯RÓtûAoiXy–ö1\r±’G8áŸéÏíó þÎ³·i_qÛ‹Å³éZºÓîb©Âûumá;µ§­£%Úò™çÜf•¬îa»d–Ñ%Pvð0V»m^ÓûBq,—ïs¨ZœFR0:zcµB\0º…Z8ßÌoõ òT÷É¬e6üÎ˜$‘…¥í˜äÛˆÇµ_ŠÞk¯ôMÌ§®rµ$ª÷\0*	;áŽ>õ,‡—ä*ì2/D9¨½Í4D‘ÜÍöHãï2£Áî÷=ëi.õ;¸U-ÀPƒ\0 {ŒU$e„\ZvHÿ\0X¤üÇÜTð*²mW1’ä’7SºFM_R4‡–dŸ(“ÑŒm­)ã‚EŒI+†?yýh…Œ*0œ‚wnª-3I<ŸÜÝ•³r°Òr,Îàn(ÌÈõª/)#=ÉÎOz–G Ç^Ýª/(íºûVw¹¬U„Á\'8ålàu¤(Hå@­Œ((•FE>;HI\'ËRÇ©Å ç¥><çž´ËJ¡ch\'<SY˜›Ž{Òžµ^á¾erèJd$6Wc&³§LŽF\r^\rŽ\rÃ©¨Ý‡§4\Z-;€¥pF\0¬¹P£ä	äÖÕôy\rÛéYO‚˜âµ‹Ðd°*={Õè—åàœÖL$ƒÏ+Z,qŽþµC4-n¤”íÎ=kjã+•2¹Ç€™ÈlÕ¸¤Ü\nƒß¥I£9A3¥luo—±ªò®ý¡@6>n•B;¦@™í=E^Yã‘>e)Ï<“íWÎ™ƒƒ‰¯·!‰Âö*9YdeeÎ1VÜÇªIùU=1Q8˜*ô=ªYQew‡ù›r¤ã¯4ŠÀà¯|ÒÊX2\rÃ8ÇJUpNÑ×¸ô¤V¤/ÄñŠfÜq×<ÔÎ‡#Ž”Ðª~QŸ­\"‘VT\r«œTLŸ)Çµm†â¡eÊœŽ§½)ÝI?¥1ÇÉÓ-úÕ™‚8¨UðÃƒÆM)Mµ“æã\'y	)ÉéÚ¶®=*…Ê¾kH°9;ôÚ ËGÖ±¼T¦CorG.œŸzéo£UÎ5Íkr	4äS÷£n+Ð õG&>ë9fëL©­Fz×¤!…Q@‚Š( Š( Š( AEP0¢Š(\0¥¤¥ Š( aIKI@‚Š( AJ))Â†RSÀ¤QRRËBb“&(ÅMÊ±„T„SH§q¤§bŒSÚLS±F)’6“ê1@†â’ŠLPQF(¦ ¢Š(RÒRÓQE\0RÒQ@Q@Q@!¥¤4\0QEZ)( bÑIšZ\0(¢Š\0(¢Š\0(¢ŠQE\0QE\0QE\0QE\0\"j:zõ¤ÊF…¹äVÕ«p+\nÈ­›Vé\\µÝE›P·6î*¤-ÅXÏÈÑÚ˜ŽüUw|ÔŽxªîj’bo¢£ÍV$ÔE©â•žËÅ`Se	ÇZÌœrkVqÖ³¦^Mkžâ aW$Z®ëZ¦fÑXŠ@*FZn9­.E‡¯Zµbª/Z•[¤jÁ.­{YzW9˜ïZ–³ôæ°œM£#ª¶lWÕr+ÊlãšÚ¹$¬j™ÑdVUÌ=x®×\"³nbëI1œÍÄ]k6Xùé[÷1rx¬ÉbæºiÈ‰ÄËh³Q4>Õ¢b¦˜½«¡Hçq2^\ZâÅkIS•+XÈÂP3ÙqQš²â«=j™„Âi„Ò“L&´FLBi(¢˜„¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(sJ\r6Š,\'G«1IƒTA©Që9DÖ2±³Ý+J	zW?˜5¥½+š¤ÚU\r´|Šs7N)8©Ëq\\ÍŠW\"œñYw\rWænµ™9ë[SFYBSÍT~µfCÖª·Zì‰çÍ¤¢Š³ ¢Š)€”Ph AEP ¢Š)\0QE\0QE\0QE\0QEÀ(¢Š\0)Â›KHh–3W |\ZÏSƒV¢j‰#X3zÖN•±o\'Jç-¤é[VÒp+Ž¤Núr6ân*Ê\ZÏøu\rs4n‹\0Ò\Zh4¤ÒÆ5@Õ+T-@7Za§50Õ!1\r1©ÆšÕ¤L¤6˜iôÃZ£	=QŸ½^~•JqZDÊFEÅgÈ9­+Ö¨H§5¼YƒEFÊ’˜R®äXŽ”RâŒP±°Ü+jÊ\\©î`¯Z×ÓÜÖ²¨´:(½M™_\"%ÆÒ92]*o\rË8ÅUÃË:®qÉ<æ‘$+oè3·5Éc¹6‰\'ÉËôîk=”wòŽqéV··7ò7g¥R‘‚¹ŒeäÕÅ\'rô’‘·Bx§²âç9ëÉ¨íÓ÷J{v•mæ\0÷â³–æðÕ\Z0\"¶pjÙ¶eb6”÷¬Ksœ÷kVÍ€è:W$Ñ×t¸«È) Ÿ­f[¶À$úV‚È‘ÄNN}+™¢™xÎâ?úÕhm`žŒ\Z3‚r;UˆÜ“žF)´\\ßÆJ…ˆ,Gjnã¿ïdw¤Í‘A6*J˜fîj°·g\'=½h2gœ}M4(Á<úÓEÜÏk|1‘ßÙzÀ&´Ú0Ø9ö©@8Á§pæ2VÈÂû— jTxq÷—ÖµšÝ@cšŒZ.N&ÅÍr¼!yÊŒÔ¬ŠêAÅLÖ;‘‚O<P-Ÿ\'nH´…t\nÄK»ùBŽø&Ó<F.¡Ì°\r$Vò8l\'AÉ\'Š·l(¬ “”‘õ5jäI¤Gûûxü÷º‰	]¬UrØ9¨<¿´m‘¢šäãøÜ¢Œý+Y,a2hwÐ18_Â¬’Ò4),`‚\0¥Œy»±Ã0L.ÀË÷!·ŸvêEC–R²0‘ÛqŽ6ÂçùšÚŽ?.-¨6ätâ¢hÀÉ,8GzOB“f+[ePcîŠ‰mã‚VXÓilÙÆïzÙ•7`\'ÜS!ù²Â&r0O¥EÍ9´3 ±|63„æ­€C°‘œµZPS!)êŒÒ¹g;›Ž00\r&ôîC#\0ö¨{†E[;Ÿ»Û&åÚ¢ãNÅQ¯9iA#\'×Ò§‘vÆx\'\'€;ÓÊ#i@¤;”.\nÆPn\0šr\0Ã¯ãPOgçÜ+å°§={ÕµŒíÚ?:e=„ó\0ùHç¥=IàŽž”Â˜éNû¡{“A%˜Ÿå9\0“ÆHéHû¶òGË×Šqš³\0#½1u+:§cÉýj6Qƒƒõ©ž3üK´ö¨e‹åŠE÷©¹OozÃ—ø­oÜÑœ\nÆ»B=kH²ˆˆèV®ZË¹6±ÀÍP‰ºçŠ±a÷ƒ€x>”äÔ(ùKzÔÖòmlç>µ^9&å<Ö¬DWîzÖ`Í@Êñµ&Ó#$qƒÖ«DÁvœóéVP«pàcµ#6…Vvl³:\rÇ8úS¥ÀHeÉQ÷@å¾´ƒiŸJ`Üª’	¡1XtaÂ³òFy¦»¶Çw<v§ýö\0˜\n”¬Æ6òOz¡q°duÅ0:’9çùSÛ™åùqÜÒ*Œ’@G#)g?Z€’­Œ‚¢¬:s‘øUdÞ´Š@Y_$æªÈÛ\\7)ìEXur[YäfÆÞ3ÇÒšVWËßJ£.sÓzTlƒÁçk:VÝ½OéV†bÝÅ¹‹0#‚p+Ö¢a	ä‘Ö»©Ðy,Ç“\\®§\0xÜc$Ž•Ý‡–§&\"7‹8¶¦\ZšUÚÄzT&½TxŒJ(¢Q@Q@Q@Q@Q@-%\0´QE\nCKEŠ( \0S…%8PÆ‡¨©TTj*e›4Bâ— Râ¦åØŒŠa)Ò)‰¢,QŠy˜ª&Ã1IŠ}&(†b“üQŠwˆñF)ø¤Å¤Å?˜¦M†â’IŠb\n(¢˜Q@Q@Q@Q@Q@	E-%\n(Å\0RŠJZ\0(¢ŠQE\0QE\n(¢€\n(¢€\n(¢€\n(¢€\nrõ¦ÒŠÑrÍkÚ·JÅˆóZ–ÍÒ¹ê#ª“7!nY*ŒÅ\\SÅqÉñ`ÃŠÅY=*\"ˆ1E?UÚEâœãŠT§0Í`#>eÎjŒ©Z²%T’:jC±•\"UgJÓ’*«\"V±œLöZˆŒU©«=j™”ÑO£Í<U‰ðjÜ`Š£NW*jZ¸ù¬u6W=9®ŠÒà9®Öëi×Ce{Àæ¹ªS5ŒÎ°8+U§\\ƒPAtG5#É‘\\­XÞ,Ì¹“Y’ÇÉ­‰ù¬ùW­TYMæ:c\'i…DüWDYŒ¢Q™qYÓw­)ÍeÎÝk¦4Êrwª¯SÈj»šèG,ˆš˜iÆškDbÄ¢Š)’%´”(¢Š\0(¢Š@QE0\n(¢€\n(¢€\n(¢€\np4ÚQC\Z,Fõ~	+-N\rZ‰ðEe8›Ó•¸eâ­â²¡’­¬œW$¢wÂzJÜ\ZÍœõ«r>EQ˜õ«‚\"£)ÉUÛ­O%W5Õ†Ch¢Š³0¢Š((¢ŠQE\n(¢€\n(¢QLŠ( Š( Š( –’–€\Zž3UÅJ‡¥—i[¿JÙµ~•sZö¯Ò¹ª#²“:vÈ~3À¬«féZq+ŽGb-)â”ÓW¥<ô©TV\Z n”S\r=©†š4ÓI¥4Ö­\"e!)¦—4†µF#z§0«P:äVˆÍ£&dÍVí+íE$šÕ04¯µGZØ±²†Ü\rÃæ=éN¯\"4¥CœìzÌƒ\'I\'†î€\'Œc5è–¶°Ê£i­¶œ›NAéÒ¹2i«NÇŽÏa4ßwÅU)ŽÕìÏ¤G*hÕ³ê+.÷Á“FÒò˜ôÛÜÖÐÆÇíõ0ì³Ë6óšÒÓW2Q]#ø\nãøf}sPÙøz[+¦IïBk,E9GFeO\rR2Õ>ÏvqÈ2·Þ•›*©WêôÑ4,a°Oµg\\Ø¯œÒm$¯c\\±¨®w:nÆg•bBÍF…c˜nã¡©¯#uåäÕI&ÞûŠôïë]+S’^ë.E1]Å‰\0UØ²†ê¦¨Z²É/Î>µ~3‘…œÍéj_„ò0kNØ\0‡\'\0VTAHò=«F,3Žœ}+–gdM»9Xª³\0\0+F9ðxõÍcA&ÖÁ­cÉü+žH³R6ÎÀ2zæ¬)ù»Õ\\†+Š²„ã×ë6K,¡MÝNMJ@Áæª¨ÁÏ>µ1\0·R=h%ˆÌç©§cw\0Rp[¥0zÓ‘ÇÇz¦XúdçÖž¼0Š‘@ÝÇ¥ŒxÉèØáëŒb¤\0Ò¥k7Ïœw™7\"ç‘Ö¦òJ\0§øªtR°£n(sJ>bN?T‘D>K,l˜Ç|U”@£ŒÎ)bŒÊ¿|m\n‘P|ü§oZÐÍ±¤öAŒŒ’NhØ†á¹‡¯OÊ¥]ªÇ§µ#àž£­+ç%•P‘ŽÇ¥B $©\n{\n²àaŠ,€gû\Z„ô;‰SŒeZOÌµäV1Ê‰ŽBúûÓå•—+ó8Í\\Œl]øÝC1ùqô \"H7²ï\'•9ÀÒ¦ÅsQ\\Áwu4ã8ÀƒùU¶Q´m9õì)Ïn%Öç“·Ž*lÇÌ@TŒí<w¨Ì.3ÅX1ˆFHù›ø»A*.>j9A2¦ÐýÞÕ…Žàœæ¬ìbvÉæ¡”|¹GJE¢§ÝrÇõ§!È”ÖÄç¤o•rO4‹\Zäÿ\0….õYºŽÕeNj ù<Ó®]ùSÃ\r UUÇåOáC1Ð+I¹”œŠ®ëÓ$þ5?ÆA¨^BÇœcÚ¢´¨1É¬»ÁŽ£\"¶%Œ²ƒ³¯|ÕI Þ§pæše#œ<³85$\0b1éSÏnÀrFk?kÂÿ\07+š×p±®ðN=X‚r½j•´ í#‘Ò®…F`={Vlf‚IžN*Ü/òò8¬ÄM„rOzºŽ7Ô´K.‡|Ê?\n”H‰\0n„T\nÃËt=ªxnxãÒ¤Í¢C#FÁ‚úŠLùî\\ýã×µK $\0tÎEF\0sžzÕFÉ‡ì@¦•ËcZ°ÈK`pGëHADfQÏB=©åF†Èª.¸?Ê­’\0ŒzŠ‚D7¨-î÷xüª¯\n§iÇ1!‡Jª[,T}üt¦QQ¤q(=j…ægã\0óW®3´¹Ž¸¬ùò@ÉÝš´2” ˜Ûž•ÎêÉê3ÓÑÉ´§\'‰¨ä®0¾µÑIêcU]%ìF+‡_|ÕCZZ¨oµ±aŒŽ+4×±txU¤ÆÑEFaEPEPEPEPEP ¢Š(½éi)h\0¤¥¢‰@¥¢‚œ:Ò\nrŠI-J:Tj*QPÍb<RÓE-Ib\Zm:Ð!„RS4Ó$i”úm1XJ)iq@¬7bŠ1L,3m4Š—˜¢âh„ŠLT¤SªL–†RSˆ¦ÕQE\0QE\0QE\0QE\0QE\0QE\nCKI@Â–’–QšRfŒÐÑE\0QE(¢Š\0(¢Š\0(¢’€”SiE\'ŒóZïŒVbjÜ/ŠÊHÚ›±½o\'J¿ñXKÒ´\"–¹gº47qQµ1_\"”šÎÆÉ‰EP3q*]¹È†jÊ§ƒd¢£ÇU¤Ž´Ú:­,u74FT‰TåLV¤©Š¡8àÖ‘`Ì¹‡&©IÖ®ÏÞ¨Hy®¨Ó\Z:Ô‹ÍD½jdªd!ÄqQ1ÅX#Š¯\'J¤	1SZv—¥qÍa–Á©b”ƒÖªPº2Si¥­ö@æ´Òçp®6ÖäŒs[6÷$ÍqT§c²œîl¼™VB)«.E#µak)9ª²¾*y[Š¡;ÖÐ\"eyäëY“=Yë:W®È#†£#vªìiÎÕ5ºG,˜†’ŠJ³6QIL¢Š(QE€(¢Šv\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ÀÔÑµ@\r=\rKEEš½[I8¬ØÚ­#ÖGe9Y²*¬¦¤-ÅC!©ŠÔ¹;•¤ªíS½BÕÑ’C(¢Š£0¢’ŠbaERQEÀ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0Zzše(4™H¹	äV­«t¬x5§jÜŠÂ¢:i3 µnjÂx¬[FàVÄ\\SGtKÉÒŸQ§J’³,ct¨¬0â z\0¬Õ©^¢4Ð˜ÓLjq¦\ZÒ&r\nCE!­QÏ!­Ò˜W5%(U	éöW-è3Z–ºOÛ\'ew*Š;u©4ˆ7A‘Öº\'NUÙFO9®\n³|Ç§J*0¹Ë¾™{¢â{|Ï\0ûÈz[z}ä:„;ÑÆzî+jò\nvœJän,¦²½76Ýâ¬[æÜÚ.çI%˜ŒV¬0!Q€	é’+MÕá¼ëò8êë[öÓ+.\0µ\r4LîUºÓ¸}¹5s¦©—ÌØ\0×1\rz£4$¡\0ïJö&29©,ÆÎ‚°¯í±¹õ®Öh0¿0¬[Ë@èÇ\Z¨ÈÑjyõôDÅƒŠÄuP€7QØú×g}dî§µÆÞÄbœ–Brx¯F„¯¡Çˆµ9K°Œgž•±\Z¨%ÕÏ•Õƒ\rÃ“ZÑüËÀÕUI¢Z‰ŽíÀ~z/Nµ	8Ã\Z»•zŠæ‘Ø™±Éð­Y±’pxã‹¸.\0ŽyÉíZ1í1¤œšÆH»›1É¿§žÕm”,MfÁ(ÀÚ0G¥[ŽLp9Ï\\ÖL\Z-«•SÏfÇJ”eˆPz÷ªÖÒ`\rÄ÷5<-ÐñùTˆ¶@@÷©£@^i©ò¸þB¬&\0\0)™°Ús“NL|Ç‚6F/î€$žôð™Âç©\"‚B†f<zV#ûÜŒ\nbïÑ»œ“žµ*ç¹ŸJh–?hÉâ¦wB­\Z®#==i#RÇ\'8â‡mÃ¡è¸«D1è\n(L/A÷iìÑ©bISŽ\0ïíH „\\ÔpÄ°àfªä\nC»W>`{P¤”o›éÅHJÆFQœgùÓBÇ$„dªÿ\0²0(ƒ $°÷éšS®Ç=†á*UeL¨9ôÍ–ÃHªS=	¤Q gâuFBáRmiþVQÇ?(Å:5mÆ(ÔîàqÍK¨VT`YOvý(°›°Ý¡ˆUUÀ<{Ôò>Ñ¼pÛx˜ƒw ìN:S›pÉˆ©ª\rR%•¤V}Ò˜P¸FsÀ=X¸·pÃ$+÷¨pvç,Øì*Y¤H7®åUV\rÝ³U¤s“ß3œäƒUÜ’77Ry¬ÙªD¾ÂªK7>¹©gf$…=ª›¶Ñób‘ª@òtõ¦–	É<Õ9.K6Ð0Gzros’I§b¬XY¤ñÒ§	eÎN)–‘É‚$¯ô­E^0I4Ý†bØ)|àïV±À¦yx8çÖ®D…8 ‘ëLhK1.p=_X6¯­#C¼c >”Éæ1å·8\"²nlòÇzê$¶Uþb©ÏnÁI ÓNÅ©“#Ú¾W gœU¸.ƒ÷ätâ´g²85“E&åÈæ­5-ÆoEp­³ŽjüJN@QŒf¹(ïZ\\z×U¥L·åHéÎMK‹D²TVúñW#O”óÏcéQºm|sÒ¬!2§9%±aÉêÇ\"žFåÈfjÃo9Ï–Dp™ª¸ç½3;ê ô\0òE5ˆ€äô²±K\r¥Žx¦Œ©Îr)P ©Ç=ª)W8íÖ­‰ `õ^ãxü)™JEÏ8©0\0–à7­]%”Ç Õ9sA¢(Üe~:œñY·,ª7)Ç ­R·QÇZÍ™¾fÜ@?NÕH£2ìü›Éô¬‹Á˜GµîŠ‡PW¥eÞãiÝž€WM=ÌjlqÚ´e]Xô#Ýk Õc-j®Ó¥`0¯V“¼Oº´ˆè¥4VÆQKIHŠZJ\0(¢ŠQE\n(¢€\n(¢€\nZJZ\0Z(¢Ã QNØ\0§@ð*Yi\n<RJ*YhZ3EŠ\n(¢€šiÔ”ÉE- VŠ\\QŠ\0LRÑK@	Š1KKŠb°Â*2*r*6Ðš!aL©XTf­±´Ph¦ ¢Š(QE\0QE(¢ƒ@	KšJ(´”Q@¢Š\0(¢Š\0(¢ŠCKH)i€QE(¢Š\0(¢Š\0J(¢€\n(¢§±UÅH†“E¦iC%hDõ‘Õø¥a4uS‘©ÔàæªDzUµ®i#²\"âŠv(©(èaZº‰ÅCUÔN+‰2qU&JÒtâªL´‘i™3/ZË¹ï[Ö².»Ö2.&¨Hy«·MQ~µÙ–cW­XŽ«¯Z³T‰‰#tª²ô«dqUe©ˆOb£u¥N´†œƒšÛ¡ÍÔ»nH­‹f8“n½+ZÝx®z‡U3F6â¤-‘P§Jjähë‹\"”ÖuÁëZôª­\\7	leNy5Ÿ!­É¬é+¶™çU cÍ2”õ¤­ÑÊÂ’Š*‰Š( Š( Š( Š( Š( Š( Š( Š( Š( AN›J(cDèÕa\Zª)ÅL­YIÁ–·Tni¡©¬Õ)\Z¹hFõ	©Ôf´Fch¢’¨Í…Q@‚Š(¦€(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0)Â›J(cDñ\ZÒ¶<ŠÌŒóZÇ‘XÌÞ›ÔÞ´=+fÜð+Ðô­›s\\S;á±¥â¦Š‚>•8¬Y¨Ö¨U–éP8 \n¯Pš± ¨U!2#M4ãL5¤L¤†–’´FžËL©”dSb‰ÖørßÌ´+­´ŒF˜®sÂñ²ÎIjêà‹¼Ê¿éÅû¶*ÝÆ´X1:´ì;æºÞ\"nüW9l\0ºû£“Ú¤Ò$Ð`¼`&)º†O_zƒËÔô–_9|è3þ±:¨®’Å	AžÕª±$‰±×*zZ”Èu\Z9ë-E.lç·¥\\cj–±áóbßo°È_½$C¸ö¨lup¼ŒCCA£W‰fcA5™p¨ê@ëZ3w=AíY3¶ÜÔ¢âa]Á‡aŠäµ8,çÒ»›¬2äc8®cR·ž:Ž•ÕFVaQ]„`	1‚p:×ˆ|ªà‘íYóÄÑIÇ5z~_nµÙ7us’š³±~ £×5ay™#Š©ÙŠ²\\à°{W<Ž¸–›žJµlÌÊ§Ò¨É®=*í¾wwô¬¤´)3VU•W•NŽAää“T ”’ÝlqV¡Èl‘šÉ¢X‚ŒV…¶ì©n3Ô\nË‚RSpâµ\"b±Ç8â –\\VÎõ ;[¾† Œð§wlâ¥\nÁ³sH‚ÊŒTŠ¿\'|w5\Zœ.qšp“Ë\nNH¦ˆdª½	ü1RméÇ¤Qò;Ò‚ÂEgmÊ§1Ö©Ù<ƒa=aR \0Œg\'\0{TR8,erzáxâ­ºùT™s‘Vˆdd„u@ÿ\09¥ÀVå‹¸ô§[²Æ\02GJ‘NÔ9)–íÞš!²%b¬ÇÞ˜©36OÝî¥!\"gRp<…íO1ƒ‘£¡$Õ$\r•‚FìÃi8ëÚ‘‚°Ü¨ÏÎ:\n²ZLr­ž~J\\±DØJªp¦Ã»#L ¼*	Ï”Øš˜EƒÀE_NäÒ†n†~å‡õ§`ÚÌ7•V\"ä;w>K7ÊpBÑäðYÈ]§ ÷©fc\Z”ÙÎxlâª;	UÜd`ô4‘Jì|¡F[æ<œçT…å\0€x>•rI4o-|ÖÎÒOEúUe÷ç-ž‚¦EÀ« >gLU® œU÷@‘‚î#œö¬k©79@P:ûÖmÃR¼¯‚X¶+.{Ç\0ñZŠòô1¡éÖ«ÃHÙ\'¯$Õ(ÛsdKl7Èrx­˜bù¥S´µÁÉ«VÞ6Î06ŠMŠD±ÇïŠ³zŠUŽœUÄŒÒ2r!sÈ©0N@Î=jtvqV’Ôùd\'=j”nfçc=£˜0À#¨4«ÕÀ¡«æÓ8¥*Ù%Žð¬R*¹.¢(~\\¶ªòÂ0x­cÆ1Éïš…£$·ÜÒq±Q‘‹s\0#¡íYWàýß^s]ãiÉ\0â²%²9ÈçœTšÆFÅš““ŠŽÝ¥±œINâ´äÃ7 UgÌ*£¨ª½Ë:+Ø¯m÷!È=«DFF\0Šáì®ÿ\0²õ\rÏÌr­ŽÞõÛ¡è;c?…&¬e%bE?»ØGFàŽô²ýÂzŒÞ‚ r9Ï1™Ä¡ ýÂ( I0và{SapÃîŽ©êXß¢,’±Ú{÷ëHhS†‡SÖ«HAãÓ½X#°\\ÕY\0#v9=©\rä`n:ŽG­Sp²jôªFy\"©\\ xúš\rQJå•A*\0ÏZÊº \0qÉ5nîCµ€Ç9ª7L§Ë$ñÜV‘E.YŠô#ŠÃ¿tžF{zÖ­é+—wÒ±ï^7çn\nŒuë]4Ö¦…	aóô©WŒõ÷5Éºà‘]Î\ZÍ¸_\rq×±yW2\'¡®êÕ£ÍÄÇE\"‘¤¥jJëG†ŠZJ\0)h¢€Š( AERQE\0QE\0QE\0´´”¢†4(©F*E©e\"@)àSVž*¢\nZ\\QŠE	EP0¢Š(\0¤¥¢	Š)h ¢–ŠÂQEÄáM§P\Zk\n“µ1©¢Y\nŒÔÍQ5Z!Œ¤¥¤ª (¢ŠQE\0QE\n(¢€\nJZ((¥¤ AEPEPER\0´\n)€QE\0QE\0QE\0”RÒPER\0§M¥\rbj¿Vlu~\nÊgE3ZÅ_ŒV}¿jÑ‹µrLô K¶Š“VF¶:hV®¨âªDÃŠ°®1Y~•RQÅXfªò)ŒË‘Ö±nûÖÝÉëX—g­i³ã©ªW®:š¢ýk®,Ä^µj!UsW\"ZrIâªL:Õò¿-T˜TÅê9­\n9©#Ò0æ¤ˆs[_C-KöËZ°\'³í—¥jÄ¼\næ›:é¢eS(R\ZÁ›¢*”ã ÕçéU&D·±‘pµ™(æµîfL9®Êlá¬Š-Ö™R?ZŒ×R8$”QL¢Š)\0QEÀ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢ŠQE\nQIE\08TŠÕ§RÑi“†¦–¦fšV/˜ÓM’©ØRRÒS$(¢ŠQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0¢’”PÀ–>µ~Üò+=:Õè\"²™µ6nZ•µnkÑºVÝ»t®*ˆô)½\rHÏ¬­SˆñV”ÖØyéQ8©sLaH\n®8¨U¦Š¤&VaL5+\n‰«X™HJJ)+Da jÄB«Žµr’)±Gs¸ð‡Ò\0@÷5ÖÙ\0ìGÔ×\'á 0àŽÕÔÛ>Û‚«€+Ï©ñëbN=¨Øéë\\¤gý7ïšìõ5Ì\'ŽÕÆn%x òk&é;£­±â1ÎsÛÒµ##ƒÞ²t÷\rÍh¯¨¬Ì¦µ&š@c!—>µÁë6ôÝ@\nÆÇçQÐ{×cq UÇ\\ÖDö‹xHuOZ®aÓ÷J×«uAÎEWºB¼š¥5Ä:f§öT•ºqZR2ÉÁíE¶1%$£’zûVEêääŒÖÔ©ó6z¡p‰\"IÈ`u­a 6qz„eeÈüé-Î¤ú“WõXÂÅ¸Ž;æ³í›÷DŸÊ»bï™«H»^O9ô«!¾\\¢ª ù?•OsœÖR6‹, %òFªÜR…<ŒŸZ¥î52æeòqPõ(ØÃc§z¶Œba†ëT¡q°|½{UÐ¹‘X´Yz%¿ZÑŒ“…cž+;%P>•n*À“ÇzÍ‰–íqžrjáÉä6vªC;øU¤lã¸ïRK%‚R¿{)ÑÈ¦b§8ÍViåD\0ååV±\"°$8ëéMËà…½:\nQ‰e1ŒU8¤ó\rÜ•|ì(ã8r8ÇcTŒš±*4~Q‰¹!³Ÿj”¾ìí\0¨ã\"ª€ªf9#§ó•ktç­Zó!®ÄËÜT/^jH„{N,y<ö¨mÛ²W–•\"e`2œU\"\Z$EO•ž< $€\r2\\•È9ÏnÔÂf|¯Ê#÷¦3áð§xý3C`üòaˆ<“š™UyÚ²j%gÈ^¹©–6,[å<=¨ZƒPŽÐ¾ôbîYÉ=xÙP mÌÞäu§FCç\n¾ôÄ2Ic8;z(<ÓNÀsŒ±<‚3Š”ä±\ZƒëÜýi¡&f8Ùå‘–ÅùÑk†Ä!UË&#cÄòOÒ“`	‘€aN•ðèK‚Þè)\'•åùïH¤ÌëÉ<¶+žž«Õ/%BR6ëZú•ç– Œæ¹¥\rw8™‡^\0ö¬Ö÷;)ÆÈm½©l;äœóï[pY)åÀíKkl \0çZk\0:Rnå6WŽ£•ïW’ ¤S¢ŒoÆ8>µ|@`š¹”¦E{‡#Í[X‰P×µDeU;Gãš<á€3ÅR²2wfŒ\n—#ZÖp,›ÁWMœe¿‹é\\ô3*sœZÓS`«‰˜íŒäWE9Å=NZ°“øKwQBŒ¤ýÀ¹ÏCU#PÑ°?;g©î)·7FåNæý*›Ìª\0ž{”ç5Í B¶¤ó\"ù$¹qÞ¨JFÐsÀéS<ãfG#Þ³o\'+âF}+4ÍàžÅ;ë¥Œz×5=Î÷8lsKªßäu>‚¹{Í~ÒÎ@“33ç\\|šQ¦å±ÒšŠÔêà$d“×Ö£ITœƒ’N+K½rð\"´X­Ë—$¶+ ³†t9q“Ž¦©Ã”iÜ±©€!cÆ@ãŠé´{“-œ±c5Éê/å[³1÷®F.š}º·q*%°5¡Ò+œ‚3Í( ³IèEW†Qž8ÉäzU¦Ei	9 t5(Åè3‚ã#•äQUÄ\n³É \'ä\n±\"²ä“µ‡#Þ¡ÁîÜ99¤Æ†HÇnÐ{ÔŸ•pwJ€`sÁëš©)^E\"‘çr’:UIØŠçÞ¬¹ùpjÄ…H †ƒD`ßÌ¿i\n€g¸ÍVvRÊì7c±íSÝÂ«+¸ù‰5FVe‹Žõ´QR)Hèï!$àtÍcÝ¾€@OrkBG\"BÅA>™â²ï˜<í\'®kªšÔäªô.hZ)÷g“Àìkñ¿“¨·ËŒó[þw.Ì¸åOz<Yf“Aö„zž~•´eËTçœyèœi•3Š„×z<ÆRRÓRRÒPER\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¥¤¥ \n‘MD)êjYhjAQ)©C4CÅ¥¢¤¡\r%8ÓM1‰EP ¢Š(\0¥¢ŒP0¤4´b€’–’˜‚I@ Cé†ž)¦š$…ª&©š¡j¤Ci´ãITKŠ(¦HQE\0QE(¢Š\0(¢’€’Š(QE\0QE\0QE€)i)i€QE\0QE\0QE\0RRÒPERiE6ž¤Kæ¯À*¤KZP\'JÂlê¥õ¸éZvªp¦[N+–GtU‹9¢¢ÝEE‹¹Ò¤˜©„µ˜’ÔÂZÊÄ\"÷˜1QÉ\'_Î÷¨¤›Š,2+—àÖ-Óg5¡q.sYW\ršÒ(3gêj›jì£“UÊó]f2Cy«Ð¥C\ZsWbL\nRcŒ@¯RqÖ´xªSŽµzŽkC9‡5,#škŽiðõ®Ž‡7SNØt­Hú\nÌ·íZ1žsLé`)\r 4Y3d1úUIjÛž*¤´‘§C:qÖ²ç­qÞ²î+®‘ÇXÏ“­DzÔÒõ¨OZë‰çHJ(¢¨€¢Š(\0¢Š(\0¢Š(\0¢Š(QE(¢Š\0(¢ŠQE\0QE\0QEŠJZCŒÒQ@îQE2D¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¥ïI@ 	­[„ôªc­Y‰¹¨‘¤³jÝ+fÙøÏ[>1[6Òt®Jˆî¦Í¸_Š¶ÅfBõz6Ís4t&ZÓTæRQ\nÅXj…Å4&UqPµXqUÚ´‰œ†ÓM-&kTa!W­^µaTE]´lH¿ZrØ˜îv~“Ë¹eõÀÑÄvjC\'–â¹\r&åbÔ×<‚À®¨Ë¶õ$#\nk‚¢³;áª6õ(sm¸r1Šàå@—ä/¯\"»ë–/§eNs^p\nê¡wÖ¢F”6:{`Vª@\0b³ôøÀŒfµãˆ’+‰›W(\\†Ÿq+,DGßŠÞ¹„/lÖ{[n”š³ÉøÐEì/æðíÑ±È5–ÞGµŸï§Q]Ühª¿v²u­íp»sûø†í£ø‡¥iUŠUu³8ËÒÑÎ\nÙíNXƒG¸ðÄ~UäÜ]ÀT áþU²°({â©»#CŠÖ­óÝ½sÊ¿½ÆÞ®ëXµ7Šâfc\rßÝÈÍtÑwV2¨º’Æ>M czž2ËÉçª!‡ïVão_zl¨–Täu=*Hó¼Ðõ¨‘\0d\n•%€ÅfhjZª§ŒÖ„L nß×Ú²mŠ©’?k[ÐéYHhºƒyœ•eNÀ71Æ:¯(`Ž•gf>ùÖLi¹”±©@;Ã#wldòr8§Â»óƒ³Ó<æ‘%„O˜?§Jy(SøûScäcór*`2ä0úÒÉƒ	\nmÏ\n^5‘O;¹UfuU	ÎÓÅ<¸\"ƒ€2M36X|ÉµñÜç¥YÑÚç!‡AôªÈCÊ =MKÌ0y\nqíV™\rÂ¸1ÁÝÔÔ‘ºî\"^œàv5\Zwœü«ÜzÓ?z§šöàtH–®K¾IH‹Û§ahÉ‹8Uë“êj0­-36 ã\'4äId’PIàÀªZìÅH²¡Ûø™F}ªD*\Z=ÌI<ô§ª+\"p}î*%Ó³™JŒd3Uk2o¥‡¾Ä“‡=È=j)	I$ª;t©Q‡Èî]…9aÄÇ aþ×CCM…Ò!Âù@,GlÓ¬ŠJ’xéVÜ†ÁÚ›ÀÁ+Ò£,#zœúPÐÓ\ZHòö€xê;V]ìûrLV‰SósœÈV5ûQ)\0’{ÔMè]4®rºÔŠ–¸/ûÙ$À\\tË2ª1ÐÔ\Z³nÔÑ2p«žEjéÊzÔ½Û{\"Ü•”Òµ–%z\Z­ 0aœ{ÔÒL±‚ã¥#;ìJ6¡Æ:S&ºUçv1\\Öµâ‹=ÜËq:…<\0Ì\nóýCâ¤ÒHËad»ñÊÝ[B…JŸ\n2HCâg¬KyòÀœÒ-ð=xtßuù)äD;\0„ÿ\03RZ|K×V@¯\r¼üä„úÖßR©c?­Ò=Õ.¸ã­Z†à“÷«Êô¿‰–SJ©¨ZËfOñƒ¹¥vözœ7p	­åIc=Nk	Rœ¼”£=Ž”LvrEU–lcižjˆ¸`3œûSçoï1ÓµMÁ@Ñy²ØQÔzÖF±y„*9sÓ÷¾;NT(ÆAÏZóø†áî›e–º—ï:Ÿ¸*á9Y÷UÙŸ¯x‚y/¤ÒôÀdø’Qü?JÚð¯„¢Ša-ÏïîXo.ý;TžðÔV0™¥Vyä\\³·­vÖ–ñÀgžØïZÔ¨’ä†Á?Š{—\"Ð#x÷(\r\\äŒ`ÖeÍ´p€kÜë[-Ä‚¨çÈj:›]Köhï~3ŽV]‹¦§¼ŒÉÀÔ58âL˜bmÒßÚ»FÒÑÀô¬›==lmÖ5\nÙ;™û“Wbm­ÀJ™;šîjDNå!²M^‚RÀâ²!“Ú´ `Ì\05	™Éeã’j®é´dtïR²™bÚç<í¨\\ºÞ›!3\0FM@Ì¼n n<\n{0Ž`ì»Ž\nJ‰Êàç¯¯¥IiIŒ““ÏJ£p3CœõÏns´ë:WÈ+“LÑ—`ùÜœ(vå€~ZÔ¼Îr¹ük\Zëîž9­à…\'¡RLI*ÊN1ÍaÞÊYÕp:æµæp\"Â`¶{ñŠÄ¼.X3 óÞ»i#Š³Ð½¡Êðêj\"‘’OjßÔÑ$¶‘N2TÖO†±%ÓBf¬ë“ù09Ï853Ö¥‚•3Ïæfõ\\Ôòœ’j¹¯J\'“-Ä¥¢’™!ES\0¢Š)(¢ŠQE\0QE\0QE\0QE\0(§´ÑKI)©”Õu52š†iN)iPh†ši§‘IŠ2Šv)1L¥Å8\n\\PqKŠv(Å IŠ~)\r\02’žE4Ó”´”S$p¦šZCLDmQ5JÕU\"¤¥4Ú¢QEÄQE\0QE\n(¢€\nJZJQE\0QK@	Š1KE\0%´”\0RÒQ@EPEPEPIKEŠ)i\0µ\"š`©£Ô²â‹P&qZ¶ñôªVëÒµ­Ó\\ÕßF$ñ§.1OE§”®kV!¢¥ÙíE;ŠÅ„–¥ûÖrÉR‰*,I{Îâ¢y	¨Cfœh°JIªS-i4uVhé¦;2/5Njä‰ÍFfµR!¡#Ž®FœS#J²«YÉ”‘¯BqZn8ª­8=E5¡˜ãšt]iÎ¿59®‹ès5©~Ò´#<Vl\'¯Fx¬dmÒšq¨ÖœMbÍÇ<UY\rNæ«HhH»èRœõ¬ÉÍh\\7ZÌ¹®ºHã¬Êru¨=Ï4Ã]hóä”QL¢Š(\0¢Š(\0¢Š(\0¢Š(QE(¢Š\0(¢ŠQE\n(¢€\n( PÑE(¢ŠQE\0!¢ƒE\n(¢Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@4f \"jYQfŒÈ­ki+­+wéXMtäoÃ\'¯Dõo%hDõÉ$uÅšhÕ 9ª‘¾jpÕ›,{T-R“Qµ$gïUÞ¬ÉUžµ‰œˆ©\r-4Ö¨ÂBƒŠš6°ªÄÐV è-nöÜDùç¦k³yŒšr]«–òÈ\rÅy’\\;WuáË¿µØKm‚Å× ÕÉZÔí£-ÊÎäO§…Üzf¸íUürÙÜxU­li3vhpÇcÔÖF¸Oöý³“ÏNGJægM5in˜Œê¬ÝN8ô®•bÙ{ãŠÂÑX9#9®†îE8UÇZ ´¹ËY¾k¥\0·<Ó`J}i21Š‡¨™yÅ]±_\'÷¸S·œõ\0BÍÅ]PÚHÌüqUIYÜ™ícÍu[5O»0—\0t«˜DOJn£ “ZõPhß»<b¥»‰hŒ}Z/‘³ÉôÁ_D~ÒNqìEzéÚŒ?Záu2<æn˜®ŠQObI1œã§J“iëU­åà–aÐÕÂqã¥k%¨ î‡GÇ T«Á¨íÛääjÁ\npïÚ³fˆ»hÆHÀ«Ð6ç$p¥eÛ?;Çv­p‡p>äT±£J>\nóœV‚0ly¬Ër¹ëŒâ®Ââ2¬ßbÆÍ;ô§Æ\nÝ‡z‰dA$c°©ñ´’ÍI$Ë–ãŸjzœóž{Ô\nÅeºÓ‘É)bÆ9þõ`§‚58UÜyÇZ]»×8ƒž¢˜‹NÆäzÕ¯õ{ÁáûÄÕDÀùe^ Sð^DpÇiþÚ„KEä‹\"€­´b:T²*ÂûÎ{®:ÕHC¬»HÏ\'Š•%U$dã·oj´fÑw–WŒä±ä\nr¢Köeqp?¥@²PYÏV\\zÔ²ªB« Fçª÷ö­“CþQY‘¹@<Š.ÅUjp	ö§Ë 2•Dùñò÷˜C3þòs#‘£Œ\n¢uÒ\r€#CÆO%Gµ	åàuV\rÁï\"!Ì„»ÿ\0\n1áúô®(Õl»G9¡®¬Õp§sGóÈSÐzÐ±GÍ¿\';§¥*•‚î»ˆÎ=EJÇ9ù>¸ÛE†ÙV@Ê\\žXœ`vJá#1<€*ô»ƒ«×¡ÏQUš@ä²¿û8¨eÅœˆ&£lí\Zªºmt85vÁÀ²*ç‰,ž}yaD°H]2pzŠÁ±»ß\n@ÇPjZÐì‹æ‰Ó›‘°•{V»«5¼å©-·Žj×Ÿ„jƒÙ5ó±—zIo¨”R<»SÑ/µkÙæœzaU¬¼4&µ¸ûEÂÛÎƒ)¡;þ„W¸iÞYc PCÞŸqáÒ [Ám+õ“\0ìÖ±SJÖ9gB”¥¾§Ï‘XÜù¤%·žƒååN3[\ZG‡fWûD¶²?r0y>õîƒÂ–ñÅ¬h\nsò®2}M;û\Z8¦oº=ñÓÚªX©5d‰…\nQw½Ï4‹ÃöóÛ¬ŒË€	ûµ›¦Újž»[È	û#>Ù­³ž=Ezä–p¤DmÈcÔÖ&¡h¢2‚0U¸ÍbªËfoËlIiñ‡F!O#=EY.ƒ»k™‡0 T HÛè*w¼uÏµG/bìK¯jfÞÔìr0 zÖ£Á‰..uÌ§,Ýp}ªo³É}:–%Óq%Iû†µE‰…W*GÒ«áVBZ³NÁÒÞÜ‡*¯ªÐ2±|¢ª‡•ãØ¼êyªêË!)2á‡­AjÛˆ¦kéT‚Ê™ä·SZ¶¶PZãn	=OsURDŒg°â­	U¡fsƒÞ“lw\'—Y½1U‰Ú¼~”ˆåÐœöÅ:1òáÆgb‘j	\0L[#ªÌ3€êŒ[ÔYê¥9â¦Þ\\\0Ò94mÇsß ¨?­$­½·òŽqY‰+(ã×Ò­¬Û† Ï–Ã¤£S»œçV@É9öêÎ°äüÃ€*³†wì(\Z*Éó¸+Æ:V|®«¿©+Ö´ä}¾¼æ³žóYÙÌ;SH¤fÝ¾cëïX³1%Ø+ZfoAÚ°§ÞõÑD™Bå°Œx=ë&VR…Šóž™éZsàÇ\"c;º\ZÉ“všì¦qÕ.iWÛQ‰Ôà(ñ6 ¬|•l±ûÕ“,ò[’>=\rgM3Jåœ’Ç½o\ZW—1É:Ö*#vÍDiI¦×J9´R\nZbŠ( AEP0¢Š)\0QE\0QE\0QE\0QE\0S…6”PÔÔÈjR¡©e¦YZ”T(jaY³TÃ˜§â“‹Š1NÅ V\n\\QŠu!‰Š1J.(ÌROÅ&(ˆÍ4Ô„S\rR%¢Š)’ÀR\ZZCÒ¨Lª6©\Z£jd23M§šmQQEÄQE\0QE\0QE\n(¢€ŠZ(QE\0QE\0QE\0”RÑ@Q@Q@QJàRâŠ.1)h¥¤0b>µ\\Tñži2ã¹§oÚ¶-ú\nÄ·n•±nÝ+’¢=\n&”}*]µF¬¨Ís3¬fÚ*l{QEÉ±Œ¯R«U%z±f´±Ë±óW#LÕ8OJ¿¨cB´|U9×­_b1Tn­B*ædÃšˆu©&<ÕrØ5²%²Ôf¬)ª%XI*Z)2wéTæ^µgvEC\'4=LéšbŒ\Z³\"óQmæ·LÁ¢hªì]RŽ®ÅÐTH¨–—¥ñMSÅ\rX³TFÕZSÅYj«9À§žÆuËu¬¹›“W®[­fJÕÝM}ijBNi´¦ŠèG#Š( AEPEPEP ¢Š(\0¢Š(QE\0QE(¢Š\0(¢Š´”´\0QE)(¢EPIKE\0%Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@\0§¯Ze8RcE¨Î*ô\rŠÎŒÕÈ[¥e$olÀý+F\'â±àjÑ…ø®Y£²Ô‰êÊ5gÆÕj7¬Z5E¬ñHzSqJMHÈ¤ªÒU—ªÒUÄ‰\Zi¥cŠŒµlŒdj&|R³ñUäzÑ1þo½t^ÕÍæÑÜuÍr,õ$-×¨©œ9•‹§>V{Ï½£½‰‰#­dø‚u±Þ+åüí®=°ižÔÖòÐDäg¦=)|Aj ·/zw¯5«JÌõ ïc·ðÝÈ&2zšÝ¸³wï\\O…/,gïqÇÖº×‘‹a=j²±Xû÷,¦X`iþAþ*†)€úÔë6E$Ñ›¹fÎß|¡@Å?WeŠ\Z€95W\ràþ5{tÒ1É5£’Œ,ŒÔ§w±Ã^I·[bÃåõÏJ¼Q_”lñQkvŽU§‰~nüT\ZUÈ™6±Äƒ¨¬wG öº(jA’S“òþ•Æk*ª\\–ã¨ã­z¯n²[—ñç:ˆy&(Î[Öø}ÈŸÀeÃ1†åde;HÁö­AûÄÊüË×\"³aÚù„î\r‚ÏbÛ+)¹xÛ]SZ˜ÁØ·*œž€Õ¼~í¨Î0*€;d#ø{Š¿ƒÀÆ1XÈé‰0E\08$ò*òH6nìxâ©£|X\r¤wíS¦qå€võÍfË4mä;×-ëZJD›\\äV$m„SÛ<\ZÓ†oÝäœVl¥\ZoL±äTÊçÌ`z\n¨’•\0•=jU~æµ–¢eÝO½KëÍVö¨F)ñºäxö¤\"Êœáª@Ç;Oô¨#m¥ùÊžžÕ`a˜69#Ö1KåXÕIOâj²…\\æ©–#\'ŸÒ®4îz(Ü–XFhÿ\0Õçæ`¥Y,¡W¼sU„Äª½iÉq´î$”=Ç\\Õ£6(¼²Éæ6ÂÒ}E9‘ÕX¼ ¨s´cø{U2&Uù=XcîÕ€IvXg%º\nÕ¾ä™1ª²±† “ß4b4mí‚íòeNH¹¦;<’oWO+?tŽƒéOÚ¾T­IÁ,ç©ö«D2½ÌÉm^Gþµ41’¢\0ì$#xÏ\'ñ¦±i%U2ýÐ¥<J9$Ï”#$6y-ô¤·ÚÁåºÂ‚Cæ8ûÍŒP]°WCLŠV‘U÷eq€_Æžç‚7rZ@GæåA,¸äqPJÊå•K7!WªýiìÈªÛAÉè\0ëTdD‰˜¨äõ©l¸¢­ÙŒã<üÂ¹­WB/^òÑão˜Å·?Zé$$ŽN¦´€2Çû”’Oðš…#xÝlqÂå >]ÄoŽ¤Ž*í½ôDîVÏl×A$\ncÑ«Ç#\"³äÓPƒ„SÏF1C±¢š{W©ÚÃ¡ÏJ±¬ÑÆ^1’y$žµ‹öU‰ÚAàN\nÕ²P©\nä¦\'ö7WUóUY˜!#€=jzÎXœ=©¬Ô_1ãem»HïëHn#ŽdŠá°ïÂÂþuWlË•\"êÍ½Y2)eWr“ónïô¦¬Èwà©òŽÆyÍ:Öíî\"ÝÕnŒ{Z,+”eÒb³!ëÏ\"«6œ×Q[¨GÍócv§­UŽEyÕBžIÅe&ìTŽÆ+hñ´*±êj§¶Ò9P}»VË²ˆÎ\\pz0æ²õ(ÉBRF28ÅLænuHì]¥™ßtñŠµhn&a¸ŽM›—*\n¸ö4ÍV×Íµtº¸eqÊ‹¿`z‘me¶Óm$ûlSlùd`¿t™²JÂmÜŠêöO±4‘$ƒgúÀzìiöZ¼3Ê©¹·`|€çãPêÆI¡ûša¹¢ôõ5‹kmZÀºµºi$…¾à\\*”Ž¤¹´Î×í¡J!‘X1àŠ½ ‘ÏA\\í¾£–’C_˜FŸ\\\Zº—q½Ã¢»$ª3·oQëX8)£Y¤*Ã\rÇ¥Kó‚zÖ¾¥Ï$g2”RÄÅócÕbMßtÑ9BÛ‘ÔsB+7W26€ÇwCÐæŸ»æ	àÕu‘$A û­ÊÓšdD	cŽF*l;—\rÂÈß”Ôy‡ÉÝÛÍP;¥Œ8R‡9ÆjD¸X`ä@¤òÃq8\"¨NØŒœ‘“ŒUâàîÈëÐÖ}Áp2Ojhf=îUY€äñXW\\¹è+r÷˜ÉéíX3cÌÎG½uS2™BbA Œb³§Qž{VÇ\0rEeÈFk®™ÇTÎ¹-ƒ€0:Õ<ÕË‚rAªdWdv<Ùî0ÒR‘F*ÌÂÑKL¢Š(QE\0QE†QE\0QE\0QE\0QE\0QE\08TŠj!OSIPÕ…5QMXF¨hÖ,œRâš¦šÌÕ	ŠLS¨ cqJ--\0¥Å´†&)¤Sé\r\0DEFjSQš¤Ci)ÄSjÑ)JZCLDF˜jF¨Ú¨ÍŒ4ÓJi´ÉaESQE\0QE\0QE)(4P ¢Š(\0Í-%\0´™¢Š\03Fh¢€Š( Š(¢àQŠZW‚Š)iLRÑE\n(¢€\n•\rENCÍ&4hÀÕ¯lÜ\nÃ¹­kVé\\õÝE›Pž•q*„ UøúW$ŽäIŠ)ø¢¤v9U5<gš®•:šÝœˆ½â®$¸k-dÅJ³T4R4Zn:ÕIŸ4Ï7\"£rMJE¦<ÕV<Õ‰j«Ö¨†ðjU—Tš7‘UÊ+š-;vj‚ËR¬µ%)¸ÍBWš~üŠ8¡h\r\\b­ÆxªÀsS!¡‚EiÝj4æ§ÅdË‰p*…Ëà\Z¿1ÂÖ=Üj©«±T•‘ŸrüÖ{œš±;äÕBrkÐ‚²<Ê’»\Zh¢ŠÐÄ(¢Š\0(¢Š\0(¢Š\0(¢ŠQE\0QE\n(¢€\n(¢Q@Q@Å¢Š(\0¤¢Š\0(¢Š\0)i( ¤¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0)Â›N†‰c5r\Z§\\†³‘´\r+B\Z¡\0­WŠå™ÛÔgVQª²*u¬™ª,«T™â«©§çŠ‘ƒš­!©ÜñUdn*‘,Ú y)ez¨òVÑFR$i*|ÓÓsšÑ4!$ÓãBÇ©cWí­ùTNv4§I¶jxzáì®—?u«Ñ&UÔôÖˆòX~UÀZÃ·½uz5ÙxŒlpG­yõ_3¹èÆ±+øzV³¾’Ù‰zïãœÉ*FkÏµT{Kä»Lc†ÕÔhú‚ÏÛÔ\nÊ]Ç5us G#¬Ç.Nf¬§)étšÎö2q¹¦ìÊ¹SPí2rØªm{½vƒŸ¥M\rÀ$\nw¹<­!f±I«Ÿ”úWlÚ¨‚`víÚ½2…rMgk–×úmÂIÔ!)ZiXp¨Ó³9û¤ûMš?»Šómr %Ø¤†lâ»ß]	b’ÎcûÄ%q\\Ÿˆá]8?ÂO5­-$hÖŽ\'—\r²6îÕn‚Ð‰”áAÁªŒ±‰$\\ñÏZ[x$Ê|®yZôšM1m3yTg×ß5¥\r›ˆù×¦{Ö=»€C¢µí˜¼xï\\•ÝMÝ¨BqÁéSG÷‹o<öÇJ‰Š#6ÑòƒÖ¦]Â<¨éX›ƒ(AŽµ<N°Àç·5IXcrñš³]·ä8ÅC¤’ø\r^]»8Àö¬ÈãÂ3É½]Fcçç=J†„Ëì£ŸÈT¨câEàâ òŒâ¤VeB¹\'&™qŠ®6ìþ”ä“yôª»¾\\tþµ$N«€sA6,+,ÙÎjÛØ*p¸ç>µIÈR	\0õâ¤2\03g×„Ñn7•ïVw!6€Tb¨‡P¹v«0¹iŸ€dÓ¹F…´ƒ\r½AcüU+LÎ*Tž}jˆ,Ðã#©ùU¡4@yk!vQ¹r1Z&bã©+	JÅ<j®àà¦ìc²J»Áb\\n	ýÚ«HA+³i$·<Ñ`ÌÛOÍ-³÷~´Óè.RÄm¶Ó±åAåjy×È…n„Š§o–œÿ\0úê4d‡÷ˆ’Ü8m€uõ¤‰£U1ªl\0“‚r>µi™½Y eÄ„2£1ûµ}	4’<7™ßÀÞµ3rr“e$$²1a•éÓY˜¬™À õÍ=™‰Œwõ¨dpÄàYÉšÅI‡—8\'<Ò©SòžöëR(Ø»@\ržAî(u<g\0uÈ¥bî,\n€¤€zŠg˜°¡g\0ÎiŒª§¿×µ5°\"õ÷5B!dóvé¼ä°<éŠ‚hÃb¤>q´Ö’å\'¸&%•AæO¡¬ËÛùôÛo>@:;x#¿Òš×`Ô¼‰\'ÚYÝX@}9«•ñ‹ã±[Kh·åØ|·Ë ì\0þõk¬ñjþLÐjMã°Ýº•íõªSØé67}Â,—\nÛUY™ë¹@ûÙ­!dõDÊïbÖ™ÜYÝ_+În2\07ªö.	ëW´«Ûù´Ù^úxG€Ñ Ã¯¦}êœ¿f¾/5½ÄÐÌdCaØzÖ…¸‘58ÎÛ5Aà1ÌýáÆ?ZyV ’\\oó\'ÀÚ9ÊŽ˜üê\0ÇÏ eãûÝp~”’Åö[“\"»c¹²7ÃÚ\0dc\'q=ÍfÙªF´RÁ4b¡.NJúUiãã-ç¾ÎŸ­E¢›x™\nñÏ¡«vÆFûÊ(&ÖfÝŸÛQ™3û¾@~ÄV,––—öæá¡xœ²¬dŒãžG½vSld8P[0â²|´‡*:·\'\"ª2±Vº1¥´†Eó ceYG?JÆm\ZöÞ)¥kdvÊ*¦«°–Ú=¨°¨œES»Wg#l³œ\0Ã ïW\Z	Á3›+çØFKG±¶ç¤;þ b³u(î¼³v¬æ57+áÇáé]}î„$É\Z:÷ùªri±ÁvŒI¡YQ»{Š¸ÔKS9S¹‹k|°g´1ÆÃ}sëVæ¾žîÜ=•äà’è>Õ^çL€	£]ÊÛB¼Ö=Î-µÀT;]W!”`ÈøV±Q‘”¥(Vâámö[mBß¶Ö‘Oˆ­ñvMçîã\rÊÊxúb¼î]G~’ÂDF*@Ã.ê\r%¦¹¨Y9h.Þ£¨È”°÷Õ\n8‹£›X*8!<ö¦Ë#F¦EëŒ{Šæ­5-Vî5#†9˜€³g(q×5ÐÛ½ÏÙ¢óÄo#s¡®9Ã”ì„î8Íû r	ö5àç PèY8WŠ“yÈuTXÐÆ¾ .Ñ÷®~rÂLŒžµ¿¨mÜäœ\nÀ˜‚X‘Àìkª™B¬ÙîãÖ³§ZÔïŠ€1Ò³nA\0±é]P9*leIg ÔFÝ½*ý´>l¡pN{Ö§övà>ZÙÔå9£KœåÌv¦ˆ®–M3ÚªI§‘Úš¬˜¥‡hÃ*E7§%™ª³ÀGjÕM3M¢¥%LÑ‘Q‘Š»™´6Š\\RP ¢ŠZ`%Q@QHŠ( Š( Š( œ)´¢€%SS£b«R)©h¤ËŠÕ 5U¥V¬Ú5L›4µ4ìÒ.ã©A¦f—4‡qù¥ÍGš\\ÑaÜ}4šni	¢Áp4ÃJM4š¤CcM%Š¢”ÓÒMjb#jŒÔ†¢j¤C\Zi´¦’¨–QE\n(¢€\n(¢…RPERQEÀ(¢Š\0(¢Š-QHŒQŠZ.Š(¢ÂŠ( ¢Š(QE\0R\ZZJ\0)Ã­6”PµÁ«jÕ­;VäV3GU©½lx§dÚžjÃÚ¸¦zpÕ1E:ŠÌ³‘J˜t¨ÔT˜â·8Ä-ŠU~j64‰Ö„\\C‘O#ŠdCŠ˜Ž+6h‘NAUØsW$QV™2ER•.*æÏjŠHêÓ!¢¡8§,˜¤‘pj2qWb/bÒÉS+æ¨«TÊõ&‘‘p5J‡š¨¯V#j†‹F„C5cUhX`TÏ Ö±{šlŠ·o€kîNMi^ÍÖ°®_$×UuæV‘²jNc“L®ÄŽÂŠ(¦ ¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE(¢Š\0(¢Š\0(¢Š\0)E%\0´RfŒÐšJ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( œ)¢œ)\rÇÖ¯@9ªQõ­aœVSfôÖ¦ºt­(“Š©l½+R$â¸æÎø-Rž¥	Å.ÚÎæ–\Z(\'µ5ÛŠ©+ñRÈõNW«ˆ™^WªŽÕ,­š®ÜÖÈÍ¡¹5,kšb®M\\‚.E•‡\\š³ZD*#Àz5À®:’¹ÛN	¢\0b¯ØÍäÝØÖh|\nxœ©kµ¡Õ^B·–„G™¤ÝI§Ü4N§ocW4ÛÁqA÷ˆÁö%ÖžK†Èõ\"—K35¦Œèá»Y¢S^ÞFžkM‘àp¬ß&z×]jÁãÛØŽ+>]HŸ»±Ï4’Ú¹Éå»TöÚŒ€‘Ö£×•á|²|¸áª†‘þ”»Ÿ=p3O–È¥ï+›¿ÛOßFÀî)½it¥R\\1þàÓÎšÓDHÅU$DÈËÏ­]LýÓžyE§ˆ‹FF$â«ø‹ÛÉ.9ÇZ³{bìMžTð)—qùö®¬Èèj“³F¨òÝEW0®MHÉXÉªã8õ­\rZÑ\ZHábTîåÀè)µŽq”	\\Ê½5+Å|£Ë6*y‰r\\«+ä0Ç«jë·¿\\Ö2Íqu©\\4Ïæm}«VÕÔà1Þ±¨ŽšL¹.æF	ÂÕ«w>NÐ{`æ¢ƒ÷í„ïÚŸóDäÿ\0ú«ö7D¸ðjD&+€ØùAëš`ùäri¹H z’ÍxæflmÈ#®j]ã Ã=+.dW®	ÏïWžRø;p{\n†â3·‚3Å\\B6Ÿï€Ö*©ÂEÿ\0T}}kI%WùN8ïRÐ™k8þæ„c=ÔTyÉ·z]Ùe%€_ZB/+Žá¸þí;qEQÁ3š¦$‘p|Ó÷³&Iq×Ò¬_‘×æ^EO€)^sÓ>õ»#ûÙÀ©âs¸¸$îíØPKFªÈ¹Pãjž	÷©#™ó›p=êŠ´2q·ÞƒåŽ\0\0ä\nw3q.‚¦up$AS8F$ò·?)àUHÙŒ›˜|Œ2z•Ê,j§8-Æ*Ó!¢Ìba#ÈÓ~ì¢4ì=éÐÂñÆÛäVÇÝÍAËœ(Ác’Ç ©ø,Wvzâ©Å••¸aÇ¶i°¤õÇZŠ^éÉ õíM\r•ƒÏZMê4´ØO&›å±p1ƒÜ\ZqÀ#¬ýˆÉèI¤RÎÒ@9ÅAÌ|Þ*ÀÏÎAàúzÕ+i|ëu•Ç\\‘@HÏéE‡q·“ˆa[i™ª–ÒŸ-bÄàäÏZuÅúÉiöˆ³å•%C¼Á?eËs6‘k)óá‚VìGzj#¾…éÄÃmÇFnõ™q=¬ÑJ$¸….U¶0¸$ ôíÒµÕõ£Kcw@sæC!æ#Ôz¯ cSI­á•ÒS±oàqœV‰Y\nãÑ.m‘b¶¶Ùq·å¸¶Øñ2þ`Õ›yÀÜKiw=ÔG•„m\rìIâ¯ÚépÙHñA	ŽßvðwsŸJ¼Ë\rÀv“Rä2½ÍÎ¦=Õ›ÚÎ$ù|Í¬îx5–%a\r’Þ#u\\\núV¦ÐÌÓÏ?,qÈC>f<“JãZÒ¡òÕ*¸?JÎ<2ôºU±<\0¼÷4Ùtå`FÑõ£R”ã±Ê½ã™0ÏZµoæÌÜžë[GG\n…\0Py>´ö‚+`»™n‚Cž=\n\"Ûwò;zÓ%³;ºTóß¤3ˆYyïŽÕZçSŒ¤Š!H\0Ž„Ò³fEö%U98\rÞ«½Œh^­ŒÚ¢7¬Ôä•æ “RýßsžqUÊÇrÈ„0\nzTZû°1ÓŠªúˆAŒsJ50\\uÛŒã=iò°æ!–Íw•ÆÇþŠÃ¿Ò®åeWÜ‘Œúšé\rèvV+ž*mÖÙ`l)==jã\'D¢¤ŽS‹Í‚uÙ~BŽV’Ú+;‰RêñMÈ_v9îk_P´Yï@è@éYv¦M/V\"AÐ°\"U—ŒZì„î¬pÔ¦âîiZjb´†ÒÆÉ1·³ƒÔ\Zé´ÉA\r\"Ë…$lzzâ¹˜ôÌÝÏc¬ñÅ‰#‘ÌAíøV¿‡$Šrð¹Ftl&ã†FïXVŠµÑ½=™¯,€\\îÏ8ëHÇl[½9â™t€ÌœàæžÃnU8æ¹lv£*ö5eg7mÉ®nsºf\'îŽ\0¿|ß»qÛÖ¹ÐJÉ†Æ`g½tRØÆ®äLÌG–äžþ•Zu,N	Åh^2¬ à®xVUóì †Áìk¢\Z³–¦ˆn–­ö´ÃmÉüë®ŠØ0é\\u‘u¸Y‰áXf½ßkª°SˆÑ†èRkGJ«.ž=+£äSÛŽ•ÍÎÑ×Ê™ÈM§{Vlú~3ÅvòÚÚ¨Od0x­cU£9RLáf³#<U!\"»+›¼V-Í™âºáVçZ9ö\\S*üÐ\'Š¦ëŠéR¹Å(ØŽ–Ž”UQE\0%´”€(¢Š\0(¢Š\0(¢Š\0(¢Š\0p§ƒQÒŠN¦¥VªÀÔªj\Z-2È4àj5 ¨4L~hÍ%vi3IIš\0vi¤ÒM&‹\nã‰¦HM&j„Øê)¹¥¦H´ÓN¦šµDjV¨Z©ÆšJSITK\n(¢Q@%-%\n(¢Q@´PQKŠ\\PQŠZ)(¢Š\0(¢Š\0(¢Š\0(¢Š\0ZJ( aEP ¢Š)€QE€š3ÍhÚžEfÇÖ´-\"¢hÞ“ÔÞ´<\n×ƒµcZkÁÚ¸fz”Þ…Ú)½¨¬Î`\nqéOÛŠ6Ö©œmØR¢óR2sOŠ>zSoBRÔžàTÌ¼S¢œëX·©²Ø¡/Zƒ<Ô·ÕBüõ­b´3“,Ži’-5^žNE1åJ¬ËZ¹ªÎ•¢‘%\\b¤SAZP1T$‰Õ˜Ú«-H§›5Eô—’[Ž:ÕO3²ÒQÔ%-î¦Îy¬¹[$Õ™Ÿ$Õ\'<×TŽ\n®ìŒÒRšJÔç\n(¢˜Q@Q@Q@Q@‚Š( Š( aEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP\0)Âš)ÂÑ<U§l9›iÚŽ•C¦–æÍ¨àV¬KÅfZô©â¸fz0Øœ/ÓÅ.î*7zÍ5Î*»µ,U$’­!0‘ê¤Ny*³½j‘,ÎM34¤æœ‹V+\\’(òkBª#­“°œáÄ˜©Çš£”ô¬§B›“ŠGj®ÏÍ	æÎyä]rÝx®Þ)â,2ñŠòÁ+FûÔàŠít-U&‰T·#ƒJqêC5d¶0°ÉIâ¶tÛ½„+t¬Ùž9£=:f¡´‘Ùöîèp\rek’õVfæ³$Û„`[qá@ªV‰	ÊŸ—°©£ŽFpJîãƒéSÃjÊØ\'9¡½–šl\nà£ŠƒPr‘zJDqwN¦³õ]J8¡%Žàõ¥º%Eóö«ƒ&Þ\'ò©c²yàê\0©ªÖpÉw½Ã9=ë°Ó´õòÊã#ÒÝÙÍ¨-O×mÚ\nc=kKG‚én#m§î¹¯Hñž˜,ï‡BdJá¯p’˜³’ÃŠî£\'kõ—¼Døª|Å—9µY·RçqÊã±¨ìð%#pß·ž:\n˜+A{É Í9>…@¹o¹\\ØôÅM 9c×ž*«;ÃµòIê(mN7\rº0zäVVfÉ—Ò`WÎ:bœ]£Á`z\n‚ 8?ˆ§bG|0Û†àžõ*äŒÁŠ”oœsÍiZ»Éï\n #/1¦z‚)ðÈñÍ¹>Qœ{T½JE¿Þ«‚\0z¾ ‰<Æ#½V<‚q»\'‚H’ ”.ìç¨¬ØËQÉÔúÔ¸ßÆzÕR6mçð©VL©ù[Þ‹$Œ©S½EJ®±•=Vª£.Ænxö©åY9qÃ÷¤.¶$	—B:UÝþR‚¸5H8 €{~U\"ÍˆëŒ­ jåÐëµ7çœU¥9ËgŽÕždÜ«Œð{Õ¸ß$w4´X¶¬C—\'ŠœKü\nA*yöªGh<™ùMKˆ²‘!Îìãš!¢Öäè§>Ý=1ŽäœmçÞ«Æç$àFŸÝÃœ³eÉïŠ´C];’©1p¿„õZ%} àaIâ£’#\"ÆIKÞ™,Î6ôHÎáŽž†®\"`Bï Ú‡Ã ª7×NºsNŸ*Xÿ\0w=j¤×›,¬]Á_·}¡?†*-m£¾Óntñ¿Ê@Æð½qT– _}Ib‹z‚èXªîã ¹¬‹mJX4ëa3FüÛ˜žJ–$ëÖ°Æ¨³øQ¯’9d•!$ù@bOïÆ+Ré£H­-î¢Ey\"XaŒð˜%¿,â¯’Âº!³¾ŽmhéŽ¤Û¤Ñùƒn$ì\'±©4eŠK3§6Øã”°s’=MXÑíO™,¾Íó,~cs‚ã$n¿5V÷FÔloûHI\ZœÌ’’¬2s‘ëEÖÅ\"ô}ŸÏµˆˆn˜c$u#ŒÔ¶\Z,6È—3\"‹·ÿ\0XÑqÎkN5D³<J$`	oJ´c,€àð9¬î;•Hw\n¡yïïV¢‡cŸ0îÀàzQæ[Ä™gÃc8ïUgÖíÊ~èÝ²(ŒDÛèjGJNí§ŒóL’òÚÙ	Á\'¯Jæ¤½šc–|&ríìiêQPºR‹&ÖÏ`FGëZ(’ÒêÍÅÖ!fªSÔ°¬ûÍVb^4ÁóàÄr£éYw72DÓE,‡?ëv¢gxè1èj“\\,f|´†o)D`òH9ÈþUV\ZIjkG¨Ü]8Yä¼RÊÇ—\0qõ5FæñÖÞÝ¦‰‰v\nÎ3ÏÚ«ÛH§R³‰&\n‰!.9°N}¸¨ooG,HìÑ<àn+À\n;Så¸—sËÂÀ3ÈàœžG5¼Š’ÇmÊeðO\0ã?‰ª’Ý¨›ldÉŸ9ºç1UšTfæ\'Äñš|¥_¡¡wp7æ¬Œ¹QŸJ¢ÒeXãä~€v«É31`;€ÁéŠVýÅ»Ö7Ùíè*”DØË™Øí@I\n[=*pÁ·(ÂŸZlï\ZM²,ªíÛÉÏ& |)2JòÄÕÙv^KÐ‘1Áqõ¦Xªf$À5upJàsÖ²æ»Á~)ªW«Êu-pg‘vœÈ\"¯Üé‘ê×vR\\…ãS1ù€ú×?¡Äóï`w÷8ÅvPùP¼s‰0FI²žØ¬çîlR÷Ñ…£ióÅi¨\\y§Ì·¸XJ\nú¥X°¶¹½{‹ËfŠÚD™|ÐãÇ¨­KëSœ×‘;4¬ÎöÇ™Ïý*”¢k¸$;$‰UÂç¨\'ÖŽndÚ%G•¤jËûçï’M$ÌvïÞ °I4±’3ÈÁÈ5-Á\'ï+™«;qf üúóX­ÌË¸àéZz”ª²sYPy~ûyÖº`¬Œ&õ%¹#-Õ@ÉÍ`]L«t î àö­}BIRª€~WbzV³Ûµée ¾Å]Ã?•tÑVrb%ÐÐk”žáå\nãÑFvzT›íã\'®9ÍyýŒÞD‹&Ðì¤­Ð×w¢KæÚ†Ù€yÿ\0ëTâðïS ŒqO+M‡ ©±^{;‘]ãVXjù®h¹F%Å°9â±®í3ž+©–:Î¹ƒ Ö°•‰”nq7v¸Ï4X5ØÞ[ðx®zîÅwR©sÏ¯HÄaƒM©åL\Z€×ZgQED¤¢Š\0(¢Š@QE\0QE\0´”´ÀJQIKHR­B*U¤ÊDëRŠ‰*e›5C€£´T–6šiÆši’Æ“L&œi”ÄÂ“4QTH Ó‡Jh§\n\0ZkS©­B6¨š¥5U\"ÃIKITK\n(¢€\nJZ)\0”RÑ@¸¢‰KE€(¢Š\0(¢’˜…¢“4f€Š3E!…RPÑEÀ(¢Š\0(¢Š@QE\0”´”)i)i‚$Ž´m‡\"¨F9­k(‹YÍÙSÜÖ´SZð¯^ÊÔ8­x­Åyóš¹éÒzóE[û3zQYó# æÙ0i¡jÔ‰ÍF©3	\" ™«A“ÒŸy­ Î8¡È”ˆ£ƒŽ•ñàVºÛàtª—Q`\ZÉ=M:ÕØÁ5˜í†­kåÁ5‹)ùvSØç¨É’J°¯šÏVÁ«½T‘1e¾µ­9[4§‘Yš•Yy¦mæ¬²ÓvU\\V#N<Söâ˜ý(Ü{±¨$j‘BÝ*Ò2“+IU[­[’ª¸æº\"rMÒRÒV†EPEPEP ¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\np¤õ4˜Ñ<Bµ-GJÏ…kVÙ:V×I\Z–ÜZØFÀg8Ç-ÎØ²f“Š‚I½ê)$ÅS’lP¢W14“g½Vyjš¡i=ëE\\‰žJŸ5IL/V¢C‘0<Õ¨FHªqœšÐ¶\\â¦Z\ZCRõºUø×Š‚â®¢ñ\\²gTCÆ©ˆ¨^¡WsUd5fJ¥)ëZ$&Æ3ñVôÍ@ÙÜ.:1¬çj=kN[«Ìz)Ô•­Á\rÉ­mfÏ4ç=NkÎlu#òÛœr\rvÚêHƒæÎ\"¹§RÓLì£•\nñÍL»þö+:Ù•˜`šÔVÜ€f±lÍ«nªV#XIs1gbWÒºF·ózö¥KU\0ij\nI´û2Š\0k¢R¶–äätäÕäŒÕ=GRH­Ø³`MT}Ó9^lå¼_t’ÄK0È<f¼æü¦øee\'Ô¾(Öæº¿bˆÑ¸QTF¾·P§<dûb»hÓqI±UkáD±;ÈlqëZ	›‚Á\n3œõ5vVÙíÌr¬ž`ÛZVH^@;¨MìÊ2\n©Çª&œú3FÙ’@#Ç=ª÷‘ÄÞhÏeÀâ³`\n6ÊAýç>Õ§nLg+œgàVFéÜ«,RBà;Jÿ\0	èjpáÛLõõ+ƒ!\' qÈ¦Æ­œmŒ÷5ÕÆÈ‘1 †ê)È¥þr§5\0>b©9ÏqéSµŠ,ÆåJò2=jFSæåB“×\"©Fäœ8Æ*Ø*&œ‚1JLeÁò£ŠíSÖšª»±Œö§’¬qÚ¤ÛbøÉçæžW•ØHðÇ½B¬\0d<€>õàlÈÜi·Á“\0\0óŠrº-ÚÉî=)°2Œr}(|HÅvíÒ•À¹Ô’>U\'ò©¢óÐ¤žsUà¹Î*ÜxòÈèGCA³ !þ÷4À6bÍ‘œæš¤±éN,½íL‚ÊíQÓ¾qšlò¯Ú¤d8å\\ŽÂ¢‚lÊ€méî*ºÉåÆÒ³oUG?J´CCÃ4’W“ÍY!~µ£t–³µªJíÁL˜c Öu¶£¶îiQTGm“9\'‚O;WÔÕ«–Ô\"7S\'’˜%L„/–…k™½Å]a\ZÚY`¦Šr8²¨õÈçZ”ê&&Õ\'»—÷	‰…ÛšÀÒ.¡\Z{Xis™RÐ<Òñ„-ž71êqÚ¨Ou©]Z%ðeÝ8â<d¶knB¹/†ï[PÒcµºA\r´¤¹ï+ã€=«¬¾¸þÛ×íl¥Œ}I#tÌƒŒ!¬Ë6tÔ£…¥FXí¢yJ”~Qï]\\v‘I2LP§G§ZŠ“÷‹Œ4Ô§o¢4V/$[¨ÉòÚC»b“œ[Ð$›Q¦Ù#íÚÅGð¨s‡bFÖ¦\\êIl\0¹¬¹Vl¿ Xò OJÈ¼ÖR%tCËk\Zû\\šU;ë´ô¬G¼yrv’y#œn«Œ.>[nkË¨¼ÄÛ]O*zãÚ {‘É$\"£ðÁ¹ÇøVP¸±,a‹\0ç¨4ë‰žéxMÍŒ1Ò¶Q°6h%ã¹’3\"ŽëÇá*Ë,‰5Ì:®D €1ßŒÖr9û:íC×½/–g—{ªäñÖ„•Ë&ug•Zá›Ëªv·çUÎcuÃb¹&¬ÇnÙxŽm>õ¢;p¡‹u÷ µ°HÏ˜¸ç“ß=üQ$KL\n(ÉïPD“Í*½¼[”6Þ95|i7R3#Ç·¿\'­eY#8|Æ*˜8äƒÚ£dÀHÁTžOµti¢K\ZåX)?z«Í¡ ù²Y»æÐrßcÞ)¥\";GN)$WQ…L“Óëf;F„•ØL®ŸuÔ §Ì‰äg6–Œ‰$Ò@ÅÏÇJÎšÒP¥š7Tjìe‘ l”ùwªóìUÙ #pÊàpi©™Êžß,ŒÞTQ>WÔpj\r%æ¼ànö]tè’´…°»GÊÇ½WÓÖ1x£^æ´u-}•å©ÐhÖQ[Æ1Ðx\"µ–$¸h¨-HX¸qšt“‹x¾fÚ½s\\Rw:â¬G3<S‚Ó)‚Q±“	éXš•ºÛê±_! ”0º7Fµp‘^¨	8\\®RE\\×-usÜm<NR&ßnTZ¸\\™w6­|›2g™˜G*€v®vµItd„í\\Ž{S¬¯m5ŸÈa(\\`ŒUMEYPÆr	<ø¨ë©{#Ÿ¼ÜU‰{tÏjÎHÌ²±™ý}jæ¡*¢o-½kîgóW$ˆ˜ŸOzë§£’¤ìÉ¯\'KËp\"<>ÓsVH´nUÉ‘„rjÔ³Ç²8Öd,°lHä\n»gâtÓô¥¶²–æiwÜK ±á:éŠihqÕ’“3 1EÊ?œdÁnØô®Ï@fK}Œ¤Œä\Zã¥ÊÊ¡6àä1Ï½wZ5¿“mÞäsYb>l>æô€jÈ)ÅN¼æw¢&\n°V£e ¤Ê²-R™2+EÖªJ´ÐÌ+¸º×9}3Åu·IÁ®~ú>µÓJZ˜UÑÊ\\&	ªL0kVí0MfÈ0kÑƒÐòj+2*CJi+S¢Š)(¢ŠQE\0QE\0QE\0QE\08T«QŠ‘i2‘:TëP%Nµ›5C¨4R\Z’„4ÃN4Âi‰4ÓJi¦¨–RRŠbSÅ4S…\0-1ªJa¡TmRµFÔÉdFŠSITHb“´Pb—QHŠ(¦ER\0¢Š)€QE\0”QE–Š(\0¢Š(\0¢Š(QE(¢ŠCŠ( Š3ILAER\0¥i)GZ`YrÂºm\"Ô¹^+´q]×‡áV¹13å‰­=Î“LÒË\"üµ¶4’îÖ–f¦5â·…)Ò¼	×|Çl\'cŒþÌ>”WZlFzQOÚ³hxÄÑóP…æ´\'š­³šïL¶>æµmãéT!\\\ZÕ¶¡’Yüµz¸µò6VUñàÔ-Ærš€äÖßxÖö¡ÔÖãæ5ÝKc\n…py©‘±P´å5«2Eäz™[5Išµ&²’5‹%Ûš]•*&ja›fÉÙp*¼ƒ­hI*œ«ULŠMQ·J–¡qÅlŒZJ­\'Z³!ª®y­¢rÔ#4”´•ª0aEPEPEPEPEP ¢Š(\0¢Š(QE\0QE\0QE\0QE\0QE(¢ŠQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QJ(@©£^j%5nÎ*$Í\"®Y·5¯mJ«kqÅlÛÅ€8®Z’;iÄ|iNaS¬xÉ…Îƒ>vÅgLõ~æ²¦<ÖÐFrdO%D^šíQ­’1r%/@jƒu=4ì.bìÖ½¢V]²äŠÜ´\\ÕY×D¿p*Ú¯ÈSVB×gb!aÅBâ­0ªò(@R“½Qš´%BjÖ$²”†¡-RËUœâ·Š2“&IJœ©Á­m+W’Îä1o“¡¼Šp–©Á4JYÓ|C‡åñ]5¾ Ž£‘ù×„Ctñà«‘zÕµñõ¹ÂË‘èk–xgÐ×ž/sÜ¢¼†2)e½W¨üëÈ¡ñ¥Â(Þ¹Ç¡§Kãy™HXð{sYû	ŠÑîzMÖ¨ˆ‡s×5ÁxÅHàƒ¹êAàW-¯]ÞV\n„\ZÇ’bMmO\r­ä\'5…žS#³1É&¤±bûáW\nØ$Z¨Zš$h¤)Á×m,sIõ/0Pñ…åÁàv­+ma ’H¢&$‘BÊ3÷‡¥c3`ê}ýªÍ¹·þÒî‹,KÉÚ¹Ï§ëIÆëS5+=\r“1®JƒÇµ\\±»LÑž­óè+\"9LöàgçRHÒ¦´¼Ž)W,²ýÑÔV†‡Dg©ÕÆ¨êé#V$ÅVµ™ä«\0¨f­Å0ÞBô¹Ø™^HŠ¤ÒÄÙËóJ—,ŠIù±€8¨ÌÂ;ÆÏCKq\Z£\\\"°FS=\Z‹tc/Ã™¸ƒœvïVJƒ1.tµIo1hÔ«m\0‚+F7RùFÜVmXw¸Ä”˜Q±‡\'æ;‚²ð§Ò¤P¦\"«\'=jÏ#2‘·;€×“Ë!Ny©[„VVã8â /ºuFïÂšGûDnÀgäå×ìüâ5 ÄÕÇnBóŠ£\rÔoh®[<djœL®¡Ü¤qŽ‚“B-Ã#mW#*ìN%CÀéTT»mýê”1òÁ‹åpy‘,½‘°/§†p6‚>l`ÓP,r{ÓdÀb3IH›9·\0ÏJÍÕZÓHv£êÍêkBÜ†&)–åwœVd·DÝ]Fð«ìË ÎrÄšÖ(†eé‘C¤Zù¯ VÊ±ÈsœœçÞ±u;8Ò[c¨»—¼Ë¬y? GáZ¢ç¶ƒ[¼WòbŒ\Z}Ò\0þ•ÎêZÚÌl¯$¦ÔXƒÂƒÓ?A]TÓnædÎ\Z¶•k4k$å¥i\"_¿“À>øÅ]ÐÖaakn‘:òÎ}j=2O\"	Qˆ1Æ\0ÏV=Ûó­¥Ô¬á€™IÆ;šS—DU8u6m£HIé’ ¯z±-ì6ëž3\\¬šú.à[ýk*ëÄ\0œÁµŠ§&jì·:{Íw‚ ð9¬Yõ?8ä°#û¤à×?-ù•‰Ü~”e˜åAb9Åm\ZVÜ\\ë¡¢gÜû”‘žƒ=)…¤Ç$íKiiqtÄ¬D(‘Ú¶ì4Ò¬Z`gûÕÙ!^ædVòÝ´€Ã{š»gjZepq—è\rmAP£*ç©cÚŸ\Z);Àäžis!Æ-•?±–+ØÑ®ÒTaûÖˆ”ûzÔòè¶^_ú1œ9ù¤ô­+XÕ¦QÉÇ<b®´kø\ngê\\‡k;úh©Ô3î=rjÌz<`å×¹í[NŠ%b\'‚bœá”0 çÒ“cæ2ãµHÐ¸Rx«»vñ¨îBï–ÁÑ7•=@õ§.ó³7&áî=hÔznP“’j	P+ŒƒÒ´#´Ýqn7b9z±íš[¸\"ˆIíÅ ¯JV:½‘…q\0ÈÞ\0ÈàúÖlÑ.ý¬~^ø­¹9ÒÅO–]bGjÅždkIIRYXôÅÞå{ß)RÞâ.Ž¥][³Õrå‚(S¸¼F=*ÄÓl­™¾S*±#œqYW.ÜùyÛ¸Œç­R3}Š·î”E7LFÜ]¸RxÏjU·iØ±ˆïW!Pˆ2¤õìjœ´±	jlÛÈV,Û¤mÒK\Z(ÜOðã­UŽt©î$+>pC³œsŠç¶¦ýëgò\rÛE¸@³cËÆqêEKxp‰åÊ#-ÎzÄTVbd	öN‘¢0Üd\0³‘ÔûVškMDm‚A\"JnÈ•{íõ­To±“•·:T3YÛ–HY@Ý,dÖmíä³†©ÞF{æ¬-ì\Z¬e°g2Êv,l6Ç æ°|@.ím‹H­:Ç/=9Å8BòÔ‰Í%tdßß¶ørÊpÈÝ÷¬{©MÄIŒå‡#Ò¬^ÜÜ[Þ2‰ƒº–üx ŒþTÙnb»–âúXÒ)7e\"Œ|Ÿ…z*¹çJ|Ò³(²NUïW´\r+ûZø§š°€•Ÿ¦à	\0þUJ{kŸ³}¡”ù9ûÙ«`\\EeËÜDVq´*8Ü¸õ«G¶†=K Ï{¨0œï™Ï,\0ÇZô-\'\ri ‚3ë\\6ˆÑÍö¦Ü¼“	8?êÆFkÓm­Õ4„\0\nãÄ¾‡f¹n$â¥ÛN8§•®v¦W+Q²Õ–Z‰–‚®Uuª’¯~AU%hÌ«•àÖ\rêðk¡¸\ZÄ¼^\rmg±Ë^§&²%šÝ½^µ‰0æ½\ZOCË¬µ*šJq¦Öç#\n(¢˜‚Š(¤0¢Š(\0¢Š(\0¢–’˜QH\n‘j:‘i1¢t585YMN§Š†j‰)	¤Í!©(Bi†œM0ÓÒPh¦H”áIJ*€p§\nh§\nL¦\Z}4Ò&¨Û¥JÕª%Œ4”´S”QE\n(¢˜‚Š( Š( Š( Š( ’–“\0QE\0QE\0QE\0QE\0QE\0QE€(¢Š`QE \nQÖ’”Sí¡ÃŠîü=0+Ïál0®£FºØËÍqâaÍZ{žÛ¢Ü)y®•Y+Í´MKå^k±´½£šð%AóIUO<zÑZ{3ÉeLš®cæ¯ºæ u®´v²8×¯BØªYÁ©\\S$Ñi~ZÊ½“9©^~:ÖuÌ¹Í@cÞœ“XÓkbë’k2Uë]pfRE\"´R•¤ZÜÊÂ æ¯À™ªÑ\'5«kJÎl¸\"xaã¥Yò¸éV!‡ÅLÑ`t®fÎ„eKgÍ5·4uŸ4}jâÉ’2$LUIx¡8Æk2v®˜jsTv*Èj³Ô²5Bk¦(â“’Š*ÌÂŠ( Š( Š( AEPEPEPEP0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0)E%<hcD‘®MhÛGœUHW&µ­#éXM¢hZCÀâµá‹Š­k´âL\nâœŽø­òð*´ËÅ_#Š§8ëR™F=È¬™Ç5³r:ÖLâ·ƒ2š3¤¨Õ™Z¬ÕÒŽY\r<C&¡jÕºäÓ£¹§f™\"ºHø“cJè-càWYèZ‰0*m¼S£N*R¼W1¹U–«È*ë­V‘i 3¥BaZs\nÏœV±3%ÕI:ÕÙ‡5NNµÑ	“MÝŠV¨ÍjŒ›¾ž$5hÍ;˜³æšC)ªù¥ÝEƒ˜”¾i„“MÉÍóE‚ãÅ4ò(PaÐ¹°ŸÂ+0a\"6\nàŠ®ùVÜ8©Yƒ*q‚2jŽii¡zÒv®U†âyZ¶»DÑÎ£iR7f³£+ó°û¹Íi\"ŒÇÆ~µ”Ñ¤Î»OÎhÜrJöéŠ|’ý’õ×\0#ŒÕŸáù¿˜œõ®ŠúÕ.íÂð¬£‚kÏ’´¬ÏFº2.-ÅÊ$¸ïLGY-|‰ä‡j±vvØoXÈÙ÷ÍcÍ<qÝÊ2wÌ(ÆBÓŠlnI-„Ñ¬‘Ç.vv¹­=6â4Š(Ê¿˜Ç9\"³e‚Yå‚âÜ€Ïòº·¥jZbw‘…Æv‰ìz›å\'×ŽµpîÛON¤Ð·M€®ÒiÐºO‘@S¼«/Ðõ®{\Z•®×Êeù€çéSÅ!hþŸQO–0c}àG\0ÕkI&»‰bVŒ4d«o8\0•KT&NaHsÊ¨àqÁrÝÅ³Ç J©l±ÝXy0ùÆÑRÈø•[qÇ½M‚åâårbˆì*Æà#RªGsYË)Ž% e±Û­[å*<‡÷^¾”¬&iÂwF;Þ˜àï#£TpK¿‘³5#XÈšDP¸H¬}BAö‹{DŠI¥œ•%W…æµ†P}üg5XIqm»t‰(\\c¾Õ¤Iw1¼W§;éÖŽßÏÈ\"ÇéX–Þµ‡Uxî•þÈˆ!ž¬=O½t@~Ä/äºv™g2*1ç¯JtVÒý¥$ÀY	˜ÇÔ‚{{Vêm+(+Ü«r°Y—˜\0¹Pƒ#å\0\náõ=Ny˜\"nP0+Ò®4á/ÞÆÃ•=+>]9pFæ“»£udÏ:€_Þü ªäó“[ø^ýã29V@ûwnàŸJédðêFHÀSáäTCJž&Œ£—TÞµöÉìJ¥æSÃ>[:`¸\0àsZö0DvËäd·¥J±JªUùîÀÕ‹xd“s\"€vïRæÙj)¢Û6Ä\0dSS<RŽÔ ¹³Û4Øyp€‚»¾RÞ½ÍLï¹. IÀlFO^N\n’®ºŠ91m*Ì…”‘ÁÅOm™\n†~nSéOŽñâ¹²0Êîbv@§§QùÕ„™Ö+«y‘ÕÅ×˜¥Pð}½©l³cÆ˜²üÉ»,z-iÛÀóý†uUòˆrt8Ç_Î³ìï¼³+Èð£‰\n²1ûÙ+j+ÖQD¬ƒs…ÇÌ¬1ÓŽ¼ÕFÝLf¦Þ…Öòõ”2…IdÜpÇ­1ã‚A)‘¾UvqU?´Á{i®¶ÎÈÑãæèJXï$˜íŸcä;º`äŒPÚŒb¹Ôl.K[øšÝ¿ÙÇLÓ,L¥·Ÿ!_³´öÎKdðWqš¤÷9·ÑWÏRFrQ	*2@$RÜNÖñ^ÍÓCæÝ#ÉÉ<‚@ôÆ*“Ðv{\"Üº…¹ÓQ¶¶øÎ6àç æ¡¾™Mê»Äí¹D…:¤b³æ¹/Ê–2#ƒœ†þ•Q®d2+3+…y<ãµCf±€Ë‹€r€œ«íUí³\'@æNÁ\\ÏçRËv£æV\nÊàŒV]ÝÛÏ3,d³±Ëb¥Ô¥ì”† :dU8ày“µ}MY[6FW˜dœà\nŸj¬`p§ÌI[g–§`Ï®(\nv•ÇÊ{Ÿj{°Û‚;ÔCaœu¥qXÓ‡i‡æ`íÜÓæ*Lasµº“PoUN¸íŠeË’2‡O+ýî:TÛR‡]H°Z$îƒ×ÿ\0Jçµ[ìOs8326CF9Oq[9º–4`ËÃ‘u{kM®QËòÔq\\ÖÔÑ…FTmF	l¥¿ˆ ™Q@€;ò9ÅfjÚ‰{CE›\r¹Ýj‚ëMTyÞQ OÞ6;zUKÛ×œ‰¶íI0@ÀzWe8GtpÔœ­©BæI\'“tÌL½É«–Vs’€žL nË€y8ó5êqårASŸÖ«	HhÚ\nàã½tnŽKÙÜšú	mfx$|•8`­•üêˆ8îúTŠÌï7\' €Ý5vèïÖÌ†(ÐîŠ6ìÙð´R­ËÊŸ*ì;IèÍØW¥Ù·™\Z±$r=+•Òt˜âŒE¾dJ¡Ã¯@MuÖ‹ò)ö¯6¼¹¥sÓ¥XØ¾ƒŠR(^”¦¹ÈØTMR±¨˜Ð4@ý\rS–­¹âªKLhÎ¸ïX×cƒ[sóšÆ»ïZ@$sW«Ö°çšß¾šÁ¸šô)3Î®ŠmÖ™On´ÊéG\n(¢™!ERQE\0QE(¢Šc\n(¢å¦S…\0‰”Ôªj5\"š†h™89 šŒ\Z\\Ô•qI¦\ZSI@	IÞ”ÑT §\nh§Š`(§\nh§T€SM8Ó\r#jŒÓÚ£j¤Ci)i)ˆ(¢Šb\n(¢Q@Q@Q@Q@Š(( Ñ@Q@Q@QHŠ(¦F(¥ Š(¦ŠJZJ@QE\0H‡š×Óå*Â±×­hÙŸ˜TM]©ßè÷Dmæ»6à²¯5ç:9?-wºX;V¼ùÓW;´:1)À¢£\0àQSÈ+œ\'Z†JU|Ò?\"°=ŠŽØ¨Ì†¤‘I¨\n\Z¤M…i	ªÒœÔÛ\r1£&š³.sTdJÙ’*£,X­c\"Z2Ù)sV*0¼Ö©™´>æ¶­#éY/\"¶m0\0¬æÊŠ4¡N)î¼ScpüV…Y–³n\0­)[ŠÊ»|f®‰;#\"í±šÈù5zîNMeJÙ5ßN\'\rY‘1É¦JM6·G+\n(¢˜‚Š( Š( Š( Š( Š( Š( AEP0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0\"õ¨ÇZ•:ÒcEËuäVÝšt¬{aÈ­Û!Ò¹ª³¶Š6-—¥h â©[^^•Å#µtªs÷«U&¤†e\\µ•p½k^àu¬»Ö¶ƒ2™™(ª¬9«’ŠªÃšê‰É1Š¼ÕûTÉR5æµlãäR›ÐªQ»6,cé[ÖÑð+2Ê>mÛ§çÔzžœ‘:/ò´õ^)JÖ%•j¬‹Á«ÎµZUª@fÌ¼\ZÎœu­Y—­gN:Ö±2fÕ)kFqYòŠèŒŠÍQžµ#TF·FJ(¤¦@RÒRÐÐ))E!GZZJQHb0qLQÕOARõ¦±ƒc84Ó2©¢‚Ê+wN\'‰cvùIä\nÁÝ¾BÇ×5¥ip\ZìË°*õ*½¨šº2§+H×ÝýŸz’D\0îozî-.MÜQ1\nÛ—œ+2©xd~ät­M2çì’½·–Ë¹r„×\rUtwÁÙ–mÇhn*ìU‡­`ÜN‘O\"D…˜\0>£Úº\"²@aGû§vIæ²µh£·ÎÙ‚¤#ëQMûÖ5žªã¬^ì[#¬€/Þ\nG+SE,†Ù“æ	2W¹¨c3Û^\\Àë“ù€èÖ‰åû%Ð¼1“jçlö{ÓjîÁ¥Íã,SÍ	a³»o¥IùW·%Nè¤Æ¡¬øYZs\"Ž6ãpç5vÂët÷°ÐŽ=«­\r®Z‹j¶Ñ¤w5ZâD´•—º6ºôV÷«s\0èyÚqÆE2ÿ\0¡¬NÊØ]¼÷©Lea:ÃnÌHAž¹êjfÉ”­FÁI™ÇF=…s×¼z¤ïXnBW‡\"µ,.e6RÏ3„ó$fÛžzö«…•Ì¹®Í&23àýÂ#×½h$Ìx0õ¬+¤ŽY£gd„Ë“Ç´…ã¬McâÃµfãfUî_ŠaTaÀãµ^Šf#pxÖ±¾Ò±¸uÏ˜¡@êÙÔ‘eµŒ“aÏsïK”R4œ,ŠzÓ¨Ob—g’Š‡€7Uérhìvó“UÚO³Z™\"q!\07­DßBŒ‹Ý¥²ìpyÀ©åÜÄŠ¿+`–àýC¤6Pî PI+ÄóÅZ³!Á,>océZ2ID¬Ž\rÉŒ–íS+p1ÎF1Pm;|¾ˆZre|ß7ëPÊ±9D\0–^qU$€,{‹OAV2I1}êÉ¾7-º)³ægµ	 †ºžüS#·˜°}ÅqÑjÚ-G_r)Ë#dî\\ç§ÒŽf;Ö&ó7°g\'!2\\»¦qÍY6®0AâÇ°g$8ÅÌ4+íÝ\ZÂ¾ñ‘Èÿ\08«næh{)ÄŒO^j=ªhÉã<zSd\0ãoLu§ÎÄÒeˆü€Ê²2²ƒŸ˜~¦´ÖKI6/œ1—VqÚ¹þqÏ9ïLó™TáN1Tª1:iõ6n%ŠYI_:v*‚¯ÌqßéYóêp—hÙ¹U\01û½zÖÝÔÑà°‚EeÍzÅ¾P}Í>fÊTâ·gE­ïIedU\0*Æ>ö	8ÏaÉª÷z¯™»l+9=sËvŠÛÝú¸Ï9õª—º‰ßåÆYŽzÕ¨ÉèK•8»›SêO‚L™ã¦zUQy$¸+ŸÆ²`½‡çga•ûÌMhi¯ö›o=dGËªœí©ºn+PUÔ‘amÚgË’OµYXÒÞ6QŒ¤T‘Æc;ùDcyC…Éçk;—vÈ“|Ÿ1jlãåtäûÔÃ@Z%”`ã½+…ŠM\'Í¹žh‰Ñ¦ \0§‘ššÇ#o5:¯–õ Õ•cR:cÒçi9õ,ÍÏ|T72Ìä*¯%G\"’ÜÐ‡RÔNŒLËûÁ‡bk–Ö¾Õ5ÁžÚ2ñílu¨úr^’êá¤=78Z‚îè[B-/!ip1ˆ21èk¦¢ôÜæ¨›ZìcJ\"¹·òŽÜ2â£ÒÒúæ{;ÙR!,möiácaÏ?Püi—â×Ë/\nŸ1Ç\réíOÔ4Ä’òÉ!’4ÜÀ«\Zë‚V8jIßSò’íÒÞ_2%8x¤vQ0Ü\0U(õ«\Z²ÛE¨O”¢k`ß$€u¦Á:ZÜ‡š(®£*TöÈÇæ+s•¾–âm¦\nR,ìÀäV†—Ún¢Cš¡¹Lrk5á_9|¥;•=k¥ðÅ¬ï©yè¤+ó7OÂ³¨íÍ©FòGm¦ÚÇHÑ¡Œ¾‚·`\\(ªVÀœZð+Ê“¹ê$L\r!4™¦“P1Ô,iÌÕ\ZG!ª²šÍU”ÓC)Îx5‘uÞµ\'<\ZÊº=kHƒ9ûÑÖ°n:šÞ½ïX7MwÒ<úåëL©­Fz×R8XQE(¢Š\0(¢Š\0(¢ŠQKLbQE€)Â›J(àÔ€Ô4ði1¦L\r<\Z„\ZT2ÓER(LQŠZJb\nZJu0”R\nu!ˆj6§±¨˜ÓÆ5§1¨É¦‰b\Z(¢™!E%-1Q@Q@Q@Q@Q@Q@%-%\0QE \n(¢˜QHaESQE\0¹¢’–€\nJZJ\0)h¢€½jý™ù…g¯Z»jØaIÆ‹ÉZô=%>U¯7Ñ$å+Òtf¹&µ:bô7„|\n*qŒ\n+1Üòˆß58æ¨Dõv6®zöcÍ4ÁíVW¤\0QqX mý©­µh”(¦™62¥‡Ú¨MmÊƒšÏš>µjBhÅ’<\Z€§5¥,uUÓ²d8Œ‹ƒZ0I€+8pjd“=Du›Ž´ã.k5f§ù¾õ(žixëX÷²õ«SKÅcÝÉœÖ´ã©W¡s&IªrjÄÍ“U›­wÅhy³z¤¥¤«3\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢Q@ÂŠ( Š( Š( AEP0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(GZ‘:Ôb¥ŒsI\ZÃ‘[ÖC¥bZŽEoY¯¹*ÔM‹qÀ«ª8ª¶ëÅ]Uâ¹Ø†0âªÊµx¯^Tâ¤fLëYw[s¥e]%k9ÓµLõ«Ó¯&©‘ÍuÄäžãá^kjÊ>Ee[¯\"·lS¥gU›ÐFÕšp+bÀ¬ëUàV¬#\\;Ñ:¯â´ª8§P2³­V•x«®8ª²´ÐŒù—ŠÍœV¬ÃƒY·­i2nZÎ”VÀëYÒŽµÓ)”Ú¢53u¨š·G;IŠZ*‰´Q@-–¤(¥¤à)€Sf¤Å8¤˜¤®ˆTíc“Ò§€˜0={J=~µbá|»¢Ã…‘Þ´ÜâwLé-\\OlÅ²G\\ÕvÒGÔì„W2Ÿ>Œô+Qxim£¸O¶¨’Êtdàò„Ž	Z­qJñ´³å€þñÓø‡©®IGVŽØKCAb›MºŠì7›n×ÜxP{ÕÉ€ºIm‡Î‘¯˜î9}j&r`0“j·m>\'µŠM‘ÜÅ°6xoAX«=÷7m­ŠÖ÷¯o{%­Ü[’L3Ó5¦RA,ð·TÇËíU/gŽe,#Ù\'#¯áP½ù\Z¹Ô·î…ÀVQÐZ§bTœK)ŽðY–rÑæµlÞ1s<„`ïÃZÄ‚åá®Py3òák]%YÔ).FîœsXÍhÙº>C‚0ÑœmaQÃsÉh‚íÈÜxªö×aì2àœ.Žæ¨é­ö+ë‰†?½“Yòâêÿ\0ÚZLª„™Ôá\nžPŠÅ±ÔãƒÌK Áâ_#ŒúÖîw)º–Õã‹ÌV,I8Ü+œ¾Š\r}¾Ðªmî9=ô­é­âÌ§Ýuks\rå”¢êOš;ƒÔ}Ets‡‚	Ä’\rÒ’zÀþËIáû÷Õîôû7		PèŽÜnGó«ÑGv‘ÝYBÂK‡œõ#µUHÅ¥b)ÊIêm%Ñ–{R¹´–c”Ž{UØÉ\'WS0’§$`gÏçX¶S›¿E¨ò§‹‡?0a×ëVmÝnõ)åÝ’2ñ–Ç ŠÅ¤UÞ¦Îó¥½Ä¸‘—(q€ÇÐRêw±ÚéR™Y]ü¡ûÛš³ž5‘®’‘vÉ³cw¨J‡^y—0ma‚Ä·o¥JŠæZ’;›;…FW–êm¦fAˆè+NÎí\'y¶™m\'EÚ}:\ZÍÓî¬´M\Z˜ád-æ»ç‘ÔçëZ\ZuÃ^Y½ÄŠnÚ„ŽXzÓ’eåGnã³HþVpx@=zT	 UòØþìóƒÞ¦p\0IÚ²l«„$õ¨š¸î}})¡›—¨ãš™J0ùˆà“H¼°Á\0çœô¨‚äÎ9§i\"\rÃtç½E¿ç?!+Ž¢„44eAÞÁsÞ»+Ž@õÅ.UâÚËÁê\rFT•ùx_îÐ1Ð”Rà•ÎyÉÁ§\0P¤Ú«HŒÃ öäšQåªŒpH¦KE“°&öe\0ð3Tnn7ÊN;S¥Ë|±ôëJ¥öw•ÎNåœöª@‘Ÿ{r70Ý€qÉèkW›b…†RX–Æé]oØUØœdéX~\",(Œ«,ozÚ›WDTÙœŒz„÷w«´ãtf5Ç÷‡z­o2É2}¢R¡IF9èÕ.Ž‘®‘4¹tv¶yPzÿ\0J»q¥C¥ê³=ëE5œð‡^zç¸÷Ýt?–M&dÜ^ý‰ÄRDY.:8=³]>‘qÛBÂQ&ÐðÈOP=«™]>GÍn~ÑgË1ç`<Gé[¾\ZÑWÊ–@ï¡G\'£döõœyMpñ—1Û[<2Ú‰ÑÕ‘‡H¨ßïgvŽÕR-28Âlo$óþ*¸66üÀv¯=ùŠD;C—¢õâ #jüÃô«§æcÈàsU¤)=½i *²ü›†1×žôÂøP@ü)—p	ú\Z6—9cô­#Ãà‘Ðc¥A3	áÝ•Ø8ëÞ¦I(‰þ*Í™ÝC›\'Àã†9ÿ\0\n¨«‘&Z\"`¡˜dö®sR¹‘&–IŠÇ±7 þÿ\0=kÝÍ˜žI—-´ìŽk’ÔZGXç23ŽÒãé]a®§5z-¦W6r´j ;cøyªBæY#	»,##œzVÕæµueáèôâ…bûGÚŒë÷œà€	ô¬MA£k…k`•w¹®Ø#Î›Ô„°\0‚O&œ|¡ä”b\\œ€ÒGnóJ‘ Ä¬ØÃõ&¤¶³23nt]§\'“ô«nÆi6Ë¶ì/DyÜ\0ÎV»Í\nÏìÖÛXÌrkœÐ-™.²‚6áN;WikØ×Ÿˆ©wcÔÃÒ´nÍh\\SÅS„Õ€ÕÈtØ˜µ1š“u1 DíJÍP±¦]ª¬R¹ªÒ\ZheYeÜžµ£1ëY·\riY‡yÎkàrkzó½aÜŽMwR8k™ïÖ£=jWëQšéGŠ)iˆ1F)h ÑN¦š\0(¢Š´”S\04QE\0´”R´ài´¢\"Piâ£ éRZ)i-\"Ä RÒPŠQH)E1îÔÑA4€i5TŒj4ÁŒcM4¤Ójˆ\n(¤ïL‘h¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0))i\r\0QE\0QE \n(¢˜	KE\0QE-\n(¢…Š(3KE\0£­Y°ÂªÔñ˜PÆuº4Ø+ÍzV‡6Uy¯)ÒdÃ\nôm\nnšå¨á±Þ,ƒhúQTÖo”sÚŠÄ«O•v)}ë&6\"­#ñ\\®\'±sY&÷©–ozÊYO­<LjyIlÔó‡­5¤¬ï<ÑçÑÊ-;æªËÍ4ÍžõIšvªHµqÎEV’®\"h¦ü\Zfê–APãšÕ²EsR†â¡E©¶ñIˆ‚f8¬›–É5«8â².zšÚš0ªÌéM@jij]‘<ù	IKIT@QE\0QE\0QE\0QE\0QE\0QE(¢Š\0(¢ŠQE\0QE\n(¢€\n(¢€\n(¢€\n(¢…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@‚Š( aEPEPŠž1Í@*Ì]i2¢iZ/\"º5àV˜äWEf¼\näªvÒ5m×WqUàUµW#:…jŠ°j\'éH£:uàÖMÒðknqÁ¬›¥àÕÄ‰7ÉªE~jÑ¹^jžÞk®/C–KR[uù…oÙ/JÆµ_˜Võ’ô¬*³ªŠ6mWZq\n¡l8¥â¸äu“¨â”Š\0§ÅH0ªÒ\n¸ÃŠ­ ¦„gÌ:ÖmÀ­Y…fÜµ¢‘p+2QÖµ®ZÌ˜rk¢r(·ZˆŠ™úÔ-[£Œ¤¥=h«!…Q@8SiÂ‘HZp‚œ:Ò-!@ Ó…RD\r‘ô5\Z6O\'‘Ò§qÅGkO}\nÊ#…ç\0{Ö‘gefiZÞùe]ÖGvlÛ±dñÝO+Å*Æ[;•AXzŒrGvÐ<¡Ú#ÎÓÁ>¢¬Ø_Á;I&T1“Ž€ÖsÐéÎÆ’¬ÑÄ@,ÞQëèjiž;ˆ`·Žb[Ê9êÞ”‰y…NíÜc©«ÚjYýªD`¦G\\®xü½ëé©ÔÝˆ\\´Fí\\Ã†¬‹˜Ú\'Šãú#œãpÕíZG…>ÇJw|ª²Tú\n³öWk4¶Bm¢ïøSNÚ‰ë¡VÞc=¸ÃFã9éÅh®íŠI\Z±d#åþð¬g¶Šss½c„áÔ˜jÕŠû~•æ@ÙÈàžHö©œz¢¡-Ó$ŽfKiS”rÅ—Û=©Ú%ÌÖn±M&]Ouª·×^]Ì.ÙU’%ÇÝ5 KÅsm<Á\\&í9!MfÖ†«V0ÄÏ4—é\Z9rñ‘Tg»ûg›Y’í)‘PòµlÞ˜·Jc9Þ›€Åg_ÂM©h\ny­aþÐÿ\0\Z ûŽ[hE¦@eK{ù¥yß3ÓÙV“O†-BK†ŽUÞÙOJÉ°ÕvhoopZ;È¥c#/µt×w¹–ÚUÝ>ÐriÍI6DZ šÕ­Ö)­ÆpFªûÖœ‘Çº[¸åÈp>QÞ•P-ª 9ôÅWûö?‚L‚==+\rÍÉ¥Œ<Kò®Î á©l¤ŽçFˆ;‡1»¯NœñPjL-YcÆüôö¢ÄÌ±ÜÔŒ±¸Ã)ÀÏó¢Þé-êa™F¯Éoi!ŒÂ¹x˜nGÏ?Öº8îMìÉ:¬cæ‘‡}«}ºSJKo¹ÌÌ¹î3Ka}-ÅüV‘ªÈZ0ÌãøTóÍnãÌ®Œ9¹^§ix›2±gž*ßœ¥Pç•ê}ëÏP7.là_6H›|ŽGÊ‰Ø}k\\*¸ùŽ®Y+=MÓ¸¡Ë’Üšp![jˆö~U“y96.ÅÝë(\0ÈéK½ƒc­TY€P\0ÆçDs°sqé@¬^nÇ€¾¢™¸á—‚¾µœw`tíR¥FH\'Ò&>÷AÅD°‡SÓ×4à¥÷ã¿z|M¶0­Ëc õ¦„È0¸Í;ljÇÈzã½>Ræ \n÷ÎÚHÔ„Ãõ?¦˜C„Þ\0ýÜ\Z§=†ë+¸$òåóÔçxéøûV¢ùD`Ž9¦\\Á(f)>´Óh–y­ I¤LÍ©XÊ£ªžY£}2­[¹ÿ\0â[§)5¬m.sU5»â8-ä“O¶3F·\"qÝyÈ>½Edi6ÒYÃ>ëUh†;ˆØdÔ7µv{Nh¦ÌT,ô\"{t›ø/¬ÎËKÌÅqî#¥t\Ze˜ÓàÙ!Tâôµš<rÆ\Z9;Â“Þ„UÔa=œŽHYÁ„V3›’6„I¤IŽ@Š•=#ò¨­˜Í\Z¹÷©ˆ,	8+œjÅšä$®ÕPyïÞªÌì ¨^={U÷eTéÉãšÎ“q.çØS@TòÉ`­À&’W¶1ùTí¿)Í ,Çk¯ËÔâ­11! y½vŒãÖ¹íJêK{»E“þ=Ý™äaÐ¶8­{ÙÒ±/8ÍÜjk}¥Ýª#=²YÇTnÜzWE(¶îsV’Žƒ/f{É@¼¸…ëÏJÉ¾Ô‘­\ZÔ\"¨ÄsW¥±?cóä”¸š=Êñž?Â¹Æ*ÑmaÈ\'¹®ÊpGJŽÚ]ÄQ£££ù‡_¥AlŠ÷\n¤à\0Nsè3ZrO,?jiw,mV0Äç`$t÷ÿ\0\ZÈGÆÑ€@9Ç­n¶9žãä,òn9ÉïZzm£;†\\dsƒTÕ2Û‚Ü~P{WKeEúÖ5§e¡Õ‡¥wvlÚ•8Åm[œb±­Ž1Zp¿Jódz‰hkÆÝ*ÊµgDõi^³‹;©¤Ô{ø¤-@¬#\Z‰Í9DÆ˜¹ªïS=@õH\n’ÖuÇCZ2Ö|ýêâ&aÝ÷¬;ž¦·®ÇZÂ¹êk¶‘Ã]Òu¨ÍK\'Zˆ×R8$ ¥”´ÉŠ)E!‰HiÆ’˜\r¢Š(QE(¢Š`QE!Š)i)E CÖ¤\ZÔ‚¤´H)i-\"Ä4QERÒ\nZ`:š)¤ÐXÔLiìj&4Ñ,i¤¢Šd…bŠb\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€Š( Š(¤ESQE)i)h\0¢Š(\0¢Š(\0¤´b˜KZŠ¤CÍ&î˜Øu¯AÐäákÎtæÃŠït7ûµÏQ@îO”}(ªªÿ\0(úQ\\æ§š ÔéS=¹¥3f+–ç±aA µ%5–…/ïL2ÓÔLMZFl˜ËIæÕlšQœÕr‹˜³¿4Æ9¦­;6-2ÎjÁæšd´$qÔ¥8¥AŠ{p(¹63îFb\\žMmÝ·°n&ºi#’³(Hy¨Hýj:ìG’–’™!EPEPEPEPEPEP ¢Š(\0¢Š(QE\0QE(¢Š\0(¢Š\0(¢Š\0(¢ŠQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\n(¢…Ph\0¢Š(åëVbê*°ëVaê*Yq6,úŠèlûW=fzWAhxÉPî¥±±	â­ÅR‰¸`5s3¥–¨ØñHZ£f©ÇƒY—=ëFSY×êâK1®G5Oo5¡p¹ÍU	Ít\'¡ƒZ“Ú¯\"·¬×¥cÛ\'\"·-¥aQt–†µ¸â´bUqWâW37\'QÅ;‹OÇ\"!aUäm…WSB3åVmÂõ­YG³®Z´3àu¬¹‡5¯p:Ö\\ãšÞHÎsPµO/Z«¥HŒõ¤Í)¦æ¬ÌZ)3K@OÁO)2Ðà)àSE8T–‡\n\r-%Øc*¤ÉWH¨]UÅØç­¡³^O8·Çú•Ú¸‘VžCzà¸U“FÑŠ¥æD¸t<cËu=>´¶‰Õœ…¹#¯ÖµjèâO•Ø¿hÍm•¹›d*r¤÷5ÔÜi©±GpØŸbËFÝAçŠåçH$s¸»@ÇjÈE2Sqm©­›]¼²<¢#Û”£Íêj§ÊüŽÓS¸2ÛI.æXX4g¿Û½JÕçš8X²2“Â.JŸBk5_íVÍy,W=GÖ®¾¦.ôë8Tkt$apŽ¦¹Tlµ;®ô+$?k°GrX*nñœu§[5²¯• ¸ÇzaûE¤–òÂso»\"02\0=jK—_·ÉuÀ¸šmzêVšëÌ’[-AÉKG/qéSÚ:B‘\\‚[@~øÇ4_EhÁd2´yéœJÏ·K…µEÌq©P}éÚè\\Ú›ðÀÜH.ÚÌNÅÏÍôúU4Ïlöñ¢ù–ÄísücµVkåD².ƒƒ€?¼}*âHÉªKˆ¼¤~«ÙHíPãmKR»±Ée¬¢Ç3;6‚üaÚ©\'m}l>ÐxÎÑ‘Õ{W¯¬ÒfvIsÆU‡?5¯mö«‰&Ÿ9pª vQkaI3¦‹Q1À§‘*ŽÃ<SÃí˜;¡”{šÊŠdòmå€+Æ˜GÉÆ>µiïahäÕ‹+a0{Öº›s+êSº5¼ñ cå‘èjýä“N×Þ#µÃ\0ÎÊ9éþ˜Ž©u,³à¤aWg¹jK[Æµy£¸ó7%Èô4=¬»˜Zýõô¢=<!–ªë)mÇô©´61Ãv«:Å!UØÊ>i¦j1ç½ÕÕüE‰ˆ\nFWçž²/¼œ‘+Ç’3À5Ñt¡cÁ¹Üì´¨RÈËH\nåÛ£lC8pÌ˜dÎ?\ZÈ†w½`J“x\níÜãúSâ¸Ý2HžP<£ã®6›¹Ô)19#ž@ŒÆF\nô8ëL‚â9# }ðyÍ) Çµr[9\ZÏbÑgx.p:§&öCÓåè)ãæ9Ú2:çÖ€€¹€#«P$ŠBPôÎ:š’,[©\r1õï‚*ÂEVØ\0ö¤&ÇÆ¡×¦@ëõ¢Uc·häwà0B÷î*Eƒ‘õr¼v»òKn¿Zš$Þ¿:’Àð=ªtÁà.:TÑÆd/\Z·PsŒZh‰Hª!&m›>R2=ªµ•!ºÚT«FUªô’¢¢(ýâïòÔ§Bqš‡PC4Š0vâcÆZDs\\âo!i€co’Ä†þûsƒéÀ©o.ö°jP[–G@³ zžœVäz|sÁ<R ¼s¾ê)†G@Fsô¬8î_KÔ.‹ZÌ^F«hù@ã!øô#¶âOªÁ‘‘Z5Ã£Gó\0‡ùàÓnn‘%Û4RG2såœ‚Gò8©ì/tû[W‘’H\Z8A¡¿çRÞ[G~ašÜFáp’5îGµfÕ™²ajÐ½¢ÎÝp~éô©š`Ë±GÕ‹™ôË–y£S­‡ØzÄŠ½\rÌyÒB2qå—ª\\{{Rr;ž•‰$o0¬¼zÕƒ\"(;òlàTrÜÃ4CÉ(ç¶:ŠZŽåIÓÌ$H±7E>õ™æÝ}¬Û9…Þ4Ê•8\rï[!ÕãY†`~cè+P\roöˆÓä$úV×B%¦¤²ÆÖö~lÅ]˜üÄv®_[¶·–1un­Çü´(:¯½t÷âehÚ4Û•,{×.Ú¤¿i\"F\"&r½ë¦‚wº9qMY™0ÁÒ¤\"G—$äü­ô¨î‘ÖçË9ÍK2ˆc7Ã\'=ñU;—-Ï\'žõÞ5é¡ùXƒÕ–8÷òœ	¤}ÎÙ5jØ0P¹ùsœQ\'dU8s2Ì0îÛ’x­«sÀ¬Øx5£ÅqTw=JPHÕºVŒ/Ò²aj¿W4ŽƒV7éV‘ë6\'«hõEÐÔ¨U©wRâj64¥©Œi€Æ¨^¥cQ=4\"¬½ë>~õ¡-gÏÞ´ˆ™‹wÞ°®zšÝ»ïXW=MvR8«™Òu¨K\'Zˆ×R<ù	KIEQ#¨¤¥ aER\r%:›LAEP ¢Š(\0¢Š(´¢’–!â¤§ƒRR$´ÌÒæ‘bÑšJJ`<\Zu34 Ð³L&šc\Z\0c\Zˆš‘Fj‘JJZJd‹Fh¤¦ÑIK@QHŠ(Í\0RRÓ\0¢Š)\0QE\0QE\0QE\0b’–’€\n(¢€\n(¢€\n(¢€RÑE\0Rf–€\n(¢€4fŒQŠ\0Zz\Ze9zÐ¥‹aÅwZ$Ÿv¸FÃ\nítI9ZÆ¢5ƒ;¥”}(ªË\'Ê9íEs“Úuâ¨KmŽÕÖÏiœñY³Úuâ¼Õ#ÚLæž\"*C[rÛc<UG·ö­‡c)’˜SšÐhqQ˜ùéV¤fâSgµ<AVÖ!S,\\Us¸”<¬v ¥hj®\"”˜«”Â´îÅG$˜çâªLüUÅ\\‰näÎká²M_¹|æ³&95ÙMYY4ÓN=iµÐŽF%%-Ä%Q@Q@Q@Q@‚Š( Š( Š( Š( aEPEP ¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE(¢Š\0(¢ŠQE*Ä]EW<G‘RË‰¯hzVí«p+Ÿµ5·jÜ\nä¨wR6b~*Èz¡â¬«W3:Q1ji4™¢‹ÈŸš¥8ëWØqUeZ¸£6Ì™’«„æ¯ÊœÔ9­z·$·NElÚ¯JÍy«l:W<ÎºfœWãéT¡\n»JÁš–ŸLZx¤K\ZÃŠ®ã­Yj‚J\0£(ëYÓŽ+NZÎ¸jÐÌ‹Ö²®&µîZÊ¸¼	‘™/Z¬Õf^µUÍtÄç‘4ÜÒ“M&´FMŽÍ(5iA¢À™(§Ž•4ðjY¤XñR\nŒSÁ©5CÅ-4RÒ)Ú£+È©)\nîâ„LÕÑ^[b~luª»šßr•Œf¶áŒÈ1Ú›>žÓ¶Äˆ°ìÂª5-£9\'G™],îåxÌ—…RjÛZÇ<¨\ZSmv¤’_€@èEcÉÃ#+¥O:NgŽC3p0¤òI­­Õ­µ£6´›…¹¶¹-)ŽtÜ[´tQ5åê@…YäC´žäv®gíQ˜möÂªè¸vþñ«–zÜÖVpEio\ZÏ¦Qr>øöúVr§}!U£íÓ	ŽVl}ë9ž{[4ºÉ!É\'®ÁÚª½ë\\4R9Ff?2ãïZ¹iqö™äŽP¥‚¸éYòò£oiÎÇYJn4I%2æìÀ÷Àª¯s%å´Œ$##pQÜ÷¦Øß\'1ãçB±ªÍœ^N¤ˆ\00ÌÜ1éïE¬ØÔ®‘À•Å”þ®P1ýîõ¯©Ð‰×rÆÀ¨÷ªú¼qÜâÞÊ6\r‹þÈïOÒ,ÛX–Hä`äí9l>µÙ3H=Z”êæ9Kq¯Ì;qßÞ›t²MªíØùòryZžÞÎ;{»ûuÌp_ý®ù4ËPÓj7n¤­º¨Üý·‚¢ÚÝÍ¦¦Íµ€¸²»e1/”¡äRy|úW%cw$\ZœÄZdˆí9 Vå½Ô®ë¼åV#\n9#½e,	g¨Ã<M˜ï_àw§dÓÛºhèÄHÂ;¯1¼Ì†ÁþTäk‡Õ§È€ÎÁÍlÍ5\"³\"¼˜\\¦;}j)l£º˜¬åþF]’òœŒ‘šÅ.æ×Ð¾¾U®™–é¹P¶à9É‚i\'ÔãŠÙâ·Ú—2®v•Áö¨&DÓîSxµ.8^pZk—Õ|EkrÌ¿gaûµ#M¼J›-Çw±±¦X¼‘¬Ù%€faêh¹ÓÞ{èÞÆŒ¡àœV„zŒ*âœ³0Tþé©¤TóRB¸ `íã?ZÁ·{š&fÇb —ÎyYœõ,zþu\\nÉÆ*m‹&yn‚¢qÔ1VÇLÒÕŽä¦2pÄŒÚšâö†S–êEO±2´r\'ïAê;S¶r¡NÞ´‚ã\nŒî,XÔÔÑ \\2G$R´&2ÞÍI¹Ù®(±-ŠªyãzzÛ‡@æ§lçïtš¥ÖÉ#\'=¨HŽb8ÔDÁCŒ`ðjâ$s&Ì‚Ò2Ž¸ôª—V©p|ÆB9¼`ÒÃo»K_¶µÆ`ùÏFF\'­\\QfU­ðÛÚôsaxñ<j:†)?­C®Íj9,ch­#²¸´îy\'ö“S±Ö“ÜÄÿ\0bžÑÁ,ßëOmÞµ–ÿ\0hžþk‹Ä½mN5y dÛµ“Žž˜5²]HnæuÕ¾µj¡kª%ÃwDÔ7ô­hlÆ‡$÷î¯½@‘¦1ÎN}ªi\ZÖÔ>§eeºyQo¨\".Âßàýk¦’ÎâKkBe°¹pÐ&B¸þ>„•V¸st*i·¯o›Éx²¹Þ„~£Ú2v:‘[[i!¸‰˜¼(v«/ }h½ŽÔêÊ¶á “%e·-ó™\0È?­A.Ÿâ÷°”Šæ7.ü;!ê?AG)\\ÚµiÅÄrEq¾ÞGèäšÏµ½±žÄØß[BnbX²à²vaî*¥Ö¡(‰¾ÕŽ)äþò3ýå5yªAuröò9–éNa¸Û†n:z¨Òm*–Üê ºû*‹hõ…¿å‘pÞÙª5ÕµÈ¸QÃ2’}ÅQ³V¼Ògµ3/o¶BÙÊ(\'ŽÇ8¨!¿ˆ)Ó¯¬`3Fw˜8r¾äu¦©î·cNmn&M«˜e‘‚‘Ð1õùµí­%K€]Ú=¸#%Nx5Ë\\Ü—»–Ò	–n«(Àj–RHÂA:ecl<²‘ØûVžÇª2öúÙ–õÛ£I+‹†—!cB¿\'¹Ísm ¸I&B¥n:×[x¤ÙÌæ9T6ÌþµÈf(^H›#@kZ+C*ÎìaÁå r3Ö¡X;äFzjtá¢˜c;TlÑùgƒægƒ](ä%\\I&GWcP:tª–Ë•èjâb°¨ÎêÐ³Z»J>µr3Ò¹¤wDÐˆÕèš³¢5v#X3CB6«hÕŸU¤lTq^¾«‡§n¤\"bÔÒÕê7P!ÄÔLiÄÔljˆ$5ŸpzÕéMg\\\r\\IfEáëXW\'“[7Ö±.&»i#†»(ÉÖ¢5#õ¨ë©ŠZ(RÒRÐ(Å-%!§RP&6ŠSILAEP@¢–€\nZJZ@‡\np4ÁN†Iš3L—4Š¸üÑšnhÍ ¸àisMÍ.iŽâæšM¦“@652”šJ¢B’–’™!ESRÒRÐ0¢Š)\0RRÒS\0¥¤¢ERQE\0QE\0QE\0RRÒPEPIKI@EPÐh¢€–Š\r\0P( Š( ”u¤ u ¶Ç+¯ÑdåkŒ€á…u:<œ­e4i¹Y>QÏj*ªËòŽ{Q\\ö7;y!öª3[ƒÚ¶]3U¤Ž¼“ÕR9ù­‡¥Q–ÛÚº9aª3AÖÍ9Ù öª¯+rx}«:xñš¤Ê3ú\Z•TRpMGæâ´Fl½EFëš…&÷©ƒƒL’»%BÉWˆÍC\"àS¸Œé†fÎÕ§qÀ5pÜšÞš1¨Ê3rMQ‘jûrj5ÕcŽjæs-0ŒUç‹Ú«´x­”ŽiD‚’žWÒ*Èhm´”(¢Š\0(¢ŠQE\0QE\0QE\0QE\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢Q@ÂŠ( Š( Š( AEPEP0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE(¢Š\0(¢Š\0p©£íPŠš>µ,¨šVÇ¥mZžb[uµjxËPí¤ÍXºU¤ªž*Ú\Zçhè¹(¸¤ñM\"†0â«J*ÛUi*Ò3r(J9¨6óVe¨;Õ1ÅêOæ´íë6.µ£nkšge=H{UØÍPˆñVÑ¸¬MK@Ô¸ªÁé|ÊLÍP9¤i}ê	% Jk>sÖ¬K(õªËTÊWë*ç½hNýk.á«x\"$Ìùzš¨ç“VfnµMÍuE³c	¦æ‚i¹­R0lvii™¥‹dªiàÔ Ô€Ô´kJ\r<\Zˆ\Zp5\r\Z¦J\r8\Zˆ\Zp4¬Zd™§/ëQŠ~µ,eë%°Oz×TV`Ö=ª‘[¶£zí\"°¨:k¡ªhézÁãÊ»rkœÔ4k½7cÈ„+r¬+Ð–\0öéRÜCñ/š»›· ¥O(iÐUpÑŸ©åpÎª\n(#«ÉúÓ|æÜÅÝÃÙj>‚[‚Ð\r¡†í¾•‹\'†î’§8íÞ»c^8\'…œL_˜mÎxèjwº—x`vžø§ÝXKk.Â	ô$T0.§¢i£	EêYo+«3PaAô­;›×}\nË÷‰˜Ýˆeá×ž†±ÏË&qÇ¥0°óGF£•0m£¤žíâŽÒâÒ@³²²³Øõ¢7Ã`\n¾Éÿ\0€\'\\ÖTQÈð!ÎÔç\rŽ*hç€»žíY8*†œw×V‘¯• 1Ü\rî3[ÔÖ–•*]igN`‘G›‰fÝóI\'aøq\\ÛÊ¾^7ýÒvíúÓ£ûJiŠáv¨^àqIÃAóêu:\råÔbîkwxï0À:Žw5óGicx‘‰³1u#•ùŽ\r—RùV(6²âÙÆìûÖ¬6MiŠHÏ™!°9v¬vÔèºzÜOjÉ-Çï&;¥^„Ú¤¿Ô%´ºµÓå¥µ™7¼œ¨sÐýk&Þæ+™¡\0ˆ¯#oõÍ7JŠâ8f»•Í”|§r>Çñ©ä]GÏv’4u{ïø•­œ,|òÁƒÉ#­hEu´z\\³Ù¾È±¸ãœ÷çÜÖ¯=µ¶›mYÑ÷+wõ4·Z„Äº|wF(y“:òXã·¥%¢Es¢¸¿‚ÛÄÓÂÌé&ï61É‹ž?Vâê¶­æ®ÙAæôÇhä>˜–)I¥É’à¯Až?àUy¯—©fÃ!¸D!–9>gÝŽMe:iè\\gÜêôÉdº7/0exæhÆ:\0ÅÅÓÀõ¥™³À9ªÚEìQ»Æî¥_5ÕB}jä0+[‰Ú÷–{ŠÁîj™=á+hÒ	Q&góš‘w´;æp6”°Á?þºGÓlÒî¦ùçãt±éPÏ}n!‰¯ç–Cµû£€i[°¹‹?™\ZÄl n“\'¢TZ}´~—*&˜(ç*ª7r/ö´ó/ÞP·™±ÃónúsŠ|¾Ëd–÷ÒG<Y!`oùgè~µIs X4Šª6zî¨®n’¼ÆR1óÐsYMzm´«»”|I	,J®>™õ8¦E«˜ìô¹C›]F6‹cp7s‘N0¹-š—:›Cd¾\\k$³¡h”ÿ\0tcs¦j‡‡¯âšM]Ö{iˆyÊÀ	n9\'Û‘T/#»ðÕœ:…¼å`µ’c&b7`n•Í]¼Izš„1ùvZ¤,dÅy¸8íÔ\ZÖ0ÐÍ½lvZÔÖwvštóÜDUä¸©•Çº}Œn@|Ùìf6·¶Å·Üaé‚\rOámIßÄqÉ3,r¡0H­ØG×5kÄzJÙx…o-æHôËÖû=Ê«sóŒþ#Š¸®Wb[º²)i:¥Å¾³f^XnîeF±óI\nÊAÜ=1*œQÛé—º*:*E¨I$S[‘‚\0uôÏô©4¢ßk´µºWi,%š4,sæBØÛß~µ™â7Sö;(å`Ñ»ËÛÀ9Õ²KšÆR½®M­Ù¾™âLçÇÁ@÷\0É^TúŽ•vßQŽáä-T\\Æ\0*I9Áê?\nÁÕ¯ ºµ¶¾.Ëw\0I}å|ç?Boé\Zì×N’Ä±G$yŽ\0ƒ®9Ç×3‹¶¥ÂVzS[²)f+õaˆY°/Jâu´»7ñ­Å¡‚þ#Ë Àõ·|m_Vùr8žàÔWó32I+»J ¢É»;Žþõtï‰¨”·2m®îìn%»¶E;/—,G£©äð~•lÚ»ÈeŠÛo˜»Õ—Û©ü+&æE¹–5g\rÁÜ~é©ôýrûN±–$a‹å«uÛ“Î>¸­œ[WFü¬Ò¸ŠÄ–;¢±êHÀ¬˜À’>ãëYv“[éúŒÖ÷,ïg(äãÃ‘úÖƒI÷zuÕä¬í&dø@ãõ¬}Rg¿ÔšaŒÙ\n½\np]—Rbghç¹$û4o ð¡¸Iks5À2aR/20Gßl—òÍ[Ò¤²žîÖÒyeŠ»„‚rå“×ð85Ÿuj–w—±ÆæHàr©\"ž¼ñúU¤CeYA>^v‘ÍEÍÇsÒ‚À®:æ­XÀÒI¤…äâœéÇ™’Û)U Õ´G%Gð+šNç¥J6CÓ­ZŒÕUâ§ŒÖR:¡«‘µgDÕr7¬Z4F„mVªŒmVë;l=;}URùžôXEô¡ê°“Þœ‹±º˜ÍMÝMf¦\")[ƒY·-Á«²µf]7´Š\"LÉ¼nµ‹9äÖ¥Ûu¬‰&»i£Ï¬ÊÍÖ™Nn´ÚèG\n(¢™!KEŠŠJ\\ÐIE\0†“êJ%´PEP ¥¤¥ h)sIEš\\ÓisHfŒÓh¤óFi¹¤Í¸âi¤ÑšLÓ(¢ŠbŠ(Ä(¢Š(\0¢Š(\0¢Š(\0¤¥¢˜	EP ´”´†QE\0QE\0QE\0†–ÐIÞ–Š\0(¤¥ Š(ï@EPEPEPEf…Š(xÌ+£Ò_+šŒó[º[áÅDö*;¢Éò¥MeùG=¨®{¼ëP:Õ·\nòQ2“¥U–:¾â«È´‹LÉž.µ—qZß•+6â>´Ñ¢g7r˜&³e;Mn]ÇÖ±nWÖðˆ–lµf9³YŽÄ\Z|S`Ö¼¦76Ñò)$ûµRjf|­gmJ3ï¬+‡äÖÍëpkžºo˜×U$rV•†ïæ¥\\\Z£æsSÇ-t8œÊdí\"«IY*94•ÐÝ™žéŠ…†*ä‚«8­“9äˆ©´ãHjÌÄ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0QSÇP\n™)1£FÜô­‹SÀ¬[sÒµ­›¥a4tÓ‘³	â­¡ª·iZ°å6æ-§n¨Rî÷§b\\‰¸ªòµ+ÉÅU–Jir9Z¡ÝÍ2I*!&OZ\Z4ƒÔÐ…«BéYP·\"´!jæ™ÝLÕ¸«ê„oÅKæ`VV5-ù¸¦™ñÞ©4ØïP=Æ;Ñ`/½Æ;Õi.½ë>KŸz©%×½Zˆ›4$º÷ªRÜ{Õ.½ê«Üç½h C™jióÞ¨M&j7Ÿ=ê³ËšÚ02”Ä•³U\\ÓêjÞ(æ”€šfh&’´±‹bæœ\r2–€L\Zx54ðjZ4L”\Zp54õ5-\Z¦H\r<TbžµÕ2AOÓ¥<øT²ÑnÒEó=ë¢´™Bxæ¹h0fÀ<úWIdÑÔž+\n¨tÞ§@ªiûØ9¨]\\H^õ-«Ÿí•f0²«óÊñ\\›%8•LeÕI>¾ÔÓNxçŠ¸©·ŒãéªˆefÚyîh¸XÉº±K«vI/Øâ°®´‚bí<{WdU‰ÂçÜS\r¦Tžªzf´…G9SR<ÞkM¹91T&£q•®êëN|Ï#Ú±nô÷s»•®ÚuŽ*´;ÖÒ3IoÍ˜à¯ažµZoô{™à<„vP~†µ…º™H‰ëéT/ !÷7$÷õ­£4ÙÍ:M\",Ø;†G?Ú¤ß³ä(U°¨6¢>õà¯8nrj9e2É#l	¸äªô¥®cv­Bv±¼€A)vØ®­œá5¿?‰ç{¸çŽ!½òBÞ¸960[ãÅ‰6I c5«mZ]ÉrïöÎ$¹¬åOCHÔmAËIk…‰˜ì_îƒÖºý&æ\rå’ÊT-ªÊÎC:ŒcôÅ[MmÛ¾NIìjXnf[guO9‰Áè*\'è\\\'mY¢\'h4Ÿí!Y£œº }ÒO&§Ò4ûˆ[¤—3©Á#5ZÞá¯4[Xn›m´@ÜxÎsÖ­@Ó×à+±Ìe¹G¢Z+\ZÅ¦ô.éZýÕ®3E\n A’¹Ø\\{ÕÆ[-+ÄW\\?u,QMÁlF>µ‘¥\\m6òæ`¬òLÏåò¯®+\\ýžô]Í¬æhñ¶än]­è=ECZ´V¶Lë!¸û\\RKµó’ÛˆûÑ¯úÖ¬:’:2gä$„ÀdqøŠä¡˜Û¬\ZŸ™ºÞÀ*‹uô52¤wWZ…É¤ehïº‡’¿LÖŸS~~†ö«®Gƒ-ÕÌeî[T€žAÒX‰5=BHå»€Åˆ·\0ü+š¿i§Yg™‹Ãß\"ž‡\0`[\Zdèž\ZžKˆK©Û2oêÇ@=¸æŸ\"Q!ÉÜ¼g–îêx<ó%¬I”©ûÌëœ~?\n™î#ðüÁÜIæ»·ßPF0O¥`ÙÍ©D×6öûg†’6Ü 9 ýG\"¤Õõ5x¢œG¨5Ç—qºƒžiºzØJf·Œn-­/­…µÄIçF@!Ž	úÖw“º uS™ybÏn#§åYúÖ¥lí<zl†HGŸ\n—pã zV5®³:yg>daÁ˜žv¡íô¬)>S9U³;ù/,`Ôš-N/6›E–)æw>üW=#´6Z¥¬®²Aas±;žv•?(ý?*±©]È·7w\ZvÉ´öŠ%s!ÎG8ñ&¡¼½uÖ®ì’Kh¡ŽI”¤\0}iF6¦žâZ_ÚÛC§êL1s,òy¡Ç\roõ­\rFò[¸ü‹©¡}:øùØˆå¡ÙÆ×ur¶\"úÓQ…¤EHî‹yBNˆ3ž­m~é¡ÔR_±½¼‹n¶®›<z·{Bc-.Ë7—6sè¡íghµº_¼èÞ&±¢ŽçV¹InÝÔÜ£4E¸Üþ¹ôâ²fžIn\Zî¢Ò\"Lž ö®Š!\rß‡¬Ì“%Q–D\'˜Û<\Z§DB—30a,o\ZÞp¢ãvÔ˜ò23Áö5³mâ·ß\rÝ¸\0\07bjÃÖGÓª…>„gšž9Íå”‘Ý¨.Ñ€“ƒœÖŽ*JìÏ›•´…¼Ôné¾ÖÌ¡—1`pj›_2ÛÍ`#mD¾|ÂIÜ(Ø,Œ=ºfžaûežT ©Vf=ÁªåHŽfÅ·šÞkXìî_fK7š:ôà}3O3‹ó¦i±Ç\ZyGießÎrk>8‡pÜNÐ½Í=mn`‘fmÑ²§§¶j¬ˆ×s£ÔàÒy¢Šô0Lr Êç©¬¹ÖÎî5xWìî‘pOúÓžH¤TœçSHU#·	dƒÛÞ óÒ{-ŽÛ69`\0Æ3I!¶Š®ÁQŠãb‘´ZŽA\ZÛ)I	‘Û)¥Ô2ªö\'$Ô=MhBÔ±klÓN}q]¶–¶H“B>òüÙ¥ðfŒ$îgŒL1šènmáÎ9¯:½{Ë•¶‚ŒnÎ>ò<JØ@¹æ©‘Zú !Á<qY-N.èÐJ™*\Zzšl¤\\ªÔmTªÂ=dÑišõ0’¨«Ô‚J‹Ëžg½o½Tó)|Êv&å±%LT•³S¡¤Ð\\¶\Z‘š˜§ŠF4€†V¬«§ëZ7².›­kg7¡•tÝk.SW®[“Yòkºój½HM%)¤­Nf¢’Š`-f’‹E%- \n(¢€\n(¢€\n(¢€Š( AKE\0QE)i( £4”´\0QE%\0¢Š(\0¤4´S(P(´QE\0QE\0QE\0QE0Š( AKE†QE\0QE\0QE\0†–ÐEP ¢Š(\0¢Š(´QE\0QE\0QE\0bŠ(\0¢Š(DëZÚ{aÅd/ZÑ²l8©–Å-Î­dùGÒŠ¬²|£éEac[žòâ aV˜Uwã3ÕEwYÅ[qUÜR-äBuàÖ”‚©L:ÐhŒ;¤ëX7iÖº[¥¬+ÅäÖ°cfÃ¡V Õ«…ëTÏº£±Ï\"ì2Õ¯3#­e£`Õ•“ŠMc.Û Ö×Þ5µpr+èrk¢‘Ë\\ ÍÍ&)¯Ö£Íu$p6\\Y½éÆ\\Õ0ô»èå)L›5Rn¤&„»Œ4”¦’¨†6Š(¦HQE\0QE(¢Š\0(¢ŠQE\0QE\0QE\0QE\n(¢€\n(¢…Q@Q@bŠ\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢ŠQE\n(¢€\n(¢€\n(¢\n*T¨ªD h½äV­»p+Òµ-›¥e$ikÂÜ\n¶­T!<\n¶¦²hÕ2Àz•êc½+t’àuªSMïD²b¨Ë\'Z¤‰lW—ž´¨ù5P¾MIsJHÒ›ÔÔºV”&²­ÏJÒˆ×,ÏBžÅän)Åê<R“Ådl$Š§,¦¥‘ºÕ)›I	Í1êŒ³ŸZ|ÍTdjÞ11”‡<ÇÖ iiŒÕlÖê&ö’£g¦“M&­#\' f¨É¥&›T‘”˜RPi*ŒÛ4´ÚQ@&8S…0S…&iH)â˜)Â¡›E’ƒO4ñRÍS%¥9œ*j\"ûEW–RÍJ1»&­nU¡bÚaöÕ9ëÅuÖIVoºÃ\"¸‹’xßæ»+9‘XžoJÏw½Î†!…FÎ*ÜMÀð úÖ|.AhFŒW#ÒE–…\Z(ö“¸œµFÁšPY²@Æ>=Ä×ëA`®À¨ÈíR1cÊç\0nõh\02c8—•\'CO1¤ÒAÆ~”ÊˆÅJ®\Z²o,Ž	Uú×Hc–U†W·½BÐ·a°m*y«Œ¬KWG	5‡ÙÜ·ÞÝÉ úT3XùÐ©@¡ÔäƒÜWQsjT²ªå\rf¼\\å2t*ŒÅÓG?{§$ÖÆdU/P£ûÖLÖ=²#85Öµ±˜©$7jìU´`a†\0>µ´j´c*\nG\ZÑ³³qÒšŽÈàñÁÏ5Ñ^il«¹WÚ²n,%‹æ(vö5Ó\nªG%J%w˜³³—qÉRµãƒ²hÕ”*qšªÈGji$šÒÉ˜;£^)Òâ p¢;u=RNrkJÒéÆœÃËlVìsðÈ‚~|Œ{Õ‹K¶Š&…Ÿí»ž™¬åšB§)·ë¾ê8ðˆ˜æ¯ˆ£½¼š\'+ºÑ¡ãž•Ê5ÀÎ¼“Ã‘Vá¹Dñ°óA9çœ©\ZÆ±ÒjW²&V5Ç™\"¯Šõ?ŽjkíLž!Ìh§ÏJÍµ»‚X%´rdÈ!õ-ÔÕ(5\rÚY·w$DžSooÖ¡@©TÔß{ªéÑBnFù&3*UBúRÜjÉe-ËÀeŽâ?Þ®ï•Ÿ\\¥dÇt`Ó¥I#dwØv¨µ)Ò}7ÍóTeÕ|0U@àÐ£wä•í>Þâ;ûl¾ÂˆfeÝŒ©cŠµ}<W÷·^J1[€Ýþè¨šÐéïgq#àÝ@v†9+ÿ\0ë¨tµÑœn·ŒPÿ\0x÷úÕ>ä®ˆè5ë›¨Â-àK˜¬Î˜Hä÷>µÍÃ¡#G8Kå¶‘T“‡‡Qéëšèn.Ò/	ù×xÂÍœü­Èo®++P†ÞöÚÝ£VŒ¤%m˜ÿ\0Îp}zÒ§&‚ªFW—Ù Tù‰\02±Ï8®¢¶ÔôÝVâúñìÊG	‚(¸I¤PC÷Æ+ŽÞú}ä±)ÜPº}+CU×d¾ŒÇ,PJÂG€‚\ZÞQ¾Ç:“Ù—Úò	¬¬âºV3!,dÏ8?wšYu)ãŠêXîTx¼½²ûp{f²ä¼ûjÛÄmÀÊ8#¶iáÒKíªV8¦S¼z#ëSÊiÏ ŸèðÙ[¾dìKÎzôÏëVo/®b–8¤ŠCG–£)þ÷©ª6÷¨4ÉíV%g=]ùã5R9eù¾W_,sÐuªåîB•‹ztÂâÎêÇì‰3Ì¸…Û¬X98ª¦þèmK‰œÉ\Zâ&\';0z\n©\'îåb	#$dôÁ—QÏ9\0U(™¶vÜéÖZmôÍÛÅ=ÍÄ€dÈä(Dˆ®l]±µ¨Qlû÷ÉôÏÒmhÏpèÒÆ¥—wn\0ö÷ª¯·ÍÄlLtÔŠ5 Ócû-Å×Ûc\rhQã‹ø¦ÉçJ[‰¤¸Ô<€v‰×óùÔ\Z\\àLðJË~Hû¼uªbñƒ+œ1ˆü¹irÝ›BÅÌ²Å–ÆãÎŒ¸=}+?qlç&•¤ËqLÏZµ¡;Š0[ž•{OÓe¼B¡ÛžM&§K{:ª¯Íz–…£Egnr€î¨®\\EuMYnvá°üÚËcOIDƒJ†Ô`\"€9¨/9^•wqéQ\\€ -ŽEyWÖç©c‰Õb-×·jÄn+¥ÕQRÝÜ“»<VöäF&ûW}=brÎ|²³*RƒŠLÑTÑi’«TÊõT\Zpj›åÕ’ž%ªAêElÒ°¹‹bLÔŠsUÐf­Å©cD±Šµ¦GµZHñPØÐ(â˜õ>Ü\n‚QŠHe)Û\0Ö5Ûõ­[“ÅaÝ¿ZÞš0ªô3gnMQsVfnMTcÍvÅeG¨ÓIEfL(¢Š\0(¢Š\0)hPEP0¢Š1@Q@Q@Q@Q@Q@Q@Q@Q@Q@	@¢LBÑE\0QE\0QIšZ`QE\0%Q@…¢RÒQE\0QÞ’–€\n(¢€\n(¢€ŠZJb\n(¢Q@EP0¢Š(\0¢Š(\0¢Š(\0¢Š(ËÖ®Ú6UÖ­[œ0¤ÆŽ…dùG=¨ªªÿ\0(úQYXÒçÒ-P¸©Ú¡~•â3ÖEgªò\n´â«È*KEIS˜UéZ¥5ˆË¹\ZÃ¼^Mo\\µx:Ö‘(ç®W“YÏZ·C“YrpMuCc	ˆ¦¦VªÀàÔÊÕm˜’ò+*ärkUÎEg\\.kJlÆª¹“ æ¡ïVå^j¹Zë‹<ù!”f”ŠLUQE\0”´\Z\0i¤§Si’QE\0QE\0QE\0QE\0QE\0QE\0QE\n(¢€\n(¢€\n(¢€\n(¢…RÐE¸¢ã°”QŠ(¸XJ)i(QE\0QE\0QE\0QE\0QE\0QE(¢Š\0(¢Š\0(¢ŠQE\0(§­F)êy q\ZÒ·jÊŒóZíÒ¢EDÙ€ñV×‘T n^ŒÖ,Ù•šš¡qH¢œ¦¨ËWåZªñæ©Ê˜æ§ˆr(óSÅL™µ%©nÒ´#ªp­]ŒW$BBÂô¡ºP´5fjWÕ)®IT§èjâ&gLzÕ)*ìÝê”ë¦<ÊíQš‘ª3[#Œ4†œi¦©±†’œiµH†!¤4¦ši™°Í(¦Ó…)Âš)E&i@iÀÔ`ÒîÅM¬J)wT9-Ò”N¢•[bqœñPžµ#p¸¦U¤sI¶Åóm+ü=+¬°’IcWa÷ÇjäÁ ‚:ZétGóm–ŽkB÷ntá%ïXé¬\']…A>õ©UqÚ=ëÈp	á–¶¡>`ðGNkËžç±‹j«{õ©†ùˆ\nùàP¾’§>Ô°±-·npzÖEË$òjÓ®çÈ‡aÇJS‚í‘Wí’O-„n\0[½+’Èbb’±sÃ#¡¦OjX\00Î>µ ÛLE$#½C$–™¼OlS\"æÔ\'h(œf¨\\Û#Ý½+¥}ó·˜@\nzŒUimá—\'É³Œv«RÉK	‰ÀÚpjŒÆëœ.å[÷7–Ë$cr÷ïYòF¥¯5ª‘-„&hÙA“Æ{Õi¬2­09ªêDÂ^Œt¿\nº\"FM²G‚z°ïNö»œ­¦¬²Ä¸CÔÆ°ç“ÜóÀ¯LºÓ>Ò›L?*ò3Yw^ŒHŠ¤‘\0æºiâ-£9já¹µG\rjòfÙžõb2½³[úY·Vƒ…m¥qÒ²Þ\'©®O¥uÆjHà7¨C‡.¦M™\\ý}©QÊ¦ ÝŽÔvÍY™¯os\n:°Ì!9b‡“PnY-g!‰e“(Iç¨8éNÉç­.QóÒÝÄt¥²dÚÑ¦á <±>µ‘G|µM»ÿ\0¼Þ¦²Wbc´ÓÒfuò·áOjžKÎu·ÒG{¤,p<f{t\rŒô°žê\'Ž?%æFëÇ†`xÅe¤ï>1Ïö‚€>õ(Ó¶€ê6uZ•ì‡R¶ž9Œ¶ÊýÖã¸õ+/f´•#bYŽÄc>•íŠ@desÐƒÆ)÷6¦£‚\0\Z1óÊÜ³±þ”ãh)M½Fê2´×FbA$u¨¡}Êä .£ Õ­!bžîW¹ÛäÃHCt\' ­gÇ+ÄáÓ\0ûŠ¥Ø–õ¹u.Ï‘$YÂÈÊÍïŠ†i†ö*“÷Hì*±l’qŒö„ç­>P»	$óNWØã9À¦ÄB¾HÈïMc–\'Ö˜‰L¬êS¢–Ýzh$`b˜>”áó1\'© Câ§#\\ov\n7tæ¤•w\ràÛ\rƒQ!Dr]K\0{ÒG VË(j,¥DŒ§§­Fh\'\'4½p!¤ «¤éê\n¨¼ÔÕ½AmBPJ’:×¦é«g*,Qõ®Jø…#¹èað·÷¤C¥h\"×m©Œ3)Ü\\wö®Fª2© gFÃÉ¤l@9¯.RrzžŠIl;åÆâ2Ãš§uûÕÝŒ¤TíòriŒ‡Êf íhÍj±³BÌFŽqâîI$ ·ËÓ‘]î¬¢fe;\0Îy”¯þ–ê8•èa5M3ÍÆèÓF”ÑíPá­B\Z®ÃÉhcb3Ž½êƒFñ68ìkiFÂ¥VêÌ~isLŠÎÇG1 j³ÍUA“Z&qRô©f³ZPÃœqQ[ÅÒµ!‹Ú°“5HlpûTâ,Té<®*.QMÓRjÑqY×M	™g¬¶äÖÕãu®~é¹5×I•™BSÍWj–CÖ¡5Ö:OQ(¥¤ª (¢Š\0(¢Š´”P1h¢Š´Q@RPEPE”\0´RfŒÐ!h¤¢€¸´RQ@EP0¢Š(\0¢ŠJb\nQIK@Q@h¤´\0QEÀ(¢Š\0J(¢\0¥¤´†QE\0QE\0QE\0%-PIKE0ŠZJB\n(¢€ŒÒ\nZ¢Š(\0¢Š(\0¢’Š\0Z(¢€Ö¬BpÂ«ÔÑžE\r@ü\n*\0ü\n*,YõTMRLjðYì\"]ÅYzÇ%¢œ‚©Ì8«Ò\n¥7zF]ÇzÇ»ï[7ëï½\\K0®‡&²fšÙ¹k&qÉ®¨Ì©žiêôÆ\nØÄ˜œŠ©0ÍXíPIÒœI–¦|«UÙ*ô‹U˜bº\"Î9Ä¬VšV§\"˜Eh™“DX¤§‘M4ÉES”†–’™,J)i(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0QEZà)1¤\0f¶œ«NRÙª‰Zn*rµ\nDt”ãM5Fl(¢Šb\n(¢€\n(¢€\n(¢€\n(¢Q@Q@Q@Q@ÂŠ( œ:ÒP(t5v¬õ5j&äT´4m[¿´blÖ5»ô­HŠÆHÚ,»MeÍ*Š“•<Ô-kCfi¾U;…Œÿ\0#Ú¦H±Ú­yTåŽ²›:)!‘¦*Â- Z™V¹äÎØ¡@â‘©ø¤n•%•dïT¦ïWäj”ÃŠ¸‰™“µJJ¿0äÕ:×D&VzˆÔÎ*#[#Œ4ÓN4ÓVŒØÓM§\Ziª3b\ZiëN4ÃÖ™“\nPi(¦!àÒƒL”\ZE&?4šfrp*P6ñšÈPxÅ(8u¦Ó¶ü¹ ‹ÜCžô¸8É¥ŽivãúÓBdMëZÚå.LcœóY.rÕ>Ÿ0†ñX¶ÞÙ¨¨¯‹£.Y¦z$hv‡¨íWíØøzVn—0òÀl’Ã­h2}œ\0ã¸¯\"[Ø÷¢ô¹{‚ dŒõ©b!Ó‘ýjäYx<+r1S„Éç\'“,»ðT˜MhÛÆ¥·2’G8ÍQ·O,\r§¯AZ®v¿*sŽk6L‡\r»2Ê7tÅ0e$R¤tåHÈ53)L€wSFöÜp;fš$‰“säFj	!T#†eÏPkDGãŽ*	âÜË9\'=j“\ZìI3yd«cî7·½S¸ÓÌlà· `èkVê¿6Ö\\õ qU¤yª\ZFSÁ\"©63\"T`èÈªYGÌ=>ó¸Œyã\"¬È‘¶IR²¸¨LLÑàeH«¸¬XdýâÈ¸+ŒjœÚÛªÇv›ŒûpÑ7Aô¨#ù[%Ÿ•H_åWÉnySSp±¡¤Û_[bºò:s\\.§áë‹}Éöi@+Ïéa„®BGÝÍ!ˆî‰OËÛp«(lD©©nx}å‹ÛLc’7GôaŠ¨U‡PE{n§f—åÚxÒt#ƒ´nC\\Å×„ï/ìäÖð“¿<ðÀzWl1iîqÔÁõLóŠ‘¥-JÊ>AŒã¨ÎkZçÃ:´rK%³yQ¶ÖuäéYÓYÉ7ÈÈ®¥R/fqº3Žè‹ Fr	â¥†Öf·kÅ„¼8Y`OAúTOŠAÁäR‰¤XL*îÌ¹8\'éUèC·%–?67¹Œ\0»¹QÛ5WŸÀSÒFˆœt#zÓ3M	¡ì2Á#<úS	â‚IïSfÉ2²¸9Ü«Õ>´\nÃ|Ä[o-GÎÍ—>Ý…EÖ¦	\ZÛ³¸%ß„Áàzæ¡ã¶hUS1lŒZe.(Å;…‚œ\nì9R[±ì)¸4ÿ\00ù\",.nÎ9¤\Z9àœQÀÎ9¤Á\'Þžau©\\j,uÄ/„fRH\ròœõ¨±V\"´–PYPà{V­¯‡\'•cgÂïäéQ*‘ŽìÒ4e-‘-#\0Zë<1áø%½fÔ\"%r£ûÆµ4í\nÝ9ƒ·\0wÉ®²ÊÞ$X\0	+Š¶%µhž…*Ž²&²·†ÁHV0=8«Eî>RTã­Hª×\'h_”N´â]$\0.1Šàlì!$-×=sUÙB;<`òrFjrQ‡Þ‘ºJk\rŒ2~¢¡-™	ú:SÀ0[>cïDŠ	6=©±”.0\'é—©¨6ÌJÇ¢Šò[¦&öSžw\ZõÍKäŠä’8ö¯%ÔG¨È3Æêô0]O?².éòŸ1pI9ïZí\n¾È9çšÀ²p²äc¥nBÞlF^®½ë®hàƒe;‹Vƒæ^R«†ÍnmFL°ùqÈ¬Û«2„¼\\¯¥dÑÕ\n·Ðd]kRÕy•É±kÔV3: îk[¯JÓ…x¬ëzÒ‹ ®fn‹*8¥\"‘M)5#+ËÞ²îZÔ—¡¬«£Áªˆ™ƒ|ÝkŸ¹nMn_µpy5ÝIÙMÏ594ÚéG\n(¢˜„¢–’Q@‚Š( –’–…¢Š\03E”\0´”Q@‚Š( Š( aEPEPEPæ“4QŠ`\nZ(\0¢Š(\0¢Š(\0¢Š)€QE%\0QE\n(¢€\n(¢€\nQIJ)(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0J)h ´Qš\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0*D<Ôtô4¶Š)€ñE >§4ÓJM4×ÏžÑÔÒ§j…úR)%ª3w«ÒÕ»ÐZ3.;Ö=×zØ¹ïX×]êâhcÜ÷¬©‡5©sÞ³eë]2‘P¯4¡*LsR¢fµ¹•Šå8¨dJÒò²:T2CB‘.&L‹ÍV‘kNXªœ‰ŠÚ20œJ,*3SºàÔ,+tÎY\"2i¤Ó0Õ£6%QT!))i($J)i(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE)i-\0\"Š`©¥—U ZjTÂ³léŠ\"e¨\\U–éP8¡2fˆZm=ºÓ+TsÈJ(¢™!EP ¢Š(\0¢Š(QE(¢Š\0(¢Š\0(¢ŠQE\0QE\0QE\09O5b6æ«\n•\r\r(¥jÛ¿±!n•©lü\nÊHÖ,ØˆñVš¥p*êâ±f¨-.Úp§Tí¥OÅ(”Ù×I\rR¥U©×;gdPÍ´Ö>Ú–Êr\rR˜qZ\n¥0ëZDLÌ˜sTe¡8ªŠè„Ê¯P·Zê[£žC\r4Ó4Õ£&4ÓM)¤5HÉ4Úq¦Ó3bQE%Q”rx¤©c\\riÇ*íô\n\\æ€3@1W“Nü8€ÐS†zP˜Òr:ši\0Q“Q¿úÓBdG­ 8äu õ¤ïHÛè[íSæÜÃ‚\ru–àÌF:W›x~äÅwå’0ÕßYÌÈÊË¦¼¬L-#ÚÂÔæ¦TC†ê­Áã¥XÞW¯ZŽ2\\‚Ê{\Z#)ÊÙäçšä:‹Öoµ†å\0ž‡ÒµTdƒŒƒÞ²­dô<}+UaxÆ²€æ¡ŠBªüÄ¡Ï<ƒN¤Ÿ1àü$S‡-Ð˜5#/+ÎPE$j$1µ€ïN)ÊŽôæUqÔ™;š2Š\0ùˆç&ÄBÞg”È÷Y9R*ƒDÈ¤¬˜=Æ:ý+EÕ–3¼|¬{\n„ªàáH#¥;²BXï$Ã’;Õ|tó26ŒqÞ´ÞØÈùÆp*«£…\0\0ÀsÜU\\¡!@è]@ïC¤†U Œþ5\Z(“ ¹È©É/\"‚»	c@‘\0ÿ\0X¿7®jXç™&î\r·Ðv§Œ§žxã­Iß3z`·~:Qp\'…Bº;FHÉÀ£¹óá”=°ÙÆìt>µ~6v%)ˆdÐRFÂºŒuSëSqsé¦{&‹í-½›tŒ@êEUO\rY ýå²Üi|dýEn4\'	ÝO­Z‰X\0¢<IŒáOj¥&+èq×ž³™¢}›“Ë*«ÊTŽÆ¹›j·ò‹x#b\\Ìó}ÅôÇ½z´Ñ+C‡]¬[\n@ç4øìÄ0ó\\—æ@ÝëXÖ”z™J1{£Ç¯<,+Íäàùü={T)ðãV–æ(ÐÅ¶Q•;ºzö	­Ä±c\0p¹¨ÏÊM¨J·PG…ZÅT]It)Ë¡ãÚç€5@%‰fB3¾>µ‰…ÈÀ›Îã†Tï^÷,?hˆîgBÓÏZX4[;cÁoo×vÞO©&­cemQÇ¬¼­_)•-JB2çÖŠü=¹yR<PI#ò\nõ\Z2ÌÊ=¨Äª‘Œ¿R7j.£)aé®‡œ?€4ûTØÒË+çïtâ™7´Ñä3oþénµÞ\\yqçœñž•™på(<Žx©öõ;šª0ìyÔÞŠ		Û#!à.yªŸðŒËq1X—`?1¯EC!2Ëi:zQ±w–Ž00;Ö‹5Ô‰aàú\r‡‡›’XÛ~ï¼jÒ¹Ò-ÚTŠÀ©sÆºa\nÅ\Zçæ%ŸØöªMÄv`–êhu¥\'pT£dŠ––;Ý£æôU…µBè¨§~}xÅK`‹€EOo-¹²1ØVnLÑ\"å¤)…ÀOn€V”pùò‚Š0\rRµ@dX€Ãç°­ësnèƒ•$w¬™MØwË	€¾•+à÷ëRºd-’)§#?/ËëYÜd!z6*9où‡áS°i@ÀÆ1Q´9Ï qL\n²F¬IRÀöæ pcÉ,x1š´¤‘´óŽ•\0ËJw8:çùU l¥uæ`¸Éí^I«®ÍRq¸7Q^¯¨Kˆ˜„¯%Õ:”ì­¸ë]ø=ÙçãŸºˆ“ ‚\rt\Zja2àíqŒžõÎ)5»¥¸(79!y\nOÝ-:/S^Qßwò¦®ÕÏÉzûÒÆr…ˆnÂ*®ãYš$¶ÚÞdcŒôô«¶½©£²>”ÈÀðOHtjtf¥¹éZ17³!=:UØßë–HìR/©âœO]¤ßQb®2SÅd]žµ©)â²nÏª\"{õñëX7“[—Ç“XSžMwÒØóë½JÖ’”õ¦×AÄÃ4´”\n-%-\0”QE\0QE\0-Q@	EPES\0¢Š)(¢Š\0(¢–˜ÂŠ(¤0Å%-J)i(\0¥¤¥¦EPE”\0´P( Š(¦EPQKI@‚Š( –’–€\n(¢ÂŠ( Š( Š( Š( Š( Š( Š( Š( \0Ò\nZ(\0¢Š(QE\0S—­6•zÐ\"|ÑMÍ†}TM0šq¨Ø×ÏžØÖ5ô©\rDæ¢´µF~õvCT¦¤Z2î»Ö-ßzÙºèkï½\\M{ƒÉ¬éO5¡ry5›)ä×D¤0jÄUOw5b&­\Z2¹}FE#Æ¢6È©HÈ¬®Q4]x¬é£­¹—ŠÍzÖ°‘‰“\"UVZ¿0ª²-uEœ“‰Q–£\"¬0¨˜V©œÒDT”ãM«L€¤¥¤4ÉŠ( Š( Š( Š( Š( Š( Š( AEPEPEP0´”P…=MGN“-2Êš”\Z¬­R¬Ú6Œ‰XÔ-Kº˜Æ„‚LºÔfžO4ÃÖ´F,J(¢™EP ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0TŠj:pë@ânkFÝúVTgš¿nÜŠ‰rÝºV„gŠÊ¶n•§éXHÝÖœ*5<SÅfËŠ)ÀSEJƒ&°›;i!Êµ2­µ2¥`ÙÒˆ¶ÔNœUÂœTN˜¢ã3åZ£2õ­YR¨L•iˆÈk>aZó§ZÍ™z×DŒÑžâ jµ ëU˜WDNi\Za©\r0ÖˆÂLe!§…$Ó„,MQ‹dšjÉ·õ4¿f¥;Ê”•pÚÓLcŸzw&Ã#ŒŽMHAÅ;žôÞ¼R0ñÖ€y œš09<)è¿63M\\T‹Þ†ÕÌg*H=2*¼Ÿ3’2*Æ\n®HÎzT.0!Û­\'zsýêm\0I­«\"žAÍz.•{öˆQ‘ÊŽÕæâº/\rê9¾ÎÍò“Åsb!ÍxJ¼²³êzò€ Ö„-žsóVM£ù m8aÎkE)\r^L‘ì¢ä$¤R¸`~RkJ¦’ØùlÄwÅWŠ%•AcŸaZP,–¶Ì#Îd{T6KcÇøŠ™Ab¡HÎ{ÔsDsˆ‰Ý³æïJ¬Ñº®ÜqÔ…¹8Èp¸úÒ¹KzP_\0o#Ã\n`w¹@xûâ‹*–Ç(>½*¬ÊA.	,zÕÖ)ƒär÷…B©¼À!Ç\'ÔÓ\Z)K’›OôaTJ4SÜ¦1ŠÑ•8õâ©Ä²HƒÌwu”ÑI”Ý9sãÒž¾3—ÚÝiŸrF\0cž=éeÃò}Gjcb\"œ·J|YUF7hŒƒ“ÐÞ¤eBÁ£r20Aõö¤ÇrÂ“\0¹ÇrjÎ\\DˆÇ*8CíTÿ\0Ô‘¸’:’*[vËmW.8nÔÑme`>nTp\0>2¸L™ÉÏ÷j´D£6W†éÏJœ\0à|ø$ÐC-&Í¸hÀ~ª})Z3:™	S´öëU„ÒoE;<³×ŠÐHRíQ†<óTCÐ¨aT*2Y±œŠkE“2G<Ö‘‰Ä¤•VP8\"¡–“Ó,3Ø®áæ®3Ó®mòÈ#ÜTå¤`m§8§e\rŒrjW+î.	*7/«º¢=¬;Ö–w¿È<°IÇZ†dó¹8þtl	œýÊr7dÕv\náHûÂ·nã\0+âaq ¨ÉsM3TVEÂAŽFj9	pYN3S¹;IÝ“ü¨+µ›W\rÀ@Sh¾\\äªôÏ­U‘I`…]’BFÓÛµ]#g“-T‰`cF21ëSC¹€Ë1Æ)³4¤*¿E8àU«K}ì\n1¼“Mì$hÙÁåáåvà{UèÂdí^äÔe[-Vapœ…9¬›*¦!¹÷¨ÆYÏÍŠ”¡-2‡­#ù»`v©Ž2WŒ½ª¤²²ô\\üU¢J1ÏÐzb ŠÅAÈèi )¸óJñQ>Ð`\n©ïÞ­\"¥ŽF+2þO,\0áT·°z³£Hs…\nMyLÍ™Xúšï<SxÐiÆ0ã3{â¸ë^®Ï+;É!ÉÉ~ÍÈ)<YëVí¤ ö®§±ÆŽ–Ôô#•ÎjéË.\0£­Pµ%­ÀÛÇµi„©òÕ³Ž™â±fˆ«†Œ’½=èš1$BCÙäS¤û ž”õ;†0\nã¥&4E8ÎƒèM[†õ€üÕ#\Zäí$5T¸½ž\nÑ)¡©pLÒ5Z:h¯Q‡\\}jÐœcƒ\\bj£qÊãéVáÕºí“Æ²•tCÜéd—\"³nŸ ÕtÔÃ˜ŠŽyÕÔk>F™²¨š2/›“X“õ5­zÜšÇ”ä×]5¡ÅYêW4”¦ŠÜåbQKI@‚Š)h(¥¤ –’–€\n(¢€\nJ( Š(¦ ¢Š)\0QE)h¤ ¢’ŒÐŠ( aHii(w¥¤¥¦EPIKF)€QE€(¢Š\0(Í%À3EP ¢Š(\0¢Š(h¢ŠC\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nQÖ’@Éh¦Ñ@V\Z‰ªCQµ|éí¢6¨\\Ô¬j¤R ’©Lx«’\Z¥7Je£2ë½b]÷­»žõ‰vzÖ‘,Æ¹<šË˜òkJäòk*fë]0FdE¹©bnj©aš’7æµhÆæ´\rV”ñYð=]Fâ°’5LIG›p:Ö”‡ŠÎ¸ïUHÌšª½Zšª=uDä™TMR5FÕ²9äDÔÓNji«FLJCKAª$JJSI@‚Š( Š( Š( Š( Š( Š( AEPEPEP0¢Š(hŠ(àiáª*\\ÔØ¥\"]ÔÒi¹¤Í0¤ÓhÎh¦ˆlJ(¢˜‚Š( Š( Š( AEPEPEP0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¥”¢€&CW`<Š •rÍK)6ÍÀ­XO±­[¥k@x„â]SRŠ…MJµŒà‰V¬F*«q¯Jæ›;©¢XÖ¬*ÓcZ²‹X³b\"µ¥\\ÙQ:Pt‰T¦Nµ«\"UÖ­Æ™:ÖléÖ¶¦ZÌ¸P&·”™‘*ÕVÕÛ†AÀ9&«“’x®¸&qT¨‘\\®MO­JJ…À4ø—\0RkTŽYNäm\r(<›Bõ¨ƒ¢õ4Ñ›\ZA\"š¤†ö¥g\0dšœšb%–LŸ”þx“¥\0P;‹‘@PiÇ\0S2iˆR8ãÐ8æ·Œö¡y>Ôt`ƒÖ¥\n ŒúÔJ¹aƒRm9Ò+`¤Ôœç®*h×{ŽqŽ¹¦H¹f `zP†ÊŽ9¦v©ÔtÉS[ÌÐL’§ÞC‘PS”ÐÐ\'gsÒô{Ñul&VÆî¸®ŠÙŒ€œ|Ã¡¯/ðþ¤m®Vcå¹ãë^g8*§äb)òH÷0Õyás ·bùIûÙæµbŸ)ÉííY¶¥\Zî«pê0B+ÙêZóTÆ	eèH=jeöÛXÒ«á]\0Èãš–61i8QH‘$€œ‚½3ÂBÃ|#	=È¦yk.í@süÁ€»\0²Ç¥€V\\î²	ê*À†å\'8>•[ìÏl¬\0\r»šB&;¢b¤QU\n:€\0äu«Œ ðFÌóš‰¡q!Á9÷Šà¸&8ê)›x\rÊÝ*ãåœàqÛ5QâÄ #‘ìzT˜ÅŒ©‚ª6Œ:Ô‰‚w¯EFT?Ê~Rz0©•‰Ädƒƒ@‡ä¹\nUxã>´è¡t2ŒŒàzRH¤p­‘Æ8Å*Ÿ!Wk»©ä¯¡ ¦I¶È«³àóš‰ÕÌë4lr£=)qnò©ÞÊzâ´4†?0sh%Û}¤GØT`’G?…iÄ]²¨ÆrµPòÚ(Õ¤‰èsV–@€»—#4\\™j^\n$û’zÒ£Ü«•Ï^)©f2W\n¨©¥ÅÙ’Ì~ÔÌÈŒŠ…P}HëO]¡W`ïž´EW!ß­Hû÷€SŽù dO²@]\\ã¦z©3¨ÜI#Ž•nçw’Ê®\"_P9¬kéöÃ»Ž9<šL¸«•g¸f#ë“Y—n<)\'½5î$F`çsŸº£µ,o!á¶’FÏÖšV5Ø®v€¦Cž~è¥`Çv…;R HŽæ úÓZI$VPõôB!š3´98ÍB£Ë\nrÛsøÔ÷»1MVDóff$•NHÏZ¤&>!™²[=‰­{2ˆ>îìŽG½Q†Ì\0\0gš½Ø¢P ™	ÇáJL,]väƒóžÕr8@\n™$õ5\r²íBväúš»¨,z¿˜›TÆŒO~œô¦0ÉóÀéOl$…çw4ÉcËÀ*JBêE#n;@¨	|1UÕUwà“Ò©ÎÊ§§¦†ˆ.$\n\"Œÿ\0JÁ½]Íž•¬ä–l{ûV¹u¦›<ìÝÜö­)«»\nO•\\ó¿^›½IÀ?$GjÖ+u©\\’YRrj^ä#Ê¬xS—4›c‡Jš#†\05\"uª$ê´Çg©­;	(HÝÇÖ°ôÙ\\.{\ZØ3(wÀ¬Z³4OAI\n‡8çÒ’”ÇÝQß½BÊÅ¤òZr¼‰R îî;TŒ‘ã`xÓ.-¼èØ’	ô©2.æ\'&¦Nžc\0;\0(›žÁT*ÀœWPÐåˆ `Õ)lÓ–DçÐU)\nÆÐã4å¼“ÜqDñ©9èj¡ùN=jì˜¹š-=Ï˜9ëTåSÔsAnÔ™ã¡+•÷!=i*R Ó\nwª m!¥¤ AEPÑIK@RÐ1(¥¤ BQE\0QE\0QKE\0QE\0”Q@Q@E”(¢ŠbŠ( Š( Š( Š( Š( ¢–’˜‚Š( Š( Š( E\0´QE!…Q@Q@Q@Q@Q@Q@Q@Q@Q@%-\0QE\0ê)3E\0}Zj&©\rFÕó§ºDÕÔÍP½\"‘ZCTæ«’U9¨-—=ëï©­»žõ‡wÞµ‰FÑÆk\"vÁ5«vzÖ%Ãrk²š9j»³óJ’`ÕW~i«\'=k£”ãöš›PÍÒ®¤üu¬æÇz²·õœ©šÆ©¬óŒuªsHj±¸÷¨ÚlÒP±^Òãf9ªS³f zÖ&2Ô„Ó¥Hj3Ò´F2\"jeHÕ­‹Š(ª JJZJ`QE \n(¢€\n(¢€\n(¢€\n(¢Q@Q@Q@Q@Q@-%)sIE\0-”Pæ’Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0)i( 	­Byª‹Vb<ÒcFµ³V¼\rÀ¬KfäVµ»qXHÞ&”f§Z««QóŠç›:é¢Äb®Ä*¬B®Ä+–lî‚,Æµe¢ˆU…¬‹`EFãŠ”š†CéM\"*KŠ¡7z³yu\r²n•Àô­s\ZŽ«qpÛ`]‰ëÜÖð¦äc:ª;“^ÞÃn§ÏÙEs×w²ÏÛÂ¥s1/)<úÕ´·TPZ0XWl)Æ\'\rJÒ‘„“Ê“WVÎI¢,PB:ÖªÆ„ü±¨#¯¬@e]½»VœÆ1ÛK™£©¥ƒN”Ùâµ™¸*QNF0G­Ì\\¥hôÀãi<ži.t›X!i¦%@÷êkYB€IÆrz\\Îµx×3àÝƒÀ¤®Ø;$gÌP±À*\Z\\ÑÁ­HäÓ±Žh\0c=èÉ\'©€½V›O4¼Å)\0”\09ÀäQ´v<ÐJ£sœô\0ø×$zº\"ÁÆA=ýª‚‚G§G;IÜp{Rh4,œzˆk˜ZtPO–­´Ç>™ªSni¶äv¤V<`Óßz¦Ò4‡¹žø`ÇùT5bO•\núÕz¢D4QE1£`ÊpÃkÑ<5}öËr£wFç¡¯8SƒZZ^©6—r%ŒîŒýô=\ra^—<Nœ5og-v=–Ø»a‘ˆèX\ZÖY>M’¹«œÒµn­\"–&,u­´‘rA&¼Y+;3ÚNêè¼¬ ŽõfÞ1ÈÇj‚7–/jì26NãŒŽ\nÔ\nHšbR}iP¬‡ž<Zz7š6²óŠ–F0Ý\nØeÆ2{v¥R ˜ó	©¤:Æß6sŽjUe\'3žôÖë\"nn2>Sš chþVùf­B™”–QÔf¡hü¸Ð#åqÇÒ˜Ó1fšTˆb6e\rŽ”âÑHG\"µ&€´a”es†¬««w‚IÍÊÜ«ÒŠLi&6Œ†S™T\rájŽ)’UYƒ/féŸj‘‹ ÇŽ¿Z,2hÎUœ( þtŠÃ€™W#ø¨ÃF}?‡h¡””\n@-Ô1ëHÄ®!.BÈ¤‘ùQ–²0\\0ÇSÐŠnUB(vW\'/À5:D¤3\0ŒGÞ\rÜzÐK4Ê£9^ÛZ$GO-€,zçÒ©¶ÈW…Þ§¦Ý£2Îp:â€µÍHÄR•Œ«V„>c·ï{cVd-æº‘•ö­Ä×[Âä›;¶á…36‹	o\"N‘$œ’zŸJ œÆÍö¢Ê¼<N1Ì°€¯¹±Üõ¢âë¹JîTó9gè3Ò¹«é#FV–P7ž™éô­BV‰Ws¦æ8Ú5Ë^Â—¾hƒ4Mò±ÿ\0\n#«ÔÞ*ÈcÊewtR‹2NI)PÑïYZ0?‹¹¨„gî··J·\Z¤ù[^†¬dIŒûûºÖ‡ŽC a[§½Y†!|¬`|£5ªîÄ3žŸìŠR¸TgQ;AÚ}I« Ha’-\"rÊ2ç ©¢MÛž^1ÈÛÔÓlCác…\r$Õø\"d1\0’:ÕUKäIÕ¿‡\"´bR‘äs#˜žqô©`N ²|£;š°§Ë@Sç©¨Õär¤sÅZ¶Š8ØxçŸCRC Tß»pËúúT’Aû²ÄqŽõ#àFFMÁpÙÈ´ŠFhÔà‘Ò²§ùØÆ«ó1b]ºöÇjÊx¼¡$žabíÐö¦ŠD2;Ù\\Þ¼óÇ·á¤·Óâ<ÞIý+Ð.¥Xá9oÍíŠñ­Vóíú¥Å×8f;sé]¸8^\\ÝŽ\\díw3äô¨ûÓØÔuêH¢¤ŒÜœT`ÓÇZ\0ÛÓrÈàƒùÖôk…àŸZÁÒ›æ\n[ºv®2Ç5Œ·4‰$H„àŒÓ’2>P»‡ROjT)UäÔa¤N¤óš›Éü˜##×½5‡îÕƒö\\T’[­ÎZˆ1TgèŠÍ$Nsž´›s$cŽÇ­H3ŒÉ¨\\6A ë½4iò;VÅóí®¸¸ÝƒÒ±5C™£jâÅ$aJ›[\0ÓY—\'“ŽzÔqÒ´3š^ÔQŽ(p`Æ˜ÑsÁ§Š(1ISZaNx VKE\0RÑEŠ\r%\0QE\nZJZ\0(¢–€ŒS¨¤i)MÀJ(¢€\n(¢€\n( Sh¢Š\0(¢Š\0(¢Š\0(¢Š\0(4Q@Q@	E)¤¦ ¢Š(\0¢Š(\0¢Š(\0¥¤¢‹ER\0¢Š(\0¢Š(\0¢Š(\0¢Š)€QE\0QE€(¢Š\0(¢Š\0( ô¢€ôQE\0-Q@ÏªÚ£5#Tf¾t÷Ú z™ª¤R+ÉTå«rUI»ÐhŒÛžõ‰wÞ¶î{Ö%çzÒ#g=yÞ°®O&·o{ÖÑä×¡Dá®Ìùš}:CPÍu¤yÒe•“(–©§†¡ÄË~o½iª»ýéwÒå)Lµ¿4‡š…Z¤¦ÆªW\ZÂ˜jF¨Úš&DMQš‘FkDbÄ¤íKEQ˜”RÒS\0¤¥¤ Š(¤EPEPEP ¢Š(\0¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE(¢ŠQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\08Tñžj¸©PÐÁ\ZP7\"µmß¥bBÕ¥o\'JÆhÚÛ…²*ô]«.Ý²+J\\•B’4!UØºU(jâŠågbv-¡â¤\rTÞt…w;\0?R›Xˆ×ñ4F\rìg:‰nkKp‘»‹y¬±% ]£ûç­PžæI‰y“ØUY˜p9®¨QKsŽ¥vôBÊ¾{—‘‹Ri@^n)‡28=©˜œže®„Žfî¨b9¡Ø,y ñI7ú½Ù9Ï¥BX\0P’sëL›{Œtã#‚D$eärçÖ’e@‹‚wzQ¤€nr};Ó°‡,R8/‚1×­E(S“DOÞ\'™­Y7ç\0rO ›+Y¼{;$?ïåÇ¢÷®MÙŸ<\n¿ªß-ÝìŒÚ³ÈâµŠ²!ê\'~izž)BûÓ€\\Z¡\r+´riq‘“šp<Š‘Wå$úR03JAÆqR…-ŒŸÒ”ÆpOoJWÆZ—Ÿº*P½2F)¸¸ \0R‘ž€R…-ÛŠvŒ7~´$d•©1€;Ÿ¯J#±êÞ”20Ø¡p[œæÊSõaŽ•Põâ®Ì£µSaƒT‰cH¤§RS\0\"7jŽœ§€:OkÇI”A Ì.z“÷kÕ,n–XQ¸Áç#¡¯]®›@çÖºOøž[„µ½r`èŒ„û×\'ÍïGs¿‰å÷e±ì‘\"8ÅKö„·PÌNÐy¬Û)ã•UÑ¹n~¿JÑDG;s{×”Õ™éÜÐ…¹;rägÒŸ\Z	HÁÏzª’Œ.s´`“V#ó\n‚ÃéŠD2UÝüCzÒ‚	Ê’Žôìã¸Í3®`§oZdr‘ÆìsŽ”˜ÚãjŽ«qD0—£dr*7DåÏ¥r¹\\‚UŠú¯j­0&bJ´ÅT©÷ªî\n¨p7â†R(›4”\r¸¢–ÖHPÄŽœÕ¤È9*¸ õ£Â’_lãéEÊ¹I$(®Å\n´}p8§3¬Û]Ý«R(nSï7\rïUžÇk—VØqÐt4\0+Êá·~•*º®WÉ.„ðAÆ*ªM xÅÂ…CÆñÐU…uËDrU×úÓ‡ÉˆX„åT<ÔHé÷Pllõ\'šFÞUc—k8:¿ZEò¤Â3az@¶,2\"G#l•)*iË-âïß ‘»ÅVÌ \"HÓÃNY.3IyeIÆ=M\0_Wwˆ6\\të‘ùSOÚäç%@›(°¥×Q¹¦4ª‘2Í)÷èR+û«ˆÐK(þ6íXùºiK1?q{Uû™äB[*¢($žæ¨[Âd  É?yØu­#¡CãPÃç<\nÒ\\ˆŠÇ#)$Ö‹k­þi[æ\'$Ò]\\¢ƒ#{·aØzÐÝÅq«¹Fe`Xž[Ú•òT”èz1ïMÛ#dÃ`/AOeXâ(Ù2±ùvôQH\nI¹ARC9<¶:Uˆ•c)$ÌK\nôŽ$œ¹æš?×+d´‡… À½<„pgåÅiÛ[ïBwrj¥ƒ¬»î$ÆWpµb$¶ý»TcÖ¥ßb[xLi×;FI©Q¢‚2x§FF@n†£.<Ãµ~OZD	*¤ð;U9N[ŒíO,ÈÄ¶O\\U\Ze\nêT¶Hù½()\rvÛ¸û “Þ©Ió1cš±“\"·LgåSYº…ôVpO<«û¸”³cŠ¤›vìŽOÆºÐ´°603ÜðÄ\nõëÎ¤ùSröíõù®åÈ,NÑè;UM{TiòFÇ^§<®Bi´¦’¶1NE7µ(ê(^ÀÀ¯_Jé Mƒ{©W/¤°[¥%sÍu°êC7=«)îiK\'¶iP…Ç¯Zl‰óaòŽ PØ	Üpµgg “ŒuÇzV;0 ûTh	Qó`ƒÓÖ¥Ÿ@Aõ 5 A–-¸óRlp7€ÞõŽ[\0tÅLÌ|£»Ž:PfQ“·­FTH±Ü£ƒWv‡ZUTg}@¦/¨Y›iÿ\0¼­ÐÕB¸l]EÝ´Wl#flOZæf¢¸da‚\ris6ˆƒíMúÔþfÐFÐsÜÔ}ªÄ7šNE)àÐ ÖÖ”ŒP(\næ“gñœP:ÐX¢¥8=©¥sÒšJq¤¦!(¢Šb\n(¢Å¥”\n\0u™¥¤1\r%)¤ BQE-1	EP0 RÒ\n`-Q@Q@Q@Q@Q@Q@%-%1Q@Q@Q@Q@RÐERQE\0QE\0QEÀ(¢Š\0(¢Š@QE\0QEEP ¢Š(´RQ@UµFiìi†¾t÷Ú z™ª©)äªsw«’U)©£Dg\\w¬[Îõ³rx5‹xzÖ9ëÞõry5»|z×?ry5èÑGŸˆe	:Ô¦“­Bk±t„¥Í%ÉšPÔÊZ,4É”Ôªj52Öm\ZÅ=*6§ž•ÒEI‘1¦\ZV¦Ö¨Á…w¢™!IKIL’–’€\n(¢Q@Q@Q@‚Š( Š( Š( Š( aEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPŠzše9hÌmÍh@ý+1:Õè\rg$inZ¿­à\ZÄµ`M_[£=+’pmž„*(­M¥•#MÎØö¦I¨ü¿ºÏsYbãÌ9â£\r¿$f”h®¢ž!½‹sH[ç’LãÖ ‘Ój&RzŒý{SWåã¯zÙE#™É½ÉQ´fšæ\nxÝ„±fä>”m\n§ŸµQ\r’QÎî­0c’OãIò”Êò=êEVhð¡wžhÙŽ6ì“Î*¨Þ¿y:õ5;çq sGš]öÊ@8àL\\À[%³»·µKä8D,@Va~`GÕ O1¶ò¨ÎOAEÀ­n I´±#©ô«\Z¼e¤y¾j?åHÔäû“OhWiPTg½`jãÌaÉH—’Ô%v\rÙ6ž¹=é¸Ï½8¨®h# `VÆbàÇ4c‘Hz{Òä‚<PŸ›Þ¥SòíÉ¨‡ 8§Œî)“Ž Ó”°<iÃh\0M\nA‘ÛŠ@0FORô¢$ó%à{Tá7G•ôç4¢6HS†\'¨í@î>~üchÀ©M¼QÅÍ2»9ûƒªýjBIV\'¾:ÓwaUG?ÄzŠ\0—ä	%¹çó™*ñL¶8ç4)É\rÏ^Ô¯pŠ²	>µJUÃšÒºUŠŽ¾k:N‚©\":\r(¤Å‰E-ÆIáªÛD&AÍPjÞBsI‚ggàßKñiw„DìqèkÔlåL–9 pkÁä‹ÍQ$|0ç#­v¾ñhù4ûòVpp®O?Æ¼üNþüOG\rˆû==\n?%Š–è©âfØÁÁ?Ò©A*´{˜á³Àö«±NÑd)Èn=ëÍØîdë’œÀ»Þ—r`©qÚ«†\'s€óê*U‘`€þþ”XDöòùCä—(Ã‘S‰PeOÍÀÇcTÙ#ÁhÏûÃ4íèª¨\\;Ó¹-\\|Ð3¸u Œ}Ú©<&Ýr	!ŽJçVÛ-†FÈëš‹ºílœæ«™±ÊI&9q“‚1N|9%ãÚÇø…XšÜ3o· 0íŽ\rBË2òê	<ü½©q‘íÈÎJtÏz\\¶ÒËóF¤‚;Ò—ˆ—Û¹qŒezšr2rW#“C‘¢ýÓ%†ï›±ô¤kh¶›Œœ«¡§áZ#•÷ù{Òy,Q^#¹1¹¤iàFc\\¡Îõ\'-HR¥ÆV<.rçŸj•ã•Ì†L¯ñ+TE±.e‰JçŒŽ”ÆC$`JQàœŠs3+ö‘µ¾öÚ¬8)ÉUdnTŽµ\0Go–¤š@Â-¦T“¶0µNE,€ª“õ5¤Â<ä•~€TæbWÊT#Ôõ¦R*˜‡?º|ã8<Hãj,qŽ1Ú¥kyB4 F@;V„]àÔªž2{ÓbíÉ!ÙB¯ROZaŠO0P\0Üî#µH#„2™$\0öž$’F+–=‚‚Jç÷\'÷ÈÇ…ÇAK\"yIæqæ¿‡­9£òòÎ¿¼<QÊ$Œ©Ú]›€£·½\0Unm©×¹5~ÆÙ#‰Iùœž¾•–M¸\0õ­\02çŸéM°,ÛD§/‚ÅˆÚ¯Ÿ/xP	Ç^j­²¼ÊaA?(&§ÊÂq€XžqRCÜ™†n•VâC \'Ê3œOd)€\rFe\0Ú4	\r`ªƒŽž¦ªLç(vŒóïRÈ¬ñ…$úU{‰Æ8AÕ‰êhE!’0|í+Ø\ZóÏˆ:Ã~ïIˆŽy1ïì+´Ô¯cÓtÉï¤ ,kœzžÂ¼Zîî[ûÙn¦$¼“í]ØJW—3èrbêòÇ•u#è™ªÎrjiŒUrkÓG–Æ´PzÒS¸¥Ò\nP9 \r]7ápqŽõÖÛH»ƒmŠãôðÞx(3ë]e¶à .9èk)îiw0•Á;…L|}9é¡BŸÇœÒE½nNñš¡¨ƒ œç5*<R²n”EÂ¾zšRK3©ãé@H ÜŽÕ4{_Žý)…a“ïN\0.¸s@	8	lŒgïUØŽ€}êÓ…%d$œ™qP4<\rý\r\rXÔ.HÉ<ÖN©d¥|âpGaÞµÈ+3’:\Z‡Èƒ\0ïÞ©×C’aó\ZB¤\n¿hÐ\\Qy\\æ4(Ê	=ý+TÈ±)^´Ð8Ïj°ÑæqÑ{Ô$¶1éBæO<õ¦ãŠ`:QÞéGJ@\0RñI@æ€ƒMe©ØÁ ÐDIRži¥s@âŠyZm–ŒQ@Fi3E\0¢Š(\0¢’Š\0)hPES\0¢Š(\0¢Š(3Fh¢˜…¢’–…QHŠ( ’–’˜‚Š( Š( Š( Š(\0´QE\n(¢Q@Q@QLŠ( Š(¤EPEPEPEP0¢Š(ê–¦58Ó\Z¾p÷HÚ sS1¨\\Ò)äªsU¹*œÆš-·\rb^žµµpx5…zzÖ°Øç¯&¹ûƒÉ­ËöëX“^•¡æbQê#R5Fk­CIKILAJ))E $Z™M@¦¤¥£DÉsQ¹âÔÆ4’)²3IJi+DdÄ¥¢Š	\nJZJ`”´”\0QE€(¢Š\0(¢Š\0(¢ŠQE\0QE\0QE\0QE\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n1KŠpZ\0@)ê)U(É­;])ß\r)Àþè¤ÚCJå8byrkVÚÁ‡/}+F;á\\&\0ÅIuÈêMbåsT’-° }ÑëOtU^G­&ãýïjL+	?‡J”‡qÊr¤ªÐ²€p\rŠ	äô>”ÕP¯¸óUaç’q×4‰¶FÜA8éHf%äêx>Õ4EŒ#\0ÐŠàã8æ \"v$|»I©¥;Wj÷õ¨ÝŒpñ÷½i\0F‡%IEMåëê*´Gb¨ÜI=O½Y•Œj:ž1ÖŽò¢Ù÷ÉcÛ)¢Þ=ìÍÎ5%`\"ýá‚Æ¦Ê‹Žì2\0ô¢À@ˆ…€Ü	â§\nc‹fY¹^‘‘‰lô§–-ÌIé@´žLe¤…^z×qre¸™ñ÷ÏÒºRU‹J™WvöÀ_zä$cžHéWD™ià¦šÌx\0sNQ•$Ö„õ=©ÀúQ’+NÛµ#\'µ\0&0)ñu%—ŸZjrqëRÁÆiGÌ0jXÕ¤\rµx&¡@ÙñS¡%¹lg®;Ò*…ÀõÍ6#¾B]€ŒsZVP4Ý¨À=óH4ŒX7;G \nT(›˜§˜`Ç>µ!ˆx\0Ú˜Ñm,IÈÇ½;…ƒ±ídÀÇ5$1ü¤¿\rŸ»H>X¾ù\rèE\nJ€Ç°ëHd3€UÞ¨Ê¸SW_yÎãš§\"œgš¤K+RÑÐâ”U¤Æ:RÐE\07¥=N\r%-\0^·ŸnK<Ç˜„‡‚+=ƒZVÓd85\r™ßø;Äÿ\0Úpÿ\0g_Jí\0Tv8?Æ»èe;WpÎ	¼â9!œOmu9+Õ<âXµ«ŠC²ú‰?|zŠó±8{{ñØôðÕù½Énv.áNÿ\0áÏÌ{âž€^.TôÈê)‘üÃ\n‘ÔS–fO—€lWÖL­§Û}h,p²HƒœüÔÒÀ\\õäbšK¦U°})\'Ô,V{å³™ÂÎ<¸À ‘Á§ý°Ü7™+ÄÌààÃµWºÓa¸IÌ`Ojçn,µ(QÒÉþ^˜ÏÞ­#g£*z£²ŽERB‘rEL	ÈSÀak˜Òµ;¨ÂA{n#qÑÀ$c]\'ž¼¦Ò§±1JJÄ´ÈY\\2®Tõ5ß*nÇÊ:‘W­¶*`r{i%¶]¥£VÁì}jBú”Ó†P².Xd`Ò©_1‘ÁF\0Ž†œlE2m\'aåG¨ÕÏ-£`Tœ19¢åh$–³ÆÙ†@Ùç‘Qù“íÄÑ¤ uÀÅ9–x]]œt ^2³+ÅÞ¨É\"¶´,x<\ng•>J#«ìë ©ZU’0“ù}zš…–ŽFeîš ºt-æ/“ŽµRkt\0É-Á\rœÇZ°†É\"œtÏJykfÚ˜wõÈ\\z¢—\0±v>€ð(eù‘Ù#ÏFI5mš(þä,PñÇj J2í’ÔÀ®–PW‘Y›¶{\n—ç6Dà 9Ú&§;]Í?/ð…ªÂeòØ*°sÂý=iÆ)’F%Ï\0ð\0éOEÄ¡²y§—O)>bÃŽ•ø@U>ñ=\r1iAw“«Ž)êyÆìž\0ªêüàà63VaVW‡Ì})¡n6€d`=*ÊymåRX*Š>çy€*Ô[Ž1òªóŸZD1“<®áqÐQºF ’Ø\n3Ç­Nêâ3‚Ü–=j¬¬>eûÀâ‹\Z%åddÕiFáó`®sŠ‘Ÿo\0­PÕ5Óôû›éËG±nƒõªŠmØmÙ\\á>#jÆK¨´¸ˆ Hõ=®!F>æâKË¹.%bÏ#n$ÔlØíR‡$TO¬ùæÙ“Q\Zs\Za­ŒD4\nNô¸æ€ÖŽÔä74¥§d7+¬·Ê¢q‘Óšæô}6ÆŽª=ë¤S¶ç”·4ŽÅ¹¬g¦zã\ZÄ;qƒÇµ7Í \rÀ’F>”¥h°äpM@Å¸söFîi¡¶3’zÔroP¼dçš‘Ü6Æ¡›©­q²Æ<¼ç¯\0Ó\"ÃµÇÍØúÒ€Z%0zàPÊÀîê{\n†É •Çµ(åU[ÍK&YFÑ÷GjªÄÁùˆçŠ2l0˜ž‚›ÑvóRI	\\7#5^v?/ÌAïLE]BÙ§‰Lgç\"¹ù*z÷®³å1€¬2zf³¯ìã‚_8(e=W5Qv%£\0³p¦“’H«>Wÿ\0¥G”…¼Ü|àŽ3íZ\\’™O\"›ëRí¹éLÇ\\P!´S€ÏSMéLëÖŠ:ÑŠ@.r(ÍŠ?\n\0^´{RfŒ÷ ŠZ:ó@\"’¤Å&(<RâŸ¶“\0Ê)ÜRb€E-JZJ(hÍ%ÀZ(¢˜Q@	EP ¥¤¥ aEP ¢Š)))M%1Q@Q@Q@Š(hÍ%Z(¢Q@Q@QLŠ( Š( Š(¤EPEPEP0¢Š(êriŒiI¦_8{ÃZ«½LÆ sH¤A%R˜õ«r\Z§1¦‹FuÉ¬ÓÖ·.OZÁ½=kja-ŽnüòksÉ­»óÉ¬95éÑØò±•š˜iÍM5ÒŽ´”¦ƒL¥”RÔ Óh¢Ã¸ýÔ„ÓsEŠi(¢˜‚’Š)’QE\0QE!…Q@ì%´P!(¥¢€Š( AEPEPEPEPEP0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢ŠZ\0J)qJ\0%(àµbIn¼zš°$@®ÛéÓL7µ}ëJßMŠÜ“æåZ*½«7>ÆŠÊÖö@ ¨ÉÇ$Š¶À¨f“v\náIãš#2=}+2Æ³§o$u>”‘.â¤¹À=›U‚ƒƒB«;WÄÀ‚Ìø\\(éQùR¾‚§,€ÀqÎiw•ÈÝh;“»1Nò„k¹X¶OJzÑ±ÉÏzG.’z\0€†VÚÃðÍ[I‹‚6…Þ©Ëæ4¨ÉÔÕ¸‹Îp=¨—~x;Ó¼·\r±ÔŒõÎi»ßaSÂƒ=£\nžBIì\0)Œd`úTŽ›ºm\'š®‰%’z‘ayT–R\r\0X]±¡9\\ÕjÖ(¤ÜN¨Bñ“ÉöªÛ\0¤òÄ™¥Š%%ˆã½é4$.cÜ1éCUÆ@e9f\' ¡­D!\'àn÷çò¨¤òr]—äÆNOZekòïd‚<.æÅsÄ2¸ÉÉ«÷-Íä„Éå¯8`?J©+«¯a‚}kXèf÷!Î\'švrxéHÈT)$a©B‚NÓÀª †`\rç€(gRFÅ°@xÇ4€hO#­?<Œw§Hîûw.3íN‹p˜ª[<f€Cvç52˜÷®\'ýi’;8Ç^½ªX ’LJØTÏ$šC*ãñÉÈÇZí+„ÉÍ2iVF\n¹Ú:S•äÏÊ£\0RfÄFßœ¶\0»Êî,äàdR[ÎðºNƒ÷‘¶ä8Ï4YøÜIbxæÊ²ŒäœóÍ=U@MÀäw–E~ƒêCƒTà¥0$Ì¥‘@úšÎt àž‚´Ý¶Åò\r¼sÍf±n¹ÍL¥\"•r§¨4”¯÷4u­–’–€\n(¥ï@§ŠB¦¡ïJ84†l@âXü³zlR]i7ñÞÚ>Éc;—Ðû\Z§¥HæµÖxö‘óc\rt*,õø¢Û^±FL%ÚŒK	ê¨ö®Œr1´_>£Ýé©yg)I‚è}zÿ\0…¼S‰-\'îîÔ~þOqí^^#\rÉïGcÓ¡_ŸÝ–çB7† \'N*B‰.Ý£‘Æ\rCÞ	HÛÇ­5ÙdÁ$ö®3¬°°G¸‰€èBÔÛLG{úT‰t#ÞemÉÐ5èøx¤S»ºš©Ã¿,äg98©#‘8YÐÑ4lÏŒÃÁ¨É!„sŽÜP=ËbVO>Æ¦Ë\Zl# œÕ@6º•|cµL_|•÷íLÉT¨%—pfê(”·\nÃëLRã¨ê<\Z”†9a;ºãµ!Ãá„±çœ‚¾•–½Ó$A=EZFps	ÃwV¤Ì§äÜ õÁ¡æ{éîcË\rç8ªë`AÂ‚¾Ù­gó¡AòÏ¿J®ûåM²€™=A¤ÊRe6µ†šI2ÝíM.¶™c:‘œ/&®,0ª¶ù¤œîÏJ•!}¡XqÔôÔ!óÈ’ÜÄ®Ä­ÈSSÅjã*JŽA«OnþnVLþUi#Û!iemÍÀU>´î+Œkv/·~i…\"7^H’ÀSådHÊy„îê*¾ÁfýÜKÔ“ÖÌ1,…YzZÏ’wÎç\'®ÑRÉqx\0\r¾¤â«I)qÆpÇšh#~ñ¥•v†åTTö®òÎÙÈõU‰v]§.x¨£\n,i–|€©ª`X‚pN:ëVcy%„+€€ÕdóÇË„ûš²\\©RÄdô$±ÌwäôR`PÈÚx$sSÊ¯°ž½»\n¦ò…@Š>´Ä1ñ€ có¯?ø‹¬dA¤C&@ýìØõì+¸¾¾M2Âkù@òãŽ}{Î¼Bþò]KQžî\\o™÷éí]˜:|Òæ}L]NXò®¤+ÀÉ¨©ìxúT,Ù¯Póšmš:ÓP(´\0µ,\\!85\rN™8ô \rM!	¹VÈô®–&Ä™\'ñ\"°tX¤ÊŒõÐ+Á8È¬g¹¢Ø”2î8à·\"–HQƒÍFŒ€)Œô­I#•%ðJŠ’ˆXÃ\'i¡Ê>äáZ“ÌŒ$a”úg4Ï,ù™p6“×?vŠiîb´‰bNzòi¬…÷ôíŠ˜È¡1ÓÔÐ1thOÌô¨¹ŸZù’.éOËž+a~Py dLï½ÃcŸjÐ?\'¯=ª`›\\I·å\'½$Ë•fÏ§­+2\'µZî\'©L5sh\'a&–\n6\0=M;ØM·6K	—œð¸¬éyÇ¹¨¢·\'†ÎEemÌ€85¤^„´Vh6®HçÍAÎ_™kã«íÇAÍ;ˆ®±3çãÖšG¨©·Ç˜àç>´ÄFzÒ\0iX`Òq@\0úÒg\"”sLíM œšJ@”QÖ€(qE.M!4\0¸¤¥Ç¥ÐÐH¤\"E #¤©1šiZ`6“´Pw¥¢Šb\n))i€QE\0”QEQE†QE\0QI@IEÄQE\0QE\0QE\0QE\0QE\0-”P1h¤¥¤EPES\0¢Š(\0¢Š(\0¢Š(\0¢Š)\0QE\0QE(¢Š\0úˆši4ãLjù³ßÆ sR±¨^‚‘^J§1«rU)©–Œë“Ö°/ZÝ¹=kŸ¾=kj{“=Žnøòknµ³|y5‹7Zõ)ly5÷ jJSI]ÚJSIL¢ŠJ-”P©(¢€ŠJ)€QE(¢Š\0(¢ŠLaEPPQE- Š(¦ ¤¥¤ AEP ¢Š(\0¢Š(\0¢Š(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE.)€” ROT,p&\rSCo$î5É«¶š[Ë†~¥mÛÙÇl3Ž}ªìZ…Ìëm \'3|ÇÐv­ãTÀÀéSÉ\'$Ú˜²’Ù?¥gv÷.É\nä1+ŸjzI°\0Iã§JXQQUrz“@˜€1Í –\n&@ä{Ó‹|ÍŽû¢ŸŒ&š]¨@n*@‹*òÇq\'8ô©$·\0àžÔó¸œõ§$jÀcÁ EU™¹Û‘Rˆ@^[-Þ¤Ø¢O”õëïMu\nÙ^½1~ç$üÙã”™FONÔô™_’sŽØë@÷g¯P\0¦P2¹\'=*Bw à.çFà\0ÏßúqQÆˆÄ¹,BóHc·9…{Ñ´2ýñHpÙVõ§D¾Yi<²F02x¦ ˆ?)éÉ«QæS´0«fªm \rÇ=jkx‘f(„üÆ!Ð£™Äqå˜¶š³4‘ãPÆH$w5Ê’MŒŽi$+¹†Ô\'\'&€ˆö“¹‰ÍVÖ^}\\$!UqÎjQÝÃ{ò+Uó$œ¬Œªˆ»¹¡jÁì`»oP¸Æ:ŸZC€£½#°,@õ¥ÇËí[<ž{SíäiBâ,õ&Œ§dJ\0wy<úRää1A?wô¥,Äm=Ï4\Z]ê$ã¥=rÒPI5\0\rYµ•!bÒ)$Œzö Hc«Ø~•a‹¬A[•¨,Ùn¤äR™¾\\ü¹¤2F;p ŸJ“~ÞT c5ÂÃ$þ”¾[òXìÏAH	íÊîqÎJqŒ›v|ô8ÚzÕxö¢–Œð*E#9É b2°Â¶zt©‘­¾òªŽÉ£!Ž7÷8©O2),Jj\0aŒ´„sýæªR*ŽœÕù^t\râ\"c–N™ªRŽ@#\0ô¡	™Ò®9¨ÇZµ1çÈªØ« )h S@Í.(Í:\rÅ(§MÛÏ4zœz·ÅMS§«hh\rØäI”#cš¯·º5úÞXLb•OPx>ÇÚªÁ9FëZÐ˜§ˆ†éŽµ›F‘g¦økÄ6þ ²Ûü·¨¸žßßÔzŠ×ŽpFÙfÞë^#·šüwú|¬Ž{c^¯ x§Oñ=©“Ëò5\0?{\0<gÕ}«ÌÄaù=èìzx|BŸ»-ÍÌù¨¹dN2{ÓVÌ,­·jóœÖ™(ÉÃŽv“ÍFÆb~F\0zµÆuú ¬[wï:zRÉ\"©\"PO?~«lUùC>[©ÎjPw“6Tp	¦+,`‘ËÎjx&\r	ŽdÜÃø³U\r¶Ö,²8v©7íeSÈÈaÐÐ\'©i$p­&ð:TÊfŠ?:Ûlˆ\n±ëU#o“!C)ïÜP\Z0[Èl÷=è&Å×a3!¡~¸Z…Ê»$ŸápÝi„¼ŠràqŠˆÝÎ¯µ£\rÆAÍ\0‘3«yLý–niqò¤¡_@sQiNc‘Ï\'Ÿç¸}­ž1–îhU6 ØŽ HË!\r™ÂîGJ°_•Oª•ß!UÎ¡â	]<¨¥%ÏñÔS	 ;W|`±=)ÆY_1Fc{=i,\"¤›ÙýzÐ\Z•åš(¹Øe“ÐzÕ9dÿ\0ÇÇ9òÅIqu\'j÷àw5BGšgÊü€‡š¤ŠDn‚îA##\0‡å¹¥Ãù}:MI±ÙpÍòã\'´ÀìÊÁ88úÓøC,ìÜŽÕ~Í>_“ÉíT£%8N¤c\'Ò¯[Ä!!Ù·±•&K,©o¼NÐ:â“ÍL†dè}i’I$ˆé9Ç­BêJ\")úæ$=¤yYÈ%YŽ q2€eëž´üL)À_¼Oz«y{•c>£;º·?yAT“nÈ™4•Î#âF²1p§ÌŸ¿a\\\0ùqS^]É¨ßÍw/ß‘‹cÒ s^Õ\ZjQ<jÕ9äØÉ5ëOcL5±ˆ””¸âŒPÒÒRÐ\0½jÄ\\°^Õ€Z¶4Í2k¸žh×*I¤Ý†‘¯£ÄñÆ[pÇ^jÔGÜ\\Ž¯ÔQi$\näŒuÅ5²ù2¹ÀÁ¬^¬Õh9¤~UÍÎd…ÇÝ5	b$ÄkV=ªHÉýÐ$ýÒ)Äa`	Ã{ô£Ê|dM?ËV@HÉô=©±;\0ÊÙ9ï@„Š5PÅ˜‡Î1Š”F€äò\0ïLÀ3§ªNòàcŠa~ügæÊôÚ;RH»@\\çµ3˜ÈYxãn:Òy¥Hë“@\nù*6AäQÉÀ©L;]LÓ\naÁÝÖ˜Ìœ}ê*¹äûU’å—qÏ«6Øß¦êM\0Bè·)\\sÖ©ÞÚ¼# ƒW·¸#¶*9ÄÆ-¬›‡sšiˆÅ’FwÜù$Ó$œqVnÆzd{RT m­’*É*H±Œ˜ò@îiŒ½{zT’«ËÀšlQ±ÉpQÎiˆ€¨9#·jø8Æ*pSaR„¹9\rž•IÅ1G¥¤\"˜hRÐŒÑÍ¸¤sK’x£ú\Z\04\0r Šo½8ç<Ò@\0Í-£4LPE-%\0!PM0ŒT™£ŠEŠ*VQL*E;…†ÑE(¢Š\0J)h Š( Š(¦E†€\n(¢.)@§ªæ•ÊH`b§Jb>”¹ŠåelQS2b¢#Ó%¡´RÒS$(¢Š\0(¢Š\0)E%\0´QE!…QLŠ( Š( Š( Š(¤EPEP0¢Š(ê#Qµ<Ôm_6{èª©š z\nDU)ªä•JnôËFe×zçïZè.º\Zçï»Öô÷&{ÍïSXòõ­{ß¼k^µêRØñëîBi)M%nrˆi¦œi¦˜	IJi(QE\0RÒRÓ\0¢Š(QE\0QE\0QE)i(¤4´QHaIKI@‚Š))ˆ(¢Š\0(¢ŠQK@Ð”´QAV\nJZCA!EPEPEPEPEPEPEPEPEPKŠJZ\0JP(¥˜)@©aæp¨¹&µít „yœµK’E(¶g[YI9_S[v¶A esWD(˜zTª<=k&ÍR\"P`zTÌ (ÉÏ•FãÓ=©áÛ8ÂN´†8¢dmñR·!]ÛÀ<!ÈSÁ9äÐNý­Œž¢˜Èà®IÀ=©ÌÎ©P<óO_•T\r¢˜…Îç\nN/\'Þž‹¹	/ÀãëQ³ç `úÔ±ª69ÛƒÒ“¸\\à~t |ÿ\0/§4ã«¶	ëÉ ¤ºŽ‡4Œªíœfœñ*\r¤îÉÏ4Å+€	ã®3Rlà†È L¥¶ã°§F9æéNœã…#éLÝ”å‰íÚ€¹+Ïh\0L¶9â˜\'_/fÎz)BÜŒ•èN)†<FHàtÉ¤1†FfžHKHØåsH³1˜ÇÈ8ÇSJò¡8AàÓiQˆA°)àšŒ,›™NÖÀ5ýò…,I5dgi@=‰¤}¼†b»Ocž´â%t\02àžj\0ŽW?Þ<ûÔÃzã÷xÉãš\0šXæ€]@Œ\'Šáµ	$»¸’w\'æ<WK­Þ²iïndlk–‘ÁùG\n;V]I—b\r½;{ÓãŽFS\"ÆÌˆFãŽ,›[#Ò¦SÃk%¢7îœ†`;â¬”00bÇ6:ÅDB•ãï´ÀÓÖ“Š(ÀÁÈÍ?ø3ÆšSn>eäSäe%B1Í\03\0°ŸJF6ýiˆÉ¹qÅIóeZ9+ÍÇj–<+—@/­BåJ,`|ÝXÒ\rÁ0;Ò{eyn³]Ã\'æ8“6çÆp;â‘Õ£FyëÅ\"„ÈÜM %ZeUo•W¡#¥,LªíœaGSÞƒ³É/¸žÝ1MTln=3ÆhbÙyyÇv©!E21ŸÉ1AšC³hÏe©2©¿d„¦;ÒyûyrIùXð@¬Û€ZNyÀÀ5zé“lJªÀ€7ÜÕ)Ä…X’¸ö4Ð=L÷É$P¸\nx9«\'9ÀÈQðH«!‘Š^”‚–˜…áMšx¤Å)¦Ž´îôi_CKÔÓ±IÚ€§vÞb U\0{Ô¨qÒ“\Z6–T67Z§›*ú;Û)r!Ê‘üEÅZ´ÐÅt›	Ç½CV)7º=Ã\"±ñE›‰%ú’`5¹þ/ö”×EB@ã¨ú×ƒËou¦\\­Õ£²º6VE¯YðoŒ ñ ³¹>N­ù”ýÙ‡¨÷ö¯7†å÷¡±èÐÄó{²ÜÝhÙXì?iK…\\àr0G¥L““”~›[Š‹j\rŒ1ëï\\w;@	cÛ³æˆòGzvY™×9PÃ§µG™bÎ¨¡·•Š°4\0ó¿fPí=Á¡]]7‘°“éÖ žK„bÊ’9Í2)äòÂÍ0#ªcåüèdžR¯ÈÃ€@È4=Ó«®øò\0ä¯zl$mÃHG¦E=Á\nylÃb€=Èbð\\”r\nöô«KçmÉ»ñUPÜH º!ãíÞLdä¯Ò–ä²W¼eåm›ª“ŒûÔK!m±ääçÆ¾ˆ|¸ ã¿4Ù)FòÙeè1Øt¥d\'|™#“´`UiäUR£=i$rP§–yþ,Ölª‡ælîéÖšW\ZBÎÈ÷É×q<\ns01…ÇÏœ–ÏZŠ\'äãž*ÁTÜ0û›\0Ul6G¸à®~\\üÙïK±¤Â&;\Z“Ë2²6RH¢%Âü¹\'ß¦)\0±ˆ­——Ë–Ú1ÎjÒIŒF9êÆ¢	7°ÛNMMnžc=3A \nV0CŸâÇAJÀAº<æB¹æ (U+¹ŽIÍB8s+“Ç<æ\\rÈŠƒœ`w¯9ø“­$·±è–º+žfÅ\'§á]¾¿¬\rhê%¹ùvè¼{þ¼LÉ%Ìï<¬ZI³1õ5ßƒ¥wÎÎ][.T1WhÉëQHÜÔ’6=*»šô‘ç\r4ii)ˆAKE-\0P(Å\0:>kªÐmšxG3*ƒ¹À®b,c½uº>a·ß÷\0qÖ¢{\rËâö++•Žè±ÎÐÝ\0úÔ—GÀƒ÷JzW5ªN²M‚KLô«º^¬·¶×!QòZŽ].]ú\ZH\"O›2ò1Š´8åG!GZ]C\'ýìš–\"Î¡S\05,bH»T·vÏ\"£%Ðn#ŒR•E` ƒŒšŽX•îÏï¥ ÷(6íÏ~´èðÀ—Ã)\0ïM9X1’Ý(Ë*íäsÏJl+Ž\'SQÄŒ¯ó®>µ*f$ã<ŸZlŽGÞêh\0‘~PI=ÅDˆÀncÀ©L»£ÈNW½#Ã*>S@ïg*²0ëM“çÜr¿7µ8Æ\nðÀQðc#À÷ ­|´;~n	ë¯3ÎÜHØj7ðsŽ~•ÊŽƒq\'ÔzS°	t!ò:‚Ç€}ê“JV ®¹lã#Ò®-ºÈHãåä\0)/,ÓìÌëÃõªZÎ««H_€x^æ«yl	<€ja„ ’zÐU²Aoz¢H¤Ž%*PœãœúÔ2+A&§òÎî}iŒ«¸ž½¨¦\0?6EFØÏlªð»A¨6Ùª¸ŠÜæ—éû	<dÓÁÅzâ”·ËŒSG\'šw\0n8£¶i@”€Àg=éxÅ.Þy¤#Ò\rÎ)Eõ¤ 4gµ¤Å\0/ZNô½x š\0LÒç¦iZZ\0B¦ÅIÞƒŠ\0ŠŠy¦•4ÀJ(Å(¤Í-\0QE\0QE\0%(¢ž¢¡È¹«QCšd)“ZpCœVR•éÂäIoíJÖø¦qM’0cÏ©Óìô1%‹ªn¸­k…³¥ÖÑg-HØªi)ÍÖ›Z£QE1¢Ž´PJ)( ¢Š)(¢Š\0(¢“4ÀZ(¢QLŠ( Š(¤EP0¢Š(êQ±§±¨˜×ÍŸ@†5@õ3T/AH¯%S›½\\’©ËÞ™HÌºèkž¾ï]\r×C\\õÿ\0zÞ™3Øæo~ñ¬yzÖÅïSYýêõilxõ÷ 4”¦’¶9B›N¦š`%!¥4”Ä&(¥¤¤ÑEÀ(¢ŠQE\0£´P1(¥¤ AE\ZCŠ”\Z(R\ZZJQE\0QEŠ8\nE¤&(§bÒÓHiM!ª%…Q@‚Š( Š( Š( Š( Š( Š( Š( ŠZ)€b— pM]¶Ó%˜‚ÃjšM¤4›)ª8PIô~ÛLy2ü‹Öµ­¬c¶e)ƒ“Œš»,6æçœ`\nÉÏ±jx-áÆ¹ÇëR©c’Ý}©ÀNß^r)êàçÔTÆ8ëëV6Ž:ž:Š…	+¸)ûÝML7cœ~]‚«ãšÈŒsíS¬>`äŽô4J®ÛH*8Ö€d2±Uôïš‰e<7,àU™S°îi6Ä 9Ç\\Ð\"·šÌ€íËgò©|›wa¥8mL0l{Tà‚ˆÎH¦ASvqëS¬ .ò~‚¤Ž4)…^z’{T˜<aëšC)¨f˜Ž¹©lµ›\0žÕh¦á¸BH\0$ˆâéÔžô€¦\"V›¯Šz\rªË‚¸<TìÌ²c`ã¸¦I¿i,¸ÉàÓŠÒ!fÇæiÊŠ‹	8© G#îŒÕ+¢ù€L¹ùÇj.êSÄÛpc©.Ð®Ãnr\0ÕÕBÊw£SDº<©åœR¸ìUùÂ\0	÷¥È$ûŽµ3E»÷¡¶‘Æ*TÚ£*ß¼ïÇA@b€bUSœ°äŠjì¹œæ¥UIäÓŒjØù±‘óP\"8`k‰&æcÐ})ÒÈªGméÅJ°´r*¬å@‚&«_<PÁ$þa&5áOñ1 g7¨Ü‹Ë‚Š„y|¬¢€JóJZy$‘ƒu9jˆ–nr+d¬f=X¶zôù\n¬CnsÞ£)°ìzSB—cÎ3Í1Ûû¢ÄóéG>½{SNx©\0$ä(ŒNGrOËøÔ‘£HvŒdœsÒ¦û,¢uŠB¨G˜À|£ÓšG\Zm`wc>Ô¾Yf8\'êha#€ýF¬OÌp=})\0ã¬{ˆ=­9î06óøÒ“1EW¢t¨¦CœÏjËpÒÇ¹ñ’rÄT0vÝ&á÷€©ŒŒá#Ð2‘0È<)¤1ÐaI,ÞÙ©Z#ÃJB–èÎ*PP7\'œ`ñO+\"Cæsƒòò(BŸ/÷I<ÆœR0Wb1rÇ¦i{yÌAå_J–X§µXZM…_æ@<{úRµÉÝ&#f|u$TrDv‚09Í\\Dˆ¹va‚{v¥ž\'PØm~ƒ<š.1æŒ¯Î;ôª’dòÆµ§ˆ‚T/8çÚ³¥Œ€sÇ§½Zd´V¢”Òf¨‘GZt¨Á©žiT€)Lf“i§Ž;QÛ¥\0Gƒœ\nrÒ•Å ãŠ\0x\'5f	¶7Z«zQòž¼Ð3z7IâØÇ5FæÎâÆå.¬Ý‘Ðå]x\"¢Šb:qZÖ×+\"l~sÞ¡«™ÜøKÆÐø>Ã«ºÃ©¯CÂÌ?¡®²KfÂ“·ž¸5á—Ú{ó¡b®§*V»ïxð]…Òµ¹’+…a¹#†ö>õçâ0ßn}Kødv^dŠb<¶éž¢˜¨	ÜÍ‚n•<±—&9W0r;ŠD# rÄq‘À®¶ågIçó2ŸÜ¤S *Aê=1V0©òŽ9ozb‰çZqÂ@øVv;S•Ê\'”òòÇŒÓ_cHÀ²À¦¶ÌªÈrÊ84/Ú ¤„`ô+Îhk™0D(8>µˆq”*lÒF²2€LfOÒ„+ Xåï=G$¨ò.	Å+Í¶B­\'$pqQ¼`üÎN;S)•¥œ,cµQ§Þ9^õdGlÄJÃA¨ˆs.O:Ð€ƒ†ÛÎjeU€ƒ°’yÉ©§*£ÔÒ&$c’À/ô¦W÷çsð3€*\\ùIÊ’s€#Bf‘G*«È\"§*ŽsêÆ€«—Rx\0r=é[vÒà“Éà†5.{–À\\u2í#”u<R$®SlfF`\0õ¥2‚#\r±Æ2\\úw§0Ü[qÊ»ï\\gÄÑmI3×?…;Æ´¥MÔ—*2©QB7g#âï¿ˆµŒ©\"Òß)\nö÷5†HE4Ô\\ö¨å|ñ^Ô ¢¹QãNNNìÛ\'­GJM%h@”Rô¤ ¢ŠZ\01IK@äŠ\0³i<Êƒ’k²ìÚ`Ë/Ë”ŽµËØB^ú1çÚº}H”ÓÎp{ÖsÞÅÇc˜¼pÒ;w=1UwíˆŒa³Õ$§,{ÓEI2U\\`ä7­XŽ—G¾[¨<§ H¾§ï\nÕTp	PÓžz×\rÏ‹*¬œŠë,5%»dWýïñät¬äŠNå¸åc¿æ\r×ž´ÖÜ®ÇæäP\Z$H?+g U‰J71ÐÔb\\oc/-ÐúT2##ðU²sœÒÀüª¥zî©6yÁ—ã¨ô bm,Í!aÆÐi0Œ3æ}F9Ö6Æñ·¶)² Þ	lëŽÔ\0È‰ØXî\rÐŽµ**À†éÅF7Fg\nÃúÔŒüàŒg± ,Bp§<íïM–2Äû§¡5cxxÎN	ëÅ@ŠüÇØÐÍ¡ ÀÔIÕf~3V¡ƒ¹ÀéQ1\0Á=¦\"ˆy2wc¿O1ÙåŒŸ^´I7\"2\nœòE>ÜÚ­Â›†\" ß1z˜×¡nöª¹99ëžkfÿ\0R¶¹G‰‚\'ÊœrGjÅ)å÷\'Ò©>ä²VLÎE2\Z&$(Þž›ŠŒO¥Fêàtç4À…ã$ä\ZÉfÉÆqVöç“úR³qÁ$ô¢â*}š@ä Ëœ\n¬àžjï$Y###U±Œš¤}J3šSÈ¦‘LCÁÅIÀsPƒÈÍ<cµ \"[µGR„ÈÀ$ûSÒxÛ3qÑXu er\r Z~ÜãÞ9>”cš3“KL\0\ZRZLÑœÒ¹¢œ#ÞñÅ\0i9Ï^)E\0cŽ´EÐÍ0©&x£­\0EŠ*B‚˜TƒNáa(£¸ BQKŠ]´†Š•0-JƒšM”‹¶ëÈ­kuVTV¤/€+š¡ÝH¾0W˜ŒR™xª³ÉÁ¬¢µ7“Ð§pÕ›)æ­ÎùÍQ×TÁQ‘\ZJSÖ’µG;Š(¦ ¢Š(\0¢Š(\0´‚–…Q@Š)\0QEÀ( RÒ:QE%0Š(¤EPEP3éÖ<ÔliíQ5|Ùô#XÔ-R5DÔ†J©5Zz©7CL¤f]\rs×Ç­oÝ\rs÷Ýë¢žäÏc™½ûÆ²%ûÕ±yÔÖD¿z½J[=}ÈM6œiµ¹Ê†–Š\0m%-%\0%%-Ä%-P ¢Š(\0¢Š(\0¥¤¢€Š(¤0¢Š((¢ŠQE\0”´”(¢Š¢’”u¡ð)ª*P*4HaÓR‘Q°¡1´0ÓM8ÒU£6%¦’Q@Q@Q@Q@Q@ Râ€ŠP*Ä6SÍ‚…õ\"†ì¹_nÛO–à‚~Eõ5©o¥ÅÁgìOJ¾AŒ\r›KzÕ›ŸcEå,#·9ŸSZQƒ³îñQ(Þì<éR 2LW•AÅF¯rýÆÜ2*T²’W8¤ÀFÚÌ1éLˆäù€àg¦)\näû2ÙïÞšT£|¼çµ=¤`\0Ç^sB»*•M¥sÚø*©’zT­Ù\0SœsëUÄ²í ‡ó©AbC×­\0Iå¶B©âžÊ¨…Wæ=Í4E)È:þÒžZÍøR	·*Åö÷¨dQvõ§ì\\!<7§ ¨<äF	æ©\0ØÜ|Àœ“ÏJ›|Œ\0H]ÕPdp}M-¼ì$g¥4‚Éå/–ï†åƒåRD’«±2p8\0ŠŠ)6æÀ¥LI-œãúÒã8‰@;œwö¦3¸@@\'°§å³–äc\0Ô_oË’})\Z‘¸ÇwcMœÊÛÎx\0t¥òå?êÀ9$ö©<·FÈpK½©€°ÆÉŸ7€GLÐæF9N„“P˜Ÿx,3žµl¡D?0ç\n”\"%fhf’Ú±?8õ>ô9bªÞ\'54‘‰cÄ³å·­!•£C•ßÆyÉ§›ÿ\0Òœï†Wb–]ŒAÏüQqIl\"0’à£|Äç‘Iåª1rC«4ÉÝWyÀ\n‹Ú¢+!aÆÖô\'¥bË Â•l±éí\\æ·z‘ÏªdÉ•û}+ZYM´2Ê]U”dn=ëºóžG;¹ÜMTUÉl‰åWfÇsQ…Ï¦iÜ€£žô¯Áô>•©ÝØ ¨ÈdóÞ„Æyâ¤dòúÐp)7àŽ*Aœ­F=Å\0X]ÆuúÓÚöãÊkf•„,Ad	)$“|@³ã…Ç@*÷¤1Û¤\\\0=…H¨NIäÙ¥™‘ãhPG\nE~”‹„Ùœ‡ì4û(7ÌI“aA¹sÜŽÕ$6ææí¤F–@K†;BÉäÓ$Œ+¸V%AÁÇ4†6c4“™\'ÜÍŸš¤*Œ#4á¾þxÒ™ÃýìÌ:v§£ìw ’ÍHXðèºœö¥s’\\¹È=²£‡.¼ŠtKYprô4‡,ÄÜŒ‚i#‰§,Çp\rXFøFXôÈ«û8gA³o R¸IÉÔeÜ$ç¨«Æèœ¡xù¹­%2²,AOE§KÃíÆ_¯°¤ØXÏ–Ù– \rÇ®k\"êÑ\' tâºFŒÌ¡V@¶GZÎ¸ŒÄªq8È\\S‹Žm¢ûÁ¸b8\\‚ÁEhµÃ%êNø.=8¨uI#›QšxSdr1`¹éšÔÍ¢ 5*šŒTƒ¥1\nzôÅ1zÓÅHÑ&3Þõö ~”¸€\Zxhô4¸…xÅî(ïŠ\\RÀÅ §§ŠF\\có¨TsRyé@ÍK{ T,™\"¡½Ó–u2Å€Ýxª¡ˆ5£i9#cÔZÃGEá/ˆZE‘¯Ñ)ÛÖ2È=ÔW¥™bÂ²7š¬ «/B=kÄ¯ô´¸@Ñ•\rŒÕÏxºã@¸[H´–9Àn¦/§µqâ0ÜÞô7;(b9}Ùž¹½d·ÂÃœTéÝP¶ä8Áä¹†â’)R{yRXÏÃäù‹)ê8ë^sMŒlÉ·«‚ìq‘Üw¥e †W=Dee8Ø;iT#…*Hž”˜\nIæ;ü©Í˜r€Ÿj²c\0mó£5šE—øvN¦˜\\¨LÖ¡iÔÈWccýª´gÄœ§^j¬Ž¯–ÆHô„R—\nIP¨§n2i%V2b ¥1ÉèW\r(B^ôåc·1ž½iˆ#HÔ‚ÄuÍ.ÐãîÓÄlqó5(ýè\nƒiÐ“£¦˜Ë0Á;\0æ¦óŽ3Mq ñž´…q±¤¹_”t£požRW=8©qúSDbI1¸($žŠ;šb¹CRÔaÑô;RãåD\"Sÿ\0-$=\0þuá÷3j7²Ý\\9i$mÄžÞÕÑøãÄ?Ûº ´µsýŸhHŒvvîÕÎ\"ôæ½l-g½ÙåbjóÊËa’0A´UF95$š„ó]häbu¢–Š`”Q@-PNŒÉôÓRÛÈÐÊ$S†Å\0mx|w»²ç«º•áex]pcÖá aŒÎñolåGsUµ—>sHÊ&²ÞF›#nŽ•ûÃŠ•Ÿsg\ZŒŒäŠÐÍ€™ššÎé¬¦©?í(î*†46Âß&vçŒÑ`;‹g[˜â,ÏRzÔà•YåþuÇéÚœºt¸ëpê}+©Žæ)cY\"9Fà{VR‹FŠW&n%À_”ðO¥F°|¸¥9À(0&£TbŸ3;Š”;ŽeR˜§9¨#ÔsSÊY¢ÛÀêT*0ß‡JrO-Š)gR_jP¿J•w:ü¹ÇJ‹Ê`	•98ô¦\0U‚üÊV˜ÑîˆqÅM#yŒ¾Y<šc+)òó´f€ ’Q°vœu¦™\ZvØÕ#Bºdµ‘ü=E1J€H9F\'“Ö™Quf/èjO–AæpXAëP´å˜(ŒdL-ºõfPÙéš»5¬Kfå-UaÚÃtªzÕi÷F<úP\"¯œÑ¹\0Âœ“ï\\oÏáÞ¬<ÉldÈ£ŸzÎ\n@À\\UhÅª4Ô\06²‚}N°ÆcÛ·“üU—nÂ=Û³žßZÖ„Ç…V|ü¹À¤Æ†­;@ÚÙG&³®­UXðÝ8âº„l0©¦]Y«GÔõçŠJVŽEád#Z…­k«f]ÀŽ3œVc®Öæ´L†¬2¬[\\}àÆ¯½qóãéUØs@ð¦\"ÂH+×ÞžñÈ®2j$ÍXWïš@CÈê*\"9«l7ö¨]6œbw¢œF\r\'C@…­ÇJniåÃi€ÎiZyÆ:Òô¤Ž)\0£§¢€#§j(Å\0bŒw¤Í(4\0f€s@4´\0ÖQÚ€™¥ïJ(¢#éN\Z’)0pzV„¤Ë” ‘Ú³”š5Œ¶3|“OXˆ­o±ûQöLv¨ö†ª‰F5\"®FH§}Ÿá*®k´)~*¬ÏVN*´ªhˆå{e=j£õ«rŠªâº\"qLŒÒRÒU™0¢ŒQLAEPE´\0\n(¢…Q@Q@Q@-R\0¤4´”\0QE\0†–Š(\0¢Š(ôã\n‰…NÕWÍŸBˆZ¢n•3t¨[¥1•äªsµrJ¥7ze#2èðk÷½nÝw¬+Þõµ=ÉžÇ5x95“(æ¶o:šÈ›­z”¶<šëR±¤4¦šktq…QL4Úq¤4\0ÓE-%1E%-\0”´R(¥¢˜	EP ¥”PÑE†”´”\0QE%\0-%PEP!i@¤õ¤ËCÐT SPT¢³f±C¨˜UƒÒ¢zI\Zm8ÓkDdÄ¢Š)’QE\0QE\0QE\0RÐ)€b— S€æ\rÅY†Æipv¾¦´´û8ZH÷.sëZ’€©À¬Üú\ZF|:RB0ÏÖ®¹\Z¢p*x€h²yâ€‹×ï¹v°Ä 0éÞ–IS<r=qMb2Ã­@da^(È,ä\0‚3ŠqWÙ¼==iØçƒOÀc¶i€*@<ž•a#‘Ab2½3QG+4’Œ/J”ÈÞJ§lÒQ\Z‡*Ä1Ç<T5Þ¹ ç½?Ûqë“Ò§–%Ç8 $JÊÇ8ÇCëO	=ÑÀ´Åà-IÑøãéH„ÎqÒ˜±”“ëSA+FÌ«œm?JI.ÜwàÐŠbÅŒŠêqÍE¹`œëF7nÏfâ”F­’Ã\'9æ˜üÇ‘Ï\"¦TÜy=NJ‘q–àUˆp°3`õ4\0@»pAí‘R¤a_°\" .Î›˜óÖ¥ˆÎOzC%š+UdÁbÊ¸8=M@#’I¤»yéÞ”Žø¦y¢Øî—ŸÌP!J0rÉçš.%‚VË’ƒøQjI>iŽGlÑ\"+F\\¨Èâ˜Ša:°faÔTðKó`£`ðIíLˆ\nž•*\rÖ­)\'w›³ðÅhfÆC€XóúT§rcp!qÀ¦DÇ{Â„bK99;±Ï¥!…»³#+%¸QŽ”P³gÔŠ‘ÏÊØãŒT–ÊE<†<ÐHÉ-O³B±OÎÇ =©ªŒá†r8;»TâW¥@r€´ôª±ÈÉnÎ=qÚ˜>(ºòfŽÍ0J€òcôÏ¼­#–ÛŒöªýÇïï|É~fy>b{Õ)ÀK§E\\ã´U•ŒÙaC†pJg‘ÜÒ°–<SæQ^˜¨¿„}iˆ\0SÐœ…\'Jc)Ðÿ\0¯CþÐ\"Ÿ”Žzòh ŽMZÕ¦¡*FŠŠ1€£Š¯l¡ç\0ô¥æ>¶‘ä4g€ÏZb—E,8¹¥bDÌ£ 4²1Û@ØùŠr…f\'qZc1yA>¨F?7Ö˜Ãƒ&›A,{TŠæ5ÀçpùM6ÔrXÆiKgPÇÐTŒ•bwA.óæte\0§mŸ¼6ž§½XD91ØUH×.A$ŒÒrÞO™Tc-ßµ\r(UdòðØäúÕWfÞq\n«w\0}š3˜¶Ò{â†ðÇ\ZE½Ø³cå±«0†y3,˜„àn‘U|µ\\`w©I?`o˜¤c#-Ç#3\"ŽT‚Ãâí\"~ì\0¤än?Î«ÌIQÎ6¯R8Å¤‡\'<\n[ƒ<©“\ZfIÆT`(õª:‚…Iœ†ç­iÅoQŽ£Ÿz¯©ª˜\0\n=)§¨5¡ËÞ&[r‘Œf«2«ÛÞ§Ÿz½*Ÿ¾*ˆr¡ÔtaÍlŒÙ©š`ëNi’‰E=1Ò¢ àÔŒ“½/ãBÒI¤õúR\nZ=)€ìqŠPƒÒœ†*Ž4àqÖ…¤\'&€$\r‘ÇáV!crAôªê:\Z‘Fr{Òc5-æ,ûO\'ÖŸy`/!,\0ÈJõœÕ­dÇg\\ýj…#?Añ\rç…nÌ2£Íbç÷“ÓÜW®é÷–\ZÎÖp³DÃ‘Þ?b+ËuKX™A+É¬ß\rêwz/‰-Åœ…RW	\"7*ÀúŠç¯B5’Ñ4+J•ì{jÆm˜*¼T`4_»#jžjy HîŽÜ´gŠk¨,3Ïå•È^%.yÀô¡Ô6â}0)áÎà½ˆæ˜Ò6öN0:P=Æ5ÄdÇpi‰(9P†§ò×fí£4±¨/È¦;‹¡ÀÅDU—\0tþ*ºPHê§!AÎV?½•Ðð ã€B#å»ãµO±8+Œ÷¡cUÚ p)[‹Œ€tíB`«eÒ¦dÉ=3Oÿ\0[‚Ý½*GP~^€óÅ¹‡.\0#“Åq|Nšm«h¶î»›þ>]åšÿ\0t{ší/æk[Û¨Àó €ºdqšùòYå¼»’âw/,ŒY˜÷5Û„¤¥.gÐäÅUq—Qa@u2i2H©ÜmQŠ¢ä–¯Q[\ZNi´§¨¢¨BQKH(\0 ÒÒ´\0´w¥¤\0‡Ò¥C„#šŠ¤¨úÐo¡*ÛéæW\0á{ûÖ¥p.dlÁô­˜†Ý*,†\\šÁ¼@¥ŠñšÊ;–ö)Œ`g×š@#Ãçvïáô¦É õ­	`*Ilcõ¤‘Å8Ôü Ï½\0EÃÌÀ}kCLÔÚÂày€˜[ïOqW<$\":Ã4ÖÐÎ¢ÞC²UÜ¹ÚyÅb1$±ô<\n[è=µ;›yüÕÆQ£~Â¥Ý2Höë•Ñ.æŽc·îÜò\rt…ŽÓÛ³jÌ¤îX$•Û·òjñ€tÍIæ…sŠ¯Îîpx©+bXÉE .?­=”c$•ÈäŠImäÔè7ÄXõÅ+„7«pMWû™ˆn™«€|\01ŠÎ¸bFÏ\"„&JdòÆ#!¹ïÞ«ËL‡€x9íNA™Ã UVc5ÀßÈÝÓµP„•Ì’íQ´Áê1Ç-Ûõ©o)dS¡E!sëNâ­n—*V\'ä7J°¶K\Z@ê*Úþðäœ=ªUEÈ>µ-ŽÄŠ[¾Ä$c°¬K¨d–\"«ÜzVô¯ìC´gU\rJæTU‰N¯5Hž§\'=ªì$¸<ž+;§J»n7F¹ìjÙÔˆœzÕÆTVÛ¿5—o#Ûž=+V%A#95›,©{Ër2F+—º€Æß2‘]œÈ¾Y•“©Æ$v§\r».:t¤_J±*\r¤ã½Wkr+C2W‚X¤Û,oppêTàô<ÔŠ˜SósÛÞ–óQºÔ®<û¹L’m¸ú€)‘š\0p±ÍNWäS ã±¨3‰8«‘|Ãži1¢“¢H*¹zp8ªÄd\nhjZ{¨˜iˆ\\Ó‡4Îô½\r @sÞ”ŠssŠDá¨\0(iÅ\\„lÅ4¢°|Ž(¸ÊF“+¨ŠŒÓ¢”Ói})\0P\r! P³V £`ÊH5W<ÓÇJM\\iÙ=¥ì2Ä¢BzúÕ½±¿Ý ×/nìÁ­h&m£¥sÎ¶:é×oFh˜@¦hŠF=NjÅbÕŽ¨Êå\'‹©Ík²Š©*Š¨±J:“GT¤LVÌÈ9¬éTWDYÇR%)¸©œ\nˆŠÕ3™¡´´QLAEPE%ÀZ(¢QLŠ( Š( ŠZ)\0RQA ’–ŠQE\n(¢€?ÿÙ',6,7,'-16','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',10,20,30,0,0,0,0,0,0),(40,'SAPOLIO 6 EN 1','123','113080421620',4.46,'5','IVA 12',0.54,NULL,0,NULL,1,NULL,'70','8,50',-4,'UNIDADES',' ,  , ','','3','10','SIN GARANTIA',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0 !!3$3Q00QB///B\'\'\"\"\"334&4\"\"ÿÂ\0Ð\"\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0ú\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W]uóÄG]kØ\0\0\0\0\0\0\0\0\0\0\0\0\03åÍš®8®\" Yõ:À\0\0\0\0\0\0\0\0\0\0\0\0œX³×ÄsÏ„\'Øú0\0\0\0\0\0\0\0\0\0\0\0\0;\rqÏ<×Ç0„Jÿ\0³\0\0\0\0\0\0\0\0\0\0\0\0\n¼œÓ¿wŸâsª+¢¨˜A=}O \0òîÜ\0\0\0\0\0\0\0\0\0\0\09òqÆ½Öø^Už…udæ:DDË^ßK]ÁFO\'\'±í€\0\0\0\0\0\0\0\0\0\0<š§^Ùñ<Ë}*ªÁÔDI×|Û«fíq×fZ9úÝ\0\0\0\0\0\0\0\0\0\0\03Ïá¯døþež¥à;„Beo[o|&i¦>‡Õ\0\0\0\0\0\0\0\0\0\0\0y8«kÛO™o§E¢e:ŽûæÛc.Žù®¹ú\\\0\0\0\0\0\0\0\0\0\0äbá«o_›o©žŒœ¤@ugm¸ãuyùïè½`\0\0\0\0\0\0\0\0\0\0ò1ðÕ²¿7Í¿Ð¢Œˆé‰’nã«*Ï²sEŸEê€\0\0\0\0\0\0\0\0\0\0G‘†­•yž}þŽjqÃ¸A(”ÝÍœfÙÏ}ïP\0\0\0\0\0\0\0\0\0\0<|œ5ë«ÌóõmÏN4w‰™î™ãLÙ{^˜\0\0\0\0\0\0\0\0\0\0>>N[4×æ`×ªŠrò’3=×N½0³ÖôÀ\0\0\0\0\0\0\0\0\0\08ò2s:ô×æaÛ}e„‘’C»:íÕž§¨\0\0\0\0\0\0\0\0\0\0Ç—Ž¶i¯ËÅ¶ê(ÍÌ‡2’DÏ}u×}úž¨\0\0\0\0\0\0\0\0\0\0~F^\'nŽ|œ{­¢Œ¼ºA$ÄÄ÷Ôõßvz^°\0\0\0\0\0\0\0\0\0\0^Fn:Ù¦¯#>ësÓ“—qLÄ’Xë®¬ïÒõÀ\0\0\0\0\0\0\0\0\0\0*ò2óÖÝùk¶Š3r”O2K©ï®ûïÑö\0\0\0\0\0\0\0\0\0\0\0)ò3sÞÛèòj×e4fˆ”2&%3ß}÷ß¡ì€\0\0\0\0\0\0\0\0\0\0Qäæç­÷çò©ÕeTäGP„L‰‰u=uÝîö¤\0\0\0\0\0\0\0\0\0\0\'?=ï»/—V¾ê§\'.ˆC¤ƒ·]õg{½©\0\0\0\0\0\0\0\0\0\0›ÊÏÏ{ïÅæU¶Üõb‡pˆ™$ÜõÝnöä\0\0\0\0\0\0\0\0\0\0_*ˆïmø|Þ6÷M8ùt„Ä’	žûêÎ¶û}\0\0\0\0\0\0\0\0\0\0\0Éåç‹7]çyüzMY8Ž¡(’BfzêÎúÙît\0\0\0\0\0\0\0\0\0\0›G6o·ÌóãÒŠjÍRP%1$»u×]÷¯Üì\0\0\0\0\0\0\0\0\0\06…ž‹ÊÁ×©Íg¦:D&BRë©ë¾ú×íØ\0\0\0\0\0\0\0\0\0\0Ïóª‹=9ð±YëqEtgŽ‘1$„õßVuÖ¯nÐ\0\0\0\0\0\0\0\0\0\0n\n¢ïSŸ%ž·UVng¨BBDõÕwÖŸnà\0\0\0\0\0\0\0\0\0\0V:ùÑé`òêë_×ÇÄÀ’S2•÷×Z=»À\0\0\0\0\0\0\0\0\0\0yk¯†n:&9â9˜@™ë»ûêÿ\0kH\0\0\0\0\0\0\0\0\0\0äyÙy·_¡>7Ÿ£}ueâ& :˜&ztGVíõö\0\0\0\0\0\0\0\0\0\0ÇÍ]O6zº<¿ŸWÐÉ›Ï‡\\‚z‰&\'¹ï¾íïÓô€\0\0\0\0\0\0\0\0\0\0çÌÅoÐÏÍùGÔÉ›Ï‡\\ÂIêy”¦zë»:õnô\0\0\0\0\0\0\0\0\0\0\0`ò¨Yôü§ŸÕþÞZ|½Øz¿\"f:ê]×$õ×VÏ©èÞ\0\0\0\0\0\0\0\0\0\0ÎòéœU³å›²zSÆ>é§­>7¦îìÕN¬Ù¬âuß^®í \0\0\0\0\0\0\0\0\0\0<ß2|zÚþK¯NÉÍšÌ¼z©gWUžuç§­«}zž†€\0\0\0\0\0\0\0\0\0\0g;<ßWÒøúúÕêeÏ‚«,ÏË»,º§SßõÜ÷çw;=›À\0\0\0\0\0\0\0\0\0\0y¾vˆ¯Ô»å±6û9(ÇE¶g­wsÔóÔzž×{×€\0\0\0\0\0\0\0\0\0\0ó|ú÷gÑè|Þ8Ûìd£}[ÆIÑ3=-å<r™žÖ{Ú\0\0\0\0\0\0\0\0\0\0\0y¸)yÞŸ»ó¹š=|´eâl§7z%Ó¿W.Ê«ïÊé×ký\0\0\0\0\0\0\0\0\0\0\0<Üló}_oçqõ±“ŒÜuÕõt¦,Õåú´cö1Ï<u:}‹€\0\0\0\0\0\0\0\0\0\0y˜¨ëÉö½Ég^î>sq×TUÝû»éÞ_/Ôš}o6,œÓwµh\0\0\0\0\0\0\0\0\0\0/äô}…¾®z2×§\\sƒÓò¨Nû|¯W6?{Ä¿B‰³Ú¸\0\0\0\0\0\0\0\0\0\0—™Ö]¾Ÿ‰’4úYøÍ»^}~í>OvSºÿ\0+ÖÉ“Þñ=¯+}3×³ \0\0\0\0\0\0\0\0\0\0—C¬»=OG‰¿Ù§ßóž_¡£ÈÝw™êåÇïxžÏ—èRçÞ¼\0\0\0\0\0\0\0\0\0\0—LÍ>¿/§]™sz>nO[?Fß+Ñ¿ÈÝ•êæÉîøžÇ›¾ž£ÙÒ\0\0\0\0\0\0\0\0\0\0Ëª\\æö~jïcÀö²æô|Ì¾çŸ‡Ñ³Ëôtøû4ù>¥8½ßØôó÷Ïµ \0\0\0\0\0\0\0\0\0\0•_Vxú=Ÿš¿_™ôž~/KÉÏîù¸½.ü¿GG·O“é×“è2÷njçgH\0\0\0\0\0\0\0\0\0\0*¾­ùýþßÌl³Ïú?3/§ãÑîù˜ý9ó5u—~Œž•´äÊ[ª+öt€\0\0\0\0\0\0\0\0\0\0òê›<GÛó½/7¾±eõ<Z}ï+\'§>dõ·Ôç.Jz²Îºë¨¯ÙÒ\0\0\0\0\0\0\0\0\0\0Ë©oèûþ~›<-™³z¾%;ðñíÛƒe™p¬³¢]uÔqìi\0\0\0\0\0\0\0\0\0\0æpŸ³ó^¾O½±àW<ú]`×•uH&zººý \0\0\0\0\0\0\0\0\0\0<ÚçŸÑö>gÐ¯\'Ôù8½ŸžãÙïÎóý	ë± ™ºÆ_g@\0\0\0\0\0\0\0\0\0\02¹x>‡³ó^…9>ƒ_gçx÷¾vëíé!!=oãŒ¾Æ\0\0\0\0\0\0\0\0\0\0s¦Û§æ=ù=ºõÙóûß;º{é2A$ß¯ºpû\Z@\0\0\0\0\0\0\0\0\0\0bÌ¢èßóž|_O>¯?Ô¯ç½	î]ÂVÛÇVSéé\0\0\0\0\0\0\0\0\0\0çÔŸÓôþg×ºló¦î|©vï©””èËÖªnß¤\0\0\0\0\0\0\0\0\0\0›Ã?‘·ÚùïSÅ³ÛŠ|¦«)‡s)‘	5b÷lÒ\0\0\0\0\0\0\0\0\0\0Íãš|~îo]žTeêTó=Êd”_£ÌïloÐ\0\0\0\0\0\0\0\0\0\0Îâšü_MóµhŸJªi‡5C¹”ÌJ%:ssÔhôô\0\0\0\0\0\0\0\0\0\0\0óyª¿/èmñ{Ž½\Z©«”Sú&`&móõu¶¯G@\0\0\0\0\0\0\0\0\0\0ñß~_¿åS/Fª©ˆŠbzê&I‚fÞ9ië~€\0\0\0\0\0\0\0\0\0\0òÆ,^ŸµãÕÜíªš¹Žh‡}LÌÄ‰™»:þ=}\0\0\0\0\0\0\0\0\0\0\0<Ø«œ¼ûž_A£6z9¯ŠÇDôžúë¾û×Tk§ØÐ\0\0\0\0\0\0\0\0\0\0È¯.EMó™{{5QUuñ\0‘)&Ý›,Å± \0\0\0\0\0\0\0\0\0\0›ƒË§‹~—ç³:õùŒµÙ—\"R„Ï¥g2Ýìh\0\0\0\0\0\0\0\0\0\0<Ï/ÏãŽþ§Äóz¯cçk»\"gŸkÅž¡íø‰Û»Žê»×Ð\0\0\0\0\0\0\0\0\0\0ygžã¿°Ãâz\Z/§f(»ÆÝf\rýyþ¿ƒ³W‘èêñuàïžîÝß© \0\0\0\0\0\0\0\0\0\0ò|¯>xëì©ðøõqzSâûcæÕ~—•·m?«o‘éjñ#»uû\Z\0\0\0\0\0\0\0\0\0\0\0+ÊóœÛömx½/;Õ³?¯Éõ3ä¹Ï§ší8gW_§Ï—×}oõô\0\0\0\0\0\0\0\0\0\0o‘æõ]ÿ\0EáWW:µ×]Ä	+\\ïÅ³\'}õèúº\0\0\0\0\0\0\0\0\0\0\07Èózsô¾Oœ{´×ÅTºÎ»ÖÍ^>‘»__]wß^‡¯x\0\0\0\0\0\0\0\0\0\0äù~o¥Ç^×’ë»´[žŽTyZ¨×~®°jâÜ½*ç›*ïw³x\0\0\0\0\0\0\0\0\0\0ãù~w«³«ŠŠ¶5ñM1•g­›F?A~^4çëVyoö4\0\0\0\0\0\0\0\0\0\0O—æúWäßææÑÇ{)¯5dÊÎovºÉÓåõèzú\0\0\0\0\0\0\0\0\0\0\0\'ÊómªÍØk4í¦¼Ü ÌÄ“ß]õß¡ëh\0\0\0\0\0\0\0\0\0\0<Ÿ+Í²¾öà˜ïNÜüÕnJ	A6Ç)‰²{ï¿GÕÐ\0\0\0\0\0\0\0\0\0\0yg™g7l¯F.îÙ›•ù|èï_U=Ü\"D÷×¥êè\0\0\0\0\0\0\0\0\0\0<œ»«O§åß—›4s¢Šrê³Ëpå›,ét™˜z¶€\0\0\0\0\0\0\0\0\0\0#ÉË‹ºxö|‹¹Ïµ£G~6{ïÇèUFGVtLôë³g±x\0\0\0\0\0\0\0\0\0\0äbÃ}´SŸE‘léº®|þ®Ï»6^#®ú&{žº–Ÿg@\0\0\0\0\0\0\0\0\0\0ä`Ã¾(ÃÅ“²Þfè·ÎçVX¶œÎì™LõÔ÷3£ØÒ\0\0\0\0\0\0\0\0\0\0y>vAo†lõ\'\r\Z;»ZqÕeù¸ï®“+&zêuzÚ@\0\0\0\0\0\0\0\0\0\0ŒÞ\':ðìÍ“ª½\räkîÊòõŽ6]Lfí)ë¹ußZ½m\0\0\0\0\0\0\0\0\0\0\0FO2˜ÏfŒ‘O>¥ÙóY²œý¬§ž9µžú™ï®µzÚ\0\0\0\0\0\0\0\0\0\0\0*¬±»&i§FÖlÞÝ>5›•ù¾««ÅóVOs×Z½{À\0\0\0\0\0\0\0\0\0\0\"ª¼Þ5ßEœÕ6s§ÉÑèdÉ1v?­¶|_,îzë¹ï­>½à\0\0\0\0\0\0\0\0\0\0G‘™—»YÑô\ZéðrqÎ—]O›õWõây‰ž»ë®»>¶€\0\0\0\0\0\0\0\0\0\0#ÈÍŸœÓ~Œô}6•9œÝÞÎ<«~ªßÍ:žúë¾ºÑëh\0\0\0\0\0\0\0\0\0\0<|Ø.c¿u\Z}º<¾üî3qÔíF;>žßÌ—]OVwÔèõ´\0\0\0\0\0\0\0\0\0\0>_&Ûrk¶¿ Ñówáã;‹!£“éíðüèêg®»ï¶bð\0\0\0\0\0\0\0\0\0\0#ÆËç«£fš>³/ÏlÇš©×·³ß}Oo…—Ž:žºë¾ºÑì^\0\0\0\0\0\0\0\0\0\0xøpÏNËþŸ-¶ãù¼·{USÛ¼¿Go‡§.ÝO}OZ½‹À\0\0\0\0\0\0\0\0\0\0ÏÁo6s:þŽ%ÏÏy—ûøñ_œ}E¾üžW]L÷3Þ¯bð\0\0\0\0\0\0\0\0\0\0#ÇóðÛ]¼Æï¢çÍôzñqÓéøZvñŠ®þ¦ßë|®=u=köo\0\0\0\0\0\0\0\0\0\0<;Šûq¿è|ÿ\0ú-ÞG›W¯<R›>ªßFš¼nSÛ®õû7€\0\0\0\0\0\0\0\0\0?ƒO+ÛôžgÏý¥âù7ä®Ý9jêß©·Ä«©ë\'®ö{\Z\0\0\0\0\0\0\0\0\0\0\0ÌÃ§‰s«éðü÷ÑlùÜ–U‘è×‹«~«¿¶hyÉ™³g± \0\0\0\0\0\0\0\0\0\0ñüÏ?^~ºwõ¼ù~¯?+®)ª­œfNÚ:›yŽ*LÛuþÆ€\0\0\0\0\0\0\0\0\0\09ò<¿?^~ºž~£OQâxÚ’£}x¦ÊôoÉde®Z5éË×³x\0\0\0\0\0\0\0\0\0\0ãù^~¼½whú.ü¿60Ï³¯)³?«~;ã–‹§.}^Íà\0\0\0\0\0\0\0\0\0\0Gåùº(™Žç‹ÜU~‹ss=Í\\æ¾æ­9=9Ë–n×ìÞ\0\0\0\0\0\0\0\0\0\0xþg™mRus¨ê/«V|šµqž¾uîæîðu}xêÝ»7³x\0\0\0\0\0\0\0\0\0\0ãù¾e´LÏ][§Šzî»,¢Êxô6WÝtZ¦ý8ºBª=›À\0\0\0\0\0\0\0\0\0\0•vi—]wª¾zÐ¾­™|ùÕLóîÑ‹=ió¸«_·x\0\0\0\0\0\0\0\0\0\0ãâólÈN­´j×F®r-¯?[Uù-×¢zSm5å·o³ \0\0\0\0\0\0\0\0\0\0ññyÛ£Î«ö|ÏF¾§%³Y]m7}1Íh£¼¶ìö¯\0\0\0\0\0\0\0\0\0\0<Œ5jë]uyž¾\r{>v«j£¿c=¶ìÍæéóýLÎ:²Ëïò›=«À\0\0\0\0\0\0\0\0\0\0+}=hçÎóÜì·N9çÚË\Z<ý¸hÕŠì»z³¾õgó»Ùí^\0\0\0\0\0\0\0\0\0\0yxªÏ›…Sß£~ª{·\r>†^r»ËN•>×óÇ,ôéô=À\0\0\0\0\0\0\0\0\0\03«]:»Óâ{ujÅf<Ø,Š¦íVù¯w¸šx™Ž4oËéÞ\0\0\0\0\0\0\0\0\0\0yx5õ_^G§ç×eì¿‹=6ÿ\0>¯W>nõq:zæ9õï\0\0\0\0\0\0\0\0\0\0<œY¹“\Z­<ã·ÒžtW§¶QŸËnÇ>‡wõÒn³7«x\0\0\0\0\0\0\0\0\0\0ãà³.«)îí¶U\Zr[ooæž=\rõ}ý*Ë£M1ìè\0\0\0\0\0\0\0\0\0\0<l>uÛóê»º9²{ê¯2ªjwÜê£ÐºÜ{qYŸ‘Ö]>Î€\0\0\0\0\0\0\0\0\0\0#ÅÅÞobœûéîúyÃG§çß¢Ìv\\ÓÍÞ_;mËfÈ¯¿fð\0\0\0\0\0\0\0\0\0\0#ÄÇ×:ø£,E÷ÕõÎÍøçîê¾kËèÙŸÒ¶qãÕëè\0\0\0\0\0\0\0\0\0\0<Lœd¦+›4=üZðk¦ê²ÕÞNºî½·sžÛôSåoŽnõô\0\0\0\0\0\0\0\0\0\0&\\\\úÔY¶‰Ë­Þ¨Ç]:h³«WóZºç?vÉëG« \0\0\0\0\0\0\0\0\0\0ñrY‹ÙSÕø±ìÏÄu’(˜Ýn¨Ã¿?;,ÇÊrÝgz½ \0\0\0\0\0\0\0\0\0\0GwŸv~3Ñx×ÕTQôyÃëR«>å>9úï£Ñ»V\0\0\0\0\0\0\0\0\0\0#ÆË’Ž\"/Í¶û§oƒ¯ÌúÕyz(æßK^‰W—ËãÕÍ³­ÕìÐ\0\0\0\0\0\0\0\0\0\0x¹x¹ïœÖÝÎ_Gæ+ëM=R˜ÕëóÌÕ~lTìõ,Žêôï\0\0\0\0\0\0\0\0\0\0<\\Ögõ9ÍŸ\n*ÏÀêyCNž;ˆi×Ž¯Nìµèõ¬\0\0\0\0\0\0\0\0\0\0<l—ä³šñUÊb©ˆ‹÷çfô};;Ëžè‹/õn\0\0\0\0\0\0\0\0\0\0<L´e9®9&¿WËå«Ðó+¯Þ×çìëÏËu–NVà\0\0\0\0\0\0\0\0\0\0#ÄÉF~UsÏ{|ÔõôÞvkÇú/Ùï?á×¡¯>À\0\0\0\0\0\0\0\0\0\0G‹ŽœÜs\\\rOó>¦\'©ÐŒùuSâófšx¾ê/»»fÿ\0Nà\0\0\0\0\0\0\0\0\0\0#ÅÅN~>‹ÃÉuø=okÃßgfÉæ¾ñóä÷èæÍÍÞ…\\õ«¾ïô®\0\0\0\0\0\0\0\0\0\0<\\[|™×Ç«Ï_\'ôüëÞvúnÇç]ˆŸJ»2W³º8Ñu÷ú·\0\0\0\0\0\0\0\0\0\0./OÂÑÏ¡ÔÏÌ}>-Ù¬òûó¹ê;Vu·Wxgž)»}÷z—\0\0\0\0\0\0\0\0\0\0.OÌ§Ôîx§Áõpu^º¹ª¾¸ÓÇÄÙ¿g-Õ×§uÚ½+€\0\0\0\0\0\0\0\0\0\0©Çõ<þsÇW¬ïM9xŠš*ˆƒN¾¼É®tnïw¥p\0\0\0\0\0\0\0\0\0\0âà«Šé¬•óÕµW:å{qM¾œnô®\0\0\0\0\0\0\0\0\0\0<\\5s]uóÍœßON!Õ;q ¶cº·cë}îô.\0\0\0\0\0\0\0\0\0\0<lÇqÁÍÑE“ÄlŒœsm[6ä«ÛÅn¯Bà\0\0\0\0\0\0\0\0\0\06\nyŽ8ˆWg<óÝWKªÍÔÇ.¦ußÞCú7\0\0\0\0\0\0\0\0\0\0\0ñ°SÂ9æ9¯¸ã–ƒV~,¤Ž5Ñ[g£Ÿ½›*õ­\0\0\0\0\0\0\0\0\0\0ãa£‰sÏ5×Üq\rkbŽmÓ]TìÓF/¹—nËžÅ \0\0\0\0\0\0\0\0\0\0<lTW(ãŽ*î\"#Lw1Í¶ÛŠ­Z8ãi³Í–õìÚ\0\0\0\0\0\0\0\0\0\0ÆÅEiŽ+®¾ù˜‹º‡}õG3Í]5ãÓmÑ²ŸfÐ\0\0\0\0\0\0\0\0\0\06*+J¾*®Äs[@›cºù¶Þç-‘Þ­z+õ­\0\0\0\0\0\0\0\0\0\0ãa¦¸ê8âºº˜r§·1¡eté›}+yôí\0\0\0\0\0\0\0\0\0\0ãa¦¸ê\"ª¸êg˜ä\'®ë™í]ºj«½qèug£h\0\0\0\0\0\0\0\0\0\0sÒ+¯‰™Žb!3ÔYÌGsÌî7´ï´\0\0\0\0\0\0\0\0\0\0‚Ž9™qÇ1Â	îÛ*ækâ{×3{G}\0\0\0\0\0\0\0\0\0\0\0xØhã‰ér\"8ž:F‰é#Ìê¦Þ}\rö€\0\0\0\0\0\0\0\0\0\0ñ°çã—Rç’\"9ˆ|Ï|ÕÝ–Ovße›­\0\0\0\0\0\0\0\0\0\0ãùùø„ôŽHˆŽQ31oiŠâ,¶ÊîÓÆ¯NÐ\0\0\0\0\0\0\0\0\0\0?ŸŸˆ‰êbQÌ9é3\Zx›9§)»Dèõì\0\0\0\0\0\0\0\0\0\0ãàÏTË’\"Ä&Q¦{Šâ†›3î‰ÓìØ\0\0\0\0\0\0\0\0\0\0ÈóóÔ‡]!ˆ”´YÏ©¯mÕi¦vûV\0\0\0\0\0\0\0\0\0\0\0ò<üÕÂ]L\"\"\"3vÉË:*Å:ý£Ï·wµh\0\0\0\0\0\0\0\0\0\0#ÎÏ_2w\'<œ¢	³U©éN*¬ÛmîÝíØ\0\0\0\0\0\0\0\0\0\0Éós×Ê]tž9\"!]Ù¦-¦šiŽ´¸¿µ`\0\0\0\0\0\0\0\0\0\0+ÌÏ_.Ž¥ÌDBsg]Wßy\\DYwwïöl\0\0\0\0\0\0\0\0\0\0åyy¸„u<ñwÄ\"I„UmN{¾Ý}‹\0\0\0\0\0\0\0\0\0\0\0y¾Fzá×.æcˆ‰Õ3^hLI[«=]fÛý›\0\0\0\0\0\0\0\0\0\0\0yþ>z¹ž¹Ž»ê8á;ì²¼ùë!Ìq:»¢«®Ñ«Ú°\0\0\0\0\0\0\0\0\0\0™åg©«7	ï§9¶û;·š2sLMöfºí~å€\0\0\0\0\0\0\0\0\0\0<¿35Sèdæ—}¹ã›¸ŽVzVâÇ_\rnô_çuv¿rÀ\0\0\0\0\0\0\0\0\0\0g—š¸ôsú™s,ã¬/cÄïž}¼4êŒ}mªò½YrÍÚýÛ\0\0\0\0\0\0\0\0\0\0\0yž^zžßqSg9êÓg‘ìøµ{xõQe::£E×¿Ìã»µ{Ö\0\0\0\0\0\0\0\0\0\0\0ó|¸§š4ßž=.«Ë~]œF\Z#Ý¦œþç…èàÙši®:·½~í A \0\0\0\0\0\0\0\0\0ó|¶‹¼•5G]öãoßçÓéÅU×v~¹‰êfÝqN¯rÐ\0’	\0\0\0\0\0\0\0\07Ë«ÖçŸ>‹2:î.ËÄGI·˜…õóº‹—®ÃÎ¯rÐ$`\0\0\0\0\0\0\0æùyûÓ~*½žòñmàSËßÄ]\ruW]º*èÉ:½»@J@ \0\0\0\0\0\0\0<ï+=\\Ï{-Ž{Ï×¡ƒŸ>Í~o±[ŸUyvlÌÉ\Zj÷;	$$D’\0\0\0\0\0\0\0\0`ò3qÄO5Å—EîªÅÇ¦¾…™VæŽ&R›l×îI$’$&@\0\0\0\0\0\0\0x˜¨¯˜ëŽxŽç®£ž8Žã®(™‰›mëè{JbR”„„\0\0\0\0\0\0\0ƒÎð¸qqÇgSÔG5óÒzO)H™ž£×õ,’bd%€\0\0\0\0\0l^c©Ž8X™ê8¯—]LÄDu$¢7ïz¥)$‰$\0L$D€\0\0\0\0WÍ¸¼ün£™žºéÏ§§Hç”Ì4îÙÏ6u)H˜H\0˜$\0\0\0H\0!V*{³¬¹2f¨ë£ŽN DÛ£V›ãŠçnžå!)D‚a\"`”\0\0„€\0\0(«5w=wÕ4QOs=wÝ¶]dñ_sv­3ÒI’\"ID€\0\0\0\0\0\09ÑOúŽ¸­=DA=G,²ý(žæf&D \0\0\0\0\0\0\0\0G1	”#Šxãˆç˜”&zë»,í1)LÏR\0\0\0\0\0\0\0\0\0$ ”H	‰ë \0\0\0\0\0\0\0\0\0\0 \0@J	\0LÌ€\0\0\0\0\0\0\0\0\0\0„@J\0\0’$”È\0\0\0\0\0\0\0\0\0\0!\0%\0\0’R\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0­],çÌ\0\0\0\0\0\0®éF|À\0\0\0\0\0®Ó=±uEèä\0\0\0\0\0Ú—§-Ø$ËMy \0\0\0\0\0wÖoN[°$¸½<Ù\0\0\0\0\0úÍéËvLÝyà\0\0\0\0\0wÖnñ«9Í^0\0\0\0\0\0;ÜëXÝ€2Ï(\0\0\0\0\0/{k°	$ç\0\0\0\0{\\í5`	3Ï \0\0\0\0÷¸Û;°™ç\0\0\0\0{ÜmØLóÈ\0\0\0\0\0½îw&ª39ä\0\0\0\0\0k³=s. ™Œ\0\0\0\0\0\rvg®cRS3\0\0\0\0\0ë2Ô´\"ã\0\0\0\0\0zc«\\é“9\0\0\0\0\0«y,’b\0\0\0\0\0Óôg7PÉbÌ@\0\0\0\0zs½œî¦³\n‰ˆ\0\0\0\0\0/F:1kY_=½S\0\0\0\0\0]¦¤¶kž©®¹È\0\0\0\0\0½ºçxÊ…/l@\0\0\0\0våÏ®ËsI®¹€\0\0\0\0WI¬ÔºÖ®r\0\0\0\0\0\\š™J®ºL¤\0\0\0\0\0¾24Æ½f,H\0\0\0\0\0xÆW\\ýL‚D\0\0\0\0\0\roó¾šÏNbXÈ\0\0\0\0\0\ZßžwéÏRK,P\0\0\0\0\0Ö¸oÑÊT2 \0\0\0\0«¸d@í\0\0\0\0\0­Ë%³\ZQœÀ\0\0\0\0\0^ÚÆ˜iM%Ç+\0\0\0\0\0ö×1\ZÍ±œ\0\0\0\0\0ºë&™ ‰ˆ\0\0\0\0\05Öæ²Ô…	3\0\0\0\0zËYi…¤fç \0\0\0\0õÔ¬Íg\ZšÐ™Î@\0\0\0\0ëfdÒÙ1j™È\0\0\0\0\0½,ä»i›Î­LÀ\0\0\0\0w¬åkDçUX€\0\0\0\0[²Ük9S9\0\0\0\0\0\Zé*sÝšãÓ\Z±œ€\0\0\0\0\rtY¾ÆzÍñé›c9\0\0\0\0\0µŽ{r½+IQœ€\0\0\0\0Úã|z3±Ç¡ä\0\0\0\0\0kª¸]mN%I˜\0\0\0\0\05ÔsëË£RùúJ“0\0\0\0\0\0k¨åÒ)®{Ì³2\0\0\0\0\0\ru§9¸fŠÌ\0\0\0\0\0kWu™4ƒ2\0\0\0\0\0\rtç½±Ir²ææ@\0\0\0\0®²jHk4…Ä€\0\0\0\0]&uf˜²k3$\0\0\0\0\0\Zè’Ã.’f\0\0\0\0\0\rm.³Y¶ÈÌ\0\0\0\0\0\ZÕ¤‰6€™€\0\0\0\0êÙ£&’k,ÜÀ\0\0\0\0nË’©”€\0\0\0\0ê¦•,•š1\0\0\0\0\0º¥ÂY¼I˜\0\0\0\0\0-¶I¸Ö¥—79\0\0\0\0\0,iž¤¹«€\0\0\0\0Ö¤»“:™ÓY3\0\0\0\0\0ºDSæ\0\0\0\0\0t†Îw|ÚÎus\0\0\0\0\03ZÞ“7†™€\0\0\0\0YZ×IŒ.ª3\0\0\0\0\0¢iz/%+\0\0\0\0\0Ým%‰S0\0\0\0\0\0*&¢›°šÎ`\0\0\0\0\0¤J²gVç0\0\0\0\0\0);W<õF \0\0\0\0\0¢,‘¾†6“0\0\0\0\0\0QG]Ó9€\0\0\0\0¬‹]êÌm™\0\0\0\0\0X„Mu‘eÌ€\0\0\0\0ªAYèÎÙÔÌ\0\0\0\0\0RYz3‚ìÄ\0\0\0\0\0µ”Ö±¶lÖ±˜\0\0\0\0\0uu”¸Ø&d\0\0\0\0\0\nÝÊØÎ®jK˜\0\0\0\0\0«d³7RjTÌ\0\0\0\0\0\nª¤¢$ \0\0\0\0\0-’U‰R•\0\0\0\0\0\0Y*Ä,¤ \0\0\0\0\0%\0  \0\0\0\0\0…\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢\0\0\0\0\0\0\0RØˆ\0\0\0\0\0\0\nš–k3Y\0\0\0\0\0\0MI7–’*ä\0\0\0\0\0šŒî†°\0\0\0\0\0\nMDÞe¤Î®@\0\0\0\0E‰©+LÊ€\0\0\0\0\0¢Ë,–Ó$\0\0\0\0\03¹-€\0\0\0\0\0¤«,•D@\0\0\0\0\0RRjKi\"\0\0\0\0\0Å¢D\0\0\0\0\0J\\Ò©\"\0\0\0\0\0•ÞZ*D\0\0\0\0\0MIeJªÊ\0\0\0\0\0Ê•›’Ë\0\0\0\0\0\0²*X¶Ë\0\0\0\0\0\Z¢æ¨@\0\0\0\0\05BiÀ\0\0\0\0\0zé*MK,\0\0\0\0\0aKÑ™Æ¥\0\0\0\0\0\n7ÖuÄß. \0\0\0\0\0RãOONu¼åsæ”\0\0\0\0\0-ëèóô9jóë2Ö<À\0\0\0\0\0^úéžzéÇw=9óÎ3¬Ð\0\0\0\0\0¾œó½gnI|üí¦4\0\0\0\0\0ÔÔç{róaª:\0\0\0\0\0×]o>~¯X\0\0\0\0\0é®¼üùëË`9nh\0\0\0\0\0/­çã©h5Ð\0\0\0\0\0__:\0k \0\0\0\05›¤\0Î´\0\0\0\0\0%XÀ3Z\0\0\0\0\0Ër\Z–sÓ@\0\0\0\0Yb„¢Äš\0\0\0\0\0±W\"ÙQ\0\0\0\0\0¨¤(	@\0\0\0\0TR(TJ\0\0\0\0\03VKRË(%\0\0\0\0\0ëWµÚÞ’€\0\0\0\0	»ËŸ>®¤sæ»ÜP\0\0\0\0\'L3:7,åƒz²€\0\0\0\0zæ³\Z©Ïõ@\0\0\0\0\0¼»ËÍÏ®œõÏ7zJ\0\0\0\0\0&±ÑÎÎz»Î¹ç{°\0\0\0\0\0dÌ“SS\\æö€\0\0\0\0\0›e34Y¬Íh€\0\0\0\06Æ:3*çpÔJ\0\0\0\0\09tÆÑs¹¨fÐ\0\0\0\0\0k<zæôLãM¤–€\0\0\0\0ÓDé\\ùtÚ!@\0\0\0\0Jg[Y™VIh\0\0\0\0\0ImËyX–ÂP\0\0\0\0\0¹5S6€\0\0\0\0QÌîÆm\0\0\0\0\0h¡%¥Í\0\0\0\0\0š\\¬T[\0\0\0\0\0\03jæ‰e*J\0\0\0\0\0$iLU©H\0\0\0\0\0ÊÚX«4\0\0\0\0\0	›¥RÊÉ@\0\0\0\0q«JI(\0\0\0\0\0	›T%š„µ\0\0\0\0\0äÖìTP@\0\0\0\0\0œ(,©s›Ó4\0\0\0\0\0I”X3œtÜ \0\0\0\0I´ÏS)X—E\0\0\0\0\0ž:îsí¶3LŠ \0\0\0\0cM\\ïz™K•K@\0\0\0\0çÊë£ZÒñÎÄÎ´\0\0\0\0\03ŽMõ]o,ãVK› \0\0\0\09boªÑ	J\0\0\0\0\0\'>s]£Uf&ºH\0\0\0\0\0ž3vº­iÆô±\0\0\0\0\0sÃ:]ZésÇÐH\0\0\0\0\0™­[fº¦v\0\0\0\0\0&0Ì·VËÖç—f4\0\0\0\0\0LÛmu¦7yè\0\0\0\0\0&0’n«wŸI¬­\0\0\0\0\0³3w¼ç•Õ¹šÐ\0\0\0\0\0œå™Îõ×:Î5¼±:Ð\0\0\0\09:Y&¤èEœÝ(\0\0\0\0\0œõK4Æˆs]è\0\0\0\0\0N]db´E[yë@\0\0\0\0sÆ÷K›I™í@\0\0\0\0Ÿ;­ã7zÌ!/P\0\0\0\0\0I–¦s½æ4‹ \0\0\0\0\0¨P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\08\0\0\0\0!1\"2A` 03Q#4BaR$bq@p‘CrÿÚ\0\0\0ÿ\0ü<Î!µdCª¬}aÖÖ?˜uê>øˆú|Dÿ\0Ô[øþ¢ßêÔ›ÿ\0<I¿‰àJ5‰qÛño¼î>©ýÇ×ñµŽ~±¯\'³\r¦6l3y›ÌÜOÖn3&3q‰ahïõëü¾í{Õ>¼¾°ž¸qcÌ.L-	òÌ3&uù³çáwm³aëî·pƒ&]ª\'ÀgÌÉ3i›	„c¿,B°¬Û&gògÈJ\\ÖÁ„R:û¦Ëc2ëKNb¦e\Z`ÝÁMkÎÔÛí\0K,ÉˆÙ3ÆŒa?¢§x}¡é\0Ÿwé_â“í¸Q¯®Þ±¾Üc´dË­,a9‚V8•bZÜMSq3*ï#\ZŸÌ|V2¯Óâ,8Ì¯\\b-èÝÍf¥³’Ú“gÚ/9hÔðýi\'Ó³íÍKàb1ò¾ ÞVjþ>UpF¡>CË?ù£`ÿ\0¦[DbDKÏÖW©ÇG5d÷Ìõò2£&Ísƒ€Ç½ßäÆ`KNL1[\"i­õk\rõûkRrLcä%Gˆ\ZZÜMPÈò§ä!Fæ?K×ÿ\0%Šb˜¬DmKV3ãnIì´–˜|¼1½…~Û¿³ÈJºŸå,9SÔ=Ê~B£FóxüêØ1Æ9t,\\JÛi…âÂÑÛ™™™áŸ_¶îî7•õÈËzšž¼¨øÝF×èçò£}L6œ@qævœ@q(9SFïÉy3Ã†>Ú2îáò¾¡ùfq/ê§ùFê1ÀóÏç“1HaƒÛÁ€Àeã|¨>ÓÃåXæh8ûhõ.î7•õÈËÔuÓü£C©Ÿ!ù±ù³¼sß×±.èyQ†A3l­f‹ƒöÓte±¼„¯éÈË%þZaÌhÒÎ– ýPqwÙ-YÄkK*O´ÊÆFfØVV14}¶›£-ä%H{2Î¦¢ÌÓŽs\Z4³¯Ò@N¿( ŒCR{^gR®D\0(Ä$LEIØûiþ&[ÈJûöe’ùÁ”Æ†YÔÇæ?¨á¾C0\"ý&Ñ\0Éf—ä>Ú³âe°Ã¯±>¦X8—Ï¬ F,ëÈþLþLþ† !’Í1ä}µgÄËcy	WÈyYÔ¸æåF†YÑüùýygË®ü„K4ý¶­ø™d>BT2ÃÊÃÄ³“å¦á–åÇžHN¦|„K(ì}µwÆY’Ê»KO¼¨8Ì1ú˜ÿ\0àˆ–`ƒÉe¶®øË!ò‘“Rÿ\0Œ*ccõä`ÿ\0à	ÜÌy	GÓí«þ2È|„§¸%ýG†S\ZýyçòcôÄëÈA’Ê~}³¨êY”ý`êjæe\"4hýŸË™ßêcùƒøòy,§é_lêzáòYWÖ¦§¨óë4ã¸Æý~|þ óy	OÒ¾ÙÔô%ù,¯ë>“Pc§¨ÐÆ‡òæÔÜy	OQzlêeù$¬pgÒ^yŒ`”ücF†\\ùb\0‚!)‰ñlê{’JøXOó˜ÜÅ•,xa–wæ?[X‚<„¦WñlêO1áòX£Ú#Œ	{æ/r®„xÐË&<‡—?Î8òÏ˜€y	T¯â>ÙÔžcÃä‘~’ÁÄ¶²½Ã¹_ÄF†`Ï˜üÃô±y	T§à>ÙÔ|Œh|«°35ñ/rþH1*øÐÃ\Zä<±ú¹‚\0ƒÈJŒ£áöÍç“\Z*»‚j˜b88›qÜdDÕV‹‚ymZæJÿ\0@þ!»?H_ýLÍÓq›ŒÜfã7MÓtÝ7	¸MÂdybby	\\Óü~Ù´ó\Zc1¬DìÁ®TøŒÃâ·ˆQ\Zû¬9æzv7piÏÔÏDÌ°Ö!I²˜òÇèbbbbbm›L÷ˆ,aßÈ‚åúÅ`Ý!+šc•û`õ,2ÝJ©Âû™½[;à\r1ú˜ºu•i”ô%z-Üž%ºE­s™¨LàvI=Í=%Î~ž–!HÀlþ.f@yuæ\'^Bw6©úOILô?ƒ¨rà~Ci¬ç‘4§‚>Ø°áI–³jl5§ÀÔµ(„ù(šzÈMÐ)³<BÓRŽ}ÌåÎO>^ù}‡«‡1„°pa¤?(‡Ÿ,Àx™‚$Ž¦ Ö¥ëšƒ#í†PÃz§ÈÚy†±} DñVËçá§Ë#K8ùÐÏ÷œAä<„E<ÊÏI¥1añûcPy–÷ä\"8ÈvXˆ\'‰~ñ)n1kfÎ3Jû,?0ŒœMMF²T÷Œñ,Ð5j\\²•ˆ´¥­Ï>xòËÄjYT1ë˜ÌÄÆ&8ƒÈA¹_ÆP}¿lßÙ–÷ä\'¨Cf!þ«O÷\r<,ââg¦+ºìu¥Ñ\nìÛ\rŠWƒ¤\nÉÎ¥Q®oS«4Õ–­”OJ‡k*\0îÑ­{G°ÚúÊEV•^«þÖÉEifWìuÚÄJ–º*WuÞBQë{ëº„*ŽÓ>…ÃNê«¨lË6ª‘Káy]=\nà»©¨«+UhwKô¾šï*—;@åôÖVB°åªdù)YˆÄA4ü‰§èý³fYß•:c`ÜÇb&™Ž°jê+´žIÄNoc<7÷\ZT}M?©þAŽœ¨ãQËõ›²±6Y·÷wô}C—¤ÄZs(¨OM‚\ry\ri æ#¦`{ÈõÍàUiË´­F¦”PBšµ±Ö³‰fEh¬ÛœÒVóq#e[Í[ªÆÿ\0ýÁ*RÚvUåmjTËYML\n\rîõ[Mœûœ–5Rçs;úêÙ\\•°±Uvµô\"©ÙÐA4ÆQõûfþÌ³¹E^«sñ²Íüt§³<=ÉLv‰­æÓ4÷š°•j¬©\rkñÑjlR+Ùd.Àc\'Ädäå‰ÿ\0~UÂ1¿1þ§#ýD}ŒËìõ\\²çhb:$BIîWcWÊ°Üç“›upÃJ¬50qR	\\.Ô²úÙÅ¨XÖÔœÃbæÖ^»Æú@<´ï)úý³f?sKîV¬|ñQ°òªóKw¨`¬Öê‰‰¢âÁ,,ê0„J‡pŽ\'¦HÏš,A1ç‰,L@&&OY0<´ýÊylê>F?pGu*ãú«îk´ÊIÜéu\rkÅOST2æs14Ÿ¸%‘£Ž!¯1pˆzò,A1çß¡güZzÅ ¦ÃÀS\rñhQ‡a¼»€y\0„J{šÛ:‘…øÌk	ÉÃX±9ŸC5+ï3‰¦q4qÄ\" „K8@A;˜€LJ¿qf«Rh º?ñšmO¯ž6Ëµ¾“”Æ`ñ%ú©šÜ5!€Š&& ƒËL›Ø‰§øý³ÈÆœfWˆÈA9âxb`¶c&­Šž³™8\"n÷`u¤|·1Ûè`$Ç†¼LG€A\0˜òÌÜ%\\Ø³Ä»_/\rÿ\0)­F6’›ø\"^	Ó¨®–Ò>3ðÖñ†‹µh9€LM)ÃJ†3öÍý˜g¡;Læ{s<,f·‡ÉŠIbG©Òî.#Ž`^Iê8âˆ°Ç w7¬Š\\í^ÓÃÉù4ü+ò3n™?ã=}0ãˆ4õ9WÄñ.×ËÃ{i¨ÕÙS•ÀñÔ6ohÞ ùöâ}BÅñÏ*1©Ee\'@fu+<æUÈÏÛ:”ÿ\0ÜU, ¬íÛ\r*ðôN!KþfbbR=â4hýFÀ›·p ±«Ksö…ðÿ\0ù¶chôõœ¼\Z}-¼.3©Ñ5ä;‘\0ÒÕ¸ü­Ô½‡$ðI=ùø{‘a_§‰v¾^þS[û§Êßí¼«¥ìQ%\\éš\'Pñ+Î%öÍÿ\0(Ã™¢˜Ç>žëX•×u1Â°q™OÈG‡-Â‚cé®# M=EîÛh—j«Ó}Íâ6ŽU­eV,w=ŽÖÌrzêhîõ“\rËx‘ÀQäˆÖ«É·Nôã–ƒ÷„ñ×ËÃÊktù[ý·—‡þÙ˜äÊ·xFèÊxšÛ7ö`ëË»3E’N&òf£Ä]X­`¥ÔP5¸¬C§´§ÓKSÚÀ¨Ú¦”^_˜úµNf6½×œVëp	¯æã>~}æx—øùxwîâ_òÐ~èž%ÚÌÏ\rÿ\0)­ýÖò³4Ç3Ãÿ\0lÂ92Ø°JúŽ82™GÇí›û1zóJMî@á*¶´>•q‰2ÿ\0Üi¡b·¬·H-¿{|l×íq]XÅ¤žLioSÃôÌ×~óA4«‚ì7Mr…´…Ã¾fx—kåáß¸g‰t¾ZÝÄ‡+åá½´×~óy7ö³ë<;àÑ»3MÍ6	WÆ7F\"<§>ß¶oìÄêb¦®ßÃ ©~~ò3é/ýÆšoY®·Ò¨ãºF]DxÒî§‡~ÑšïÞh\'‡~Ùž!ûÇËÃ¾m<KµòðïÜ3Ä:Xfƒ÷„ñ/ñòðß“MîŸ!Î–bWcW¤¬îi”­.ÇªºÑ”œÍ?Çí›û1:ò¥wXÓWg©k4ðï‘‡©ÌÍ\0ÍË<Tü£÷Pc™x÷™oÄÏý©¬ýæ‚xwí™¯ýãåá¿&ž%Úùxwîâ\'Ú¾ZnÄ¿ÇËÃ~M5ÿ\0ºb£7@™HÛR‡â7‡‚r¬@OEì±‚š+ÿ\0ŒÔêU‡¦V0±º2‘4Ý}³ÈÄëÊƒíäg†Œ¹×ÿ\0™ž[7ãÛâ¿$ÜYYôÁcä“.øÏý‘5¼ÐOÒšïÞ>^òiâ=¯––ñCî##S©õÈãxzféâ\nX®9‹¢µ¾›f—Jh$““bÔ÷Û–ÖÔs/ÖúªPÔX¼86;vZ\'é£õ‚7FU4ý}³¨ùyWûvFìÏýÓ,2¿‹ÙÌ\0ÀÖéž÷]½S¤¯O†os_fÿ\0ý4»ã4²&«÷Z	áãúS]ûÍåá½´ñ×ÍP·C2½\rØÚSL¸Ì}eIõÉÿ\0ŠÇÖZÿ\0\\OswÌ“ÜÜP!nŒ¦iúûgQò1:ò^*°ÆìÏ\r;l&oYg‰VŒFÊn[—rtÄ“ÕÚ£} ƒÆ—|f„Ef§÷Z	F·ÐB˜Ìw.ÅsAVÄ.f¢©@Tò¾a<àÐVœ±Ý¢šx–x‰?,µí9nH¨˜)XÐº2™§ëíOÈÊú„sYsÃþfwÍ§…±ÜÃéâw±)ù¬ZÍ¥£@–üf‹öV_û0xé´Dû¬ë]«\n¾šw§ÔÙHöŸiñÐ÷YgÈ“¶\"-?Ì\nè*ÔIâX6‚¦iúûgSò1:†?öÏðï‘‡©wÍ§…üÚx‘þ´§æ&Ÿã.ùwSGû+-ù´CZ=D°Fžž°\rþ\"ÏÅ~Ðª\\Ä¬(Äô—ø@êÔ]¨¥Û\0É«ôÂÊ¦ŸãöÍý™XÊù0Ý§°yxÈù_óiá_&ž#ûÆUó^kDioSH?¢²Ï™‚xíoÍ¢Ñü˜\0/˜ý0&Ò ÉrOÖÑÆU4ý}³©Q´…)¹kr¯ñ\Zm3ð“V–ªÉÚ0\\`â]óiá_\'ž#ûæWòâÒÖh‹¥JÆçæUjY‡\"Ï‘€fhZ¹–üÏšùÓqÄgUÀc¶.O#‰¨øõªiúûeÎòV/Q¥Éê\0£–¿Où[áÖµ¶;7vve¿6ž>sÄ‹³ô¯ä%TçÜÒíR×Âòu=½™á¿‹¥²æ$\ntuÒ77¸ßâ\nƒÄÍ“æ¿þŠ.ã‰êø‰©«Ô±_å]Å…ÕŒ•[X¤•)•Ï×O×Û%°sÁã£Ô[OI»k,k³Ÿ	8gŽs“-ù´ÐJ–°Ä²ja»M5ÒýGY³q…BÍž¯ñ¯Úžâ×½Ç,g¤XsÀZÕzïÉV¾›ù<ÊÕìË.u@pk8”ð¢iúûe¾Põ;š¯íSËCóò5›-(;×8¢¡RÅ­˜dJÑËæzÌ#G…ØeAái-ÜJÂuPù¯ê	YÚs-«Ó9«BTÖ^ÆË’Ñ$Ä\0M?Gí—á¡›±5ÛWå£?Ôò¦§\rmê-mE™Š»@>B41à­AÏÖz‡Í|Çå?EƒNïƒ€z‹€%AvrÃ(ÙlÍ?Gí›¾BÓYÅùhÁ6\0\"¨Q“<CT×6Åá(¯hÜ{‰Ø†þbÈ¾côD¬g“ñºíçŽ±™Ô$J?™GGí›û}3fktõ‘+­¬mª2tô&‘rß7rðÒ’f<“¸aŽ&<Ì>cÌ~ˆ“Kc´nOÖm\"1B=jXJWiÄÓü~Ù¸e3â¦)j\Z,‡ÑÐ©?å]ï¨¸p?Ýß#æ½Ãh|Ì>kæ?J·(s-¥Tú‰í™ÇBdŸ¬Cý(–‚2G¿OñûdÊDèLMM%½ËØ¥Øó4µŠÈÄúK¾GÈ£˜L&1°…„Þ¿Ì.¿Ì6/ò\'¨¿Èž¢ÿ\0\"-‹ŽæñüÍÃù€‰™ŸÐù¬Ÿ%â™\\Óü~Ù\'œGÄ\'˜c¹eê§Z—\0™M^¡‘ñˆš‡vÁëÝŽ\0“É–g8Ìlÿ\01á†dØüßþ`3\'ù›Ûù0;}	‚×þg¯`úÁ¨yø¦H5_ÈƒT?ˆ5*™MÈà¡8Ž\n7rçj÷nv‰WSOñûfÓ†a‰©R£;¢Ú¨9©Rº–þ 3vÕ¹{|½Fë&+Ža\Z\Zúx˜òäLÌž¦b)s…?ƒ´í0d5[» ¥¼{O¬Ä`Ê¦ŸãöÈ\0¸ÌÖØÅÊç‡?Ìn¼©ù‰ôš±‹Ošö&y†5.Fì¦4¯IeÃ(2m8?¦?6mGqò_ç$$öI—¾™?;kúˆw%SO×ÛfOZ“—2ÃÌn‡•!ð\'ˆéÚ—ÜÝy/b”hçþÚ2­MÕ®Ôé¹9=„fè\nö€f#±\n0ÁÄ·G]tÝå?F±¥õ6ØóÒ^µ¯ûbœò®…KÕO ú®ŒoNr¶Úßøªí;fŸãöÁ–w.<Çî1àyWòjž$¾µÇzJ¢À„í–h´úvþ«¶x}¢Ä;V†Ó—ôÕyÖÒ*`W­êšpXek×.à¥/ˆéÔ/ªƒÃÀôsõ¢Ä\\Wé«Ô)TÍ-ßŒB¶€N•==VÃ5š…¡‡´3èõ‰Ê¸¸%ä¨]w§O©€cÞ¶Z—øú‡U®/¢»iõPm:}9½°#étÔñcÖ…\ZRîJ4ÍyÂÆðÆÿ\0VbŒiãK¡Á;GÔA+s[^Ú¯P‡¬e8,q4ÿ\0¶²]Ünã’|„ÚEA@Ì®¦jÞ»\'†‚º€~$®Ò®tSF¬³ÄÆ\\3¥˜Éâk›nŸ½ìÏ#Öa5º·¦Í¡Túƒ “Ka³R÷âŸ5žû†x—ïM_öÓE¦üCàüm¾1Øˆúž¦˜¶6ÏÓ-õ¹‹;1‹ý‘šOéé‹Žè°¥šôÔq5šŸ@‚\0f±÷¹h ‰c.B’%sOñû`Ë;—÷¸zT.ûD¾Â˜4Ú—mCVç!jôõÜuâƒ™G:9¢lÜ³Ä`¸1l©©Ì(ÓQîÝ½µš“yÿ\0ÇE«ªª¶¹Ã-Æ«7¤m^ŸR¸´%4iÎæy§±k¸9á5÷¥åJO¹)r\\àk­[mÜ‡\"½E:Šv9Øh¶½%¥Co®ý-W7¨®\r‹AE`G†ê	­¸—øs—,˜+m~–¬Ð0¶“WùWKz;¼EÆú×ëâŸ%>båsOñû`Ë%ÿ\0#³¡å¦´S`r7G³Ô÷%ö5Wn^µV³,w=aËÇqë<iùhcCÕYŒnlzömÛ“¶»Z£¹NÒ<Nß¨\\µ¬ï½¹:½Rê\n\nÁw+êiþ?l¥„‰¨<Æî1ÌJšÌíŠ2D­À\n35úg­·±\\yª/áë {˜\n1\0à)=Ëjp7!k¥í8@Z5.µtÖ\0ISçF\r‹™ªÔ-lôÑ—WB\ZÅÕpº1‚\\©xAc×-[/`‰°žqå¡©lß¼fcÊŠ…Ï·!a$@sA*2Ž¾Ø=K{—÷¹á¨­n[•z¬KmZø@È¢Æ#tØítÆÝFÛC*¥ÛhDÎÖJõ³ªz-«s¥Åh‹éSo¥§¬€	¼zÂ³õ\"Õ´mÀ¦³é›¶õUÍu6;¢TFB0¬ÞrµeƒÙâW¸° 8U]Ä¥ÚOIwnF”~âÏýãû9ev QIUPjsÆëìÂ«eÚÃÚµ(›iêÿ\0\n5åÕ Jëª¡m‹¼¶‘\r©ÛüM`©Xî¯H¬»™…b­Ù¥`¡ù\0]$‡Ýí\"	_Û©wy—CÜðú™ë·gÊåÛmÆjØæŸâ†Û¸Žô÷5º¡¸æxkYÀù[~¥ÁFÎ4aV®ð}0?íë–6Êêi¨Óµ­¾²\nÐ¥ªO:RvD¨¦ªQ`®ÚAÓ,­<AƒÜJœ*H¤õªÓ­öo€j¯]«Mjüb­•‘¼i,ÞP¾×jéOW÷5:vºÅ±9E±_PÊÒPõµ…ñ»KY ÁÓ©ïMýÙ”•½Nøj¨Zðö%Ö5bæS‚Ö]¸òÄšÛ©orñƒr³³KÁäê«5ò}öÜ·5aaÔz[†3íE»×ÊÛÁÃ[­ºÑµ›‡Õ[`ÚÌHÓ»‚}¤˜Iþa1Ï?£˜	ŽËÙ&-®£\nH™NAäë-=±”êžžûþ ´òÕjMvú¤dÓ¨©vSê&¢»r­uÈén#ye^H‹ÜI§øý°z–KÏ0Êüªù‰¨82Ã–üšo”1¡ßë‰Ÿ.¢æ¹q^âÍ?ÇíƒÔ³¹~Uža•ü„ÔaäÍ§¼@	é´ÒÖs˜ÕêAÄ)=æ\rº£Yý-§È¿3‹ÜY§øý°z–Ë»ò@Iâ*çýJjÜÒä;H1+Ü7K«36„RGÊ³½4„Kvö&[ÂÊÆ1\ZÀ\"6.LýJôLù‚Ã1éëÚ A11\n‰°M‚ldÛä\"÷Í?ÇíƒÔ³¹rs˜õÇU¨ÔÃ§}Ì–Ô,L°ÖÄYõ=²Ô*ÄJŽÐÉôÓaâT¼CO©ìêš‚ä3db ñ+%¹1ŽÞDwÞzæŒ€–fby1116À9•Í?ÇíƒÔ³¹oº‘´Ê˜gMP;Û§l°[.ÕÏÊ×õÎ~´Zj9ŒKœžöÙÌL+q-2…Èº c•µ	î2ì$Ò·0ÈÈˆ¹y´Ä°dÇ„!×äœJ¦ŸãöÁê[Ü´àÆþ~´\0çžË5g%»ŠµÖ—^fOUpÑÈ€}e}Æâ+àBçfs=‡íêS,qÑLœM¤EÏQÆÛÝ“.³I3ˆ0yçÈyù\0•ñ4ÿ\0¶RÞåÑ[<M-jrL±NÖ¤Xÿ\0“6F 8…”Ärx1+f€;kXÜÈ1_^ãÊgªÌ£ KFÆ8ˆ¹=0f£°bÙÈÌ|g¦y0Á1–|±ù„ÅšoÛ©jýeÐp`¨ªnŠMœ~Ÿu[GÈÖ`By›¦–EdaËÖÓ<|È,6H(yˆyˆØpHà`³	YÊbjTŽedãCg—6`3$D³ŒGRN`Èýü‡‚ šoÛ¨É•ÄÕ.Ó4”‡;›­MžÜ@p%/¿òÔÑ±²>!g¦\'iëM¨vBY‚‘·Ý]´­£kp”%[½¸çüªUÙsÆ¤c¨‰cax‡˜¯NXo<Aõ–\'2ÊvŽy˜˜ü¢<‡~B“Oñû`õ\ZÀÕÃ\"i_üà¡ÿ\0Q;Ì¾íÊž¡Œ8ŠJËÝ çé»hZµT–÷}IàYA¾LÔgø€q†•ékaÎcék K‡ÿ\0Ô^1È‚ñÙîk8-Z;,úm\ZªçÏ>CÌyŽâM?_l£˜ì‰Bä¬~BX­ž$°€qþöî…?˜ë·©Y+×Jp·*wWì=Z›eVì<ô0ÛHäj\nÉ‹aJì\0û§­íÀé¬‚1	9ÄÓèÆ[Ú´é+«¡“<Kæ?(‚<„X’Û©gq\r/v¨îQ7mÛ¥`Žc‰œq+!	cî\"Ìû¥¤7#ˆ†mb8Ì,ÿ\0å˜[×Rqïn›Þ¹øŠõaöµÚ\'_pä-eº›Xõ¸ýbõ˜9”~ØƒËÄ~b<‡3q˜ƒ¸Ê>?l¥‘ŽÒsž~–û£Ž%\'=L‚e•VßÉå½¾éM{ae:*ëïÜØ©r‚§ S9ƒƒžÁÈÌÌÓê\n¤–Ge­÷Ã0~¸‹Xcƒ-RªqKU+ˆNá‘ÔñÜù!Aq&ŸãöÁê[Ü·¨é·ØeV`MñŒ.§o½bîµ‚‰§ R»G‘—ð¹oóôFÏÆ%?)kJò@?]›ÌÔŸiQØ€’9”üËÄ~cÏ¨AC¸“Oñû`õ-î\\ÛV7wË0Î àñ3žâ0a´õpj”æx]9&Ãå~¡i=¿ˆÙž\0ñëel­í`qò8ÁÈŽÙ2®É„däÍ6¡UÄ±Õ”2ðæÀ\0b2\n‚øúYŒñ)ø/—ˆþçäAä ƒÈwiþ?l¥ÍWÇK‘Ì6•ÀK´^DLƒþµ6ÂÍ~J!8æ[i¾ÜÃBÁ±\n6!~1 ñÓ$;fèŸ„·ní§œÿ\0Lœ\r˜l˜ã™OÁ|¼@ÿ\0SÌLãÌA™‚$Óü~ØnŒ³¹yÈ„€grÃÄÎ%6g¸,ÙŸàRÀXû*b%U3œ(Ì:qœK!ÚxŽ1Ú`Œ£H×ž8áx\\©ÜtÕ†´+u¨ô¨Ã‘Î›R5\0ñƒzìµ€„<®ØãÝ)ø/—ˆ~äZŒÆ¯lAy¯q&ŸãöÃteËO`àLg¸júÎVVÞ¯·HŸ÷\n<µU“`•Tµ\rª<µzqzÿ\0æã±ôPß… *ðÞs1(Ç ®ÍdñO’Ï<°š¾.h¸àKÊ—ÊõOÁ|¼C÷DTÊ	zcÈ~Aò^âM?Çí†èË{—õ=@s:ŒîWŠÛ\"xpÍãò™­M–,¬¯?M(Ë¨š¡O¬ünž¯Û¥Þ¾¥_ž+ÚÏ\nù4Ö~óM;àóm$J~åâ?¸%< šÄÀÏóCÉbM?ÇíƒÔ¶j:‹ÜúAæDð±ýcäN9–x’«aFåG¡‡Fxšû”Å &;ZH[x¥e0Š¥Žzd+z©ïÅ{YáŒ±\'VÁ­b9¶Óþ›¹WÀyx—î‰Cœ-¨Ø%””<Áæ óY\\£ãöÁê[5E83N¼Œiáº|¼FÂ•{`lObjÁ†x§øÌ2¦åæ82ð´k«uÛaÃ6§MO(cyõ=QÝ×½ç/3;Š3û¥_òñ/Ü…¹E‚2qæ<ó¹\\Óü~Ø=K{šƒÄ˜:Î¼3Ã8»ËÄÇô„Ç9žûfâg•m5¶~˜Sœk¡\rˆx82­„Ò¤¨ì¦%Ìsî•üG—‰|Ä®í«=C„CX°gêèPàù<Ä•Í?ÇíƒÑ–÷5?¦¿.€í½|µéº“14	²¡˜f½÷Xek¸r 2Ü0ç²Iîø‹Ï&j0TÜ@r1,å¥	¹â6+0ÁÌA‘Ê¦š€¥sæ<ë•Í?Çí†èË&«ãˆN`o:_eŠÞLKáØnO±FµÅjXÍÛÛq›ð!mÓÓ\r‘ÿ\0ä%hHÌ¹r¦\nð›Ì¨r%ƒÜL>!aQ½í8Éb”òàmÁÄ	›¶Ë,-ßä%lÿ\0˜k3“\\Óü~ØnŒ³¹ªøÁ¯!ŒEòlŽfŽáu@ý|üGRúkÐ~bóÌ ƒ‘¤BüJÏ1gêÉRÇ‰»jm3p!C+9|b*m°ßá;â àöz†¼.aã¸OZw°à\r±4j–>ÿ\0T!rxÅ[jå¶£,îj¾>KÔÌgÍÓ9š=YÓ·ò•ê+´eXG½e˜MGˆnö×-*\\õnyæX08‰ÜSüËmÞ„Ù‹w\0-&TÄ>éKŠ~csj5$ uél·œŽá%×#§Xúé EËÕ£ÜÛlm­]K]d‘–uÇ?p ’ešµÆ±¹ËšæŸãöÃte“UñòCíòù)ÁŒ0sô<ElÁþãWüL}>µ©\nL¨s.P€ïÆ\"81²z‹FyƒH£’Lru¨|œ\"9\'“˜mÍe~ˆÓÎIµMŒ	Û™°w¾Ñ«©k#gÅ—ªhÔ·õ~M°ÙF7rú¶3×íŒÅŽ[Ÿ*Æx×ÜÓü~Ø=dÕ¯’uù‘¿˜è#•q•ì6{àòD.Øänƒ>˜Ïkb²ž,<jiôÎAÜ²—\'¸,ÄgÝÇÒ½;ÞIAíÔPõ0Wî½;ØÁ@æ­o(çl¯IBÎ^**V@Îïói«!…`sö%6/¸i\n¦Òä)gÛ³nÒT»`e©åT¥\'ÌLƒÏzÛ£,š¯‰˜ÌO!æ8€Àgp€{Œ¥?Ú¡ÿ\0‰Œçë„¤Ó±ÚÎ_MqÛ€¦ÃeEìÚŠQ®Óúá˜\\zÍã‚£J­f™•~JÁ®}Æ‹¢Æn%7‹œí`©I<u(”³jPE\n¦—c—c\ZµSÀÄ Œ€eìÙ	^7Ap\0mllßÐÐªåœÑg°|^ÅL+rPäæiþ?l¥Í@Ê™¤EÇüƒýÄ0ž!0Î\0Ümcm¨ß€·av\"i´ÈÉë]ðÓUS‹FF…í*\0TºÅ¯P¥¸ší2¯õ—‘]¾…›€Ý5\Z¦Ôcv\0¡öi\\ƒ†ÒÚ(°µ™”^Ôbû•µVZÄ®R}­î\\\0¸Œ±ÜØ.e\"Æ8A´Óa²À[°]^¬\"ïM-©^àçÍc:lÆ\"Ü™\\Óü~Ø=orî¡QžbˆGäÑ ²åSÖ¼5¶ìEâ½\r¬ÛN[¢jÊ¨;¥Zz²½ôv¹;kA´jÌªÆqnNeÊ¸ž?¤ñi/B Mb%–ª»m\Z«ÐV(¬ï±•:h¨	?ð_cEr„™~¢«nÌ¾…¤§¤ŸÃ32‚ûÓNªÍbôÂ2½¶QgJØaÔ\"{0]Mö9lŠTm&\\ªiþ?lŒ²]Ô$4šc¨$ghÔ%4£T¾ûNšÀ¥Ê¿ôÇ	}=4R\r™õ|1€¼3*´½¶:¶k,;jÔZjuøê­Z7\r½joJ±_E‚ê‰\'­Euú¡:}¢ž›.èuÎ7mÂsíÙ“´Rî¦À=°ÌDÒZë¸/\Zm.ðls±Õbµ¶å]=šƒ½†Ì ?´ÆA¨ç«7•¬ ÖêQYù÷>¨³DÁª°ÇÝt¬@ÌsÆÐ2HÇr¹\\Óü~Ø=d»£.ªµ¢·Aîðå/ê(îš}\n™[õ6K’QX©I-j²ktø??þáe]vf†ê–·®Ó€nMA®º¢Ü-.Œ8mMJ+ŠûŽ_,\\ì\0¬{IÁé§¦ÀnÁÅ?Ù´Óé=§j×z©÷&£ÓÝè(÷ÉfIUÕfêLÔP(´…<#]ZŠÃPØìÆÕc²‚ëø›X–z ›1	Æ1°S°äÂ}Oj‚céXŠqZ\"Wï¬MHÅ¯+êW(øý°Ý`—te¼ij3Ã›÷ïLÅèbNãkªó-Öi×s—}r\nu&ÆK\Z¶§Ö3I9•XÕá—åvºËFÓ…(:7l\rÚ}5—)Ø8\Zk,°RÞÓªªšÆ+bÏ¡¤]hª®õ]ê m¬mÒ¸šÁŠ«\\­Pš¦ÙªÜzÔé’ò,/µhm=~ö\'{_ëZXðþžeª	%zKÆÂÞ	!I•\nëùKŸÔ ¨÷-©waµ¨Ûu˜qº>tè¡8€ìw\'«/Z‡§ò6¿¨Å¥r¹§øý°z–K‡U¨ªºëW÷5ÆÁ@0Úè\níEkœ(÷5µš˜£w1+­¬`ª2WÂí ç\nu\ZEAÁÌÓ&žÐQW2¡-‹.&ŠêTâj.Z/Vn¼CN}džÀ[ƒ³CÙkð©rþ#uzêÍam—Ö3[êˆÚÅž-J;n¤Ôqô¯ÈÄzlJÃŸŽÖï\Zm­ŠÖcºšöÄ€Û@šœì¸M]…‰l¸2”Û¸¶û²\\ð M§Ç\Zz™ÆGÅÔ(]³Oñû`õ]Ñòeú®¨&²Š@Ð7[¢ÓºY]¤{uºw]™n†š—hù½JQéÛ…ðó‹Ö%…¬¹IöªúšDS+%-ô€Åiýµ³	©®¶Ü¿QM×S>ž¯T¶(®¾+V*r\rš‹-v,–d6•e‡@‘JÙy!>7Òõá,!‡¦Û¶ã%ëjþClU”È¶Áé±À\0ª=µÞ†%{œ„kuïî&Û˜bšTòD;¬\n@ŠÌH,6£`>Ü\r.sŽ:ŒþZÛ©d¸ðeï]º\\ Äð±ýq4Y&UûuB}ºŒõ­mºŠ³Ö»ñ$¶ÏÚÐ·¡<©®»m$ð5€iÖµuž)iø€°Ýf\nçÚ žjÙG•i½‚Íf”RÊ©“–ïCf\0\Z}Ù_¨í´j´ˆ=8€ÖÂ¥_é­\'{óéÓ¯ %g±N éÝ˜\rÒýCjsAjªRI–kP7KuŒøØ=1Vë‰w9vÃfÆp[û_R@Ê‚ÑVTÞe\'ú`µƒ³ñ6ïö§Ç3Oñû`õ,2ÓÄ ®•Twá­²õÝÄ¯JtÚa#m¯U03Y­­”¥SY«üKlm]Ö®ÆcµqÑé4ÆÒÞž0Wzõ&UK;¨ ãW§5X¾À:–Ü7Q¥¨ÕêØeÉ]Vè£!cú‹Zw§R¡•Û{×ý›K\nªcÖª»¬#Ò8J\rf¦®ÆšíEv\"¢Àq˜%z]Ë–;c¡Cƒ+©¬8Q™QÂˆXØBŒ‘f«Þ©…¬é*U#’Ú¿ˆSí+ûbWz¾ÄPCm¹vžÕG ·Oðû`õ,–ta×Õ]hˆ¶òì_âl¹í>ö-`Í.˜_¸±Ú4Ô¢’Öà€¤pèõº`X6Í%/`}­±hÒWé-Žci+\Z…ÀöÛ¨µoT*uÛì¹kS(D¬:),Çû)«ê™rm½,lmÝUìXeuJ´\Z¹Üú–º±^ÄÝ·ŽÞc(ÆAòÓW´naÎðxÌ±M«íRg†pÍ4ÔÕb‚ÌÊÂºÍGØùÍÒâ	±3îÖ`,_’¡|9›W¸^–ü÷äÍ?Çí†èË%œÃK¼ƒ¶±¸…ž%BVÉéŒðë $DÐV”1a¥®ºÒ³`Þõ(Ó¶‰â-¾º›ëá§\"ÈßÙ×5æÅµ\Z¡–ÕX\nÖ_Ú÷ªåµŒmVž¢ÛI$ë?¡è.Õ½À)à=ÏgÈ–ó<c›9lÆ?5	u…[ªé/fÔí´Ì\nå·¥”Ò+p£›ÛÒFÅzØì\"m©ÈV¿N¬±°Ûh,Ä\"ª`úcÞÙxŠ\0•žNc{xú,®iþl7FYj®k4É‘¶hÆëPKP¿¤\\`ÒÅµ“<4’mÏ{;/LÛ×Q‰« ÑNÑêR€áóŸÄ¡j7Ýi‚µ—¬¹ÝaÞNq3.@gˆP•*lž…›wm;iÐ½«¼|jÐ¯¨Á³Q§©©õjK•DïQ¥4(,Ù:.3@?¬Ò¯éÖŠÜ5¶(õ—#u©[¡FåßÊvšÉŠ3Ä~±…”ÔHâ\n;Ÿ…ÇÄÇÌ®/sOñû`ôe½Ç‰¾Ý+WÙÐ)[ðÝÕ¬6Rlr7]©¢›…Õå¼BºÝš¤â¯¶¤ôÔŒUb›:Æ4çÚLM8±K©ÓR-­ÙŒ.\rî®æ\'hRÍ¶öÀÀYo‡…÷nm6ž´¯Ö»­UbË+SÐß¹ƒ`U[Ò’½èòÔ9ííÑÀ§‚Ó³\'$’i»Ð³y£j,µ­Eq÷XÙ°î&•#Ž\reœX}¸Áã¤}ŒGÑHÇ0a¸0«`8¬m@  õ75)•.Liþ?l¥½Çæ]®f\n¨6Ccä¾pÀÆòÄ9`¸;®Ñ[Bïqí¡È­bT”Òê‡&êÑj¥€\0ŸîÀ—;êoôWÚ\"Ub×™z“¥@¢^á-¨žµZW±‹oÚ‹r\r)B}ÚKÚvèöX â¤GÊs˜¯ˆFL*W‘+l¯0…úÍ†…$ýUs\rDs³RÇg\\õò¦iì-–~õoÈƒƒ˜>SMñû`õ-î4²‡êÿ\0‚\rÌ«<FíXL,>Cª“CPzÙ=Õ‘MifÕY½ž¦«‡Ô‚4„õ‡€o”d%ùK[M[cj×2«–­S3p­ª¥­yc^ªêkí—Þ÷êtÌ\\¸í\nOQ5%F:Ã9^#Yêc#Ýuf–ÚNé¦Ózû³™H$cêS<JÎÓƒ3‘QWˆ÷ÑôŠòÛ26ÆîWÈ—rªeÀ§–úi¾?l¥½Æš‘·JÑ®ëK«`+-Ýn[Ub“Æ˜âšAñÔÀÊ¯Vé¨5ÕCT¬«·ðö;®k„L*µÛE[°–RIË3Z¶Œ	êazåîf<œOQœnQ€útH=q~²½¯‚p¢ÝymÌšdKˆš^ÀlpÚs‘1ºX¿X­‰@,c\\kI‡&D\"8 ‘…Ìr\n)rbœÖf›áöÁê[Ü~Œ¼Wm;Täè“ÒÔc4úµ5k{›ZRnOr_âÝMcb¶²ÖÝÎ!v~É1Ne¿Ê-ÚFï«X=Ægu,¨Ä#œgée¸JÈ.±¯ôïàmü%[¬gèW]õZŒë›uÍŽ;é‡ö¬j\n5Á·ì‡[‹YÂïZ³ÉêTÂX¿Y]líÒÐmî=ê àÃÄWÜJë_¿ž«Ùi*8Ž~Ò]PŽ­ÆÜŽ&›áöÁê[Ühö:ûTíVËœ³22cp\"Ä©C:ƒÖ¡E–‘Pö²8aƒ¥ÑÁv!*±oQ¿¤úõP\'íßb[hÓ*€«qüA¨|5k±Ðu¿H•õ¹êù¬zIÔ‹ÃÕUsfxe›w£¶âLmc¤{I±›9\'É[è%562ñ*^æÕÆ1…àF|BI<M`Æ\ZYyèM9ÃOÄmK}A†a´\\›mT¬sF˜Þ¯-YÀUú[ði¾l¥Æ—éJÖ.-<?û…š¢uu\'mG‡ª(5’ÓÓ¡.J}Ãúë”\rÞ,(ÿ\0]§¨Óšá¨AE¬7Í>¯×µFÝêj5\"ÖÓdÚo$m¹ýG-ä­´‚%ºËmcÁ\\Ž%W\Zƒä<Ìí<LÍ5AÛ9ãx×ÜLHÌkI‰~{š‹Ïne\ZvÔ1±ˆ‹îdQ<GÝX\"Zv;ÙõÓ“¶¢y-fÅÈì7ªåŒ aqöÁê[\Zk)JZ>ýÂË1ëRöê8FÝ\rlºíÄ{J›’ê—åâŽ-c™¢j*ÖlYW‰znäË¨Ö›]Y§/ÕÙxÃž\rŒF	8ü€‘çË¯:&’`9›€2«Àã1­•Å­îSg\nE-jViêô¯pS¡Ôl?=ßrKëaCîŽ¾©zþ¢õ®¿Oÿ\0äL·-ÌCÌ¯‘Ÿ¶RÞãAIJH~˜®ŸU†>Ã­AZã›5ZáxX(-ñŸ)7XX¾ã¹‰ïÏ?œf31å¦¨]`CÀÖéÒ–@æ=›¿õn‘N,\\–¢±ø`1Í~Ý!‹]z{QTJÜ¶¥ÔôÌ[HäÏÔ,e:°õÙê˜ïeïê/ôÆÀ88‹(øý°z–÷¹™€’ƒÉŒÌÏþwÐ-t—c–´žf‡‹Öx¯\"ØÃMÄœˆF\"ú#*l®^=:%ß¿L­\nê]Mr\r;VO¾¦²®\nÔ)8å@Á\"Ào Š>²Û©oq£õ\ZLc3ùÁîUYµÂõš!¦U9ÜÞBz— ÙðÂv}ú-7®ÙoVV\\Ô¢5\"­Zíàx·øÅ#=oÓiÇøæçìÃ¯\r;éd¿ï1<IÀdQÖ«XÑªîÛ¬¹²çla‚D¨¶?Ä™Z–ƒYé™GÇíƒÔ»¸cõÈ˜.•=KUHáèB…T	¤öÞ³Åþ+4¾n˜í[ôA-ZÐ“iÒíBïÓªbŒK,5Ó¼w§´ÝPsß†¨“4gþé¦£ûšçŠðÆ ž:ž“mÝn“WølñºY¨gsgÅ·’yæPx(D8=w¨îS€Ëõ— ”ps‘ÇJ3\0	GÃíƒÔ»¸ÒÃÌÎD#<M?‡UZhÚêÕ.eA…*Gr½5–ÊÃí®¿PãÂÓuÙ”Y¾ËÙ³W‰â‹¸\"ÍkþŒ\'ÃI{²Ç3ÄõÒxì¨þØÍì	á®\n²ýjÓ\ZïkÅõ\nú¥lû<GP–…rb.ã‰³Òÿ\0Ke#ä¼¤wä¬ŠÀóþ:„ö´c[9—8l`ÊØîÁàZ@\n²¾cŒ%¶»¸ÓFµÖ†ëz¸†±Êüt‰¾ôYâ÷â±×†Ñë¹±ýÁÅzÊ[hšGÙ¥\r\rž¾˜¹òð„ážQ¦ôY›9š¤Û«Fšó†ªxš«‰á¹Kpxš­3[j0ëÅ.Ec½M¨(+‘6ººjrZ»š¦Þ‡Ýu¶æ ¸\\›OA#˜SžCÒG+Òã=ÔùMŸ]A8AÇÆç2»U°OmËgèˆNL£áöÁ—w\ZW¦\Z:¡8Y©™ðïîVx¯ï™áC1ž¢ÓOý™šoìü´ŸÑÒîš=]–\\¡Û#V¿Ô©§Š¸Ú¸<ÕâU2ûý­«Õl\r_¶»ã.ìçs˜!•ÔÖp±êtùÈ­Ä0(èüµ4zg#ªHÜ1NFxXrbôÐþkÁ1†ÓŽå¶»¸Ñ-dª³^¬/rF‘ý=B×ˆh^öøzú[è\'Ü‰ø*wzvG‚D£SZiv–÷F×§Ò€¡¼5—[gÌ“\0%†a¨†gáØv6Ç¤/f0\\qÙˆûsåJ1÷#;g’a óõò=ÊøÏò¬‰r†\\o8ŒÝù\'+Ä$À–Ç¾’ŸÛ©wf4Ñ25A\\ÇÕ£WvO¸ÿ\0iâì«†\\³jßÕ7µ®ÕÙÌæn=y9‚y‡\0çu#oßÙ\'tÎîOfÆ^Aš“ŒÆmÇ#ˆN-W‰nööðUºÏw^BTyÀ€ees<J~íƒ.ìÆ„f˜ay%aô„dN¬ÃÌv$äÁÌëò9^£XXcÍWt~¯‚1+™_bŒ§à>Ù¿¸ÐÃäÃÈ \'pyŽ`rbŸæõòÿ\0ß’ÔÎ¤ˆF%T+®âa8„cò^9ŒÃbŸ©éÑHöö¨Y¶Ë<=‚îS¾Wõ‹^òOÐéˆo`û0;­rÓJ>í›»1¡ò1„\"mÄ˜òÌ&Å9ç§Ê%É¼ÿ\0å½€Ûž?(>Ü}AÇp¸ÝÀÂîãªkíÌ[p8šŠÕHe”ñÆN6W¿ìg2¤–q‰OÀ}³wqáò0Â&&<¾³éŸ¯lz†ë¶+=Ìs=PÝ÷rò0ñÇ™R9€g‰ÈàÄáx”!±¶‰©Uq½x4Y´ŽŒ\Z½Ã$r@áG¡õ–œ°€ûfîãÃù˜ò0ñPÃçGÖˆªXâ5ÄeÇþñ+cŒ}pÐŒ31•ÌÄ:Vÿ\0t$‘´ÌÂIŠ?¦§8ˆþ˜@½j)Ü>Tœ0QŠrT´Så³)ø¶nî<?ˆa†˜½F‡ÍT*dv¸<ÀyÌkH<BäœÌÊ_c2ÔVë¦¡eLd#¸FÒi÷Çãnt¶^VäKe%ˆPàÀq+|Ÿ@ÅªŠw\0L)Tn6æÂˆ§&SñlÝÜx!†|Ÿ#ä§*\"Žg ÂÁ°16ÿ\0½˜1SÄqœ¬aaçà\\Þa`ÜJ]«Lýú¤Œîœw,óÇ¶ÊÊ¸ˆ¸%L¬[g³ÃJŽ;…·s>›¢e?öÍÝ˜Ð˜|Ì0Ãä9A’7ò³ý¼0Ý=tþMªG°\'\rÀ$§\n}¡ƒ[ä¤ÆBY· -mÿ\0!`=Ã§öò>6`ð>#Ú`á•–3´UËdÄP{Š6ÿ\0épS§à>Ù»³|Ì0ÆãÈæb%m¦3¼~e`F\ZÖ™é«.A÷S±;ˆ¼dv„gà„çâàƒñµ6ž\"œ¨hGº+8Fq+9ü¥?öÍÝ˜ðñfÓy™Î9Eÿ\0p9R\\Ÿ—0.z€•ä@Ê}Øã<mú3Üqô1X§­Êy…8ÌC*n1ðqs)ø¶oìÆ†Èa†bÇ–!þ> ‡‘17}Y°üŽI[)ö·Ó\\v#`Ìc™JL\0\"÷*\\Àq˜yæSñlßÙ>CÈÃ„b11˜Ï‘ü‚d£&mÄàv&Ðg\"8Á3\0Â1ÌöÄÜÇÃƒ\0!ê/bSÈ9›¹2¾L§â>Ù¿³\ZÌD3DëËÌyu?ÔÙDe›a\\õ6Ì™¸õsÜTÀÌÛñsÄ¯‰žeÌ«â>Ù¿³\Z)„~S–!¸D^˜Äw\0‡ùòÀ0 1!ï ÷s\"7pg0g1ÅÁî¯ˆûgQò1ãLù3å‰‰,LLOõæFb¶ 9òÌB&ÜLyõ€‰õøÁ6O1”db\'P‘cž«â>Ù¿³7‘ògò2<ñç‰‚)Ìî;…sÄa yÄNe‡\"+b)ƒ‘$àÂÛˆ”üGÛ:‘ò3æ!óêc3>uÌqŠwqõ\0Â#.9æ¦7ñŠ\"?óäÅ<Ê¾?lê;1ã~@!ý~Uï,D¯˜Çæ‘àJìú FÙÑšuÀ\rô³\nÇ;•|GÛ:‘òþ\nü ƒùŒÓ8†£ Be*H[™]FÎ» Ô6˜Nb¤¯¹WÄ}³¨ùðþQú˜˜ü•ÔO&-\0òÝ`þ™x‰C<\ZU#¾_M´daÄIfÜ‰¼»T	îYg\'˜§¹\\®Uðlêxc4?”~CúBV3ÌÜvï%›¶6%ŽOGŽ[?ÍÕ27úpTäu§|f%¸ÉŸ˜‰_R±‰WÄ}³ªùñ¡ü£òÓ­±˜[ùˆø›²3ƒùŒà\0Ç£ßXÄ ó[€¸nao§`{9†Îxë~y…êÎeq;•üGÛ:±î\Z `†ÈO80Ï÷òò[ÿ\0Òcÿ\0)õœŸ\"LŸ©”ÄÊ¾#íX ÿ\0§ù0y#ÇäL ,yã@ãÌ¶Þ¦ãœýK\rÙÇ¿ôF<‡Q9€q)^DAƒ*ø¶uƒë\Z4>`Ãf5Ž…=í†¸ôñ‘1Ð#3©í8Šµœ&3, ¡ã˜F%|ñ+ú	ŽL£\0óÊ¾#í_QãCæ!>B#˜89Áµ\r\næ0\"2ƒÜdÇþ¿.ñ7Âs+ù ÝîÆ#ûºeL^ ä“â!æUñlê&<hbÌšÊžÍ‹ÈÁò>g±7c¨·c±å˜-ñÌ\n\Zý>ŸøŒ¥xó<ÉœMÇÒ Ï#§«+»ê\"qUÜ«â>ÙÕ|£ó\ZŸ%ž\'ûÒª^ÒB\rÆê,«æ»|³™†øw)êãØÆa9òÎ:‰k©ã˜—ƒßY¼•EÞT~!Š(÷X[”=ù2ÿ\0GJÝhFêúJÚQAÇàí\nÎ}¢ŠQPYqÚ­W¦æ¬åYv¹E•J¾#í_qãÃä\'Š~ô¡mcŠ³“UŸ†u»“¨Ý\ZØºšðÍk÷MTÇ!µ\Z_EEŠw×^šËkõ:€Ý![?Ä1„Ñ`ö¿ÀæaØ\"fÛtU\0.þ Ö!WQ){«â¼Ï\rÏ¬sÝ•=—¾Ñ˜ã±Ñ·Lô…f‹¥UPma\\Ôé$/ÉlZtxV_Qô7+\\B.ÕõÚÍR¡ë_k5Œ€ûuIH-$KuB×£‚rI0wUÜ«à>ÙÕ÷0Ì1N3U¦ü[ú•2™§V®›T~î›\'Onf„úº{*š£éik¯êš:ªAeä‰nÃ£>žviØ¦Œ‘ÁðÛœÛµŽàÔúš£_ÓY«:séUí–XmÑ–nôÚ‡§!\0\'KmÖ’._n¡v²Ž=J¯¯Y_§g\r~”Ð2}ÉáŸç4Ü4ªÍšÆ_¦¦¬j6‰qj‘?ÇWMvY—°$Õê+ØŠ‡s)×`?i©ô5[\"y5c7>%µ®±Å`¦Ðµ¾Ô;„X²®å_öÎ¯¸òšÅ¯°ÃQô…¿FÓX\0%LRW¢D«Rõ6àyob¬¬£\Z\rBéìËü|BõºÀSãmc]R\ZÈÝeF­BrtãþÉ§†þðˆBëŽg‰!zþÆiPS§7csèu6]väjÿ\0}æaÇEa¶’,žþsCýËM[Ô3È,t»è—âÿ\0Tõ«ÒC+æ[¥ôŠ† ¢ºXXÎ¦~,úþ¾2-Ö+:ÙZáŒì]»#ø€b1®Sðlêû4ç!ŽŸöá ë—\'úzj+¨¯Ô´Ö½Ø¥©ï¾à‰Äñ´1Ú¶X«±[ÙSµ>Oc½†ÃÃÔ·.,@æÏõ*5•šMw¢¾›Èšêjl¢`]h¶ÖqÀ3ñZ{1½9·\\=:Wjéu\'K‘Ò«Ú›\r€K,79r\"êíTôÇÄ1ºŒ+-É9› _¤C˜hpž¡ÕÒ®0N_PU`6A+”üÛ:¾ãÅm®¦c7µr–ÜÊ\\PõP M7÷\"jy¹Ä³Bè»¶­¶°Ã`ý`ò\'3SO¢WœÃ:™˜T‘\'¸ƒ1æO~zZÅ¶ª7V\0®Ê:îSŠ©7‹6ªÁªN“=Á’šS}¡¹‹U®À{kºÜ¹ÜûÕ.Æs-nÍ™‚W)øËŸµ5}Ç†Wªj¬õ½´º”UTc´Ô†ë)¹~4q©úÍš†A)Jê¥dµŽ‚ÝE6}2Ë_«ZúŒ4Õú¤‘íÙMÕ3V\n²éÐV,¹¶\rmfË*D¤%;&…ÝU²\0eÚÅ|´<Ql_ Ÿô÷#‚»½®°çãèPù\0~2’Ž“J¾šÚíµoÒ„(k;–„ª›–±–µ+Ú,·nöÖ Ú–cciu\" k°n®ÍéÖP¥[8TýD±ÇáÖÃ-5åö¶æÔ8±#k³³òçq¹WÄyçóçìýXæ<haŠìŸVWaGÛ6¶²ÛÊbÕ¿O›X†ÓÜ¿†ÜO½íÓ/¤NýZÎÞ®s¢ý»„ñV¼|W÷«þSSE,HV\r©cøZñ)T-‹	UÔ%II‹Íí[+Ca\n;ÓW]7Ékr«kúÙQ³Ò M)¬3¥b\\3¤®Uº|Ê”f`.iqQ÷Ü-àÛ™N˜Ü¹Ü¢]hû5¾¥*T³[e™À9ÆÒNÐ0r;}CÛòÄA*¾ÔÌ¿)ÿ\0_cêˆ\'oÕãy3úÂ\"Xõœ¡ÚF¦ÐÅóîªç¤0\\Jõ…PVê,k™ÝFÓeÚ{2ÅX=Ú…zR±òo-õÖ®¶³vž’¶,Âí8·ÖËfRWs1ý¿ÆÔz eWEEŠ+GÔo¥iÄmSD¼BÓÈ\n\n[b±pvµŒö¹-6ÌAùDUÇ&ÄÌÏéögˆîõùË¸vÐùˆ|ŒÇ¨<Ì0©òÄ8œN?&`âgé3ù€‚OZv7>G	_Ä}³xˆ=]§m9ÞŸp~Èa†t`>BgÈÃbuäf&?H¸AþÑRØÿ\0\ZÑjVWñlêœÁüEþÝWl¶RpÀ‰êƒÜŸ#1å˜?)åÔuçÜ>YLùåœBàu}‡\n%Z}Ö0ƒ\n0rbŒ<ý­bnŽ¥íq†¥ž[ò‡a·Ã®¯¡¸Èy›áqô…¦|³™òúþLý&|Ÿ,ÌÍÓt›®ez+_œmøz/.wXÂŒMÆg2š±É‚,}®õ‡àÇÓ²õÈ\rŽÝ˜ŽŒ;\\aÔ4mt\nGðŸø6cøuëôÝObö­#¹™˜Ô›ÄÜ&ïÉºf™™“äž„]=Ò˜žsv6Äð¿ù4]\r)ØÜ@Tø€!xZŠg]U@OýÛR¿q´Är°–O‹`04\r=LAn{„VÝª˜ÚZµ¼;Nzáu}	øbý\Z\ró‡Ã†þœßòþžßÈŸôöÿ\0Ÿôæÿ\0ƒÃOü„ÿ\0”¿V1|:¯©0hhLÅ¢¥éD@OT}!¶I…ŒgÌ·\n3Níß¶&™Wý1æ?.~ÙÀ=ÇÓ£v#iø±†«WøhY—ä¦—ëÄænXŽ&óõ…‰â\0fÐf1;‡Ë?ê)?Xù#ˆ¹œÂÃù›Äõ\0žªŽ voŠ“V·Ól\Z6?&‰¥Eúf¯ÑÄÄÄÄÄÄÄÄÄÄÇÚ¸†µ=–³ô‡FŸMÂú1Ÿ…°tÂzªÃMßÀ†»¿ã6]ÿ\0ßø™¶ßøÍ—ÆzwÆzW~ãü	ø;l Ð«A¡O©cŽ±ô‚¤^€˜	‰,}Í‰‰‰‰‰Ë,yâcôz‚¶q1ÿ\0ÍÄÇåÇ– ÿ\0èÿ\0Õÿ\0ÿÄ\0U\0		\0\0\0\0\"2 BR`b#3Sr‚’¢²!0@CcsÂÃÓpqƒ“£³ãa€ÒâðP‘¡±Äó$1AQTtÁDdÑáòÿÚ\0\0\r?\0þ£ß§3é·èýõüzK{Þ¯æ	®Äç~gÌ	µ=0â¾`EØú‰þ`Cƒèù¹ñm¼µOâí«-ëâ·>\ZÞ»ª9žlýÖÝjçÍis¶Ñ¾`ŸõÑýaûV?õtËæŸ˜~¿òÍŸê/Ö­gÐ¾½êæïZÞWÖÙÆã	kf>Ùyhâí³$õ–k5ŒÖÒþZìžø?gf)¬¶\rãÝS·ÿ\0«´qe?é­§GŠ;Ðö¦}×WK¯dƒ¸˜Ý¨Š0ýgæ£~\09Jl7àé÷ŠCw”»Å(¥AÂ<Bˆò„J|&¬0õ‹¬}„íå(™ÈTGêCRª¿$œÚH_Ò¥tõ}ªŒœ<^¹J¡@¤â&§AS iÑq{ÛK®^ékði„aŽžO‹gì¬œTÐ¢|œÕ#ù–=ÄÂ9r¯„êªb!ö!U…Õ+°êÓ’¨»ÊßäÕ-’\"å<êh_Y7Z®M•eèæ©ÅZ¤Ó•óÑÊ¦!Cƒ-+éß)¯ÃP¢OÕWÈ¨DõòªˆFúÎKhôNjlfŽí®Å®‰w|lØ‘h§´pªÝº›øÉ¡,®LtÉTÆU=ÂÂ,J¼Í<\"r†a¿z\nŒPÊÿ\0´#IG™³xoV»;|Ë”…ðÖ©pi°Ã>Jë›™ÍÚiù5H¿Jç!Múlwùlì“¾–cbNÕ&u/R½eÕwD—4—´®þÕ³ÑD¤ª¨‰KÅî­ã_MKš™ê»„”ŠË¾ñ7è\\ÕNRÝ×EøüMž­þ¦tówVòÜ^—£%Úí­\\Ânâ‘YwÛ¶€ö,V3ûAi5¢-m\'™\"¸Kvè®²óvŽ-îMxm{$JEeÕà²²¢ÿ\07ÿ\0=¤mkÊWµL¿Ýù¥®~éo. ­UÚVæÒ¯YK©½’%\"ö,ð+¶Qe^Ê™w—îíq‡îâ²iîöPˆôÍN‚?ƒ™R»fR6Sÿ\0•zÊTÊÉ‘{I•Û2vTª>ù©{;Bw¢•“_ºŠâžeVÔ¤6R¼6Sl‰^²L®ÙEÛ°°í_S¤y ¥måx”ì›ÙS©ÙRÙ%á²•;$Jõ’Rº¥ITµlß5¥ðö€GâY+&™Šú‘)­fJvTëÁd…Iì•(lW–òv[ëq“í\'ƒº¦¥dø¿‹c5âé-o‡2eÞU=•»Ý²Cï³7—yn­õ»´óö`Ù+š»C`—_Òf^ï*ŠÍöpSa+7®‚ÜZÅµsøVJÉº’+Æ¦´”í¨³9?ˆ´·©`òö¶~¯…d¬š§ÚT¶¦¦¦öIT]ë&µa²ÖÒòÂ©òH‚®¸e•«³Âî_‡ÉY5!ÿ\0H)²Ö¶J¢ïYQ*‹½äL×:\\leJ\0ÉáD‹³Ñ:µúOZ·÷×:É©\n©»ØÝS.õ“%Qw¼‰ðxi]ôíFÏ>_ÇØ©\r“WQ2˜Ûª¦¦÷ËéZÇ…v¿éD/r™¯n©t~µ\r\\ßªZ;:Nôõƒû´êCíÙ2OQõ¦ËÑ-ò©k[Rì-]\"¤¬¤†w–\n‰^î«Û;WÆ²V9y=Þ…“lÉáòWÀ^ê\"vÑM¬˜Ká©>Ðøz\0´wÊô­/Ó¢§³¿»˜?yåm‰hŽÐþêtú^î“ò¶q.‚î©Ud±i¦rškYîó\'”‡‘ôSë^ŠkWF—!Ô¶f¥MZ·Öìö±ù{9\r¯Ymñ`õ¶:§g2gÒ§åR*¾³\'”FO¬£-îvri°fO6vëy,Â6¦Ê®qX\"ÚNý8EÈ|£h&Ö\Zm´5¼Û7Võ¿E’êqiU™ç#ò…­])°ÓÄ‚‡U^–\rYNþÝyßŒM³óRCÝG^¢sîÖ:±U\rr‡¤‰S…n¯z¥WS%2\"ë)^)&Lä*WjÐMÕZ…†ú»sFòÒ†J¿ËZÖSp¬ÔXiOh£û“óÐb©ìüÓ³\'®ŸVi«wº¨;/)\rŽÂ\nd¯w”ª1\\ßßDþÊ¥R©(~ÂI±§º*tª‰xUòS½¼žïSŠEV.MÕkíØMsp…^°üE!TšeáN4ØÚ*d¦]UÝõq–ªg$Ìõ))2•%ÑDÜfú,I„‘^z+ßïÀ™“T?içÔêT—±´ƒ¢68Ioy\'Òµl×’›vPíµgº32w¦‘.ë3íe­+5PãÝ¶¡_B,Aª˜^‹µjxVõ¢5ºÄ¿ghÄj*¾®\n¦WþÙH\"éj„Lä:5dÅCc?”—)“ä”7œ\"åN\"/NžªjÐG‰5Ú.áC3]ê£¾fW˜‰©5[õr‰Ýj^UyHS—¶…¯^¢³Gï““Sù1Q”»ŽµNYPt–™ÓÊ£À\n5áÜº¦yMÊ¹C…^™\ng¢ñcõH_&\\þMC\Zÿ\0¿ŠÚhpÃ­–÷H¾O_÷d½ÒÉCL!§ªˆbQÏ©`1¢B8¢hú5}\n-ì*IÛÙPðTª\Z7”‡\rµyHPikf¢$2*µx¿\r	‰oÐ%ð‘Ó}<<—SýEAŠ¦¯wâ¦#/“ž÷\"«ÉÃå\0²_f²ƒ{ ž¥ëÚ‘4u!‚(ò_øñžk(€!Â.x\"š—yN«[GÈ9ËYJ”úxPõë¼ô3!!Ãõ¨¢…ª¨²Ù4fx(O?WÆmþ`f§ó\0ÉÝ2$É¶ïm+4–€¦DÕt³u¶Ñ¬•“µì–cö6ÞªH|Kh(˜ÇÞí®+ûºsu³	ÛñÌ+”i&kÁ ®—›‹šJÂ›lìï§Ì‘Lá§ó|š~*&÷%2ÕO¥dÖ–gkeâ=„ø“ö†ü4Ö;ghf±\'m¨šV¶kâD¼Ù\'±üC­b²[P÷SæÊîînòëš‰õ³äÖÓµÍgqoY%\'ÌvÂ´…=d™=”íSÚëVÍ+i!²­•ÒNšàûë5l—_?A)ñ[&²¯•]k0šÞ$»ÖÉ¬–Ö“)’·{3ZÉ¡ÀSÑ²‘²[];Æ®m­€“Z_ÄET¤Jê’HÙJ–Ö:‘ç=ôêi°¯¡M^R;d6R¥µ´Û¤Iì’~0KÍúµRÕåàS¶Me;]M„ôØ.ö^Z`Ÿ¼°•xMn)Ô›6Me;]Iû»*²«$»Éï\'³Cœ†þlšÊv¹ê\ZGcßëX7sŸlÉ5’Úæ&±ífNùíäÕtTª=Ê¼ÖÒ5ÂÌÓñ§n:Iw“gëá)ÕàT\'…\0(Ó»ï#\"¡Àí#ã{n¿‰lÒ|¥K	æŸQ=ÒÑæåSEÊ;#’P²T€ò‘¨RùWZ¨j+S)£Ñmig6dÕW!èÐƒjYLœ4AZxg¤ŒÌbž¤8uäÐ×xCD`þÎmF¦{çk\ZÑ¥=äÍ_EDº<™hÌ=¾-HA–Nò(<&ëCQ0äN6¼F´l*!t‘;8š•ÄSÚ¿4+²‹ÍžŠg½ÇÂªº‚îzƒÅ’C›újeÝ5”Ê6¤wHŒR¢åÛ–»ÞÐkwYUU¯O˜†ïNJïZ$XˆjÄOµ\Zc‚„:\ZËE5Y*µ(Bü$BÓôiÁÆ­ê”øAçrv6ª«á§v$O|	J›šŠ]Ì†Õ\r(oUÉÆ¯îòˆ€LË§ø¿(YXÕýš¨#ùÁó+_OZÒ;¨MMßÄTå/j7¢¥jo•‰ðÓÃò1ª¸D¯wÂ!ï*\n÷ô¦Ä|ÜÍ]ûH„)ç¢ª¢/£Î£Tî)\0Sý*#Üè\naÜ¡†4iÄ„YOÄDùJtÇhG¨)‰»çâLÙL–êˆ9Hz ‰œyª kôi€*šjTFÿ\0—¦\'dý¤DTox`æ£uª‡O4Tª‡ïV²g¡F/÷)Ä‰ßàÔÎæ¡RwJ\"&nñ¸kÚsÊ•@œ)Cî”4ôÅ<:ãn\r<„=Bãaú(–\\î¢íŠÓm\0A­„Ó=ÞdùKZÍi.Ø{È˜©è# «™É¦\ZhÞNGõ‚|šf¬zJU…:J«Ýd`\04ò€¡Ý×C‚ÉÙ¤ž$+š^·ñb\'/G>MV{=TdÐÖZD\\èƒ»­qD¿v˜bšm$X·¬üž’¿yr„‡¸™éˆšú¢™âiL;ªÿ\0u‚•ä$TorîsAB»³D‚Çï©SH¡{•z>1H)\0ÿ\0ÜEQ\"^¬‚‚²ðÿ\0Ž¾[ùgá¢zöx2õ†*2œJˆ4^Ð:úhâµÓ)i›Œ/v™â÷§ «y¸T‰ïj^q8¢À‹)wžƒØââ&À(±\'ÂSµÚ’E…aZ³½öiß€r™DÑB@èU‡WƒLa]\\yµYÉây¼\\j68.¦±±+Ý=\'ì¡._ýÉÏ\'ÓáX=Ž‡V?M\n†7\"ë’ýÔ,4n\\Dâ=¤#WOÖ*£w”:bCÍ!jBt)¬,Íýx\"jD[¶;û*Aº;ˆÊžÊÊVUr?˜ž DZCÒ¨¸Ä¯!dÈœ¯sáç&q¦ëš|C£…ÀúÛ9€*ç\n˜OØ\\*ËÄÿ\06«øjïøªj«ñ¡©û&Žš)½]Ä7ªÐ¸K®Šñ?0ž”í‹Z\"gx¥zù¯ÙDM¯ç7¢o¡+ê}šQ5‚õQå7(AÅˆk\'íØØ÷öÖ‰ †ñ?=V=z\"W’Ö ‹P8å¯¯³±¢N„/öhzž¸}?â20‡ÕÊ ŠQv¯åö22ÊÅ=d-JïzËª2èÚNÈ¥}bkÔ\'¼HŸ%×âã}Rãž¥Q%u^ï¦(}Ôø´Så:ÜjÙÏ›\rß½O“«\\¼Ú…Q—¥¡1D B<É—ògï\'¢ñ`ÊüžL”, Z™jx}ž‡Eâ»;å9ˆpîýÆ¾zhyQ×>!n\"À›Œßð\"§ýNRåWàÐ%¥Ê¡n‹^•ûê°RÉýb‰¢ž®òÓŠŒÝOEPJ’,¦€\'pyZuªã”á{´Eòz[‹U<#è&â÷Pìþ²wDÄuÅEû¿QVTòœ”EH¯SÉ zÃ©•É§½Ö/ü*¡þ\".­ÅX3•OÁ~r<KHúH0Ó¤˜jS*zudÎ…’pëMdÞî¼Róˆœbx!ÓæÓµà‡¦†ýd›D0m\rtt \n©e¨e$…ŽÏ\0qjŸhÓSWQ`êCRâ)R†’¯˜yU\"Ò]…½z×ZÖCÅ¼›º‰;ÓJ¡Ô¼ž/¶Ç&:× Ú·|Úq¤¾{lóDp:d¡´Zú\n@.‡îÑÕ—Ô§ñQ¡~|jÑ×ühèÅ[ÈPNïô)^ôú(ÞBØE>^ê©SÞ!ÊS×OWu=]¢L·•4]CWo–[«D–ãS_­±ÞÉ&Rjí}ž„â~²,4ue(ßÍ,#a÷S1e=e)Î[Ë&ýäˆqúTe´¢R¸5x¹jÍxnibEtÐ`\rsñšVº}ž«\'ÒD@=¤NPQU^ì8j!dÏû¨ÇŒàÑ1S»WÂL÷Ï~¯v„GÝBðâ1dË¼ÈkG<:FišéþZmTÚI–í²ªïá¡k»Æ†éxÉÙ:vr /µŽ«îU»Œq‡ØYOŽ¿(Ã!ì‚ª¯{QJ‚ÔWwÓuýRÃcjØ:£gµc¦!§’La]î¼êa®çMN¢çxÉ‘\'eX÷vpÊÜùM0àþ„Ñ»\n+ÇGù‰îsB¼¾¢ñ´éy¤ÖºÑ%¯mCÞDßòPË£EÈé¢S½“«à!¹ÔN%Ý•÷Ðˆ^×å ¢a‡ÔNõSâûé•0¡ý¢wæÎTÑ¾¸|â.ÚÑªÇ!«š§H=ÛL”Ä:hïõ“_æù´ÁU*¢Tþž1Tä]ì)e:©ÝCjB”W‹Äéf?ÚœßJÎ?«*fƒïÛgšasÉHû©â”ëE”UŒœò|šá¢˜è‡÷Þì)—åÆ@EXr¢™‹&œñúÅE(ìkËTl6¢­\\Öñ\rÝLî(Ü{È\"SîA\ZWeÕ5OÉÈw¯\'ÙÈl\0AëñTºâ—ÖÓþ²þQï!¢|}_³	CßÇÕ¡«ƒQªuP`³éñoœ8•ìª¤hûµ:¾ÐÓ_Uå‡í8~ýRôüïÞ&j:³¿((Ã¤üjˆCæ¨Q\n$=èUÅÿ\0-U•?Zê¨u¸´Xˆt“ø÷Z[Ù—;iÁÑ•¬š6;Û÷\r#Ò¢\"¬ÿ\0\0./òÕ9>xìøàÜòU™?e^³VÁnâÉTœý¥ºˆn¢3¹ÓQân\r6=ïR‰¶¤‘?G5ÄTª¡-ä¯÷Õå5»|ÓºŸydòhov”=e-jtÎ=¥£´óRuR™.Ò4jtÄB,‰9.¼¯+Ù…$ú¶„‰:gÂœ‹¼¦§´´«ÂšÆÒ]«P—²«Ntõ—‚\Z|Jï}L*ÿ\0øšO::H.UÑ4.V–Ž¾kÝBé—qøR¬º[=<˜Ôªz9ªuu8DÍWHkk&ªØ‰v]²hÑR²ˆ]½)±ô]c$â×t•îÕ›™­™ ™³nøv{ÂeÖ4J‘©›÷UEÝRÞ5LK$QhªèLKKÁR+Y?ŠÒ±ìt/´Dy8œÎ\\¬µn©Ñ×à”¨4%ö€¦d?å•1\'rÊh©6önø·Ì»{yx6vWï!(…Á°S‘‡ciM>¯ˆlÞíº¾*yŽÊ_0,Û`Þ!ñ&Xj·VÆTÖ|Ôí‹n&¦ŸEh º]+	¯s‘?u7á­°oöÎÈ|BÝÿ\0¨LèoóÃÿ\0QÖÚÖÏkFÚžµŸ„ß^qlz¡ªv±üCØöi|v’þQbSU\'bïm{f>$ØV¦‚L}~ÆÄ´w3ÔÔÓUÛ-³×]å£½a.×¤ZIÓéXIívÛ][Y-ÃS´]>cmÇœxµ“]ÏŸÌÿ\0¨¿XüþjÛ<É¾Ýk\'Îð–ÜinúDëuwmk0©mü¾`¥·ßZG™4É¶nÌ\Z¨mÆŸh„zä¥WÌPûðÕ\"›Åb«;y6-TØçÏƒA‰øˆ˜bC«T“m\rAÞT\nÒ¥39CÒCMtýŠ0XŸ@té.ÒÕÒ¶ŸjÏ¢ÒÖD×JXb¥HªSC‰E„tÑà4í¤Žøú:E‡Uªr»4I>ÐÍ”©¥¯3ƒR|\\ÓM‡¦?\n_ˆ‹1ZbÄ‡)J!\"¼ª¨¿³+3^NÞÒ/ÑRvÅJŸÇµþ\"º¸Nò;*C$¢¸ûÔøŸ	I¸5\rÆ÷1R¤©æÒ²Šïr\Z ëR¾^“h¬#Á¢|ŸIûbÝOŽ­4Lárî$CJƒ¢‡Wœ¥PIÿ\0`5ÕO¶¼*’º§ûA{R•upä$%Ù†…ˆºÊ®Âvj‘=ïFª4c5†ŸGÅ!zùþiÑNž°¡8g×’NÑ‚ê”0õUîÓ‘ˆ¡zK3WE>‚f¡b»¬™>®ë¶ŠÍÛ	Wyè”¨èÙôøŠ€GÍe8E8yá‰³Õ\na†}¼ºrùg¶ˆr‘N²YHžÚs%èÊªV®iy­â		SeY8{ª\\Àõª!dë\reª‚hYPZ*˜fpù8upX£EõaG¦tìû¶LåÈªÃÃ7„rQ½k*^ñG ùJ°\\äÑ†P¾¤TR8‡v®Í¢‡—£“?>¡^ç£À:JžÊ‡ÆCþ8Äw¹‰ž›?vÍJ¯¢z7«FY;ÈZ¢J.ÊhÊ8AÒãÝˆ»\nœµ^e½“Tš!…\0þ¨øeò†\0†:˜†¢íë¡|§I3‰åéáQ+‡†µbÃ­Pž˜‚¨Y\"¦½KêÛT,‰{ª½P§RÅ¼ŸJ^Êwº´µÅíÊ¦¬N’*¢kª”Ë¸ª41O«R|5¬%ZhÉë÷ˆ,&Hš˜›é´lÝÒ.V&ÎËÅn§l™zµ©4<]Z\nSÏO£¡ZVšÃ/´Oz™`GRâþ­!ÓP°š×’,[J´‡ù˜{[4ÿ\00|Ÿó¦Ðjè¯F·¼¯uo®ÎÒ}qo­Õôy&òÝe½µŸG‹úÑó¼·VöÖs¬æÙÎ\\ìÞrçf}?Ô{ÿÄ\09\0	\0\0\0\0\0 !1PAB02R\"Qbr²Òc‚3apƒ’£ÂÓâCq¢ÃðÿÚ\0?\0ýŽA…˜ÀŒ(ÂŒ(ª˜åÒ‘R²NV¥rÉH†R®³:Hy)§ÔUOu<zÚèvYØÐ©²³ßŽWC²ðPÅj·ã•Ðì¼&+=øåt=„/Ži&EgÇ+¡ˆ^+ã•Ðì¼WÆ¡]ËÅ|jÐì¼WÆ­Åt;/ñ«q]ËÅ|jß\"—ŠøÚn–¶w”bF$bD¢Q9ŸM¤“{I>[_y.Ï¥Åä[k+Ï…<j´Mºb&É’t´’I$å|j:£B\"É\rY\"Ì¬øÔnŒ,ˆö²æ•¤êHß‚Ù:î>A]å‚P5¨1±TTt%”½løÕvcéì\ruÿ\0l”*†ÉÈÐEGAqn1ñªÓÉÔª«!îtÅ°†t)\'Qn>9Z±G¹Ð[s †\' †ˆ,ÀB¤|rµe;\Z!îN‚\Z-Š‚)Dû‰|ŠµbãÞÈb¥²š#Ú¨m>Ó¤o”V©I-Ç½’çú}FÛåÕªª9BÜt¹>¡½ Tw	ª|¾“Ç+W¸Š)×ë$NÛæUªÜ¦‘½0Sâ±ñêÊ•Wµˆ©ú|v.9\nÎÑx*DA„‚ |‚µY¶dYévâÏb\r¸ä+T\'¥F¾ÍX˜‘ÛùÇ¹bö<¢pª\Zò’Þ(&ÍqÈVd}mH÷ ‰XF­\Za#´‚dD‘nøÔ\"{J¦ÒI3n¤ö‰“ï$’Uß¬ÈúHùÔ@ònAÌA­ß­Öí’J&Ò&NgÇ\'g½¦È¡Y¯ñÊÍäVV{r¨¦ÌÂÈÉÐWŒïVWß,“î!‘ë\Z÷f|j·[£ÔY?xÑxVƒrvÓ™ñªÑvð/Ä’ªÖñ‰[·3ãP––bZ•9d*|Æ”íhb¥÷\rÛ¦gÆ¡]uã¯Üy—â©dÕéýý§GÊ%UH··m9Ÿ\Z…µúUfš)Ü]Å4Ê;¨ùê¾Aogå¤\\’×éYNè¯bÍ™ú‰DŠÝ´‘É!]w©§å(]ÄÞE¹…õ:aäÐ…e¹U1ò	67‡Ù»´’,“Ç¢I¤›«=F…¡(“uÈ¢%¥Ù«A¡ï\'Êu7ÄG(„DèDÍXÍ~î@õ¦	ä¿¬õ~C¡>cü?–Eö?¸-€ÒÉÉ/BSo†¢06}æØI‡m=$‘v>5úWÈ÷ýÅÚ4ˆ„¡|$ýgÃó\rêN£ÇÌiwÆ¡j#ó‰Ó«Æ#ü\r‰PHô´rC>Êm¤Eµ>,GMlŽ†ädžA…ê¡Ô_ù÷\"/Ó$ä|r»?)­´%n>UÐÑ’kÝè$’MÄÉ›AHøõy$›Ò:}6¦óõ\rýèEŸ&“dZ”\'êiÂM–ä<HOÙ¤ÂÆ cóROp»éùÏY¶”Ü‚ZäÐ÷6Cô~!ï_ê7À-°A?Ê¾È÷Î¬øöN˜I$VÔ‰\ZÂ#þ\'vV|¢Öïl‰I+>U;µuwÌ++4+@¹šo<ûd’-r«¾b$TÀåI«—|ÂÚíf|Âp+Äe|ÊÈ²>e+·i&Ï˜DdŒ–†Æ¢É’I6b³åU¤jñeÊ´òS¸Ù&¦ãP\"¹_îy÷‘f¿Q³ÅúA÷a?»$ëû³Ò>IŸ	;õã>Â|£îöõŒI&ÑÇ¬°ˆBDB†ˆåä’VI¦òI<£Ï$ósÏÉ&†™´$’m´jAGìÿÄ\03\0\0\0\0\0\0\0 !1P02\"3ABR`r‚bp#ƒ@Sa’ðÿÚ\0?\0þ‚ à¨ä•ßÐ‘Ø_[Çf>¾_@®vr/ã´? F,“‘òpiyÍ¼æw\\Òçª®<EêX¾€tÕ>‘w$žy”P8…JÇƒà:”ªW \\Äšš¢š]gé/˜«§Óñ\"z])aƒ\r+ÜWJK<›¢¨Æ&$ÞÃ¥¯\"Š)Šj0ª}EkC§â:ž?Ó*ñ¨éø‹ÚTu>¼êx•øò)bxPéT8øÎ	úê_‡æQãHŸõWGOÄ~Ð«Æ£§â/hu>¼©bXJüy’ÖªŠß¨«ÃügOÃþÅ>E~?™NÔý¢ö•øÔtüGKÇ‹à+ñ¨¡¥O¨Ä•xÊ«Ä~¥Cmò=/ˆêyÏí*ÄýU”ºª_§O²‚¿Ì§j~ÁRñÕY_‰EISêU/ªÝF¤².?¥µE{•ø( Nj:ž?˜¶¤«©’ªD3ÌFuÇÑZ£J‡R­•øxR(Z•ÔªXiÈ¯Ê®Úãè£ÅW³*QYÔÒ‚ž¢TálJºÄÕöUCbãú^?‘^çR¬^ŠL6jD£µ	T^‘qý/©^\'èøªï**«Ô`kqq®ÓRô	G}ÔéôÒRÅÆ²IÍMG¨´ûì‡eôÐ+êçþ‚9š{I9\ZÈ z£uêàJîë\"ãX˜Æ4Äà§,NU”½pÙ:dK]Æ>U(r!¤ìíµ–Fò.K\\W’Q6MÛ{=í.I­q+¿WØ@ÈÜ÷ICÐfÖ{Ù.I‘ˆNI#Qí†Ó#ZYïeÉ+lUd‡£Fô·¼kQrJÌNnö»#²Übä•˜··\Zdv[åbã•˜·µ*fˆƒ$[æ\\|Rl/šìh©@–f.N,¶Èã3#VC¶Âz^o<ê¼\nÑÌNg ˜µåÉfÛ‘–9x‚yÕ<û²\\û$ZŠË<“’\nxö!fØ×²¸ökðˆY¶´òÌBÛ»/+ãXÛVHŒÛ_W’D.9•DÚ-–ÅÇ»-óEç#´ãØ‡£\"Ì™wŒÏAj%È;&\'‘9»Ì oNAŽÉ’+$\'h\ZŒÕmuÆ±ÙYû+j1¡3|³¨¸Ö1Ù\nêÒHÝ§&æq¬wBíÍ—Çt\'!ÚH)\\ƒÐÓ´ŠÏQúIDr,}©9³Rl-W\"ÇÛ§{´Syã˜ûk{·ò“ÚÞþ9ŽîË2YW ÇÛUAˆ˜&r®52´A5Ý—\ZÆ!ïgd-ÆÒ1\né²³³¸Ö1\ZÏûv„aF”JýÔ’´•n!q®ØI¨ÄJ&Ÿ˜MAa.î$ÿ\0Ç÷[BQ4þó.q\Z²Æ»-v´I*t»†@‘E›Ô\\s‰‰¯””JùïA¯þ¬D2ŸÜJøŒ_ðbd±ŽwY‡ÙK‚v‹¬°AÉnAÔüHý¤dþÆ¤29y$’ID’I?Ãÿ\0ÿÙ',7,8,'-4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',10,20,30,0,0,0,0,0,0);

/*Table structure for table `proformas` */

DROP TABLE IF EXISTS `proformas`;

CREATE TABLE `proformas` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) NOT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Clientes_codigo` int(100) NOT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '1',
  `fechain` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_proforma_Clientes1_idx` (`Clientes_codigo`),
  KEY `fk_proforma_usuarios1_idx` (`Usuarios_Codigo`),
  CONSTRAINT `fk_proforma_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proforma_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `proformas` */

insert  into `proformas`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`) values (1,'2018-04-08','2018-04-08 22:55:09','12.0','2.15','17.95','0.00','20.10','5.01','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00'),(2,'2018-04-09','2018-04-09 12:00:48','12.0','1.61','13.39','0.00','15.00','4.41','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000002',1,'2018-04-09 00:00:00'),(3,'2018-04-09','2018-04-09 12:09:25','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000003',1,'2018-04-09 00:00:00'),(4,'2018-04-09','2018-04-09 17:32:09','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000004',1,'2018-04-09 00:00:00'),(5,'2018-04-09','2018-04-09 17:52:05','12.0','1.61','13.39','0.00','15.00','4.41','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000005',1,'2018-04-09 00:00:00'),(6,'2018-04-09','2018-04-09 17:54:29','12.0','1.61','13.39','0.00','15.00','4.41','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000006',1,'2018-04-09 00:00:00'),(7,'2018-04-10','2018-04-10 20:08:31','12.0','0.38','3.12','0.00','3.50','0.81','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000007',1,'2018-04-10 00:00:00'),(8,'2018-04-11','2018-04-11 07:35:04','12.0','1.61','13.39','0.00','15.00','4.41','PROFORMA','0.00',1,4,'DESKTOP-OQEODUI','000000008',1,'2018-04-11 00:00:00'),(9,'2018-04-12','2018-04-12 14:13:29','12.0','0.32','2.68','0.00','3.00','2.01','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000009',1,'2018-04-12 00:00:00'),(10,'2018-04-13','2018-04-13 07:39:26','12.0','0.32','2.68','0.00','3.00','2.01','PROFORMA','0.00',17,4,'DESKTOP-OQEODUI','000000010',1,'2018-04-13 00:00:00');

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(50) NOT NULL,
  `Nombres` varchar(200) NOT NULL,
  `Telefono` varchar(200) DEFAULT NULL,
  `Celular` varchar(200) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `Direccion` varchar(500) DEFAULT NULL,
  `Provincia` varchar(500) DEFAULT NULL,
  `Ciudad` varchar(500) DEFAULT NULL,
  `Nacionalidad` varchar(500) DEFAULT NULL,
  `NombreComercial` varchar(500) DEFAULT NULL,
  `Vendedor` varchar(500) DEFAULT NULL,
  `Observaciones` varchar(500) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `PagoPredeterminado` varchar(200) DEFAULT NULL,
  `credito` int(11) DEFAULT '0',
  `tiempoCredito` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `Cedula` (`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

insert  into `proveedores`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`NombreComercial`,`Vendedor`,`Observaciones`,`extension`,`PagoPredeterminado`,`credito`,`tiempoCredito`) values (1,'1717148371','QUINTANA ALBIÃ‘O SHEICY ELIZABETH','','','','KM 4 1/2 VIA QUEVEDO','STO DGO TSACHIL/SANTO DOMINGO/ABRAHAM CALAZACON','','Ecuatoriana','','','','',NULL,0,'0'),(2,'1722239967001','CARRION TORRES JIMMY HOMERO','','','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO / SAN MIGUEL LOTE 145 Y AV. QUITO',' SANTO DOMINGO ',' SANTO DOMINGO ','Ecuatoriana','CARRION TORRES JIMMY HOMERO','','OBLIGADO: S\nTRANSMISION DE SONIDO, IMAGENES, DATOS U OTRO TIPO DE INFORMACION  POR INTERNET.\n','',NULL,0,'0'),(3,'1722423967001','GETIAL GETIAL RICARDO MIGUEL','','096803062','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. QUITO 516 Y AMBATO Y LATACUNGA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','Ecuatoriana','GETIAL GETIAL RICARDO MIGUEL','','OBLIGADO: N\nVENTA AL POR MENOR DE OTROS MATERIALES Y EQUIPOS DE INFORMATICA.\n','',NULL,0,'0');

/*Table structure for table `reportes_externos` */

DROP TABLE IF EXISTS `reportes_externos`;

CREATE TABLE `reportes_externos` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ATRIBUTO` varchar(100) DEFAULT NULL,
  `VALOR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reportes_externos` */

/*Table structure for table `retencion` */

DROP TABLE IF EXISTS `retencion`;

CREATE TABLE `retencion` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_codigo` int(11) DEFAULT NULL,
  `compras_codigo` int(11) DEFAULT NULL,
  `usuario_codigo` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(245) DEFAULT NULL,
  `autorizacion` varchar(85) DEFAULT NULL,
  `compra_secuencia` varchar(45) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha` date DEFAULT NULL,
  `caducidad` date DEFAULT '2515-05-11',
  `total` double DEFAULT NULL,
  `concepto` varchar(545) DEFAULT NULL,
  `sec1` varchar(10) DEFAULT NULL,
  `sec2` varchar(10) DEFAULT NULL,
  `sec3` varchar(10) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `retencion` */

/*Table structure for table `sataparato` */

DROP TABLE IF EXISTS `sataparato`;

CREATE TABLE `sataparato` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(245) DEFAULT NULL,
  `parte` varchar(55) DEFAULT NULL,
  `categoria` varchar(55) DEFAULT NULL,
  `marca` varchar(55) DEFAULT NULL,
  `modelo` varchar(55) DEFAULT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` varchar(345) DEFAULT NULL,
  `satorden_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `sataparato` */

insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (1,'laptop dell','WSS','portatil','dell','345','2018-03-25 22:22:07','NADA QUE DECIR',0),(2,'impresora l380',NULL,'impresora','epson','l380','2018-03-25 22:22:18',NULL,0),(3,'impresora lexmarl','','LEXMARK','LEXMARK','multifax','2018-03-31 00:23:05','',0),(4,'COMIONETA CHEVROLET SEDAN','','','CHEVRLET','BLAZER','2018-03-31 00:45:42','',0),(5,'TIERRA VERDE','SDSS','','TIERRA','VERDE','2018-03-31 00:55:30','NADA QUE ACOTAR',0),(6,'IMPRESORA TMU EPSON','','','EPSON','TMU','2018-03-31 11:07:15','IMPRESORA MATRICIAL',0),(7,'LAPTOP DELL XPS','','','DELL','XPS','2018-03-31 11:54:58','LAPTOP DELL',0),(8,'LAPTOP MARCA: DELL MODELO: INSPIRO COLOR: NEGRA SERIE: FANESCA XY N.- PARTE :','','','DELL','INSPIRON','2018-03-31 16:15:00','NO ENCIENDE',0);

/*Table structure for table `satorden` */

DROP TABLE IF EXISTS `satorden`;

CREATE TABLE `satorden` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientes_codigo` int(11) DEFAULT NULL,
  `usuarios_codigo` int(11) DEFAULT NULL,
  `descripcion` varchar(645) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `satorden` */

insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (1,'000000001','2018-03-25 22:23:10',1,4,NULL),(2,'000000002','2018-03-25 22:23:56',4,4,NULL),(3,'000000003','2018-03-30 22:14:15',4,1,'NADA QUE DECIR'),(4,'000000004','2018-03-30 22:18:04',4,13,'NADA QUE DECIR'),(5,'000000005','2018-03-30 22:23:21',4,1,'A VER QUE PASA'),(6,'000000006','2018-03-30 22:38:38',4,1,'NADA QUE DECIR'),(7,'000000007','2018-03-30 22:49:19',4,1,'NADA QUE DECIR'),(8,'000000007','2018-03-30 22:49:19',4,1,'NADA QUE DECIR'),(9,'000000008','2018-03-30 22:50:42',4,1,'NADA QUE DECIR'),(10,'000000009','2018-03-30 22:51:41',4,1,'NADA QUE DECIR'),(11,'000000010','2018-03-30 22:54:06',4,1,'NADA QUE DECIR'),(12,'000000011','2018-03-30 22:56:53',4,1,'NADA QUE DECIR'),(13,'000000012','2018-03-30 23:01:01',4,1,'NADA QUE DECIR'),(14,'000000013','2018-03-31 00:46:11',4,1,'TIENE PINTURA DE SEGUNDA'),(15,'000000014','2018-03-31 00:55:54',1,4,'NADA QUE DECIR'),(16,'000000015','2018-03-31 11:10:15',14,4,'IMPRESORA MATRICIAL'),(17,'000000016','2018-03-31 11:55:23',15,4,''),(18,'000000017','2018-03-31 11:56:46',1,4,'NADA QUE ACOTAR'),(19,'000000018','2018-03-31 16:15:45',1,4,'NADA QUE ACOTAR'),(20,'000000019','2018-03-31 19:09:04',1,4,'NO ENCIENDE');

/*Table structure for table `satordendetalle` */

DROP TABLE IF EXISTS `satordendetalle`;

CREATE TABLE `satordendetalle` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT '0',
  `diagnostico` varchar(500) DEFAULT 'Esperando...',
  `recomendaciones` varchar(545) DEFAULT 'NINGINA...',
  `accesorios` varchar(545) DEFAULT NULL,
  `presupuesto` double DEFAULT '0',
  `retiradoPor` varchar(245) DEFAULT NULL,
  `cerrado` int(11) DEFAULT '0',
  `ingresado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SatOrden_Codigo` int(11) DEFAULT NULL,
  `SatAparato_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_satordenDetalle_SatOrden1_idx` (`SatOrden_Codigo`),
  KEY `fk_satordenDetalle_sataparato1_idx` (`SatAparato_codigo`),
  CONSTRAINT `fk_satordenDetalle_SatOrden1` FOREIGN KEY (`SatOrden_Codigo`) REFERENCES `satorden` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_satordenDetalle_sataparato1` FOREIGN KEY (`SatAparato_codigo`) REFERENCES `sataparato` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `satordendetalle` */

insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (1,0,'Esperando...','NINGINA...',NULL,0,NULL,0,'2018-03-27 21:26:51',1,1),(2,0,'Esperando...','NINGINA...',NULL,0,NULL,0,'2018-03-27 21:27:06',2,2),(3,1,NULL,NULL,'sdfsdfsdf',0,NULL,0,'2018-03-30 22:51:41',10,1),(4,1,NULL,NULL,'sin accesorios	',25.2,NULL,0,'2018-03-30 22:56:53',12,1),(5,1,NULL,NULL,'kkkkkkkkkkkk',30,NULL,0,'2018-03-30 23:01:01',13,1),(6,1,NULL,NULL,'SIN ACCESORIOS',0,NULL,0,'2018-03-31 00:46:11',14,1),(7,1,NULL,NULL,'SIN ACCESORIOS	',0,NULL,0,'2018-03-31 00:55:54',15,5),(8,1,NULL,NULL,'KLLK',0,NULL,0,'2018-03-31 11:10:15',16,6),(9,1,NULL,NULL,'CARGADOR DELL	',0,NULL,0,'2018-03-31 11:55:23',17,7),(10,1,NULL,NULL,'NADA QUE HACERRRR	',50,NULL,0,'2018-03-31 11:56:46',18,5),(11,1,NULL,NULL,'sin accesorios',50,NULL,0,'2018-03-31 16:15:45',19,8),(12,1,NULL,NULL,'WERWREWREWERWER24VXCGDFGDFGDFGDFGDFGDGDFGDGD',0,NULL,0,'2018-03-31 19:09:04',20,8);

/*Table structure for table `satseries` */

DROP TABLE IF EXISTS `satseries`;

CREATE TABLE `satseries` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `serie` varchar(45) DEFAULT NULL,
  `disponible` int(11) DEFAULT '1',
  `satAparato_codigo` int(11) DEFAULT NULL,
  `compra_sec` varchar(55) DEFAULT NULL,
  `venta_sec` varchar(45) DEFAULT NULL,
  `descripcion` varchar(800) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_Series_sataparato1_idx` (`satAparato_codigo`),
  CONSTRAINT `fk_Series_sataparato1` FOREIGN KEY (`satAparato_codigo`) REFERENCES `sataparato` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `satseries` */

insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (1,'cvcvcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'nnnnn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'qwqwqw',0,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'XZXZXZ',0,4,NULL,NULL,NULL,NULL,NULL,NULL,'ROJA'),(5,'TIERRA',0,5,NULL,NULL,NULL,NULL,NULL,NULL,'NEGRA'),(6,'TMUTMU',0,6,NULL,NULL,NULL,NULL,NULL,NULL,'NEGRA'),(7,'TTYTTY',0,7,NULL,NULL,NULL,NULL,NULL,NULL,'GRIS'),(8,'FANESCA XY',0,8,NULL,NULL,NULL,NULL,NULL,NULL,'NEGRA');

/*Table structure for table `seriesfacturas` */

DROP TABLE IF EXISTS `seriesfacturas`;

CREATE TABLE `seriesfacturas` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `sec1` varchar(45) DEFAULT NULL,
  `sec2` varchar(45) DEFAULT NULL,
  `fac3` varchar(45) DEFAULT NULL,
  `equipos_Codigo` int(100) NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `fk_SeriesFacturas_equipos1_idx` (`equipos_Codigo`),
  CONSTRAINT `fk_SeriesFacturas_equipos1` FOREIGN KEY (`equipos_Codigo`) REFERENCES `equipos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `seriesfacturas` */

insert  into `seriesfacturas`(`codigo`,`sec1`,`sec2`,`fac3`,`equipos_Codigo`) values (1,'001','001','000000001',20),(2,'001','001','000000002',20),(3,'001','001','000000003',20),(4,'001','001','000000002',20),(5,'001','001','000000004',20),(6,'001','001','000000005',20),(7,'001','001','000000003',20),(8,'001','001','000000006',20),(9,'001','001','000000004',20),(10,'001','001','000000005',20),(11,'005','001','000000006',20),(12,'005','001','000000007',20),(13,'001','001','000000008',20),(14,'001','001','000000009',20),(15,'001','001','000000010',20),(16,'001','001','000000009',20),(17,'001','001','000000011',20),(18,'001','001','000000012',20),(19,'001','001','000000013',20),(20,'001','001','000000010',20),(21,'001','001','000000014',20),(22,'001','001','000000015',20),(23,'001','001','000000016',20),(24,'001','001','000000017',20),(25,'001','001','000000018',20),(26,'001','001','000000019',20),(27,'001','001','000000020',20);

/*Table structure for table `seriesretencion` */

DROP TABLE IF EXISTS `seriesretencion`;

CREATE TABLE `seriesretencion` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `sec1` varchar(45) DEFAULT NULL,
  `sec2` varchar(45) DEFAULT NULL,
  `fac3` varchar(45) DEFAULT NULL,
  `equipos_Codigo` int(100) NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE,
  KEY `fk_SeriesRetencion_equipos1_idx` (`equipos_Codigo`),
  CONSTRAINT `fk_SeriesRetencion_equipos1` FOREIGN KEY (`equipos_Codigo`) REFERENCES `equipos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seriesretencion` */

/*Table structure for table `sri_formas_pago` */

DROP TABLE IF EXISTS `sri_formas_pago`;

CREATE TABLE `sri_formas_pago` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `formaPago` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sri_formas_pago` */

/*Table structure for table `sri_porcentajes_retencion` */

DROP TABLE IF EXISTS `sri_porcentajes_retencion`;

CREATE TABLE `sri_porcentajes_retencion` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `porcentaje` double DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `cod` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `sri_porcentajes_retencion` */

insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (1,'321',1,'TRANSFERENCIA DE BIENES MUEBLES DE NATURALEZA CORP','RENTA',NULL),(2,'721',30,'RETENCION IVA BIENES 30% ','IVA',1),(3,'332',0,'OTRAS COMPRAS DE BIENES Y SERVICIOS NO SUJETAS A R\r\n','RENTA',NULL),(4,'303',10,'HONORARIOS PROFESIONALES Y DIETAS ','RENTA',NULL),(5,'309',1,'SERVICIOS PUBLICIDAD Y COMUNICACION\r\n','RENTA',NULL),(6,'723',70,'RETENCION IVA SERVICIOS 70% ','IVA',2),(7,'310',1,'TRANSPORTE PRIVADO DE PASAJEROS O SERVICIO PUBLICO','RENTA',NULL),(8,'341',1.25,'IMPUESTO UNICO A LA EXPORTACION DE BANANO DE PRODU','RENTA',NULL),(9,'725',100,'RETENCION IVA SERVICIOS 100%','IVA',3),(10,'304',8,'SERVICIOS PREDOMINA EL INTELECTO-NOTARIOS REGISTRA','RENTA',NULL),(11,'307',2,'SERVICIOS PRODOMINA LA MANO DE OBRA','RENTA',NULL),(12,'308',2,'SERVICIOS ENTRE SOCIEDADES','RENTA',NULL),(13,'322',1,'SEGUROS Y REASEGUROS (PRIMAS Y CESIONES) (10% DEL ','RENTA',NULL),(14,'334',0,'POR COMPRAS CON TARJETA DE CREDITO\r\n','RENTA',NULL),(15,'303',8,'OTRAS RETENCIONES APLICABLES EL 8%','RENTA',NULL),(16,'343',1,'OTRAS RETENCIONES APLICABLES EL 1%','RENTA',NULL),(17,'344',2,'APLICABLE A OTROS SERVICIOS 2% RENTA','RENTA',NULL),(18,'343B',1,'Por actividades de construcciÃƒÂ³n de obra material','RENTA',NULL),(19,'9',10,'RETENCION 10% IVA ENTRE ESPECIALES','IVA',9),(20,'10',20,'RETENCION 20% ENTRE ESPECIALES','IVA',10),(21,'320',8,'ARRENDAMIENTO DE INMUEBLES 8%','RENTA',NULL),(22,'311',2,'POR PAGO A TAVES DE LIQUIDACIONES DE COMPRA ','RENTA',NULL),(23,'314',8,'REGALÃƒÂAS POR CONCEPTO DE FRANQUICIAS DE ACUERDO A ','RENTA',NULL);

/*Table structure for table `sri_sustentocomprobante` */

DROP TABLE IF EXISTS `sri_sustentocomprobante`;

CREATE TABLE `sri_sustentocomprobante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `sustento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `sri_sustentocomprobante` */

insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (1,'01','CrÃƒÂ©dito Tributario para declaraciÃƒÂ³n de IVA (servicios y bienes distintos de inventarios y activos fijos)'),(2,'02','Costo o Gasto para declaraciÃƒÂ³n de IR (servicios y bienes distintos de inventarios y activos fijos)'),(3,'03','Activo Fijo - CrÃƒÂ©dito Tributario para declaraciÃƒÂ³n de IVA'),(4,'04','Activo Fijo - Costo o Gasto para declaraciÃƒÂ³n de IR'),(5,'05','LiquidaciÃƒÂ³n Gastos de Viaje, hospedaje y alimentaciÃƒÂ³n Gastos IR (a nombre de empleados y no de la empresa)'),(6,'06','Inventario - CrÃƒÂ©dito Tributario para declaraciÃƒÂ³n de IVA'),(7,'07','Inventario - Costo o Gasto para declaraciÃƒÂ³n de IR'),(8,'08','Valor pagado para solicitar Reembolso de Gasto (intermediario)'),(9,'09','Reembolso por Siniestros'),(10,'10','DistribuciÃƒÂ³n de Dividendos, Beneficios o Utilidades');

/*Table structure for table `sri_tarjetascredito` */

DROP TABLE IF EXISTS `sri_tarjetascredito`;

CREATE TABLE `sri_tarjetascredito` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `tarjeta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sri_tarjetascredito` */

/*Table structure for table `sri_tipocomprobante` */

DROP TABLE IF EXISTS `sri_tipocomprobante`;

CREATE TABLE `sri_tipocomprobante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `tipoComprobante` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `sri_tipocomprobante` */

insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (1,'1','Factura'),(2,'2','Nota o boleta de venta '),(3,'3','LiquidaciÃƒÂ³n de compra de Bienes o PrestaciÃƒÂ³n de servicios '),(4,'4','Nota de crÃƒÂ©dito'),(5,'5','Nota de dÃƒÂ©bito'),(6,'6','GuÃƒÂ­as de RemisiÃƒÂ³n '),(7,'7','Comprobante de RetenciÃƒÂ³n'),(8,'8','Boletos o entradas a espectÃƒÂ¡culos pÃƒÂºblicos'),(9,'9','Tiquetes o vales emitidos por mÃƒÂ¡quinas registradoras'),(10,'11','Pasajes expedidos por empresas de aviaciÃƒÂ³n'),(11,'12','Documentos emitidos por instituciones financieras\r\n'),(12,'15','Comprobante de venta emitido en el Exterior'),(13,'16','Formulario ÃƒÅ¡nico de ExportaciÃƒÂ³n (FUE) o DeclaraciÃƒÂ³n Aduanera ÃƒÅ¡nica (DAU) o DeclaraciÃƒÂ³n Andina de Valor (DAV)'),(14,'18','Documentos autorizados utilizados en ventas excepto N/C N/D '),(15,'19','Comprobantes de Pago de Cuotas o Aportes'),(16,'20','Documentos por Servicios Administrativos emitidos por Inst. del Estado');

/*Table structure for table `tickets` */

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) NOT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Clientes_codigo` int(100) NOT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '1',
  `fechain` varchar(45) DEFAULT NULL,
  `calveAcceso` varchar(100) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  `DescripcionElectronica` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_ticket_Clientes1_idx` (`Clientes_codigo`),
  KEY `fk_ticket_usuarios1_idx` (`Usuarios_Codigo`),
  CONSTRAINT `fk_ticket_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `tickets` */

insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (1,'2018-04-08','2018-04-08 12:48:16','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(2,'2018-04-08','2018-04-08 12:55:44','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(3,'2018-04-08','2018-04-08 12:57:19','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(4,'2018-04-08','2018-04-08 22:01:48','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(5,'2018-04-08','2018-04-08 22:04:06','12.0','3.40','28.30','0.00','31.70','9.02','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(6,'2018-04-08','2018-04-08 22:07:10','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(7,'2018-04-08','2018-04-08 22:13:57','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(8,'2018-04-08','2018-04-08 22:19:07','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(9,'2018-04-08','2018-04-08 22:20:30','12.0','96.43','803.57','0.00','900.00','264.6','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(10,'2018-04-08','2018-04-08 22:22:21','12.0','51.65','430.45','0.00','482.10','122.85','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(11,'2018-04-08','2018-04-08 22:23:24','12.0','60.26','502.14','0.00','562.40','158.75000000000003','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(12,'2018-04-08','2018-04-08 22:23:51','12.0','10.93','91.07','0.00','102.00','12.0','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(13,'2018-04-08','2018-04-08 22:25:50','12.0','0.56','4.64','0.00','5.20','1.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(14,'2018-04-08','2018-04-08 22:30:43','12.0','0.36','3.04','0.00','3.40','0.3999999999999999','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(15,'2018-04-08','2018-04-08 22:50:05','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000002',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(16,'2018-04-08','2018-04-08 22:50:26','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000003',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(17,'2018-04-08','2018-04-08 22:56:47','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000004',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(18,'2018-04-08','2018-04-08 23:46:55','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000005',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(19,'2018-04-08','2018-04-08 23:52:31','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000006',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(20,'2018-04-08','2018-04-08 23:57:42','12.0','0.56','4.64','0.00','5.20','1.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000007',1,'2018-04-08 00:00:00',NULL,NULL,NULL),(21,'2018-04-09','2018-04-09 00:00:16','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000003',1,'2018-04-09 00:00:00',NULL,NULL,NULL),(22,'2018-04-09','2018-04-09 12:00:29','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000008',1,'2018-04-09 00:00:00',NULL,NULL,NULL),(23,'2018-04-09','2018-04-09 12:01:15','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000009',1,'2018-04-09 00:00:00',NULL,NULL,NULL),(24,'2018-04-09','2018-04-09 17:53:42','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000010',1,'2018-04-09 00:00:00',NULL,NULL,NULL),(25,'2018-04-11','2018-04-11 16:27:22','12.0','0.54','4.46','0.00','5.00','3.5','TICKET','0.00',16,4,'DESKTOP-OQEODUI','000000011',1,'2018-04-11 00:00:00',NULL,NULL,NULL),(26,'2018-04-12','2018-04-12 14:11:25','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000012',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(27,'2018-04-12','2018-04-12 14:13:01','12.0','1.93','16.07','0.00','18.00','6.42','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000013',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(28,'2018-04-12','2018-04-12 14:45:31','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000014',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(29,'2018-04-12','2018-04-12 15:14:42','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000015',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(30,'2018-04-12','2018-04-12 15:25:30','12.0','2.84','23.66','0.00','26.50','9.92','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000016',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(31,'2018-04-12','2018-04-12 17:13:23','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000017',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(32,'2018-04-12','2018-04-12 17:15:49','12.0','3.02','25.18','0.00','28.20','10.120000000000001','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000018',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(33,'2018-04-12','2018-04-12 23:57:51','12.0','2.11','17.59','0.00','19.70','8.53','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000019',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(34,'2018-04-12','2018-04-12 23:58:48','12.0','1.79','14.91','0.00','16.70','6.52','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000020',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(35,'2018-04-12','2018-04-13 00:00:48','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000021',1,'2018-04-12 00:00:00',NULL,NULL,NULL),(36,'2018-04-13','2018-04-13 00:07:29','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000022',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(37,'2018-04-13','2018-04-13 00:08:11','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000023',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(38,'2018-04-13','2018-04-13 00:13:13','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000024',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(39,'2018-04-13','2018-04-13 00:17:38','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000025',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(40,'2018-04-13','2018-04-13 07:39:02','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000026',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(41,'2018-04-13','2018-04-13 07:41:54','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000027',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(42,'2018-04-13','2018-04-13 07:42:24','12.0','1.61','13.39','0.00','15.00','4.41','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000028',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(43,'2018-04-13','2018-04-13 07:45:27','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000029',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(44,'2018-04-13','2018-04-13 08:02:59','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000030',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(45,'2018-04-13','2018-04-13 08:03:20','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000031',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(46,'2018-04-13','2018-04-13 08:07:46','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000032',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(47,'2018-04-13','2018-04-13 08:08:22','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000033',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(48,'2018-04-13','2018-04-13 14:40:36','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000034',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(49,'2018-04-13','2018-04-13 14:41:30','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000035',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(50,'2018-04-13','2018-04-13 15:25:58','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000036',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(51,'2018-04-13','2018-04-13 15:26:16','12.0','0.38','3.12','0.00','3.50','0.81','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000019',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(52,'2018-04-13','2018-04-13 15:46:39','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000037',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(53,'2018-04-13','2018-04-13 15:46:54','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000038',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(54,'2018-04-13','2018-04-13 16:16:00','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000039',1,'2018-04-13 00:00:00',NULL,NULL,NULL),(55,'2018-04-13','2018-04-13 16:20:12','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000040',1,'2018-04-13 00:00:00',NULL,NULL,NULL);

/*Table structure for table `tipos_usuarios` */

DROP TABLE IF EXISTS `tipos_usuarios`;

CREATE TABLE `tipos_usuarios` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tipos_usuarios` */

insert  into `tipos_usuarios`(`codigo`,`tipo`,`Descripcion`) values (1,'ADMIN',NULL);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(50) DEFAULT NULL,
  `Nombres` varchar(35) DEFAULT NULL,
  `Telefono` varchar(40) DEFAULT NULL,
  `Celular` varchar(40) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT NULL,
  `Tipo_Usuario_codigo` int(100) NOT NULL,
  PRIMARY KEY (`codigo`,`Tipo_Usuario_codigo`),
  KEY `fk_usuarios_Tipo_Usuario1_idx` (`Tipo_Usuario_codigo`),
  CONSTRAINT `fk_usuarios_Tipo_Usuario1` FOREIGN KEY (`Tipo_Usuario_codigo`) REFERENCES `tipos_usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Usuario`,`password`,`Estado`,`Tipo_Usuario_codigo`) values (4,'1722239967','JIMM','00','0992669329','ADAD','ASD','ADMIN','ADMIN','1',1),(5,'1722423967','MIGUEL GETIAL','','','','','MIGUEL','123.','ACTIVO',1);

/* Trigger structure for table `detallefactura` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UpdateInventarioonDelte` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `UpdateInventarioonDelte` AFTER DELETE ON `detallefactura` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad + old.cantidad
   WHERE productos.codigo = old.Productos_Codigo */$$


DELIMITER ;

/* Trigger structure for table `detalleticket` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UpdateInventarioOnTickets` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `UpdateInventarioOnTickets` AFTER INSERT ON `detalleticket` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad - NEW.cantidad
   WHERE productos.codigo = NEW.Productos_Codigo */$$


DELIMITER ;

/* Trigger structure for table `detalleticket` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UpdateInventarioonDelteOnTickets` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `UpdateInventarioonDelteOnTickets` AFTER DELETE ON `detalleticket` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad + old.cantidad
   WHERE productos.codigo = old.Productos_Codigo */$$


DELIMITER ;

/* Trigger structure for table `facturas` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `EliminarDetalleFacturaAntesDeEliminarLaFactira` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `EliminarDetalleFacturaAntesDeEliminarLaFactira` BEFORE DELETE ON `facturas` FOR EACH ROW DELETE from detallefactura WHERE detallefactura.Factura_Codigo = old.codigo */$$


DELIMITER ;

/* Trigger structure for table `kardex` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `kardex` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `kardex` BEFORE INSERT ON `kardex` FOR EACH ROW CASE
WHEN NEW.bodega= '1' THEN   UPDATE productos
     SET productos.B1 = B1 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
WHEN NEW.bodega= '2' THEN   UPDATE 
productos SET productos.B2 = B2 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
WHEN NEW.bodega= '3' THEN   UPDATE 
productos SET productos.B3 = B3 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
WHEN NEW.bodega= '4' THEN   UPDATE 
productos SET productos.B4 = B5 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
   WHEN NEW.bodega= '5' THEN   UPDATE 
productos SET productos.B5 = B5 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
   WHEN NEW.bodega= '6' THEN   UPDATE 
productos SET productos.B6 = B6 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
   WHEN NEW.bodega= '7' THEN   UPDATE 
productos SET productos.B7 = B7 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
   WHEN NEW.bodega= '8' THEN   UPDATE 
productos SET productos.B8 = B8 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;   
   
   
   WHEN NEW.bodega= '777' THEN 
SET NEW.saldocantidad=NEW.saldocantidad + 
NEW.outcantidad - NEW.incantidad;
SET NEW.saldocosto=NEW.saldocantidad * 
NEW.incosto; 
SET NEW.saldopvp=NEW.saldocantidad * NEW.inpvp;
    END CASE */$$


DELIMITER ;

/* Trigger structure for table `tickets` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `EliminarDetalleTicketAntesDeEliminarElTicket` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `EliminarDetalleTicketAntesDeEliminarElTicket` BEFORE DELETE ON `tickets` FOR EACH ROW DELETE from detalleticket WHERE detalleticket.Ticket_Codigo = old.codigo */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
