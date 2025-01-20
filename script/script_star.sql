-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema star_schema_professor
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema star_schema_professor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `star_schema_professor` DEFAULT CHARACTER SET utf8 ;
USE `star_schema_professor` ;

-- -----------------------------------------------------
-- Table `star_schema_professor`.`Dim_professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_schema_professor`.`Dim_professor` (
  `id_professor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(100) NOT NULL,
  `especialidade_professor` VARCHAR(100) NULL,
  `titulacao` VARCHAR(50) NULL,
  PRIMARY KEY (`id_professor`),
  UNIQUE INDEX `idDim_professor_UNIQUE` (`id_professor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_schema_professor`.`Dim_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_schema_professor`.`Dim_curso` (
  `id_curso` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(100) NOT NULL,
  `carga_horaria` INT NULL,
  `nivel` VARCHAR(50) NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE INDEX `id_curso_UNIQUE` (`id_curso` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_schema_professor`.`Dim_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_schema_professor`.`Dim_departamento` (
  `id_departamento` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_departamento` VARCHAR(100) NULL,
  `localizacao` VARCHAR(100) NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_schema_professor`.`Dim_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_schema_professor`.`Dim_Data` (
  `id_Data` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_completa` DATE NOT NULL,
  `ano` INT NOT NULL,
  `mes` INT NOT NULL,
  `dia` INT NOT NULL,
  `dia_da_semana` VARCHAR(20) NULL,
  `trimestre` VARCHAR(10) NULL,
  PRIMARY KEY (`id_Data`),
  UNIQUE INDEX `id_Data_UNIQUE` (`id_Data` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_schema_professor`.`Fato_professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_schema_professor`.`Fato_professores` (
  `id_professores` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `qtd_alunos` INT NULL,
  `carga_horaria_total` INT NULL,
  `avaliacao_media` FLOAT NULL,
  `fk_id_departamento` INT UNSIGNED NOT NULL,
  `fk_id_curso` INT UNSIGNED NOT NULL,
  `fk_id_Data` INT UNSIGNED NOT NULL,
  `fk_id_professor` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_professores`, `fk_id_departamento`, `fk_id_curso`, `fk_id_Data`, `fk_id_professor`),
  UNIQUE INDEX `idFato_professores_UNIQUE` (`id_professores` ASC) VISIBLE,
  INDEX `fk_Fato_professores_Dim_departamento_idx` (`fk_id_departamento` ASC) VISIBLE,
  INDEX `fk_Fato_professores_Dim_curso1_idx` (`fk_id_curso` ASC) VISIBLE,
  INDEX `fk_Fato_professores_Dim_Data1_idx` (`fk_id_Data` ASC) VISIBLE,
  INDEX `fk_Fato_professores_Dim_professor1_idx` (`fk_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_Fato_professores_Dim_departamento`
    FOREIGN KEY (`fk_id_departamento`)
    REFERENCES `star_schema_professor`.`Dim_departamento` (`id_departamento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fato_professores_Dim_curso1`
    FOREIGN KEY (`fk_id_curso`)
    REFERENCES `star_schema_professor`.`Dim_curso` (`id_curso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fato_professores_Dim_Data1`
    FOREIGN KEY (`fk_id_Data`)
    REFERENCES `star_schema_professor`.`Dim_Data` (`id_Data`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fato_professores_Dim_professor1`
    FOREIGN KEY (`fk_id_professor`)
    REFERENCES `star_schema_professor`.`Dim_professor` (`id_professor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
