-- MySQL Script generated by MySQL Workbench
-- Wed Mar 17 16:01:57 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`host`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`host` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_account_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_host_user_account_idx` (`user_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_host_user_account`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `mydb`.`user_account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`volunteer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`volunteer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_account_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_volunteer_user_account1_idx` (`user_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_volunteer_user_account1`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `mydb`.`user_account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`worksite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`worksite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `capacity_max` INT NULL,
  `name` VARCHAR(45) NULL,
  `host_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_worksite_host1_idx` (`host_id` ASC) VISIBLE,
  CONSTRAINT `fk_worksite_host1`
    FOREIGN KEY (`host_id`)
    REFERENCES `mydb`.`host` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`worksite_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`worksite_activity` (
  `worksite_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  PRIMARY KEY (`worksite_id`, `activity_id`),
  INDEX `fk_worksite_has_activity_activity1_idx` (`activity_id` ASC) VISIBLE,
  INDEX `fk_worksite_has_activity_worksite1_idx` (`worksite_id` ASC) VISIBLE,
  CONSTRAINT `fk_worksite_has_activity_worksite1`
    FOREIGN KEY (`worksite_id`)
    REFERENCES `mydb`.`worksite` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_worksite_has_activity_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `mydb`.`activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`request_subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`request_subscription` (
  `worksite_id` INT NOT NULL,
  `volunteer_id` INT NOT NULL,
  `presence` TINYINT NULL,
  PRIMARY KEY (`worksite_id`, `volunteer_id`),
  INDEX `fk_worksite_has_volunteer_volunteer1_idx` (`volunteer_id` ASC) VISIBLE,
  INDEX `fk_worksite_has_volunteer_worksite1_idx` (`worksite_id` ASC) VISIBLE,
  CONSTRAINT `fk_worksite_has_volunteer_worksite1`
    FOREIGN KEY (`worksite_id`)
    REFERENCES `mydb`.`worksite` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_worksite_has_volunteer_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`skill_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`skill_level` (
  `volunteer_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `level` INT NULL,
  PRIMARY KEY (`volunteer_id`, `activity_id`),
  INDEX `fk_volunteer_has_activity_activity1_idx` (`activity_id` ASC) VISIBLE,
  INDEX `fk_volunteer_has_activity_volunteer1_idx` (`volunteer_id` ASC) VISIBLE,
  CONSTRAINT `fk_volunteer_has_activity_volunteer1`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `mydb`.`volunteer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_volunteer_has_activity_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `mydb`.`activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
