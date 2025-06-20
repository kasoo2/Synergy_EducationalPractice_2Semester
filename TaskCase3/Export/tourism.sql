CREATE DATABASE  IF NOT EXISTS `tourism` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tourism`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tourism
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hotel_catalogue`
--

DROP TABLE IF EXISTS `hotel_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_catalogue` (
  `hotel_catalogue_num_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `hotel_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Название отеля',
  `hotel_name_en` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Название отеля на иностранном',
  `description` text COMMENT 'Описание',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес',
  `star_rating` int NOT NULL COMMENT 'Количество звёзд (рейтинг)',
  `floor_count` int NOT NULL COMMENT 'Количество этажей',
  `active_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Флаг активности',
  `location_catalogue_num_id` int unsigned NOT NULL COMMENT 'Место размещения (ссылка на таблицу location_catalogue)',
  PRIMARY KEY (`hotel_catalogue_num_id`),
  UNIQUE KEY `hotel_catalogue_num_id_UNIQUE` (`hotel_catalogue_num_id`),
  UNIQUE KEY `hotel_name_UNIQUE` (`hotel_name`),
  UNIQUE KEY `hotel_name_en_UNIQUE` (`hotel_name_en`),
  KEY `fk_hotel_catalogue_location_catalogue_idx` (`location_catalogue_num_id`) /*!80000 INVISIBLE */,
  KEY `hotel_name_active_flag_INDEX` (`hotel_name`,`active_flag`) /*!80000 INVISIBLE */,
  KEY `star_rating_active_flag` (`star_rating`,`active_flag`),
  CONSTRAINT `fk_hotel_catalogue_location_catalogue` FOREIGN KEY (`location_catalogue_num_id`) REFERENCES `location_catalogue` (`location_catalogue_num_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_catalogue`
--

LOCK TABLES `hotel_catalogue` WRITE;
/*!40000 ALTER TABLE `hotel_catalogue` DISABLE KEYS */;
INSERT INTO `hotel_catalogue` VALUES (1,'Маринс Парк','Marins Par',NULL,'Советская ул., 12, Нижний Новгород',4,12,1,1),(2,'История','History',NULL,'ул. Воровского, 28',3,8,1,2),(3,'Вега Измайлово',NULL,NULL,'Измайловское ш., 71, корп. 3В',4,10,1,3);
/*!40000 ALTER TABLE `hotel_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_catalogue`
--

DROP TABLE IF EXISTS `location_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_catalogue` (
  `location_catalogue_num_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Страна',
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Город',
  `latitude` decimal(9,6) NOT NULL COMMENT 'Широта',
  `longitude` decimal(9,6) NOT NULL COMMENT 'Долгота',
  `active_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Флаг активности',
  PRIMARY KEY (`location_catalogue_num_id`),
  UNIQUE KEY `location_catalogue_num_id_UNIQUE` (`location_catalogue_num_id`),
  KEY `country_active_flag_INDEX` (`country`,`active_flag`) /*!80000 INVISIBLE */,
  KEY `city_active_flag_INDEX` (`city`,`active_flag`) /*!80000 INVISIBLE */,
  KEY `country_city_active_flag_INDEX` (`country`,`city`,`active_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_catalogue`
--

LOCK TABLES `location_catalogue` WRITE;
/*!40000 ALTER TABLE `location_catalogue` DISABLE KEYS */;
INSERT INTO `location_catalogue` VALUES (1,'Россия','Нижний Новгород',56.326900,43.943600,1),(2,'Россия','Вологда',59.226220,39.871221,1),(3,'Россия','Москва',55.790500,37.747300,1);
/*!40000 ALTER TABLE `location_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_catalogue`
--

DROP TABLE IF EXISTS `service_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_catalogue` (
  `service_catalogue_num_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `service_code` varchar(150) NOT NULL COMMENT 'Системный код услуги',
  `service_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Название услуги',
  `service_name_en` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Название услуги на иностранном языке',
  `description` text COMMENT 'Описание',
  `price` decimal(10,2) NOT NULL COMMENT 'Цена',
  `active_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Флаг активности',
  PRIMARY KEY (`service_catalogue_num_id`),
  UNIQUE KEY `service_catalogue_num_id_UNIQUE` (`service_catalogue_num_id`),
  UNIQUE KEY `service_code_UNIQUE` (`service_code`),
  UNIQUE KEY `service_name_UNIQUE` (`service_name`),
  UNIQUE KEY `service_name_en_UNIQUE` (`service_name_en`),
  KEY `service_name_active_flag_INDEX` (`service_name`,`active_flag`) /*!80000 INVISIBLE */,
  KEY `service_code_active_flag_INDEX` (`service_code`,`active_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_catalogue`
--

LOCK TABLES `service_catalogue` WRITE;
/*!40000 ALTER TABLE `service_catalogue` DISABLE KEYS */;
INSERT INTO `service_catalogue` VALUES (1,'BOOKING_HOTEL','Бронирование отеля','Booking hotel','Услуга для бронирования/заказа отеля',0.00,1),(2,'CITY_TOUR','Экскурсия по городу','City tour','Экскурсия по достопримечательностям и интересным местам города',2000.00,1),(3,'TRANSFER_TO_HOTEL','Трансфер до отеля',NULL,'Трансфер из аэропорта до отеля',1000.00,1);
/*!40000 ALTER TABLE `service_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_client`
--

DROP TABLE IF EXISTS `tour_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_client` (
  `tour_client_num_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `first_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `patronymic` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `age` int NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passport_serial` varchar(10) NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Флаг активности',
  PRIMARY KEY (`tour_client_num_id`),
  UNIQUE KEY `tour_client_num_id_UNIQUE` (`tour_client_num_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `passport_active_flag_INDEX` (`passport_serial`,`passport_number`,`active_flag`) /*!80000 INVISIBLE */,
  KEY `phone_active_flag_INDEX` (`phone`,`active_flag`) /*!80000 INVISIBLE */,
  KEY `full_name_active_flag_INDEX` (`first_name`,`last_name`,`patronymic`,`active_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_client`
--

LOCK TABLES `tour_client` WRITE;
/*!40000 ALTER TABLE `tour_client` DISABLE KEYS */;
INSERT INTO `tour_client` VALUES (1,'Иванов','Пётр','Николаевич',23,'89210564857','pertnikol@mail.ru','1923','435789',1),(2,'Блиннов','Никита','Дмитриевич',18,'89210563178','mymailnick@mail.ru','1916','456345',1),(3,'Мурашкин','Влад','Анатольевич',40,'89211340987','vladika123@mail.ru','1923','223412',1);
/*!40000 ALTER TABLE `tour_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_order`
--

DROP TABLE IF EXISTS `tour_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_order` (
  `tour_order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `tour_client_num_id` int unsigned NOT NULL COMMENT 'Ключ клиента (ссылка на таблицу tour_client)',
  `service_catalogue_num_id` int unsigned NOT NULL COMMENT 'Ключ услуги (ссылка на таблицу service_catalogue)',
  `hotel_catalogue_num_id` int unsigned DEFAULT NULL COMMENT 'Ключ отеля (ссылка на таблицу hotel_catalogue)',
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата заказа тура',
  `start_date` datetime NOT NULL COMMENT 'Дата начала тура',
  `end_date` datetime NOT NULL COMMENT 'Дата конца тура',
  `total_cost` decimal(10,2) NOT NULL COMMENT 'Итоговая цена',
  `active_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Флаг активности',
  PRIMARY KEY (`tour_order_id`),
  UNIQUE KEY `tour_order_id_UNIQUE` (`tour_order_id`) /*!80000 INVISIBLE */,
  KEY `fk_tour_order_tour_client1_idx` (`tour_client_num_id`),
  KEY `fk_tour_order_service_catalogue1_idx` (`service_catalogue_num_id`) /*!80000 INVISIBLE */,
  KEY `fk_tour_order_hotel_catalogue1_idx` (`hotel_catalogue_num_id`),
  KEY `order_date_active_flag` (`order_date`,`active_flag`),
  CONSTRAINT `fk_tour_order_hotel_catalogue1` FOREIGN KEY (`hotel_catalogue_num_id`) REFERENCES `hotel_catalogue` (`hotel_catalogue_num_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tour_order_service_catalogue1` FOREIGN KEY (`service_catalogue_num_id`) REFERENCES `service_catalogue` (`service_catalogue_num_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_tour_order_tour_client1` FOREIGN KEY (`tour_client_num_id`) REFERENCES `tour_client` (`tour_client_num_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_order`
--

LOCK TABLES `tour_order` WRITE;
/*!40000 ALTER TABLE `tour_order` DISABLE KEYS */;
INSERT INTO `tour_order` VALUES (1,1,1,1,'2025-06-20 00:00:00','2025-06-21 00:00:00','2025-06-25 00:00:00',10000.00,1),(2,1,2,NULL,'2025-06-21 00:00:00','2025-06-22 14:00:00','2025-06-22 16:00:00',2000.00,1),(3,2,3,NULL,'2025-06-23 00:00:00','2025-06-24 00:00:00','2025-06-24 00:00:00',1000.00,1);
/*!40000 ALTER TABLE `tour_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-20 21:06:07
