-- MySQL dump 10.13  Distrib 5.7.38, for osx10.17 (x86_64)
--
-- Host: localhost    Database: tl_admin
-- ------------------------------------------------------
-- Server version	5.7.38-log

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
-- Table structure for table `tl_admin`
--

DROP TABLE IF EXISTS `tl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(55) NOT NULL COMMENT '管理员名字',
  `admin_password` varchar(32) NOT NULL COMMENT '管理员密码',
  `role_id` int(11) DEFAULT NULL COMMENT '所属角色',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 禁用 1 启用',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_admin`
--

LOCK TABLES `tl_admin` WRITE;
/*!40000 ALTER TABLE `tl_admin` DISABLE KEYS */;
INSERT INTO `tl_admin` VALUES (1,'admin','275a7520d39c9a3598ee3f7d002a6872',1,1,'2019-09-03 13:31:20','2022-12-10 22:28:26',NULL),(6,'test','97ded3f09abf29de126d5106a6bb1da8',8,1,'2022-12-10 22:29:11','2022-12-10 22:29:28',NULL);
/*!40000 ALTER TABLE `tl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tl_login_log`
--

DROP TABLE IF EXISTS `tl_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_login_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `login_user` varchar(55) NOT NULL COMMENT '登录用户',
  `login_ip` varchar(15) NOT NULL COMMENT '登录ip',
  `login_area` varchar(55) DEFAULT NULL COMMENT '登录地区',
  `login_user_agent` varchar(155) DEFAULT NULL COMMENT '登录设备头',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `login_status` tinyint(1) DEFAULT '1' COMMENT '登录状态 1 成功 2 失败',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_login_log`
--

LOCK TABLES `tl_login_log` WRITE;
/*!40000 ALTER TABLE `tl_login_log` DISABLE KEYS */;
INSERT INTO `tl_login_log` VALUES (1,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','2019-10-11 16:03:07',1),(2,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','2022-10-23 17:00:12',2),(3,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','2022-10-23 17:04:24',2),(4,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','2022-10-23 17:05:08',2),(5,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','2022-10-23 17:08:57',1),(6,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36','2022-11-29 13:19:52',1),(7,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36','2022-11-29 22:09:03',1),(8,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36','2022-12-01 12:52:04',1),(9,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36','2022-12-01 15:50:07',1),(10,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-07 13:06:24',1),(11,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-07 16:20:09',1),(12,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-07 19:11:01',1),(13,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-07 21:22:13',1),(14,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-09 15:28:57',1),(15,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:23:16',1),(16,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:24:11',2),(17,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:24:23',1),(18,'test','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:25:10',1),(19,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:26:26',1),(20,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:27:28',1),(21,'test','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:27:46',2),(22,'test','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:28:00',2),(23,'test','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:28:15',2),(24,'admin','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:28:26',1),(25,'test','127.0.0.1','内网IP-内网IP','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36','2022-12-10 22:29:28',1);
/*!40000 ALTER TABLE `tl_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tl_node`
--

DROP TABLE IF EXISTS `tl_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_node` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `node_name` varchar(55) NOT NULL COMMENT '节点名称',
  `node_path` varchar(55) NOT NULL COMMENT '节点路径',
  `node_pid` int(11) NOT NULL COMMENT '所属节点',
  `node_icon` varchar(55) DEFAULT NULL COMMENT '节点图标',
  `is_menu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是菜单项 1 不是 2 是',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_node`
--

LOCK TABLES `tl_node` WRITE;
/*!40000 ALTER TABLE `tl_node` DISABLE KEYS */;
INSERT INTO `tl_node` VALUES (1,'主页','#',0,'layui-icon layui-icon-home',2,'2019-09-03 14:17:38'),(2,'后台首页','index/index',1,'',1,'2019-09-03 14:18:24'),(3,'修改密码','index/editpwd',1,'',1,'2019-09-03 14:19:03'),(4,'权限管理','#',0,'layui-icon layui-icon-template',2,'2019-09-03 14:19:34'),(5,'管理员管理','manager/index',4,'',2,'2019-09-03 14:27:42'),(6,'添加管理员','manager/addadmin',5,'',1,'2019-09-03 14:28:26'),(7,'编辑管理员','manager/editadmin',5,'',1,'2019-09-03 14:28:43'),(8,'删除管理员','manager/deladmin',5,'',1,'2019-09-03 14:29:14'),(9,'日志管理','#',0,'layui-icon layui-icon-template-1',2,'2019-10-08 16:07:36'),(11,'登录日志','log/login',9,'',2,'2019-10-08 16:26:27'),(12,'操作日志','log/operate',9,'',2,'2019-10-08 17:02:10'),(13,'角色管理','role/index',4,'',2,'2019-10-09 21:35:54'),(14,'添加角色','role/add',13,'',1,'2019-10-09 21:40:06'),(15,'编辑角色','role/edit',13,'',1,'2019-10-09 21:40:53'),(16,'删除角色','role/delete',13,'',1,'2019-10-09 21:41:07'),(17,'权限分配','role/assignauthority',13,'',1,'2019-10-09 21:41:38'),(18,'节点管理','node/index',4,'',2,'2019-10-09 21:42:06'),(19,'添加节点','node/add',18,'',1,'2019-10-09 21:42:51'),(20,'编辑节点','node/edit',18,'',1,'2019-10-09 21:43:29'),(21,'删除节点','node/delete',18,'',1,'2019-10-09 21:43:44');
/*!40000 ALTER TABLE `tl_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tl_operate_log`
--

DROP TABLE IF EXISTS `tl_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_operate_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `operator` varchar(55) NOT NULL COMMENT '操作用户',
  `operator_ip` varchar(15) NOT NULL COMMENT '操作者ip',
  `operate_method` varchar(100) NOT NULL COMMENT '操作方法',
  `operate_desc` varchar(155) NOT NULL COMMENT '操作简述',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_operate_log`
--

LOCK TABLES `tl_operate_log` WRITE;
/*!40000 ALTER TABLE `tl_operate_log` DISABLE KEYS */;
INSERT INTO `tl_operate_log` VALUES (1,'admin','127.0.0.1','manager/editadmin','编辑管理员小白','2019-10-11 14:19:21'),(2,'admin','127.0.0.1','role/assignauthority','分配权限6','2019-10-11 14:19:37'),(3,'admin','127.0.0.1','role/edit','编辑角色研发','2019-10-11 14:19:40'),(4,'admin','127.0.0.1','role/edit','编辑角色：部门经理','2019-10-11 14:21:33'),(5,'admin','127.0.0.1','node/edit','编辑节点：主页','2019-10-11 14:22:18'),(6,'admin','127.0.0.1','manager/delAdmin','删除管理员：2','2022-12-07 19:15:23'),(7,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-07 19:17:20'),(8,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-07 19:21:17'),(9,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-07 19:25:33'),(10,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-07 19:26:00'),(11,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-07 19:26:24'),(12,'admin','127.0.0.1','manager/addAdmin','添加管理员：TEST','2022-12-07 19:29:32'),(13,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-07 19:33:41'),(14,'admin','127.0.0.1','manager/addAdmin','添加管理员：test1','2022-12-07 19:34:43'),(15,'admin','127.0.0.1','manager/editAdmin','编辑管理员：test1','2022-12-07 21:28:12'),(16,'admin','127.0.0.1','manager/editAdmin','编辑管理员：test1','2022-12-07 21:42:45'),(17,'admin','127.0.0.1','manager/editAdmin','编辑管理员：test1','2022-12-07 21:52:35'),(18,'admin','127.0.0.1','manager/editAdmin','编辑管理员：test1','2022-12-07 21:52:45'),(19,'admin','127.0.0.1','role/add','添加角色：SM','2022-12-09 16:05:27'),(20,'admin','127.0.0.1','role/delete','删除角色：7','2022-12-09 16:05:35'),(21,'admin','127.0.0.1','role/add','添加角色：测试','2022-12-09 16:06:38'),(22,'admin','127.0.0.1','role/edit','编辑角色：测试','2022-12-09 16:07:49'),(23,'admin','127.0.0.1','role/edit','编辑角色：测试','2022-12-09 16:10:58'),(24,'admin','127.0.0.1','role/assignAuthority','分配权限：8','2022-12-09 16:11:40'),(25,'admin','127.0.0.1','role/assignAuthority','分配权限：8','2022-12-09 16:11:45'),(26,'admin','127.0.0.1','node/add','添加节点：测试','2022-12-09 16:19:42'),(27,'admin','127.0.0.1','node/edit','编辑节点：测试','2022-12-09 16:19:54'),(28,'admin','127.0.0.1','node/add','添加节点：测试a','2022-12-09 16:21:49'),(29,'admin','127.0.0.1','node/delete','删除节点：23','2022-12-09 16:22:22'),(30,'admin','127.0.0.1','node/delete','删除节点：22','2022-12-09 16:22:28'),(31,'admin','127.0.0.1','node/delete','删除节点：10','2022-12-09 16:45:44'),(32,'admin','127.0.0.1','role/edit','编辑角色：测试','2022-12-10 22:26:52'),(33,'admin','127.0.0.1','role/assignAuthority','分配权限：8','2022-12-10 22:27:03'),(34,'admin','127.0.0.1','manager/editAdmin','编辑管理员：test','2022-12-10 22:27:14'),(35,'admin','127.0.0.1','manager/delAdmin','删除管理员：4','2022-12-10 22:28:55'),(36,'admin','127.0.0.1','manager/delAdmin','删除管理员：5','2022-12-10 22:28:58'),(37,'admin','127.0.0.1','manager/addAdmin','添加管理员：test','2022-12-10 22:29:11');
/*!40000 ALTER TABLE `tl_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tl_role`
--

DROP TABLE IF EXISTS `tl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tl_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(55) NOT NULL COMMENT '角色名称',
  `role_node` varchar(255) NOT NULL COMMENT '角色拥有的权限节点',
  `role_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态 1 启用 2 禁用',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tl_role`
--

LOCK TABLES `tl_role` WRITE;
/*!40000 ALTER TABLE `tl_role` DISABLE KEYS */;
INSERT INTO `tl_role` VALUES (1,'超级管理员','#',1),(3,'会计','1,2,3',1),(4,'部门经理','1,2,3,4,5,6,7,8',1),(5,'DBA','1,2,3',1),(6,'研发','1,2,3,4,13,14,15,16,17,18,19,20,21,9,10,11,12',1),(8,'测试','1,2,3,9,11',1);
/*!40000 ALTER TABLE `tl_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-16 10:35:12
