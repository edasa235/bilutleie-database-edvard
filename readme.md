CREATE TABLE `rental.ansatt` (
  `id` CHAR(36),
  `name` varchar(255),
  `email` varchar(255),
  PRIMARY KEY (`id`),
  KEY `AK` (`email`)
);

CREATE TABLE `rental.car` (
  `id` CHAR(36),
  `registration_number` varchar(255),
  `brand` varchar(255),
  `model` varchar(255),
  `year` int,
  `daily_price` DECIMAL(10,2),
  `registered_by` CHAR(36),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`registered_by`)
      REFERENCES `rental.ansatt`(`id`),
  KEY `AK` (`registration_number`)
);

CREATE TABLE `rental.extra_utstyr` (
  `id` CHAR(36),
  `name` varchar(255),
  `price_per_day` DECIMAL(10,2),
  PRIMARY KEY (`id`)
);

CREATE TABLE `rental.kundene` (
  `id` CHAR(36),
  `name` varchar(255),
  `email` varchar(255),
  `phone` varchar(255),
  PRIMARY KEY (`id`),
  KEY `AK` (`email`)
);

CREATE TABLE `rental.utleieavtalene` (
  `id` CHAR(36),
  `kundene_id` CHAR(36),
  `car_id` CHAR(36),
  `created_by` CHAR(36),
  `start_date` date,
  `end_date` date,
  `total_price` DECIMAL(10,2),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created_by`)
      REFERENCES `rental.ansatt`(`id`),
  FOREIGN KEY (`car_id`)
      REFERENCES `rental.car`(`id`),
  FOREIGN KEY (`kundene_id`)
      REFERENCES `rental.kundene`(`id`)
);

CREATE TABLE `rental.utleieavtale_extra_utstyr` (
  `utleieavtale_id` CHAR(36),
  `extra_utstyr_id` CHAR(36),
  PRIMARY KEY (`utleieavtale_id`, `extra_utstyr_id`),
  FOREIGN KEY (`extra_utstyr_id`)
      REFERENCES `rental.extra_utstyr`(`id`),
  FOREIGN KEY (`utleieavtale_id`)
      REFERENCES `rental.utleieavtalene`(`id`)
);


