/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.36-MariaDB : Database - fs1.1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `agenciastrans` */

DROP TABLE IF EXISTS `agenciastrans`;

CREATE TABLE `agenciastrans` (
  `codtrans` varchar(8) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `web` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`codtrans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `agenciastrans` */

/*Table structure for table `agentes` */

DROP TABLE IF EXISTS `agentes`;

CREATE TABLE `agentes` (
  `apellidos` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin NOT NULL,
  `coddepartamento` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnicif` varchar(15) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `idusuario` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombreap` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `seg_social` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cargo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `banco` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `f_alta` date DEFAULT NULL,
  `f_baja` date DEFAULT NULL,
  `f_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`codagente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `agentes` */

insert  into `agentes`(`apellidos`,`ciudad`,`codagente`,`coddepartamento`,`codpais`,`codpostal`,`direccion`,`dnicif`,`email`,`fax`,`idprovincia`,`idusuario`,`irpf`,`nombre`,`nombreap`,`porcomision`,`provincia`,`telefono`,`seg_social`,`cargo`,`banco`,`f_alta`,`f_baja`,`f_nacimiento`) values ('CARRION TORRES','Santo Domingo','1',NULL,NULL,'','Santa Martha Sector 5','1722239967','homer_loading@hotmail.com',NULL,NULL,NULL,NULL,'JIMMY HOMERO',NULL,0,'Santo Domingo','02275821','','Administrador','','2018-10-28',NULL,'1988-03-21');
insert  into `agentes`(`apellidos`,`ciudad`,`codagente`,`coddepartamento`,`codpais`,`codpostal`,`direccion`,`dnicif`,`email`,`fax`,`idprovincia`,`idusuario`,`irpf`,`nombre`,`nombreap`,`porcomision`,`provincia`,`telefono`,`seg_social`,`cargo`,`banco`,`f_alta`,`f_baja`,`f_nacimiento`) values ('CARRION TORRES','','2',NULL,NULL,'','','1722239967','homer_loading@hotmail.com',NULL,NULL,NULL,NULL,'JIMMY HOMERO',NULL,2,'','0992669329','','','','2018-10-28',NULL,'2018-10-28');
insert  into `agentes`(`apellidos`,`ciudad`,`codagente`,`coddepartamento`,`codpais`,`codpostal`,`direccion`,`dnicif`,`email`,`fax`,`idprovincia`,`idusuario`,`irpf`,`nombre`,`nombreap`,`porcomision`,`provincia`,`telefono`,`seg_social`,`cargo`,`banco`,`f_alta`,`f_baja`,`f_nacimiento`) values ('ZAMBRANO','','3',NULL,NULL,'','','2390021223851','',NULL,NULL,NULL,NULL,'KEVIN',NULL,0,'','095685452','','','','2018-10-28',NULL,'2018-10-28');

/*Table structure for table `albaranescli` */

DROP TABLE IF EXISTS `albaranescli`;

CREATE TABLE `albaranescli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `femail` date DEFAULT NULL,
  `idalbaran` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `netosindto` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ptefactura` tinyint(1) NOT NULL DEFAULT '1',
  `recfinanciero` double NOT NULL DEFAULT '0',
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  `codtrans` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codigoenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nombreenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `apellidosenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `direccionenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostalenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ciudadenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `provinciaenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apartadoenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpaisenv` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `numdocs` int(11) DEFAULT '0',
  `dtopor1` double NOT NULL DEFAULT '0',
  `dtopor2` double NOT NULL DEFAULT '0',
  `dtopor3` double NOT NULL DEFAULT '0',
  `dtopor4` double NOT NULL DEFAULT '0',
  `dtopor5` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idalbaran`),
  UNIQUE KEY `uniq_codigo_albaranescli` (`codigo`),
  KEY `ca_albaranescli_series2` (`codserie`),
  KEY `ca_albaranescli_ejercicios2` (`codejercicio`),
  KEY `ca_albaranescli_facturas` (`idfactura`),
  CONSTRAINT `ca_albaranescli_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_albaranescli_facturas` FOREIGN KEY (`idfactura`) REFERENCES `facturascli` (`idfactura`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_albaranescli_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `albaranescli` */

insert  into `albaranescli`(`apartado`,`cifnif`,`ciudad`,`codagente`,`codalmacen`,`codcliente`,`coddir`,`coddivisa`,`codejercicio`,`codigo`,`codpago`,`codpais`,`codpostal`,`codserie`,`direccion`,`fecha`,`hora`,`femail`,`idalbaran`,`idfactura`,`idprovincia`,`irpf`,`netosindto`,`neto`,`nombrecliente`,`numero`,`numero2`,`observaciones`,`porcomision`,`provincia`,`ptefactura`,`recfinanciero`,`tasaconv`,`total`,`totaleuros`,`totalirpf`,`totaliva`,`totalrecargo`,`codtrans`,`codigoenv`,`nombreenv`,`apellidosenv`,`direccionenv`,`codpostalenv`,`ciudadenv`,`provinciaenv`,`apartadoenv`,`codpaisenv`,`numdocs`,`dtopor1`,`dtopor2`,`dtopor3`,`dtopor4`,`dtopor5`) values (NULL,'1722239967001','SANTO DOMING','2','ALG','000001',NULL,'USD','2018','GUI2018FN1','CREDITO','ECU','','FN','C/','2018-10-28','22:19:27',NULL,1,NULL,NULL,0,0,0,'JIMMY HOMERO CARRION','1','','',2,'SANTO DOMINGO',1,0,1.129,0,0,0,0,0,NULL,NULL,'','','',NULL,'','',NULL,NULL,0,0,0,0,0,0);

/*Table structure for table `albaranesprov` */

DROP TABLE IF EXISTS `albaranesprov`;

CREATE TABLE `albaranesprov` (
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idalbaran` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numproveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `ptefactura` tinyint(1) NOT NULL DEFAULT '1',
  `recfinanciero` double NOT NULL DEFAULT '0',
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  `numdocs` int(11) DEFAULT '0',
  PRIMARY KEY (`idalbaran`),
  UNIQUE KEY `uniq_codigo_albaranesprov` (`codigo`),
  KEY `ca_albaranesprov_series2` (`codserie`),
  KEY `ca_albaranesprov_ejercicios2` (`codejercicio`),
  KEY `ca_albaranesprov_facturas` (`idfactura`),
  CONSTRAINT `ca_albaranesprov_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_albaranesprov_facturas` FOREIGN KEY (`idfactura`) REFERENCES `facturasprov` (`idfactura`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_albaranesprov_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `albaranesprov` */

/*Table structure for table `almacenes` */

DROP TABLE IF EXISTS `almacenes`;

CREATE TABLE `almacenes` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `observaciones` text COLLATE utf8_bin,
  `poblacion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `porpvp` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tipovaloracion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codalmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `almacenes` */

insert  into `almacenes`(`apartado`,`codalmacen`,`codpais`,`codpostal`,`contacto`,`direccion`,`fax`,`idprovincia`,`nombre`,`observaciones`,`poblacion`,`porpvp`,`provincia`,`telefono`,`tipovaloracion`) values (NULL,'29MA','ECU','','','CALLE 29 DE MAYO Y LATACUNGA','',NULL,'29 DE MAYO',NULL,'SANTO DOMINGO',NULL,'SANTO DOMINGO','',NULL);
insert  into `almacenes`(`apartado`,`codalmacen`,`codpais`,`codpostal`,`contacto`,`direccion`,`fax`,`idprovincia`,`nombre`,`observaciones`,`poblacion`,`porpvp`,`provincia`,`telefono`,`tipovaloracion`) values (NULL,'ALG','ECU','','','CALLE SAN MIGUEL Y VIA QUITO','',NULL,'SAN MIGUEL',NULL,'SANTO DOMINGO',NULL,'SANTO DOMINGO','',NULL);

/*Table structure for table `articulo_combinaciones` */

DROP TABLE IF EXISTS `articulo_combinaciones`;

CREATE TABLE `articulo_combinaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(18) COLLATE utf8_bin NOT NULL,
  `codigo2` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `idvalor` int(11) NOT NULL,
  `nombreatributo` varchar(100) COLLATE utf8_bin NOT NULL,
  `valor` varchar(100) COLLATE utf8_bin NOT NULL,
  `refcombinacion` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codbarras` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `impactoprecio` double NOT NULL DEFAULT '0',
  `stockfis` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ca_articulo_combinaciones_valores` (`idvalor`),
  KEY `ca_articulo_combinaciones_articulos` (`referencia`),
  CONSTRAINT `ca_articulo_combinaciones_articulos` FOREIGN KEY (`referencia`) REFERENCES `articulos` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_articulo_combinaciones_valores` FOREIGN KEY (`idvalor`) REFERENCES `atributos_valores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `articulo_combinaciones` */

/*Table structure for table `articulo_propiedades` */

DROP TABLE IF EXISTS `articulo_propiedades`;

CREATE TABLE `articulo_propiedades` (
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin,
  PRIMARY KEY (`name`,`referencia`),
  KEY `ca_articulo_propiedades_articulos` (`referencia`),
  CONSTRAINT `ca_articulo_propiedades_articulos` FOREIGN KEY (`referencia`) REFERENCES `articulos` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `articulo_propiedades` */

/*Table structure for table `articulo_trazas` */

DROP TABLE IF EXISTS `articulo_trazas`;

CREATE TABLE `articulo_trazas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `numserie` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lote` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `idlalbventa` int(11) DEFAULT NULL,
  `idlfacventa` int(11) DEFAULT NULL,
  `idlalbcompra` int(11) DEFAULT NULL,
  `idlfaccompra` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_codigo_articulo_trazas` (`numserie`),
  KEY `ca_articulo_trazas_articulos` (`referencia`),
  KEY `ca_articulo_trazas_linalbcli` (`idlalbventa`),
  KEY `ca_articulo_trazas_linfaccli` (`idlfacventa`),
  KEY `ca_articulo_trazas_linalbprov` (`idlalbcompra`),
  KEY `ca_articulo_trazas_linfacprov` (`idlfaccompra`),
  CONSTRAINT `ca_articulo_trazas_articulos` FOREIGN KEY (`referencia`) REFERENCES `articulos` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_articulo_trazas_linalbcli` FOREIGN KEY (`idlalbventa`) REFERENCES `lineasalbaranescli` (`idlinea`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_articulo_trazas_linalbprov` FOREIGN KEY (`idlalbcompra`) REFERENCES `lineasalbaranesprov` (`idlinea`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_articulo_trazas_linfaccli` FOREIGN KEY (`idlfacventa`) REFERENCES `lineasfacturascli` (`idlinea`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_articulo_trazas_linfacprov` FOREIGN KEY (`idlfaccompra`) REFERENCES `lineasfacturasprov` (`idlinea`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `articulo_trazas` */

/*Table structure for table `articulos` */

DROP TABLE IF EXISTS `articulos`;

CREATE TABLE `articulos` (
  `factualizado` date DEFAULT NULL,
  `bloqueado` tinyint(1) DEFAULT '0',
  `equivalencia` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuentairpfcom` int(11) DEFAULT NULL,
  `idsubcuentacom` int(11) DEFAULT NULL,
  `stockmin` double DEFAULT '0',
  `observaciones` text COLLATE utf8_bin,
  `codbarras` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `stockfis` double DEFAULT '0',
  `stockmax` double DEFAULT '0',
  `costemedio` double DEFAULT '0',
  `preciocoste` double DEFAULT '0',
  `tipocodbarras` varchar(8) COLLATE utf8_bin DEFAULT 'Code39',
  `nostock` tinyint(1) DEFAULT '0',
  `codsubcuentacom` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin NOT NULL,
  `codsubcuentairpfcom` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `secompra` tinyint(1) DEFAULT '1',
  `codfamilia` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codfabricante` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `imagen` text COLLATE utf8_bin,
  `controlstock` tinyint(1) DEFAULT '0',
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `tipo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `pvp` double DEFAULT '0',
  `sevende` tinyint(1) DEFAULT '1',
  `publico` tinyint(1) DEFAULT '0',
  `partnumber` varchar(38) COLLATE utf8_bin DEFAULT NULL,
  `trazabilidad` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`referencia`),
  KEY `ca_articulos_impuestos` (`codimpuesto`),
  KEY `ca_articulos_familias` (`codfamilia`),
  KEY `ca_articulos_fabricantes` (`codfabricante`),
  CONSTRAINT `ca_articulos_fabricantes` FOREIGN KEY (`codfabricante`) REFERENCES `fabricantes` (`codfabricante`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_articulos_familias` FOREIGN KEY (`codfamilia`) REFERENCES `familias` (`codfamilia`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_articulos_impuestos` FOREIGN KEY (`codimpuesto`) REFERENCES `impuestos` (`codimpuesto`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `articulos` */

insert  into `articulos`(`factualizado`,`bloqueado`,`equivalencia`,`idsubcuentairpfcom`,`idsubcuentacom`,`stockmin`,`observaciones`,`codbarras`,`codimpuesto`,`stockfis`,`stockmax`,`costemedio`,`preciocoste`,`tipocodbarras`,`nostock`,`codsubcuentacom`,`descripcion`,`codsubcuentairpfcom`,`secompra`,`codfamilia`,`codfabricante`,`imagen`,`controlstock`,`referencia`,`tipo`,`pvp`,`sevende`,`publico`,`partnumber`,`trazabilidad`) values ('2018-10-28',0,NULL,NULL,NULL,0,'','23423423',NULL,0,0,0,55.2,'Code39',0,NULL,'mainboard 1155',NULL,1,NULL,NULL,NULL,0,'mainboard',NULL,65,1,0,NULL,0);

/*Table structure for table `articulosprov` */

DROP TABLE IF EXISTS `articulosprov`;

CREATE TABLE `articulosprov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `refproveedor` varchar(25) COLLATE utf8_bin NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `precio` double DEFAULT '0',
  `dto` double DEFAULT '0',
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `stock` double DEFAULT '0',
  `nostock` tinyint(1) DEFAULT '1',
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codbarras` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `partnumber` varchar(38) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_articulo_proveedor2` (`codproveedor`,`refproveedor`),
  CONSTRAINT `ca_articulosprov_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `articulosprov` */

insert  into `articulosprov`(`id`,`referencia`,`codproveedor`,`refproveedor`,`descripcion`,`precio`,`dto`,`codimpuesto`,`stock`,`nostock`,`nombre`,`coddivisa`,`codbarras`,`partnumber`) values (1,'mainboard','000001','mainboard','mainboard 1155',55.2,0,'IVA21',0,1,NULL,NULL,NULL,NULL);

/*Table structure for table `atributos` */

DROP TABLE IF EXISTS `atributos`;

CREATE TABLE `atributos` (
  `codatributo` varchar(20) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codatributo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `atributos` */

/*Table structure for table `atributos_valores` */

DROP TABLE IF EXISTS `atributos_valores`;

CREATE TABLE `atributos_valores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codatributo` varchar(20) COLLATE utf8_bin NOT NULL,
  `valor` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_atributos_valores` (`codatributo`),
  CONSTRAINT `ca_atributos_valores` FOREIGN KEY (`codatributo`) REFERENCES `atributos` (`codatributo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `atributos_valores` */

/*Table structure for table `cajas` */

DROP TABLE IF EXISTS `cajas`;

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fs_id` int(11) NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin NOT NULL,
  `f_inicio` timestamp NOT NULL DEFAULT '2018-10-30 00:00:00',
  `d_inicio` double NOT NULL DEFAULT '0',
  `f_fin` timestamp NULL DEFAULT NULL,
  `d_fin` double DEFAULT NULL,
  `tickets` int(11) DEFAULT NULL,
  `ip` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cajas` */

insert  into `cajas`(`id`,`fs_id`,`codagente`,`f_inicio`,`d_inicio`,`f_fin`,`d_fin`,`tickets`,`ip`) values (1,1,'1','2018-10-28 19:59:08',10,NULL,10,0,'::1');
insert  into `cajas`(`id`,`fs_id`,`codagente`,`f_inicio`,`d_inicio`,`f_fin`,`d_fin`,`tickets`,`ip`) values (2,2,'3','2018-10-29 14:46:52',0,NULL,0,0,'::1');

/*Table structure for table `cajas_terminales` */

DROP TABLE IF EXISTS `cajas_terminales`;

CREATE TABLE `cajas_terminales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `tickets` text COLLATE utf8_bin,
  `anchopapel` int(11) DEFAULT NULL,
  `comandocorte` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comandoapertura` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `num_tickets` int(11) DEFAULT NULL,
  `sin_comandos` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cajas_terminales` */

insert  into `cajas_terminales`(`id`,`codalmacen`,`codserie`,`codcliente`,`tickets`,`anchopapel`,`comandocorte`,`comandoapertura`,`num_tickets`,`sin_comandos`) values (1,'ALG','A','23','p0\n!8 CARRION TORRES \n  JIMMY HOMERO  \n!          De todo y mas barato          \n\n   Calle San Miguel y Av Quito - SANTO  \n                 DOMING                 \n          Cedula: 1722239967001         \n\n               08:30-18:00              \n\n\nServicio: SER2018FN2\n29-10-2018 14:41\nEmpleado: 1\n\nCliente: MIGUEL GETIAL\nTlf: 0968030620\nEquipo: laptop hp \n\nAccesorios que entrega: CARGADOR SN 555555\n\n\nCondiciones del deposito:\r\nLos presupuestos realizados tienen una validez de 15 días.\r\nUna vez avisado al cliente para que recoja el producto este dispondrá de un plazo máximo de 2 meses para recogerlo, de no ser así y no haber aviso por parte del cliente se empezará a cobrar 1 euro al día por gastos de almacenaje.\r\nLos accesorios y productos externos al equipo no especificados en este documento no podrán ser reclamados en caso de disconformidad con el técnico.\n\n\n\n\n\n\n\ni\n',40,'27.105','27.112.48',1,0);
insert  into `cajas_terminales`(`id`,`codalmacen`,`codserie`,`codcliente`,`tickets`,`anchopapel`,`comandocorte`,`comandoapertura`,`num_tickets`,`sin_comandos`) values (2,'ALG','FN','23','p0\n',40,'27.105','27.112.48',1,0);

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `capitalimpagado` double DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `codcontacto` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentadom` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentarem` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codedi` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `codgrupo` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codtiporappel` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `copiasfactura` int(11) DEFAULT NULL,
  `debaja` tinyint(1) DEFAULT '0',
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `fechabaja` date DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `idsubcuenta` int(11) DEFAULT NULL,
  `ivaincluido` tinyint(1) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `razonsocial` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `recargo` tinyint(1) DEFAULT NULL,
  `regimeniva` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `riesgoalcanzado` double DEFAULT NULL,
  `riesgomax` double DEFAULT NULL,
  `telefono1` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `telefono2` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `tipoidfiscal` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'NIF',
  `personafisica` tinyint(1) DEFAULT '1',
  `web` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `diaspago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codtarifa` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codcliente`),
  KEY `ca_clientes_grupos` (`codgrupo`),
  CONSTRAINT `ca_clientes_grupos` FOREIGN KEY (`codgrupo`) REFERENCES `gruposclientes` (`codgrupo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `clientes` */

insert  into `clientes`(`capitalimpagado`,`cifnif`,`codagente`,`codcliente`,`codcontacto`,`codcuentadom`,`codcuentarem`,`coddivisa`,`codedi`,`codgrupo`,`codpago`,`codserie`,`codsubcuenta`,`codtiporappel`,`contacto`,`copiasfactura`,`debaja`,`email`,`fax`,`fechabaja`,`fechaalta`,`idsubcuenta`,`ivaincluido`,`nombre`,`razonsocial`,`observaciones`,`recargo`,`regimeniva`,`riesgoalcanzado`,`riesgomax`,`telefono1`,`telefono2`,`tipoidfiscal`,`personafisica`,`web`,`diaspago`,`codproveedor`,`codtarifa`) values (NULL,'1722239967001',NULL,'000001',NULL,NULL,NULL,'USD',NULL,NULL,'CREDITO',NULL,NULL,NULL,NULL,NULL,0,'homer_loading@gmail.com','',NULL,'2018-10-28',NULL,NULL,'JIMMY HOMERO CARRION','JIMMY HOMERO CARRION','',0,'General',NULL,NULL,'0992669329','','Cedula',1,'',NULL,NULL,NULL);
insert  into `clientes`(`capitalimpagado`,`cifnif`,`codagente`,`codcliente`,`codcontacto`,`codcuentadom`,`codcuentarem`,`coddivisa`,`codedi`,`codgrupo`,`codpago`,`codserie`,`codsubcuenta`,`codtiporappel`,`contacto`,`copiasfactura`,`debaja`,`email`,`fax`,`fechabaja`,`fechaalta`,`idsubcuenta`,`ivaincluido`,`nombre`,`razonsocial`,`observaciones`,`recargo`,`regimeniva`,`riesgoalcanzado`,`riesgomax`,`telefono1`,`telefono2`,`tipoidfiscal`,`personafisica`,`web`,`diaspago`,`codproveedor`,`codtarifa`) values (NULL,'1722423967',NULL,'000002',NULL,NULL,NULL,'USD',NULL,NULL,'CONT',NULL,NULL,NULL,NULL,NULL,0,'miguelgetial@hotmail.com','',NULL,'2018-10-29',NULL,NULL,'MIGUEL GETIAL','MIGUEL GETIAL','',0,'General',NULL,NULL,'0968030620','','Cedula',1,'',NULL,NULL,NULL);

/*Table structure for table `co_asientos` */

DROP TABLE IF EXISTS `co_asientos`;

CREATE TABLE `co_asientos` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codplanasiento` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `documento` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `idasiento` int(11) NOT NULL AUTO_INCREMENT,
  `idconcepto` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `tipodocumento` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idasiento`),
  KEY `ca_co_asientos_ejercicios2` (`codejercicio`),
  CONSTRAINT `ca_co_asientos_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_asientos` */

/*Table structure for table `co_codbalances08` */

DROP TABLE IF EXISTS `co_codbalances08`;

CREATE TABLE `co_codbalances08` (
  `descripcion4ba` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `descripcion4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nivel4` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `descripcion3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orden3` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `nivel3` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `descripcion2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nivel2` int(11) DEFAULT NULL,
  `descripcion1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nivel1` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `naturaleza` varchar(15) COLLATE utf8_bin NOT NULL,
  `codbalance` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codbalance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_codbalances08` */

/*Table structure for table `co_conceptospar` */

DROP TABLE IF EXISTS `co_conceptospar`;

CREATE TABLE `co_conceptospar` (
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idconceptopar` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idconceptopar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_conceptospar` */

/*Table structure for table `co_cuentas` */

DROP TABLE IF EXISTS `co_cuentas`;

CREATE TABLE `co_cuentas` (
  `codbalance` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codepigrafe` varchar(6) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `idcuentaesp` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `idepigrafe` int(11) NOT NULL,
  PRIMARY KEY (`idcuenta`),
  UNIQUE KEY `uniq_codcuenta` (`codcuenta`,`codejercicio`),
  KEY `ca_co_cuentas_ejercicios` (`codejercicio`),
  KEY `ca_co_cuentas_epigrafes2` (`idepigrafe`),
  CONSTRAINT `ca_co_cuentas_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_cuentas_epigrafes2` FOREIGN KEY (`idepigrafe`) REFERENCES `co_epigrafes` (`idepigrafe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_cuentas` */

insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1111','2018','111','CAJA GENERAL',1,'CAJA',3);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1112','2018','111','CAJA CHICA',2,'CAJA',3);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1113','2018','111','BANCOS',3,'',3);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1114','2018','111','INVERSIONES',4,'',3);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1121','2018','112','CUENTAS POR COBRAR CLIENTES',5,'CLIENT',4);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1122','2018','112','CUENTAS POR COBRAR TARJETAS',6,'',4);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1131','2018','113','Otras cuentas por cobrar',7,'',5);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1133','2018','113','OTRAS POR COBRAR EMPLEADOS',8,'',5);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1134','2018','113','IMPUESTOS SRI',9,'ERFVEN',5);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1135','2018','113','RETENCIONES Y ANTICIPOS',10,'ERIVEN',5);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1141','2018','114','INVENTARIO',11,'COMPRA',6);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1211','2018','121','ACTIVOS NO DEPRECIABLES',12,'',8);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1212','2018','121','ACTIVOS DEPRECIABLES',13,'',8);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1213','2018','121','DEPRECIACIÓN ACUMULADA',14,'',8);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1221','2018','122','Otras por cobrar Garantías L.P.',15,'',9);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'1222','2018','122','Otras por cobrar Garantías',16,'',9);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2111','2018','211','SOBREGIRO Y PRESTAMOS',17,'',12);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2121','2018','212','PROVEEDORES',18,'PROVEE',13);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2131','2018','213','OTRAS CUENTAS POR PAGAR',19,'',14);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2132','2018','213','OBLIGACIONES PERSONAL',20,'',14);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2133','2018','213','OBLIGACIONES FISCALES',21,'IVAREP',14);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2134','2018','213','RETENCIONES DE IVA',22,'ERICOM',14);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2135','2018','213','RETENCIONES EN LA FUENTE',23,'ERFCOM',14);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2136','2018','213','OBLIGACIONES SEGURO SOCIAL',24,'',14);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'2211','2018','221','PRESTAMOS',25,'',16);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'311','2018','31','CAPITAL SOCIAL',26,'',18);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'312','2018','31','APORTES FUTURA CAPITALIZACIÓN',27,'',18);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'313','2018','31','RESERVAS',28,'',18);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'331','2018','33','RESULTADOS ANTERIORES',29,'',19);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'332','2018','33','RESULTADO DEL EJERCICIO',30,'',19);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'411','2018','41','VENTAS',31,'VENTAS',21);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'4121','2018','412','VENTAS',32,'',22);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'4122','2018','412','DEVOLUCIONES EN VENTAS',33,'',22);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'4123','2018','412','OTROS INGRESOS OPERACIONALES',34,'',22);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'421','2018','42','OTROS INGRESOS',35,'',24);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'511','2018','51','COSTO DE PRODUCCIÓN',36,'',26);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'512','2018','51','COSTO MANO DE OBRA',37,'',26);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'513','2018','51','OTROS COSTOS',38,'',26);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'611','2018','61','GASTOS PERSONAL ADMINISTRATIVO',39,'',28);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'612','2018','61','OTROS GASTOS ADMINISTRATIVOS',40,'',28);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'621','2018','62','GASTOS PERSONAL DE VENTAS',41,'',29);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'622','2018','62','OTROS GASTOS VENTAS',42,'',29);
insert  into `co_cuentas`(`codbalance`,`codcuenta`,`codejercicio`,`codepigrafe`,`descripcion`,`idcuenta`,`idcuentaesp`,`idepigrafe`) values (NULL,'631','2018','63','GASTOS FINANCIEROS',43,'',30);

/*Table structure for table `co_cuentascb` */

DROP TABLE IF EXISTS `co_cuentascb`;

CREATE TABLE `co_cuentascb` (
  `desccuenta` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codbalance` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_cuentascb` */

/*Table structure for table `co_cuentascbba` */

DROP TABLE IF EXISTS `co_cuentascbba`;

CREATE TABLE `co_cuentascbba` (
  `desccuenta` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codbalance` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_cuentascbba` */

/*Table structure for table `co_cuentasesp` */

DROP TABLE IF EXISTS `co_cuentasesp`;

CREATE TABLE `co_cuentasesp` (
  `codcuenta` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idcuentaesp` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idcuentaesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_cuentasesp` */

insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de acreedores','ACREED');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de caja','CAJA');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de diferencias negativas de cambio','CAMNEG');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de diferencias positivas de cambio','CAMPOS');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de clientes','CLIENT');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de compras','COMPRA');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Devoluciones de compras','DEVCOM');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Devoluciones de ventas','DEVVEN');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas por diferencias positivas en divisa extranjera','DIVPOS');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Ecuador retención fuente compras','ERFCOM');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Ecuador retención fuente ventas','ERFVEN');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Ecuador retención de IVA compras','ERICOM');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Ecuador retención de IVA ventas','ERIVEN');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas por diferencias negativas de conversión a la moneda local','EURNEG');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas por diferencias positivas de conversión a la moneda local','EURPOS');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Gastos por recargo financiero','GTORF');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Ingresos por recargo financiero','INGRF');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de retenciones IRPF','IRPF');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de retenciones para proveedores IRPFPR','IRPFPR');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas acreedoras de IVA en la regularización','IVAACR');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas deudoras de IVA en la regularización','IVADEU');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'IVA en entregas intracomunitarias U.E.','IVAEUE');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA repercutido','IVAREP');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA repercutido para clientes exentos de IVA','IVAREX');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA soportado UE','IVARUE');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA repercutido en exportaciones','IVARXP');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA soportado en importaciones','IVASIM');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA soportado','IVASOP');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de IVA soportado UE','IVASUE');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas relativas al ejercicio previo','PREVIO');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de proveedores','PROVEE');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Pérdidas y ganancias','PYG');
insert  into `co_cuentasesp`(`codcuenta`,`codsubcuenta`,`descripcion`,`idcuentaesp`) values (NULL,NULL,'Cuentas de ventas','VENTAS');

/*Table structure for table `co_epigrafes` */

DROP TABLE IF EXISTS `co_epigrafes`;

CREATE TABLE `co_epigrafes` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codepigrafe` varchar(6) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idepigrafe` int(11) NOT NULL AUTO_INCREMENT,
  `idgrupo` int(11) DEFAULT NULL,
  `idpadre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idepigrafe`),
  KEY `ca_co_epigrafes_ejercicios` (`codejercicio`),
  KEY `ca_co_epigrafes_gruposepigrafes2` (`idgrupo`),
  CONSTRAINT `ca_co_epigrafes_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_epigrafes_gruposepigrafes2` FOREIGN KEY (`idgrupo`) REFERENCES `co_gruposepigrafes` (`idgrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_epigrafes` */

insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','1','ACTIVOS',1,NULL,NULL);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','11','ACTIVO CORRIENTE',2,NULL,1);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','111','DISPONIBLE',3,NULL,2);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','112','EXIGIBLE',4,NULL,2);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','113','OTRAS CUENTAS POR COBRAR',5,NULL,2);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','114','REALIZABLE',6,NULL,2);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','12','ACTIVO NO CORRIENTE',7,NULL,1);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','121','ACTIVO FIJO',8,NULL,7);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','122','OTROS ACTIVOS LAGO PLAZO',9,NULL,7);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','2','PASIVO',10,NULL,NULL);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','21','PASIVO CORRIENTE',11,NULL,10);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','211','OBLIGACIONES FINANCIERAS CORTO PLAZO',12,NULL,11);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','212','CTAS POR PAGAR COMERCIALES',13,NULL,11);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','213','GASTOS ACUMULADOS Y OTRAS POR PAGAR',14,NULL,11);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','22','PASIVO NO CORRIENTE',15,NULL,10);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','221','OBLIGACIONES FINANCIERAS LARGO PLAZO',16,NULL,15);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','3','PATRIMONIO',17,NULL,NULL);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','31','CAPITAL Y RESERVAS',18,NULL,17);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','33','RESULTADOS',19,NULL,17);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','4','INGRESOS',20,NULL,NULL);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','41','INGRESOS OPERACIONALES',21,NULL,20);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','412','DEVOLUCIONES EN VENTAS',22,NULL,21);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','414','OTROS INGRESOS OPERACIONALES',23,NULL,21);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','42','INGRESOS NO OPERACIONALES',24,NULL,20);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','5','COSTOS',25,NULL,NULL);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','51','COSTOS DE OPERACION',26,NULL,25);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','6','GASTOS',27,NULL,NULL);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','61','GASTOS ADMINISTRACION',28,NULL,27);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','62','GASTOS DE VENTAS',29,NULL,27);
insert  into `co_epigrafes`(`codejercicio`,`codepigrafe`,`descripcion`,`idepigrafe`,`idgrupo`,`idpadre`) values ('2018','63','GASTOS FINANCIEROS',30,NULL,27);

/*Table structure for table `co_gruposepigrafes` */

DROP TABLE IF EXISTS `co_gruposepigrafes`;

CREATE TABLE `co_gruposepigrafes` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codgrupo` varchar(6) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idgrupo`),
  KEY `ca_co_gruposepigrafes_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_co_gruposepigrafes_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_gruposepigrafes` */

/*Table structure for table `co_partidas` */

DROP TABLE IF EXISTS `co_partidas`;

CREATE TABLE `co_partidas` (
  `baseimponible` double NOT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `codcontrapartida` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `debe` double NOT NULL DEFAULT '0',
  `debeme` double NOT NULL,
  `documento` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `factura` double DEFAULT NULL,
  `haber` double NOT NULL DEFAULT '0',
  `haberme` double NOT NULL,
  `idasiento` int(11) NOT NULL,
  `idconcepto` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `idcontrapartida` int(11) DEFAULT NULL,
  `idpartida` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) NOT NULL,
  `iva` double NOT NULL,
  `punteada` tinyint(1) NOT NULL DEFAULT '0',
  `recargo` double NOT NULL,
  `tasaconv` double NOT NULL,
  `tipodocumento` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idpartida`),
  KEY `ca_co_partidas_co_asientos2` (`idasiento`),
  KEY `ca_co_partidas_subcuentas` (`idsubcuenta`),
  CONSTRAINT `ca_co_partidas_co_asientos2` FOREIGN KEY (`idasiento`) REFERENCES `co_asientos` (`idasiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_partidas_subcuentas` FOREIGN KEY (`idsubcuenta`) REFERENCES `co_subcuentas` (`idsubcuenta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_partidas` */

/*Table structure for table `co_regiva` */

DROP TABLE IF EXISTS `co_regiva`;

CREATE TABLE `co_regiva` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codsubcuentaacr` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentadeu` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `fechaasiento` date NOT NULL,
  `fechafin` date NOT NULL,
  `fechainicio` date NOT NULL,
  `idasiento` int(11) NOT NULL,
  `idregiva` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuentaacr` int(11) DEFAULT NULL,
  `idsubcuentadeu` int(11) DEFAULT NULL,
  `periodo` varchar(8) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idregiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_regiva` */

/*Table structure for table `co_secuencias` */

DROP TABLE IF EXISTS `co_secuencias`;

CREATE TABLE `co_secuencias` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `idsecuencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `valorout` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsecuencia`),
  KEY `ca_co_secuencias_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_co_secuencias_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_secuencias` */

insert  into `co_secuencias`(`codejercicio`,`descripcion`,`idsecuencia`,`nombre`,`valor`,`valorout`) values ('2018','Creado por FacturaScripts',1,'nasiento',NULL,2);

/*Table structure for table `co_subcuentas` */

DROP TABLE IF EXISTS `co_subcuentas`;

CREATE TABLE `co_subcuentas` (
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `debe` double NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `haber` double NOT NULL,
  `idcuenta` int(11) DEFAULT NULL,
  `idsubcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double NOT NULL,
  `recargo` double NOT NULL,
  `saldo` double NOT NULL,
  PRIMARY KEY (`idsubcuenta`),
  UNIQUE KEY `uniq_codsubcuenta` (`codsubcuenta`,`codejercicio`),
  KEY `ca_co_subcuentas_ejercicios` (`codejercicio`),
  KEY `ca_co_subcuentas_cuentas2` (`idcuenta`),
  CONSTRAINT `ca_co_subcuentas_cuentas2` FOREIGN KEY (`idcuenta`) REFERENCES `co_cuentas` (`idcuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentas_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_subcuentas` */

insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1111','USD','2018',NULL,'1111001',0,'Caja General - Ventas',0,1,1,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1112','USD','2018',NULL,'1112001',0,'CAJA CHICA',0,2,2,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1113','USD','2018',NULL,'1113001',0,'PRODUBANCO',0,3,3,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1114','USD','2018',NULL,'1114001',0,'INVERSIONES TEMPORALES',0,4,4,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1121','USD','2018',NULL,'1121001',0,'JIMMY HOMERO CARRION',0,5,5,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1122','USD','2018',NULL,'1122001',0,'Diners',0,6,6,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1122','USD','2018',NULL,'1122002',0,'MasterCard',0,6,7,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1122','USD','2018',NULL,'1122003',0,'Visa',0,6,8,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1122','USD','2018',NULL,'1122004',0,'American Express',0,6,9,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1122','USD','2018',NULL,'1122005',0,'Otras Tarjetas',0,6,10,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1131','USD','2018',NULL,'1131001',0,'Otras por cobrar Garantías',0,7,11,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1131','USD','2018',NULL,'1131002',0,'Otras por cobrar',0,7,12,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1131','USD','2018',NULL,'1131003',0,'Anticipo Dividendos Socios',0,7,13,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1131','USD','2018',NULL,'1131004',0,'Anticipo de Proveedores',0,7,14,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1133','USD','2018',NULL,'1133001',0,'Anticipo Empleado',0,8,15,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1133','USD','2018',NULL,'1133002',0,'Prestamos Empleados',0,8,16,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1133','USD','2018',NULL,'1133003',0,'Anticipo Utilidades Empleados',0,8,17,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1133','USD','2018',NULL,'1133004',0,'Consumo Empleados',0,8,18,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1133','USD','2018',NULL,'1133005',0,'Seguro medico empleados',0,8,19,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134001',0,'306-2% Compras Locales Mat. Prima',0,9,20,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134003',0,'IVA Retenciones Recibidas',0,9,21,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134004',0,'328-0.3% Combustibles a Distribuidores',0,9,22,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134005',0,'Impuestos por Pagar',0,9,23,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134006',0,'329-2% Otros Bienes y Servicios',0,9,24,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134007',0,'330-25% Pagos de Dividendos Anticipados',0,9,25,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134008',0,'331-1% Energia',0,9,26,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134009',0,'331-2% Agua, y Telecom.',0,9,27,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134010',0,'332-No sujetos a Retención',0,9,28,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134011',0,'332-No sujetos a Retención',0,9,29,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134012',0,'335-2% Por Actividades de Construcción de O.M.',0,9,30,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134013',0,'340-Aplicables 1%',0,9,31,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134014',0,'505A - 22% Pago al exterior – Intereses de créditos de Instituciones Financieras del exterior',0,9,32,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134015',0,'505B - 22% Pago al exterior – Intereses de créditos de gobierno a gobierno',0,9,33,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134016',0,'505C - 22% Pago al exterior – Intereses de créditos de organismos multilaterales',0,9,34,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134017',0,'505D - 22% Pago al exterior - Intereses por financiamiento de proveedores externos',0,9,35,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134018',0,'505E - 22% Pago al exterior - Intereses de otros créditos externos',0,9,36,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134019',0,'505F - 22% Pago al exterior - Otros Intereses y Rendimientos Financieros',0,9,37,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134020',0,'509 - 22% Pago al exterior - Cánones, derechos de autor,  marcas, patentes y similares',0,9,38,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134021',0,'509A - 22% Pago al exterior - Regalías por concepto de franquicias',0,9,39,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134022',0,'510 - 22% Pago al exterior - Ganancias de capital',0,9,40,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134023',0,'511 - 22% Pago al exterior - Servicios profesionales independientes',0,9,41,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134024',0,'341-Impuesto Exportación al banano 2%',0,9,42,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134026',0,'513 - 22% Pago al exterior - Artistas',0,9,43,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134027',0,'513A - 22% Pago al exterior - Deportistas',0,9,44,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134028',0,'514 - 22% Pago al exterior - Participación de consejeros',0,9,45,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134029',0,'515 - 22% Pago al exterior - Entretenimiento Público',0,9,46,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134030',0,'516 - 22% Pago al exterior - Pensiones',0,9,47,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134031',0,'517 - 22% Pago al exterior - Reembolso de Gastos',0,9,48,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134032',0,'518 - 22% Pago al exterior - Funciones Públicas',0,9,49,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134033',0,'519 - 22% Pago al exterior - Estudiantes',0,9,50,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134034',0,'520 - 22% Pago al exterior - Otros conceptos de ingresos gravados',0,9,51,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134035',0,'342-Aplicables 8%',0,9,52,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134036',0,'520A - 22% Pago al exterior - Pago a proveedores de servicios hoteleros y turísticos en el exterior',0,9,53,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134037',0,'520B - 22% Pago al exterior - Arrendamientos mercantil internacional',0,9,54,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134038',0,'520D - 22% Pago al exterior - Comisiones por exportaciones y por promoción de turismo receptivo',0,9,55,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134039',0,'520E - 22% Pago al exterior - Por las empresas de transporte marítimo o aéreo y por empresas pesqueras de alta mar, por su actividad.',0,9,56,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134040',0,'520F - 22% Pago al exterior - Por las agencias internacionales de prensa',0,9,57,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134041',0,'520G - 22% Pago al exterior - Contratos de fletamento de naves para empresas de transporte aéreo o marítimo internacional',0,9,58,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134042',0,'521 - 5% Pago al exterior - Enajenación de derechos representativos de capital y otros derechos',0,9,59,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134043',0,'522A - 22% Pago al exterior - Servicios técnicos, administrativos o de consultoría y regalías con convenio de doble tributación',0,9,60,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134044',0,'523A - 22% Pago al exterior - Seguros y reaseguros (primas y cesiones)  con convenio de doble tributación',0,9,61,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134045',0,'524 - 22% Pago al exterior - Otros pagos al exterior no sujetos a retención',0,9,62,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134046',0,'343-Aplicables 25%',0,9,63,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134047',0,'525 - 100% Pago al exterior - Donaciones en dinero -Impuesto a la donaciones',0,9,64,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134048',0,'309-Publicidad y Comunicación 1%',0,9,65,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134049',0,'304-Honorarios Prof. y Dietas 8%',0,9,66,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134050',0,'303-Honorarios Prof. y Dietas 10%',0,9,67,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134051',0,'Débito Bancario',0,9,68,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134052',0,'312 - 1% Transferencia de Bienes y Servicios',0,9,69,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134053',0,'301-Ret. Fte. Relación de dependencia No Supp.',0,9,70,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134054',0,'302-Relación Dependencia Super. Base',0,9,71,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134055',0,'304-2% Remuneraciones a Otros Trabajadores Aut.',0,9,72,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134056',0,'305-25% Honorarios Extranjeros por Servicios',0,9,73,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134057',0,'307-2% Por Compras Locales no Produ. Soc.',0,9,74,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134058',0,'308-Compras Bienes no sujetas a Ret.',0,9,75,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134059',0,'309-2% Por Suministros y Materiales',0,9,76,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134060',0,'310-2% Por Repuestos y Herramientas',0,9,77,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134061',0,'311-2% Por Lubricantes',0,9,78,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134062',0,'312-2% Por Activos Fijos',0,9,79,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134063',0,'313-1% Por Servicio de Transporte Privado Pas.o Carg.',0,9,80,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134064',0,'314-5% Por Regalías, Derechos de Autor',0,9,81,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134065',0,'314-8% Por Regalías, Derechos de Autor',0,9,82,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134066',0,'315-5% Por Remuneración a Deportistas',0,9,83,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134067',0,'316-8% Por Pago a Notarios,Reg.',0,9,84,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134068',0,'317-2% Por Comisiones Pagadas a Sociedades',0,9,85,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134069',0,'318-2% Por Promoción y Publicidad',0,9,86,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134070',0,'319-2% Por Arriendo Mercantil',0,9,87,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134071',0,'320-8% Arrendamiento Bienes Im.Per.Nat.',0,9,88,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134072',0,'321-5% Arrendamiento Bienes Im.Soc.',0,9,89,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134073',0,'322-2% Por Seguros y Reaseguros',0,9,90,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134074',0,'323-5% Por Rendimientos Financieros',0,9,91,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134075',0,'324-1% Por Pagos o Créditos en Emiso.Tarj.',0,9,92,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134076',0,'325-15% Loterías,Rifas, Apuestas',0,9,93,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134077',0,'326-1% Por Intereses y Comisiones',0,9,94,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134078',0,'304-8% Honorarios, Comisiones, Dietas',0,9,95,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134079',0,'307-2% Servicios predomina la mano de obra',0,9,96,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134080',0,'344-2% Aplicables',0,9,97,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134081',0,'304C - 8% Pagos a deportistas, entrenadores, árbitros, miembros del cuerpo técnico por sus actividades ejercidas como tales',0,9,98,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134082',0,'304D - 8% Pagos a artistas por sus actividades ejercidas como tales',0,9,99,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134083',0,'304E - 8% Honorarios y demás pagos por servicios de docencia',0,9,100,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134084',0,'314D - 8% Cánones, derechos de autor,  marcas, patentes y similares de acuerdo a Ley de Propiedad Intelectual – pago a sociedades',0,9,101,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134085',0,'314C - 8% Regalías por concepto de franquicias de acuerdo a Ley de Propiedad Intelectual  - pago a sociedades',0,9,102,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134086',0,'332B - 0% Compra de bienes inmuebles',0,9,103,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134087',0,'323A - 2% Por RF: depósitos Cta. Corriente',0,9,104,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134088',0,'332C - 0% Transporte público de pasajeros',0,9,105,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134089',0,'325A - 22% Dividendos anticipados préstamos accionistas, beneficiarios o participes',0,9,106,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134090',0,'332D - 0% Pagos en el país por transporte de pasajeros o transporte internacional de carga, a compañías nacionales o extranjeras de aviación o marítimas',0,9,107,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134091',0,'324B - 1% Por RF: Por inversiones entre instituciones del sistema financiero y entidades economía popular y solidaria.',0,9,108,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134092',0,'332A - 0% Enajenación de derechos representativos de capital y otros derechos exentos (mayo 2016)',0,9,109,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134093',0,'323R - 0% Por RF: Otros intereses y rendimientos financieros exentos',0,9,110,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134094',0,'323Q - 2% Por RF: Otros intereses y rendimientos financieros gravados',0,9,111,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134095',0,'323P - 2% Por RF: Intereses pagados por entidades del sector público a favor de sujetos pasivos',0,9,112,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134096',0,'323O - 0% Por RF: Intereses pagados a bancos y otras entidades sometidas al control de la Superintendencia de Bancos y de la Economía Popular y Solidaria',0,9,113,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134097',0,'323N - 0% Por RF: Inversiones en títulos valores en renta fija exentos',0,9,114,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134098',0,'323M - 2% Por RF: Inversiones en títulos valores en renta fija gravados',0,9,115,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134099',0,'323I - 2% Por RF: bonos convertible en acciones',0,9,116,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134100',0,'323H - 2% Por RF: obligaciones',0,9,117,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134101',0,'323G - 2% Por RF: inversiones (captaciones) rendimientos distintos de aquellos pagados a IFIs',0,9,118,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134102',0,'323F - 2% Por rendimientos financieros: operaciones de reporto - repos',0,9,119,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134103',0,'323E2 - 0% Por RF: depósito a plazo fijo exentos',0,9,120,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134104',0,'323E - 2% Por RF: depósito a plazo fijo  gravados',0,9,121,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134105',0,'323B1 - 2% Por RF:  depósitos Cta. Ahorros Sociedades',0,9,122,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134106',0,'332E - 0% Valores entregados por las cooperativas de transporte a sus socios',0,9,123,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134107',0,'332F - 0% Compraventa de divisas distintas al dólar de los Estados Unidos de América',0,9,124,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134108',0,'332G - 0% Pagos con tarjeta de crédito',0,9,125,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134109',0,'332H - 0% Pago al exterior tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo RECAP',0,9,126,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134110',0,'334 - 1% Enajenación de derechos representativos de capital y otros derechos no cotizados en bolsa ecuatoriana',0,9,127,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134111',0,'336 - 0.002% Por venta de combustibles a comercializadoras',0,9,128,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134112',0,'337 - 0.003% Por venta de combustibles a distribuidores',0,9,129,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134113',0,'338 - 2% Compra local de banano a productor',0,9,130,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134114',0,'339 - 100%  Liquidación impuesto único a la venta local de banano de producción propia',0,9,131,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134115',0,'343B - 1% Por actividades de construcción de obra material inmueble, urbanización, lotización o actividades similares',0,9,132,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134116',0,'344A - 2% Pago local tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo RECAP',0,9,133,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134117',0,'346A - 10% Ganancias de capital',0,9,134,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134118',0,'347 - 2% Donaciones en dinero -Impuesto a la donaciones',0,9,135,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134119',0,'348 - 10% Retención a cargo del propio sujeto pasivo por la exportación de concentrados y/o elementos metálicos',0,9,136,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134120',0,'349 - 0% Retención a cargo del propio sujeto pasivo por la comercialización de productos forestales',0,9,137,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134121',0,'500 - 22% Pago al exterior - Rentas Inmobiliarias',0,9,138,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134122',0,'501 - 22% Pago al exterior - Beneficios Empresariales',0,9,139,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134123',0,'502 - 22% Pago al exterior - Servicios Empresariales',0,9,140,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134124',0,'503 - 22% Pago al exterior - Navegación Marítima y/o aérea',0,9,141,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134125',0,'504 - 0% Pago al exterior- Dividendos distribuidos a personas naturales',0,9,142,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134126',0,'504B - 22% Pago al exterior - Anticipo dividendos (excepto paraísos fiscales o de régimen de menor imposición)',0,9,143,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134127',0,'504C - 22% Pago al exterior - Dividendos anticipados préstamos accionistas, beneficiarios o partìcipes (paraísos fiscales o regímenes de menor imposición)',0,9,144,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134128',0,'504A - 0% Pago al exterior - Dividendos a sociedades',0,9,145,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134129',0,'504D - 0% Pago al exterior - Dividendos a fideicomisos',0,9,146,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134130',0,'504F - 0% Pago al exterior - Dividendos a sociedades  (paraísos fiscales)',0,9,147,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134131',0,'504G - 0% Pago al exterior - Anticipo dividendos  (paraísos fiscales)',0,9,148,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134132',0,'504H - 13% Pago al exterior - Dividendos a fideicomisos  (paraísos fiscales)',0,9,149,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134133',0,'505 - 22% Pago al exterior - Rendimientos financieros',0,9,150,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134134',0,'512 - 22% Pago al exterior - Servicios profesionales dependientes',0,9,151,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134998',0,'327-0.2% Combustibles a Comercializadoras',0,9,152,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1134','USD','2018',NULL,'1134999',0,'Retenciones acumuladas de RENTA ventas',0,9,153,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135001',0,'Retenciones del Impuesto a la Renta',0,10,154,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135002',0,'IR Anticipo Impuesto Renta',0,10,155,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135003',0,'Retenciones IVA  recibidas',0,10,156,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135004',0,'RIVA 100% Honorarios',0,10,157,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135005',0,'RIVA 100% Arriendo P Nat',0,10,158,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135006',0,'RIVA 70% Servicios',0,10,159,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135007',0,'RIVA 30% Bienes',0,10,160,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1135','USD','2018',NULL,'1135999',0,'Retenciones acumuladas de IVA ventas',0,10,161,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1141','USD','2018',NULL,'1141001',0,'Inventario Materia Prima',0,11,162,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1141','USD','2018',NULL,'1141002',0,'Inventario Productos en Proceso',0,11,163,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1141','USD','2018',NULL,'1141003',0,'Inventario Productos Terminado',0,11,164,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1211','USD','2018',NULL,'1211001',0,'Terrenos',0,12,165,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1211','USD','2018',NULL,'1211002',0,'Construcciones en Tránsito',0,12,166,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1211','USD','2018',NULL,'1211003',0,'Maquinaria en Tránsito',0,12,167,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1212','USD','2018',NULL,'1212001',0,'Edificios e Instalaciones',0,13,168,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1212','USD','2018',NULL,'1212002',0,'Maquinaria y Herramientas',0,13,169,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1212','USD','2018',NULL,'1212003',0,'Muebles y Enseres',0,13,170,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1212','USD','2018',NULL,'1212004',0,'Equipos Cómputo y Sistema',0,13,171,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1212','USD','2018',NULL,'1212005',0,'Vehículos',0,13,172,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1213','USD','2018',NULL,'1213001',0,'Deprec. Acum. Edificios e Instalaciones',0,14,173,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1213','USD','2018',NULL,'1213002',0,'Deprec. Acum. Maqu. y herramienta',0,14,174,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1213','USD','2018',NULL,'1213003',0,'Deprec. Acum. Muebles',0,14,175,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1213','USD','2018',NULL,'1213004',0,'Deprec. Acum. Equip. Comp. Y herramienta',0,14,176,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1213','USD','2018',NULL,'1213005',0,'Deprec. Acum. Vehículos',0,14,177,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1221','USD','2018',NULL,'1221001',0,'Otras por cobrar Garantías L.P.',0,15,178,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1222','USD','2018',NULL,'1222001',0,'Otras por cobrar Garantías',0,16,179,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2111','USD','2018',NULL,'2111001',0,'Obligaciones Bancarias Corto Plazo',0,17,180,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2131','USD','2018',NULL,'2131001',0,'Socios y Relacionados',0,19,181,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2131','USD','2018',NULL,'2131002',0,'Otras Cuentas por Pagar Varios',0,19,182,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2131','USD','2018',NULL,'2131003',0,'Sobregiro caja general',0,19,183,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2131','USD','2018',NULL,'2131004',0,'Anticipo Cliente',0,19,184,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132001',0,'Sueldos Por Pagar',0,20,185,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132002',0,'Beneficios Adicionales por Pagar',0,20,186,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132003',0,'Liquidaciones por Pagar',0,20,187,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132004',0,'Participación Trabajadores',0,20,188,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132005',0,'Servicios por pagar',0,20,189,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132006',0,'Décimo Tercer Sueldo',0,20,190,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132007',0,'Décimo Cuarto Sueldo',0,20,191,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132008',0,'Vacaciones',0,20,192,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132009',0,'Otros Beneficios',0,20,193,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2132','USD','2018',NULL,'2132010',0,'10% servicios',0,20,194,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2133','USD','2018',NULL,'2133003',0,'12% IVA en Ventas por pagar',0,21,195,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2133','USD','2018',NULL,'2133004',0,'Ice por Pagar',0,21,196,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2133','USD','2018',NULL,'2133005',0,'Impuesto Verde',0,21,197,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2133','USD','2018',NULL,'2133006',0,'Impuesto Renta por Pagar',0,21,198,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134001',0,'IVA 100% Prestación Serv. Profesionales',0,22,199,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134002',0,'IVA 100% Arrendamiento de Inmuebles Per. Naturales',0,22,200,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134003',0,'IVA 100% Compras Bien.y Serv. con Liq. Compras',0,22,201,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134004',0,'IVA 70% Prestación de Otros Servicios',0,22,202,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134005',0,'IVA 30% Por la Compra de Bienes',0,22,203,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134006',0,'IVA 100% OTRAS VENTAS',0,22,204,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134007',0,'IVA 10% Por la Compra de Bienes',0,22,205,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134008',0,'IVA 20% Prestación de Otros Servicios',0,22,206,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134009',0,'IVA 50% Prestación de Otros Servicios',0,22,207,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2134','USD','2018',NULL,'2134999',0,'Retenciones acumuladas de IVA compras',0,22,208,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135001',0,'306-2% Compras Locales Mat. Prima',0,23,209,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135002',0,'327-0.2% Combustibles a Comercializadoras',0,23,210,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135003',0,'RFIR Empleados Relac. Dependencia',0,23,211,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135004',0,'328-0.3% Combustibles a Distribuidores',0,23,212,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135005',0,'Impuestos por Pagar',0,23,213,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135006',0,'329-2% Otros Bienes y Servicios',0,23,214,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135007',0,'330-25% Pagos de Dividendos Anticipados',0,23,215,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135008',0,'331-1% Energia',0,23,216,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135009',0,'331-2% Agua, y Telecom.',0,23,217,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135010',0,'332-No sujetos a Retención',0,23,218,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135011',0,'332-No sujetos a Retención',0,23,219,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135012',0,'335-2% Por Actividades de Construcción de O.M.',0,23,220,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135013',0,'340-Aplicables 1%',0,23,221,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135014',0,'505A - 22% Pago al exterior – Intereses de créditos de Instituciones Financieras del exterior',0,23,222,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135015',0,'505B - 22% Pago al exterior – Intereses de créditos de gobierno a gobierno',0,23,223,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135016',0,'505C - 22% Pago al exterior – Intereses de créditos de organismos multilaterales',0,23,224,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135017',0,'505D - 22% Pago al exterior - Intereses por financiamiento de proveedores externos',0,23,225,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135018',0,'505E - 22% Pago al exterior - Intereses de otros créditos externos',0,23,226,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135019',0,'505F - 22% Pago al exterior - Otros Intereses y Rendimientos Financieros',0,23,227,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135020',0,'509 - 22% Pago al exterior - Cánones, derechos de autor,  marcas, patentes y similares',0,23,228,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135021',0,'509A - 22% Pago al exterior - Regalías por concepto de franquicias',0,23,229,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135022',0,'510 - 22% Pago al exterior - Ganancias de capital',0,23,230,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135023',0,'511 - 22% Pago al exterior - Servicios profesionales independientes',0,23,231,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135024',0,'341-Impuesto Exportación al banano 2%',0,23,232,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135025',0,'512 - 22% Pago al exterior - Servicios profesionales dependientes',0,23,233,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135026',0,'513 - 22% Pago al exterior - Artistas',0,23,234,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135027',0,'513A - 22% Pago al exterior - Deportistas',0,23,235,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135028',0,'514 - 22% Pago al exterior - Participación de consejeros',0,23,236,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135029',0,'515 - 22% Pago al exterior - Entretenimiento Público',0,23,237,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135030',0,'516 - 22% Pago al exterior - Pensiones',0,23,238,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135031',0,'517 - 22% Pago al exterior - Reembolso de Gastos',0,23,239,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135032',0,'518 - 22% Pago al exterior - Funciones Públicas',0,23,240,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135033',0,'519 - 22% Pago al exterior - Estudiantes',0,23,241,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135034',0,'520 - 22% Pago al exterior - Otros conceptos de ingresos gravados',0,23,242,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135035',0,'342-Aplicables 8%',0,23,243,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135036',0,'520A - 22% Pago al exterior - Pago a proveedores de servicios hoteleros y turísticos en el exterior',0,23,244,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135037',0,'520B - 22% Pago al exterior - Arrendamientos mercantil internacional',0,23,245,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135038',0,'520D - 22% Pago al exterior - Comisiones por exportaciones y por promoción de turismo receptivo',0,23,246,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135039',0,'520E - 22% Pago al exterior - Por las empresas de transporte marítimo o aéreo y por empresas pesqueras de alta mar, por su actividad.',0,23,247,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135040',0,'520F - 22% Pago al exterior - Por las agencias internacionales de prensa',0,23,248,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135041',0,'520G - 22% Pago al exterior - Contratos de fletamento de naves para empresas de transporte aéreo o marítimo internacional',0,23,249,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135042',0,'521 - 5% Pago al exterior - Enajenación de derechos representativos de capital y otros derechos',0,23,250,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135043',0,'522A - 22% Pago al exterior - Servicios técnicos, administrativos o de consultoría y regalías con convenio de doble tributación',0,23,251,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135044',0,'523A - 22% Pago al exterior - Seguros y reaseguros (primas y cesiones)  con convenio de doble tributación',0,23,252,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135045',0,'524 - 22% Pago al exterior - Otros pagos al exterior no sujetos a retención',0,23,253,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135046',0,'343-Aplicables 25%',0,23,254,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135047',0,'525 - 100% Pago al exterior - Donaciones en dinero -Impuesto a la donaciones',0,23,255,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135048',0,'309-Publicidad y Comunicación 1%',0,23,256,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135049',0,'304-Honorarios Prof. y Dietas 8%',0,23,257,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135050',0,'303-Honorarios Prof. y Dietas 10%',0,23,258,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135051',0,'Débito Bancario',0,23,259,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135052',0,'312 - 1% Transferencia de Bienes y Servicios',0,23,260,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135053',0,'301-Ret. Fte. Relación de dependencia No Supp.',0,23,261,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135054',0,'302-Relación Dependencia Super. Base',0,23,262,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135055',0,'304-2% Remuneraciones a Otros Trabajadores Aut.',0,23,263,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135056',0,'305-25% Honorarios Extranjeros por Servicios',0,23,264,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135057',0,'307-2% Por Compras Locales no Produ. Soc.',0,23,265,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135058',0,'308-Compras Bienes no sujetas a Ret.',0,23,266,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135059',0,'309-2% Por Suministros y Materiales',0,23,267,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135060',0,'310-2% Por Repuestos y Herramientas',0,23,268,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135061',0,'311-2% Por Lubricantes',0,23,269,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135062',0,'312-2% Por Activos Fijos',0,23,270,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135063',0,'313-1% Por Servicio de Transporte Privado Pas.o Carg.',0,23,271,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135064',0,'314-5% Por Regalías, Derechos de Autor',0,23,272,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135065',0,'314-8% Por Regalías, Derechos de Autor',0,23,273,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135066',0,'315-5% Por Remuneración a Deportistas',0,23,274,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135067',0,'316-8% Por Pago a Notarios,Reg.',0,23,275,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135068',0,'317-2% Por Comisiones Pagadas a Sociedades',0,23,276,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135069',0,'318-2% Por Promoción y Publicidad',0,23,277,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135070',0,'319-2% Por Arriendo Mercantil',0,23,278,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135071',0,'320-8% Arrendamiento Bienes Im.Per.Nat.',0,23,279,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135072',0,'321-5% Arrendamiento Bienes Im.Soc.',0,23,280,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135073',0,'322-2% Por Seguros y Reaseguros',0,23,281,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135074',0,'323-5% Por Rendimientos Financieros',0,23,282,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135075',0,'324-1% Por Pagos o Créditos en Emiso.Tarj.',0,23,283,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135076',0,'325-15% Loterías,Rifas, Apuestas',0,23,284,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135077',0,'326-1% Por Intereses y Comisiones',0,23,285,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135078',0,'304-8% Honorarios, Comisiones, Dietas',0,23,286,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135079',0,'307-2% Servicios predomina la mano de obra',0,23,287,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135080',0,'344-2% Aplicables',0,23,288,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135081',0,'304C - 8% Pagos a deportistas, entrenadores, árbitros, miembros del cuerpo técnico por sus actividades ejercidas como tales',0,23,289,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135082',0,'304D - 8% Pagos a artistas por sus actividades ejercidas como tales',0,23,290,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135083',0,'304E - 8% Honorarios y demás pagos por servicios de docencia',0,23,291,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135084',0,'314D - 8% Cánones, derechos de autor,  marcas, patentes y similares de acuerdo a Ley de Propiedad Intelectual – pago a sociedades',0,23,292,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135085',0,'314C - 8% Regalías por concepto de franquicias de acuerdo a Ley de Propiedad Intelectual  - pago a sociedades',0,23,293,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135086',0,'332B - 0% Compra de bienes inmuebles',0,23,294,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135087',0,'323A - 2% Por RF: depósitos Cta. Corriente',0,23,295,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135088',0,'332C - 0% Transporte público de pasajeros',0,23,296,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135089',0,'325A - 22% Dividendos anticipados préstamos accionistas, beneficiarios o participes',0,23,297,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135090',0,'332D - 0% Pagos en el país por transporte de pasajeros o transporte internacional de carga, a compañías nacionales o extranjeras de aviación o marítimas',0,23,298,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135091',0,'324B - 1% Por RF: Por inversiones entre instituciones del sistema financiero y entidades economía popular y solidaria.',0,23,299,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135092',0,'332A - 0% Enajenación de derechos representativos de capital y otros derechos exentos (mayo 2016)',0,23,300,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135093',0,'323R - 0% Por RF: Otros intereses y rendimientos financieros exentos',0,23,301,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135094',0,'323Q - 2% Por RF: Otros intereses y rendimientos financieros gravados',0,23,302,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135095',0,'323P - 2% Por RF: Intereses pagados por entidades del sector público a favor de sujetos pasivos',0,23,303,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135096',0,'323O - 0% Por RF: Intereses pagados a bancos y otras entidades sometidas al control de la Superintendencia de Bancos y de la Economía Popular y Solidaria',0,23,304,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135097',0,'323N - 0% Por RF: Inversiones en títulos valores en renta fija exentos',0,23,305,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135098',0,'323M - 2% Por RF: Inversiones en títulos valores en renta fija gravados',0,23,306,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135099',0,'323I - 2% Por RF: bonos convertible en acciones',0,23,307,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135100',0,'323H - 2% Por RF: obligaciones',0,23,308,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135101',0,'323G - 2% Por RF: inversiones (captaciones) rendimientos distintos de aquellos pagados a IFIs',0,23,309,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135102',0,'323F - 2% Por rendimientos financieros: operaciones de reporto - repos',0,23,310,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135103',0,'323E2 - 0% Por RF: depósito a plazo fijo exentos',0,23,311,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135104',0,'323E - 2% Por RF: depósito a plazo fijo  gravados',0,23,312,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135105',0,'323B1 - 2% Por RF:  depósitos Cta. Ahorros Sociedades',0,23,313,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135106',0,'332E - 0% Valores entregados por las cooperativas de transporte a sus socios',0,23,314,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135107',0,'332F - 0% Compraventa de divisas distintas al dólar de los Estados Unidos de América',0,23,315,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135108',0,'332G - 0% Pagos con tarjeta de crédito',0,23,316,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135109',0,'332H - 0% Pago al exterior tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo RECAP',0,23,317,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135110',0,'334 - 1% Enajenación de derechos representativos de capital y otros derechos no cotizados en bolsa ecuatoriana',0,23,318,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135111',0,'336 - 0.002% Por venta de combustibles a comercializadoras',0,23,319,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135112',0,'337 - 0.003% Por venta de combustibles a distribuidores',0,23,320,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135114',0,'338 - 2% Compra local de banano a productor',0,23,321,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135115',0,'339 - 100%  Liquidación impuesto único a la venta local de banano de producción propia',0,23,322,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135116',0,'343B - 1% Por actividades de construcción de obra material inmueble, urbanización, lotización o actividades similares',0,23,323,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135117',0,'344A - 2% Pago local tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo RECAP',0,23,324,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135118',0,'346A - 10% Ganancias de capital',0,23,325,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135119',0,'347 - 2% Donaciones en dinero -Impuesto a la donaciones',0,23,326,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135120',0,'348 - 10% Retención a cargo del propio sujeto pasivo por la exportación de concentrados y/o elementos metálicos',0,23,327,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135121',0,'349 - 0% Retención a cargo del propio sujeto pasivo por la comercialización de productos forestales',0,23,328,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135122',0,'500 - 22% Pago al exterior - Rentas Inmobiliarias',0,23,329,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135123',0,'501 - 22% Pago al exterior - Beneficios Empresariales',0,23,330,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135124',0,'502 - 22% Pago al exterior - Servicios Empresariales',0,23,331,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135127',0,'503 - 22% Pago al exterior - Navegación Marítima y/o aérea',0,23,332,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135128',0,'504 - 0% Pago al exterior- Dividendos distribuidos a personas naturales',0,23,333,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135129',0,'504B - 22% Pago al exterior - Anticipo dividendos (excepto paraísos fiscales o de régimen de menor imposición)',0,23,334,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135130',0,'504C - 22% Pago al exterior - Dividendos anticipados préstamos accionistas, beneficiarios o partìcipes (paraísos fiscales o regímenes de menor imposición)',0,23,335,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135131',0,'504A - 0% Pago al exterior - Dividendos a sociedades',0,23,336,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135132',0,'504D - 0% Pago al exterior - Dividendos a fideicomisos',0,23,337,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135134',0,'504F - 0% Pago al exterior - Dividendos a sociedades  (paraísos fiscales)',0,23,338,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135135',0,'504G - 0% Pago al exterior - Anticipo dividendos  (paraísos fiscales)',0,23,339,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135136',0,'504H - 13% Pago al exterior - Dividendos a fideicomisos  (paraísos fiscales)',0,23,340,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135137',0,'505 - 22% Pago al exterior - Rendimientos financieros',0,23,341,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2135','USD','2018',NULL,'2135999',0,'Retenciones acumuladas de RENTA compras',0,23,342,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2136','USD','2018',NULL,'2136001',0,'Iess por Pagar',0,24,343,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2136','USD','2018',NULL,'2136002',0,'Fondo de Reserva por Pagar',0,24,344,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2136','USD','2018',NULL,'2136003',0,'Préstamo Quirografarios',0,24,345,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2136','USD','2018',NULL,'2136004',0,'Préstamo Hipotecarios',0,24,346,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2211','USD','2018',NULL,'2211001',0,'Obligación Bancarias Largo Plazo',0,25,347,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('311','USD','2018',NULL,'3110001',0,'Capital Suscrito',0,26,348,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('311','USD','2018',NULL,'3110002',0,'Capital Pagado',0,26,349,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('312','USD','2018',NULL,'3120001',0,'Aporte Capital 1',0,27,350,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('313','USD','2018',NULL,'3130001',0,'Reserva Legal',0,28,351,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('313','USD','2018',NULL,'3130002',0,'Reserva Facultativa',0,28,352,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('331','USD','2018',NULL,'3310001',0,'Utilidades Retenidas',0,29,353,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('332','USD','2018',NULL,'3320001',0,'Resultado del Ejercicio',0,30,354,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('411','USD','2018',NULL,'4110001',0,'Ventas Productos',0,31,355,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('4121','USD','2018',NULL,'4121001',0,'Ventas Productos',0,32,356,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('4121','USD','2018',NULL,'4121002',0,'Ventas otros',0,32,357,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('4122','USD','2018',NULL,'4122001',0,'Descuento en Ventas',0,33,358,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('4122','USD','2018',NULL,'4122002',0,'Devolución Ventas',0,33,359,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('4123','USD','2018',NULL,'4123001',0,'OTROS INGRESOS OPERACIONES',0,34,360,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('421','USD','2018',NULL,'4210001',0,'Otros Ingresos',0,35,361,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('511','USD','2018',NULL,'5110001',0,'Costos de materia prima',0,36,362,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120001',0,'Costo Sueldos y Salarios',0,37,363,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120002',0,'Costo horas extras',0,37,364,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120003',0,'Costo Días completos',0,37,365,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120004',0,'Costo Fondo Reserva Iess',0,37,366,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120005',0,'Costo Eventos',0,37,367,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120006',0,'Costo Décimo Tercero',0,37,368,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120007',0,'Costo Décimo Cuarto',0,37,369,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120008',0,'Costo acuerdos de sueldo',0,37,370,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120009',0,'Costo Aporte Patronal IESS',0,37,371,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120010',0,'Costo Alimentación',0,37,372,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120011',0,'Costo Bonos',0,37,373,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120012',0,'Costo días pendientes',0,37,374,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120013',0,'Costo seguros de vida medio tiempo',0,37,375,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120014',0,'Costo Uniformes',0,37,376,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120015',0,'Costo Liquidaciones',0,37,377,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120016',0,'Costo personal en ldc',0,37,378,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120017',0,'Costos Servicios Ocasionales',0,37,379,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120018',0,'Costo capacitación',0,37,380,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('512','USD','2018',NULL,'5120019',0,'Costos Servicios Médicos Empleados',0,37,381,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130001',0,'Costo Arriendo',0,38,382,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130002',0,'Costo Arriendo Software',0,38,383,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130003',0,'Costo mantenimiento sistemas',0,38,384,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130004',0,'Costo servicios legales',0,38,385,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130005',0,'Costo Fletes',0,38,386,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130006',0,'Costo Combustibles y lubricantes',0,38,387,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130007',0,'Costo Luz',0,38,388,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130008',0,'Costo Teléfono',0,38,389,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130009',0,'Costo Agua',0,38,390,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130010',0,'Costo Internet',0,38,391,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130011',0,'Costo Suministros',0,38,392,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130012',0,'Costo Imprenta',0,38,393,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130013',0,'Costo mantenimiento computación',0,38,394,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130014',0,'Costo mantenimiento equipos fríos',0,38,395,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130015',0,'Costo gas',0,38,396,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130016',0,'Costo Vigilancia Privada',0,38,397,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130017',0,'Costo Transporte y movilización',0,38,398,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130018',0,'Costo Depreciaciones',0,38,399,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130019',0,'Costo Impuestos y Contribuyente',0,38,400,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('513','USD','2018',NULL,'5130020',0,'Costos Menores',0,38,401,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110001',0,'GA Gastos Sueldos y Salarios',0,39,402,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110002',0,'GA Horas Extras',0,39,403,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110003',0,'GA Días completos',0,39,404,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110004',0,'GA Gasto Fondo Reserva IESS',0,39,405,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110005',0,'GA Eventos',0,39,406,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110006',0,'GA Décimo Tercero',0,39,407,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110007',0,'GA Décimo Cuarto',0,39,408,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110008',0,'GA acuerdos de sueldo',0,39,409,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110009',0,'GA Aporte Patronal IESS',0,39,410,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110010',0,'GA Alimentación',0,39,411,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110011',0,'GA Bonos',0,39,412,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110012',0,'GA días pendientes',0,39,413,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110013',0,'GA seguro de vida medio tiempo',0,39,414,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110014',0,'GA Uniformes',0,39,415,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110015',0,'GA Gastos Liquidaciones',0,39,416,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110016',0,'GA personal en ldc',0,39,417,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110017',0,'GA Servicios Ocasionales',0,39,418,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110018',0,'GA capacitación',0,39,419,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('611','USD','2018',NULL,'6110099',0,'Otros Menores',0,39,420,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120001',0,'GA Arriendo oficina',0,40,421,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120002',0,'GA gasto empleados',0,40,422,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120003',0,'GA de terceros',0,40,423,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120004',0,'GA servicios básicos',0,40,424,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120005',0,'GA gas',0,40,425,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120006',0,'GA gastos varios',0,40,426,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120007',0,'GA SRI retenciones',0,40,427,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120008',0,'GA IVA',0,40,428,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120009',0,'GA nutricionista',0,40,429,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120010',0,'GA depreciación',0,40,430,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120011',0,'GA soporte técnico computarizado',0,40,431,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120012',0,'GA publicidad',0,40,432,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120013',0,'GA asesoría legal',0,40,433,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120014',0,'GA vacaciones finiquitos',0,40,434,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120015',0,'GA Vigilancia Privada',0,40,435,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120016',0,'GA Mantenimiento y Limpieza',0,40,436,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120017',0,'GA Servicios Contables',0,40,437,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120018',0,'GA Honorarios',0,40,438,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120019',0,'GA Combustibles y Lubricantes',0,40,439,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120020',0,'GA Útiles Oficina y Suministros',0,40,440,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120021',0,'GA Internet, correo, otros',0,40,441,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120022',0,'GA Suscripciones y Publicaciones',0,40,442,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120023',0,'GA Impuestos, tasa y otros',0,40,443,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120024',0,'GA Cuentas Incobrables',0,40,444,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120025',0,'GA Perdida en venta de activos',0,40,445,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120026',0,'GA Gasto Imp a la renta',0,40,446,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120027',0,'GA Gasto 15% participación trabajadores',0,40,447,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120028',0,'GA Mantenimiento vehículos',0,40,448,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120029',0,'GA No deducibles',0,40,449,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120030',0,'GA fletes',0,40,450,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120031',0,'GA Gastos Médicos Empleados',0,40,451,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120032',0,'GA Mantenimiento vehículos',0,40,452,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120033',0,'GA No deducibles',0,40,453,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120034',0,'GA Perdida por Robo Locales',0,40,454,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120035',0,'GA Gastos Médicos Empleados',0,40,455,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120036',0,'GA telefonía celular',0,40,456,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120037',0,'GA material mal estado',0,40,457,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120038',0,'GA material mal estado',0,40,458,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120039',0,'Gasto IVA',0,40,459,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('612','USD','2018',NULL,'6120099',0,'Gastos Menores',0,40,460,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210001',0,'GV Gastos Sueldos y Salarios',0,41,461,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210002',0,'GV Horas Extras',0,41,462,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210003',0,'GV Días completos',0,41,463,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210004',0,'GV Gasto Fondo Reserva IESS',0,41,464,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210005',0,'GV Eventos',0,41,465,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210006',0,'GV Décimo Tercero',0,41,466,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210007',0,'GV Décimo Cuarto',0,41,467,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210008',0,'GV acuerdos de sueldo',0,41,468,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210009',0,'GV Aporte Patronal IESS',0,41,469,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210010',0,'GV Alimentación',0,41,470,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210011',0,'GV Bonos',0,41,471,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210012',0,'GV días pendientes',0,41,472,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210013',0,'GV seguro de vida medio tiempo',0,41,473,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210014',0,'GV Uniformes',0,41,474,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210015',0,'GV Gastos Liquidaciones',0,41,475,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210016',0,'GV personal en ldc',0,41,476,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210017',0,'GV Servicios Ocasionales',0,41,477,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210018',0,'GV capacitación',0,41,478,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('621','USD','2018',NULL,'6210099',0,'GV Otros Menores',0,41,479,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220001',0,'GV Arriendo Locales',0,42,480,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220002',0,'GV Servicios Básicos Luz, Agua y Teléfono',0,42,481,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220003',0,'GV Vigilancia Privada',0,42,482,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220004',0,'GV Mantenimiento y Limpieza',0,42,483,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220005',0,'GV Servicios Contables',0,42,484,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220006',0,'GV Honorarios',0,42,485,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220007',0,'GV Combustibles y Lubricantes',0,42,486,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220008',0,'GV Seguros Contratados',0,42,487,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220009',0,'GV Útiles Oficina y Suministros',0,42,488,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220010',0,'GV Internet, correo, otros',0,42,489,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220011',0,'GV Suscripciones y Publicaciones',0,42,490,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220012',0,'GV Impuestos, tasa y otros',0,42,491,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220013',0,'GV Depreciaciones',0,42,492,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220014',0,'GV Amortizaciones',0,42,493,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220015',0,'GV Cuentas Incobrables',0,42,494,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220016',0,'GV Perdida en venta de activos',0,42,495,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220017',0,'GV Gasto Impuesto a la renta',0,42,496,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220018',0,'GV Gasto 15% participación trabajadores',0,42,497,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220019',0,'GV Mantenimiento vehículos',0,42,498,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220020',0,'GV No deducibles',0,42,499,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220021',0,'GV Perdida por Robo Locales',0,42,500,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220022',0,'GV Gastos Médicos Empleados',0,42,501,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('622','USD','2018',NULL,'6220099',0,'GV Gastos Menores',0,42,502,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('631','USD','2018',NULL,'6310001',0,'Gastos y Comisiones Bancarias',0,43,503,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('631','USD','2018',NULL,'6310002',0,'Intereses Entidades Financieras',0,43,504,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('631','USD','2018',NULL,'6310003',0,'Multas',0,43,505,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('631','USD','2018',NULL,'6310004',0,'Préstamo capital',0,43,506,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('631','USD','2018',NULL,'6310005',0,'Movimientos bancarios',0,43,507,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('2121','USD','2018',NULL,'2121001',0,'CARRION TORRES JIMMY HOMERO',0,18,508,0,0,0);
insert  into `co_subcuentas`(`codcuenta`,`coddivisa`,`codejercicio`,`codimpuesto`,`codsubcuenta`,`debe`,`descripcion`,`haber`,`idcuenta`,`idsubcuenta`,`iva`,`recargo`,`saldo`) values ('1121','USD','2018',NULL,'1121002',0,'MIGUEL GETIAL',0,5,509,0,0,0);

/*Table structure for table `co_subcuentascli` */

DROP TABLE IF EXISTS `co_subcuentascli`;

CREATE TABLE `co_subcuentascli` (
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_co_subcuentascli_ejercicios` (`codejercicio`),
  KEY `ca_co_subcuentascli_clientes` (`codcliente`),
  KEY `ca_co_subcuentascli_subcuentas` (`idsubcuenta`),
  CONSTRAINT `ca_co_subcuentascli_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentascli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentascli_subcuentas` FOREIGN KEY (`idsubcuenta`) REFERENCES `co_subcuentas` (`idsubcuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_subcuentascli` */

insert  into `co_subcuentascli`(`codcliente`,`codejercicio`,`codsubcuenta`,`id`,`idsubcuenta`) values ('000001','2018','1121001',1,5);
insert  into `co_subcuentascli`(`codcliente`,`codejercicio`,`codsubcuenta`,`id`,`idsubcuenta`) values ('000002','2018','1121002',2,509);

/*Table structure for table `co_subcuentasprov` */

DROP TABLE IF EXISTS `co_subcuentasprov`;

CREATE TABLE `co_subcuentasprov` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsubcuenta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_co_subcuentasprov_ejercicios` (`codejercicio`),
  KEY `ca_co_subcuentasprov_proveedores` (`codproveedor`),
  KEY `ca_co_subcuentasprov_subcuentas` (`idsubcuenta`),
  CONSTRAINT `ca_co_subcuentasprov_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentasprov_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_co_subcuentasprov_subcuentas` FOREIGN KEY (`idsubcuenta`) REFERENCES `co_subcuentas` (`idsubcuenta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `co_subcuentasprov` */

insert  into `co_subcuentasprov`(`codejercicio`,`codproveedor`,`codsubcuenta`,`id`,`idsubcuenta`) values ('2018','000001','2121001',1,508);

/*Table structure for table `contratoservicioscli` */

DROP TABLE IF EXISTS `contratoservicioscli`;

CREATE TABLE `contratoservicioscli` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `fecha_renovacion` date NOT NULL,
  `observaciones` text COLLATE utf8_bin,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `importe_anual` double DEFAULT NULL,
  `periodo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fsiguiente_servicio` date DEFAULT NULL,
  PRIMARY KEY (`idcontrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `contratoservicioscli` */

/*Table structure for table `cuentasbanco` */

DROP TABLE IF EXISTS `cuentasbanco`;

CREATE TABLE `cuentasbanco` (
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `swift` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codcuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cuentasbanco` */

insert  into `cuentasbanco`(`codsubcuenta`,`descripcion`,`iban`,`codcuenta`,`swift`) values ('1113001','PICHINCHA','2390021227001','1','');

/*Table structure for table `cuentasbcocli` */

DROP TABLE IF EXISTS `cuentasbcocli`;

CREATE TABLE `cuentasbcocli` (
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `swift` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `ctaentidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `agencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `entidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `ctaagencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `cuenta` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  `fmandato` date DEFAULT NULL,
  PRIMARY KEY (`codcuenta`),
  KEY `ca_cuentasbcocli_clientes` (`codcliente`),
  CONSTRAINT `ca_cuentasbcocli_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cuentasbcocli` */

/*Table structure for table `cuentasbcopro` */

DROP TABLE IF EXISTS `cuentasbcopro`;

CREATE TABLE `cuentasbcopro` (
  `agencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `ctaagencia` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `ctaentidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `cuenta` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `entidad` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(34) COLLATE utf8_bin DEFAULT NULL,
  `swift` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codcuenta`),
  KEY `ca_cuentasbcopro_proveedores` (`codproveedor`),
  CONSTRAINT `ca_cuentasbcopro_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `cuentasbcopro` */

insert  into `cuentasbcopro`(`agencia`,`codcuenta`,`codproveedor`,`ctaagencia`,`ctaentidad`,`cuenta`,`descripcion`,`entidad`,`iban`,`swift`,`principal`) values (NULL,'1','000001',NULL,NULL,NULL,'PICHINCHA',NULL,'2390021227001','',1);

/*Table structure for table `detalles_servicios` */

DROP TABLE IF EXISTS `detalles_servicios`;

CREATE TABLE `detalles_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8_bin NOT NULL,
  `idservicio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `nick` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_detalle_servicio` (`idservicio`),
  CONSTRAINT `ca_detalle_servicio` FOREIGN KEY (`idservicio`) REFERENCES `servicioscli` (`idservicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `detalles_servicios` */

insert  into `detalles_servicios`(`id`,`descripcion`,`idservicio`,`fecha`,`hora`,`nick`) values (1,'kkk',1,'2018-10-28','22:20:00','admin');

/*Table structure for table `dirclientes` */

DROP TABLE IF EXISTS `dirclientes`;

CREATE TABLE `dirclientes` (
  `codcliente` varchar(6) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `domenvio` tinyint(1) DEFAULT NULL,
  `domfacturacion` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_dirclientes_clientes` (`codcliente`),
  CONSTRAINT `ca_dirclientes_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`codcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `dirclientes` */

insert  into `dirclientes`(`codcliente`,`codpais`,`apartado`,`idprovincia`,`provincia`,`ciudad`,`codpostal`,`direccion`,`domenvio`,`domfacturacion`,`descripcion`,`id`,`fecha`) values ('000001','ECU','',NULL,'SANTO DOMINGO','SANTO DOMING','','C/',1,1,'Principal',1,'2018-10-28');
insert  into `dirclientes`(`codcliente`,`codpais`,`apartado`,`idprovincia`,`provincia`,`ciudad`,`codpostal`,`direccion`,`domenvio`,`domfacturacion`,`descripcion`,`id`,`fecha`) values ('000002','ECU','',NULL,'SANTO DOMINGO','SANTO DOMING','','C/',1,1,'Principal',2,'2018-10-29');

/*Table structure for table `dirproveedores` */

DROP TABLE IF EXISTS `dirproveedores`;

CREATE TABLE `dirproveedores` (
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `direccionppal` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_dirproveedores_proveedores` (`codproveedor`),
  CONSTRAINT `ca_dirproveedores_proveedores` FOREIGN KEY (`codproveedor`) REFERENCES `proveedores` (`codproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `dirproveedores` */

insert  into `dirproveedores`(`codproveedor`,`codpais`,`apartado`,`idprovincia`,`provincia`,`ciudad`,`codpostal`,`direccion`,`direccionppal`,`descripcion`,`id`,`fecha`) values ('000001','ECU','',NULL,'SANTO DOMING','SANTO DOMING','','SAN MIGUEL Y QUITP',1,'Principal',1,'2018-10-28');

/*Table structure for table `divisas` */

DROP TABLE IF EXISTS `divisas`;

CREATE TABLE `divisas` (
  `bandera` text COLLATE utf8_bin,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codiso` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `simbolo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `tasaconv_compra` double DEFAULT NULL,
  PRIMARY KEY (`coddivisa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `divisas` */

insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'ARS','32','PESOS (ARG)',NULL,'AR$',16.684,16.684);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'CLP','152','PESOS (CLP)',NULL,'CLP$',704.0227,704.0227);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'COP','170','PESOS (COP)',NULL,'CO$',3140.6803,3140.6803);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'DOP','214','PESOS DOMINICANOS',NULL,'RD$',49.7618,49.7618);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'EUR','978','EUROS',NULL,'€',1,1);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'GBP','826','LIBRAS ESTERLINAS',NULL,'£',0.865,0.865);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'HTG','322','GOURDES',NULL,'G',72.0869,72.0869);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'MXN','484','PESOS (MXN)',NULL,'MX$',23.3678,23.3678);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'PAB','590','BALBOAS',NULL,'B',1.128,1.128);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'PEN','604','SOLES',NULL,'S/',3.736,3.736);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'PYG','4217','GUARANÍ',NULL,'Gs',6750,6750);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'USD','840','DÓLARES EE.UU.',NULL,'$',1.129,1.129);
insert  into `divisas`(`bandera`,`coddivisa`,`codiso`,`descripcion`,`fecha`,`simbolo`,`tasaconv`,`tasaconv_compra`) values (NULL,'VEF','937','BOLÍVARES',NULL,'Bs',10.6492,10.6492);

/*Table structure for table `documentosfac` */

DROP TABLE IF EXISTS `documentosfac`;

CREATE TABLE `documentosfac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruta` varchar(300) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(250) COLLATE utf8_bin NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT '00:00:00',
  `tamano` int(11) DEFAULT NULL,
  `usuario` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `idalbaran` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `idpresupuesto` int(11) DEFAULT NULL,
  `idservicio` int(11) DEFAULT NULL,
  `idfacturaprov` int(11) DEFAULT NULL,
  `idalbaranprov` int(11) DEFAULT NULL,
  `idpedidoprov` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `documentosfac` */

/*Table structure for table `ejercicios` */

DROP TABLE IF EXISTS `ejercicios`;

CREATE TABLE `ejercicios` (
  `idasientocierre` int(11) DEFAULT NULL,
  `idasientopyg` int(11) DEFAULT NULL,
  `idasientoapertura` int(11) DEFAULT NULL,
  `plancontable` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `longsubcuenta` int(11) DEFAULT NULL,
  `estado` varchar(15) COLLATE utf8_bin NOT NULL,
  `fechafin` date NOT NULL,
  `fechainicio` date NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ejercicios` */

insert  into `ejercicios`(`idasientocierre`,`idasientopyg`,`idasientoapertura`,`plancontable`,`longsubcuenta`,`estado`,`fechafin`,`fechainicio`,`nombre`,`codejercicio`) values (NULL,NULL,NULL,'08',7,'ABIERTO','2018-12-31','2018-01-01','2018','2018');

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `administrador` varchar(100) COLLATE utf8_bin NOT NULL,
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcuentarem` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codedi` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `contintegrada` tinyint(1) DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `horario` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idprovincia` int(11) DEFAULT NULL,
  `xid` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `lema` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `logo` text COLLATE utf8_bin,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `nombrecorto` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pie_factura` text COLLATE utf8_bin,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recequivalencia` tinyint(1) DEFAULT NULL,
  `stockpedidos` tinyint(1) DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `web` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `inicioact` date DEFAULT NULL,
  `regimeniva` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `empresa` */

insert  into `empresa`(`administrador`,`apartado`,`cifnif`,`ciudad`,`codalmacen`,`codcuentarem`,`coddivisa`,`codedi`,`codejercicio`,`codpago`,`codpais`,`codpostal`,`codserie`,`contintegrada`,`direccion`,`email`,`fax`,`horario`,`id`,`idprovincia`,`xid`,`lema`,`logo`,`nombre`,`nombrecorto`,`pie_factura`,`provincia`,`recequivalencia`,`stockpedidos`,`telefono`,`web`,`inicioact`,`regimeniva`) values ('','','1722239967001','SANTO DOMING','ALG',NULL,'USD',NULL,'2018','CONT','ECU','593','A',1,'Calle San Miguel y Av Quito','ventas.compueconomia@gmail.com','','08:30-18:00',1,NULL,'9Bv5XSc8wOUTfzJjpsH7Yt6VAR4aue','De todo y más barato',NULL,'CARRION TORRES JIMMY HOMERO','COMEC','Gracias por Preferirnos','SANTO DOMINGO',0,0,'0992669329','https://www.compueconomia.com.ec','1970-01-01',NULL);

/*Table structure for table `estados_servicios` */

DROP TABLE IF EXISTS `estados_servicios`;

CREATE TABLE `estados_servicios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(6) COLLATE utf8_bin NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `albaran` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `estados_servicios` */

insert  into `estados_servicios`(`id`,`descripcion`,`color`,`activo`,`albaran`) values (1,'Pendiente','FFFBD9',1,0);
insert  into `estados_servicios`(`id`,`descripcion`,`color`,`activo`,`albaran`) values (2,'En proceso','D9EDF7',1,0);
insert  into `estados_servicios`(`id`,`descripcion`,`color`,`activo`,`albaran`) values (100,'Terminado','DFF0D8',0,1);

/*Table structure for table `fabricantes` */

DROP TABLE IF EXISTS `fabricantes`;

CREATE TABLE `fabricantes` (
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `codfabricante` varchar(8) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codfabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fabricantes` */

insert  into `fabricantes`(`nombre`,`codfabricante`) values ('OEM','OEM');

/*Table structure for table `facturascli` */

DROP TABLE IF EXISTS `facturascli`;

CREATE TABLE `facturascli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `automatica` tinyint(1) DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codigorect` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `deabono` tinyint(1) DEFAULT '0',
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `editable` tinyint(1) DEFAULT '0',
  `fecha` date NOT NULL,
  `vencimiento` date DEFAULT NULL,
  `femail` date DEFAULT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idasiento` int(11) DEFAULT NULL,
  `idasientop` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idfacturarect` int(11) DEFAULT NULL,
  `idpagodevol` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `netosindto` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nogenerarasiento` tinyint(1) DEFAULT NULL,
  `nombrecliente` varchar(100) COLLATE utf8_bin NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `pagada` tinyint(1) NOT NULL DEFAULT '0',
  `anulada` tinyint(1) NOT NULL DEFAULT '0',
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double DEFAULT NULL,
  `tpv` tinyint(1) DEFAULT NULL,
  `codtrans` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codigoenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nombreenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `apellidosenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `direccionenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostalenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ciudadenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `provinciaenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apartadoenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpaisenv` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `idimprenta` int(11) DEFAULT NULL,
  `numdocs` int(11) DEFAULT '0',
  `dtopor1` double NOT NULL DEFAULT '0',
  `dtopor2` double NOT NULL DEFAULT '0',
  `dtopor3` double NOT NULL DEFAULT '0',
  `dtopor4` double NOT NULL DEFAULT '0',
  `dtopor5` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idfactura`),
  UNIQUE KEY `uniq_codigo_facturascli` (`codigo`),
  KEY `ca_facturascli_series2` (`codserie`),
  KEY `ca_facturascli_ejercicios2` (`codejercicio`),
  KEY `ca_facturascli_asiento2` (`idasiento`),
  KEY `ca_facturascli_asientop` (`idasientop`),
  CONSTRAINT `ca_facturascli_asiento2` FOREIGN KEY (`idasiento`) REFERENCES `co_asientos` (`idasiento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_facturascli_asientop` FOREIGN KEY (`idasientop`) REFERENCES `co_asientos` (`idasiento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_facturascli_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_facturascli_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `facturascli` */

/*Table structure for table `facturasprov` */

DROP TABLE IF EXISTS `facturasprov`;

CREATE TABLE `facturasprov` (
  `automatica` tinyint(1) DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codigorect` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `deabono` tinyint(1) DEFAULT '0',
  `editable` tinyint(1) DEFAULT '0',
  `fecha` date NOT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idasiento` int(11) DEFAULT NULL,
  `idasientop` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idfacturarect` int(11) DEFAULT NULL,
  `idpagodevol` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `neto` double DEFAULT NULL,
  `nogenerarasiento` tinyint(1) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numproveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `pagada` tinyint(1) NOT NULL DEFAULT '0',
  `anulada` tinyint(1) NOT NULL DEFAULT '0',
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double DEFAULT NULL,
  `totaleuros` double DEFAULT NULL,
  `totalirpf` double DEFAULT NULL,
  `totaliva` double DEFAULT NULL,
  `totalrecargo` double DEFAULT NULL,
  `numdocs` int(11) DEFAULT '0',
  PRIMARY KEY (`idfactura`),
  UNIQUE KEY `uniq_codigo_facturasprov` (`codigo`),
  KEY `ca_facturasprov_series2` (`codserie`),
  KEY `ca_facturasprov_ejercicios2` (`codejercicio`),
  KEY `ca_facturasprov_asiento2` (`idasiento`),
  KEY `ca_facturasprov_asientop` (`idasientop`),
  CONSTRAINT `ca_facturasprov_asiento2` FOREIGN KEY (`idasiento`) REFERENCES `co_asientos` (`idasiento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_facturasprov_asientop` FOREIGN KEY (`idasientop`) REFERENCES `co_asientos` (`idasiento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_facturasprov_ejercicios2` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_facturasprov_series2` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `facturasprov` */

/*Table structure for table `familias` */

DROP TABLE IF EXISTS `familias`;

CREATE TABLE `familias` (
  `descripcion` varchar(100) COLLATE utf8_bin NOT NULL,
  `codfamilia` varchar(8) COLLATE utf8_bin NOT NULL,
  `madre` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codfamilia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `familias` */

insert  into `familias`(`descripcion`,`codfamilia`,`madre`) values ('VARIOS','VARI',NULL);

/*Table structure for table `formaspago` */

DROP TABLE IF EXISTS `formaspago`;

CREATE TABLE `formaspago` (
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `genrecibos` varchar(10) COLLATE utf8_bin NOT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `domiciliado` tinyint(1) DEFAULT NULL,
  `imprimir` tinyint(1) DEFAULT '1',
  `vencimiento` varchar(20) COLLATE utf8_bin DEFAULT '+1month',
  PRIMARY KEY (`codpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `formaspago` */

insert  into `formaspago`(`codpago`,`descripcion`,`genrecibos`,`codcuenta`,`domiciliado`,`imprimir`,`vencimiento`) values ('CONT','Al contado','Pagados',NULL,0,1,'+0day');
insert  into `formaspago`(`codpago`,`descripcion`,`genrecibos`,`codcuenta`,`domiciliado`,`imprimir`,`vencimiento`) values ('CREDITO','CREDITO 30 DIAS','Emitidos',NULL,0,1,'+1month');
insert  into `formaspago`(`codpago`,`descripcion`,`genrecibos`,`codcuenta`,`domiciliado`,`imprimir`,`vencimiento`) values ('PAYPAL','PayPal','Pagados',NULL,0,1,'+0day');
insert  into `formaspago`(`codpago`,`descripcion`,`genrecibos`,`codcuenta`,`domiciliado`,`imprimir`,`vencimiento`) values ('TARJETA','Tarjeta de crédito','Pagados',NULL,0,1,'+0day');
insert  into `formaspago`(`codpago`,`descripcion`,`genrecibos`,`codcuenta`,`domiciliado`,`imprimir`,`vencimiento`) values ('TRANS','Transferencia bancaria','Emitidos',NULL,0,1,'+1month');

/*Table structure for table `fs_access` */

DROP TABLE IF EXISTS `fs_access`;

CREATE TABLE `fs_access` (
  `fs_user` varchar(12) COLLATE utf8_bin NOT NULL,
  `fs_page` varchar(30) COLLATE utf8_bin NOT NULL,
  `allow_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fs_user`,`fs_page`),
  KEY `fs_access_page2` (`fs_page`),
  CONSTRAINT `fs_access_page2` FOREIGN KEY (`fs_page`) REFERENCES `fs_pages` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fs_access_user2` FOREIGN KEY (`fs_user`) REFERENCES `fs_users` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_access` */

insert  into `fs_access`(`fs_user`,`fs_page`,`allow_delete`) values ('kevin','tpv_caja',1);
insert  into `fs_access`(`fs_user`,`fs_page`,`allow_delete`) values ('kevin','tpv_recambios',1);

/*Table structure for table `fs_extensions2` */

DROP TABLE IF EXISTS `fs_extensions2`;

CREATE TABLE `fs_extensions2` (
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `page_from` varchar(30) COLLATE utf8_bin NOT NULL,
  `page_to` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `text` text COLLATE utf8_bin,
  `params` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`name`,`page_from`),
  KEY `ca_fs_extensions2_fs_pages` (`page_from`),
  CONSTRAINT `ca_fs_extensions2_fs_pages` FOREIGN KEY (`page_from`) REFERENCES `fs_pages` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_extensions2` */

insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('agrupar_albaranes','compras_agrupar_albaranes','compras_albaranes','button','<span class=\"glyphicon glyphicon-duplicate\"></span><span class=\"hidden-xs\">&nbsp; Agrupar</span>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('agrupar_albaranes','ventas_agrupar_albaranes','ventas_albaranes','button','<span class=\"glyphicon glyphicon-duplicate\"></span><span class=\"hidden-xs\">&nbsp; Agrupar</span>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaran_ticket_print_job','print_to_ticket','ventas_albaran','modal','<i class=\"fa fa-print\" aria-hidden=\"true\"></i><span class=\"hidden-xs\">&nbsp; Ticket</span>','&tipo=albaran');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaranes_agente','compras_albaranes','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Guias de Remision de proveedor','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaranes_agente','ventas_albaranes','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Guias de Remision de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaranes_articulo','compras_albaranes','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Guias de Remision de proveedor','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaranes_articulo','ventas_albaranes','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Guias de Remision de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaranes_cliente','ventas_albaranes','ventas_cliente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Guias de Remision','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('albaranes_proveedor','compras_albaranes','compras_proveedor','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Guias de Remision','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('api_remote_printer','tpv_recambios',NULL,'api','remote_printer',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('articulo_subcuentas','articulo_subcuentas','ventas_articulo','tab','<span class=\"glyphicon glyphicon-book\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Subcuentas</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('articulos_pedidos_compras','articulos_pedidos','compras_pedidos','button','<span class=\"glyphicon glyphicon-tasks\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Artículos</span>','&compras=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('articulos_pedidos_ventas','articulos_pedidos','ventas_pedidos','button','<span class=\"glyphicon glyphicon-tasks\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Artículos</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_albaran','beneficios','ventas_albaran','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_albaranes','beneficios','ventas_albaranes','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_editar_factura','beneficios','editar_factura','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_factura','beneficios','ventas_factura','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_facturas','beneficios','ventas_facturas','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_nueva_venta','beneficios','nueva_venta','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_pedido','beneficios','ventas_pedido','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_pedidos','beneficios','ventas_pedidos','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_presupuesto','beneficios','ventas_presupuesto','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('beneficios_presupuestos','beneficios','ventas_presupuestos','head','<script type=\"text/javascript\" src=\"plugins/beneficios/view/js/beneficios.js\"></script>','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_albaran','compras_actualiza_arts','compras_albaran','tab','<span class=\"glyphicon glyphicon-share\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Actualizar</span>','&doc=albaran');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_atributos','ventas_atributos','ventas_articulos','button','<span class=\"glyphicon glyphicon-list-alt\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Atributos</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_balances','editar_balances','informe_contabilidad','button','<span class=\"glyphicon glyphicon-wrench\"></span><span class=\"hidden-xs\">&nbsp; Balances</a>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_fabricantes','ventas_fabricantes','ventas_articulos','button','<span class=\"glyphicon glyphicon-folder-open\" aria-hidden=\"true\"></span><span class=\"hidden-xs\"> &nbsp; Fabricantes</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_familias','ventas_familias','ventas_articulos','button','<span class=\"glyphicon glyphicon-folder-open\" aria-hidden=\"true\"></span><span class=\"hidden-xs\"> &nbsp; Familias</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_imprimir_continuo','impresion_tab_albaran','ventas_albaran','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Papel continuo','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_imprimir_continuo','impresion_tab_factura','ventas_factura','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Papel continuo',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_imprimir_continuo','impresion_tab_presupuesto','ventas_presupuesto','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Papel continuo','&presupuesto=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_pedido','compras_actualiza_arts','compras_pedido','tab','<span class=\"glyphicon glyphicon-share\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Actualizar</span>','&doc=pedido');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('btn_servicios','servicios_contratados','ventas_servicios','button','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Contratos</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_albaran','megacopiador','ventas_albaran','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><spanclass=\"hidden-xs\" >&nbsp; Copiar</span>','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_albaran','megacopiador_compras','compras_albaran','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span>&nbsp; Copiar</span>','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_articulo','megacopiador','ventas_articulo','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Copiar</span>','&articulo=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_factura','megacopiador','ventas_factura','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Copiar</span>','&factura=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_factura','megacopiador_compras','compras_factura','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span>&nbsp; Copiar</span>','&factura=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_pedido','megacopiador','ventas_pedido','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Copiar</span>','&pedido=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_pedido','megacopiador_compras','compras_pedido','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span>&nbsp; Copiar</span>','&pedido=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_presu','megacopiador','ventas_presupuesto','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Copiar</span>','&presu=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('copiar_servicio','megacopiador','ventas_servicio','button','<span class=\"glyphicon glyphicon-scissors\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Copiar</span>','&servicio=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('cosmo','admin_user','admin_user','css','view/css/bootstrap-cosmo.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('darkly','admin_user','admin_user','css','view/css/bootstrap-darkly.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_albaranescli','documentos','ventas_albaran','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=albaranescli');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_albaranesprov','documentos','compras_albaran','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=albaranesprov');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_facturascli','documentos','ventas_factura','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=facturascli');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_facturasprov','documentos','compras_factura','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=facturasprov');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_pedidoscli','documentos','ventas_pedido','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=pedidoscli');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_pedidosprov','documentos','compras_pedido','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=pedidosprov');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_presupuestoscli','documentos','ventas_presupuesto','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=presupuestoscli');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('documentos_servicioscli','documentos','ventas_servicio','tab','<span class=\"glyphicon glyphicon-file\" aria-hidden=\"true\" title=\"Documentos\"></span>','&folder=servicioscli');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_albaran','ventas_imprimir','ventas_albaran','email','Albarán simple','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_albaran_proveedor','compras_imprimir','compras_albaran','email','Guia de Remision simple','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_factura','ventas_imprimir','ventas_factura','email','Factura simple','&factura=TRUE&tipo=simple');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_pedido','imprimir_presu_pedi','ventas_pedido','email','Pedido simple','&pedido=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_pedido_proveedor','imprimir_presu_pedi','compras_pedido','email','Pedido simple','&pedido_p=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_presupuesto','imprimir_presu_pedi','ventas_presupuesto','email','Proforma simple','&presupuesto=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('email_servicio','imprimir_servicio','ventas_servicio','email','Servicio simple','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('enviar_sms_pedido','enviar_sms','ventas_pedido','modal','<span class=\"glyphicon glyphicon-phone\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; SMS</span>','&pedido=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('enviar_sms_servicio','enviar_sms','ventas_servicio','modal','<span class=\"glyphicon glyphicon-phone\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; SMS</span>','&servicio=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('factura_ticket_print_job','print_to_ticket','ventas_factura','modal','<i class=\"fa fa-print\" aria-hidden=\"true\"></i><span class=\"hidden-xs\">&nbsp; Ticket</span>','&tipo=factura');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('facturas_agente','compras_facturas','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas de proveedor','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('facturas_agente','ventas_facturas','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('facturas_articulo','compras_facturas','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas de proveedor','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('facturas_articulo','ventas_facturas','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('facturas_cliente','ventas_facturas','ventas_cliente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('facturas_proveedor','compras_facturas','compras_proveedor','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Facturas','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('flatly','admin_user','admin_user','css','view/css/bootstrap-flatly.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_albaran','ventas_imprimir','ventas_albaran','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Albarán simple','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_albaran_noval','ventas_imprimir','ventas_albaran','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Albarán sin valorar','&albaran=TRUE&noval=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_albaran_proveedor','compras_imprimir','compras_albaran','pdf','Guia de Remision simple','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_factura','ventas_imprimir','ventas_factura','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Factura simple','&factura=TRUE&tipo=simple');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_factura_carta','ventas_imprimir','ventas_factura','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Modelo carta','&factura=TRUE&tipo=carta');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_factura_proveedor','compras_imprimir','compras_factura','pdf','Factura simple','&factura=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_pedido','imprimir_presu_pedi','ventas_pedido','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Pedido simple','&pedido=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_pedido_noval','imprimir_presu_pedi','ventas_pedido','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Pedido simple sin valorar','&pedido=TRUE&noval=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_pedido_proveedor','imprimir_presu_pedi','compras_pedido','pdf','Pedido simple','&pedido_p=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_presupuesto','imprimir_presu_pedi','ventas_presupuesto','pdf','<span class=\"glyphicon glyphicon-print\"></span>&nbsp; Proforma simple','&presupuesto=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_servicio','imprimir_servicio','ventas_servicio','pdf','Servicio simple','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_servicio_sin_detalle','imprimir_rapido','ventas_servicio','pdf','Servicio sin líneas','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_servicio_sin_detalles_horizontal','imprimir_rapido_horizontal','ventas_servicio','pdf','2 Servicio sin líneas en 1 página','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('imprimir_ticket','imprimir_servicio_ticket','ventas_servicio','pdf','Ticket servicio',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('lumen','admin_user','admin_user','css','view/css/bootstrap-lumen.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('maquetar_albaran','ventas_maquetar','ventas_albaran','pdf','<i class=\"fa fa-magic\"></i>&nbsp; Maquetar','&albaran=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('maquetar_factura','ventas_maquetar','ventas_factura','pdf','<i class=\"fa fa-magic\"></i>&nbsp; Maquetar','&factura=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('maquetar_pedido','maquetar_presu_pedi','ventas_pedido','pdf','<i class=\"fa fa-magic\"></i>&nbsp; Maquetar','&pedido=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('maquetar_presu','maquetar_presu_pedi','ventas_presupuesto','pdf','<i class=\"fa fa-magic\"></i>&nbsp; Maquetar','&presu=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('minicron','servicios_contratados','ventas_servicios','minicron',NULL,'&minicron=TRUE');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('opciones_clientes','ventas_clientes_opciones','ventas_clientes','button','<span class=\"glyphicon glyphicon-wrench\" aria-hidden=\"true\" title=\"Opciones para nuevos clientes\"></span><span class=\"hidden-xs\">&nbsp; Opciones</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('opciones_servicios','opciones_servicios','ventas_servicios','button','<span class=\"glyphicon glyphicon-wrench\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Opciones</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('paper','admin_user','admin_user','css','view/css/bootstrap-paper.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedido_ticket_print_job','print_to_ticket','ventas_pedido','modal','<i class=\"fa fa-print\" aria-hidden=\"true\"></i><span class=\"hidden-xs\">&nbsp; Ticket</span>','&tipo=pedido');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedidos_agente','compras_pedidos','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Pedidos a proveedor','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedidos_agente','ventas_pedidos','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Pedidos de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedidos_articulo','compras_pedidos','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Pedidos a proveedor','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedidos_articulo','ventas_pedidos','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Pedidos de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedidos_cliente','ventas_pedidos','ventas_cliente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Pedidos','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('pedidos_proveedor','compras_pedidos','compras_proveedor','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Pedidos','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('plan_ecuador','admin_ecuador','contabilidad_ejercicio','fuente','Plan contable de Ecuador','plugins/ecuador/extras/ecuador.xml');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('presupuesto_ticket_print_job','print_to_ticket','ventas_presupuesto','modal','<i class=\"fa fa-print\" aria-hidden=\"true\"></i><span class=\"hidden-xs\">&nbsp; Ticket</span>','&tipo=presupuesto');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('presupuestos_agente','ventas_presupuestos','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Proformas de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('presupuestos_articulo','ventas_presupuestos','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Proformas de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('presupuestos_cliente','ventas_presupuestos','ventas_cliente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Proformas','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('sandstone','admin_user','admin_user','css','view/css/bootstrap-sandstone.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('servicio_ticket_print_job','print_to_ticket','ventas_servicio','modal','<i class=\"fa fa-print\" aria-hidden=\"true\"></i><span class=\"hidden-xs\">&nbsp; Ticket</span>','&tipo=servicio');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('servicios_agente','ventas_servicios','admin_agente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Servicio de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('servicios_articulo','ventas_servicios','ventas_articulo','tab_button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Servicio de cliente','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('servicios_cliente','ventas_servicios','ventas_cliente','button','<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> &nbsp; Servicio','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('simplex','admin_user','admin_user','css','view/css/bootstrap-simplex.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('spacelab','admin_user','admin_user','css','view/css/bootstrap-spacelab.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('tab_devoluciones','compras_factura_devolucion','compras_factura','tab','<span class=\"glyphicon glyphicon-share\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Devoluciones</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('tab_devoluciones','ventas_factura_devolucion','ventas_factura','tab','<span class=\"glyphicon glyphicon-share\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Devoluciones</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('tab_editar_factura','compras_factura_devolucion','editar_factura_prov','tab','<span class=\"glyphicon glyphicon-share\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Devoluciones</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('tab_editar_factura','ventas_factura_devolucion','editar_factura','tab','<span class=\"glyphicon glyphicon-share\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Devoluciones</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('tab_ventas_cliente_articulos','ventas_cliente_articulos','ventas_cliente','tab','<i class=\"fa fa-cubes\" aria-hidden=\"true\"></i>&nbsp; Artículos',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('united','admin_user','admin_user','css','view/css/bootstrap-united.min.css','');
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('ventas_servicios_calendario','ventas_servicios_calendario','ventas_servicios','button','<span class=\"glyphicon glyphicon-calendar\" aria-hidden=\"true\"></span><span class=\"hidden-xs\">&nbsp; Calendario</span>',NULL);
insert  into `fs_extensions2`(`name`,`page_from`,`page_to`,`type`,`text`,`params`) values ('yeti','admin_user','admin_user','css','view/css/bootstrap-yeti.min.css','');

/*Table structure for table `fs_logs` */

DROP TABLE IF EXISTS `fs_logs`;

CREATE TABLE `fs_logs` (
  `alerta` tinyint(1) DEFAULT NULL,
  `controlador` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `detalle` text COLLATE utf8_bin NOT NULL,
  `fecha` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_bin NOT NULL,
  `usuario` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_logs` */

insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Login correcto.','2018-10-29 01:34:06',1,'::1','login','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'base_wizard','No se encuentran subcuentas para el ejercicio 2018 ¿&lt;a href=&quot;index.php?page=contabilidad_ejercicio&cod=2018&quot;&gt;Has importado los datos de contabilidad&lt;/a&gt;?','2018-10-29 01:38:23',2,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'contabilidad_ejercicio','La subcuenta tiene una longitud de 7, mientras que el ejercicio tiene definida una longitud de: 10. Debeas cambiarla para evitar problemas.','2018-10-28 19:49:02',3,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'contabilidad_nuevo_asiento','No se encuentran subcuentas para el ejercicio 2018 ¿&lt;a href=&quot;index.php?page=contabilidad_ejercicio&cod=2018&quot;&gt;Has importado los datos de contabilidad&lt;/a&gt;?','2018-10-28 19:51:10',4,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'compras_proveedores','Error al ejecutar la consulta 0: Duplicate entry &#39;000001&#39; for key &#39;PRIMARY&#39;. La secuencia ocupa la posición 9','2018-10-28 19:56:01',5,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'compras_proveedores','¡Imposible guardar el proveedor!','2018-10-28 19:56:01',6,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_empresa','No se ha podido conectar por email. ¿La contraseña es correcta?','2018-10-28 20:07:00',7,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_empresa','Aunque la contraseña de gmail sea correcta, en ciertas situaciones los servidores de gmail bloquean la conexión. Para superar esta situación debes crear y usar una &lt;a href=&quot;https://support.google.com/accounts/answer/185833?hl=es&quot; target=&quot;_blank&quot;&gt;contraseña de aplicación&lt;/a&gt;','2018-10-28 20:07:00',8,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_users','Usuario kevin creado correctamente.','2018-10-28 20:16:36',9,'::1','login','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_user','Se ha cambiado la contraseña del usuario kevin','2018-10-28 20:17:51',10,'::1','login','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Login correcto.','2018-10-28 20:18:17',11,'::1','login','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','No tienes un &lt;a href=&quot;index.php?page=admin_user&snick=kevin&quot;&gt;agente asociado&lt;/a&gt;\n               a tu usuario, y por tanto no puedes hacer tickets.','2018-10-28 20:18:19',12,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','No tienes un &lt;a href=&quot;index.php?page=admin_user&snick=kevin&quot;&gt;agente asociado&lt;/a&gt;\n               a tu usuario, y por tanto no puedes hacer tickets.','2018-10-28 20:18:28',13,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'nueva_compra','No se encuentra ninguna subcuenta de IR para el ejercicio 2018 (cuenta especial IRPFPR).','2018-10-28 20:35:58',14,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'contabilidad_series','Datos eliminados correctamente: serie 30','2018-10-28 20:43:05',15,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'contabilidad_series','Datos eliminados correctamente: serie re','2018-10-28 20:43:09',16,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin beneficios activado correctamente.','2018-10-28 21:12:39',17,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'editar_balances','Balance S eliminado correctamente.','2018-10-28 21:13:24',18,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin gestion_documental activado correctamente.','2018-10-28 21:15:33',19,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'informes_documentos','Table &#39;facturascripts.pedidosprov&#39; doesn&#39;t exist','2018-10-28 21:15:59',20,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'informes_documentos','Table &#39;facturascripts.pedidosprov&#39; doesn&#39;t exist','2018-10-28 21:16:09',21,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'nueva_compra','No se encuentra ninguna subcuenta de IR para el ejercicio 2018 (cuenta especial IRPFPR).','2018-10-28 21:18:41',22,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','¡Albarán de cliente no encontrado!','2018-10-28 21:19:39',23,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','¡Factura de cliente no encontrada!','2018-10-28 21:19:39',24,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','¡Presupuesto de cliente no encontrado!','2018-10-28 21:19:40',25,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin imprimir_continuo activado correctamente.','2018-10-28 21:19:40',26,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin Knowledgebase activado correctamente.','2018-10-28 22:01:02',27,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin megacopiador activado correctamente.','2018-10-28 22:01:44',28,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin presupuestos_y_pedidos activado correctamente.','2018-10-28 22:07:19',29,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin print_to_ticket activado correctamente.','2018-10-28 22:08:22',30,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'opciones_servicios','Contrato no encontrado.','2018-10-28 22:08:51',31,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'opciones_servicios','¡Servicio de cliente no encontrado!','2018-10-28 22:08:55',32,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin sms activado correctamente.','2018-10-28 22:22:49',33,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Plugin tcpdf activado correctamente.','2018-10-28 22:23:55',34,'::1','msg','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'informe_errores','Error al ejecutar la consulta 0: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#39;s WHERE NOT EXISTS (SELECT referencia FROM articulos a WHERE a.referencia = s.re&#39; at line 1. La secuencia ocupa la posición 10','2018-10-28 22:28:52',35,'::1','error','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'dashboard','El usuario ha cerrado la sesión.','2018-10-28 22:30:45',36,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Login correcto.','2018-10-28 22:30:51',37,'::1','login','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','No tienes un &lt;a href=&quot;index.php?page=admin_user&snick=kevin&quot;&gt;agente asociado&lt;/a&gt;\n               a tu usuario, y por tanto no puedes hacer tickets.','2018-10-28 22:30:52',38,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','No tienes un &lt;a href=&quot;index.php?page=admin_user&snick=kevin&quot;&gt;agente asociado&lt;/a&gt;\n               a tu usuario, y por tanto no puedes hacer tickets.','2018-10-28 22:31:11',39,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','El usuario ha cerrado la sesión.','2018-10-28 22:31:23',40,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_home','¡Contraseña incorrecta! (admin)','2018-10-28 22:31:28',41,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_home','¡Contraseña incorrecta! (admin)','2018-10-28 22:31:34',42,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_home','¡Contraseña incorrecta! (admin)','2018-10-28 22:31:39',43,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_home','¡Contraseña incorrecta! (admin)','2018-10-28 22:31:45',44,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (1,'admin_home','¡Contraseña incorrecta! (admin)','2018-10-28 22:31:48',45,'::1','login',NULL);
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Login correcto.','2018-10-28 22:31:51',46,'::1','login','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Login correcto.','2018-10-29 14:31:11',47,'::1','login','admin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'admin_home','Login correcto.','2018-10-29 14:46:04',48,'::1','login','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','No tienes un &lt;a href=&quot;index.php?page=admin_user&snick=kevin&quot;&gt;agente asociado&lt;/a&gt;\n               a tu usuario, y por tanto no puedes hacer tickets.','2018-10-29 14:46:10',49,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al ejecutar la consulta 0: Table &#39;articulo_combinaciones&#39; already exists. La secuencia ocupa la posición 17','2018-10-29 14:47:06',50,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al ejecutar la consulta 0: Table &#39;atributos_valores&#39; already exists. La secuencia ocupa la posición 16','2018-10-29 14:47:04',51,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al comprobar la tabla articulo_combinaciones','2018-10-29 14:47:06',52,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al ejecutar la consulta 0: Table &#39;articulo_combinaciones&#39; already exists. La secuencia ocupa la posición 17','2018-10-29 14:47:04',53,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al comprobar la tabla atributos_valores','2018-10-29 14:47:04',54,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Table &#39;fs1.1&#39;.&#39;stocks&#39; was skipped since its definition is being modified by concurrent DDL statement','2018-10-29 14:47:06',55,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al comprobar la tabla articulo_combinaciones','2018-10-29 14:47:04',56,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al ejecutar la consulta 0: Can&#39;t create table `fs1.1`.`articulo_combinaciones` (errno: 150 &quot;Foreign key constraint is incorrectly formed&quot;). La secuencia ocupa la posición 17','2018-10-29 14:47:04',57,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al ejecutar la consulta 0: Duplicate column name &#39;referencia&#39;. La secuencia ocupa la posición 23','2018-10-29 14:47:07',58,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al comprobar la tabla articulo_combinaciones','2018-10-29 14:47:04',59,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Table &#39;fs1.1.articulo_combinaciones&#39; doesn&#39;t exist','2018-10-29 14:47:04',60,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Table &#39;fs1.1.articulo_combinaciones&#39; doesn&#39;t exist','2018-10-29 14:47:04',61,'::1','error','kevin');
insert  into `fs_logs`(`alerta`,`controlador`,`detalle`,`fecha`,`id`,`ip`,`tipo`,`usuario`) values (0,'tpv_recambios','Error al comprobar la tabla stocks','2018-10-29 14:47:07',62,'::1','error','kevin');

/*Table structure for table `fs_pages` */

DROP TABLE IF EXISTS `fs_pages`;

CREATE TABLE `fs_pages` (
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `title` varchar(40) COLLATE utf8_bin NOT NULL,
  `folder` varchar(15) COLLATE utf8_bin NOT NULL,
  `version` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `show_on_menu` tinyint(1) NOT NULL DEFAULT '1',
  `important` tinyint(1) NOT NULL DEFAULT '0',
  `orden` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_pages` */

insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_agente','Empleado','admin','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_agentes','Empleados','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_almacenes','Almacenes','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_divisas','Divisas','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_ecuador','Ecuador','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_empresa','Empresa','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_home','Panel de control','admin',NULL,1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_info','Información del sistema','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_kdb','Entrada','KDB','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_orden_menu','Ordenar menú','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_paises','Paises','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_rol','Editar rol','admin','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_transportes','Agencias de transporte','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_user','Usuario','admin','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('admin_users','Usuarios','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('articulo_subcuentas','Subcuentas','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('articulo_trazabilidad','','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('articulos_pedidos','Artículos Pedidos','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('base_wizard','Asistente de instalación','admin','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('beneficios','Beneficios','informes','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_actualiza_arts','Artículos documento','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_agrupar_albaranes','Agrupar albaranes','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_albaran','albarán de proveedor','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_albaranes','Guias de Remision','compras','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_factura','Factura de proveedor','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_factura_devolucion','Devoluciones de factura de compra','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_facturas','Facturas','compras','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_imprimir','imprimir','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_pedido','Pedido','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_pedidos','Pedidos','compras','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_proveedor','Proveedor','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_proveedores','Proveedores / Acreedores','compras','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('compras_trazabilidad','Trazabilidad','compras','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_asiento','Asiento','contabilidad','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_asientos','Asientos','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_cuenta','Cuenta','contabilidad','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_cuentas','Cuentas','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_ejercicio','Ejercicio','contabilidad','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_ejercicios','Ejercicios','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_epigrafes','Grupos y epígrafes','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_formas_pago','Formas de Pago','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_impuestos','Impuestos','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_nuevo_asiento','Nuevo asiento','contabilidad','2017.907',0,1,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_series','Series','contabilidad','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('contabilidad_subcuenta','Subcuenta','contabilidad','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('cuentas_especiales','Cuentas Especiales','contabilidad','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('dashboard','Dashboard','informes','2017.907',1,1,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('documentos','Documentos','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('edit_kdb','Entrada','KDB','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('editar_balances','Editar balances','informes','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('editar_contrato_servicio','Editar contrato','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('editar_transferencia_stock','Editar transferencia','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('enviar_sms','Enviar SMS','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('impresion_tab_albaran','Imprimir continuo','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('impresion_tab_factura','Imprimir continuo','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('impresion_tab_presupuesto','Imprimir continuo','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('imprimir_presu_pedi','imprimir','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('imprimir_rapido','Imprimir Rápido','Servicio','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('imprimir_rapido_horizontal','Imprimir Rápido Horizontal','Servicio','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('imprimir_servicio','imprimir','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('imprimir_servicio_ticket','Ticket servicio','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_albaranes','Guias de Remision','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_articulos','Artículos','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_contabilidad','Contabilidad','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_errores','Errores','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_facturas','Facturas','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_pedidos','Pedidos','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informe_presupuestos','Proformas','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('informes_documentos','Gestión documental','informes','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('maquetar_presu_pedi','Maquetar','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('megacopiador','Megacopiador','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('megacopiador_compras','Megacopiador Compras','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('nueva_compra','Nueva compra...','compras','2017.907',0,1,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('nueva_venta','Nueva venta...','ventas','2017.907',0,1,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('nuevo_servicio','Nuevo servicio...','ventas','2017.907',0,1,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('opciones_servicios','Opciones','Servicios','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('print_to_ticket','Configurar ticket','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('proveedores_sms','SMS','admin','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('servicios_contratados','Servicios contratados','Ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('subcuenta_asociada','Asignar subcuenta...','contabilidad','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('tpv_caja','Arqueos y terminales','TPV','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('tpv_recambios','TPV Genérico','TPV','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_agrupar_albaranes','Agrupar Guia de Remision','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_albaran','Guia de Remision de cliente','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_albaranes','Guias de Remision','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_articulo','Articulo','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_articulos','Artículos','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_atributos','Atributos de artículos','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_cliente','Cliente','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_cliente_articulos','Articulos vendidos al cliente','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_clientes','Clientes','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_clientes_opciones','Opciones','clientes','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_fabricante','Familia','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_fabricantes','Fabricantes','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_factura','Factura de cliente','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_factura_devolucion','Devoluciones de factura de venta','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_facturas','Facturas','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_familia','Familia','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_familias','Familias','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_grupo','Grupo','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_imprimir','imprimir','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_maquetar','Maquetar','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_pedido','Pedido','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_pedidos','Pedidos','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_presupuesto','Proforma','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_presupuestos','Proformas','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_servicio','Servicio','ventas','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_servicios','Servicios a clientes','ventas','2017.907',1,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_servicios_calendario','Calendario','Servicios','2017.907',0,0,100);
insert  into `fs_pages`(`name`,`title`,`folder`,`version`,`show_on_menu`,`important`,`orden`) values ('ventas_trazabilidad','Trazabilidad','ventas','2017.907',0,0,100);

/*Table structure for table `fs_roles` */

DROP TABLE IF EXISTS `fs_roles`;

CREATE TABLE `fs_roles` (
  `codrol` varchar(20) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_roles` */

/*Table structure for table `fs_users` */

DROP TABLE IF EXISTS `fs_users`;

CREATE TABLE `fs_users` (
  `nick` varchar(12) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `log_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `last_login_time` time DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `last_browser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fs_page` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `css` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`nick`),
  KEY `ca_fs_users_pages` (`fs_page`),
  CONSTRAINT `ca_fs_users_pages` FOREIGN KEY (`fs_page`) REFERENCES `fs_pages` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_users` */

insert  into `fs_users`(`nick`,`password`,`log_key`,`admin`,`enabled`,`codagente`,`last_login`,`last_login_time`,`last_ip`,`last_browser`,`fs_page`,`css`,`email`) values ('admin','0b8c599e70552b916775aa532dc4c8df13adc85e','6cc0a6816d1712dbc32ad7d584b352fb1f84c4fe',1,1,'1','2018-10-30','13:20:55','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36',NULL,'view/css/bootstrap-yeti.min.css',NULL);
insert  into `fs_users`(`nick`,`password`,`log_key`,`admin`,`enabled`,`codagente`,`last_login`,`last_login_time`,`last_ip`,`last_browser`,`fs_page`,`css`,`email`) values ('kevin','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','7111f01976772bb089ec07a95cefdf12b75941b3',0,1,'3','2018-10-29','14:46:03','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299','tpv_recambios','view/css/bootstrap-yeti.min.css','');

/*Table structure for table `fs_vars` */

DROP TABLE IF EXISTS `fs_vars`;

CREATE TABLE `fs_vars` (
  `name` varchar(35) COLLATE utf8_bin NOT NULL,
  `varchar` text COLLATE utf8_bin,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `fs_vars` */

insert  into `fs_vars`(`name`,`varchar`) values ('cal_fin','20:00');
insert  into `fs_vars`(`name`,`varchar`) values ('cal_inicio','09:00');
insert  into `fs_vars`(`name`,`varchar`) values ('cal_intervalo','30');
insert  into `fs_vars`(`name`,`varchar`) values ('install_step','5');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_albaran','Buenos días, le adjunto su #DOCUMENTO#.\r\n#FIRMA#');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_bcc','homer_loading@hotmail.com');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_enc','ssl');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_factura','Buenos días, le adjunto su #DOCUMENTO#.\r\n#FIRMA#');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_firma','---\r\nEnviado con FacturaScripts');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_host','smtp.gmail.com');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_mailer','smtp');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_password','Homerito2012');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_pedido','Buenos días, le adjunto su #DOCUMENTO#.\n#FIRMA#');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_port','465');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_presupuesto','Buenos días, le adjunto su #DOCUMENTO#.\n#FIRMA#');
insert  into `fs_vars`(`name`,`varchar`) values ('mail_user','ventas.compueconomia');
insert  into `fs_vars`(`name`,`varchar`) values ('multi_almacen','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_cifnif_req','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_ciudad','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_ciudad_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_codgrupo','');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_codpostal','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_codpostal_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_direccion','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_direccion_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_email','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_email_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_pais','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_pais_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_provincia','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_provincia_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_telefono1','1');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_telefono1_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_telefono2','0');
insert  into `fs_vars`(`name`,`varchar`) values ('nuevocli_telefono2_req','0');
insert  into `fs_vars`(`name`,`varchar`) values ('print_alb','0');
insert  into `fs_vars`(`name`,`varchar`) values ('print_dto','1');
insert  into `fs_vars`(`name`,`varchar`) values ('print_formapago','1');
insert  into `fs_vars`(`name`,`varchar`) values ('print_ref','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_accesorios','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_accesorios_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_condiciones','Condiciones del deposito:\r\nLos presupuestos realizados tienen una validez de 15 días.\r\nUna vez avisado al cliente para que recoja el producto este dispondrá de un plazo máximo de 2 meses para recogerlo, de no ser así y no haber aviso por parte del cliente se empezará a cobrar 1 euro al día por gastos de almacenaje.\r\nLos accesorios y productos externos al equipo no especificados en este documento no podrán ser reclamados en caso de disconformidad con el técnico.');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_descripcion','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_descripcion_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_diasfin','2');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_fechafin','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_fechafin_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_fechainicio','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_fechainicio_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_garantia','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_garantia_linea','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_linea','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_linea1','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_material','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_material_estado','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_material_estado_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_material_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_accesorios','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_descripcion','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_fechafin','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_fechainicio','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_garantia','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_material','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_material_estado','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_mostrar_solucion','1');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_solucion','0');
insert  into `fs_vars`(`name`,`varchar`) values ('servicios_solucion_linea','1');
insert  into `fs_vars`(`name`,`varchar`) values ('st_accesorios','Accesorios que entrega');
insert  into `fs_vars`(`name`,`varchar`) values ('st_descripcion','Descripción de daño');
insert  into `fs_vars`(`name`,`varchar`) values ('st_fechafin','Fecha de finalización');
insert  into `fs_vars`(`name`,`varchar`) values ('st_fechainicio','Fecha de inicio');
insert  into `fs_vars`(`name`,`varchar`) values ('st_garantia','Garantía');
insert  into `fs_vars`(`name`,`varchar`) values ('st_material','Equipo');
insert  into `fs_vars`(`name`,`varchar`) values ('st_material_estado','Estado del Equipo entregado');
insert  into `fs_vars`(`name`,`varchar`) values ('st_servicio','Servicio');
insert  into `fs_vars`(`name`,`varchar`) values ('st_servicios','Servicios');
insert  into `fs_vars`(`name`,`varchar`) values ('st_solucion','Solución');
insert  into `fs_vars`(`name`,`varchar`) values ('updates','true');
insert  into `fs_vars`(`name`,`varchar`) values ('usar_direccion','0');

/*Table structure for table `gruposclientes` */

DROP TABLE IF EXISTS `gruposclientes`;

CREATE TABLE `gruposclientes` (
  `codgrupo` varchar(6) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `codtarifa` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `gruposclientes` */

/*Table structure for table `impuestos` */

DROP TABLE IF EXISTS `impuestos`;

CREATE TABLE `impuestos` (
  `codimpuesto` varchar(10) COLLATE utf8_bin NOT NULL,
  `codsubcuentaacr` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentadeu` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivadedadue` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivadevadue` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivadeventue` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivarepexe` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivarepexp` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivarepre` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivasopagra` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivasopexe` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentaivasopimp` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentarep` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuentasop` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuentaacr` int(11) DEFAULT NULL,
  `idsubcuentadeu` int(11) DEFAULT NULL,
  `idsubcuentaivadedadue` int(11) DEFAULT NULL,
  `idsubcuentaivadevadue` int(11) DEFAULT NULL,
  `idsubcuentaivadeventue` int(11) DEFAULT NULL,
  `idsubcuentaivarepexe` int(11) DEFAULT NULL,
  `idsubcuentaivarepexp` int(11) DEFAULT NULL,
  `idsubcuentaivarepre` int(11) DEFAULT NULL,
  `idsubcuentaivasopagra` int(11) DEFAULT NULL,
  `idsubcuentaivasopexe` int(11) DEFAULT NULL,
  `idsubcuentaivasopimp` int(11) DEFAULT NULL,
  `idsubcuentarep` int(11) DEFAULT NULL,
  `idsubcuentasop` int(11) DEFAULT NULL,
  `iva` double NOT NULL,
  `recargo` double NOT NULL,
  PRIMARY KEY (`codimpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `impuestos` */

insert  into `impuestos`(`codimpuesto`,`codsubcuentaacr`,`codsubcuentadeu`,`codsubcuentaivadedadue`,`codsubcuentaivadevadue`,`codsubcuentaivadeventue`,`codsubcuentaivarepexe`,`codsubcuentaivarepexp`,`codsubcuentaivarepre`,`codsubcuentaivasopagra`,`codsubcuentaivasopexe`,`codsubcuentaivasopimp`,`codsubcuentarep`,`codsubcuentasop`,`descripcion`,`idsubcuentaacr`,`idsubcuentadeu`,`idsubcuentaivadedadue`,`idsubcuentaivadevadue`,`idsubcuentaivadeventue`,`idsubcuentaivarepexe`,`idsubcuentaivarepexp`,`idsubcuentaivarepre`,`idsubcuentaivasopagra`,`idsubcuentaivasopexe`,`idsubcuentaivasopimp`,`idsubcuentarep`,`idsubcuentasop`,`iva`,`recargo`) values ('IVA0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IVA 0%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
insert  into `impuestos`(`codimpuesto`,`codsubcuentaacr`,`codsubcuentadeu`,`codsubcuentaivadedadue`,`codsubcuentaivadevadue`,`codsubcuentaivadeventue`,`codsubcuentaivarepexe`,`codsubcuentaivarepexp`,`codsubcuentaivarepre`,`codsubcuentaivasopagra`,`codsubcuentaivasopexe`,`codsubcuentaivasopimp`,`codsubcuentarep`,`codsubcuentasop`,`descripcion`,`idsubcuentaacr`,`idsubcuentadeu`,`idsubcuentaivadedadue`,`idsubcuentaivadevadue`,`idsubcuentaivadeventue`,`idsubcuentaivarepexe`,`idsubcuentaivarepexp`,`idsubcuentaivarepre`,`idsubcuentaivasopagra`,`idsubcuentaivasopexe`,`idsubcuentaivasopimp`,`idsubcuentarep`,`idsubcuentasop`,`iva`,`recargo`) values ('IVA12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IVA 12%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,0);

/*Table structure for table `kdb` */

DROP TABLE IF EXISTS `kdb`;

CREATE TABLE `kdb` (
  `idkdb` int(11) NOT NULL,
  `sintoma` varchar(255) COLLATE utf8_bin NOT NULL,
  `causa` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `solucion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idkdb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `kdb` */

/*Table structure for table `lineasalbaranescli` */

DROP TABLE IF EXISTS `lineasalbaranescli`;

CREATE TABLE `lineasalbaranescli` (
  `cantidad` double NOT NULL DEFAULT '0',
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL DEFAULT '0',
  `dtopor2` double NOT NULL DEFAULT '0',
  `dtopor3` double NOT NULL DEFAULT '0',
  `dtopor4` double NOT NULL DEFAULT '0',
  `idalbaran` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapedido` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL DEFAULT '0',
  `porcomision` double DEFAULT NULL,
  `pvpsindto` double NOT NULL DEFAULT '0',
  `pvptotal` double NOT NULL DEFAULT '0',
  `pvpunitario` double NOT NULL DEFAULT '0',
  `recargo` double DEFAULT '0',
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codcombinacion` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `orden` int(11) DEFAULT '0',
  `mostrar_cantidad` tinyint(1) DEFAULT '1',
  `mostrar_precio` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineasalbaranescli_albaranescli2` (`idalbaran`),
  CONSTRAINT `ca_lineasalbaranescli_albaranescli2` FOREIGN KEY (`idalbaran`) REFERENCES `albaranescli` (`idalbaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasalbaranescli` */

/*Table structure for table `lineasalbaranesprov` */

DROP TABLE IF EXISTS `lineasalbaranesprov`;

CREATE TABLE `lineasalbaranesprov` (
  `cantidad` double NOT NULL DEFAULT '0',
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL DEFAULT '0',
  `idalbaran` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapedido` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL DEFAULT '0',
  `pvpsindto` double NOT NULL DEFAULT '0',
  `pvptotal` double NOT NULL DEFAULT '0',
  `pvpunitario` double NOT NULL DEFAULT '0',
  `recargo` double DEFAULT '0',
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codcombinacion` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineasalbaranesprov_albaranesprov2` (`idalbaran`),
  CONSTRAINT `ca_lineasalbaranesprov_albaranesprov2` FOREIGN KEY (`idalbaran`) REFERENCES `albaranesprov` (`idalbaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasalbaranesprov` */

/*Table structure for table `lineasfacturascli` */

DROP TABLE IF EXISTS `lineasfacturascli`;

CREATE TABLE `lineasfacturascli` (
  `cantidad` double NOT NULL DEFAULT '0',
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL DEFAULT '0',
  `dtopor2` double NOT NULL DEFAULT '0',
  `dtopor3` double NOT NULL DEFAULT '0',
  `dtopor4` double NOT NULL DEFAULT '0',
  `idalbaran` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineaalbaran` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `porcomision` double DEFAULT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codcombinacion` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `orden` int(11) DEFAULT '0',
  `mostrar_cantidad` tinyint(1) DEFAULT '1',
  `mostrar_precio` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idlinea`),
  KEY `ca_linea_facturascli2` (`idfactura`),
  CONSTRAINT `ca_linea_facturascli2` FOREIGN KEY (`idfactura`) REFERENCES `facturascli` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasfacturascli` */

/*Table structure for table `lineasfacturasprov` */

DROP TABLE IF EXISTS `lineasfacturasprov`;

CREATE TABLE `lineasfacturasprov` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idalbaran` int(11) DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineaalbaran` int(11) DEFAULT NULL,
  `idsubcuenta` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double DEFAULT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `codcombinacion` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_linea_facturasprov2` (`idfactura`),
  CONSTRAINT `ca_linea_facturasprov2` FOREIGN KEY (`idfactura`) REFERENCES `facturasprov` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasfacturasprov` */

/*Table structure for table `lineasivafactprov` */

DROP TABLE IF EXISTS `lineasivafactprov`;

CREATE TABLE `lineasivafactprov` (
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `idfactura` int(11) NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `recargo` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totallinea` double NOT NULL DEFAULT '0',
  `totalrecargo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineaiva_facturasprov2` (`idfactura`),
  CONSTRAINT `ca_lineaiva_facturasprov2` FOREIGN KEY (`idfactura`) REFERENCES `facturasprov` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasivafactprov` */

/*Table structure for table `lineasregstocks` */

DROP TABLE IF EXISTS `lineasregstocks`;

CREATE TABLE `lineasregstocks` (
  `cantidadfin` double NOT NULL DEFAULT '0',
  `cantidadini` double NOT NULL DEFAULT '0',
  `codalmacendest` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idstock` int(11) NOT NULL,
  `motivo` text COLLATE utf8_bin,
  `nick` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_lineasregstocks_stocks` (`idstock`),
  CONSTRAINT `ca_lineasregstocks_stocks` FOREIGN KEY (`idstock`) REFERENCES `stocks` (`idstock`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasregstocks` */

/*Table structure for table `lineasservicioscli` */

DROP TABLE IF EXISTS `lineasservicioscli`;

CREATE TABLE `lineasservicioscli` (
  `cantidad` double NOT NULL,
  `codimpuesto` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text COLLATE utf8_bin,
  `dtolineal` double DEFAULT '0',
  `dtopor` double NOT NULL,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idlineapresupuesto` int(11) DEFAULT NULL,
  `idservicio` int(11) NOT NULL,
  `idpresupuesto` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `iva` double NOT NULL,
  `pvpsindto` double NOT NULL,
  `pvptotal` double NOT NULL,
  `pvpunitario` double NOT NULL,
  `recargo` double DEFAULT NULL,
  `referencia` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `totalenalbaran` double DEFAULT NULL,
  `codcombinacion` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlinea`),
  KEY `ca_lineasservicioscli_servicioscli` (`idservicio`),
  CONSTRAINT `ca_lineasservicioscli_servicioscli` FOREIGN KEY (`idservicio`) REFERENCES `servicioscli` (`idservicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineasservicioscli` */

/*Table structure for table `lineastransstock` */

DROP TABLE IF EXISTS `lineastransstock`;

CREATE TABLE `lineastransstock` (
  `cantidad` double NOT NULL,
  `descripcion` text COLLATE utf8_bin,
  `idlinea` int(11) NOT NULL AUTO_INCREMENT,
  `idtrans` int(11) NOT NULL,
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idlinea`),
  UNIQUE KEY `uniq_referencia_transferencia` (`idtrans`,`referencia`),
  KEY `ca_linea_transstock_articulos` (`referencia`),
  CONSTRAINT `ca_linea_transstock` FOREIGN KEY (`idtrans`) REFERENCES `transstock` (`idtrans`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_linea_transstock_articulos` FOREIGN KEY (`referencia`) REFERENCES `articulos` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `lineastransstock` */

/*Table structure for table `paises` */

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `validarprov` tinyint(1) DEFAULT NULL,
  `codiso` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `bandera` text COLLATE utf8_bin,
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `paises` */

insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AW',NULL,'Aruba','ABW');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AF',NULL,'Afganistán','AFG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AO',NULL,'Angola','AGO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AI',NULL,'Anguila','AIA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AX',NULL,'Islas Gland','ALA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AL',NULL,'Albania','ALB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AD',NULL,'Andorra','AND');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AN',NULL,'Antillas Holandesas','ANT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AE',NULL,'Emiratos Árabes Unidos','ARE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AR',NULL,'Argentina','ARG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AM',NULL,'Armenia','ARM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AS',NULL,'Samoa Americana','ASM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AQ',NULL,'Antártida','ATA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TF',NULL,'Territorios Australes Franceses','ATF');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AG',NULL,'Antigua y Barbuda','ATG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AU',NULL,'Australia','AUS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AT',NULL,'Austria','AUT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'AZ',NULL,'Azerbaiyán','AZE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BI',NULL,'Burundi','BDI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BE',NULL,'Bélgica','BEL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BJ',NULL,'Benín','BEN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BF',NULL,'Burkina Faso','BFA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BD',NULL,'Bangladesh','BGD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BG',NULL,'Bulgaria','BGR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BH',NULL,'Bahréin','BHR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BS',NULL,'Bahamas','BHS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BA',NULL,'Bosnia y Herzegovina','BIH');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BY',NULL,'Bielorrusia','BLR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BZ',NULL,'Belice','BLZ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BM',NULL,'Bermudas','BMU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BO',NULL,'Bolivia','BOL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BR',NULL,'Brasil','BRA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BB',NULL,'Barbados','BRB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BN',NULL,'Brunéi','BRN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BT',NULL,'Bhután','BTN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BV',NULL,'Isla Bouvet','BVT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'BW',NULL,'Botsuana','BWA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CF',NULL,'República Centroafricana','CAF');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CA',NULL,'Canadá','CAN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CC',NULL,'Islas Cocos','CCK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CH',NULL,'Suiza','CHE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CL',NULL,'Chile','CHL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CN',NULL,'China','CHN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CI',NULL,'Costa de Marfil','CIV');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CM',NULL,'Camerún','CMR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CD',NULL,'República Democrática del Congo','COD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CG',NULL,'Congo','COG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CK',NULL,'Islas Cook','COK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CO',NULL,'Colombia','COL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KM',NULL,'Comoras','COM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CV',NULL,'Cabo Verde','CPV');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CR',NULL,'Costa Rica','CRI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CU',NULL,'Cuba','CUB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CX',NULL,'Isla de Navidad','CXR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KY',NULL,'Islas Caimán','CYM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CY',NULL,'Chipre','CYP');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'CZ',NULL,'República Checa','CZE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'DE',NULL,'Alemania','DEU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'DJ',NULL,'Yibuti','DJI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'DM',NULL,'Dominica','DMA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'DK',NULL,'Dinamarca','DNK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'DO',NULL,'República Dominicana','DOM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'DZ',NULL,'Argelia','DZA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'EC',NULL,'Ecuador','ECU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'EG',NULL,'Egipto','EGY');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ER',NULL,'Eritrea','ERI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'EH',NULL,'Sahara Occidental','ESH');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ES',NULL,'España','ESP');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'EE',NULL,'Estonia','EST');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ET',NULL,'Etiopía','ETH');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'FI',NULL,'Finlandia','FIN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'FJ',NULL,'Fiyi','FJI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'FK',NULL,'Islas Malvinas','FLK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'FR',NULL,'Francia','FRA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'FO',NULL,'Islas Feroe','FRO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'FM',NULL,'Micronesia','FSM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GA',NULL,'Gabón','GAB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GB',NULL,'Reino Unido','GBR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GE',NULL,'Georgia','GEO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GH',NULL,'Ghana','GHA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GI',NULL,'Gibraltar','GIB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GN',NULL,'Guinea','GIN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GP',NULL,'Guadalupe','GLP');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GM',NULL,'Gambia','GMB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GW',NULL,'Guinea-Bissau','GNB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GQ',NULL,'Guinea Ecuatorial','GNQ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GR',NULL,'Grecia','GRC');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GD',NULL,'Granada','GRD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GL',NULL,'Groenlandia','GRL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GT',NULL,'Guatemala','GTM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GF',NULL,'Guayana Francesa','GUF');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GU',NULL,'Guam','GUM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GY',NULL,'Guyana','GUY');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'HK',NULL,'Hong Kong','HKG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'HM',NULL,'Islas Heard y McDonald','HMD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'HN',NULL,'Honduras','HND');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'HR',NULL,'Croacia','HRV');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'HT',NULL,'Haití','HTI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'HU',NULL,'Hungría','HUN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ID',NULL,'Indonesia','IDN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IN',NULL,'India','IND');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IO',NULL,'Territorio Británico del Océano Índico','IOT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IE',NULL,'Irlanda','IRL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IR',NULL,'Irán','IRN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IQ',NULL,'Iraq','IRQ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IS',NULL,'Islandia','ISL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IL',NULL,'Israel','ISR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'IT',NULL,'Italia','ITA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'JM',NULL,'Jamaica','JAM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'JO',NULL,'Jordania','JOR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'JP',NULL,'Japón','JPN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KZ',NULL,'Kazajstán','KAZ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KE',NULL,'Kenia','KEN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KG',NULL,'Kirguistán','KGZ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KH',NULL,'Camboya','KHM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KI',NULL,'Kiribati','KIR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KN',NULL,'San Cristóbal y Nieves','KNA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KR',NULL,'Corea del Sur','KOR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KW',NULL,'Kuwait','KWT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LA',NULL,'Laos','LAO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LB',NULL,'Líbano','LBN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LR',NULL,'Liberia','LBR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LY',NULL,'Libia','LBY');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LC',NULL,'Santa Lucía','LCA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LI',NULL,'Liechtenstein','LIE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LK',NULL,'Sri Lanka','LKA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LS',NULL,'Lesotho','LSO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LT',NULL,'Lituania','LTU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LU',NULL,'Luxemburgo','LUX');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'LV',NULL,'Letonia','LVA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MO',NULL,'Macao','MAC');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MA',NULL,'Marruecos','MAR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MC',NULL,'Mónaco','MCO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MD',NULL,'Moldavia','MDA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MG',NULL,'Madagascar','MDG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MV',NULL,'Maldivas','MDV');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MX',NULL,'México','MEX');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MH',NULL,'Islas Marshall','MHL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MK',NULL,'Macedonia','MKD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ML',NULL,'Malí','MLI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MT',NULL,'Malta','MLT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MM',NULL,'Myanmar','MMR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ME',NULL,'Montenegro','MNE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MN',NULL,'Mongolia','MNG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MP',NULL,'Islas Marianas del Norte','MNP');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MZ',NULL,'Mozambique','MOZ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MR',NULL,'Mauritania','MRT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MS',NULL,'Montserrat','MSR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MQ',NULL,'Martinica','MTQ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MU',NULL,'Mauricio','MUS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MW',NULL,'Malaui','MWI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'MY',NULL,'Malasia','MYS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'YT',NULL,'Mayotte','MYT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NA',NULL,'Namibia','NAM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NC',NULL,'Nueva Caledonia','NCL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NE',NULL,'Níger','NER');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NF',NULL,'Isla Norfolk','NFK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NG',NULL,'Nigeria','NGA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NI',NULL,'Nicaragua','NIC');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NU',NULL,'Niue','NIU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NL',NULL,'Países Bajos','NLD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NO',NULL,'Noruega','NOR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NP',NULL,'Nepal','NPL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NR',NULL,'Nauru','NRU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'NZ',NULL,'Nueva Zelanda','NZL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'OM',NULL,'Omán','OMN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PK',NULL,'Pakistán','PAK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PA',NULL,'Panamá','PAN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PN',NULL,'Islas Pitcairn','PCN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PE',NULL,'Perú','PER');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PH',NULL,'Filipinas','PHL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PW',NULL,'Palaos','PLW');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PG',NULL,'Papúa Nueva Guinea','PNG');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PL',NULL,'Polonia','POL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PR',NULL,'Puerto Rico','PRI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'KP',NULL,'Corea del Norte','PRK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PT',NULL,'Portugal','PRT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PY',NULL,'Paraguay','PRY');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PS',NULL,'Palestina','PSE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PF',NULL,'Polinesia Francesa','PYF');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'QA',NULL,'Qatar','QAT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'RE',NULL,'Reunión','REU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'RO',NULL,'Rumania','ROU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'RU',NULL,'Rusia','RUS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'RW',NULL,'Ruanda','RWA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SA',NULL,'Arabia Saudí','SAU');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SD',NULL,'Sudán','SDN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SN',NULL,'Senegal','SEN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SG',NULL,'Singapur','SGP');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'GS',NULL,'Islas Georgias del Sur y Sandwich del Sur','SGS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SH',NULL,'Santa Helena','SHN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SJ',NULL,'Svalbard y Jan Mayen','SJM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SB',NULL,'Islas Salomón','SLB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SL',NULL,'Sierra Leona','SLE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SV',NULL,'El Salvador','SLV');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SM',NULL,'San Marino','SMR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SO',NULL,'Somalia','SOM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'PM',NULL,'San Pedro y Miquelón','SPM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'RS',NULL,'Serbia','SRB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ST',NULL,'Santo Tomé y Príncipe','STP');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SR',NULL,'Surinam','SUR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SK',NULL,'Eslovaquia','SVK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SI',NULL,'Eslovenia','SVN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SE',NULL,'Suecia','SWE');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SZ',NULL,'Suazilandia','SWZ');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SC',NULL,'Seychelles','SYC');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'SY',NULL,'Siria','SYR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TC',NULL,'Islas Turcas y Caicos','TCA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TD',NULL,'Chad','TCD');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TG',NULL,'Togo','TGO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TH',NULL,'Tailandia','THA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TJ',NULL,'Tayikistán','TJK');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TK',NULL,'Tokelau','TKL');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TM',NULL,'Turkmenistán','TKM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TL',NULL,'Timor Oriental','TLS');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TO',NULL,'Tonga','TON');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TT',NULL,'Trinidad y Tobago','TTO');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TN',NULL,'Túnez','TUN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TR',NULL,'Turquía','TUR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TV',NULL,'Tuvalu','TUV');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TW',NULL,'Taiwán','TWN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'TZ',NULL,'Tanzania','TZA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'UG',NULL,'Uganda','UGA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'UA',NULL,'Ucrania','UKR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'UM',NULL,'Islas Ultramarinas de Estados Unidos','UMI');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'UY',NULL,'Uruguay','URY');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'US',NULL,'Estados Unidos','USA');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'UZ',NULL,'Uzbekistán','UZB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VA',NULL,'Ciudad del Vaticano','VAT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VC',NULL,'San Vicente y las Granadinas','VCT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VE',NULL,'Venezuela','VEN');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VG',NULL,'Islas Vírgenes Británicas','VGB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VI',NULL,'Islas Vírgenes de los Estados Unidos','VIR');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VN',NULL,'Vietnam','VNM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'VU',NULL,'Vanuatu','VUT');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'WF',NULL,'Wallis y Futuna','WLF');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'WS',NULL,'Samoa','WSM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'YE',NULL,'Yemen','YEM');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ZA',NULL,'Sudáfrica','ZAF');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ZM',NULL,'Zambia','ZMB');
insert  into `paises`(`validarprov`,`codiso`,`bandera`,`nombre`,`codpais`) values (NULL,'ZW',NULL,'Zimbabue','ZWE');

/*Table structure for table `pedidoscli` */

DROP TABLE IF EXISTS `pedidoscli`;

CREATE TABLE `pedidoscli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `fechasalida` date DEFAULT NULL,
  `femail` date DEFAULT NULL,
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idalbaran` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `netosindto` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `servido` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `codtrans` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codigoenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nombreenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `apellidosenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `direccionenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostalenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ciudadenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `provinciaenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apartadoenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpaisenv` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `numdocs` int(11) DEFAULT '0',
  `idoriginal` int(11) DEFAULT NULL,
  `dtopor1` double NOT NULL DEFAULT '0',
  `dtopor2` double NOT NULL DEFAULT '0',
  `dtopor3` double NOT NULL DEFAULT '0',
  `dtopor4` double NOT NULL DEFAULT '0',
  `dtopor5` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpedido`),
  UNIQUE KEY `uniq_codigo_pedidoscli` (`codigo`),
  KEY `ca_pedidoscli_series` (`codserie`),
  KEY `ca_pedidoscli_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_pedidoscli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_pedidoscli_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `pedidoscli` */

/*Table structure for table `pedidosprov` */

DROP TABLE IF EXISTS `pedidosprov`;

CREATE TABLE `pedidosprov` (
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `totaleuros` double NOT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `irpf` double DEFAULT NULL,
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idalbaran` int(11) DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `servido` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `numproveedor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `fechaentrada` date DEFAULT NULL,
  `totalrecargo` double DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `neto` double NOT NULL,
  `totalirpf` double DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `totaliva` double NOT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `numdocs` int(11) DEFAULT '0',
  `idoriginal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  UNIQUE KEY `uniq_codigo_pedidosprov` (`codigo`),
  KEY `ca_pedidosprov_series` (`codserie`),
  KEY `ca_pedidosprov_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_pedidosprov_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_pedidosprov_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `pedidosprov` */

/*Table structure for table `presupuestoscli` */

DROP TABLE IF EXISTS `presupuestoscli`;

CREATE TABLE `presupuestoscli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin NOT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(20) COLLATE utf8_bin NOT NULL,
  `codoportunidad` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin NOT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `editable` tinyint(1) NOT NULL,
  `estado` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `finoferta` date DEFAULT NULL,
  `fechasalida` date DEFAULT NULL,
  `femail` date DEFAULT NULL,
  `idpresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double NOT NULL DEFAULT '0',
  `netosindto` double NOT NULL DEFAULT '0',
  `neto` double NOT NULL DEFAULT '0',
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin NOT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `totaleuros` double NOT NULL DEFAULT '0',
  `totalirpf` double NOT NULL DEFAULT '0',
  `totaliva` double NOT NULL DEFAULT '0',
  `totalrecargo` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `codtrans` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `codigoenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nombreenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `apellidosenv` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `direccionenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codpostalenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ciudadenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `provinciaenv` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apartadoenv` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpaisenv` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `numdocs` int(11) DEFAULT '0',
  `idoriginal` int(11) DEFAULT NULL,
  `dtopor1` double NOT NULL DEFAULT '0',
  `dtopor2` double NOT NULL DEFAULT '0',
  `dtopor3` double NOT NULL DEFAULT '0',
  `dtopor4` double NOT NULL DEFAULT '0',
  `dtopor5` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpresupuesto`),
  UNIQUE KEY `uniq_codigo_presupuestoscli` (`codigo`),
  KEY `ca_presupuestoscli_series` (`codserie`),
  KEY `ca_presupuestoscli_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_presupuestoscli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_presupuestoscli_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `presupuestoscli` */

/*Table structure for table `proveedor_sms` */

DROP TABLE IF EXISTS `proveedor_sms`;

CREATE TABLE `proveedor_sms` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `de` varchar(12) COLLATE utf8_bin NOT NULL,
  `api_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `proveedor_sms` */

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `cifnif` varchar(30) COLLATE utf8_bin NOT NULL,
  `codcontacto` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentadom` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codcuentapago` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codproveedor` varchar(6) COLLATE utf8_bin NOT NULL,
  `codserie` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `codsubcuenta` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `idsubcuenta` int(11) DEFAULT NULL,
  `ivaportes` double DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `razonsocial` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `recfinanciero` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `regimeniva` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `telefono1` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `telefono2` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `tipoidfiscal` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT 'NIF',
  `web` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `acreedor` tinyint(1) DEFAULT '0',
  `personafisica` tinyint(1) DEFAULT '1',
  `debaja` tinyint(1) DEFAULT '0',
  `fechabaja` date DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `proveedores` */

insert  into `proveedores`(`cifnif`,`codcontacto`,`codcuentadom`,`codcuentapago`,`coddivisa`,`codpago`,`codproveedor`,`codserie`,`codsubcuenta`,`contacto`,`email`,`fax`,`idsubcuenta`,`ivaportes`,`nombre`,`razonsocial`,`observaciones`,`recfinanciero`,`regimeniva`,`telefono1`,`telefono2`,`tipoidfiscal`,`web`,`acreedor`,`personafisica`,`debaja`,`fechabaja`,`codcliente`) values ('1722239967001',NULL,NULL,NULL,'USD','CONT','000001',NULL,NULL,NULL,'','',NULL,NULL,'CARRION TORRES JIMMY HOMERO','CARRION TORRES JIMMY HOMERO','',NULL,'General','','','R.U.C','',0,1,0,'2018-10-28',NULL);

/*Table structure for table `secuencias` */

DROP TABLE IF EXISTS `secuencias`;

CREATE TABLE `secuencias` (
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idsec` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `valorout` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsec`),
  KEY `ca_secuencias_secuenciasejercicios` (`id`),
  CONSTRAINT `ca_secuencias_secuenciasejercicios` FOREIGN KEY (`id`) REFERENCES `secuenciasejercicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `secuencias` */

insert  into `secuencias`(`descripcion`,`id`,`idsec`,`nombre`,`valor`,`valorout`) values ('Secuencia del ejercicio 2018 y la serie A',1,1,'nfacturaprov',1,2);
insert  into `secuencias`(`descripcion`,`id`,`idsec`,`nombre`,`valor`,`valorout`) values ('Secuencia del ejercicio 2018 y la serie FN',3,2,'nfacturaprov',1,3);

/*Table structure for table `secuenciasejercicios` */

DROP TABLE IF EXISTS `secuenciasejercicios`;

CREATE TABLE `secuenciasejercicios` (
  `codejercicio` varchar(4) COLLATE utf8_bin NOT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nalbarancli` int(11) NOT NULL,
  `nalbaranprov` int(11) NOT NULL,
  `nfacturacli` int(11) NOT NULL,
  `nfacturaprov` int(11) NOT NULL,
  `npedidocli` int(11) NOT NULL,
  `npedidoprov` int(11) NOT NULL,
  `npresupuestocli` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_secuenciasejercicios_ejercicios` (`codejercicio`),
  CONSTRAINT `ca_secuenciasejercicios_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `secuenciasejercicios` */

insert  into `secuenciasejercicios`(`codejercicio`,`codserie`,`id`,`nalbarancli`,`nalbaranprov`,`nfacturacli`,`nfacturaprov`,`npedidocli`,`npedidoprov`,`npresupuestocli`) values ('2018','A',1,1,1,1,1,1,1,1);
insert  into `secuenciasejercicios`(`codejercicio`,`codserie`,`id`,`nalbarancli`,`nalbaranprov`,`nfacturacli`,`nfacturaprov`,`npedidocli`,`npedidoprov`,`npresupuestocli`) values ('2018','R',2,1,1,1,1,1,1,1);
insert  into `secuenciasejercicios`(`codejercicio`,`codserie`,`id`,`nalbarancli`,`nalbaranprov`,`nfacturacli`,`nfacturaprov`,`npedidocli`,`npedidoprov`,`npresupuestocli`) values ('2018','FN',3,1,1,1,1,1,1,1);
insert  into `secuenciasejercicios`(`codejercicio`,`codserie`,`id`,`nalbarancli`,`nalbaranprov`,`nfacturacli`,`nfacturaprov`,`npedidocli`,`npedidoprov`,`npresupuestocli`) values ('2018','NC',4,1,1,1,1,1,1,1);
insert  into `secuenciasejercicios`(`codejercicio`,`codserie`,`id`,`nalbarancli`,`nalbaranprov`,`nfacturacli`,`nfacturaprov`,`npedidocli`,`npedidoprov`,`npresupuestocli`) values ('2018','ND',5,1,1,1,1,1,1,1);

/*Table structure for table `series` */

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `irpf` double DEFAULT NULL,
  `idcuenta` int(11) DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `siniva` tinyint(1) DEFAULT NULL,
  `codcuenta` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `numfactura` int(11) DEFAULT '1',
  PRIMARY KEY (`codserie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `series` */

insert  into `series`(`irpf`,`idcuenta`,`codserie`,`descripcion`,`siniva`,`codcuenta`,`codejercicio`,`numfactura`) values (0,NULL,'FN','FACTURA NORMAL',0,NULL,NULL,1);
insert  into `series`(`irpf`,`idcuenta`,`codserie`,`descripcion`,`siniva`,`codcuenta`,`codejercicio`,`numfactura`) values (0,NULL,'NC','NOTA DE CREDITO',0,NULL,NULL,1);
insert  into `series`(`irpf`,`idcuenta`,`codserie`,`descripcion`,`siniva`,`codcuenta`,`codejercicio`,`numfactura`) values (0,NULL,'ND','NOTA DEBITO',0,NULL,NULL,1);

/*Table structure for table `servicioscli` */

DROP TABLE IF EXISTS `servicioscli`;

CREATE TABLE `servicioscli` (
  `apartado` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `cifnif` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `codagente` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codalmacen` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codcliente` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `coddir` int(11) DEFAULT NULL,
  `coddivisa` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `codejercicio` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpago` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codpais` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `codpostal` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codserie` varchar(2) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `editable` tinyint(1) NOT NULL,
  `garantia` tinyint(1) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT '00:00:00',
  `femail` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `horafin` time DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `horainicio` time DEFAULT NULL,
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `idalbaran` int(11) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `irpf` double DEFAULT NULL,
  `neto` double NOT NULL,
  `nombrecliente` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `numero` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `numero2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` text COLLATE utf8_bin,
  `descripcion` text COLLATE utf8_bin,
  `solucion` text COLLATE utf8_bin,
  `material` text COLLATE utf8_bin,
  `material_estado` text COLLATE utf8_bin,
  `accesorios` text COLLATE utf8_bin,
  `porcomision` double DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recfinanciero` double DEFAULT NULL,
  `tasaconv` double NOT NULL,
  `total` double NOT NULL,
  `totaleuros` double DEFAULT NULL,
  `totalirpf` double NOT NULL,
  `totaliva` double NOT NULL,
  `totalrecargo` double DEFAULT NULL,
  `idestado` int(11) DEFAULT NULL,
  `numdocs` int(11) DEFAULT '0',
  PRIMARY KEY (`idservicio`),
  UNIQUE KEY `uniq_codigo_servicioscli` (`codigo`),
  KEY `ca_servicioscli_series` (`codserie`),
  KEY `ca_servicioscli_ejercicios` (`codejercicio`),
  KEY `ca_servicios_albaranescli` (`idalbaran`),
  CONSTRAINT `ca_servicios_albaranescli` FOREIGN KEY (`idalbaran`) REFERENCES `albaranescli` (`idalbaran`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ca_servicioscli_ejercicios` FOREIGN KEY (`codejercicio`) REFERENCES `ejercicios` (`codejercicio`) ON UPDATE CASCADE,
  CONSTRAINT `ca_servicioscli_series` FOREIGN KEY (`codserie`) REFERENCES `series` (`codserie`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `servicioscli` */

insert  into `servicioscli`(`apartado`,`prioridad`,`cifnif`,`ciudad`,`codagente`,`codalmacen`,`codcliente`,`coddir`,`coddivisa`,`codejercicio`,`codigo`,`codpago`,`codpais`,`codpostal`,`codserie`,`direccion`,`editable`,`garantia`,`fecha`,`hora`,`femail`,`fechafin`,`horafin`,`fechainicio`,`horainicio`,`idservicio`,`idalbaran`,`idprovincia`,`irpf`,`neto`,`nombrecliente`,`numero`,`numero2`,`observaciones`,`descripcion`,`solucion`,`material`,`material_estado`,`accesorios`,`porcomision`,`provincia`,`recfinanciero`,`tasaconv`,`total`,`totaleuros`,`totalirpf`,`totaliva`,`totalrecargo`,`idestado`,`numdocs`) values (NULL,3,'1722239967001','SANTO DOMING','2','ALG','000001',NULL,'USD','2018','SER2018FN1','CREDITO','ECU','','FN','C/',1,0,'2018-10-28','22:14:46','2018-10-28','2018-10-30','22:13:00','2018-10-28','22:13:00',1,1,NULL,0,0,'JIMMY HOMERO CARRION','1','','','','..','LAPRTOP CORE  I5 ','NO ENCIENDE','CARGADOR',2,'SANTO DOMINGO',0,1.129,0,0,0,0,0,1,0);
insert  into `servicioscli`(`apartado`,`prioridad`,`cifnif`,`ciudad`,`codagente`,`codalmacen`,`codcliente`,`coddir`,`coddivisa`,`codejercicio`,`codigo`,`codpago`,`codpais`,`codpostal`,`codserie`,`direccion`,`editable`,`garantia`,`fecha`,`hora`,`femail`,`fechafin`,`horafin`,`fechainicio`,`horainicio`,`idservicio`,`idalbaran`,`idprovincia`,`irpf`,`neto`,`nombrecliente`,`numero`,`numero2`,`observaciones`,`descripcion`,`solucion`,`material`,`material_estado`,`accesorios`,`porcomision`,`provincia`,`recfinanciero`,`tasaconv`,`total`,`totaleuros`,`totalirpf`,`totaliva`,`totalrecargo`,`idestado`,`numdocs`) values (NULL,3,'1722423967','SANTO DOMING','1','ALG','000002',NULL,'USD','2018','SER2018FN2','CONT','ECU','','FN','C/',1,0,'2018-10-29','14:41:54','2018-10-29','2018-10-31','14:34:00','2018-10-29','14:34:00',2,NULL,NULL,0,0,'MIGUEL GETIAL','2','','','','','laptop hp ','FUNCIONAL','CARGADOR SN 555555',0,'SANTO DOMINGO',0,1.129,0,0,0,0,0,1,0);

/*Table structure for table `stocks` */

DROP TABLE IF EXISTS `stocks`;

CREATE TABLE `stocks` (
  `referencia` varchar(18) COLLATE utf8_bin NOT NULL,
  `disponible` double NOT NULL,
  `stockmin` double NOT NULL DEFAULT '0',
  `reservada` double NOT NULL,
  `horaultreg` time DEFAULT '00:00:00',
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `pterecibir` double NOT NULL,
  `fechaultreg` date DEFAULT '2018-10-30',
  `codalmacen` varchar(4) COLLATE utf8_bin NOT NULL,
  `cantidadultreg` double NOT NULL DEFAULT '0',
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL DEFAULT '0',
  `stockmax` double NOT NULL DEFAULT '0',
  `ubicacion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idstock`),
  UNIQUE KEY `uniq_stocks_almacen_referencia` (`codalmacen`,`referencia`),
  KEY `ca_stocks_articulos2` (`referencia`),
  CONSTRAINT `ca_stocks_almacenes3` FOREIGN KEY (`codalmacen`) REFERENCES `almacenes` (`codalmacen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ca_stocks_articulos2` FOREIGN KEY (`referencia`) REFERENCES `articulos` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `stocks` */

insert  into `stocks`(`referencia`,`disponible`,`stockmin`,`reservada`,`horaultreg`,`nombre`,`pterecibir`,`fechaultreg`,`codalmacen`,`cantidadultreg`,`idstock`,`cantidad`,`stockmax`,`ubicacion`) values ('mainboard',0,0,0,'00:00:00','',0,'2018-10-28','ALG',0,1,0,0,NULL);

/*Table structure for table `tarifas` */

DROP TABLE IF EXISTS `tarifas`;

CREATE TABLE `tarifas` (
  `incporcentual` double NOT NULL,
  `inclineal` double NOT NULL,
  `aplicar_a` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `mincoste` tinyint(1) DEFAULT '0',
  `maxpvp` tinyint(1) DEFAULT '0',
  `codtarifa` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`codtarifa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tarifas` */

/*Table structure for table `ticketcustomline` */

DROP TABLE IF EXISTS `ticketcustomline`;

CREATE TABLE `ticketcustomline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posicion` varchar(20) COLLATE utf8_bin NOT NULL,
  `documento` varchar(50) COLLATE utf8_bin NOT NULL,
  `texto` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ticketcustomline` */

/*Table structure for table `transstock` */

DROP TABLE IF EXISTS `transstock`;

CREATE TABLE `transstock` (
  `usuario` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `codalmadestino` varchar(4) COLLATE utf8_bin NOT NULL,
  `codalmaorigen` varchar(4) COLLATE utf8_bin NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idtrans` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idtrans`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `transstock` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
