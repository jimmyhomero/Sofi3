/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.36-MariaDB : Database - a
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`a` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `a`;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `bodegas` */

DROP TABLE IF EXISTS `bodegas`;

CREATE TABLE `bodegas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `bodegaID` varchar(45) DEFAULT NULL,
  `bodega` varchar(145) DEFAULT NULL,
  `descripcion` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=latin1;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(200) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `color` */

DROP TABLE IF EXISTS `color`;

CREATE TABLE `color` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `config2` */

DROP TABLE IF EXISTS `config2`;

CREATE TABLE `config2` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `config_equipos` */

DROP TABLE IF EXISTS `config_equipos`;

CREATE TABLE `config_equipos` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `equipos_Codigo` int(100) NOT NULL,
  `config2_Codigo` int(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `equipos_Codigo` (`equipos_Codigo`,`config2_Codigo`),
  KEY `fk_config_equipos_equipos1_idx` (`equipos_Codigo`),
  KEY `FK_config_equipos_config2` (`config2_Codigo`),
  CONSTRAINT `FK_config_equipos_config2` FOREIGN KEY (`config2_Codigo`) REFERENCES `config2` (`codigo`),
  CONSTRAINT `fk_config_equipos_equipos1` FOREIGN KEY (`equipos_Codigo`) REFERENCES `equipos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

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
  `estado` varchar(50) NOT NULL DEFAULT 'PENDIENTE',
  `visible` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo`),
  KEY `fk_Pagos_facturas1_idx` (`facturas_codigo`),
  KEY `fk_Pagos_formasPagoV1_idx` (`formasPagoV_codigo`),
  CONSTRAINT `fk_Pagos_facturas1` FOREIGN KEY (`facturas_codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_formasPagoV1` FOREIGN KEY (`formasPagoV_codigo`) REFERENCES `formaspagov` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
  `obligado` varchar(3) DEFAULT NULL,
  `contador` varchar(200) DEFAULT NULL,
  `ruccontador` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
  `bodega` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tipopvp` int(11) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `utilidad` double DEFAULT NULL,
  PRIMARY KEY (`codigo`,`Factura_Codigo`),
  KEY `fk_DetalleFactura_Factura1_idx` (`Factura_Codigo`),
  KEY `fk_DetalleFactura_Productos1_idx` (`Productos_Codigo`),
  CONSTRAINT `fk_DetalleFactura_Factura1` FOREIGN KEY (`Factura_Codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleFactura_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

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
  `equipos_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_Factura_Clientes1_idx` (`Clientes_codigo`),
  KEY `fk_Factura_usuarios1_idx` (`Usuarios_Codigo`),
  CONSTRAINT `fk_Factura_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

/*Table structure for table `formaspagoc` */

DROP TABLE IF EXISTS `formaspagoc`;

CREATE TABLE `formaspagoc` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `formaspagov` */

DROP TABLE IF EXISTS `formaspagov`;

CREATE TABLE `formaspagov` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `evento` varchar(200) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(75) NOT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(845) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `nota` varchar(545) DEFAULT NULL,
  `visible` int(11) DEFAULT '1',
  `tipo` varchar(45) DEFAULT NULL,
  `cxc_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_pagosa_cxc1_idx` (`cxc_codigo`),
  CONSTRAINT `fk_pagosa_cxc1` FOREIGN KEY (`cxc_codigo`) REFERENCES `cxc` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

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

/*Table structure for table `precios` */

DROP TABLE IF EXISTS `precios`;

CREATE TABLE `precios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `valor` double DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

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

/*Table structure for table `reportes_externos` */

DROP TABLE IF EXISTS `reportes_externos`;

CREATE TABLE `reportes_externos` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ATRIBUTO` varchar(100) DEFAULT NULL,
  `VALOR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `sc_log` */

DROP TABLE IF EXISTS `sc_log`;

CREATE TABLE `sc_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inserted_date` datetime DEFAULT NULL,
  `username` varchar(90) NOT NULL,
  `application` varchar(200) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `ip_user` varchar(32) NOT NULL,
  `action` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

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

/*Table structure for table `sri_formas_pago` */

DROP TABLE IF EXISTS `sri_formas_pago`;

CREATE TABLE `sri_formas_pago` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `formaPago` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*Table structure for table `sri_sustentocomprobante` */

DROP TABLE IF EXISTS `sri_sustentocomprobante`;

CREATE TABLE `sri_sustentocomprobante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `sustento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `sri_tarjetascredito` */

DROP TABLE IF EXISTS `sri_tarjetascredito`;

CREATE TABLE `sri_tarjetascredito` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `tarjeta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sri_tipocomprobante` */

DROP TABLE IF EXISTS `sri_tipocomprobante`;

CREATE TABLE `sri_tipocomprobante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(5) DEFAULT NULL,
  `tipoComprobante` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `sridatos` */

DROP TABLE IF EXISTS `sridatos`;

CREATE TABLE `sridatos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_RUC` varchar(15) DEFAULT NULL,
  `RAZON_SOCIAL` varchar(500) DEFAULT NULL,
  `NOMBRE_COMERCIAL` varchar(500) DEFAULT NULL,
  `ESTADO_CONTRIBUYENTE` varchar(500) DEFAULT NULL,
  `CLASE_CONTRIBUYENTE` varchar(15) DEFAULT NULL,
  `FECHA_INICIO_ACTIVIDADES` varchar(200) DEFAULT NULL,
  `FECHA_ACTUALIZACION` varchar(200) DEFAULT NULL,
  `FECHA_SUSPENSION_DEFINITIVA` varchar(200) DEFAULT NULL,
  `FECHA_REINICIO_ACTIVIDADES` varchar(200) DEFAULT NULL,
  `OBLIGADO` varchar(150) DEFAULT NULL,
  `TIPO_CONTRIBUYENTE` varchar(200) DEFAULT NULL,
  `NUMERO_ESTABLECIMIENTO` varchar(15) DEFAULT NULL,
  `NOMBRE_FANTASIA_COMERCIAL` varchar(500) DEFAULT NULL,
  `CALLE` varchar(500) DEFAULT NULL,
  `NUMERO` varchar(100) DEFAULT NULL,
  `INTERSECCION` varchar(500) DEFAULT NULL,
  `ESTADO_ESTABLECIMIENTO` varchar(500) DEFAULT NULL,
  `DESCRIPCION_PROVINCIA` varchar(500) DEFAULT NULL,
  `DESCRIPCION_CANTON` varchar(500) DEFAULT NULL,
  `DESCRIPCION_PARROQUIA` varchar(500) DEFAULT NULL,
  `CODIGO_CIIU` varchar(500) DEFAULT NULL,
  `ACTIVIDAD_ECONOMICA` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `formaPago` varchar(50) DEFAULT NULL,
  `efectivo` double DEFAULT NULL,
  `cambio` double DEFAULT NULL,
  `equipos_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_ticket_Clientes1_idx` (`Clientes_codigo`),
  KEY `fk_ticket_usuarios1_idx` (`Usuarios_Codigo`),
  CONSTRAINT `fk_ticket_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

/*Table structure for table `tipos_usuarios` */

DROP TABLE IF EXISTS `tipos_usuarios`;

CREATE TABLE `tipos_usuarios` (
  `codigo` int(100) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `xxx` */

DROP TABLE IF EXISTS `xxx`;

CREATE TABLE `xxx` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
