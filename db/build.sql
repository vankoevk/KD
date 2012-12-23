SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_account` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`user_account` (
  `uid` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `password_md5` VARCHAR(20) NOT NULL ,
  `email` VARCHAR(40) NULL ,
  `profile` LONGBLOB NULL ,
  `signature` VARCHAR(400) NULL ,
  `active` TINYINT(1) NULL DEFAULT 0 ,
  `total_posts` BIGINT UNSIGNED NOT NULL ,
  `date_created` DATETIME NOT NULL ,
  `date-modified` DATETIME NOT NULL ,
  `deleted` TINYINT(1) NULL DEFAULT 0 ,
  PRIMARY KEY (`uid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`forum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`forum` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`forum` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(100) NULL ,
  `date_created` VARCHAR(45) NOT NULL ,
  `date_modified` VARCHAR(45) NOT NULL ,
  `deleted` VARCHAR(45) NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`topic` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`topic` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `forum` INT UNSIGNED NOT NULL ,
  `uid` BIGINT NULL ,
  `date_created` DATETIME NOT NULL ,
  `date_modified` DATETIME NOT NULL ,
  `deleted` TINYINT(1) NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`post` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`post` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `topic` INT UNSIGNED NOT NULL ,
  `uid` INT UNSIGNED NOT NULL ,
  `content` VARCHAR(4000) NULL ,
  `date_created` DATETIME NOT NULL ,
  `date_deleted` DATETIME NOT NULL ,
  `deleted` TINYINT(1) NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
