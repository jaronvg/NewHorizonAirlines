-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: new_horizons_db
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `City` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DateOfBirth` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `FirstName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LastName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ZipCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('44a191ba-3b84-468d-9d2f-f323c1ac8838','customer@NHA.com','CUSTOMER@NHA.COM','customer@NHA.com','CUSTOMER@NHA.COM',1,'AQAAAAEAACcQAAAAEBh7lHWKubNPUtPu7K7a3cBs4vmALoVxrB+l2lyaydcdoGsGaXZ7QtD//PQ3gb6iGA==','EK6R4DNSLPIEBNCVVXTUWJFU5JLKIG7V','7a1fe826-3c2d-49f4-bde9-40c27c34ca5d',NULL,0,0,NULL,1,0,'123 Ex AVE N','Tampa','01/01/1990','Jaron','Grimes','11111'),('5785fda8-3042-49c7-a07c-0de713b82819','admin@NHA.com','ADMIN@NHA.COM','admin@NHA.com','ADMIN@NHA.COM',1,'AQAAAAEAACcQAAAAENLnyXYY76X6KpGKdEJBWjtnkvsaR5EWOOV8/9yfMEz/x90xMrBaI0PgNsqsYafNWg==','AN34FKYCWDGBMRYODKD7NWCD4C4R4DXY','d580ca96-d38b-401a-974a-4b93905d999d',NULL,0,0,NULL,1,0,'123 Ex AVE N','Tampa','01/01/1990','Jaron','Grimes','11111'),('7ac2382a-41a6-47ce-8cac-aa56fbb46fa8','database@NHA.com','DATABASE@NHA.COM','database@NHA.com','DATABASE@NHA.COM',1,'AQAAAAEAACcQAAAAEGPDI+5vn5Uw6bloCajmEZLFADtBW5VshrJ7x+TgYSn3ocNOnF/GJPcGElt/imKO4Q==','PNQP5VDACQ6Q2JSW3CYHLJZL45WA2S2H','a60eea3c-866c-4baf-a33e-707f5429ccf4',NULL,0,0,NULL,1,0,'123 Ex AVE N','Tampa','01/01/1990','Jaron','Grimes','11111'),('ca1f7f20-ed8b-426b-94cc-e281236d1f85','employee1@NHA.com','EMPLOYEE1@NHA.COM','employee1@NHA.com','EMPLOYEE1@NHA.COM',1,'AQAAAAEAACcQAAAAEA+NIusPUbpImGAgIyJhBtw6LBy+XdmngWV7lRYZH9nFZSqF11fs1HpFpIPZ6yFq0Q==','WWMX5IXLESYN3RMALTEWD3FL4XPJAPIC','3d9c323a-9574-4450-acff-3e3d7fa2c427',NULL,0,0,NULL,1,0,'123 Ex AVE N','Tampa','01/01/1990','John','Doe','11111'),('ccabd384-b7d8-47c0-a705-40f71e6272d6','customerservice@NHA.com','CUSTOMERSERVICE@NHA.COM','customerservice@NHA.com','CUSTOMERSERVICE@NHA.COM',1,'AQAAAAEAACcQAAAAENj2aGP1kH18I9hazUv0UAxYMmNTnihvjlSWT6ve1iCkkdK7XbNV7YorLSUy1h5zqg==','752H4HZFRVA3M33GW64QRR4OB4B7DMZN','8bd3aa24-6dac-4f18-90e8-b5e009319f1c',NULL,0,0,NULL,1,0,'123 Ex AVE N','Tampa','01/01/1990','Jack','Harper','11111');
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-01 19:17:23
