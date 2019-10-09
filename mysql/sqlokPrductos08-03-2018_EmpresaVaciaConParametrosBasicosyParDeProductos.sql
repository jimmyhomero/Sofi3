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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`codigo`,`Cedula`,`Nombres`,`Telefono`,`Celular`,`mail`,`Direccion`,`Provincia`,`Ciudad`,`Nacionalidad`,`PagoPredeterminado`,`TipoCliente`,`VendedorPredeterminado`,`Observaciones`,`Nacimiento`,`genero`,`huella`,`estadoCivil`) values (1,'1722239967001','CARRION TORRES JIMMY HOMERO','','0992669329','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO / SAN MIGUEL LOTE 145 Y AV. QUITO',' SANTO DOMINGO ',' SANTO DOMINGO ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','ACT'),(2,'2390021227001','IMPORTADORA Y DISTRIBUIDORA COSMO BELLEZA IMPOCOSMOBELLEZA S.A.','','0992669329','','SANTO DOMINGO DE LOS TSACHILAS / SANTO DOMINGO / SANTO DOMINGO DE LOS COLORADOS / AV. 29 DE MAYO SN Y LOJA',' SANTO DOMINGO ',' SANTO DOMINGO DE LOS COLORADOS ','ECUATORIANA',0,0,0,NULL,'1000-01-01','N/A','N/A','');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (1,'IVA','12',NULL,NULL,NULL,NULL,NULL),(2,'UTILIDAD','30',NULL,NULL,NULL,NULL,NULL),(3,'MONEDA','DOALRES AMERICANOS',NULL,NULL,NULL,NULL,NULL),(4,'PERMITIR FACTURAR SIN STCOCK','SI',NULL,NULL,NULL,NULL,NULL),(6,'NUMERO DE VECES QUE SE IMPRIMIRÃƒÂ FACTURA','1',NULL,NULL,NULL,NULL,NULL),(7,'DOCUMENTO PREDETERMINADO','FACTURA',NULL,NULL,NULL,NULL,NULL),(8,'DIR_CONFIG','ASDASD',NULL,NULL,NULL,NULL,NULL),(9,'SERVIDOR','192.168.1.1',NULL,NULL,NULL,NULL,NULL),(10,'ELECTRONICA','NO',NULL,NULL,NULL,NULL,NULL),(11,'FE_SOLO_FIRMA_DOC','0',NULL,NULL,NULL,NULL,NULL),(12,'PERIODO','2018',NULL,NULL,NULL,NULL,NULL),(13,'GENERADOS','C:\\Sofi\\electronica\\generados',NULL,NULL,NULL,NULL,NULL),(14,'FIRMADOS','C:\\Sofi\\electronica\\firmados',NULL,NULL,NULL,NULL,NULL),(15,'AUTORIZADOS','C:\\Sofi\\electronica\\autorizados',NULL,NULL,NULL,NULL,NULL),(16,'GENERADOS_SHEYLA','C:\\Sofi\\electronica\\generados_sheyla',NULL,NULL,NULL,NULL,NULL),(17,'LOGO_ELECTRONICA','C:\\Sofi\\electronica\\logo.png',NULL,NULL,NULL,NULL,NULL),(18,'FIRMA','C:\\Sofi\\electronica\\firma.p12',NULL,NULL,NULL,NULL,NULL),(19,'PKPASSWORD','C:\\Sofi\\electronica\\clave.txt',NULL,NULL,NULL,NULL,NULL),(20,'CACERT','C:\\Sofi\\electronica\\cacerts',NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `marcas` */

insert  into `marcas`(`Codigo`,`Marca`,`Descripcion`) values (1,'DEL VALLE','AUTO'),(2,'GENERAL','AUTO');

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(75) NOT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `modelos` */

insert  into `modelos`(`Codigo`,`Modelo`,`Descripcion`,`Marcas_Codigo`) values (1,'JUGOS DE FRUTA','AUTO',1),(2,'GENERAL','AUTO',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

insert  into `productos`(`Codigo`,`producto`,`codigoAlterno`,`codigoBarras`,`base`,`costo`,`impuesto`,`iva12`,`iva14`,`iva0`,`ice`,`ProductoOServicio`,`costoConIVA`,`utilidad`,`pvp`,`cantidad`,`unidades`,`ubicacion`,`observacion`,`minimo`,`maximo`,`garantia`,`serie`,`imagen`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`,`b1`,`b2`,`b3`,`b4`,`b5`,`b6`,`b7`,`b8`,`b9`,`b10`,`b11`,`b12`,`b13`,`b14`,`b16`,`b17`,`b18`,`b19`,`b20`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p9`,`p10`) values (6,'LECHE LA VAQUITA','2343','123',0.18,'0.2','IVA 12',0.02,NULL,0,NULL,1,NULL,'30','0,26',0,'UNIDADES',' ,  , ','','','','5 MESES',NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿþ\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÂ\0  \"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0õH\0\0\0\0\0BiŽöŸgq©¢{’ØÌöˆpÜm•ú>~»‡uy÷n—yz¦XúuçŒµ6÷pZHôxÖvG\n½OisL6ïMvþ›2l\\ÉÉ0vsCTÇeŽ÷Q…Ø§¸¼ý‚¾ŸNÃÉ´viõÍ¯’ìrÇØU<o>xû=›½7‘o0ÏÕÐòåõ6zV<zmï{ŒöHòŒ2êÎUž­W\":³‘Þ\'¨9u´ÇZr,ÜOCB:›Q\0\0\0\0\0\0\0\0\0\0\0	\'¢$ÛBO ùÙmaž“ã¡3-”ÚÅ¤“,iÒ«NRBy3ÅD„c,L#&š”\nÉaŒÔPŽSVµš&æ[kÌr¡=KY\\ÂH1žE9‰£M1U$SVzˆ»žÚ¼eV¥b»…¬°¾©aQ7•1c/&\"x›ú*É¡FâRÝ^Þq—|ÐúF–Ç¢cøU\0\0\0\0\0\0\0\0\0\0\0£ZÎqò\rŠ?Aò0Š[«©\ZÒÆRÍ:\'¬šq™i/©ÄZR»µ³\ZQ«M6òV£œK±Œð„\')ÒDš4ÈšœÒã”¨Æ&Zô&•HÓ„ãšDRÅ3#U5oîìêÊµ4øÍ•Õ–QaRfX’Ì›¥žiÊ5á$Mi-äÆfè¼ã êlzJ0‡õ\0\0\0\0\0\0\0\0\0\0\0\r{a×³¯ÉÕd‡ÐüuÕ:0/cc\"r°ÅË3•›fXa—†&V–:9c{%K<%$*\'\ZPªÊ)ËV©MRâr´§‘±Ç:p¯2(OV¡o%yI©ËVbœ/é\"…DZ4§‰©	.âm¦¼²ˆžxT‰–¡1w;‚y¬åŒ¯ãkFc\'dbo!i<Dû¾©µélúficáýT@\0\0\0\0\0\0\0\0\0\0\01y;,°òUŽ_ô/QµFVÃ+I2ñçnb#–Db#–¦œdùÌT32ã8Ff)ÂÃ8F\rššX(æa5Åõ¥øå­±0·zp©ZãIª^²µ“)\n3ÆÓØ#^züÙØÆX6rYÇ’­5˜ÂŠÒÌ-ç…å¸PÎ6b­»ÌçyBÚb9l&2V6ò•%T¯*È^éß„èÚJÏDFñ®! \0\0\0\0\0\0\0\0\0\0(Ö‘S×6ýGè>I¥“k^¾Å¬ì¼]î«4˜ÿ\0}z[½ÿ\0ªÓæÒô™­Ç:,eÎ#ÑSâ=Î¥èéžo‰1ÍÝ\"4¥Ó©£—å7¹°rÉzœµåÌ§é³LóyºPæ.—‰Á„“_ËùmÊñ¹¿Âlè×´²)ÓÇZÛfqŒÆ×5;kœ!\"ŽqV8ÌEÍžZWõciNÂ­™^Ï^\ZøÓ¨ŒdŒ!„òÿ\0Hè?rñ]Ú0›Þ\0\0\0\0\0\0\0\0\0\0\0\0I4±mÑº&ï<•¤µ)ïêClÔ÷O7ÓÛú‹Ðþ{ë¦B×³¯weg‘ÑÎÑ’ŽqŒ†RÅMw…åÙ~×$âY²K®Éœmë¨‚]zL£i½Ò*má»Ã˜õÆrôešD@‰gÌ:÷!áìlÁáº1„-fp{ž·²ý[žî¼{¿F|6ã}µ›-²ù)F·Úì¥¿\rk¸ò>fßBÇn·ÚØzº†áó­¢-x–e<ç|Ó÷o³ù×MÎë\0\0\0\0\0\0\0\0\0\0\0\0$žXŽÍº¯/ö¾_N´^u=ïFèžCµ²ïº>ïåý$˜ª¼ózÄ|û[¥‡|ž¶C±8^vZÏ\r×³k;Ûši#Ì²))ä™atŠÒÂ9cSjÔ2ýhÚ£,}î¤@„`˜òn³É¹6ç¦ƒçý8j{n…»gGÂ`q^ç[\'Ó¹FÝ³\\gç•ç-ÃGê·ÚØä®9>Ý¹­K‘m}Mìí¾‡}¬Žß¨m~Zê„ÜhK4¹F¥¶k[O×ü·dŒ#¯Ñˆ\0\0\0\0\0\0\0\0\0\0\0BiaÆ9gVæÃÌaéÖ·ìócÓùXð½ìÞåªm¼Žî/OßñG9¶ìóthÌ÷È£ÏVþŽ”àž‰’2²å{ö³âîÅYlÐæçÏ¬ú›NqyºÔ™Ò,z5ÃCî\ZÎá²Æ÷Ú‘Œ©O*h™y7Wä|»v6“WËu·)yÜ,Ëy¸ÁãvkÚñVvøe—«£ZÎ{¾.ÊùŽbÆâÒìpxÛŒŸO-¯xÑªÆ†ñ nc5öRÂ¦Ó$•<Lë{v£¹ýwÌõ‰ £¡\0\0\0\0\0\0\0\0\0\0\0„aMÊzï#õžw	B­.ç*^¿È;ÏýÃµk{.—^½Ì¶c‰­OViÏN’o#a)y†¸—•ž±Of¥ç.×c’©Â²ÒS8ÙrRÂÂ¥åæK²žÃY;õ&„a	!ë¼‹•v\'¬òn¡¯¹7.Úl;åyvç\n®»ç»¯>×³¬b#&Õ#HÃTÇU|}¿;wnÍiU&½»cçUï:8a–VK;lì·+[ï-Ž±¼sþ›õ;Ð¦‚7\"\0\0\0\0\0\0\0\0\0\0\0ÊsN=Úx×¨àk”jRïr–7Ôµ.ô®s”ð¾¶ÍŒ¢o(Q­¯1ž•<×q±¦d˜;~v{uÉò‚žØÍGRæN1ÏÙ­ël&„al#¡4‘	Düƒ®ùëNÍ¯®C‰³±Í¬Ó·-·-ÍäŒ:¾mv=bï‰[ÙOq¥Ãá¹Ol°äµ7(èö:MMímšÏ6Õ9\nv“_…ÂÝ”ÝÞá©Õ–ßè,zÞ›öF<Ž˜H\0\0\0\0\0\0\0\0\0\0\0B04N\'Üøg£âkT*Rô|XÓ©&zŽöÊûç¾ÃVÇ˜s,ìÎC\'J®½O.SÖaÎ/ç¨m:¬\r¦+ç{³ÆXÕŒ%”ò§¼ÇÆÆÝÑ¶Ÿ_¯„Òú\n£À“Í~•ówC[XW³ó4cV•4&\"@F1„R€J(Ê1–,fšI²”˜M¢ÿ\0×Bö\'™ì_7Üˆ\0\0\0\0\0\0\0\0\0\0\0#Tó¿¥¼ËèxØjq“ÓpªÒ:íõ=í†GçžÃæŸKÔæÛå|¿¦*ô#Îv¾•–qóå·£èKÏõ{ìÆ3IÙõ±‘×v\rn©º†¶Ôlµôk¬[¥®Ÿnžµ–Äå4²ÚP}\'N(E‡œýç}ým]·òñ•˜F0Æ!BfhK69M,²áté!TšÚkh¸–„!s5´Ì.ðŒn£o5˜å}‡ãeùžÝÀó˜€\0\0\0\0\0\0\0\0\0\0\0B01¾\\õ_•»Ü|+»oQÁ’…{zìõVFÊóç¾ÆÚÛ\'k£eÄ1¬Yc%Î2’ãdÅÂIK‡f\"L­7uŠêJ¢Þ7fÚ5Ñ4jTžPÎC/ë5â„}U0‰1L”ž{ô/Ÿ·µôúsã}o\nµZ·Þèø¸dïuvuØmóU–•6ã¢Wn^47Í­½\"}¾×*ô{,¥î×?^n+t´ËÍ‡[ÖâåhlY]5Ïr³Ûz}lÏ²<qì‡R±9Ú\0\0\0\0\0\0\0\0\0\0\0\0B0)y_Õ^aìòµ›;ËoUÀ£FæJìõUi\'ð>¾d¨™„De’’+ÂÒ‹„¸º(ÌKŠ«1}J5ë²ÎKøÕ–2\\¢‰ÆÞWšÔÒÅ·„°žI¡àûnki˜œµ‡ ÐØº—\r¸ùçÓzÇ*§~§XÂóÛfÎ‘Nx³#™ÅÓôûÚx‰ù½ª¸ë‰ú¾vÞ”-ÔÏ_^žRÞ–GSÎ[d°›sS%ìoûÔª‹Îö‚@\0\0\0\0\0\0\0\0\0\0’y«Ò¾rêó´kZÒz¿=N2^Óo§ã$þÖOˆ´Õk¦¥Îû9Ï°nSÍ4½Â´9v²UŽ–­)*B\"¿-óÜ6_6v~Sm„[[ÑBñ–h”\"!$ð%FÞø.å\ZN½ŸÖ}o-q¡«¹˜“°½¡B]]»Ë*öÛRHgÕ|d™(F¬º×I’ÇC:æ“1g†v9|#:óN«½t9¯cùCÖ<˜Å`\0\0\0\0\0\0\0\0\0\0\0\0	|ëè¯=tùüþ…K[ç¤Ìb6=]¯BKWYñ^Lë<sš×_¬%ç<«-OØÍæùw\r_XÁWLzÜŽ¼Ü²—YÍåìz¼Î“ÆS«_ÒóZÝv}#YL–dÆX¡ÂI\'„Ä¼¼ð½ÊtgdÖý_ú•ZZ»Q—|¡­n/PÅa–‰÷}®Î”Üwê²â»Õ-ysüžÕ6óýþm²¼¸ö7a©~¾Ý¸Eø×ßt-ãµÉÝ}Wæ/OpvÓB<n¨\0\0\0\0\0\0\0\0\0\0\0\0?zÏ½-koZ‡®ó•öÝ;{çïvýKn´ñÝþQ¥ïýWà0ôr¿‰g:”Ãò½c…Ó©-t9<L¥Î¿	gjëL×´mzµ¶o“£ÖîÀ&0ò šÏ$¡Ä;Û§šë»¿êøWô«ÒÕÚîÛ·OÒ“Wë\\’É¸ÛµÍ‰¶ñëv:ö÷ÎéÕ7÷öøhÏ}´Òqfñion=?‚ïz%ØIºê;—g—Õ=!çï@ùÎ„G/¡\0\0\0\0\0\0\0\0\0\0\0\0KÂ{¿ßÓÐõí»SõÝã@Éêîz*Yåò]í;Ð°¸ëæjsZÌº%Ž‰Œ-5\röïGCœKÔî°ŽC/h­9pÛÞßšºÍyž›ðFæ–iH¡ÅÄF\0IÅ»O›÷hÕp9ÜO¬àÜB•MM¾ÕÏØ\r¯Zù›ŒÇ?@k<~\r“Z’ükQ–\\¦2ÂIVšÚrxVfÇC-G*¤Û,¯:œ®ÛÜ¸§kñùˆèn\0\0\0\0\0\0\0\0\0\0\0\0!/íü_wODÒöMcÖùû©`Î:_Yò”8=YGÍ÷z;~…›Ïu0wøùî”O¢^lµÏNGÊÖ¶áë|BÌ=wOÈ’å®cä(Ë×ÑòO`MãûˆË×ò•Õsê8ù¢æ¬ý;TÇ/BÉçS,zw¯{ßåÆIáÖçë—÷¶\\íô—Sa&b|±ÂTÍ¬¯W*¶¼}[Ü¦Xa&Ícf()Õº¸OJ2ž•J1ªR¯wnËÉúÇƒôó\r-¸€\0\0\0\0\0\0\0\0\0\0\0ƒ¯òí­n9¯nš·­óöÑ´¯±\\¶õ­¬Â$rÆXÄ™£,1™ÒLˆÏN33HN(FY‹­÷Wô‡§å\r³-¾Yþ…ú¼´m–LðÔñ}¯G²4º=û[Ç.E7@Øm¯˜XuÎYfÄa¿­2Y§£ÊD#!4\'¾²«¥”&/rx%2ÆHM,¦¦†J×·µeèÞ•¢ï~Õ‘†µñ\0\0\0\0\0\0\0\0\0\0\0\09×EÑ¯§†ã©f=oŸÀb÷MJêé[W§³U4ÒÙŒcÄBxE0˜LÂ0\"0Œì};šoÜ>¦ÑKžv>nö©‡•Øo˜,Dc‘Áæ¯íÃ/®çµŠ²¯–’8Y}Æº‡9ÞÕÔe¯K¿É„aætjc…)®\'•¤ná+XW”£4Ñ”¸žÐ¸„Åµ+º35e›9«yg{Ež¬Û0ÿ\0úèÀ®È€\0\0\0\0\0\0\0\0\0\0\0]7sÔì«Î71·õ¼\nöìµÒ£Z–åKRK\"ÂQˆˆ‘ÄŒŒš2M\n×xùc)²ø‰r†Ç­Ã½XÇ(Üõ»\ZøNÁ}ªÇÞ×¤1Ëo×leÊ)leÏ·C¦îÜ_E¢OÑó¾—Çó»½žû‘Øæ³í_CæñÔ3¹)*žõu…š×_Æóz:v+#Ÿ×éh9ë/Sä0¼£|K³Éëlúó#msó¿\\å\0\0\0\0\0\0\0\0\0\0\0DCZÙ09áçSÚ}WDÁçp{ºñ„c±\\²Õ§er&†Q	¡#LÐ›¡kÛÝnù·Žö½[Ÿaz¾ZüJî§oôžwìX}[ËúÎÇ{6ëpuékÉê<ìµ©N\\×¡yTÂ¥[Ú³Ååc’×·3Ä;G-ùïÕu¾«yÕ&¼g-é\\6ý\rkpÓn¹~ÇÒº±ÞýÎuÜ5#£ØëwÜ÷gÕê`»·!îéóvJ—gÍéÔwÝÑym2ÓaÆt51Y{\r‹ýYRY¾yì’\0\0\0\0\0\0\0\0\0\0\0\0„`C”ÅÎ\\Úµ	=g1¤nzÆÅv3É_o^”“®ÂTÉÂEIe,ñu~]u£µœç=û|×ëÝÏRÚ2])i¦u¯4ktrºÿ\0CçÜ¿OÞ´«íÃÐxn=	¶qáµy³Ô1Ë_©e9=C±îõ6jÝqL·ÕuˆÚðJ£pÅi\Z«¢snóÉóçâîdÝ*ë[öœŽ‡ÑñÜeŽCSÓô~Õ8}Ü{DyëÐ5L¥µoQá2VQ¸†‘©uÞmÒÑÖv¬çm~„Œ&ðþ®1\0\0\0\0\0\0\0\0\0\0\0\0„D0¹¬&XyJ[ºÞ»cyoñÂÏ’ÆíkÉ	›#y·Q:EN­“ÑÝã~KWkšÑ°{Õv:öN5ÊôƒráöÊéý\nç¦ZvœötónÓÊõ[µzþžé¹O§èè\\õFkN¦Ðõ>™àÝ‡ŽíùÜÅ­çµ=/Zâ^ªá›ÞSžÖ¥[CÕú‹ö¾KÑñ|¿-•§§ë=\'©d5¾‡ŽÓä¡SWÒtÞK}‰S˜ë£j·_¥aòö~ƒÃÚ×¶Ÿf‹ÍKh·˜æ;®¹¹lëv(Â>OÑBb@\0\0\0\0\0\0\0\0\0\0\0\0BÊö”ãäªµ,}W+kÎ6ëX]ËWÜÔ²Ý4ÞÝE­CÃø?©l¶xLæ·S½yçÒÚÿ\0•ãy¼iÑôÚæ¿Ýù.Ï-çú¶7®¿å/Q]¡ÂºOŸòXeq^€Ôîùþ\\ž.½Î—‰Îî›¾kÏ¥SGÔ÷þYÓ9ç™Ãeð÷zžÕœSsÕº+•Í$º×Ó\Z/8é{Þ_c¨çõ}crÎoÛþ_É™­·«ÕÈb».¹»ÃÐ:¾WÛçe³xLÇS‹BË+e}S^áíg†Ý¥ïµYÒãùþÑ\0\0\0\0\0\0\0\0\0\0\0\0%žTykSÛ¹ï°óù»~[©Û5ÛYìÂã²qéi·nåþ€ã^é8L¾\Zng©õ(ÛùwGÅèþà½?[±¢ëÔ«ÓØÎ`}	çÜô¡òß§mÓæü“pÓjÞ¯ê_0zÍˆº²×ît®É;6ï•ó$Ðhú½ƒWzÏ[@KµE·ûŽñaÔñ~o¯Ûö~®¹œ½æO-µmÊë+z>‘[?ÒâÙâê`öuð/íº|êyŒ]i¯+«fôw2Ñ¥[K{g˜ÂßNS¡óî—«võx]a	D\0\0\0\0\0\0\0\0\0\0\0‰b<ÁÏºNë|ö:m‚Ûj¬<k[ÛUÒ…Í˜l¹²ùÞ÷§õ}û[ÃÏ•]Ñ9\rüÜ~Ë¬lÚÝnËÁ7Ž{o:oFùÇ5×ºNåùML¾fÃc]†×¨Dí¾‘ò¿¨6üçœqýVöú®ö>GsµÄÞrØ;8«•Ê]ljão³y“wWM™ÈslŽÁfZÞÉË¹þý„µÁg·yØlFÏ‚ÚÓÇÏNT_ç5Œ•m—úæsÑ¡…Ïâuö/z—)ì´å±Æ\'Z0š@\0\0\0\0\0\0\0\0\0\0\0€yË—u.Kë¼þÁy©¶iÙõ˜,Â3ËGb›í÷F­«}Ö…Þ¸Î¾¡=K}ƒW±è?ú\'ïù~y$ñÐõ•!Úõ;¹zMÈí—èä8ÖµšÞáäúÿ\0Þ(ØæÚm:\\ßcuÚx–ýf—Náþ«Ûñ>cÖ=»em~EéŒ™ôý“‰í˜Ç¢ãçíÎ¨èÞø¼ç“×z%§cÔÇwÎ]Ìòç^›ô…°×vnŸo“ÆoiÏZÍe;6Á©l:;µ¥¸±ætëwžèK®qúd&\0\0\0\0\0\0\0\0\0\0\0Fœ9gdãž·ÏÆÔ›ú´\"…˜F	óˆ×Æäç‹Ì2ÝÇú¾Ökìü_A®nÇ?ê<UmeÌêä4Ü=Î®±Ç%å±äÙw¨oô)ô®ÖsŒ5|OÚ³Õ9.AÛlÖÄmø¬†TÞ¬ay5¥Úr[8ã8ÞÞüÓv\\Ï¢a:Vžö3“õNU­onÞ9®Óg\'3 Gz¶.u[Þ=ØË·â—ï=‹SŽõ=¯NÛ¹ûW°²±çtžòO­ô¶jFq:°D\0\0\0\0\0\0\0\0\0\0\0\0ˆ„`q.èo=zŽ%hÓSIBæiÆÎc<)Æz7Õ“½§}JâÞò÷Fø_²ÛJç,£sFÚõMßËîdámW‰©ÏzO4Ùú}Ž‡Å{æÇÝÉâ94þ«K#–õeñów£¼Ýè\r½;û]3’1ô¶s	}ìT¥¾ÔÚÐ<óêN\'ù™wNGC–s¿ÊwµûM½¦WÊsyfñfþ·Cæ¹,VÍšPäŸº×ÌÓŒÝþcaÖ¶ÎGFÖå”)úÍ>–ãtêFãôàŒ€\0\0\0\0\0\0\0\0\0\0\0B0\0å>rô	ôœ{*¶·\nuéÂUmnÙUkU‘¶†s”¢+äèd4¶î+HÕÚÇùç¥sÝ>†í‘šŒ£Z¡okÒÇ\'®nÚî{}·Xä“iô÷\ZÜë7Ù§ÛÔµ=Ê¬<Ÿ¨{vÞç•±ÌÄLyÞ=£l¹ŒÙ¸-)Ü¬6íƒ^îc…ÃÐ¢Þy¯zcq¿dýaÉ£Üîë—§¶ÕÔw\rj5lSåý›w¨Ûä=ÿ\0+—Ãßrwr!“×¿é¯/úcCbú0qzÑ\0\0\0\0\0\0\0\0\0\0\0\0F\rå@ô\\}nþÆó±¡\"¬™ÄkQ©–5ªå0®ÒúLÍ9M^÷«¹RÊ×~¿?©¨m¾_·[dÊí›¹\nN_¤ÀÜçkó64©óMâºN“´êo úkÂ~çÔÎ±išîÛ\"š×HÌe¡Jª&æØ¾[§v¿Ï:Ž2Ñ2ÛŽÏ‹Wé’Væ][‡v~½V|Õ:6÷‡Ø0×³W±¼÷ÜŒœô3\Zó–Ù4}‡‹Ö²ïüg¨ÔÛÉ¸]ic€\0\0\0\0\0\0\0\0\0\0\0\0Kaæ]S/Šôü\\D·XNžíL,ûUg+à2q†zÿ\0\rw¯-ËYÞ´wrZ¶É6½üTéü›§£¥îøÎ©â;5.\'¶ÒêÚQÚõnž~û¢ñÊ°×¹ïCå^g7ˆê2z­ž;îŽèí+j#¬jÌœë’tÞ„mty®·±N¢yÞ|lô÷ê8,öžÓ<¾î×=½÷2éiã9í7SUïýÎ9Ì[ê”ó-qnƒ.U¶c«ûÊ3¹}{1ÑåÜf(ä8}—Jç]/ZÍê2ÍÃëB0ˆ\0\0\0\0\0\0\0\0\0\0\0\0€%š”ð{&¹é¸´µƒÑÔ¶©Nmýz÷ö¹Õ’Íbsšs“¾ÅÉ§·Ð(`©S~»Í:W:¾º]œn_;éÖÒv½bž×nž[èkÚè[_™öë×§¯ë[°¼¼Œ)Ê1\"a ïóKÈ]ï3Á·#¬^ºz¸/Vê½»™±/;é\ZÎ®^,–l¦ûu¼âtnÁõ+^©¯­}V[7‡+×7ºMLöá^Ç›³æÌ¦«·ý;Ÿ•Îâö.§+7™³Épû8Ž‹Íºf½›„a7¥I\0\0\0\0\0\0\0\0\0\0\0\0„`#$ôáæo5‰ôœŒ”]}XÆzõn¬î³«;–Åe4²¾Ík»n®Ö©lÆlÓw¢ìÚÞ7ÒÛtÏæÝ\\c)OŸLU^sÓº~“™ë½.µ®Ó_E›mNGÐöyù™cR¤—°µ˜IÌIæ%ŒÒÂ6·5ÏìGNèNÕ¤nú:Ù¡m‹ìëì9)¦éÛG&“SÉ€âú…9ÞôÞ[Ùý\Z÷e±Ø¦›šóPætð}Wõè¯mŒ#Âê¢„¢\0\0\0\0\0\0\0\0\0\0\0ÀR«kå\\eþÕq±Q–§KJÒ–›4Í^„öS±äñúÓSiÐvj¬ÅXÍkjœ…,rÔ:0é?9îß$[E¥eÒýW[Pè45ý›ý7GŸì|Ž–2L²q§{ic–ž_™^ãDZÝìsbŒ%4ôë\"’êÝ:_îFõþ»é5]kR×kVó\'JÏÅ®6Ó,¨às´2Æ~ÑË»6ÿ\0\Zÿ\05m¡³mþÃvn+ÚñÃlŒ#çû‚3 \0\0\0\0\0\0\0\0\0\0\0\0BÆ÷8ù[]Îk^³‹Fi+ojÕ£N•µÇ\"šÊssã.pÂÖz”¦Ëj’V£Q<Û|Ö/|?¡ÜkPËy^s¹Øi~§¥è]vŽc›énöWfÇ	’êØÎ_Qã˜Ž?Ó¹,ú_cÞüŸ×ìÒ¡Õ<‰×6uû½ž;ÊWìépùzç’éô®\"Í3TÙ{–Æn›¨Yt*Ð©÷­c.–”/MF¤rÇ¦t¬NÛ–„«üN­Ö˜›œnö†;·p~ëM›”a7Ü\0\0\0\0\0\0\0\0\0\0\0\"à³Ú®xywšÀúî\Z¬³lWN¼&²ºöSÖº‹ü®:ö+«gL,¥	%º¥]†/Lë<¯…ÙéYû`òkRîX˜ÃÏy.ÅÂ»}ËÎãW£Ÿ—l4nmZ^ë{UÜ{¥^ó;hµÎhÝw——ÏòÝ.\'96»èÝ>ù‰Ø<ÕÍÏU¯˜ÑµíêžƒÄæv¨€ªTjË1çÎ?îMkwm¸NÝÐ«o»‘ET©S¡m1ÔsšÖþŽ\'Ðrô]nÑ„|·|Šd\0\0\0\0\0\0\0\0\0\0\0\0hû¿:¶¿6b28Ï]Ãž¥ìWUZIÆÚŽR×b‰³8ìäWJÇ`¶¯<\rZö¶M;Û„FwPÛï´v8¯Qå›Ïìn™íF~m^‹òÏ©9oO¡ç™œâ¹[Û´>uqù	­iÝ]Ì0ËªØ°Ô§ØÆZ5î3ÃyõÆ\"óœÕ8,ÝB»¹_GÅú=¼/h×e$O	‰8Aò¶Ó;ß°N—>êÎÊÖÊ/,)QÚ×¶³ÉGc[NôOý	ÏÞßf–>_»E \0\0\0\0\0\0\0\0\0\0\0D!Ê:¿¾¯?Y^Ðõ¼Z1¸–ÚêÆ…|ðºÇÛÍu[mÆ®î:Y1,nìm‰n,®rÇ;ŸÖö=+uÎkß¹;«Û3^EØ¼Þç´yÏAÓfÙ¹÷MÒi«NÁuÚ´ëq8wYYq{Ð˜žnži½Ô›æ‡ÓVy«!w¡œÚ®»Òõ.ëûÜ)ÙEHbä‰ËIi9>:ÿ\0Øç{ÕØÐÆYå©lêYT¡¤ìQ½Pç6)év\Zæ\nV¾•ò×¨47:La\'ÝŒ	D\0\0\0\0\0\0\0\0\0\0\0#àýãÎ[”qõ=_âJqÉVY!ž/-*íkUº±®d©Bzð¶¥wÊIrX¸Ë#°ë9Êgd·©ÏÜóþ½èþ1©¿ë{?5z»qæ?Uèºuó;¦Ÿ?Ÿ­UÌQ«ÃÌ6ìÆ×ÝôNÏRþSb«;Ë}^Þ¼¯½«¬í—Õ{y‹»¡œÆ\r•ã¹µ¾%eÕ»z[~Ã¦â:\\Ž•g®ÖŒõÌ}[ÝÊhÝØê¹c”°¶Ÿbº¾“óO¥8½ŸGÈ÷1\0\0\0\0\0\0\0\0\0\0\0\0¾eôß•wµ¹¼—}G*RlâOVÊ(Éw%øB¼kÎ_[Ýc‚þÞµyQÇ]ÒÎ\'Ëc/ñly­s3ÎÚÈãs3jìð­oÑš.\n\\f·g·\\òì‡\'_¥ÉÉuíŽ‡Ïú†v½®SiÜõ~fÇ¥+×êUÌac±´6{™•Yä…}[œð[rî<³\\èp›ž§ÈÖ1–t:zyÝ×núöê{BµvVÅf¦‡4§Vßv«IùŸÕ<.†ó4#å{ \0\0\0\0\0\0\0\0\0\0\0\0B(ò\'®<[ÓÒÄM6C½ÏÂW¡s³T´á6xFêÞç<+T¥:º×¸[ÙÇ/åYcäÌÛ+ÅÜÏÙ)¯fÓ“ÖòüÞ…å­ìÔÛ¯s>Ëiœù~¿Oåš[ÒzW…ç¼¾ï£äáý3Ìís¾k—£éõ´Äaëu!S×C­‹Ô<‡HÌìkasÙ*ýnmÆ[\rSoKn¿Ò²”Ûu¡ôÜE•éÛ®±”³¶s„Ö¿fÁa*[†\nk»-š²þÆà^‡ñýäa/HŒ%\0\0\0\0\0\0\0\0\0\0\0	cD±òº¯w·apu´òy]g#ž9k]—5Lé2õûœvÓ©ÚìÓÍï¶lõÚúÕþNú‹0Lî%ûl•µÕÙ]ÛÃ:ó¹}[)­±µßkYMüŸ(êzæ®Ï›¶­s{âôñµ4ilŽv·6Ì.[\r°u¨¥7x¶îr8­×R²ÛÖÑnvkm\\¹‰.¯ÉFqÇÏq,e-j4§,…|,‘š¬˜ÁÖ¥T¥}ŽÉuå¦Q¼z_Â›çšïzú:ÆÍÁßŒa\0\0\0\0\0\0\0\0\0\0\0	x¯fñþÅ\\³qÄfý6KKšjp„ØMÕþ.L\'{¯ÏúKZôåÅBMýMµ UËŠ×ò•.©ÖKg˜²º»ëZyãŸÈjù\n.ÛoµLŽ–Þ‰úc«¿æ¿Dp^ÁæºY-y¯ç9Ž×À}-ÜÑËÐ´¡·Ï¸´§o±U;9±ÛZÕ)ÙP·ë[JEÍ­½1¯FDå±*F˜­-)1Ë\'\r_4ŠÔ%²®Ì~W¡ÑØ{¿›o5óö¥ïœýçº\0\0\0\0\0\0\0\0\0\0\0ÞXõwØ«Ì™l\\=G.z´á¹D·4+Õ”ÈKfs(DîÑÓgÂ6øjÓÝ¯«½ºŠÙmíYfnµ¼dèÔ“®JÚì1õ*P·ö¹Z»6›ÝVïZÜ–‘¸\\ëíh´ú5z-Òú%¼È’Âö…µbñùœ^Þ¶\'‘«³N½KcÕó!3ÊYr˜æ2&ŽSMqR’Zs•KHYQu¥Ôö\Zû[N;{WU±ù¦Vm»YÇïhxÙüN†qñ7€\0\0\0\0\0\0\0\0\0\0rÎ§„˜ñæÑÚ¯gKÏÓì6*çòo”ftywirÇP†ÙK(ÖYê3™ïá–•â·ÃF½­Ðmô™(Ë _òz‡Iºæµ%¿ÝóhÄtV££¢a4º™ãÔ1š|rèY.qF›zežƒ^›vÜ^=fûÍVó¶	ã¯*˜<%†Ý[5æ“Jc{ÅjwRÏK…°˜è\Zþ½a”ÝÓ¶©·MJÔ¥MÌ¶•1Ê5vZlÓfì»^¥¾s‡¨³ZöyW×ùª\r[€\0\0\0\0\0\0\0\0\0\0\"%L$ŒÂHTáTR–¹òÝeØ˜ødPÆC(–&\\Ä4¹±ƒg\"`eÏ~Mr¦|`êåÆ2l„aeZ²TáU\nqœJ˜‹zW°™ÇRËŒ\r¶Î†¥OqLiMÔi•6ø\Z¤»lSª\\ìHc/ªˆD˜£\0\0\0\0\0ÿÄ\06\0\0	\0\0\0! \"1P#$%0235A46@B&`ÿÚ\0\0ÿ\0êßŽü7îoÿ\0‘E¾D–ËT¶R}vùuÛ	ÚJ#ðØßÔL9­‰§íhû~DÒ3òë\'?`Û_´»_´\'¶YäîlçÓ‡½ ¾¡öúoQÌÊÅi^Yf¦˜Ù’˜Ï\'!æý ¸L¹íI¡¼þYö†¾§þCF¿ò#¡Ñn£<€aœÊµÔ7^ê|Î(nÎ#§æ1¸*î\nûK]ÕFQZáiYÓ{Ú${DÜ§óùk/µöŠeëÉÒóyÌ¼›™©BåºâBÖ}ÓÜÊCæ”½$›Eµ‹Jk!µeMåv­¦>kfÊUŸÉêÿ\0ä\'ùµí	}%ûBl\'Útû@ˆ>ßÄè/Ú4ŸÛè]Â= Ã5´Ý3Ïa?ŸÂmiö…ä6F^Í¬¿¡«å\"B;„ÌõîÙ3Sì¥øÄ:ÐÂ¤FÛ5³(Œwj×v³#xÆÆÆÁxžÇ¨ø†Ô9˜ê7”ùëêo˜[d…mƒBAi#™¨ä\rÃPäÆÌlÁ:c¸P)KêNúGxÙŽå…‘ub˜\'!TÂ 4FY– ’GÂ4D0ÆIÛß¡º[CªJ^ê u[!Ö@ë¤uË]ÈîGu°rö]ÀëŽ©Xä69ŽcÞÆô9Žf9Ž åá¡Äz›ZíÑ¯„r nŽ·§2Èu!±ËC™„¹¡Í³d}ÀûÅ ”4c¤ÀàÈ[MK%®ŽÁDNû‡d˜df¸D€l$t’0Dœý\rßØéSI\"4 m½rlm\0œ@äÔh-‰mo¨ÎÌÚ¦ŒÍMh”Ùñ0ï\0g¡Èr!éà@üh\r¥:O™ØäCä930Êˆ”•4¥QAÇ¥2mq6:\'®ÝcµXíVcµXí;Ghàì;\'AÅp²¢!ð»úµôãrqôÇA·ÐG™mcµFûvÈvÍëµhtXÃ	³•4Îú,4É¶É¥±¦ô¢@Ù3zŒr¶669\r‘ƒù\r#@È†¼}G¯|JL8›\r$ûvEiFª°¸FÑ!ÐPé\ZGMC‚ÇIÁÒtt¤nI¿!÷ÃïGÞ|/>‡\'µ©6Ì7N-pvF˜AAc‰Â`vlk±`y{@à²;&t˜ŒŽÕ‚»C¢ÒF”Z?ŽCß†Á\'`ÏÇcÐzx\ZM%²c~	lÔ:#‚G-Ž(\Zll89ê¬‡UÁÕtu^W‡Uá×xwO9ow.±Õ3cä›ï¡ß2OÔ©½‡¨\"á¯ñ×‡¡¡¯\r!¡¡¡Ä\"*ÝÄéLqpÐmŽ¨é‘@Ö|‹¥Ã€Ö¼9ª‡52ó„pÝÖ”a,¸£8Ž8ê\"=NÇj£\nG™±¢â^!È8A¹-¶X²û›ÿ\0¡Ø–áLGMÿ\0@ü5î—¨2\Zð/tüZáÉ$Á!ÉçÇ~¡?»Šž^Í\n2ñ2ôðõñK|Ìªœ2ò•`9µ‚JÁ-ÆÁÊp*BÌ¶¾&©ŽsØbI0NÎRÁ¸9\røƒ/Ï>‡0·\ZË}_q¶”ò¼²Y*–<¦`ò™ƒÊf)˜<ª`*©ƒÊ&(š<šhòi£É&$š<–hòY£Éf&š¦aCØ2X&œ1ÐttÞË Ù|D|Â`È[,y\\Àšiª/\"š<Šhò9£Èæ:I¨Scšûã©ÄÜ¨\'¨ƒ9n9¿wÈƒfÊ0É¥Ä †È˜3!±£0L¸ šù+¥˜°ãJeÌ›}\rÒÛvi÷6)?°ÐÐv{,«­5DoO	zyŽ¤áÎxêXv\Zçb9XŽV@üÈ™üÈ~f?3»ƒšòKÍ ÔøÊdî#™ùÃ ­ÛlØ+\"óÆ:BCVL<¤™Ð\"Èl’fƒ!¯A¢I1ÐlÁÇhvÍÙ‘Ù°;6fÀíYÈtÒCŽ¼m“ÆÃ/Í>†¯•£~Š÷(}gm.Û;0Pc_¬~\Z@ÈkÀ‹Ü›Y\ZÁ2\Z~•ä9Ô\r5È%–ÂÕÀÔ|„ë¦«Bo#º©öÖ’2(*ã.%a×Ûd›šÃ‡clÍi\')ˆ#XGšýÜ8îC¶9~õÙ~aƒæC1lŸ_3ñÇKñs·,tDŽ?Ó=Ml‡|;áÞŽø‡˜$wé`æ`‘æ)`v)b‘æ9£	Y/Ã@‹Þ¢B_-äd9llSþa“ä‘‰Ú—D©¹-|DSb4ñîWs8Í¥v\'ß¥ì&µdýtšÛùLÄCSqh’‘\nÑÂF!XÓ•ÙD?+šÚ‰ÄhkÜ»N¬°Oì~‰pßã•ó?q?{_÷™\0Ø~BXI2¹!!¿ul!bDChØØØØØß†ÂVh¦u=Ó\Zð ñpºß‹îtYÂÔ\ZÉ+±a²]vEqSëq\\zEÙÃ)Ù~CqäÐads¡H·†S\ZÈ\"®mF7Xº:Ë=Üž‹1é1Ú›jîÝ#ñø~/è—ZnáÒã§á¦-Ü…¬›Lvû…ûÿ\011ž“ž	!ò7¿ð#ê·ïÊþô¼r7úU±uIAE•¬ÌÊJÎ|…E¯Åò\'nÁ¸IÌ3Xn;|äÞ†È˜cz,¢™õ°Ô™òòKw)âãWoYÃ^MïÓÜ·Oßà÷ŸD¾l¼úAigàcOá(sãÓY¼ç« @Éå±OC‘X¾¨9-ÌÄXdU´ÊÊîa5s—¹‹œ±ÈNBÌ%Ç°°I)“ðÞ¨µÔ#ÒRê–I½6Cbœ]÷ÆW÷Åã‘¨Ñ&÷(‹aTùy4‹Ì¥«¶\r{Õx=Œh\nÈmR«ÊûèvŒ±\Z‘åîÆÒ#•øÞ[Å¹”ÌÌ™d¼š[±fB´vªU’È´^åß£~ÏËÓè™/Ãy+ùOÆ…:¯ÆËi‹îò:äLHÂ–õÔ<^|A±„‹ÈePÍ‘mmY‘U¿	èz\'´–¬¾îgÝÄ“9þ¿xÿ\0–wF4¬.¦²:T…È%P™7.ÒdôF¦fÃtpœ[s#(/wbg¥ðåàe°q˜æ¢%°Û­ù, º˜NzØÑœ•EZ‹´ÔÄK¤¯@»&.¾×%*;%\'#„Ê[Ÿe%å[Ãb«;ñW>G{ázEÀKî~‰––­&ß+Æ”¿.Æð’R[QÄsçîšHÂ•“l¡‘dÿ\059§ÑA¥qYu×*¢:¦j\"GqÐìºˆ“—åL×OJòÆQÉï{ýŸÿ\0°d9¹x”¨Ëq7GfòmÙ²,)<dc“\"HMêÄÜ~Î<L~²FH›6šu“÷u¬9Yn€X¬§U\"Šž±ZÆg\\fU(†ŠÜZêh5ˆÅ}ö±Ì‚ÂàëqT*»Ë8Spœ@ÉKLà%ø_¢f(ü\\ïåWWÃ[Œ—å\0Ã%Ä’Œ\nb>ÙŽ¢Lr!°§R‘\"w\"Q\r\r{ä„Ìt[÷l?ö‹ÐÔ¯ÅKˆ™2ï¬ü§0´¯”Ç}‹\\n^#6Sòæuä/aÚìs0ÆtæššÎ_ÔGRÙÅÉ2¡¼£Kpi »!§ŒóÕ˜»\Z¶¬ªiçqËÊ;×^ÏrŽš-›W8Ö/+¯^IÙäÿ\0³/À}4/Š`WŒBá[Ž\Za¯!&;vÌ6‡dØìÈyy.\\½@à,vNÍcµXíÔ:	“0Ü\'Š–FÇÿ\0bÈ¾o¨“c]eÐÈî*£ÏÉ¾Ä›³IŒOîï,•«|¢Åp¡GÈ!ËÇò;æH_d0mizÊ…*ýóÈl×ænTÆ¦›Z¾ÆÔØ‡O>½¨˜„9BóÉkŒÛªÇ ­æ#µ>\'QJ8Tý5/º{g0f:Y\ZxTx™èÈTæ_«¯Ó³V²+:ÔÙ´ª)o«ì¶—öc®çÙÓ@¯¦f½Ri\rÉlclmŠ(‘žòØiQG‚Àî«Ù_À@VSy”bÍšº2”cí|Ðytáö¶pû]<a81›ÈBä]¢ÉX³}:o¢f…øÎ¿Ÿƒ¿ÇVZ¯ðvAòL^@£6;fÇfØí)…¦CC¼tw®)ê`cÌX$öÌw­‚”Ù‚}7úY=²àäkÞl_l¤Ì$ƒË¦Êæ˜<šÀÁßX¬*ÆÁ`ÎSƒ·uC³1Ù‚†QÙGltP:I4Ž	:IÝ³SQ’Ë´IãSôLÀ·U¢é¯çà÷ñÀÿ\0„Kw0ÏI\'ïË‹È•á±±Èr‡-‚PnJlK\'G0l%è t:H48‘‹õKÃ@Ázjäº²ã]ôL´·J¯F×óðsøàÄï\'IÏfÏ\"Í«Ÿg˜Ê„ÄlŽáÇ¦æoÇ³¨Ì›.RÔËy™Å|Iw1n\ZšßÝ×È%B+ÝT{ù‡þÉ¿{ýýB÷ógÑP‹ŒO¢dÉåH¯Ú¯Ž¿þþ—\"ws_C’)ò_ã¦—»/2*ÌÂ7[$Ê)[\\œ™½Xf×’Z¨jÒÃú»}Ù‹¾6kÚÈK«:õ˜\'Û·B²LÑ\nî<éD!¯‹¾þf_ÿ\0GúŸ/{`Œlll´õr?£D»GR©ý˜õê>Aßâ®ÿ\0€/îf5W¥éo ÙŽŠ(0”\"²ÚæÐÀ±\\8ë›œáHYU%$˜¼W\"šB%«”UîQ»\ZC´óæ-è²Ü…=‹5S>‰ùEOßûù·þÃþ{›ðØØä9\rŽ²G]¬‘ÕHê¤uR:Éd‚q&5±ùXþ/¢X§”ÿ\0‰EâéýÔHBC=dGßR‰%*W\"RG¡­{š\ZG	ž?¡œÿ\0~_#=¯#æc‘Qê44`´‡ËÂSdÄÃFFMDqä­®¢Ò›õL/ækøþ‰(·_¢â÷ñÅøcø:Â]\Z}‘Ý8:ïëHI]Ê‚£>`âº\r…ƒlÈ\ZF‡ÃCˆâ	\0¾qâl|½Í{™Ñ~zŸ”ƒä¶S®&ºK’Jý¼ªgb˜Û©OÙÒè&‰®ƒg°ýz’íc}	‰í×ñ&¾R¡ª‡ÕTIA*•’ž“µ$}ŒUµfÊc¾Éé½_køþˆçª\'¤+ä9ê-#õM\r„í[0p›‹cËÒ<½¶×ég¿ÝÉÏITž–Ì9í2Oÿ\0ç²?¾v]ÜU:y|!OL4ÎF»×·Ý;ÅjÑ6òÐ)f\rÕ5˜Ž~º3þœ3P`¾îó·û>ˆ¯•‘iÍm a%·Óòð×ƒZH†Ò;Èàìb;hd<ê+ˆf\nÆ2‚_mü9÷÷	ùIoa™&…*sÆ÷YFžJ0¢RHÔ9QDÏ[\n¡Í½õc}m¸g²\n=¦tÐ‹5!ÅñY­|Ÿ”úQû~ˆbÍ˜z$úøGõã>ÍŠÖüÆÒØË’ð<I£°÷RR#»\rÂ!ÇÓˆâ8‚ä“‰2Ö^1eú\'ïgÿ\0Û\'ö½)Ò”…6àû±Ôi å6ASR`˜êb¨Hw¢|Ü¡—aÕ2ÉÜWƒsx¥×\rõ’¾ìÐn¨ÚRJ´·=?/¢´Oæ+..™xV\'Áx[Û\"®=U3–.I%ãcXÕ‹â®’õã¿©M®†ãÌ™ý_hÛ#ö?ÿ\0rÒF8âCCA*SFä·IoGá¡¡­—S¿6ZšT…|™?VÝØCÅÆ¨úöÅôkupº™®°1B\\ïBÜ&Û‚ƒ¿¸/e½†f±!RrjØnäèfdBðùƒ.#æ^3Ëßùû¹ù~hŸÛ#þãñ?sG¦á¾ðo±xBÆçÏxðž=•ÄÌ{ia•Ñ\"–lÌFz.ª=¤ì†¥ò	xýB“®\'³HdöÖ2ŽwE1}ðÝËþDžÈÆ,Žwã!|ØªR•jÂBàUZ¼Î-Ec&ËŽ§Ts>=Â±Çñå¬éã×)öÓX(:L¿uÉ1¬G—d\'Ð?Cÿ\0?ê{Bÿ\0¹?)÷1C‹Ü|‹\ZUq<z%Ì\\~½‰ešû*fw¨Ìœ†Îau*™œk“dâs&9}-\'™bÿ\0W“5æ•³ÝêDÆ²Ç³%ôåä°NÆ8ä\\c«“8zy]ýÆCð_IVÝIèþcO+Ñ“¶k¨u‡¬±ªí[\'³fŽnbÜyØý·ybJ‡°kÆµš\Zf,\r¶9FäK7 ­Ëé*Q_KKì_Èa%œÇaÇ9sž)ýOhEø”ú¦Gý È{>þ¶Á¶ò\Zog‰4Ç¡ø3Oh)üÏûÌM¯†G´å]ìéZ—ò%Œü~–ft¿wœQ%3J;ÝÃôÇ\n%‘¢-µEEkÔ–Î—ÞkÖðá(åsôSQjñÒ5:eÄÐd’ÂËvâS%%ŒzIÖN÷V²m76c3üðÐ×‚C¦8èð?Óöˆ_\Z?l¯úÌözÇ,:9\rEi×ÙWýÞsíŠÃ¾i_Íœ:/gªüÒ‰œ½>4,Ý±\"eµ™C5·2>ÈçÝœÚ¢»}4òs[0Ò^¨-®9qNØýÆR_Ÿ?Â’¦ÉG\ZµO–&Hnàü/©<Á5y%D¢ð“5˜ˆ¹ÈU<‘C˜ä9Ž DÓ©ÆQÿ\0[Ú/É¿Û3ÒQø{;Wáí$.¿&Œòd1k%P2gî(ïâ]e®Ë8­<äu-FáëÃ`ú\rúzŸ¡AGQÖÇ³òûÿ\0£eÿ\0wpµ©QÐêA<d(ç”øØTÇ²OÙùÐÏ¡~õÒ^\'5óF°œ-!8lpX„\"ŠW,b¼ƒTPY46”\'õó[$Ø[£öØ£Ñ\näŸ˜£È]¢DùJŸ)6sÊ–kWƒØÒŒqXè:d˜Î˜8Nì¸í-¤{>/èÙÑjs\'É…~à¤‘£ËÚRâVŸÒØæ@ßAésã¹hu›1Í# ·„ä¹ª–ÐfdA8–öÂÇ j f8¨ÇnáŽÑC²\r £ )!Àˆ$ˆ-! ÁWÏŽ†‡³Ôü?FÏKO2æ’£Ù¥[-‡Q²6my·š[6>ÝÙû{`CíôðyÝ‰…g†1¸PVOp°«Ëeƒ±°XSòÖ¬\rµíÌvã :&:kÕI¦D´ÛY¶‘Û \'.¸HNmj@³«2nì‚ó‹EûYöa¶4	:ñu”¼žÕÂ±ŽÔ2’††¼x†«Ýq+†¦Ò¢Ð=ò÷æaÙò5èÙò>³$sZÒ–”z\n0~£D4448Ñxz{ñc¹/a2iI4*»•eð¹¡XlòˆØ<^Á ñùé ?Þ€û	m…:jo¥¥(5S1àû+Žïé!³pÊ\ZÉoÄíÒRT’L…%}ã\nm~§áþÿ\0A04q¨ú6vÃe8òÓŠô2=¥@ËÞß§èPÿ\0n§•eµ=¤œoáÇâÊ´±”Ý5™&ÑWUY>êÈÍ«ÆÊjì­\'d1•O‡Ev#÷Ó_’Dº!2ò+H…:ZçÊ?ÑÐBÔØT‡9{æa\0Ã<1<i>š§•lÇ¸6ËJpLŒiSfôÇ^ÿ\0öù|…DlÉœ†¢¢:¢Rb±RÍt¬v|™ÄZ«q‡Ùìž©¶&Êògwy5ØUX­‹Ö2ÕV›žÞløË©~\\æo`•}‘ûüF¼445ã¯C^\rƒ\r~ì])>——å&d§[^‚ÖF—QÁj\nôý=û˜çöùÏüØ¯k&WüØ•£kbf3cÜË«n¶ºª‚5„\Zø×‘dæÑE¶Œ«:L>+±%31,d×“-!=^åÌä[3&e‚ÐiW‰\rHâ8@ÐÐÐÐÐà8\0Ò^?š™ýÔHáSôl°¿&è–Ú× å¹n”0ƒúì¼¸îË±“8šT«™ÊA,ÐmävD©¯ÌTIÏC_ÚËL‰oM\\é•ÈFQ-§X9:\\LÆS\rÍË¥Ên5’ã¥çMçkñù3Âq¦bkA)µ4¤üãSËNÑËa$€hÐ6‚›”†Ù7š7ŒI„äU©Âô4‚/^\"9|UÉãèÙ9n™)ê0„Ÿ6]q…Js¨æöF_ü:^¾\Zð EêD8Ž#€éŽJQo‘¢\n_É\'¼¬_!vTŒ®»“•”LV3?/‰T™vë¾Œ˜³‘Ó\rÒÈNc’’šüiK4×Â`YFj¶3y6§#ñäO#ÐÒ½HBNÞŽ\\Xú6D[¦‰û…IŒú¸…|Óê^4>^î‡Ìàã²æ”lA„ÙÊý_Pùa˜‹\ré®#˜¤DÅe1h’y£aÝx¤$‚Hà\r±S¤ÏÊ,ûDK”©+uBú¯:‡¬3;7+üÄáugXÝ›rëÝ¯r¶¹1Û±Ë£Ä[ÒyØåm¸×™ÈR“»ŠyÐií9\"ZÒTÖÃ¨Ð6Æ…b9KGíú5ér©ˆz}ôvÜGÂ ž½Ãñÿ\0<1JÄI]¦LÔ%ÎÉåÉOÍ~Ó-RSM_vxÅÇ¡;œO\\e/ØžòäVd)éÞ\r			H$lUºQgeTË±$cÓÜ]NÓ[iKhb5ËÈ_L›1\ZSß­Éf®Åm¡ÒÉ­=\\3Z ÒõI¸Í2N;ëXÖ\"tòXì‡«>.G4†A¤kGJß+ù}\ZÅ< þ×¢ÎNì¢’\r¿ý?Ð!þâSÑÉ¨Ž1Œ´~a=×ì°ÈdÄ\\‚ÜåI©­ó7”ZV­×åIá}áÇ×ˆ F±Óš’J¤ŠáEbLuLµ»ÉçN«\"–‰ù„õ÷ff°Ä7$Ö>‘W‹L93$X²^\\µÂ­DtcðÒQ¦¼H4¯¨ªŸë\Zô4C#!á*¶N4Þo•™}ÈøÀÿ\0ôOou-ž“¿êûºõâ‡Õ0öQñÒ—¨Áü$¬]66ÖÝeCÎ\Z…Ê-J¾xU»0/¯mØIø„l~l„Ë¨“¡Àzs‘1†JSZ“{ŠëÖ÷±©Z›”Î–xµ»þcufU±l,–àcÑû<}«tÞVT¨³—ãIîÞ6ø±å&ºÔÎFÒŠ4Åýã)Ð¨Wå­\'×ä	A\"SëO2iZÓë‹·»Bú=Áê¬–j?õ\'£pŠKF\\Uâ^F†„J™Sš‚1hd24“§Ð`kõÉ¬Î¶¾ºsÏ˜nSÊeiR‹Ñ¹.Mœ2Ÿ³V,sF#;Y=«˜RfÅ£o‘Éš¢tÒªiG*ªýÓzÜcÇ«|¢¹éÌJŠìGC¾\'ü¹§ö;n\Z\'|J\Z	¤-ÞFƒøï¥%˜<ºŽ ´(ìÙ8óZ\"‘­¡i‹‹lbˆüÇèöåÊµ)¾ÉMšBÁS\ZÙðb#²N6+%ÁŠör“Ìv$Yd±köbûyÓ[Ö§;!UråIÙZ¿f¼B	É—eŠ>™Xþ%Ú®UrÃ/è¥9EŠa”Ë°`b¶\n¢m«’×óðÅ½irúvâøÙèŒfˆÕ‰~êÔó…™ÅqsÙ¢3B›f¾[—±c£ žÌöŒ‰!\'£´–ìÒŠzJbŽ\ZŸ›dêP…:ÚK»hŒ¥´`+\Zë4¶´xª?ôyhçËƒ‰€JÒ°ämz)<LQQw¥\"ÊJ&fŽò¯›VòÛr¶r§ÕOeÆ%\nªÇ-dä0„ÔZI’Ä<!kQÖS±,n3ÈY:Ž\\K\'¹T×Ô@«~Ä)&Ûƒ‹ßD¶ÆWW`†!ëQ”ÿ\0p*VD3„êX/Uƒ]¦e9lÊ;™+8ãê¯¯à™t<¨Üq{‰#’jkŽÁÅÂíÕK˜ôOÀFzQÎ”_\'¨PL¥ <}CÅQø¿£¯öÌO„Ê–hˆ²Çqe)žÿ\0«ß58¾ÂŽÁÓä>B¢¼ìæÄŠˆq³&LƒÅá\ZÎkÛ³¿yg#Ÿì,Ÿ²u?º»ÖG3·…1ÎnŒf	F¥²/Ç\r‹ÌŽœ¼0åþQtùI³^èH¯Ë#M“œ§ïÅRVìüÖ)ª9¤ÈTÂë»ULo­ãlÅÎ&ò\\®Å%¸ïá¨¡=ØY™ØA€Ü›lN\Z8Bˆ-Ç\r¤\"Z–Y­¼SÕß£˜³I&ÉéËRŽRÒ–­Þh?p—P…mGó¨”Ý•u¶\'ÐoÂ¢We`•sFr÷À*øÕRÚZ¹6IˆôÎÈ€è*>*Ü®_)Çê\ZOQÝZ¹Åñ|m2²Ý:|!Ü¿\n2gáŠ×®U–mKŽar\\ÆñÒ®J¤E³vN\Z‡Üƒ@ÌÎºj T§\\x²\'\Z)9k¤%Ì“dá4ZKI Á’C+	P d\'FîYDu(O±$üHÈ‹Œãß‰ù„8¦•A0çÀº…ØØ†1;½«Ì$õ¬ë#÷Vtî›f­©„u]Ÿ0hZ(UÊ—#vbýyLôÅ©÷U{zõq·Ô«×ƒL©åØbê‡RB¢‚E›‘¢Ç¥…|k†Õ…D[jbÖ”é]F^¤Ê‘u1”¦Â]ˆH­rP‡PAæ‚Ñ¯	=]\r¬%CbÁ+íã±ÃÞƒÿ\0‡éWÁcÃi÷¯vgk?2ÍøbÖ…M“ÝÄ¬2/R~C$ß²!6O[eo“uÏ«“¿î*ï:™-ÂViTûgìGú1•q¹–Ñ<Í½CµòbW½1t8Ú+‰r£KS8{N½>-{rd=f¸	 ëR*×H&!$§R3,¦W;P®Ž ]³r¾AiØy¿E\r†Õ£eÏD,6{äöÌ¥Þáé§‹\'_Ò2òüÍ’5£ÊiUSÄNGq³ó£J¤ÛTHiQŸØØ3|~•e‡¬±Ž¼LÚå–‰“$ÂºÊTWsŠ%™ëÂ†¥v³2fSÌU=Ð°”§*2¨éS™}4$ÎÏ–*äÃ’nÅ7RŠ£ÛQ’ÐÐ‹?OKîÙhä ã^F·c!ª}´A´v½ÊûFæ¶JäHyåà•–\ZwfÚ„‰\r2M£ƒçë£…WÒ3$þbÛÊd3l´ƒ¹H]³fGê Â¶bó>,ºFXØIrUkµm²:v7 ËK’£øAzŒZ„Ürtf¬7’ÛpÙªkXÊœ\'-Á+‰Òæ$ðÊªJÞ©œ&Éä?‡Z0ˆüEA¾›\0àçhàŒÖ\nŽ¾úç\Z[jF„×{X’e‘¹wM¢¦z Îôu»üd–LHv½ú›„No–ÉÔì8ŸV„c\r+g1kêFW3xýk‘ÂÒ3£ácá¿l\'m¯æ!H8rï£•û±Gº²æI,®¼Ñ !¥:ª\n\"\Z~/!Rª±4°»v«™—w*,øþÐe´M{@‘\"fY`ôjçZÕ³	#QãøëòdÍY3¬´É~#r”Ð¹æ­áön±–‰8´2+›L—£ª·\'q±–dLe1œ›+Dó\'‹¦íýÍQ£bÿ\0LÔ¥NÁ~¢å3Pg°ñô­›KÐŒ ô¦É0‹M8râÏÒ= æ©ÖÍ#^\'ê\\›eÍ…¤•ÜÂ¿ÙÌ|@È%«¿ŽãVÑžÃY[•ôqk\nÎôÒÏ^eeZÝœ:Çû}:ÊV†ÎybÜƒö>\ZÔŒV¹¡k©í6‡&8Ë$Ò â8ˆÍmF”ÊxrK-¥“	*qJìCi™Þ©š_‰Ã•Ê ýB“±P&zvä\'ê­JkkõHWÉ°ÙúÄÌÛ/.Èå!³éò?\ZŸ˜R}Ï‘™tÜ#æ˜RÕT˜¬[GcŒ…ÊšÕdv’©!<Gw,ƒ©ø¼x¡4Ìc’ìI„ÁÛ¬]¾oØÐ‘*£!î¢?ŠåÌ_GÊqIqPä©<Úy–¡6‚fÂ\'TÞAÌÂ°ÊÉ	TûúNI—=`õe\ZÞRQÁ3Õé4÷#‘Ò­±±&bS]œ‰£MC.¹\rø“5‡¡*Ñ4[4>˜Í*ÍK\'d)DÏý©ý¿HÏøŸ’¶Á£~â¾$GWÄhØaÇY\n™1ÂLc52Ù$’ØKbSÈŠÄ¹*›\"±¢ŒÒ]#X´ÿ\0³{•l–ú¨·‹å3qïh¼[ËbUID8ÒßSÓíúxs\'*èÖ9	3„ÔY}Ë,ÖáqØÊÞTzLr*_•ÃA^‚sgÍÊxäÅe³fì8Š6…%²‰´Ø²èÉéÈUÎ8R9’Ð¿Sß%3ðbóIµ¥?I£¥§åôŒí!_»ü`Ó°eáþëŠ˜øÒHO©$6ÐJ=\r<FY?’â7ÔuŸŒ8’JPÙºÍÚM1	>¤}MÞ†Š¸Œœ™ÍSWä±º´xdÖáYœ†’VY„8)vÎNAdÓdÛe%¨H¯–›ý°¿ª9•8õRy0˜H~;WPÙK\rpCÌdt¸—£6ãQX(hR¹\\RJC]\'iæuXYè™\"l˜%\Zš|ÈI¨zˆõ—Ëéç¤w?z<æAIçá¡Ã’cü ’^­¤!#äS$”v$ÈT©ðÉ˜Æ’IÊ|Ýr<¥Ärçsš®”p%Å–Ü¶<Ûº~½ß2ìþ	J¿ œFC†È‡,ªlux4Ùª°«“Ú;›Ëq\'ÝHM‰:ç$6Â,r¥¼üŠWjÔOúO¶n:,m-jÙøD±zÅ´D¤» ›J,j“ò–ß4À{£-F\ZOTÔ}8ðÝR£ÕKî!MƒÓÈõOÒ3Õü3â¢ùŸÈlƒI(‰!”ú¤´mCa% µŒ®o+ØëÉI‡ÏM’´VÄõ³­S\'ÒEjÕféÎê¬U¦ltâ÷é¾®\nBVIŒÒA…¥<{f àÐc®}2 ­‹\n‡5>ÅXþ2QO$Kª«q©ª\rã]eÁ¯Æã£U8RñJ©ÅuìéÖë.ÃySMâJÅj›}<a}¢M‡ï6Ï‰6{	–ÄP«D0§ÓÔGí\\EsôŒá|¦<žqÇùàCa-ò#%­:6Q°Úuà§x’¤‹¹E*uqöñ[}Å¸êr?–<¢òGÔlDè#‚ˆŸ¬aã²Œˆ¯”Xµ8e\r¹ÔÈÄ¥•FMâA´ìÐP¦àCl)D‘–F«M¶q.i½1×Ï¨d!Ëš§“~GQac«\"rÝÅ*«L”i:ÄýÓÓM.8IïýB-®G$§ÒÌ‰-k§_R³éƒœí[?U—#Õ&C^	ù´DaÏÝ\r®FìcA©Zº$Èé²µšÜ}=8ÔpÛ\n#¦¤ƒŽ‡\rLD\\ß–»ºØ«‰\Z\\9fÄö—ÕkÀƒZ$¿u9³u\rãvSL#¬ž9®AåˆSLÏK´±cDb8D˜´¬Åp›P$yÒŠÍ­šìäEˆ·Ä(f˜’ã%¶ÝkŒé:ÒBÌØHM»¬ÊnÛNÍA(±uó©ú9Œî­±üå‘u¢B{”‚yF^­O kâ8\r#¨‰UŽpyzp…^Ç^]¬~á‹óQè†– Å|…—–¾–ç|ßlQ:™Å¤hÈê7åž¹,j&aÚÏÉ‰5ÕêÚ¤GzéN*~o³É«Y½‰]-U²Øe—ÓIxqØ$‡\\Dvï/bå\n¬ÔÅj œmI³w¦å|s}èN›/‘l3ð›+õ˜ÊÝrKd ŸcYªÑÌ[æ‚JvÛÊà“2\r8dñék8éž$¥·\r\nyâH³f3Ã JIœe±°†—[a˜ýt¨U6—¦\"kèË¬§]ŠHuø‹Q%6»©8¦ÝÍd¯f“šUW³‰j’Ú:hÊ(ë£Æ±Êç/‘CLëÛ‹n¶Ú–¥ìGë`Tr;Ÿhõ$Äªë™ª…“Å’MÈiÐJIë¸°Qepý«”˜û¶/E¯D6¬ÝÓÇ7ï§¯œ¼v©]+bL0Áòi´†aQ;¶ÓPÂãöMCgN«¾ŽbìµhômÒõ #Ô2Ùè7#Š¢»ÔL•i}EþÉXÓ½“&uÊcËEt\'”Ìš5n{8œ„äRã¸ê¦c¦µµë7@íìø±Q?¹•ãh™‰\"Ã	¶‘c*£bJ{G˜àdƒ[˜Ö3i†y­0‡VØîžY3É*¦Ä9n2\rBùÓL¨i7d·NÓïp&Q”;ùœOàl0[Ð¾GéŠÿ\0[ôŒ?˜¤LW¯À‚B=A¢Ñ™«®mÒú¡ÿ\0A{êº4ýâŒHZU	”|xùnÈÌYÝD©“f².Æ;=y&ª™Šh¾éÆAŽ±wVkXäš»£46ROÂ	ï‘žâŒW\'”¯/A’á£©SjPÎ$æ%(‚—È^Õ®HÇ¨JJI!Ý&ùÎ¥´4ýËHØŒÐ`½?Éf1ë>Žc =Íi<×-|ä(øl 0	ZF qRÃ<{ë‡ä.ÿ\0}\'ò(ý“0–ÈGšüUYÞJI8ó²—C‰â>Ý(¹J«´¼ÙxI“AGÈèq#\Z×¹%¾´y©•LjI0DÔ¯Ü‚âFù´MdS\reê2^6®âhî\"‰—1ŒLWZtdi6kDÚt_ä£ø±êþŽ¯•Ê·)£é ýMEðŸ‹a/â‘üOzÇ!v‘N¯ÄpØélt´$¬£´ãŠî5Œ¥”ðôŽ‚$X2¦Ýu¨¬»‡`Ñ(”“Qš	’Þü45áÄü[$˜Êk˜iŒ’é›NœqÞ$¥òê#D\ZÐ3Ð²|ÐìDlÜ•¡¿VPäáè¤+kÆ?¬ú;žˆ³=È”¾œ0·üðGÍƒç; Ô——ÌÇûpžQ«UÆZou¦ƒÜHîeJ~–áè®·-ÛïìN§bJ£Ç’Ù5(á÷›†–m¬œ#=Eàa*?ô]w_ã•1fM¼ßQDÂ–ÈG†Dá°§Å‡ÆZéç=„!½ÔùãÕýG£3=^±WÆCüŽÉ¾•$Òañ3ò5h:¿^_‚7ž¬ÔsˆÊ¸<Ùí$¡/k•ˆÅ\'\Z›P¶^°ièC–§êùžÍfcqß„‹ÐÒ\"LTE²ú$#^\ZpäZ<šQG§¨O\'-TM·ÕJCÒyœ	K7Þ$‡$™Ÿ©ƒÅôÇ#ržËA¤hZƒªÙ»óÆ?©ú<Ããÿ\0‰ùªÛä?È\nàä•òy>¡¸ªÛM ‰óA%(ä§¤)~@ËG®hu=7`;Ô`#•„¬jbZuNìXÄ)ŒPÇ8•þ3\'³\r—Á%D²brLU[.“)™!L³ÿ\0úR+m#Ú0%ÙG€Ú%¡F3É<Y¨OFÄ®¢ö\ZNÏ\\ë¨oÀÏÀöØÄØê¡ñ45ðü‰å|Æ-ý?ÑìÏŒžÝ|ù8^J@?‰HÓ%Èö‡½8\ZˆÈÌ)¿ŸªÌ6-™éÉ¨{Ñ¡”‹†6–dª;Ð,ÚšÙ™C´Ž…%dá\Zˆ…½ÚkãHzM£Î Û8²Ü†õ]¢gEÊ\\Õßrµ±e)wx$˜m-£ÔE¿ÉÈ\'V%MÀIr”þöâF¢A­Žv·6¸I‚N`Ào³xë½6ØÌ1_-=ø\'j:x´6‹An8f¡!Cþ›è÷ŠãTâ½ê`Œp3\r#ï}|Nœt’AhziÃðâú‘¡¹Ó}(S`—è¯ˆM«äjæÂ‘s%(T†*û©5îC´+¤2‡ÐÜfÛ+ºE¾ä\\vC‹m¤E`Í.ïï{£Çiû6œËãÒ•­Ü«‡è¡œëfÑ¢¼²EEU;jŸcy7’½œÕ\Zß#÷i/·‘àÎ0§[JØÆëûÙí7¡ ³}IqqBBÆ#ý/Ñòeq¥tô“á°“â¥È#&ÞN™$¬q#=\Z”ç¿ˆDënµÚÉÆ¬ãZV»SÐö5Aì]Ãh¨aeøõ0ç6xÄ}I\"ŠD<§ƒRá|ÃÏ¶Ên/;ª¥A\Z™»<‘ùf£ðös©\0‹EŸÞ÷Ó™gÊ«RÒ¬çÔW\"®¿Þ´§¯˜ÜÞ‰ÌÆ«{()\nV‚Ï×¬iI1)Aålaÿ\0Òý0W\ZI÷`¼=T87£ù• Ûê JBÍÄé\\fž#aŸPÉldt+å*;ìÙÈ@júB}úß˜­qÈñã[ðç¿Xì¢3äáÆœÔìTŒ.®|3K–\0âLg	¦AZt¸âÝP2n*»™L0†ËòÒ×ãÕÇ%Ë©*uX=Ãô3ì‹¤Þ3Tså£I#sAn…ºðqãKxOk·Vý\'Ñó¥ð¦’~€ž‡4è–9R[n/_•qrX&Ý3Ñ¬ù\rC!Ö!™‘N?ËD»U.8©%&Ýg÷fŠÓ92+\\i\\ÜdÊÞ[a7ÓC—ÔK®‚=‘xŽÉ¾ýEr+`XÏj®\"ûŒ¶àÎ;\rC«M½›“lcˆÐÐÐÉoI\r½m6¶+ã\ZÂÞ\np™ƒhÌt\"¸øO\n=Ñ}Ú\ZøÖHùø¨K!,¨t’DêÒa…~¯ RÜ êÍÅœEƒN†ÃaƒõkÔ_VwLWÏvª\\,¶æ™“çUûL¾/.Y¥Ì^bþ; 9úýžBAS²ƒ*ö’Sêˆ|¼pˆ¥3 [ˆŽÎGvæE;ŠqÚÖ§©÷qjŽÊ(=\râ\r\0Ò&ÈnkÙï]OÇ©û&Uè’ÁF1Ûé ‚qzA²\'KîÁËú?´ué‰?¿^>¨\n|ø-ãp4žGÔÐBÁ(l‚ß3\nQ˜ÿ\0[`(¶Y\rOAqå)…Dš´:Ò¹°¦¾2”¤¥9«Kp²XÊwÇšÃQwQ9ÆP¶8íAÿ\0B’=žJb¦C“.õU•íÔµwl¹/`ô=ÓÈÖI˜Øäd³prE“ä(µ~ŽœžY–‚“°M	fÃoHZN˜æ¥f;s°ž©+ÿ\00/è~í%Ï½?Uìr‡ ¯PÓ\"ðB†ÁƒØõ0LzzdÃ+=“ì©º§\\\ZpÛU‚“Têtâ‹áwá˜ßªF‡¡j|c!•<ä˜ë†÷/X±—-ÊÖHå¶H|qú\'ïgÖÃn¾\ZÂÙäÙ§Ç8ÊÉ”VÆ\\Ù1$f“$”F°ü’i2åÎr5“un8\rÆ+Ä©+’|H’0r£ú?´Uòµ?p‚Œ%Í¤½ú„/!´|FZýí†L2c[)PÓ!ôk€¼c*~…æ-³e¨ÉQKÁ£-E‡­“^=%#ÉeUt´‡Ø}”Îœ©JÅ[CAå›ÎE¬I—Y¨­L°[âª¥ëi˜ý4Q9/@”9x-‚PÍrC§a-¹5úèh¯d¾»=| Oë‹|ß&•¹9:KèBž3Cg®;Ï‹TŸF1+õ|üOÐvfÐù\ZT:¡\nØ! –ø“§éóù2=Á§aøÉq78êØ:ëI/ÅÏYSIÉærFQ Q°Œ™öa’´Í»Æk ªÊdiXˆuG2¼Ÿq)Ù™Š«GéåP_3{À”dàS„„ÞåÄÁSÖÅÐéôûæ³S‚Ý7\re*4„\ZÞa\ZKˆê¥Êt:n±ÒtÐè0ÕÑó\'9ßk`Ó¡óá\'ÃãÈ%¡Ó@âU(ÂÈÌBC^µ•èß¨R6\r‘mŒ·,J€ô\'#Ø-ÄÖÞ-™8£¥ˆïÙHƒìùkJ0Vâ»a‹Äžåëñ)ªÆüqkµSZ!dâž…ÆW¡6¹¼Û5ÀÜ³‰Â:	ñlÇrÛª6ÇSc™*LŽ:™II-ìˆÔ6hºj{‘„¨a±Î=Ñòµò¼çÈÒ[èÂD@Œ‚S²áéÃ`ÛúÖ\ZPe@¤bT¥¢Ó4¢»mÍu°’T§ñÚxõQÈÂÌµ“Z?}ÃiRýÜná“Ç¬ý¡WÃ¹Í…˜$9!Që‰!³é†f™är	sbÂ¸¤!L)µŠE‘¥,¹*Cmuò!\"QšT^¤+b*lØíýjâ›g»«46fkm)dÈr\"/EŽ$’ ^´JsÕ§‚=I)õRA¤\Zuà•—èÒÃk4\r!×Ê.²(N4Ìge®k1âˆÙdêµÂ·dÖP˜®Ì™ñýû¥ÔQ7^ãšÔ %€C`Œ ø›o¨G“±‹|Es¤Ô…HDbzrÔ\rå¨%k·ÄþGìöZwÑçº„FS­0â¬›é?%*5¼B²)Ïá\'ˆ’:&–›BÖFàÚ–iO£\ržšô	0D4à…Ü\r,6à%lhfï-¶mO¸ím•md«YXÕæ² ‡`vÉZ›“*èÂÓKR>ÍIfœ	Ç‰!4ì¶;d t‡LtÁ68\0ˆŽ®‡u²$!Aä%Èíœt™èÞSjR’µ,ö•ËÊ|øsZœÇÑ]Y6ŒÃ%;ûgÒ´/JYq!Ó1	ÓŒäXFj8QX†ãl¼ÍThl6ýN,T´Ûr)[i1‰i“ß\Z¹ž>^ñ¤/,6àmÐ‡H%C!¬óJæÔ¸²‹\"´†6!ÜšQ6\Zà3+Bhk×obl0ÀS!LƒdC€áéÄhoC˜7H€Ô:º™ð¶”ä¦l¤H>¡k¨Fá~þ§ßQ_È¨r–ú=Ó?Dö‘‘|#Û‰ø›>™)£éè1ÄÔÁ©;k%ô±$ƒvŠûÇƒæl4°Š;òL/>d7dÂT™¬›Ù™HRA–†ôp!ÐÛ¡p_ãMÙ˜ïCYzŠB+¯qºé\rÇwˆ´ˆˆ/ãÓ\n°(YQz\r3 ¥59 nƒpr1Èóc‘™óÙl¨çÓB>m/GkÐß®ÎÙqˆ’Û›è.+ŠrÇ¼Öã¦”¥ñ¸¢\"Ù…(Aq-¼éí~º! Úc¬¨ÒQ¦Ò4VŠŒtE”ô\Zp6±û‹AD€¤Kš\rºp!Ð—E•{6qåÄv¾CycÀ2q‰JW#cn>Ñpk˜S£¬è[¡Çvà7=:¡NPØ3õ÷7èÇti}.sJœÕ÷-¤$½	|BôÃ²~ÍòõúéæÞIãÎq_Ü-s7kÐ0Ê¾ïC`”!Z=	ÆïŒ&ýbªJx]InDÒõ\Z	=ÜÐC›ê¤…$l!Ã ‡‚]x%á2k$½†§‘a{#Â”+qâ¿ÃÑH@PqFAÅ˜ZÂœÇ!È½±þ™‡U¤ô¹Š4:â…¾ž«©N0µ²¤%¤ˆ*éÏŽ®M}9€]³l›‹xÌÏö¤†‚Hˆ‡ËÃ`”9\r„¨%^\\U!ÐÛá$jk{\n ¤ƒ@àc\'B_ôKá/|%í‚wa+b rA¼•‘qÄz”›*¬iKXn3Ï²á©ø*e—¦ÂY[¶\\u]«Æ·â»ÃS ö£õQ-m“u³qÇ6ã†uË>îÇ¦†ý&Åê‡ÊD ç†gZêI-pCÐä7²#‡!Èr±Ìsî:,¹Ii\r2Ñ(Ñ\Z7wÂ#=\'ÊJÛí‘Ò(Ïô™cšIž›)T…·\"[lÜ¨Zm-µ)‰øM-g\\êø%$›qöÉ.Ne.µ9<»ôô}´§›d˜Ïro½än,¸Çq¾Úd”:““]œ”9]ßta9iÊ¶­vse’êv\r!-Š&¾ñöÒúTš=Mý§–;ÁF÷3ß1ï«ilÖýÎ±»&¤{;Ž°ÿ\0³§Rkö{,‚°ä° xEˆûd>ÆY±ÖIŠY<nÄÐXòYä<¦q+š<ºXì¥i2ÐMªQä È	rBAI}@¦<Þ¬ÁNYÏpuÒ¦Î[µIå½Í¾dÑ½(˜o½ ˜Ö.RÚº>Í[ÇíREZg´Y±ìþC¢f\r:1;GdÑ\\Âƒ©²’ñ£‚PâZGzØD”tÜu³3=3”qM™º±µJ0Ýt·Î&a(Dönµ}œÄI#„Î%	ÍDfBPH/¡èhhq!Ä‡p!ÒHè vÍŽÕ±Ù´;&‡bÈòöG—0<²8ò¨ÃÊ#\'Œ<ž0òh£Éb$Š<Ž(ò(ƒÈ¢%Š\n¢1«ŽCË˜!Ø²\n#D	¤àC¦‘Ó!Ähh0q\Z0uì˜:¸êIÁãÐÌ}™„>ËÁe ˜û)}•‚@±ˆD>ÍBf!ãpˆ&†\"CuÌ6Ù$kÿ\0÷_ÿÄ\04\0\0\0\0\0\0!1 \"2@AQ#3RB$0aq4PbÿÚ\0?þÏk¤·gj¥ò<U/‘ã)#¶Ò:‘Ûé‹I¶‘Û(ü®È«Ó~âœ_¹ž?\'R\'VÜxªKÜ–:šØúŒ~Äcì©ê}GüPÀ±ôÙÚéIûª—ÉÚi|¦—ÉÚi|I{‹NNÉú\'±?37.f-Îü¬{òNÅÙìì\\L¹~M\\Êa×Ü^‰ìKwÊÜ¯É–î_š/ýë	”?*ôU<¬f‚.f3\r—ïûr¿züô-Îï•÷W¢Ÿ•“ÒO”S“²;Õ“úŽ¿êvJÿ\0©Øëþ§c¯ú‹ú†¿êv*ÿ\0¨ðµ–ñ:5ñ\n¿B¯À°ÕVvJÿ\0«ÿ\0‰Økþ§bÄ~§e¬·ˆèT_ÄéTø9ü9ü2^ÆY\nø:5ÈŽ\Z³þ%ÕeèžÅo?,ýˆ’‰VgYfu™ÖgYiYVuN±Ö:Â¬FjC‘©–æC*ø2Åû$ýŽœ}ÑÒÁ’?—)/ë}#Í§.¯ˆ‰ZO5¹Y-Ï	áø\"¢Îš:hé£¦‡LjÝÊ2ÖÜêÉª—[\"¬œeG[î5ìf¯SÇ‰Uu\ZÖÅ)6ž¶:>a«>uWõÞ–wË…+âSÌËÙr×œ]×räì×r–ü¢µ#C4[–ä©ÍåMƒU\ZŠ#QÓŽI-N”½ÑO=$éØT/{–²IïÉ•îz<V“e¬pu÷[\'¹íÊåÑ¡dne2™Ke]Ê^aÙnÏ}Î¤eî*šÛ1™Þ×3ÛvuUís¨º™n:‘ù!QÊ[[Ï(Ê¿÷=/ÎÆpuã“%¿-=Í!(£23\"èº.‰ÎýÊ~c¯b—…Úe7g‘jˆ¤ªKAFwê[r)Þ-£#USC¡šòoQáî·#JQ÷GJßRàª¿«ôxÅ÷*:rÐE®Y{–‰d(\\ÈÌ²2²Ì×»¨jÏ¨SGÔi³ê4ö>¥ñT‡Å‡ÅšØ|RgÔ¦}BGÔ$}A˜z½zŽ^¾àÊ~d-‡§qI¡kÜ±8Û^æ\'ñ»¥òf—Év_û<?wèñ»ß”<ÈC4å§(§bÌ³5<D­næ#ñ¾ææV,=IybÎÅˆß#\ZŸ¨¨T_Äq’ÝÃýý?Û•?:ä™”ÊÌ¢IEù.S’zw1˜\\3ÅÖT‘øþ\nî=EÂ¸m?aQáôö‚\"°ò~¡Ô§MlGNF-S„³TÎ#N)æ‰\ZW[•#c‡lý9h=Ê^uÎö3/“<~GR?\'R?\"’{2ìÎÌÍ÷kþ6pšñ¡‹RžÅz]¡çRö*tÝå2èTòJä²a¢æÅÆðr´w#*SY‘Žâ	TÈ•ÊXˆÕWzÊ—§–JQZ•o©Ã¶~ååCZ‹”¤Þ:KÜ•2µ\'Oýå¸ìÊói.O»[ñ³æî}Ïi³¥4ŠS©‡ü,u±ÿ\03Ð´~JúK”¢¥¸´D£}‹ŠÐáêÑ~äæ}ÔMåM”V—åk•âœ•.t,E´ÓÝêß˜o;á+\\P{Š\ZØË(Û¸ÙŒÙ?Èý3ÉË¯UâÑBW…™ræ&¦HØÌÌò:²^åº’ïÕÖÃþAhÈ½Õ¬!lÈì]‹˜½‘‚V¥èñ^BVLÃ8ª‹“§­âu%úŽsö‰*fîÎÉ3²KäXE}YF\nË¿UÚ¡+T=õ:‹*C©tg3XÌf:ˆêGäucòT©Ô‘…ü~øÙ7±îŠxµkHíÎÑOäëÓù&ŸÉÚàŽÛ¶@í±;dÙbé³´Ó;M?’X˜-ŠøœÛ³Ì…V2ZH¡âÚëÌêMûÈ»/ÉoÄ½#ñ²IY	^z—äùa¨B¬‘\nªã!R„öGNífN”VÄ°Î5ÑNM6U„ >÷ú.={”\Zôu¼ŒÝ’JýË÷i;P“E)Æ¤sûšJŸ…MIh8ø[Øwu#ðxT]ŒN°Cçrüî\\¿(îSÒ+ÑÔò¾R°ÅÜÔ×•Ý­qM­…)Gffw¹*“žŠ´Ö—#VpwLu\'7«0\\6X†Wà.<ÇcœªeGÑ%\ZyÚ*Òt¤âF”§²£vh§ÂäÚOÜÅpxS¥š’°™OtGoG?+å>íÊPu%•N*‰6Ž\'Ã¡†V0¸IWe+ë‰á#‡m/næå(¬êç\r«‡§Jí˜þ!\Z‘té.–jÙš+SêÁÄÇð×OIœ7…ÁÇ4Éap±—…A¨F2Š+ñ:}$‰S{Ž%:£–ÌR*ó¹~T*tæ™Â*º´õ8Äe*ÒHà¸[;¿b”å:ò^Èã”eÔ“#NrÙ)ÞÖ)pê³W0Ü6s©•ŸC”)gf,F¯aá(Â›QFM}Ÿr¥IÃRu§‹¬”ÉM(å…n¥i3Šy%â-rµ+#÷¤–Ì°ÿ\0É%a£R£ÑO«$a¸\\êÊÌ£ÿ\0v¹Â©JŽhH¯ÃåWÔ{¦†»‡±>)J5-r¶Žyç¡ƒà±§­R<1TÄÊ)hŠt)ÓŽX£”1’H­â§#†âgô½‡îŒ¶,•E$âŠ4g\Z×h{XÃÑéE˜¸FtüEXø	Ç20ñµEéî˜–b¢0TYøŒ\'£©I\\t¨Ò‹yt0˜…KÈ´f2»¡EÎ;˜*øŠ‘´Wÿ\0Ia1Ug÷\'¡ÅpÔè(Ê	Ã)Ë©#ˆxjwŽì¢Üé©3Ztq–¸Ì4[ÇM“MÁ£\rJtqIO”¨C‹V{ž\Zk1ŠÆx’ˆ±”eN÷>§jŽû¾#ÔÑó’‰w±E}ÏKUøŒÒ[N[”*º2¹Â1Î¯†L’S‹‰…ÃµŒÈýŽ#÷e\n(§Ñ…Œ%â%;ìqiDáðÉEU:•)Á–H$q1qd…ZÔpÏ]Ù:Ð¦³6WÇçÄ©ü8¼|;•q2«<í“ÆÕ”2¶N¬¤KQhJ¤¤ÌÌ§PZ¢Ú”?\'¥ª¾ã2±¦¹p¬C„ˆTÏ#£W¨S’«“ø*ÝÓ•ŽEÓ§š^æ6‡h¥•{\ZŠTmðU:k©?beVÎ.¼q‘-RÉmJØŠ•gîN½I/•îXQ°ÉÓÍ¬FŸ¹5Ê-\"œî3\rçôµô¨Ìí!Êü¨Ë$ó7Ô§•“©’-˜,BX†ß¸æ‘#O«‘ìc¸ŠË’™†ÅÔ£¬IW«‹’„™JŸJšŒéN¨IÛc;/ò].QŽ¥jvŽ†±eJj¢º&šÑ£/boÂaw~—¾ã\ZæŸ±Ã1½6®c8ŒeO,Ó(TºØúœœmroÄÉMKrŠLšÊô;MT¼ÄªJ[±¿“2/É¡îÊ¯ÀHŒ½ÑRš¬¿É8åv|¨êÉÍl`ïéqZO•¹=ÚwFi½ÙÜ§O3*;xW,4‰ÆêæÛ–EKÜT®ÈÞâd7.V•ôD—ÉåØ[ºJK¨…¹Bä´0[?KŠW—62$±AZ9†õ¿*3Êun‰K7-Ë°¢-–c_$é[TYÁ¦2Œ´±R7W0/K[Y1sh„nËe%+»!ø`¢B„³(ð¼5H)«˜Ü\rÑËª)y¬^ÎÝèÅ/ØP©ü’QEi&ô!grQÊìÈ;lFò‰…Ò£^–nò$\\lR¹J7%¢œ/U|ÂWZ1’£‰ÇÔ”[±O4§˜œnî.RØŒ”ö6#R/räª(“–v7¨•Þ†66´‹”e¡KózZ‹ÅdOA±›B‚ûÈ¨üE2OàÝXPÈ»ŸìTòJñ{›òJì”æ¼œ[dc”ÇìˆFì§\"äôµ<Äµ&@˜Ù†q<Æv¶dsKR/yc˜±·;.qveMP¹ØÇ½R(À¶TaÝê?KQêÆ41lSc(»TEU­ùa£ªCU!&È+«’£\r¦Zñ6î%©=‹–-bæ%f¨S‘RFøý#*Ë‘ÐCðžzi–0Ó³LYgHøQ¶¬–%­‘F¯WBT³Tc_àµ&îû—2æ•Í‰ÊìÁ~OI-‰òd™±}93;Ç è³%HjŠS—»:5|Ñ)Ö‹ðÌ8TV§†ˆ¤æÛ%R1YPÝù/EÎ×&í§)ÊäÚFòzIùY-ÍbF¢Ž—çIä•Ê‹2Í5%{X‡HëB~c<VÌrFgÉ!+’yŸqøUÉT»¹*ƒ•Ë\\Á~OISÊH·&Ë—çÊ52èÍ˜Š‘RÜéÇÚC¤ßò#MÅïÍG1;AeÊÓ¾ˆdšFs7É‚sÒVòsh|ÐÕˆ›”ªßÃ.U5Ð•&e‘N-±ÆÈP”6<ÚóF\"¶HÙn*¯ÜÍu¡{žRæòzJþNãåb:™Zú”«8é\"y¥¬N¤ã¹Ns–âƒlé[s3Û¹þÊµ’Ño(ãW40jõ/é1;—\'Êü¬\",„‘–âÍˆ¬Û”¢¡¸²ÉèM¹]sÌ‘SN™W)ìf»‡tGré\\°P´3zLD®±Xéü²Td˜©6Å8XhØ„ˆL†÷\"¼7O’÷WòÅ’­RäªÕù%)¿rÝÄÙnv)O\"HNþŠ¤²¢£cbÙäÉfD¥;\\ëKÜÏ˜±$^Ä&F¡N©G,÷%$ž…y|\r¡´6\\±nâC¦ã©ÝB5rššÓÐÔÑQ‰\\ØÜZl9;WV,.V\Zh½…6B³GV_#y·%«Ygî(²Íe„…É­L¶cWå†ô/Rxvö;4ŽÏ#³HìÓ;4ŽÍ#²ÈXi#¡/ƒ£/ƒ¤þ”¾EüŒ¾Œ¾FGFGFgAšÃ¡#£#¢ÅFHt›:2:sø9±aŸÉÙÑ\njæÿ\0ÿÄ\09\0	\0\0\0\0!1\"#23@AQ BRSa0Cq‘%$5P±ÁÿÚ\0?þBœìBŸñB†Å: û.®Ÿá.sºê™ÑÃj²êÙþ@¨üW@¨j4ÓµrÞ7#¾‰çÙr%?jmîûSpÉÎèa|¡ƒ¿ÝË©Ïæº¡ß’8Lƒg#…Ìº¾„hj?hçjèsþ+¡Ïø®‰7âºçíN¤™‚å¾ˆ(ÀÈU•eVUøX|,E¡[úV(V([pÌ«oÉw¢¨ôhWWãt\no¦ÇúaÊünUÊÕVùôQøÂµáee•eVVá~7ë q×ŽŸE•‚°UZÂïDÝÂˆÝ£ƒœ39u¥î…ÖÔ_ºZÐþèÿ\0hâ´?º[Ðî…Öôº\\P~è]qAûÁu½îö›‰R?ié4ûçítÊÜítÚoÜíB‘»È?ÚëJ!ýÐŽ3B?º]P~èC¡?Ý¬©_´\n¸?pµÒ¡öpBh¸\\èþW23î‹Ùò¹‘tjanî	ø<R…S#_Lç4éèéÍØ8cÔ2…T¿+x,@vÎ«©©×TS®¨§]OLº¢u=7ÂêzeÔð{.¦ò+©c?q]MûŠ4^åI‚ÆG`©é_Në9ÉFÀY6šg73BÍ¸™F÷AÓZà”ÑTáqtg¨a±qYêíšæËŸ)ûŠæ<û«•Jûá-?Ç£¥=Øá¿&\"Âak ùOsX.åÍžo,X.]Gæ¹Ušª}t\ZW[Ô.¶¨]mP†-P¢Æ_~ð(\'eCs0ý¬`Å™f)·&ÊÚØCT1†²ÉÐ1Ì±\nÔñÚ2šÁVSÇ S¡k¢È¦aŽBÕ~{ïƒ·ÑÑ›° Wê‡[*„e¦bxçOìh¬´\"Åb4ÜŠ‚Ñ·…•Ã†; œ7ØýŸU•C¦h)õ-íe÷AÌÖÅs%ILÉd¬á>6ÊàûìŸ\\ÆM”#,3Ix¸†øqèèv_«j0?•L-Bs6s±[ì¬­Ã¨M•àºLZØ#SmL lƒ…MC9amÇò\n‡}C3´¡…Ì=ÑÂf·‰7\rªoÜŸ‡ÔèäÊJÀ-™7¨Ü½2œ²—Õ!»¼®®§eQA$ä\nÙ]e‡â-èðÿ\0)¨/Ö¹¿ÊˆY‡É{<§+Ô…Ì˜}Š©ÕÏXÛ#CT\rËS©jÚ¹3´¬²\rÚS`šCfµaØy§ï¿Ñˆùa>B:ì¤6ir./¤,Íð§½¶:¦JiÈ×SÇÙÌºÒ˜}Èâ´ß)ØÄ7ÛE#Û$…ÁaÎÿ\0‹çÑáç¹AUSÇ;;Á{\'hT²ˆ…ÊNÿ\0l¯P7™0ûñFÄm+C§(btÇîBº™ßréçî	†3á?MU<•˜ã\Z¨ð¬V!•›.¬ÅÓ°ŒVA•Å7ÄËrgÑÓUŽ7t‰¿¥%>)?ID7qLý)H7~™£j§©Øý?GøïÓ´‡íUŒ¡§l,ôxv±”ž¹PŽt¦CíôOLÙØZå,|—˜Ï²ÑiÁ’¾3v•‡bnîMþŠ/8 Ñð²·áX+GÙ¾=’8Ià(î©4Ìß{ý*™#’w¡åfí,´åraÓUÑá×UIvÔ6ßEœÛÕÂÎÁ¹\\ø¿%ÌgÊæ³åsYò¹¬üp:‚±Ûèð³©/€£¹RÄàîlhV4hðnºS~\n5BÚ4ªºº©FXØ@F)Fà¢ð®®¹Ð,.Íïdú(üàªª,FBŸÕ;ÂºÒ±ßruU[þô&™§Ä³9ÞëUÏÊÎT„Ùv¾V!¹aXÆíôxiíÞYãk«-8Ò¹QŸdêHíG¦?jeêÖý4¾hXœ.š˜†¦Þ=C˜íšÌG(ÚéŸ”.¬¢è‡\r=!{nM”˜Í‚lÝ	²šIì›¬=KÊÅüMôxyí”ÕS¤NEð¬}Ö[©šæêr„ŽM•ÍÕG6}þº_4*‡ÁeÝµs\0ÙªVGQ¤¡r!ƒÊ3¾UÛmZ€MqjÝÚ«*1–öX¹í´z<?ÌMÙUžåÜ\ZüdÕ¥dÑ\n{¶èÀS.×>ª_4*¯,pç36Tfãá:a—5“¥xu€N‘÷²tŽ7YÜ@Yˆz‡UKî±Sßz<?Í@è«ÏrW²fÖã+²µs²½	ž¢ns¯×Mæ…SåŽÈHöLvräu„)<mOmÞU‹ŠåÊvê6êU(ÝbG¿ôt\'½Q’«\Z÷ÆxZÊèŸ„èäêº3¥)´ÖMhnß] Í(²œ\Zöºl\'˜âTTÙ	M§ÝYdøA…rÝð„.*(ùmXïÏ£¢óÂŒjQÊl<“v#E0öFŽo„(æø]UÕò¡†Èº±ÿ\0+«òº±ë«dG•t¾¢›á6‚Sº¥¤j²ƒ¢0¹†Ë”W ¡N%¡db\0+èªÝjèéM¦jaÔð\nË(V\nÁX+p­©’†±MVy\r’=Êtó3Äà„³eÏqeKœu²mp1ü\'T84;.êžY%:>›+o•nƒ•I¼Îôpi ^Ú&²Ð©ÕlTFøÊöº\rse9Í“XÓ¹ÑvÃMœ›@ðw]¢æeHe\"êãÕþ·l¥ÕçÑÅæ\Z¦ÿ\0C#IÍdæ5Ú¸\'FÇîFÚÖM†6jÐŒHN†\'€Ò!‰‚À*ÌO•Ø‰G‹ÍŸuÖ,s\nëwh£›šÀôj\ZßF¶&¶÷NÅYc•AŠ=Ï³“uu)³Jvþž0‰²¦iD,/*lUç@Ut®tUu¢œiº“‘Ú]aUn”åqâå™K!Èìªp÷6Ôª—\0ÛÃcuKZYþMSœäû(µÑCIgf)²„×ÝT;»>‘»…–áDm¢¿ÓS:2ÕRÜ®X{ØÃ™êº~c³àV(l‚éÓ1›•Ïe¯u.+M‚Ÿn^Êéï.ÝM0\\ÂJ‘§t\Z\nkC¢åI£TT×]ªöPIuRîåÞ‘¾ ù	†üQ~\"Š@\r•F,ÖŽíKŠÊ}ÔîÏªd¹[e•ÎmÐ‡MS%l;)«&ë¤82ÉÎ%Ià	¾ ¦`µÐÝ?À€¶¨»³ÁÎ¹LÝ@ã•Y1Ù\\ª_xO¤¦êl»(]u_;¡²¥¨{º¹qNgcTÆæ6*Fµ»®cFÁ@üÊwÛ@¢fbºcC£àò9abžìÌà]\ZÔè›Âå»2î#e\r3nAdÃtB¨òO¥§hs\\¶¦°7eSN*•UÁÊ6àçwj-5N9Š{EÕ>êSw¨,ÑÔ¨|€ir\'DÈDÚsu\"Ö)´¢ê8[\Zm4DÝ66´h‹B‘–V!_EUäúZSÝÌj¿Â‡ûe›K+Z4ÝÔ®¹Q»+”ƒ[¦‚vDXª}tN¥¹ºe	­hYþd.ímŠ7µËm“¶êFÙ[åéhõ„.KIM.È\rD|ØËTñårêFŠË”mu÷O¦Ì¹\\¡tMÊŒ:ú(Ý`„ŸÂÈ×®K~S¡!4äa*–S!-rÍgh¢Ÿå4dÅe3SFª¿@¥¢7„qº²Ä©_˜lTTî.F‘®ŒºŽªFGT¸„áÝÛUMD§kýÔ3£M€9rƒJÊVBˆ·ªfej¤ó•1‡‘tÉ3(&±±Q›¯eQ²Ž7,M¹rú\\<÷@×E YË#°NrsÕt¤è²]U75 þ¹®Ê/ÚQ›[-å8àå,Šš2Æ—©D”½ÁtŒÃMÔ5Rƒª¡—˜5DØ)Þ˜n±#w7Òáú3èºzy[ª—òÚœKŸršÝ2·X^›†ãm½”4æ+ÝÊlÎJn„éÁ§T÷Ùj°xÊé1·@‹¢”X©(Nfì¤ŒEÚ¨ÌðÕ¸UÖê3e‰	ô´¢Ñ…~$Ù9Ú/k ë›\"ÐvSUË²é$ºåPHç>×Ñ5„´’§9OÂÕM!g²dÑÔ•1”•Dì°ù\'‘ÛöUYk»!QÚ)L~au ºqÊUwj },Z0(ûK\"ËdZ¥)„‚‹­Õ[»Å™ILÙŽbŽVæÜ&JÖÜ3ÙjM“ZþQŒ·Ý9¡Éík»¥SC4.ù‡\rÕ5µQ`§•”¬äÅºk;9Š’\\¬ºÃž0žÃUSäzX`Aš©tˆªçaMvŠ-B™`d\r³úð´Ü [&¾èÊí)eöjnáJì­º†VÌm•UË3;-\Z\':ÇTÉ‰@Õa>Xÿ\0\nGYHnUW“éaòÀLÑÝ;tÐªÝX;Ò®©\"t†çe$Öì1FïÉ{¢çŒ½¨®©Ÿ¢-Íº}Ý«ªâNÂ\Zíœ¨ÊŠÊg«Üªï(zOuvA4ûppÕ=» ­»\nÄYgÝY1¼¨·¶Å8eu“esS¥ÌƒÏÒ]Ü›ª1­ÐW[ðŒåb‘×Q…_åHÝÔ#ƒGºº·º½Ñ[…‰ÃºhQ½²Ã”nµaN¾å}“i[îTÐòöOušÒˆfQìS#/NU&Ñ†ª[DÞÒÎß•ÌmíÅï°²\Z¨Ú±!‘ž ¢à\njr·«\"æ\'Ó€ë]69#7iBÎfbŒ±xJ|ví15Îaº&IÝdæµ–ºd%ç<ˆÆ¦ŒÅû‰tØ\'›íÀ&OoK£ªkTCåbƒ¹’-^{+pN²Ì/`‚*Qp«)îÔÐö»T×–êŒoÝ6\'3Àå•ÿ\0u“[tÖëÂW—œªcÊFå5¢\'è†,Æê×ÑÓX´=Àÿ\0>’0&l[¦´¬Ÿ(6Å6è©¬ÎsÂLŸr}œŽ¿rˆ;G&e\\@ÜîÝBÓ+¹¯Nvc~,nb˜Ü¢ÈÖ!\nÜ¬U B=% ¼¡\rß¸u DÙOx¸Na	ìÍ¢4Î\\™¦‚BýS&Ï)o°RÕû0j£ò»<»)<-âÑ˜è©à÷\\œË—gY”&‚íÐX§“é(¼Ô¢_C@œ@åOŒ=TR¼jÔ]#7P´‘žM”¸Œ4òÎª,E³;,#´wB6l¿…,yÄ\\¡¦Ê£ÐÙ5¿\nQî‹®q/eŠžèI‡¶ï%]\0ð!ƒÕÓ›tö«Ù]JØ÷rÄª‘¦ÁTE$k¨XÈ[Æç‹ØdÑEBï…+X²„X£’Ú&¡e.A–áŠKš\\Ÿ’†+ Ð®ˆOm×J³odÚ¦tê—Dejd1=‹ÝUº^sc·dîŸDÍãÑK_”éÿ\0Â™iGÀMMk>r–e›‘ºÙ\rUìªéù¤½»¢t>Š™Þ¡Ýû©`²‘`ºIÙ1¬ð£NÅËWM+tøÓ£Ne÷X¯<e*H_”µî¿ÿ\0Šž2ÖXî²ÐP\0ƒPHxOu‚h¸SR¶E4&Xú’E\0¹º%ZêÁwB&#ù‘N²slAÊá„cN‰rƒt\ZS\\v„Ò³µ´¬Áf\néÅî¯˜j¶Y®$<\'Ð´å7QWµ»…Ö®±F%Ö.Ÿ„K§ÅòY ‚ºD~î\\è¿%ÎŽÞ%Ígä„Ñ½s¢·‰sbr3ÅòºL`êWJ\Z¨†Ë¦·b›UÊ5n„ìÜÒò™3/ºéQŸuÒ\">ëŸû“«!jv&>ÐºÅþÁMPéü_û¿ÿÄ\0I\0\0\0!1\"2AQ 3aq‘#0BPRbr¡’±4@‚Á$5CcsSƒ“£`¢²ÑáâÿÚ\0\0?÷¶k=ß#ZÞd¦ƒ+AvXæ®ß¹U±†x«âF–sªÏß°À\\Ch¶l»}®ÁGþ\Z²{xà¶¬ÔŠœ5U6w_åT.Ùvû]‚Ù³3îäór;§!L–Üq½ÕÍ\r]çSUÕÅw’˜_¦³*\rÞä#×´3QÖjÝáMîõYogÃJ\'_³ƒ/³C‚£`®æS/Ã©½Ú±²_ÕŠ?á]^KøFþ¤¬¤3ŠÅ²²©—WØà¸±à]EüL_¬\"hÔäà‹µñÝ›ã|Úá»ÎøZ±ja4­FHÿ\0‹`§53µÝ_.îM¹ßÏ±l@5§i8GläsF=v~Õ1M‘Ö‡ë‘<æQ!ÌÕ=¾u-×æ/fƒ]+œÑ%^I+ú×Þâjœ5£³ÅjÃäÕü5Á0¶Ñ.ÆH´ËÅŠxó‡ßÉ5®p’‡7·šu†qÓ¿Ã2ï³ŽHß³\'\n;Û+ÅŠ¡³¿UñU>°È)—j½©“Yð&R)ÅØ®\\~®›é×¢©ÇPûõÁª*1ä»{åTdo‘¿5‚@¿†ŠmœDèÞî~å—doVëîXÀÕÕQcñ]SüV»Åu\Z´Jÿ\0úT¯ãÖeÑ¢Eo±­V^+‚Ígê¸èÝX±bÀ±nQd·IY-å…<V?þËÝpñÑ’ÉEòïr;¹?Ž+&¬š½Ÿìø,™à·cð[¬ð[±þ•‹#ð[¬ðY7Ád<=VK%’Ée£5™Y•ŒŽ%8“—jÉaN†K%’Ée£±o‚ö–n[ÇÁoþ2SìºßÂë?	U¾Õ¼ß‹ÛNõ„‹yR´=«¸®(çÕŸr;¹?½eUÁnþWWù][RÆ6þ¥¹ê]Sõ,£§*ªÝŠœª±Ž:r¼°kÝ`\Z>ë\0ÝcÝ`B:9z¼V9,¯¨ÆŸuCtk¬ÅTKŠÙ‘¥fœ–êÝ+t¬ŠÉd·¿+ò·ÿ\0+}Rõkä•Ã0ÒT·Ž#4çW%]~BÈþ4ýaV¬ýkÿ\0ôOÿ\0º®~È+\0{ÖM?÷±ú×³örÂž+…{ú9,–K%’ËÕd²Y,º¢©“íUKß•¾<U/,²%qð\\Veo-ÿ\0Êë?+ò·¿+2·ŠÏH¿›˜@÷%¦O‘WUS÷XÊ¡?•½à½¥¶÷4òº°sÿ\0JÁî¯Ò·Ÿà±.}ÇÁ§Wì±qû,ÝøXWÄ#ŸŠã^–^¿-9-Ò¸¬ÊÌ­å„‡Áu«®]jëWX\nß6¯e{+tx,‚Ýq¾«jêÂŠû\0¨ ßrZXEv4qÑ™þce«mòèštv«{Nkx­åšÂŠ¸,áaác\Z®¯¸·WVV-¢ÈªÝu´¸®+2³+rñVk­ºÐkîI¾’œ?™Û­;ZÝ]fŽŒrNs[€Ðiêh`-à¯W™\\Vd-â©xé¥tned)ÓoÐ}É(ùJ££u¼îK¨zþË¨rêº‡/áÜ¿‡rþË¨+¨+¨>+¨>+©ü®§òºŸÊê+©ü®¤ø®¡Ëj²¥×x-Çx.­þªé]Sÿ\0J4cüTÿ\0Ò°þ¨zêºº¶þ¥ÕÔº±ú—Uù]OåJêßà·dð[M“ÁVã¼D}•ÚžÝæ·¿+dèÏ¡’Â7x,!‚êéÞQc·‚¯È}ÈáØ™áÑf›‚²IðF*U[äéióùsÿ\0P_å²~ ¿ËŸú‚ÿ\0.ëü¹ß¬/ò÷~°¿Ëëü¼þ°¿ËÏþ@¿€ÿ\0Øðûþÿ\0`_Àüÿ\0°,|œï³Âô–C¦«j)[ßN”‰(ÊÂ9¿ñÔÏÿ\0„®¢Ñÿ\0„¯áíøJÂËh?öŠÃÉö“ý*®ò} ê«µ¸ï…ØèUR½,‚Ýq¾«o‚êÙàº¦x.©ž©g‚êYàº¦x-Æø-ÑáÐ•øÏ¹OÊ÷ˆîÐc…Ú»;wåçØØ˜ÛÄÿ\07Icü\\Bkdq’nKýŠª©4ÑM¶V¹÷¾(×´ˆ&™/d[Nð‡¥n9b¶\\r¬ï*™‡î›¬©½jÚg{Ub•®ÐZù…à‹\"}\\8tßÜ‘{–Ö9Lz.?*ŠÍY1¥y%2(Å\ZÑ§¼{VåÕ¹un[Ž[¥dVEdVéYºVé[¥dVtX\Zú™!xÁÁžk+\r×šÏLî;Q@Ú}Ôº¶\0öm\näw8^À‚­omš ö² †«@´^7\Z)B¡ób÷Ý×ç>S{¤{±×%èšø]ñ5ÊÁ¡úø5‚ãŠ.´2!Ì¸/8òs„fÙ*Ó\r¤]´YÆ=©Ö‰¢l•äÕÁY¼£.3r@Ô2=&ö´+Iù?¿¹míù«Ñ”ö#_bÜéÇ>Jô†ƒX7£‹UF-õUŠë°>¦Ú>pÈ}‘U=©ÙÎú«Kfa‘ÍÄpPÙ»Û\'½Z,ñöÐUNfsMún«#*ÖG|«í•Û,\n&ùH4Ã6OÉPH1tR5à«DQ6óÜ0¶ÐüwÊ¼¡k`£$:¦ö¡\r&VÄ\0§5ª•·^ödxë<dééCô«QùG¹m•ãÑ˜ö«c¹1­ÐIFgý½EWÚ=E·½¿·AàoI²˜Hê£¼Gj>Ï©%·škš±[Z3pk”Ó°UÌeå6²6³WMÔÚælô\nCýCïØ¬ÖK+o9ÎÇáMi; \nª§2Ë%e£Ú^N±µZ·úF¨Ì-‘îºVˆí!­š3L´å§wô˜îM*Ô{¹d¨¨ #ÐyæååüÁ¿\0s*Ëæò:\'{*ØÙ¦s­@€ÊçŠ¶ëç/ÕB]B8¢Yi³Šõ(3¼Âéß%6qQZ-6V;ýªf¬2ÙX×6Ð*oðQY¬Ð‰­h4à*™eò¥œC\'(¯rèVª€…«¡?7‰Nvú‹g{n…Ïcgc¯:ê}žÏxJü.¼™j¡»ºú-[l¯¼±ÊxÛii{£\"ŠÕçˆ¯R—•–Óax™Ìo²ºÆµÇ8Þ‹ãlQW2l–g‡ñ}ã á¶¨¯\Zm¦Áo4ÄÇŠóèäi´L8«%Ë;ã†7T’j±\\ô£ƒ“]oµ_ºo7.“OÙZw¹AæÄîþ€í%[Îc EYµrˆîcŠŠÓ}žn)y¼j•œCmpŽŽE²y)¶Ÿ˜¹X£e…Ñ9>‰¸ÑCäæù5ñ†Ò®=‹Ék®y»E£µEå\'ÄélÆé¨á‚²yœ/Çí8 >Ê`À@Žœ±RËx±Ô»DÈ®ºS`Vˆ­/%‘;1™SÚu”Øv®;Ø¨·­Ý®*ÒËd†6ÆÍŒh£Š+AHû¡ç’¶C~ó£vìª°­ŠþfCƒ“=E³ún†!«eîåB\nã˜9/áÚ¶¡b¿-k¹«Æ;®æÜÓäpøjµZ–ÜXÄÑÞUŽÇÆ±ïÌp	Ø7\"ÆG8àU5‘´rªu¬pöZƒ¢òk®œS§–ÈÆDÜêT†Ç«Š6a¶§±[)¯\"8é‡´•i=£Ü°Ÿ‘;¡\ZüR¸þtP­[·8^Ž*Žhpí[k{‚¸2\nó˜y¢.ŠJlc\\öà	N.…¤»>Õ~8C\\µ‚x+ÒÄîj3ªtrO&.³zŠ\n³©ÜìUåê-Óû+$LÆÙBZ¡u’Öù%¯¶TV%lox¨p&ù;^$’FÖ¼‚½iòŒ—Ïj¶k¥u/RCÁmZØÎå$ÒyFº¶Þº³Mk’0Ê4©<žÓ­yxt‹Y3\"kN›ÁYëng¥4*OåWWáb»l·Èé99êræë,ÑV—”VËÕ°ìºâ†S×Iýî*×·_öÞ-ÅYŸeŒK-ÆÑ¥<ZìÑEöpÍkšÃ#äuë¡Y|©§³\"k†Dh€+GÕî[;¾R»ÇB/¥Fy’:hì–ÎÛ9-ª³½o¼cF%]g« TãÇÔZ{™û+ü¡Y‡6•e´³Âê}”S‘V†\n÷(ßªë›»Cû¦ƒ55›\\Â¶Åi˜ÊèéEåGIk6\\ÔN‰—å‘×î…a·¯†¹,‡¬nYË\\ZøÜæ«e|šÆV¯5à¯JÐæêkŠµ[fkÉ&œ”Öh/\\nÎÞh8Ic¸§K.ÊÌT1ÂýL×(Eh¤u£Ê\Zæ·]ÚUXâ²<	M‚–;lÌlØ´—sW:£vº\"S›Ü¶cÞ˜{:¯À¬ßMz8Š­À·W¾ï¼VòÞY…Ád·á[¥dVéY]ï\\Ï©´ý,VþèV0O²åm°Èì¶Å9¢-VEÔªXí®Š:ÖŠÍäøÎ¶{Àšp^Pg`VÛ-i­Ÿû«šÃ5pôg’dvéý?æ¡X§±Ú\Zù¢v rN‰ôî¡§ä»dŒ}Ö7nDë¹CxQ7É¾lÆGK·ï\'y¤BÙ\0½‚|ÞOÎ­­QŠÏåG\ZQ]R”7DKå	ÞÓ˜).|—1ÎFC\'…pW\"`cy^J>u]î÷-œüÈvÐ#Zû£µYûc£¼ðYæ-?Kóšj×Ío”æ·.kZÛ\\‚aí ëUªIè©¶v7•Qx½$§Ûzu¢L–w»;ªGZ^m?Ú(HÖmªQv¦:œÕnBÕ[Ð…Œá`â{š¶c‘ËfÌ~åa<VÆQø/cÁfÏÒ³gé^Ç‚âc‡\Z&´‡7Í¹b<¤R}]w+0ÿ\0li¹.U’Vè[d°.ñXJà«z¡f¸,‚Ý[«#£5¼°põsÝ`vËs]K|WRÅÕ1ul[¬ðX\\Ò·Àîjëö¯—Åc#Ï{–.ñ+öŒ–Kt-Ð·BÝtx,‚Ýp*·eú=Ë^O\nÑãÐr³ýöÐ\Z7œ»}Eæçê°*‡z™«ŽÃVK%º·BÈ,¿’E˜¶?orÍØGî¤?zAôÛA¯²góvÜl—IªÔAÐÐI*ÂæBÇ:Ñò\n¯òpºã¼¶H¬zâÃAC‰^khÖiŽªK¨µÌ®ß‹ÒKw2Á‚ÖYŸz™Ž!GÕüÃÔIÿ\0š„|ƒÜ¶®ïî®ü½w+?Ð?m/,;ÚŠ¯*Kt¸½ò†°^I¢ÎÚÝVrÏ>/¼7Ý²­©c{˜á²vÈ tP0Šžåå0ÍòÉ(­qyBìs¸©öqK.=ÝŠ§€\\Äv¦PH¨¨ÍK’&¿W¼ç•¯|8:éj‰“Ùß³t¦BðKË‚ŒPÈé7@O™˜rtÖðçÇG¨wüMþeª?¤{–Ôßª€è;¹Yþûh¯)Ë;“xÓ4!Œ0{7PØn‹7ÁbÆŸ²ÀQ¶65çˆ\nôöf=ÿ\0-³ÄØ›Øœ3+¡Â” ÙPØFÚ)e²=—elz–\nµÎ2U’XZd»¾ê«T¯k\Z_ÁÙ«3f²kµxv•ªär<Q‘¸Ô«,¢6ºáÆæt8&úûMþþ»%šÍf³Y¬ôf°:Þ™ÝîYÇÈQúºP}Goqø8tñW[ãë/ŸPÏøGîtà4æ³õ‡Hº8Ëš3 *Ðª„{Ó{½Ë ùJxùºF>Q§·šÃl.¤®©uanÁcŠÝ[…nŸSyþ¦/ø¾€ÄØãqÀ\0b:ÖæÕ®¹èï\\¯j:Ù\"kÇ±{ÿ\0O‘ŒÖ\\ìAÞq¶a×RîïMa‘ÞpèuÃáÒ!jØßõÇÜêÐFÈÌÞ!>[Æð¥;*IMkÚþË	)ÍNÿ\0€RGZÝ4V‡±àHÖ´º‰À†ß-×åEf¬rª	é½Þåwr›±Èihù‚×d·BÝY.+yfVÕAÿ\0÷ÓeúÕ¥¡Ž]5upÉIŽVŸîžö‹1Žàô…Âòtn‘¦Y©VŒo(#!Ï„YõogjiÔÿ\0ˆdZêáM,ôÎÙË]k¼Qn±Ô9ŠèpkˆÍb÷x­â³E`k^ô*™õÞïsZ¾¥]6qÎVþý<\\Xß×3Åuìñ_Ä3ÅÅüC<V³Ål½®î?ÈÙ¿âþè+Ã0šö¯B2ë]¬9º¨‹æ‡\Z.*´ÃMÍ`qXç£là²CV4€Ö}Ð%¡T!]ýAsZÛó\"ÐMtÙûÍýú¥wô¯ð‘!ÿ\0¨åYíòò¬m3êDÁ=ÿ\0•ÈÇ3KÒ¨qÈmëYÉêè7%ø¯²ÿ\0Åýô‚Ä\0åÁfuD]$+Ñœ9ÈŽ×±yY•vA÷UÌòWŽš8^Xà9i»t+ÏD›Ç¹íƒ·¡aî58¼îµyõ¿j¸¶5@(:’x;ˆO†LÛùé‡0ÑÃŠºþ¹™öúë\'üG÷Ðz[*€\0ªq>¥‚w]‡7w\'ê[r*ìã¡ªÊ)þ ÷=¨|Ea¦ÅõWAs°4ùäÆ²Nxèsb•¯-Ì4­\\––ÞìÆŠd¥áÐË¡ýšÐúë!ÿ\0lþú¨ÉlB÷÷5lÙ$û…4QÅ·£ÃŽHºôDfªx%Âè‡%m³Lçz¨£dU1½¼SíŽ×ˆ¯æ§ó–_‰Œ¯å:Ë»‹nýÔþN„[b‹Yš¢¯4ÎåeúýÏhèCØÒtLFg<Ñ¸Ç#±¨FsåW	‡ú55F×k}ç†šÙYm‡»Wh\'2œËÂ´ÉyfF`æ·û©íS¶ôÎ½·]Õå8Ö6¹·{Ó]zííÜäºçd(¥2¶¼©Z(ÜÝ\\¢ö0P§Y5[mŽ·éÅ9Æ1¬½ŸGô[c?!èºmxŒ]¥oÖkXì+L”ÒO~óJ4§Yfeø…ìbc ŒFË• Nv­·î;\Z+-ŒYš@!·Ê³ºÌZ/“[ÁyFIM^ú8Ñ[\"’GÉ®÷W”®nšþëÊŒïýÕ†q‹›>¬øÑyVBáyRÕÇ‚¼™oÕw}ò×“fuK) o-±7¹Yû=Ï-S»ô×”gD´áŠÔÙÙ¬}i@‹ÿ\0Ši¯úÄmgò|q—Þ}ù87±YõsùË£Ê<®¨mökºíXkÚNEZ™l£Ÿipà†ÜdqÄ&Yc5tŽ«4Övr¡Q>‚¬Ns)GfJ=Öµ˜†‚2ë+ÙÁ]ai5¡XZÖŸ•EâP‡­±Ã iŸ²Ehcw#¹Á[Xp\"@ˆùäPöÔúÂ±ã÷V7|ßÙZÇÈ£É­‰ÐIŽÐö”ö{ÅÂë¨J··˜+ÊGÿ\0£j¾<j¿úºŸ„Óå\nêg“!Åy1öbE›Z#¯!’·X…çXL%×•S©•t50òÜîO 9¬QR»ý½Drp¢šÃ>ÍNÍzEÎ4Š.[poOµyÌÂ’;trºÂ~­M«þOì¼£bqÂG—5yBƒÑÊZð¿ï9Y_Âé\n[Ø\n¹R²»æ²´q§85ºÇbWœ>vêK1p5)­×¯ÙÜ3hVûEÇ>)ò¢òa/óºñÉY,\"!`ã\\×ÿ\0A«¾Ä#guÑQt¼HUÐÉ¾çÁ>æ\rÍUo\0Ìo´‰¡Ø´3#Í5¸j¦^<UA¨ÓzW†„b†¬‡òzt†\"îÔ%´RIx×Ø{Î†6Áó,íÎ9ª™+w\\*¥´3×“<éàS®À…æ>MnÁÂ÷¡¶y‹umÈ\0¯F÷0ü¥UÆ®æ}Mx\r÷{ž7|ª^JŽíX •ÇaÛ=\nLÊŸˆ`Wø;i»ð½uÐ¬mlor¬¶ãÛŠÆÒ?JÚ´»Ác4…c¬?Ôº·ê]GåU¶f}Â£@hþA±0ÕµíX¦¼pCDâ(šýe1<“¼\0çš‰¶™mÉ¡Êó]ÌúœŠÝ+t¬–AbBº4Z`÷<äR7±vh¢m’Þë¤`Éô×7˜õ™­öø®±Ÿ©u¬ýK­gŠëâ·Ûâ³¤¹Ä4%>Í`7žptÜr©Æ¼tóZ·}ºY,–kys[«t,½@V£ôûžÈy´§÷t1_áíŒ|5¨YÆþö®®#öXÁþ%„0…€ˆJëX;š¿‹#¹¡cn—ìV6éÿ\0ZÆÕ1ÿ\0¸W]!þ²·ßâ³>+ŽŒÏŠßwêXM þ²¶mSû…an›õ/ã{À]sO{qŸé[‘²ê¢X6&ý—ø‹Kœß€`]BÎðYèÉeÒ¨jÇ>KÓhwÎ¹ìŽú‡ì»\n—«ü“!nq¢s„Íyux!<eiÊ«z?ìx®­§ú—Q_ºþÈkbtw²¨AÒDæ·™\nŒcŸÜˆp¡\nÁ„­›<žÇ#n¼põth¯rÍ¥UoµÊÅ^â¶£ÛU¡Çœ‡ÜösÉÊùäòVo©5¤Ð»%çŠLû\niŠ1Á4‡y-¯)îJû­H¾ ½êÑí;%„¼òQYç‹Ò0Öjãa{ðÀ+LsFXê\n’SeÃuÊ¶%¶œòU’Â9§Ï&ó¹z½“E‹Éõ±ö¸Ÿs³ë@&>ˆš*#fú•–V\Z9²T/¨xªx£›yk\Zù	Å|û\ZáØµ·	J^N³†ÊÇµÐZµÂµºJ†ýŸÍ§iÞæº#I1*Ó$Æ®ºJc(½`\ZsB+–óGµDøíök¤f¤‰»¹ælÝÞçîpD;VñUälÝê©y³Ï£“.õ/ÒSìouÏjv¢ÕèÉ®.)Ïž×)’Ÿek¡™í´qÇ\"šÇ8>*â\\T7©¬¾(®Á´H+K%ac®Œ\n´Dì5U³0I	ä+E}îe¿3T·œ&-Ù¾2E¤Pæ,£ä÷<á9ÇŠíZ¶aÌ¨¢n.‘Fë†¾S%9ªƒB®Cîåš«MÌ+¢Ðêv«ÓHçžÒ¯E!Œö+ºÑà¯Jò÷v«‘¾¬ø\\=\\áv”FÒí™>T#-8”XË°ƒË4[½\\QyÌ«Äj£øœ¶¦yîEÖy5”öNhµâë†` ªØ]NgyÑ^)¯¨\rh©+6È•vFÐô€P{žÐÌ!\'°0O-7kÅ\Zãîh´ŠœÚÂˆšÃ•î\nº÷4rY­óŽë”ÄÝ§›†‹Y5/ì‚-ŒÈå’s.jÞ=šÖ©®hºÙ?}5Ðvª€×÷zÓ°ß‡š\rÕF>¤é¬ì¹#¨ÑØ€=í ›î¯­Vi¶åƒmãN“GjŒ|¾ç´ý*Aò•«‹\"ê¹Å;³×^»ªgÄõé¤t‡³wR<qM’#XO>\Z.BÂóØª\\ÆžHG¥wHêª“…2NÛÍÀú¨šFªŽ\0nßÌŽKÑÑçm³U8F/”,­qh«‡=Ó\'T&8´´Ô\Zí¦œœ8¡,Â¯äx+Œr9d½$7°«¶JßwµLl±²¹œÓ~„´R¼Ô¦Ñg‘åì\rckˆâ§žÓüDÍ\râÒˆ|ÁsÚ¾‚›Û‚-´îGÖ¾Ñ#jÖd\ntqcÛä\\™‚‹Vç»¬x\'W2pL‰™•ÿ\0ñ›Š €]ïÅ]Š°ÅÈfQ¾KˆveZÂµõQ¿†I’C‹ÛùTÔÑ	-F÷ÊkE\0SZûÒÉ½#”Ò3d†ËnJ-d·šçP„/‹Ô5	Öv:Òì»]%qÆëVÃU<îæœÍe[ñ+ò=¥p¯b Ž…Ÿëèœ|…aÀ¯KjÖGŒgŠ>²k=v«x)mmvÔ·DŽ¦ÕåæùGAIjw•àì·b?îSÁ;Š#’”rr“¸zŠ±´oÄW¤yqìÁaV}ÑŠB$ˆdå~g†ö+¶fê›Ìæ£ÖÊ^×\ZS\"Ñ†Ö‹5°*·RHÝ[½Š’C“B¦%Ïuâ« CÍ>gÀ9è‡èNÓÛÍ\Z¾›?Õî‹Aù\n\'EÃ‘G—¬c˜âÓ^	îùAÑ3~dûLÎ:£Á¼SÛËZÒš­ÓžíC+î™º®ž‘œ{4^ÕÜ6\n²Ç³ñv&×µ^´#¿Tï…5ìô`fÁ‘B6¶²SÖj›É‰‘>Rö?\n8«ùÈì\Z;Q28½Ú#ú‚‰î%Ž0›\\\\®+¹(‹whl µLÞ‘Áªó¨_ vGUw³D?Jw@„yh‡¿Ý¯øÊ<´T/™SÔú8ðæp\n³LcVóÉS7€f‰Ù÷O,4‘Øh„¼¼=‡=nÜZãº‹\\(à›hx»\rqâgs‹C¸„^ó¬#Úw«…†j{KXÉÀ´«­m72‹oÜgÂÔ\\T2;RŠÐOM©0Ã¼ÃZ+“6ë³Ð;Ô_HQý:!#\r±¢qw\r\rª8«½Ÿrs¹èŽÔ“’Ö+ŸFÿ\0hgßÝ‘þÙTÑ–`ûô)nrGÂô|‡±unÔµ—Œ5ËT=$ƒÙo³Hþ¯	Þ¥’Mú]ïÐçDã†(:wÖœ’]ÙkSœ^aÆ‡‚×Z1§Z§hÃVªÂÐÆh…{Î	ì+TiãwŽ‹[ÎL5N{ŽÓóÒÏºŸ·«DgåÐ?JŠà¶ßtòQï4ƒŠ‰ò¸Qù\0 –7‹µ\"‹4XššQPæL4Á¸¦´¸\n•toQ`ú¢ÓŸBI÷D­æÒ‡nœ×dU9hM„\\¹­X¥ïˆˆ\"k3ŠÆwä\'}~¤Ù²y©(5½™ã£TÌ9•FtâVÄE­æåéæû5_œW¿2„pÙ[”8¬rN¤ˆ §µ¡Ú‘ƒs%»0i¢Ùg99:meàTÒ>¢¤ÑgúÆˆOË¦ÎÝku—FPÃ5Ó¯9ÍW;€%:K´}ëô]Ê‡4\\z°œeØºPež*Ù*^§ÄåÙtsª.¦iç“}ÐT£æ+d¢¤ý—jvŠÇ›cÁ6Ž½QRyél5»Í2n´ ë»W°:%›‹«èçÖsWY%ÞÆdªÙÉìv+Y3ªyrAAô…q†—d*{-Àh¥üJ´œè™¼Ú¦ÒîÇ)Þ2­42O„Õ2\0×4»‰Vsß¦²·¯¿	Åd¯Ö¡,¢‘Œ‡5©$TÔçÙ…æŸe\rhÕ±48†´~P{ÜÇýÕwTÜáè’£\'åW6áä¦=ƒÝ3×ƒŠÙ7[Á\r¢°q[ž‘\ZñÐ!vóEÒ\n|°<áÓ¦)xŠdTs5TL/ÀÞ)ò+ä4Ij1¹vé€üŠŸôÙ_\ro3DÆåuˆ;ã«´8sbŸ»L°Fv_ŸA’Sb<IQH2iÇ@dm.qäµ²ã1ü),d‚GÅ5ÁørC\n«­!Ïý”\Zžj’A´è¬÷{Õéä.ìá§.‹£­NŽ\'Þ\0NJwvÓÝ6ß«ûôêÇžaJëïn©YìÖ£K*vÙ²UÏ€(#æà¢²3›»´5ƒ2h\rMœ×ÙVÜ4EõEvž.…Ø0ÑmTãåÒÁWM‰”bFF–ÅÅÅPl±¹žiñ¼SåwxÑð…°Ö´ó9§EEsz×FÛÔÆðÍ]QÝªä¶«ØUbBÏ-z—j·Õ$7‰<t<üÞé¶™W¦·_M´76ç¥Ì{©Ô’ÜS¥9Fç–ÈÑg+È²»æˆòÑeB›·Ã‚ŒJw›?zsNE?d˜ÉÀ«±0¸÷-l»S~ÉöbàO%¬,¯aÉ]e	ÃVÞ\ràÐ¯èæp•éIqíXªZ\\ÄÐÃ˜Wf5g2½¯7Ÿ«¿KÝ@h[\\Útw¸û¦ÛöÑ[ÔX\nª9½\0y,q.m\n’3›M:—Œ…M_Œè„¸ÐU˜jØÿ\0},d2¸ÛEh¦QÚZ)è›¼QcÖ†?“‚yƒnìÕj|©¬Óê0[_<˜Õ«Žô1óâ¶gm{ñ[šw¬WnŠœ´˜ ÅÃ2¯9ÀŽIÌÍã6”çE·Ä,Ç«Ì=ãÕ7ZàÚåTd e¢Ü}Ókþ•²VÐªÝ+«%ÐF‡Ù‘Ä-p/ÏH\n¹5L>m4qìÒ-S\n1»£št.¡æÔíµ\rs„mìB8›t~êJb\0¦€BŽ	ÛuÙ^\nB#ÐÌXä#mÌ«æÅãåÅRHß»Bôs:Ÿ±T´ÇGsbö‡Ù]l¸ö¯FàGf‰$ä+YSHy\'ŠŽJáZŒÖaGñb«v\\3:<f=K.ÆLq	Ï»vº  ÷L¿0*iŽAÀ¢æò¼4BÞ\0Ô *r^pÑÞÐ\ZÑxž\nôƒÓ?>Äãc{’ÐC©ì…r*:J`ÑÁ9ìyq*’ÄÉ{rP³TÈ£.¡^„Òñ¡!MtP²\r\\MÆ¥8q\"Š‡E$Œ<v„Yc±8GLØ0+ør;×ðä÷-¸_^å°ç0 -\"­ø¾ùðAÇ\Zbšœ9û) Ë»0ü®,{UÓ„£1ê/Z1ÁVµ‚`ùGº{.Žy+ºNÞgì‰hØ~‡ÚÇ¨˜Çc*ë©{ˆ*­y`ä¯µñ¹\\³³zº\"cé™E:¨¸Ü^¼©É2YX]^Õ[- Á8ö_ŠlVÆµÄ\n8ª‡±Uwÿ\0“•èÄXq\n‘íyê\Zèô‘\nó¾ÎKìÃ>aRµÌìß–‡¦ö8éÖF)8ü¯‚F•þàÌt‚KC» ˜Áñ!Ýî‘ÚÍ5é‡Œ¸…ñ4þ\\\\þÅA½ì´\'Hü\\ãRªÜ\nÂS÷^’Bå«oXä\ZßºdqÂÑN+t)T*+L-Õòà¼ÚÑFÚiBß‰:Õäé¤Õæè«û*>WžòŸÝéodxª•ªd¬2|5éc ¹Ç\0Ÿg³lÁ•FnAòì³—4\0Èhr¡ÑO{M\nºóPyè3F)0ü«ÃeÍ(<gÄtjqì\n¾*œT=¯{¦Í„zŽÐ©£Ñ¼³¹S\\~Ëh’{VZ]#°\rO‘Ç2¯´í.Mmr+P˜øXNÐ§!òˆ$ÕÛüŸiŠñßˆ[,r9Íã[,–Ájšòw6´™excG4É@ 8TU\r6’Ó(œç\nÝÒSj…¹\ZT§†æžþIÁÛKw½yÔ£Ú¢Þ@Œ´P.ÕyÄö**;Õg½ŽØ÷U”÷£Óìõ,³µÙbä9EZÑ^i¿Ø9`¥„÷…Š˜=¹+²4´¨âhÚq¢Ž{Úw2­¡£kVS›+®ŠTª™\Z:¢#:ù97%evÉvÖŒ\0FI]t-eÚ4åU‚´G{6§‚üHXâ©Dê:éL¿¹\\U5—{ÕA¨O`ofˆÌž:¼@(ŽÆã‹t^F‚§…SZê^§³’®ˆ~±î«9ù‘õé¾C“ESä8—Ú£šÀQA±Å¨K™¨æ)²Fj\nµÙÚË²D\rÕióš9ÑóMs†6ö‡0äEŽ…·£&¡]ÕHP26ãSo6…¦ó©Mc¾$Ùg.ux•\rÞyî\rojÕY€1œ1¦NNÃù*£W#ŽÎ—lò+ÉUÊ„QpUâšxdªtÍáŠpycyI‹¤âF†EtÙÛ÷AÜýAúbæüÐä1:{4Š÷\"èÅX½»ÚQµ\n6C¨i{0íÖBF ‹ÔBL¥nº1\0¬#hûh»;+LŠ\"¨ÂÆ†d¢Á}ÊŽÖ=	íÉÁ¼”‚&Ô«¬†Gžå¬ò¥­–vü\r8­’ÉO7š­ˆ ð\n†ÎÖö³d°¿\\ßÙ«¯k£xàSC¸h\r—„}-` ½UØ°Xä®Ýï WZÊþvUÑ¹´{¥­øZ1Óª¿£Š’‡àŸ\'`\'±nâ0ƒIÚ–ÖEbÁ^Åq•Ê¨Z_j´š5ÄdñzÍ0»#9„ë3_[<û¿ÛÔm4õ²ÀÞá¡ÛwßÉ1µVIïºÀ”¯½Ê«fI÷_âm\Zçž|m¦ÎÒþ70¯^½8h.T¡4žƒÖ{B«¨Ë®Ã¹Hàìj4YÏÉî™G,ÑC§DŒt9Ü‚&»ÅBÄ$p«Ž:*2:*®òËC×‘bnæ¦©Þw	™—6@æ ”Ç\n&¼qèTª>vº£ga=êûÞ\ZÞeT\Z¨™|o$$xº»§±z9?Rwœ6ñáDÈèyét¯Á­WŽ­XB5ì@º70ãÇF%sWVŠ{&¯ØdªÂH÷M«±ôUUæ±ÑšÃ…PrÃy9í ö\"ûTMæäÞ4LîÐ9¬\ZJÂ\"ž÷7Šèæ ‰æ“ÙÚÔ:À1Y+-ìõcM^oÊwc¬^!Š¸ã@&¶9ïãua·Ðd¨â|Ž0‡(l~J\Zé\r|…f(5µkAFÍi«[ZÄ×_Ö ^÷]hæµqá\0ü¢÷ìÄ8óWxsE”F0œÒ0!8{9\0×Dw.’x8ÑDe-f¤³±Vµ-4*\\(/û¦Õÿ\0#¿} iÏ Uª¾8æ;Vþ)€>¸¦Ó‚s]NÂ‡r£\\\r9&5Â­ä¼Ý¯:­m.©Ü0!‡%å\'I#ŸF{Ep»†AI=¦óãHÈDÁ+$¸Ç[^ÖÆ fƒF\0a¡ö‡odÖó)ò5Ž™äâxùç”`w†bn1î¡w$æYç3Åñè½‹•B”-AùQ—ó*;cA&ï[«8´ $ô/íÉl=§¸¬ÖÓÃðµc³*b€p \ZÍk^7”ñ´{IÚCI-ÆµjâÞ×r&]	ßY÷M§ë:J¯©ÅŠ9ùÐ&€)DâÓŽIŽ¯Ämî‘º»÷©ÅI	4ª¶jÞç^—-T{¼Jdmˆb÷&C£)Ñe&Õº<‡qõ¹]¦ðpSGƒXæîêŸbŸ\n ÆâO%º>Ñ¼\\B¦ALî1á§eÄw*k_â¨qB[S®7àâUØ™qºÔÀ9¦HX0T\nfüÉÚCúºf<Ý¡­âqõ!Vz#îOÐöU7½7»A–i@ä8”ècôV^\\ÐoW”Ø`h‰âzz¹…7^8+öoHNŒâ‹¤³Ê^s7Uf”ýµ[€¾7YËM±ŸíÎ¡«\n¡´0ÄyÑl<iÖÄ*á˜By…¦Óõ¦wt‡Ô}Òþýõ^ÍÇ¡rríX®Õ~9]ÍmZ¤$ðªÛqyí)³Z¶YÁœÐÔ¶íÜ¨<££Áí^ÃVœGGæõ3âi\nXÏ²â8\'»4T\ZÅ½y¼œ¶áð+n75oÑuÍT³ÅJá‘zhé¨û ©;Óê@TìGLeÙÐ/<ã™BÕj\0¼âÆ <BýEÄÔVÓg®0{q«Í’ë¾àV«Ž÷©ÚR9°®Ú¼S\r<obÄ¬Ö:à°Ñß¢1Ú†Œºê÷C»“»Õ8»AC¤ÉcßÐ‘Míè6>^;¬ÚN.•ôáŠkgy’.Þ	´Ä‚Öc¿ÙY¥Ÿ0¡W£°‘ýiÂ[6¥¼1[Uoz«MG©Öè±C³äOÉ`jªå†tF:mï>è“é(÷¦·ÐUj‡¤Ú»j„ÓÉ\r2Õ+ˆÌÑzÞiM¼0<”dœ°èSO6òUiz‰kíl©;´W5†Þv:3X,Uê«1U¦C§y÷DÇå:‚¯rN¢¢Ú X’U\0¢©ÉPd:\'E0éuy§Ã•Et9ž	±HèVY\ZÞò©x‘ÎŠ°Ê×öh6w¸ù¼Ç\"¯F\Zãó\Z-]¢ÊZ9‚µ°H?#Eùä·,Ps1iã¢ko#!ÍÊ•ûhª¼k…B|®à°éGÞ}Ñh?!D§5öt|Ëh­•R»:Dðrs>ú*µŒÌf›#w‚pâQa•¾* Ôs\Zö‹Ç ‹ßyäª;šøÜA\n7’TNaÄ\0šùdÀ6¸«šÝjt‘ÍVaVóFiß@2ÐöaaŠÎÓ˜`Ðcf!›	Œä1f±W >nÿ\0Â¤w%oaT,k{ÊµËåj‹+=D|=\nr4ÇE:1÷ŸtZOÈžz-Nqà»*½;üZšVÐ#F*ôXv.-rº_}§XÁtói^ŽCsá(9®ï\nëÛx-–†¡,\"¼ÐÖ@\ZÐƒ½‹ÙöæÖcè²$qZùG¥vC’3ÓMÁ£$e´I{“xfˆÞ\nyÉÆ›=éÓ?Ý£ÞˆImxÙnËV]Éæœ)ÓØEøóÕñ\nëÚZG *ÆcÑ(è‹¼û¢ÑÜ‰èÔ« `€É`ïP[Ì\'4æ\n[pÈÍ—«rËbRÕ±3\\™4[Vˆñ}8¡}µB¿pì\\UæVï>/£wáU¯E\\ðÐ†Î\'š¹5vÎ-®^òE‘z(ÿ\0:O”%oc+ X¡5dYÓâA™K «“bf%Î¢ŠÎßdcßÓsí0·K²R‹?U{f¨¾üOG$HÑy÷D½¤tp[ÝagNÎM£½xŠ­™œ±£”19›ÆˆÕK=¹š–°iÍ¥/¢jºK$iU³¾Ÿ)X1ÿ\0ÐU+*Û?QUšaô·®Ù#Õüç¯=ÅÎæt‰¥²³>ÔØØÛ¬h †»üD˜4tû}¤U5âQáUçó7ôëê<Âm;¬#öBGE>¡¸æ£ï>èïz\ZiÁP,ˆÑBW5zAuƒzEŽÈ§FFIÌŒc=’VÜEYª)¶Š=èºíÉ9„êÀ,˜V¹uÅc1[Oqè²6ï8ÑCb—F)óÊhÖ…}û®8væ±Š2!â›qîM‰‚h§MÎÎW`Æ®/‘ç™xfzt&(»Ïº!ßÐ¢Íf±@ÁÉ`JÎ«5R)Ð\Z5mMš3G4ä›é.;ˆ)Žk£q®£Þ³‘týÖÝžòÆÌà±…ëªñ]PðEÑ`yt Í¤é$uÖ+U|Ù†Âžu/ÿ\0ˆMmkQŠÖÈ=,7Í!£Z¥unû\räµ²JïÆŠhÚ+|x­ñâ°p%I@9+ÜQ÷E¼ÜïíÑ¨UÒCxôõñƒ˜ä°8(Ü×û@¦žmG°¬Btf\".š/h,_EÖ5o±¦TïmËÁ¸*ñÓ3çxÑàJók)¥˜Úó‰…é@¨o$q«ÝøLšfÖ(øöª†œ\\¹ª»¨†A©aáÄ­s÷—o@\Zª\\Vj‚§¹ke4§~ë>è±7±ÇöDôªp\n€,zXôK\\*\n¼ÑXŽ‹3ë]’w~‰OÎPè½5¬œxby†tÑv1Š¼úI?à\'Ç.~e5ËÚrŽÆË4Ôt`²»lï¸~È5¹q)¬n-!\\4bª¨1+l†³‹ù¬N\Zît@Ï†>ž\'×<T\\Übæ®’d³ØŒöw‡‚2CIN{%sI5[6ŠŽÕk–åWRä\\èÜ\0ÌÑSØ\n×lu¢=”ç“´ãT×¼×±R¡Q¸i°ÂÛÎ9žHE«ý§óéê,øÌü/|+‹Þãš Þ9•xà4PœP<“n€Gj24S’Ý-o=8èwü‡ÝùX:]ž´i-p«OŒ°ÌåÉ_…ÔæÞD[/*à‰«O¶˜Ò¶¡ð+Ü¶¯)aŽÏF¼]¼Jl\ruÒW”,rà^Û¿ui´Vš®ÐmóEŽ:<¡â9¡,x?Úg.ç\ZÔ`²\Zž2-¯HOÄªÀ«leÁV¸rÑxä‰n(7±4rW]ˆ[;(·:iïû¢ÕÙA£\r8ÿ\0%’/„jäüvFžjŽÚjÀý´Po«‘´Èò´Ítü-M’CØöœÖ²AI8¹¼S¬vz_~:¾‰û/8b’ |ŸQmuP|\rXeÚ°Ïž‹ÍÞ\Zèm\näžû¸èÉU<öé‚önÚ÷E³ëþfì­¼}”ÞùJ¤,+: */8æP¸Cä;ÏÒg´±ïB™jçÇ¸ñéY¥žV²ën›ÅR\ZÚÙ’-iÔGÉŠ¸¸ó@¿Å³²¨åž‚æ«¤e °æý%\Z8ª^í*•T\Zb…¹¹ÔL¹4SÜä«Lƒ^VHóGùr÷ºëGq‹C¾\"2GUpW-–iþ5É~Q%ßôÜhP‹Ê’>%~)C¹Ž!>{4×höö«5$Ö¾÷wJè.§%•]ŠÀS¡XèœÓ2³\\ôWD“‘„mÃ¼û¢KÏluiq¢p¼oÁr§+:Í?m±µ¸’õqÔ=­ÈèsÚîº˜n´šbh¶[^(Ð`3UW®‰ƒ¸âšÆ\n¹Ø\0µÕÕ7°«–¨c´3´b¯Xå6Y¾ä¼ÛÊPùÄ9^+Ïü•5è†l®H\Z‡ V8Is\"çÌ¦»\nUÀ-§…´òVUïXUuØµ`*©Jy²mòB‚§µRH®÷,0hh1¹—¡~÷4Ùax{ËÜÅÎ42¶	óXÖ}«VŠíYÕW6œæ²\'ˆ7ÑÞ)¶MëÄ\ZrYìZ¿GyÔÇ’.tRYKÃ©®6Óa´l¼;\0U¶ž_=ÐÇTaš›W-ùaßPÙÈ£Ÿzéí\nÊ7nµ×qWÜòZæÚ„ÒÔ\nt³è½­ë‹S\\E²VIc;Óy:‹P×Ùûs]d˜ºË.ÝKˆƒBµÅ ÞqTþF‡¯	]Ú›Z;ÜB\n‡e…Ü“»ÐtN«=¨øz#GûL9r‹F’Ï™äÝdîÑE–ŠÂ¼Ù5wEB£Ÿ³JRˆb%í8y«°²Wì:¥ØœS[«q»{\Z`­†_½(øpªÕ+ã$í¥Êd µÆòå\r\Z[²CéÚ˜Ûï]!Î)’ÔÞ`¥9úÃ4;~éÑHÞcC$´3[3‡‚›ÜŠÐÑ[­9£g˜SŽ=…¢—XÒÐjši¶üOò¸éqä« MËó–]—Ü“&‰×˜ì½ÄJšRv²Ð²Mî]«\ry\"F›Â;Îž¬½ÙEäû5)Œ£™Ú…7t4»öRÏ(sƒ_p¢È÷)…sÑ{ƒ‘cÅ*/5Õë€£ØóB¦y.¾·¨%£@MŸÊœvUtS‰Óž†X¤ŠC³NÜN\nJŒôØ»zÐŒµäµ¾Ç×I’FXârAï‰¯œ\"š)\\Ë®ÆëùªÆA \Z#I™SÍz)è;VÕ£å„ãÁ6YdÖðþ^ëF¡u×»PÀUqXè€òxM>â×(žêlò\0<f*4ë=šÓ¢iõ&œ4eÑd’8´9×p\n9%‘í¿R\0jÙi#¹UŒ.·VêŒÅÍÒû4[M!lµÇ¹]c	#±êÝxfÖ0¶¹WN°*¹.anèk]‘T¨ª)®äj¢xâ=Åtq*ã2Dÿ\0!d‘€»ÑÓe\ZZZ/‹•5EÐÆíið©Z	ˆ0‡5×9(¤!¢±œ8U\rûÙE¨×^ÞÂªG20H’›\\”—#fÜAÔ§\0ik›ˆ¸™«¤—¹µviÑ=­¦®¸7=ú_\rÙP^nÑ®$Rª{Ô«¢c£Þ¿E)m5 7hXê„f]#ö¦¿Y±MÕ!<°Q›ÕÅHbº]y9à7_ª­>êÊé5ì¬ÁÒTj\\J²˜m†&³k*\"×¶B^Kïº”VÑg‘¢C ãJ…g¬âüpxš¨Z\rd¿MJ³6	De¸¿½;VðËCä«ËpÁHD€Í©k+Ä•ea}÷ÕÄÔã£š\0f®ðâtìðW\\>úCEàhUI©Ð.Då$ÞÜW¶MÄÆ‹	Jßü,ÿ\0‡‚áà²t.¬.¥WðÅåü;—ðï_Ã½PÅ0îFû\'È–²a^ÄïG.ÖhlÊ)–	)ËÊrÅ’x-ÙGÙ`Ù|:ÛÜ®à²•^»5ï•ª±¶gÐ±ŠkÜ€B8áš•½’qóykÁãÞWT\Z·G‚#VÜWVÕ½wì«,ï¯zô3¸ÀªIîXÙŸöXÙ¥XÁ.¯ò£»†\\~”/Äçrjp|Fµë­ à.®\'ì²>uÞ\n·^åºïºï„nð[0;î±¥¬q[¡ualÆºrY,–Kt-Ð·Üp-À·êÂêÂêÂê‚ê‚ê‚êšº º º º º º º°º°º°·Üud²Yt1h[nÕ…ÕÕÕÕÕÕÕÕÕÕÕ„AaXþûÿÄ\0+\0\0\0\0\0!1AQaqP‘¡±ÁÑð áñ@0`ÿÚ\0\0?!ÿ\0áeË—.\\¹rý.R\\£,î_¥=.\\¿ùßü.\\¹uj“Z—19!…¼Kh¦b–]„¨x~$ðt8A„é%{ôR§¢åËô¿[ÿ\0…ýÑqC*q•+™1ðùTZ¿C,”ƒÄŠûÊýÍ#›n?&üù€Œ¹ÃTÛÛ´Ê~-ýÜ«fC2£Oæ.öhÂíß30›€3´2Š}¥bÁ‘e<u?Ð¦òð&ƒ%ç=Fv°|OÈ¼Ü2º»pÃ:%öe ¢:ÿ\0Ú\"ŸaÕ1·z\Z=Ó|Ró/îÔi9[Ô\r—Ã˜s-ñ!xYõkÎ‚(^Ü‡Ù”!QP÷© $2\\ŽwÒ6’­LÀm=á¶âÍòÅvFè²„Ó\\­Ú)w-fd¡îÇÙ3!Çê$Aó«ò…ÍËKßº\'¸T‚,:×´R;³öˆûÿ\0Ì;±×÷3û?ï1äÃŸh	ÌÌ9ôZO,¼Ä+_ë<0AQÌÖa“Ãü\n*Ìzoè[á·{‡˜\\k‰¹·íq:UÐÄ­05Ýlö¡fË\n>Ós9ð–{Ý‘OHŽV.ï2òÌ´1˜¬TÜ÷:‰qù‡zxˆ3l°Ùqby€pø™Êû\\ÞIÌQiô–ì•BfªüOv%9›†å½âß¥Ý„ÌÓ÷‚u÷@¸c^m-þ¸*ÕñO²BîîêVãñgàD]Ôã:Š˜øfÎ€”	àÌa÷…í,b*¿M_ÏÑ(WV¡RgæcüÓ¹>ÑUá[Æ>‰+RÖ4€Ú¹…°És0øûJûÍõ0ÄÊdj0Å¬ËõÑxò„¼ ˆÅS¯™S•ÆŸÙ2sšºÜ âaÐ ÀW‰8öˆ7Q‡³;ò—Ò(¬NÑñ\rÈó\nº3/ëˆ´/˜ì§¼=„wi·öÀí€noàÅÀéÇº·)á&üŸ’}Î×GPiW”n\næFïr‡Ð)vï2ŽMgS°«Îá‹5–™»DùŠ5læ@æ&Æ—!\Z×ä§å…ÕJâ›\nû³o|nYÞq€EÅRZÂ%?‘¸88—½L8ˆHðC)‹Ôƒ8fMÜ!ëWˆ0\n€·A)èD&Û©h—z ÛÔÛà@VÏ(¡üSP}“/ôsá3x?¼»þÿ\0ðXKu MáÎ³æV\\\0ãÿ\0¬ls÷‰cúYþ>ˆš>ÒÊUÅÌ×q\'vÿ\0q\\åµÃÞO÷hFÃ(*?\n—wwâV²þÒ‘o\0cÞc;4¥?€¯YÌÚËÌI´5ŸpE÷–)§cR–3-tŠh›Þ•<Ä¬gÄêL0Äß1òžÿ\0@e­\\©má)8ObåóÛÔWÁ	bÇˆí|1¶¸ƒ–\néÔÁí÷ÌÙù¸xÙ/d>ðCûÃŠ¿/Q[1yèoy{¾f6ÝþÑl—¶ˆC¢š\Zpÿ\0§Ð8œ ÷q6ˆíq:ì„qðMºmO²ç•øÿ\0¸òÂd*;†—³B™öÂÑøïí8?c£Â-Rø§÷4Ÿ†v’¿ðaVy¬£Ñ×k‰¦¡WìžÉuÄ¥@+Ìðz-Dá™Yêfž+e$j]â£8rÃø”õø˜4üJ¿¢i÷\'PŠ?lÆ?»óùJŸÞ˜ñî>Ó6Ï´?ðêû!lU¿ŠeÁÎÐ­ý¨ª?cÇä>‡V\"šb8q¦3Ûý3Ï˜—Ë÷žçï= ½Jˆ¼¿yï~ò¼ÌµˆŸxÕÖ=Up†*âeèû¦Qìžð«pâ\0¼CÆ¼DÏ	£w•ÄùÝ‘ƒ`ßƒ;#tÉÈù‡÷©F”sh°÷ R1† ÆÜFpeŸ!Ñ÷œ[ûAX°Èó(ƒ>ñ-iFŸ”£šyûà‚ŽÚó±s¡ÑÕN.•pÁè(…\\áéÌq<ÀRú+ÐÄ¸­Ž&õ\rROt|áûÉe6)Ì«q„UA¶´LUêW¢T²BT>ÉïÅ Ë¨BÕÔ¯eñ73H«Þ%oÑ3pÊÌ£¨*‰q¹¤¾Äµù¾ý-¦ÄºoXŠxžÉ[€aè…Dòq~!¶ðÃfˆ@®nþ¥b¥úSýq¶ÿ\0L²(Å$ÿ\0Þ%¿ÜOüDo?Cû–»ý‘ÿ\0Ç…{ý³ÿ\0ló¢Ô…þ©pÂ‡\"ùL¥ÿ\09Ñ÷²çù’¯ò& Ç`ó?zS†°¦øœS©ö	_ô\'þ\nÿ\0XÑøÍ›|™¹Þ3¦œˆOç£Ž•9!zg`ÉTwdE²\0¹Úã6—VKÁ•@’ÖYFh	ø›êøp¨Ø}¶n]¦bÿ\0ž>†Ï4\"\\¯ØÇýK‡Ù?„g/¶ÝŸÅ3	Ûù	Cýÿ\0yccþ»ƒÿ\0/öÃ‹ü>båüÏ2ÿ\0<Ì¦Ÿ?Ý0ßÅÿ\0tC¤ˆµ 9ã\rðhip¶¹ï\'¿¿Š^¯›ÿ\0©‚Œí?ˆãO_ùÏ#þz‹×ú|Jû?Ïÿ\0«&SížâýFWo”ÿ\01q†o,flâ<ÍçÞi‰tf\'\"x´Uþ)Î?	c)ðŸôÁüYvþÆ6ÿ\0Q{”§ñ†±|g}„\0”Vå\\¡ùÄÊW7ä„~‚Ì”â´˜,_Kª_MŠ£ì]×ùÌò^ó;X½\Z–¾›•‰Q„II¨J¸ÁdO2ŽÉAâS¢Ô¥W¢E<t\nö˜„¹EP”;ùCQg\ZL¤Ã—‚=• ZÊ#ï„æFÇ3ó¹[µ,ÉxÍ=Ñ-eš?¹ðÌºÜŒfm7,V%	0z\\aW¹F-¤ÿ\0CÉôN°?Î\\Ùˆq	\\Ü³­Rcßä¯Ü<5üÊ½E±ˆFÐÇÓÀ	Oúe?é•ÿ\0¦ þòcëÄúVyhU,P*¤Éæb<G0ÿ\0ƒ¹PV4F6üÂ6‡!²ÜO3Y &#RÔÙÎœE*€‚ADni¬°YÝv/ÄaÄ³PÏB#íò]3SP:=RKé÷BMdkP‡Dsl¬”ô„IU4þC£e}	Œ°]é\r(ef3Ú`‡˜1C@‡%¨NÓê@Q+©P!(äô6U£ŒßSú.0 „Lo\n÷ôâ*›zi)}~Q…ƒ N,0LÐø?öVÃ«¾\':µ:‹*\ZÖ¬‚÷¦`T³ÍK3Ëb_@z@R·V_âUƒ<ù–ùmwŠÓ!øã»V]‡¶á î¸ƒß¥ÊÏ¥ëþfþEÃèlGT;ûJÜEš•pîYG?Çu³qŠÔC;qbËÄ¸Å†nn \ZY>XÄ32G)¤¨4Ôš«‰X=„©]Íî´|b›šˆÚ5¼ÆUùE.^–²ªÄ>G‰q\0ø†Ú0[wØ-[ˆN‘ù„®M`\Z«¤%‚9cÔpÙräÖÁœïn£ö°Éé¸újó§óôFb’*}£{†ÜªÔå+ì³üv\"å@ðMÂíUeFxÚðŒ\0„aU˜ç…q¦Êùâ\nQó¥@.Æ\"¨EÌE¯2ŽÏÜ7Ê`æJýæP+¹–—Ì§«iÌü‚µp9Y]Ì[+¸Êý£eQ„zˆ»˜ã¨tŽu9€õ4®éÔx1¸Zxµ:–»\na©Ù©…çngp­ï²+Ôðoæ\\ÝÅ+œÇíjæ:¢î±/VšÜ»ßƒY¿vkß˜]®‰â\r4W\rNµ*T3_aD`¶àƒÛÐ¦¥³µ£_j\'’ÑÒÞá»ÄÃv¶	XDËÌzuÞÉà¦YÞ}=a‡9‡\"¹2QpÀÝ\réRÆSjÇÊ¸Ú^ €\naÍÅSÞÖ?0(˜±¾ÉŠ/ƒˆ{µÙµrÎå0Ñp0È:±¹Qx\'(f²ªr¡2BÌÏ³,ÓÙé„æ1qèBŠ5)uÌçÌ\"€žs‚4…xI,X¹˜š¿MÃ\n£1a(1¥ÏßAûžÆ{¸þfHï$¢1É˜À.ãQÔJà¥ÖÆ¼LRfÏ´V9k„ö›Hpp%•WÆŸ¢¹<Èž‚ó5+ãßîS+A¡Ž—-Ðtk¹¨ô©¡¹<LpwãbW¿cæ\0ï™hØÑÛèÓd™ð$‚bÈtt³«†N;RË¸¾^ˆ(j,ÊòE\'\rÊõ\'Ð¨þÃŽï7Ñi›%Eû>ú)IóJæ(\\V%,C·™£ïúŒ0%ÔÅÁ¶x“À™qne°|G\nZx*.Ý?Ä-XþE^ )xS1\0Éò™ÉÐ\Ziº”Ïv»3Ýs¾óH ¥ÔÏb3wx}(.d<?_C}\0í;šNc»¸sû2ŸýLŒ\\~I6N!<\'öœ4¾ä³û%>&\\HËip—rì²Së×>ÓlWq”;XË˜æc,¾£çÓÅj_îŒÌIØ¤ýK–N×r¿òÕÛé)òí:™M!Ç:™8¤S\'hˆºúŠo‡ûÙåµ›÷&xCTê¡k±,I°Õ¡Ë=°_“S±›Ãçnñ2ÚTò†Ô\'f\\b©mWY”3MA®˜›….Ç€˜{¿Är…_ñ—ô\'Óì„8ápœû›Ž\'ˆ¯ø”>ÿ\0#éœq*h_qø1Ðöbº§Ê4ÑD*óùˆÙøÄ«§Úp’tWÌC¿³ÔAþ8ŸÄAþ(µ	ñ64A^F2ÿ\0åÄUG?¢;çµJTX~	¾ç¢È’¾m*pš“Ù—Kw$Ìº.(;V¢åë,Ô5µp‰w0Ç³=2Tb(^léu­› 0¥ümÁŽy’¢úÜÙÔÎ×b«DT¯sªX56†0™dµæVÌ½ ¶fcª3ù9•vŸE·Îá5¦Æ,Á\nôÕZTUv~¹R±³PïòCSîKác*j^?å¢q6C-J·þ™~—\rÏõ-1ÕÒÊYvÅÓó	¬,±n¢ñ_>›¹kØfa¬zï‚i–áHÕ¼À%…Ìª)TüKtOŠ¸\'Ø¸ZÅ\'ÅÞê~¹×‚žl€H\rŽmîãF#íKg¼y~~§Ð½ŽLÙ$Ãß\\ñ§éôc¨ùº‹æÐ8ƒ$ß]¾ñ»\nû¨eq(žâ÷&ºé}ày¯Ì§Àø–“ÃIüÚ€t´fkÒåÔE›‚Ý‚ñ\n«_”¥þF(3ÿ\0lFŽ§€þ©%½§Œgçá• Ä~ÉÍVst¿03wÄ8þÄÉüÿ\0*<ßâ‹9ûR˜Zåq¶ªå?Å‡Ñ=ô1CÛg¢óçáCA71¶“—•ƒQ‹é^œS¨4µÈîZ[è_¨w—†¼°³ƒÌüðKé~—.ØÄ³ø…t™áÊ}ÿ\0¦œ\"UÄ¾‰pcw+¿M0æT5³3&ã“0ÄxML§™ã¢«×f2`Š£+SˆþÌÆYŠæ†ò‹•]LË`;a­†¨|ÅÑÜ¾VÙ`ñ°éÕz†77IÕ¸]ˆ–+Ü&VH³\rC1œz£G®f1è}Z¹Ï¡¥Õÿ\0,K#èûË‡s*Y+ÐÜîq	uˆKÌ³3è“LÃ÷ãèµî‹ö`-Ë÷¬q\nˆ‹/ñáèÀ˜Å–®öœ«Îñ’Cí(L¨\08Î!T²0&Ør±å,0yº„­ªßŽHÒJ6¸\\2`bù³)÷@ŽåÖAaø„¢æ½¯³QßleA]=Ñç÷Û—Ö½ÿ\0™°G)ÔÏR¬öz±×¯‰G—ö0›Œ79Ô}§Ç§¥â<K‹JƒpÔñ.>ô´îs™Oq\r?ñ_Eò¸záeÓ&`vnQ¨þú/õð•™ŽµÏûkuÆnQCíY©EŒC@>È½ùF¢16‹ó<Ò!Kö›z457Y­!XV|ÊÃ!ZÞ?ê\ZÅ(:ÒQ.¼Ì ö¹„€™èj¡ ¢²†œ#í1ç™£´7Žà«W²]_™çÒóë³ÐÕ»ýÞƒÇ¨×3#s,K”}âC2‘,ö0}¥T¨Q¤ðep?7o>ˆŠÝSGxL=¿ëè¾Hý1ÑñS²j}¦\Zî½žQ\ZÏ>¥JŽ%ÉÜVÂÄEz>’¡„¤ìu7*Veÿ\0À|ñ4Ìöê®Næ\rOb>#Ø™¹_NÕœéÌ©¦A ’gˆ¢ŠI¬¢VnV±3\"rxò×.´ŠV{™S×÷?ô_%â_PIšg>!×Î ðÁø—8€[Ž¨‚«\ZÙ8µ<³&æïFxâkNCƒÜ6Áñ?ê{‰—¥›ê\r€ËÑh€¥%Àú×‡‡íVÚæXŽvQÞ\n×de>Y|ƒ±ß‰¿…›¿ž£`¥E¾Ç”]¾è7Sb/Sýhçï/ªVçsGí\0LHa3÷Œö,DC¨<\'òšçAÈÒ./âYFq¬ûøˆ¤XW÷ ~g/¹2Ì¿hÙ«Òÿ\01¨P6·y•í¼M‘Ç÷?ôSKµ+Gl7íG,Á@Ú’xè=+Ò½åŽý˜ô«siö›/µ63TùH–»BÌ´ÓwÜÑ^üpóÿ\0$4aªæ{Æi¹êq¸uÞ`dðFa¤Sâº½üL–¢5Â@ïÇÜÚî.c²WšMBšlùî,ìQg5sÄ7€w-Å^ãbþìg(Ë™ó´…¶r¾\"–ïV®ò¥_ôf~è¦ß´¤uü˜Ò¶±1èðiü&faå.#ºšCîÍ°|\"[ŒÞ}¼ÙÆ£üÓYæ‹¹»O=8ô7èåz$©s~—S7óE»¨Ôœô[fÁŒº:ÚbÂkaeÎRídçÐ£Í·¨EN\\­8Üc¶j™Õæ-ÇãuU,R8ñÚJuk”\"óí^q\0\ZÜÐ\"ÿ\0?èº³,\0=ûÆã[á–lŠÌó7Ù‰Ôù‹5¶[ð˜‰Û‚Ä+5Û™žT÷|Ï±)>ÙJ˜f199U?<JWv/áõ=/ÑÔ=½ISëFGÚ\08Ä(y™¨Ã¹Ôçða÷\0˜so‚rÿ\0	F˜„?n>wÌ8´ñ*ý€e/¢Ä,72ÙâjdMª\rD.06/\"Ì4~ŒZ†oû—G™¹‹=Á=]BýÌ\"ªÌj¼Âæ-ñ+Ä¨_ðÅ³ÄÚÉ‡§qRæ˜Œ¹—2ŒÔUŒ°LÏÕý¥Ë–Ë›!¯[­ÇÓ^ˆ€Ñ1÷à9\'ŠÁzˆ–7]œ2Â—™î•‰8Œµˆ™•y‹Ý`j:Ûd·Du\nX¤fà“xƒT?¶`}…,\n”.Öæ9šÞŸá-D\ZÅü«¥âP(¯‚Ð/A”Zœ¸xj9¹?2ÅjÝ‰4ŽãÒßæ*Ê=Èì©Ä¼KKÞŒ¨{‰.c×D¤\"bUAô´|fä5‰ïé´Ó8¹íµ“²\':Yœcî˜ €‘,ÃÖÑÛø—ú‚nê Žž+šŠè^nåŽÏ:!	aÎ)c_z)üÜ¶AÑmÑ¨Ò•Éé*5Á†¾ŒŒnf‘˜ˆxô™SSƒùÅl9Tî!]i\"ùÑB¥¤-‰–ÔýÆæw¾e…Ð½\'!$pFØ³¦Oõ+¢Ú²nSMlÊÉ¦†8GãàXñh<ÞéIA˜á™lÜ¶j®Û%úÝK˜}‘Ìa\r“qãÃúœŒY,šÛ=ªáùqá#>Uî<šÅ©„”Î]Åõ‘Û „ÒØš—%d#xzñ	¾ÙH/ð›>Ðtn²Š3Oï’…džåÌŸòÿ\0œG.\\óràæ}Æ•„¿ˆ}NOÔlÝ ô´žàß¨ê2Çá.vªlîså=Åˆ?´ˆrÒ?™|ÍÕ@ú«æf6¤±X¬Ly&IÙwNc/ÝUcyÌèß9ŒoZ‹ÀÆ\ržÆ	Ÿs;˜»ÕB¡ÖÙß·0ËÕœÊ›œú\\¼ÇÒåãÌOaÌXkQÖ¥„Væ¡VÎSÿ\0P \'Ä÷y~å=å6LÔ2Ýˆð£‹J~b|ôk0ÞIK‘#’/ò\\3™D>Çêw€ØdËª`»q¯iLrkJ?Ò`£ëÁ,¬…ãMêy™~!ôeÕÒ¨¸Ì¸ó0_:–<Cê5ùŒÛK—2a™G2½J­\\D]Àxœ#¤ñ†%JZeÞŽz‰~¹ÿ\0‚gÓìGê<c§ö˜Eâ\\GŒ+—½ÞH‰G]ù&µVÃä?2YcN½T{\Zåó<f¿x£ü[”ÆB”d•Ém <1‰@ÜÄµ›³‚7/¨àpÎÿ\0¹”ÁSeJßž»®ã4^€¤hå+¢tÊý\rõÒS‚Ë³,w;¤Š»ŠÈŽnV&ûÌ”FPe~ŒºOÀá&‘—,ŒºérÄ(>ˆ&u”î&1œË¥x„‹#(+ÕŒg—LÜ¨F1OãŠÌûKÕì/×0ŽÏqÌU¬åšTMruWÜ+Š+ÉAÌ\\cs\ràÎâ…¢•%ž6TÌý=0&Pô™xJ°ÔRtDÄGN>g½Lêax”µ\Z$µ¬2…Oã^£srå8°?3<q­P¦±w(Så>Z?ƒ#”=Œ\Z~:U[ßÛ¬½Übsd¡QÀGS—˜Å©Ï­Ë†#ˆäŽ&Zú\Z¾áAØ3/^%Ã„Z·„á|`‚§*€‘,ÚÖÄôQ}Ó `íß¿øfl	ý’£æ8@<J±O0àÌöôºú+<ßü¥Íá§åŽœ©Bà<!ÑÌƒnkÒÿ\0ãÌ§,Gdù› øD6_	ÿ\0OA?¯:ßã8aÓ{1¦ez\\²æÆd”Aý?õGJ¼•ÌÀ¨Œ‹\r<»–nSÔiÖa¦áÐ{ÁöÊûN]Áø3Iö#¬‰cPqM÷(Jq;%rºWvÃŠ]×§ïÖþ†ÏŸ²qˆ­^Z:Ÿj-GðX =ö!óó„—òÆ¯æfÜ>}Héøgèœ#ñu~sï_Ùr¯ñÌÝ§»Šm>Q£´ûÏ%>`mþt«Cò‹í\nýŸû\'ïmå]{½?SI²³ùX=eøe\"ß‘°zìá=†zs+Y$ƒäÜrr+(?hí)2f.aç0¶\'æ¹Ü»Tècª	,©è”A	só¢Äy\'‘¿þþŒË<¨.”´U1D£<À™®â¦&‹ÐåWRš¨tzTMBŽ%ÅãsqV$£Z\"ËóRƒ˜qRª™¥)žg\rc†súà%Õºt&ö ·ŠåE#õX‹\rÅUãŽ}¤•wŒ}¥K¦fó©r‰YŒ¹w5/¡Ã,îfysÌlÕÌ‰†s±«Zæ#Yâq.lKìŽCS2äž~ßƒèÌòŠ~!$GÊô`³”«–Ô±Ýzy‹˜c2ý¸5/1˜…n\\Ô¾0bùJ\0Mo?1ï¦Ú‰•„î¦|Æ”£ •ÛšS(sJˆÂ2¯pêsJÔöÄXO#Mi\0[H—†c*$Çèö •îLwßEJÌC3!J¦M¾ƒ6ÿ\0£/}Ôº4\Z|Æûö€<J7ƒ0üúg~–Ü©RæÈ±8›}PÜcJjª\'ÞdøJ÷ÄoVÄ\nBk¶Á²\rµ#—8|ÆHòê¡\0ªé›7:}‚á”U1rü‚öV\"sžÄ°zºý{vaÃXß¥J·J˜‘&¾¥D©iRLÆ¹Èœ{†‡¼¤wÏü¡2Ôö£Œ’ÕÖ°4æš&&ý&=-¸9ô¹~‹EÌÔ`—#woÔ¶Ê¾©¾o†X2teŠêÊÉpé(<MS‘(q; ž\"f+v®f\"gVåË™òG¤ÏÞÂ\06c)y5µøˆêü·’¤‰Pj_ ŽG²Qa/¹ˆIoKè(´q>	ø=/cF¹bôŸ˜‚yÒ][öCüKè\"ñÍå1âe³<ÍNgâôq/\Z‹f KôQ	¸<\r!¦Dc¶™‡H]¤Ý2C\Z>€*÷·ÏÊ\nÜó¦pÐXJêXQ\Zªœ*¥p‡C\\\Zÿ\04A›.fÅ;Ä ±è7ìLÚü\0œž éDªŠØ ½ð@Þ:R`AÊâL°^&*©TU‰Ú%!säÅnâé•“;¿)]óa<?ú>ŒÏæ_÷ñŒd¾a¶=VÔt%y˜>ƒ_Ä)HL¦$¹¬ÍÁëQžÐS?˜ãGÒ—è/ôQÄëxîq¬Û+N90|Ï†\Z”,¾X£î(ÛÄ-Ž_á3Û¡ºY®Ô	Uxû¥¬Íª¶sóŒ{àÉ²ã¸°/c,Àöµ]‰äûÂÚXZª‹Ù÷™Lã”H©äàO\0ñôf}ûÞA_\nš&ô*%»ÌLêjC~ƒêLˆ»àüAï@Å-´žÇàú­£HÃ\rE^LÆß 4\"ÕAi@ËJ„Aï*Úg/áô.m™ñ/ŸÅ1à–ÕÀ:\'PAF!ó3 ×¬Ë)w]ûJ(žž2¢–i—˜T¸™Tw›Òz™Y{|Ë­ùÜ·ËpOC$-Ä\0§Ð+2‡8…so‰—ÉAù‚ÇÑ˜£$7Œ+|Â³\ZÊ1wSjœ\ZŽYôG¿AêC$µ•­E…¿$qý±´ð¥‹ËÊN×\rYSç;\\½²ŒpDº¹ØÈƒÊ}Æ\\º%Røˆ6™>`ntšÔ±š—ÐP»Ú`Ø¸àJEÑÚâ\rÖ3Åó¨&éáµŽ£5eš–Üe÷\\Çò$Æe.Œ×rÜßÇÔ¢¢¸Gµ)NB|Ê+1j\ZI|lÊõ+(Eýà¼Á4WA3\08•ä0ª2Të²>ŒË‹Oè›`´22Õ:®@4eýÊŽ%z[ÀŒ)âxm¯>‚ƒžÞc\'ËaÓœ‡¢f 0G«<œOCÖJm?jY¶ ¡¢\\™3x	bêØ%æ¬À\rsíã“ñÜ”tÁkÒ–øXæSïû¨\r]oŒÀ²%–bgV¢±jò,­ÔÖU£wá\'šÈöÄÀ_)cªê>ÐZ©âLE/^…©pÿ\0ˆú<Iú¢Ý¹Ü¡:=»Hi6‚§	yô-ê$\02§p¹1J<#Ø\nÄ¨_à™ñ\r@¿¾Y»\nñ2ü¥Y¥†ØI%*y‹R‹]›9µšHK…ïÀ÷ƒ@²—FdàÅ©`Tª@`cýâàø$Û–¬TåI~«r®çÌk:ý\0º¦OAEÍß%	¡äå*\'8€2R<K+×â7’\\X½ê\"-œŸ™¯¨Õ{%82,3ê3›¹¹¥ÓŠôGã	§Ñìâ J×¡u•Âf[#˜ýâA*½sgÜ7=…ÔA—/F_{¨àB½ÅÕW˜øì—	¼òeƒ…#Äsb\noÃ\00Â•.-¨Ÿl…Y@JöH~zï£å…EFîf¹\rÅxÄ1_xKur8ŸoÓýW¤û\"‡ì… ¿yLö/„R.+Sb`j¡ì”ß‹)‹‹z¸ÂJÞ]‡§	}Ì`þÈ9yŸ/Ã\r}‰åÿ\0Ó	xÇ0Šæ‘­¼@,WÂn¢©SÞ€˜RÙ6Ì ŽÔE\0ö9ÎrW	Š‡WIò—8¼?vháæ`Þöö‰ªB9ÄèËh…g—Å°a.TR^Ñ\rŸxÑö—uÌö\'9› ¨~ã&¦@ðâ4-xè‹h>;ûJ·h¸všÆUÉsa¬×F©–³ªÀÈu#`VM7+\r•eþ›SSr3¬ÍüLæ°)	ÄÍ*CÙˆÝ¾–~ÔtÚ\'ü«(®Úeƒ$£Åèÿ\0âÎ\"Zª²`ñopò…QQÓ²£‰šDâ$ðŒüÆ½£í¾Ñ)ë<¦>²gº£I\0Ô€eø i}+\"dèðÊ9açìEðÔ˜6D:¨aˆÝûGHÍZ/H‡59D¸1\ZŒÂqáô,Ë\0ßx%\\ºº†“ÊèôTŠôFé~1eªûH-F€X< M,)Ed¤¦0èimíêYÜŒ¼ÇÅe:Ú\n—Ù1ã£;›,ÌÉÌ&±tÌ-tK¤OøB`³ñ<Wû#È‹Þ¥í|ºÛSWÅ~¦ƒ¶9Ý{¨€ZwòÍžM«Ä<´=ãDc(Ì¢Z&Íâ/v·:øG÷(köRÆõQùð.ÿ\0U<öw-ƒè­Í„´\\Þ¹* <îZq\n›ßëÆ}¡áiŒ,ðÓrîå§†Pâ	KÁã9QÕóIºï¶\\ZÀt<‡Â\náÛ²·qªIŽáÒ_4‚¥É¿º˜ÙáÌÛ’ÞòÒeÄ©«P†¾¶Ø‡À%}F¨[÷”w7:\róÜ÷–>ÛÄVí!¤3rÌ9m‘ßî\\R¸>ÈI°	)æ+™| «®˜ŒÛ\"¯\\Åš­†vEa;Œ³Ø”%¡~P­}ÊO‚\Zb‡ø\'˜¿¸Åâ²h?ã<½uØ–Œ¹pŽ†€€_±1:×sLcX>\'gŸÓì”Cf<34àˆ¦¡Ä\'-³[TŠÐ%Û˜$4tø˜3Ü ¡2úYæ[mGÇîáä ¿ížÆs=ò ÇÑÙŽîÐ*Xz¡Úy Ne¬¹$J\nSÛ0ÜÚ¸#eyÏÞÒô\\Tt—OqJX ŽP|ÔV	ÄÁžÅ±¯±:¿_Í\0ÔjkE=£Ž2Å\'AjXžñ¼¶€Od‚+ÌFŠX¤KäPrçFJw9Á¶â+Y›XQú—‡vLY\0s¹l(\0»æî*A|&@néö…xâ)hÌÕ/¨S\" üT¼nÙœ]Ã}Ù>ŽÃä?œzi—rî\r@Ìw-µ×J¹—ä07/CoÞ%·â\0n¼½¸GÁ6™ËÉNEg¥o3ï)|R9˜TÏ™@~å&X|ÃvÏ~VX+âdC.\0lÅ˜e5_‰¦Œ¥iŠ;‹#­+m¾;’µS>Ð‹ÏK¹K´ÃTx½„™ýÓT à¶d˜žÜæ©CS2\\‹0¬¬—ÅäØê\rÇ•¹V\Z%V=ˆÀú\'	ÊýA@XLzÎ™f”B79˜Â`Ä$mYaòÞHƒÐµ3.s\"ŸKöR]@ílìsE‘¸Œ˜Yø{#Òå 	|uÔ?\0‚\\Èü©Où‡E0-KSq®‚°³(J•¹¢”ßj„²36Úbáã©‚6º¹^lòÎ\n‚0Iš31l¬­ÜÂ¶^G$¡/1<\"ã§L@.V·Ws1@ :ôzmQü¿àÃè”ùÅúˆja´SP}â\\„¤\\FXÝuæHæ\n™¢\r`¯t¿C	›j†ýå¿å²³péˆº‚*¿¼¢Èn]Æ¹ÓnI]ð-$Væv¶ðÛÚ0*y—˜›ÐÜnÍ£¡…‰ja|N\nÀ¤±÷*ÍwuƒÉH›¼J2ûÒ`g-!€*ãkœL»Œ?æq‹Ä+¢¡ì…C%9Sƒ§Ú\rey?RœM2–sCùÊÁžf›ÎÝãRfó8¶¿Gü}Ÿþ¤ÜÖjm¸ú5Ñ¨òñÄJÙ©ä\nö™x»1±-œM\"PßÀ‰mèƒÌ,¤ª† â+= DCàêUj‘ª_Œ6¯º[;Øó5×$¨#­ÛRÆì6Áy¹L»z\"WF&X@u¤†ÏÞèÀhrH]ø¶©}à`ºŒµãV:j!ÛGd1´Bø˜æÜ¨qO¢&J·7¹*C†§¶¤qñá™9ô9XU¸ÒUÍ{š¹¹Ù¤ÔÄÚlªÄ¹ïšžÇ¥}õp1™s=ŸhÑ—~†;«´¨&RâYqlœ˜{2á§®w\\ÁR¸=Ê{†¹ÑJ+¤ªäícé—lÇ±ë•åŽGÂñï¸ŸäX|?RÉpÉµºŸŠ?Ê.˜u¸Ø“K 4% 1éJ²bØ^d!P‚yëôéœ/*†º/PÅàöJ‡‚WïG#Ä‚Þ‘¹¿Î{Í®ãå<ÌL©b¨Î^|B¶âZÂ¨.‚w~æ<8Cé·Kö}#¹~%C¨9¸p‘©1Ì\0fq†;iÀoƒ\0®í0ü%M¶0#¡ä`\Za®SSÝ^&#œè™êW. ôÛ^àIž µ¨hôçæ_Uº]†¼ÉÀ a…C„‡¼Ê&’Öàæ)œqÊd©Þs.eª™#3¬˜†|G¾áî¼ÛpBÃQ\0¬Ãæì‹\\f!É6ZÊgÚRHÛã;”\'/a†ój`£Bf¯’¦1sc¤Noýsñ!ô‹èÈ`bw…˜Ÿ‰A*áÍâŽ[¨çÝ’ü\\%«¹«†OE ùŠ¸+—”Ôx™Ì½iƒ$ð1ÊÛ,0›‰œ€t¨kò’ÜéÈF<D_Ò€jFFÊî^K3Á¨UÑ«ÒTÔÁ–,Af8¸±—Ü(˜W‰]¸	æg|†g)¡+_3L¿0Ã?©È¸ùÏx¼\"(EŒÉaN×.^=¦·¹„,èMü~fŸh}\"ú{ð—1Ãn Ëš+¶âéé”+Ü¯Ò:ÍÂ\0±©ãÉË5s1bôJBÛt\\\r¹B´Î®åÅ,B|åãÒ¤_Œä˜·Vy!Ù0A¥Ojç•ê0²žü™HãšÌd…8vÀ=ìNæNR‡9¥P\\½±œPNâBÔ´TÄ\rF\'#ÁÜwmû`D)\0¤¼1{\"Øš½§ÍËƒ+Ëà ¬sròÌz¥K[V0³ü3T>Ž‰D|ñÒŒKô­ÊF¹žøUÙ&s¦\Z`•Ï|	Po)Áä3MIä@u tÀ`8ngŠâPý¡¸‚.ØCWî<T\n*÷¢€¹K¢ˆJ—Á\\Fªˆ›àS±äÄ_µX~¦8:-ay\\‘t€³‘|2«š÷‰åpðÙ©Óboˆç–¦|¥¸É¹Á7aæ2¦T²àÌmRmÝ\\FµqÁh/–eÁH\\¤À8\'d³ž_Ìvû} |ŠçR±ô.†ËÖ™š˜oEª,o¸Œ¢6ì_²PRäk\'…\"Âó,bã½ÛuÄXâöpSÒ4{™.ÅÍðÃÜaÒ«ñè äŠ\r\'PX”ùÍq1%=nÃž†Õ¾Æ!æq›Ä6+2&<U¡áºhóÛËê…‡›£\r:$…sçDRÐ}£n”“‡–û–é¸DÛÌG|xÌÔw¢%Á‡D†\"ÖÉyÏÿ\0¾qB–¾»˜µ u˜cègŸ—âE=ã’b™Ë9ƒf#sÄÇÌ4š,1Ñ*¦tòôú©žFÂg!ë1m´,–¼BÅ¶¡áfÄo‰æð`\n—ÈË—”Â©²ã\"¥©K<~Ng\'ˆ5œ¯N=>*9fT\'í«ô\",®áèiÑÄcâ?B÷°ŸK‡¡\0;INf]gƒ	aÅspÀÇõ43z-\\BRâé£ÓK3¡²Ù\0ä	~Ï˜MvÉÁÔ ÕOlÇü¢3&b¿„º(nÆ/PÌG„\\âs\r‘Á1c™Ž\rw4à©¥ŒÓ±’™â‚	·R•TT1ÃÁ\r»–­ßˆ”\r kÞ5³Çê\'òêêeó…UWZ€ìô^¡è‡øJ‡¢é\0í–CžÆêû„Ä´U%‰¤&ü 	Ë]}æm èCAæ&UÒe/DÂPµ8ßDQDu-™RÀ™uz\nMŒ8Œ%H\\lF}Õ T?R­h[ž-†ò³+A>U¿f ª8†\\s€]%ÎŸAr…è²ë¢	‘3$í(É-2òˆ¦n9¡:$.t\"«˜U‹Âââ,1\nCX\'åTR5f“PCK:—vï%ýD0ÂÌG©n`ïûBf8—aï6‘¡3¾$8¹GOfÆ0m°ƒ\\­\0›T\ZY=¢7a—3˜á8!*ø™&c6˜Ic16‘·ÝâX‡}°y^Îå³O·¤03­Õ‰~ðL©ÔÈòÜZñÇï\n®‘§æ`B¬x€>ßIYnä¼KîkRúx3è&A·~ó¦.ÀAS³ÄCLm¥a„\\¼&X¤<E15r\\ƒ2ýÏk\\ºÕv¥LÎ>ª_[áÄ>]Jˆˆ«\ZÏ,!åìÎ-r±6 §CÑñJMOãâ£\'æ61šw:\ní<è}¦Ø[³™ÉÎe5ž?ÎsNåŒS-ÙüÐ»Ü–žìuIæµŠ‹Ð™Ý9aC>4Að¸ˆ+Îs‚¼¥šKê6`Û÷œ¢#ˆ\ZÌÇY¦nÞ×Þ+ø%÷¿â‡¥}ïÇüÀž(–]Ì1èã5%Ñ41=‘|RƒœPÇswN%Œ³è× Lä\n@qYÜ¯Ñ‘šXé„äËŽ¤_—´yŽÅ]”ÊBT×¿¢™¯,ZaAÌbgÖãì„6ìÊ;ùT\r/Ðrcò*EÍB4<*«ø‰›ÁœJýÝ2„<¹ùëÑÍ#¡Ÿè†ÌÜªš²f8í;R˜ÜÀÀ*XwVeÅðôê	H2¨zASGeDÅŸ¹¤ÌˆzœzqAºæRK@Ì9€•ðüÀ^ý(#x—Ô¬K3RÎÚK_œmC‡š[Oh\0îuß¾¿ÄÄëÝ%T!9ô±DqW^â™IÆO²!ÔZ+Yy£Ú¿Ùo»vÀ¬\ZôÆWi)@ÊAU«ÚEêéÇ\"Yß¤£Q×‰U÷\0&&VÙE	tñžD¯ÛL)ö§:%Eõ\r@>ù\'÷)N%ÄÐÑ4\'AÍC\"7\r¤\ZÑÄ%ÜOî%\rÇ©ÞE†-Ã¯hL†b¡oZLáî‘ƒ\rÙ¥Œ\0\'Do/ç¸\\°ê\n§XK…JË‘à€|J„`6Y÷XýÒ|ÃMedÅIR«¯i1áRå|Êˆ`—’Q|ÈúœÊpùH³W»\\“YjÏÌð@:Ï¤VG\n_H+é²x–Ï?Ü¸ø\"µî$åÁ‹>’ºŸ\"Ô¥)UHÖåîT{²µsnãóG$ð5ÛeLù½%)\'Ïn¸Ra$»5ìœ‘b*Ÿ™g@ñ)BÙzWÂlXÌ¡žåDóè‘Ìñ+‚)ÙÌ®¬Vì%813Ù1sWâ$Ë¨W‘\nj“Ú¦oI±¶çqÌn|½æ ¯Wgå¾­t¥ôïû€Üªø†Yø‘rw*¯0hÌÕ(4œœ­Bi«\"óÒã‘˜xn`b¿B‚ò§˜¼i†ý¬€Kº]¡Cc*ý”üÆ¡Ú\"G×“5rPPØ²ÊÜ\0¥NH[BÁ¹ŒPñq¸‰¡j6»!ìÖ+&®UY’iæ#;±˜B£™AJFšÝ1Êà]7œó^b¦·†®çþ}Zÿ\01ÑáÚ9ö\"À¸Œ2wÜJKÒ›W-‹FJÎ}oÏ5¥’÷˜¨–$í5X<ª+vÓÄ!\0á.Ú\ZÍÌDx½œÁt«¸4õÓu,1zt>€[ãK¶ôe3P}ð÷žÔÀ.™Õ¨Ö}+å0¼ªZ½EE¶Ç4J9%Kˆá_ø3Kú/?T_vXßh­™ø¢]@™D¾ ]73Ý…`™Ú0¸œ¡Ä4·˜,ÑJöeGvwŠeŸiY9œF6©{CÜ†5¸]ºŽ¥†Ù¨¬7‰Vm]lŸ‹ÐžZ€äŠÈ³U®ÁzbÞ±¥\r¶ª`ü¢_Ü=,k´]G²‹*$Ï@ ‰wÜ~…Ï%™7Ä)Ê¹ÄSyŽofaŽÛ£R×„k5©{§LÎ’¹—ù3ô~g…¿TÈù%‰ÜÅ¨dHËòEus)¨´n]g	¡Liˆ¦U1&ÇÛ1$ù-&(å¨ÕŸÄ—P-ÔRåî(M†ûŠçî!´F29<ÎÒ´Eäõ1ó=áÜ´sä{˜ nÎî-²$¬™ÁÀwˆeºsö†¨Û2¼G%jC/˜­`´DTú/0\\i¦r©ÃÔY´ðþ%˜p\Z¥t<³~ÇÎ\rW)æÓ\rÆÒú€ejÌE½ÌŒLi¬ËÙ%-Ç¿ßù3ô~geéd«nbñ/]ã¨{ÌØ,ƒõÒ•É!E¥Ëreß¼¶æµ1“úc™ËLPmùIT¼ÍIWiÖ\"jÚž™Oèá°&ù[*[Õû2­ºa Ã¢_‡T.aeÝÊÖß38c’pA\rTáiÆdq+AïXÁ/Ýíy†>‚ ¡Ï	x,µl‚º‰>Œœ¼Åoi˜žôüG²ùÃìpTlud¼¨J!Ùƒ5+rÄ¹ÜWÿ\0\0¯¡²ÿ\0uuƒç\"Ê÷7¹ÆEb\0j#-ÖçN§912–Md¹Ž2…\\È±XÆb¬(B.[Ð»qðéq’505˜&ÚH\\–Ýõ¨*w6ÐÉÀé”ïÍÊò2Ê\'ÌiÎ…•šD/vÙŒ‰|Ñj¯Ó”Èª«Ì»˜‚²‘¿30êd%Wd[’­7ÑäU¾SÚ^%Ëšô­Ô¡,JÖ—[PÎÔ¤Q˜#,Þ#¥™xx…b¢W‹ýýžÞ³ÚÄÍÅ7¨Y[x•]—ñF%0«\rAi{F`–-î<<zC™î‹Ð­ÝW÷)QÁ¦X<·+­îÐã°êS’	ìŸÀKr|<¯Ü\"®\nÇÓôŽ\Zk˜ß·™gº¥95>sýEm\\—*ÈÌ±™µß¢\r¢Ä7TWuAhp†×‚fu@~e\\¨úW£Q­:\"â©lmà”@Pb¡Ú¥Žå1ó™î€yŒ¶Žÿ\0ÝŸ£»˜^‚Z}Ê¨¸‹KRÛÔ\r3<ÎšŽh<ÄhØ+Û\\—5„u³{æ#°©Q«aì×ÒšfxÌ½l[&§©u¤%°ycÕd1Øâæ:¯½ÆÙ‹ÚÑ¾¥ÇÎ°j`¨nc5lÉï(àsßÜž¥ƒº‰Ã&ùMÎvú‚7Pè5–¸ÆFö\ZÜÏ2t„Éäe$â¬ÆÍß}/¥+]mÌ¿}gù_ˆ¬âÁ`!%—&º¾ãûÜ¨y1qD¸Ì>ú ço1Ù‡Ðo,Ï9ˆ\n‹©|42ï•ëdSÙ%Ïˆ¡e0p2¾%l\\ÏÚŽ—[\r©AUÄ·ô‹oˆ\"‰˜;ð•üTU|ajc]ÂC!üAWÅ*ƒ—r¯GOp+“.ÂdÖBTòA9&rßG8>÷‡•t\'ýqÑ>RÖ„g9ŽxŸ0ŸxâÅ„è­õÉˆ¬èãôužWçÌCIRPÄ §/S)6Jqq(n[©j“Mó\n«^ˆ·%U‹–¾c#®÷‘Æ0’¿\"Q	üJ‡Mƒ-„¡ÄjXa¹=Òg>A\n/¿8*ù¨ò¾Ä®0¨R–Ë*cšÖ³RÖjKúŽ²AŸs\rÆŽâùAvæ00e­EÝ[;fÂ\\ÃP«-cç³­\"\'“”ÔS0Bs¢>eìÆà:„+¬‹Àð ¼Í^¿ÖþˆÏfýãý#²Ì¥J’°î2‰yöPƒBÅúrL•*²µÌ¢¹™ª``YÇF3°0õ\nWpœ[b¯OØâ_üÆ3wÌ(\"]À!‰/x÷4rFÐç4ÃS\ngðD>Ñü1§w»–µÍø%\0>j]!dSÉµ8ˆübdë\"§Bƒ*¦LLé=Jc³¨ÅùI\Z×Ð BZn¿†¥Júý…±å%ÜÛéhÊS)¢KmæÈ¨Æ-¹1}G<Ð±Ì4ÙMË¢~š9¸òKhC°Æ¤†[ˆæLKí~À\'ôæ\nB\'všJS	`s-ƒnÙtd+™K¦¡PÊË[\\¢¤øc¸<<Êª_¨^ä lÎfXj(äÃr«±*	£t•Np[/)Àâ>\Z²­Áf\'>2¹ŒmÃ_l™–×Ìâ/çÐ†›¹Nÿ\0tCèçc£oYË5*/D¦,¹…§*k4s=ÊP»•³1GpÔ\0%JšÆ\nÃcÎ³<¿’ã³\"ÎüŠ\0?¿-d=TËçìóõôY½¨¤º¥ZáÚ(š™„¯,»”\0qÀ:c4;žœÍ,·q0jÁ:`¬ÇÄ¸Ë\\¢#aÊè’_(Yl2*¢\n€V˜-“á•ˆé´êâ-þ =Ó+þ5£3iÛðG$¥p8òŒ¶-œÊs2âi†rŽ3%X²¦ÂQEW¦@Ì¨Nìy”ñMÑÄ\ZàÊ´ý“R\n6[Z!nŒè—4³Ñ-\ZB·Ê÷3³\"ß+èƒxeŸÑNâ@G²Y×8™5¶\ZøþI–uÍ€@”¿S\04NªbDS^¦N˜!ÙÙVÓ<@[‚YIULîŠ›ˆáÜÂúûÃÒåý\r–2®R¬ñ[@¼ÊdÀ7€}‰d\rÓ’åøNª\ZéôÅ%j^57Ê5ü°ª¿Í+ööT2±V.;êE´J@¾Üø‡^€ã ~â,ªßBstA`¶qYaF¥R×î”\nþ÷Þ1ÈòÏ¢2Ôèžá<Z¤.ˆ¦%QU;m	E¤dC¬d1êÝ™—»Œ‚…Š\n9=øWÐÁlsjsÚàÁ¢÷,OdA·1<-}\n¸‹	™FÓ˜Y˜ê\Z˜(&f|’æHC=L/NóqqePÁ<âR´ õã)ª%ZIN>\"ôÏþúÀÏýÊšûîòI„ðÉè¹eËŠºˆ({Õ2M~e6GP¡â?OÜˆ\rL7y_¼ÁZpÔûaì“79¸ˆáTc)\0ó‘\\ÜoDÈ6Süp0+èÌ$¬€eQè1Äu—Ä °”5Q\r¶¢<×Y Øq(HpÊ›ÑÜ¿…«¨ÚTmˆ\rÆ`€ óQPÅ\\;Æý”\"Mµ3r“Ò¦n%;—iå-é¨w/{InùÙZjû¥È¬KÙ‚2ÌÐìe“s/1ûÜ\næ¡ã¾[¿ˆM*²aÏ÷ :^ÄXøÒ6ážÇ C‰f(ÂJzUVaty%ÄÅéiŠQ§\Z†›<ÃÒ?\ZLË¹çËÀäŽ•R‚a£Ü­b½oècöœÿ\0°Ð¢ÈŠÔc.50åN,•N8ñœ‰9<Ôæ‡×¤þfSOhP™ÅpdVÙÓèý<Â±°•©©ƒ™oO´1j÷v¢.¯ê…Æ‰¸R÷×†âóèøáj³*cÍ‰S™›å)j^{‰e|ÿ\0›‹-xû÷÷¤IºOÄ\'-ˆ¾&jY8CÇ3kÒ¿‰C(wñ*Eq\Z¸‘Ô)o8–bDjø™t²¸ÖYª—WFåæxƒÄ§gaŠÐ»ÕöAZ<£äm_òÉCu(NÓïPÅ¾yœ¬ØbTÃp™\'Ù)ã.MHÞö³\"Å¤Xª…\rÃÅ\nRýs.Ðªö—%NJ¨eØšì‚3Â0ï™±\":¹™µj4ò>gÊEg¢_n®œ5Ï—•õé®a3>höN¶yà€rš&¯ë“O™Á™\0ŠLðI‚Y÷‰ïÐ…r‘¿2ÈÎ%-Mð›b!)J—Æã,Kc÷¥¼ú9b\rEÃs˜ÉÄ|DÕz‰G†\"ù£Ê%Ä×Ì±ÓÃÙæ#Ú= \ZË[ÁSÀcyÌXT¬Ne¼Ûœ^/©T<DÌ\rüËT¼£iw\0eˆ}ÀNU^b´´<™%FG¢nn\\Ìoé–_HŒ[¹Ÿ21†«#6	ïÌø P6BõdXN½£¿µº—a¶DSø$Qéµg“sf}5\\ÎÔaã¼Ë3‰5*£«ô—Ü²ÍÉ¡Dòj}È„Xå\rµä™ÖÍrÿ\0¸©ˆkè\n.Ò\'v.|k—«Âd` cW6³¢³0»Ì;çÄê?+±0+wŽoNš¸Ú:_t0Ôml8Ž-Äu.e” RÔTF‘¨ÌÄNåNåe×@ÂE]¸3¶IîW˜µ@°˜”}\rz…žFv£w¦deÂ,Ã1Ç¥Ë€Ù\r*_Ó¸òêdOæa\n—HÁi”6 ×J¾Òèj+€¹_a]üÏ0×ÐY,áVçË°@¼Åz*6ÜÄæùr•pC¹Ü@×p52âYY–J6\'›ˆÇ8„’¹ÓîÆ]‡¡y-]P¯™I;˜–s)zg7î{è^ÎJ[+nôq2DV#õÅ-ª7lºâMs’£ZP—|ÖdGâì)¨9ò%Bn§¥Ç[•FæŒ‘.ßr–ñ\Z]À;Gg e}SÙgÜ„Y¿0aù—U¾’\n”L\Z¬®¢ä¬`^ªÚ†¾€êr€ð{b­8 †y‡”¡*	s¹(|Î±ïœ\n0¢Æ‹Ó0&Tª^IÈPå™]¿}x€z³‘/´n:^£D¡LB0ÚÍêc€jdDÃƒJÚÙ%\n‘;+ÎcSØ- )X4\Z†Û-„¼Þhc‚‡GQPSK»\r!AÚwK¬fmEcu©È_\rH YöÈÍ(W¸-vœAj¬Æh®&5ž_hÆVÅ©Õ÷†&Å™w³™çÆ£·QÓeÂpÌûM¢dÒû™`DVÜÜ¢á[~`[¹S˜+[·ÚÌ¡C˜Š—tÑyð)•\Z¤Î˜u`ÄÞ9J8Dª¸Â¦Q%}\'‘Š¯ìeôØ‡È¾j!¨kè*NÆ_­íbOjsÈ|‘,Z4A€v„8ƒ(ò†s7Ã;ôåH².ä˜4ËþÐôKQŸzË-«=¥;t	¸!<É‰H;‹LuçV”’•Ú_,5U\n»ÂòšÄ¶#XaÕmÉEE£\rL5VÜâTÀò£p¢32ºÌËôM9Öe…«âÐTžCLÝæf@ö@¤I¾³N-:–Ÿxˆrbmÿ\0¶ÝçHa^!¤8%“hæ/£ó,—(£»z$PdùL¦y8…@¹ÓüÈ¦_´PŸäJÄCâR«ö„·yœÝ++ìJZ5â\n>…R¦SÙ+Ñ<ñÀž4ñ¢œbßÑ“ÿ\0Yþ™ÿ\0?ó¥¿×þ™gôÅ?®+ý3ÿ\0æÏü	Ÿøcÿ\0O?ñçþÿ\0Ãÿ\0LÒ}¹ ûpþ³þ¹ ûsN\'<t¥z=\r·Ê›o·6_n]ÍßÙ›ß³þ˜´ÏôWôÃúþ‰–Léb¿Ç(hoÄÃ‰0•ÿ\0ñWÿ\0+—ÿ\0ÿ\0ó¿[—ë^‡ÿ\0ÿÚ\0\0\0\0\0\0óÏ<óÏ(Ö´\'ú˜J;¾\"¯ƒ7ÿ\0¥{ÂnØº”×…<óÏ<óÏ<óÏ<ò¯“2¦°}²é3óÖÜÒa\\ˆÓá*¼y@SÏ<óÏ<óÏ<óÏ(ç¥a\"™[VÉ1;êÒÿ\0‡hBÚ)˜E<óÏ<óÏ<óÏ<ò‹­ˆ¸_œƒ=]ÚÅ\n×—éç’t¼¼7ÛäSÏ<óÏ<óÏ<óÏ({z¢a\0ÂÂH\Z$ŒbôñôeÝ:3ø.Õ<óÏ<óÏ<óÏ<òÏ®›%˜£[\0.$æ?Ô1{yG_¸å®„[xSÏ<óÏ<óÏ<óÏ(.,àrXÃËí%g•Ù÷hcåp\nrÜÁ…<óÏ<óÏ<óÏ<óÀè6Ê±Œ®~âCÃíkT[?¼¾åøôSÏ<óÏ<óÏ<óÏ8™¥§¼+õ!ˆ€ÅÞÄùD¢kyRO;U<E<óÏ<óÏ<óÏ<óÏ·_LÂý>™[=­\nt™Õ©`“ydSÏ<óÏ<óÏ<óÏ<PT—(Í¨4\n\0é¶Ž»À¤T¨b`nó¿%<óÏ<óÏ<óÏ<óÀ8Ýf¾¯=3ÍwëÝWKã@mÙò+Ñ;WÜSÏ<óÏ<óÏ<óÏ<SVy˜»\nýûzR\n3e¥‰¤å¬laJÄhÅ<óÏ<óÏ<óÏ<óÅ7ÞnüèÀ‚˜ƒD¸g£pL˜£œ­&IŒxSÏ<óÏ<óÏ<óÏ<Pô~Kâx³êVæðÝµ»HP7Æ\0ð¿w%<óÏ<óÏ<óÏ<ò€((µTGþy¢s_¾Ã‹gwG(q±Ðý®hSÏ<óÏ<óÏ<óÏ,i-³ÍR©;†8Í|vÎÀ”½„ø›+F‡<óÏ<óÏ<óÏ<ó:hšÂbZˆûçM÷Þ\\›ÄôœëjÌSÏ<óÏ<óÏ<óÏ(`ôòsl•Ë¡…Òm{XÊŠSÈmýFK<óÏ<óÏ<óÏ<ó„!Êw¬cúàÃˆ’C\\@Ÿ´ls\0aYŒ(SÏ<óÏ<óÏ<óÏ8]Y©¦euó\'áá*\nÈ‚þ®hÂE<óÏ<óÏ<óÏ<ò€c\'–È\rÀŠ3ídîœ‘Üh,W‚GÅP€SÏ<óÏ<óÏ<óÏ<uˆDXBÏÚ™bÜ+w°½õÎ–Ø:3E<óÏ<óÏ<óÏ<óÄ.z»ÊU«Õêrüÿ\0Aÿ\09`Ki SÏ<óÏ<óÏ<óÏ,R}üh½$–.©O¦\Zz=j*¨hQYr|&E<óÏ<óÏ<óÏ<óÄw€é:€orqŒàY³‡mÎMÖ\0;Ú sÏ<óÏ<óÏ<óÏ8\\¾ÁŽÒ¦B®OÁ·ŠåÀ±n<»\Zã2<óÏ<óÏ<óÏ<ò€!R4öáÍ~>W+¸;Weo J,kÔåŒ€SÏ<óÏ<óÏ<óÏ( …ä9($\'U—ÊŸÄ[+cdÁá=ªÿ\0³E<óÏ<óÏ<óÏ<òÜ³x\ZÂŽËýÌ•#p½Úþ$½˜SÏ<óÏ<óÏ<óÏ(Dw·£KGÅºðÄ«qô7É9žCò£<óÏ<óÏ<óÏ<ò‚ãÏ/ŒO7’#ßÝDç‚u\'(ˆ3 jíàSÏ<óÏ<óÏ<óÏ(R‡ž[Õ8~¢\"næx]xƒ¬=ß_ìÚÕ\0<óÏ<óÏ<óÏ<òŒ\0Ø’ÆÓ)\\^ìè‚#‚@¥Zÿ\0ño*n°sÏ<óÏ<óÏ<óÏ(êµà)#Ké’™1ËæºÀ¨ïAi\"…<óÏ<óÏ<óÏ<ò‡8e£“ñ˜¿¯^\00\0õr¨;²hüÜÎPSÏ<óÏ<óÏ<óÏ(°cª/¡šï±9¥n;}ƒR	Ý^÷Š$¸E<óÏ<óÏ<óÏ<ò\'0´†‰ÇX±êò,ÊãÒqaK8»ÏæïÐsÏ<óÏ<óÏ<óÏ(—¿:<tâ˜w= 3ù\\åN…ã[1pôú…<óÏ<óÏ<óÏ<òˆ13%A€P¡ÁÙ¸o¾„EçWÇ°,B8ÀSÏ<óÏ<óÏ<óÏ(”yM_‡²*úóRÑÿ\0½âïJh8~lCj¹<óÏ<óÏ<óÏ<òˆ“1åÌiŠ>œ»W9;KØzJnM\nêœSÏ<óÏ<óÏ<óÏ(¢Î°*Ž²ÁšÇ`…J\rŒ×ÿ\0ùxq´M<óÏ<óÏ<óÏ<ò€7=ªô«|GUýcié‹ƒù‘ö7)šX\0ÓÏ<óÏ<óÏ<óÏ(¼4T_[ÐxËûuÅÕF[çNÏ@Ñcˆ8xE<óÏ<óÏ<óÏ<ò†+­S-¢\nDßdMN-5¹k·ð®¾4sÏ<óÏ<óÏ<óÏ(°ª&SçhLµXüv$üåÝò×…%tŸ˜u<óÏ<óÏ<óÏ<ò‹ÐSTxò¹5ô\"CŠFÎ‰Ü~ûµ9àsÏ<óÏ<óÏ<óÏ(*âtô¸c$¸¼¥TE`	¤ñ5ñû—^âf<óÏ<óÏ<óÏ<òˆ 1‹Œ ÂÜê£¦·6™\rVÆ:Ñ\0SÏ<óÏ<ÿÄ\0&\0\0\0\0\0\0!1A@Qaq‘ ¡±Á0ñÿÚ\0?ÿ\0Áë™Br˜Ï-°¦ì.†çé¼ü››	rtÆA}	Äö§–á²8R\r€ZyÆ#w°N½fVÆ”ä>Ë²\\ßw<›„ãÅÓ`Éß‹·}À°ð“YzF°¼»jÙ$2¾†ŒñtÒX[9‡æç.Œ¡Ë‹öOÅ¾ã¬Û¦Øí‡Ó§p\'.\'Žbo\ZÛÍÀÛ•ÏÍž›±é›ÍªeÔaÜ–qgÔ.Ñ‡Ádü¾É#ÅÛq#$ž#†F-dÝó)pù¸‘gL$H9éÙŽ;„´³Ñp÷Y8^=4ók¶_—Ù\r¨à¶¢Úšþ¨ñ?Õ¹º¾ôçÞ3ÅGÌ¾ÜÊ¥ò÷Ô×Ñð¯ ‘òç_¨ì«ÈcÌág(Û·êà5iÐÊyQØPÜ/Ôâ1ì{.\níƒÝ„ÛF¡¿ñR[»!Ô}-|ZøŸÌ\0Á¹\nä´9x¸µ71Ð3¦êÏÃõ!\0f\\lûöOLùãÏ§ã×ñ±&ë©q83‹àô\\ Î%ïé¶HBr¬!üàÜÐ@áâa4é˜¼Lšxë-‚Ë,ç²bÝ¼ßâ“æ¸yæuîÁsä±ì³¥Îí-Ã¶zï‰ÝeçÔK|q!àÎ6vÜu+Šs$aTeˆátâÉìýYæÒÖ×ê\\šÝãâÛq‘.Œè…ó+;=ØM²ßLö‘˜˜§ePåç¹’F2æ9]?\\Ù†÷2×Ï.¢À3û°ùÂ×Lxþ=˜\'L¾.JÜ…Lùß}Ì-¹ÄOÝ4åËt[#ÒQ˜=i‘)õ†Æˆ˜¶AÃ$Xšâm;5ªFg¡Ý—;4ß×³\rŸRiæÉMa.,{_d|¶-¦ÂO/âŸŽ	Ô‹Ÿõ*`ÏÄEÅîÃ‚u7¦|Ëy]ýÁüþàÞÛEøö}‡âBä?}ÐKY–Nœä†’È“Þ[?‰	Õ‡Á#GhSo6¾g{‹rÓÓ8ôÏiJ¥æºê6x·žgD<dSZø‡A-7ø\Z^u³M˜¡\0]’ÿ\0!Œ?\r×Öþ ¹_«ÂÖ Ç…ìÇô“,ÿ\0–8\0ƒ1°õé~w<¶^d>cŸ7kÎ·þ+ƒ]ã^rO2ÿ\0›þ¼0}å9õeÜ@ýCçþY[’3I‡Ú}x£»üÇ¦xHw2ðƒÜ=Ùyæ.úí–lÑœw	Ÿ0\'Äø¨;Aû&DLÎíó%ÙGÅÀÚ³«)ï³ó%Ž;ÉÏ4!ÏX^¤ôæ:–RÑ$·}[úÞ.f\0úm¾GòÄ®oÇ‹Ê?iãn2áà\0#¦LFŸgÕùô	+ñ)÷ßˆð@\r¯0ÖYxOˆ‰Ã-\r»¹é?¥.rF=Â´ÆKñ3¥‡‚z³„-Û¹o¿f4J¯0IHó\0$áÔKäÛcÓkÖsˆ2?‰Åõq_‰‘óy²LXXH,ÀÝbL-¡÷pÞÌwn1³)òLjÇýØð­žF…î<ðÝ«ÙüdÞmÅ8\'q‰o2Í‡ñÏ¢Œ1:#…ö˜³S	òaçÐÍò¥zŸ‹ÕŒù¼…÷D†Õ#Î—²¬lÜ1:–x-2ÌŠáo²ÌÏ#žÍ\\À„x’¸Ù_@ŸLõ—xBp Cçd5Ú0Â+—€)ÜË8sˆL~àE±ÄÜyºƒ}Ã-Öàý{1¥qÉDd÷èßDÛ2wÛ7C.76x!€îu>UåÎÿ\0ÉýrÏ:ÞS¹Ç~îIÇ±«CüÚXè†‚¾½˜ßÅ&uC}\\EÛ	ÔiÜh!‘YšÚ<ÆÈ tw=svVÃˆ£T~f%ç«†	Èwù´eâd?šà}˜ßÁ\'ypg¯Eæ\'¿%†òË/Õ›:eÌmsÛ=N`ÆB^»\0Ü¸[Ió?Ë“gk>#/!a—*Ý«&\ZwCÙÿ\0JF	vI–ApÌ)³Ñõ—ËÜ3[te³¼ÜN’­´Ïõ`e,x7&:\ràj÷5ƒ‰àr\\Ëè°ådÛ‡F’a÷ÏúÓß-u4å¨Åg­~	ºND\'XóÛ™3.\'Ïïg@ÔCý1ÐÂöÃðÆk˜sü°q¼1¶-ûÛ(×Q\Z!-¯’‰öœ„m2Ï‰Ù9ø¹<LÃ‹¹‡«½ÄÜÛòŒ~^qv°ðì¤4:Š·\'{Z_\\FÆœüŒKdò3.ÿ\0¸Eñ.°æâF‡áè%-—¸IöŒƒä+ˆœ§ÅãvNO68ál.u‡ƒ€µ§è>b~wsFlÿ\0ð‚äí³+#Â)ÌWÊñõÒKáÄníBó\ZrÁ–+;ÏÚñŸx	`|ôÄ3Ü&N[áarQ±F1‘1å/<&;3€»Ùò¶ŽÎD[GSC¥Àêqå¹æòúv·&¯µê;ŽúNþŒ\"!NH•ðMDw‹i0tÏOß™&xø6\0î[©ÉÕ¹ð„läÁ ó\" C ¼ˆ¸Öø¦®X$ÀO_ÛWÉ¥ÉË«ç‡q™Ç\Z²ÛëôÀüIÏË€Ô¦³é°cVZ[ø’6¤fî.#‹uÓjûS£:“†ZÛhãÄfíbù\\X@È°ÏÁ(Ùàên©<31¶|XóG–Æ]Y“¸n¬tG^Øld*G7‹œQ¶vàll¤Ò¼ëa6ÐÜ«îC±sá²0,˜§D®°¤ùÌ‰È´·ˆÅÖ\\@º/µJ ò3Ä»kq\r¸ÃGñ4X~àxƒ‹zoRYg£õ;‡Ü!¼£uîÂAò[ñ§`äCcÚì²ÇI[Ìd|\"äÀÒƒîØÄäÎU<Ø¨EË\0v[N}B—Æ>SŽ—Ú4qÕä\'€8ü!ùŒ=âllS‡^×“Yè~áÏ¦Ìjî\\ÊÁÈŠ¬ã=Ë»I«Åðƒ]úqö’*yæãQâÎWdz\'´\\ÒÂÙú;˜3¯·É!„ŒºO,l‡\rƒÝ‡6ï¨¶:s8À/£koÝ}¬ #é&ëÈ®åÚÖzBñË@ñüîÐ‰Û*¬}ràÞƒ:ä€6Òßâà3Gí·[$¦03`òAC^e­-¹Føæ0ø%ÆN=W8w}\0•×¡<CÄN›Ž.»ŽeÉ\0­ËÌá´6Ziß,mÉ#Ô=’Â2ÛÍÉm<2Œ,!…¦ Ÿ˜^¤ñ˜#«tÃlÝp‚/pw_D´¢S‚F“åÏú>S‹CˆqÄ›¢HÏ3@[)7#™¬]“ðº¯+­eŒ8&ÁÖÝ¯WI×£x‘AèdrRæ8ý§}É’ñuä€ÉÙ‘‡,¢ñ8kç•ä8•ßr4Ž@‚\Zõx‘,>áwÓ8Ùd—†îM³ÐF	£ü{EŠÏ0lEÁžK[o‘óf4Š\0x´pZw,¼6µêÉgM^#2òµ\'6CX™ \"vŠXÊNO1ÏñfñXƒ&ºÃdô+N=.\\lŒw)¤¹yãÆôqsP|IüKG¸x„lÎfús(ùX®±Î3Pr`q´|O¸\'¡ØdñÌ\ræs¹ò¸J<L1±Jâ±áææ\'pæiz#á¼¶[„âZÑƒ-©g)§ƒ%¹§o´L#Ü-æZïKD\0²ÓdæúJô³&f·Ì˜PàæÛym,‘ÔWZydæ:Ûp±g£–Gæ4ãn½@4ö\\„ãeLŒ.6Å\r€w¨–Ý-ð±yHŸ‚bS¶ ª!œF;›g9iæ5<ìË _EˆÄYÇÅ»Ž­²üz‡ò¼Ê}EÈØq¤jäã»ë”µÑˆsÃliò‡ÄþV½OX°^AnBò\\¼Ywq\'%²Ð\'±É]V7ÜO‰/Å=9}sðÁ\"zn^g>´Gš®®«‰Ä(i\râçÏý„1£À€ì•ñx‹€K7ƒ‹\'c9ËÇ³ë#rÞÙž›ë¾›ë¬óßñË}rÂËný3ÿ\0?ÿÄ\0\'\0\0\0\0\0\0!1AQa‘@q¡Á±Ñá 0ÿÚ\0?ÿ\0ðýAQôÉ{]¯Ù³ps\\û8v\\x_íÃ¿ó°ê&ÙÞ¿©à/Õ‡—ÕÑ?¨Fêé•Ë€þÉ:Ìx¤Ž?Ââ½qÑ?ýÂghï›|™?(ŽHà?j±ö,X¾P^,ö„ŒË6ë¢àË¾.lÅ§d´;ÆÙÕÝ„á\'·Ö6ïo‘¸YiïcÃ ããðŽ‚ì=‰²ß‹ù~—Áaã-é&ú\"¼zNÚÙ2@yŸ‹œ”^¤=Ø<A·æçÜ¾bÓÌ:á »û~9zÒ‡µ“ýíûß¼b3èÜ…\\[ééeÌ²<ÛèÉç©GQÉÄà\\@Iö¬9Éa}ŸÂxß6‹ãÑú`wâAÿ\0a#ÿ\0amÜ±¸¼¯¸½ï¾Ãþûƒý–öì·ô€5õ,{ú§úú†”cöxý×…û®›ìŽ\'Þ\':gúK ÿ\0íÞ&£ö]„}’øÏÙÄŸÒë×ô/ö€´lŽÂF/ÒôÓü¬%ûb?µð¿qí3óÇeñÿ\0›ä}Øxœ5\'öÃ¿²ÝÏÙé¥¼³=Fg\\ü3;¶3%š2äPÿ\0¸í¶?oýÙþ²cÿ\0sÊ~æ{‰þ±¶¬ü=´ö Òe{™f|¥mÒ÷Ÿú·ÿ\0Í_ã\n¸?PþO¨Ï³ê}óê÷gÔ`\Z_I“ê³<ß%”»Ûó’{À»öÁÃ!ÄDÇ±ât}=’nöÏóøÏÚYÿ\0t#Ä5þØ?Èœº‘qrNé–ý&ÃÔnõ²éø.½N„­”œ6ËÌáf[@Ð¼o=\\³jÏþÂÛ®î’÷øLüzX¿\"?n~‘_f\0\n„J÷žfùÎq6#6Æü],O“²Ä-çuÈGyŽg¬{æYìÃy$CÓ~`j²Â‚å¬?sÓ¥æóVò„¶ˆêÈ=ûü&[ý.¯sf_àÿ\0‰pénàgý^Ãü¤YÉýËˆ?rÅëwïêó~«&}‹ùŒ×õ»ç×èåÖ³ÀÍùÄŸ®ç´òeÅ°ËÞAŽŒ&¡!Jƒ¼S÷_‡Äøg¼¶€|CÄ;±ñsà>{¼A’ó¯Ók©wZ/c.þð¹R~¿ùÑ²¦~×où,ZÏÜoqæülo;÷w“þ$wOë7Áÿ\07\rþ	Ëý¹“î pÕÂ¾c…þ;•%8fmÇ½‘cßÜ‚§^\']\\g1‰1÷½ýHˆ6?DËŒŒuaä».ìTÛ«ûü4~tuŽÜÙ</Eví¯‚ÆÜ-ïmÅšÿ\0”—`Î-óÌžO×™ùßSÐm×\'ÉO4OíÍ€û±77Æ€å?wÂû‹t~­ûü>ei#ù±Úó7Éâ#Ù›o×ÐÆÒÔÅÎs?¦P^f¸Û	&.Îž×\'¡0Ÿ]Ê\0ýOyÄ+îçî*Û‡;$åJù¹ÁcfŠ[šYãùü<¿œù˜~–XRGkÂÓy¼=Óô]#õw¤‘¿¨ã«»=qG2æ‹tê)Ë>ð@ÕŽFf\\˜æ\Z_Úìïci>(?RÍÂÀþ.›rßŽ\\í\nj½ÉUxóhá»äy!>§¯ÙgMJÇR\'Ïé¸ÝÞöÝ©ÓšûÉÜ¾–éåá4„–¿	ü>Løƒ›?Õ.‹0Ü÷V	Ý$Ù\\±H)©¯£ÿ\0Ïÿ\0\"sÍæù–òv„OhgrÖÞd‡$¶ýI¼ú[ƒãðûQ\0°ÎHc-­ó8b{‰Eèú“Ë\ZŸ3Ô£¹å}Ë?³ {gd+ÔžöIífmú‡ááŸ‰ž/1ú-iérl:[r²;cäÀ`»ÿ\0çy—Ø­Yã˜ä{¤t	m—²xÕÂ`GPWfâRqypom§óü5‘†â¼Î~¹¬˜\"¸ƒ<‡rXôÑð2Gw%ÔCB‹¹âÙ¤.q\rËÄ>Øñ¤®¨Xt@l—áêNáâÏ›K›¯K Ó7Œ\Zc_‰ÜßÒPqðÉ#•™Ç\rå”$|ŸDßCãaD¾#‰a¶ƒçðÖ¿›’j>¹èzˆ\\%w	r:O&É/§Ú0ðNýÄðìáÆ¼X\ZÃÄ\'W)Ô=ìzéó±\'Å-/á¬ý°ìOVÙëÕç-t\\¤À9ÖÀ?-ñïiÜ#<‡žþcG‡V ï<À‰·Úê@Áá4ç¸÷˜é˜ÂFÂ[‰k\râüÀ°óg2á™fsuR[ø‰°)³§TWêY¨¼^-É;Kâë6crè ÝŽÑŸ¥ËmM„Ü°ˆûO+øåBnH[‘×ªl.CÅÜK¤µß¾ ˜³Ê\'H>ms(]‚ŽËf“vù³•ñ™µ=¡US\0  ZZX²k¿Ãÿ\0:0B>ä\'|Ãœ]vY\"ÜÏ¼Ž9! ƒÌÖwžDó,Õm•©]Ù;IÐ÷‘¯rqªÅ2\0vÊ.:&\r”ó6×ó1ø|d÷Úuå`„EÉ¼äÉ×>ž-°B$z°{ÖÇMÄ÷d6À`DŽöçGV,xÉ–„SœL!ÉyP<Ï?;žÒæ$VMS¿.y!ÄHÝ‘ÂäçŒîÓÞnI¡\\Ä—ðãðIà€Œ‘Ê.~%hŠ÷¸Ê	^#š`5¤?‡óåM·@ã9™cj_7NÄAsSsJef#§Ý$‹4‘¸ñÒ2q\'Çq®®–fÁ­ék›`õxòÇ¦L=Ãø§“:™ >gÛ@J\0J8—„i`6O\Zwr\0Îlq·FÑû\'\"S#¹‰CÓØ¶ÎlÇ_‰!Îá#Ë|Y2A°uˆB×¥ˆN‰@Y4Ü]În|¸,´p.Ne°\r^&ž[?hÛÈ¸Ìž0\'Plx‚1#ðþ.¤ô!Ùbaá—éœ†[Èø˜B›zoõ‘t„Âè\r¤\"ºÙÞq+c˜çð‡E¶`®ŽÉ7À~¶ëdF\r’ó{1¯˜‘Ù²n¶8ÉbxdW½ÿ\0õ6×\"¬{Æåw2ìVm¯£|\ZÇb>þ‘\0a1‚O¥³6\rü` A†C8±ež˜uÄA­Á|ÂaêsMkV¸.¦¶}57WàMXû_öØlƒ§Óºò„ù ö”K©±ìl;ø~c„ö°D±3ÜÙ—\n)¡Þ ¤›]^$x¥¶¸gòœ`A¤.ß>ÒäßŠcõ}À`Ý\"W[ÊmÏ‚3aÞKûŸŠM†sipp¼¹Í’¦(˜#3žtJ¹Ÿ2öLf‚\rO3¼ÒF‘ÉicRî„éå|¾Q«[|,¹q?³ñ<Ã 2\"W0ô\nrFß[mì·sÌSauèBqãÐã›“ðƒH|FÜï7ÕŸZNrØÛQØV÷Gáœ‹`Å&6“µdLk&²Øp?sox—	¼IÜæ#Œs7vc!àZ)Ë˜[lÏKvÛóº?p>l³âv-›Ü%)™yžQ™áâåæÑÜ$Ê÷Ó0™¼ÓçÂ!\râ ==N|@\";¹òµäƒàó¥ÄO,rÑ†4¾n%³œZÍHl=²X^w™dãG3¯˜2ùù»ë`HÂÊrNƒýËø}‰šOÏ×ps,èzpœàß˜x`¹ó‰F‡¼~ÇóCG‰ôe²ìKn°±7·3ÝñœÞ(GB“€Ôæ;“Ÿ‹=ê£1éC²o¶ÏDgqà¶X~?ßé&Â¬ r²÷`lC\\úOqèM·«÷{,NBÍÂÉ¼Û¬—9W‰_W‹z¾pd€æäIÛ‰:r?ôhÄC´u&ú7	»ZZsÐƒ¼ÝS™w)ÓÏîÇvM!úJðž‰„×<¤…Éô±aþÏÄ5½‰³›“zŒlBÚ2‰¥niŒ>`¹~Æ¼Ny×W0uo‚hâÉ¹q”!°zÜÐ(TmŸ¼n¿àBHá,8‡;´³Y3fÝ™âäY,]¶ì¼²Ì8€¬ýº¤§t|„2çPñ¾‚€˜Âõå¸3.}$¶8àâ:XÃ¯ùGáê7¹lšEŒ¶[²Ï;¶>{õ’ò[X»rb_9Cr/÷ÃüêÊ¿ÃÃG‹üÂì²ñ<T«¤;bÙ€82F¦J<Ãhæ8þéˆæž>0îåžî±Ÿ/™.;†ñF&½Èq´Ž‚Ì\'—z…çvµöû !zOwÔ3,Û2p™Å²ú*Y[‚Ážb×ÔS¯6	‘\r$:²GAïÒåæÃÌ!Ë;’.XžÁ\'‚@œ’Îî­Ö½HvÜÀÏ•¹pdˆL-ÔpB Á0}·ÍË#½Ûy€÷mÄÃ\nZÎ½Ó·1ë0[½³k©]NÃ…»CkÄäNtHIò\"îÀjèð3<d]c±iö‰ãÙøûwauë¯¿¦³Ïwvze–zæuè)×¦ØXúÿÄ\0*\0\0\0\0!1AQaq‘¡±ÁÑ@Pðá ñ0ÿÚ\0\0?ÿ\0û±&æ¹Y_=ÆÓ¤Hï˜ç¯R±*y™*ÿ\0=ÃA•n’½ËÆáØË<Êêã—,-.ÿ\0C¥Ëý\\FeNeåy2Ð¹`ŠáÊ¥\n£¨´òˆ\'ÇrˆŒm’³˜ÛcD!ÚEÚ•+ß¨;qV~ú‚ëí\'ˆ‰oÚT/öžBbÒrYLB ä”=À÷6–\rJA:ƒdOy‚<æ—*óÌ.!þ{J¸.<67zBøm\'ÆMà´—…ˆ.ÜóÅÇ[8@œª©H˜Ü“Åð‚€ÏlñEÆâ}l@r¾_”ÎÌïÔ?ySý´O`ª©rZ›]­åt—Û•fà†‘Y9ô¥ÕÆ—ozPÌ³]õiÉLFãZ®Ì $Ê­8y}À]\ZSÿ\0\Z—#LKÅâ7.(ôÆá\nÐ¡ +áÜ~^—ÐBîV¡YòÊ	Žm\"1½ÉíL”¥t|Ê“¼”_Ã‚“¢†ñÛÅÁ•*ßC—â,ãK3o}g²‚Ëwz€–œ.3æÊ€¨øœI »š1opºV­Â8üFÎ\nØNÝãân¥CéŒ9Ii[Ç¸©VÑ•×Ì`ê®ç9Çpyñ »QˆÂŠZU•}Ç®Y~„†Õ£UÞiƒÆ ¨CÈHõê—ŽPŒ§4ÞÅf\r-JojósiLjw1Ï;˜È =;k¯L?jÒ/Ê?‹ÁÞuPLjäÓúLð6o:s˜®¢ˆv—‰}\0ðÞ·Q­h™o¤Î‚7à[ŠyQùb72µ,ƒ1Ø.¬å/ê\rË€£ü÷ô`P+.DÙjå™F¼àóõTÍµ!ãq÷p%Ú­âˆI€#Kãþ‹ÕüË2³Gï(]@•ÄuÉXVh¾ã»¦)Å1Ki=G9”í°0Ë#D‰Zk7©v6Áî{L#Ê\\¦ñÝÞb%Q¦Â5p:<ƒ¸£2m.aÀyn\"\0‹ã’\'\nÝÛSÓvûˆX=p…\0[ƒ,*À.!0¡«9ƒDíaÌhQ˜/r†ÒJßˆƒ×¨!CÏaä”¢Ñ¬¿¸Â†EXÍÐ(wL5ÐVÐÏâ‹)	XÆ!„u³ÉùŽ[tõÖàGeæ;e9(¸é¼‰{½ÒÌýM‡¼Wö ði¼ßø–RÇ­ ©	¥¼\Z+ï)„Á¼±ƒ…iÚ8\Z†!“ü÷D±›Ôeõ’ô³0¬Þ)ŸÞ&«o	/x€*Ñ¼yMv ,hù?¼ ƒ‡ºCnO‘ÄWxÎXoXÇSÖéD©ö´\nÚ=#¿G¸Œ~XkZ¨æ\"8Å\'™|ßÁÂ¯\'/ÝbXý„ <Àk¶°gÐ4Üw!^âîi.›•\\-ÕÌÀ#/êR¢µ»”¥6Ü\n*º‚¶WJ@‰SÖãÒq1,–éã)J>¢) ŒáœpÉ\'óP]P2ð!âqü}+òA.­«„gÍƒ=hô‰Cß*²xC[ã#²$<UÅ°0ï3¹0 æ(-ÉÌc°Î5\r±û•\nTÿ\0¡iþ{¨ê$`·ðÆ¼•§Ìj¥•j} é+/ø%#Ðn@èK‰­×7ÄÐ~CóµþgÊ![¶ý³\n³“æR:n¦þðu«‚~×nÉe	³›ê,¢vÚ -²ÿ\0	PÞòZ¿´¤–4‰üT¬¦U]~XŽ¼f\\*êX©œUÄ8Û\nl»ºÄÝ›usb¥Ü¼ÊrXñq{[Íê&ŠœÜ£¿¹q_*fnLÜ}LÐº‰ªtJ2¢õp›Š8ü|¬À&>!tvJ\nw(Ü¤¼Ÿ‰N’\nôKˆÅ,~ãðPˆ«xe´@|Á\r%{%	uB*ß*×»%å¹óU)# ñƒx—Óß0+Š«„\0x0ˆ-×kV Ð#³«]æà#¨küö.#VfžÄÔGŽV\\=FM…-jÔ¡}>6Å ¥_É2’àðZ…·É~eiº>pœÛ,©›£ópCð¶bzs$|=ä¦béÀäŸD¢Ó ‡ÕG<ÔÅšä¡ì¨ˆ1y¥~ÒÕGþÍD\"Ý5£ñ/°93¹%8aÜ9Ìz+¨q— ÷\"êþÔ\0Á÷r¨ÌeŠhûÜ7 ¶©€í—ï8=ÌMßLlnþa(qæã¨ÝÊ*”9ÔÄ¯Ç-÷Â†-KŠ	J7Ä×l9ƒm/*ýáJ}\0G×3˜–ûÄSVù+ŸÄ‰ìˆjlAX^y­gVJŒdåqtöd )1¸­‘rQ@ßÎ\nè‘D³Z¡ýÂ‹¥ÎqEú`K¦I›m¶\'Æ\"Ê»Ã¨õ•>Ä|Â:š cØ»ÈS÷†q\rr¡ˆÕŽI)†(~åí…“‡ÄÍ•»¿eõ•½Ÿ±‹høý\\Ù!ÊÄüÀ,Áª³á¹š“ö +LvIöÇŠ	ü“?˜C„áY}±î¡ìXKBØÊ~¿Ú2+ZÎaAç¨(Ž \"ŽN!U^ ƒgÄÍ\\cgù‘£ ;™¨”ti©À:5‰Jh>b˜(z¸X \'1BÅ=F%òqz–HˆZ²``%–ì…H.Äª·~3\ZWp(neðC^€!¼áä\\óí¸\'•\"˜q9†•*`ÖñHKjW†ÑsÖ`ÀTYfa×%ÀsYKÖ+ÄeOâÀW4þáŠYJyfð¯ìkX|æ?Pp0¦¢ÛèfQ†OóØä‚èËE…Ù*SU­ÎpÓRôü™8Ê‰•§ÜÛ_hŠÄxU©»‹F*ôåˆ!Ìn´£Í0Èk,K‹²ûBøSââ•7˜åç2‚‚¾\"‚—*;…ÊßÌ\nÔ¶ñ¸4! ½Â×Ç™uÝ¦P£ÍÊbŽÅÍôî¾XÀWB8`•g<ÅŠSÁl+¶6\nÛUD¥UYÌÈš7ËÎs\0T‹ãP=ÜHŸ¸ÖJð¦ˆN¯4ßplˆêÈ\\»OìE\r¦.(¤Žˆ \"‡(„»Ç÷\nZ\\ä©†P÷x*®t–¥y©ÉTç‡û•ËüJ™T}¬€åYºa’wÙçÌ}0Y+”°AÁ#œmLNã˜ký¨oé»í\Z¥²ž–â\"òó57æ`ã˜Æ›”9–‚ï¨`ˆPÐÔ¥ÞÂ#ËÄpZZ’˜\0®jQiÄskb0•³7W˜ì	²Ò|ÆÊÍÌA‡Ì4bi%T0q¡‚I˜¯0¬+\\JÁ)¨Fzp3`eWqŒ+MJF‹n^¦Î#µÅuÝäó\Z\\(&@DA|Î˜;Œª90÷4ª+$¹BD4zìÌØ-Çå¸8·Ë%W”±½æd¨heó}›,BŒ·Èx˜}ªˆTè¨«t&•·rŠ¯Ø»Ô\nöî:òGü÷\rKa“üö3¾ðÅm_ãø‹È’ÕÂ%·Ä¶ÍM>gk\0jîÁüÊ#ä•ýÅ\nÌE«7ÉýÁe/Oö—õUž1ýÆÌÙ0Ørna÷ýÒíìˆ»(…êþ¿÷‰gÙûÄÁ¯ÿ\0X&-Çü±jÿ\0ë™ÜG_Ù|ø¿´ÂÛOÄÅÓwíFFáIj7ÿ\0dÂÿ\0Çóáf‡íœmH•g•²óºL(o4ØÌ ß²YØ ™fðÓ85ëÿ\0Y8D†IôÄŒÓüKœÖ/™ÏÑÕ0‚µê\\i°ˆ’ìuã¡‡ÂK^\\°–Ê\ZÒ&‘[´IjV[bË«ÒOBEÜYFKÅ»ÃeÂ‡íÐ.ñýå5*PE\ny«®>áMìA”uô\ZLü€Âè~Ó\r¾f°:YCz­¿P\n®¥Uèå‚Xð<š|Áö=\'N\ZlLõÏD•Á8mý§øFNUáh‡¯·t\nSßJ;Œ*¬Ù\n ð/ï)‹|ÿ\0t¶õ©þèa[¿ý¥„‰ÝUùˆYù0åß…€«3\'Ú\0ø -ŠÛð_0ÁXD)Ñ8¨¬R©ÀD\r!Å~è™hãü²Ï ÕOVG|²cõ5æ|\0G06ÂÁkî[’Õ†FqPÀõ.LC60üÌ¬…\r¥#%ö\\q-=T™:|5´;þˆT\rÇÿ\0”2{þ‰JqWüb5°¿ãˆ¥ÍŸø%º>¬O&úB}3ú&ù¼D\0^^ÁüM€â=Š€Xàþc‚¡ìD€?Ïé4†¿Ð!òTÀœ¢ñ ­8õ/ÖIj‹-:ŒÏ+¢Ê\r~ñ°§ÜWÔ·Pò6]g/3\'9eÖ¹î0V3O¨áXP\00Ìó‚i^`t­{”ú‹bØµc^!ï> †¸Ž‘Q1CœÙp\0\\>®Á^¢8>¡­SêÒýBŠ õø>K–)«Ý@)3u8B‘—¦®*×…}<Êm²ê.ŒaPšáÚ<:¶ŽE…¾é™Àî Š)ußÓz¯™hÖ7\ru*1`š¸ýù!ý“Ì+/Ýhõ³ñqŸö¸¢Tv/\0%ÕCìˆ\"w£Ò´zjsY‰ì,\rn.ŒÀnÄ‹àˆ¢Ü0f,õòAm=Wñ1©Ç÷3_èXê=ˆ\'”´:†Û6˜/U.ØÈáŽËÅ¤ñ±U…ñ%‹ìA@Bœ…>Ï/0ªÓˆ¸\nîS¨ÚÑàbãözqîæî9P$ÚÊ@òƒ+»üPˆ=+Ñ\Zèqdx¨…áy–ÕÐï3\n³°\Zu‡iL+qž00\rÀ¯3rø‚òJ…/8»‰Ì¨üoHÓ)‘ÒWÎ*7sL:Àù‡”pÚ¿‚žÜÂšÓÎþ¡\n“¢˜#~A&ˆÄ\"“ÊÍ$¿Rt¯‡:·-ä®nêäFGG!:{¶ÙUº‹NÌb‚¬®k-b/6ôƒ‹ñ\nÖ”€ÇÛ÷Ð+ùâ$¹{CÝJV›ö%‘CS$q)ò@½bô\\¨4<h¡AËÏôM#‚\Zÿ\0A¤WŸF[OåÌ|ÎbÕ½±T_¨¾NˆËiü£.\"Ím!è‚m¦\Z‹€[X[-•JB4.RÙaTˆìÊÖ¨vˆ\'\"Kàt\nHeñ’>eKÍD¡•ƒÇ&Ñ¹Íå‚â;uÔ×©—h&ÝC¡ÛÉ7ôiœÖµf{€­êóíj{cû­A¥œ@¥7\r¦woBÿ\0_q±-Cwsïð€AL\n<oxBˆ†X­ø¨®…E¿‰s-’‚^ýÂ„€XµsóRƒÚœÙÑ\rK‹’tÜ­‚ð xaZ\0(ëœÁ®|ë6püb.#M–ùÁöÀ’dRþX»ŽÈÍ{#ùØ?Ú0d‘oÿ\0É×qN\Z¦¼MÕ–ý8\n4_Ÿõ6¨æ\Zÿ\0@äaÅEŒKJq\0ÞÌ¤#.eÒ¸”.…˜\n–­/ÜÍW’êØ\rN%Gu.Œt ˆ4V´q’Ó©÷Š’µ(ªõ0\'DMxê1îÜ\'â|F«7<Êçæ1C&ø—!­n™fB˜jƒP®ätN%ë¼ïQYrÏ©G?PhèÅR¢ùP…e=K<OsÇÄpá1•³QƒµE}¬ I¶	Ö3îié¢­ûæÔT)jüÃ=ÆFîý~gQôÀ©õ*l\0½×‰w´¢®ïHî<0\r\0?ˆå³‚¼ýË:X¨Õí/ØùH6ß´¹û†¬[©†žÍöîô¯=ŸÊ}°ŽÝîL¬C	ÌÀ´Ôv2½¤½™±üÉßè u5bŒ)AWÌ?WR‹\'æv¦¦Ð_\0rÜ0Þô?Ì(PÙÜT¥Q¼KKîXîoˆàñ+ÜGY¦à¼ì²}©M ‘ËŽìŠ¨\0,î$HP)N[_ÄhÊa@¡L®ayÅe\n*ú‚ žMÆñvÀQÛÔìÐLy±÷-+SÅ÷JVàæŽ7ˆ²´%ð\\PX—–+Ü²Ãu%}Â\nG6¸BQØíâXc3\\K¼<j;Ì´?B«R§FMž’µoZ”±#¸˜Ply™Â^cqølÇéV«Ç›O‰Cd\nþaxÃ­¦ºî8c•UÆÕöEŒ¤¦‘l<\rCäòbâYTWÞâ:ð‰\0,r|ÊÉCÁc> ‹tƒ ]ôÃ‰eÒÞUñrÞÁk¼rÆ%ÁŽeFŒ~œfnl8:ah…/mâPUq‡EyÉ­„\'ÔŒu\r fdÐAgÒZB¨†š›Ô»nf*Q\0ÍñüJAy£š,2Õ¬@7\"¸mL•Î\'R(;™G˜V´,‡ñ\Z•¯ìB?Õå…bæó<6ÕT]à#¡ãPÿ\0ª :gD¯=Â’CuÊ\0ã7â!&ÉêÁl²´%ë¦ƒE0ú[F—CÅk©T\0´²µw”æ	T+XqÄmG27Íf. M¶Ín>~®\r?Ü¼Ü¬SHî¬”ËXQ­µy>`dN>c\ro1pcº©£VÄ«tJŠ¸v›[WÆ15Œj,YÑ˜¥,¥Üçàû&Âé‰ÌGÖÆLss©Ôƒ+«û 5\0WÆæ¿-rÂUnÕkÑ†bÍ >å+6Êöí,h»¡¼½––ë½—Z­«³Ì“haÞ3°´Œúº¨~´XAeJ^2‹´.b=xºÜ¼aóûÒéyÓÜ]q/œØø¦%$úXK¨6 u µoÙK«7tÂàñ¬Op1˜Ý…Um»Èþ%7B¡	›*I˜C‰ƒÜ\n`ZÄ\rÌ/,ódÇÕÄ\'½Ö ¥éÈ\\dË³‡áÇâÚ#…|´m¥‘€dkU«J¿˜5Jä­|âfA&qhF”+P2,hp™âr4-NÕ©^õÅ¦¶Eß+S=˜Jš˜¨L\Z•e`±+ïQö¡v5\0Îjó=¢ÞEú—1sºG+þxç(]Ìâ@}cæ÷¨¼€RÃÄ6/	{Ö!NÑwªÜÁÌ#hµµ™pL¿UÒB™“Õ•Z¢peç‚¾â	Êâû¾åW1¥C¿qÜNEçZêÅí$›h»îá~u+î˜ßc\0ÝÈ,w¦V“ZcxÌ8`§ VÓc/«âà¦<äA8¬«\'\\BÍ-• \'ÅÊMŸ\r£Ÿ,gH–3	eÆÓžÂ6=Xý@b9†¿Ð)t„ÖCÓ/lAGqkŠ=L¡‡!÷qü…÷r{Ä;-Û‡g©^„ ê•îjQz—©*a=@ÖÙåp1Åæ	aq-\n÷Üs“âmâg´<±ªak»€®î3E7qxëQ°?h#Ñ±GqÁÄÁŒƒV÷)„rVý?ÄÏ,^¤€Km#Ò©mÏsez#ÞVŒðI¥\0;M×%|G¯WÞMŸÂ $\ZC·Ä¤k\0)Î|.9 .29/íþ€û˜’-ì<FZ‰.×˜ïvU·oÈF´~5Eö™b´ˆ?**€–Å)=6€‚•iòjUbšš¾ˆ8¼W`¿0SÅzûm¨VUÑ%×~ˆ¿8î•Úcm ”ÚW ¾hCý ÚßÀn6ì‡HòˆW	ëÍùG¦¾g‘þc’¦E¼ÁjÜÄGê3w€–GÌK˜ê	ƒÄ³ÄŠ\Z†Ug˜-[u¦ñH³àÊú•MÀ[»Ê‹Î]ðoˆ|rlÉ¾¦L¬_ŸÓÅë$³¨æÜ@¦Í¯¼#T§z¨%kÅÿ\0ÌÖ\'çAï/Ü³lP3\0lÉp¤‘°JîÉîÆýUÓ½Âì%¯I¼¨|\'–ý¤iT´¦EÖÉH\Z0É\\{iËÊ¡e3\rÆE@Ûjâß©UÕgP%\'ªŠ\"­NK+Š«&ð{f–W5œÜ±s \0eÁ**ˆ–U«”ëKfS¨8éZ	yhù‚Ô/L¼ü\\ouqÅ;|¶¨kxÅöÃØMm†l;¨›k$7@¸†¿Ð1©[šûEQCêà»™\"9³âQ—˜ãh‚ºú™Œ±úBåÆÃ¨¡™2¬r`ÆÀ|Lb\'¹Fª[®bÌÎãMb¢PÖnPVf¢µEÝ‚ —}ÂA¡ÔE’±ú9s-h©xœÿ\0FÅ8•µÃeò­£¬JBÐ¢ü4é05aª½óÜbƒ×¥”ƒ€‡þs0-”$á3W¨\r™œ¥;cÃÚÚóƒ¹Yë,9]Æâ¿Þ+¹w»Á/»8Pz¢:«nââ-ï“îÜo‡ø#ŠwÎµü1–\'‚ËûÀƒ’¿ÜRSTþå^Oùæ9MõËó_¨»&\\Æ ui„/›Êþ¿]?Ð:Ž˜´ö±…BVç%Ç\r6s\0ÁŠssEä>¡\0!èë=ÇF±ûGwì$Ç´ËQÂˆ4;.^¿)Y±Â|Lu	_ÚRFmà%”[XÉ©BŸ6@ì ·ü¨û¸x€\'Üv—Ù\\~°69FPÛziÎUÄêÌ±×ÜUS8ðEÜAÄ¶Ù´1nî\r7÷bÈ`†”I |ðÁQã/æifûs\'‹G>@!Î7Áü%èG‚ý‰3Yl2âÕ¾W÷œs«˜B‡„³^»hvÊ®töˆ­Pšðƒ\0*æÒÝa\n§äD¡óš—äùN¹b){0!ŠWî‹þb\"CýÑáöï:€…%Ô`±Q®V\0ÛUÝ€(1ü\"*/ú”âi[Ú±)puAZ½Cg¨2ÖQ­> 6ØÜMY \r¸6tÄ\\4AÖSÒù Š»¿1K…¸œ-#«`<Áîy\"s§\nåW€¶RˆÌÜJéR*èðÇ\0ÄT4BŠx´Wâ3àl\05ž µý1,ñTP_\\4ñ\0h–»¬ø‰[Z)ÓÊ.Äo¹–àjÈ­EÛˆ‚ÃœÜBË\ZVJ\09Ç˜‘ü&ú\\¿0æÿ\0”Ê£_Á¿ô,LÌüÄLÉ;F£:óÄZâ)³ÕõÊŽßH)¸y¥Rô1roÔ£0z‹sR kXâªcfö#@§MîvÍƒpÀÀ´1-7ÃÓ»ÞGÜ02B¥ÿ\0¼Â1«+9¥Ü¿Ï-Áâ^ÀFˆmÔ Ýfcœ7`¬ÁœDs3€^¨`ý£¿0Ôåû\"Wo™LcÒ&TÊ‘ïÏ™f·-]³5ËU™GÆØÚ¸åƒ™c˜!)cqsRÎnR¨æ\0S™™Z˜ÂUÞ:™oÄX6F‡ƒA-jÔ‡‰‘UœËˆÍ”<Ã¡G€þ•þ…Œÿ\0Ê\rÁ.Wsæ-É›ŽÙÅÃk+˜Ï†ã¹‰†0t™×˜éÄÓâþ¦œüû«öúŠ¸45ÅÓIxŒÀ¬L\n¢:ñQÀ—Ž8õcàmÑ[5(ÄÔR0çƒNXäŽ`ëÅ¸\nã˜÷‰¥ÐC(~h€S2Û³@´|\\¸˜ØY=`ê­ÅJÚ4kˆ…£\\fÌZRµû¥¯gŒñ¦¦ŒÚhê(˜p7‘°ø¸*¥MÇ;ÀÌÁŽ¤hå—U¢ÉPmHèÇË\Z¾»î\'’X1Hà»\\5RîŽ^áC9ÐÄÙvKämÄ©†b+cUs\rt‰¶±]J*°¤CêP@Qz”0ÂU Tz9ˆ‘Î>õ<`„\Z–Ã_èYÞ•>þ\"ÍØîL…sw2¬\r\Z˜\0öÌ|-2÷,Ç€ˆ%U•ÁpTú²¶­”Ä&òL*ReG…èÆ!öH_Ä¿­Ê_©àŸØK‡¸!;°^‰a×ý¥gæ)U„‡Êí€Œ <‰L\\àíºÛW%d’_í(k;¤–²œ0’&tçñ-\"@’aÍ(*6VYƒUóX•Ñ@Md˜ÂÝÛX/î+Ö‡*bÒ›Œ&’í³Ä`+µê< ×? Â®	eUE·Öe¿m Þå‚†\"†ãEeˆ/òœÊN4Hå¿å‹á8ˆsDl^jfÕÏ¨´}¯a†fo{vÉ¯˜mèåÄË_\\ÄBy¸Ñ‘^â ¯W+»65nè_lº?Âsúèy•Ÿòr´Z„c\\0ÿ\0ÙXyÎ2C~²ó5øpœ†S¸(ÕMóXÌ8„É×qVã³3bïK:”´]òÇ+æ\\0ßq£\\²àÇ2ñ[ø™_ˆ¥ë¨KÉ;MÔ ÙQÄá¬xƒ|ÄÜÀ\'èª[ˆ‡¬Î,‚°×Ú€,±SD €¾!TW­ËEPòÅKå%À¨ëû#v‡ÀŒSßõ)°6ÁÆç‡pEÖ¸–ƒuuãî ´(b³2`à.0Â?¶\Z´¦lùŒX*u\n¡Ò„NÙL&¯/™¡m F·Ú±pTç¿H+þìßègý1uã>QŒ\0ÀäÌ*1B\\¼ËŠ©bmp’YE+¶þ^	‘ÅA«[&\r˜ð‰Ãúl•©žc0Ò¼BW/1ûW™Åt›Ž-¯ÍùS ö€á 	U\03L8…Dê\0Ý‡†ÚÖ\0š\\û‚$\0à–î’‡$J7âahæ2ò~\'Y¢‰|)#HóNØ8àà	·u¨,·É½Uop“Ò\0ó\rkšJEØ‹}Æ%µivµzT^ ¦\0!òàßâÁÎF6@›`2“i‹(ÙÜ\Z/rEÈüC:£EP:.¾˜óGˆ7ÒÄ\"¾º£îVíÔ-\0§-³]KCE¹2E—•[îw\n\Zè°(¬lÈ\"ñêºJ©PhTQ–X»ŒN{ŠxpÆ¢¡ÊW\0²ù¤Òÿ\0ª!C_èXhèˆàÊù`Ùs&ÈV\"êK+j_Ì\0®„}KÈÂ\ró™JÔP*¢¨:Š–©ì+Š„LJ0Ã)eVƒîSíðˆ\rµî¤ï¬A©Gˆ~Â8>%YŠh”•»²Ä¡7*˜3\\Jî\nÙÄ´‚±¥iÁ÷æy‚\\5(N	AøaeÍSÄ?o§ÈG\rU¼…¬¬0öQƒ&OÉë¥ž×L*w\"¬.–˜–î÷ñµúc\n[@¬x¨Ö+tM‰~Ê¿19M\Zç8¢]h_pOqOØ&œÁ˜¥góÜöf­Þæn%Ö>ng1‹. j4Aœ\\\07X5çwá\rÉˆEÄ5þ…â{š‚Nž½Ã[Ä«=ÃYÄòÀ4UŒ¹¤@±\\Á§3iù5	°<\'ó>ëŸî—·žºƒ_õ¸c•èÄìá³êñË_úÜT5ÊWó(<s5ùJ¡Å@p©JÂ¡æ7¢c˜1âªQ1*ÕQÁ*«ÊâH¶UíòVÈ2åv	°ð\0UT¾±3$K=‡;Ä[­4%ÙàQz™‹mFÁÅOŠáÊáJ¹e1j[ñ8LšêYµù—€\r¦`VOI›ÈC Šv—¥N*ØhpÙ¶W¶\n¶+qQêÝ3VÄ·N`º÷q(-ÞHhú?´%\\?Ð_è,<D¹\"£Ê!Ã•ŸŠDsÄ¨ÀŒ¦Â˜™ÝÒÌÎW	.’péOŸ¡„ò‰n‹‰!.3ŸG2ú½ïIrûIú”)µÌ|(3—ÓSS*Jƒ‚8 tìø„¥Eí½«’ˆä‰8‚Ö¢ú€]Åx3ªý\r11ˆ–íÄA¬Â£•2ŒØ¨c‚^m\\UF¹3¶’â”|“ˆ”˜ˆ”zÞIq²íñ73ÕåêÛ{P°\r\r´àXøM‹·ð{ˆPµt4u+jB)6C\'ÃÉêåöG\0\\L¯R—Oïå†•€£1› ˜B(‡a7Œ œí`æç°3újÄB¡YAøD\Z1ÜÇV(¿?hQu[ž/æ<¢ýŽ\r×Q)~Žxè„îèt¼v‰|¢Œòušï€­¤@%@Îa¡¢ñ\rfóÔÀµ*6RhêSKWK‚™DMJ³AŠðf\rÜ5–²Rzœ¼M,¨_ÒÉJq,jlE—p+`º*\'\"ðãÄ»vDq¯¸…Œ=€).qñ^9v°Y9„‚Ì«™ŠÇ%Î û›án†b•¾**]¼ÀRãÄJ5”Ïýõ3&í„=ºŒ¹<îú-óWó©^pNÆ‹îb\rÆª\ZeK\\Œ4OÐÿ\0=ÿ\0â‰p9yÞcu´jê\r‘Ìèc¨6UÓPÍu	7pÃÎçäWÅÊJ€àðKÌë’Qå5WWjUÑYÞÞ¥MLD.‘‚PÒ…üŸ™™t˜÷ZÒprúB¥ÙuU}ÏK+ßq,)¬3!À÷õ\"0(­ÎL\0v_èQÜÊ	‚STfcg=KCM÷J©r.¡šš™£”1LBAíŠú”\0_1(­¦™Ð\"dÍw\ZÎy^¥ÚãahXw26 ð…C­üÄä9éŒ{e|ó*îU±^¢•2Àd…‹¤hÓ3ë&cwš¬ @lñpþ<µ/”Yöô:nžëÌZ!r|ÅðPª!ï\n>1\'2=üLà9‰d5þ‚çÐ¼Tf\0he)Í%BÊÉˆH\"ó):*“š÷…kˆj=Ï*„u’‚)«4Ìp\"-J¬œ®;†°¢¢ƒ€0õ–f\r]Æ>‹\\›DrìBEœWr7-ÊÊ¨VÄ,B…a0ÚÎ3Ð<„ÏF7.ewo.×­Kjí1S¹À¹¢^\ZeÐs¾P=1¬+«wqÖÉ[–ˆÓpËª…\\l3ˆtÜœmÜYD¦O1Û®àópæ Øüe`„\\®“·Ôz·Àê&^¥Õ’mš»ÜCv¯ÂŸ$¥E	2!pòÄÖ®Ì¤²%êf}<¦áË7‚1ˆµ0Óu½GD«Æ€?™xƒc,“–v^ë¡`cˆO­•Çp4¿QbFç…¯›˜„^=îZf—Í-_Èû–æl%ŸÀDßÄ\'Kù™Q°«WéüF >Žrr]1{OÉ,Rò|@˜€câQM‹éÃD?Ò¤íäDq!âà’§˜ò;ÅÜóŒ×¸9	ÂUàŠæV¹—ÿ\0»¶/ŠîX§2\n‡’²µ/gJ\r*\'þ¥à;ŒJrÛß-æ:?¥Kà\nºÆ#&4pQÀÑšŽùBH¬®[Å\\ÎÉËóY9“ÙòÍàV´™yu½ºôŽUZ…«ÔqEp¯¨Œ1 å0²ðwÌpc”JE¨î6&\ZEÜ,ç2¹Cüá•È¸TFí£\"Ù¯p±ªŽ<œKd¶lgç÷K¾ln\'â\n\'?øGŠÛðàZ(­ðÀZÖÃÀ™æÜ¯eþ!.0v*ˆuœÞY/n{Œ\'C<ïpœÇÜ<ìd)ù\"®¦ycúc`ªÕ›ÉÊ&BÛÈÇL#ÌŸj‰Ê1µ¤÷-1!­°è1¬l5þ…Ÿ³3˜øLìS¡xJäÖÔ@M2“ærÊºqgúŠØ Û’7»o\'²¥@¥_=À¼†‰@q~¡¼ýÇ6FhÙi\0o][2î*õ.¸×q¹¼>b‹vîNY@æ¡[ðÐg²»f¿1)&Ã\Z¹– [ps6ÄÖ÷9ñÊSLIO“øbˆ`2×¤TÕs˜dER^Q¿‰c¼!‚ˆ2¡¸+òðU÷¤ÿ\0ÜB€PaÙ\"Å¤šsJ|²äJ°~2‡µ([V¸ “I„+Š¨Âó“‘4ù†eÃBï ­¦\n2rÆøŽ¥¸ÆÙk\ZûEq‡?rþ;qJ‘|ÄZ\ZíO\ryˆ6‚ˆ”‚=ùjd bQ\rŸ§ë’%î«DoüC1[UÄÎ½Àê$ïª¹³Ù,øs3c#d\0Í¾a“.IÉXaQ¨Æ|ùÔÎï,„•ú‰mÔBø\rÃë$_ÈôEè \n©±æ!rÖoˆ‰äÞWwÄ0Ù^X&ý¦áóhgp¿¼í€\0Ðh‚_™pÝ@ÙQ]Â³±\Z»\nø†8-[”‹Ùê“qæ%§¹/ÐÄ8<·-3²Ûþ¢*€ƒV%>E„<:é/~îöCÂr=ŠJƒÁåq\'3b•{—»C¾\0ÝCö–IT[.±¿rD÷nà%š[kº…½ÄfÌ¹“wÄÂíD:Å\'™—?äT+…™PG:Áqåƒ¨%GP×úôÖä/gXRÛh*½ÁS×Y\'Ü£ð0 ~$Í\nÙù\0¡Änãp+ÍQÄ\n2¯Ç\rÌšLÿ\0°(00·ñ˜Þ“èŠÛöíù‹Z+ÍßÌ“Ä˜Bv	þ%x[ÎØŒ–¢fˆ\'ù€ÉªÇó\rap>	PP¡Ã˜‡9ˆ_‰Ð‡(´C†Pr\\ÃWéæc(h6ÿ\0P«Iyø”.1Kh^![ØäÊµÄ³©–X¦îg†Y\\KcÝQQi/kl¡ÕÔk\nÓÜ\ZZ¨Â¦Êôü‘5ú‹ž‹‚\0 ª M—©„yÁ×åEu¤¬£½­Û0-#œAÛå©Uúè5£²)X¼_N\0*kÍÀ\nT(7‚¹†bÞFé–BG8|ê\\ÄEðÈ7êU«÷†uÇD»0â=Zõ6nÙI»©V-¸ë0sW÷ˆ¸ñp1<7h#Xïúæaæÿ\0¶Qÿ\0‡î‹;ÿ\0Þ^ÒÞù—mWÒ3\\ïK…ˆò7Åf8Ùê-4ÌËÏè^a E\0Û=ìˆi·(Å	FÔí|±hj”+<Lù\rØã(`W	[ßsûÂ¦ÿ\0ˆ›tFi·âQjò†•+î\0úd}…¨« Vs)V VóÄâP^ñR‚©Ó‰LHh\"ˆ\'Ì@r!2iº—\nÀÖåïh…÷à—eõ lÿ\0=ýÈha¨ruÙ„<_µH¹Ó^l†|E`¶Ç#gE.xÌ}J\Z¦_¦?â\\Ã9÷^ðÇ)‡«ó4yá?»S^Q÷pÕr?öªXX¡jžð?³¶ò¦ãÜèÀð3Úÿ\0˜õ½ÚŸÌ°¯`†ªÜþå$El/æ)×ô?Ì­à3]íhÁ˜~÷\\Ò3_ÐÇ‹®kø³qžiû3q^¿æRÓÿ\0´zƒ!öÆL¯ò*æV,¨\0 HO0m\nÌSdHH9­\0(;®%Ò+Ô7Ì&Ø€p™	@@Ç)<$É¡Ð˜9(‚Ê„)ÛB¿D[À*n\09`!Mk0¬x•¹øYˆÞ˜Ä*ÊGÅ>ã\'²¼KX_å\'†¿Ñb0ëò}¡L–Æ•ÆPEâM–ÂPXè99—ŽYÜMÌÅ\Z7ÌÅâ\"4†z%ÑD½Îb*¦JéêS*Æó+V…J€Pîmn×q‚ª¹¹rWâ&Üh^ep%©tyŠ–ó°MÅ`hžf¡ÜXù _ü@®1j´¿Ìâ“âÿ\0™´	–ób—¬ÔÇi³ÝFIÔ¨HÁÂUÜüBy*Æ>ÙJ¥=$^ŒJ37Ä+V–q™Ù¹ÌFYn#NJê0‡¹\\Ç\r\" ó)*Îs×š¡tí¸‹šwhˆ(b1k¹…õ/©R®l˜Ñ)ÑÔGjaŽðqê\n§ñ‡üCF8œ~†¿Ñk0®~Óÿ\00•Ö•¼ôs-õvš˜¤J;âqŒbâ„Í©ñ³›ÜK«g©‰[x–Jãˆæ0§Ê	Tgt>ã±ÑÄcšOÑ¦ÌDbãwÃ¹?š3BAxq\Z‹[Òÿ\0Ö9ÂPj“ b5EÍ«VÙÌ^ë)rèƒáXšŒ‡«¬ü@‹Ê<\rÜ:vá-µ¤‡ÚèÛŒ2†oR¥¹<@9fæÍ5ßÄ±£,ýÑ	Ý@‹äe\Z*¨\'Ä£!Û+EÅþ„(®eÆ]Ê|ùýL´@­_nÌMì‡÷µ{·0{A%í‚n´y”„qê\n3W\0\rãÄCÔ¯Â++,Û‚bS–¢ Šêÿ\0ò\ZÏè¤5þ‹æ\nâ|¨H¶-¾rzš5lÝÓˆÏªªX\Zup6½ÜlákhXÛWfâi>§#>`/Çó\Zä†Â“\0\nÌºµ]ÍaÌvHšÊª5w5þ`â%Êº>*`azÊGïq6;G”?QÁFöp}cRÓ©@+€°TQC(i|ùˆ*ƒØÍ!Ä+	“e‰N„IÂ\0R«Ô§ TS8¨¢ødâc!—Œ\0øþ¡s½5ú\rb6©L•Ã0ˆšø\nëâ{£Ä¥Ý@6Ã‹¬Ô·9Žfw.\ry”†&˜pà™eÀqÆ§o¸!’ýÀ_˜b×¸e­÷(z&avEvw¸­Ï\'P—ÞRŠ*Çò¿N\"biþ{ÿ\0Â©-×ybBNóˆä¾!J²¸ÇdCqªÂå4€%tÊ}Cj+D!s˜­b¾`Æ’ÎÉQ(Á(\'Öek$¸-\"ïÄK»æZ¯˜mÉŒþ™ô0Ö‘¨\ZVÕOïä2ƒÝŸ¨žº…h{3w\Z!WI\\\\dñÀ`ÈŽ[i(n“u¨O‹SÈ¼µŒaüÕ1~|ÒWÞå3ÂÕ©‡d2¨[‹û„dB§0‚)í+ïë‡ÌJA}\Z:ÜeÖWó2í×¼T›¨Ì¢Ã.áXÔ-Vbt™ñÒâpG\0cQPêš#ˆ°næ2êõ)dŠ–nñ0¸ÇRÌ!±zw˜)^ÝÆB4b#§²å\\\Z‹p×ú\'(ÁûQ5®T‹}¤ÝA/Eÿ\0ì®ƒ_æA›jqíº„\n6E	ª…çj‚ºÕæ #«b«M­U‰b#&ˆÓ8 <³’ëÌyèá•Tî[´Í‘€!u²¾!Q]¨ˆDÒKäö¥S*£{¸(’ˆ@ö’‹Ñ¨›¿k=?3€5UüÉš»ãx%¤&Õê\\ºËÈ±3q9J¢£¦È¬î·1ZxZ”Ã)‘R‘|Õ÷ðB5ÏS¦ÖþäðÝ*˜t¨ø$1×è*CŠ˜5Š€Ë.S]c1ýeHù\n­lÙZñâSã£Úâ=Q\0¡ÇŒEIvT¥PÃÌ§¸“ì„êoªQì”YÝLN‡,c\0ú–Û{ƒ€Tâ†P¹uâ½|eÖ ¢\Zÿ\0@Î :ƒiõÕL3å˜odÛ£Á›ÒæVÚ?Rú#7µó*¥ñ-wæ ¼uÌ;nÉCF gæaïË¸oQ”qà.a¹& ]Â§K1³âEÔ±0ƒeQSB\rí‚~R\0Y² ÝL¦ý@·aÄT³¬ANþa‘B÷R‰ÍÀž|‘B35ÖyjX”lê²2ýHÕ\">¯¡Z.ÝX‹uNã1ñbŸÌ¨u^4Ý[îaÃCŽò§¶(È)¢šP0É0d*%¸a\\8>\"‚*ö¿1?TWÍÁýÀ\0MhW«b\nY5´ZH°z•Mòãì5L£e	-1ø‚\'¹w¹züË»W¹ÿ\0æôfs¡¯ôK0‹Z_DƒE8Î˜+jŒhyÍÇÑ×Q¬\\tÖåpÊÑ.eÎx‰À_!„r(ÏpZ•]ÁeÄ6À*ÎwšÚ»’J\0-µF×Ä\nI²=lýDÚ2ïÿ\0vf€?rX³‹X¯òE}1u\ZEÃ£ÙÑ;A{_™w×*ø^eþa\Z“ŠW”RÍ#Ÿî\\W#1ÍêØ–(ç˜ÒòÇµ–´£ÄBìüJ-ôÓ	’?ˆbµìØÙÕx\"V™›=±µ¼Ê˜x†ØEË/ƒÃl+ç,öE./,M9§9Ü¿\0+Åÿ\0‹ù–*SIõ3©@­.=3ˆ2«·ÍFvöß—ÄZ”ƒXzwêóµô9üUm7Ówâ*-Þ\n>‰B>Ô<Œ¢PŒŠ9Ê³0uYÇ0¯iƒÞç ÔxHƒHþ;;Æ\Z}~œjS\r¢í+Ì‹þ ¥ÙW…~ó:ŠÜíPÇgÜ#i¨•„·qÉF#.à«%	ÊÊF a7,Ã}F…íâ_cgP-§kêd~akT?Â,çºû#+0øhÈ†¸^YËÌy°Ü	eÑÒó6²È<ÖV«™R·æ:U«…í¦+”öˆ¼©²Ñ€1[¸úQ(›f®}AJ	ªtÃXµ€q²¼Üˆ¡} Ó¿‚4Âá\Z¨¤XÑÀÈM¨YwUMAU¨DÒÐU¨0¢¨V„,íÐÔÜò}­€xS1Ñ `¸ÐÒd#Ôo|b×û1DpæDÜ©\Z~ýGMÎšKª|FÖò)aûÚ~ep“4¦+7á‡©m±©ÕûÀtë¥Ãýâ\rÁÄÖ:|å$T*\'…©¬z‡”:{‚Áªr› \nŠ.³AUË‹J\"ðÀðÄÔÄÎcgmõ/|C¡%n«Pó.QE´šn¥=BºVÆ\"·ZÍG! ‡WÚ€$ÊÁ~óýnÜàÜTÆ(îì¸V¡»¯Ì0ì^ABwÕ­y&2„ã5hÚÖúhoÄHAå9”n&hÅî¢=<êU!tú½üGÐ¹yÎêTà”r=)î@ÇTâ7Ä¼`Ì4ÆÃçÄX¼e”µŽ£ðMÅ½/u½X°\\§¨ørüÃ)Ùú‹v0Ô9ˆ–ëEÅtqsk ¨«\Zè•Å–Lš \rA:¶%–Óæ&ìàSé–ß¥îo­:.>Òp¦(¦ÆÛ¹lÌ@±fq\0â=ƒgQnd5-‡³ú-Í?Ð…M¦P¥7òšÁkS>ÂT-e7O~árr¸ÃÝ6ªî`.üD¸7’!¢y¨…\'ˆ÷AeÍGh­Ì™q*¨åf¬²%w¯xV$Í>\"m,„·`3nhÏ2¨%«-»Ü_í“Ú”ûbž“W•6;[_n_ÞQ©‚“!¹Ï¬¢ÈS÷ÁÍ“èæ	±Ðé6b?P-~ê\0ð‹j\Ze!KDà·ï.à*ÒŽ³©Ö2Ó!0b—lk[TY»/R—«ŽÂ¹|ŽÔ9OÀFÕœ·íXü!¨\ZÌ:uF]Ëåli±U’¨v.¯ˆ–€šS&%òQe~ˆŠÆ(Ítx‹¯š»ÌnÙŠ¸raÑUFí[:b‡¡.wi”ê^ŒjZ”å•›\rÓ†S~AYPŽKÜ`KYúPÔó*\Zÿ\0CÄxœA_º–‘Yå8ó/EŒTAK;.*Š6£F9(¿¤`ÜFªáuÅ®.e]À¶ ,ó	•8Ôwl\0Cµ/Vâ\0K;û@{õ0X5©dÃSe`¼‡‚â65{Ae\\ÝÄ‚\ZÇ½?ÛÒI×‰½QÁFåÛd@ûqñqyÁÜÊ§cœpÃù™ãÜ¹’Vö,*·}Ås2·f?©`Ð@à¨êVðKØp<dRC\Zâ^÷WŒŽm¿üeÌB×H³Ðþ`ÓmQ©™ôÆL –Ë\Z‘:îÓD`5äÏY¨rh)Áâ±mÅ0GP7n˜TÌ^ hÞ ”5¢K\nXŸÝ.’€ªâlÌØKaþ‰œFìÖÇ¼ÓTx#nÙU@m€–MÊÏ`Zó,ß¨Ú‚›aö7VÐùu_Y1…\r£üPš½£õ`ô\Z‚ÎÅæV&X…ôÒˆaoä_p\Z%†©¯ARºq¬®%JÀqÉ•z¼}EeÅÝ]W¬Ë_©zá€)Ùê2ì›Ç·¶<|aåwÉƒ‰Ÿ˜E@‹’2:ª–3Ùâû¼KÉÉ»níŽˆìÐùe–ñn·:ƒÄK±I¸<êZ+€gYA7ýá…DpëÌìGr¬%x`‹«âX\ZAv<ú„jÛ~Û–äEþXâZ¨:¨ðé4 èþa\"^Kd\":Š‘o™¼ÀÉ¹NÀÄ´5{®\'˜i¨¨lÕÁýÊKA•$ÉÄo6òƒv<Âï\nZ~˜µ–¡¹Ý‡zÔÓwÀ˜ÿ\0FÂ_˜ùD1šP¾âûj\"…l!çÞªV¢“é\Z¨>u¥Pð£ÏR gkåÃîdÑø^†MÕ;à‹•¤Cìa«H«	Åÿ\03êÀ²Ór‰›zê §0&ïÙÛÊ$)jýåG“+c@C<!Ù};jðW0QjÍ%Àap¯¢d§+»bX<¹†ˆ±ÜR©ÜN¦YÝF…—øä¾¨U4f7z8˜\0ÜK\0ÏŸÖxOÜ-	Áçÿ\0aº~cqßŠ©[‰¨|Ã”œMÚÕEü¨·Äã\0[—Ôš\rqÌVÛ\nX`¦PA$W,ëÀÅ0«5¼Q+«Â\'bSI@º¸„Øæû>b4@ŠŠÅ²žâYcK1P8§Í˜&Ä09KùIµuúq*‰§úýWÆmŸˆ*OòˆÀ\r`kîynbÊ#`ò+*kfŒ«AÌhÚ¢órÛó7#\"d¬þ%µ-¼Âï¸	D¯ Íy•›!¾\\±Ð^]®~£PSfóŸN¿˜[Þ½,Ú¬VÁ{ƒ\Z9k>H`ÒƒÚÊ•9D`æov#æÀ¾ƒ×ÇÑÏÜyÍ¾al·W½RÈ ×ZA—‘¢qð#Ñ€ÀØ1¦™‹{¯P³²Ñ!eušI{j±0þ\"­@V¢‚8šH‹iÔ`LË>¦sºóÆªZ wêo´#a\0~É¿±°¯beÌÁ®1£Ô}/ˆõàn3JÔ0‹Ò7Äx\"–ÍØ&,k\'}ÅµºzA‰\n+RqÞg6Œ¿ÊÛumÔhÆ»£â-ÐâZp}ùÛjGW»ñhµQkâe=ÜÖ?¡Éç¿ª\\6$°·Ÿ3¨®Ø—Ýêæýµ;Ü­m\"¢¨«Û4‡<G¿£Vx¨á@Áº9”*ôéˆ¯ˆ¨ZiüCÌ¤UØ—ü‘SÉ\0KzQ[^#]Àãn_kÝ7¤žf^ÏfCÍ7RV”1õ.F@²Ô+öõ\r²Ÿ¼-GÍFFÝ­ñ9í¼í\"¦Ùx\"[|t%K\rMu|jRÐ¯¤ a4=Kûì6<1måÎ^`	‹FŸÌëìïfƒÌ|nh]B†òê‹\0Fï¹UIkƒp®=(³Ë˜oÎ“÷™øe\0^ê	Ú ¾JÜµY³R¼%ò$Œ—ëà\"KJÙCÑ¬‡/0ZczªˆëaÐ;—gqß0ˆQ¨ÂÂ’æ¬_Ú¥ö¡«hs®> ?X%ó–_Z¿E¤2£ˆdÿ\0=ý/ôë3ES¾K‡ÜI/Ús9*uA…ð—ˆ4³\"õbÍ›t·í–~·­j¿0&Æ˜è&ú€1Å8Õü@ÂQ91C(\\iÑ)\rQG¥5€-\"–a•l¯æfYE=æ02Êˆ`S›./n ¸¼ìº†§É¿H32‹-¥×Ä\\è3èA7Y›„äoÔ=ä­u™wº‹o \nK¥XýFÚ6{&5ˆHZS¢¯ŽØ¢Œ¼!6Äj\\pˆFÅ€.ˆµó¹hÕÃ—’6Ì{ÆcÜ	|HÊêaõ\\Ú8™ïUÏÌ£È(…H­kpèíéÀÄ(sñ/ÔÞî±Öå€¯ÜQ–‰Pò°gnZ^óWÍGÀX`Æ5ù„°r9r3n.º ¿ÔÏ¨kü÷õ¼M¦¦iO£üË#—=K÷sšÙ­æ0/ ÄQ\\BåtÅ[Æx¾_÷r³÷!Ÿé-ÌA›ÍÊ,;›«§ r-ýMYycâ‰c§¢¹ÿ\0äÉæHÀm2²ÖaHg¬ÿ\0ÉgBÛø?0 àèÁíP[¤oir\0\\²ÅífQ+¾ ¢—†1‹vË 4]Ž#µ@¸–‘«ù ºèÝ*\\?Y€xkU¨ïÎ«ÊËfÕŠ¸{…„vCî\\f´²>5±TAo‹­MÂ«Û¸s°4`Ê\"ÎÓîm´ÑþPug‰%»ªß	Ï¹’æÙ²ùâ^‚´ü¨7©³ÐÔ:´ 	WÎ	bÕ3\"]£q™h~Ñr¿2¨¾7+‰°`…ÉT•m†Yæ&sq€€w=ôŸQTg¦Ÿç¿¯ŠK”¡\nº†ŠüÍÅôTºpk,ÔO…”“¨‹Ñê‘ÄZ9KÀ7º¦x¼2£7(ßÛeÐ=@0,èýîe÷róÚ	VáÖö-•YÕkK§˜óãó*Iµ—!Iä`¾£Pô/ÜB”¸ Ù\\±ÏÀ¦ŒåÛ\r\n×“¹ï,ªGÁòÿ\0ˆ6¹Š6¾Íãâ\r¡×ö1bÑ£åŽ€RéíÌ0õjì¾£áW’ÚÁ[!K711½ŽaC&	`¦?M”ëÌ^.ä	³Þ§“Äº¶Q.ž|ž 7æV<Ž¦5O)ù SeUµÄ•]<Ë	tœ0«l¸+G˜Tr`#mÔîÙ…1ö<Ãºx[±¤×ÔîXg<J¶E~U~*súqú4ÿ\0=ÿ\0áÉ\reŠ‰ä‚ª¡›ÍÁyæÌ0–)iB\"•ò¬}CID:–t°ˆl­`î*¤ÍÝÂ¤QSÙ²*Þ\"1K„&A„. qbÅ¿¼|9<9™V¯\nŽlŒ“\nåCrŠ[J9üŒáÙèÜÅ1&éÔ[ÁAÓ\\AË:–¨7¨ôu\0Ûe£k\ZplØC61\noI‘ŠèH‹ôY-Ì;	ä©L½hA9ØÅ™Yéµƒé„…ÃžUÄÏÍð’D¡X|À„\0¨/2·Á#ÚQÖv‹9‹(‹„ŸQ‘³…jŸN`¤‹Aom\0«ãÚõ˜£Tå­¢Q3­ÃïÉ6\'¨Š|Ê–›¼¬Zm–¦e\05Û—Šàc$n‹p]ÔÇ„¨Ð\\•_²):&+µ“Øe~—4šžþ‹Pnw+æÑãÿ\0(î\"…£Äh¯\'©O?qÍÞM¦-Ü[™/$kFæc«i¶Ù>¥*¼£š¿üŒb‘R1m5.@P«6EoÅ[€>¡Ìvá\Zfß|Fä Ò¯™`^„»¸G5ü›[sÉâÞâB\'¡þ‘¦‹•ÙÍWP%>Ë©î €ŠUÆœñbòIê»ŽCÖÖUÝË—h1cp0ÝÒS@G9ÌË*G/ˆ\0áÅ]Gì›‰EŠöA¤\raÂ\Zoø)™8sÄB}‰@äËÁÚ; bÉ„[‰ÂŒàÖ?0h9æ!ŽÊ<q.œ\rþê_	Gïjt=¾eùWÅG”Uq”ªÏÄ ¯©J‚Ìb(_77`×¨\nõ«¤|.XÈò£0]JCWâ˜[ó+l„|þŽc¨kü÷õ¸K\"W6–Ç7a®&baé=„ ×“ˆU]?)»³%A\'!nú˜ø<µ(•A®Bk˜ÛØ(×eûK{1tmƒñ\0¤q­Ëç¥+ÅÁc{Èx\"flƒžÏqîÃ$y+Ž%”Æ ž˜@ë„ò¾a(loy¤t#\Z‹Ö5	èIXdy0ák¨£Åy—Ü»ô~aW°?,qtZÂ÷™ÔØ\'¼2` \\0 »n\0+q.oP\rEö8Ü=/U”€qéÔ(¼ÙÌ0`áåkd0áZÞ:ŠÄÆ\'~ãºvæP¤3)@¿ˆ¿£ÐÚ@ËªZÇºnÐ£÷ V¬…º}O9éÜ²Rs˜lµIÜ‚—0Ü™\Z‰¦-q]ÅîŠºf\Z…•æÄ8†>&+•kü÷ÿ\0ŠÜ<e‹åIžX¢Y¾±.»ÜQÁ-IÌiV†è¿\Z©f0Á:`	·˜³Þ©òÄ”\rl†:€À4éšµ\Zk\npK¿qÌ!4…–úQlX½~„}({sêYƒÍ÷*d\'Ø“\0mòµŠ×D=,÷.Ñ«Ñµ¥»®GLÏ¿öŠ²ŸÆã­yÑy<E¤oÂe–ŠƒI’÷€èQ0L”9Ì£3QC•ÊòYê+‰†!õqáFÔ²WÕÅ)YÖ€fd¬/¡˜%€WÉ\r`€â€Á#4”C~F½Dv\Z\rhƒÄ‚Œ‡ˆ©!-U5†¹|Z¸ZÖ\0\0\r=§æU¨‰9Þ‡²æ–8	©P=Î¤»‡¹¼\r\"‡É…‘XäF”uISâõ™ú“vbY1þýxš äÊ¦2^®+„T¬rYTÁW±”î%X»Ü²dj*ë©Z›Î|E‹KK©XŽ;†œö|ja6ð\'Ú4êï[î\nëäin‚–Ñ?†Ë¶´FíyÍ‹`&n	PÑ‚lÈê6Ê\"Ã4‚b[¬Ü[hKàL‘©Ü\',VSY·ñ0î%öÇ6ÔÓkO³ê0?FT×Ìe¤<U _0´^.f§0ëÕµA»UÜÉ¥‚qæZ,±3Ê\'Ðq!RÄÐrÆ$D\n­zCK¸€\r²—‰…É› ŒÖhØq×Êš4–p·‘¬0ã¸ÔüPõ5-ÄƒÏ„--4Fpg)”Þ£PæE?âÅ«§Ü&Ðíƒê¦á:[XkN“_ÑP×ùïè~‰lPN[õGKûÊäë˜3+’x˜còÆRß¸Ð¡ú”\0xŽPŽæ\n½T ¦ƒ†[‡šÇH,0Yª–(¹©pÀ4¢Ð0Ø·¦¾!‰\0œ-\\Rx¢lýL	0DâÚÓ†b0á92ÑßÊ\"iQ§Ó¨¬¶u•Ä´C’˜µ@+¼SŒL*u&°/ý9tEwwRíeÙõ2§Øsó\nj!X ªüA#÷agA(šQzÃŠwªQiYÔ¶fP«æ‰ÎPïSÃUä(Òˆ—Ñ©•õÌðÕ½J«nPÁë\ZípãTƒgHgÜUÈ²¡á%*§cÂJF?Ÿþ`5¶ð””Ê†P\"•]áx—z\Z¥‹p¦â$)iˆÃ®\"–\0·èÇmØN­Ô2žþ‹PnrÄ;H¯ãÿ\0#”¼>å°Ç/ŠæYX}G)ÀœJV¡Ëz‹t;V\"š‘v†˜\nEàÏrÆTó0&NfqÔAñ+c‰`3:Sˆ?*9¡Ü8€ˆLà©’¢Kq4\r½â’²*ŽâMI\"ï™ûÃ²sfÝiúƒd‚Ò£~å¡N‡†âU÷xrÈwî‚Šð“Öù™n¸@\'\rWÛQ1…}ïD&ÞkA½Ê1ÊêØDÇVØ^è%.†\Z°ÝÔE¢B¾»Ž-Í¸h‚šè¢èãqØÆŽâ*º®Ó“QáŠå§+‰Ý^Š^¥Œ©’7È„UY²jI¥á” ˜õÉÉ\nn\0ðñ•—àz6Àè†åN¬ã2úEÖº‘ ìuˆèuJÒÚ®’¶Kà&eÐ×ìÉ×*üLÕ,†¿ÏMÊ¨ÌÁšŸ”´«5ÃÎÙ‘£æ(ñ,6™ÔÎQˆê ê¡5~¢m÷÷/jSÌKyT€­UJä´Êˆ¨RóLÔ]ÈoœD0\Z™¡´` Ú-÷)ùñÈ²fævª\r¯Ôc£J\nýœ1UëIÌV`Jž¬d^H«¶\"Ò)Cf®	ýzƒ~Ê²»ÜpàU•¢%CŠGUP[-¿8èÀŸ¥Ãª<ùzxT¯œfVá	™\naùÄ:Ì2‡u,4G”š„;6€yrl\\7Gª”VáAû”›¬üÙ‰lŸNÈùˆ´ò„v‘óF®¾P€æaOi®32õDµíâ*£(nQ-À%fá¢Á†ù…ÔÀLŒx€7ÜªÍ¨E”«Xšöhà¾ÈÕ]‰´®a˜ßæÃúW0ÿ\0BÄÄÛôµ²ðToû˜²ö^!ulS!4LÖ†3\r@Ç—ˆª•oï,AO†]üþàWP1Üàê!ÁÜ™îfëÍWªÄT²+ZÄÍ>øæl…—\ZÔ\Z(Ì®È”ï.J³^Å9¥î\'æU”IRê´¢àîâ;¦,]Ÿ™ËrÀò]üJs:v`ð/5ñ5® ”îR˜”ŒßˆÚojˆðƒƒ¨‹ý¡’«¢>î\0€\0BÒÖ!FJ·{—Õ#^ƒù‹˜4Ô|Lñ-,Tb§“ÌK6†óØ\0\n+C	FDá}@er¨^“Ÿqé´²5©æqGþÅ$Ç_óú½Ù‚))á\"Dnêc.±y“<œŸ¶jX\n—ã9VŠaâ\\È\nÚkâãê°Âòà¨JœÍ!¯óÙÇéÌÒhUèÿ\07\0–C‹½#&w,Pë_3¶Y!T~b.ÞcÐÃ|Ì^É ²b.¨W!¬–“\rc1†”šŠ´*Ãµr†À¶ë=ÂyxpB²]\ZÌÎ\0pá‰{F#¥@¥¸w^T™‰K/GÄ¸A/¨h0ÃÅ¤V7Í<>\\’jÕ¹ÄÌáºòæX›§0µ¦1bÚUDx´ÜP¢ÃB	û•³€¢^žb@Û)ÓpÖ®ào©u’¯þÏ€qÌ»’%„•ê óÛU1n¨a·T°âZÂØû©SôPC£Lã¾[žcwTrÓô\0/orÏ»Ô>¤ðq”UÝ\"s7è›…g¡Rß€˜\rT”ÜÛ¡v·qÛMeî†ÏÃ1›ý+ýúkôQi¶í{•Áa‹/3\rT\\fWá®ÌB@£ä—l‡‰vê\0¾&ajsŠé–¦b±ˆ‹x¸+&Ò! ØìŠ+”¡çq°EWFÖ+sÑ¥Ä\0jñÄwÀ¼Ë:qúã…™—4¡k@}ÃËŒ/~“y6Gˆ\râË†5V˜®Õöy(â„§¦;Ë ¤Ou™z”ØÌTEäáèAJØùCySiäÓáîXös¯ÕPË`Áx/tøŠ\rÁZÁŸ12ps‹Cäc„µ~·	r†ª^JæU\0(ê\Z¸®Ø€Tu‚Š9N¡H!ÄðˆeÃh0tG\0Q³÷1Yy)FŒãê[\nÑ\Z\"ä…XŒcÒÄU#e·)î74«Í63(ß­€g1K:E+ÊµIL¶§Ø¸e‰~\"Ô5þ{ú³‘.—S[íéGo1XwØ%kÁq]ù‚ƒ1B£ÕÂÿ\0TX.&¹e²¥\0Ô¹ÜXÎ¥ïº!™œÊôT¿<Ú%‘3Òr\\J©&Ü\\£‡\\à£ÿ\0`ÀÞ#ƒ¼UÇŠê-õ°°˜1ÎºÔ¤{ŠÅHU0;þsK]C±{‡¯¬Ê?h%Q§Ÿ&>\0£öEsæUê\\ÉôW‰qI:m¢Š*\"b-Õž1ae4ÅµÌñdÉG›‹³OqzÓaÿ\05[lÎÜÕ³æ_°)b†²XÒ¥š^>%«àd&âÑ„í4D\\˜Ÿ\Z&nŒ¯Û¹IdTlù”íž±æûa}æÎTŽªê3ÊÍÙÐÏ5TÜ¥ÂZÚ·—½,­ñ(¬’À1ƒƒ©Ä©ÍæwÕYj±]1¯b¨ª¼«–`¼þ!ú_èLCü÷ô\\A»›|L{Þ9Ü €½\r1ó*!;€ºo–\0J€\n*Tî*\Z\'´\"Y]+4²øU†=ËØ´lx!0ƒfòÕÀ´£=±X!kásµQ6\rýÂÊ˜¨ñvÝáX:š½¡)f2Ê¯TEjä\\Ç‰Úa¹/·UO y²qÔ\nµ¸Úß”ÓlÈµŒnæ±»;;Öb$(\"ÁöÆ étb‹çÌ0îýF	—ÐÇ”NË¢ ’€ øÍ\0kgáˆ°Íƒx,Š(œ(ÀŠ€ËîÐm…\'%uáæÐ¶üÃ\n¼S(Ð±N¡poÚ?ºnØªæQðòQ#»>%ìS‹*Qü‰Š)­°j¯¨\"O2ßËþ	Ê\Z–Ü|C_ç¿¦ÿ\0GMóLÀ7ËiA[®·*eM>8ýáÛe#z–Öà(ñ9ÜFBÜßP+5Ä\n.¯˜@íKz†¦&ƒL@Q5BÙQÔÃ–Ï1§€ùˆtsUtNé‹­g¥ó¨U\nŸâòµ4}!Ê\'LV¿‹ñê>Á£€#Åöúƒå…M-¬r¯Ë2lÔ\rê Örˆô\n½MQˆ:ÙäñŽ$;mg©{õ+ÈV ¼ ¯œ-”PPàÚJØ)ÑP(Ì ,úbÿ\0‰z;¨IÚÔAð^$½.–Æy””>×˜ˆwE>Ž ªS¾cÀþP3ÊÜÒA%Ak.òýC¢€ªâõ°t0„ó‹âFÒÔ¤pá¨-ZUà1þ‰Lûý1þŽÿ\0LEèhJ»ÊÑå\0mÎã¤ñÑˆ `QæTiD%¨ëQÍ˜¼@¶\\ ”^m«5s\0u•Îé7ŽW˜ÂÖ(Ç¹MÊÜ¥\\ØTfõQ`&A\n¦f‡ª§qæâ2Ï‚	pÁh¼Ìµ¿+Ñâú%¹jç\0Á7V6Ðƒ½s!Ó±QmY&!d[h*h*Ì5cê?7™€L1»Mä¸µÈ ÖaMÅCy˜u	»ýØ6Gœ\"u¸—áÙ¸Æ\0-Á¾»w‹iDÂ{J¼pHeË¿fnŽhú‹LR…qÇ¹Î‘ŒÁÚhÁ œ\rÝï+JxIŒ´èÊÛ7ÁçQ—¸„Á©P»äúý)©^?Cüöq™‰WQAs-wò†»¢e¥R¯•¹˜¬\rËÐ)\"®Ææs§0 w9—±\\}ó(ÕÌy‚á>f¤§©FÖÜßÊ£óÖ¼óï0ˆ©„Pª«®e,Øà%²’_uà…®\n7„;`Ê\0~¢2P0×ï	8t¥8î£³\'•!³èêº«¶!!\Zp»wzÄ`e08÷.ò–\nù˜!åa†u{4³ÄGWž£µY”ÑÇMÀoÌCR8Sî=¡è!f[+áÄÌþœ\"p<¸i!XØó\n†0ÔEÍÃ¯X©Á\0‘ÜÞáó¼pœR5éçIÄpTokw4Í‘ÛÔ!©¨·\ržÆ\rÇ4±gñ.\"ÚþS†c»2¶ßÁ.Ú´EÈäBì-‡fI\0\\ï2ÌD-ÓX†f¶˜Í¡TEIÞÈ-¥ï– eæåƒmé‡}«z–ê<ÀÆÛ\rd——´Ñ²ö‡kÁö@†<\n‹@¨ûxW‡¢<a\0Ò2ð†W©¬a:ßÝ1bZøø3/Ñ¥åô7Q e:`[g‘c4n´Ä$t\"Â@ë(çÄ Ûm’–ŠŒ>˜ Þ{ŠØ3f×	@OSUÍê%êËÜªs€ïS­*Œ>5Põµ¡ÌhÅvL[Vn¥ –$¾Ô²%@Škl¢¯	ÜzfV›Íew<‘ö†¥~ƒùïéQs2–“òŒ¨µZ÷,W|ÚÎ}0‚r@\nq	XLIä€ºøŠ0EÕÅœFö^N *ª–§&[kÂÔc‹¨=E¸¤\\{—M©XÑ¸\0…¥GmJ¨ðÌ79S2ÃáK¯X¤­béI·9ÀÀæ¼\\½VCWùVËcšYê²[–zÈ“ˆüÊw€…gOS­p?ˆ/˜»j\ZÅÄxŽÃ¨¸V4¹·1	¼®uªmwQââ¹JC5\rçÃ\r)ê=¢ã ãC4_+iñjwÈ#ÎÇÌpU(Xæb9 2Õj\rl-ùKt¡©oô,!˜™ž`œE|Ø\r*¨|÷Šyb\0J,\\±øNŽAm€Üe#Öñt&Ì%·r.Ø‹µÏ>\"7kF›Œ£¸=ë–·\'µ(Eæí8^IqÖ™N\\Ã¯Ùt»Ùø—$j0¦]’®#jÄ¶E`­1î ªãìD}\r±]1 J½\0°þC‰Ä\nâà™Uõ/Y…&ä¸ýà>á0‹½ª\ZºBð\\Q}UÖÂ?D H‡²ðJñNð‰±‚ÕÛ¹HTÇc•Àõ\rSd\rîg(ž*Y,QbLR¬5ÊV\"ù¢\r0.ëQ„f<Í©Ô<-°”ã–j%5ÝD%)	…å.ÜF#‹ÜbFÆ\"\Z‰¸oý9R¿’í‡ü@ù{ˆÊ¨xƒ¸.Ì’‰Aç‰r¤•šeöãã#Ÿk¶…»Í†Ôë¶-(1(/ÁÊÌ@¦ sóË’‡ï\Z(]q@Q5Q\rö‰˜»6—“ææÃ² ë´WA.ƒðŽàÕlÐFTObÇÌÖš¯­ËúõG ÔäÓUº Ž“P±ëyL$™4J²*3„qmKüÊƒÙJscµ’.,Ú·”Ä{ëãhƒ;¤?^\\CäÂ·(sù*\"%e (K*Û	”<ðøˆ“Ý0*’RþÄ¨y‘£åæÎp åðÁ:·¦X:ä‹Ï”­áÛ\0¦†ö@Ì“0ˆÏ(\rgp®Àˆý±]B?ôÃ,îY\ržÃ_£7ûÄVÆV€÷È0\0s/tõ\"ÐV}Y\\ –]Dc²åŽø*}a–¡ÔB–V¦] Á\'qôRÁ^‹árZŽÕ3ÐÐµå˜»!†æØ(\n\"Âf9ëÆnzYt\'1°[0À™S“OS™*u­—¨Œ¶_79œëO”âI£—É]Jà‚My¸ªE§ÛÌlJ2—ÄvòŽ\0å‰˜‘È5ªõˆíËSž\0xÄ¨4<¿\rCÄÚêvûãRh	àðî3àèz\"6†€&åM\"O–=\nôVZ]—ZËL°”£eñ2‚«¶Pä#iÔ}·\nÑŠ¨­YRÀ8rDrÔò>€˜z=Vðð•4¯D9ùFÒÖàìÂj\\aÒ›#	 yŽb|üþ•r¥¡ƒü÷õÚn >é7¹^%µ÷ˆ¨\nÖb–&hä!}Ã´+/lmš¥Ä($¸M7ÄØ,«¨gžu>‹.1aS«ƒÄ¶Xè\njâÆzÕUœ1jå\"¢‡0\0OT¨‰=éòJuÃ‹ùœá“-2¢Õ¶k¯p^ìeÔ&ÁÑ‡\\èNGÁ2Â”çìºŠÉ06aa½µp#t¿&ÎÛ‘Ñâ9/Ðä^¦øYO\\³XTä/G“¶4mµ¡©iå)¯c8ŠÖ¾¨Ä’±«\ZÁÂ:}A-…«óÜ…#¥›EÊ,ÚYs-PmUÃÜ¦Öˆ\0µSÑ	§Ý‚ÔgÌôí2Ø¬FÙ\np‡ZaÐjí˜†]L\\‰¼Ë:LhýOóßÒâÍM´(|æ›È”Pã©FX]Í¥ÑŽÅÃæn´Pò©àYU;õ\0m£W\rÖñ‘´c9bÞ‚I`«G¹FÁ¦£GÛRãÃÔ¨ŒDNK­ô¡·2\\3§¨HQR¾`KÉrÖ§,dù•œ¶)bt‘\0©°SpŒ•Õò2Ú(,-¾àäªR=z‡ÛL<‹jue>pÁÅ¡´23ÝöË›Õ§gÎ£åC&|¯á™`)T¬ûLÑÜ´ë˜ô/YT}Ú\0`â:c³‹]££ú”R+rÞwÜ.ÃêÁtnÿ\0Åƒ˜@¤E—7Êî)ã‚j¯g6Jåeøq‘Qœ êEF²”ù‚ÒJÀ]¥˜Š%¾Ýb”3`â_b•ú:†¿Ïø(.ÿ\0Î±[\0¼¨¼ã@ebUeì.ãÉesXÑr…lŽ+V+†aÂÔÆ˜ÌŠðOÄÁÑ-}AböÂdÀâR\Za}/UµÀÂÙzß0uìÖ\0=–ã˜œÆÇâP³«æPœ!R¾`R¡o8j06D §pÑFòáa–¥Ë‡d³s2×s»¸.à4ÔWf®À0£ÚÁM%¬@,rçŒùeô;\rÑñ¸Õ…AX²ÀTã„å…}ýpT¬w­ÅâÊ²×©f†_aý ÅÍ«³Ás3:ÎíÊø?‰~µÈ¦¬°¬Q<KVÑrÀºˆÓ/¨*àe8õ0‚µ	lî\\Ïø‹$?£˜žÿ\0ðSö˜9§ýÄÚ¨‰k\0Î\ZšˆX£)-÷ƒ9—¬»Ðˆ­AÉÜ{-Þ[¶¨]G\\búKëËQ/•ˆQ,·áÒÛÜµt{–‡ˆAEF«\"Ù,èŒ\0ÞT‘]œ‚å£„•>ež¡¡só+ù˜)ßÌ!n(ºW¸î‘Êæ5—yhõ¤Ý¹Að+üÅ×Òå¥\"¥%$§	ø‰™ƒž˜µ&ý^dZznsâàIRXúÑrÂí³óÄR\r.èð_˜‚³—¸)hûš[\"Óƒ±^¦:(®¡/QÞÐ]Y„7G\ZB»æâ÷“ÒKºá@îfˆxføS¸‡yk\\(æµ fS*jâÆ\ZÊ¬âÆeq…£SæXë$%3ˆ—\ržÿ\0ð`2zò‚€.\0¢£fÊ	ÐÃ‚È;a•åe×Ó\0LÒõ¸MÈUEÂ+Ì_Rö_fY¤(^ˆ%|Êê\0[•‡•ø‚,æªN	™ìõ0tj.½ÍZ¤rP`7ÈŸýJ³ÍÅVµ\rDKY¦¬úˆºü2·%ÃK@Ç‚Êµí\0]ÐÃáaÄÚC³¿*Ê+Œw9Y¡‚Ùa|Å=ß3\r²¸1ÇCHËm_ãs\r(\Z\ršó ƒ‚]g`™‡“0CW{˜ÀklH¾æN±œßQ.ˆ\Z-ßa+x˜³pUÐhŒ*ï¸½ÛÛ$:‹D³Á»QTêåP£@«ê.`Švû˜}\\BÒéâ06]AR\\?ÏeçôÒö¿Ý(Î¥6jãj²y‚6—Q\r¥By‡ªæPš\\÷É.**¢à,a—‹–à«]º¨BD€•‹†/6Ò¥÷VS<€Œw(“lU±î[y’Ï«\Z€há|(žæn9U;*ù¨@5U§Wl´ -¾îg2÷«­ÊucñF¥¾^ õ†ùAzàl9ñ/©ÔZ©óõe•,±Ë¿Éóè‘B1¤Ä//?:•X[A•÷5Ã‰”rKá&Ê™°š‰Íj ºÇqD§k†àÞßÄ¡@ŸÝ”n .õ™sÏ¸8F\"QiÖ Ð/é°Ch\n•ÉPÊ«Ëñ,-uÓ˜8X\\£;ñ1ü(7ú…?Ð2¿M%íqÕ´bóQ(Ëdc…ÇæDB³Ì£^à‚Â±™€;ˆý=!&8XU%Á«;M´¨š@ .	§qï„¥’ŽJMl¯9€Bvzµ13_â°4†œdM‰˜TÃ;‡öa@VÞ<Çbÿ\0ÍÀÐCUH«Pt2ÐhÕ‹¨çÚÂ€F©üÂ´Ú‚èšbIö_Ì<ô¯WÛqPY†eeƒ’”¼|G‚™,Ê`Ë9åç¨•ULxÆ˜„GÁvS $°Sñ©Dät(ÝÅDî*ªåYi@åz…»ÀÙ0tg•C±\r‚ì›NÁ&`ºr\0øƒpÕÑp9SM·êá–)Ê­¸)NG„µmÑQ	ˆ¹„N‰*¡™la¯óß×FTÅæ3Hs\nïŽ¡¨#ÚÕ_˜#mî\\’Œ\nA…§¹XsIÞ*mÔE,ûŠ\'#U‡3.žI[ƒ9MLÌ¡8Ê\nÎêC\"aˆ\r?ùD\"†ãO ˆ—(YŸ²‰vh¾f†,R6ÖíßÅL fÔH@r`Ý^£†icX5_ÀèºŽy™»É\r]X)rì¨!´€ÕóY+[%¯Ž_Ñ\0B–³^~:ƒ[ƒåˆ``¨Û¤ö1Ãœà±jf¦y‹Í7‰è˜á!Úq)€:›«q± 5ÌHv,2>b”À*Å>8€«s­aì²YÖZšs8 P\Zé«µø\"jQ+ýúÕ<ÅS\'£pPy]C`¾îmd¼N7¥³¹c\Z”‰Zñö§ÌF§¸j¸\0¦ßRº¢+e%Šu*S(—Ä¹id4µã¹Ôtdó1-ý#(°XÇo±O\\Gq,òY\0Å90x|©™G6Øw(!Ts^ã½}Ë»à”|†0‹õôB\n£ÌÉ\rS	¤ÆÅOÎà+8„,aÛMPÆ‘(œ„ªvQhîì,0lÞ I\0sÄ,/M”Ñî3!“m/—8•É-*Næ‡!`îÏq…ëFD¯–4•7šîœ@\'²\r–ÀÙ´æ%¬Óc€A¬öÄ\n<½D*+æhÈ5s\nô.Š¡Ùø¯Ñw)Ü§pÉþ{úkôÐÎ÷8\0þ!¼äat%·p£ºþ3Ï”f$ÝfKKÂ0³¸8‡B8æ‡¸$r´rÄ)eÁÜÞWÌdP›ê\\9Ô¨K=B³Ô 0R ¼D†›ÄÎ ªÊ;ñ¿c%ÃÄ\\›xÙáæ$Á|Ëâg”Ô€´v¼Ð’[Ž\"l\\ñ\reÇˆgpFîé§›†n¥áòøR#•2•¨,å’Ð63uÎ¦è9ñ«D¥³÷D¤,ÅÃ6ÿ\0*£å–ÊÅ!Áó\0CcðWÂuÐÁìc·ô£!½Š³ê Äƒe§L!£bæmLæºc«b$%¼çÜ@w.Úð)‰âxQÔ¯Ð`ÿ\0=Çèâ#öÌð±·ý‚Ýµâhª\\Ñ…Êõ)zøƒX¯r¬Ê7Ã)Óf Sg,Ù6jR\':er*kï¢‹5ÃœÊ*A«™ÒºD¦SgG[%A eanaå¶pÊÒø‚€_‰YÇ©‘®…<þšmØ¹e·JÔâ;BÈpdw\n	.×§*ca€jVö:øC†+\\x6°^6X¥í¨aŒ\'ÂÔ0m»ÌÍûœÅ!]+m®nÇhT½jW[ÖåÀK9bt±QÓ0¦³î\0ÒØñ/2sÚ†ÆVäÔ:€´ê£KºFñ¨üj.%Ô0e¢èù‹¬.™W¹¦Á–LÍÞ†;n,*µ4ÔÃSµú\Zýˆ6ž–F)Zpä³\nTñQê§˜†rš¥¹{»`^n\"ˆýËF,£\Z•vÅ,FX\r+/s‚\"Òî*jAaU¢YóÃ&›a§Ù€·ìè/ó,ÂÀÕ_¾aå†E˜Nkæ\"Â‘PÒÇ,3 õ\nQÌà)9ä::†©XWô‡Äj1X³·!t\\S¦ó‹P;F)ÐœÎÐ\"xíïÐ‡\\lq–ùtJƒ=cä9=ÁÐw>÷SÚê„¢PM2È?4S¾ÈØ\"]Q*•£j¸z¦h…0Uµ\ZUßR¥§<Oxî^¹hÝÇVu0î˜B9!*P¸ê8ð¥ïâ4¥<ç˜ˆ,ÂÝ@s5;©dÞˆÈ5•U†\rl!å\rƒîœG´Á×Dê]œX£Íu4,•áéñ\Zý¡ƒüö8#™#jø·:……\Z_oâ¡‚¹#`<rs”j8Öºâa-ë‘ªV–„Ø€ŒK4€‘›¡‚ÆØ=$tŠl3îZÓ[(®ÁØ›OÌÆË.!T@^lî¢ä Šr,ùø\"‘°R	x6ñ\0vOÚdUÁ¢í ©×â\Z7¯60„´7Ü£Ið‹ºyˆ†} gV7»•7uP)²áÒ[_2ÔÕ,ÍÃÑŸ;4oÈJ¸ß‹^¡.{UEû„Æ%‘†ÛÍ1ðÙU°ùa°TÀh:ø–ØØ­Jxj-9æ&€…^í—I•êWfˆâ¹–\n%±9€¼¯˜B•Lã*Y©H½\Z¸,)Æ÷¯Ü4÷¶\\BËªú„P¨ôbhÕw0;\rNåƒZÜjÅi±î¸|’º\':½nO$< ³ýEZÔ¶§—^®\ZžtÉˆš{	u<KÔNòZ´KwB¦)Â®àñ]¤aK‰Œ(4Þe.C0ßRéº…/÷3\'A¹V^ÆR¥©TB;\n3JR(®Ù1,Xh\"¾`±D¬_Â~å¸ÒJ•ÀUDXþAõ©Å*¸‰x¢\Z›w‹³Ä_°ˆ²£Q\níóräa„±ÅÆJ±{aP#;„(–uíôÅ@íw/q¬í¶kÔÝOatÌÁxzÉ¹z…™T5ÿ\0”R-ØXQ líÑ+÷ÏPê÷/èaæ¤3€‡µ	ÂyH¥Æ`‰`,s	xOí„j83\\¢¸Ê;…W¨;®\")9kmÆãÁ˜¸/(BeÄïo(Ð˜wX‰u¼Øˆ4Ó‰eàr=Cô’‚¾·ûK€Äïš0îhžÍÇ…úÂÅR¶5Å¶Àáƒ—2úüDÙ°puPÅ.YVgE‰«ÉšmŠ(²ƒ\\&QºÛæ!=CK\Z3âÐJÛL4pµ°ˆ\ZÙŽÎå»’!%­ñ/3;ana§ñ¢­x¡‘/6PMY«Ä,Å£;±bitn[TTy•Ö´ÁUAî\nlSUây¨å¯†ýÌù\\UÀ‚H#\n/px‹#k€/-Â\'9ù-Î{L[W¨KPYÕû½qkÅ—âeW>à¥ì±P*ÞžâÚîwÌ½Ò–ZèŠ´£ÔU!ÝuÜ·£‰cW‡1RþðyÝ®s‚å7+E”¨£›…·½`¡”^!…Ûjáw·ïŠ.‘H˜—\rÀÆ¸6;üe­R‡~DÑþ{¯QÔƒR7æÂ©K¸L®£¼jëFõ±iÆˆn\\«]FÝßdðês­‚\Z™¯\\Ëoœ£ÞÃËˆ--o1½Qž7jhX¤Š¥á±7¬èä¿LJ†Jí–å(~â’\'089ì`\0ŠœRÂªvZòB-ŒÁ›É‚±Pðj·zqfádŽÁ¬ß\r#6\'-gÍË§„Å…·&0T…^IÜÁPŽ [C‰ECcÂbõ)­Ö ”µ¥±Óqô¼7˜­·Æ\"^‘•¦,	q½Â ¬œÅZV£~,ó.¾0·›‹h\'dLâMˆ ç¹DÈ¡!	ã˜MÕÅóÜ\Z˜pµ‚Xä1RC4q7Àåb»Ã.Äqºi£üöfzË,FXU…Å˜	JÁ\\FFD hKã©4<Ô£\'½ä3.õÔ¿dËÙ0\"¡¦^!YðJPµæklXæžªmi”­¸b9«ˆ‡6p¸c|êDˆî[HÄ gqÐîEžQpñ)WT2«S,. Ò€r¾Ñà!…v\"—* •ÆÚ;b\\.¤p¿¸!t¦d–;#Qïs2¨â+RêÚÀ;aª;ˆþ5í¥öÅR2Ê¿†f­N»ˆÐ\0z÷ÊéçÛÔc… ËÜÏŸ¡ƒêV«KTæË,†õ½+EüÀ\Z’†€u*p²¯<AÐräõ ¥Õæâ{=ØIe.•p	€Øî’P×åêá—ìàÎšŒ¨E.¥	B<£r·ŒãXš¿ÏfÈ‘`àƒP;Cšr¿1W«±îe*Ù”¸(NHÎ€£U<¡Ù¸I«Ü\Z?¶îâw´È7‹s&!Fã`3Ä`/DLÔ²Ã‘µ¯D`$)«¶eQ 2ºŽª‹c_§ÐÚØˆZÏ¨ÊÜ„íð­bÂë#æÄèZhXÔ.A”oÐŸÄ³„éÁž®¯Ä¥\nÇq6X†olàì2å`ì\"Kî0F°@—É‰7,¥fÍƒ\nêáËuq³¾\ZhÌóvK*º7r¶ðìfŒ(.’TR\Z\naV?2±”Ãª.eEïÁ†\nÿ\0)–Ñ„,1^ó*Y…ÑtÃÎ¡…fæŽUÅ3Ku®ÌÝCd°À»3K¾å²„L©ek-Ê®\\bŸlÔÛ: Ö•Ü¡ªáJ\'%LÈù\ZØsâ”ò4€ßÌì+r ”ò—8.Š”ªäE|ç1Àî2Xì”Uº	‹Or†À¸®ñX¨Ö„³ {ˆ\rò\\(ôŒlƒ°„äÓ¥ÔÑþÔ«Þ¤ï1‡÷K3õ<qšŒèöœTmñ÷K˜ZâÓö¥ÅOYT‚¨ŽÕsè/õ(Žmþ§Hy¿ü…ÏÖÿ\0äv±z–\0ˆ30?ÔE±ÿ\0ò&thò^ãî*Ì¸êû‡Ž²—uÈ!h÷´EE«ò1Ú§Ô\\c\0˜Â›4öÂ\rd[¡íÜÉZÚ=‘í	‡q‘µ9½ AP±Æ¶e¼™GSkj¯Ê2ÝØ-^¥\rˆ¸,))t€‹ÆìÙà¶X-š`}D1D—¸¥Ž®<_óú?©uw‚•óP&Ë‡c~sÛÐ_°Ã/õ0\'xeõ˜€Z›\n½óûÍQ-/ÌØoÔö±TÃ e‚xQ\"\Z((ÐŠ@Yd=²*·Å¹„P9°´åµ›)]r˜§ö0µµ3©›\Zñ‰tFž€†¿Ïg¡O£!ðŸTò£ÅõEwõK%Š–ø›/¦–øBrÿ\0Ni”ŠïéEãDÙoŒ{ç×›¶Jgþ]›¹£)üh·øQ^ŸHÿ\0áækü)¥úÓøv”ÔkÂf{|•1<ëú*%Íñ¯ª`¾ \rbe€o¹jGÉ0(ÊøÍ’|eÎÏ„öy^^røF¿ïÇþ£Çþ¡8úñ(?^+5üe ÓÖqaá1Ý/ÁP~š©MJš‡ùïë¯ÿ\0•~—ú3þKñõ‹Poõßê¹ý/Çè¿Üº—pÇÿ\0Üºýq|Jýkõ[ƒOè¹Åþ#–]NÑniþÿÙ',2,2,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',10,20,30,0,0,0,0,0,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tickets` */

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
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
