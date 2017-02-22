-- MySQL Script generated by MySQL Workbench
-- 02/21/17 23:11:52
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`petstore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`petstore` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`petstore` (
  `pst_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `pst_name` VARCHAR(30) NOT NULL COMMENT '',
  `pst_street` VARCHAR(30) NOT NULL COMMENT '',
  `pst_city` VARCHAR(30) NOT NULL COMMENT '',
  `pst_state` CHAR(2) NOT NULL COMMENT '',
  `pst_zip` INT(9) UNSIGNED NOT NULL COMMENT '',
  `pst_phone` BIGINT UNSIGNED NOT NULL COMMENT '',
  `pst_email` VARCHAR(100) NOT NULL COMMENT '',
  `pst_url` VARCHAR(100) NOT NULL COMMENT '',
  `pst_ytd_sales` DECIMAL(10,2) UNSIGNED NOT NULL COMMENT '',
  `pst_notes` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`pst_id`)  COMMENT '')
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`customer` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `cus_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `cus_fname` VARCHAR(15) NOT NULL COMMENT '',
  `cus_lname` VARCHAR(30) NOT NULL COMMENT '',
  `cus_street` VARCHAR(30) NOT NULL COMMENT '',
  `cus_city` VARCHAR(30) NOT NULL COMMENT '',
  `cus_state` CHAR(2) NOT NULL COMMENT '',
  `cus_zip` INT UNSIGNED NOT NULL COMMENT '',
  `cus_phone` BIGINT UNSIGNED NOT NULL COMMENT '',
  `cus_email` VARCHAR(100) NOT NULL COMMENT '',
  `cus_balance` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '',
  `cus_total_sales` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '',
  `cus_notes` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`cus_id`)  COMMENT '')
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pet` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`pet` (
  `pet_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `pst_id` SMALLINT UNSIGNED NOT NULL COMMENT '',
  `cus_id` SMALLINT UNSIGNED NULL COMMENT '',
  `pet_type` VARCHAR(45) NOT NULL COMMENT '',
  `pet_sex` ENUM('m', 'f') NOT NULL COMMENT '',
  `pet_cost` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '',
  `pet_price` DECIMAL(6,2) UNSIGNED NOT NULL COMMENT '',
  `pet_age` TINYINT UNSIGNED NOT NULL COMMENT '',
  `pet_color` VARCHAR(30) NOT NULL COMMENT '',
  `pet_sale_date` DATE NULL COMMENT '',
  `pet_vaccine` ENUM('y', 'n') NOT NULL COMMENT '',
  `pet_neuter` ENUM('y', 'n') NOT NULL COMMENT '',
  `pet_notes` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`pet_id`)  COMMENT '',
  INDEX `fk_pet_petstore_idx` (`pst_id` ASC)  COMMENT '',
  INDEX `fk_pet_customer1_idx` (`cus_id` ASC)  COMMENT '',
  CONSTRAINT `fk_pet_petstore`
    FOREIGN KEY (`pst_id`)
    REFERENCES `mydb`.`petstore` (`pst_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_customer1`
    FOREIGN KEY (`cus_id`)
    REFERENCES `mydb`.`customer` (`cus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`petstore`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'Pet Smart', '123 main st', 'tallahassee', 'fl', 32301, 8503721234, 'petsmart@psmart.com', 'petsmart.com', 78000.23, NULL);
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'Petco', '42 elm st', 'atlanta', 'ga', 74983, 7643283002, 'petco@pco.org', 'petco.org', 50378.33, 'petco doing okay');
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'pets-r-us', '743 park ave', 'nashville', 'tn', 83921, 9483928304, 'petsrus@prus.net', 'petsrus.net', 8473.80, 'not doing well');
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'petme', '7832 72nd st', 'new york', 'ny', 88293, 7385274673, 'petme@pme.com', 'petme.com', 100231.03, '');
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'come see pets', '65 buckeye ave', 'yuba city', 'ca', 22351, 1482038210, 'comeseepets@csp.org', 'comseepets.org', 74213.22, NULL);
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'all around pets', '8231 tree hill dr', 'raleigh', 'nc', 46512, 7428921456, 'allaroundpets@aap.com', 'allaroundpets.com', 89537.69, 'profits increased this year');
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'pets are here', '78 tutalage st', 'austin', 'tx', 89385, 7582958210, 'petsarehere@pah.com', 'petsarehere.com', 45782.06, NULL);
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'pet market', '1001 akrange dr', 'monticello', 'fl', 32313, 8507621132, 'petmarket@pm.net', 'petmarket.net', 25002.22, 'nothing new to report');
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'pets pets pets', '88 34th st', 'savannah', 'ga', 75321, 6713590312, 'petspetspets@ppp.org', 'petspetspets.org', 57239.78, NULL);
INSERT INTO `mydb`.`petstore` (`pst_id`, `pst_name`, `pst_street`, `pst_city`, `pst_state`, `pst_zip`, `pst_phone`, `pst_email`, `pst_url`, `pst_ytd_sales`, `pst_notes`) VALUES (DEFAULT, 'see our pets', '234 belle st', 'dallas', 'tx', 83923, 7582937024, 'seeourpets@sop.com', 'seeourpets.com', 105230.93, 'excelling');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'taylor', 'williams', '200 main ave', 'denver', 'co', 83942, 18497430182, 'twilliams@gmail.com', 732.93, 903.93, 'no notes');
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'greg', 'bachelor', '322 walt st', 'san diego', 'ca', 73032, 10392358292, 'gbachelor@aol.com', 102.00, 201.58, NULL);
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'tommy', 'jones', '2058 connor dr', 'las vegas', 'nv', 74632, 29308352983, 'tjones@yahoo.com', 95.24, 302.78, NULL);
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'dante', 'hightower', '785 youli cir', 'new york', 'ny', 95343, 75823085385, 'dhightower@gmail.com', 72.30, 338.98, 'needs to be called tomorrow');
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'aarron', 'murray', '300 32n ave', 'charleston', 'sc', 94021, 75576293058, 'amurray@gmail.com', 122.83, 298.45, NULL);
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'justin', 'williams', '42 e ave', 'raleigh', 'nc', 23198, 75278305502, 'jwilliams@gmail.com', 402.40, 409.78, 'nothing new');
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'forest', 'whittaker', '6042 hooli dr', 'seattle', 'wa', 38922, 23580257022, 'fwhittaker@yahoo.com', 210.12, 478.21, NULL);
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'carl', 'lewis', '700 spooner st', 'savannah', 'ga', 23752, 89023521033, 'clewis@aol.com', 300.88, 343.00, 'check account');
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'bo', 'jackson', '302 walker ave', 'austin', 'tx', 83922, 72357025283, 'bjackson@yahoo.com', 38.29, 104.54, NULL);
INSERT INTO `mydb`.`customer` (`cus_id`, `cus_fname`, `cus_lname`, `cus_street`, `cus_city`, `cus_state`, `cus_zip`, `cus_phone`, `cus_email`, `cus_balance`, `cus_total_sales`, `cus_notes`) VALUES (DEFAULT, 'herschel', 'walker', '472 akura cir', 'tallahassee', 'fl', 38921, 12354829520, 'hwalker@gmail.com', 77.82, 99.01, 'account notice');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 1, 5, 'jack russell terrior', 'm', 125, 200, 3, 'brown', '2010-02-24', 'y', 'n', 'lazy dog');
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 2, 4, 'doberman', 'm', 50, 75, 7, 'purple', NULL, 'n', 'n', NULL);
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 3, 3, 'golden retriever', 'f', 200, 100, 3, 'yellow', '2009-07-05', 'n', 'y', 'excitable');
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 4, 2, 'anatolian shepherd', 'm', 180, 125, 8, 'blonde', NULL, 'y', 'y', NULL);
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 5, 1, 'husky', 'f', 350, 610, 2, 'orange', NULL, 'n', 'y', NULL);
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 4, 5, 'corgy', 'f', 75, 25, 9, 'blue', '2012-03-30', 'y', 'n', NULL);
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 3, 4, 'poodle', 'm', 130, 200, 2, 'indigo', '2014-01-22', 'y', 'y', 'Needs training');
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 2, 3, 'doxin', 'f', 80, 260, 5, 'teal', NULL, 'y', 'n', NULL);
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 1, 2, 'labrador', 'm', 230, 210, 7, 'black', '2013-10-02', 'n', 'n', 'Nothing new');
INSERT INTO `mydb`.`pet` (`pet_id`, `pst_id`, `cus_id`, `pet_type`, `pet_sex`, `pet_cost`, `pet_price`, `pet_age`, `pet_color`, `pet_sale_date`, `pet_vaccine`, `pet_neuter`, `pet_notes`) VALUES (DEFAULT, 5, 1, 'shitzu', 'f', 205, 180, 1, 'red', NULL, 'n', 'y', 'notes');

COMMIT;

