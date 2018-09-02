CREATE DATABASE  IF NOT EXISTS `sarec` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sarec`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: sarec
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT INTO `accounts_userprofile` VALUES (1,'profiles/perfil_AhvJEi9.jpg',1);
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$1LPh7x8Gx3AZ$6Eo+dUcmJ4wR0rhvavwBkfrszTrU52j86EDFemcdh84=','2017-03-28 03:13:29.897000',1,'Alvaromero','Alvaro','Romero','alvaro.jrp.1994@gmail.com',1,1,'2016-09-11 20:41:22.535000');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_slug_c3fca16d_uniq` (`slug`),
  KEY `blog_article_owner_id_5cc237cd_fk_investigator_id` (`owner_id`),
  KEY `blog_article_ac856a5e` (`categorys_id`),
  CONSTRAINT `blog_article_categorys_id_ed74a2a6_fk_blog_subcategory_id` FOREIGN KEY (`categorys_id`) REFERENCES `blog_subcategory` (`id`),
  CONSTRAINT `blog_article_owner_id_5cc237cd_fk_investigator_id` FOREIGN KEY (`owner_id`) REFERENCES `investigator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'Proyecto LAMENITEC ERASMUS MUNDUS (2012-2016)','proyecto-lamenitec-erasmus-mundus-2012-2016','<p><span style=\"color: rgb(0, 0, 0);\">Financiado por la Unión Europea, que consiste en un programa de Becas para estudiantes y staff\r\nacadémicos y administrativos de la Universidad Nacional de Ingeniería entre otras Universidades\r\nLatinoamérica beneficiarias del programa LAMENITEC y que pueden también participar otras\r\nuniversidades de cada país miembro del proyecto a nivel de pregrado, Maestría, Doctorado y\r\nestancias de investigación a nivel de postdoctorado y estancias para el staff académico y/o\r\nadministrativo de la UNI el responsable a cargo de la coordinación de la movilidad académica por\r\nla UNI es el Dr. Marvin Arias, actual coordinador académico del programa de Maestría en Gestión\r\nTI antes mencionada.</span></p>','2016-09-11 21:52:53.387000','2016-09-11 21:52:53.961000',1,2,'Managua',1,2016),(2,'DISEÑO DE RED INALAMBRICA AD HOC PARA ENFRENTAR CATASTROFES SISMICAS (TERREMOTOS Y TSUNAMIS) – EN EJECUCIÓN','diseno-de-red-inalambrica-ad-hoc-para-enfrentar-catastrofes-sismicas-terremotos-y-tsunamis-en-ejecucion','<p>Desastres naturales, tales como terremotos y tsunamis, han sucedido frecuentemente en muchos\r\nlugares en todo el mundo. Cuando el desastre ocurre, la infraestructura de red de información\r\njuega un rol muy importante como el medio de comunicación de los residentes. Sin embargo, una\r\nvez ocurrido el desastre, no se puede evitar fallas de los equipos de red, caídas de líneas de\r\ncomunicación y congestión de tráfico. Se requiere un ambiente de red más robusto y confiable,\r\nincluso aunque hayan ocurrido serios daños por el desastre. Es consecuencia, necesitamos diseñar\r\ne implementar redes de comunicación efectivas usando internet. En este proyecto, nosotros\r\nproponemos una red inalámbrica para asegurar inmediatamente medios de comunicación para\r\ncolectar la información respecto a la zona de desastre, seguridad del residente y recursos de\r\nayuda en la ocurrencia de un desastre. AI combinar múltiples nodos de red inalámbrica,\r\nautomáticamente se organiza una gran red ad-hoc en la zona de desastre y puede cubrir refugios\r\no zonas de comunicación interrumpidas como medios de comunicación urgentes.</p>','2016-09-11 21:58:27.492000','2016-09-11 21:58:28.051000',1,2,'Managua - Nicaragua',1,2015),(3,'DISEÑO DE UN SISTEMA DE TELE-CONSULTAS PEDIÁTRICAS PARA ATENCIÓN DE INFECCIONES RESPIRATORIAS ENTRE NUEVA GUINEA Y SUS ZONAS RURALES – EN EJECUCIÓN','diseno-de-un-sistema-de-tele-consultas-pediatricas-para-atencion-de-infecciones-respiratorias-entre-nueva-guinea-y-sus-zonas-rurales-en-ejecucion','<p><span style=\"color: rgb(0, 0, 0);\">El sector salud en Nicaragua es uno de los servicios más demandados por la población, las zonas\r\nrurales no son ajenas a esta demanda; sin embargo, por las características de estas zonas, es más\r\ncomplejo proveer acceso a los servicios de salud con las mismas condiciones.</span></p><p><span style=\"color: rgb(0, 0, 0); line-height: 1.4em; background-color: initial;\">La telemedicina es definida como medicina ejercida a distancia haciendo uso de las TIC, y es muy\r\nbeneficiosa para las poblaciones que viven en comunidades aisladas y regiones remotas; evita los\r\ndesplazamientos innecesarios de los pacientes al centro de atención especializado.</span></p><p><span style=\"color: rgb(0, 0, 0); line-height: 1.4em; background-color: initial;\">En Nicaragua con respecto a telemedicina o tele-consultas se ha venido avanzando\r\npaulatinamente.&nbsp;</span><span style=\"color: rgb(0, 0, 0); line-height: 1.4em; background-color: initial;\">En este proyecto se propone un sistema de tele-consultas para beneficiar al municipio de Nueva\r\nGuinea y sus zonas aledañas. Nueva Guinea está ubicada en la Región Autónoma de la Costa\r\nCaribe Sur (RACCS), y tiene la particularidad de que la mayor cantidad de su población se\r\nencuentra ubicada en el área rural y, por otro lado, los especialistas médicos se localizan en el\r\ncasco urbano; por tanto, un sistema de tele-consultas sería de mucha utilidad en este contexto.</span></p>','2016-09-11 22:02:02.083000','2016-09-12 00:46:41.906000',1,2,'Managua - Nicaragua',1,2016);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(13,3,7),(14,3,8);
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
  `slug` varchar(255),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_media`
--

LOCK TABLES `blog_media` WRITE;
/*!40000 ALTER TABLE `blog_media` DISABLE KEYS */;
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
INSERT INTO `blog_subcategory` VALUES (1,'2016-09-11 21:21:54.728000','actividades-realizadas',1,'Actividades realizadas',1),(2,'2016-09-11 21:22:03.819000','proyectos-en-ejecucion',1,'Proyectos en ejecución',1),(3,'2016-09-11 21:22:15.367000','instituciones-vinculadas',0,'Instituciones vinculadas',1),(4,'2016-09-11 21:23:26.376000','asociones-profesionales',1,'Asociónes profesionales',1),(5,'2016-09-11 21:23:54.456000','trabajos-de-graduacion',1,'Trabajos de Graduación',2),(6,'2016-09-11 21:24:18.533000','maestrias',1,'Maestrías',2),(7,'2016-09-11 21:24:34.280000','trabajos-de-grado',1,'Trabajos de Grado',2),(8,'2016-09-11 21:24:52.584000','trabajos-de-posgrado',1,'Trabajos de posgrado',2),(9,'2016-09-11 21:25:09.609000','tesis-doctorales',1,'Tesis doctorales',3),(10,'2016-09-11 21:25:20.602000','tesis-teknologie-licentiate-mphil',1,'Tesis Teknologie Licentiate (MPhil)',3),(11,'2016-09-11 21:25:29.309000','articulos-en-revistas-internacionales',1,'Artículos en revistas internacionales',3),(12,'2016-09-11 21:25:38.828000','patentes',1,'Patentes',3),(13,'2016-09-11 21:25:47.439000','articulos-en-conferencias-internacionales',1,'Artículos en Conferencias Internacionales',3),(14,'2016-09-11 21:25:56.087000','articulos-en-revistas-nacionales',1,'Artículos en Revistas Nacionales',3),(15,'2016-09-11 21:26:03.697000','articulos-de-estudiantes-mgtic',1,'Artículos de Estudiantes MGTIC',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'LAMENITEC','lamenitec'),(2,'ERASMUS','erasmus'),(3,'MUNDUS','mundus'),(4,'DISEÑO','diseno'),(5,'RED','red'),(6,'INALAMBRICA','inalambrica'),(7,'SISTEMA','sistema'),(8,'PEDIÁTRICAS','pediatricas');
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
INSERT INTO `configurations` VALUES (1,'El Programa PROTIC es un programa que promueve la investigación cientifica en temáticas de interés en las Facultades de Ingeniería de la UNI. Promueve las actividades de investigación científica con el objetivo de crear tradición científica y generación de conocimientos en un entorno de cooperación con contrapartes científicas de Universidades de Suecia y otros países. El desarrollo de las actividades de investigación científica en el Programa PROTIC tienen los mismos resultados que cualquier trabajo de investigación científica internacionalmente reconocido.','proitic@gmail.com','(505) 7666-4235','','','','','');
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
INSERT INTO `configurations_history` VALUES (1,'<p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">El Programa de Investigación en Tecnologías de Información y Comunicaciones (PROITIC), inició en 1992 en la Facultad de Electrotecnia y Computación (FEC) de la Universidad Nacional de Ingeniería (UNI), Nicaragua, auspiciado por la Agencia Sueca para el Desarrollo Internacional (Asdi). Los contrapartes en Suecia de este Programa fueron el Departamento de Sistemas de Información y Control Industrial, Departamento de Radiocomunicación  ambos del Real Instituto Tecnológico de Estocolmo(KTH) , Suecia, y el Departamento de Electrociencia  en el Instituto Tecnológico de Lund(LTH) , Suecia, que se integró a partir de 1999.</span></p><p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">El objetivo general del Programa es fortalecer la capacidad de investigación e innovación en la Universidad Nacional de Ingeniería en el área de Tecnologías de la Información y Comunicaciones (TIC) con un cercano vínculo con los actores nacionales, centroamericanos e internacionales, fortaleciendo de esta manera la relevancia y calidad de los resultados del proceso de investigación científica y su aplicación.</span></p><p style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0);\">El Programa condujo a los primeros profesores involucrados de parte de la FEC, UNI, a la obtención de grados académicos de Doctorado (PhD) o el Teknologie Licentiate. Este último es un grado académico en los países nórdicos  entre el MSc. y el Doctorado (PhD) conocido en algunos círculos como MPhil. Este  Programa se desarrolló a través de visitas a Suecia y a los países en donde se publican los resultados de investigación (conferencias, simposios científicos, etc.) con visitas de los colegas de investigación de Suecia a Nicaragua. Esto ha permitido que los investigadores nicaragüenses y suecos tengan una más cercana visión de la aplicación de los temas de investigación a la realidad y contexto nacional.</span></p><p style=\"text-align: justify; \"><span style=\"color: rgb(0, 0, 0);\">Los miembros de este Programa han desarrollado vínculos activos con redes de investigación, sociedades académicas y profesionales  pudiendo compartir el conocimiento en las diferentes áreas TIC que se desarrollan, publicando internacionalmente  y con experiencia en servicios, consultorías y casos de estudios con empresas nacionales e internacionales en Nicaragua. Se cuenta con una infraestructura básica para el desarrollo de actividades de investigación, producción científica mediante publicación de resultados de investigación en revistas de prestigio internacional con arbitraje y la participación en congresos, seminarios y simposios nacionales e internacionales con arbitraje, así como la participación de investigadores del programa como miembros de comités de revisores para congresos nacionales e internacionales.</span></p>');
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
INSERT INTO `cooperation_cooperation` VALUES (1,'<p>Cómo parte de los vínculos del Programa de Investigación TIC se participan en diversas actividades que nos vinculan con la sociedad, tales como:</p><p><ul><li><span style=\'line-height: 1.4em; background-color: initial;\'>La fundación y participación en la Asociación de Internet de Nicaragua, AIN, (Dr. Leonel Plazaola).</span><br></li><li><span style=\'line-height: 1.4em; background-color: initial;\'>La participación con las entidades del Gobierno en la definición de las arquitecturas de interoperabilidad para el Gobierno Electrónico Central y Gobierno Electrónico Municipal, eGob y GobeNic (Dr. Leonel Plazaola).</span><br></li><li><span style=\'line-height: 1.4em; background-color: initial;\'>Desarrollo de un proyecto de conexión nacional de todos los proveedores de Internet en Nicaragua, NicIX, que permite que el tráfico nacional de Internet sea local (Dr. Leonel Plazaola).</span><br></li><li><span style=\'line-height: 1.4em; background-color: initial;\'>Desarrollo de un programa paralelo a la cooperación de la investigación destinado a fortalecer el uso y las aplicaciones de las Tecnologías de la Información en las 4 Universidades públicas de Nicaragua (representante Dr. Leonel Plazaola).</span><br></li><li><span style=\'line-height: 1.4em; background-color: initial;\'>Desarrollo del taller nacional sobre el impacto de las antenas de telefonía celular con entidades del gobierno y de la empresa privada (TkL. Oscar Somarriba y Dr. Marvin Sánchez).</span><br></li></ul></p>','2016-09-12 03:41:45.170000');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-11 20:11:27.351000'),(2,'auth','0001_initial','2016-09-11 20:11:36.139000'),(3,'accounts','0001_initial','2016-09-11 20:11:37.220000'),(4,'accounts','0002_auto_20160502_1703','2016-09-11 20:11:38.088000'),(5,'accounts','0003_userprofile','2016-09-11 20:11:39.744000'),(6,'admin','0001_initial','2016-09-11 20:11:41.319000'),(7,'admin','0002_logentry_remove_auto_add','2016-09-11 20:11:41.434000'),(8,'contenttypes','0002_remove_content_type_name','2016-09-11 20:11:42.397000'),(9,'auth','0002_alter_permission_name_max_length','2016-09-11 20:11:43.144000'),(10,'auth','0003_alter_user_email_max_length','2016-09-11 20:11:43.834000'),(11,'auth','0004_alter_user_username_opts','2016-09-11 20:11:43.878000'),(12,'auth','0005_alter_user_last_login_null','2016-09-11 20:11:44.480000'),(13,'auth','0006_require_contenttypes_0002','2016-09-11 20:11:44.502000'),(14,'auth','0007_alter_validators_add_error_messages','2016-09-11 20:11:44.570000'),(15,'investigator','0001_initial','2016-09-11 20:11:45.074000'),(16,'investigator','0002_remove_investigator_fotoperfil','2016-09-11 20:11:45.597000'),(17,'investigator','0003_auto_20160505_2234','2016-09-11 20:11:47.146000'),(18,'investigator','0004_investigator_fotoperfil','2016-09-11 20:11:47.739000'),(19,'investigator','0005_investigator_activo','2016-09-11 20:11:48.395000'),(20,'investigator','0006_auto_20160508_1529','2016-09-11 20:11:48.557000'),(21,'investigator','0007_auto_20160515_0909','2016-09-11 20:11:48.679000'),(22,'blog','0001_initial','2016-09-11 20:11:52.385000'),(23,'blog','0002_auto_20160617_0948','2016-09-11 20:11:52.791000'),(24,'blog','0003_auto_20160617_1018','2016-09-11 20:11:53.455000'),(25,'blog','0004_auto_20160617_1544','2016-09-11 20:11:53.657000'),(26,'blog','0005_media','2016-09-11 20:11:53.991000'),(27,'blog','0006_auto_20160731_1513','2016-09-11 20:11:55.263000'),(28,'blog','0007_category','2016-09-11 20:11:55.599000'),(29,'blog','0008_category_active','2016-09-11 20:11:56.536000'),(30,'blog','0009_article_categorys','2016-09-11 20:11:58.427000'),(31,'blog','0010_auto_20160801_1606','2016-09-11 20:11:59.571000'),(32,'blog','0011_article_active','2016-09-11 20:12:00.850000'),(33,'blog','0012_category_slug','2016-09-11 20:12:01.510000'),(34,'blog','0013_subcategory','2016-09-11 20:12:02.685000'),(35,'blog','0014_article_year','2016-09-11 20:12:03.308000'),(36,'blog','0015_auto_20160902_1619','2016-09-11 20:12:04.184000'),(37,'configurations','0001_initial','2016-09-11 20:12:04.604000'),(38,'configurations','0002_auto_20160523_1114','2016-09-11 20:12:05.444000'),(39,'configurations','0003_auto_20160618_1121','2016-09-11 20:12:06.634000'),(40,'configurations','0004_history','2016-09-11 20:12:06.906000'),(41,'configurations','0005_auto_20160802_1008','2016-09-11 20:12:07.421000'),(42,'cooperation','0001_initial','2016-09-11 20:12:11.593000'),(43,'cooperation','0002_remove_cooperation_name','2016-09-11 20:12:12.342000'),(44,'cooperation','0003_project','2016-09-11 20:12:12.631000'),(45,'cooperation','0004_auto_20160706_1341','2016-09-11 20:12:13.434000'),(46,'cooperation','0005_auto_20160706_1412','2016-09-11 20:12:13.534000'),(47,'cooperation','0006_project_active','2016-09-11 20:12:14.208000'),(48,'cooperation','0007_activities','2016-09-11 20:12:14.475000'),(49,'cooperation','0008_institution','2016-09-11 20:12:14.716000'),(50,'cooperation','0009_auto_20160905_1503','2016-09-11 20:12:15.124000'),(51,'investigator','0007_auto_20160508_2019','2016-09-11 20:12:15.172000'),(52,'investigator','0008_merge','2016-09-11 20:12:15.208000'),(53,'investigator','0009_auto_20160515_2124','2016-09-11 20:12:16.549000'),(54,'investigator','0010_investigator_idcuenta','2016-09-11 20:12:17.787000'),(55,'investigator','0011_auto_20160610_1411','2016-09-11 20:12:18.838000'),(56,'investigator','0012_investigator_slug','2016-09-11 20:12:19.611000'),(57,'graduationWork','0001_initial','2016-09-11 20:12:22.770000'),(58,'investigationLines','0001_initial','2016-09-11 20:12:23.098000'),(59,'investigationLines','0002_investigationlines_slug','2016-09-11 20:12:23.696000'),(60,'investigator','0013_auto_20160909_2128','2016-09-11 20:12:26.501000'),(61,'investigator','0014_investigator_social_profile_social','2016-09-11 20:12:27.291000'),(62,'investigator','0015_auto_20160909_2130','2016-09-11 20:12:27.875000'),(63,'investigator','0016_auto_20160909_2131','2016-09-11 20:12:29.591000'),(64,'sessions','0001_initial','2016-09-11 20:12:30.184000'),(65,'testimony','0001_initial','2016-09-11 20:12:30.450000'),(66,'testimony','0002_auto_20160507_1302','2016-09-11 20:12:30.597000'),(67,'testimony','0003_testimony_date_joined','2016-09-11 20:12:31.274000'),(68,'blog','0016_blogarticle','2016-09-12 01:10:29.297000');
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
INSERT INTO `django_session` VALUES ('herfh6gk253rqqpa8ra7lxtba4ngz4ef','ZjA1NzQ4MDljYjkyYzU4ZTk3ZWZiYjQ5MTk3ZWM1M2Q5NzM5ZWQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkYjdkODM4MTE2ODYzOTdlNmE0ODdiYjgzNTJhNTUyN2FiY2IzNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-26 00:39:09.217000'),('vajrxw9e3v9bvm3h8zmt6ar5281skj3j','ZjA1NzQ4MDljYjkyYzU4ZTk3ZWZiYjQ5MTk3ZWM1M2Q5NzM5ZWQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkYjdkODM4MTE2ODYzOTdlNmE0ODdiYjgzNTJhNTUyN2FiY2IzNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-25 21:20:35.444000'),('z79obd4z6bk1nwdugxzarju3a904xjkq','ZjA1NzQ4MDljYjkyYzU4ZTk3ZWZiYjQ5MTk3ZWM1M2Q5NzM5ZWQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNkYjdkODM4MTE2ODYzOTdlNmE0ODdiYjgzNTJhNTUyN2FiY2IzNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-26 03:06:04.290000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigationlines`
--

DROP TABLE IF EXISTS `investigationlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investigationlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigationlines`
--

LOCK TABLES `investigationlines` WRITE;
/*!40000 ALTER TABLE `investigationlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `investigationlines` ENABLE KEYS */;
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
  `fotoPerfil` varchar(100),
  `activo` tinyint(1) NOT NULL,
  `presentacion` varchar(1000) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `idCuenta_id` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `investigator_idCuenta_id_3a589be3_fk_auth_user_id` (`idCuenta_id`),
  CONSTRAINT `investigator_idCuenta_id_3a589be3_fk_auth_user_id` FOREIGN KEY (`idCuenta_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigator`
--

LOCK TABLES `investigator` WRITE;
/*!40000 ALTER TABLE `investigator` DISABLE KEYS */;
INSERT INTO `investigator` VALUES (1,'Alvaro Javier','Romero Parrales','1994-01-10','alvaro.jrp.1994@gmail.com','(505) 8273-8907','Del estadio Diriangen 1 cuadra al norte, 2 cuadras al este, 1/2 cuadra al norte.','Departamento de Informatico','','','','investigator/perfil.jpg',1,'Oscar Somarriba actualmente es estudiante de doctorado en el Laboratorio de Seguridad y Sistemas de la Universidad de Mondragón, Arrasate-Mondragón, España. Su investigación se centra en la seguridad en los dispositivos móviles Inteligentes. Posee una licenciatura en Electrónica, (Ingeniero Electrónico) por la Universidad Nacional de Ingeniería (UNI), Managua, Nicaragua, y el grado de Teknologie Licentiate (MPhil) en Sistemas Digitales Inalámbricos del Real Instituto Tecnológico (KTH) en Estocolmo, Suecia. \r\nDe 2001 a 2009 fue investigador invitado (a tiempo parcial) del Centro de Investigación de Comunicaciones Inalámbricas (Wireless Center) de KTH donde trabajó en Redes inalámbricas Ad Hoc. Ha tenido una larga trayectoria tanto en la Universidad Nacional de Ingeniería como en la industria Nicaragüense en el ramo de las comunicaciones inalámbricas. \r\n','Ingeniero en Computación',1,'alvaro-javier-romero-parrales');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimony`
--

LOCK TABLES `testimony` WRITE;
/*!40000 ALTER TABLE `testimony` DISABLE KEYS */;
INSERT INTO `testimony` VALUES (1,'Alvaro Javier Romero Parrales','Desarrollador de Software','Excelente!!!','Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl´sica de la literatura del Latin, que data del año 45 antes de Cristo, haciendo que este adquiera mas de 2000 años de antiguedad. Richard McClintock, un profesor de Latin de la Universidad de Hampden-Sydney en Virginia, encontró una de las palabras más oscuras de la lengua del latín, \"consecteur\", en un pasaje de Lorem Ipsum, y al seguir leyendo distintos textos del latín, descubrió la fuente indudable. Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de \"de Finnibus Bonorum et Malorum\" (Los Extremos del Bien y El Mal) por Cicero, escrito en el año 45 antes de Cristo. Este libro es un tratado de teoría de éticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", viene de una linea en la sección 1.10.32.\r\nEl trozo de texto estándar de Lorem Ipsum usado desde el año 1500 es reproducido debajo para aquellos interesados. Las secciones 1.10.32 y 1.10.33 de \"de Finibus Bonorum et Malorum\" por Cicero son también reproducidas en su forma original exacta, acompañadas por versiones en Inglés de la traducción realizada en 1914 por H. Rackham.','alvaro.jrp.1994@gmail.com','','','','False',1,1,'2016-09-11');
/*!40000 ALTER TABLE `testimony` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sarec'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-16 11:52:26
