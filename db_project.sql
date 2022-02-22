-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_project` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `db_project` ;

-- -----------------------------------------------------
-- Table `db_project`.`db_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`db_user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

insert into db_user values (null, 'Dave');
insert into db_user values (null, 'Agron');
select * from db_user;


-- -----------------------------------------------------
-- Table `db_project`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`module` (
  `module_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`module_id`))
ENGINE = InnoDB;

insert into module values (null, 'Database');
insert into module values (null, 'CyberSecurity');
select * from module;

-- -----------------------------------------------------
-- Table `db_project`.`user_module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`user_module` (
  `user_module_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `module_id` INT NOT NULL,
  `grade_id` INT NOT NULL,
  PRIMARY KEY (`user_module_id`))
ENGINE = InnoDB;

insert into user_module values (null, 1, 1, 1);
insert into user_module values (null, 2, 1, 1);
select * from user_module;

-- -----------------------------------------------------
-- Table `db_project`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`grade` (
  `grade_id` INT NOT NULL AUTO_INCREMENT,
  `assessment_mark` INT NOT NULL,
  `exam_mark` INT NOT NULL,
  `final_mark` INT NOT NULL,
  PRIMARY KEY (`grade_id`))
ENGINE = InnoDB;

insert into grade values (null, 40, 60, 100);
insert into grade values (null, 30, 70, 100);
select * from grade; 

-- -----------------------------------------------------
-- Table `db_project`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;

insert into role values (null, 'admin');
insert into role values (null, 'lecturer');
insert into role values (null, 'student');

select * from role;


-- -----------------------------------------------------
-- Table `db_project`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`user_role` (
  `user_role_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  
   PRIMARY KEY (`user_role_id`),
    FOREIGN KEY (`user_id`, `role_id`)
    REFERENCES `db_project`.`db_user` (`user_id`))
     ENGINE = InnoDB;
  
  insert into user_role values (null, 1, 1);
  insert into user_role values (null, 2, 2);
 select * from user_role;
  
  -- -----------------------------------------------------
-- Table `db_project`.`role_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`role_permission` (
  `role_permission_id` INT NOT NULL AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`role_permission_id`))
  ENGINE = InnoDB;
  
  insert into role_permission values (null, 1, 1);
  insert into role_permission values (null, 2, 2);
 select * from role_permission;
  
  -- -----------------------------------------------------
-- Table `db_project`.`permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_project`.`permission` (
  `permission_id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`permission_id`))
ENGINE = InnoDB;

insert into permission values (null, '/admin/lecturer');
insert into permission values (null, '/admin/student');
insert into permission values (null, '/admin/students');
select * from permission;









