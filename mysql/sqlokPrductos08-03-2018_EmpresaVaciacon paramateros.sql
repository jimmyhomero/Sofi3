/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.1.66-community : Database - p2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

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

insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (1,'1','Principal','BodegaPrincipal');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (2,'2','QUITO','bodega2');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (3,'3','MANA','bodega3');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (4,'4','PORTOVIEJO','bodega4');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (5,'5','SANTO DOMINGO','bodega5');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (6,'6','BELGICA','bodega6');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (7,'7','PARIS','bodega7');
insert  into `bodegas`(`codigo`,`bodegaID`,`bodega`,`descripcion`) values (8,'8','INES',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `cajas` */

insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (1,'CAJA GENERAL','CAJA GENERAL ',1,'2017-11-05',NULL,0,NULL,NULL);
insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (2,'CAJA QUITO','CAJA QUITO',1,'2017-11-07',NULL,0,0,NULL);
insert  into `cajas`(`codigo`,`caja`,`descripcion`,`estado`,`fechaApertura`,`fechaCierre`,`saldoInicial`,`totalcierre`,`cajero`) values (3,'CAJA LOJA','CAJA LOJA',1,NULL,NULL,0,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

/*Data for the table `cajasdetalle` */

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
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `Cedula` (`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `compras` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `config` */

insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (1,'IVA','12',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (2,'UTILIDAD','30',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (3,'MONEDA','DOALRES AMERICANOS',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (4,'PERMITIR FACTURAR SIN STCOCK','SI',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (6,'NUMERO DE VECES QUE SE IMPRIMIRÃ FACTURA','1',NULL,NULL,NULL,NULL,NULL);
insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (7,'DOCUMENTO PREDETERMINADO','FACTURA',NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `equipos` */

insert  into `equipos`(`Codigo`,`NombreReal`,`nombreSoft`,`Ubicacion`,`Descripcion`,`usuario`,`responsable`,`serie`,`secuencia1`,`secuencia2`,`secuencia3`,`ip`,`Cajas_Codigo`,`Cajas_nombre`) values (19,'DESKTOP-OQEODUI','admin',NULL,NULL,NULL,NULL,NULL,'001','001','001','10.10.10.2',1,'CAJA GENERAL');

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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `formaspagov` */

insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (1,'EFECTIVO',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (2,'CREDITO',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (3,'TRANSFERENCIA',NULL);
insert  into `formaspagov`(`codigo`,`FormaPago`,`descripcion`) values (4,'MIXTO',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

/*Data for the table `kardex` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `evento` varchar(200) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `logs` */

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8;

/*Data for the table `marcas` */

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(75) NOT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
  `b1` varchar(45) DEFAULT NULL,
  `b2` varchar(45) DEFAULT NULL,
  `b3` varchar(45) DEFAULT NULL,
  `b4` varchar(45) DEFAULT NULL,
  `b5` varchar(45) DEFAULT NULL,
  `b6` varchar(45) DEFAULT NULL,
  `b7` varchar(45) DEFAULT NULL,
  `b8` varchar(45) DEFAULT NULL,
  `b9` varchar(45) DEFAULT NULL,
  `b10` varchar(45) DEFAULT NULL,
  `b11` varchar(45) DEFAULT NULL,
  `b12` varchar(45) DEFAULT NULL,
  `b13` varchar(45) DEFAULT NULL,
  `b14` varchar(45) DEFAULT NULL,
  `b16` varchar(45) DEFAULT NULL,
  `b17` varchar(45) DEFAULT NULL,
  `b18` varchar(45) DEFAULT NULL,
  `b19` varchar(45) DEFAULT NULL,
  `b20` varchar(45) DEFAULT NULL,
  `p1` double DEFAULT NULL,
  `p2` double DEFAULT NULL,
  `p3` double DEFAULT NULL,
  `p4` double DEFAULT NULL,
  `p5` double DEFAULT NULL,
  `p6` double DEFAULT NULL,
  `p7` double DEFAULT NULL,
  `p9` double DEFAULT NULL,
  `p10` double DEFAULT NULL,
  PRIMARY KEY (`Codigo`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`),
  UNIQUE KEY `producto` (`producto`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `proformas` */

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(50) NOT NULL,
  `Nombres` varchar(35) NOT NULL,
  `Telefono` varchar(40) DEFAULT NULL,
  `Celular` varchar(40) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Provincia` varchar(95) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Nacionalidad` varchar(75) DEFAULT NULL,
  `NombreComercial` varchar(100) DEFAULT NULL,
  `Vendedor` varchar(145) DEFAULT NULL,
  `Observaciones` varchar(145) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `PagoPredeterminado` varchar(45) DEFAULT NULL,
  `credito` int(11) DEFAULT '0',
  `tiempoCredito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `Cedula` (`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `retencion` */

/*Table structure for table `sataparato` */

DROP TABLE IF EXISTS `sataparato`;

CREATE TABLE `sataparato` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(245) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `serie` varchar(65) DEFAULT NULL,
  `parte` varchar(55) DEFAULT NULL,
  `categoria` varchar(55) DEFAULT NULL,
  `marca` varchar(55) DEFAULT NULL,
  `modelo` varchar(55) DEFAULT NULL,
  `fechacompra` date DEFAULT NULL,
  `fingarantia` date DEFAULT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` varchar(345) DEFAULT NULL,
  `satorden_codigo` int(11) DEFAULT NULL,
  `usuarios_codigo` int(11) DEFAULT NULL,
  `clientes_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_SarAparato_usuarios1_idx` (`usuarios_codigo`),
  KEY `fk_SarAparato_clientes1_idx` (`clientes_codigo`),
  CONSTRAINT `fk_SarAparato_clientes1` FOREIGN KEY (`clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SarAparato_usuarios1` FOREIGN KEY (`usuarios_codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `sataparato` */

/*Table structure for table `satorden` */

DROP TABLE IF EXISTS `satorden`;

CREATE TABLE `satorden` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT '0',
  `diagnostico` varchar(500) DEFAULT 'Esperando...',
  `recomendaciones` varchar(545) DEFAULT 'NINGINA...',
  `accesorios` varchar(545) DEFAULT NULL,
  `presupuesto` double DEFAULT '0',
  `retiradoPor` varchar(245) DEFAULT NULL,
  `facturas_sec` int(11) DEFAULT NULL,
  `clientes_codigo` int(11) DEFAULT NULL,
  `usuarios_codigo` int(11) DEFAULT NULL,
  `cerrado` int(11) DEFAULT '0',
  `numOrden` int(11) DEFAULT NULL,
  `ingresado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`),
  KEY `fk_satorden_usuarios1_idx` (`usuarios_codigo`),
  KEY `fk_satorden_clientes1_idx` (`clientes_codigo`),
  CONSTRAINT `fk_satorden_clientes1` FOREIGN KEY (`clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_satorden_usuarios1` FOREIGN KEY (`usuarios_codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `satorden` */

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
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `tickets` */

/*Table structure for table `tipos_usuarios` */

DROP TABLE IF EXISTS `tipos_usuarios`;

CREATE TABLE `tipos_usuarios` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Usuario`,`password`,`Estado`,`Tipo_Usuario_codigo`) values (4,'1722239967','JIMM','00','0992669329','ADAD','ASD','ADMIN','ADMIN','1',1);

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