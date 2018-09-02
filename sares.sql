-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: sarec
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

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
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT INTO `accounts_userprofile` VALUES (1,'profiles/perfil_AhvJEi9.jpg',1),(2,'profiles/Marvin.jpg',2),(3,'profiles/Enrique.jpg',3),(4,'profiles/Norman.jpg',4),(5,'profiles/Marco_0ACzunY.jpg',5),(6,'profiles/Johny.jpg',6),(7,'profiles/Ana.jpg',7),(8,'profiles/oscar.jpg',8),(9,'profiles/pablo.jpg',9),(10,'profiles/Marvin_2DjqLfZ.jpg',10),(11,'profiles/leomel.jpg',11);
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user profile',7,'add_userprofile'),(20,'Can change user profile',7,'change_userprofile'),(21,'Can delete user profile',7,'delete_userprofile'),(22,'Can add investigator',8,'add_investigator'),(23,'Can change investigator',8,'change_investigator'),(24,'Can delete investigator',8,'delete_investigator'),(25,'Can add investigator_ social',9,'add_investigator_social'),(26,'Can change investigator_ social',9,'change_investigator_social'),(27,'Can delete investigator_ social',9,'delete_investigator_social'),(28,'Can add social links',10,'add_sociallinks'),(29,'Can change social links',10,'change_sociallinks'),(30,'Can delete social links',10,'delete_sociallinks'),(31,'Can add testimony',11,'add_testimony'),(32,'Can change testimony',11,'change_testimony'),(33,'Can delete testimony',11,'delete_testimony'),(34,'Can add tag',12,'add_tag'),(35,'Can change tag',12,'change_tag'),(36,'Can delete tag',12,'delete_tag'),(37,'Can add article',13,'add_article'),(38,'Can change article',13,'change_article'),(39,'Can delete article',13,'delete_article'),(40,'Can add media',14,'add_media'),(41,'Can change media',14,'change_media'),(42,'Can delete media',14,'delete_media'),(43,'Can add category',15,'add_category'),(44,'Can change category',15,'change_category'),(45,'Can delete category',15,'delete_category'),(46,'Can add subcategory',16,'add_subcategory'),(47,'Can change subcategory',16,'change_subcategory'),(48,'Can delete subcategory',16,'delete_subcategory'),(49,'Can add configurations',17,'add_configurations'),(50,'Can change configurations',17,'change_configurations'),(51,'Can delete configurations',17,'delete_configurations'),(52,'Can add history',18,'add_history'),(53,'Can change history',18,'change_history'),(54,'Can delete history',18,'delete_history'),(55,'Can add cooperation',19,'add_cooperation'),(56,'Can change cooperation',19,'change_cooperation'),(57,'Can delete cooperation',19,'delete_cooperation'),(58,'Can add investigation lines',20,'add_investigationlines'),(59,'Can change investigation lines',20,'change_investigationlines'),(60,'Can delete investigation lines',20,'delete_investigationlines'),(61,'Can add grade',21,'add_grade'),(62,'Can change grade',21,'change_grade'),(63,'Can delete grade',21,'delete_grade'),(64,'Can add pos grade',22,'add_posgrade'),(65,'Can change pos grade',22,'change_posgrade'),(66,'Can delete pos grade',22,'delete_posgrade'),(67,'Can add blog article',23,'add_blogarticle'),(68,'Can change blog article',23,'change_blogarticle'),(69,'Can delete blog article',23,'delete_blogarticle');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$XHFel4LxBAVQ$IauHe9X1/NIWHpYCNZeeaVOMJS8z/KDqOlScqFOHQxY=','2017-05-04 17:41:25.398907',1,'Alvaromero','Alvaro','Romero','alvaro.jrp.1994@gmail.com',1,1,'2016-09-11 20:41:22.535000'),(2,'pbkdf2_sha256$30000$2HPGsaiKPrdh$AwhH/bYbANlY+sALhFp5zqqjlHJTxH3PRdWPE+qKuPI=','2017-05-03 21:13:50.247166',0,'MarvinGarache','Marvin','Garache','marvin.garache@gmail.com',0,1,'2017-04-23 21:54:06.234506'),(3,'pbkdf2_sha256$30000$UpCZdvRX1ZoI$3OEwmNdRDbGNYft+a9/SghDB7jFfjh/OM9boO/qXpUg=','2017-04-24 03:47:38.383546',0,'EnriqueSilva','Enrique','Silva','usuario@gmail.com',0,1,'2017-04-24 01:42:48.390250'),(4,'pbkdf2_sha256$30000$gQ8bh8jCQAG5$yANHkoQmfBMuOHevbvcyQu2Bkvwzg0w44wx+iXXhOA8=',NULL,0,'NormanVargas','Norman','Vargas','usuario@gmail.com',0,1,'2017-04-24 01:46:06.021434'),(5,'pbkdf2_sha256$30000$AqB9dkkTaDRQ$r1fFQ4y71L3WJYtKbx25h8i0rqOoEWBxNcz78i2slpE=',NULL,0,'MarcoMunguía','Marco','Munguía Mena','usuario@gmail.com',0,1,'2017-04-24 01:51:13.051920'),(6,'pbkdf2_sha256$36000$LGYF1Okp90Ri$DKjPD7n9aCgAtKCxoLS5ljSPU+wyp1ocecBZrzSMhVE=','2017-05-06 16:46:00.971637',0,'JohnnyFlores','Johnny','Flores Delgadillo','usuario@gmail.com',0,1,'2017-04-24 01:56:05.844768'),(7,'pbkdf2_sha256$36000$9ouuwlcpkRri$lnfWns3l6jM6yQiUodfSw8DyEF/sOxRHFHetH0PFYp8=','2017-05-12 23:12:09.260607',0,'AnayanciLópez','Anayanci','López Poveda','usuario@gmail.com',0,1,'2017-04-24 02:01:43.690029'),(8,'pbkdf2_sha256$30000$e9ZNgPJZ9a6M$HVuXX7VL9wlwlhJaovHpD1ijyEmJvqs+JLPKyiHyYXk=',NULL,0,'OscarSomarriba','Oscar','Somarriba','usuario@gmail.com',0,1,'2017-04-24 02:04:04.302490'),(9,'pbkdf2_sha256$30000$juvKrHCm2hcM$vOykIYNvRu4fQ92LWy1RdcsVKxnff2osdgOZlOFrLgE=','2017-05-03 23:08:20.482464',0,'PabloVasquez','Pablo','Vásquez','usuario@gmail.com',0,1,'2017-04-24 02:06:41.190546'),(10,'pbkdf2_sha256$30000$QfuUuHGteUjA$R0MoQHv1bhedgBvXR65ujIeOcyLqla9cN455NcKfbpE=','2017-05-04 00:47:34.504581',0,'MarvinArias','Arias','Olivas','usuario@gmail.com',0,1,'2017-04-24 02:55:34.811552'),(11,'pbkdf2_sha256$30000$ZEoelMZW7sLT$gN4TArWuijxWFTY+Orb+2ZO1qg1beHN/Ha44gdsjQ6w=','2017-04-24 03:45:29.651655',0,'LeonelPlazaola','Leonel','Plazaola Prado','usuario@gmail.com',0,1,'2017-04-24 03:40:15.194989');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(400) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `categorys_id` int(11) NOT NULL,
  `city` varchar(400) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `year` int(11) NOT NULL,
  `authors` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_slug_c3fca16d_uniq` (`slug`),
  KEY `blog_article_owner_id_5cc237cd_fk_investigator_id` (`owner_id`),
  KEY `blog_article_ac856a5e` (`categorys_id`),
  CONSTRAINT `blog_article_categorys_id_ed74a2a6_fk_blog_subcategory_id` FOREIGN KEY (`categorys_id`) REFERENCES `blog_subcategory` (`id`),
  CONSTRAINT `blog_article_owner_id_5cc237cd_fk_investigator_id` FOREIGN KEY (`owner_id`) REFERENCES `investigator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'Proyecto LAMENITEC ERASMUS MUNDUS (2012-2016)','proyecto-lamenitec-erasmus-mundus-2012-2016','<p><span style=\"color: rgb(0, 0, 0);\">Financiado por la Unión Europea, que consiste en un programa de Becas para estudiantes y staff\r\nacadémicos y administrativos de la Universidad Nacional de Ingeniería entre otras Universidades\r\nLatinoamérica beneficiarias del programa LAMENITEC y que pueden también participar otras\r\nuniversidades de cada país miembro del proyecto a nivel de pregrado, Maestría, Doctorado y\r\nestancias de investigación a nivel de postdoctorado y estancias para el staff académico y/o\r\nadministrativo de la UNI el responsable a cargo de la coordinación de la movilidad académica por\r\nla UNI es el Dr. Marvin Arias, actual coordinador académico del programa de Maestría en Gestión\r\nTI antes mencionada.</span></p>','2016-09-11 21:52:53.387000','2016-09-11 21:52:53.961000',1,2,'Managua',1,2016,''),(2,'DISEÑO DE RED INALAMBRICA AD HOC PARA ENFRENTAR CATASTROFES SISMICAS (TERREMOTOS Y TSUNAMIS)','diseno-de-red-inalambrica-ad-hoc-para-enfrentar-catastrofes-sismicas-terremotos-y-tsunamis','<p>Desastres naturales, tales como terremotos y tsunamis, han sucedido frecuentemente en muchos\r\nlugares en todo el mundo. Cuando el desastre ocurre, la infraestructura de red de información\r\njuega un rol muy importante como el medio de comunicación de los residentes. Sin embargo, una\r\nvez ocurrido el desastre, no se puede evitar fallas de los equipos de red, caídas de líneas de\r\ncomunicación y congestión de tráfico. Se requiere un ambiente de red más robusto y confiable,\r\nincluso aunque hayan ocurrido serios daños por el desastre. Es consecuencia, necesitamos diseñar\r\ne implementar redes de comunicación efectivas usando internet. En este proyecto, nosotros\r\nproponemos una red inalámbrica para asegurar inmediatamente medios de comunicación para\r\ncolectar la información respecto a la zona de desastre, seguridad del residente y recursos de\r\nayuda en la ocurrencia de un desastre. AI combinar múltiples nodos de red inalámbrica,\r\nautomáticamente se organiza una gran red ad-hoc en la zona de desastre y puede cubrir refugios\r\no zonas de comunicación interrumpidas como medios de comunicación urgentes.</p>','2016-09-11 21:58:27.492000','2017-04-16 23:58:26.736826',1,2,'Managua - Nicaragua',1,2015,''),(3,'DISEÑO DE UN SISTEMA DE TELE-CONSULTAS PEDIÁTRICAS PARA ATENCIÓN DE INFECCIONES RESPIRATORIAS ENTRE NUEVA GUINEA Y SUS ZONAS RURALES','diseno-de-un-sistema-de-tele-consultas-pediatricas-para-atencion-de-infecciones-respiratorias-entre-nueva-guinea-y-sus-zonas-rurales','<p><span style=\"color: rgb(0, 0, 0);\">El sector salud en Nicaragua es uno de los servicios más demandados por la población, las zonas\r\nrurales no son ajenas a esta demanda; sin embargo, por las características de estas zonas, es más\r\ncomplejo proveer acceso a los servicios de salud con las mismas condiciones.</span></p><p><span style=\"color: rgb(0, 0, 0); line-height: 1.4em; background-color: initial;\">La telemedicina es definida como medicina ejercida a distancia haciendo uso de las TIC, y es muy\r\nbeneficiosa para las poblaciones que viven en comunidades aisladas y regiones remotas; evita los\r\ndesplazamientos innecesarios de los pacientes al centro de atención especializado.</span></p><p><span style=\"color: rgb(0, 0, 0); line-height: 1.4em; background-color: initial;\">En Nicaragua con respecto a telemedicina o tele-consultas se ha venido avanzando\r\npaulatinamente.&nbsp;</span><span style=\"color: rgb(0, 0, 0); line-height: 1.4em; background-color: initial;\">En este proyecto se propone un sistema de tele-consultas para beneficiar al municipio de Nueva\r\nGuinea y sus zonas aledañas. Nueva Guinea está ubicada en la Región Autónoma de la Costa\r\nCaribe Sur (RACCS), y tiene la particularidad de que la mayor cantidad de su población se\r\nencuentra ubicada en el área rural y, por otro lado, los especialistas médicos se localizan en el\r\ncasco urbano; por tanto, un sistema de tele-consultas sería de mucha utilidad en este contexto.</span></p>','2016-09-11 22:02:02.083000','2017-04-17 03:21:30.482588',1,2,'Managua - Nicaragua',1,2016,'Alvaro Romero, Sergio Polanco'),(4,'Lamenitec','lamenitec','<p style=\"text-align: justify;\"><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px; font-size: 15.2px; text-align: start;\">The “Education Audiovisual and Culture” Executive Agency has selected the Lamenitec proposal among those submitted in the Erasmus Mundus Action 2, Lot 13, call for proposals EACEA 42/11, 2012.</strong></strong></p><p style=\"text-align: justify;\"><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">LAMENITEC</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">, Latin American Engineering and information Technologies Network, aims at implementing a Latin American students Exchange-to-Europe scheme which allows educating ground breaking professionals with a deep knowledge on the local reality and its needs, and the most topical methodologies and initiatives worldwide. To do so, an alliance among 6 European and 9 Latin-American universities has been made up. They will implement such scheme and will offer exchange opportunities at undergraduate, master, doctorate and post-doctorate levels to the people from the countries participating in this project.</span></p><p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">In addition, this project aims at reinforcing scientific and academic cooperation between Europe and Latin America in the</span><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">&nbsp;Engineering, Technology, Mathematics and Informatic areas</strong><span style=\"color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">&nbsp;because they are keystone aspects for the economic and social development of the countries represented in the consortium LAMENITEC (Salvador, Guatemala, Nicaragua, Honduras, Brazil, Colombia, Mexico and Argentina)</span><span style=\"color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\"><br></span></p><p style=\"text-align: justify; margin-bottom: 1em; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">LAMENITEC seeks to reach the most isolated regions of Latin America as well as those cities in which a large amount of professionals dwell. For this reason, 70 % of the higher education institutions enrolled in this project are publics. Their coverage in the countries they come from is large, and their acknowledgement, as well as the amount of academic programs they offer, makes them a keystone to attain this project goal.</p><p style=\"text-align: justify; margin-bottom: 1em; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\">Finally, LAMENITEC intends to strengthen the bonds among the associate higher education institutions and to generate the opportunity to interchange experiences that facilitate the development of academic and scientific skills as well as the international exchange management.</p><p style=\"text-align: justify; margin-bottom: 1em; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\"><strong style=\"margin: 0px; padding: 0px;\">The mobility activities</strong>&nbsp;are being implemented in three cohorts according to the timetable below:</p><table class=\"listing\" style=\"margin: 0px 0px 1em; padding: 0px; border: 2px solid rgb(255, 255, 255); line-height: 18.24px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\"><tbody style=\"margin: 0px; padding: 0px;\"><tr style=\"margin: 0px; padding: 0px;\"><th style=\"margin: 0px; padding: 0.5em 1em; vertical-align: top; color: rgb(255, 255, 255); border-width: 1px 2px 2px 0.1em; border-color: rgb(255, 255, 255) rgb(255, 255, 255) rgb(255, 255, 255) rgb(231, 231, 231); border-image: initial; border-style: solid; background: none 0% center repeat scroll rgb(102, 102, 102); line-height: 16.72px; text-transform: lowercase;\"><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px;\">type of mobility</p></th><th style=\"margin: 0px; padding: 0.5em 1em; vertical-align: top; color: rgb(255, 255, 255); border-width: 1px 2px 2px 0.1em; border-color: rgb(255, 255, 255) rgb(255, 255, 255) rgb(255, 255, 255) rgb(231, 231, 231); border-image: initial; border-style: solid; background: none 0% center repeat scroll rgb(102, 102, 102); line-height: 16.72px; text-transform: lowercase;\"><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px;\">cohort 1 - 2013</p><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px; text-align: center;\"><em>implemented</em></p></th><th style=\"margin: 0px; padding: 0.5em 1em; vertical-align: top; color: rgb(255, 255, 255); border-width: 1px 2px 2px 0.1em; border-color: rgb(255, 255, 255) rgb(255, 255, 255) rgb(255, 255, 255) rgb(231, 231, 231); border-image: initial; border-style: solid; background: none 0% center repeat scroll rgb(102, 102, 102); line-height: 16.72px; text-transform: lowercase;\"><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px;\">cohort 2 - 2014</p><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px; text-align: center;\"><em>implemented</em></p></th><th style=\"margin: 0px; padding: 0.5em 1em; vertical-align: top; color: rgb(255, 255, 255); border-width: 1px 2px 2px 0.1em; border-color: rgb(255, 255, 255) rgb(255, 255, 255) rgb(255, 255, 255) rgb(231, 231, 231); border-image: initial; border-style: solid; background: none 0% center repeat scroll rgb(102, 102, 102); line-height: 16.72px; text-transform: lowercase;\"><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px;\">cohort 3 - 2015</p><p style=\"margin-bottom: 1em; padding: 0px; line-height: 21.28px; text-align: center;\"><em>foreseen</em></p></th><th style=\"margin: 0px; padding: 0.5em 1em; vertical-align: top; color: rgb(255, 255, 255); border-width: 1px 2px 2px 0.1em; border-color: rgb(255, 255, 255) rgb(255, 255, 255) rgb(255, 255, 255) rgb(231, 231, 231); border-image: initial; border-style: solid; background: none 0% center repeat scroll rgb(102, 102, 102); line-height: 16.72px; text-transform: lowercase;\">total</th></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold;\">Undergraduates</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">12</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">16</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">14</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">42</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold;\">Masters&nbsp;&nbsp;</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">12</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">22</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">-</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">35</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold;\">Doctorates</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">12</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">2</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">6</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">20</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold;\">Post-doctorates</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">0</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">5</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">5</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">10</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold;\">Staff</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">5</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">7</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">5</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">17</td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold;\">Total</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">41</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">52</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">31</td><td style=\"margin: 0px; padding: 0.25em 1em; vertical-align: top; border-right: 2px solid rgb(255, 255, 255); line-height: 16.72px; background: transparent; color: rgb(102, 102, 102); font-weight: bold; text-align: center;\">124</td></tr></tbody></table><p style=\"text-align: justify; margin-bottom: 1em; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: Arial, FreeSans, sans-serif; font-size: 15.2px; text-align: start; background-color: rgb(255, 255, 255);\">The latest date for starting mobility will be 31 December 2015.</span></p><p style=\"text-align: center;\"><img src=\"/media/blog/image_mini.jpg\" alt=\"\"></p>','2017-04-17 00:04:44.066219','2017-04-17 00:18:27.585314',1,4,'Managua, Nicaragua',1,2017,''),(5,'Response 2 Resilience','response-2-resilience','<p style=\"text-align: justify; \">The American Red Cross (ARC) and the International Federation Red Cross and Red Crescent Societies (IFRC) have established the Global Disaster Preparedness Center (GDPC) as a reference center to support innovation and learning in disaster preparedness. All over the world, the Red Cross and Red Crescent (RC/RC) network is striving to help communities prepare for disasters. In the face of global trends, Red Cross and Red Crescent national societies must develop additional capacity and resources to effectively meet changing needs. To further this mission, the GDPC established the ResilientResearch Program.</p><p style=\"text-align: justify; \">Program Goal:&nbsp;To identify, prioritize, and support applied research that will deepen the evidence base of good practice around disaster preparedness to strengthen the capacity of national societies and improve the caliber and impact of RC/RC services in disaster preparedness.</p><p style=\"text-align: justify; \">The ResilientResearch Program&nbsp;supports individuals, teams, and organizations to engage in interdisciplinary disaster preparedness research to strengthen the capacity and deepen the knowledge of the RC/RC (along with the disaster risk management community) that results in improved actions taken in advance of a disaster to ensure adequate response and recovery to its impacts. Research areas include (but are not limited to): planning, exercises, training, equipment, statutory authority, early warning, risk communication, risk perception, public preparedness, etc.</p><p style=\"text-align: center;\"><img src=\"/media/blog/logo.gif\" alt=\"\"><br></p>','2017-04-17 00:17:06.549682','2017-04-17 00:19:33.080486',1,4,'Managua - Nicaragua',1,2017,''),(6,'IEEE','ieee','<p>En 1880, en los Estados Unidos se dio un fenómeno trascendental, ya que fue enlazado por los alambres del telégrafo. Mientras que Europa y América fueron conectados por medio de un cable submarino. Las luces de arco estaban en el uso en varias ciudades, la Pearl Street Station de Thomas Alba Edison estaba brindando el poder para abastecer la iluminación incandescente, había numerosas empresas fabricando equipos eléctricos, y el teléfono era acogido con la importancia debida, por ser una muy útil herramienta en las comunicaciones. Debido a esta revolución y el gran crecimiento en la actividad eléctrica; el “Franklin Institute” decidió patrocinar una Exhibición Eléctrica Internacional en Filadelfia en 1884. Esta exhibición sirvió como catalizador para la formación del Instituto Americano de Ingenieros Eléctricos(American Institute of Electrical Engineers, AIEE), antepasado del actual Instituto de Ingenieros Electrónicos y Electrónicos (IEEE). Dos grandes organizaciones locales, La Sociedad de Ingenieros Inalámbricos y Telégrafo (The Society of Wireless and Telegraph Engineers) y el Instituto Inalámbrico (The Wireless Institute) se unieron para formar un sociedad internacional de científicos e ingenieros envueltos en el desarrollo de la comunicación inalámbrica; El Institute of Radio Engineers (IRE). Desde su inicio el AIEE y el IRE mantuvieron miembros e intereses en común, lo que los llevo en 1963 a fusionarse en una sola Organización, el IEEE. Más de cuatro décadas han pasado desde su formación el IEEE hoy continúa extendiendo en muchas ramas como la informática y otras tecnologías de creciente importancia, ajustándose a las necesidades técnicas los miembros que la forman. IEEE se ha dedicado a ayudar a que más de 320,000 profesionales y estudiantes de Ingeniería desarrollen su potencial en campos de la ingeniería eléctrica, electrónica y la informática, haciendo valer con fuerza su lema “Networking the World”</p>','2017-04-17 00:31:50.405563','2017-04-17 00:31:50.560414',1,4,'Managua - Nicaragua',1,2017,''),(7,'Programa de Maestría en Gestión TIC','programa-de-maestria-en-gestion-tic','<p style=\"text-align: justify; \">La Maestría en Gestión TIC (Maestría GTIC) es el enlace natural común entre las actuales áreas de\r\ninvestigación del Programa de investigación TIC consolidando los resultados de los avances en cada área\r\nde investigación en marco trans-disciplinario. La Maestría GTIC está diseñada para ofertar dos\r\nespecialidades o menciones que consisten en Tecnologías de Información (Mención 1) o Tecnologías de\r\nTelecomunicaciones (Mención 2), como se muestra en la figura a continuación.&nbsp;</p><p style=\"text-align: center;\"><img src=\"/media/blog/proitic.jpg\" alt=\"\"><br></p><p style=\"text-align: left;\">Este programa de maestría tiene como objetivo formar profesionales especializados en Tecnologías de\r\nInformación y Comunicación con conocimientos avanzados en el análisis, evaluación, planificación,\r\nejecución y gestión de proyectos en el ámbito de las TIC requeridos por las instituciones públicas y\r\nprivadas de Nicaragua.&nbsp;</p><p style=\"text-align: left;\"><span style=\"background-color: initial;\">Los propósitos de este se detallan a continuación:&nbsp;</span></p><p><ul><li>Constituirse como un medio para extender las actividades de investigación TIC en la Facultad de\r\nElectrotecnia y Computación (FEC), tanto a lo interno de la UNI como en otras instituciones de carácter\r\npúblico y privado.<br></li><li>Establecer un enlace natural de las necesidades TIC en los sectores públicos y privados del país con\r\nlas actividades de investigación TIC del Programa de Investigación TIC.<br></li><li>Crear redes de nuevos investigadores vinculados entre las universidades e instituciones públicas y\r\nprivadas del país y en el área Centroamericana en las Tecnologías de la Información y Comunicación.</li></ul><span style=\"background-color: initial;\"><p style=\"text-align: justify;\"><span style=\"background-color: initial;\">En esta maestría están involucrados los profesores investigadores: Leonel Plazaola\r\n(leonel.plazaola@uni.edu.ni), Marvin Sánchez (marvin.sanchez@uni.edu.ni), Marvin Arias\r\n(marvin.arias@uni.edu.ni), Oscar Somarriba (oscar.somarriba@uni.edu.ni), y Enrique Silva\r\n(enrique.silva@uni.edu.ni) que también forman parte del Comité Académico de la Maestría en conjunto\r\ncon el Decano de la Facultad, FEC.</span></p></span></p><p style=\"text-align: justify; \">El programa de Maestría en GTIC está en marcha desde el 2009, y al 2015 está ejecutando su cuarta\r\nedición.\r\nEl Plan de Estudios de la Maestría en Gestión TIC se resume en el siguiente gráfico:</p><p style=\"text-align: center; \"><img src=\"/media/blog/h.png\" alt=\"\"><br></p><p style=\"text-align: justify; \">Como resultado de esta maestría se han producido tesis y publicaciones científicas que puede ver en las\r\nsecciones Trabajos de Graduación y Publicaciones.<br></p>','2017-04-17 01:16:40.154561','2017-04-17 01:16:40.369195',1,6,'Managua - Nicaragua',1,2017,''),(8,'Especialidad en Gestión Estratégica y Auditoria de TI','especialidad-en-gestion-estrategica-y-auditoria-de-ti','<p style=\"text-align: justify; \">Hoy en día todas las organizaciones implementan las tecnologías de la información como parte\r\nfundamental en sus estrategias de negocio, generando un cambio con respecto a la auditoría y el control\r\ninterno del sector público y privado. Los gobiernos, los reguladores y las empresas exitosas se preocupan\r\ncada vez más en mejorar los procesos de negocio basándose en la identificación oportuna de los riesgos\r\noperacionales que pueden afectar la consecución de los objetivos estratégicos.&nbsp;</p><p style=\"text-align: justify; \">Por tal razón, la Facultad de Electrotecnia y Computación (FEC) de la Universidad Nacional de Ingeniería\r\n(UNI) a través de la Unidad de Servicios Especializados en TIC (USETIC) ha diseñado la Especialidad en\r\nGestión Estratégica y Auditoría de TI para fortalecer la formación profesional en Gestión y auditoria de TI\r\nen las organizaciones, utilizando metodologías y técnicas de ámbito mundial —tales como los Objetivos\r\nde Control de la Información relacionado con Tecnología (COBIT 5), la Biblioteca de Infraestructura y\r\nTecnología de Información (ITIL v3), el estándar ISO 25000, entre otros—que permitirán incorporar las\r\nmejores prácticas en gestión de riesgos, seguridad de la información, Controles de TI, planificación\r\nestratégica de servicio de TI, Auditoria del Gobierno y gestión de TI, proteger los activos informáticos,\r\nasegurar la continuidad operativa de la organización de los sistemas de información.&nbsp;<br></p><p style=\"text-align: justify; \">Dicha Especialidad ha iniciado el proceso de acreditación ante ISACA (Information Systems Audit and\r\nControl Association) Internacional, la acreditación consiste en el reconocimiento del curriculum de la\r\nEspecialidad alineado con el curriculum de CISA (Cerfified Information Systems Auditor) y un año de\r\nexperiencia a quienes completen la Especialidad. Una vez completado el proceso de acreditación, la\r\nEspecialidad será el primer programa de postgrado reconocido por ISACA Internacional en Centro América\r\ny el segundo en Latino América.<br></p>','2017-04-17 01:26:06.950346','2017-04-17 01:26:07.301770',1,6,'Managua - Nicaragua',1,2017,''),(9,'Multihop Wireless Networks with Advanced Antenna Systems – An Alternative for Rural Communication','multihop-wireless-networks-with-advanced-antenna-systems-an-alternative-for-rural-communication','...','2017-04-24 02:27:29.090075','2017-04-24 02:27:29.649221',2,9,'Royal Institute of Technology, Stockholm, Sweden',1,2008,''),(10,'On Geometry-Based Statistical Channel Models for MIMO Wireless Communications','on-geometry-based-statistical-channel-models-for-mimo-wireless-communications','...','2017-04-24 03:38:33.916485','2017-04-24 03:38:34.046459',12,9,'Center for Computing Research, National Polytechnic Institute CIC-IPN, Mexico',1,2008,''),(11,'Business and IT alignment management-An Enterprise Architecture Approach','business-and-it-alignment-management-an-enterprise-architecture-approach','...','2017-04-24 03:46:46.053805','2017-04-24 03:46:46.289267',13,9,'Royal Institute of Technology, Stockholm, Sweden',1,2009,''),(12,'Evaluating IT and Business Alignment in the frame of Enterprise Architecture','evaluating-it-and-business-alignment-in-the-frame-of-enterprise-architecture','...','2017-04-24 03:48:34.158904','2017-04-24 03:48:34.377688',5,9,'Royal Institute of Technology, Stockholm, Sweden',1,2010,''),(13,'ARTICULO DE PRUEBA 1','articulo-de-prueba-1','DISPONIBLE EN WWW.ARTICULO_A.COM<br>','2017-05-04 00:26:33.620749','2017-05-04 00:26:33.961199',9,1,'CANADA',1,2016,'AUTOR A, AUTOR B, AUTOR C');
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(21,3,7),(22,3,8),(15,4,1),(16,5,9),(17,6,10),(18,7,11),(19,8,12),(20,8,13),(23,9,14),(24,9,15),(25,9,16),(26,10,17),(27,11,18),(28,12,19),(29,13,20),(30,13,21);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogarticle`
--

DROP TABLE IF EXISTS `blog_blogarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blogarticle_article_id_5abbf40f_fk_blog_article_id` (`article_id`),
  CONSTRAINT `blog_blogarticle_article_id_5abbf40f_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogarticle`
--

LOCK TABLES `blog_blogarticle` WRITE;
/*!40000 ALTER TABLE `blog_blogarticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_blogarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `name` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'2016-09-12 02:41:22.535000','Cooperación / Vinculación',1,'cooperacion_vinculacion'),(2,'2016-09-12 02:41:22.535000','Posgrado',1,'posgrado'),(3,'2016-09-12 02:41:22.535000','Publicaciones',1,'publicaciones');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_media`
--

DROP TABLE IF EXISTS `blog_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_media`
--

LOCK TABLES `blog_media` WRITE;
/*!40000 ALTER TABLE `blog_media` DISABLE KEYS */;
INSERT INTO `blog_media` VALUES (1,'blog/image_mini.jpg','2017-04-17 00:11:23.572481'),(2,'blog/logo.gif','2017-04-17 00:19:18.204484'),(3,'blog/sistemas.png','2017-04-24 03:24:15.628400'),(4,'blog/telemedicina.png','2017-04-24 03:27:47.122486'),(5,'blog/radial.png','2017-04-24 03:31:04.332923');
/*!40000 ALTER TABLE `blog_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_subcategory`
--

DROP TABLE IF EXISTS `blog_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_subcategory_category_id_3bcfa7d1_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_subcategory_category_id_3bcfa7d1_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_subcategory`
--

LOCK TABLES `blog_subcategory` WRITE;
/*!40000 ALTER TABLE `blog_subcategory` DISABLE KEYS */;
INSERT INTO `blog_subcategory` VALUES (1,'2016-09-11 21:21:54.728000','actividades-realizadas',1,'Actividades realizadas',1),(2,'2016-09-11 21:22:03.819000','proyectos-en-ejecucion',1,'Proyectos en ejecución',1),(3,'2016-09-11 21:22:15.367000','instituciones-vinculadas',1,'Instituciones vinculadas',1),(4,'2016-09-11 21:23:26.376000','asociones-profesionales',1,'Asociónes profesionales',1),(5,'2016-09-11 21:23:54.456000','trabajos-de-graduacion',1,'Trabajos de Graduación',2),(6,'2016-09-11 21:24:18.533000','maestrias',1,'Maestrías',2),(7,'2016-09-11 21:24:34.280000','trabajos-de-grado',1,'Trabajos de Grado',2),(8,'2016-09-11 21:24:52.584000','trabajos-de-posgrado',1,'Trabajos de posgrado',2),(9,'2016-09-11 21:25:09.609000','tesis-doctorales',1,'Tesis doctorales',3),(10,'2016-09-11 21:25:20.602000','tesis-teknologie-licentiate-mphil',1,'Tesis Teknologie Licentiate (MPhil)',3),(11,'2016-09-11 21:25:29.309000','articulos-en-revistas-internacionales',1,'Artículos en revistas internacionales',3),(12,'2016-09-11 21:25:38.828000','patentes',1,'Patentes',3),(13,'2016-09-11 21:25:47.439000','articulos-en-conferencias-internacionales',1,'Artículos en Conferencias Internacionales',3),(14,'2016-09-11 21:25:56.087000','articulos-en-revistas-nacionales',1,'Artículos en Revistas Nacionales',3),(15,'2016-09-11 21:26:03.697000','articulos-de-estudiantes-mgtic',1,'Artículos de Estudiantes MGTIC',3);
/*!40000 ALTER TABLE `blog_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_tag_name_c5718cc8_uniq` (`name`),
  UNIQUE KEY `blog_tag_slug_01068d0e_uniq` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'LAMENITEC','lamenitec'),(2,'ERASMUS','erasmus'),(3,'MUNDUS','mundus'),(4,'DISEÑO','diseno'),(5,'RED','red'),(6,'INALAMBRICA','inalambrica'),(7,'SISTEMA','sistema'),(8,'PEDIÁTRICAS','pediatricas'),(9,'RESPONSE 2 RESILIENCE','response-2-resilience'),(10,'IEEE','ieee'),(11,'MAESTRIAS','maestrias'),(12,'AUDITORIA','auditoria'),(13,'GESTION ESTRATEGICA','gestion-estrategica'),(14,'MULTIHOP WIRELESS NETWORKS','multihop-wireless-networks'),(15,'ADVANCED ANTENNA SYSTEMS','advanced-antenna-systems'),(16,'RURAL COMMUNICATION','rural-communication'),(17,'WIRELESS COMMUNICATIONS','wireless-communications'),(18,'BUSINESS AND IT ALIGNMENT','business-and-it-alignment'),(19,'EVALUATING IT AND BUSINESS ALIGNMENT IN THE FRAME','evaluating-it-and-business-alignment-in-the-frame'),(20,'KEYWORD 1','keyword-1'),(21,'KEYWORD 2','keyword-2');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `misionvision` longtext,
  `correo` varchar(254) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `googlePlus` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'El Programa UNI/ASDI es un programa que promueve la investigación cientifica en líneas de interés propuestas por la UNI. Promueve las actividades de investigación científica con el objetivo de crear tradición científica y generación de conocimientos en un entorno de cooperación con contrapartes científicos de Universidades de Suecia y otros países. El Programa UNI/ASDI tiene la peculariedad de otorgar grados académicos de Maestría, Licenciatura Técnica (Teknical Licentiate en Suecia: grado superior al de Maestría y anterior al Doctorado, este grado es conocido en otros países como candidato a Doctor) y Doctorados. El desarrollo de las actividades de investigación científica en el Programa UNI/ASDI tienen los mismos resultados que cualquier línea de investigación científica internacionalmente reconocida.','proitic@uni.edu.ni','(505) 2267-0275','','','','','');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations_history`
--

DROP TABLE IF EXISTS `configurations_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations_history`
--

LOCK TABLES `configurations_history` WRITE;
/*!40000 ALTER TABLE `configurations_history` DISABLE KEYS */;
INSERT INTO `configurations_history` VALUES (1,'<p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">El Programa de Investigación en Tecnologías de Información y Comunicaciones (PROITIC), inició en 1992 en la Facultad de Electrotecnia y Computación (FEC) de la Universidad Nacional de Ingeniería (UNI), Nicaragua, auspiciado por la Agencia Sueca para el Desarrollo Internacional (Asdi). Los contrapartes en Suecia de este Programa fueron el Departamento de Sistemas de Información y Control Industrial, Departamento de Radiocomunicación  ambos del Real Instituto Tecnológico de Estocolmo(KTH) , Suecia, y el Departamento de Electrociencia  en el Instituto Tecnológico de Lund(LTH) , Suecia, que se integró a partir de 1999.</span></p><p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">El objetivo general del Programa es </span><strong style=\"color: rgb(23, 54, 93);\">fortalecer la capacidad de investigación e innovación en la Universidad Nacional de Ingeniería en el área de Tecnologías de la Información y Comunicaciones (TIC) con un cercano vínculo con los actores nacionales, centroamericanos e internacionales, fortaleciendo de esta manera la relevancia y calidad de los resultados del proceso de investigación científica y su aplicación.</strong></p><p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">El Programa condujo a los primeros profesores involucrados de parte de la FEC, UNI, a la obtención de grados académicos de Doctorado (PhD) o el Teknologie Licentiate. Este último es un grado académico en los países nórdicos  entre el MSc. y el Doctorado (PhD) conocido en algunos círculos como MPhil. Este  Programa se desarrolló a través de visitas a Suecia y a los países en donde se publican los resultados de investigación (conferencias, simposios científicos, etc.) con visitas de los colegas de investigación de Suecia a Nicaragua. Esto ha permitido que los investigadores nicaragüenses y suecos tengan una más cercana visión de la aplicación de los temas de investigación a la realidad y contexto nacional.</span></p><p style=\"text-align: justify; \"><span style=\"color: rgb(0, 0, 0);\">Los miembros de este Programa han desarrollado vínculos activos con redes de investigación, sociedades académicas y profesionales  pudiendo compartir el conocimiento en las diferentes áreas TIC que se desarrollan, publicando internacionalmente  y con experiencia en servicios, consultorías y casos de estudios con empresas nacionales e internacionales en Nicaragua. Se cuenta con una infraestructura básica para el desarrollo de actividades de investigación, producción científica mediante publicación de resultados de investigación en revistas de prestigio internacional con arbitraje y la participación en congresos, seminarios y simposios nacionales e internacionales con arbitraje, así como la participación de investigadores del programa como miembros de comités de revisores para congresos nacionales e internacionales.</span></p>');
/*!40000 ALTER TABLE `configurations_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooperation_cooperation`
--

DROP TABLE IF EXISTS `cooperation_cooperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooperation_cooperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooperation_cooperation`
--

LOCK TABLES `cooperation_cooperation` WRITE;
/*!40000 ALTER TABLE `cooperation_cooperation` DISABLE KEYS */;
INSERT INTO `cooperation_cooperation` VALUES (1,'<p>Cómo parte de los vínculos del Programa de Investigación TIC se participan en diversas actividades que nos vinculan con la sociedad, tales como:</p><ul><li><span style=\"line-height: 1.4em; background-color: initial;\">La fundación y participación en la Asociación de Internet de Nicaragua, AIN, (Dr. Leonel Plazaola).</span><br></li><li><span style=\"line-height: 1.4em; background-color: initial;\">La participación con las entidades del Gobierno en la definición de las arquitecturas de interoperabilidad para el Gobierno Electrónico Central y Gobierno Electrónico Municipal, eGob y GobeNic (Dr. Leonel Plazaola).</span><br></li><li><span style=\"line-height: 1.4em; background-color: initial;\">Desarrollo de un proyecto de conexión nacional de todos los proveedores de Internet en Nicaragua, NicIX, que permite que el tráfico nacional de Internet sea local (Dr. Leonel Plazaola).</span><br></li><li><span style=\"line-height: 1.4em; background-color: initial;\">Desarrollo de un programa paralelo a la cooperación de la investigación destinado a fortalecer el uso y las aplicaciones de las Tecnologías de la Información en las 4 Universidades públicas de Nicaragua (representante Dr. Leonel Plazaola).</span><br></li><li><span style=\"line-height: 1.4em; background-color: initial;\">Desarrollo del taller nacional sobre el impacto de las antenas de telefonía celular con entidades del gobierno y de la empresa privada (TkL. Oscar Somarriba y Dr. Marvin Sánchez).</span></li></ul><br><p>Actualmente (2015-2017) se han realizado y se continúan ejecutando proyectos en cooperación con instituciones como: Cruz Roja de Nicaragua, Radio Magic, Radio Ondas de Luz, Mesa Nacional de Gestión de Riesgo, CIEETS, IEEE, ISOC, entre otros.<br></p>','2016-09-12 03:41:45.170000');
/*!40000 ALTER TABLE `cooperation_cooperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'blog','article'),(23,'blog','blogarticle'),(15,'blog','category'),(14,'blog','media'),(16,'blog','subcategory'),(12,'blog','tag'),(17,'configurations','configurations'),(18,'configurations','history'),(5,'contenttypes','contenttype'),(19,'cooperation','cooperation'),(21,'graduationWork','grade'),(22,'graduationWork','posgrade'),(20,'investigationLines','investigationlines'),(8,'investigator','investigator'),(9,'investigator','investigator_social'),(10,'investigator','sociallinks'),(6,'sessions','session'),(11,'testimony','testimony');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-11 20:11:27.351000'),(2,'auth','0001_initial','2016-09-11 20:11:36.139000'),(3,'accounts','0001_initial','2016-09-11 20:11:37.220000'),(4,'accounts','0002_auto_20160502_1703','2016-09-11 20:11:38.088000'),(5,'accounts','0003_userprofile','2016-09-11 20:11:39.744000'),(6,'admin','0001_initial','2016-09-11 20:11:41.319000'),(7,'admin','0002_logentry_remove_auto_add','2016-09-11 20:11:41.434000'),(8,'contenttypes','0002_remove_content_type_name','2016-09-11 20:11:42.397000'),(9,'auth','0002_alter_permission_name_max_length','2016-09-11 20:11:43.144000'),(10,'auth','0003_alter_user_email_max_length','2016-09-11 20:11:43.834000'),(11,'auth','0004_alter_user_username_opts','2016-09-11 20:11:43.878000'),(12,'auth','0005_alter_user_last_login_null','2016-09-11 20:11:44.480000'),(13,'auth','0006_require_contenttypes_0002','2016-09-11 20:11:44.502000'),(14,'auth','0007_alter_validators_add_error_messages','2016-09-11 20:11:44.570000'),(15,'investigator','0001_initial','2016-09-11 20:11:45.074000'),(16,'investigator','0002_remove_investigator_fotoperfil','2016-09-11 20:11:45.597000'),(17,'investigator','0003_auto_20160505_2234','2016-09-11 20:11:47.146000'),(18,'investigator','0004_investigator_fotoperfil','2016-09-11 20:11:47.739000'),(19,'investigator','0005_investigator_activo','2016-09-11 20:11:48.395000'),(20,'investigator','0006_auto_20160508_1529','2016-09-11 20:11:48.557000'),(21,'investigator','0007_auto_20160515_0909','2016-09-11 20:11:48.679000'),(22,'blog','0001_initial','2016-09-11 20:11:52.385000'),(23,'blog','0002_auto_20160617_0948','2016-09-11 20:11:52.791000'),(24,'blog','0003_auto_20160617_1018','2016-09-11 20:11:53.455000'),(25,'blog','0004_auto_20160617_1544','2016-09-11 20:11:53.657000'),(26,'blog','0005_media','2016-09-11 20:11:53.991000'),(27,'blog','0006_auto_20160731_1513','2016-09-11 20:11:55.263000'),(28,'blog','0007_category','2016-09-11 20:11:55.599000'),(29,'blog','0008_category_active','2016-09-11 20:11:56.536000'),(30,'blog','0009_article_categorys','2016-09-11 20:11:58.427000'),(31,'blog','0010_auto_20160801_1606','2016-09-11 20:11:59.571000'),(32,'blog','0011_article_active','2016-09-11 20:12:00.850000'),(33,'blog','0012_category_slug','2016-09-11 20:12:01.510000'),(34,'blog','0013_subcategory','2016-09-11 20:12:02.685000'),(35,'blog','0014_article_year','2016-09-11 20:12:03.308000'),(36,'blog','0015_auto_20160902_1619','2016-09-11 20:12:04.184000'),(37,'configurations','0001_initial','2016-09-11 20:12:04.604000'),(38,'configurations','0002_auto_20160523_1114','2016-09-11 20:12:05.444000'),(39,'configurations','0003_auto_20160618_1121','2016-09-11 20:12:06.634000'),(40,'configurations','0004_history','2016-09-11 20:12:06.906000'),(41,'configurations','0005_auto_20160802_1008','2016-09-11 20:12:07.421000'),(42,'cooperation','0001_initial','2016-09-11 20:12:11.593000'),(43,'cooperation','0002_remove_cooperation_name','2016-09-11 20:12:12.342000'),(44,'cooperation','0003_project','2016-09-11 20:12:12.631000'),(45,'cooperation','0004_auto_20160706_1341','2016-09-11 20:12:13.434000'),(46,'cooperation','0005_auto_20160706_1412','2016-09-11 20:12:13.534000'),(47,'cooperation','0006_project_active','2016-09-11 20:12:14.208000'),(48,'cooperation','0007_activities','2016-09-11 20:12:14.475000'),(49,'cooperation','0008_institution','2016-09-11 20:12:14.716000'),(50,'cooperation','0009_auto_20160905_1503','2016-09-11 20:12:15.124000'),(51,'investigator','0007_auto_20160508_2019','2016-09-11 20:12:15.172000'),(52,'investigator','0008_merge','2016-09-11 20:12:15.208000'),(53,'investigator','0009_auto_20160515_2124','2016-09-11 20:12:16.549000'),(54,'investigator','0010_investigator_idcuenta','2016-09-11 20:12:17.787000'),(55,'investigator','0011_auto_20160610_1411','2016-09-11 20:12:18.838000'),(56,'investigator','0012_investigator_slug','2016-09-11 20:12:19.611000'),(57,'graduationWork','0001_initial','2016-09-11 20:12:22.770000'),(58,'investigationLines','0001_initial','2016-09-11 20:12:23.098000'),(59,'investigationLines','0002_investigationlines_slug','2016-09-11 20:12:23.696000'),(60,'investigator','0013_auto_20160909_2128','2016-09-11 20:12:26.501000'),(61,'investigator','0014_investigator_social_profile_social','2016-09-11 20:12:27.291000'),(62,'investigator','0015_auto_20160909_2130','2016-09-11 20:12:27.875000'),(63,'investigator','0016_auto_20160909_2131','2016-09-11 20:12:29.591000'),(64,'sessions','0001_initial','2016-09-11 20:12:30.184000'),(65,'testimony','0001_initial','2016-09-11 20:12:30.450000'),(66,'testimony','0002_auto_20160507_1302','2016-09-11 20:12:30.597000'),(67,'testimony','0003_testimony_date_joined','2016-09-11 20:12:31.274000'),(68,'blog','0016_blogarticle','2016-09-12 01:10:29.297000'),(69,'auth','0008_alter_user_username_max_length','2017-04-16 18:22:00.566865'),(70,'blog','0017_article_authors','2017-04-17 03:19:50.117833'),(71,'investigationLines','0003_auto_20170416_1941','2017-04-17 03:19:50.653751'),(72,'investigator','0017_auto_20170423_1615','2017-04-24 01:31:19.313903');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8jx5zy7n6x6xf7ayppb4ehbab8lc52pb','ZmNkNTYyNGM0YWUxMjc0MDI1ODgyNDI2ZTcwNTIzYTI2OGRkZjk2NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwODY5ODY5ZWIxMmYxMTRkYTc1ZGVjODgwNzQxYjE1MDE5NmJkYWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-05-08 03:47:38.434001'),('9030tav0ms5apca6vyam0mz6qoie5hpv','YTViMjdkY2VkMDliMDI5NmQ5OGMwMWU0ZDJmMTQzMWZkYWRiY2I4Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlNzkwOTNkMTYxYTdkMjQ4ZWI5YTZlNjAzOGRiZmM2Y2NiYmY3NWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-07 21:42:07.226412'),('awifpb3mb98m25o065d4i55cfk87uwb9','YTViMjdkY2VkMDliMDI5NmQ5OGMwMWU0ZDJmMTQzMWZkYWRiY2I4Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlNzkwOTNkMTYxYTdkMjQ4ZWI5YTZlNjAzOGRiZmM2Y2NiYmY3NWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-09 15:37:15.711041'),('herfh6gk253rqqpa8ra7lxtba4ngz4ef','ZjA1NzQ4MDljYjkyYzU4ZTk3ZWZiYjQ5MTk3ZWM1M2Q5NzM5ZWQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkYjdkODM4MTE2ODYzOTdlNmE0ODdiYjgzNTJhNTUyN2FiY2IzNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-26 00:39:09.217000'),('iqlmh2r4akef5djq8sp4ip3xl54uww2j','OTAxYjQ0YTAzODE0ZDkwNzJkNTU1NDU1Y2U5ZWM1MmE4YjFmMWZiNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkNTc2YmMyZThmNTllODM1YzFhOTAyOTUwYmQzNzMyYjkwZjdkZTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-05-17 21:13:50.381249'),('n9dzpesd46tixj0175dhvwc611hmuxxj','MjQ2MDc4NGY3YzQwOTQyYzM2Nzc2OWIxZjIzZThjMzViZTlmNzRiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjI3NzgyODUxNmJhNDQ3Y2MxYmUxOGQ4MWE5ZTk0NWI2Njc5YWMyOWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-18 17:41:25.441062'),('no6ir815qn6gujeo4nghlnkgza5vret5','YTViMjdkY2VkMDliMDI5NmQ5OGMwMWU0ZDJmMTQzMWZkYWRiY2I4Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlNzkwOTNkMTYxYTdkMjQ4ZWI5YTZlNjAzOGRiZmM2Y2NiYmY3NWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-07 22:01:43.193426'),('p2zbdd3ajeho8yp8wn5m9r99an9z8gus','YTViMjdkY2VkMDliMDI5NmQ5OGMwMWU0ZDJmMTQzMWZkYWRiY2I4Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlNzkwOTNkMTYxYTdkMjQ4ZWI5YTZlNjAzOGRiZmM2Y2NiYmY3NWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-04-30 23:43:11.269729'),('qvfnqeq6rex8pnuj6rulaucgzzes2scb','NGY2M2QzNjIyZjMwNzkxMGEwNjBhYTJiYjY5OTgyYWE3ZTJkNjU2Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4MmRlNWY0ODFjMTQ4NzhiZThhMTEwYmRjZTgwZDVkMDYzYTI5MTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-05-20 16:46:01.038718'),('upuyuqcj7onq8c4w5ktrv19u9x7177z8','NDNhOGRhMmE3MGI2ZjdkMDMwOTBmZTEyZTQ3ZWYyODkzYTQ3MGU3OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImEzMmU0NTBiNmNlYTUxZDNjYzYxMzFjZTM4MTk3N2RlZWQxNzVkYmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9','2017-05-18 00:47:34.554802'),('vajrxw9e3v9bvm3h8zmt6ar5281skj3j','ZjA1NzQ4MDljYjkyYzU4ZTk3ZWZiYjQ5MTk3ZWM1M2Q5NzM5ZWQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkYjdkODM4MTE2ODYzOTdlNmE0ODdiYjgzNTJhNTUyN2FiY2IzNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-25 21:20:35.444000'),('z79obd4z6bk1nwdugxzarju3a904xjkq','ZjA1NzQ4MDljYjkyYzU4ZTk3ZWZiYjQ5MTk3ZWM1M2Q5NzM5ZWQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkYjdkODM4MTE2ODYzOTdlNmE0ODdiYjgzNTJhNTUyN2FiY2IzNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-26 03:06:04.290000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigationLines`
--

DROP TABLE IF EXISTS `investigationLines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investigationLines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigationLines`
--

LOCK TABLES `investigationLines` WRITE;
/*!40000 ALTER TABLE `investigationLines` DISABLE KEYS */;
INSERT INTO `investigationLines` VALUES (1,'Sistemas y Tecnologías de Información','<p style=\"text-align: justify;\"><span style=\"line-height: 112%;\">Este programa cubre actualmente tres áreas de\r\ninvestigación: (i) Sistemas y Tecnologías de Información, (ii) Administración\r\nInnovadora del Espectro Radioeléctrico, (iii) Telemedicina. A continuación se\r\npresenta un breve resumen de cada una de las áreas en mención.</span></p><span style=\"line-height: 112%;\"><p style=\"text-align: center;\"><img src=\"/media/blog/sistemas.png\" alt=\"\"></p><br></span><p style=\"text-align: justify;\"><span style=\"text-indent: 0cm;\">El área de investigación en Sistemas y\r\nTecnologías de Información está enfocada al conocimiento y desarrollo teorías y\r\nmétodos para la elaboración y evaluación de escenarios del alineamiento\r\nestratégico de las Tecnologías de Información con la organización y los\r\nnegocios mejorando la efectividad de estas tecnologías de información para el\r\nsoporte de los negocios, así como análisis y propuestas de mejoras en la\r\ngestión de servicios de Tecnologías de la Información.&nbsp;</span></p><span style=\"line-height: 112%;\"></span><p class=\"MsoNormal\" style=\"margin-top:0cm;margin-right:0cm;margin-bottom:10.15pt;\r\nmargin-left:0cm;text-indent:0cm\"><o:p></o:p></p>\r\n\r\n<span style=\"line-height: 112%;\"></span><p style=\"text-align: justify; \"><span style=\"line-height: 112%;\">Están\r\ninvolucrados en esta área los profesores investigadores: Leonel Plazaola, (</span><span style=\"line-height: 112%;\">leonel.plazaola@uni.edu.ni</span><span style=\"line-height: 112%;\">),\r\nNorman Vargas (norman.vargas@uni.edu.ni), Johnny Flores,&nbsp;</span><span style=\"text-indent: 0cm;\">(johnny.flores@uni.edu.ni), y Anayanci López,\r\n(anayanci.lopez@uni.edu.ni). Este proyecto de investigación es llevado a cabo\r\nen cooperación con algunas pequeñas y medianas empresas e industria en\r\nNicaragua y Suecia, por medio de la aplicación de estudios de casos basados en\r\nlas teorías y métodos propuestos.&nbsp;</span></p><p class=\"MsoNormal\" style=\"margin-top:0cm;margin-right:0cm;margin-bottom:10.25pt;\r\nmargin-left:0cm;text-indent:0cm\"><o:p></o:p></p>','sistemas-y-tecnologias-de-informacion'),(2,'Telemedicina (aplicaciones médicas de procesamiento de señales)','<p style=\"text-align: center;\"><img src=\"/media/blog/telemedicina.png\" alt=\"\"></p><p class=\"MsoNormal\" style=\"text-align: justify; margin: 0cm 0cm 10.15pt; text-indent: 0cm;\">El área de investigación de Telemedicina es\r\nuno de los primeros proyectos en su género que se realizan en nuestro país. El\r\nobjetivo del proyecto es&nbsp; ayudar a\r\nmejorar el acceso a los servicios de salud a comunidades con escasa o ninguna\r\ncobertura de estos servicios mediante tecnologías de información y\r\ncomunicaciones (TIC). Así mismo, mediante el desarrollo de algoritmos de\r\nprocesamiento digital de señales para mejorar el diagnóstico temprano de\r\nenfermedades que son causa de gran mortalidad en países subdesarrollados\r\nespecialmente en Nicaragua tales como las enfermedades cardiovasculares y\r\nrenales.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"text-align: justify; margin: 0cm 0cm 10.25pt; text-indent: 0cm;\">Están involucrados en esta área los profesores\r\ninvestigadores: Marvin Arias, (co-supervisor), (marvin.arias@uni.edu.ni), Marco\r\nMunguía (marcos.munguia@uni.edu.ni) y Pablo Vásquez, (pablo.vasquez@uni.edu.ni).\r\nSe ha establecido, dentro del marco de la colaboración, como contraparte en\r\nSuecia el Hospital Escuela de la Universidad de Lund y en Nicaragua nuestra\r\nuniversidad tiene como contraparte nacional el Hospital Escuela Antonio Lenin\r\nFonseca.&nbsp;<o:p></o:p></p>','telemedicina-aplicaciones-medicas-de-procesamiento-de-senales'),(3,'Administración Innovadora del Espectro Radioeléctrico','<p style=\"text-align: center;\"><img src=\"/media/blog/radial.png\" alt=\"\"></p><p class=\"MsoNormal\" style=\"text-align: justify; margin: 0cm 0cm 10.1pt;\">El área de investigación en Administración\r\nInnovadora del Espectro Radioeléctrico&nbsp;está\r\norientada hacia el desarrollo y entendimiento de teorías y métodos para evaluar\r\ny proveer escenarios para la aplicación de una innovadora administración del\r\nespectro radioeléctrico en los países en vías de desarrollo y particularmente\r\nen Nicaragua.&nbsp; <o:p></o:p></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"line-height: 112%;\">Están\r\ninvolucrados en esta área los docentes investigadores: (como co-supervisores)\r\nOscar Somarriba (</span><span style=\"line-height: 112%;\">oscar.somarriba@uni.edu.ni</span><span style=\"line-height: 112%;\">) y\r\nMarvin Sánchez (marvin.sanchez@uni.edu.ni). En el período 2008-2011 también\r\nparticiparon Miurel Tercero y Pamela González. En este proyecto se estudian\r\nredes de comunicaciones tecnológicas en combinación con los modelos de negocios\r\ny en conjunto desarrollar una mejorada, dinámica y efectiva administración del\r\nespectro radioeléctrico. Todos estos aspectos son requeridos para hacer una\r\nconectividad factible en los países en vías de desarrollo y así reducir la\r\n“brecha digital”. </span></p>\r\n\r\n<p><p id=\"ftn1\"><p class=\"footnotedescription\" style=\"text-align: justify; \">Actualmente en esta línea de investigación se está trabajando en un alcance más\r\namplio siendo más adecuado referirse a la misma como: Comunicaciones\r\ninalámbricas.</p><p class=\"footnotedescription\" style=\"text-align: justify; margin-bottom: 0.0001pt; line-height: 107%;\"><o:p></o:p></p>\r\n\r\n</p>\r\n\r\n</p>','administracion-innovadora-del-espectro-radioelectrico');
/*!40000 ALTER TABLE `investigationLines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigator`
--

DROP TABLE IF EXISTS `investigator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investigator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fechaNac` date NOT NULL,
  `correo` varchar(254) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `googlePlus` varchar(100) DEFAULT NULL,
  `fotoPerfil` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `presentacion` longtext NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `idCuenta_id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `investigator_idCuenta_id_3a589be3_fk_auth_user_id` (`idCuenta_id`),
  CONSTRAINT `investigator_idCuenta_id_3a589be3_fk_auth_user_id` FOREIGN KEY (`idCuenta_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigator`
--

LOCK TABLES `investigator` WRITE;
/*!40000 ALTER TABLE `investigator` DISABLE KEYS */;
INSERT INTO `investigator` VALUES (1,'Programa','Proitic','1994-01-10','proitic@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Programa de Investigación en TIC y Comunicaciones','','','','investigator/perfil.jpg',1,'Oscar Somarriba actualmente es estudiante de doctorado en el Laboratorio de Seguridad y Sistemas de la Universidad de Mondragón, Arrasate-Mondragón, España. Su investigación se centra en la seguridad en los dispositivos móviles Inteligentes. Posee una licenciatura en Electrónica, (Ingeniero Electrónico) por la Universidad Nacional de Ingeniería (UNI), Managua, Nicaragua, y el grado de Teknologie Licentiate (MPhil) en Sistemas Digitales Inalámbricos del Real Instituto Tecnológico (KTH) en Estocolmo, Suecia. \r\nDe 2001 a 2009 fue investigador invitado (a tiempo parcial) del Centro de Investigación de Comunicaciones Inalámbricas (Wireless Center) de KTH donde trabajó en Redes inalámbricas Ad Hoc. Ha tenido una larga trayectoria tanto en la Universidad Nacional de Ingeniería como en la industria Nicaragüense en el ramo de las comunicaciones inalámbricas.','Ingeniero en Computación',1,'programa-proitic'),(2,'Marvin','Sánchez Garache','2017-04-01','marvin.sanchez@uni.edu.ni','(505) 5052-2781','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Administración Innovadora del Espectro Radioeléctrico','','','','investigator/e73aafc3-2010-4e88-914c-3350e35b2560_8VqxZKI.jpg',1,'<p style=\"text-align: justify; \"><strong>Marvin Sánchez Garache</strong> recibió el grado de Ingeniero  electrónico de la Universidad Nacional de Ingeniería (UNI), Managua, Nicaragua, en 1995, el grado de Tech. Lic. y el grado de Ph.D. en Sistemas de Radio Comunicaciones del Instituto Real Tecnológico (KTH, por sus siglas en Sueco), Estocolmo, Suecia, en Junio del 2004 y en Mayo del 2008 respectivamente. Su experiencia laboral incluye  la investigación de Redes Inalámbricas, Regulación de Telecomunicaciones, Diseño y Optimización de Redes Celulares y educación superior en Redes Inalámbricas y Telecomunicaciones.&nbsp;</p><p style=\"text-align: justify; \">Desde 1995 ha trabajado para la UNI como profesor titular e \r\ninvestigador en Sistemas de Comunicaciones Inalámbricas y Telecomunicaciones. \r\n\r\nEn investigación, ha realizado varias publicaciones nacionales e internacionales en el área de multihop ad-hoc con sistemas de antenas avanzados, monitoreo remoto de variables físicas (sensores remotos) y en optimización de redes celulares. Adicionalmente, ha trabajado para el Regulador de Telecomunicaciones de Nicaragua y para operadores de redes celulares en Centro América y Las Antillas.  \r\nHa realizado  diseño y optimización de redes celulares para operadores en  Panamá, Nicaragua, Jamaica, Haití, Las Islas Francesas y Trinidad &amp; Tobago.&nbsp;</p><p style=\"text-align: justify; \">También tiene experiencia en optimización de GERAN (incluyendo planeación de frecuencias),  WCDMA/HSPA+ Multicarrier, planeación y diseño de E-UTRAN (LTE Advanced) y conocimiento de estándares 3GPP.  Su principal área de investigación es en el área de redes de comunicación inalámbricas, en particular en “Self-Organizing Networks (SON)” y la administración optima de los recursos de radio para redes celulares incluyendo múltiples portadoras y sistemas de antenas avanzados.</p>','Ingeniero Electronico',2,'marvin-sanchez-garache'),(5,'Enrique','Silva Molina','2017-04-23','enrique.silva@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Sistema y Tecnologías de Información','','','','investigator/Enrique.jpg',1,'<p style=\"text-align: justify;\"><strong>Enrique Silva Molina</strong> recibió el grado de master en física y matemática en 1987 de la Universidad Bielorrusia, Minsk. Desde 1990, ha sido profesor titular enseñando Modelos Conceptuales y Matemáticos, Simulación Digital, Análisis Numérico, y Control por computadoras en el Departamento de lenguaje y simulación en la Universidad Nacional de Ingeniería, Managua, Nicaragua.&nbsp;</p><p style=\"text-align: justify; \">Desde 1998 inició sus estudios de Doctor en Filosofía en el departamento de sistemas de información y control, del Real Instituto Tecnológico, Estocolmo, Suecia. Presentó su tesis de Licenciado en Ingeniería (Tkl), en Mayo 2003, “Evaluación de Inversiones de Tecnología de Información: Un enfoque de simulación de procesos”. Actualmente se encuentra finalizando sus estudios de Doctorado en KTH y se prevé su disertación doctoral para Diciembre de 2009. Su foco principal de investigación es el área de Sistemas de Información Empresariales y procesos de modelación y simulación. Es miembro de IEEE, ACM, ISACA, and SCS.</p>','Ingeniero en Computación',3,'enrique-silva-molina'),(6,'Norman','Vargas','2017-04-23','norman.vargas@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Sistema y Tecnologías de Información','','','','investigator/Norman.jpg',1,'<p style=\"text-align: justify; \"><strong>Norman Vargas</strong> recibió su grado en Ingeniería Electrónica en la Universidad Nacional de Ingeniería (UNI) en Nicaragua en 2002 y su título de “Licentiate of Engineering” en el área de Ciencias de Computación y Sistemas en el Real Instituto Tecnológico (KTH) en Suecia en Mayo 2010. El título de “Licentiate of Engineering” es un grado académico intermedio entre MSc y PhD expedidos por las universidades de Suecia y Finlandia, comparado a un Master en Filosofía (MPhil) del sistema británico. \r\n\r\nEs un profesor universitario en el departamento de Sistemas Digitales y Telecomunicaciones en la UNI.&nbsp;</p><p style=\"text-align: justify; \">Es miembro del Programa de investigación en Tecnologías de Información y Comunicación en la UNI en Nicaragua. Su interés en la investigación se encuentra en el área de Gestión de Tecnologías de Información. En esta área, está enfocado en el alineamiento estratégico del negocio y las TI.</p><p style=\"text-align: justify; \">Él se ha centrado en la comprensión y el desarrollo de teorías y métodos para la preparación y evaluación de escenarios de alineamiento estratégico de negocios y TI en instituciones públicas y privadas. También está interesado en algunas áreas como ITIL, gobierno de TI, y comercio electrónico. Él tiene ocho publicaciones internacionales y tres publicaciones regionales en América Central.</p>','Ingeniero Electrónico',4,'norman-vargas'),(7,'Marco','Munguía Mena','2017-04-23','marcos.munguia@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Telemedicina','','','','investigator/Marco.jpg',1,'<p style=\"text-align: justify;\"><strong>Marco Munguía Mena</strong> recibió su título de Ingeniero en Electrónica, con honores, de la Universidad Nacional de Ingeniería (UNI), Managua, Nicaragua en 2004. En 2005 se une, como profesor, al Departamento de Sistemas Digitales y Telecomunicaciones de la UNI. En Marzo de 2006, pasa a formar parte del programa de Investigación UNI-Asdi(SAREC)FEC. En 2007 inicia estudios de posgrado en la Universidad de Lund,  Lund, Suecia con el auspicio de la Agencia Sueca para el Desarrollo Internacional (Asdi). En 2011 obtiene el título académico “Teknologie Licentiat”, grado académico intermedio entre M.Sc. y Ph.D. otorgado por universidades suecas.</p><p style=\"text-align: justify; \">Su principal tópico de investigación es el Procesamiento Digital de Señales Biomédicas para el diagnóstico temprano de complicaciones en pacientes que sufren de enfermedad renal crónica.</p>','Ingeniero Electrónico',5,'marco-munguia-mena'),(8,'Johnny','Flores Delgadillo','2017-04-23','johnny.flores@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Sistema y Tecnologías de Información','','','','investigator/Johny.jpg',1,'<p style=\"text-align: justify;\"><strong>Johnny Flores</strong> es profesor e investigador en la Universidad Nacional de Ingeniería (UNI-Nicaragua). Su área de investigación es la gestión estratégica  de TI donde ha publicado varios artículos en diferentes conferencias y revistas internacionales. El ha realizado  consultorías en el área de Auditoria de Sistemas de Información, y  el desarrollo de aplicaciones web como Sistema de Indicadores de Turismo sostenible, entre otros.&nbsp;</p><p style=\"text-align: justify; \">También es el coordinador del proyecto de  la Sociedad de Computación Capitulo IEEE Sección Nicaragua, referido como \"Fortalecimiento de jóvenes profesionales con estándares internacionales\" desde 2014. Así mismo está impulsando análisis de brecha a organizaciones nicaragüense en base a estándares internacionales, tales como ISO 9001, ISO 9004, ISO/IEC 25000 y el ISO/IEC 20000.</p>','Ingeniero en Computación',6,'johnny-flores-delgadillo'),(9,'Anayanci','López Poveda','2017-04-23','anayanci.lopez@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Sistema y Tecnologías de Información','','','','investigator/Ana.jpg',1,'<p style=\"text-align: justify;\"><strong>Anayanci López Poveda</strong> es profesora e investigadora en la Universidad Nacional de Ingeniería. Recibió su grado de Ingeniera en Computación en la UNI (Managua, Nicaragua); posteriormente, recibió su grado de Teknologie Licentiate (grado entre el MSc. y el PhD. en países escandinavos) con especialidad en Gestión TI en el Real Instituto Tecnológico (Estocolmo, Suecia).</p><p style=\"text-align: justify; \">Ella ha realizado investigación en el área de Gestión TI con énfasis en soluciones de acuerdo al contexto de Nicaragua. Su trabajo de investigación ha sido publicado en conferencias internacionales. También ha diseñado y ejecutado casos de estudios en instituciones de Nicaragua y Suecia.</p>','Ingeniero en Computación',7,'anayanci-lopez-poveda'),(10,'Oscar','Somarriba','2017-04-23','oscar.somarriba@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Administración Innovadora del Espectro Radioeléctrico','','','','investigator/oscar.jpg',1,'<p style=\"text-align: justify; \"><strong>Oscar Somarriba </strong>actualmente es estudiante de doctorado en el Laboratorio de Seguridad y Sistemas de la Universidad de Mondragón, Arrasate-Mondragón, España. Su investigación se centra en la seguridad en los dispositivos móviles Inteligentes. Posee una licenciatura en Electrónica, (Ingeniero Electrónico) por la Universidad Nacional de Ingeniería (UNI), Managua, Nicaragua, y el grado de Teknologie Licentiate (MPhil) en Sistemas Digitales Inalámbricos del Real Instituto Tecnológico (KTH) en Estocolmo, Suecia.&nbsp;</p><p style=\"text-align: justify; \">De 2001 a 2009 fue investigador invitado (a tiempo parcial) del Centro de Investigación de Comunicaciones Inalámbricas (Wireless Center) de KTH donde trabajó en Redes inalámbricas Ad Hoc. Ha tenido una larga trayectoria tanto en la Universidad Nacional de Ingeniería como en la industria Nicaragüense en el ramo de las comunicaciones inalámbricas.</p>','Ingeniero Electrónico',8,'oscar-somarriba'),(11,'Pablo','Vásquez','2017-04-23','pablo.vasquez@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Telemedicina','','','','investigator/pablo.jpg',1,'<p style=\"text-align: justify; \"><strong>Pablo Vásquez</strong> actualmente es estudiante de doctorado en el Laboratorio de Seguridad y Sistemas de la Universidad de Mondragón, Arrasate-Mondragón, España. Su investigación se centra en Signal Processing con aplicaciones médicas. Posee una licenciatura en Ingeniería Electrónica, (Ingeniero Electrónico) por la Universidad Nacional de Ingeniería (UNI), Managua, Nicaragua, y el grado de Teknologie Licentiate (MPhil) en Procesamiento de Señales del Real Instituto Tecnológico (KTH) en Estocolmo, Suecia.&nbsp;</p><p style=\"text-align: justify; \">&nbsp;Ha tenido una larga trayectoria tanto en la Universidad Nacional de Ingeniería como en la industria Nicaragüense en el ramo de las comunicaciones inalámbricas.</p>','Ingeniero Electrónico',9,'pablo-vasquez'),(12,'Marvin','Arias Olivas','2017-04-23','marvin.arias@uni.edu.ni','(505) 5052-2781','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Área de Telemedicina','','','','investigator/Marvin_HIXcaVf.jpg',1,'<p style=\"text-align: justify; \"><strong>Marvin Arias Olivas</strong> obtuvo el título de Ingeniero electrónico en la Universidad Nacional de Ingeniería de Nicaragua (UNI) en 1993. En el año 2004 obtuvo el título de Licentiate of Enginering en Procesamiento de Señales para Radiocomunicaciones en el Instituto Tecnológico de Lund (LTH) de la Universidad de Lund en Lund Suecia.&nbsp;</p><p style=\"text-align: justify; \">Obtuvo su título de PhD en Ciencias de la Computación (mención en Comunicaciones) en el Instituto Politécnico Nacional (IPN) en la ciudad de México, México en Noviembre del 2008. Actualmente es profesor titular y responsable de área de investigación del proyecto de Telemedicina de la Facultad de Electrotecnia y Computación (FEC), auspiciado por el organismo de Cooperación de Suecia ASDI/SAREC. Durante el período 1994-1998 fue Vicedecano de la Facultad de Electrotecnia y Computación (FEC/UNI).&nbsp;</p><p style=\"text-align: justify; \">Su experiencia laboral también incluye diversos trabajos como consultor para diferentes organizaciones nacionales públicas y privadas del sector de las Tecnologías de información y Comunicaciones (TIC), y para organizaciones internacionales: OIT/ONU y PNUD/ONU en proyectos similares. Su foco de investigación incluye técnicas para procesamiento de señales digitales con aplicación en Telemedicina, Estimación de la propagación de Radio y modelación de canal en sistemas de radio móviles, área en la cual ha realizado múltiples publicaciones internacionales de IEEE y ha sido miembro de comités técnicos conferencias como APCC 2005 y de revistas con arbitraje internacional como AWPL 2009.</p>','Ingeniero Electrónico',10,'marvin-arias-olivas'),(13,'Leonel','Plazaola Prado','2017-04-23','leonel.plazaola@uni.edu.ni','(505) 2278-1460','Oficina: 2do Piso de la Facultad de Electrotecnia y Computación, Edificio de Computación UNIVERSIDAD NACIONAL DE INGENIERIA (UNI), Avenida Universitaria Frente a la UCA.','Coordinación','','','','investigator/leomel.jpg',1,'<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.3pt;\"><p style=\"text-align: justify;\"><span style=\"background-color: initial;\">El </span><strong style=\"background-color: initial;\">Dr. Plazaola</strong><span style=\"background-color: initial;\"> es actualmente el Vice-rector\r\nde Investigación y Desarrollo en la Universidad Nacional de Ingeniería (UNI),\r\nNicaragua. Es un investigador activo y consultor en el área de Tecnología de\r\nInformación y Comunicación. Es profesor titular y decano fundador de la\r\nFacultad de Electrotecnia y Computación (FEC) en la UNI, Nicaragua. Miembro de\r\ndiversos grupos, organizaciones y foros académicos nacionales e internacionales\r\nsobre el desarrollo organizacional de políticas TIC,</span></p><span style=\"background-color: initial;\"><p style=\"text-align: justify;\"><span style=\"background-color: initial;\">alineamiento de los negocios y las TI. Tiene\r\nexperiencia en propuestas y coordinación de proyectos de investigación y\r\ntecnológicos internacionales, incluidos los componentes administrativos y de\r\ngestión. Experiencia docente en Ingeniería desde 1985.</span></p></span><span style=\"background-color: initial;\"><p style=\"text-align: justify;\"><span style=\"background-color: initial;\">El Dr. Plazaola tiene un PhD del Real\r\nInstituto Tecnológico (KTH), Suecia, en Sistemas de Información y Control\r\nIndustrial especializado en \"Gestión del alineamiento del negocio y TI –\r\nUn Enfoque de Arquitectura Empresarial”. El grado de “Technology Licentiate”\r\ndel Real Instituto Tecnológico (KTH), Suecia, en Sistemas de Información y\r\nControl Industrial enfocado en \"Un Marco de Migración de Sistema de\r\nInformación para los Centros de Control de Electricidad – Basado en estudios de\r\ncasos de América Central\", y el grado de Ingeniería Electrónica de la\r\nUniversidad Centroamérica (UCA), Nicaragua, enfocado en \"Diseño\r\nelectrónico basado en microprocesadores\".</span></p></span><span style=\"background-color: initial;\"><p style=\"text-align: justify;\"><span style=\"background-color: initial;\">Le\r\ninteresa la investigación, la aplicación de tecnología y proyectos de\r\nconsultoría TIC vinculados a contextos reales y con impacto tangible.</span></p></span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.3pt;\"><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.25pt;\"><o:p></o:p></p>\r\n\r\n','Ingeniero Electrónico',11,'leonel-plazaola-prado');
/*!40000 ALTER TABLE `investigator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigator_social`
--

DROP TABLE IF EXISTS `investigator_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investigator_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investigator_id` int(11) NOT NULL,
  `social_id` int(11) NOT NULL,
  `profile_social` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `investigator_social_44901e94` (`social_id`),
  KEY `investigator_social_investigator_id_b5de7616_fk_investigator_id` (`investigator_id`),
  CONSTRAINT `investigator_social_investigator_id_b5de7616_fk_investigator_id` FOREIGN KEY (`investigator_id`) REFERENCES `investigator` (`id`),
  CONSTRAINT `investigator_social_social_id_84f86b2b_fk_sociallinks_id` FOREIGN KEY (`social_id`) REFERENCES `sociallinks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigator_social`
--

LOCK TABLES `investigator_social` WRITE;
/*!40000 ALTER TABLE `investigator_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `investigator_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociallinks`
--

DROP TABLE IF EXISTS `sociallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociallinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `icon_fa_class` varchar(100) DEFAULT NULL,
  `base_link` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociallinks`
--

LOCK TABLES `sociallinks` WRITE;
/*!40000 ALTER TABLE `sociallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sociallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesisgrade`
--

DROP TABLE IF EXISTS `tesisgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tesisgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `fechaDefensa` date NOT NULL,
  `descripcion` longtext NOT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `tesisgrade_tutor_id_6d9c22b8_fk_investigator_id` (`tutor_id`),
  CONSTRAINT `tesisgrade_tutor_id_6d9c22b8_fk_investigator_id` FOREIGN KEY (`tutor_id`) REFERENCES `investigator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesisgrade`
--

LOCK TABLES `tesisgrade` WRITE;
/*!40000 ALTER TABLE `tesisgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesisgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesisposgrade`
--

DROP TABLE IF EXISTS `tesisposgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tesisposgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `fechaDefensa` date NOT NULL,
  `descripcion` longtext NOT NULL,
  `archivo` varchar(100) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `tesisposgrade_tutor_id_18d101f1_fk_investigator_id` (`tutor_id`),
  CONSTRAINT `tesisposgrade_tutor_id_18d101f1_fk_investigator_id` FOREIGN KEY (`tutor_id`) REFERENCES `investigator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesisposgrade`
--

LOCK TABLES `tesisposgrade` WRITE;
/*!40000 ALTER TABLE `tesisposgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesisposgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimony`
--

DROP TABLE IF EXISTS `testimony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimony` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `expression` varchar(50) NOT NULL,
  `testimony` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `googlePlus` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `privacy` tinyint(1) NOT NULL,
  `date_joined` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimony`
--

LOCK TABLES `testimony` WRITE;
/*!40000 ALTER TABLE `testimony` DISABLE KEYS */;
INSERT INTO `testimony` VALUES (1,'Marvin Arias Olivas','Ingeniero Eléctrico e Ingeniero Electrónico','Excelente!!!','La principal actividad de investigación está enfocada en la modelación, simulación y medición de canales de comunicación aplicados al diseño de sistemas de radiocomunicación móvil en la banda de frecuencia de los Gigahertz, utilizados en ambientes internos y externos de áreas urbanas, usando técnicas de procesamiento de señales.\r\nLa técnica de procesamiento de señales utilizadas es la simulación y medición en tiempo real de la respuesta al impulso del canal de radiocomunicación para condiciones estacionarias y no estacionarias, en ambientes internos y externos de área urbanas.','','','','','testimony/foto.JPG',1,0,'2016-09-11'),(2,'ANAYANCI LOPEZ','ING EN COMP','Experiencia Enriquecedora','A través del programa he participado en varios proyectos y programas de intercambio que han sido muy interesantes y enriquecedores en mi formación.','','','','','testimony/IMG_20160423_190027.jpg',1,0,'2017-05-03'),(3,'ANAYANCI LOPEZ','ING EN COMP','QUÉ ES ESTO???','SHORT BIO1','','','','','testimony/IMG_20160423_190027_uvl01Cp.jpg',0,0,'2017-05-03'),(4,'ANAYANCI LOPEZ','ING EN COMP','QUÉ ES ESTO???','SHORT BIO1','','','','','testimony/IMG_20160423_190027_vS5wCAc.jpg',0,0,'2017-05-03'),(5,'ANAYANCI LOPEZ','ING EN COMP','QUÉ ES ESTO???','SHORT BIO1','','','','','testimony/IMG_20160423_190027_1b0Cqeg.jpg',0,0,'2017-05-03'),(6,'ANAYANCI LOPEZ','ING EN COMP','QUÉ ES ESTO???','SHORT BIO1','','','','','testimony/IMG_20160423_190027_3huC6Np.jpg',0,0,'2017-05-03'),(7,'ANAYANCI LOPEZ','ING. EN COMP','Enriquecedora experiencia','SHORT BIO1','','','','','testimony/IMG_20160423_190027_t0kfXpH.jpg',0,0,'2017-05-03');
/*!40000 ALTER TABLE `testimony` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-21 17:12:13
