-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema neighborgooddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `neighborgooddb` ;

-- -----------------------------------------------------
-- Schema neighborgooddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `neighborgooddb` DEFAULT CHARACTER SET utf8 ;
USE `neighborgooddb` ;

-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(12) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_2` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` VARCHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_initial` CHAR(1) NOT NULL,
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `contact_id_idx` (`contact_id` ASC),
  CONSTRAINT `contact_id`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `general` VARCHAR(45) NULL,
  `sub` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `deed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deed` ;

CREATE TABLE IF NOT EXISTS `deed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `category_id_idx` (`category_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `history` ;

CREATE TABLE IF NOT EXISTS `history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `services_provided` INT NULL,
  `services_used` INT NULL,
  `date_provided` DATETIME NULL,
  `date_used` DATETIME NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS nguser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'nguser'@'localhost' IDENTIFIED BY 'nguser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'nguser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (1, 'admin', 'admin', 1, 'admin', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (2, 'emorgner', 'emorgner', 1, 'user', 'Eirik', 'M', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (3, 'awettstein', 'awettstein', 1, 'user', 'Ailin', 'W', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (4, 'amccaw', 'amccaw', 1, 'user', 'Alcide', 'M', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (5, 'smarcella', 'smarcella', 1, 'user', 'Shay', 'M', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (6, 'rslimak', 'rslimak', 1, 'user', 'Ronit', 'S', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (7, 'plaurole', 'plaurole', 1, 'user', 'Persa', 'L', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (8, 'nedris', 'nedris', 1, 'user', 'Natura', 'E', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (9, 'ssomsana', 'ssomsana', 1, 'user', 'Shalom', 'S', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (10, 'lgunther', 'lgunther', 1, 'user', 'Lealie', 'G', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (11, 'msobin', 'msobin', 1, 'user', 'My', 'S', DEFAULT);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_initial`, `contact_id`) VALUES (12, 'zkleimola', 'zkleimola', 1, 'user', 'Zerlinda', 'K', DEFAULT);

COMMIT;

