-- MySQL dump 10.13  Distrib 8.0.30, for macos12.5 (arm64)
--
-- Host: localhost    Database: wedidas
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT '1',
  `user_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_option_id` (`product_option_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_categories`
--

DROP TABLE IF EXISTS `main_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_categories`
--

LOCK TABLES `main_categories` WRITE;
/*!40000 ALTER TABLE `main_categories` DISABLE KEYS */;
INSERT INTO `main_categories` VALUES (1,'men'),(2,'women');
/*!40000 ALTER TABLE `main_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(500) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'https://cdn.pixabay.com/photo/2015/06/25/17/28/sea-821582_960_720.jpg',1),(2,'https://cdn.pixabay.com/photo/2010/12/22/10/23/slippers-3886__340.jpg',1),(3,'https://cdn.pixabay.com/photo/2015/05/19/12/24/slipper-773526__340.jpg',2),(4,'https://cdn.pixabay.com/photo/2019/07/29/15/36/slipper-4370860__340.jpg',2),(5,'https://cdn.pixabay.com/photo/2014/07/19/11/54/shoes-396997__340.jpg',3),(6,'https://cdn.pixabay.com/photo/2015/06/20/22/33/bath-slippers-816232__340.jpg',3),(7,'https://cdn.pixabay.com/photo/2016/06/03/06/02/slippers-1432817__340.jpg',4),(8,'https://cdn.pixabay.com/photo/2014/12/13/00/03/shoes-566003__340.jpg',4),(9,'https://cdn.pixabay.com/photo/2016/02/20/10/45/slippers-1211841__340.jpg',5),(10,'https://cdn.pixabay.com/photo/2015/01/24/01/31/slippers-609623__340.jpg',5),(11,'https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80',6),(12,'https://images.unsplash.com/photo-1518894781321-630e638d0742?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',6),(13,'https://images.unsplash.com/photo-1529810313688-44ea1c2d81d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2141&q=80',7),(14,'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',7),(15,'https://images.unsplash.com/photo-1581101767113-1677fc2beaa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',8),(16,'https://images.unsplash.com/photo-1623123627523-edd3cc6d13bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',8),(17,'https://images.unsplash.com/photo-1544155815-87a399a4712b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',9),(18,'https://images.unsplash.com/photo-1632748914020-941675839f2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=884&q=80',9),(19,'https://images.unsplash.com/photo-1581017316696-709bf1da2ed5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',10),(20,'https://images.unsplash.com/photo-1625572897280-4a4bed31f017?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=844&q=80',10),(21,'https://images.unsplash.com/photo-1573875133340-0b589f59a8c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',11),(22,'https://images.unsplash.com/photo-1619020986421-2ab55b319c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',11),(23,'https://images.unsplash.com/photo-1623789195459-d40e163cd9f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=922&q=80',12),(24,'https://images.unsplash.com/photo-1531005117551-959a5ec8eece?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80',12),(25,'https://images.unsplash.com/photo-1648278497532-e9c1802019d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',13),(26,'https://images.unsplash.com/photo-1544327415-cfb77383dabc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1108&q=80',13),(27,'https://images.unsplash.com/photo-1529607225807-563e0851ee7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',14),(28,'https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',14),(29,'https://images.unsplash.com/photo-1597405490028-282bac40f64c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1046&q=80',15),(30,'https://images.unsplash.com/photo-1584545284372-f22510eb7c26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',15),(31,'https://images.unsplash.com/photo-1656111804337-730dca3c54ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',16),(32,'https://images.unsplash.com/photo-1547974009-6fb0db54c905?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',16),(33,'https://images.unsplash.com/photo-1644416972807-22a2d1fb332b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',17),(34,'https://images.unsplash.com/photo-1547974009-6fb0db54c905?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',17),(35,'https://images.unsplash.com/photo-1581017316696-709bf1da2ed5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',18),(36,'https://images.unsplash.com/photo-1659785568847-2c9581fe7d98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',18),(37,'https://images.unsplash.com/photo-1624006389438-c03488175975?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80',19),(38,'https://images.unsplash.com/photo-1605034313761-73ea4a0cfbf3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',19),(39,'https://images.unsplash.com/photo-1581397422720-681cce994fee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1088&q=80',20),(40,'https://images.unsplash.com/photo-1561909848-977d0617f275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',20),(41,'https://images.unsplash.com/photo-1643758344142-7933a8c07796?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1060&q=80',21),(42,'https://images.unsplash.com/photo-1608666634759-4376010f863d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',21),(43,'https://images.unsplash.com/photo-1559186293-d67beec88ef9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',22),(44,'https://images.unsplash.com/photo-1662569147750-ef722928ce08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',22),(45,'https://images.unsplash.com/photo-1633259972690-3a84bc638139?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',23),(46,'https://images.unsplash.com/photo-1630497568460-c52b215a5de8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1062&q=80',23),(47,'https://images.unsplash.com/photo-1596122468255-bec64e3f4c7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1046&q=80',24),(48,'https://images.unsplash.com/photo-1650371177125-fa1ecb155bed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1144&q=80',24),(49,'https://images.unsplash.com/photo-1531005117551-959a5ec8eece?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1268&q=80',25),(50,'https://images.unsplash.com/photo-1527431016-15eb83515018?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',25),(51,'https://images.unsplash.com/photo-1588844467563-df6c1fa2a2bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',26),(52,'https://images.unsplash.com/photo-1581327512014-619407b6a116?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1514&q=80',26),(53,'https://images.unsplash.com/photo-1609535765688-c2114a1f0e50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',27),(54,'https://images.unsplash.com/photo-1631984564919-1f6b2313a71c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1092&q=80',27),(55,'https://images.unsplash.com/photo-1648278497532-e9c1802019d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',28),(56,'https://images.unsplash.com/photo-1518468607622-5844bca31a05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',28),(57,'https://images.unsplash.com/photo-1588680137502-f69f6ed05b6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1146&q=80',29),(58,'https://images.unsplash.com/photo-1543943477-5db37a34ff18?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1182&q=80',29),(59,'https://images.unsplash.com/photo-1585159989035-4d3b4b4a4b64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',30),(60,'https://images.unsplash.com/photo-1449445894928-d3280a99ee12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',30);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `size_id` (`size_id`),
  CONSTRAINT `product_options_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_options_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
INSERT INTO `product_options` VALUES (1,5,1,1),(2,10,1,2),(3,10,1,3),(4,10,2,1),(5,10,2,2),(6,10,2,3),(7,10,3,1),(8,10,3,2),(9,10,3,3),(10,5,4,1),(11,10,4,2),(12,10,4,3),(13,10,5,1),(14,5,5,2),(15,0,5,3),(16,5,6,1),(17,10,6,2),(18,5,6,3),(19,5,7,1),(20,10,7,2),(21,10,7,3),(22,10,8,1),(23,10,8,2),(24,10,8,3),(25,10,9,1),(26,10,9,2),(27,10,9,3),(28,10,10,1),(29,10,10,2),(30,10,10,3),(31,10,11,1),(32,10,11,2),(33,10,11,3),(34,10,12,1),(35,10,12,2),(36,10,12,3),(37,10,13,1),(38,10,13,2),(39,10,13,3),(40,5,14,1),(41,5,14,2),(42,10,14,3),(43,10,15,1),(44,10,15,2),(45,10,15,3),(46,10,16,1),(47,10,16,2),(48,10,16,3),(49,10,17,1),(50,10,17,2),(51,10,17,3),(52,10,18,1),(53,10,18,2),(54,10,18,3),(55,10,19,1),(56,10,19,2),(57,10,19,3),(58,10,20,1),(59,10,20,2),(60,10,20,3),(61,10,21,1),(62,10,21,2),(63,10,21,3),(64,10,22,1),(65,5,22,2),(66,10,22,3),(67,10,23,1),(68,10,23,2),(69,10,23,3),(70,10,24,1),(71,10,24,2),(72,10,24,3),(73,10,25,1),(74,10,25,2),(75,10,25,3),(76,10,26,1),(77,10,26,2),(78,5,26,3),(79,5,27,1),(80,10,27,2),(81,10,27,3),(82,10,28,1),(83,10,28,2),(84,10,28,3),(85,10,29,1),(86,10,29,2),(87,10,29,3),(88,10,30,1),(89,10,30,2),(90,10,30,3),(91,5,1,1),(92,10,1,2),(93,10,1,3),(94,10,2,1),(95,10,2,2),(96,10,2,3),(97,10,3,1),(98,10,3,2),(99,10,3,3),(100,5,4,1),(101,10,4,2),(102,10,4,3),(103,10,5,1),(104,5,5,2),(105,0,5,3),(106,5,6,1),(107,10,6,2),(108,5,6,3),(109,5,7,1),(110,10,7,2),(111,10,7,3),(112,10,8,1),(113,10,8,2),(114,10,8,3),(115,10,9,1),(116,10,9,2),(117,10,9,3),(118,10,10,1),(119,10,10,2),(120,10,10,3),(121,10,11,1),(122,10,11,2),(123,10,11,3),(124,10,12,1),(125,10,12,2),(126,10,12,3),(127,10,13,1),(128,10,13,2),(129,10,13,3),(130,5,14,1),(131,5,14,2),(132,10,14,3),(133,10,15,1),(134,10,15,2),(135,10,15,3),(136,10,16,1),(137,10,16,2),(138,10,16,3),(139,10,17,1),(140,10,17,2),(141,10,17,3),(142,10,18,1),(143,10,18,2),(144,10,18,3),(145,10,19,1),(146,10,19,2),(147,10,19,3),(148,10,20,1),(149,10,20,2),(150,10,20,3),(151,10,21,1),(152,10,21,2),(153,10,21,3),(154,10,22,1),(155,5,22,2),(156,10,22,3),(157,10,23,1),(158,10,23,2),(159,10,23,3),(160,10,24,1),(161,10,24,2),(162,10,24,3),(163,10,25,1),(164,10,25,2),(165,10,25,3),(166,10,26,1),(167,10,26,2),(168,5,26,3),(169,5,27,1),(170,10,27,2),(171,10,27,3),(172,10,28,1),(173,10,28,2),(174,10,28,3),(175,10,29,1),(176,10,29,2),(177,10,29,3),(178,10,30,1),(179,10,30,2),(180,10,30,3);
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `thumbnail_image_url` varchar(500) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_category_id` (`sub_category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'가젤',95000.00,'https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','변함없는 디자인으로 돌아온 1991 가젤\n30년이 넘는 시간 동안 사랑받아 온 심플함의 아이콘. 이번 버전의 가젤은 큰 인기를 얻었던 1991 가젤의 클래식한 소재, 칼라, 텍스쳐, 구조를 그대로 이어갑니다. 가죽 갑피에 대비색상 3-스트라이프와 힐 탭을 더해 90년대 초반의 오리지널 스타일을 선보입니다.','2022-10-20 08:46:16',1),(2,'슈퍼스타',50000.00,'https://images.unsplash.com/photo-1544327415-cfb77383dabc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1108&q=80','매끈한 가죽 갑피가 장착된 오리지널 아디다스 슈퍼스타\n농구화의 전설, 스트리트의 심볼, 문화적 아이콘. 50년을 관통하는 수많은 스토리로 지금까지 큰 사랑을 받고 있는 아디다스 슈퍼스타를 만나보세요. 매끈한 가죽 갑피의 클래식 러버 쉘토, 톱니 아웃라인 3-스트라이프가 다가올 미래를 위해 준비된 한결같은 아이코닉한 스타일을 선사합니다.','2022-10-20 08:46:16',1),(3,'포럼 로우',124100.00,'https://images.unsplash.com/photo-1584545284372-f22510eb7c26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','섬세한 자수 디테일로 업데이트된 전설적인 농구화\n스포츠 세계를 뛰어넘은 스타일 아이콘. 84년 혁신적인 농구화로 태어나 하드우드와 스테이지를 동시에 사로잡은 아디다스 포럼을 만나보세요. 80년대 코트의 폭발적인 에너지를 담아낸 클래식 슈즈입니다. 스트리트 스타일로 재탄생한 로우탑 버전으로, 엑스자 발목 스트랩이 오리지널 모델의 아이코닉한 룩을 선사합니다.','2022-10-20 08:46:16',1),(4,'비더블유 아미',50000.00,'https://images.unsplash.com/photo-1547974009-6fb0db54c905?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','독일 아카이브에서 탄생한 빈티지 디자인의 부활.\n독일군의 빈티지 실내 트레이닝화를 재현한 클래식 스타일의 스니커즈입니다. 가죽 소재와 스웨이드 블록의 대비감을 담아낸 갑피가 차분하고 절제된 룩을 선사합니다. 오리지널 검 러버 아웃솔이 과거를 연상시키는 레트로 분위기를 연출하고, 트레포일 설포 로고가 헤리티지 디테일을 더해줍니다.','2022-10-20 08:46:16',1),(5,'스탠스미스',65000.00,'https://images.unsplash.com/photo-1547974009-6fb0db54c905?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','시대를 초월하는 자연스러움과 실용성. 50년이 넘는 시간 동안 스포츠와 스타일 아이콘으로 사랑을 받고 있는 스탠 스미스를 만나보세요. 2024년부터 전면 재활용 폴리에스테르 사용을 목표로 하는 아디다스의 혁신적인 신개념 슈즈입니다. 폐고무로 제작된 매끈한 아웃솔이 클래식 룩을 선사합니다.','2022-10-20 08:46:16',1),(6,'시티 마라톤 PT',60000.00,'https://images.unsplash.com/photo-1659785568847-2c9581fe7d98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','직물 갑피, 스웨이드 오버레이\n80년대부터 지금까지 오랜 세월을 기다려 지난 시즌에 첫선을 보인 시티 마라톤 슈즈를 만나보세요. 완벽하게 준비된 디자인의 시크하고 스타일리시한 남성용 스니커즈입니다. 러닝화에서 영감을 받은 직물 갑피, 스웨이드 오버레이가 아카이브가 살아 있는 헤리티지 룩을 선사합니다. 미드솔의 반 이상을 감싼 네트 메쉬와 천공 토 오버레이가 시그니처 디테일을 더해줍니다.','2022-10-20 08:46:16',1),(7,'델팔라',134000.00,'https://images.unsplash.com/photo-1605034313761-73ea4a0cfbf3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','레트로 T-토와 벌커나이즈 아웃솔이 돋보이는 보드화 스타일 슈즈\n아디다스만의 오리지널 스타일. T-토부터 아웃솔까지 전면에 클래식 3-스트라이프 헤리티지를 담아낸 캔버스 슈즈를 만나보세요. 데일리 웨어에 어울리는 캐주얼한 디자인으로 편안한 착용감과 깔끔한 룩을 선사합니다.','2022-10-20 08:46:16',1),(8,'레트로피 E5',870000.00,'https://images.unsplash.com/photo-1561909848-977d0617f275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','러닝의 세계에서 영감을 얻은 데일리 슈즈\n절대 타협할 수 없는 가치. 시대를 초월하는 대담한 클래식 스타일이 담긴 아디다스 레트로피 E5 슈즈입니다. 러닝화에서 영감을 얻은 데일리 아이템으로, 다양한 프리미엄 소재로 제작된 실용적인 디자인을 선보입니다. 청바지부터 스웨트 팬츠까지 모든 아웃핏과 어울리는 스포티한 실루엣으로 매일 다양하게 활용할 수 있습니다. 매 스텝에 에너지를 되돌려주는 부스트 미드솔이 편안한 쿠셔닝을 선사합니다.','2022-10-20 08:46:16',1),(9,'아딜렛 라이트',150000.00,'https://images.unsplash.com/photo-1608666634759-4376010f863d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','휴식과 재충전을 위한 아늑한 슬라이드\n여유로운 힐링 모드로 발을 자유롭게 하는 아딜렛 슬라이드를 만나보세요. 부드러운 풋베드가 신는 즉시 편안한 착용감을 제공합니다. 상단의 아디다스 트레포일이 언제 어디서나 스포티한 룩을 선사합니다.','2022-10-20 08:46:16',1),(10,'니짜 트레포일 ',278000.00,'https://images.unsplash.com/photo-1662569147750-ef722928ce08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','70년대 분위기를 녹여낸 미니멀리스트 스니커즈\n70년대 패션과 스케이트보딩 문화의 완벽한 조화를 담아낸 니짜 트레포일 슈즈를 만나보세요. 깔끔한 미니멀리스트 스타일로 캐주얼한 룩과 편안한 착용감을 선사합니다.','2022-10-20 08:46:16',1),(11,'아딜렛클로그',55000.00,'https://images.unsplash.com/photo-1630497568460-c52b215a5de8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1062&q=80','데일리 웨어에 이상적인 편안한 슬립온 클로그\n아이코닉한 아딜렛 슬라이드에서 영감을 얻은 편안하고 실용적인 클로그입니다. 이른 아침 운동을 오고가는 길, 느긋한 휴식과 외출 등 다양한 활동 시 가볍게 착용할 수 있습니다. 맞춘 듯한 풋베드가 아늑하고 부드럽게 발을 받쳐줍니다.','2022-10-20 08:46:16',3),(12,'아딜렛 패치워크',79000.00,'https://images.unsplash.com/photo-1650371177125-fa1ecb155bed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1144&q=80','패치워크 갑피가 돋보이는 빈티지 스타일의 슬라이드\n시간을 초월하는 무한한 실용성. 언제 어디서나 어울리는 아이코닉한 아딜렛 슬라이드의 새로운 버전을 만나보세요. 패치워크 미학을 살린 직물 갑피와 함께 신선하고 감각적인 룩을 선보입니다. 발등을 감싸는 밴디지 구조가 한결같은 편안함을 더해주고, 부드러운 고무 아웃솔이 하루 종일 기분 좋은 착화감을 제공합니다.','2022-10-20 08:46:16',3),(13,'알파바운스 슬라이드',153000.00,'https://images.unsplash.com/photo-1527431016-15eb83515018?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80','접이식 뒤꿈치 구조로 업데이트된 클래식 니짜\n바쁜 하루를 위한 두 가지 옵션. 뒤꿈치를 접어 슬립온 슈즈처럼 착용할 수 있는 아디다스 니짜를 만나보세요. 시간이 없는 분주한 날에도 간편하게 신고 벗을 수 있습니다. 절제된 클래식 디자인으로 언제 어디서나 어울리는 깔끔한 룩을 선사합니다.','2022-10-20 08:46:16',3),(14,'아딜렛 컴포트 슬라이드',124000.00,'https://images.unsplash.com/photo-1581327512014-619407b6a116?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1514&q=80','70년대 독일군 트레이닝화의 재탄생\n과거로 돌아간 듯한 느낌을 주는 아디다스 BW 아미 슈즈는 70년대에 탄생한 독일군 트레이닝화의 부활을 선보입니다. 가죽 갑피, 검 러버 아웃솔을 되살린 아카이브 디자인으로 원래의 모습에 충실한 깔끔하고 절제된 클래식 룩을 선사합니다. 긴 역사가 깃든 오리지널 스타일과 함께 신는 순간 시작되는 시간 여행을 즐길 수 있습니다.','2022-10-20 08:46:16',3),(15,'ADILETTE SLIDES',120500.00,'https://images.unsplash.com/photo-1631984564919-1f6b2313a71c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1092&q=80','80년대 아디다스 슈퍼스타의 부활\n농구계의 판도를 바꾼 아디다스 슈퍼스타는 코트를 뛰어넘어 힙합씬의 아이콘으로 떠올랐고 곧이어 패션계까지 사로잡았습니다. 전 세계 모든 나라와 도시로 퍼져나간 클래식 슈즈의 위대한 유산을 기념하는 새로운 버전을 만나보세요. 아이코닉한 80년대 모델의 실루엣을 되살린 고무 아웃솔과 쉘토에 오리지널 디테일이 그대로 담겨 있습니다.','2022-10-20 08:46:16',3),(16,'컴포트 플립플랍',125000.00,'https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80','자연의 힘과 미래적 감성을 담아낸 오리지널 슬라이드\n\"우주에 슬라이드가 있다면 어떤 모습일까\" 라는 상상력을 바탕으로 탄생한 새로운 아딜렛 슬라이드를 만나보세요. 3D 지형도와 인류의 화성 탐사에서 영감을 얻어 중력을 초월하는 초현대적 디자인 디테일을 선보입니다. 맞춘 듯한 풋베드와 부드러운 고무 아웃솔이 샤워실부터 스트리트까지 언제 어디서나 완벽한 편안함을 제공합니다.\n\n한정된 자원을 절약하고 플라스틱 폐기물을 줄이기 위해 천연 원료와 재생 소재로 제작된 친환경 제품입니다.','2022-10-20 08:46:16',3),(17,'아딜렛 아쿠아',79000.00,'https://images.unsplash.com/photo-1518894781321-630e638d0742?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','패치워크 갑피가 돋보이는 빈티지 스타일의 슬라이드\n시간을 초월하는 무한한 실용성. 언제 어디서나 어울리는 아이코닉한 아딜렛 슬라이드의 새로운 버전을 만나보세요. 패치워크 미학을 살린 직물 갑피와 함께 신선하고 감각적인 룩을 선보입니다. 발등을 감싸는 밴디지 구조가 한결같은 편안함을 더해주고, 부드러운 고무 아웃솔이 하루 종일 기분 좋은 착화감을 제공합니다.','2022-10-20 08:46:16',3),(18,'퍼피렛',59000.00,'https://images.unsplash.com/photo-1529810313688-44ea1c2d81d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2141&q=80','농구화 스타일을 녹여낸 편안한 쿠셔닝 슬라이드\n코트에서 집으로 오는 동안 구름 위를 걷는 듯한 부드러운 발걸음을 경험해보세요. 농구화에서 영감을 얻은 알파바운스 슬라이드의 유연하고 가벼운 쿠셔닝은 하드우드를 뛰어넘어 모든 곳에서 완벽한 편안함을 선사합니다. 아디다스의 DNA가 각인된 3-스프라이프 갑피가 스포티한 룩을 선사합니다.','2022-10-20 08:46:16',3),(19,'슈무포일 슬라이드',45000.00,'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','가볍게 발을 감싸는 클래식 스포츠 슬라이드\n1972년부터 해변과 수영장의 필수 아이템으로 사랑받은 아디다스 아딜렛의 새로운 버전을 만나보세요. 부드러운 밴디지 갑피를 장식하는 엠보싱 브랜드 로고가 스포티한 룩을 선사합니다. 맞춘 듯한 풋베드가 아딜렛을 상징하는 편안함과 안정감을 더해줍니다.','2022-10-20 08:46:16',3),(20,'아딜렛 컴포트 ADJ',45000.00,'https://images.unsplash.com/photo-1581101767113-1677fc2beaa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','1972년에 태어난 아디다스 아딜렛은 세계에서 가장 사랑받는 슬라이드로 진화하며 선풍적인 인기를 얻었습니다. 휴식과 재충전을 위해 설계된 가벼운 디자인의 아딜렛을 만나보세요. 젤리 밴드가 단단하게 발을 감싸고, 맞춘 듯한 풋베드가 오래 지속되는 편안한 착용감을 제공합니다.','2022-10-20 08:46:16',3),(21,'X 스피드포탈.2 FG',189000.00,'https://images.unsplash.com/photo-1623123627523-edd3cc6d13bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','친환경 재생 소재가 함유된 가벼운 아디다스 축구화\n시간과 공간을 초월하는 놀라운 속도감. 스피드의 멀티버스를 여는 아디다스 X 스피드포탈 시리즈의 편안하고 날렵한 축구화를 만나보세요. 펌 그라운드 아웃솔에 추가된 앞발 스터드가 접지력을 최적화하고 빠른 가속을 더해줍니다. 부드러운 메쉬 갑피의 유연한 아디다스 프라임니트 칼라와 뒤꿈치에 장착된 TPU 피스의 조화로 폭발적인 스피드와 격렬한 풋워크에도 흔들림 없는 안정감을 제공합니다.','2022-10-20 08:46:16',5),(22,'코파 센스.1 FG\n',231200.00,'https://images.unsplash.com/photo-1544155815-87a399a4712b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','완벽한 컨트롤을 이끄는 실크 같은 터치감\n경기장에 들어선 순간 발끝부터 느껴지는 감각. 펌 그라운드의 지배자를 위한 아디다스 코파 센스와 함께 공과 하나가 되는 최상의 컨트롤을 경험해보세요. 부드러운 심리스 캥거루 가죽 앞발과 폼 터치포드의 조화로 실크처럼 매끄러운 터치감을 선사합니다. 빈 공간을 채워주는 뒤꿈치 센스포드의 인체공학적 구조로 발과 축구화가 빈틈없이 밀착된 완벽한 핏을 제공합니다.','2022-10-20 08:46:16',5),(23,'프레데터 엣지+ FG\n',349000.00,'https://images.unsplash.com/photo-1632748914020-941675839f2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=884&q=80','볼의 지배자를 위한 레이스리스 축구화\n회전과 컨트롤, 힘의 완벽한 균형. 아디다스 프레데터 시리즈의 펌 그라운드 축구화와 함께 틀을 깨는 창조적인 플레이를 펼쳐보세요. 레이스리스 존 스킨 갑피에 전략적으로 배치된 고무 컨트롤 존이 공을 밀착시키고 각기 다른 종류의 볼 접촉을 모두 최적화합니다. 앞발로 무게 중심을 이동시키는 파워 패싯이 킥에 강력한 힘을 실어줍니다. 유연하면서도 안정적인 아디다스 프라임니트 칼라가 흔들림 없는 핏을 선사합니다.','2022-10-20 08:46:16',5),(24,'게임모드 FG\n',139000.00,'https://images.unsplash.com/photo-1581017316696-709bf1da2ed5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','클래식 풋볼 스타일이 돋보이는 부드러운 축구화\n플레이로 말하는 게임을 위하여. 다채로운 디자인으로 돌아온 아디다스 게임모드 축구화와 함께 더욱 자유롭게 나만의 스타일을 표현해보세요. 다양한 발 모양에 맞춰 제작된 편안한 핏과 하이브리드터치 갑피의 부드러운 터치감으로 차원이 다른 경기를 펼칠 수 있습니다. 실용적인 하이브리드 아웃솔이 펌 그라운드, 인조 잔디에 모두 최적화된 접지력을 제공합니다. 축구 세계에서 영감을 얻은 대담한 그래픽이 강렬한 존재감을 발산합니다.','2022-10-20 08:46:16',5),(25,'프레데터 엣지.1 로우 FG\n',309000.00,'https://images.unsplash.com/photo-1625572897280-4a4bed31f017?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=844&q=80','볼의 지배자를 위한 로우컷 축구화\n회전과 컨트롤, 힘의 완벽한 균형. 아디다스 프레데터 시리즈의 펌 그라운드 축구화와 함께 틀을 깨는 창조적인 플레이를 펼쳐보세요. 로우컷 존 스킨 갑피에 전략적으로 배치된 고무 컨트롤 존이 각기 다른 종류의 볼 접촉을 모두 최적화합니다. 앞발로 무게 중심을 이동시키는 파워 패싯이 킥에 강력한 힘을 실어줍니다. 유연하면서도 안정적인 아디다스 프라임니트 칼라가 흔들림 없는 핏을 선사합니다.','2022-10-20 08:46:16',5),(26,'프레데터 엣지+ FG\n',349000.00,'https://images.unsplash.com/photo-1573875133340-0b589f59a8c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','볼의 지배자를 위한 레이스리스 축구화\n회전과 컨트롤, 힘의 완벽한 균형. 아디다스 프레데터 시리즈의 펌 그라운드 축구화와 함께 틀을 깨는 창조적인 플레이를 펼쳐보세요. 레이스리스 존 스킨 갑피에 전략적으로 배치된 고무 컨트롤 존이 공을 밀착시키고 각기 다른 종류의 볼 접촉을 모두 최적화합니다. 앞발로 무게 중심을 이동시키는 파워 패싯이 킥에 강력한 힘을 실어줍니다. 유연하면서도 안정적인 아디다스 프라임니트 칼라가 흔들림 없는 핏을 선사합니다.','2022-10-20 08:46:16',5),(27,'코파 센스.4 TF\n',69000.00,'https://images.unsplash.com/photo-1619020986421-2ab55b319c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','새로운 차원의 터치감으로 돌아온 친환경 축구화\n동료를 아끼고 라이벌을 존중하세요. 그리고 무엇보다 아디다스 코파 센스 축구화와 함께 공을 친구로 만들고 게임을 느껴보세요. 다양한 발 모양에 맞춰 제작된 편안한 인조 갑피의 스티치 디테일이 대담하면서도 깔끔한 룩을 선사합니다. 인조 잔디에 최적화된 고무 돌기 아웃솔이 차원이 다른 접지력을 제공합니다. 세계 최대 축구 무대에서 영감을 얻은 그래픽이 강렬한 마무리를 더해줍니다.\n\n버진 플라스틱 생산으로 인한 환경 오염을 줄이기 위해 남은 재료 조각과 같은 생산 폐기물, 소비자 사용 후 수거된 생활 폐기물을 가공하여 만든 재활용 원료가 함유되어 있습니다.','2022-10-20 08:46:16',5),(28,'X 스피드포털.3 MG\n',109000.00,'https://images.unsplash.com/photo-1623789195459-d40e163cd9f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=922&q=80','스피드와 안정감을 모두 잡은 친환경 축구화\n시간과 공간을 초월하는 놀라운 속도감. 스피드의 멀티버스를 여는 아디다스 X 스피드포털 시리즈를 만나보세요. 가벼운 아웃솔에 추가된 앞발 스터드가 다양한 표면에서 접지력을 최적화하고 빠른 가속을 더해줍니다. 코팅 직물 갑피의 니트 칼라와 뒤꿈치 외부의 견고한 TPU 피스가 빠른 커팅과 격렬한 돌파 시에도 흔들림 없이 발을 잡아줍니다.\n\n갑피에 최소 50% 이상의 재활용 원료가 함유되어 있으며, 플라스틱 폐기물을 없애기 위한 친환경 솔루션의 일환으로 제작된 제품입니다.','2022-10-20 08:46:16',5),(29,'프레데터 엣지.3 레이스리스 FG\n',129000.00,'https://images.unsplash.com/photo-1531005117551-959a5ec8eece?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80','게임의 지배자를 위한 완벽한 컨트롤\n회전과 컨트롤, 힘의 완벽한 균형. 아디다스 프레데터 시리즈의 펌 그라운드 축구화와 함께 틀을 깨는 창조적인 플레이를 펼쳐보세요. 레이스리스 코팅 직물 갑피에 배치된 컨트롤 존 프린트가 공을 밀착시키고 강화된 터치감을 제공합니다. 마른 천연 잔디 구장에 최적화된 TPU 아웃솔이 각진 형태가 돋보이는 대담한 룩을 선사합니다.','2022-10-20 08:46:16',5),(30,'프레데터 엣지.3 레이스리스 TF\n',129000.00,'https://images.unsplash.com/photo-1648278497532-e9c1802019d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80','완벽한 컨트롤을 이끄는 아디다스 축구화\n틀을 깨는 크리에이터를 위하여. 새로운 차원의 퍼포먼스를 위해 준비된 아디다스 프레데터 축구화를 만나보세요. 레이스리스 코팅 직물 갑피에 배치된 컨트롤 존 프린트가 공을 밀착시키고 강화된 터치감을 선사합니다. 유연한 투 피스 칼라와 고무 돌기 아웃솔의 조화로 인조 잔디 구장에서 더욱 자신 있고 안정적인 플레이를 펼칠 수 있습니다.','2022-10-20 08:46:16',5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comments` varchar(100) DEFAULT NULL,
  `ratings` float DEFAULT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20221019051729'),('20221019051832'),('20221019051852'),('20221019051927'),('20221019051947'),('20221019052004'),('20221019052023'),('20221019052042'),('20221019052100'),('20221019052116'),('20221021040227'),('20221021050944'),('20221021075130'),('20221024065101'),('20221024065153');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foot_size` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (1,230),(2,250),(3,270);
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `main_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_category_id` (`main_category_id`),
  CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`main_category_id`) REFERENCES `main_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'originals',1),(2,'originals',2),(3,'slipper',1),(4,'slipper',2),(5,'soccer',1),(6,'soccer',2);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `birthday` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `point` decimal(9,2) NOT NULL DEFAULT '1000000.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 15:30:26
