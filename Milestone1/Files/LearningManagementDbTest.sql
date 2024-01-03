-- MySQL Script generated by MySQL Workbench
-- Mon Apr 10 12:59:20 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS LearningManagementDB;
CREATE DATABASE IF NOT EXISTS LearningManagementDB;
USE LearningManagementDB;
-- -----------------------------------------------------
-- Table `feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feedback` ;

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` INT NOT NULL,
  `feedback_name` VARCHAR(45) NULL,
  `feedback_time` DATETIME NULL,
  `feedback_content` VARCHAR(45) NULL,
  PRIMARY KEY (`feedback_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account` ;

CREATE TABLE IF NOT EXISTS `Account` (
  `account_id` INT NOT NULL,
  `account_type` VARCHAR(45) NULL,
  `Parent_parent_id` INT NOT NULL,
  `feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`account_id`, `Parent_parent_id`, `feedback_feedback_id`),
  INDEX `fk_Account_feedback1_idx` (`feedback_feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Account_feedback1`
    FOREIGN KEY (`feedback_feedback_id`)
    REFERENCES `feedback` (`feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student` ;

CREATE TABLE IF NOT EXISTS `Student` (
  `student_id` INT NOT NULL,
  `student_name` VARCHAR(45) NULL,
  `student_major` VARCHAR(45) NULL,
  `course_enrolled` VARCHAR(45) NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `Account_account_id`, `Account_Parent_parent_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Instructor` ;

CREATE TABLE IF NOT EXISTS `Instructor` (
  `instractors_id` INT NOT NULL,
  `Instructor_name` VARCHAR(45) NULL,
  `course_teaching` VARCHAR(45) NULL,
  `Account_account_id` INT NOT NULL,
  PRIMARY KEY (`instractors_id`, `Account_account_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Parent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Parent` ;

CREATE TABLE IF NOT EXISTS `Parent` (
  `parent_id` INT NOT NULL,
  `parent_name` VARCHAR(45) NULL,
  PRIMARY KEY (`parent_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Administrator` ;

CREATE TABLE IF NOT EXISTS `Administrator` (
  `administrator_id` INT NOT NULL,
  `administrator_name` VARCHAR(45) NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`administrator_id`, `Account_account_id`, `Account_Parent_parent_id`),
  INDEX `fk_Administrator_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Administrator_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Course` ;

CREATE TABLE IF NOT EXISTS `Course` (
  `course_id` INT NOT NULL,
  `course_schedule` DATETIME NULL,
  `course_description` VARCHAR(45) NULL,
  `course_name` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Assignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Assignment` ;

CREATE TABLE IF NOT EXISTS `Assignment` (
  `assignment_id` INT NOT NULL,
  `assignment_name` VARCHAR(45) NULL,
  `assignment_description` VARCHAR(45) NULL,
  `Assignmentcol` DATETIME NULL,
  `Assignmentcol1` DATETIME NULL,
  PRIMARY KEY (`assignment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Resource` ;

CREATE TABLE IF NOT EXISTS `Resource` (
  `resource_id` INT NOT NULL,
  `resource_name` VARCHAR(45) NULL,
  `resource_description` VARCHAR(45) NULL,
  PRIMARY KEY (`resource_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grade` ;

CREATE TABLE IF NOT EXISTS `Grade` (
  `grade_id` INT NOT NULL,
  `grade_result` VARCHAR(45) NULL,
  `grade_comment` VARCHAR(45) NULL,
  PRIMARY KEY (`grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Quiz` ;

CREATE TABLE IF NOT EXISTS `Quiz` (
  `quiz_id` INT NOT NULL,
  `quiz_content` VARCHAR(45) NULL,
  `quiz_answer` VARCHAR(45) NULL,
  PRIMARY KEY (`quiz_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Discussion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discussion` ;

CREATE TABLE IF NOT EXISTS `Discussion` (
  `discussion_id` INT NOT NULL,
  `discussion_name` VARCHAR(45) NULL,
  `discussion_datel` DATETIME NULL,
  `discussion_content` VARCHAR(45) NULL,
  PRIMARY KEY (`discussion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Annoucement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Annoucement` ;

CREATE TABLE IF NOT EXISTS `Annoucement` (
  `annoucement_id` INT NOT NULL,
  `annoucement_name` VARCHAR(45) NULL,
  `annoucement_date` DATETIME NULL,
  `annoucement_content` VARCHAR(45) NULL,
  PRIMARY KEY (`annoucement_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Contact` ;

CREATE TABLE IF NOT EXISTS `Contact` (
  `contact_id` INT NOT NULL,
  `contact_name` VARCHAR(45) NULL,
  `contact_info` VARCHAR(45) NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Certificate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Certificate` ;

CREATE TABLE IF NOT EXISTS `Certificate` (
  `certificate_id` INT NOT NULL,
  `certificate_name` VARCHAR(45) NULL,
  `certificate_date` VARCHAR(45) NULL,
  `certificate_content` VARCHAR(45) NULL,
  PRIMARY KEY (`certificate_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gender` ;

CREATE TABLE IF NOT EXISTS `Gender` (
  `gender_type` VARCHAR(45) NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  INDEX `fk_Gender_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Gender_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Quiz attemps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Quiz attemps` ;

CREATE TABLE IF NOT EXISTS `Quiz attemps` (
  `quiz_attempt_number` INT NULL,
  `Quiz_quiz_id` INT NOT NULL,
  INDEX `fk_Quiz attemps_Quiz1_idx` (`Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Quiz attemps_Quiz1`
    FOREIGN KEY (`Quiz_quiz_id`)
    REFERENCES `Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Attendance` ;

CREATE TABLE IF NOT EXISTS `Attendance` (
  `attendance_name` VARCHAR(45) NULL,
  `attendance_time` DATETIME NULL,
  `attendance_check` TINYINT NULL,
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  INDEX `fk_Attendance_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Attendance_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Assignment_has_Instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Assignment_has_Instructor` ;

CREATE TABLE IF NOT EXISTS `Assignment_has_Instructor` (
  `Assignment_assignment_id` INT NOT NULL,
  `Instructor_instractors_id` INT NOT NULL,
  `Instructor_Account_account_id` INT NOT NULL,
  PRIMARY KEY (`Assignment_assignment_id`, `Instructor_instractors_id`, `Instructor_Account_account_id`),
  INDEX `fk_Assignment_has_Instructor_Instructor1_idx` (`Instructor_instractors_id` ASC, `Instructor_Account_account_id` ASC) VISIBLE,
  INDEX `fk_Assignment_has_Instructor_Assignment1_idx` (`Assignment_assignment_id` ASC) VISIBLE,
  CONSTRAINT `fk_Assignment_has_Instructor_Assignment1`
    FOREIGN KEY (`Assignment_assignment_id`)
    REFERENCES `Assignment` (`assignment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignment_has_Instructor_Instructor1`
    FOREIGN KEY (`Instructor_instractors_id` , `Instructor_Account_account_id`)
    REFERENCES `Instructor` (`instractors_id` , `Account_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Assignment_has_Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Assignment_has_Student` ;

CREATE TABLE IF NOT EXISTS `Assignment_has_Student` (
  `Assignment_assignment_id` INT NOT NULL,
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`Assignment_assignment_id`, `Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`),
  INDEX `fk_Assignment_has_Student_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  INDEX `fk_Assignment_has_Student_Assignment1_idx` (`Assignment_assignment_id` ASC) VISIBLE,
  CONSTRAINT `fk_Assignment_has_Student_Assignment1`
    FOREIGN KEY (`Assignment_assignment_id`)
    REFERENCES `Assignment` (`assignment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignment_has_Student_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Quiz_has_Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Quiz_has_Student` ;

CREATE TABLE IF NOT EXISTS `Quiz_has_Student` (
  `Quiz_quiz_id` INT NOT NULL,
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`Quiz_quiz_id`, `Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`),
  INDEX `fk_Quiz_has_Student_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  INDEX `fk_Quiz_has_Student_Quiz1_idx` (`Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Quiz_has_Student_Quiz1`
    FOREIGN KEY (`Quiz_quiz_id`)
    REFERENCES `Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quiz_has_Student_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Quiz_has_Instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Quiz_has_Instructor` ;

CREATE TABLE IF NOT EXISTS `Quiz_has_Instructor` (
  `Quiz_quiz_id` INT NOT NULL,
  `Instructor_instractors_id` INT NOT NULL,
  `Instructor_Account_account_id` INT NOT NULL,
  PRIMARY KEY (`Quiz_quiz_id`, `Instructor_instractors_id`, `Instructor_Account_account_id`),
  INDEX `fk_Quiz_has_Instructor_Instructor1_idx` (`Instructor_instractors_id` ASC, `Instructor_Account_account_id` ASC) VISIBLE,
  INDEX `fk_Quiz_has_Instructor_Quiz1_idx` (`Quiz_quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Quiz_has_Instructor_Quiz1`
    FOREIGN KEY (`Quiz_quiz_id`)
    REFERENCES `Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quiz_has_Instructor_Instructor1`
    FOREIGN KEY (`Instructor_instractors_id` , `Instructor_Account_account_id`)
    REFERENCES `Instructor` (`instractors_id` , `Account_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Course_has_Instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Course_has_Instructor` ;

CREATE TABLE IF NOT EXISTS `Course_has_Instructor` (
  `Course_course_id` INT NOT NULL,
  `Instructor_instractors_id` INT NOT NULL,
  `Instructor_Account_account_id` INT NOT NULL,
  PRIMARY KEY (`Course_course_id`, `Instructor_instractors_id`, `Instructor_Account_account_id`),
  INDEX `fk_Course_has_Instructor_Instructor1_idx` (`Instructor_instractors_id` ASC, `Instructor_Account_account_id` ASC) VISIBLE,
  INDEX `fk_Course_has_Instructor_Course1_idx` (`Course_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Instructor_Course1`
    FOREIGN KEY (`Course_course_id`)
    REFERENCES `Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Instructor_Instructor1`
    FOREIGN KEY (`Instructor_instractors_id` , `Instructor_Account_account_id`)
    REFERENCES `Instructor` (`instractors_id` , `Account_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Course_has_Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Course_has_Student` ;

CREATE TABLE IF NOT EXISTS `Course_has_Student` (
  `Course_course_id` INT NOT NULL,
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`Course_course_id`, `Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`),
  INDEX `fk_Course_has_Student_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  INDEX `fk_Course_has_Student_Course1_idx` (`Course_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Student_Course1`
    FOREIGN KEY (`Course_course_id`)
    REFERENCES `Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Student_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student_has_Resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student_has_Resource` ;

CREATE TABLE IF NOT EXISTS `Student_has_Resource` (
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  `Resource_resource_id` INT NOT NULL,
  PRIMARY KEY (`Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`, `Resource_resource_id`),
  INDEX `fk_Student_has_Resource_Resource1_idx` (`Resource_resource_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Resource_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Resource_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Resource_Resource1`
    FOREIGN KEY (`Resource_resource_id`)
    REFERENCES `Resource` (`resource_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Annoucement_has_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Annoucement_has_Account` ;

CREATE TABLE IF NOT EXISTS `Annoucement_has_Account` (
  `Annoucement_annoucement_id` INT NOT NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`Annoucement_annoucement_id`, `Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`),
  INDEX `fk_Annoucement_has_Account_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  INDEX `fk_Annoucement_has_Account_Annoucement1_idx` (`Annoucement_annoucement_id` ASC) VISIBLE,
  CONSTRAINT `fk_Annoucement_has_Account_Annoucement1`
    FOREIGN KEY (`Annoucement_annoucement_id`)
    REFERENCES `Annoucement` (`annoucement_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Annoucement_has_Account_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account_has_Discussion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account_has_Discussion` ;

CREATE TABLE IF NOT EXISTS `Account_has_Discussion` (
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`),
  INDEX `fk_Account_has_Discussion_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Account_has_Discussion_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student_has_Grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student_has_Grade` ;

CREATE TABLE IF NOT EXISTS `Student_has_Grade` (
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  `Grade_grade_id` INT NOT NULL,
  PRIMARY KEY (`Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`, `Grade_grade_id`),
  INDEX `fk_Student_has_Grade_Grade1_idx` (`Grade_grade_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Grade_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Grade_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Grade_Grade1`
    FOREIGN KEY (`Grade_grade_id`)
    REFERENCES `Grade` (`grade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student_has_Certificate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student_has_Certificate` ;

CREATE TABLE IF NOT EXISTS `Student_has_Certificate` (
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  `Certificate_certificate_id` INT NOT NULL,
  PRIMARY KEY (`Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`, `Certificate_certificate_id`),
  INDEX `fk_Student_has_Certificate_Certificate1_idx` (`Certificate_certificate_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Certificate_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Certificate_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Certificate_Certificate1`
    FOREIGN KEY (`Certificate_certificate_id`)
    REFERENCES `Certificate` (`certificate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contact_has_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Contact_has_Account` ;

CREATE TABLE IF NOT EXISTS `Contact_has_Account` (
  `Contact_contact_id` INT NOT NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`Contact_contact_id`, `Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`),
  INDEX `fk_Contact_has_Account_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  INDEX `fk_Contact_has_Account_Contact1_idx` (`Contact_contact_id` ASC) VISIBLE,
  CONSTRAINT `fk_Contact_has_Account_Contact1`
    FOREIGN KEY (`Contact_contact_id`)
    REFERENCES `Contact` (`contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contact_has_Account_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Discussion_has_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discussion_has_Account` ;

CREATE TABLE IF NOT EXISTS `Discussion_has_Account` (
  `Discussion_discussion_id` INT NOT NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`Discussion_discussion_id`, `Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`),
  INDEX `fk_Discussion_has_Account_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  INDEX `fk_Discussion_has_Account_Discussion1_idx` (`Discussion_discussion_id` ASC) VISIBLE,
  CONSTRAINT `fk_Discussion_has_Account_Discussion1`
    FOREIGN KEY (`Discussion_discussion_id`)
    REFERENCES `Discussion` (`discussion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Discussion_has_Account_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Support`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Support` ;

CREATE TABLE IF NOT EXISTS `Support` (
  `support_id` INT NOT NULL,
  `support_info` VARCHAR(45) NULL,
  PRIMARY KEY (`support_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Support_has_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Support_has_Account` ;

CREATE TABLE IF NOT EXISTS `Support_has_Account` (
  `Support_support_id` INT NOT NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`Support_support_id`, `Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`),
  INDEX `fk_Support_has_Account_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  INDEX `fk_Support_has_Account_Support1_idx` (`Support_support_id` ASC) VISIBLE,
  CONSTRAINT `fk_Support_has_Account_Support1`
    FOREIGN KEY (`Support_support_id`)
    REFERENCES `Support` (`support_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Support_has_Account_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account_has_Parent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account_has_Parent` ;

CREATE TABLE IF NOT EXISTS `Account_has_Parent` (
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  `Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`, `Parent_parent_id`),
  INDEX `fk_Account_has_Parent_Parent1_idx` (`Parent_parent_id` ASC) VISIBLE,
  INDEX `fk_Account_has_Parent_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Account_has_Parent_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_has_Parent_Parent1`
    FOREIGN KEY (`Parent_parent_id`)
    REFERENCES `Parent` (`parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Instructor_has_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Instructor_has_Account` ;

CREATE TABLE IF NOT EXISTS `Instructor_has_Account` (
  `Instructor_instractors_id` INT NOT NULL,
  `Instructor_Account_account_id` INT NOT NULL,
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  PRIMARY KEY (`Instructor_instractors_id`, `Instructor_Account_account_id`, `Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`),
  INDEX `fk_Instructor_has_Account_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  INDEX `fk_Instructor_has_Account_Instructor1_idx` (`Instructor_instractors_id` ASC, `Instructor_Account_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_has_Account_Instructor1`
    FOREIGN KEY (`Instructor_instractors_id` , `Instructor_Account_account_id`)
    REFERENCES `Instructor` (`instractors_id` , `Account_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instructor_has_Account_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account_has_Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account_has_Student` ;

CREATE TABLE IF NOT EXISTS `Account_has_Student` (
  `Account_account_id` INT NOT NULL,
  `Account_Parent_parent_id` INT NOT NULL,
  `Account_feedback_feedback_id` INT NOT NULL,
  `Student_student_id` INT NOT NULL,
  `Student_Account_account_id` INT NOT NULL,
  `Student_Account_Parent_parent_id` INT NOT NULL,
  PRIMARY KEY (`Account_account_id`, `Account_Parent_parent_id`, `Account_feedback_feedback_id`, `Student_student_id`, `Student_Account_account_id`, `Student_Account_Parent_parent_id`),
  INDEX `fk_Account_has_Student_Student1_idx` (`Student_student_id` ASC, `Student_Account_account_id` ASC, `Student_Account_Parent_parent_id` ASC) VISIBLE,
  INDEX `fk_Account_has_Student_Account1_idx` (`Account_account_id` ASC, `Account_Parent_parent_id` ASC, `Account_feedback_feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Account_has_Student_Account1`
    FOREIGN KEY (`Account_account_id` , `Account_Parent_parent_id` , `Account_feedback_feedback_id`)
    REFERENCES `Account` (`account_id` , `Parent_parent_id` , `feedback_feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_has_Student_Student1`
    FOREIGN KEY (`Student_student_id` , `Student_Account_account_id` , `Student_Account_Parent_parent_id`)
    REFERENCES `Student` (`student_id` , `Account_account_id` , `Account_Parent_parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Certificate_has_Grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Certificate_has_Grade` ;

CREATE TABLE IF NOT EXISTS `Certificate_has_Grade` (
  `Certificate_certificate_id` INT NOT NULL,
  `Grade_grade_id` INT NOT NULL,
  PRIMARY KEY (`Certificate_certificate_id`, `Grade_grade_id`),
  INDEX `fk_Certificate_has_Grade_Grade1_idx` (`Grade_grade_id` ASC) VISIBLE,
  INDEX `fk_Certificate_has_Grade_Certificate1_idx` (`Certificate_certificate_id` ASC) VISIBLE,
  CONSTRAINT `fk_Certificate_has_Grade_Certificate1`
    FOREIGN KEY (`Certificate_certificate_id`)
    REFERENCES `Certificate` (`certificate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Certificate_has_Grade_Grade1`
    FOREIGN KEY (`Grade_grade_id`)
    REFERENCES `Grade` (`grade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
