CREATE TABLE IF NOT EXISTS `bancos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(500) NULL,
  `sucursal` VARCHAR(500) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `cheques` (`codigo` INT(11) NOT NULL AUTO_INCREMENT, `codigo_banco` INT(11) NULL DEFAULT NULL, `fecha_emision` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_cobro` DATE NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `paguese_a` VARCHAR(500) NULL DEFAULT NULL,
  `titular_chequera` VARCHAR(500) NULL DEFAULT NULL,
  `numero` INT(11) NULL DEFAULT NULL,
  `referencia` VARCHAR(500) NULL DEFAULT NULL,
  `codigo_cliente` INT(11) NULL DEFAULT NULL,
  `codigo_proveedor` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_cheques_bancos1_idx` (`codigo_banco` ASC),
  CONSTRAINT `fk_cheques_bancos1`
    FOREIGN KEY (`codigo_banco`)
    REFERENCES `aaaa`.`bancos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1

517
