-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: kerkr
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ke_bank_map`
--

DROP TABLE IF EXISTS `ke_bank_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ke_bank_map` (
  `bank_id` int(11) DEFAULT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ke_bank_map`
--

LOCK TABLES `ke_bank_map` WRITE;
/*!40000 ALTER TABLE `ke_bank_map` DISABLE KEYS */;
INSERT INTO `ke_bank_map` VALUES (1001,'招商银行'),(1002,'中国工商银行'),(1003,'中国建设银行'),(1004,'浦发银行'),(1005,'中国农业银行'),(1006,'中国民生银行'),(1010,'平安银行'),(1009,'兴业银行'),(1020,'交通银行'),(1021,'中信银行'),(1022,'中国光大银行'),(1023,'农村合作信用社'),(1024,'上海银行'),(1025,'华夏银行'),(1026,'中国银行'),(1027,'广发银行'),(1032,'北京银行'),(1066,'邮政储蓄银行'),(1054,'南京银行'),(1056,'宁波银行'),(1082,'上海农商银行'),(4006,'华润银行'),(4830,'江苏银行'),(4835,'广东南粤银行'),(1099,'其他银行');
/*!40000 ALTER TABLE `ke_bank_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-17 11:52:08
