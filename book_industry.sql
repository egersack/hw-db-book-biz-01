DROP DATABASE IF EXISTS `bookbusiness`;
CREATE DATABASE IF NOT EXISTS `bookbusiness`;
USE `bookbusiness`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

CREATE TABLE `customer` (
    `customer_firstname`     varchar(20) NOT NULL,
    `customer_lastname`      varchar(20) NOT NULL,
    `customer_UID`           int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`customer_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
    `customer_UID`          int NOT NULL,
    `order_date`            varchar(20) NOT NULL,
    `order_UID`             int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`order_UID`),
    FOREIGN KEY (`customer_UID`) REFERENCES `customer`(`customer_UID`),
    INDEX (`customer_UID`, `order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `author` (
    `author_firstname`     varchar(20) NOT NULL,
    `author_lastname`      varchar(20) NOT NULL,
    `author_UID`           int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`author_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `publisher` (
    `publisher_name`        varchar(20) NOT NULL,
    `publisher_UID`         int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`publisher_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `editor` (
    `editor_firstname`     varchar(20) NOT NULL,
    `editor_lastname`      varchar(20) NOT NULL,
    `editor_UID`           int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`editor_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `book` (
    `title`         varchar(20) NOT NULL,
    `genre`         varchar(20) NOT NULL,
    `author_UID`    int NOT NULL,
    `price`         float NULL,
    `editor_UID`    int NOT NULL,
    `ISBN`     int NOT NULL,
    PRIMARY KEY (`ISBN`),
    FOREIGN KEY (`author_UID`) REFERENCES `author`(`author_UID`),
    FOREIGN KEY (`editor_UID`) REFERENCES `editor`(`editor_UID`),
    INDEX (`author_UID`, `editor_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `junction_author_book` (
    `author_UID` int NOT NULL,
    `ISBN` int NOT NULL,
    PRIMARY KEY (`author_UID`, `ISBN`),
    FOREIGN KEY (`ISBN`) REFERENCES `book`(`ISBN`),
    FOREIGN KEY (`author_UID`) REFERENCES `author`(`author_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `junction_order_book` (
    `order_UID` int NOT NULL,
    `ISBN` int NOT NULL,
    PRIMARY KEY (`order_UID`, `ISBN`),
    FOREIGN KEY (`order_UID`) REFERENCES `order`(`order_UID`),
    FOREIGN KEY (`ISBN`) REFERENCES `book`(`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `junction_editor_book` (
    `editor_UID` int NOT NULL,
    `ISBN` int NOT NULL,
    PRIMARY KEY (`editor_UID`, `ISBN`),
    FOREIGN KEY (`editor_UID`) REFERENCES `editor`(`editor_UID`),
    FOREIGN KEY (`ISBN`) REFERENCES `book`(`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

