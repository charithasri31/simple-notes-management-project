-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: snmprjdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `filedata`
--

DROP TABLE IF EXISTS `filedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filedata` (
  `fid` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(20) NOT NULL,
  `file_data` longblob,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `filedata_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`useremail`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filedata`
--

LOCK TABLES `filedata` WRITE;
/*!40000 ALTER TABLE `filedata` DISABLE KEYS */;
INSERT INTO `filedata` VALUES (4,'stoken.py',_binary 'from itsdangerous import URLSafeTimedSerializer\r\nsalt=\'otpverify\'\r\ndef entoken(data):\r\n    serializer=URLSafeTimedSerializer(\'code@1999\')\r\n    return serializer.dumps(data,salt=salt)\r\ndef dntoken(data):\r\n    \'\'\'Function to decrypt encrypted token\'\'\'\r\n    serializer=URLSafeTimedSerializer(\'code@1999\')\r\n    return serializer.loads(data,salt=salt)','2025-07-29 12:00:13','charithasridondapati31@gmail.com'),(5,'cmail.py',_binary 'import smtplib\r\nfrom email.message import EmailMessage\r\ndef send_mail(to,subject,body):\r\n    server=smtplib.SMTP_SSL(\'smtp.gmail.com\',465) # creating object for gmail\r\n    server.login(\'charithasridondapati31@gmail.com\',\'ktoq sofs govo zqhe\')\r\n    msg=EmailMessage() # creating object for EmailMessage to form email for\r\n    msg[\'FROM\']=\'charithasridondapati31@gmail.com\'\r\n    msg[\'TO\']=to\r\n    msg[\'SUBJECT\']=subject\r\n    msg.set_content(body)\r\n    server.send_message(msg)\r\n    server.close()','2025-07-29 12:00:24','charithasridondapati31@gmail.com');
/*!40000 ALTER TABLE `filedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `nid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(50) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`useremail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (3,'sql','database language','2025-07-31 11:29:50','charithasridondapati31@gmail.com');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `useremail` varchar(50) NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  PRIMARY KEY (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Charitha Sri Dondapati','charithasridondapati31@gmail.com','1234','female'),('charitha','dondapaticharitha@gmail.com','234','female');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-01 10:51:48
