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
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `airport_id` varchar(5) NOT NULL,
  `airport_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `city_image_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES ('ATL','Hartsfield-Jackson International Airport','6000 N Terminal Pkwy, Atlanta, GA 30320','https://www.atl.com/','(800) 897-1910','Atlanta','GA',33.640863,-84.444379,'atlanta.jpg'),('BOS','logan International Airport','Boston, MA 02128','https://www.massport.com/logan-airport/','(800) 235-6426','Boston','MA',42.360082,-71.058880,'boston.jpg'),('BWI','Baltimore/Washington International Airport','7050 Friendship Rd, Baltimore, MD 21240','https://www.bwiairport.com/','(410) 859-7111','Baltimore','MD',39.179462,-76.668633,'baltimore.jpg'),('CLT','Charlotte Douglas International Airport','5501 Josh Birmingham Pkwy, Charlotte, NC','https://www.cltairport.com/','(704) 359-4013','Charlotte','NC',35.220559,-80.943874,'charlotte.jpg'),('DCA','Ronald Reagan Washington National Airport','2401 Smith Blvd, Arlington, VA 22202','https://flyreagan.com/','(703) 417-8000','Arlington','VA',38.852310,-77.042428,'arlington.jpg'),('DEN','Denver International Airport','8500 Peña Blvd, Denver, CO 80249','https://www.flydenver.com/','(303) 342-2000','Denver','CO',39.850128,-104.673900,'denver.jpg'),('DFW','Dallas/Fort Worth International Airport','2400 Aviation Dr, DFW Airport, TX 75261','https://www.dfwairport.com/','(972) 973-3112','Dallas','TX',32.898791,-97.042370,'dallas.jpg'),('DTW','Detroit Metropolitician Airport','11050 W G Rogell Dr #602, Detroit, MI 48242','https://www.metroairport.com/','(734) 247-7678','Detroit','MI',42.223291,-83.349945,'detroit.jpg'),('EWR','Newark Liberty International Airport','3 Brewster Rd, Newark, NJ 07114','https://www.newarkairport.com/','(973) 961-6000','Newark','NJ',40.690382,-74.177381,'newark.jpg'),('FLL','Fort Lauderdale-Holleywood International Airport','100 Terminal Dr, Fort Lauderdale, FL 33315','https://www.broward.org/Airport/Pages/default.aspx','(954) 359-1200','Fort Lauderdale','FL',26.072915,-80.138794,'fort_lauderdale.jpg'),('IAD','Washington Dulles International Airport','1 Saarinen Cir, Dulles, VA 20166','https://www.flydulles.com/','(703) 572-2700','Dulles','VA',38.952666,-77.447824,'dulles.jpg'),('IAH','George Bush Intercontinental Airport','2800 N Terminal Rd, Houston, TX 77032','https://www.fly2houston.com/','(281) 230-3100','Houston','TX',29.988395,-95.338572,'houston.jpg'),('JFK','John F. Kennedy International Airport','Queens, NY 11430','https://www.jfkairport.com/','(718) 244-4444','Queens','NY',40.643948,-73.782351,'queens.jpg'),('LAS','McCarran International Airport','5757 Wayne Newton Blvd, Las Vegas, NV','http://www.mccarran.com/','(702) 261-5211','Las Vegas','NV',36.083839,-115.148385,'las_vegas.jpg'),('LAX','Los Angeles International Airport','1 World Way, Los Angeles, CA 90045','https://www.flylax.com/','(855) 463-5252','Los Angeles','CA',33.942240,-118.402795,'los_angeles.jpg'),('LGA','LaGuardia Airport','Queens, NY 11371','https://www.laguardiaairport.com/','(718) 533-3400','Queens','NY',40.750000,-73.866667,'queens.jpg'),('MCO','Orlando International Airport','1 Jeff Fuqua Blvd, Orlando, FL 32827','https://www.orlandoairports.net/','(407) 825-2001','Orlando','FL',28.431158,-81.308083,'orlando.jpg'),('MDW','Chicago Midway International Airport','5700 S Cicero Ave, Chicago, IL 60638','https://www.flychicago.com/','(773) 838-0600','Chicago','IL',41.788350,-87.741842,'chicago.jpg'),('MIA','Miami International Airport','2100 NW 42nd Ave, Miami, FL 33126','http://www.miami-airport.com/','(305) 876-7000','Miami','FL',25.795067,-80.278693,'miami.jpg'),('MSP','Minneapolis-Saint Paul International Airport','4300 Glumack Drive St. Paul, MN 55111','https://www.mspairport.com/','(612) 726-5555','Minneapolis','MN',44.882032,-93.205605,'minneapolis.jpg'),('ORD','O\'Hare International Airport','10000 W O\'Hare Ave, Chicago, IL 60666','https://www.flychicago.com/ohare/home/pages/default.aspx','(800) 832-6352','Chicago','IL',41.977503,-87.904058,'chicago.jpg'),('PDX','Portland International Airport','7000 NE Airport Way, Portland, OR 97218','https://www.flypdx.com/','(503) 460-4234','Portland','OR',45.589357,-122.593333,'portland.jpg'),('PHL','Philadelphia International Airport','8000 Essington Ave, Philadelphia, PA 19153','https://www.phl.org/','(215) 937-6937','Philadelphia','PA',39.873358,-75.243149,'philadelphia.jpg'),('PHX','Phoenix Sky Harbor International Airport','3400 E Sky Harbor Blvd, Phoenix, AZ 85034','http://skyharbor.com/','(602) 273-3300','Phoenix','AZ',33.435466,-112.007171,'phoenix.jpg'),('SAN','San Diego International Airport','3225 N Harbor Dr, San Diego, CA 92101','https://www.san.org/','(619) 400-2404','San Diego','CA',32.730366,-117.191624,'san_diego.jpg'),('SEA','Seattle–Tacoma International Airport','17801 International Blvd, Seattle, WA 98158','https://www.portseattle.org/sea-tac','(206) 787-5388','Seattle','WA',47.443188,-122.296285,'seattle.jpg'),('SFO','San Francisco International Airport','San Francisco, CA 94128','https://www.flysfo.com/','(650) 821-8211','San Francisco','CA',37.623908,-122.381592,'san_francisco.jpg'),('SLC','Salt Lake City International Airport','776 N Terminal Dr, Salt Lake City, UT 84122','https://slcairport.com/','(801) 575-2400','Salt Lake City','UT',40.786808,-111.982168,'salt_lake_city.jpg'),('TPA','Tampa International Airport','4100 George J Bean Pkwy, Tampa, FL 33607','https://www.tampaairport.com/','(813) 870-8700','Tampa','FL',27.980753,-82.533932,'tampa.jpg');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
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
