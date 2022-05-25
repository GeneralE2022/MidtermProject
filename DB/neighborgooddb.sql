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
  `id` INT NOT NULL AUTO_INCREMENT,
  `deed_id` INT NOT NULL,
  `recipient_id` INT NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (4, 'amccaw', 'amccaw', 1, 'user', 'Alcide', 'McCaw');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (5, 'smarcella', 'smarcella', 1, 'user', 'Shay', 'Marcella');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (6, 'rslimak', 'rslimak', 1, 'user', 'Ronit', 'Slimak');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (7, 'plaurole', 'plaurole', 1, 'user', 'Persa', 'Laurole');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (8, 'nedris', 'nedris', 1, 'user', 'Natura', 'Edris');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (9, 'ssomsana', 'ssomsana', 1, 'user', 'Shalom', 'Somsana');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (10, 'lgunther', 'lgunther', 1, 'user', 'Lealie', 'Gunther');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (11, 'msobin', 'msobin', 1, 'user', 'My', 'Sobin');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `role`, `first_name`, `last_name`) VALUES (12, 'zkleimola', 'zkleimola', 1, 'user', 'Zerlinda', 'Kleimola');

COMMIT;


-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (1, '000-000-0000', 'admin@neighborgood.com', '1-800-NOPE', '00 Nowhere Ln', 'Mayberry', 'NC', '13370', 1);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (2, '945-731-4953', 'emorgner@mail.net', NULL, '24 Sycamore', 'Mayberry', 'NC', '13370', 2);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (3, '131-495-4975', 'awittstein@mail.net', NULL, '12 Elm', 'Mayberry', 'NC', '13370', 3);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (4, '444-272-5823', 'amccaw@mail.net', NULL, '347 Baggett Terrace', 'Mayberry', 'NC', '13370', 4);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (5, '394-444-6099', 'smarcella@mail.net', NULL, '523 Cunha Dr', 'Mayberry', 'NC', '13370', 5);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (6, '918-663-7945', 'rslimak@mail.net', NULL, '809 Greenbriar Dr', 'Mayberry', 'NC', '13370', 6);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (7, '777-418-0720', 'plaurole@mail.net', NULL, '335 Free Union Rd', 'Mayberry', 'NC', '13370', 7);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (8, '402-688-0805', 'nedris@mail.net', NULL, '173 W 1000th St', 'Mayberry', 'NC', '13370', 8);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (9, '866-682-4245', 'ssomsana@mail.net', NULL, '104 Tambul Ln', 'Mayberry', 'NC', '13370', 9);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (10, '384-406-2005', 'lgunther@mail.net', NULL, '1616 S Morgan Ave', 'Mayberry', 'NC', '13370', 10);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (11, '983-638-1106', 'msobin@mail.net', NULL, '188 Easy Livin Acres Dr', 'Mayberry', 'NC', '13370', 11);
INSERT INTO `contact` (`id`, `phone`, `email`, `phone_2`, `street`, `city`, `state`, `zip_code`, `user_id`) VALUES (12, '513-873-5177', 'zkleimola@mail.net', NULL, '21727 Woodburn Rd', 'Mayberry', 'NC', '13370', 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `category` (`id`, `title`) VALUES (10, 'Home Improvement');
INSERT INTO `category` (`id`, `title`) VALUES (20, 'Yardwork');
INSERT INTO `category` (`id`, `title`) VALUES (30, 'Repair / Maintenance');
INSERT INTO `category` (`id`, `title`) VALUES (40, 'Petcare');

COMMIT;


-- -----------------------------------------------------
-- Data for table `subcategory`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (11, 'Plumbing', 10);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (12, 'Electric', 10);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (13, 'Window / Door', 10);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (14, 'Cleaning', 10);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (21, 'Weeding', 20);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (22, 'Raking', 20);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (23, 'Mowing', 20);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (24, 'Gardening', 20);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (25, 'Landscaping', 20);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (31, 'Automotive', 30);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (32, 'Appliance', 30);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (33, 'Computer', 30);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (41, 'Walking', 40);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (42, 'Sitting', 40);
INSERT INTO `subcategory` (`id`, `title`, `category_id`) VALUES (43, 'Grooming', 40);

COMMIT;


-- -----------------------------------------------------
-- Data for table `deed`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (1, 'Happy weeder', 'I am a happy weeder with extensive weeding experience in my own ginormous yard.', 2, 21);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (2, 'For Pete\'s Rake!', 'I can rake like a pro, and in the process have already busted 10 rakes! So you’ll need to lend me yours…', 3, 22);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (3, 'Lawnmower Man', 'No yard is safe from me and my Deluxe DOMINATOR Riding Mower! Just keep your pets out of range…', 4, 23);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (4, 'Seed in the Big City', 'I specialize in urban gardening, ask me about planting your own vegetable garden! ', 5, 24);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (5, 'ZZ Chop', 'I am happiest with a hedge trimmer, contact me for your trimming needs. I do beards too. ', 6, 25);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (6, 'Don\'t Poop Where You Eat', 'I know the difference between a toilet plunger and a sink plunger. I think that’s proof enough.', 7, 11);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (7, 'Raiders of the Lost Spark', 'Volts, watts, ohms, you name it — I have all the formulas written on the back of my hand in sharpie.', 8, 12);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (8, 'No Pane, No Gain', 'Some people say ‘you’d make a better window than a door\'. I can make both.', 9, 13);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (9, 'Microfiber, macro talent', 'Do you know there is a dusty ledge INSIDE your drawers? I do, and I’ll clean it for you.', 10, 14);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (10, 'Chatty Catty', 'I love animals, especially cats. I\'m a caring individual who loves meeting new neighbors and helping those in need.', 11, 41);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (11, 'Varisty Vet', 'Hi! I\'m a senior in high school with a passion for our furry friends. I have tons of experience pet sitting. Please contact me if you\'re going on vacation and need someone to take care of your pet. References available upon request.', 12, 42);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (12, 'Pliocene Pro', 'Is your mastodon\'s mane get ratty? Contact me, and I\'ll get it sorted out. I graduated from the Mastodon School of Pet Grooming in 2013 and have many happy clients.', 2, 43);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (13, 'Wiper Fluid Included', 'Brakes, shocks, mufflers -- all parts of a car. I can only fix your windshield though.', 3, 31);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (14, 'Just Chillin\'', 'Fridge and freezer dude. Love the smell of R600A in the morning.', 4, 32);
INSERT INTO `deed` (`id`, `title`, `description`, `provider_id`, `subcategory_id`) VALUES (15, 'Chomping at the bits', 'I will fix your computer and wait until I leave to shame you.', 5, 33);

COMMIT;


-- -----------------------------------------------------
-- Data for table `deed_transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborgooddb`;
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (1, 1, 12, '2022-03-04');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (2, 2, 11, '2022-03-11');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (3, 3, 10, '2022-03-15');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (4, 4, 9, '2022-03-18');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (5, 5, 8, '2022-03-24');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (6, 6, 7, '2022-03-28');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (7, 7, 6, '2022-03-29');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (8, 8, 5, '2022-03-31');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (9, 9, 4, '2022-04-01');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (10, 10, 3, '2022-04-15');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (11, 11, 2, '2022-04-19');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (12, 12, 12, '2022-04-20');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (13, 13, 11, '2022-04-26');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (14, 14, 10, '2022-05-05');
INSERT INTO `deed_transaction` (`id`, `deed_id`, `recipient_id`, `provided_date`) VALUES (15, 15, 9, '2022-05-20');

COMMIT;

