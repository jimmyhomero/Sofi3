-- MySQL Script generated by MySQL Workbench
-- Sun Sep 24 00:24:27 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sofi
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sofi` ;

-- -----------------------------------------------------
-- Schema sofi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sofi` DEFAULT CHARACTER SET utf8 ;
USE `sofi` ;

-- -----------------------------------------------------
-- Table `sofi`.`Tipos_Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Tipos_Usuarios` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Tipos_Usuarios` (
  `codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(95) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `sofi`.`usuarios` (
  `codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(50) NOT NULL,
  `Nombres` VARCHAR(35) NOT NULL,
  `Telefono` VARCHAR(40) NOT NULL,
  `Celular` VARCHAR(40) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `Direccion` VARCHAR(150) NOT NULL,
  `Usuario` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `Estado` VARCHAR(15) NOT NULL,
  `Tipo_Usuario_codigo` INT(100) NOT NULL,
  PRIMARY KEY (`codigo`, `Tipo_Usuario_codigo`),
  INDEX `fk_usuarios_Tipo_Usuario1_idx` (`Tipo_Usuario_codigo` ASC),
  CONSTRAINT `fk_usuarios_Tipo_Usuario1`
    FOREIGN KEY (`Tipo_Usuario_codigo`)
    REFERENCES `sofi`.`Tipos_Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sofi`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Clientes` (
  `codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(50) NOT NULL,
  `Nombres` VARCHAR(35) NOT NULL,
  `Telefono` VARCHAR(40) NULL,
  `Celular` VARCHAR(40) NULL,
  `mail` VARCHAR(50) NULL,
  `Direccion` VARCHAR(150) NULL,
  `Provincia` VARCHAR(95) NULL,
  `Ciudad` VARCHAR(15) NULL,
  `Nacionalidad` VARCHAR(75) NULL,
  `PagoPredeterminado` INT(100) NULL,
  `TipoCliente` INT(100) NULL,
  `VendedorPredeterminado` INT(100) NULL,
  `Observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sofi`.`Permisos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Permisos` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Permisos` (
  `codigo` INT(200) NOT NULL AUTO_INCREMENT,
  `Permiso` VARCHAR(45) NOT NULL,
  `Tipos_Usuarios_codigo` INT(100) NOT NULL,
  PRIMARY KEY (`codigo`, `Tipos_Usuarios_codigo`),
  INDEX `fk_Permisos_Tipos_de Usuarios_idx` (`Tipos_Usuarios_codigo` ASC),
  CONSTRAINT `fk_Permisos_Tipos_de Usuarios`
    FOREIGN KEY (`Tipos_Usuarios_codigo`)
    REFERENCES `sofi`.`Tipos_Usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`Marcas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Marcas` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Marcas` (
  `Codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(80) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`Modelos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Modelos` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Modelos` (
  `Codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(75) NOT NULL,
  `Descripcion` VARCHAR(105) NULL,
  `Marcas_Codigo` INT(100) NOT NULL,
  PRIMARY KEY (`Codigo`, `Marcas_Codigo`),
  INDEX `fk_Modelos_Marcas1_idx` (`Marcas_Codigo` ASC),
  CONSTRAINT `fk_Modelos_Marcas1`
    FOREIGN KEY (`Marcas_Codigo`)
    REFERENCES `sofi`.`Marcas` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Productos` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Productos` (
  `Codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `producto` VARCHAR(145) NOT NULL,
  `codigoAlterno` VARCHAR(45) NULL,
  `codigoBarras` VARCHAR(45) NULL,
  `costo` VARCHAR(45) NULL,
  `utilidad` VARCHAR(45) NULL,
  `pvp` VARCHAR(45) NULL,
  `cantidad` VARCHAR(45) NULL,
  `unidades` VARCHAR(45) NULL,
  `ubicacion` VARCHAR(45) NULL,
  `observacion` VARCHAR(245) NULL,
  `minimo` VARCHAR(45) NULL,
  `maximo` VARCHAR(45) NULL,
  `garantia` VARCHAR(45) NULL,
  `Modelos_Codigo` INT(100) NOT NULL,
  `Modelos_Marcas_Codigo` INT(100) NOT NULL,
  PRIMARY KEY (`Codigo`, `Modelos_Codigo`, `Modelos_Marcas_Codigo`),
  INDEX `fk_Productos_Modelos1_idx` (`Modelos_Codigo` ASC, `Modelos_Marcas_Codigo` ASC),
  CONSTRAINT `fk_Productos_Modelos1`
    FOREIGN KEY (`Modelos_Codigo` , `Modelos_Marcas_Codigo`)
    REFERENCES `sofi`.`Modelos` (`Codigo` , `Marcas_Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`config`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`config` ;

CREATE TABLE IF NOT EXISTS `sofi`.`config` (
  `codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `valor1` VARCHAR(45) NULL,
  `valor2` VARCHAR(45) NULL,
  `valor3` VARCHAR(45) NULL,
  `valor4` VARCHAR(45) NULL,
  `valor5` VARCHAR(45) NULL,
  `valor6` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Factura` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Factura` (
  `Codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `hora` TIMESTAMP(1) NULL,
  `iva` VARCHAR(10) NULL,
  `subtotaI_con_iva` VARCHAR(45) NULL,
  `subtotal_sin_iva` VARCHAR(45) NULL,
  `total` VARCHAR(45) NULL,
  `utilidad` VARCHAR(45) NULL,
  `tipo_documento` VARCHAR(45) NULL,
  `descuento` VARCHAR(45) NULL,
  `Clientes_codigo` INT(100) NOT NULL,
  `Usuarios_Codigo` INT(100) NOT NULL,
  `Equipos` VARCHAR(75) NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Factura_Clientes1_idx` (`Clientes_codigo` ASC),
  INDEX `fk_Factura_usuarios1_idx` (`Usuarios_Codigo` ASC),
  CONSTRAINT `fk_Factura_Clientes1`
    FOREIGN KEY (`Clientes_codigo`)
    REFERENCES `sofi`.`Clientes` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_usuarios1`
    FOREIGN KEY (`Usuarios_Codigo`)
    REFERENCES `sofi`.`usuarios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`DetalleFactura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`DetalleFactura` ;

CREATE TABLE IF NOT EXISTS `sofi`.`DetalleFactura` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `cantidad` VARCHAR(45) NULL,
  `detalle` VARCHAR(45) NULL,
  `iva` VARCHAR(45) NULL,
  `decuento` VARCHAR(45) NULL,
  `valorUnitario` VARCHAR(45) NULL,
  `valorTotal` VARCHAR(45) NULL,
  `Factura_Codigo` INT(100) NOT NULL,
  `Productos_Codigo` INT(100) NULL,
  `DetalleFacturacol` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`, `Factura_Codigo`),
  INDEX `fk_DetalleFactura_Factura1_idx` (`Factura_Codigo` ASC),
  INDEX `fk_DetalleFactura_Productos1_idx` (`Productos_Codigo` ASC),
  CONSTRAINT `fk_DetalleFactura_Factura1`
    FOREIGN KEY (`Factura_Codigo`)
    REFERENCES `sofi`.`Factura` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleFactura_Productos1`
    FOREIGN KEY (`Productos_Codigo`)
    REFERENCES `sofi`.`Productos` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sofi`.`Equipos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sofi`.`Equipos` ;

CREATE TABLE IF NOT EXISTS `sofi`.`Equipos` (
  `Codigo` INT(100) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  `Descipcion` VARCHAR(245) NULL,
  `usuario` VARCHAR(45) NULL,
  `responsable` VARCHAR(145) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;