-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Crasfy-C17
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Crasfy-C17
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Crasfy-C17` DEFAULT CHARACTER SET utf8 ;
USE `Crasfy-C17` ;

-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Productos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `stock` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `descuento` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `Categorias_id` INT NOT NULL,
  `Marcas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Productos_Categorias1_idx` (`Categorias_id` ASC) VISIBLE,
  INDEX `fk_Productos_Marcas1_idx` (`Marcas_id` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Categorias1`
    FOREIGN KEY (`Categorias_id`)
    REFERENCES `Crasfy-C17`.`Categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Marcas1`
    FOREIGN KEY (`Marcas_id`)
    REFERENCES `Crasfy-C17`.`Marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Imagenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `Productos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Imagenes_Productos_idx` (`Productos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Imagenes_Productos`
    FOREIGN KEY (`Productos_id`)
    REFERENCES `Crasfy-C17`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Historiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Historiales` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `stock` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `descuento` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `Marcas_id` INT NOT NULL,
  `Categorias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Historiales_Marcas1_idx` (`Marcas_id` ASC) VISIBLE,
  INDEX `fk_Historiales_Categorias1_idx` (`Categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_Historiales_Marcas1`
    FOREIGN KEY (`Marcas_id`)
    REFERENCES `Crasfy-C17`.`Marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historiales_Categorias1`
    FOREIGN KEY (`Categorias_id`)
    REFERENCES `Crasfy-C17`.`Categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Imagenes_Historiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Imagenes_Historiales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `Historiales_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Imagenes_Historiales_Historiales1_idx` (`Historiales_id` ASC) VISIBLE,
  CONSTRAINT `fk_Imagenes_Historiales_Historiales1`
    FOREIGN KEY (`Historiales_id`)
    REFERENCES `Crasfy-C17`.`Historiales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Carritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Carritos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Productos_id` INT NOT NULL,
  `Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Carritos_Productos1_idx` (`Productos_id` ASC) VISIBLE,
  INDEX `fk_Carritos_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Carritos_Productos1`
    FOREIGN KEY (`Productos_id`)
    REFERENCES `Crasfy-C17`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carritos_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `Crasfy-C17`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Ordenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Carritos_id` INT NOT NULL,
  `Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ordenes_Carritos1_idx` (`Carritos_id` ASC) VISIBLE,
  INDEX `fk_Ordenes_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ordenes_Carritos1`
    FOREIGN KEY (`Carritos_id`)
    REFERENCES `Crasfy-C17`.`Carritos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordenes_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `Crasfy-C17`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Crasfy-C17`.`Asides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Crasfy-C17`.`Asides` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Asides_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Asides_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `Crasfy-C17`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
