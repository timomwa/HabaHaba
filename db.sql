  

CREATE DATABASE `habahaba` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `habahaba`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive','suspended','pending','blocled','deleted') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

  

CREATE TABLE `company_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id_fk` int(11) NOT NULL DEFAULT '-1' COMMENT 'Foreign key pointing to the company.',
  `product_id_fk` int(11) NOT NULL DEFAULT '-1' COMMENT 'Foreign key pointing to the product.',
  `status` enum('available','unavailable','coming_soon','no_longer_offered') NOT NULL DEFAULT 'available' COMMENT 'Status of the product. Can be either ''available'',''unavailable'',''coming_soon'',''no_longer_offered''',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The time the record was created.',
  PRIMARY KEY (`id`),
  KEY `company_id_product_id_idx` (`company_id_fk`,`product_id_fk`),
  KEY `product_id` (`product_id_fk`),
  KEY `company_product_status` (`company_id_fk`,`product_id_fk`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maps conpanies to products';

  

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Name of the product',
  `status` enum('active','inactive','suspended','pending','blocled','deleted') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

  

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` enum('active','inactive','suspended','pending','blocled','deleted') NOT NULL DEFAULT 'active' COMMENT 'Status of the user. can be ''active'',''inactive'',''suspended'',''pending'',''blocled'',''deleted'' ',
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
