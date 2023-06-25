-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: sellapp
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `business_cards`
--

DROP TABLE IF EXISTS `business_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_cards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `card_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_cards_card_url_unique` (`card_url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_cards`
--

LOCK TABLES `business_cards` WRITE;
/*!40000 ALTER TABLE `business_cards` DISABLE KEYS */;
INSERT INTO `business_cards` VALUES (1,'64937322359cf','648fa59ac0edc','7ccc432a06hju','blue','en','/backend/img/vCards/IMG-64937322372d4-unnamed1.jpg.jpg','/backend/img/vCards/IMG-6493732236c35-unnamed1.jpg.jpg','sellapp','store','sample commerce','Welcome','{\"whatsapp_no\":\"123456789\",\"whatsapp_msg\":\"Thanks for shopping with us.\",\"currency\":\"\\u20a6\"}','inactive','1','2023-06-21 21:01:06','2023-06-21 21:07:12'),(2,'64937565cc963','648fa59ac0edc','7ccc432a06hju','blue','en','/backend/img/vCards/IMG-64937565cdd9f-unnamed.png.png','/backend/img/vCards/IMG-64937565cda5f-unnamed1.jpg.jpg','debugsellapp','store','SellApp','Welcome to Sellapp','{\"whatsapp_no\":\"070890684018\",\"whatsapp_msg\":\"Thanks for shopping with us.\",\"currency\":\"\\u20a6\"}','activated','1','2023-06-21 21:10:45','2023-06-22 22:11:56'),(3,'6494d1bfef665','648fa59ac0edc','7ccc432a06vhd','blue','en','/backend/img/vCards/IMG-6494d35fb0099-unnamed.png.png','/backend/img/vCards/IMG-6494d35faf544-unnamed1.jpg.jpg','test','vcard','test','welcome','test testing testing 1234','activated','1','2023-06-22 21:57:03','2023-06-22 22:03:59');
/*!40000 ALTER TABLE `business_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_fields`
--

DROP TABLE IF EXISTS `business_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_fields`
--

LOCK TABLES `business_fields` WRITE;
/*!40000 ALTER TABLE `business_fields` DISABLE KEYS */;
INSERT INTO `business_fields` VALUES (1,'6494d1bfef665','email','far fa-address-book','josephdilas@gmail.com','josephdilas@gmail.com','1','1','2023-06-22 21:58:05','2023-06-22 21:58:05'),(2,'6494d1bfef665','text','far fa-calendar-minus','About','We are a people of love and hamony','2','1','2023-06-22 21:58:05','2023-06-22 21:58:05');
/*!40000 ALTER TABLE `business_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_hours`
--

DROP TABLE IF EXISTS `business_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_hours` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Monday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tuesday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Wednesday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Thursday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Friday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Saturday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sunday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_always_open` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_display` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_hours`
--

LOCK TABLES `business_hours` WRITE;
/*!40000 ALTER TABLE `business_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `priority` int NOT NULL,
  `iso_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subunit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subunit_to_unit` int NOT NULL,
  `symbol_first` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_entity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_numeric` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,100,'AED','United Arab Emirates Dirham','د.إ','Fils',100,'true','','.',',',784),(2,100,'AFN','Afghan Afghani','؋','Pul',100,'false','','.',',',971),(3,100,'ALL','Albanian Lek','L','Qintar',100,'false','','.',',',8),(4,100,'AMD','Armenian Dram','դր.','Luma',100,'false','','.',',',51),(5,100,'ANG','Netherlands Antillean Gulden','ƒ','Cent',100,'true','&#x0192;',',','.',532),(6,100,'AOA','Angolan Kwanza','Kz','Cêntimo',100,'false','','.',',',973),(7,100,'ARS','Argentine Peso','$','Centavo',100,'true','&#x20B1;',',','.',32),(8,4,'AUD','Australian Dollar','$','Cent',100,'true','$','.',',',36),(9,100,'AWG','Aruban Florin','ƒ','Cent',100,'false','&#x0192;','.',',',533),(10,100,'AZN','Azerbaijani Manat','null','Qəpik',100,'true','','.',',',944),(11,100,'BAM','Bosnia and Herzegovina Convertible Mark','КМ','Fening',100,'true','','.',',',977),(12,100,'BBD','Barbadian Dollar','$','Cent',100,'false','$','.',',',52),(13,100,'BDT','Bangladeshi Taka','৳','Paisa',100,'true','','.',',',50),(14,100,'BGN','Bulgarian Lev','лв','Stotinka',100,'false','','.',',',975),(15,100,'BHD','Bahraini Dinar','ب.د','Fils',1000,'true','','.',',',48),(16,100,'BIF','Burundian Franc','Fr','Centime',100,'false','','.',',',108),(17,100,'BMD','Bermudian Dollar','$','Cent',100,'true','$','.',',',60),(18,100,'BND','Brunei Dollar','$','Sen',100,'true','$','.',',',96),(19,100,'BOB','Bolivian Boliviano','Bs.','Centavo',100,'true','','.',',',68),(20,100,'BRL','Brazilian Real','R$','Centavo',100,'true','R$',',','.',986),(21,100,'BSD','Bahamian Dollar','$','Cent',100,'true','$','.',',',44),(22,100,'BTN','Bhutanese Ngultrum','Nu.','Chertrum',100,'false','','.',',',64),(23,100,'BWP','Botswana Pula','P','Thebe',100,'true','','.',',',72),(24,100,'BYR','Belarusian Ruble','Br','Kapyeyka',100,'false','','.',',',974),(25,100,'BZD','Belize Dollar','$','Cent',100,'true','$','.',',',84),(26,5,'CAD','Canadian Dollar','$','Cent',100,'true','$','.',',',124),(27,100,'CDF','Congolese Franc','Fr','Centime',100,'false','','.',',',976),(28,100,'CHF','Swiss Franc','Fr','Rappen',100,'true','','.',',',756),(29,100,'CLF','Unidad de Fomento','UF','Peso',1,'true','&#x20B1;',',','.',990),(30,100,'CLP','Chilean Peso','$','Peso',1,'true','&#36;',',','.',152),(31,100,'CNY','Chinese Renminbi Yuan','¥','Fen',100,'true','&#20803;','.',',',156),(32,100,'COP','Colombian Peso','$','Centavo',100,'true','&#x20B1;',',','.',170),(33,100,'CRC','Costa Rican Colón','₡','Céntimo',100,'true','&#x20A1;',',','.',188),(34,100,'CUC','Cuban Convertible Peso','$','Centavo',100,'false','','.',',',931),(35,100,'CUP','Cuban Peso','$','Centavo',100,'true','&#x20B1;','.',',',192),(36,100,'CVE','Cape Verdean Escudo','$','Centavo',100,'false','','.',',',132),(37,100,'CZK','Czech Koruna','Kč','Haléř',100,'true','',',','.',203),(38,100,'DJF','Djiboutian Franc','Fdj','Centime',100,'false','','.',',',262),(39,100,'DKK','Danish Krone','kr','Øre',100,'false','',',','.',208),(40,100,'DOP','Dominican Peso','$','Centavo',100,'true','&#x20B1;','.',',',214),(41,100,'DZD','Algerian Dinar','د.ج','Centime',100,'false','','.',',',12),(42,100,'EGP','Egyptian Pound','ج.م','Piastre',100,'true','&#x00A3;','.',',',818),(43,100,'ERN','Eritrean Nakfa','Nfk','Cent',100,'false','','.',',',232),(44,100,'ETB','Ethiopian Birr','Br','Santim',100,'false','','.',',',230),(45,2,'EUR','Euro','€','Cent',100,'true','&#x20AC;',',','.',978),(46,100,'FJD','Fijian Dollar','$','Cent',100,'false','$','.',',',242),(47,100,'FKP','Falkland Pound','£','Penny',100,'false','&#x00A3;','.',',',238),(48,3,'GBP','British Pound','£','Penny',100,'true','&#x00A3;','.',',',826),(49,100,'GEL','Georgian Lari','ლ','Tetri',100,'false','','.',',',981),(50,100,'GHS','Ghanaian Cedi','₵','Pesewa',100,'true','&#x20B5;','.',',',936),(51,100,'GIP','Gibraltar Pound','£','Penny',100,'true','&#x00A3;','.',',',292),(52,100,'GMD','Gambian Dalasi','D','Butut',100,'false','','.',',',270),(53,100,'GNF','Guinean Franc','Fr','Centime',100,'false','','.',',',324),(54,100,'GTQ','Guatemalan Quetzal','Q','Centavo',100,'true','','.',',',320),(55,100,'GYD','Guyanese Dollar','$','Cent',100,'false','$','.',',',328),(56,100,'HKD','Hong Kong Dollar','$','Cent',100,'true','$','.',',',344),(57,100,'HNL','Honduran Lempira','L','Centavo',100,'true','','.',',',340),(58,100,'HRK','Croatian Kuna','kn','Lipa',100,'true','',',','.',191),(59,100,'HTG','Haitian Gourde','G','Centime',100,'false','','.',',',332),(60,100,'HUF','Hungarian Forint','Ft','Fillér',100,'false','',',','.',348),(61,100,'IDR','Indonesian Rupiah','Rp','Sen',100,'true','',',','.',360),(62,100,'ILS','Israeli New Sheqel','₪','Agora',100,'true','&#x20AA;','.',',',376),(63,100,'INR','Indian Rupee','₹','Paisa',100,'true','&#x20b9;','.',',',356),(64,100,'IQD','Iraqi Dinar','ع.د','Fils',1000,'false','','.',',',368),(65,100,'IRR','Iranian Rial','﷼','Dinar',100,'true','&#xFDFC;','.',',',364),(66,100,'ISK','Icelandic Króna','kr','Eyrir',100,'true','',',','.',352),(67,100,'JMD','Jamaican Dollar','$','Cent',100,'true','$','.',',',388),(68,100,'JOD','Jordanian Dinar','د.ا','Piastre',100,'true','','.',',',400),(69,6,'JPY','Japanese Yen','¥','null',1,'true','&#x00A5;','.',',',392),(70,100,'KES','Kenyan Shilling','KSh','Cent',100,'true','','.',',',404),(71,100,'KGS','Kyrgyzstani Som','som','Tyiyn',100,'false','','.',',',417),(72,100,'KHR','Cambodian Riel','៛','Sen',100,'false','&#x17DB;','.',',',116),(73,100,'KMF','Comorian Franc','Fr','Centime',100,'false','','.',',',174),(74,100,'KPW','North Korean Won','₩','Chŏn',100,'false','&#x20A9;','.',',',408),(75,100,'KRW','South Korean Won','₩','null',1,'true','&#x20A9;','.',',',410),(76,100,'KWD','Kuwaiti Dinar','د.ك','Fils',1000,'true','','.',',',414),(77,100,'KYD','Cayman Islands Dollar','$','Cent',100,'true','$','.',',',136),(78,100,'KZT','Kazakhstani Tenge','〒','Tiyn',100,'false','','.',',',398),(79,100,'LAK','Lao Kip','₭','Att',100,'false','&#x20AD;','.',',',418),(80,100,'LBP','Lebanese Pound','ل.ل','Piastre',100,'true','&#x00A3;','.',',',422),(81,100,'LKR','Sri Lankan Rupee','₨','Cent',100,'false','&#x0BF9;','.',',',144),(82,100,'LRD','Liberian Dollar','$','Cent',100,'false','$','.',',',430),(83,100,'LSL','Lesotho Loti','L','Sente',100,'false','','.',',',426),(84,100,'LTL','Lithuanian Litas','Lt','Centas',100,'false','','.',',',440),(85,100,'LVL','Latvian Lats','Ls','Santīms',100,'true','','.',',',428),(86,100,'LYD','Libyan Dinar','ل.د','Dirham',1000,'false','','.',',',434),(87,100,'MAD','Moroccan Dirham','د.م.','Centime',100,'false','','.',',',504),(88,100,'MDL','Moldovan Leu','L','Ban',100,'false','','.',',',498),(89,100,'MGA','Malagasy Ariary','Ar','Iraimbilanja',5,'true','','.',',',969),(90,100,'MKD','Macedonian Denar','ден','Deni',100,'false','','.',',',807),(91,100,'MMK','Myanmar Kyat','K','Pya',100,'false','','.',',',104),(92,100,'MNT','Mongolian Tögrög','₮','Möngö',100,'false','&#x20AE;','.',',',496),(93,100,'MOP','Macanese Pataca','P','Avo',100,'false','','.',',',446),(94,100,'MRO','Mauritanian Ouguiya','UM','Khoums',5,'false','','.',',',478),(95,100,'MUR','Mauritian Rupee','₨','Cent',100,'true','&#x20A8;','.',',',480),(96,100,'MVR','Maldivian Rufiyaa','MVR','Laari',100,'false','','.',',',462),(97,100,'MWK','Malawian Kwacha','MK','Tambala',100,'false','','.',',',454),(98,100,'MXN','Mexican Peso','$','Centavo',100,'true','$','.',',',484),(99,100,'MYR','Malaysian Ringgit','RM','Sen',100,'true','','.',',',458),(100,100,'MZN','Mozambican Metical','MTn','Centavo',100,'true','',',','.',943),(101,100,'NAD','Namibian Dollar','$','Cent',100,'false','$','.',',',516),(102,100,'NGN','Nigerian Naira','₦','Kobo',100,'false','&#x20A6;','.',',',566),(103,100,'NIO','Nicaraguan Córdoba','C$','Centavo',100,'false','','.',',',558),(104,100,'NOK','Norwegian Krone','kr','Øre',100,'true','kr',',','.',578),(105,100,'NPR','Nepalese Rupee','₨','Paisa',100,'true','&#x20A8;','.',',',524),(106,100,'NZD','New Zealand Dollar','$','Cent',100,'true','$','.',',',554),(107,100,'OMR','Omani Rial','ر.ع.','Baisa',1000,'true','&#xFDFC;','.',',',512),(108,100,'PAB','Panamanian Balboa','B/.','Centésimo',100,'false','','.',',',590),(109,100,'PEN','Peruvian Nuevo Sol','S/.','Céntimo',100,'true','S/.','.',',',604),(110,100,'PGK','Papua New Guinean Kina','K','Toea',100,'false','','.',',',598),(111,100,'PHP','Philippine Peso','₱','Centavo',100,'true','&#x20B1;','.',',',608),(112,100,'PKR','Pakistani Rupee','₨','Paisa',100,'true','&#x20A8;','.',',',586),(113,100,'PLN','Polish Złoty','zł','Grosz',100,'false','z&#322;',',','',985),(114,100,'PYG','Paraguayan Guaraní','₲','Céntimo',100,'true','&#x20B2;','.',',',600),(115,100,'QAR','Qatari Riyal','ر.ق','Dirham',100,'false','&#xFDFC;','.',',',634),(116,100,'RON','Romanian Leu','Lei','Bani',100,'true','',',','.',946),(117,100,'RSD','Serbian Dinar','РСД','Para',100,'true','','.',',',941),(118,100,'RUB','Russian Ruble','р.','Kopek',100,'false','&#x0440;&#x0443;&#x0431;',',','.',643),(119,100,'RWF','Rwandan Franc','FRw','Centime',100,'false','','.',',',646),(120,100,'SAR','Saudi Riyal','ر.س','Hallallah',100,'true','&#xFDFC;','.',',',682),(121,100,'SBD','Solomon Islands Dollar','$','Cent',100,'false','$','.',',',90),(122,100,'SCR','Seychellois Rupee','₨','Cent',100,'false','&#x20A8;','.',',',690),(123,100,'SDG','Sudanese Pound','£','Piastre',100,'true','','.',',',938),(124,100,'SEK','Swedish Krona','kr','Öre',100,'false','',',','',752),(125,100,'SGD','Singapore Dollar','$','Cent',100,'true','$','.',',',702),(126,100,'SHP','Saint Helenian Pound','£','Penny',100,'false','&#x00A3;','.',',',654),(127,100,'SKK','Slovak Koruna','Sk','Halier',100,'true','','.',',',703),(128,100,'SLL','Sierra Leonean Leone','Le','Cent',100,'false','','.',',',694),(129,100,'SOS','Somali Shilling','Sh','Cent',100,'false','','.',',',706),(130,100,'SRD','Surinamese Dollar','$','Cent',100,'false','','.',',',968),(131,100,'SSP','South Sudanese Pound','£','piaster',100,'false','&#x00A3;','.',',',728),(132,100,'STD','São Tomé and Príncipe Dobra','Db','Cêntimo',100,'false','','.',',',678),(133,100,'SVC','Salvadoran Colón','₡','Centavo',100,'true','&#x20A1;','.',',',222),(134,100,'SYP','Syrian Pound','£S','Piastre',100,'false','&#x00A3;','.',',',760),(135,100,'SZL','Swazi Lilangeni','L','Cent',100,'true','','.',',',748),(136,100,'THB','Thai Baht','฿','Satang',100,'true','&#x0E3F;','.',',',764),(137,100,'TJS','Tajikistani Somoni','ЅМ','Diram',100,'false','','.',',',972),(138,100,'TMT','Turkmenistani Manat','T','Tenge',100,'false','','.',',',934),(139,100,'TND','Tunisian Dinar','د.ت','Millime',1000,'false','','.',',',788),(140,100,'TOP','Tongan Paʻanga','T$','Seniti',100,'true','','.',',',776),(141,100,'TRY','Turkish Lira','TL','kuruş',100,'false','',',','.',949),(142,100,'TTD','Trinidad and Tobago Dollar','$','Cent',100,'false','$','.',',',780),(143,100,'TWD','New Taiwan Dollar','$','Cent',100,'true','$','.',',',901),(144,100,'TZS','Tanzanian Shilling','Sh','Cent',100,'true','','.',',',834),(145,100,'UAH','Ukrainian Hryvnia','₴','Kopiyka',100,'false','&#x20B4;','.',',',980),(146,100,'UGX','Ugandan Shilling','USh','Cent',100,'false','','.',',',800),(147,1,'USD','United States Dollar','$','Cent',100,'true','$','.',',',840),(148,100,'UYU','Uruguayan Peso','$','Centésimo',100,'true','&#x20B1;',',','.',858),(149,100,'UZS','Uzbekistani Som','null','Tiyin',100,'false','','.',',',860),(150,100,'VEF','Venezuelan Bolívar','Bs F','Céntimo',100,'true','',',','.',937),(151,100,'VND','Vietnamese Đồng','₫','Hào',10,'true','&#x20AB;',',','.',704),(152,100,'VUV','Vanuatu Vatu','Vt','null',1,'true','','.',',',548),(153,100,'WST','Samoan Tala','T','Sene',100,'false','','.',',',882),(154,100,'XAF','Central African Cfa Franc','Fr','Centime',100,'false','','.',',',950),(155,100,'XAG','Silver (Troy Ounce)','oz t','oz',1,'false','','.',',',961),(156,100,'XAU','Gold (Troy Ounce)','oz t','oz',1,'false','','.',',',959),(157,100,'XCD','East Caribbean Dollar','$','Cent',100,'true','$','.',',',951),(158,100,'XDR','Special Drawing Rights','SDR','',1,'false','$','.',',',960),(159,100,'XOF','West African Cfa Franc','Fr','Centime',100,'false','','.',',',952),(160,100,'XPF','Cfp Franc','Fr','Centime',100,'false','','.',',',953),(161,100,'YER','Yemeni Rial','﷼','Fils',100,'false','&#xFDFC;','.',',',886),(162,100,'ZAR','South African Rand','R','Cent',100,'true','&#x0052;','.',',',710),(163,100,'ZMK','Zambian Kwacha','ZK','Ngwee',100,'false','','.',',',894),(164,100,'ZMW','Zambian Kwacha','ZK','Ngwee',100,'false','','.',',',967);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_gateway_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
INSERT INTO `gateways` VALUES (1,'60964401751ab','/backend/img/payment-method/IMG-1620460545.png','Paypal','Paypal','5','6','enabled','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(2,'60964410731d9','/backend/img/payment-method/IMG-1620460560.png','Razorpay','Razorpay','7','8','enabled','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(3,'60964410732t9','/backend/img/payment-method/IMG-1617618450.png','Stripe','Stripe','10','11','enabled','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(4,'659644107y2g5','/backend/img/payment-method/bank-transfer.png','Bank Transfer','Bank Transfer','12','13','enabled','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(5,'60964401751kg','/backend/img/payment-method/IMG-1620460545.png','Paystack','Paystack','14','15','enabled','1','2023-06-19 00:46:47','2023-06-19 00:46:47');
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,NULL,'en','2023-06-18 23:46:42','2023-06-18 23:46:42');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
INSERT INTO `medias` VALUES (1,'6494d52a1f154','648fa59ac0edc','unnamed1.jpg','/images/648fa59ac0edc-6494d52a1f154.jpg','2023-06-22 22:11:38','2023-06-22 22:11:38');
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_08_29_200844_create_languages_table',1),(4,'2018_08_29_205156_create_translations_table',1),(5,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2021_03_31_131010_create_roles_table',1),(7,'2021_04_01_151204_create_themes_table',1),(8,'2021_04_01_151457_create_plans_table',1),(9,'2021_04_01_151522_create_business_cards_table',1),(10,'2021_04_01_151647_create_services_table',1),(11,'2021_04_01_151712_create_galleries_table',1),(12,'2021_04_01_151730_create_payments_table',1),(13,'2021_04_01_151755_create_business_hours_table',1),(14,'2021_04_01_151814_create_settings_table',1),(15,'2021_04_01_151835_create_gateways_table',1),(16,'2021_04_01_151858_create_transactions_table',1),(17,'2021_05_10_140547_create_currencies_table',1),(18,'2021_07_27_190247_create_config_table',1),(19,'2021_07_29_140453_create_pages_table',1),(20,'2021_08_03_171614_create_business_fields_table',1),(21,'2021_08_23_184731_create_store_products_table',1),(22,'2021_09_21_132016_create_medias_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home','banner','banner_title','Create your Digital Business Card','2023-06-19 00:46:47','2023-06-19 00:46:47'),(2,'home','banner','banner_description','SellApp is a Digital Business Card Maker. You can create your own digital vcard to attract your customers.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(3,'home','banner','banner_button_1','Sign up now','2023-06-19 00:46:47','2023-06-19 00:46:47'),(4,'home','banner','banner_button_1_link','/login','2023-06-19 00:46:47','2023-06-19 00:46:47'),(5,'home','banner','banner_button_2','How it works','2023-06-19 00:46:47','2023-06-19 00:46:47'),(6,'home','banner','banner_button_2_link','#how-it-works','2023-06-19 00:46:47','2023-06-19 00:46:47'),(7,'home','works','work_mini_title','How it works?','2023-06-19 00:46:47','2023-06-19 00:46:47'),(8,'home','works','work_title','Create, share & get more customers','2023-06-19 00:46:47','2023-06-19 00:46:47'),(9,'home','works','work_description','Register a new account, create your own digital business, share your unique link and get more customers.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(10,'home','works','work_li_title_1','Create business landing-page','2023-06-19 00:46:47','2023-06-19 00:46:47'),(11,'home','works','work_li_title_2','Share your link','2023-06-19 00:46:47','2023-06-19 00:46:47'),(12,'home','works','work_li_title_3','Get more customers','2023-06-19 00:46:47','2023-06-19 00:46:47'),(13,'home','works','work_card_title_1','Photo gallery','2023-06-19 00:46:47','2023-06-19 00:46:47'),(14,'home','works','work_card_description_1','You can show case your product images on your business card.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(15,'home','works','work_card_title_2','Services Listing','2023-06-19 00:46:47','2023-06-19 00:46:47'),(16,'home','works','work_card_description_2','You can list your services with explaination content and enquiry button. This helps you for high chance to convert your visitor into business lead.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(17,'home','works','work_card_title_3','Save Business Sites','2023-06-19 00:46:47','2023-06-19 00:46:47'),(18,'home','works','work_card_description_3','Visitor can save your phone number as Business Card file format.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(19,'home','works','work_card_title_4','Best for Businesses','2023-06-19 00:46:47','2023-06-19 00:46:47'),(20,'home','works','work_card_description_4','SellApp Digital Business cards will help you to transform your card visitors into customers.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(21,'home','features','feature_mini_title','Why Digitize your Business?','2023-06-19 00:46:47','2023-06-19 00:46:47'),(22,'home','features','feature_title','vCard Features','2023-06-19 00:46:47','2023-06-19 00:46:47'),(23,'home','features','feature_card_title_1','WhatsApp Enabled','2023-06-19 00:46:47','2023-06-19 00:46:47'),(24,'home','features','feature_card_description_1','You can enable and disable WhatsApp Chat Feature in your digital business card.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(25,'home','features','feature_card_description_2','Photo Gallery','2023-06-19 00:46:47','2023-06-19 00:46:47'),(26,'home','features','feature_card_description_2','You can upload product photos or any business related photos in your gallery section.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(27,'home','features','feature_card_description_3','Services Section','2023-06-19 00:46:47','2023-06-19 00:46:47'),(28,'home','features','feature_card_description_3','You can list your all services with image and description in this section.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(29,'home','features','feature_card_description_4','Payment Details','2023-06-19 00:46:47','2023-06-19 00:46:47'),(30,'home','features','feature_card_description_4','You can list your all accepted payment methods in your digital business card.','2023-06-19 00:46:47','2023-06-19 00:46:47'),(31,'home','features','feature_card_description_5','Business Hours','2023-06-19 00:46:47','2023-06-19 00:46:47'),(32,'home','features','feature_card_description_5','You can display your business opening hours. Your customer can easily understand when you are available.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(33,'home','features','feature_card_description_6','Google Business Integraion','2023-06-19 00:46:48','2023-06-19 00:46:48'),(34,'home','features','feature_card_description_6','You can integrate your Google Business Link with your business landing page.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(35,'home','features','feature_card_description_7','Google Maps Integraion','2023-06-19 00:46:48','2023-06-19 00:46:48'),(36,'home','features','feature_card_description_7','You can display your shop / business location in google maps. Visitors can easily find you.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(37,'home','features','feature_card_description_8','Social Media Links','2023-06-19 00:46:48','2023-06-19 00:46:48'),(38,'home','features','feature_card_description_8','Your all social media presence in one digital business card. Stay connect with your customers.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(39,'home','features','feature_card_description_9','Modern Theme','2023-06-19 00:46:48','2023-06-19 00:46:48'),(40,'home','features','feature_card_description_9','We used modern theme for user interface. It is fully responsive.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(41,'home','features','feature_card_description_10','Clean UI Design','2023-06-19 00:46:48','2023-06-19 00:46:48'),(42,'home','features','feature_card_description_10','We creafted all designs professionally. It made with latest frameworks.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(43,'home','features','feature_card_description_11','Faster Loading','2023-06-19 00:46:48','2023-06-19 00:46:48'),(44,'home','features','feature_card_description_11','We give more importance for page load. Your digital card load faster than normal webpages.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(45,'home','features','feature_card_description_12','Unique Link','2023-06-19 00:46:48','2023-06-19 00:46:48'),(46,'home','features','feature_card_description_12','Your name or business whatever it is. You can generate your business card link as per your choice.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(47,'home','pricing','pricing_mini_title','Pricing','2023-06-19 00:46:48','2023-06-19 00:46:48'),(48,'home','pricing','pricing_title','Choose your best plan','2023-06-19 00:46:48','2023-06-19 00:46:48'),(49,'home','pricing','pricing_subtitle','Good investments will gives you 10x more revenue.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(50,'faq','faq','faq_title','Frequently Asked Question','2023-06-19 00:46:48','2023-06-19 00:46:48'),(51,'faq','faq','faq_description','The most common questions about how our business works and what can do for you.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(52,'faq','faq','faq_question_1','How Long is this site live?','2023-06-19 00:46:48','2023-06-19 00:46:48'),(53,'faq','faq','faq_answer_1','Laboris qui labore cillum culpa in sunt quis sint veniam. Dolore ex aute deserunt esse ipsum elit aliqua. Aute quis minim velit nostrud pariatur culpa magna in aute.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(54,'faq','faq','faq_question_2','Can I install/upload anything I want on there?','2023-06-19 00:46:48','2023-06-19 00:46:48'),(55,'faq','faq','faq_answer_2','Laboris qui labore cillum culpa in sunt quis sint veniam. Dolore ex aute deserunt esse ipsum elit aliqua. Aute quis minim velit nostrud pariatur culpa magna in aute.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(56,'faq','faq','faq_question_3','How can I migrate to another site?','2023-06-19 00:46:48','2023-06-19 00:46:48'),(57,'faq','faq','faq_answer_3','Laboris qui labore cillum culpa in sunt quis sint veniam. Dolore ex aute deserunt esse ipsum elit aliqua. Aute quis minim velit nostrud pariatur culpa magna in aute.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(58,'faq','faq','faq_question_4','Can I change the domain you give me?','2023-06-19 00:46:48','2023-06-19 00:46:48'),(59,'faq','faq','faq_answer_4','Laboris qui labore cillum culpa in sunt quis sint veniam. Dolore ex aute deserunt esse ipsum elit aliqua. Aute quis minim velit nostrud pariatur culpa magna in aute.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(60,'faq','faq','faq_question_5','How many sites I can create at once?','2023-06-19 00:46:48','2023-06-19 00:46:48'),(61,'faq','faq','faq_answer_5','Laboris qui labore cillum culpa in sunt quis sint veniam. Dolore ex aute deserunt esse ipsum elit aliqua. Aute quis minim velit nostrud pariatur culpa magna in aute.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(62,'faq','faq','faq_question_6','How can I communicate with you?','2023-06-19 00:46:48','2023-06-19 00:46:48'),(63,'faq','faq','faq_answer_6','Laboris qui labore cillum culpa in sunt quis sint veniam. Dolore ex aute deserunt esse ipsum elit aliqua. Aute quis minim velit nostrud pariatur culpa magna in aute.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(64,'footer support email','support','support_email','support@sellapp.com.ng','2023-06-19 00:46:48','2023-06-19 00:46:48'),(65,'privacy','privacy','privacy_title','Privacy Policy for SellApp','2023-06-19 00:46:48','2023-06-19 00:46:48'),(66,'privacy','privacy','privacy_content_description','At SellApp, accessible from https://sellapp.com.ng/, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by SellApp and how we use it.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(67,'privacy','privacy','privacy_content_description','If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(68,'privacy','privacy','privacy_content_description','This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in SellApp. This policy is not applicable to any information collected offline or via channels other than this website.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(69,'privacy','privacy','privacy_content_title','Consent','2023-06-19 00:46:48','2023-06-19 00:46:48'),(70,'privacy','privacy','privacy_content_description','By using our website, you hereby consent to our Privacy Policy and agree to its terms.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(71,'privacy','privacy','privacy_content_title','Information we collect','2023-06-19 00:46:48','2023-06-19 00:46:48'),(72,'privacy','privacy','privacy_content_description','The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(73,'privacy','privacy','privacy_content_description','If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(74,'privacy','privacy','privacy_content_description','When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(75,'privacy','privacy','privacy_content_title','How we use your information','2023-06-19 00:46:48','2023-06-19 00:46:48'),(76,'privacy','privacy','privacy_content_description','We use the information we collect in various ways, including to:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(77,'privacy','privacy','privacy_content_description','1. Provide, operate, and maintain our website\r\n            2. Improve, personalize, and expand our website\r\n            3. Understand and analyze how you use our website\r\n            4. Develop new products, services, features, and functionality\r\n            5. Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes\r\n            6. Send you emails\r\n            7. Find and prevent fraud','2023-06-19 00:46:48','2023-06-19 00:46:48'),(78,'privacy','privacy','privacy_content_title','Log Files','2023-06-19 00:46:48','2023-06-19 00:46:48'),(79,'privacy','privacy','privacy_content_description','SellApp follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services analytics.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(80,'privacy','privacy','privacy_content_description','The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users movement on the website, and gathering demographic information.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(81,'privacy','privacy','privacy_content_title','Cookies and Web Beacons','2023-06-19 00:46:48','2023-06-19 00:46:48'),(82,'privacy','privacy','privacy_content_description','Like any other website, SellApp uses cookies. These cookies are used to store information including visitors preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users experience by customizing our web page content based on visitors browser type and/or other information.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(83,'privacy','privacy','privacy_content_description','For more general information on cookies, please read \"What Are Cookies\".','2023-06-19 00:46:48','2023-06-19 00:46:48'),(84,'privacy','privacy','privacy_content_title','Advertising Partners Privacy Policies','2023-06-19 00:46:48','2023-06-19 00:46:48'),(85,'privacy','privacy','privacy_content_description','You may consult this list to find the Privacy Policy for each of the advertising partners of SellApp.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(86,'privacy','privacy','privacy_content_description','Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on SellApp, which are sent directly to users browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(87,'privacy','privacy','privacy_content_description','Note that SellApp has no access to or control over these cookies that are used by third-party advertisers.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(88,'privacy','privacy','privacy_content_title','Third Party Privacy Policies','2023-06-19 00:46:48','2023-06-19 00:46:48'),(89,'privacy','privacy','privacy_content_description','SellApps Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(90,'privacy','privacy','privacy_content_description','You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers respective websites.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(91,'privacy','privacy','privacy_content_title','CCPA Privacy Rights (Do Not Sell My Personal Information)','2023-06-19 00:46:48','2023-06-19 00:46:48'),(92,'privacy','privacy','privacy_content_description','Under the CCPA, among other rights, California consumers have the right to:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(93,'privacy','privacy','privacy_content_description','Request that a business that collects a consumers personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(94,'privacy','privacy','privacy_content_description','Request that a business delete any personal data about the consumer that a business has collected.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(95,'privacy','privacy','privacy_content_description','Request that a business that sells a consumers personal data, not sell the consumers personal data.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(96,'privacy','privacy','privacy_content_description','If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(97,'privacy','privacy','privacy_content_title','GDPR Data Protection Rights','2023-06-19 00:46:48','2023-06-19 00:46:48'),(98,'privacy','privacy','privacy_content_description','We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(99,'privacy','privacy','privacy_content_description','The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(100,'privacy','privacy','privacy_content_description','The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(101,'privacy','privacy','privacy_content_description','The right to erasure – You have the right to request that we erase your personal data, under certain conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(102,'privacy','privacy','privacy_content_description','The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(103,'privacy','privacy','privacy_content_description','The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(104,'privacy','privacy','privacy_content_description','The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(105,'privacy','privacy','privacy_content_description','If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(106,'privacy','privacy','privacy_content_title','Childrens Information','2023-06-19 00:46:48','2023-06-19 00:46:48'),(107,'privacy','privacy','privacy_content_description','Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(108,'privacy','privacy','privacy_content_description','SellApp does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(109,'terms','terms','term_content_title','Terms and Conditions','2023-06-19 00:46:48','2023-06-19 00:46:48'),(110,'terms','terms','term_content_description','Welcome to SellApp!','2023-06-19 00:46:48','2023-06-19 00:46:48'),(111,'terms','terms','term_content_description','These terms and conditions outline the rules and regulations for the use of SellApps Website, located at https://sellapp.com.ng/.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(112,'terms','terms','term_content_description','By accessing this website we assume you accept these terms and conditions. Do not continue to use SellApp if you do not agree to take all of the terms and conditions stated on this page.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(113,'terms','terms','term_content_description','The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company’s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(114,'terms','terms','term_content_title','Cookies','2023-06-19 00:46:48','2023-06-19 00:46:48'),(115,'terms','terms','term_content_description','We employ the use of cookies. By accessing SellApp, you agreed to use cookies in agreement with the SellApps Privacy Policy.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(116,'terms','terms','term_content_description','Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(117,'terms','terms','term_content_title','License','2023-06-19 00:46:48','2023-06-19 00:46:48'),(118,'terms','terms','term_content_description','Unless otherwise stated, SellApp and/or its licensors own the intellectual property rights for all material on SellApp. All intellectual property rights are reserved. You may access this from SellApp for your own personal use subjected to restrictions set in these terms and conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(119,'terms','terms','term_content_description','You must not:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(120,'terms','terms','term_content_description','1. Republish material from SellApp\r\n            2. Sell, rent or sub-license material from SellApp\r\n            3. Reproduce, duplicate or copy material from SellApp\r\n            4. Redistribute content from SellApp','2023-06-19 00:46:48','2023-06-19 00:46:48'),(121,'terms','terms','term_content_description','This Agreement shall begin on the date hereof.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(122,'terms','terms','term_content_description','Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. SellApp does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of SellApp,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, SellApp shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(123,'terms','terms','term_content_description','SellApp reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(124,'terms','terms','term_content_description','You warrant and represent that:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(125,'terms','terms','term_content_description','1. You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;\r\n            2. The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;\r\n            3. The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\r\n            4. The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(126,'terms','terms','term_content_description','You hereby grant SellApp a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(127,'terms','terms','term_content_title','Hyperlinking to our Content','2023-06-19 00:46:48','2023-06-19 00:46:48'),(128,'terms','terms','term_content_description','The following organizations may link to our Website without prior written approval:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(129,'terms','terms','term_content_description','1. Government agencies;\r\n            2. Search engines;\r\n            3. News organizations;\r\n            4. Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and\r\n            5. System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(130,'terms','terms','term_content_description','These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(131,'terms','terms','term_content_description','We may consider and approve other link requests from the following types of organizations:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(132,'terms','terms','term_content_description','1. commonly-known consumer and/or business information sources;\r\n            2. dot.com community sites;\r\n            3. associations or other groups representing charities;\r\n            4. online directory distributors;\r\n            5. internet portals;\r\n            6. accounting, law and consulting firms; and\r\n            7. educational institutions and trade associations.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(133,'terms','terms','term_content_description','We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of SellApp; and (d) the link is in the context of general resource information.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(134,'terms','terms','term_content_description','These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(135,'terms','terms','term_content_description','If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to SellApp. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(136,'terms','terms','term_content_description','Approved organizations may hyperlink to our Website as follows:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(137,'terms','terms','term_content_description','1. By use of our corporate name; or\r\n            2. By use of the uniform resource locator being linked to; or\r\n            3. By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(138,'terms','terms','term_content_description','No use of SellApps logo or other artwork will be allowed for linking absent a trademark license agreement.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(139,'terms','terms','term_content_title','iFrames','2023-06-19 00:46:48','2023-06-19 00:46:48'),(140,'terms','terms','term_content_description','Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(141,'terms','terms','term_content_title','Content Liability','2023-06-19 00:46:48','2023-06-19 00:46:48'),(142,'terms','terms','term_content_description','We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(143,'terms','terms','term_content_title','Reservation of Rights','2023-06-19 00:46:48','2023-06-19 00:46:48'),(144,'terms','terms','term_content_description','We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(145,'terms','terms','term_content_title','Removal of links from our website','2023-06-19 00:46:48','2023-06-19 00:46:48'),(146,'terms','terms','term_content_description','If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(147,'terms','terms','term_content_description','We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(148,'terms','terms','term_content_title','Disclaimer','2023-06-19 00:46:48','2023-06-19 00:46:48'),(149,'terms','terms','term_content_description','To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(150,'terms','terms','term_content_description','1. limit or exclude our or your liability for death or personal injury;\r\n            2. limit or exclude our or your liability for fraud or fraudulent misrepresentation;\r\n            3. limit any of our or your liabilities in any way that is not permitted under applicable law; or\r\n            4. exclude any of our or your liabilities that may not be excluded under applicable law.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(151,'terms','terms','term_content_description','The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(152,'terms','terms','term_content_description','As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(153,'footer','footer','social-facebook','#','2023-06-19 00:46:48','2023-06-19 00:46:48'),(154,'footer','footer','social-twitter','#','2023-06-19 00:46:48','2023-06-19 00:46:48'),(155,'footer','footer','social-instagram','#','2023-06-19 00:46:48','2023-06-19 00:46:48'),(156,'footer','footer','social-linkedIn','#','2023-06-19 00:46:48','2023-06-19 00:46:48'),(157,'refund','refund','refund-title','Return and Refund Policy','2023-06-19 00:46:48','2023-06-19 00:46:48'),(158,'refund','refund','refund-desc','Last updated: June 23, 2023','2023-06-19 00:46:48','2023-06-19 00:46:48'),(159,'refund','refund','desc','Thank you for shopping at SellApp.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(160,'refund','refund','desc','If, for any reason, You are not completely satisfied with a purchase We invite You to review our policy on refunds and returns.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(161,'refund','refund','desc','The following terms are applicable for any products that You purchased with Us.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(162,'refund','refund','desc','Interpretation and Definitions','2023-06-19 00:46:48','2023-06-19 00:46:48'),(163,'refund','refund','desc','Interpretation','2023-06-19 00:46:48','2023-06-19 00:46:48'),(164,'refund','refund','desc','The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(165,'refund','refund','desc','Definitions','2023-06-19 00:46:48','2023-06-19 00:46:48'),(166,'refund','refund','desc','For the purposes of this Return and Refund Policy:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(167,'refund','refund','desc','1. Company referred to as either the Company We, Us or Our in this Agreement) refers to SellApp, Chennai.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(168,'refund','refund','desc','2. Goods refer to the items offered for sale on the Service.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(169,'refund','refund','desc','3. Orders mean a request by You to purchase Goods from Us.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(170,'refund','refund','desc','4. Service refers to the Website.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(171,'refund','refund','desc','5. Website refers to SellApp, accessible from https://sellapp.com.ng','2023-06-19 00:46:48','2023-06-19 00:46:48'),(172,'refund','refund','desc','6. You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(173,'refund','refund','desc','Your Order Cancellation Rights','2023-06-19 00:46:48','2023-06-19 00:46:48'),(174,'refund','refund','desc','You are entitled to cancel Your Order within 7 days without giving any reason for doing so.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(175,'refund','refund','desc','The deadline for cancelling an Order is 7 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(176,'refund','refund','desc','In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(177,'refund','refund','desc','By email: support@sellapp.com.ng','2023-06-19 00:46:48','2023-06-19 00:46:48'),(178,'refund','refund','desc','We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.','2023-06-19 00:46:48','2023-06-19 00:46:48'),(179,'refund','refund','desc','Conditions for Returns','2023-06-19 00:46:48','2023-06-19 00:46:48'),(180,'refund','refund','desc','In order for the Goods to be eligible for a return, please make sure that:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(181,'refund','refund','desc','1. The Goods were purchased in the last 7 days','2023-06-19 00:46:48','2023-06-19 00:46:48'),(182,'refund','refund','desc','The following Goods cannot be returned:','2023-06-19 00:46:48','2023-06-19 00:46:48'),(183,'refund','refund','desc','1. The supply of Goods made to Your specifications or clearly personalized.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(184,'refund','refund','desc','2. The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(185,'refund','refund','desc','3. The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(186,'refund','refund','desc','4. The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(187,'refund','refund','desc','We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(188,'refund','refund','desc','Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(189,'refund','refund','desc','Returning Goods','2023-06-19 00:46:49','2023-06-19 00:46:49'),(190,'refund','refund','desc','You are responsible for the cost and risk of returning the Goods to Us. You should send the Goods at the following address:','2023-06-19 00:46:49','2023-06-19 00:46:49'),(191,'refund','refund','desc','Chennai,\r\n            Tamilnadu, 600028\r\n            India','2023-06-19 00:46:49','2023-06-19 00:46:49'),(192,'refund','refund','desc','We cannot be held responsible for Goods damaged or lost in return shipment. Therefore, We recommend an insured and trackable mail service. We are unable to issue a refund without actual receipt of the Goods or proof of received return delivery.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(193,'refund','refund','desc','Contact Us','2023-06-19 00:46:49','2023-06-19 00:46:49'),(194,'refund','refund','desc','If you have any questions about our Returns and Refunds Policy, please contact us:','2023-06-19 00:46:49','2023-06-19 00:46:49'),(195,'refund','refund','desc','By email: support@sellapp.com.ng','2023-06-19 00:46:49','2023-06-19 00:46:49'),(196,'contact','contact','page_name','Contact','2023-06-19 00:46:49','2023-06-19 00:46:49'),(197,'contact','contact','page_subtitle','Got any question? Let’s talk about it.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(198,'contact','contact','page_section_1','Office','2023-06-19 00:46:49','2023-06-19 00:46:49'),(199,'contact','contact','page_section_1_content_1','No24, Yakubu Gowan Road, Opposite Secretariat Junction','2023-06-19 00:46:49','2023-06-19 00:46:49'),(200,'contact','contact','page_section_1_content_2','Jos, Nigeria','2023-06-19 00:46:49','2023-06-19 00:46:49'),(201,'contact','contact','page_section_2','Contacts','2023-06-19 00:46:49','2023-06-19 00:46:49'),(202,'contact','contact','page_section_2_content_1','info@sellapp.com.ng','2023-06-19 00:46:49','2023-06-19 00:46:49'),(203,'contact','contact','page_section_2_content_1','+234 708 906 8401','2023-06-19 00:46:49','2023-06-19 00:46:49'),(204,'contact','contact','page_section_3',NULL,'2023-06-19 00:46:49','2023-06-19 00:46:49'),(205,'about','about','about_content_title','About us','2023-06-19 00:46:49','2023-06-19 00:46:49'),(206,'about','about','about_content_description','Welcome to SellApp!','2023-06-19 00:46:49','2023-06-19 00:46:49'),(207,'about','about','about_content_description','SellApp is an application that empower businesses and entrepreneurs with a powerful online presence. Our mission is to provide a user-friendly platform that allows users to create website landing pages and connect them to their WhatsApp accounts for seamless order collection and customer engagement.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(208,'about','about','about_content_description','We understand the challenges faced by businesses in establishing an online presence. From the complexities of website development to the demands of managing an ecommerce store, it can be overwhelming. That\'s why we created SellApp – to simplify the process and make it accessible to everyone, regardless of technical expertise.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(209,'about','about','about_content_description','With SellApp, you can easily build a professional website landing page without the need for coding skills or extensive design knowledge. Our intuitive interface and customizable templates enable you to showcase your brand, products, and services in a visually stunning and engaging manner. You have full control over the look and feel of your website, ensuring it accurately reflects your unique identity.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(210,'about','about','about_content_title','About the company','2023-06-19 00:46:49','2023-06-19 00:46:49'),(211,'about','about','about_content_description','What sets SellApp apart is our seamless integration with WhatsApp, a widely used messaging platform. By connecting your WhatsApp account to your online store, you can facilitate direct communication with your customers. They can inquire about your offerings, place orders, and receive support, all through the convenience of their favorite messaging app. This direct interaction not only enhances customer experience but also builds trust and loyalty.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(212,'about','about','about_content_description','SellApp also understands the importance of ecommerce for businesses today. Our platform offers effortless integration of ecommerce functionalities, allowing you to transform your website into a fully functional online store. Manage inventory, track orders, process payments securely, and provide a convenient shopping experience to your customers.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(213,'about','about','about_content_description','We prioritize the security and reliability of your website and ecommerce store. SellApp employs robust security measures to safeguard your data, ensuring that your customers can browse and transact with confidence.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(214,'about','about','about_content_description','Our team is committed to continuous improvement and staying ahead of industry trends. We regularly update our platform with new features and optimizations to ensure that you have access to the latest tools and technologies for your online success.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(215,'about','about','about_content_description','Join SellApp today and unlock the potential of your business. Create a compelling online presence, connect with customers through WhatsApp, and streamline your sales process. Let us empower you to thrive in the digital world. SellApp: Your Partner in Online Success.','2023-06-19 00:46:49','2023-06-19 00:46:49'),(216,'about','about','about_content_description',NULL,'2023-06-19 00:46:49','2023-06-19 00:46:49'),(217,'about','about','about_content_description',NULL,'2023-06-19 00:46:49','2023-06-19 00:46:49'),(218,'about','about','about_content_description',NULL,'2023-06-19 00:46:49','2023-06-19 00:46:49'),(219,'about','about','about_content_description',NULL,'2023-06-19 00:46:49','2023-06-19 00:46:49');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_description` longtext COLLATE utf8mb4_unicode_ci,
  `plan_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_vcards` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_services` int NOT NULL,
  `no_of_galleries` int NOT NULL,
  `no_of_features` int NOT NULL,
  `no_of_payments` int NOT NULL,
  `personalized_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_branding` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `free_setup` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `free_support` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recommended` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_watermark_enabled` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'60673288f0d35','Beginner','Nullam diam arcu, sodales quis convallis sit amet, sagittis varius ligula.','0','15','1',5,5,5,5,'0','0','0','0','0','0','1','2023-06-19 00:46:47','2023-06-22 23:44:57'),(2,'606732aa4fb58','Intermediate','Nullam diam arcu, sodales quis convallis sit amet, sagittis varius ligula.','2500','31','5',10,10,10,10,'1','1','0','0','1','1','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(3,'606732cb4ec9b','Professional','Nullam diam arcu, sodales quis convallis sit amet, sagittis varius ligula.','5000','31','999',999,999,999,999,'1','1','1','1','0','1','1','2023-06-19 00:46:47','2023-06-22 23:03:48'),(4,'6494ea92e5f9d','Gold','With this you have you can leave like a king','10000','30','20',20,20,12,21,'1','1','1','1','0','1','0','2023-06-22 23:42:58','2023-06-22 23:43:25');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','admin',NULL,NULL),(2,'User','user',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_description` longtext COLLATE utf8mb4_unicode_ci,
  `enable_enquiry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `google_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_analytics_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` longtext COLLATE utf8mb4_unicode_ci,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `seo_keywords` longtext COLLATE utf8mb4_unicode_ci,
  `seo_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tawk_chat_bot_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'254212fdd454','UA-554155-3','SellApp','/backend/img/logo.png','/backend/img/favicon.png','This is sample meta description','keyword 1, keyword 2','/backend/img/logo.png','6065effc067c2605c0be7a60/1f2732tnm','SellApp','noreply@sellapp.com','smtp','smtp.mailtrap.io',2525,'tls','','','1','2023-06-19 00:46:47','2023-06-19 00:46:47');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_products`
--

DROP TABLE IF EXISTS `store_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_subtitle` longtext COLLATE utf8mb4_unicode_ci,
  `regular_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_products`
--

LOCK TABLES `store_products` WRITE;
/*!40000 ALTER TABLE `store_products` DISABLE KEYS */;
INSERT INTO `store_products` VALUES (2,'64937565cc963','6494d53c646aa','Bag','/images/648fa59ac0edc-6494d52a1f154.jpg','bag','bag','3000','3400','instock','1','2023-06-22 22:11:56','2023-06-22 22:11:56');
/*!40000 ALTER TABLE `store_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'7ccc432a06caa','Modern vCard Light','vCard','modern-light.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(2,'7ccc432a06vta','Modern vCard Dark','vCard','modern-dark.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(3,'7ccc432a06cth','Classic vCard Light','vCard','classic-light.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(4,'7ccc432a06vyw','Classic vCard Dark','vCard','classic-dark.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(5,'7ccc432a06ctw','Metro vCard Light','vCard','metro-light.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(6,'7ccc432a06vhd','Metro vCard Dark','vCard','metro-dark.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(7,'7ccc432a06hty','Modern Store Light','WhatsApp Store','modern-store-light.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47'),(8,'7ccc432a06hju','Modern Store Dark','WhatsApp Store','modern-store-dark.png','Free','1','2023-06-19 00:46:47','2023-06-19 00:46:47');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gobiz_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `payment_gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_details` longtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'648fa5af82e5d','2023-06-19 00:47:43',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:47:43','2023-06-18 23:47:43'),(2,'648fa5f5f1c03','2023-06-19 00:48:53',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:48:53','2023-06-18 23:48:53'),(3,'648fa6253bf28','2023-06-19 00:49:41',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:49:41','2023-06-18 23:49:41'),(4,'648fa6fd608a1','2023-06-19 00:53:17',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:53:17','2023-06-18 23:53:17'),(5,'648fa761773b8','2023-06-19 00:54:57',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:54:57','2023-06-18 23:54:57'),(6,'648fa77f17232','2023-06-19 00:55:27',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:55:27','2023-06-18 23:55:27'),(7,'648fa786bd90e','2023-06-19 00:55:34',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:55:34','2023-06-18 23:55:34'),(8,'648fa7afe6bfb','2023-06-19 00:56:15',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:56:15','2023-06-18 23:56:15'),(9,'648fa7b4d1c8a','2023-06-19 00:56:20',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:56:20','2023-06-18 23:56:20'),(10,'648fa7bbd8f5f','2023-06-19 00:56:27',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-18 23:56:27','2023-06-18 23:56:27'),(11,'6490f0717a7d4','2023-06-20 00:18:57',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-19 23:18:57','2023-06-19 23:18:57'),(12,'6490fc491de33','2023-06-20 01:09:29',NULL,'2','606732aa4fb58',NULL,NULL,NULL,'2500',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_email\":\"giftdilas@gmail.com\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":2500,\"subtotal\":\"2500\",\"tax_amount\":0}',NULL,'1','2023-06-20 00:09:29','2023-06-20 00:09:29'),(13,'6490fe8d8ba2d','2023-06-20 01:19:09','eE7W5JWE9CmxiD0KvKxFGnIl2','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 00:19:09','2023-06-22 22:24:34'),(14,'6490febd78165','2023-06-20 01:19:57','uG4vzDngQySTsVTMb0pAsl42A','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:19:57','2023-06-20 00:19:57'),(15,'6490fee7067d7','2023-06-20 01:20:39','vJKX2WcHp0MC2l0MnOXRuAATy','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:20:39','2023-06-20 00:20:39'),(16,'6491012e29aa2','2023-06-20 01:30:22','6Z2T7c64VL1ffftQstgUvqM3M','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:30:22','2023-06-20 00:30:22'),(17,'6491016c405b4','2023-06-20 01:31:24','hEoUqPfrAXwEhWTzAdMwZNH7M','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:31:24','2023-06-20 00:31:24'),(18,'6491017f4b13d','2023-06-20 01:31:43','xSngtWgW8iAFESs0wcw2UmTy2','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:31:43','2023-06-20 00:31:43'),(19,'64910195346be','2023-06-20 01:32:05','dhL89Ip7UGkcplzLMDteiHb5w','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:32:05','2023-06-20 00:32:05'),(20,'649101cd3da63','2023-06-20 01:33:01','QtHzBCuFPUVBHjqwmpeuL9pgS','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:33:01','2023-06-20 00:33:01'),(21,'6491021f183d8','2023-06-20 01:34:23','ULjxhIO1c4WJ7rimpo0HK4HN9','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:34:23','2023-06-20 00:34:23'),(22,'6491023509d7e','2023-06-20 01:34:45','Bvb5kxrghqkU1Efhv1mUL0eaG','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:34:45','2023-06-20 00:34:45'),(23,'6491035b394b5','2023-06-20 01:39:39','2QGAJbLfe0re806tAQhjHy1aV','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:39:39','2023-06-20 00:39:39'),(24,'649103738164f','2023-06-20 01:40:03','8Ulrkmm37zWenIohhaHCN8exa','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:40:03','2023-06-20 00:40:03'),(25,'649103cbc9d81','2023-06-20 01:41:31','649103cbc9dbd','2','60673288f0d35','Beginner Plan','FREE','default_currency','0',NULL,NULL,'{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":null,\"to_billing_address\":null,\"to_billing_city\":null,\"to_billing_state\":null,\"to_billing_zipcode\":null,\"to_billing_country\":null,\"to_billing_phone\":null,\"to_billing_email\":null,\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":0,\"subtotal\":0,\"tax_amount\":0}','SUCCESS','1','2023-06-20 00:41:31','2023-06-20 00:41:31'),(26,'649103ddab4a5','2023-06-20 01:41:49','kxIhKM02ZKHkhXfwEl7L1Iv0V','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:41:49','2023-06-20 00:41:49'),(27,'649104049b2a9','2023-06-20 01:42:28','6uQcqBqFq8mhPrgHeUbw65ubF','2','606732cb4ec9b','Professional Plan','Paystack','default_currency','500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":50000,\"subtotal\":\"500\",\"tax_amount\":0}','PENDING','1','2023-06-20 00:42:28','2023-06-20 00:42:28'),(28,'6491ba1605ead','2023-06-20 14:39:18','PfCy8uXERSe5xJwOEYRmMWZHR','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 13:39:18','2023-06-20 13:39:18'),(29,'6491bf1c1959d','2023-06-20 15:00:44','GFTeHWuwB3OVhqT9QhWfevnNL','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 14:00:44','2023-06-20 14:00:44'),(30,'6491c1070f61a','2023-06-20 15:08:55','iEZXFlnxoyXjttPw84iZhpxtm','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 14:08:55','2023-06-20 14:08:55'),(31,'6491c12a4e654','2023-06-20 15:09:30','sMDhRq9V5Op8uhGaSXpdt5wxM','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 14:09:30','2023-06-20 14:09:30'),(32,'6491c150722b9','2023-06-20 15:10:08','AOPSqLLJa0paMzhPSsI9Cu43M','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 14:10:08','2023-06-20 14:10:08'),(33,'6491c17fe0216','2023-06-20 15:10:55','3wIuxwWrgX21kTOl6UJKUtFAo','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 14:10:55','2023-06-20 14:10:55'),(34,'6491c1ae5ee84','2023-06-20 15:11:42','bUY4Eitf1eTj3MGWvM1cf5gPa','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','PENDING','1','2023-06-20 14:11:42','2023-06-20 14:11:42'),(35,'6491c1d45a357','2023-06-20 15:12:20','q9tEFRq3JpuwmxzPz6cmJscmL','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 14:12:20','2023-06-20 14:18:32'),(36,'64922331be4c1','2023-06-20 22:07:45','DR4nSFbCk5u93L6eqK5rmZBDA','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:07:45','2023-06-20 21:08:07'),(37,'649223761a250','2023-06-20 22:08:54','32aBzAS7EQRGEItzwCNTzMq0P','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:08:54','2023-06-20 21:09:11'),(38,'6492259d3d755','2023-06-20 22:18:05','nOKjPs1Pd3tRapUC3ah7OIZ33','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:18:05','2023-06-20 21:18:16'),(39,'64922843e8d09','2023-06-20 22:29:23','5Vh0bLa1m9d4iUkEd7vF7jiTN','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:29:23','2023-06-20 21:29:42'),(40,'64922a00881b8','2023-06-20 22:36:48','mtZp3SvGT6BHUmmTmPTI05Abk','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:36:48','2023-06-20 21:36:59'),(41,'64922cd2da7db','2023-06-20 22:48:50','PJter874c2Me1Pwo1EyDQ3NQA','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:48:50','2023-06-20 21:49:02'),(42,'64922d1c24be9','2023-06-20 22:50:04','tbkft7QA1IFBMbkNvWMdbign6','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:50:04','2023-06-20 21:50:14'),(43,'64922db91c911','2023-06-20 22:52:41','ilXYELsuSY9evArNxSK732zvl','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:52:41','2023-06-20 21:52:53'),(44,'64922dff6d03f','2023-06-20 22:53:51','JVOZRJRknPICI2ViopHz1rHcI','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:53:51','2023-06-20 21:54:01'),(45,'64922e3aa6690','2023-06-20 22:54:50','UXe4eub6DF0noeJoC06CANMrV','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500',NULL,NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 21:54:50','2023-06-20 21:55:01'),(46,'649231b45223f','2023-06-20 23:09:40','RlvGj3GmTPY65fGqIXxENlCgn','2','606732aa4fb58','Intermediate Plan','Paystack','default_currency','2500','1',NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":250000,\"subtotal\":\"2500\",\"tax_amount\":0}','SUCCESS','1','2023-06-20 22:09:40','2023-06-20 23:08:35'),(47,'64924fc78d8dd','2023-06-21 01:17:59','jcd3vYeGGH9cilfCMieIi9qo5','2','606732cb4ec9b','Professional Plan','Paystack','default_currency','500','1',NULL,'{\"from_billing_name\":\"Gift Dilas\",\"from_billing_address\":\"Old airport\",\"from_billing_city\":\"Jos\",\"from_billing_state\":\"Plateau\",\"from_billing_zipcode\":\"932423\",\"from_billing_country\":\"Nigeria\",\"from_vat_number\":null,\"from_billing_phone\":\"07089068401\",\"from_billing_email\":\"giftdilas@gmail.com\",\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":50000,\"subtotal\":\"500\",\"tax_amount\":0}','SUCCESS','1','2023-06-21 00:17:59','2023-06-21 00:18:15'),(48,'6494e33669281','2023-06-23 00:11:34','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:11:34','2023-06-22 23:11:34'),(49,'6494e39d4bbf7','2023-06-23 00:13:17','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:13:17','2023-06-22 23:13:17'),(50,'6494e3f485d2d','2023-06-23 00:14:44','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:14:44','2023-06-22 23:14:44'),(51,'6494e41de30e9','2023-06-23 00:15:25','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:15:25','2023-06-22 23:15:25'),(52,'6494e7602fa3c','2023-06-23 00:29:20','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:29:20','2023-06-22 23:29:20'),(53,'6494e7e12c7b9','2023-06-23 00:31:29','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:31:29','2023-06-22 23:31:29'),(54,'6494e832b9f26','2023-06-23 00:32:50','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:32:50','2023-06-22 23:32:50'),(55,'6494e8467dac9','2023-06-23 00:33:10','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:33:10','2023-06-22 23:33:10'),(56,'6494e8af04e45','2023-06-23 00:34:55','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:34:55','2023-06-22 23:34:55'),(57,'6494e8b47dfeb','2023-06-23 00:35:00','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:35:00','2023-06-22 23:35:00'),(58,'6494e9240cdf3','2023-06-23 00:36:52','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:36:52','2023-06-22 23:36:52'),(59,'6494e953abf66','2023-06-23 00:37:39','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:37:39','2023-06-22 23:37:39'),(60,'6494e958769cd','2023-06-23 00:37:44','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:37:44','2023-06-22 23:37:44'),(61,'6494e9658577f','2023-06-23 00:37:57','','2','606732cb4ec9b','Professional Plan','Offline','default_currency','','1','','{\"from_billing_name\":null,\"from_billing_address\":null,\"from_billing_city\":null,\"from_billing_state\":null,\"from_billing_zipcode\":null,\"from_billing_country\":null,\"from_vat_number\":null,\"from_billing_phone\":null,\"from_billing_email\":null,\"to_billing_name\":\"Gift Dilas\",\"to_billing_address\":\"Old airport\",\"to_billing_city\":\"Jos\",\"to_billing_state\":\"Plateau\",\"to_billing_zipcode\":\"932423\",\"to_billing_country\":\"Nigeria\",\"to_billing_phone\":\"07089068401\",\"to_billing_email\":\"giftdilas@gmail.com\",\"to_vat_number\":null,\"tax_name\":null,\"tax_type\":null,\"tax_value\":null,\"invoice_amount\":\"\",\"subtotal\":\"5000\",\"tax_amount\":0}','SUCCESS','1','2023-06-22 23:37:57','2023-06-22 23:37:57');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_language_id_foreign` (`language_id`),
  CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint NOT NULL DEFAULT '2',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` longtext COLLATE utf8mb4_unicode_ci,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_details` longtext COLLATE utf8mb4_unicode_ci,
  `plan_validity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_activation_date` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` longtext COLLATE utf8mb4_unicode_ci,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'609c03880ee47','SellApp','josephdilas@gmail.com',1,NULL,'$2y$10$gKX8g5LqUkHVGxopByulLOZ8RO9j6CQ03qZRGmoE12ev7fRnxHlTa','Email',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2023-06-19 00:46:47','2023-06-19 00:46:47'),(2,'648fa59ac0edc','Gift Dilas','giftdilas@gmail.com',2,NULL,'$2y$10$DFycSwcY7AOjjxEydJcUz.bncefkV7FswizsSj6r7tTYhG7pcs50C','Email',NULL,'606732cb4ec9b','31','{\"id\":3,\"plan_id\":\"606732cb4ec9b\",\"plan_name\":\"Professional\",\"plan_description\":\"Nullam diam arcu, sodales quis convallis sit amet, sagittis varius ligula.\",\"plan_price\":\"5000\",\"validity\":\"31\",\"no_of_vcards\":\"999\",\"no_of_services\":999,\"no_of_galleries\":999,\"no_of_features\":999,\"no_of_payments\":999,\"personalized_link\":\"1\",\"hide_branding\":\"1\",\"free_setup\":\"1\",\"free_support\":\"1\",\"recommended\":\"0\",\"is_watermark_enabled\":\"1\",\"status\":\"1\",\"created_at\":\"2023-06-19T01:46:47.000000Z\",\"updated_at\":\"2023-06-23T00:03:48.000000Z\"}','2024-09-28 01:18:15','2023-06-22 23:37:57','Gift Dilas','personal',NULL,'Old airport','Jos','Plateau','932423','Nigeria','07089068401','giftdilas@gmail.com',1,NULL,'2023-06-18 23:47:23','2023-06-22 23:37:57');
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

-- Dump completed on 2023-06-23  2:35:20
