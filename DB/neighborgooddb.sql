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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_2` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` VARCHAR(15) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_contact_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `title` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subcategory` ;

CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subcategory_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_subcategory_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `deed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deed` ;

CREATE TABLE IF NOT EXISTS `deed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(150) NOT NULL,
  `description` VARCHAR(2000) NULL,
  `provider_id` INT NOT NULL,
  `subcategory_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`provider_id` ASC),
  INDEX `fk_deed_subcategory1_idx` (`subcategory_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`provider_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deed_subcategory1`
    FOREIGN KEY (`subcategory_id`)
    REFERENCES `subcategory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `deed_transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deed_transaction` ;

CREATE TABLE IF NOT EXISTS `deed_transaction` (
  `id` INT NOT NULL,
  `deed_id` INT NOT NULL,
  `recipient_id` INT NOT NULL,
  `provided_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_deed_transaction_deed1_idx` (`deed_id` ASC),
  INDEX `fk_deed_transaction_user1_idx` (`recipient_id` ASC),
  CONSTRAINT `fk_deed_transaction_deed1`
    FOREIGN KEY (`deed_id`)
    REFERENCES `deed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_deed_transaction_user1`
    FOREIGN KEY (`recipient_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (1, 'admin', 'admin', 1, 'admin', 'admin', 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (2, 'emorgner', 'emorgner', 1, 'user', 'Eirik', 'Morgner');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (3, 'awettstein', 'awettstein', 1, 'user', 'Ailin', 'Wettstein');

COMMIT;


-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (1, '000-000-0000', 'admin@neighborgood.com', NULL, '00 Nowhere Ln', 'Mayberry', 'NC', '13370', 1);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (2, '945-731-4953', 'emorgner@mail.net', NULL, '24 Sycamore', 'Mayberry', 'NC', '13370', 2);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (3, '131-495-4975', 'awittstein@mail.net', NULL, '12 Elm', 'Mayberry', 'NC', '13370', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `category` (`id`, `title`) VALUES (20, 'Yardwork');

COMMIT;


-- -----------------------------------------------------
-- Data for table `subcategory`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (21, 'Weeding', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `deed`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (1, 'Happy weeder', 'I am a happy weeder with extensive weeding experience in my own ginormous yard.', 2, 21);

COMMIT;


-- -----------------------------------------------------
-- Data for table `deed_transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (1, 1, 3, '2022-05-20');

COMMIT;

