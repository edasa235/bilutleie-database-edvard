CREATE DATABASE IF NOT EXISTS bilutleie;
USE bilutleie;

CREATE TABLE IF NOT EXISTS `ansatt` (
  `id` CHAR(36) NOT NULL,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  PRIMARY KEY (`id`),
  KEY `AK` (`email`)
);

CREATE TABLE IF NOT EXISTS `car` (
  `id` CHAR(36) NOT NULL,
  `registration_number` VARCHAR(255),
  `brand` VARCHAR(255),
  `model` VARCHAR(255),
  `year` INT,
  `daily_price` DECIMAL(10,2),
  `registered_by` CHAR(36),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`registered_by`) REFERENCES `ansatt`(`id`),
  KEY `AK` (`registration_number`)
);

CREATE TABLE IF NOT EXISTS `extra_utstyr` (
  `id` CHAR(36) NOT NULL,
  `name` VARCHAR(255),
  `price_per_day` DECIMAL(10,2),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `kundene` (
  `id` CHAR(36) NOT NULL,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `phone` VARCHAR(255),
  PRIMARY KEY (`id`),
  KEY `AK` (`email`)
);

CREATE TABLE IF NOT EXISTS `utleieavtalene` (
  `id` CHAR(36) NOT NULL,
  `kundene_id` CHAR(36),
  `car_id` CHAR(36),
  `created_by` CHAR(36),
  `start_date` DATE,
  `end_date` DATE,
  `total_price` DECIMAL(10,2),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created_by`) REFERENCES `ansatt`(`id`),
  FOREIGN KEY (`car_id`) REFERENCES `car`(`id`),
  FOREIGN KEY (`kundene_id`) REFERENCES `kundene`(`id`)
);

CREATE TABLE IF NOT EXISTS `utleieavtale_extra_utstyr` (
  `utleieavtale_id` CHAR(36),
  `extra_utstyr_id` CHAR(36),
  PRIMARY KEY (`utleieavtale_id`, `extra_utstyr_id`),
  FOREIGN KEY (`extra_utstyr_id`) REFERENCES `extra_utstyr`(`id`),
  FOREIGN KEY (`utleieavtale_id`) REFERENCES `utleieavtalene`(`id`)
);
