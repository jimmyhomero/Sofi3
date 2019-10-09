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

insert  into `config`(`codigo`,`nombre`,`valor1`,`valor2`,`valor3`,`valor4`,`valor5`,`valor6`) values (1,'IVA','12',NULL,NULL,NULL,NULL,NULL),(2,'UTILIDAD','30',NULL,NULL,NULL,NULL,NULL),(3,'MONEDA','DOALRES AMERICANOS',NULL,NULL,NULL,NULL,NULL),(4,'PERMITIR FACTURAR SIN STCOCK','SI',NULL,NULL,NULL,NULL,NULL),(6,'NUMERO DE VECES QUE SE IMPRIMIRÃ FACTURA','1',NULL,NULL,NULL,NULL,NULL),(7,'DOCUMENTO PREDETERMINADO','FACTURA',NULL,NULL,NULL,NULL,NULL),(8,'DIR_CONFIG','ASDASD',NULL,NULL,NULL,NULL,NULL),(9,'SERVIDOR','192.168.1.1',NULL,NULL,NULL,NULL,NULL),(10,'ELECTRONICA','NO',NULL,NULL,NULL,NULL,NULL),(11,'FE_SOLO_FIRMA_DOC','0',NULL,NULL,NULL,NULL,NULL),(12,'PERIODO','2018',NULL,NULL,NULL,NULL,NULL),(13,'GENERADOS','C:\\Sofi\\electronica\\generados',NULL,NULL,NULL,NULL,NULL),(14,'FIRMADOS','C:\\Sofi\\electronica\\firmados',NULL,NULL,NULL,NULL,NULL),(15,'AUTORIZADOS','C:\\Sofi\\electronica\\autorizados',NULL,NULL,NULL,NULL,NULL),(16,'GENERADOS_SHEYLA','C:\\Sofi\\electronica\\generados_sheyla',NULL,NULL,NULL,NULL,NULL),(17,'LOGO_ELECTRONICA','C:\\Sofi\\electronica\\logo.png',NULL,NULL,NULL,NULL,NULL),(18,'FIRMA','C:\\Sofi\\electronica\\firma.p12',NULL,NULL,NULL,NULL,NULL),(19,'PKPASSWORD','C:\\Sofi\\electronica\\clave.txt',NULL,NULL,NULL,NULL,NULL),(20,'CACERT','C:\\Sofi\\electronica\\cacerts',NULL,NULL,NULL,NULL,NULL);

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

insert  into `productos`(`Codigo`,`producto`,`codigoAlterno`,`codigoBarras`,`base`,`costo`,`impuesto`,`iva12`,`iva14`,`iva0`,`ice`,`ProductoOServicio`,`costoConIVA`,`utilidad`,`pvp`,`cantidad`,`unidades`,`ubicacion`,`observacion`,`minimo`,`maximo`,`garantia`,`serie`,`imagen`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`,`b1`,`b2`,`b3`,`b4`,`b5`,`b6`,`b7`,`b8`,`b9`,`b10`,`b11`,`b12`,`b13`,`b14`,`b16`,`b17`,`b18`,`b19`,`b20`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p9`,`p10`) values (6,'LECHE LA VAQUITA','2343','123',0.18,'0.2','IVA 12',0.02,NULL,0,NULL,1,NULL,'30','0,26',0,'UNIDADES',' ,  , ','','','','5 MESES',NULL,'����\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n��\0C\0\n\n\n\r\r��\0C		\r\r��\0  \"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0�H\0\0\0\0\0Bi����gq��{�����p�m��>~��uy�n�yz�X�u猵6�pZH�x��vG\n�OisL�6�Mv��2l\\��0vsCT�e��Q�ا������N�ɴvi�ͯ��r��U<o>x�=���7�o0������6zV<zm�{��H��2��U��W\":���\'�9u��Zr,�OCB:�Q\0\0\0\0\0\0\0\0\0\0\0	\'��$�BO���ma���3-�����,iҫNRBy3�D�c,L#&��\n�a��P�SV��&�[k�r�=KY\\�H1�E9��M1U$SVz���ڼeV�b������aQ7�1c/&\"x��*ɡF�R�^�q�|��F�Ǣc�U\0\0\0\0\0\0\0\0\0\0\0�Z�q�\r�?A�0�[��\Z��R�:\'��q�i/��ZR���\ZQ�M6�V��K����\')�D�4Ț��㔨�&Z�&�Hӄ��DR�3#U5o���ʵ4�͕ՖQaRfX�����i�5�$Mi-��f���lzJ0���\0\0\0\0\0\0\0\0\0\0\0\r{a׳���d���u�:0/cc\"r���3��fXa��&V�:9c{%�K<%$*\'\ZP��)�V�MR�r�����:p�2(OV�o%yI��Vb�/�\"�DZ4���	.�m�����xT���1w;�y�匯�kFc\'dbo!i<D�����l�fic��T@\0\0\0\0\0\0\0\0\0\0\01y;,��U�_�/Q�FV�+I2��nb#�Db#���d��T32�8Ff)��8F\r��X(�a5����孱0�zp�Z�I�^���)\n3���#^z����X6rY���5���-��P��6b����yB�b9l&2V6�%T�*�^�߄��J�DF��! \0\0\0\0\0\0\0\0\0\0(֑S�6�G�>I��k^�Ŭ�]�4��\0�}z[��\0�������ǝ:,e�#�S�=Υ��o�1��\"4�ө���7��r�z���̧�L�y�P�.�����_��m���l�״�)��Z�fq���5;k�!\"�qV8�E͞ZW�ciN­�^�^\Z�Ө�d�!���\0H�?r�]�0���\0\0\0\0\0\0\0\0\0\0\0\0I4�mѺ&��<���)��Cl��O7������{�B׳�weg���ђ�q��R�Mw���~�$�Y�K�ɜm먝�]zL�i��*m�����r�e�D@�g�:�!��l��1�-fp{����[��{�F|6�}��-���)F��쥿\rk��>f�B�n���z����-x�e<�|��o���M��\0\0\0\0\0\0\0\0\0\0\0\0$�X�ͺ�/��_N��^u=�F�C���>���$����z�|�[��|���C�8^vZ�\r��k;ۚi#̲))�at���9cSj�2�hڣ,}�@�`��n�ɹ6禃��8j{n��gG�`q^�[\'ӹFݳ\\g��-�G����9>ݹ�K�m}M��}��ߨm~Z��hK4�F��k[O���d�#�ш\0\0\0\0\0\0\0\0\0\0\0Bia�9gV���a�ַ��c��X����m���/O��G9���th��ȣ�V�������2��{�����Yl���Ϭ��Nqy�ԙ�,z5�C�\Z�����ڑ��O*h�y7W�|�v6�W�u�)y�,�y���vk��Vv�e���Z�{�.���b����pxی�O-�xѪƆ�nc5�R¦�$�<L�{v���w������\0\0\0\0\0\0\0\0\0\0\0�aM�z�#��w	B�.�*^��;��õk{.�^��̶c��OVi�N�o#a)y������Of��.�c���²�S8�rR�¥��K���Y;�&�a	�!뼋�v\'��n���7.�l;�yv�\n��绯>׳�b#&�#H�T�U|}�;wn�iU&��c�U�:�8a�VK;�l�+[�-���s���;Ц�7\"\0\0\0\0\0\0\0\0\0\0\0�sN=�xר�k�jR�r�7Ե.��s��͌�o(Q��1��<�q��d�;~v{u�򍁂���GR�N1�٭�l&�al#�4�	D�����Nͯ�C���ͬӷ-�-��:��mv=b�[�Oq���Ol��7(��:MM�m��6�9\nv�_��ݔ���Ֆ��,zޛ�F<��H\0\0\0\0\0\0\0\0\0\0\0B04N\'��g��kT*R�|Xө&z������Vǘs,��C\'J��O.S�a�/���m:�\r�+�{��X��%�������ݐѶ�_�����\n����~��wC[X�W��4cV�4&\"@F1�R�J(�1�,f�I���M��\0�B�\'��_�7܈\0\0\0\0\0\0\0\0\0\0\0#T󿥼��x�jq��p�ҍ:��=�G���K����|��*�#�v���q�巣�K��{��3I�����v\rn�����l��k�[���n�����4��P}\'N(E����}�m]����F0�!BfhK69M,��t�!T��kh���!s5��.��n�o5��}��e����󝘀\0\0\0\0\0\0\0\0\0\0\0B01�\\�_���|+�oQ���{z��VF������\'k�e�1�Yc%�2��dŐ�IK�f\"L�7u��J��7f�5�4jT�P�C/�5�}U0�1L��{�/�����s�}o\n�Z�����d�uvu�m�U��6�Wn^47ͭ�\"}��*�{,���?^n+t��͇[���hlY]5�r��z}lϲ<q�R�9�\0\0\0\0\0\0\0\0\0\0\0\0B0)y_�^a��;�oU��F�J��Ui\'�>�d����De��+�ҋ���(�K��1}J5��K�Ֆ2\\����W���ŷ���I����nki������غ�\r����z�*�~�X���fΑNx�#������x��������vޔ-��_^�RޖGS�[d��sS%�o�Ԫ����@\0\0\0\0\0\0\0\0\0\0�y�Ҿr��kZ�z�=N2^�o��$��O���k����9ϰ�nS�4�´9v�U���)*B\"�-��6_6v~�Sm�[[�B�h�\"!$�%F��.�\ZN���}o-q���������B]]��*��R�Hg��|d�(F���I��C:�1g�v9|#:�N��t9�c�C�<���`\0\0\0\0\0\0\0\0\0\0\0\0	|��=t����K[��b6=]�BKWY�^�L�<s��_�%�<�-�O����w\r_X�WLz܎�ܲ�Y���z�Ώ��S�_��Z�v}#YL�d�X��I\'�ļ���tgd��_��ZZ�Q�|��n�/P�a���}����w���-ys���6���m����7a�~�ݸE���t-���}W�/Opv�B<n�\0\0\0\0\0\0\0\0\0\0\0\0�?zϽ-koZ�����;{��v�Kn����Q���W�0�r��g:���c�ө-t9<L�ο	gj�L״mz��o�����&0��$��;ۧ�����W��������O�ғW�\\�ɸ۵͉���v:�����7���h�}��qf�ion=?��z%�I��;�g��=!��@�΄G/�\0\0\0\0\0\0\0\0\0\0\0\0K�{������S���@���z*Y��]�;а���jsZ̺%����-5\r��GC�K�C/h�9p��ߚ��y���F�iH���F\0IŻO��h�p9�O���B�MM����\r�Z����?@k<~\r�Z��kQ�\\�2�IV��rxVf�C-G*��,�:���ܸ�k����n\0\0\0\0\0\0\0\0\0\0\0\0!/��_wOD��Mc����`�:_Y�8=�YG��z;~���u0w���O�^l��NG�ֶ��|�B�=wOȒ叮c�(����O`M�������s�8����;T�/B��S,zw�{���I������\\���Sa&b|��Tͬ�W*��}[ܦXa&�cf()պ�OJ2��J1�R�wn���ǃ��\r-��\0\0\0\0\0\0\0\0\0\0\0����n9�n�����Ѵ��\\�����$r�Xę�,1��L��N33HN(FY���W���\r�-�Y�����m�L���}�G�4�=�[�.E7@�m��Xu�Yf�a��2Y���D#!4\'������&/rx%2�HM,���J���e�ޕ��~Ց���\0\0\0\0\0\0\0\0\0\0\0\09�Eѯ���f=o��b�MJ��[W��U4�ٌc�BxE0�L�0\"0��};�o�>��K�v>n������o�,Dc�����/�絊����8Y}ƺ�9���e�K�Ʉa�tjc�)�\'��n�+XW��4є���и�ŵ+�35e�9�yg{E���0�\0�����Ȁ\0\0\0\0\0\0\0\0\0\0\0]7s���71���\n���ңZ��KRK\"�Q���Č��2M\n�x�c)���r�ǭ��X�(���\Z�N�}���פ1�o�le�)le��C���_E�O���󻽞�����_C���3�)�*��u���_��z:v+#���h9�/S�0��|K����l��#ms�\\�\0\0\0\0\0\0\0\0\0\0\0DCZ�09��S�}WD��p{��c�\\�էer&�Q	�#LЛ�kہ�n�����[�az�Z�J�o��w��X}[��Ν�{6�pu�k��<쵩N\\סyT¥[ڳ��c�׷3�;G-���u��y�&�g-�\\6�\rkp�n�~�Һ����u�5#���w��g��`��!���vJ�g���w��ym2�a�t51Y{\r��YRY�y��\0\0\0\0\0\0\0\0\0\0\0\0�`C���\\ڵ	=g1�nz��v3�_o^����T��EIe,�u~]u����=��|����R�2])i�u�4ktr��\0C�ܿO޴����xn=	��q�y��1�_�e9=C���6j�qL��u���J�p�i\Z��sn������d�*�[�������e�CS��~�8}�{Dy��5L��oQ�2VQ����u�m���v��m~��&���1\0\0\0\0\0\0\0\0\0\0\0\0�D0��&XyJ[�޻�cyo��ϒ��k�	�#y�Q:EN�����~�KWk�Ѱ{�v:�N5���r������\n�Zv��t�n���[�z���O���\\�FkN���>��݇����ŭ�=/Z�^���S�֥[C������K��|�-����=\'�d5�����SW�t�K}�S���j�_�a��~���׶�f��Kh���;���l�v(�>O�Bb@\0\0\0\0\0\0\0\0\0\0\0\0B����䪵,}W+k�6�X]�W�Բ�4��E�C��?�l�xL�S�y����\0��y�i������.�-����7���/Q]�ºO��Xeq^�����\\�.�Η��k��SG���Y�9��e��z��՜Ssպ+��$���\Z/8�{�_�c���}cr�o��_ə�����b�.����:�W��e�xL�S�B�+e}S^��g�ݥ�Y�����\0\0\0\0\0\0\0\0\0\0\0\0%�TykS۹�����~[��5�Y���q�i�n����^�8L�\Zng��(��wG�����?[���ԫ���`}	�����ߧm����p�jޯ�_0z������t���;6��$�h���Wz�[@K�E����a��~o����~�����O-�m��+z>�[?�����`�u�/�|�y�]i��+�f�w2ѥ[K{g���NS��v�x]a	D\0\0\0\0\0\0\0\0\0\0\0�b<�ϺN��|�:m��j�<k[�U҅͘l����������}�[�ϕ]�9\r��~ˬl��n��7�{o:oF��5�׺�N��ML�f�c]�רD��6��q�V����>Gs���r�;8���]lj�o�y�wWM��sl��fZ��˹�����g�y�lFς����NT_�5��m���s�ѡ���u�/z�)���\'Z0�@\0\0\0\0\0\0\0\0\0\0\0�y˗u.K���y��i���,�3�Gb���F��}օ޸ξ�=K}�W��?�\'���~y$����!��;�zM����8ֵ������\0�(���m:\\�cu�x��f�N������>c�=�em~E��������Ǣ���Ψ������z%�c��w�]���^������vn�o��oi�Z�e;6��l:;�����t�w��K�q�d&�\0\0\0\0\0\0\0\0\0\0\0F�9gd㞷�ƍԛ��\"��F	�������2�����k��_A�n�?�<Um�e���4�=ή���%��ٍw�o�)���s�5|Oڳ�9.A�l��m���Tެay5��r[8�8����v\\Ϣa:V��3��NU�on�9��g\'3�Gz��.u[�=�˷��=�S��=�N۹�W����t��O���jFq:�D\0\0\0\0\0\0\0\0\0\0\0\0��`q.�o=z�%hӏSIB�i��c<)�z7Փ��}J����F�_��J��,�sF��M���d�mW���zO4��}���{�����94��K#��e��w����\r�;�]3�1��s	}�T�����<��N\'���wNGC�s��w��M��W�syf�f��C�,V͚P�����ӌ��caֶ�GF֍�)���>��t�F�����\0\0\0\0\0\0\0\0\0\0\0B0\0�>r�	��{*����\nu��Umn�UkU���s��+��d4��+H�����s�>�푚���Z�ok��\'�n��{}�X�i��\Z��7٧�Ե=ʬ<��{v�畱��Ly�=�l��ٸ-)ܬ6�^�c��Т�y�zcq�d�aɣ��뗧���w\rj5lS���w���=�\0+���rwr!�׿�/�cCb�0qz�\0\0\0\0\0\0\0\0\0\0\0\0F\r�@�\\}n���\"���kQ��5��0���L�9M^���R��~�?��m�_�[d�����\nN_����k�64���M�N����o��k�~��αi���\"��H�e�J�&�ؾ[�v��:�2�2ێϋW�V�][�v~�V|�:6���0׳W���܌��3\Z��4}��ֲ��g���ɸ]ic�\0\0\0\0\0\0\0\0\0\0\0\0Ka�]S/���\\D�XN���L,�Ug+�2q�z�\0\rw�-�Y޴wrZ��6��T��������Ω�;5.\'����Q��n�~���ʰ׹�C�^g7��2z��;���+j#�j̜�tބmty���N�y�|l���8�,���<���=��2�i�9�7SU���9�[��-qn�.U�c���3�}{1���f(�8}�J�]/Z��2���B0�\0\0\0\0\0\0\0\0\0\0\0\0�%���{&�鸴����Զ�Nm�z���Ւ�bs�s���ɧ��(`�S~��:W:��]�n_;���v�b��n��[�k��[_���ק��[����)�1\"a���K�]�3��#�^�z�/V꽻��/;�\Zή^,�l��u��tn��+^���}V[7�+�7��ML��^Ǜ��̦���;�����.�+7���p�8��ͺf���a7�I\0\0\0\0\0\0\0\0\0\0\0\0�`#$���o5�����]}X�z�n�;��e4���k�n�֩l�l�w����7��t����\\c)O��LU^sӺ~���.���_E�mNG��y��cR�����I�I�%���6�5��GN�Nդn�:١m����9�)���G&�Sɀ���9���[���\Z�e�ئ���P�t�}W���m�#�ꢄ�\0\0\0\0\0\0\0\0\0\0\0�R�k�\\e��q�Q��KJ���4�^��S�����Si�vj��X�kj��,r�:0�?9��$�[E�e��W[P�45���7G��|��2L�q�{ic��_�^�DZ��sb�%4��\"���:_�F�����5]kR��kV�\'J�Ů6�,��s�2�~�˻6�\0\Z�\05m��m��vn+���l�#���3 \0\0\0\0\0\0\0\0\0\0\0\0B��8�[]�k^��Fi+ojգN���\"��ss�.p��z���j�V�Q<�|�/|?��kP�y�^s��i~���]v�c��n�Wf�	����_Q㘎�?ӹ,�_c�����ҡ�<��6u���;�W��p�z����\"�3T�{��n��Yt*Щ��c.��/MF�rǦt�Nۖ���N�֘��n��;�p~�M��a7��\0\0\0\0\0\0\0\0\0\0\0\"�ڮxyw����\Z��lWN�&���Sֺ���:�+�gL,�	%��]�/L�<����Y�`�kR�X���y.�»}ˍ��W����l4nmZ^�{U�{�^�;h��h�w�����.\'96���>���<���U��ѵ�ꞃ��v���Tj�1��?�Mkwm�N�Ыo��ET�S�m1�s����\'�r�]nф|�|�d\0\0\0\0\0\0\0\0\0\0\0\0h��:��6b28�]Þ��WUZI�ڎR�b��8��WJ�`��<\rZ��M;��FwP��v8�Q�ϐ�n��F~m^��ϩ9oO�����[۴>uq��	�i�]�0˪ذԧ��Z5�3�y��\"��8,�B��_G��=��/h�e$O	�8�A��;߰N�>�����/,)Q�׶��Gc[N�O��	���f�>_�E \0\0\0\0\0\0\0\0\0\0\0D!�:���?Y^���Z1����ƅ|����u[m���:Y1,n�m�n,�r�;���=+u�k߹;��3^Eؼ��y�A�fٹ�M�i�N�uڴ�q8wYYq�{И�n�i�ԛ��Vy�!w��ڮ���.���)�EHb��Ii9>:�\0���{�����Y�l�YT���Q�P�6)�v\Z�\nV���ר47:La\'݌	D\0\0\0\0\0\0\0\0\0\0\0#�����[�q�=_�Jq�VY!�/-*�kU���d�Bz�w�IrX��#��9�gd���������1���{?5z��q�?U�u�;���?��U�Q���6�����N�R��Sb�;�}^޼������{y�����\r�㹵�%eջz[~æ�:\\��g�֌��}[��h���c����b����O�8��G���1\0\0\0\0\0\0\0\0\0\0\0\0�e�ߕw����}G*Rl�OV�(�w%�B�k�_[�c��޵yQ�]��\'�c/�ly�s3����s3j��oњ.\n\\f�g�\\��\'_���u�펇���v��Si��~f��+��U�ac���6�{��Y�}[��[r�<�\\蝍p�����1�t:zy�םn���{B�vV�f��4�V�v��I���<.��4#�{�\0\0\0\0\0\0\0\0\0\0\0\0B(�\'�<[���M6C���W�s�T��6xF���<+T�:�׸[��/�Yc���+���ٍ)�fӓ���ޅ���ۯs>�i��~�O�[�zW�缾����3��s�k������a�u!S�C���<�H��kas�*�nm�[\rSoKn�Ҳ��u���E��ۮ����s�ֿf�a*[�\nk�-�����^����a/H�%\0\0\0\0\0\0\0\0\0\0\0	cD����w��apu��y]g#�9k]�5L�2���vө�����l�����N��0L�%�l����]��:�}[)����kYM��(�z�ϛ��s{���4il��v�6�.[\r�u��7x��r8��R����nvkm�\\��.��Fq��q,e-j4�,�|,������֥T�}��u�Q�z_��z�:���ߌa�\0\0\0\0\0\0\0\0\0\0\0	x�f���\\�q�f�6KK�jp��M��.L\'{����K�Z���BM�M��U�����.��Kg�����Zy��j�\n.�o�L�����c���Dp^��Y-y��9���}-���д��ϸ��o�U;9��Z�)�P��[JEͭ�1�FD��*F��-)1�\'\r_4��%���~W���{��o5������\0\0\0\0\0\0\0\0\0\0\0�X�wث̙l\\=G.z��D�4+Ք�Kfs(D���g�6�j�ݯ�������m�Yfn���d�ԓ��J��1�*P����Z�6��V�Zܖ��\\��h��5z-��%�Ȓ����b���^޶\'���N�Kc��!3�Yr��2&�SMqR�Zs�KHYQu���\Z�[N;{�WU���Vm�Y��hx��N�q�7�\0\0\0\0\0\0\0\0\0\0rΧ�����گgK����6*��o�ftywir�P��K(�Y�3�������F���m��(ˠ_�z�I��%���h�tV���a4����1�|r�Y.qF�ze��^�v�^=f��V��	㏯*�<%��[5�Jc{�jwR�K����\Z��a��Ӷ��MJԥM̶�1�5vZl�f�^��s���Z�yW����\r[�\0\0\0\0\0\0\0\0\0\0\"%L$��HT�TR����eؘ�dP�C(�&\\�4���g\"`eύ~Mr�|`���2l�aeZ�T�U\nq�J��zW���Rˌ\r�Ά�OqLiM�i�6�\Z��lS�\\�Hc/��D��\0\0\0\0\0��\06\0\0	\0\0\0! \"1P#$%0235A46@B&`��\0\0�\0�ߎ�7�o�\0��E�D��T�R}v�u�	�ڐJ#����L9�����h�~D�3��\'?`�_��_�\'�Y��l���������oQ���i^Yf��ْ��\'!����L��I���Y�����CF��#��n�<�a�ʵ�7^�|�(n�#��1�*�\n�K]�FQZ�iY�{�${Dܧ��k/���e����y̼���B��B�}���C攽$�E��Jk!�eM�v��>kf�U����\0�\'���	}%�Bl\'�t�@�>���/�4���]�=��5��3�a?��mi���6F^ͬ����\"B;�����3S����:�¤F�5�(�wj�v�#x����x�Ǩ���9��7�����o�[d�m�BAi#���\r�P���l��:c�P)K�N�Gxَ��ub�\'!T� 4FY�����G�4D0�I�ߡ�[C�J^� u[!�@�u�]��Gu�r�]�뎩X�69�c����9�f9�����z��Z�ѯ�r n���2�u!��C����ͳd}���Š�4c����[M�K%���DN��d��df�D�l$t�0D��\r���SI\"4�m�rlm\0�@��h�-�mo�������Mh���0�\0g��r!��@�h\r�:O����C��930ʈ��4�QAǏ�2�mq6:\'��c�X�Vc�X�;Gh��;\'A�p���!�����rq��A��G�mc�F�v�v��htX�	��4��,4��������@�3z�r�669\r�����\r#@Ȇ�}G��|JL8�\r$�v�EiF���F��!�P�\ZGMC��I��tt�nI�!���G�|/>�\'��6�7N-pvF��AAc��`vlk�`y{@�;&t���Ղ�C���F�Z?�C�߆�\'`��c�zx\ZM%�c~	l�:#�G-�(\Zll�89꬇U��tu^W�U��xwO�9ow.���3c���2Oԩ���\"��ׇ���\r!����\"*���Lqp�m���@ց|��Àּ9��52�p�֔a,��8��8�\"=N�j�\nG����^!ȁ8A�-�X����\0�ؖ�LGM�\0@�52\Z�/t�Z��$�!���~�?���^�\n2�2����K|̪�2�`9��J�-���p*B̶�&��s�bI0N�R��9\r��/�>�0�\Z�}_q���Y�*�<�`��f)�<�`*���&(�<�h�i��&�$�<�h�Y��f�&��aC��2X&�1�tt�ˠ�|�D|�`�[,y\\��i�/\"�<�h�9���:I��Sc�����ܨ\'��9n9�wȃfʁ0ɥĠ����3!��0L����+����Je��}\r��vi�6)?���v{,��5DoO	zy����x�Xv\Z�b9X�V@�����~f?3����K� ���d�#��� ��l�+\"��:BCVL<���\"�ȝl�f�!�A�I1�l��hv�ّٰ;6f��Y�t�C��m���/�>����~��(}g�m.�;0Pc_�~\Z@�k��ܛY\Z�2\Z~��9�\r5�%�����|�릫Bo#���֒2(*�.%a��d��Çcl�i\')�#XG����8�C��9~��~a��C1l��_3��K�s�,tD�?�=Ml�|;�ގ���$w�`��`��)`�v)b��9�	Y/�@�ޝ�B_-��d9llS�a�䑉ڗD��-|DSb4��Ws8ͥv\'ߥ�&�d�t���L�CSqh��\n��F!Xӕ�D?+�ډ�hkܻN��O�~�p���?q?{_��\0�~BXI2�!!�ul!bDCh�����߆�Vh�u=�\Z� �p�ߋ�tY��\Z�+�a�]vEqS�q\\zE��)�~Cq��ads�H��S\Z�\"�mF7X�:�=ܞ��1�1ڛ�j���#��~/�Zn��㍧�-܅��Lv����\011���	!�7��#������r7�U�uIAE����J�|�E���\'n��I�3Xn;|�ކȘcz,����ԙ��Kw)��WoY��^M���ܷO����D�l��Aig�cO�(s��Y�章@��OC�X��9-��XdU����a5s������NB�%ǰ�I)��ށ���#�R�I�6Cb�]��W��㑨�&�(�aT�y4�̥��\r{�x=�h\n�mR����v��\Z�����#���[Ź��̙d��[�fB�v�U�ȴ^�ߣ~����/�y+�Oƅ:���i���:�LH��<^|A����eP͑mmY�U�	�z�\'�����g�ē9��x�\0�wF4�.��:T��%P�7.�d�F�f�tp�[s#(/wbg����e�q��%�ۭ�, ��Nz�ќ�EZ�����K��@�&.��%*;%\'#��[�e%�[�b�;�W>G{�zE�K�~����&�+Ɣ�.���R[Q�s��H��l��d�\059��A�qYu�*�:�j\"Gq��캈���L�OJ��Q��{���\0�d9�x���q7Gf�mٲ,)<dc�\"HM���~�<L~�FH�6�u��u�9Yn�X��U\"���Z�g\\fU(���Z�h5����}��̂���qT*��8Sp�@�KL�%�_�f(�\\��W�W�[���\0Í%Ē�\nb>َ�Lr!��R�\"w\"Q\r\r{䐄�t[�l?���ԯ�K��2���0�����}�\\n^#6S��u�/a��s0��t暚�_ԍGR���2���Kpi �!���՘�\Z���i�q��;�^�r��-�W8�/+�^I���\0�/�}4/�`W�B�[�\Za�!&;v�6�d���yy.\\�@�,vN�c�X��:	�0�\'��F��\0bȾo��c]e���*��ɾě�I��O��,��|��p�G�!���;�H_d0mizʅ*���l��nTƦ�Z���؇O>����9B��k�۪Ǡ��#�>\'�QJ8T�5/�{g0f:Y\ZxTx���T�_��ӳV�+:�ٴ�)o�춗�c����@��f�Ri\r�lclm�(����iQG����_�@VSy�b���2�c�|�yt���p�]<a81��B�]��X�}:o�f��ο����VZ��vA�L^@�6;f�f��)��CC�tw�)�`c�X$��w���ق}7�Y=���k�l_l��$�˦��<����X�*��`�S��uC�1ق��Q�GltP:I4�	:IݳSQ�˴I�S�L��U��������\0�Kw�0�I\'�ˋȕᱱ�r�-�PnJ�lK\'G0l�%�t:H48���K�@�zj亲�]�L��J�F���s����\'I�f�\"���g�ʄ�l��Ǧ�oǳ�̛�.R��y��|Iw1n\Z����׏�%B+�T{���ɿ{��B��g�P��O�d��H�گ�����\"ws_C�)�_㦗�/2*��7[$�)[\\����XfגZ��j������}ً�6k��K�:��\'۷B�L�\n�<�D!����f_�\0G��/{`�lll��r?�D�GR�����>A���\0�/�f5W��o�َ�(0�\"������\\8뛜�HYU%$��W\"�B%��U�Q�\ZC���-�܅=�5S>��EO�������{�����9\r���G]���H�uR:�d�q&5��X�/�X���\0�E����HBC=dG�R�%*W\"RG��{�\ZG	�?���\0~_#=�#�c��Q�44`����Sd��FFMDq䭮�қ�L/�k���(�_������c�:�]\Z}��8:��HI]ʂ�>`�\r��l�\ZF��C��	\0�q�l|��{��~z����S�&�K�J���gb�۩O���&���g��z��c}	����&�R����TIA*�����$}�U�f�c����_k����\'�+�9�-#�M\r��[0p��c��<����g����IT���9�2O�\0�?�v]�U:y|!OL4�F�׷�;�j�6��)f\r�5��~�3��3P`����>����i�m�a%����ׁ�ZH��;���b�;hd<�+�f\n�2�_m�9��	�Ioa�&�*s��YF�J0�RH�9QD�[\n�ͽ�c}m�g�\n=�tЋ5!��Y�|���Q�~�b��z$��G���>͊��������<I���RR#�\r�!�ӈ�8�䓉2�^1e�\'�g�\0�\'��)Ҕ�6����i �6ASR`��b�Hw�|���a�2��W�sx��\r�����n��RJ��=?/��O�+..�xV\'��x[�\"�=U3�.I%�cXՋ�����M���̙�_h�#�?�\0r�F8��CCA*SF�IoGᡡ���S�6Z�T�|�?V��C�ƨ����kup����1B\\�B�&ۂ���/e��f�!Rrj�n��fdB���.#�^3�������~h��#���?sG���o�xB���x��=����{�ia��\"�l�Fz.�=�솥�	x�B��\'�Hd��2�wE1}����D���,�w�!|تR�j�B�UZ��-Ec&ˎ�Ts>=�±������)��X(:L�u�1�G�d\'�?C��\0?�{B�\0�?)�1C��|�\ZUq<z%�\\~��e��*fw�̜��au*��k�d�s&9}�-\'�b�\0W�5敳��DƏ�ǳ%���N�8�\\c��8zy]��C�_IV�I��cO+ѓ�k�u�����[\'�f�nb�y���y�bJ��kƵ�\Zf,\r�9F�K7����*Q_KK�_�a%��a�9s�)�OhE����G���{>�����\Zog�4ǡ�3Oh)����M��G��]��Z��%��~�ft�w�Q%3J;����\n%��-�EEkԖΗ�k���(�s�SQj��5:e��d���v�S%%�zI�N�V�m76c3���ׂ�C�8��?���_\Z?l����z��,:9\rEi��W��s��þi_͜:/g�������>4,��\"e��C5�2>��ݜڢ�}4�s[0�^�-�9qN����R_�?��G\Z�O�&Hn��/�<�5y%D��5����U<�C��9���Dө�Q�\0[�/ɿ�3�Q�{;W��$.�&��d1k%P2g�(��]e��8�<�u-F���`��\r�z��AGQ�ǳ���\0�e�\0wp��Q��A<d(����TǲO���ϡ~��^\'5�F��-!8lpX�\"�W�,b��TPY46�\'��[$�[��أ�\n䟘��]�D�J�)6sʖkW�������ҌqX�:d�Θ8N���-�{>/����js\'Ʌ~ऑ���R�V����@�A�s��hu�1�#���乪��fdA8���� j�f8��n��C�\r � )!��$�-! �Wώ�����?F�KO2撣٥[-�Q��6my��[6>���{`C���y݉�g�1�PVOp���e���XS���\r���v�:&:k�I�D��Y��۠\'.�HNmj@��2n��E�Y�a�4	:�u�������ԁ2����x���q+��Ң�=���a��5���>�$sZҖ�z\n0~�D4448��xz{�c�/a2iI4*��e�Xl���<^� ��� ?ހ�	m�:jo���(5S1��+���!�p�\Z�o���RT�L�%}�\nm~�����\0A04q��6v��e8�ӊ�2=�@��ߧ�P�\0n��e�=��o���ʴ���5�&�WUY>��ͫ��j�\'d1�O�Ev#��_�D��!2�+H�:Z��?��B��T�9�{�a\0�<1<i>����lǸ6�JpL�iSf��^�\0��|�Dlɜ���:�Rb�R�t�v|��Z�q��잩��&��gwy5�UX���2�V���l�˩~\\�o`�}���F�445�C^\r�\r~�])>����&d�[^��F�Q�j\n��=�������؍�k&W�ؕ�kbf3c�˫n����5�\Z�בd��E���:L>+�%31,dד-!=^���[3&e��iW�\rH�8@������8\0�^�?����H�S�l��&��� �n�0��켸�˱�8�T���A,�m�vD���TI�C_��L�oM\\��FQ-�X9:\\L�S\r�˥�n5���M�k��3�q�bkA)�4���SːN��a$�h�6������7�7�I��U���4�/^\"9|U����9n�)�0��6]q�Js���F_�:^�\Z� E�D8�#���JQo��\n_�\'��_!vT������LV3?/�T�v뾌����\r�ȐNc����iK4��`YFj�3�y6�#��O#���HBNގ\\X�6D[�����I����|��^4>^�����lA����_P�a��\r�#��D�e1h�y�a�x�$�H�\r�S���,�DK��+uB��:��3;7+�ĝ�ugXݛr�ݯr��1۱ˣ�[�y��m�י�R���y�i�9\"Z�T�è�6ƅb9KG��5�r��z}�v��G ������\0<1J�I]�L�%����O�~�-RSM_vx�ǡ;�O\\e/؞��Vd)�ލ\r			H$lU�QgeT˱$c��]N�[iKhb5��_L�1\ZS�߭�f��m��ɭ=\\3Z���I��2N;�X��\"t�X��>.G4�A�kGJ�+�}\Z�<��ע�N좒\r��?�!��S�ɨ�1���~a=���d�\\���I���7�ZV���I�}��׈ F�Ӎ��J���EbLuL�����N�\"������ff��7$�>�W�L93$X�^\\�­Dtc��Q��H4�����\Z�4C#!�*�N4ޏo��}����\0�Oou-����������0�Q�җ���$�]66��eC�\Z��-J�xU�0�/�m�I��l~l�˨���zs�1�JSZ�{������Z��Ζx���cufU�l,��c��<}�t�VT����I��6���&�ԍ�FҊ4���)ШW�\'��	A\"S�O2iZ�닷�B�=�ꬖj?�\'�p�KF\\U�^F��J�S��1hd24���`k�ɬζ��s��nS�eiR�ѹ.M�2���V,sF#;Y=��Rfţ�o�ɚ�tҪiG*���z�cǫ|����J��GC�\'����;n\Z\'|J\Z	�-�F���%�<�� �(��8�Z\"���i��lb������ʵ)��M�B�S\Z��b#�N6+%����r��v$Yd�k�b��y�[֧;!Ur�I�Z�f�B	ɗe�>�X�%ڮUr�/�9E�a�˰`b�\n�m�����Žir�v����f�Չ~����qs٢3B�f�[��c� �����!\'����ҊzJb�\Z��d�P�:�K�h���`�+\Z�4��x�?�yh�˃��JҰ�m�z)<LQQw�\"�J&f����V��r�r��Oe�%\n��-d�0��ZI��<!kQ�S�,n3�Y:�\\K\'�T��@�~�)&ۃ��D��WW`�!�Q��\0p*�VD3��X/�U�]�e9l�;�+8�꯯��t<��q{�#�jk������K��O�FzQΔ_\'�PL��<}C�Q������O�ʖh���qe)��\0��58����>B����Ċ�q�&L���\Z�k۳�yg#��,��u?���G3��1�n�f	F��/�\r�����0��Qt�I�^�H��#M�����RV���)�9��T��ULo��l��&�\\��%��ᨡ=�Y��A�ܛlN\Z8B�-�\r�\"Z�Y��S�ߣ��I&���R�RҖ��h?p�P�mG�ݕu�\'�o¢We`�sFr��*��R�Z�6I���Ȁ�*>*ܮ_)��\ZOQ�Z���|m2��:|!ܿ\n2�g�׮U�mK�ar\\��ҮJ�E�vN\Z�܃@�κj T�\\x�\'\Z)9k�%̓d�4ZKI ��C+	P d\'F�YDu(O�$�Hȋ��߉��8��A0�������1;���$���#�Vt�f���u]�0hZ(Uʗ#vb�yL�ũ��U{z�q��ԫ׃L���b�RB��E���ǥ�|k�ՅD[�jb֔�]F^��ʑu1���]��H��rP�PA�ѯ	=]\r�%Cb�+����ރ�\0��W�c�i��vgk?2�͝�bօM��Ĭ2/R~C$߲!�6O[eo�uϫ���*�:�-�ViT�g�G�1�q���<ͽC��bW�1t8�+�r�KS8�{N�>-{rd=f��	��R*�H&!$�R3,�W;P�� ]�r�Ai�y�E�\r�գe�D,6{��̥�����\'�_�2��͒5�ʍiUS�NGq���J���THiQ���3|~�e�����L�喉�$�º�TWs�%���v�2fS�U=а��*2��S�}4$���*�Òn�7R���Q��Ћ�?OK��h��^F�c!�}�A�v���F�J�Hy����\Zwfڄ�\r2M����돣�W�3$�b��d3l���H]�fG�¶b�>,�FX�IrUk�m�:v7��K���Az�Z��rtf�7�ېp��kXʜ\'-�+���$�ʪJީ�&��?�Z0��EA��\0��h���\n����\Z[jF��{X�e��wM��z���u��d�LHv����No����8�V�c\r+g1k�FW3x�k���3��c�l\'m��!H8r���G���I,��� !�:�\n\"�\Z~/!R��4��v���w*,���e�M{@�\"fY`�j�Zճ	#Q����d�Y3��ɐ~#r�й���n���8�2+�L����\'q��dLe1��+D�\'�����Q�b�\0LԥN�~��3Pg�����KЌ����0�M8r���=����#^\'�\\�eͅ����¿���|@�%����Vў�Y[��qk\n����^ee�Zݜ:��}:�V��yb܃�>\ZԌV��k��6�&8�$���8��mF���xrK-��	*qJ�Ci�ީ�_�Õʠ�B���P&zv�\'�Jkk�HWɰ�����/�.��!���?\Z��R}ϑ�t�#�R�T��[Gc��ʚ�dv��!<Gw,�����x�4�c��I��۬]�o�Б*�!�?���_G�qIqP�<�y��6�f�\'T�A�����	T���NI�=`�e\Z�RQ�3��4�#�ҭ��&bS]���MC.�\r��5��*�4[4>��*�K\'d)D�����H�������~�$GW�h�a�Y\n�1�Lc52�$��KbSȊĹ*�\"����]#X��\0�{�l������3q�h�[�bUID8��S���xs\'*��9	3��Y}�,��q���TzLr*_��A^�s�g��x��e�f�8�6�%���ز����U�8R9�пS�%3�b�I��?I������!_��`Ӱe��늘��HO�$6�J=\r<FY?��7�u��8�JPٺ��M1	>��}M��������SW䱺�xd��Y���VY�8)v�NAd�d�e%�H�������9�8�Ry0�H~;WP�K\rpC�dt���6�QX(hR�\\RJC]\'i�uXY�\"l�%\Z�|ȝI�z������w?z<�AI��Òc� �^��!#�S$�v$�T��ɘƒI�|�r<��r�s���p%Ŗܶ<ۺ~��2���	J� �FC�ȇ,�lux4٪�����;��q\'�HM�:�$6�,r����Wj�O�O�n:,m-j��D�zŴD�� �J,j���4�{�-F\ZOT�}8��R��K�!M����O�3��3����l�I(�!����mCa%�����o+���I��M��V����S\'�Ej�f���U�lt��龮\nBVI��A��<{f���c�}2���\n�5>�X�2QO$K��q��\r�]e�����U8R�J��u����.�ySM�J�j�}<a�}�M��6ω6{	��P�D0���G�\\Es���|�<�q���Ca-�#%�:6Q��u�x����E*uq��[}Ÿ�r?�<��G�lD�#����a㲌���X�8e\r���ĥ�FM�A��ЏP���Cl)D��F�M�q.i�1�Ϩd!˚��~GQac�\"�r��*�L�i:����M.8I��B-�G$����-k�_R�����[?U�#�&C^	��Da��\r�F�cA�Z�$�鲵��}=8�p�\n#�����\rLD\\ߖ��ث�\Z\\9f����k��Z$�u9�u\r�vSL#��9�A�SL�K��cDb8D����p�P$yҊͭ���E���(f���%��k���:�B��HM���n�N�A(�u��9����u�B{��yF^��O�k�8\r#��U�pyzp�^�^]�~��Q膖��|�������|�lQ:���h��7��,j&a��ɉ5��ڤGz�N*~o�ɫY��]-U��e��Ixq�$�\\Dv�/b�\n���j �mI�w��|s}�N�/�l3�+����rKd �cY���[�Jv����2\r8d��k8��$��\r\ny�H�f3� JI�e����[a��t�U6��\"k�ˬ��]�Hu��Q%6��8���d�f��UW��j��:h�(�Ʊ��/�CL�ۋn�ږ��G��`Tr;�h�$Ī����ŒM�i�JI븰Qep������/E�D6����7璘��v�]+bL0��i��aQ;��P���MCgN���b�h�m�� #�2���7#����L�i}E��Xӽ�&u�c�Et\'�̚5n{8���R���c����7@����Q?���h��\"�	��c*�bJ{G��d�[��3i�y��0�V��Y3�*��9n2\rB��L�i7d�N��p&Q�;��O�l0[��G��\0[�?��LW���B=A�����m����\0A{�4��HZU	�|x�n��Y�D���f�.�;�=y&���h���A��wVkX䚻�46RO�	����W\'��/A�ᣩSjP�$�%(���^ծHǨJJI!�&�Υ�4��H،�`�?�f1��>�c =�i<�-|�(�l 0	ZF�qR�<{��.�\0}\'�(��0��G��UY�JI8�C��>�(�J�����x�I�AG��q#\Z׹%��y���LjI0Dԯ܂�F��MdS\re�2^6��h�\"��1�LWZtdi6kD�t_���������ʷ)���ME�a�/��Oz�!v�N��p��lt�$���㊐�5�����$X2��u����`�(��Q�	���45���[$��k��i���N�q�$���#D\Z�3в|Н�Dlܕ��VP���+k�?��;���=Ȕ��0���G̓�; ԗ����p�Q�U�Zou���H�eJ~��讷-���N�bJ�ǒ�5(������m��#=E�a*?�]w_�1fM��QD�G�D���Ň�Z��=�!������G�3=^�W�C��ɾ�$�a�3�5h:�^_�7����s�ʸ<��$�/k���\'\Z�P�^�i�C������fc�q߄���\"LTE��$#^\Zp�Z<�QG��O\'-TM��JC�y�	K7�$�$�������#r��A�hZ��ٻ��?��<���\0�����?�\n���y>����M���A%(䧤)~@�G�hu=7`;�`�#����jbZuN�X�)�P�8��3\'�\r��%D�brLU[.�)�!L��\0��R+m#�0%�G��%�F3�<Y�OFĮ��\ZN�\\�o���������45����|�-�?��ό��|�8^J@?�H�%����8\Z���)����6-��ɨ{�����6�d�;�,ښٙC���%d�\Z����k�HzM�� �8�܆�]�gE�\\��r��e)wx�$�m-��E���\'V%M�Ir����F�A��v�6�I�N`�o�x뽝6��1_-=��\'j:x�6�An8f�!C������T��`�p3\r#�}|N�t�Ahzi��������}(S`�诈M��j�s%(T�*��5�C�+�2���f�+�E��\\vC�m�E`��.��{��i�6���ҕ�ܫ�衜�fѢ��EEU;j�cy7����\Z�#�i/����0�[J������7���}IqqBB�#�/��eq�t��ᰓ��#&�N�$�q#=\Z���D�n���Ƭ�ZV�S��5A�]�h�ae��0�6x�}I�\"�D<���R�|�϶�n/;���A�\Z��<��f���s��\0�E���әgʫRҬ��W\"��޴����މ�ƫ{()\nV��׬iI1)A�la�\0��0W\ZI�`�=T87������ JB���\\f�#a�P�ld�t+�*;���@j�B}�ߘ�q���[��X��3��Ɯ��T�.�|3K�\0�L�g	�AZt���P2n*��L0��������%˩*uX=��3실�3Ts�I#sAn���q�KxOk�V�\'���~����4�9R[�n/_�qrX&�3Ѭ�\rC!�!��N?�D�U.8�%&�g�f����92+\\i\\�d��[a7�C��K��=�x�ɾ�Er+`X�j�\"�����;\rC�M���lc�����oI\r�m6�+�\Z��\np��h�t\"��O\n=�}�\Z��H���K!,�t�D��a�~��R� ��ŜE�N��a��k�_VwLW�v�\\,�晓�U�L�/.Y��^b�; 9����BAS��*��S�|�p��3 [���Gv�E;�q�֧��qj��(=\r�\r\0�&�nk��]Oǩ�&U���F1�� ��qzA�\'K����?�u�?�^>�\n|�-�p4�G��B�(l��3\nQ��\0[`(�Y\rOAq�)�D��:ҹ���2���9�Kp�X�wǚ�QwQ9�P�8�A�\0B�=�Jb�C�.�U��Եwl�/`�=��֝I���d�prE��(�~���Y����M	f�oHZ�N��f;s���+�\00/�~��%Ͻ?U�r� �P�\"�B�����0Lzzd�+=�����\\\Zp�U��T�t��w�ߪF��j|c!�<���/X��-��H�H|q�\'�g��n�\Z���٧�8�ɔV�\\�1$f�$�F���i2��r5�un8\r�+ĩ+�|H�0r��?�U�?p��%ͤ����/!�|FZ��L2c[)P�!�k��c*~��-�e��QK��-E���^=%#�e�Ut���}�Μ�J�[CA��E�I�Y��L�[⪥�i��4Q9/@�9x-�P�rC�a-�5��h�d��=|�O�|�&��9:K�B�3Cg�;ϋT�F1�+�|�O�vf��\ZT:�\n�!��������2=��a��q78��:�I/��YSI��rFQ Q�����a��ͻ�k ��diX�uG2��q)ٙ��G��P_3{��d�S����ā�S�������S��7\re*4�\Z�a\ZK���t:n��t��0���\'9�k`ӡ��\'Ð��%��@��U(���BC^����ߨR6\r�m��,J��\'#�-����-��8�����H���kJ0V�a�Ğ���)���qk�SZ!d����W�6���5�ܳ��:	�l�r۪6�Sc�*L�:�II-��6h�j{���a��=������[���D@���S����`����\ZPe@��bT���4��m�u��T���x�Q��̵�Z?}�iR��n�Ǭ��W��ͅ�$9!Q�!��f��r	sb¸�!L)��E��,�*Cmu�!\"Q�T^�+b*l���j�g��46fkm)d�r\"/E�$� ^�Jsէ�=I)�RA�\Zu������k4\r!��.�(N4�ge�k1���d�·�d�P��̙�����Q7^ずԠ%�C`� ��o�G����|Es�ԅHDbzr�\r�%k���G��Zw�纄FS�0⬛�?%*5�B�)��\'��:&��B�F�ږiO�\r���	0D4���\r,6�%lhf�-�mO��m�md�YX�� �`v�Z��*��ӍKR>�If�	ǉ!4�;d t�Lt�68\0����u�$!A�%��t���SjR��,����|��sZ���]Y6��%;�gҴ/JYq!�1	ӌ�XFj8QX��l��Thl6�N,T��r)[i1�i�ߏ\Z��>^����/,6�mЇH%C!��J�Ը��\"��6!ܚQ6\Z�3+Bhk�obl0�S!L�dC����hoC�7H��:����l�H>�k�F�~���Q_Ȩr��=�?D���|#ۉ��>�)���1����;k%���$�v��ǃ�l4��;�L/>d7d�T���ٙHRA���p!�ۡp_�M���CYz�B+�q��\r�w����/��\n�(YQz\r�3 �59�n�pr1����c����l���B>m/Gk�߮��q��ۛ�.+�rǼ�㦔��\"م(Aq-���~�!���c���Q��4V��tE��\Zp6���AD����K�\r�p!ЗE�{6q��v�Cyc��2q�JW#cn>�pk�S���[��v�7=:�NP�3��7��ti}.sJ���-�$�	|B�ò~�������I��q_�-s7k�0ʾ�C`�!Z=	��&�b�Jx]InD��\Z	=��C�����$l!� ��]x%�2k$����a{#+q���H@PqFAŘZ�!������U����4:������N�0���%��*�ώ�M}9�]�l��x������H����`�9\r���%^\\U!���$jk{\n ��@�c�\'B_�K�/|%�wa+b rA���q�z��*�iKXn3����*e���Y[��\\u]�Ʒ�ÐS����Q-m�u�q�6�u�>�Ǧ��&���D��gZ�I-pC���7�#�!�r��s�:,�Ii\r2�(�\Z7w�#=\'�J���(���c�I��)T��\"[lܨZm-�)��M-g\\��%$�q��.Ne.�9<���}���d��ro��n,��q��d�:���]��9]�ta9i���vse��v\r!-�&������T�=M����;�F�3�1�il��α�&�{;���\0��Rk�{,���� xE��d>�Y��I�Y<nā�X�Y�<�q+�<�X쥐i2�M�Q� �	rBAI}@�<�ެ�NY�puҦ�[��I�;dѽ(�o� ��.Rں>�[��RE�Zg�Y���C�f\r:1;Gdѝ\\������P�ZGz�D�t�u�3=3�qM����J0�t��&a(D�n�}��I#���%	��DfBPH/��hhq!ćp!�H�v͎ձٴ;&�b���G�0<�8���#\'�<�0�h��b�$�<�(�(�Ȣ%�\n�1��C˘!ز\n#D	���C���!�hh0q\Z0u�:��I����}��>��e ��)}��@��D>�Bf!�p�&�\"Cu�6�$k�\0�_��\04\0\0\0\0\0\0!1 \"2@AQ#3RB$0aq4Pb���\0?��k��gj��<U/��)#��:���I����(����ȫ�~�_��?\'R\'V�x�Kܖ:����~�c쏩�}G�P�������I������i|�����i|�I{�NN��\'�?37.f-���{�N����\\L�~M\\�a��^��Kw�ܯɖ�_�/��	�?*�U<�f�.f3\r���r�z��-���W�����O�S��;՝������vJ�\0�����c���������v*�\0���:5�\n�B����VvJ�\0��\0��k��b�~�e����T_��T�9�9�2^�Y\n�:5Ȏ\Z��%�e��o?,�����VgY�fu��gY�iYVuN��:¬FjC����C*�2��$���}�ҏ��?�)/�}#ͧ.���ZO5�Y-�	��\"�Κ:h飦�Lj��2���ɪ�[\"��eG[�5�f�S��Uu\Z��)6��:�>a�>uW�ޏ�w˅+�S���rל]�r���r����#C4[����M�U\Z�#QӎI-N���O=$��T/{��I�ɕ�z<V�e�pu�[\'����ѡdne2�Ke]�^a�n�}Τe�*��1���3�vuU�s���n:��!Q�[[�(ʿ�=/��pu�%�-=�!(�23\"�.����~c�b���e7g�j���KAFw�[r�)�-�#USC���oQ��#JQ�GJ�Rિ��x��*:r�E�Y{��d(\\�̲2��׻�jϨSG�i��4�>��T�ŇŚ�|RgԦ}BG�$}A�z�z�^����~d-��qI�kܱ8�^�\'���f��v_�<?w��ߔ<�C4�(�b̳5<D�n�#���V,=Iyb�ň�#\Z���T_�q�����?ە?:䙔�̢IE�.S�zw1��\\3��T���\n�=E¸m?aQ����\"��~�ԧMlGNF-S��T�#N)�\ZW[�#c�l�9h=�^u��3/�<~GR?\'R?\"�{2�����k�6p��R��z]��R�*t��2�T�J�a�����r�w#*SY���	Tȕ�X��Wzʗ��JQZ�o�ö~���CZ���ސ:Kܕ2�\'O������i.O�[���}�i��4�S���,u��\03д~J�K�����D�}������~���}�M�M�V��k����.t,E����ߍ�o;�+\\P{�\Z��(۸ٌ�?��3���U��BW��r�&�H����:�^��������AhȽլ!l��]������V���^BVL�8������u%��s��*f���3�K�XE}YF\n˿U��+T=�:�*C�tg3X�f:��G�uc�T�ԑ��~���7��x�kH���O����&�������@�;d�b鳴�;M?�X�-�����̅V2Z�H������M��Ȼ/�oĽ#�IY	�^z���a�B��\n��!R��GN��fN�Vİ�5�NM6U� >��.={�\Z�u��ݒJ���i;P�E)Ƥs��J��MIh8�[�wu#�xT]�N�C�r��\\�(�S�+���R����וݭqM��)Gffw�*�����֗#VpwLu\'7�0\\6X�W�.�<�c��eG�%\Zy�*�t��F����vh����O��pxS�����OtGoG?+�>��Pu%�N*�6�\'á�V0�IWe+���#�m/n��(���\r���J��!\Z�t�.�jٚ+S������OI�7���4�ap���A�F2�+�:}$�S{�%:���R*�~T*t��*���8�e*�H�[;�b��:�^��eԓ#Nr�)��)p�W0�6s���C�)gf,F�a�(QFM}�r�I�Ru�����M(偅n�i3�y%�-r�+#���̰�\0�%a��R��O�$a�\\��̣�\0v�©J�hH���W�{�����>)J5-r��y硃౧�R<1T��)h�t)ӎX��1�H��#��g�����,�E$�4g\Z�h{X���E��Ft�EX��	�20�E�b�0TY��\'��I\\t�ҋyt0��Kȴf2��E�;�*����W�\0Ia1Ug�\'��p��(�	�)˩#�xjw����3Ztq�����4[�M�M��\rJtqIO��C�V{�\Zk1��x����eN�>�j���#���w�E}�KU���[N[�*�2��1ί�L�S���õ����#�e\n(�х�%�%;�q�iD���EU:�)��H$q1qd�Z�p�]�:Ц�6W��ĩ�8�|;�q2�<��Ք2�N��KQhJ���̧PZ�ڔ?\'����2���p�C��T�#�W�S�����*�ӕ�Eӧ�^�6�h��{\Z�Tm�U�:k�?b�eV�.�q�-R�mJ؊�g��N�I/��XQ���ͬF��5�-\"��3\r�������!����$�7ԧ����-�,BX�߸�#O���c��˒���ԣ�IW�����J�J����N�I�c;/�].Q��jv���eJj��&�э�/bo�aw~���\Z柱�1�6�c8�eO,�(T�����mro��MKr�L���;MT�ĪJ[���2/���ʯ�H���R����8�v|����l`���qZO��=�wFi��ܧO3*;xW,4����ۖEK�T�����d7.V��D���؍[�JK���B�0[?K�W�62$�AZ9���*3�un�K7-���-��c_$�[T�Y��2���R7W0/K[Y1sh�n�e%+�!�`�B��(�5H)���\r���)y�^����/�P����QEi&�!grQ���;lF�ң^�n�$\\lR�J7%��/U|�WZ1����Ԕ[�O4���n�.R،��6#R/r�(��v7��ކ66���e�K�zZ��dOA���B��Ȩ�E�2O��XPȻ��T�J�{��J�漜[dc���F�\"����<ĵ&@��نq<�v�dsKR�/yc���;.qveMP��ǽR(��Ta��?KQ��41lSc(�TEU��a��CU!&�+���\r�Z�6�%�=��-b�%f�S��RF��#*�ˑ�C�zi�0ӳLYgH�Q���%��F�WBT�Tc_�&���2�͉���~OI-��d��}93;� �%Hj�S��:5|�)֋�̝8TV������%R1YP��/E��&�)���F�zI�Y-�bF����I�ʋ2�5%{X�H�B~c<V�rFg�!+�y�q�U�T��*���\\�~OIS�H�&˗��52�͘��R����C���#M���G1;Ae��Ӿ�d�Fs7ɂs�V�sh|�Ո�����.U5Е&e�N-���P�6<��F\"�H�n*���u�{�R��zJ�N��b:��Z���8�\"y��N��Ns��l�[s3۹�ʵ��o(�W40j�/�1;�\'���\",�������۔������M�]s̑SN�W)�f��tGr�\\�P�3zLD��X���Td��6�8Xh؄�L��\"�7O��W�Œ�R���%)�r���nv)O\"HN������cb���fD�;\\�K�Ϙ�$^�&F�N�G,�%$��y|\r��6\\�n�C��ݏB5r�����ԍ�Q�\\��Zl9;WV,.V\Zh��6B�GV_#y�%�Yg�(��e��ɭL�cW��/Rxv�;4��#�H��;4��#��Xi#�/��/�����E�����FGFGFgA��á#�#��FHt�:2:s�9��a����\nj��\0��\09\0	\0\0\0\0!1\"#23@AQ BRSa0Cq�%$5P����\0?��B��B��B��:��.���.s����j����@��W@�j4��r�7#����r%?jm��Sp���a|����˩�溡ߒ8L�g#�̺��hj?h�j�s�+�����7���N���很(��U�eVU�X|,�E�[�V(V([p̫o�w���hWW�t\no���a��nU��V��Q����ee�eVV�~7��q׎�E���UZ��D�ݣ��39u����_�Z����\0h�?�[Џ����\\P~�]qA��u�����R?i�4���t���t�o��B���?��J!�Ў3B?�]P~�C�?���_��\n�?p�ҡ�pBh��\\��W23��򹑏tjan�	��<R�S#_L�4�����8c�2�T�+x,@vΫ���TS���]OL���u=7��ze��{.���+�c?q]M��4^�I��G`��_N�9�F�Y6�g73B͸�F�A�Z���T�qtg�a�qY���˟)���<���J��-?ǣ�=�᏿&\"�ak �OsX.�͞o,X.]G�U��}t\Z�W[�.��]mP�-P��_~�(\'eCs0��`řf)�&���CT1����1̱\n���2���VS� �S�k�Ȧa�B�~{�ћ� W�[*�e�bx�O��h��\"�b4܊�ѷ��Æ;��7����U�C�h)�-��e�A���s�%IL�d��>6����\\�M��#,3Ix���q��v_��j0?�L-Bs6s�[쬭����M�����LZ�#SmL l��MC9am��\n�}C3����=��f��7\r�oܟ�����J�-�7�ܽ2����!�����eQA$�\n�]e��-���\0)�/����ʈY���{<�+��̘}����X�#CT\r�S�jڹ3���\r�S`�Cf�a�y���ш�a>B:�6ir./��,�𧽶:�Ji��S��̺Ҙ}���)��7�E#�$��a��\0�����AUS�;;�{\'hT����N�\0l�P7�0��F�m+C�(bt��B���r���	�3�?MU<���\Z��V!��.��Ӱ�VA��7��rg��U�7t���%>)?ID7qL�)H7~��j����?G��Ӵ��U���l,�xv�����P�t�C��OL��Z�,|��ϲ�i���3v��bn�M��/8 ���X+Gپ�=�8I�(�4��{�*�#�w��f�,��ra�U���UIv�6�E�ۍ�����\\��%�g���sY���p:������/���R���lhV4h�n�S~\n5B�4����FX�@F)F����,.���d�(�પ,FB���;ºұ�ruU[��&��ĳ9��U���T��v�V!�aX���xi��Y�k�-8ҹQ�d�H�G�?je���4�hX�.�����=C�횝̏G(�韔.����\r=!{nM���͂l�	��I웬=K���M�xy��S�NE�}�[����r��M���G6}��_4*��eݏ�s\0٪VGQ��r!��3�U�mZ�Mqj�ګ*1��X��z<?�M�U���\Z�dեd�\n{���S.�>�_4*�,p�36Tf��:a�5��xu�N���t�7Y�@Y�z�UK�S�z<?�@��rW�f��+��s��	��ns��M�S��H�Lvr�u�)<mOm�U����v�6�U(�bG��t\'�Q��\Z��xZ�蟄���3��)��Mhn�] �(��\Z��l\'��TT�	M��Yd�A�r���.*(�mX��ϣ��jQ�l<�v#E0�F�o�(��]U��Ⱥ��\0+���dG�t����6�S���j���0��˔W �N%�db\0+��j��M�ja��\n�(V\n�X+p�����MVy\r�=�t�3����e�qeK�u�mp1�\'T84;.�Y%:�>�+o�n��I���pi ^�&�Щ�lTF����\rse9͓X���v�M���@�w]��eHe\"�����l������\Z��\0C#I�d�5ڸ\'F��F��M�6jЌHN�\'��!���*�O�؉G�͟u�,s\n�wh�����j\Z�F�&��N�Yc�A�=ϳ�uu)�Jv���0����iD,/*lU�@Ut��tUu��i����]aUn��q��K!��p�6Ԫ�\0��cuKZY�MS���(��CIgf)����T;�>�����Dm���S:2�RܮX{�Ù�~c��V(l���1���e�u.+M��n^���.�M0\\�J��t\Z\nkC��I�TT�]��PIuR��ޑ� ��	��Q~\"��@\r�F,֎�K��}��Ϫd�[e��mЇMS%l;)�&�82��%I�	� �`���?�������ιL�@�Y1�\\�_xO���l�(]u_;�����{���qNgcT��6*F���cF�@��w�@�fb��cC���9ab����]\Z����2�#e\r3�nAd�tB��O��hs\\���7eSN*�U��6��wj-5N9�{E�>�Sw�,�Ԩ|�ir\'D�D�su\"�)���8[\Zm4D�66�h�B��V!_EU��ZS��j�����e�K+Z4�Ԯ�Q�+��[��vDX�}tN���e	�hY�d.�m�7��m���F�[��h��.KIM�.�\rD|��T��r�F�˔mu�O�̹\\�tMʌ:�(�`����׮K~S�!4�a*�S!-r�gh���4�d�e3SF��@��7�q��ĩ_�lTT�.F������FGT�����UMD��k��3�M�9r�J�VB���fej���1��t�3(&��Q��eQ��7,M�r�\\<�@�E Y�#�Nrs�t��]U75 ����/�Q�[-�8���,��2Ɨ�D����t��M�5R�����5D�)ޘn�#w7���3�zy[���ڜK�r��2�X^���m��4�+��l�Jn����T��j�x��1�@���X�(Nf줌E����ոU��3e�	���х~$�9�/k �\"�vSU���$��PH�>��5����9O��M!g�dэԕ1���D��\'���UYk�!Q�)L~au �q�Uwj },Z0(�K\"�dZ�)�����[�řILَb�V��&J��3��jM�Z�Q���9���k��SC4.��\r�5�Q`�����źk;9��\\��Ý�0��US�zX�`A��t���aMv�-B�`d\r����� [&����)e�jn�J쭺�V�m�U�3;-\Z\':�TɁ�@�a>X�\0\nGYHnUW��a��L��;tЪ�X;Ү�\"t��e$��1F��{��猽�����-ͺ}ݫ��N�\Z휨ʊ�g�ܪ�(zOuvA4�pp�=� ��\n�Yg�Y1�����8eu�esS�̃��]ܛ�1��W[���b��Q�_�H��#�G������[��úhQ��Ôn�aN��}�i[�T���Ou�҈fQ�S#/NU&ц�[D���ߕ�m��ﰲ\Z�ڱ!�� ��\njr��\"�\'Ӏ�]69#7iB�fb��xJ|v�15�a�&I�d浖�d%�<��Ʀ����t�\'���&OoK��kTC�b���-^{+pN��/`�*Qp�)������Tז��o�6\'3���\0u�[t���W���c�F�5�\'�,�����X�=��\0>�0&l�[����(6�6����s�L�r}���r�;G&��e\\@���B�+��Nvc~,nb�ܢ��!\nܬU�B=% ��\rߍ�u D�Ox�Na	�͢4�\\���B�S&�)o�R��0j���<�)<-�ј���\\�˗gY�&���X���(���_�C@��@�O�=TR�j�]#7P���M���4�Ϊ,E�;,#�wB6�l��,y�\\��ʣ��5�\nQq/e���I���%]\0�!��ӛt���]J��r�����TE$k���X�[���d�EB�+X��X���&�e.A��K�\\���+����Om�J�odڦtꁗDejd1=��U�^sc�d�D���K_���\0iG�MMk>r��e�����\rU�������t>���ޡ���`���`�I�1��N��WM+t�ӣNe�X�<e*H_����\0��2�X��P\0�PHxOu�h�SR�E4&X��E\0��%Z��wB&#��N�sl�A���cN�r�t\ZS\\v�ҳ����f\n��j�Y�$<\'д�7QW�������F%�.��K���Y ��D~�\\�%Ύ�%�g�я�s���sbr3��L`�WJ�\Z��˦�b�U�5n�����3/��Q�u�\">����!jv&>к���MP��_����\0I\0\0\0!1\"2AQ 3aq�#0BPRbr����4@��$5CcsS���`�������\0\0?��k=�#Z�d��+AvX���U��x��F�s�����\\Ch�l�}��G�\Z�{xඬԊ�5U6w_�T.�v�]�ٳ3���r;�!L��q���\r]���SU��w��_��*\r��#א�3Q�j��M��Yog�J\'_��/�C��`���S/���ڱ��_Պ?�]^K�F����3��Ų���W������]E�L_�\"h����������|����Z�ja4�FH�\0�`�53��_.�M��ϱl@5�i8Gl�sF=v~�1M�և��<�Q!��=�u-��/f�]+�ѐ%^I+����j�5����j����5�0��.�H�ˏŊx���5�p��7��u�qӿ�2ﳎH߳\'\n;�+�Ŋ���U�U>��)�j���Y�&R)�خ\\~���ע���P����*1�{�Tdo��5�@���m�D���~�doV��X���Qc�]S�V��u\Z�J�\0�T���eѢEo��V^+��g���X�b���nQd�IY-�<V?���p�ђ�E��r;�?�+&������,��c�[��[����#�[��Y7�d<=VK%��e�5�Y���%8��j�aN�K%��e��o���n[��o�2S����?	U�ռ���N���yR�=���(�՟r;�?�eU�n�WW�][R�6����]S�,��*�݊����:r��k�`\Z>�\0�c��`B:9z�V9,��ƟuCtk��TK�ّ�f����+t���d��+��\0+}R�k��0�T��#4�W%]~B��4�aV��k�\0�O�\0��~�+\0{�M?���׳�r+�{�9,�K%���d�Y,�����UKߕ�<U/,�%q�\\Veo-�\0��?+�+2���H���@�%�O�WUS�X�ʡ?��ཥ��4�s�\0J��ҷ��.}���W�q�,��XW�#���^�^�-9-Ҹ��̭儇�u��]j�WX\n�6�e{+tx,��q��j��\0� �rZXEv4qљ�ce�m��tv�{Nkx���,�a�c\Z����WVV-�Ȫ�u���+2�+r�Vk���k�I���?�ۭ;Z�]f��rNs[��i�h`-�W�\\Vd-�x�tned)�o�}�(�J��u���K�z�˨r���/�ܿ�r�˨+�+�>+�>+�������+��������j����x-�x.����]S�\0J4c�T�\0Ұ���z�������ՏԺ���U�]O�J���d�[M��V�D}�ڞ�淿+d�ϡ��7x,!����Qc����}��ؙ��f���I�F*U[��i��s�\0P_�~��˟���\0.���߬/��~��ˏ���������@���\0�����\0`_����\0�,|�����C��j)[�N��(��9�����\0�����\0�����J��h?�������*��}�ꫵ�����UR�,��q��o���຦x.���g��Y຦x-��-��Е�ϹO�����c�ڻ;w���ؘ���\07Ic�\\Bkdq�nK����4�M�V���(״�&��/d[N���n9b�\\r���*������j�g{Ub���Z����\"}\\8t����{��9Lz.?*��Y1�y%2(�\Zѧ��{V�չun[�[�dVEdV�Y�V�[�dVtX\Z��!x���k+\r���L�;Q@�}Ժ�\0�m\n�w8^���om� �����@�^7\Z)B��b����>S{�{��%��]�5�����5��.�2!̸/8�s�f�*�\r�]�Y�=�։�l�����Y��.3r@�2=&��+I�?��m���є�#_b���>J􆃐X7��UF-�U��>��>p�}�U=�����Kfa���pP���\'�Z,���UNfsM�n�#*�G|����,\n&�H4�6O�PH1tR5�DQ6��0���w�ʼ�k`�$:���\r&V�\0�5���^�dx�<�d��C��Q�G�m��ј��c�1��IFg��EW�=E����A�oI��H꣼Gj>ϩ%��k��[Z3pk�ӰU�e�6�6�WM���l�\nC�C�ج�K+o9���Mi;�\n��2�%e��^N��Z��F��-��V��!��3�L���w���M*�{�d�� #�y�������\0s*���:\'{*�٦s�@��状��/�B]B8�Yi���(3����%6qQZ-6V;��f�2�X�6�*o�QY�Љ��h4�*�e�C\'(�r�V�����?7�Nv��g{n���c�gc�:�}��xJ�.���j����-[l����x�ii{�\"�����R����ax��o��Ƶ�8ދ�lQW2l�g��}� ᶨ�\Zm��o4�Ǌ���i�L8�%�;�7T��j�\\􍣃�]o�_�o7.�O�Z�w�A������%[�c�EY�r��c���}�n)y�j��Cmp��E�y)����X�e��9�>���C���5�Ү=��k�y��E��E�\'��l��Ⴒy�/��8 >�`�@���R�x�ԻD���S�`V��/%�;1�S�u��v�;ب��ݮ*��d�6�͌h��+A�H��璶C~�v쪰����fC��=E��n�!�e��B\n�9/�ڶ�b�-k���;�����p�j�Z��X���U��Ʊ��p	��7\"�G8�U5��r�u�p�Z���k���S����D��T�ǫ�6a���[)��\"8釴�i=�ܰ��;�\Z��R��tP�[�8^�*�hp�[k{��2\n�y�.�Jl�c\\��	N.���>�~8C\\��x+���j3��trO&.�z�\n����U��-��+$L���BZ�u���%��TV%lox�p&�;^$�Fּ��i��j��k�u/RC�mZ���$�yF��޺�Mk�0�4�<�ӭyxt�Y3\"kN��Y�ng�4*O�WW�b�l���99�r��,�V��V�հ��S�I��*���_��-�Y�e�K-�ѥ<Z��E�p�k��#�u�Y|���\"k�Dh�+G��[;�R��B/�Fy�:h���9-���o�cF%]g���T���Z{��+��Y�6�e����}�S�V�\n�(��뛻C���55�\\¶�i����E�GIk�6�\\�N�����a����,��nY�\\Z���e|��V�5�J���k��[fk�&���h/\\n��h8Ic��K.��T1��L�(Eh�u��\Z�]�UX�<	M��;l�lش�sW:�v�\"S�ܶcޘ{:����Mz8����W���V��Y��d��[�dV�Y]�\\ϩ��,V��V0O��m������9�-VEԪX�:֊���ζ{��p^Pg`V�-i������5p�g�dv��?�X���\Z��v rN������d�}�7n�D��CxQ7ɾl�GK��\'y��B�\0��|�Oέ�Q���G\ZQ]R�7�DK�	�Ә)�.|�1�FC\'�pW\"`cy^J>u]��-���v�#Z���Y�c���Y��-?K��j��o��.kZ�\\�a��U�I��v7�Qx�$��zu�L�w�;�GZ^m?�(H�m�Qv�:��nB�[Ѕ��`�{��c��f�~�a<V�Q�/c�f�ҳg�^ǂ�c�\Z&��7͏�b<�R}]w+0�\0li�.U��V�[�d�.�XJ�z�f�,��[�#�5��p�s�`v�s]K|WR��1ul[��X\\ҷ��j�����c#�{�.�+���Kt-зB�tx,��p*�e�=�^O\n���r����\Z7��}E���*�z����VK%��B�,��E��?or��G�?zA��A���g�v�l�I��A��I*��B�:��\n���p���H�z��AC�^kh��i��K��̮���Kw2���Y�z��!G����I�\0��|�ܶ�����w+?�?m/,;ڊ�*Kt����^I����Vr�>/�7ݲ��c{��vȠtP0����0���(�qyB�s���qK.=݊��\\��v��PH���K�&�W�畯|8:�j�����t�B�K�˂�P��7@O��rt����G�w�M�e�?�{��ߐ����;�Y���h�)�;�x�4!�0{7P�n�7�bƟ��Q�65�\n��f=�\0-��؛؜3+���P�F�)e�=�elz�\n��2U�XZd���T�k\Z_�٫3f�k�xv���r<Q��ԫ,�6����t8&���M���%��f�Y��f�:ޙ��Y��Q��P}Goq�8t�W[��/�P��G�t�4���H�8˚3 *Ъ�{�{�� �Jx��F>Q����l.���uan�c��[�n�Sy��/������q�\0�b:��ծ���\\�j:�\"kǱ{�\0O���\\�A�q�a�R��Ma��p�u���!j�������F���!>[���;*IMk���	)�N�\0�RGZ�4V���Hִ�����-��E�f�r�	����wr���ih���d�B�Y.+yfV�A�\0��e�ե��]5up�I�V����1�����tn��Y�V�o(#!τY�ogji��\0�dZ���M,����]k�Qn��9��pk��b�x��E`k^�*����sZ��]6q�V��<\\X��3�u��_�3���C<V��l���?�ٿ���+�0���B2�]�9����\Z.*��M�`qX�l�CV4��}�%�T!]�AsZ��\"�Mt������w���!�\0��Y���m3�D�=�\0���3KҨq�m�Y���7%����\0�����\0��fuD]$+ќ9�Ȏ��yY�vA�U��W��8^X�9i�t+�D�ǹ탷�a�58��y��j��5@(:�x;�O�L���0�Ê�������\'�G��z[*�\0�q>��w]�7w\'�[r*�㡪�)���=�|Ea���WAs�4����Nx�sb��-�4�\\����Ɗd���ˡ�����!�\0l����lB��5l�$��4Qŷ�ÎH��D�f�x%���%m�L�z��dU1��S��׈���_����:���n���N��[b�Y���4��e���h�C��tLFg<Ѹ�#��Fs�W	��55F�k}熚�Ym��Wh\'2��´�yfF`����S��ν�]��8�6��{�]z�����d(�2���Z(��\\��0P�Y5[m����9�1���G�[c?!�mx�]�o�kX�+L��O~�J4�Yfe���bc �F˕�Nv���;\Z+-�Y�@!�ʳ��Z/�[�yFIM^�8�[\"�G���W��n���ʌ��Նq��>���yVB�yR�����oՍw}�דfuK) o-�7�Y�=�-S��הgD����٬}i@���\0�i���mg�|q��}�87�Y�s�ˣ�<��m�k��Xk�NEZ�l��ip���dq�&Yc5t���4�vr�Q>��Ns)GfJ=ֵ����2�+��]ai5�XZ֟�E�P���ài��Ehcw�#��[Xp\"@���P�ԍ����V7|��Z���ɭ��I�����{���J���+�G�\0�j�<j��������\n�g�!�y1�bE�Z#�!��X��XL%ם�S��t50���O�9�QR���Drp���>�N�zE�4�.[poO�y�;tr��~�M��O켣bq�G�5yB���Z��9Y_��\n[�\n�R�����q�85��bW�>v�K1p5)�ׯ��3hV�E�>)��a/���Y,\"!`�\\��\0A���#gu�Qt�HU��ɾ��>�\r�Uo\0�o���ش3#�5�j�^<UA��zW��b����zt�\"��%�RIx��{Ά�6��,��9��+w\\*��3ד<��S����>Mn�����y�um�\0�F�0��UƮ�}Mx\r�{�7|�^J��X���a�=\nLʟ�`W�;i��uЬmlor����ۊ��?Jڴ��c4�c�?Ժ��]G�U�f}£@h�A�0Ր��X��pCD�(��e1<��\0皐���mɡ��]�����+t��AbB�4Z`�<�R7�vh�m���`ɏ��7����������u��K�g��������4%>�`7�pt�r�Ƽt�Z�}�Y,�kys[�t,�@V�����y���t1_���|5�Y�����#�X��%�0���J�X;���#��cn��V6��\0Z��1�\0�W]!�����>+��ϊ�w�XM ���mS��an��/�{�]sO{q��[���X6&����K�߀`]B��Y��eҨj�>K��hw������\n����!nq�s��yux!<e�iʫz?�x�����Q_���kbtw��A�D淙\n�c�܈p�\n����<��#n�p�th�rͥUo�ʁ�^ⶣ�U�ǜ���s������Vo�5�л%��L�\ni�1�4�y-�)��J��H� ����;%����QY��0ցj�a{��+LsFX�\n�Se�uʶ%���U��9��&�z��E�������s��@&>��*#f���V\Z9�T/�x�x��yk\Z�	�|�\Z�ص�	�J^N������Z�µ�J���ͧi���#I1*�$Ʈ�Jc(�`\ZsB+��G�D���k��f������l����pD;V�U�l���y�ϣ�.�/�S�ou�jv���ɮ.)Ϟ�)��ek���q�\"��8>*�\\T7���(���H+K%ac��\n�D�5�U�0I	�+E}�e��3T��&-پ2E�P��,���<��9Ǌ�Z�ą�n.�F���S%9��B�C�嚫M�+���v��H�үE!��+���J��v�����\\�=\\�v�F��>T#-8�X˰��4[�\\Qy̫�j�����y�E�y5��Nh���`���]Ngy�^)��\rh�+6ȕvF��P�{�Н�!\'�0O-7k�\Z��h������Õ�\n��4rY����ݧ���Y5/�-���s.j�=�֩�h��?}5�v����zӰ߇�\r�F>���#��؝�=� ���Vi��m��N�Gj�|���*A򕫋\"��;��^��g���t��wR<qM�#XO>\Z.B��ت\\ƞHG�wH����2N�������F��\0n�̎Kѐ��m�U8F/�,�qh��=�\'T&8���\Z��8�,¯�x+�r9d�$7���J�w�L�l�����~��R�Ԧ�g���\rck�⧞��D�\r�҈|�sھ��ۂ-���G־�#j�d\ntq�cہ�\\���V��x\'W2pL����\0񛊠�]��]����fQ�K�veZµ�Q��I�C���T��	-F��kE\0SZ��ɽ#��3d��nJ-d���P�/��5	�v:���]%q��V�U<���e[�+�=�p�b �����|�a��K�j�G�g�>�k=v�x)mmvԷD������GAIjw���b?�S�;�#��rr��z���o�W�yq��aV}ъB$�d�~g��+�f�����^�\ZS\"ц֋5�*�RH�[���C�B�%�u� C�>g��9��N���\Z���?��A�\n\'EÑG��c���^	��A�3~d�L�:���S��ZҚ�Ӟ�C+�������{4^��6\n�ǳ�v&׵^�#�T�5��`f��B6��S�j�ɉ�>R�?\n8����\Z;Q28��#����%�0�\\\\�+�(�whl��Lޑ���_�vGUw�D?Jw@�yh������<�T/�S��8��p\n�LcV��S7�f���O,4��h���=�=n�Z㺋\\(��hx�\rq�gs�C��^�#�w���j{KX�����m72�o�g��\\T2;R��OM�0ü�Z+�6��;�_HQ�:!#\r��qw\r\r�8���rs��ԓ��+�F�\0hg�����Tі�`��)nrG��|��unԵ���5�T=$��o�H���	ޥ�M�]���D�(:w֜�]�kS��^aƇ��Z1�Z�h�V���Əh�{�	�+Ti�w��[�L5N{����Ϻ���Dg��?J����t�Q�4����Q�\0��7��\"�4X��QP�L4�����\n��toQ`��ӟBI�D����n��dU9hM�\\��X��\"k3��w�\'}~�ٲy�(5���T�9�Ft�V�E������5_�W�2�p�[�8�rN�������ڑ�s%�0i��g99:me�T�>���g�ƈO˦��ku�FP��5�ӯ9�W;�%:K�}��]ʇ4\\z��eغPe�*���*^����ts�.�i�}�T��+d�����jv�Ǜc�6��QRy�l5��2n� �W�:%�������sWY%��d����v+Y3�yrAA�q���d*{-�h��J��虼ڦ���)�2�42O��2\0�4��Vsߦ����	�d�֡,����5�$T���م�e\rhձ48��~P{����wT܏�蒏�\'�W6��=��3׃��7[�\r��q[��\Z��!v�E�\n|�<�Ӧ)x�dTs5TL/��)�+��4Ij1�v������_\ro3D��u�;㫴8sb��L�Fv_�A�Sb<IQH2i�@dm.q䵲�1�),d�G�5��rC\n��!����\Z�j�A���{���.��.���N�\'�\0NJwv��6߫�����aJ��n�Y�֣K*vٲUπ(#�ࢲ3���5�2h�\r�M���V��4E�Ev�.��0�mT����WM��bF�F����Pl���i�S�wx����ִ�9�EEsz�F�����]Qݪ䶫��UbB�-z�j��$7�<t<��鶏�W��_�M�76��{�Ԓ�S�9F���g+Ȳ����eB��Â�Jw�?zsNE?d�����0��-l�S~��b�O%�,�a�]e	�V�\r�Я��p��Iq�X�Z\\��ØWf5g2��7���K݁@h[\\�tw������[�X\n�9�\0y,q.m\n�3�M:���M_�脸�U�j��\0},d2�ہEh�Q�Z)蛼Qcֆ�?��y�n��j|����0[_<�ի��1��gm{�[�w�Wn�������2�9��I���6��E��,���=��7Z���Td�e��}�k���VЪ�+�%��F�ٝ��-p/�H\n�5L>m4q��-S\n1���t.����\rs�m�B8�t~�Jb\0��B�	�u�^\nB#��X�#m̫�����RH��B�s:��T��Gsb���]l���F�Gf�$�+YSHy\'��J�Z��aG�b�v\\3:<f=K.�Lq	ϻv�  �L�0*i�A����4B�\0Ԡ*r^pс��\Z�x�\n��?>��c�{���C��r*:J`��9�yq*���{rP�Tȣ.�^���!MtP�\r\\Mƥ8q\"��E$�<v�Yc�8GL�0+�r;����-�_^��0�-\"�������A�\Zb��9�)���0��,{Uӄ�1�/�Z1�V��`�G�{.��y+�N�g�h�~������c*�{�*�y`���\\��z�\"c�E�:���^���2YX]^�[-��8�_�lVƵ�\n8���Uw�\0����Xq\n��y�\Z���\n���K��>aR���ߖ���8��F)8���F����t��KC� ���!����5里���4�\\\\��A��\'H�\\�R��\n�S�^�B�oX�\Zߺdq��N+t)T*+L-�����F�iB߉:�������*>W����odx���d�2|5�c���\0�g�l��FnA�쳗4\0�hr��O{M\n��Py�3F)0���e�(<g�tjq�\n��*�T=�{�̈́z�Щ�Ѽ��S\\~�h�{VZ]#�\rO��2���.Mmr+P��XNЧ!�$����i��߈[,r9��[,����j��w6��excG4�@ 8TU\r6�Ӎ(��\n��S�j��\ZT����I��Kw�y��ڢ�@��P.�y��**;�g����U������,���b�9EZ�^i��9`������=�+�4���h�q��{�w2���kVS�+��T��\Z:�#:�97%ev�v֌\0FI]t-e�4�U��G{6���HX�D�:�L��\\U5�{�A�O`of�̞:�@(���t^F���SZ�^�����~��9����C�ES�8�ڍ���QA�ŨK���)�Fj\n���˲D\r�i�9��Ms�6��0�E����&�]�HP26�So6����Mc�$�g.ux�\r�y�\roj�Y�1�1�NN��*�W#�Ν�l�+�UʄQpU�xd�t��py�cyI���F�Et���A��A�b����1:{4��\"��X���Q�\n6C��i{0��BF���BL�n�1\0�#h�h�;+L�\"��Ɔd��}�ʎ�=	������&ԫ��G��򥭖v�\r8���O7�����\n�����d��\\߁٫�k�x�SC�h\r��}-`��UذX���WZ��vU���{���Z�1Ӫ�������\'`\'�n��0�I���Eb�^�q�ʨZ_j��5�d��z�0�#9��3_[<����m4������w��1�VI�����ʫfI�_�m\Z�|m����70�^�8h.T�4���{B��ˮùH��j4Y���G,�C�D�t9܂&��B�$p��:*2:*���Cבbn榩�w	��6@栔�\n&�q�T�>v���ga=���\Z�eT\Z��|�o$$x����z9?Rw�6��D��y�t���W��XB5�@��70���F%sWV�{&��d��H�M���UU�њ��Pr�y9� �\"�TM���4L��9�\ZJ�\"��7��栉�ٍ��:�1Y+-��cM^o�wc�^!���@&�9��ua�Џd��|�0�(l~J\Z�\r|�f(5�kAF�i�[Z��_��^�]h�q�\0�����8�WxsE�F0��0!8{9\0�Dw.�x8�De-�f���V�-4*\\(/����\0#�} iϠU��8��;V�)�>��ӂs]Nr�\\\r9&5­�ݯ:�m.��0!�%�\'I#�F{Ep��AI=���H�D�+$��[^�� f�F\0a���od��)�5����x��`w�bn1�w$�Y�3�����B�-A�Q��*;cA&�[�8��$�/��l=�����Ý�c�*b�p�\Z��k^7��{I��CI-Ƶj���r&]	�Y�M��:J�����9��&�)D�ӎI���m����I	4��j��^�-T{�Jdm�b�&C�)�e&պ<�q��]��pSG�X���b�\n� ��O%�>Ѽ\\B�AL�1��e�w*k_�qB[S�7��Uؙq���9�HX0T\nf�ɝ�C���f<ݡ��q�!Vz#�O��U7�7�A�i@�8��c�V^\\�oW��`h��zz��7^8+�oHN�⋤��^s7Uf����[��7Y�M���Ρ�\n��0�y�l<i��*�By�����wt��}����^�ǡrr�X��~9]�mZ�$��qy�)�Z�Y���Զ�ܨ�<�����^�V�GG��3�i\nXϲ�8\'�4T\ZŽy�����+n75o�u�T��J�zh�����;ӝ�@T�GLe��/<�B�j\0��� �<B�E��V�g�0{q�͒��V�����R9��ڼS\r<obĬ�:���ߢ1چ����C����8�AC��c���M��6>^;��N.���kgy�.�	����c��Y��0�W����i�[6��1[Uoz�MG�֍�C��O�`j�冐tF:m�>��(�����Uj��ڻj����\r2�+���z�iM�0<�d���SO6�Uiz�k�l�;�W5��v:3X,U�1U�C�y�D��:��rN��ڠX�U\0���Pd:\'E0�uy�ÕEt9�	�H�VY\Z��x�Ί����h6w����\"�F\Z��\Z-]��Z9���H?#E���,Ps1i�k�o#!�ʕ�h��k�B|���G�}�h?!D�5�t|�h��R�:D�rs>�*���f�#w�p�Qa��*��s\Z��� ��y�;���A\n7��TNa�\0��d�6������jt��VaV�Fi�@2��aa��Ә`�cf!�	��1f�W�>n�\0¤w%oaT,k{����j�+=D|=\nr4�E:1��tZOȞz-Nq�*�;�Z�V�#F*�Xv.-r�_}��X�t�i^�Cs�(9��\n��x-���,\"����@\ZЃ������c�$qZ�G�vC��3�M��$e�I{�xf��\ny�ƛ=��?ݣވImx�n�V]��)��E����\n��ZG�*�c�(苼���܉�ԫ�`��`�P[�\'4�\n�[p�͗�r��bRձ3\\�4[V��}8�}�B�p�\\U�V�>/�w�U�E\\����\'��5v�-�^�E�z(�\0:O�%oc+�X�5dY��A�K ��bf%΢���dc��s�0�K�R�?U{f���OG$H�y�D��tp[�agNΐM���x�������19�ƈ�K=�����iͥ/�j�K$iU���)X1�\0�U+*�?QU�a����#����=���t����>���۬h����D�4t�}�U�5�Q�U��7���<�m;�#�BG�E>����>��z\Zi�P,�сB�W5zAu�zE�ȧFFǏ�c=�V�EY�)��=���9���,�V�u�c1[Oq�6�8�Cb�F)��hօ}��8v汊2!�q�M���h�M��W`Ʈ/���xfzt&(�Ϻ!�Т�f�@��`JΫ5R)�\Z5�mM�3G4��.;�)�k�q��޳�t��ݞ���౅��]P�E�`yt ͤ�$u�+U|ن�u/�\0�MmkQ���=,�7�!�Z�un�\r䵲J�Ɗh�+|x���p%I@9+�Q�E�����ѨU�Cx��񍃘�8(���@��mG��Btf\".�/h,_E�5o��T�m���*��3�x���J�k)�����@�o$q���L�f�(�����\\�����A�a�ĭs��o@\Z�\\Vj���ke4�~�>�7���D��p\n�,zX�K\\*\n��X��3�]��w~�O�P�5��xby�t�v1���I?�\'�.~e5���r���4�t`��l�~�5�q)�n-!\\4b��1+l�����N\Z�t@φ>�\'�<T\\�b殒d�،�w��2CIN{%sI5[6��Ձk��WR�\\��\0��S�\n�lu�=�瓴�T׼ױR���Q�i����9�HE������,���/|+��㚠�9�x�4P�P<�n�Gj24S��-o=8�w����X:]��i-p�O�����_����D[/*���O��Ҷ��+ܶ�)a��F�]�Jl\ru�W�,r�^ۿui�V���m�E�:<��9�,x?�g.��\Z�`�\Z�2-�HOĪ��le�V�r�x�n(7�4rW]�[;(�:i�����A�\r8�\0%�/�j��vF�j��j���Po������t�-M�C���ֲAI8��S�vz_~:���/8b� |�QmuP|\rXeڰϞ���\Z�m\n�����U<���n��E���f쭼}���J��,+:�*/8�P�C�;��g���B�j��Ǹ��Y��V��n��R\Z�ْ-i�GɊ���@�ų��垂櫤e����%\Z8�^�*�T\Zb����L��4S��L�^VH�G�r���G�q�C�\"2GUpW-�i�5�~Q%���hP���>%~)C��!>{4׍h���5$���wJ�.�%�]��S��X����2�\\�WD���mü��K�luiq�p�o�r��+:�?m�����q�=���s�n��bh�[^(�`3UW�������\n��\0���7����c�3�b�X�6Y����P��9^+���5�l�H\Z��V8Is\"�̦�\nU�-����VU�XUuص`*�Jy�m�B���RH��,0hh1���~�4�ax{����42�	�X��}�V��Y�W6���\'�7��)��M��\ZrY�Z�Gy�ǒ.tRYKÁ��6�a�l�;\0U��_=��Ta��W-�a�P�ȣ�z��\n�7n�׏qW��Z�ڄ��\nt�轭��S\\E�VIc;�y:�P���s]d���.�K��B��Š�qT�F��	]ڛZ;�B\n�e�ܓ��tN�=��z#G�L9�r�F�ϙ��d��E��¼�5wEB���JR�b%�8y���W�:�؜S[�q�{\Z`��_�(�p��+�$��d������\r\Z[�C�ژ��]!�)���`�9��4;~��H�cC$�3[3���܊��[�9�g��S�=���X��j�i��O��q䫠M��]��ܓ&�ט��J�Rv�вM�]�\ry\"F��;Ξ���E��5)���څ�7t4��R�(s�_p���)��s�{��c�*/5�뀣��B��y.���%�@M�ʜvUtS�Ӟ�X��C�N�N\nJ��ػzЌ�䵾��I�FX�rA�\"�)\\ˮ�����A�\Z#I�S�z)�;Vգ���6Yd���^�F�u׻P�UqX��xM>��(��l�\0<f*4�=�Ӣi��&�4e�d�8�9�p\n9%��R\0j�i#�U�.�V�����4[M!l�ǹ]c	#���xf�0��WN�*�.an�k]�T��)��j�x�=�tq*�2D�\0!d�����e\ZZZ/��5E���i�Z	�0�5�9(�!���8U\r�فE��^�ªG20H��\\��#f�Aԧ\0ik����������vi�=����7=�_\r�P^nѮ$R�{ԫ�c�޿E)m5�7hX�f]#���Y�M�!<�Q����Hb�]y9�7_��>���5���Tj\\J��m�&�k*\"׶B^KﺔV�g��C �J�g���px��Z\rd��MJ�6	De���;V��C��p�HD�ͩk+ĕea}����㣚\0f���t��W\\>�CE�hUI��.D�$��W�M�Ƌ	J��,�\0����t.�.�W����;���_ýP�0�F�\'Ȗ�a^��G.�hl�)�	)��rŒx-�G�`�|:�ܮಕ^�5��gб�k܀B8ᚕ��q�yk���WT\Z�G�#V�WVսw�,�z�3����I�Xٟ�X٥X�.�򏣐��\\~�/��rjp|F�뭠�.�\'�>u�\n�^�����n�[0;����q[�ual��rY,�Kt-з�p-�����������ꚺ�������������������ud�Yt1h[�nՅ������������AaX����\0+\0\0\0\0\0!1AQaq�P������ ��@0`��\0\0?!�\0�e˗.\\�r�.R\\�,�_�=.\\����.\\�uj�Z�19!��Kh�b�]��x~$�t8A��%{�R������[�\0���qC*q�+�1��TZ�C,��Ċ����#�n?&������T�۴�~-�ܫfC2�O�.�h���30��3�2�}�b��e<u?Ц��&�%�=Fv�|Oȼ�2��p�:%�e �:�\0�\"�a�1�z\Z=�|�R�/��i9[�\r�Øs-�!xY�k΂(^܇ٔ!QP�� $2\\�wҁ6��L�m=�����vF貄�\\��)w-fd����3!��$A����Kߺ\'�T�,:״R;������\0�;���3�?�1�ßh	��9��ZO,��+_�<0AQ��a���\n*�zo�[�{��\\k����q:U�ĭ05�l��f�\n>�s9��{ݑOH�V.�2�̴1��T��:�q��zx��3l��qb�y�p����\\�I�Qi���Bf��Ov%9����ߥ�������u�@�c^m-��*��O�B���V��g�D]��:���f���	��a����,b*�M_��(WV�Rg�c�ӹ>�U�[�>�+R�4������s0��J���0��dj0Ŭ���x򄼠��S��S�Ɵ�2s���� �a����W��8��7Q���;��(�N��\r��\n�3/눴/�짼=�wi������no����Ǻ��)�&���}��GPiW�n\n�F�r��)v�2�MgS���ᝋ5���D��5l�@�&Ɨ�!\Z��吅�J�\n��o|nY�q�E�RZ�%?��8�8��L8�H�C)���8�fM�!�W�0\n��A)�D&۩h�z ����@V�(��SP}�/�s�3x?����\0�XKu M�γ�V\\\0��\0�ls��c�Y�>��>��U���q\'v�\0q\\���O�hF�(*?\n�ww�V��ґo\0c�c;4�?���Y����I�5�p�E��)�cR�3-t��h�ޕ<Ĭg��L0��1��\0@e�\\�m�)8Ob����W�	bǈ�|1����\n���������x��/d>�C�Ê�/Q[1y�oy{�f6���l���C��\Zp�\0��8�� �q6��q:�q�M�mO����\0���d*;���B�������8?c��-R���4��v���aVy�����k���W��uĥ@+��z-D�Y�f�+e$j]�8rÐ�����4�J��i�\'P�?l�?���J�����>�6ϴ?���!lU��e��Э���?c��>�V\"�b8q�3��3Ϙ������=��J���y�~�̵��x��=Up�*�e���Q��p�\0�C��D�	�w���ݑ�`߃;#t������F�sh�� R1� ��Fpe�!���[�AX����(�>�-iF����y������s���N.�p��(�\\���q<�R��+�ĸ��&�\rROt|���e6)̫q�UA��LU�W�T�BT>��� ˨B�ԯe�7�3H��%o�3p�̣�*�q���ĵ���-�ĺoX�x��[�a��D�q~!���f�@�n��b��S�q��\0L�(�$�\0�%��O�Do?C������\0ǅ{���\0l�ԅ��p\"�L��\09��������& �`�?zS�����S��	_�\'�\n�\0X��͛|���3���O����9!zg`�TwdE��\0���6�VK��@��YFh	����p��}�n]�b�\0�>��4\"\\����K��?�g/�ݟ�3	��	C��\0ycc����\0/�Ë�>b���2�\0<̦�?�0���\0tC��� 9�\r�hip���\'���^���\0����?��O_��#�z���|J�?��\0�&S���FWo��\01q�o,fl�<���i�tf\'\"x��U�)�?	c)����Yv��6�\0Q{���|g}�\0�V�\\����W7�~�̔���,_K��_M���]����^�;X�\Z�����Q�II�J��dO2��A�S���W�E<t\n�����EP�;��CQg\ZL�×�=��Z�#��F�3��[�,�x�=�-e�?��̺��fm7,V%	0z\\aW�F-��\0C��N�?�\\وq	\\ܳ�Rc���<5�ʽE��F����	O�e?��\0� ��c���VyhU,�P*���b<G0��\0��PV4�F6��6�!��O3Y�&#R��ΜE*��ADni��Y�v/�aĳP�B#��]3SP:=RK��BMdkP�Dsl���IU4�C�e}	��]�\r(ef3�`��1C�@�%�N��@Q+�P!(��6U���S�.0��Lo\n����*�zi)}~Q�� N,0L��?�V���\':�:�*\Z�����`T��K3�b_@z@R�V_�U�<���mw����!��V]���ߥ�ϥ��f�E��lGT;�J�E��p�YG�?�u�q��C;qb�ĸņnn \ZY>X�32G)��4����X=��]���|b���ڐ5��U�E.^����>G�q\0���0[w�-[�N����M`\Z��%�9c�p�r������n������j����Fb�*}�{�ܪ��+��v\"�@�M��UeFx���\0�aU��q����\nQ��@.�\"�E�E�2���7�`�J��P+���̧�i�����p9Y]�[+����eQ�z����t�u9��4���x1�Zx�:��\na�٩��ngp��+��o�\\��+���j�:��/V�ܻ߃Y�vkߘ]���\r4W\rN�*T3_aD`����А�����_j\'�������v�	XD��zu���Y�}=a�9�\"�2�Qp��\r�R�Sj�ʸ�^��\na��S��?0(���Ɋ/��{�ٵr��0�p0�:��Qx\'(f��r�2B�ϳ,����1q�B�5)u���\"��s�4�xI,�X����M�\n��1a(1���A���{��fH�$�1ɘ�.�Q�J��֍ƼLRfϴV9k���Hpp%�WƟ��<Ȟ��5+���S+A���-�tk������<Lpw�bW�c�\0��h�����d��$�b�tt���N;R���^�(j,��E\'\r��\'Ш�Î�7�i�%E�>�)I�J�(\\V%,C������0%����x���qne�|G\nZx*.�?�-X�E^ )x�S1\0����\Zi���v�3�s���H ���b3wx}(.d<?_C}\0�;�Nc��s�2��L��\\~I6N!<\'��4���%>&\\H�ip�r��S��>�lWq�;X˘�c,�����j_��Iؤ�K�N�r�����)��:�M!�:�8�S\'h����o���嵛�&xCT�k�,I�ա��=�_�S����n�2�T���\'f\\b�mWY�3MA����.���{��r�_��\'��8�p����\'����>�\0#�q*h_q�1��b���4�D*�����ī��p�tW�C���A�8��A�(�	�64A^F2�\0��UG?�;�JTX~	���Ȓ��m*p��ٗKw$̏�.(;V���,�5�p�w0ǳ=2Tb(^l�u�� 0��m��y��������b�DT�s�X56�0�d��V̽��fc��3�9�v�E�ΐ�5��,�\n��ZTUv~�R���P��CS�K�c*j^?�q6C-J���~�\r��-1����Yv���	�,�n��_>��k�fa�z�i��Hռ�%�̪)T�KtO��\'ظZ�\'���~�ׂ�l�H\r�m��F#�Kg�y~~�н�L��$��\\���c������8�$�]��\n��eq(���&���}�y�̧�����I�ڀt��fk���E��݂�\n�_���F(3�\0lF������%���g�ᕠ�~��Vst�03w�8�����\0*<���9�R�Z�q���?Ň�=�1C�g����CA71������Q��^�S�4���Z[�_�w���������K��~�.�����t���}�\0��\"Uľ�pcw+�M0�T5�3&�0�xML������f2`��+S����Y���]L�`;a���|��ܾV�`����z�77Iո]���+�&VH�\rC1�z�G�f1�}Z�ϡ���\0,K#��ˇs*Y+���q	u�K̳3�L�������`-���q\n��/�����Ŗ������C�(L�\08�!T�0&�r��,0y����ߎH�J6�\\2`b��)�@���Aa���潯�Q�leA]=���ֽۗ�\0��G�)��R��z�ׯ�G��0��79�}�ǧ��<K�J�p��.>����s�Oq\r?�_E��z�e�&`vnQ���/�𕙎���ku�nQC�Y�E�C@>Ƚ�F�16��<�!K��z457Y�!XV|��!Z�?�\Z�(:�Q.�� ������j������#�1癣�7��W�]_������ջ�ރǨ�3#s,K�}�C2�,�0}�T�Q��ep?7o>����SGxL=���H�1��S�j}�\Z��Q\Z�>��J�%��V��Ez>�����u7*Ve�\0�|�4����N�\rOb>#ؙ�_N՜�̩�A �g���I��VnV�3\"rx��.��V{�S��?�_%�_PI�g>!�� ����8�[����\Z�8�<�&��Fx�kNC��6��?�{�����\r���h��%��ׇ��V��X�vQ�\n�de>Y|��߉������`�E�ǔ]��7Sb/S��h��/�V�sG�\0LHa3���,DC�<\'��A��./�Y�Fq�����XW��~g/�2̿h�����\01�P6�y��M���?�SK�+Gl7�G,�@��x�=+ҽ�����si��/�63T��H��B̴�w��^��p��\0$4a��{�i��q�u�`d�Fa�S⺽�L��5�@�����.c�W�MB�l��,�Qg5s�7�w-�^�b��g(˙����r�\"��V��_�f~�ߴ�u��Ҷ�1��i�&fa�.#��C�Ͱ|\"[��}��ƣ��Y����O=8�7��z$�s~�S7�E��Ԝ�[f���:�bkae�R�d�Уͷ�EN\\�8�c�j���-��uU,R8��Juk�\"��^q\0\Z��\"�\0?躳,\0=���[�l���7ى���5��[�ۂ�+5���T�|ϱ)>�J�f199U?<JWv/��=/��=�IS�FG�\08�(y��ù���a�\0�so�r�\0	F��?n>w�8��*��e�/��,72��jdM�\rD.06/\"�4~�Z�o��G���=�=]B��\"��j���-�+Ĩ_�ų��ɇ�qR昌��2��U��L����˖˛!�[���^���1��9\'��z��7]�2����8�����y��`j:�d�Du\nX�f��x�T?�`}��,\n�.��9�ޟ�-D\Z������P(���/A�Z��xj9�?2�j݉4�����*�=��ļKKތ�{�.c׏D�\"bUA��|f�5����8�����\':Y�c� ��,��������n���+����^n���:!	a�)c_z)�ܶA��mѨҕ��*5�����nf���x��SS���l9T�!]i\"���B��-��ԏ���w�e�Џ�\'!$pFس�O�+�ڲnSMl�����8G��X�h<��IA��lܶj��%��K�}��a\r�q�����Y,��=���q�#>U�<�ũ���]���۠�����%d#x�z�	��H/�>�tn��3Od��̟��\0�G.\\�r��}ƕ���}NO�l� ����ߨ�2��.v�l�s�=�ň?��r�?�|��@���f6��X�Ly&I�wNc/�Ucy���9�oZ���\r���	�s;���B���߷0���ʛ��\\������Oa�XkQ֥�V�V�S�\0P�\'��y~�=��6L�2݈�J~b|�k0�I�K�#�/�\\3�D>��w��d˪`�q�iLrkJ?�`���,���M�y�~!�e����̸�0_:�<C�5���K�2�a�G2�J��\\D]�x�#��%JZeގ��z�~��\0�g��G�<c���E�\\G�+���H�G]�&�V��?2YcN�T{\Z��<f�x��[��B�d��m <1�@�ĵ���7/��p��\0���SeJߞ���4^��h�+�t��\r��S�˳,w;����ȎnV&���FPe~��O��&��,���r�(>�&u��&1�˥x��#(+Ռg�LܨF1O���K��/�0��q�U��TMruW�+�+�A�\\cs\r��Ⅲ�%�6T��=0&P��xJ��RtD�GN>�g�L�ax��\Z$��2�O�^�sr�8�?3<q�P��w(S�>Z?�#�=�\Z~:U[ߏ����bsd�Q�GS��ũϭˆ#��&Z�\Z��A�3/^%ÄZ���|`��*��,����Q}Ӡ`����fl	����8@<J�O0������+<����������B�<!�̃nk��\0�̧,Gd�� �D6_	�\0OA?�:��8a�{1�ez\\���d�A�?�GJ�������\r<��nS�i�a���{����N]��3I�#��cPqM�(Jq;%r��WvÊ]ק�������q��^Z:��j-G�X =�!����Ư�f�>}H��g��#�u~s�_�r���ݧ��m>Q����%>`m�t�C��\n���\'�m�]{�?SI����X=e�e\"ߑ�z��=�zs+Y�$���rr+(?h�)2f.a�0�\'�ܻT�c�	,��A	s��y\'������<�.��U1D�<����&���WR��tzTMB�%��sqV$�Z\"��R��qR���)�g\rc�s��%պt&� ���E#�X�\r�U��}��w�}�K�f�r�Y��w5/��,�fys��l�̉�s��Z�#Y�q.lK�CS�2�~߃���~!$G��`����Ա�zy��c2��5/1��n\\��0b�J\0M�o?1�ډ���|Ɣ� �ۚS(sJ��2�p�sJ���XO#Mi\0[H��c*$��� ��Lw�EJ�C3!J�M��6�\0�/}Ժ4\Z|����<J7�0��g~�ܩR�ȱ8�}P�cJj�\'�d�J��oV�\nBk���\r�#�8|�H��\0��7:}��U1r���V\"s�İz��{va�XߥJ�J��&��D�iR�L��Ȝ{����w���2������ְ�4��&&�&=-�9��~��E��`�#woԶʾ��o�X2te����p�(<MS�(q; �\"f+v�f\"gV�˙�G����\06c)y�5���������Pj_��G�Qa/���IoK�(�q>	�=/cF�b����y�][�C�K�\"���1�e�<�Ng��q/\Z�f�K�Q	�<\r�!�Dc���H]�ݐ2C\Z>�*�����\n���p�XJ�XQ\Z���*�p�C\\\Z�\04A�.f�;Ġ��7�L��\0����D��� ���@�:R`A��L�^&*�TU���%!s��n�镓;�)]�a<?�>�ρ�_����d�a�=V�t%y�>�_�)HL�$�����Q��S�?��Gҗ�/�Q��x�q��+N90|��\Z�,�X��(��-�_�3ۡ�Y��	Ux���ͪ�s�{��ɲ㸰/c,���]�����XZ�����L�H���O\0��f}���A_\n�&�*%��L�j�C~��L����A�@�-�������H�\rE^L�ߠ4\"�Ai@�J�A�*�g/��.m��/��1����:\'PAF!�3����)w]�J(��2��i��T��Tw��z�Y{|������pOC$-�\0��+2�8��so���A����ј�$7�+|³\Z�1wSj�\Z�Y�G�A�C$���E��$q�������N�\rYS�;\\���pD���ȃ�}�\\��%R��6�>`nt�Ա���P��`ظ�JE���\r�3���&�ᵎ�5e���e�\\��$�e.��r���Ԣ��G�)NB|�+1j\ZI|l��+(E����4WA3\08��0�2T��>�ˋO�`�22�:�@4e�ʎ%z[��)�xm�>����c\'�aӜ��f 0G�<�OC�Jm?jY����\\��3x	b��%欍�\rs����ܔt�kҖ�X�S���\r]o���%�bgV��j�,���U�w�\'�����_)c��>�Z��LE/^��p�\0��<I��ݹܡ:=�Hi6��	y�-�$\02�p�1J<#�\nĨ_���\r@��Y�\n�2��Y���I%*y�R�]�9��HK�����@��Fd�ũ`T�@`c����$ۖ�T�I~�r���k:��\0��OAE��%	���*\'8�2R<K+��7�\\X��\"-������{%82,3�3�����ӊ�G�	����Jסu��f[#���A*�sg�7=��A�/F_{��B���W���	��e��#�sb\no�\00��.-��l�Y@J�H~z��EF�f���\r�x�1�_xKur8�o��W��\"�� �yL�/�R.+Sb`j���ߋ)��z��J�]��	}�`��9y�/�\r}���\0�	x�0�摭�@,W�n��Sހ�R�6̠��E\0�9�rW	��WI�8�?vh��`������B9���h�g�Űa.�TR^�\r�x���u��\'9���~�&�@��4-x�h>;�J�h�v��U�sa��F�������u#`VM7+\r�e��SSr3���L��)	��*Cوݾ�~�t�\'��(��e�$����\0���\"Z��`�op�QQӲ���D�$���ƽ����)�<�>�g��I\0��e� i}+\"d���9a��E���6D:�a���GH�Z/H�59D�1\Z��q��,�\0�x%\\�������T��F�~1e��H-F�X<�M,)Ed��0�im��Y܌���e:�\n��1�;��,���&�t�-tK�O�B`��<W�#ȋޥ�|��SW�~���9�{��Zw�͞�M��<�=�Dc(̢Z&��/v�:�G�(k�R��Q��.�\0U<�w-������\\޹* <�Zq\n����}��i�,��r�姆P�	K��9Q��I��\\Z�t<��\n�۲�q�I���_4��ɿ�����ے���eĩ�P����؇�%}F�[��w7:\r����>��V�!�3r�9m���\\R�>�I�	)�+�|������\"�\\Ś��vEa;��ؔ%�~P�}�O�\Zb��\'������h?�<��uؖ��p����_�1:�sLcX>\'g���Cf<34�����\'-�[T��%ۘ$4t��3ܠ�2�Y�[mG���䠿���s=� ��َ��*Xz��y Ne��$J\nS�0���#ey����\\Tt�OqJX��P|�V	���ű��:�_�\0�jkE=��2�\'AjX�񼶀O�d�+�F�X�K�Pr�FJw9���+Y�X�Q���vLY\0s�l(\0���*A|&@n���x�)h��/�S\"��T�nٜ]�}�>���?�zi�r�\r@�w-��J���07/Co�%��\0n���G�6���NEg��o3�)|R9��Tϙ@~�&X|�v�~VX+�dC.\0lŘe5_����i�;�#�+m�;��S�>Ћ�K�K���Tx������T��d����CS2\\�0�������\rǕ�V\Z%V=���\'	��A@XLzΙf�B�79��`�$mYa��H�е3.s\"�K�R]@�l�s�E�����Y�{#��	|u�?\0�\\���O��E�0-KSq����(J�����j��36�b�㩂6��^�l���\n�0I�31l���¶^G$�/1<\"��L@.V�Ws1@ :�zmQ���������ja�SP}�\\��\\FX�u�H�\n��\r`�t�C	�j�������p鈺�*����n]ƹ�nI]�-$V�v����0*y�����nͣ���ja|N\n����*�wu��H��J2��`g-!�*�k�L��?�q��+���C%9S���\rey?R�M2�sC����f�����Rf�8��G�}�����jm��5Ѩ���J٩�\n��x�1�-�M\"P���m��,�����+= DC��U�j��_�6��[;��5�$�#��R��6�y�L�z\"WF&X@u�������hrH]����}�`����V:j!�Gd1�B���ܨqO�&J�7�*C����q��9�9XU��U�{��������l�Ĺǥ}�p1�s=�hї~�;���&R�Yql��{2᧮w\\�R�=�{���J+����c�lǱ��G��︟�X|?R�pɵ���?�.�u�ؓK�4%�1�J�b�^d!P�y����/*��/P���J��W�G#Ăޑ���{����<�L�b��^|B��Z¨.�w~�<8C��K�}#�~%C�9�p��1�\0fq�;i�o�\0��0�%M�0#��`\Za�SS�^&#���W.���^�I� ��h���_U�]�����a�C����&����)�q�d��s.e��#3���|G����pB�Q\0����\\f!�6Z�g�RH��;�\'/a��j`�Bf���1sc�No�s�!���`bw����A*���[��ݒ�\\%����OE����+���x�̽i�$�1��,0����t��k����F<D_��jF�F��^K3���Uэ�ҍT���,Af8����(�W�]�	�g|�g)�+_3L�0�?�ȸ��x��\"(E��aN�.^=����,�M�~f�h}\"�{�1�n ˚+����+ܯ�:��\0�����5s1b�JB�t\\\r�B�ή��,B|��Ҥ_���Vy!�0A�Oj��0����H��d��8v�=�N�NR�9�P\\���PN�BԴT�\rF�\'#��wm�`D)\0��1{\"ؚ���˃+�� �sr��z�K[V0��3T>���D|�ҌK����F���U�&s�\Z`��|	Po)��3MI�@�u�t�`8ng��P����.�CW�<T\n*�����K��J��\\F����S���_�X~��8:-ay\\�t���|2�����p�٩�bo�疦|��ɹ�7a�2�T���mRm�\\F�q�h/�e�H\\��8\'d��_�v�} |��R��.��֙��oE��,o���6�_�PR�k\'�\"��,b����u�X��pS�4{�.������aҫ���\r\'PX���q1%=nÞ�վ�!�q��6+2�&<U��h���ꅇ��\r:$�s�DR�}�n�������D��G|x��w�%��D�\"��y��\0�qB������u�c�g���E=�b��9�f#s���4�,1�*�t�����F�g!�1m�,��B����f�o���`\n��˗�����\"��K<~Ng\'�5��N=>*9fT\'��\",���i��c�?B���K��\0�;INf]g�	a�sp���43z-\\BR���K3���\0�	~ϘMv��Ԡ�Ol���3&b���(n�/P�G�\\�s\r��1c��\rw4੥�ӱ����	��R�TT1��\r���߈�\r k�5���\'���e�UWZ���^���J���\0�C�����ĴU%��&� 	�]}�m �CA�&U�e/D�P��8�DQDu-�R��uz\nM�8�%H\\lF}� T?R�h[�-��+A>�U�f �8�\\s�]%ΟAr���	�3$�(�-2򈐦n9�:$.t\"��U����,1\nCX\'�T�R5f�PCK:�v�%�D0��G�n`��Bf8�a�6��3�$8�GOf�0m��\\�\0�T\ZY=�7a�3��8!*��&c6�Ic16����X�}�y^���O��03�Չ~�L�����Z���\n����`B�x��>�IYn�K�kR�x3�&�A�~�.�AS��CLm�a�\\�&X�<E15r\\�2��k\\��v�L�>�_[���>]J���\Z�,�!���-r�6��C��JMO��\'��61�w:\n�<�}���[����e5�?�sN�S-��лܖ��uI浊�Й�9aC>4A�+�s����K�6`����#�\Z��Y��n���+��%��⇥}�����(�]�1��5%�41=�|R��P�swN%���נL�\n@qYܯё�X�����_��y��]�ʐBT׿���,ZaA�bg���6��;�T\r/�rc�*E�B4<*������J��2�<�����#����ܪ��f8�;R����*XwVe����	H2�zASGeDş����z�zqA��RK@�9�����^�(#x�ԬK3R��K_�mC��[Oh\0�u߾�����%T!9��DqW^�I�O�!�Z+Yy����o�v��\Z��Wi)@�AU��E���\"Y���Q׉U�\0&&V�E	t��D��L)��:%E�\r@>��\'�)N%���4\'A�C\"7\r�\Z���%�O�%\rǩ�E�-ïhL�b�oZL�\r٥�\0\'Do/�\\��\n��XK�Jˑ��|J�`6Y�X��|�Med�IR��i1�R�|ʈ`��Q|����p�H�W�\\�Yj���@:ϤVG\n_H+��x��?ܸ�\"��$���>���\"ԥ)UH���T{��sn��G$�5�eL��%)\'�n�Ra$�5윑b*��g@�)B�zW�lX̡��D��̐�+�)�̮�V�%813�1sW�$˨W�\nj���oI���q�n|�� �Wg徐�t�����ܪ��Y��rw*�0h��(4���Bi�\"��㑘xn`b�B�򧘼i����K�]�Cc�*���ơ�\"Gד5rPPز��\0�NH[B����P�q���j6�!��+&�UY�i�#;��B��AJF��1��]7��^b������}Z�\01���9�\"���2w�JK��W-�FJ�}o�5������$�5X<�+v��!\0�.�\Z���Dx���t��4��u,1zt>�[�K��e3P}�����.�ը�}+�0��Z�EE��4J9%K��_�3K�/�?T_vX�h����]@�D� ]73݅�`��0����4��,�J�eGvw�e�iY9�F6�{C܆5�]����٨�7�Vm]l��ОZ��ȳU��zbޱ�\r��`��_�=,k�]G����*$�@��w�~��%�7�)ʹ�Sy�ofa�ۣRׄk5�{�LΒ���3�~g��T��%��ŨdH��Eus)��n]g	�Li��U1&��1$�-&(�՟ėP-�R��(M�����!�F29<�ҴE��1�=�ܴs�{� n��-�$�����w�e�s����2�G%jC�/��`�DT�/0\\i�r���Y���%�p\Z�t<�~��\rW)��\r����ej�E���Li���%-ǿ��3�~ge�d�nb�/]�{��,��ҕ�!E��re߼��1��c��LPm�IT��IWi�\"jڞ�O��&�[*[��2���a�â_�T.ae����38c�pA\rT��i�dq+A�X�/ݝ�y�>����	x,��l���>����oi�����G����pTlud��J!��5+rĹ�W�\0\0����\0uu��\"��7��Eb\0j#-��N�912�Md��2�\\ȱX�b�(B.[лq��q�505�&�H\\����*w6��������2�\'�i΅��D/vٌ�|�j�ӔȪ�̻�����30�d%Wd[��7��U�S�^%˚��ԡ,J֗[P�ԤQ�#,�#���xx�b�W����������7�Y[x�]��F%0�\rAi{F`�-�<<zC�����W�)Q��X<�+�����S�	��Kr|<��\"�\n���\Zk�߷�g��95�>s�Em\\�*�̱��ߢ\r���7TWuAhp���fu@~e\\��W�Q�:\"�lm��@Pb�ڥ��1���y����\0ݟ���^�Z}ʨ��KR��\r3<Κ�h<�h�+�\\�5�u�{�#��Q�a����fx̽l[&��u�%�yc�d1���:���ً�Ѿ��ΰj`�nc5l��(�s�ܞ������&�M�v��7P�5���F�\Z��2t�Ɂ�e$�����}/�+]m̿}g�_����`!%�&����ܨy1qD��>� �o1ه�o,�9�\n��|42��dS�%ψ�e0p2�%l\\�ڎ�[\r�AUķ��o�\"��;��TU|aj��c]�C!�AW�*��r�GOp+�.�d�BT�A9&r�G8>����t\'�q�>Rքg9�x�0�x�ń���Ɉ����u�W��CIRP� �/S)6Jqq(n[�j�M�\n�^��%U���c#����0��\"Q	�J�M�-���jXa�=�g>A\n/�8*�����0�R��*c�ֳR�jK���A�s\rƎ��Av�00e�E�[;f�\\�P�-c糭\"\'���S0Bs�>e���:�+���� ��^������f���#�̥J����2�y�P�B��rL�*���̢���``Y�F3�0�\nWp�[b��O��_��3w�(\"]�!��/x��4rF��4�S\ng��D>��1�w�����%\0>j]!dS��8��bd�\"�B�*�LL�=Jc����I\Z��РBZn���J�����%���h��S)�Km�Ȑ��-�1}G<б�4�Mˢ~���9��KhC�Ƥ�[��LK�~�\'��\nB\'v�JS	`s-�n�td+�K��P��[\\���c�<<��_�^� l�fXj(�Ðr��*	�t�Np[/)��>\Z���f\'>2��m�_l�����/�І��N�\0tC��c�oY�5*/D�,���*k4s=�P���1Gp�\0%J��\n�c��<���\"����\0?�-d=T������Y�����Z��(����,��\0q�:c4;���,�q0j�:`��ĸ�\\�#a��_(Yl2*�\n�V�-�ᕈ���-� =�+�5�3i��G$�p8�-��s2�i�r�3%X���QEW�@��N�y��M��\Z�ʴ��R\n6[Z!n��4��-\ZB���3�\"�+��xe���N�@G�Y�8�5�\Z��I�ù@���S\04N�bDS^�N�!��V�<@[�YIUL�������������\r��2�R��[@��d�7�}�d\rӒ��N�\Z���%j^57�5�����+��T2�V.;�E�J@����^�� ~�,���BstA`�qYaF��R��\n���1��Ϣ2����<Z�.��%QU;m	E�dC�d1�ݙ������\n9=��W��lsjs�����,OdA�1<-}\n��	�FӘY��\Z�(&f|��HC=L/N�qqeP�<�R� ��)�%ZIN>\"�������ʚ���I����eˊ��({�2M~e6GP��?O܈\rL7y�_��Zp��a��79���Tc)\0��\\�oD�6S�p0+��$��eQ�1�u�Ġ��5Q�\r��<�Y �q(Hpʛ�ܿ����Tm�\r�`���QP�\\;���\"M�3r�Ҧn%;�i�-�w/{In��Zj��Ȭ�Kق2���e�s/1��\n���[��M*�a���:^�X��6�ǠC�f(�JzUVaty%�Ő�i�Q�\Z��<��?\ZL�����䎕R�a���b�o�c����\0�ТȊ�c.50�N�,�N8�9<��פ�fSOhP��pdV����<±������oO�1j�v�.�����R�׆�����j�*c͉S����)j^{�e|�\0��-x�����I�O�\'-��&jY8C�3kҿ�C(w�*Eq\Z����)o8�bDj��t���Y��WF��x�ħga�л��AZ<��m�_��Cu(N��Pžy���bT�p�\'�)�.MH���\"ŤX��\r��\nR�s.Ъ��%NJ�eؚ��3�0\":���j4�>g�Eg�_n��5������a3>h�N�y��r�&��O����\0�L�I�Y���Ѕr��2��%-M�b!)J���,Kc����9b\rE�s���|D��z�G�\"���%��̱����#�=�\Z�[�S�cy�XT�Ne���^/�T<D̏\r��T��iw\0e�}�NU^b��<�%FG�nn\\�o�_H��[��2�1��#6	��� P6B�dXN������a�DS�$Q�g�sf}5\\��a��3�5*����ܲ���D�j}ȄX�\r����r�\0���k�\n.�\'v.|k���d`�cW6���0��;���?+�0+w�oN���:_t0�ml8�-�u.e��R�TF����N�N�e�@�E]��3�I�W��@���}\rz��Fv�w�de�,�1ǥˀ��\r*_Ӹ��dO�a\n�H�i�6 �J���j+��_a]��0��Y,�V���@��z*6�����r�pC��@�p52�YY�J6\'���8������]��y-]�P��I;��s)zg7�{�^�J[+n�q2DV#��-�7�l��Ms��ZP�|�dG��)�9�%Bn���[�F挑.�r��\Z]�;Gg e}S�g܄Y�0a��U��\n�L\Z����`^�چ���r��{b�8 �y���*	s�(|α�\n0�Ƌ�0&T�^I�P��]�}x�z��/�n:^�D�LB0���c�jdDÃJ��%\n�;+�cS�- )X4\Z��-���h�c��GQPSK�\r!�A�wK�fmEcu��_\rH Y���(W�-v�Aj��h�&5�_h�Vō����&řw���ƣ�Q�e�p��M�d���`DV�ܢ�[~`[�S�+[��̡C���t�y��)��\Z�Θu`��9J8D��¦Q%}\'����e�؇Ⱦj!�k�*N�_��bOjs�|�,Z4A�v�8�(��s7�;��H�.�4�����KQ�z�-�=�;t	�!<ɉH;�Lu�V����_,5U\n���Ķ#Xa�m�EE�\rL5V��T��p�32����M9�e����T�CL��f@�@�I��N-:��x��rbm�\0���Ha�^!�8%��h�/��,�(��z$Pd�L�y8�@���Ȧ_�P��J�C�R����y��++�JZ5�\n>�R�S�+�<���4�b����\0Y���\0�?����g��?�+�3�\0���	��c�\0O?����\0Á�\0L�}���p������sN\'�<t�z=\r�ʛo�6_n]��ٛ߳�����W������L�b��(ho�É0��\0�W�\0+��\0�\0�[��^��\0��\0\0\0\0\0\0��<��(��\'��J;�\"��7�\0�{�nغ�ׅ<��<��<��<��2��}��3����a\\���*�y@S�<��<��<��(�a\"�[V�1�;���\0��hB�)�E<��<��<��<򋭈�_��=]��\nח��t��7��S�<��<��<��({z��a\0��H\Z$�b���e�:3�.�<��<��<��<�Ϯ�%���[\0.$�?�1{yG_�宄[xS�<��<��<��(.,�rX���%g���hc�p\nr���<��<��<��<���6ʱ��~�C��kT[?�����S�<��<��<��8����+�!������D�kyRO;U<E<��<��<��<�Ϸ_L��>�[=�\nt�թ`�ydS�<��<��<��<PT�(ͨ4\n\0鶎���T�b`n��%<��<��<��<��8�f��=3�w��WK�@m��+�;W�S�<��<��<��<SVy��\n��zR\n3e����laJ�h�<��<��<��<��7�n������D��g�pL����&I�xS�<��<��<��<P�~K�x��V�����HP7��\0�w%<��<��<��<�((�TG�y�s_�ËgwG(q����hS�<��<��<��,i-��R�;�8�|v�������+F�<��<��<��<�:h��bZ���M��\\�����j�S�<��<��<��(`��s�l�ˡ��m{XʊS�m��FK<��<��<��<�!�w�c��È�C\\@��ls\0aY�(S�<��<��<��8]Y��e�u�\'��*\nȂ��h�E<��<��<��<�c\'��\r��3�d�h,W�G�P�S�<��<��<��<u�DXB���b�+w���Ζ�:3E<��<��<��<��.�z���U���r��\0A�\09`Ki�S�<��<��<��,R}�h�$�.�O�\Zz=j*�hQ�Yr|&E<��<��<��<��w��:�orq��Y��mΐM��\0;ڠs�<��<��<��8\\���ҦB�O������n<�\Z�2<��<��<��<�!R4���~>W+�;Weo�J,k�匀S�<��<��<��( ��9($\'U�ʟ�[+cd��=��\0�E<��<��<��<�ܳx\Z��̕#p���$��S�<��<��<��(Dw��KGź���q�7�9�C�<��<��<��<���/�O7�#��D�u\'(�3 j��S�<��<��<��(R��[�8~�\"n�x]x��=�_���\0<��<��<��<�\0ؒ��)\\^��#�@�Z�\0�o*n�s�<��<��<��(��)#K��1�����Ai\"�<��<��<��<�8e��񘿯^\00\0�r�;�h���PS�<��<��<��(�c�/����9�n;}�R	�^��$�E<��<��<��<�\'0����X���,���qaK8�����s�<��<��<��(��:<t�w= 3�\\�N��[1p���<��<��<��<�13%A�P��ٸo��E�Wǰ,B8�S�<��<��<��(�yM_��*��R��\0���Jh8~lCj�<��<��<��<��1��i�>��W9;K�zJnM\n�S�<��<��<��(���*�����`�J\r���\0�xq�M<��<��<��<�7=���|GU�ci鋃���7)��X\0��<��<��<��(��4T_[�x��u��F[�N�@�c�8xE<��<��<��<�+�S-�\nD�dMN-5�k���4s�<��<��<��(��&S�hL�X�v$����ׅ%t��u<��<��<��<��ST�x�5��\"C�FΉ�~��9�s�<��<��<��(*�t��c$���TE`	��5���^�f<��<��<��<� �1���������6�\rV�:�\0S�<��<��\0&\0\0\0\0\0\0!1A@Qaq� ����0���\0?�\0��Br��-���.������	rt�A}	������8R\r�Zy�#w�N�f�VƔ�>˲\\�w<�����`�ߋ�}���YzF���j�$2����t�X[9���.��ˋ�Ož�ۦ��ӧp\'.\'�bo\Z���ە�͞���ͪe�aܖqg�.ч�d���#��q#$�#�F-d��)p���gL$H9�َ;����p�Y8^=4�k�_��\r���ښ���?չ�����3�G̾��ʥ���׏�� ���_����c��g(۷��5i��yQ�P�/��1�{.\n탏݄�F����R[�!�}-|Z���\0��\n�9�x���71�3�����!\0f\\l��OL��ϧ����&�q83���\\��%��HBr�!����@��a4阼L�x�-��,�bݼ���y�u��s�쳥��-��z��e��K|q!��6v�u+�s$aTe��t����Y�����\\�����q�.���+;�=�M��L�����eP����F2�9]?\\ن�2��.��3�����Lx�=�\'L�.J܅L��}�-��O�4��t[#�Q�=i�)��ƈ��A�$X��m;5�Fg�ݗ;4�׳\r�Ri��Ma.,{_d|�-���O/⟎	ԋ��*`�ďE��Á�u7�|�y]�������E��}��B�?}�KY�N�䆒ȓ�[?�	Շ�#GhSo6�g{�r��8��iJ����6x��gD<dSZ��A-7�\Z^u�M��\0]��\0!�?\r��� �_��֠�ǅ����,�\0�8\0�1���~w<�^d>c�7kη�+�]��^rO2�\0���0}�9�e��@�C��Y[�3I��}x���ǦxHw2���=�y��.��l�ќw	�0\'���;�A�&DL���%�G��ڳ�)��%�;���4!�X^���:�R�$�}[��.f\0�m�G�Įoǋ�?i�n2��\0#�LF�g���	+�)�߈�@\r�0�YxO���-\r���?�.rF=´�K�3���z��-�۹o�f4J�0IH�\0$��K�ہc�k�s�2?���q_���y�LXXH,��bL-��p��wn1�)�Lj����F��<�ݫ���d�m�8\'q�o2͇�Ϣ�1�:#����S	�a����z��Ռ����D��#Η��l�1:�x-2̊�o���#��\\��x����_@�L��x�Bp �C�d5�0�+��)��8s�L~�E���y��}�-���{1�q�D�d���D�2w�7C.76x!��u>U���\0��r�:�S��~�I���C���X���������&uC}\\E�	�i�h!�Y��<�� t�w=svVÏ��T~f%竆	��w��e�d?��}���\'ypg�E�\'�%���/՛:e�ms�=N`�B^�\0ܸ[I�?˓gk>#/!a�*ݫ&\ZwC��\0JF	vI�Ap�)������3[te���N�����`�e,x7&:\r�j�5���r\\���dۇF�a�����-u4���g�~	�ND\'X�ۙ3.\'��g@�C�1�����Ək��s��q�1�-��(�Q\Z!-������m2ω�9��<LË��������~^qv���4:��\'{Z_\\FƜ��Kd�3.��\0�E�.���F���%-��I�����+�����vNO68�l.u������>b~wsFl�\0����+#�)�W����K��n�B�\Zr��+;����x	`|��3�&N[�arQ�F1�1�/<&;3�����D[GSC���q幁���v�&���;��N��\"!NH��MDw�i0t�Oߙ&x�6\0�[��չ��l�� �\" C��������X$�O_�Wɥ�˫�q��\Z������I�ˀԦ��cVZ[��6�f�.#�u�j�S�:��Z�h��f�b�\\X@Ȱ��(���n�<31�|X�G��]Y��n�tG^�ld*G7��Q�v�ll�Ҽ�a6����C�s�0,��D����̉ȴ����\\@�/�J��3Ļkq\r���G�4X~�x��zoRYg��;��!��u��A��[�`�Cc���I[�d|\"��҃�����U<بE�\0v[N}B��>S���4q��\'�8�!��=�llS�^דY�~�Ϧ�j�\\��Ȋ��=˻I����]�q��*y���Q��Wdz\'�\\����;�3���!���O,l�\r�݇6喝:s8�/�koݝ}��#�&�Ȯ���zB��@���Љ�*�}r���:�6����3G��[$�03`�AC^e�-�F���0�%�N=W8w}\0�ס<C�N��.��e�\0����6Z�i�,m�#�=��2���m<2�,!�� ��^���#�t�l�p�/pw_D��S�F����>S�C�q���H�3�@[)7#��]��+�e�8&��ݯWIףx�A�drR�8��}ɒ�u��ّ�,��8k��8��r4�@�\Z�x�,>�w�8�d���M��F	��{E��0lE��K[o��f4�\0x�pZw,�6���gM^#2�\'6CX� \"v�X�NO1��f�X�&��d�+N=.\\l�w)��y���qsP|I�KG�x�l�f�s(�X���3Pr`q�|O�\'��d��\r�s��J<L1�J����\'p�iz#ᐼ�[��Zу-�g)��%��o�L#�-�Z�KD\0���d��J���&f�̘P���ym,��W�Zyd�:�p�g��G�4�n�@4�\\��eL�.6�\r�w���-�yH��bS� �!��F;�g9i�5<�� _E��Y�Ż����z���}E��q�j��딵шs�li���V�OX�^AnB�\\�Ywq\'%��\'��]V7�O�/�=9}s��\"zn^g>�G������(i\r�����1�����x��K7��\'c9�ǳ�#r�ٞ�뾛�����}r��n�3�\0?��\0\'\0\0\0\0\0\0!1AQa�@q������ 0��\0?�\0��AQ��{]�ٳps\\�8v\\x_�ÿ��&�޿��/Շ���?�F��ˀ��:�x��?��q�?��gh�|�?(�H�?j��,X�P^,����6��˾.lŧd�;���݄�\'��6�o��Yi�c� ������=���ߋ�~��a�-�&�\"�zN���2@y����^�=�<A���ܾb��:� ��~9z�������߼b3�܅�\\[��e̲<�����GQ���\\@I��9�a}��x�6����`w�A�\0a#�\0amܱ���������������5�,{������c�x�ׅ����\'�\':g�K��\0��&��]�}����ğ����/���l��F/�����%�b?��q�3��e��\0��}�x�5\'�ÿ����饼�=Fg\\�3;�3%�2�P�\0��?o����c�\0s�~�{������=�� �e{�f|�m�������\0͏_�\n�?P�O�ϳ�}���g�`\Z_I��<�%����{�����!�DǱ�t}=�n������Y�\0t#�5��?Ȝ��qrN��&��n����.�N����6���f[@��o=\\�j���ۮ���L�zX�\"?n~�_f\0\n�J��f��q6#6��],O���-�u�Gy�g�{�Y��y$C�~`j��?sӥ��V򄶈��=���&[�.�sf_��\0�p�n�g�^���Y��ˈ?r��w���~�&}�������ם��ֳ���ğ���eŰ��A���&�!J��S�_���g���|C�;��s�>{�A���k�wZ/c.��R~�����~�o�,Z��oq��lo;�w��$wO�7��\07\r�	����� pՏ��c��;�%8fmǽ�c�܂�^\']\\g1�1���H�6?Dˌ�ua�.�T۫��4~tu���</Ev���-�mŚ�\0���`�-�̞Oי��S�m�\'�O4O�̀��77ƀ�?w���t~���>ei#����7��#ٛo�������s?�P^f��	&.���\'�0�]�\0�Oy�+���*ۇ;$�J���cf�[�Y���<����~�XRGk��y�=��]#�w����㫻=qG2�t�)�>�@ՎFf\\��\Z_���ci>(?R͏���.�r��\\�\nj��Ux��h��y!>���gMJ�R\'�����ݩӚ��ܾ����4����	�>L���?�.�0��V	��$�\\�H)����\0��\0\"s�����v�Ohgr��d�$��I��[����Q\0��Hc-��8b{�E�����\Z�3ԣ��}�?� �{gd+���I�fm���៉�/1�-i�rl:[r�;c��`��\0�y�حY��{�t	m��x��`GPWf�Rqypom���5����~���\"��<�r�X���2Gw�%�CB�����.q\r��>����Xt@l���N��ϛK��K �7�\Zc_����Pq��#���\r�$|�D�C�aD��#�a����ֿ��j>��z�\\%�w	r:O&�/��0�N�����ƼX\Z��\'W)�=�z��\'�-/����OV����-t\\��9��?-��i�#<���cG�V �<�����@��4�����F�[�k\r�����g2��fsuR[���)��TW�Y��^-�;�K��6�c�r�ݎџ��mM�����O+��BnH[�תl.C��K��߾����\'H>ms(]���f�v�����=�US\0  ZZX�k���\0:0B>�\'|Ü]vY\"�ϼ�9! ���w�D�,�m��]�;I����rq��2\0v�.:&\r��6��1�|d��u�`�Eɼ���>�-�B$z�{֐�M��d6�`D���GV,xɖ�S�L!�yP<�?;����$VMS�.y!�Hݑ������nI�\\ė���I�����.~%h����	^#�`5�?���M�@�9�cj_7N�AsSsJef#��$�4����2q\'�q���f���k�`�x�ǦL=����:��>g�@J\0J8��i`6O\Zwr\0��lq�F��\'\"S#��C�ض�l�_��!��#�|Y2A�u�Bץ�N�@Y4�]�n|�,�p.Ne�\r^&�[�?h�ȸ̞0\'Plx�1#��.��!�ba����[���B�zo��t���\r�\"���q+c����E�`���7�~��dF\r��{1���ٲn�8�bxdW��\0�6�\"�{���w2�Vm��|\Z�b>��\0a1�O��6\r�` A�C8�e��u�A��|�a�sMkV�.��}57W�MX�_��l��Ӻ�� ��K���l;�~c���D�3�ٗ\n�)�ޠ��]^$x���g�`A�.��>��ߊc�}�`�\"W[�mς3a�K���M�sipp��͒�(�#3�tJ��2�Lf�\rO3��F��icR����|�Q�[|,��q?��<� 2\"W0�\nrF�[m��s�Sau�Bq��㛓��H|F��7՟ZNr��Q�V�Gᜋ`�&6��dLk&��p?sox�	�I��#�s7vc!�Z)˘[l�Kv���?p>l��v-��%)�y�Q�������$���0�����!\r� ==N|@\";�������O,r��4�n%��Z�Hl=�X^w�d�G3��2����`H��rN����}��O��ps�,�zp��ߘx`��F��~��CG��e��Kn��7�3���(GB����;���=��1�C�o��Dgq�X~?��&¬ r��`lC\\�Oq�M���{,NB��Ɂ�۬�9W�_W��z�pd���Iۉ:��r?�h�C�u&�7	�ZZsЃ��S�w)����vM!�J������<�����a���5�����z�lB�2��ni�>`�~ƼNy�W0uo�h�ɹq�!�z��(Tm��n��BH�,8�;��Y3fݙ��Y,]�켲�8������t|�2�P񾂀����3.}$�8��:Xï�G��7�l�E���[���;�>{���[X�rb_9Cr/��������G�����<T��;bـ8�2F�J<�h�8����>0�����/�.;��F&��q����\'�z���v����!zOw�3,�2p�Ų�*�Y[����b��S�6	�\r$:�GA������!�;�.X��\'�@������ֽHv��ϕ�pd�L-�pB��0}���#���y��m��\nZν��1��0[��k�]NÅ�Ck��NtHI�\"��j��3<d]c�i������wau믿���wvze�z�u�)צ�X���\0*\0\0\0\0!1AQaq������@P�� �0��\0\0?�\0��&��Y_=�ӤH��R�*y�*�\0=�A�n�������<���,-.�\0C���\\FeNe�y2й`����\n�����\'�r��m����cD!�Eڕ+ߨ;qV~����\'��o�T/��Bb�rYLB��=��6�\rJA:�dOy�<��*��.!�{J�.<67zB�m\'�Mഗ��.����[8@���H�ܓ�����l�E��}l@r�_�����?yS��O`��rZ�]��t�ەf���Y9����Ɨ�ozP̳]�i�LF�Z�� $ʭ8y}�]\ZS�\0\Z�#LK��7.(���\nС�+��~^��B�V�Y��	�m\"1���L��t|ʓ��_����������*�C��,�K3o}g���wz���.3�ʀ���I ��1op�V��8�F�\n�N���n�C�9I�i[Ǹ�Vѕ��`���9�py�Q�ZU�}ǮY~��գU�i�Ơ�C�H�ꗎP��4��f\r-Joj�siLjw1�;�Ƞ=;k�L?j�/�?���uPLj���L�6o:s����v��}\0���Q�h�o�΂7�[�yQ�b72�,��1�.��/�\rˀ����`�P+.D�j�F����T͵!�q�p%ڭ�I��#K������2�G�(]@��u�XVh���)�1Ki=G9��0�#D�Zk7��v6��{L#�\\��ݝ�b%Q��5p:<���2m.a�yn\"\0��\'\n��S�v��X=p�\0[�,*�.!0��9�D�a�hQ�/r��J߈�ר!C�a䔢Ѭ��EX��(wL5�V����)	X�!�u����[t����Ge��;e9(���{����M��W� �i����Rǭ��	��\Z+�)������i�8\Z�!���D���e����0��)��&�o	/x�*ѼyMv�,h�?�����CnO��Wx�XoX�S��D���\n�=#�G���~XkZ��\"8�\'�|��¯\'/�bX����<�k��g�4�w!^��i.��\\-���#/�R�����6�\n*���WJ@�S���q1,���)J>�) ���p��\'�P]P2�!�q��}+�A.���g̓=h�C�*��xC[�#�$<UŰ0�3�0 �(-��c��5\r���\nT�\0��i�{��$`��Ƽ���j��j} �+/�%#�n@�K���7��~C���g��![���\n���R:n���u��~�n�e	���,�v�� -��\0	P��Z����4��T��U]~X��f\\*�X��U�8�\nl���ݛusb�ܼ�rX�q{[��&��ܣ��q_*f�nL�}Lк��tJ2��p���8�|��&>!�tvJ\nw(ܤ���N�\n�K��,~��P��xe�@|�\r%{%	uB*�*׻%��U)#���x���0+���\0x0�-�kV��#��]��#�k��.#Vf�Đ�G�V\\=FM�-j�ԡ}>6Š�_�2���Z���~ei��>p��,����pC�bzs$|=�b���D�� ��G<�Ś�쨈1y�~��G��D\"�5��/�93��%8a�9�z+�q���\"���\0��r��e�h��7������8=�M�Lln�a(q����*�9�į�-�-K�	J7��l9�m/*��J}\0G�3�����SV�+�����jlAX^y�gVJ�d�qt�d )1���rQ@��\n�D�Z����qE�`K�I�m�\'�\"��è��>�|�:��cػ�S��q\rr��ՎI�)�(~�텓��͕���e������h��\\�!����,���Ṛ�� +LvI�Ǌ	��?�C��Y}���XKB��~��2+Z�aA�(��\"�N!U�^ �g��\\cg��� ;���ti��:5�Jh>b�(z�X \'1B�=F%�qz�H�Z�``%��H.�Ī�~3\ZWp(ne�C^�!���\\�퐸\'��\"�q9��*`��HKjW��s�`�TYfa�%�sYK�+�e�O��W4��YJyf��kX|�?Pp0����fQ�O�����E���*SU��p�R����8ʉ����_h��xU���F*��!�n���0�k,K���B�S���7���2���\"��*�;����\nԶ�4!����ǙuݦP���b�����X�WB8`�g<ŊS�l+�6\n�UD�UY�Ț7��s\0T��P=�H����J�N�4�pl���\\�O�E\r�.(��� \"�(����\nZ\\䩆P�x*�t��y��T�����J�T}���Y�a�w���}�0Y+��A�#�mLN�k��o��\Z�����\"��57�`�ƛ�9���`�P�ԥ��#��pZZ��\0�jQi�skb0��7W��	��|����A��4bi%T0q��I��0�+\\J�)�Fzp3`eWq�+MJF�n^��#��u���\Z\\(&@DA|��;��90�4�+$�BD4z���-��8��%W����d��he�}�,B���x�}��T訫t&��r�����\n��:�G��\rKa���3����m_���Ȓ��%�Ķ�M>gk\0j����#���\n�E�7���e/O���U�1����0�rna����숻(������g������\0X&-���j�\0��G_�|����O���w�FF�Ij7�\0d��\0���f���mH�g���L(o4�̠߲Y؏ �f��85��\0Y8D�I�Č��K���/����0�����\\i����u����K^\\���\Z�&�[�IjV�[b˫��OBE�YFK���e��.���5*PE\ny��>�M�A�u�\ZL����~�\r�f��:YCz��P\n��U��X�<�|��=\'N\ZlL��D��8m���FNU�h����t\nSߐJ;�*��\n��/�)�|�\0t�����a[������U��Y�0�߅��3\'�\0� -����_0�XD)�8��R��D\r!�~虍h���Ϡ�OVG|�c�5�|\0G06��k�[�Ն�FqP��.LC60����\r�#%�\\q-=T�:|5�;��T\r��\0�2{��JqW�b5��㈥͟�%�>�O&�B}3�&��D\0^^��M��=��X��c���D�?��4���!�T���� �8�/�Ij��-:��+���\r~��WԷP�6]g/3\'9eֹ�0V3O��XP\00��i^`t�{���bصc^!�>�����Q1C��p\0\\>��^�8>��S���B����>K�)��@)3u8B����*ׅ}<�m��.�aP���<:��E����� �)u��z��h�7\ru*1`����!���+/�h���q����Tv/\0%�C�\"w�ҴzjsY��,\rn.��nč�����0f,��Am=W�1���3_�X�=�\'��:��6�/U.����Ť�U��%��A@B��>�/0�ӈ�\n�S����b��zq���9P$��@�+��P�=+�\Z�qdx���y����3\n��\Zu�iL+q�00\r��3r���J�/8��̨�oH�)��W�*7sL:����pڿ�������\n���#~A&��\"���$�Rt��:�-䁮n��F�GG!:{��U��N�b���k-b/6��\n֔������+��$��{C�JV��%�CS$q)�@�b�\\�4<h�A���M#�\Z�\0A�W�F[O��|�bս�T_��N��i��.\"�m!�m�\Z��[X[-�JB4.R�aT���֏�v�\'\"K�t\nHe�>eK�D����&ѹ���;u����h&�C���7�i���f{�����j{c��A��@�7\r�woB�\0_q�-Cws���AL\n<oxB��X�����E��s-��^��X�s�R�ڜ��\rK���tܭ��xaZ\0(���|�6p�b.#M�������dR�X����{#��?�0d�o�\0��qN\Z��MՖ�8\n4_��6��\Z�\0@�a�E�KJq\0�̤#.eҸ�.��\n��/��W���\rN%Gu.�t �4V�q�ө����(��0\'DMx�1��\'�|F�7<���1C&��!�n�fB�j�P��tN%��QYrϩG?Ph��R����P���e=K<Os��p�1��Q��E}� I�	�3�i�颭���T)j��=�F��~gQ����*l\0�׉w����H�<0\r\0?�������:X���/��H6ߴ����[��������=��}����L�C	����v2����������u5b�����)AW�?WR�\'�v���_\0r�0��?�(P��T�Q�KK�X�o���+�GY���}�M����슨\0,�$HP)N[_�h�a@�L�ay�e\n*�� �M��v�Q����Ly��-+S��JV��7���%�\\PX��+ܲ�u%}�\nG6�BQ���Xc3\\K�<j;̴?B�R�FM���oZ��#��Ply��^cq�l��V�ǛO�Cd\n�axí���8c�U���E����l<�\rC��b�YTW��:��\0,r|��C�c>��t��]�Ée��U�r��k�r�%���eF�~�f�nl8:ah�/m�PUq�Ey���\'Ԍu\r�fd�Ag�ZB����Իnf*Q\0���JAy��,2լ@7\"�mL��\'R(;�G�V�,��\Z���B?��b��<6�T]�#��P�\0� :gD�=Cu�\0�7�!&���l��%���E0�[F�C�k�T\0���w��	T+Xq�mG27�f.�M��n>~�\r?ܼܬSH�XQ��y>`d�N>c\ro1pc���VītJ��v�[W�15�j,Yј�,�����&���G��Lss�ԃ+�� 5\0W��-r�Un�kцb͠>�+6���,h���������Z�����ha�3������~�XAeJ^2��.b=x�ܼa����y��]q/����%$�XK�6�u �o�K�7t����Op1�݅Um���%7B�	�*I�C���\n`Z�\r��/,�d���\'�� ���\\d˳�����#�|�m���dkU�J��5J�|�fA&qhF�+P2,hp��r4-Nթ^����E�+S=�J���L\Z�e`��+�Q��v�5\0�j�=��E��1s�G+�x��(]��@}c�����R��6/	{�!N�w����#h���pL�U�B��ՕZ��pe炾�	�����W1�C��q�NE�Z���$�h���~u�+�߁c\0��,w�V��Zc�x�8�`� V�c/���<�A8��\'\\B�-� \'��M�\r��,gH�3	e����6=X�@b9���)t��C��/lAGqk�=L��!�q���r{�;-ۇg�^�����jQz��*a=@���p1��	aq-\n��s��m�g��<��ak����3E7qx�Q�?h#��Gq������V�)�rV�?��,^��Km#ҩm�sez#�V��I�\0;M�%|G�W�M�� $\ZC�Ĥk\0)�|.9�.29/������-�<FZ�.ט�vU�o�F�~5E���b��?**���)=6���i�jUb����8�W`�0S�z�m�VU�%�~��8��cm���W���hC� ���n6�H�W	���G��g��c��E��j��G�3w��G�K���	��ĳĊ\Z�Ug�-[u��H�����M�[����]��o�|rl���L�_����$����@�ͯ�#T�z�%k��\0��\'�A�/ܳlP3\0l�p���J�����Uӽ��%�I��|\'���iT��E��H\Z0�\\{�i�ʡe3\r�E@�j�ߩU�gP%\'��\"�NK+��&�{f�W5�ܱs \0e�**��U���KfS�8�Z	yh����/L��\\ouq�;|��kx����Mm�l;��k$7@����1�[��EQC�໙\"9��Q���h�������B��è��2�r`��|Lb\'�F�[�b̍��Mb�P�nPVf��E݂ �}�A��E���9s-h�x��\0F�8���e򭣬JBТ�4�05a����b��ץ�����s0-�$�3W�\r���;c����Y�,9]����+��w��/�8Pz�:�n��-����o��#�w΍��1�\'��������RST��^O��9M���_��&\\��ui�/����]?�:������BV�%�\r6s\0��ssE�>�\0!��=�F��Gw�$Ǵ�Q��4;.^�)Y��|Lu	_�RFm�%�[XɩB�6@� �����x�\'�v��\\~�69FP�zi�U��̱��US8�E�AĶٴ1n�\r7�b�`��I�|��Q�/�if�s\'�G>@!�7��%�G���3Yl2�վW��s��B���^�hvʮt���P���\0*���a\n��D����N�b){0!�W��b\"C�����:��%�`�Q�V\0�U��(1�\"*/���i[ڱ)puAZ�Cg�2�Q�> 6��MY \r�6t�\\4A�S�� ���1K���-#�`<��y\"s�\n�W��R���J�R*���\0�T4B��x�W�3�l\05� ��1,��TP_\\4��\0h�����[�Z)��.�o���j��Eۈ�Ü�B�\ZVJ\09ǘ��&�\\�0��\0�ʣ_���,L����L�;F�:��Z�)���ʎ�H)�y�R�1roԣ0z�sR kX�cf�#@�M�v��p���1-7�ӻ�G�02B��\0��1�+9�ܿ�-��^�F�mԠ�fc�7`���Ds3�^�`���0���\"Wo�Lc�&Tʑ�ϙf�-]�5��U�G�������c�!)cqsR�nR��\0S��Z��U�:�o�X6F��A-jԏ���U�ˈ͔<��G�������\0�\r�.Ws�-ɛ����k+���㹉�0t�ט��������������45��Ix���L\n�:�Q���8��c�m�[5(��R0��NX��`�Ÿ\n�����C(~h�S2۳@�|\\���Y=`���J�4k���\\f�ZR����g������h�(�p7����*�M�;�����h�U��Pm�H���\Z���\'�X1H�\\5R�^�C9����vK�mĩ�b+cUs\rt���]J*��C�P@Qz�0�U Tz9���>�<`�\Z��_�Yޕ>�\"���L�sw2�\r\Z�\0��|-2�,ǀ�%U��pT�������&�L*ReG���!�H_Ŀ��_����K��!;�^�a���g�)U���퀌�<�L\\����W%d�_��(�k;����0�&t��-\"@�a�(*6VY�U�X��@Md����X/�+և*bқ�&���`+��<��?�®	eUE��e�m �傆\"��Ee�/��N4H�����8�sDl^jf�Ϩ�}�a�fo{vɯ�m����_\\�By�ё^⠯W+�65n�_l�?�s��y���r��Z�c\\0�\0�Xy�2C~��5�p��S�(�M�X�8���qV�3b�K:��]��+�\\0�q�\\���2�[��_���K�;MԠ�Q��x�|���\'�[����,���ڀ,�SD ��!TW��EP��K�%����#v���S���)�6���pEָ��uu�� �(b�2`�.�0�?�\Z���l��X*u\n�҄N�L&�/��m��F�ڱpT�H+����g�1u�>Q�\0���*1B\\�ˊ�b�mp�YE+��^	��A�[&\r�����l���c0ҼBW/1�W��t��-�͐�S ��� 	U\03L8�D�\0݇���\0�\\��$\0������$J7�ah�2�~\'Y��|)#H�N�8��	�u�,���Uop��\0�\rk�JE؋}�%�iv�zT^ �\0!�������F6@�`2�i�(��\Z/rE��C:�EP:.���G�7��\"����V��-\0�-�]KCE�2E��[�w\n\Z�(�l�\"���J�PhTQ�X��N{�xpƢ��W\0�����\0�!C_�Xh�����`�s&�V\"�K+j_�\0��}K��\r�J�P*��:����+��LJ0�)eV��S���\r����A�G�~�8�>%Y�h����ġ7*�3\\J�\n�Ĵ����i���y�\\5(N	A�ae�S�?o��G\rU����0�Q�&O�륞�L*w\"�.��������c\n[@�x��+tM�~ʿ19M\Z�8�]h_pOqO�&����g���f���n%�>ng1�. j4A�\\\07X5�w�\rɈE�5���{��N���[ī=�Y����4U������@�\\��3i�5	�<\'�>����_��c���������_��T5�W�(<s5�J��@p�J¡�7�c�1�Q1*�Q�*���H�U��V�2�v	��\0UT��3$K=�;�[�4%��Qz��m�F��O����J�e1j[�8L��Y����\r�`VOI��C���v��N*�hpٶW�\n�+qQ��3VķN`��q(-ޏHh�?�%\\?�_�,<D�\"��!Õ��DsĨ����������W	.�p�O����n���!.3��G2���Ir�I��)��|(3��SS*J��8�t����E����8�֢��]�x3��\r11����A�£�2�بc�^m\\�UF�3���|������z�Iq���73����{P�\r\r��X�M���{�P�t4u+jB)6C\'�����G\0\\L�R�O�冕���1� �B(�a7����`��3�j�B�YA�D\Z1��V(�?hQu[�/�<���\r�Q)~�x���t�v�|���u��@%@�a���\rf����*6Rh�SKWK��DMJ�A��f\r�5��Rz��M�,�_��Jq,jlE�p+`�*\'\"��ĻvDq����=�).q�^9v�Y9��̫���%� ���n�b��**]��R��J5����3&�=���<��-�W��^pNƋ�b\r��\ZeK\\�4�O��\0=�\0�p9y�cu�j�\r���c�6UӍP�u	7p����W��J���K��Q�5WWjU��Y�ޥMLD.��P������t��Z�pr�B��uU}�K+�q,)�3!���\"0(��L\0�v_�Q��	�STfcg=KCM�J�r.������1LBA���\0_1(����\"d�w\Z�y^���ahXw26���C����ā�9�{e|�*�U�^��2�d���h�3�&c�w���@l�p�<��/�Y��:n���Z!r|��P�!�\n>1\'2=�L�9�d5���мTf\0he)�%B�ɈH\"�):*����k�j=�*�u���)��4�p\"-J���;�������0��f\r]�>�\\�Dr�BE�Wr7-�ʨV�,B�a0��3�<��F7.ewo.׭Kj�1S�����^\Ze�s�P=1�+�wq��[���p˪�\\l3�t���m�YD�O1ۮ��p� ��e`�\\����z���&^�Ւm���Cv�$�E	2!p��̤֮�%�f}<���7�1��0�u�GD���?�x�c,��v^�`c�O���p4�QbF�����^=�Zf��-_����l%��D��\'K��Q��W��F >�rr]1{O�,R�|@��c�QM���D?����Dq!������;���׸9	�U����V���\0��/��X�2\n����/gJ\r*\'���;�Jr��-�:?�K�\n��#&4pQ�њ��BH��[�\\����Y9�����V��yu���UZ���qEp���1��0��w�pc�JE��6&\ZE�,�2�C����ȸTF��\"ٯp���<�Kd�lg��K��ln\'�\n\'?��G����Z(���Z�����ܯe�!.0v*�u��Y/n{�\'C<�p���<�d)�\"��yc�c`�՛��&B���L#̟j���1���-1!���1�l5����3��L�S�xJ���@M2��rʺqg��� ��7�o\'��@�_=����@q~����6Fh�i\0o][2�*�.��q��>b�v�NY@�[��g��f�1)&�\Z�� [ps6���9��SLIO��b�`2פT�s�dER^Q��c�!��2��+��U���\0�B�Pa�\"Ł��sJ|��J�~2��([V� �I�+����4��eÍB� ��\n2r�������k\Z�Eq�?r�;qJ�|�Z\Z�O\ry�6�����=�jd bQ\r���%�Do�C1[U�ν��$�����,�s3c#d\0;a�.I�XaQ��|����,����m�B�\r��$_��E�\n���!r�o����Ww�0�^X&����hgp���\0�h�_�p�@�Q]���\Z�\n��8-[����q�%����/��8<�-3����*��V%>E�<:�/~��C�r=�J���q\'3b�{��C�\0�C��IT[.��rD�n�%�[k����f̹�w���D:�\'��?�T+��PG:�q僨%GP�����/gXR�h*��S�Y\'ܣ�0��~$�\n��\0��n�p+�Q�\n2��\r̚L��\0�(00���ޓ������Z+����ĘBv	�%x[�،��f�\'��ɪ��\ra�p>	PP�Ø�9�_�Ї(�C�Pr\\�W��c(h6�\0P���Iy��.1Kh^![����ĳ��X���g�Y\\Kc�QQ�i/kl���k\n��\ZZ�¦����5�����\0 ��M���y���Eu�������0-#�A���U��5��)X�_N\0*k��\nT(7���b�F��BG�8|�\\�E��7�U���u�D�0�=Z�6n�I��V-��0sW����p1<7h#X���a��\0�Q�\0���;�\0�^����mW�3\\�K���7�f8��-4����^a E\0�=�i�(�	F��|�hj�+<L�\r��(`W	[�s�¦�\0��tFi��Qj�+�\0��d}����Vs)V�V���P^�R��ӉLHh\"�\'�@r!2i��\n����h����e��l�\0=��ha�ruل<_�H��^l�|E`��#gE.x�}J\Z�_�?�\\�9��^��)���4y�?�S^Q�p�r?��XX�j��?��������3��\0���ڟ̰�`�����$El/�)��?���3]�h��~�\\�3_�ǋ�k��q�i�3q^��R��\0�z�!��L��*�V,�\0�H�O0m\n�SdHH9�\0(;�%�+�7�&؀p�	@@�)<$ɡИ9(���)�B�D[�*n\09`!Mk0�x���Y�ޘ�*�G�>�\'��KX_�\'���b0��}�L�ƕ�PE�M�PX�99��Y�M��\Z7���\"4�z%�D��b*�J��S*��+V�J�P�mn�q����rW�&�h^ep%�ty���M�`h��f�܍X� _��@�1j������\0��	��b����i��FIԨH��U���By*�>�J�=$^�J37�+V�q�ٹ�FYn#NJ�0��\\�\r\"���)*�sך�t��wh�(b�1k���/�R�l��)��Gja��q�\n���CF8�~���k0�~��\00��֕��s-�v���J;�q�b��ͩ��K�g��[x�J��0��	Tgt>���c�OѦ�Db�wù?�3BAxq\Z�[��\0�9�Pj� b5EͫV��^�)r���X������@��<\r�:v�-�����ی2�oR��<@9f��5�ı�,��	��@��e\Z*�\'ģ!��+E���(�e��]�|��L�@�_n�M���{�0{A%�n�y��q�\n3W\0\r��Cԯ��++,ۂbS������\0�\Z��5���\n�|�H��-�rz�5l�ӈϪ�X\Zup6��l�khX�Wf�i>�#>`/��\Z�\0\n̺�]�a�vH�ʪ5w5�`�%ʺ>*`az�G�q6;G�?Q�F�p�}cRө@+��TQC(i|��*���!�+	�e�N�I�\0R�ԧ TS8���d�c!��\0���s�5�\rb6�L���0���\n��{�ĥ�@6Ë�Է9�f�w.\ry���&�p��e�qƧo�!���_�b׸e��(z&avEvw���\'P��R�*��N\"bi�{�\0©-�ybBN��!J���dCq���4�%t�}C�j+D!s��b�`ƒ��Q(�(\'�ek$�-\"��K��Z��mɌ���0֑�\ZV�O��2�ݟ����h{3w\Z!WI\\\\d��`Ȏ[i(n�u�O�Sȼ��a��1~|�W��3�թ�d2�[���dB�0�)�+���JA}\Z:�e�W�2���T��̢�.�X�-Vbt����pG\0cQ�P�#��n�2��)d��n�0��R�!�zw�)^�Ɓ�B4b#���\\\Z�p��\'(��Q5��T�}��A/E�\0쮃_�A�jq�\n6E	���j����#�b�M�U�b#&��8 <����y��T�[�͑�!u��!Q]��D�K����S*�{�(��@����Ѩ��k=�?3�5U�ɚ��x%�&��\\��ȱ3q9J������1ZxZ��)�R�|���B5�S������*�t��$1��*C��5���.S]c1�eH�\n�l�Z��S����=Q\0�ǌEIvT�P�̧����o�Q��Y�LN�,c\0���{��T��P�u�|e֠�\Z�\0@� :��i��L3�odۣ����V�?R�#7��*��-w格u�;n�CF g�a�˸oQ��q�.a�& ]§K1��EԱ0�eQSB\r�~R\0Y� �L��@�a�T��AN�a�B�R����|�B35�yjX�l�2�H�\">��Z.�X��uN�1�b�̨u^4�[�a�C����(�)��P0�0d*%�a\\8>\"�*��1?TW����\0MhW�b\nY5�ZH�z�M���5L�e	-1��\'�w�z�˻W���\0��fs���K0�Z_D�E8Θ�+j�hy����Q�\\t��pʍ�.e�x��_!��r(�pZ�]�e�6�*�w�ڻ���J\0-�F��\nI�=l�D�2��\0vf�?rX��X��E}1u\ZEã��;A{_�w�*�^e�a\Z��W�R��#��\\W#1��ؖ(���ǵ����B��J-��	�?�b�����x\"V��=���ʘx��E�/��l+�,�E./,M9�9ܿ\0+��\0����*SI�3�@�.=3�2���Fv����Z��Xzw���9�Um7�w�*-�\n>�B>�<��P��9ʳ0uY�0�i��� �xH�H�;;�\Z}~�jS\r��+��� ��W�~�:���P�g�#i����q�F#.�%	��F�a7,�}F���_cgP-�k�d~akT?�,��#+0�hȆ�^Yˏ�y��	e���6��<�V��R��:U���+��������р1[��Q(�f�}AJ	�t�X��q��܈�}�����4��\Z��X���M�YwUMA�U�D��U�0��V�,�����}��xS1Ѡ`���d#�o|b��1Dp�Dܩ\Z~�GMΚK�|F��)a��~ep�4�+7���m������t�����\r���:|�$T*\'���z��:{���r��\n�.�A�UˋJ\"�������cgm�/|C�%n�P��.QE��n�=B�V�\"�Z�G!���Wڀ$��~��n���T�(��V����0�^ABwխy&2��5h����ho�HA�9�n&h��=<�U!t���Gйy��T��r=)�@�T�7��`�4����X�e�����MŽ/u�X�\\���r��)���v�0�9���E�tqsk���\Z��ŖL� \rA:�%���&��S�ߥ�o�:.>�p�(��۹l�@�fq\0�=�gQnd5-���-�?ЅM�P�7��kS>�T-e7O~�rr���6��`.�D�7�!�y���\'��Ae�Gh�̙q*��f��%w�xV$�>\"m,��`3nh�2�%�-��_�ڔ�b��W�6;[_n_�Q���!�Ϭ��S��͓��	���6b?P-~�\0��j\Ze!KD��.��*Ҏ���2��!0b�lk[TY�/R���¹|��9O�F՜��X�!��\Z�:uF]��li�U��v.�����S&%�Q�e~���(�tx�����nي�ra�UF�[:b��.wi��^�jZ�啛\rӆS~AYP�K�`KY�P��*\Z�\0C�x�A_���Y�8�/E�TAK;.*�6�F9�(��`�F��uŮ.e]��� ,�	�8�wl\0C�/V�\0K;�@{�0X5�d�Se`����65{Ae\\�Ă\Zǽ?��I�׉�Q�F��d@�q�qy����c��p����ܹ�V�,*�}�s2�f?�`��@���V�K�p<dRC\Z�^�W���m��e�B�H���`�mQ����L ���\Z�:��D`5��Y�rh)���m�0GP7n�T�^ h���5�K\nX��.����l��Ka���F��Ǽ�Tx#n�U@m��M��`Z�,ߨڂ�a�7V��u_Y1�\r��P����`�\Z����V&X��ҏ�ao�_p\Z%���AR�q��%J�qɕz�}Ee��]W��_�z�)��2�Ƿ�<|a�wɃ���E@��2:��3����K�ɻn펈����e��n�:��K�I�<�Z+�gYA7��Dp���Gr�%x`���X\ZAv<��j�~ۖ�E�X�Z�:���4���a\"^Kd\":���o���ɹN�Ĵ5{�\'�i��l����KA�$ɏ�o6�v<��\nZ~������݇z��w���\0F�_��D1�P���j\"�l!���V���\Z�>u�P��R�gk���d��^�M�;����C�a�H�	��\03����r��z� �0&����$)j��G��+c@C<!�};j�W0Qj�%�ap��d�+�bX<�����R��N�Y�F���侨U4f7z8�\0�K\0���x�O�-	���\0a�~cqߐ��[��|Ô�M��E�����\0[����\rq�V�\nX`�PA$�W,���0��5�Q+��\'bSI�@������>b4@��Ų��YcK1P8���&�09K�I�u�q*����W�m��*O��\r`k�yn�b�#`�+*kf���A�hڢ�r��7#\"d��%�-���	D� �y��!�\\��^�]�~�PSf��N���[޽,ڬV�{�\Z9k>H`���ʕ9D`�ov#���������y;al�W�RȠ�ZA���q�#р��1���{�P���!eu�I{j��0�\"�@V��8�H�i�`L�>�s��ƪZ�w�o�#a\0~ɿ���be����1��}/����n3J�0��7�x\"���&,�k\'}ŵ�zA�\n+Rq��g6����um�h����-��Zp}���jGW��h�Qk�e=��?��翪\\6$����3��ؗ�����;ܭm\"����4�<G��Vx��@��9�*�鈯���Zi�C̤Uؗ��S�\0KzQ[^#]��n_�k�7��f^�fC�7R�V�1�.F@��+��\r���-G�FFݭ�9��\"��x\"[|t%K\rMu|jRЁ�� a4=K��6<1m��^`	�F�����f��|nh]B���\0F�UIk�p�=(�˘o�����e\0^�	ڠ�JܵY�R�%�$����\"KJ�C���/0Zcz���a�;�gq�0�Q���_ڥ���hs�>�?X�%�_Z�E�2��d�\0=�/��3ES�K��I/�s9*uA��4�\"�b͛t��~��j�0&Ƙ�&��1�8��@�Q91C(�\\i�)\rQG�5�-�\"�a�l��fYE=�02�ʈ`S�./n���캆�ɿH32�-���\\�3�A7Y���o�=�u�w��o \nK�X�F�6{&5�HZS���آ��!6�j\\�p�Fŀ.���h�×�6�{�c�	|H��a�\\�8��U�̣�(�H�kp�����(s�/�����倯�Q��P�gnZ^�W�G�X`�5���r9r3n.� ��Ϩk����M��iO���#�=K�s����0/ �Q\\B�t�[�x�_�r��!��-�A���,;����r-�MYyc�c����\0���H�m2��aHg��\0ɍgB��?0�����P[�oir\0\\���fQ+� ���1�v� 4]�#�@����� ���*\\?Y�xkU��Ϋ��fՊ�{��vC��\\f��>5�TAo��M��۸s�4`�\"���m���Pug���%���	Ϲ��ٲ��^�����7����:� 	W�	b�3\"]�q�h~�r�2��7+��`��T�m�Y�&sq��w=��QTg��翯�K��\n�������T�pk,�O��������Z9K�7��x�2�7(��e�=@0,����e�r��	V���-�Y�kK�����*I��!I�`��P�/�B�� �\\�������\r\nד��,�G���\0�6��6����\r����1bѣ���R���0�j쾣�W���[!K7�11��aC&	`�?M���^.�	�ސ��ĺ�Q.�|��7�V<��5O)� SeU���]<�	t�0�l�+G�Tr`#m��م1�<úx[�����Xg<J�E~U~*s�q�4�\0=�\0��\re��䂪����y��0�)iB\"��}CID:�t��l�`�*���¤QSٲ*�\"1K�&A�. qbſ�|9<9�V�\n�l��\n�Cr�[J9�������1&���[��A�\\A�:��7��u\0�e�k\Zpl�C61\noI���H��Y-�;	�L�hA9�ŝ�Y鵃鄅��U����D�X|��\0�/2��#�Q�v�9�(���Q���j�N`��Aom\0������T孢Q3����6\'��|ʖ���Zm��e\05ۗ��c$n�p]�Ǆ��\\�_�):&+���e~�4����Pnw+����\0(�\"���h�\'�O?q��M��-�[�/$kF�c�i��>�*������b�R1m5.@P�6Eo�[�>��v�\Zf�|F� ү�`^���G5��[s����B\'��������WP%>˩�UƜ�b�I껎C��U���h1cp0��S@G9��*G/�\0��]G��E���A�\ra�\Zo�)�8s��B}�@����; bɄ[���?0h9�!��<q.�\r���_	G�jt=�e�W�G�Uq����� ��J��b(_77`ר\n���|.X��0]JCW�[�+l�|��c�k����K\"W6��7a�&ba�=���ד�U]?)��%A\'!n���<�(�A�Bk���(�e�K{1tm��\0�q�����+��c{�x\"fl���q��$y+�%�� ��@��a(loy�t#\Z��5	�IXdy0�k���y�ܻ�~a�W�?,qtZ�����\'�2`�\\0 �n\0+q.oP\rE��8�=/U��q��(���0�`��kd0�Z�:���\'~�v�P�3)@������@˪ZǺnУ� V���}O9�ܲRs�l�I���0ܙ\Z����-q]�f\Z����8�>&+�k���\0��<e��I�X�Y��.��Q�-I�iV��\Z�f0�:`	���ީ�Ĕ\rl�:��4隵\Zk\npK�q�!4���QlX�~�}({s�Y���*d\'ؓ\0m���D=,�.ѫѵ���GLϿ������y�y<E�o�e���I����Q0L�9̣3QC���Y�+��!�q�F��W��)Yրfd�/��%�W�\r`���#4�C~F�Dv\Z\rh�Ă����!-U5��|Z�Z�\0\0\r=��U���9އ��8	�P=Τ�����\r\"�Ʌ�X�F�uIS�����vbY1���x� ���2^�+�T�rYT�W���%X��ܲdj*�Z��|E�KK�X�;���|ja6�\'�4��[�\n��in���?�˶�F�y͋`&n	Pтlȝ�6�\"�4�b[��[hK�L���\'�,VSY��0�%��6��kO��0?FT��e�<U�_0�^.f�0�յA��U�ɥ�q�Z,�3�\'�q!R��r��$D\n�zCK��\r����ɛ ��h�q�ʚ4�p���0���P�5-ăτ--4Fpg)�ޣP�E?�ū��&����:�[XkN�_�P����~�lPN[�GK����3+�x�c��R߸С��\0x�P��\n�T ���[����H,0Y��(��p�4��0ط��!��\0�-\\Rx�l�L	0D��ӝ�b0�92���\"iQ�Ө��u�ĴC���@+�S�L*u&�/�9tEwwR�e���2��s�\nj!X���A#�agA(�QzÁ�w�QiYԶfP���P�S�U�(҈�ѩ������J�nP��\Z�p�T�gHg�UȲ��%*�c�JF?��`5����P\"�]�x�z\Z��p��$)i���\"�\0���m�N��2���Pnr�;H���\0#��>��/��YX}G)��JV��z�t;V\"��v��\nE��r�T�0&Nfq�A�+c�`3:S��?*9��8��L੒�Kq4\r����*��MI\"��òsf�i��d�ң~��N���U��xr��w�������n��@\'\rW�Q1�}�D&�kA��1���D�V�^�%.�\Z���E�B���-͸h������q����*��ӓQ��+��^�^����7ȄUY�jI�ᔠ����\nn\0�����z6���N��2�Eֺ���u��uJ�ڮ��K�&e�����*�L��,���Mʨ��������5��ّ��(�,6���Q���5~�m��/jS�KyT��UJ�ʈ��R�L�]�o�D0\Z���`��-�)���Ȳf�v�\r��c�J\n��1U�I�V`J��d^H��\"�)Cf�	�z�~�ʲ��p�U��%C�GUP[-�8����ê<�zxT��fV�	�\na��:��2�u,4G���;6�yrl\\7G��V�A������ىl�N�����v��F��P���aOi�32�D���*�(n�Q-�%f�������L�x�7��ͨE��X��h���]���a�����W0�\0B�������To����^!ulS!4Lֆ3\r@Ǘ���o�,AO�]���WP1���!�ܙ�f��W��T�+Z��>��l��\Z�\Z(̮Ȕ�.J�^�9��\'�U�IR�괢���;�,]���r��]�Js:v`�/5�5� ��R���߈�oj�����������>�\0�\0B��!FJ�{��#^����4�|L�-,Tb���K6���\0\n+C	FD�}@er�^��q鴲5���qG��$�_���ق))�\"Dn�c.�y�<���jX\n��9V�a�\\�\n�k�������J��!�������hU��\07\0�C��#&w,P�_3�Y!T~b.�c��|�^���b.�W�!���\rc1�����*õr����=�yxpB�]\Z��\0p�{F#�@��w^T��K/GĸA/�h0�ŤV7�<>\\�jՍ������X��0��1b�UDx��P��B	�����^�b@�)�p����o�u���πq̻�%��� ��U1n�a�T��Z����S�PC�L�[�cwTr��\0/orϻ�>��q�U�\"s7蛅g�R���\rT��ۡv�q�Me���1��+��k�Qi��{��a�/3\rT\\fW��B@��l��v�\0�&a�js�閦b���x�+&��! ��+���q�EWF�+sѥ�\0j��w���:q�ㅙ�4�k@}�ˌ/~�y6G�\r��ˆ5V�����y�(℧�;� �Ou�z���TE���AJ��CySi����X�s��P�`�x/t��\r�Z��12ps�C�c��~�	�r��^J�U\0(�\Z��؀Tu��9N�H!���e�h0tG\0Q��1Yy)F���[\nс\Z\"�X�c��U#e�)�74��63(���g1K:E+ʵIL��ظe��~\"�5�{���.�S[��Go1Xw�%k��q]���1B����\0TX.&�e���\0Թ�XΥ��!����T�<�%�3�r\\J�&�\\��\\��\0`��#��UǊ�-����1κԤ{��HU0;�sK]C�{����?h%Q��&>\0���Es�U�\\��W�qI:m��*\"b-՞1ae4ŵ��d�G���Oqz�a�\0�5[l��ճ�_�)b��Xҥ�^>%��d&����4�D\\��\Z&n��۹IdTl��ힱ��a}��T���3�����5Tܥ�Zڷ��,��(���1���ĩ��wՏYj�]1�b�����`��!�_�LC���\\A��|L{�9� ��\r1�*!;��o�\0J�\n*T�*\Z\'�\"Y]+4��U�=�شlx!0�f�����=�X!k�s�Q6\r��ʘ��v��X:����)f2ʯTEj�\\ǉ��a�/�UO�y�q�\n���ߔ�lȵ�n汐�;;�b$(\"��� �tb���0��F	��ǔNˢ��������\0kgሰ��x,�(�(������m�\'%u��ж��\n�S(бN�po�?�nت�Q��Q#�>%�S�*Q���)��j��\"O2���	�\Z��|C_翦�\0GM�L�7�iA[��*eM>8���e#z���(�9�FB��P+5�\n.��@�Kz��&�L@Q�5B�Q�Ö�1�����tsUtN鋭g��U\n���4}!�\'LV����>���#�����M-�r��2l�\r��r��\n�MQ�:����$;mg�{�+�V�� ��-�PP��J�)�P(̠,�b�\0�z;�I��A�^$�.��y��>ט�wE>� �S�c��P3���A%Ak.��C������t0���F�Ԥp���-ZU�1��L��1���\0LE�hJ����\0m���ш `Q�TiD%��Q͘�@�\\��^m�5s\0u���7�W���(ǹM�ܥ\\�Tf�Q`&A\n�f���q��2ς	p�h�̵�+���%�j�\0�7V6Ѓ�s!ӱQmY&!d[h*h*�5c�?7��L1�M丵� �aM�Cy�u	���6G�\"u���ٸ�\0-���w�iD�{J��pHe˿fn�h���LR�qǹΑ���h���\r��+JxI�����7��Q�����P����)�^?C��q��WQAs-w���e�R�����\r��)\"����s�0 w9��\\}�(��y��>f���F���ʣ�ּ��0���P���e,��%��_u���\n7�;`�\0~�2P0��	8t�8\'�!������!!\Zp�wz�`e08�.�\n��!�a�u{�4��GW���Y���M�o�CR8S�=��!f[+�����\"p<�i!X��\n�0�E�ïX��\0������p�R5��I�pTokw4͑��!���\r��\r�4�g�.\"��S�c�2���.ڴE��B�-�fI\0\\�2�D-�X�f����TEI��-�� e���m�}�z��<��ۍ\rd���Ѳ��k��@�<\n�@��xW��<a\0�2��W��a:��1bZ��3/ѥ��7Q e:`[g�c4n��$t\"�@�(�Ġ�m����>���{��3f�	@OSU��%��ܪs��S�*�>5P����h�vL[Vn���$��Բ%@�kl��	�zfV��ew<����~����Qs2��򌨵Z�,W|��}0�r@\nq	XLI�����0E���F�^N *���&[k��c��=E��\\{�M�XѸ\0��GmJ���7�9S2��K�X��b�I�9���\\�VCW�V�c�Y��[�zȓ����w��gOS�p?�/��j\Z��x�è�V4��1	��u�mwQ��JC5\r��\r)�=�� �C4_+i�jw�#���pU(��X�b9 2�j\rl-�Kt��o�,!���`�E|�\r*�|��yb\0J,\\��N�Am��e#��t&�%�r.؋��>\"7kF����=떷\'��(E��8^Iq֙N\\���t����$j0�]��#jĶE`�1� ���D}\r�]1�J�\0��C��\n���U�/Y�&���>�0���\Z�B�\\Q}U��?D H���J�N�����۹HT�c���\rSd\r�g(�*Y,QbLR�5�V\"��\r0.�Q�f<ͩ�<-���j%5�D%)	��.�F#��bF�\"\Z��o�9R�����@�{�ʨx��.̒�A�r���e���#�k���͆���-(1(/���@� s�˒��\Z(]q@Q5�Q\r����6����ò��WA.�����l�FTOb��֚�����G����U� ��P��yL$�4J�*3�qmK�ʃ�Jsc��.,����{��h�;�?^\\C�·(s��*\"%e� (K*�	��<������0*�R�Ĩy�����p����:��X:�ϔ���\0���@̝�0��(\rgp�����]B?��,�Y\r��_�7��V�V���0\0s/t�\"�V}Y\\ �]Dc���*}a���B�V�] �\'q�R�^��rZ��3�е嘻!���(\n\"f9��nzYt\'1�[0��S�OS�*u�����_79��O��I���]J��My��E���lJ2��v�\0剘��5�����S�\0x��4<�\rC���v���Rh	���3��z\"6��&�M\"O�=\n�VZ�]�Z�L���e�2���P�#i�}�\nъ��YR�8rDr��>��z�=V��4�D9�F�����j\\aқ#	�y�b|���r�������n�>�7�^%����\n�b�&h�!}ô+/lm���($�M7��,��g�u>�.1aS��ĶX�\nj��z�U�1j�\"��0\0OT���=��Ju�����-2�նk�p^�e�&�ч\\�NG�2�캊�06aa��p�#t�&�ۑ��9/��^��YO\\�XT�/G��4m���i�)�c8�־�Ē��\Z���:}A�-�����#��E�,�Ys-PmU�ܦֈ\0�S�	�݂�g���2��F�\np�Za�j혆]L\\���:Lh�O�����M�(|��ȔP�FX]ͥю���n�P��YU;�\0m�W\r���c9bނI`�G�F���G�R��Ԩ�DNK����2\\3��HQR�`K�r֧,d����)bt�\0��Sp����2�(,-���R=z��L<�jue>p�š�23��˛էgΣ�C&|��`)T���L�ܴ��/YT}��\0`�:c��]����R+r�w�.���tn�\0�Ń�@�E�7��)�j�g6J�e�q��Q���EF�����J�]���%��b�3`�_b��:����(.�\0α[\0����@ebUe�.��esX�r�l�+V+�a��Ƙ̊�O���-}A�b��d��R\Za}/U����z�0u��\0=�㘜���P���P�!R�`R�o8j06D �p�F��a��ˇd�s2�s��.�4�Wf��0���M%�@,r��e�;\r��ՅAX��T���}�pT�w���ʲשf�_a���ͫ��s3:����?�~�Ȧ���Q<KV�r����/�*�e8�0��	l�\\���$?����\0�S��9���ڨ�k\0�\Z��X�)-��9���Ј�A��{-�[��]G\\b�K��Q/��Q�,����ܵt{���AE�F�\"�,�\0�T�]��壄�>e���s�+��)��!n(�W����5�yh��ݹA�+������\"�%$�	�������&�^dZzns��IRX��r����R\r.��_�����)h��[\"Ӂ��^�:(��/Q��]Y�7G\ZB������K��@�f�xf�S��yk�\\(浠fS*j��\Zʬ��eq���S�X�$%3��\r��\0�`2z��.\0��f�	�Â�;a��e��\0L���M�UE�+�_R�_fY�(^�%|��\0[�����,��N	���0tj.��Z�rP`7���J����V��\rDKY������2�%�K@ǂʵ�\0]���a��C��*�+�w9Y���a|�=�3\r��1�CH�m_�s\r(\Z\r�����]g`���0CW{��klH��N���Q.�\Z-�a+x��pU�h�*︽��$:�D���QT��P�@��.`�v��}\\B���06�]AR\\?�e������(�Υ6j�j�y�6�Q\r�By���P�\\��.**��,a����]��BD����/6ҥ�VS<��w(�l�U��[y�ϫ\Z�h�|(��n9U;*��@5U�W�l�� -��g2����uc�F��^ ���Az�l9�/��Z���e�,�˿���B1���//?:�X[A��5É�rK�&ʙ�����j ��qD�k����ġ@�ݔn .��sϸ8F\"Qi֠�/�Ch\n��Pʫ��,-uӘ8X\\�;�1�(7��?�2�M%�qմb�Q(�dc���DB���^��±��;��=!&8XU%��;�M���@�.	��q��JM�l��9�Bvz�13_�4���dM��T�;��a@V�<�b�\0���CUH�Pt2�hՋ���F����ڂ�bI�_�<��W�qPY�ee����|G���,�`�9���ULxƘ�G�vS�$�S�D�t(��D�*��Yi@�z����0tg�C�\r��N��&`�r\0��p��p9SM���)ʭ�)NG��m�Q	���N�*��la����FT��3Hs\n�#��_�#m�\\��\nA���XsI�*m�E,��\'#U�3.�I[�9ML̡8�\n��C\"a�\r�?�D\"��O ��(Y���vh�f�,R6����L f�H@r`�^��icX5_�躎y���\r]X)r�!����Y+[%���_�\0B��^~:�[��``�ۤ�1Ü��jf�y��7���!�q)�:��q��5�Hv,2>b��*�>8��s��a�Y�Z�s8 P\Z����\"jQ+���<�S�\'�pPy]C`��md�N7���c\Z��Z����F��j�\0��R��+e%�u*S(�Ĺid4�㹍�td�1-�#(�X�o�O\\Gq,�Y\0�90x|��G6�w(!Ts^�}˻��|�0���B\n���\rS	���O��+8�,a�MPƑ(���vQh��,0lޠI\0s�,/M���3!�m/�8��-*N��!`��q��FD��4�7���@\'�\r��ٴ�%���c�A���\n<�D*+�h�5s\n�.������w)ܧp��{�k����8\0�!��at%�p���3���f$�fKK�0��8�B8���$r�r�)e���W�dP��\\9ԨK=B�� 0R��D���� ��;��c%��\\�x���$�|��g����v��В[��\"l\\�\reǈgpF�駛�n����R#�2��,��63u���9��D���D�,��6�\0*����!��\0Cc�W�u���c���!���� ăe�L!�b�mL杺c�b$%���@w.��)��xQԯ�`�\0=���#�������ݵ�h�\\х��)z��X�r��7�)�f�Sg,�6jR\':er*k��5Ü�*A��ҺD��SgG[%A�eana�p�����_�Yǩ���<��mعe�J��;B�pdw\n	.ק*ca�jV�:�C�+\\x6�^6X���a�\'��0m������!]+m�n�hT�jW[����K9bt�Q�0���\0���/2sچ�V��:����K�F��j.%�0e�����.�W����L�ކ;n,*�4��S��\Z��6��F)Zp�\nT�Q����r���{��`^n\"���F,�\Z�v�,FX\r�+/s�\"���*jAaU�Y��&�a�ـ���/�,���_�a�E�Nk�\"P�Ǎ,3 �\nQ��)9�::��XW��j1X��!t�\\S��P;F)М��\"x��Ї\\lq��tJ�=c�9=��w�>�Sځ��PM2�?4S���\"]Q*��j�z�h�0U�\ZU�R��<Ox�^�h��Vu0B9!*P��8���4�<��,�݁@s5;�dވ�5�U�\rl!�\r��G���D�]�X��u4,����\Z�����8#�#j��:��\Z_o���#`<rs�j8ֺ�a-���V���؀��K4���������=$t�l3�ZӍ[(��؛O���.!T@^l�䠊r,��\"��R	x6�\0vO�dU��� ���\Z7�60��7ܣI���y��} gV7��7uP)���[_2��,��џ;4o�J�ߋ^�.{UE���%����1��U��a�T�h:���حJxj-9�&��^�I��Wf�⹖\n%�9����B�L�*Y�H�\Z�,)����4��\\B˪��P��bh�w0;\rN�Z�j�i��|��\':�nO$<���EZԶ��^�\Z�tɈ��{	u<K�N�Z�KwB�)®��]�aK��(4�e.C0߁R���/�3\'A�V^�R��TB;\n3JR(��1,�Xh\"�`��D�_�~��J��UDX�A���*��x�\Z�w���_����Q\n��r�a����J�{aP#;�(�u���@�w/q��k��Oat��xzɹz��T5�\0�R-�XQ�l��+���P��/�a��3���	�yH��`��`,s	xO�j83\\���;�W�;�\")9km�����/(Be��o(��wX�u�؈4Ӊe�r=C������K���0�h��ǅ����R�5Ŷ�თ2���DٰpuP�.YVgE��ɚm�(��\\&Q���!=CK\Z3��J�L4p���\Zَ�廒!%��/3;ana����x��/6PMY��,ţ;�bitn[TTy�ִ�UA�\nlSU�y�密���\\U��H#\n/px�#k�/-�\'9�-�{L[W�KPY���qkŗ�eW>��P*ޞ���w̽ҖZ芴��U!�uܷ��cW�1R��yݮs��7+E�������`��^!��j�w���.�H��\r�Ƹ6;�e�R�~D��{��QԃR7�©K�L���j�F��iƈn\\�]F��d��s��\Z��\\�o������--o1�Q�7jhX�����7���LJ�J��(~��\'089�`\0���RªvZ�B-���ɂ�P�j�z�qf�d����\r#6\'-g����Ņ�&0T�^I��P��[C�ECc�b�)�֠�����q��7����\"^���,	q�� ���ZV�~,�.�0���h\'dL�M���Dȡ!	��M����\Z�p��X�1RC4q7��b��.�q�i���fz��,FXU�Ř	�J�\\FFD�hK�4<ԣ\'��3.�Կd��0\"���^!Y�JP��k�lX��mi���b9���6p�c|�D��[HĠgq��E�Qp�)WT2�S,. Ҁr���!�v\"�*����;b\\.�p��!t�d�;#Q�s2��+R���;a�;��5����R2���f�N���\0z������c�����ϟ���V�KT��,���+E��\Z���u*p��<A�r�� ����{=�Ie.�p	���P����������E.�	B<�r���X���fȑ`��P;C�r�1W���e*ٔ�(NH���U<�ٸI��\Z?���w��7�s&!F�`3�`/DLԲÑ��D`$)��eQ 2����c_���؈ZϨ�܄��b��#���ZhX�.A�oПĳ������ĥ\n�q6X�ol��2�`�\"K�0F�@���7,�f̓\n���uq��\Zh��vK*�7r���f�(.�TR\Z\naV?2��ê.eE���\n�\0)�ф,1^�*Y��t�Ρ�f�U�3Ku���Cd���3K�岄L�ek-ʮ\\b�l��: ֕ܡ��J\'%L��\Z�s���4����+r���8.����E|�1��2X�U�	�Or������X�ք� {�\r�\\(�l����ӥ����ԫޤ�1��K3�<�q�����Tm��K�Z�ӝ���OYT����s�/�(�m��Hy������\0�v�z��\0�30?�E��\0�&th�^��*̸������u�!h���EE��1ڧ�\\c\0�4��\rd[����Z�=��	�q��9���AP�ƶe��GSkj��2��-^�\r��,))t������X-�`}D1D�����<_��?�uw���P&ˇc~s��_��/�0\'xe���Z�\n����Q-/��o���Tàe�xQ\"\Z((Њ@Yd=�*�Ź�P9��嵛)]r���0��3��\Z�tF�����g�O�!�T���Ew�K%����/���Br�\0Ni�����E��D�o�{�כ�Jg�]���)�h��Q^�H�\0��k�)����v��k�f{�|�1�<��*%����`� \rbe�o�jG�0(���͒|e�τ�y^^r�F���������8��(?^+5�e���qa�1�/�P~��MJ������\0�~��3��K���Po����/��ܺ�p��\0ܺ�q|J�k�[�O����#�]N�ni���',2,2,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',10,20,30,0,0,0,0,0,0);

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

insert  into `sri_porcentajes_retencion`(`codigo`,`id`,`porcentaje`,`descripcion`,`tipo`,`cod`) values (1,'321',1,'TRANSFERENCIA DE BIENES MUEBLES DE NATURALEZA CORP','RENTA',NULL),(2,'721',30,'RETENCION IVA BIENES 30% ','IVA',1),(3,'332',0,'OTRAS COMPRAS DE BIENES Y SERVICIOS NO SUJETAS A R\r\n','RENTA',NULL),(4,'303',10,'HONORARIOS PROFESIONALES Y DIETAS ','RENTA',NULL),(5,'309',1,'SERVICIOS PUBLICIDAD Y COMUNICACION\r\n','RENTA',NULL),(6,'723',70,'RETENCION IVA SERVICIOS 70% ','IVA',2),(7,'310',1,'TRANSPORTE PRIVADO DE PASAJEROS O SERVICIO PUBLICO','RENTA',NULL),(8,'341',1.25,'IMPUESTO UNICO A LA EXPORTACION DE BANANO DE PRODU','RENTA',NULL),(9,'725',100,'RETENCION IVA SERVICIOS 100%','IVA',3),(10,'304',8,'SERVICIOS PREDOMINA EL INTELECTO-NOTARIOS REGISTRA','RENTA',NULL),(11,'307',2,'SERVICIOS PRODOMINA LA MANO DE OBRA','RENTA',NULL),(12,'308',2,'SERVICIOS ENTRE SOCIEDADES','RENTA',NULL),(13,'322',1,'SEGUROS Y REASEGUROS (PRIMAS Y CESIONES) (10% DEL ','RENTA',NULL),(14,'334',0,'POR COMPRAS CON TARJETA DE CREDITO\r\n','RENTA',NULL),(15,'303',8,'OTRAS RETENCIONES APLICABLES EL 8%','RENTA',NULL),(16,'343',1,'OTRAS RETENCIONES APLICABLES EL 1%','RENTA',NULL),(17,'344',2,'APLICABLE A OTROS SERVICIOS 2% RENTA','RENTA',NULL),(18,'343B',1,'Por actividades de construcciÃ³n de obra material','RENTA',NULL),(19,'9',10,'RETENCION 10% IVA ENTRE ESPECIALES','IVA',9),(20,'10',20,'RETENCION 20% ENTRE ESPECIALES','IVA',10),(21,'320',8,'ARRENDAMIENTO DE INMUEBLES 8%','RENTA',NULL),(22,'311',2,'POR PAGO A TAVES DE LIQUIDACIONES DE COMPRA ','RENTA',NULL),(23,'314',8,'REGALÃAS POR CONCEPTO DE FRANQUICIAS DE ACUERDO A ','RENTA',NULL);

/*Table structure for table `sri_sustentocomprobante` */

DROP TABLE IF EXISTS `sri_sustentocomprobante`;

CREATE TABLE `sri_sustentocomprobante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `sustento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `sri_sustentocomprobante` */

insert  into `sri_sustentocomprobante`(`codigo`,`id`,`sustento`) values (1,'01','CrÃ©dito Tributario para declaraciÃ³n de IVA (servicios y bienes distintos de inventarios y activos fijos)'),(2,'02','Costo o Gasto para declaraciÃ³n de IR (servicios y bienes distintos de inventarios y activos fijos)'),(3,'03','Activo Fijo - CrÃ©dito Tributario para declaraciÃ³n de IVA'),(4,'04','Activo Fijo - Costo o Gasto para declaraciÃ³n de IR'),(5,'05','LiquidaciÃ³n Gastos de Viaje, hospedaje y alimentaciÃ³n Gastos IR (a nombre de empleados y no de la empresa)'),(6,'06','Inventario - CrÃ©dito Tributario para declaraciÃ³n de IVA'),(7,'07','Inventario - Costo o Gasto para declaraciÃ³n de IR'),(8,'08','Valor pagado para solicitar Reembolso de Gasto (intermediario)'),(9,'09','Reembolso por Siniestros'),(10,'10','DistribuciÃ³n de Dividendos, Beneficios o Utilidades');

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

insert  into `sri_tipocomprobante`(`codigo`,`id`,`tipoComprobante`) values (1,'1','Factura'),(2,'2','Nota o boleta de venta '),(3,'3','LiquidaciÃ³n de compra de Bienes o PrestaciÃ³n de servicios '),(4,'4','Nota de crÃ©dito'),(5,'5','Nota de dÃ©bito'),(6,'6','GuÃ­as de RemisiÃ³n '),(7,'7','Comprobante de RetenciÃ³n'),(8,'8','Boletos o entradas a espectÃ¡culos pÃºblicos'),(9,'9','Tiquetes o vales emitidos por mÃ¡quinas registradoras'),(10,'11','Pasajes expedidos por empresas de aviaciÃ³n'),(11,'12','Documentos emitidos por instituciones financieras\r\n'),(12,'15','Comprobante de venta emitido en el Exterior'),(13,'16','Formulario Ãšnico de ExportaciÃ³n (FUE) o DeclaraciÃ³n Aduanera Ãšnica (DAU) o DeclaraciÃ³n Andina de Valor (DAV)'),(14,'18','Documentos autorizados utilizados en ventas excepto N/C N/D '),(15,'19','Comprobantes de Pago de Cuotas o Aportes'),(16,'20','Documentos por Servicios Administrativos emitidos por Inst. del Estado');

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
