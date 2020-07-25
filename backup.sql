-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: dice
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '内容标题',
  `content` mediumtext COMMENT '内容',
  `hits` int NOT NULL DEFAULT '0' COMMENT '点击量',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签列表',
  `category` varchar(255) DEFAULT NULL COMMENT '文章分类',
  `status` smallint DEFAULT NULL COMMENT '内容状态',
  `type` varchar(32) DEFAULT NULL COMMENT '内容类别',
  `allow_comment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许评论',
  `comment_count` int NOT NULL DEFAULT '0' COMMENT '评论数量',
  `priority` int DEFAULT '0' COMMENT '文章优先级',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `modifier` int DEFAULT NULL COMMENT '修改人',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'beekaboo一周年啦','\nbeekaboo.cn自2019年7月建立后,便开始了长达一年的沉寂，一年后的今天，小站再度启程\n\n\n今天是2020年7月23日，小站的1岁生日，也是我的23岁生日\n\n\n以后的日子会不定期更新，加油！\n\n\n> Hello World！\n',12,'','',0,'post',0,0,0,'2020-07-23 15:49:42','2020-07-24 08:56:23',1,NULL,0),(2,'关于','# About me\n### Hello word\n这是关于我的页面\n\n* [Github](https://github.com/bihell)\n* [哔哩哔哩](https://space.bilibili.com/88900889/video)\n\n### 也可以设置别的页面\n* 比如友链页面',0,NULL,NULL,1,'page',1,0,0,'2020-07-19 07:04:34','2020-07-19 07:04:34',1,NULL,0),(3,'docker mysql authentication_string client does not support authentication  错误','原因：mysql8.0较旧版更新了密码加密方式\n```sql\n   #第一步：设置权限\n   ALTER USER \'root\'@\'localhost\' IDENTIFIED WITH mysql_native_password BY \'password\';\n   #或\n   ALTER USER \'root\'@\'%\' IDENTIFIED WITH mysql_native_password BY \'password\';\n   #第二步：刷新\n   flush privileges;\n```\n',3,'','',1,'post',0,0,0,'2020-07-23 12:34:29','2020-07-23 12:57:36',1,NULL,1),(4,'第二篇文章','**这里是一段粗体Dior999**\n\n*这里是一段斜体Abandon3.14*\n\n# 这里是一级标题Title001\n\n## 这里是二级标题Title002\n\n###这里是三级标题Title003\n\n++下划线下划线Underline123++\n\n~~删除线删除线Delete123~~\n\n一段话中的==标记==\n\n> 鲁迅曾经说过\n\n|姓名|性别|年龄|\n|Kim|男|18|\n|Jelly|女|20|\n\n',0,'Vue,Springboot','设计',0,'post',0,0,0,'2020-07-24 09:51:58','2020-07-24 09:46:41',1,NULL,0),(5,'Mysql 常用命令','查看版本\nselect version()\n\n\n查看当前连接情况\nshow processlist\n\n备份\ndocker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql\n\n恢复\ncat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE',0,'','Web',0,'post',0,0,0,'2020-07-24 09:54:20','2020-07-24 09:53:37',1,NULL,0),(6,'关闭firewall,使用iptables','修改配置文件\nvi /etc/sysconfig/iptables \n\n重启防火墙\nsystemctl restart iptables.service',0,'','',0,'post',0,0,0,'2020-07-24 09:54:51','2020-07-24 09:54:28',1,NULL,0),(7,'既然parameter和attribute都是传递参数，为什么不直接使用parameter呢？ ','①服务器端不能通过setParameter(key， value)来添加参数，因为没有这个函数 \n所以如果需要在服务器端进行跳转，并需要想下个页面发送新的参数时，则没法实现。但是Attribute可以，可以通过setAttribute()，将值放入到request对象，然后在其他页面使用getAttribute获取对应的值，这样就达到一次请求可以在多个页面共享一些对象信息 \n\n②parameter返回值是字符串，意味着不能传递其他的对象，如Map,List，但是attribute则可以存放任意类型的Java对象\n',0,'Springboot','',0,'post',0,0,0,'2020-07-24 09:55:27','2020-07-24 09:54:56',1,NULL,0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_api`
--

DROP TABLE IF EXISTS `auth_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_api` (
  `api_id` int NOT NULL AUTO_INCREMENT,
  `api_type` varchar(255) DEFAULT '' COMMENT 'API类型',
  `api_path` varchar(255) NOT NULL DEFAULT '',
  `project_type` varchar(64) NOT NULL DEFAULT '' COMMENT '类目权限类型',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`api_id`),
  KEY `IDX_PROJECT_TYPE` (`project_type`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_api`
--

LOCK TABLES `auth_api` WRITE;
/*!40000 ALTER TABLE `auth_api` DISABLE KEYS */;
INSERT INTO `auth_api` VALUES (39,'','/v1/api/admin/article','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(40,'','/v1/api/admin/article/count','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(41,'','/v1/api/admin/auth/api/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(42,'','/v1/api/admin/auth/api/get','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(43,'','/v1/api/admin/auth/api/list','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(44,'','/v1/api/admin/auth/api/update','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(45,'','/v1/api/admin/auth/classes/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(46,'','/v1/api/admin/auth/classes/get','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(47,'','/v1/api/admin/auth/classes/update','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(48,'','/v1/api/admin/auth/content/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(49,'','/v1/api/admin/auth/content/get','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(50,'','/v1/api/admin/auth/content/list','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(51,'','/v1/api/admin/auth/content/update','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(52,'','/v1/api/admin/auth/group/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(53,'','/v1/api/admin/auth/group/get','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(54,'','/v1/api/admin/auth/group/list','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(55,'','/v1/api/admin/auth/group/update','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(56,'','/v1/api/admin/auth/item/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(57,'','/v1/api/admin/auth/item/assign/api','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(58,'','/v1/api/admin/auth/item/get','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(59,'','/v1/api/admin/auth/item/list','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(60,'','/v1/api/admin/auth/item/update','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(61,'','/v1/api/admin/auth/login','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(62,'','/v1/api/admin/auth/logout','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(63,'','/v1/api/admin/auth/project/project_list','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(64,'','/v1/api/admin/auth/reset/password','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(65,'','/v1/api/admin/auth/reset/user','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(66,'','/v1/api/admin/auth/role/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(67,'','/v1/api/admin/auth/role/assign/api','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(68,'','/v1/api/admin/auth/role/assign/content','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(69,'','/v1/api/admin/auth/role/assign/item','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(70,'','/v1/api/admin/auth/role/assign/user','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(71,'','/v1/api/admin/auth/role/get','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(72,'','/v1/api/admin/auth/role/list','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(73,'','/v1/api/admin/auth/role/update','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(74,'','/v1/api/admin/auth/user/add','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(75,'','/v1/api/admin/auth/user/assign/role','dice',0,NULL,'2020-01-06 10:24:42',NULL,'2020-01-06 10:24:42'),(76,'','/v1/api/admin/auth/user/get','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(77,'','/v1/api/admin/auth/user/list','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(78,'','/v1/api/admin/auth/user/list/all','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(79,'','/v1/api/admin/auth/user/update','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(80,'','/v1/api/admin/auth/user_info','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(81,'','/v1/api/admin/comment','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(82,'','/v1/api/admin/comment/count','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(83,'','/v1/api/admin/media','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(84,'','/v1/api/admin/media/upload','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(85,'','/v1/api/admin/meta','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(86,'','/v1/api/admin/option/all','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(87,'','/v1/api/admin/option/save','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(88,'','/v1/api/admin/page','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(89,'','/v1/api/admin/snippet','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(90,'','/v1/api/admin/snippet/snippet_title','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(91,'','/v1/api/archive','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(92,'','/v1/api/article','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(93,'','/v1/api/category','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(94,'','/v1/api/comment','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(95,'','/v1/api/comment/assess','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(96,'','/v1/api/option','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(97,'','/v1/api/page','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43'),(98,'','/v1/api/tag','dice',0,NULL,'2020-01-06 10:24:43',NULL,'2020-01-06 10:24:43');
/*!40000 ALTER TABLE `auth_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_classes`
--

DROP TABLE IF EXISTS `auth_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_classes` (
  `classes_id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `classes_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名',
  `classes_url` varchar(255) NOT NULL,
  `group_id` int NOT NULL COMMENT '所属项目',
  `order` int DEFAULT NULL,
  `is_display` int DEFAULT NULL COMMENT '显示状态（0不显示，1显示）',
  `style` varchar(255) DEFAULT NULL,
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`classes_id`),
  KEY `IDX_GROUP_ID` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_classes`
--

LOCK TABLES `auth_classes` WRITE;
/*!40000 ALTER TABLE `auth_classes` DISABLE KEYS */;
INSERT INTO `auth_classes` VALUES (1,'文章列表','/blog/article',1,0,1,'',0,NULL,'2019-12-24 07:13:20',NULL,'2019-12-24 07:13:20'),(2,'评论列表','/blog/comment',1,0,1,'',0,NULL,'2019-12-24 07:48:57',NULL,'2019-12-24 07:48:57'),(3,'标签分类','/blog/tag',1,0,1,'',0,NULL,'2019-12-24 07:49:06',NULL,'2019-12-24 07:49:06'),(4,'页面列表','/blog/page',1,0,1,'',0,NULL,'2019-12-24 07:49:15',NULL,'2019-12-24 07:49:15'),(5,'网站设置','/blog/setting',1,0,1,'',0,NULL,'2019-12-24 07:49:24',NULL,'2019-12-24 07:49:24'),(6,'代码段','/snippet/index',2,0,1,'',0,NULL,'2019-12-24 07:52:39',NULL,'2019-12-24 07:52:39'),(7,'媒体库','/media-library/index',2,0,1,'',0,NULL,'2019-12-24 07:54:28',NULL,'2019-12-24 07:54:28'),(8,'用户列表','/auth/user/list',4,0,1,'',0,NULL,'2019-12-24 07:55:44',NULL,'2019-12-24 07:55:44'),(9,'菜单管理','/auth/menu/list',4,0,1,'',0,NULL,'2019-12-24 07:56:23',NULL,'2019-12-24 07:56:23'),(11,'API管理','',4,0,1,'',0,NULL,'2020-01-06 10:22:48',NULL,'2020-01-06 10:22:48'),(12,'角色管理','',4,0,1,'',0,NULL,'2020-01-07 13:21:23',NULL,'2020-01-07 13:21:23'),(13,'内容管理','',4,0,1,'',0,NULL,'2020-01-07 14:10:50',NULL,'2020-01-07 14:10:50');
/*!40000 ALTER TABLE `auth_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_content`
--

DROP TABLE IF EXISTS `auth_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_type` varchar(255) NOT NULL DEFAULT '',
  `content_type` varchar(255) NOT NULL DEFAULT '',
  `content_name` varchar(255) NOT NULL DEFAULT '',
  `content_value` varchar(255) DEFAULT NULL,
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_CONTENT_TYPE` (`content_type`),
  KEY `IDX_PROJECT_TYPE` (`project_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_content`
--

LOCK TABLES `auth_content` WRITE;
/*!40000 ALTER TABLE `auth_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `group_url` varchar(255) NOT NULL DEFAULT '',
  `project_type` varchar(16) NOT NULL DEFAULT '' COMMENT '系统类型',
  `order` int DEFAULT NULL,
  `is_display` int DEFAULT NULL COMMENT '显示状态（0不显示，1显示）',
  `style` varchar(255) DEFAULT NULL,
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  PRIMARY KEY (`group_id`),
  KEY `IDX_PROJECT_TYPE` (`project_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'博客','','dice',0,1,'',0,NULL,'2019-12-23 09:56:50',NULL,'2019-12-23 09:56:50'),(2,'工具','','dice',0,1,'',0,NULL,'2019-12-23 10:08:01',NULL,'2019-12-23 10:08:01'),(4,'权限','','dice',0,1,'',0,NULL,'2019-12-23 10:25:39',NULL,'2019-12-23 10:25:39');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item` (
  `item_id` int NOT NULL AUTO_INCREMENT COMMENT '权限项ID',
  `item_name` varchar(255) NOT NULL COMMENT '权限项名称',
  `item_code` varchar(255) NOT NULL,
  `classes_id` int NOT NULL,
  `order` int DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `auto_flag` tinyint DEFAULT NULL,
  `outer_url` varchar(1000) DEFAULT NULL,
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `IDX_ITEM_CODE` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES (1,'新增文章','/blog/article/new',1,0,NULL,NULL,'',0,NULL,'2019-12-24 08:23:19',NULL,'2019-12-24 08:23:19'),(2,'编辑文章','/blog/article/edit',1,0,NULL,NULL,'',0,NULL,'2019-12-24 09:31:55',NULL,'2019-12-24 09:31:55'),(3,'用户列表','/auth/user/list',8,0,NULL,NULL,'',0,NULL,'2019-12-31 05:40:22',NULL,'2019-12-31 05:40:22'),(4,'分配角色','/auth/user/assign/role',8,0,NULL,NULL,'',0,NULL,'2019-12-31 05:41:49',NULL,'2019-12-31 05:41:49'),(5,'用户编辑','/auth/user/update',8,0,NULL,NULL,'',0,NULL,'2019-12-31 05:43:09',NULL,'2019-12-31 05:43:09'),(6,'添加用户','/auth/user/add',8,0,NULL,NULL,'',0,NULL,'2019-12-31 05:49:13',NULL,'2019-12-31 05:49:13'),(7,'添加页面分组','/auth/menu/addPageGroup',9,0,NULL,NULL,'',0,NULL,'2020-01-06 07:15:10',NULL,'2020-01-06 07:15:10'),(8,'添加页面','/auth/menu/addPage',9,0,NULL,NULL,'',0,NULL,'2020-01-06 07:16:30',NULL,'2020-01-06 07:16:30'),(9,'添加功能','/auth/menu/addItem',9,0,NULL,NULL,'',0,NULL,'2020-01-06 07:17:09',NULL,'2020-01-06 07:17:09'),(10,'编辑','/auth/menu/edit',9,0,NULL,NULL,'',0,NULL,'2020-01-06 07:19:45',NULL,'2020-01-06 07:19:45'),(11,'删除文章','/blog/article/delete',1,0,NULL,NULL,'',0,NULL,'2020-01-06 07:26:21',NULL,'2020-01-06 07:26:21'),(12,'删除评论','/blog/comment/delete',2,0,NULL,NULL,'',0,NULL,'2020-01-06 07:29:51',NULL,'2020-01-06 07:29:51'),(13,'删除标签','/blog/tag/delete',3,0,NULL,NULL,'',0,NULL,'2020-01-06 07:31:29',NULL,'2020-01-06 07:31:29'),(14,'保存标签','/blog/tag/save',3,0,NULL,NULL,'',0,NULL,'2020-01-06 07:31:59',NULL,'2020-01-06 07:31:59'),(15,'新建页面','/blog/page/new',4,0,NULL,NULL,'',0,NULL,'2020-01-06 07:34:11',NULL,'2020-01-06 07:34:11'),(16,'编辑页面','/blog/page/update',4,0,NULL,NULL,'',0,NULL,'2020-01-06 07:34:29',NULL,'2020-01-06 07:34:29'),(17,'删除页面','/blog/page/delete',4,0,NULL,NULL,'',0,NULL,'2020-01-06 07:34:47',NULL,'2020-01-06 07:34:47'),(18,'保存设置','/blog/setting/save',5,0,NULL,NULL,'',0,NULL,'2020-01-06 07:43:35',NULL,'2020-01-06 07:43:35'),(19,'邮箱设置','/blog/setting/mailInfo',5,0,NULL,NULL,'',0,NULL,'2020-01-06 07:46:42',NULL,'2020-01-06 07:46:42'),(20,'上传','/tool/media/upload',7,0,NULL,NULL,'',0,NULL,'2020-01-06 07:52:47',NULL,'2020-01-06 07:52:47'),(21,'菜单列表','/auth/menu/list',9,0,NULL,NULL,'',0,NULL,'2020-01-06 09:58:38',NULL,'2020-01-06 09:58:38'),(22,'添加API','/auth/api/add',11,0,NULL,NULL,'',0,NULL,'2020-01-06 10:23:36',NULL,'2020-01-06 10:23:36'),(23,'API 列表','/auth/api/list',11,0,NULL,NULL,'',0,NULL,'2020-01-06 10:56:58',NULL,'2020-01-06 10:56:58'),(24,'列表','/auth/role/list',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:28:46',NULL,'2020-01-07 13:28:46'),(25,'新增角色','/auth/role/list/add',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:35:06',NULL,'2020-01-07 13:35:06'),(26,'角色编辑','/auth/role/update',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:35:43',NULL,'2020-01-07 13:35:43'),(27,'分配API','/auth/role/assign_api',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:36:36',NULL,'2020-01-07 13:36:36'),(28,'分配内容','/auth/role/assign_content',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:37:15',NULL,'2020-01-07 13:37:15'),(29,'分配用户','/auth/role/assign_user',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:40:38',NULL,'2020-01-07 13:40:38'),(30,'分配操作项','/auth/role/assign_item',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:41:23',NULL,'2020-01-07 13:41:23'),(31,'查看操作项','/auth/role/show_item',12,0,NULL,NULL,'',0,NULL,'2020-01-07 13:42:30',NULL,'2020-01-07 13:42:30'),(32,'新增内容','/auth/conent/add',13,0,NULL,NULL,'',0,NULL,'2020-01-07 14:11:01',NULL,'2020-01-07 14:11:01'),(33,'更新内容','/auth/content/update',13,0,NULL,NULL,'',0,NULL,'2020-01-07 14:14:42',NULL,'2020-01-07 14:14:42'),(34,'编辑 API','/auth/api/update',11,0,NULL,NULL,'',0,NULL,'2020-01-07 14:17:48',NULL,'2020-01-07 14:17:48'),(35,'媒体列表','/tool/media/list',7,0,NULL,NULL,'',0,NULL,'2020-01-07 14:19:56',NULL,'2020-01-07 14:19:56'),(36,'删除媒体','/tool/media/delete',7,0,NULL,NULL,'',0,NULL,'2020-01-07 14:30:23',NULL,'2020-01-07 14:30:23'),(37,'所有权限','/tool/snippet',6,0,NULL,NULL,'',0,NULL,'2020-01-07 14:37:20',NULL,'2020-01-07 14:37:20'),(38,'列表','/blog/page/list',4,0,NULL,NULL,'',0,NULL,'2020-01-07 14:46:12',NULL,'2020-01-07 14:46:12'),(39,'列表','/blog/comment/list',2,0,NULL,NULL,'',0,NULL,'2020-01-07 14:48:43',NULL,'2020-01-07 14:48:43'),(40,'列表','/blog/article/list',1,0,NULL,NULL,'',0,NULL,'2020-01-07 14:50:44',NULL,'2020-01-07 14:50:44'),(41,'列表','/blog/setting/list',5,0,NULL,NULL,'',0,NULL,'2020-01-09 10:41:22',NULL,'2020-01-09 10:41:22');
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rel_item_api`
--

DROP TABLE IF EXISTS `auth_rel_item_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rel_item_api` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL COMMENT '操作项id',
  `api_id` int NOT NULL COMMENT 'api id',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ITEM_API` (`item_id`,`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rel_item_api`
--

LOCK TABLES `auth_rel_item_api` WRITE;
/*!40000 ALTER TABLE `auth_rel_item_api` DISABLE KEYS */;
INSERT INTO `auth_rel_item_api` VALUES (2,1,1,0,NULL,'2019-12-26 08:58:28',NULL,'2019-12-26 08:58:28'),(4,4,5,0,NULL,'2019-12-31 05:56:51',NULL,'2019-12-31 05:56:51'),(5,4,32,0,NULL,'2019-12-31 05:56:51',NULL,'2019-12-31 05:56:51'),(6,4,33,0,NULL,'2019-12-31 05:56:51',NULL,'2019-12-31 05:56:51'),(7,4,27,0,NULL,'2019-12-31 05:56:51',NULL,'2019-12-31 05:56:51'),(8,5,3,0,NULL,'2019-12-31 05:57:28',NULL,'2019-12-31 05:57:28'),(9,5,2,0,NULL,'2019-12-31 05:57:28',NULL,'2019-12-31 05:57:28'),(10,6,4,0,NULL,'2019-12-31 05:58:32',NULL,'2019-12-31 05:58:32'),(12,10,34,0,NULL,'2020-01-06 10:04:27',NULL,'2020-01-06 10:04:27'),(13,10,11,0,NULL,'2020-01-06 10:04:28',NULL,'2020-01-06 10:04:28'),(15,22,63,0,NULL,'2020-01-06 10:25:20',NULL,'2020-01-06 10:25:20'),(17,21,63,0,NULL,'2020-01-06 10:50:39',NULL,'2020-01-06 10:50:39'),(18,21,59,0,NULL,'2020-01-06 10:50:39',NULL,'2020-01-06 10:50:39'),(19,21,54,0,NULL,'2020-01-06 10:50:39',NULL,'2020-01-06 10:50:39'),(20,3,72,0,NULL,'2020-01-06 10:53:32',NULL,'2020-01-06 10:53:32'),(21,3,77,0,NULL,'2020-01-06 10:53:32',NULL,'2020-01-06 10:53:32'),(22,23,43,0,NULL,'2020-01-06 10:58:49',NULL,'2020-01-06 10:58:49'),(26,35,83,0,NULL,'2020-01-07 14:20:18',NULL,'2020-01-07 14:20:18'),(29,37,90,0,NULL,'2020-01-07 14:41:16',NULL,'2020-01-07 14:41:16'),(30,37,89,0,NULL,'2020-01-07 14:41:16',NULL,'2020-01-07 14:41:16'),(31,37,85,0,NULL,'2020-01-07 14:41:16',NULL,'2020-01-07 14:41:16'),(32,38,88,0,NULL,'2020-01-07 14:46:32',NULL,'2020-01-07 14:46:32'),(33,39,81,0,NULL,'2020-01-07 14:49:13',NULL,'2020-01-07 14:49:13'),(35,24,78,0,NULL,'2020-01-27 10:05:52',NULL,'2020-01-27 10:05:52'),(36,24,50,0,NULL,'2020-01-27 10:05:52',NULL,'2020-01-27 10:05:52'),(37,40,39,0,NULL,'2020-01-27 10:06:38',NULL,'2020-01-27 10:06:38');
/*!40000 ALTER TABLE `auth_rel_item_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rel_role_api`
--

DROP TABLE IF EXISTS `auth_rel_role_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rel_role_api` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `api_id` int NOT NULL COMMENT '权限项id',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ROLE_API` (`role_id`,`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rel_role_api`
--

LOCK TABLES `auth_rel_role_api` WRITE;
/*!40000 ALTER TABLE `auth_rel_role_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rel_role_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rel_role_content`
--

DROP TABLE IF EXISTS `auth_rel_role_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rel_role_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `content_id` int NOT NULL COMMENT '权限项id',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ROLE_CONTENT` (`role_id`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rel_role_content`
--

LOCK TABLES `auth_rel_role_content` WRITE;
/*!40000 ALTER TABLE `auth_rel_role_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rel_role_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rel_role_item`
--

DROP TABLE IF EXISTS `auth_rel_role_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rel_role_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色id',
  `item_id` int NOT NULL COMMENT '权限项id',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ROLE_ITEM` (`role_id`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rel_role_item`
--

LOCK TABLES `auth_rel_role_item` WRITE;
/*!40000 ALTER TABLE `auth_rel_role_item` DISABLE KEYS */;
INSERT INTO `auth_rel_role_item` VALUES (293,2,40,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(294,2,38,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(295,2,39,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(296,2,35,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(297,2,6,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(298,2,37,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(299,2,3,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(300,2,6,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(301,2,21,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(302,2,31,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(303,2,24,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55'),(304,2,23,0,NULL,'2020-01-27 10:49:55',NULL,'2020-01-27 10:49:55');
/*!40000 ALTER TABLE `auth_rel_role_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rel_role_user`
--

DROP TABLE IF EXISTS `auth_rel_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rel_role_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_USER_ROLE` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rel_role_user`
--

LOCK TABLES `auth_rel_role_user` WRITE;
/*!40000 ALTER TABLE `auth_rel_role_user` DISABLE KEYS */;
INSERT INTO `auth_rel_role_user` VALUES (1,1,1,0,NULL,'2019-12-31 05:33:31',NULL,'2019-12-31 05:33:31'),(10,2,2,0,NULL,'2020-01-27 10:59:31',NULL,'2020-01-27 10:59:31');
/*!40000 ALTER TABLE `auth_rel_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名',
  `user_type` int NOT NULL COMMENT '用户类型',
  `role_type` int NOT NULL COMMENT '角色类型 1:管理员 2:用户',
  `project_type` varchar(255) DEFAULT NULL COMMENT '系统类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  `creator` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` int DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role`
--

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;
INSERT INTO `auth_role` VALUES (1,'管理员',1,1,'dice','',0,NULL,'2019-12-30 08:02:14',NULL,'2019-12-30 08:02:14'),(2,'Demo 用户',1,2,'dice','',0,NULL,'2019-12-30 10:48:44',NULL,'2019-12-30 10:48:44');
/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `p_id` int DEFAULT NULL,
  `content` text NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `agree` int NOT NULL DEFAULT '0',
  `disagree` int NOT NULL DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,NULL,'## 测试评论\n这是我的网址[Dice](http://bihell.com)','tpxcer','tpxcer@outlook.com','https://bihell.com',1,0,'0.0.0.1','',0,'2020-07-19 07:04:34');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_project`
--

DROP TABLE IF EXISTS `dim_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL COMMENT '产品类型',
  `type_name` varchar(255) DEFAULT NULL COMMENT '产品名',
  `is_display` tinyint(1) DEFAULT NULL COMMENT '是否在顶部显示',
  `style` text,
  `domain` varchar(255) DEFAULT NULL COMMENT '系统域名',
  PRIMARY KEY (`id`),
  KEY `IDX_TYPE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_project`
--

LOCK TABLES `dim_project` WRITE;
/*!40000 ALTER TABLE `dim_project` DISABLE KEYS */;
INSERT INTO `dim_project` VALUES (1,'dice','Dice',1,NULL,NULL);
/*!40000 ALTER TABLE `dim_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `data` text,
  `message` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `url` varchar(1023) NOT NULL,
  `thumb_url` varchar(1023) DEFAULT NULL,
  `suffix` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta`
--

DROP TABLE IF EXISTS `meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta`
--

LOCK TABLES `meta` WRITE;
/*!40000 ALTER TABLE `meta` DISABLE KEYS */;
INSERT INTO `meta` VALUES (3,'Vue','tag'),(4,'Springboot','tag'),(5,'Magicavoxel','tag'),(6,'Web','category'),(7,'设计','category'),(8,'电影','category'),(9,'摄影','category'),(10,'书籍','category');
/*!40000 ALTER TABLE `meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `middle`
--

DROP TABLE IF EXISTS `middle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `middle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `a_id` int NOT NULL,
  `m_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `middle`
--

LOCK TABLES `middle` WRITE;
/*!40000 ALTER TABLE `middle` DISABLE KEYS */;
INSERT INTO `middle` VALUES (3,4,7),(4,4,3),(5,4,4),(6,5,6),(7,7,4);
/*!40000 ALTER TABLE `middle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippet_file`
--

DROP TABLE IF EXISTS `snippet_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snippet_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content` text COLLATE utf8mb4_bin,
  `language` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `tabs` int DEFAULT NULL,
  `snippet_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_snippet_files_on_snippet_id` (`snippet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snippet_file`
--

LOCK TABLES `snippet_file` WRITE;
/*!40000 ALTER TABLE `snippet_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `snippet_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_option`
--

DROP TABLE IF EXISTS `sys_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_option` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_key` varchar(100) NOT NULL,
  `option_value` varchar(1023) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_key` (`option_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_option`
--

LOCK TABLES `sys_option` WRITE;
/*!40000 ALTER TABLE `sys_option` DISABLE KEYS */;
INSERT INTO `sys_option` VALUES (1,'dice_init','true','2020-07-19 07:04:34','2020-07-19 07:04:34');
/*!40000 ALTER TABLE `sys_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `concurrent` tinyint DEFAULT NULL COMMENT '是否允许并发',
  `cron` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '定时规则',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '执行参数',
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '执行结果',
  `job_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行类',
  `job_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务组名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务名',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务说明',
  `status` int DEFAULT NULL COMMENT '状态（0无效1有效）',
  `creator` int DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间/注册时间',
  `modifier` int DEFAULT NULL COMMENT '最后更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `deleted` int DEFAULT '0' COMMENT '逻辑删除标识(0.未删除,1.已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,0,'0/6 * * * * ?','{\n\"appname\": \"dice\",\n\"version\":2\n}','2020-01-27 14:54:24','执行成功','com.bihell.dice.service.task.job.HelloJob','default','测试任务1','测试任务1',0,1,'2018-12-28 01:54:00',-1,'2019-03-27 03:47:11',0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_log`
--

DROP TABLE IF EXISTS `task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_success` int DEFAULT NULL COMMENT '执行结果（成功:1、失败:0)',
  `id_task` bigint DEFAULT NULL,
  `job_exception` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '抛出异常',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_log`
--

LOCK TABLES `task_log` WRITE;
/*!40000 ALTER TABLE `task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password_md5` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `screen_name` varchar(45) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dice','3e6693e83d186225b85b09e71c974d2d','tpxcer@outlook.com','admin','2019-05-15 18:24:35','2020-07-24 06:51:30'),(2,'demo','3e6693e83d186225b85b09e71c974d2d','demo@bihell.com','demo用户','2019-12-27 07:34:01','2020-01-07 13:10:34');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-24 17:56:13
