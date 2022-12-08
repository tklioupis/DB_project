-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ErasmusDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ErasmusDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ErasmusDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ErasmusDB` ;

-- -----------------------------------------------------
-- Table `ErasmusDB`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Students` (
  `id` INT NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `semester` INT NOT NULL,
  `department` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NULL DEFAULT NULL,
  `phone_number` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Receiving_Institutions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Receiving_Institutions` (
  `erasmus_code` CHAR(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(30) NOT NULL,
  `country` VARCHAR(60) NOT NULL,
  `street` VARCHAR(30) NULL,
  `city` VARCHAR(30) NOT NULL,
  `zip` INT NULL,
  PRIMARY KEY (`erasmus_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Applications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Applications` (
  `application_#` INT(7) NOT NULL,
  `submition_date` DATE NOT NULL,
  `cv` VARCHAR(50) NOT NULL,
  `ToR` VARCHAR(50) NOT NULL,
  `Motivational_letter` VARCHAR(50) NOT NULL,
  `mobility_semester` ENUM('Winter', 'Spring') NOT NULL,
  `students_id` INT(7) NULL,
  `erasmus_code` CHAR(11) NULL,
  PRIMARY KEY (`application_#`),
  INDEX `students_id_idx` (`students_id` ASC) VISIBLE,
  INDEX `erasmus_code_idx` (`erasmus_code` ASC) VISIBLE,
  CONSTRAINT `students_id`
    FOREIGN KEY (`students_id`)
    REFERENCES `ErasmusDB`.`Students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `erasmus_code`
    FOREIGN KEY (`erasmus_code`)
    REFERENCES `ErasmusDB`.`Receiving_Institutions` (`erasmus_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Erasmus_Offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Erasmus_Offices` (
  `email` VARCHAR(60) NOT NULL,
  `head` VARCHAR(60) NULL,
  `phone_number` INT(14) NULL,
  `erasmus_code` CHAR(11) NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_Erasmus_Offices_Receiving_Institutions1_idx` (`erasmus_code` ASC) VISIBLE,
  CONSTRAINT `fk_Erasmus_Offices_Receiving_Institutions1`
    FOREIGN KEY (`erasmus_code`)
    REFERENCES `ErasmusDB`.`Receiving_Institutions` (`erasmus_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`AUTH_ECTS_Coordinators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`AUTH_ECTS_Coordinators` (
  `email` VARCHAR(60) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `phone` INT(14) NULL,
  `department` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Learning_Agreements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Learning_Agreements` (
  `la_#` INT(7) NOT NULL,
  `status` ENUM('Pending', 'Submitted', 'Signed_by_AUTH', 'Approved') NOT NULL,
  `signature_date_auth _ects_coordinators` DATE NULL,
  `signature_date_eras mus_offices` DATE NULL,
  `students_id` INT NULL,
  `email_erasmus_offices` VARCHAR(60) NULL,
  `email_auth_ects_coordinators` VARCHAR(60) NULL,
  PRIMARY KEY (`la_#`),
  INDEX `fk_Learning_Agreements_Students1_idx` (`students_id` ASC) VISIBLE,
  INDEX `fk_Learning_Agreements_Erasmus_Offices1_idx` (`email_erasmus_offices` ASC) VISIBLE,
  INDEX `fk_Learning_Agreements_AUTH_ECTS_Coordinators1_idx` (`email_auth_ects_coordinators` ASC) VISIBLE,
  CONSTRAINT `fk_Learning_Agreements_Students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `ErasmusDB`.`Students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Learning_Agreements_Erasmus_Offices1`
    FOREIGN KEY (`email_erasmus_offices`)
    REFERENCES `ErasmusDB`.`Erasmus_Offices` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Learning_Agreements_AUTH_ECTS_Coordinators1`
    FOREIGN KEY (`email_auth_ects_coordinators`)
    REFERENCES `ErasmusDB`.`AUTH_ECTS_Coordinators` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Departments` (
  `field_of_study` VARCHAR(60) NOT NULL,
  `building_#` INT NULL,
  `website` TEXT NOT NULL,
  `erasmus_code` CHAR(11) NOT NULL,
  INDEX `fk_Departments_Receiving_Institutions1_idx` (`erasmus_code` ASC) VISIBLE,
  PRIMARY KEY (`field_of_study`, `erasmus_code`),
  CONSTRAINT `fk_Departments_Receiving_Institutions1`
    FOREIGN KEY (`erasmus_code`)
    REFERENCES `ErasmusDB`.`Receiving_Institutions` (`erasmus_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Subjects` (
  `subject_code` VARCHAR(30) NOT NULL,
  `ECTS` INT NOT NULL,
  `semester` INT NOT NULL,
  `title` VARCHAR(30) NOT NULL,
  `field_of_study` VARCHAR(60) NOT NULL,
  `erasmus_code` CHAR(11) NOT NULL,
  PRIMARY KEY (`field_of_study`, `erasmus_code`, `subject_code`),
  INDEX `fk_Subjects_Departments1_idx` (`field_of_study` ASC, `erasmus_code` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_Departments1`
    FOREIGN KEY (`field_of_study` , `erasmus_code`)
    REFERENCES `ErasmusDB`.`Departments` (`field_of_study` , `erasmus_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Accommodation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Accommodation` (
  `listing_id` INT NOT NULL,
  `price` INT NOT NULL,
  `type` ENUM('Private_Room', 'Shared_Room', 'Private_Apartment', 'Private_Dorm', 'Shared_Dorm') NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `zip` INT NOT NULL,
  `website` TEXT NULL,
  `phone_number` INT(14) NULL,
  PRIMARY KEY (`listing_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Receiving_Institutions_has_Accommodation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Receiving_Institutions_has_Accommodation` (
  `Receiving_Institutions_erasmus_code` CHAR(11) NOT NULL,
  `Accommodation_listing_id` INT NOT NULL,
  PRIMARY KEY (`Receiving_Institutions_erasmus_code`, `Accommodation_listing_id`),
  INDEX `fk_Receiving_Institutions_has_Accommodation_Accommodation1_idx` (`Accommodation_listing_id` ASC) VISIBLE,
  INDEX `fk_Receiving_Institutions_has_Accommodation_Receiving_Insti_idx` (`Receiving_Institutions_erasmus_code` ASC) VISIBLE,
  CONSTRAINT `fk_Receiving_Institutions_has_Accommodation_Receiving_Institu1`
    FOREIGN KEY (`Receiving_Institutions_erasmus_code`)
    REFERENCES `ErasmusDB`.`Receiving_Institutions` (`erasmus_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Receiving_Institutions_has_Accommodation_Accommodation1`
    FOREIGN KEY (`Accommodation_listing_id`)
    REFERENCES `ErasmusDB`.`Accommodation` (`listing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErasmusDB`.`Learning_Agreements_has_Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ErasmusDB`.`Learning_Agreements_has_Subjects` (
  `Learning_Agreements_la_#` INT(7) NOT NULL,
  `Subjects_field_of_study` VARCHAR(60) NOT NULL,
  `Subjects_erasmus_code` CHAR(11) NOT NULL,
  `Subjects_subject_code` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Learning_Agreements_la_#`, `Subjects_field_of_study`, `Subjects_erasmus_code`, `Subjects_subject_code`),
  INDEX `fk_Learning_Agreements_has_Subjects_Subjects1_idx` (`Subjects_field_of_study` ASC, `Subjects_erasmus_code` ASC, `Subjects_subject_code` ASC) VISIBLE,
  INDEX `fk_Learning_Agreements_has_Subjects_Learning_Agreements1_idx` (`Learning_Agreements_la_#` ASC) VISIBLE,
  CONSTRAINT `fk_Learning_Agreements_has_Subjects_Learning_Agreements1`
    FOREIGN KEY (`Learning_Agreements_la_#`)
    REFERENCES `ErasmusDB`.`Learning_Agreements` (`la_#`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Learning_Agreements_has_Subjects_Subjects1`
    FOREIGN KEY (`Subjects_field_of_study` , `Subjects_erasmus_code` , `Subjects_subject_code`)
    REFERENCES `ErasmusDB`.`Subjects` (`field_of_study` , `erasmus_code` , `subject_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
