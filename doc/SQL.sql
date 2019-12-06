create database pinf;
use pinf;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ZIP_code` varchar(20) NOT NULL DEFAULT '00000-000',
  `street` varchar(150) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  `neighborhood` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `type` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `FK_ADDRESS_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `FK_CLIENT_1` (`FK_ADDRESS_id`),
  CONSTRAINT `FK_CLIENT_1` FOREIGN KEY (`FK_ADDRESS_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `description` varchar(30) NOT NULL,
  `FK_CLIENT_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CONTACT_1` (`FK_CLIENT_id`),
  CONSTRAINT `FK_CONTACT_1` FOREIGN KEY (`FK_CLIENT_id`) REFERENCES `client` (`id`)
);


CREATE TABLE `painter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `dayli_value` double NOT NULL DEFAULT 80,
  `square_meter_value` decimal(10,0) NOT NULL DEFAULT 5,
  `FK_CLIENT_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PAINTER_1` (`FK_CLIENT_id`),
  CONSTRAINT `FK_PAINTER_1` FOREIGN KEY (`FK_CLIENT_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `FK_PAINTER_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PORTFOLIO_0` (`FK_PAINTER_id`),
  CONSTRAINT `FK_PORTFOLIO_0` FOREIGN KEY (`FK_PAINTER_id`) REFERENCES `painter` (`id`)
);


CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` blob NOT NULL,
  `FK_PORTIFOLIO_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_IMAGE_1` (`FK_PORTIFOLIO_id`),
  CONSTRAINT `FK_IMAGE_1` FOREIGN KEY (`FK_PORTIFOLIO_id`) REFERENCES `portfolio` (`id`)
);

CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `situation` varchar(30) NOT NULL DEFAULT 'novo',
  `start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `end_date` datetime DEFAULT NULL,
  `amount` float DEFAULT 0,
  `FK_CLIENT_id` int(11) DEFAULT NULL,
  `FK_PAINTER_id` int(11) DEFAULT NULL,
  `FK_ADDRESS_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REQUEST_1` (`FK_CLIENT_id`),
  KEY `FK_REQUEST_2` (`FK_PAINTER_id`),
  KEY `FK_REQUEST_3` (`FK_ADDRESS_id`),
  CONSTRAINT `FK_REQUEST_1` FOREIGN KEY (`FK_CLIENT_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REQUEST_2` FOREIGN KEY (`FK_PAINTER_id`) REFERENCES `painter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REQUEST_3` FOREIGN KEY (`FK_ADDRESS_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `FK_REQUEST_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MATERIAL_1` (`FK_REQUEST_id`),
  CONSTRAINT `FK_MATERIAL_1` FOREIGN KEY (`FK_REQUEST_id`) REFERENCES `request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `square_meter` double DEFAULT NULL,
  `FK_REQUEST_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_OBJECT_1` (`FK_REQUEST_id`),
  CONSTRAINT `FK_OBJECT_1` FOREIGN KEY (`FK_REQUEST_id`) REFERENCES `request` (`id`)
);