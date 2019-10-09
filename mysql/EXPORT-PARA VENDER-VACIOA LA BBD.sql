/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.25-MariaDB : Database - empreza-xyz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `bancos` */

DROP TABLE IF EXISTS `bancos`;

CREATE TABLE `bancos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `sucursal` varchar(500) DEFAULT NULL,
  `cuenta` varchar(50) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `documento2` varchar(50) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bancos` */

insert  into `bancos`(`codigo`,`nombre`,`sucursal`,`cuenta`,`tipo`,`documento`,`documento2`,`valor`,`saldo`) values (1,'PICHINCHA','INDIO COLORADO','00000000','C',NULL,NULL,NULL,100);

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

insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (1,'1','Principal','BodegaPrincipal');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (2,'2','BODEGA 1','BODEGA 1');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (3,'3','BODEGA 2','BODEGA 2');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (4,'4','BODEGA 3','BODEGA 3');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (5,'5','BODEGA 4','BODEGA 4');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (6,'6','BODEGA 5','BODEGA 5');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (7,'7','BODEGA 6','BODEGA 6');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (8,'8','BODEGA 7','BODEGA 7');

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

insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (1,'CAJA GENERAL','CAJA GENERAL ',1,'2017-11-05','2018-04-01',0,NULL,NULL);
insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (2,'CAJA 1','CAJA 1',1,'2017-11-07','2018-04-01',0,0,NULL);
insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (3,'CAJA 2','CAJA 2',1,NULL,NULL,0,NULL,NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cajasdetalle` */

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

/*Table structure for table `ch` */

DROP TABLE IF EXISTS `ch`;

CREATE TABLE `ch` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(500) DEFAULT NULL,
  `valor` varchar(500) DEFAULT NULL,
  `cobro` varchar(500) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `referencia` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ch` */

insert  into `ch`(`codigo`,`cliente`,`valor`,`cobro`,`date`,`referencia`) values (1,'sdfsd','2342','sdfsdf','2018-05-20 22:13:59',NULL);

/*Table structure for table `cheques` */

DROP TABLE IF EXISTS `cheques`;

CREATE TABLE `cheques` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_banco` int(11) DEFAULT NULL,
  `fecha_emision` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_cobro` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `paguese_a` varchar(500) DEFAULT NULL,
  `titular_chequera` varchar(500) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `referencia` varchar(500) DEFAULT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `codigo_proveedor` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_cheques_bancos1_idx` (`codigo_banco`),
  CONSTRAINT `fk_cheques_bancos1` FOREIGN KEY (`codigo_banco`) REFERENCES `bancos` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cheques` */

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (1,'1722239967001','CARRION TORRES JIMMY HOMERO','','0992669329','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO / SAN MIGUEL LOTE 145 Y AV. QUITO',' SANTO DOMINGO ',' SANTO DOMINGO ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','ACT',NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (2,'2390021227001','IMPORTADORA Y DISTRIBUIDORA COSMO BELLEZA IMPOCOSMOBELLEZA S.A.','','0992669329','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. 29 DE MAYO SN Y LOJA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','',NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (4,'1.718792656E9','MAYTE FREIRE','2.3741085E7','','','EL EMPALME','STO DGO','STO DGO',NULL,0,0,0,'RUTA4\n','1000-01-01','null',NULL,NULL,NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (5,'1.718554569E9','PAMELA BURRIN','','9.8756936E7','pamelov@hotmail.com','3 DE DICIEMBRE','MANABI','PORTOVIEJO',NULL,0,0,0,'RUTA4\nMala cliente no credito','1000-01-01','null',NULL,NULL,NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (13,'1717148371','QUINTANA ALBIÑO SHEICY ELIZABETH','0991878881','','','KM 4 1/2 VIA QUEVEDO','STO DGO TSACHIL/SANTO DOMINGO/ABRAHAM CALAZACON','','',1,1,1,NULL,'','','','',NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (15,'17222d','CARRION TORRES JIMMY HOMERO','','','','COOP STA MARTHA SN COOP STA MA','STO DGO TSACHIL/SANTO DOMINGO/RIO VERDE','','ECUATORIANA',0,0,0,NULL,'21-03-1988','M','V2343V2242','SOLTERO',NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (16,'1722423967001','GETIAL GETIAL RICARDO MIGUEL','','','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. QUITO 516 Y AMBATO Y LATACUNGA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','ACT',NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (17,'9999999999999','COSUMIDOR FINAL','999999999','999999999',NULL,'CONSUMIDOR DINAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (19,'2350994394','ZAMBRANO RODRIGUEZ KEVIN JAVIER','','0986732037','','URB CIUDAD VERDE SN','STO DGO TSACHIL/SANTO DOMINGO/RIO VERDE','','ECUATORIANA',0,0,0,NULL,'23-12-1999','M','V4343V4242','SOLTERO',NULL);
insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`,`empresa`) values (20,'1717148371001','QUINTANA ALBIÑO SHEICY ELIZABETH','','','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO / B LOTE 23',' SANTO DOMINGO ',' SANTO DOMINGO ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','ACT',NULL);

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `color` */

insert  into `color`(`codigo`,`color`) values (1,'NEGRO');
insert  into `color`(`codigo`,`color`) values (2,'AZUL');
insert  into `color`(`codigo`,`color`) values (3,'VERDE');
insert  into `color`(`codigo`,`color`) values (4,'AMARILLO');
insert  into `color`(`codigo`,`color`) values (5,'ROJO');
insert  into `color`(`codigo`,`color`) values (6,'GRIS');
insert  into `color`(`codigo`,`color`) values (7,'PLOMO');
insert  into `color`(`codigo`,`color`) values (8,'LILA');
insert  into `color`(`codigo`,`color`) values (9,'NARANJA');
insert  into `color`(`codigo`,`color`) values (10,'ROSADO');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `compras` */

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

insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (1,'IVA','12',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (2,'UTILIDAD','30',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (3,'MONEDA','DOALRES AMERICANOS',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (4,'PERMITIR FACTURAR SIN STCOCK','SI',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (6,'NUMERO DE VECES QUE SE IMPRIMIRA FACTURA','1',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (7,'DOCUMENTO PREDETERMINADO','TICKET',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (8,'DIR_CONFIG','ASDASD',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (9,'SERVIDOR','192.168.1.1',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (10,'ELECTRONICA','NO',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (11,'FE_SOLO_FIRMA_DOC','0',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (12,'PERIODO','2018',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (13,'GENERADOS','C:\\Sofi\\electronica\\generados',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (14,'FIRMADOS','C:\\Sofi\\electronica\\firmados',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (15,'AUTORIZADOS','C:\\Sofi\\electronica\\autorizados',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (16,'GENERADOS_SHEYLA','C:\\Sofi\\electronica\\generados_sheyla',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (17,'LOGO_ELECTRONICA','C:\\Sofi\\electronica\\logo.png',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (18,'FIRMA','C:\\Sofi\\electronica\\firma.p12',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (19,'PKPASSWORD','C:\\Sofi\\electronica\\clave.txt',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (20,'CACERT','C:\\Sofi\\electronica\\cacerts',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (21,'METODO DE VALORACION DE INVENTARIO','U.E.P.S',NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `config_equipos` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detallecompra` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detallefactura` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalleproforma` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalleticket` */

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `equipos` */

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `facturas` */

/*Table structure for table `formaspagoc` */

DROP TABLE IF EXISTS `formaspagoc`;

CREATE TABLE `formaspagoc` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `formaspagoc` */

insert  into `formaspagoc`(`codigo`,`FormaPago`,`descripcion`) values (1,'EFECTIVO',NULL);
insert  into `formaspagoc`(`codigo`,`FormaPago`,`descripcion`) values (2,'CREDITO',NULL);
insert  into `formaspagoc`(`codigo`,`FormaPago`,`descripcion`) values (3,'TRANSFERENCIA',NULL);
insert  into `formaspagoc`(`codigo`,`FormaPago`,`descripcion`) values (4,'MIXTO',NULL);

/*Table structure for table `formaspagov` */

DROP TABLE IF EXISTS `formaspagov`;

CREATE TABLE `formaspagov` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `formaspagov` */

insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (1,'EFECTIVO',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (2,'CREDITO',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (3,'TRANSFERENCIA',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (4,'VOUCHER',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (5,'MIXTO',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (6,'CHEQUE',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kardex` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `marcas` */

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(75) NOT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `modelos` */

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

/*Table structure for table `precios` */

DROP TABLE IF EXISTS `precios`;

CREATE TABLE `precios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `valor` double DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `precios` */

insert  into `precios`(`codigo`,`nombre`,`valor`) values (1,'PRECIO A',10);
insert  into `precios`(`codigo`,`nombre`,`valor`) values (2,'PRECIO B',20);
insert  into `precios`(`codigo`,`nombre`,`valor`) values (3,'PRECIO C',25);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `proformas` */

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

insert  into `proveedores`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`NombreComercial`,`Vendedor`,`Observaciones`,`extension`,`PagoPredeterminado`,`credito`,`tiempoCredito`) values (1,'1717148371','QUINTANA ALBIÑO SHEICY ELIZABETH','','','','KM 4 1/2 VIA QUEVEDO','STO DGO TSACHIL/SANTO DOMINGO/ABRAHAM CALAZACON','','Ecuatoriana','','','','',NULL,0,'0');
insert  into `proveedores`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`NombreComercial`,`Vendedor`,`Observaciones`,`extension`,`PagoPredeterminado`,`credito`,`tiempoCredito`) values (2,'1722239967001','CARRION TORRES JIMMY HOMERO','','','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO / SAN MIGUEL LOTE 145 Y AV. QUITO',' SANTO DOMINGO ',' SANTO DOMINGO ','Ecuatoriana','CARRION TORRES JIMMY HOMERO','','OBLIGADO: S\nTRANSMISION DE SONIDO, IMAGENES, DATOS U OTRO TIPO DE INFORMACION  POR INTERNET.\n','',NULL,0,'0');
insert  into `proveedores`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`NombreComercial`,`Vendedor`,`Observaciones`,`extension`,`PagoPredeterminado`,`credito`,`tiempoCredito`) values (3,'1722423967001','GETIAL GETIAL RICARDO MIGUEL','','096803062','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. QUITO 516 Y AMBATO Y LATACUNGA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','Ecuatoriana','GETIAL GETIAL RICARDO MIGUEL','','OBLIGADO: N\nVENTA AL POR MENOR DE OTROS MATERIALES Y EQUIPOS DE INFORMATICA.\n','',NULL,0,'0');
insert  into `proveedores`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`NombreComercial`,`Vendedor`,`Observaciones`,`extension`,`PagoPredeterminado`,`credito`,`tiempoCredito`) values (4,'2390021227001','IMPORTADORA Y DISTRIBUIDORA COSMO BELLEZA IMPOCOSMOBELLEZA S.A.','','','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. 29 DE MAYO SN Y LOJA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','Ecuatoriana','','','OBLIGADO: S\nVENTA AL POR MAYOR DE COSMETICOS.\n','',NULL,0,'0');
insert  into `proveedores`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`NombreComercial`,`Vendedor`,`Observaciones`,`extension`,`PagoPredeterminado`,`credito`,`tiempoCredito`) values (5,'9999999999999','CONSUMIDOR FINAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL);

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

insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (1,'laptop dell','WSS','portatil','dell','345','2018-03-25 22:22:07','NADA QUE DECIR',0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (2,'impresora l380',NULL,'impresora','epson','l380','2018-03-25 22:22:18',NULL,0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (3,'impresora lexmarl','','LEXMARK','LEXMARK','multifax','2018-03-31 00:23:05','',0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (4,'COMIONETA CHEVROLET SEDAN','','','CHEVRLET','BLAZER','2018-03-31 00:45:42','',0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (5,'TIERRA VERDE','SDSS','','TIERRA','VERDE','2018-03-31 00:55:30','NADA QUE ACOTAR',0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (6,'IMPRESORA TMU EPSON','','','EPSON','TMU','2018-03-31 11:07:15','IMPRESORA MATRICIAL',0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (7,'LAPTOP DELL XPS','','','DELL','XPS','2018-03-31 11:54:58','LAPTOP DELL',0);
insert  into `sataparato`(`codigo`,`descripcion`,`parte`,`categoria`,`marca`,`modelo`,`fechaIngreso`,`observaciones`,`satorden_codigo`) values (8,'LAPTOP MARCA: DELL MODELO: INSPIRO COLOR: NEGRA SERIE: FANESCA XY N.- PARTE :','','','DELL','INSPIRON','2018-03-31 16:15:00','NO ENCIENDE',0);

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

insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (1,'000000001','2018-03-25 22:23:10',1,4,NULL);
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (2,'000000002','2018-03-25 22:23:56',4,4,NULL);
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (3,'000000003','2018-03-30 22:14:15',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (4,'000000004','2018-03-30 22:18:04',4,13,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (5,'000000005','2018-03-30 22:23:21',4,1,'A VER QUE PASA');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (6,'000000006','2018-03-30 22:38:38',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (7,'000000007','2018-03-30 22:49:19',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (8,'000000007','2018-03-30 22:49:19',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (9,'000000008','2018-03-30 22:50:42',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (10,'000000009','2018-03-30 22:51:41',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (11,'000000010','2018-03-30 22:54:06',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (12,'000000011','2018-03-30 22:56:53',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (13,'000000012','2018-03-30 23:01:01',4,1,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (14,'000000013','2018-03-31 00:46:11',4,1,'TIENE PINTURA DE SEGUNDA');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (15,'000000014','2018-03-31 00:55:54',1,4,'NADA QUE DECIR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (16,'000000015','2018-03-31 11:10:15',14,4,'IMPRESORA MATRICIAL');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (17,'000000016','2018-03-31 11:55:23',15,4,'');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (18,'000000017','2018-03-31 11:56:46',1,4,'NADA QUE ACOTAR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (19,'000000018','2018-03-31 16:15:45',1,4,'NADA QUE ACOTAR');
insert  into `satorden`(`codigo`,`numero`,`fecha_ingreso`,`clientes_codigo`,`usuarios_codigo`,`descripcion`) values (20,'000000019','2018-03-31 19:09:04',1,4,'NO ENCIENDE');

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

insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (1,0,'Esperando...','NINGINA...',NULL,0,NULL,0,'2018-03-27 21:26:51',1,1);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (2,0,'Esperando...','NINGINA...',NULL,0,NULL,0,'2018-03-27 21:27:06',2,2);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (3,1,NULL,NULL,'sdfsdfsdf',0,NULL,0,'2018-03-30 22:51:41',10,1);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (4,1,NULL,NULL,'sin accesorios	',25.2,NULL,0,'2018-03-30 22:56:53',12,1);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (5,1,NULL,NULL,'kkkkkkkkkkkk',30,NULL,0,'2018-03-30 23:01:01',13,1);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (6,1,NULL,NULL,'SIN ACCESORIOS',0,NULL,0,'2018-03-31 00:46:11',14,1);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (7,1,NULL,NULL,'SIN ACCESORIOS	',0,NULL,0,'2018-03-31 00:55:54',15,5);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (8,1,NULL,NULL,'KLLK',0,NULL,0,'2018-03-31 11:10:15',16,6);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (9,1,NULL,NULL,'CARGADOR DELL	',0,NULL,0,'2018-03-31 11:55:23',17,7);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (10,1,NULL,NULL,'NADA QUE HACERRRR	',50,NULL,0,'2018-03-31 11:56:46',18,5);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (11,1,NULL,NULL,'sin accesorios',50,NULL,0,'2018-03-31 16:15:45',19,8);
insert  into `satordendetalle`(`codigo`,`estado`,`diagnostico`,`recomendaciones`,`accesorios`,`presupuesto`,`retiradoPor`,`cerrado`,`ingresado`,`SatOrden_Codigo`,`SatAparato_codigo`) values (12,1,NULL,NULL,'WERWREWREWERWER24VXCGDFGDFGDFGDFGDFGDGDFGDGD',0,NULL,0,'2018-03-31 19:09:04',20,8);

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

insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (1,'cvcvcv',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (2,'nnnnn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (3,'qwqwqw',0,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (4,'XZXZXZ',0,4,NULL,NULL,NULL,NULL,NULL,NULL,'ROJA');
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (5,'TIERRA',0,5,NULL,NULL,NULL,NULL,NULL,NULL,'NEGRA');
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (6,'TMUTMU',0,6,NULL,NULL,NULL,NULL,NULL,NULL,'NEGRA');
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (7,'TTYTTY',0,7,NULL,NULL,NULL,NULL,NULL,NULL,'GRIS');
insert  into `satseries`(`codigo`,`serie`,`disponible`,`satAparato_codigo`,`compra_sec`,`venta_sec`,`descripcion`,`fecha_compra`,`fecha_venta`,`fecha_ingreso`,`color`) values (8,'FANESCA XY',0,8,NULL,NULL,NULL,NULL,NULL,NULL,'NEGRA');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seriesfacturas` */

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

insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (1,'321',1,'TRANSFERENCIA DE BIENES MUEBLES DE NATURALEZA CORP','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (2,'721',30,'RETENCION IVA BIENES 30% ','IVA',1);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (3,'332',0,'OTRAS COMPRAS DE BIENES Y SERVICIOS NO SUJETAS A R\r\n','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (4,'303',10,'HONORARIOS PROFESIONALES Y DIETAS ','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (5,'309',1,'SERVICIOS PUBLICIDAD Y COMUNICACION\r\n','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (6,'723',70,'RETENCION IVA SERVICIOS 70% ','IVA',2);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (7,'310',1,'TRANSPORTE PRIVADO DE PASAJEROS O SERVICIO PUBLICO','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (8,'341',1.25,'IMPUESTO UNICO A LA EXPORTACION DE BANANO DE PRODU','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (9,'725',100,'RETENCION IVA SERVICIOS 100%','IVA',3);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (10,'304',8,'SERVICIOS PREDOMINA EL INTELECTO-NOTARIOS REGISTRA','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (11,'307',2,'SERVICIOS PRODOMINA LA MANO DE OBRA','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (12,'308',2,'SERVICIOS ENTRE SOCIEDADES','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (13,'322',1,'SEGUROS Y REASEGUROS (PRIMAS Y CESIONES) (10% DEL ','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (14,'334',0,'POR COMPRAS CON TARJETA DE CREDITO\r\n','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (15,'303',8,'OTRAS RETENCIONES APLICABLES EL 8%','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (16,'343',1,'OTRAS RETENCIONES APLICABLES EL 1%','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (17,'344',2,'APLICABLE A OTROS SERVICIOS 2% RENTA','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (18,'343B',1,'Por actividades de construcciÃ³n de obra material','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (19,'9',10,'RETENCION 10% IVA ENTRE ESPECIALES','IVA',9);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (20,'10',20,'RETENCION 20% ENTRE ESPECIALES','IVA',10);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (21,'320',8,'ARRENDAMIENTO DE INMUEBLES 8%','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (22,'311',2,'POR PAGO A TAVES DE LIQUIDACIONES DE COMPRA ','RENTA',NULL);
insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (23,'314',8,'REGALÃAS POR CONCEPTO DE FRANQUICIAS DE ACUERDO A ','RENTA',NULL);

/*Table structure for table `sri_sustentocomprobante` */

DROP TABLE IF EXISTS `sri_sustentocomprobante`;

CREATE TABLE `sri_sustentocomprobante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `sustento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `sri_sustentocomprobante` */

insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (1,'01','CrÃ©dito Tributario para declaraciÃ³n de IVA (servicios y bienes distintos de inventarios y activos fijos)');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (2,'02','Costo o Gasto para declaraciÃ³n de IR (servicios y bienes distintos de inventarios y activos fijos)');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (3,'03','Activo Fijo - CrÃ©dito Tributario para declaraciÃ³n de IVA');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (4,'04','Activo Fijo - Costo o Gasto para declaraciÃ³n de IR');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (5,'05','LiquidaciÃ³n Gastos de Viaje, hospedaje y alimentaciÃ³n Gastos IR (a nombre de empleados y no de la empresa)');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (6,'06','Inventario - CrÃ©dito Tributario para declaraciÃ³n de IVA');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (7,'07','Inventario - Costo o Gasto para declaraciÃ³n de IR');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (8,'08','Valor pagado para solicitar Reembolso de Gasto (intermediario)');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (9,'09','Reembolso por Siniestros');
insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (10,'10','DistribuciÃ³n de Dividendos, Beneficios o Utilidades');

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

insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (1,'1','Factura');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (2,'2','Nota o boleta de venta ');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (3,'3','LiquidaciÃ³n de compra de Bienes o PrestaciÃ³n de servicios ');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (4,'4','Nota de crÃ©dito');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (5,'5','Nota de dÃ©bito');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (6,'6','GuÃ­as de RemisiÃ³n ');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (7,'7','Comprobante de RetenciÃ³n');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (8,'8','Boletos o entradas a espectÃ¡culos pÃºblicos');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (9,'9','Tiquetes o vales emitidos por mÃ¡quinas registradoras');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (10,'11','Pasajes expedidos por empresas de aviaciÃ³n');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (11,'12','Documentos emitidos por instituciones financieras\r\n');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (12,'15','Comprobante de venta emitido en el Exterior');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (13,'16','Formulario Ãšnico de ExportaciÃ³n (FUE) o DeclaraciÃ³n Aduanera Ãšnica (DAU) o DeclaraciÃ³n Andina de Valor (DAV)');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (14,'18','Documentos autorizados utilizados en ventas excepto N/C N/D ');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (15,'19','Comprobantes de Pago de Cuotas o Aportes');
insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (16,'20','Documentos por Servicios Administrativos emitidos por Inst. del Estado');

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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `tickets` */

insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (1,'2018-04-08','2018-04-08 12:48:16','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (2,'2018-04-08','2018-04-08 12:55:44','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (3,'2018-04-08','2018-04-08 12:57:19','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (4,'2018-04-08','2018-04-08 22:01:48','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (5,'2018-04-08','2018-04-08 22:04:06','12.0','3.40','28.30','0.00','31.70','9.02','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (6,'2018-04-08','2018-04-08 22:07:10','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (7,'2018-04-08','2018-04-08 22:13:57','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (8,'2018-04-08','2018-04-08 22:19:07','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (9,'2018-04-08','2018-04-08 22:20:30','12.0','96.43','803.57','0.00','900.00','264.6','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (10,'2018-04-08','2018-04-08 22:22:21','12.0','51.65','430.45','0.00','482.10','122.85','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (11,'2018-04-08','2018-04-08 22:23:24','12.0','60.26','502.14','0.00','562.40','158.75000000000003','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (12,'2018-04-08','2018-04-08 22:23:51','12.0','10.93','91.07','0.00','102.00','12.0','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (13,'2018-04-08','2018-04-08 22:25:50','12.0','0.56','4.64','0.00','5.20','1.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (14,'2018-04-08','2018-04-08 22:30:43','12.0','0.36','3.04','0.00','3.40','0.3999999999999999','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000001',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (15,'2018-04-08','2018-04-08 22:50:05','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000002',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (16,'2018-04-08','2018-04-08 22:50:26','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000003',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (17,'2018-04-08','2018-04-08 22:56:47','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000004',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (18,'2018-04-08','2018-04-08 23:46:55','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000005',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (19,'2018-04-08','2018-04-08 23:52:31','12.0','1.79','14.91','0.00','16.70','4.61','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000006',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (20,'2018-04-08','2018-04-08 23:57:42','12.0','0.56','4.64','0.00','5.20','1.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000007',1,'2018-04-08 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (21,'2018-04-09','2018-04-09 00:00:16','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000003',1,'2018-04-09 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (22,'2018-04-09','2018-04-09 12:00:29','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000008',1,'2018-04-09 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (23,'2018-04-09','2018-04-09 12:01:15','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000009',1,'2018-04-09 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (24,'2018-04-09','2018-04-09 17:53:42','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000010',1,'2018-04-09 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (25,'2018-04-11','2018-04-11 16:27:22','12.0','0.54','4.46','0.00','5.00','3.5','TICKET','0.00',16,4,'DESKTOP-OQEODUI','000000011',1,'2018-04-11 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (26,'2018-04-12','2018-04-12 14:11:25','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000012',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (27,'2018-04-12','2018-04-12 14:13:01','12.0','1.93','16.07','0.00','18.00','6.42','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000013',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (28,'2018-04-12','2018-04-12 14:45:31','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000014',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (29,'2018-04-12','2018-04-12 15:14:42','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000015',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (30,'2018-04-12','2018-04-12 15:25:30','12.0','2.84','23.66','0.00','26.50','9.92','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000016',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (31,'2018-04-12','2018-04-12 17:13:23','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000017',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (32,'2018-04-12','2018-04-12 17:15:49','12.0','3.02','25.18','0.00','28.20','10.120000000000001','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000018',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (33,'2018-04-12','2018-04-12 23:57:51','12.0','2.11','17.59','0.00','19.70','8.53','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000019',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (34,'2018-04-12','2018-04-12 23:58:48','12.0','1.79','14.91','0.00','16.70','6.52','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000020',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (35,'2018-04-12','2018-04-13 00:00:48','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000021',1,'2018-04-12 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (36,'2018-04-13','2018-04-13 00:07:29','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000022',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (37,'2018-04-13','2018-04-13 00:08:11','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000023',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (38,'2018-04-13','2018-04-13 00:13:13','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000024',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (39,'2018-04-13','2018-04-13 00:17:38','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000025',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (40,'2018-04-13','2018-04-13 07:39:02','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000026',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (41,'2018-04-13','2018-04-13 07:41:54','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000027',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (42,'2018-04-13','2018-04-13 07:42:24','12.0','1.61','13.39','0.00','15.00','4.41','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000028',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (43,'2018-04-13','2018-04-13 07:45:27','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000029',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (44,'2018-04-13','2018-04-13 08:02:59','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000030',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (45,'2018-04-13','2018-04-13 08:03:20','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000031',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (46,'2018-04-13','2018-04-13 08:07:46','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000032',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (47,'2018-04-13','2018-04-13 08:08:22','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000033',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (48,'2018-04-13','2018-04-13 14:40:36','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000034',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (49,'2018-04-13','2018-04-13 14:41:30','12.0','0.32','2.68','0.00','3.00','2.01','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000035',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (50,'2018-04-13','2018-04-13 15:25:58','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000036',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (51,'2018-04-13','2018-04-13 15:26:16','12.0','0.38','3.12','0.00','3.50','0.81','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000019',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (52,'2018-04-13','2018-04-13 15:46:39','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000037',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (53,'2018-04-13','2018-04-13 15:46:54','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000038',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (54,'2018-04-13','2018-04-13 16:16:00','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000039',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (55,'2018-04-13','2018-04-13 16:20:12','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000040',1,'2018-04-13 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (56,'2018-04-14','2018-04-14 10:51:24','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000041',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (57,'2018-04-14','2018-04-14 10:52:30','12.0','1.98','16.52','0.00','18.50','5.220000000000001','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000042',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (58,'2018-04-14','2018-04-14 11:23:13','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000043',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (59,'2018-04-14','2018-04-14 11:28:46','12.0','1.61','13.39','0.00','15.00','4.41','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000044',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (60,'2018-04-14','2018-04-14 11:51:24','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','FACTURA','0.00',17,4,'DESKTOP-OQEODUI','000000045',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (61,'2018-04-14','2018-04-14 12:16:22','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000046',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (62,'2018-04-14','2018-04-14 12:18:11','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000047',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (63,'2018-04-14','2018-04-14 12:20:48','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000048',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (64,'2018-04-14','2018-04-14 12:50:56','12.0','4.68','39.02','0.00','43.70','13.33','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000049',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (65,'2018-04-14','2018-04-14 12:53:18','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',2,4,'DESKTOP-OQEODUI','000000050',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (66,'2018-04-14','2018-04-14 13:06:01','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000051',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (67,'2018-04-14','2018-04-14 13:07:56','12.0','161.04','1341.96','0.00','1503.00','1502.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000052',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (68,'2018-04-14','2018-04-14 13:10:04','12.0','1414.29','11785.71','0.00','13200.00','12111.0','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000053',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (69,'2018-04-14','2018-04-14 13:18:08','12.0','321.43','2678.57','0.00','3000.00','2999.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000054',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (70,'2018-04-14','2018-04-14 13:36:35','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000055',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (71,'2018-04-14','2018-04-14 13:42:52','12.0','0.38','3.12','0.00','3.50','0.81','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000056',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (72,'2018-04-14','2018-04-14 13:43:37','12.0','56.14','467.86','0.00','524.00','156.8','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000057',1,'2018-04-14 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (73,'2018-04-19','2018-04-19 18:10:55','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',19,4,'optimus','000000058',1,'2018-04-19 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (74,'2018-04-21','2018-04-21 10:36:47','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',19,4,'DESKTOP-OQEODUI','000000059',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (75,'2018-04-21','2018-04-21 10:48:12','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000060',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (76,'2018-04-21','2018-04-21 11:35:21','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',15,4,'DESKTOP-OQEODUI','000000061',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (77,'2018-04-21','2018-04-21 11:38:42','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000062',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (78,'2018-04-21','2018-04-21 11:40:08','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000063',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (79,'2018-04-21','2018-04-21 11:41:59','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000064',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (80,'2018-04-21','2018-04-21 11:43:54','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000065',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (81,'2018-04-21','2018-04-21 11:45:48','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000066',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (82,'2018-04-21','2018-04-21 11:47:41','12.0','0.18','1.52','0.00','1.70','0.19999999999999996','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000067',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (83,'2018-04-21','2018-04-21 12:12:03','12.0','0.00','0.00','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000068',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (84,'2018-04-21','2018-04-21 12:26:05','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000069',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (85,'2018-04-21','2018-04-21 12:31:22','12.0','0.32','2.68','0.00','3.00','2.01','TICKET','0.00',17,4,'DESKTOP-OQEODUI','000000070',1,'2018-04-21 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (86,'2018-05-22','2018-05-22 15:55:19','12.0','0.00','0.00','0.00','1.70','0.19999999999999996','TICKET','0.00',19,4,'DESKTOP-OQEODUI','000000071',1,'2018-05-22 00:00:00',NULL,NULL,NULL);
insert  into `tickets`(`Codigo`,`fecha`,`hora`,`iva`,`Iva_valor`,`subtotaI_con_iva`,`subtotal_sin_iva`,`total`,`utilidad`,`tipo_documento`,`descuento`,`Clientes_codigo`,`Usuarios_Codigo`,`Equipo`,`secuencia`,`anulada`,`fechain`,`calveAcceso`,`estado`,`DescripcionElectronica`) values (87,'2018-05-22','2018-05-22 15:55:53','12.0','1.61','13.39','0.00','15.00','4.41','TICKET','0.00',16,4,'DESKTOP-OQEODUI','000000072',1,'2018-05-22 00:00:00',NULL,NULL,NULL);

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

insert  into `usuarios`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Usuario`,`password`,`Estado`,`Tipo_Usuario_codigo`) values (4,'1722239967','JIMM','00','0992669329','ADAD','ASD','ADMIN','ADMIN','1',1);
insert  into `usuarios`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Usuario`,`password`,`Estado`,`Tipo_Usuario_codigo`) values (5,'1722423967','MIGUEL GETIAL','','','','','MIGUEL','123.','ACTIVO',1);

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
