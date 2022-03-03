DROP DATABASE IF EXISTS `ps3`;
CREATE DATABASE IF NOT EXISTS `ps3`;
USE `ps3`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

CREATE TABLE `book` (
    `title`         varchar(20) NOT NULL,
    `genre`         varchar(20) NOT NULL,
    `book_ISBN`     int NOT NULL,
    PRIMARY KEY (`book_ISBN`),
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `author` (
    `firstName`     varchar(20) NOT NULL,
    `lastName`      varchar(20) NOT NULL,
    `author_UID`    int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`author_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `editor` (
    `firstName`     varchar(20) NOT NULL,
    `lastName`      varchar(20) NOT NULL,
    `editor_UID`    int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`editor_UID`),
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `publisher` (
    `name`          varchar(20) NOT NULL,
    `publisher_UID` int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`publisher_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customer` (
    `firstName`     varchar(20) NOT NULL,
    `lastName`      varchar(20) NOT NULL,
    `customer_UID` int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`customer_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
    `customer_UID` int NOT NULL,
    `date` varchar(20) NOT NULL,
    `order_UID` int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`order_UID`),
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;