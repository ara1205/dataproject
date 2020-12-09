-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: mydatabase
-- Source Schemata: mydatabase
-- Created: Wed Dec  9 13:12:06 2020
-- Workbench Version: 8.0.22
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema mydatabase
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `mydatabase` ;
CREATE SCHEMA IF NOT EXISTS `mydatabase` ;

-- ----------------------------------------------------------------------------
-- Table mydatabase.countries
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase`.`countries` (
  `index` BIGINT NULL DEFAULT NULL,
  `CountryID` BIGINT NULL DEFAULT NULL,
  `CountryName` TEXT NULL DEFAULT NULL,
  INDEX `ix_countries_index` (`index` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table mydatabase.incomegini
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase`.`incomegini` (
  `index` BIGINT NULL DEFAULT NULL,
  `CountryID` BIGINT NULL DEFAULT NULL,
  `Most_Recent_Income_Gini` TEXT NULL DEFAULT NULL,
  INDEX `ix_incomegini_index` (`index` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table mydatabase.socialindexs
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase`.`socialindexs` (
  `index` BIGINT NULL DEFAULT NULL,
  `CountryID` BIGINT NULL DEFAULT NULL,
  `socialProgressIndex` TEXT NULL DEFAULT NULL,
  `basicHumanNeeds` TEXT NULL DEFAULT NULL,
  `foundationsOfWellbeing` TEXT NULL DEFAULT NULL,
  `Opportunity` TEXT NULL DEFAULT NULL,
  INDEX `ix_socialindexs_index` (`index` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table mydatabase.wealthgini
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydatabase`.`wealthgini` (
  `index` BIGINT NULL DEFAULT NULL,
  `CountryID` BIGINT NULL DEFAULT NULL,
  `WealthGini` TEXT NULL DEFAULT NULL,
  INDEX `ix_wealthgini_index` (`index` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET FOREIGN_KEY_CHECKS = 1;
