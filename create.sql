CREATE DATABASE  IF NOT EXISTS `cs5200_A2` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cs5200_A2`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: cs5200-spring2020-jin.cparjdavcbcl.us-east-2.rds.amazonaws.com    Database: cs5200_A2
-- ------------------------------------------------------
-- Server version	8.0.16

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `street1` varchar(45) DEFAULT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `address_primary` tinyint(4) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `person_address_generalization_idx` (`person`),
  CONSTRAINT `person_address_generalization` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `deleveloper_roles_and_privileges`
--

DROP TABLE IF EXISTS `deleveloper_roles_and_privileges`;
/*!50001 DROP VIEW IF EXISTS `deleveloper_roles_and_privileges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deleveloper_roles_and_privileges` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `user_name`,
 1 AS `email`,
 1 AS `website_name`,
 1 AS `visits`,
 1 AS `website_updated`,
 1 AS `web_role_name`,
 1 AS `web_priviledge_name`,
 1 AS `title`,
 1 AS `views`,
 1 AS `page_updated`,
 1 AS `page_role_name`,
 1 AS `page_priviledge_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `developer_key` varchar(45) DEFAULT NULL,
  `person` int(11) NOT NULL,
  PRIMARY KEY (`person`),
  KEY `person_developer_generalization_idx` (`person`),
  CONSTRAINT `person_developer_generalization` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `page_description` varchar(200) DEFAULT NULL,
  `page_created` date DEFAULT NULL,
  `page_updated` date DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `website` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `website_page_generalization_idx` (`website`),
  CONSTRAINT `website_page_generalization` FOREIGN KEY (`website`) REFERENCES `website` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_priviledge`
--

DROP TABLE IF EXISTS `page_priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_priviledge` (
  `page_priviledge_name` varchar(45) DEFAULT NULL,
  `developer` int(11) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  KEY `developer_pagepri_generalization_idx` (`developer`),
  KEY `priviledge_pagepri_generalizaiton_idx` (`page_priviledge_name`),
  KEY `page_pagepri_generalization_idx` (`page`),
  CONSTRAINT `developer_pagepri_generalization` FOREIGN KEY (`developer`) REFERENCES `developer` (`person`),
  CONSTRAINT `page_pagepri_generalization` FOREIGN KEY (`page`) REFERENCES `page` (`page_id`),
  CONSTRAINT `priviledge_pagepri_generalizaiton` FOREIGN KEY (`page_priviledge_name`) REFERENCES `priviledge` (`priviledge_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_role`
--

DROP TABLE IF EXISTS `page_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_role` (
  `developer` int(11) DEFAULT NULL,
  `page_role_name` varchar(45) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  KEY `developer_page_generalization_idx` (`developer`),
  KEY `role_pagerole_generalization_idx` (`page_role_name`),
  KEY `page_pagerole_generalization_idx` (`page`),
  CONSTRAINT `developer_page_generalization` FOREIGN KEY (`developer`) REFERENCES `developer` (`person`),
  CONSTRAINT `page_pagerole_generalization` FOREIGN KEY (`page`) REFERENCES `page` (`page_id`),
  CONSTRAINT `role_pagerole_generalization` FOREIGN KEY (`page_role_name`) REFERENCES `role` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(200) DEFAULT NULL,
  `phone_primary` tinyint(4) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  PRIMARY KEY (`phone_id`),
  KEY `person_phone_generalization_idx` (`person`),
  CONSTRAINT `person_phone_generalization` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priviledge`
--

DROP TABLE IF EXISTS `priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priviledge` (
  `priviledge_name` varchar(45) NOT NULL,
  PRIMARY KEY (`priviledge_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agreement` tinyint(4) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `person_user_generalization_idx` (`person`),
  CONSTRAINT `person_user_generalization` FOREIGN KEY (`person`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_priviledge`
--

DROP TABLE IF EXISTS `web_priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_priviledge` (
  `web_priviledge_name` varchar(45) DEFAULT NULL,
  `developer` int(11) DEFAULT NULL,
  `website` int(11) DEFAULT NULL,
  KEY `developer_webpri_generalization_idx` (`developer`),
  KEY `priviledge_webpri_generalization_idx` (`web_priviledge_name`),
  KEY `website_webpri_generalization_idx` (`website`),
  CONSTRAINT `developer_webpri_generalization` FOREIGN KEY (`developer`) REFERENCES `developer` (`person`),
  CONSTRAINT `priviledge_webpri_generalization` FOREIGN KEY (`web_priviledge_name`) REFERENCES `priviledge` (`priviledge_name`),
  CONSTRAINT `website_webpri_generalization` FOREIGN KEY (`website`) REFERENCES `website` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_role`
--

DROP TABLE IF EXISTS `web_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_role` (
  `developer` int(11) DEFAULT NULL,
  `web_role_name` varchar(45) DEFAULT NULL,
  `website` int(11) DEFAULT NULL,
  KEY `developer_webrole_generalization_idx` (`developer`),
  KEY `role_webrole_generalization_idx` (`web_role_name`),
  KEY `website_webrole_generalization_idx` (`website`),
  CONSTRAINT `developer_webrole_generalization` FOREIGN KEY (`developer`) REFERENCES `developer` (`person`),
  CONSTRAINT `role_webrole_generalization` FOREIGN KEY (`web_role_name`) REFERENCES `role` (`role_name`),
  CONSTRAINT `website_webrole_generalization` FOREIGN KEY (`website`) REFERENCES `website` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `website_name` varchar(45) DEFAULT NULL,
  `website_description` varchar(200) DEFAULT NULL,
  `website_created` date DEFAULT NULL,
  `website_updated` date DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  `developer` int(11) DEFAULT NULL,
  PRIMARY KEY (`website_id`),
  KEY `developer_website_generalization_idx` (`developer`),
  CONSTRAINT `developer_website_generalization` FOREIGN KEY (`developer`) REFERENCES `developer` (`person`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget` (
  `widget_id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_name` varchar(45) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `css_class` varchar(45) DEFAULT NULL,
  `css_style` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `w_order` int(11) DEFAULT NULL,
  `youtube_url` varchar(45) DEFAULT NULL,
  `youtube_sharble` tinyint(4) DEFAULT NULL,
  `youtube_expandable` tinyint(4) DEFAULT NULL,
  `image_src` varchar(45) DEFAULT NULL,
  `heading_size` int(11) DEFAULT NULL,
  `html` varchar(45) DEFAULT NULL,
  `dtype` varchar(45) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`widget_id`),
  KEY `page_widget_generalization_idx` (`page_id`),
  CONSTRAINT `page_widget_generalization` FOREIGN KEY (`page_id`) REFERENCES `page` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `deleveloper_roles_and_privileges`
--

/*!50001 DROP VIEW IF EXISTS `deleveloper_roles_and_privileges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jinyaoyu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `deleveloper_roles_and_privileges` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`p`.`user_name` AS `user_name`,`p`.`email` AS `email`,`w`.`website_name` AS `website_name`,`w`.`visits` AS `visits`,`w`.`website_updated` AS `website_updated`,`wr`.`web_role_name` AS `web_role_name`,`wp`.`web_priviledge_name` AS `web_priviledge_name`,`page`.`title` AS `title`,`page`.`views` AS `views`,`page`.`page_updated` AS `page_updated`,`pr`.`page_role_name` AS `page_role_name`,`pp`.`page_priviledge_name` AS `page_priviledge_name` from ((((((`person` `p` join `website` `w`) join `web_role` `wr`) join `web_priviledge` `wp`) join `page`) join `page_role` `pr`) join `page_priviledge` `pp`) where ((`wr`.`developer` = `p`.`person_id`) and (`wr`.`website` = `w`.`website_id`) and (`wp`.`website` = `w`.`website_id`) and (`wp`.`developer` = `p`.`person_id`) and (`pr`.`developer` = `p`.`person_id`) and (`pr`.`page` = `page`.`page_id`) and (`pp`.`page` = `page`.`page_id`) and (`pp`.`developer` = `p`.`person_id`)) order by `p`.`first_name`,`w`.`website_name`,`page`.`title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 22:41:31
