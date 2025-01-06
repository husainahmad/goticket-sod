CREATE DATABASE  IF NOT EXISTS `db-ticket-sod` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db-ticket-sod`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (x86_64)
--
-- Host: localhost    Database: db-ticket-sod
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_title` varchar(100) NOT NULL,
  `ticket_msg` text NOT NULL,
  `ticket_status` enum('opn','cls','asn') NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tickets_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'1. Software is not working','1. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:32:56','2025-01-06 04:32:56',NULL),(2,'2. Software is not working','2. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:03','2025-01-06 04:33:03',NULL),(3,'3. Software is not working','3. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:09','2025-01-06 04:33:09',NULL),(4,'4. Software is not working','4. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:14','2025-01-06 04:33:14',NULL),(5,'5. Software is not working','5. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:19','2025-01-06 04:33:19',NULL),(6,'6. Software is not working','6. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:26','2025-01-06 04:33:26',NULL),(7,'7. Software is not working','7. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:34','2025-01-06 04:33:34',NULL),(8,'8. Software is not working','8. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:40','2025-01-06 04:33:40',NULL),(9,'9. Software is not working','9. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:46','2025-01-06 04:33:46',NULL),(10,'10. Software is not working','10. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:52','2025-01-06 04:33:52',NULL),(11,'11. Software is not working','11. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:33:57','2025-01-06 04:33:57',NULL),(12,'12. Software is not working','12. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:34:02','2025-01-06 04:34:02',NULL),(13,'13. Software is not working','13. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:34:07','2025-01-06 04:34:07',NULL),(14,'14. Software is not working','14. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:34:12','2025-01-06 04:34:12',NULL),(15,'15. Software is not working','15. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 04:59:19','2025-01-06 04:59:19',NULL),(16,'16. Software is not working','15. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 06:46:40','2025-01-06 06:46:40',NULL),(17,'17. Software is not working','17. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 06:46:46','2025-01-06 06:46:46',NULL),(18,'18. Software is not working','18. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 06:46:53','2025-01-06 06:46:53',NULL),(19,'19. Software is not working','19. <p>Hello, please assist as i cannot take a screenshot, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat, Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat. Lorem ipsum dolarsit amat</p>','opn',12,'2025-01-06 06:47:01','2025-01-06 06:47:01',NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-06 13:55:42
