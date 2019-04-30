# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 127.0.0.1 (MySQL 5.7.25)
# Base de données: o2o
# Temps de génération: 2019-04-30 06:42:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table o2o_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_area`;

CREATE TABLE `o2o_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table o2o_bis
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_bis`;

CREATE TABLE `o2o_bis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `license_logo` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '',
  `bank_info` varchar(50) NOT NULL DEFAULT '',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(50) NOT NULL DEFAULT '',
  `bank_user` varchar(50) NOT NULL DEFAULT '',
  `faren` varchar(20) NOT NULL DEFAULT '',
  `faren_tel` varchar(20) NOT NULL DEFAULT '',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_bis` WRITE;
/*!40000 ALTER TABLE `o2o_bis` DISABLE KEYS */;

INSERT INTO `o2o_bis` (`id`, `name`, `email`, `logo`, `license_logo`, `description`, `city_id`, `city_path`, `bank_info`, `money`, `bank_name`, `bank_user`, `faren`, `faren_tel`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(3,'肯打鸡','906262260@qq.com','/upload/20190422/63389f10ac57fefc909fe797436e713d.png','/upload/20190422/c3d0b4636c29ac3491e58ec70836edd2.png','<p>商家介绍</p>',3,'3,7','123',0.00,'农行','皮皮','皮皮','13012271786',0,1,1555907120,1555918943),
	(4,'测试账户','906262260@qq.com','/upload/20190422/a4f427cdded7122e52de235bc3208c84.png','/upload/20190422/2572579dfb2d7faee3a4e31b8d904f9c.jpeg','<p>等工地</p>',3,'3,4','123',0.00,'农行','皮皮2','皮皮','13012271786',0,2,1555908974,1555918738);

/*!40000 ALTER TABLE `o2o_bis` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_bis_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_bis_account`;

CREATE TABLE `o2o_bis_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bis_id` (`bis_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_bis_account` WRITE;
/*!40000 ALTER TABLE `o2o_bis_account` DISABLE KEYS */;

INSERT INTO `o2o_bis_account` (`id`, `username`, `password`, `code`, `bis_id`, `last_login_ip`, `last_login_time`, `is_main`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(1,'admin1','af67276d9e259181c6043c3b8f8abb5f','2175',3,'',1555987685,1,0,1,1555907120,1555987685),
	(2,'admin2','03533e6483dd2d0b0d77ddafe3a5aca6','9598',4,'',0,1,0,2,1555908974,1555918738);

/*!40000 ALTER TABLE `o2o_bis_account` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_bis_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_bis_location`;

CREATE TABLE `o2o_bis_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `contact` varchar(20) NOT NULL DEFAULT '',
  `xpoint` varchar(20) NOT NULL DEFAULT '',
  `ypoint` varchar(20) NOT NULL DEFAULT '',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `open_time` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `api_address` varchar(255) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_path` varchar(50) NOT NULL DEFAULT '',
  `bank_info` varchar(50) NOT NULL DEFAULT '',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `bis_id` (`bis_id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_bis_location` WRITE;
/*!40000 ALTER TABLE `o2o_bis_location` DISABLE KEYS */;

INSERT INTO `o2o_bis_location` (`id`, `name`, `logo`, `address`, `tel`, `contact`, `xpoint`, `ypoint`, `bis_id`, `open_time`, `content`, `is_main`, `api_address`, `city_id`, `city_path`, `category_id`, `category_path`, `bank_info`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(1,'肯打鸡','/upload/20190422/63389f10ac57fefc909fe797436e713d.png','天津市河北区三马路日盈里','13012271786','皮皮','117.20472669803','39.165717092435',3,12,'<p>富森森萨</p>',1,'天津市河北区三马路日盈里',3,'3,7',2,'2,3','',0,1,1555907120,1555918943),
	(2,'2号店','/upload/20190422/a4f427cdded7122e52de235bc3208c84.png','天津市河北区三马路日盈里','13012271786','皮皮','117.20472669803','39.165717092435',4,12,'<p>广丰僧僧的</p>',1,'天津市河北区三马路日盈里',3,'3,4',2,'2,3','',0,1,1555908974,1555918738),
	(3,'ceiu','/upload/20190423/8397393e2a08590286ea47a3ac7db2ec.jpg','天津市河北区三马路日盈里','13012271786','皮皮','117.2009762851','39.168199292052',3,12,'<p>sfafasf</p>',0,'天津市河北区三马路日方里',1,'1,2',2,'2,3','',0,1,1555989766,1555989766);

/*!40000 ALTER TABLE `o2o_bis_location` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_category`;

CREATE TABLE `o2o_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_category` WRITE;
/*!40000 ALTER TABLE `o2o_category` DISABLE KEYS */;

INSERT INTO `o2o_category` (`id`, `name`, `parent_id`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(1,'美食',0,10,1,1491992020,1492652898),
	(2,'旅游',0,12,1,1491992054,1556085502),
	(3,'飞机',2,0,1,1491992107,0),
	(5,'阅读',0,23,-1,1491992493,1492072867),
	(6,'麻辣烫',1,0,1,1491995365,1491995365),
	(8,'拉面',1,0,1,1491995777,1491995777),
	(9,'电影',0,11,1,1492060639,1492652917),
	(10,'文艺电影',9,6,1,1492060659,1492071287),
	(11,'汽车',0,9,-1,1492075333,1493117146),
	(12,'宝马',11,0,1,1492075357,1492075357),
	(13,'文学名著',5,0,1,1492078888,1492078888),
	(14,'哈利波特',9,0,1,1492079999,1492079999),
	(15,'休闲',0,0,1,1492777548,1492777548),
	(16,'娱乐',0,0,1,1492777558,1492777558),
	(17,'酒店',0,5,1,1492777621,1492777633),
	(18,'西餐',1,0,1,1492961252,1492961252),
	(19,'自助烤肉',1,0,1,1492961810,1492961810),
	(20,'火锅',1,0,1,1492962070,1492962070);

/*!40000 ALTER TABLE `o2o_category` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_city`;

CREATE TABLE `o2o_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `uname` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_city` WRITE;
/*!40000 ALTER TABLE `o2o_city` DISABLE KEYS */;

INSERT INTO `o2o_city` (`id`, `name`, `uname`, `parent_id`, `is_default`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(1,'北京','beijing',0,0,0,1,1474013959,0),
	(2,'朝阳','chaoyang',1,0,0,1,1492132250,0),
	(3,'江西','jiangxi',0,0,0,1,1492132287,0),
	(4,'南昌','nanchang',3,1,0,1,1492132318,0),
	(5,'上饶','shangrao',3,0,0,1,1492132347,0),
	(6,'抚州','fuzhou',3,0,0,1,1492132369,0),
	(7,'景德镇','jingdezhen',3,0,0,1,1492132394,0),
	(8,'河北','hebei',0,0,0,1,1492132500,0),
	(9,'廊坊','langfang',8,0,0,1,1492132600,0);

/*!40000 ALTER TABLE `o2o_city` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_coupons`;

CREATE TABLE `o2o_coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:生成未发送给用户 \r\n		1:已经发送给用户 2：用户已经使用 3 禁用',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `deal_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_coupons` WRITE;
/*!40000 ALTER TABLE `o2o_coupons` DISABLE KEYS */;

INSERT INTO `o2o_coupons` (`id`, `sn`, `password`, `user_id`, `deal_id`, `order_id`, `status`, `create_time`, `update_time`, `deal_count`)
VALUES
	(102,'1494127003133162325','50207',16,19,94,2,1494127003,1494127003,1),
	(103,'1494129026908310540','62209',16,19,95,2,1494129026,1494129026,1),
	(104,'1494129132231921359','88367',16,19,96,2,1494129132,1494129132,1),
	(105,'1494129315884357750','64259',16,19,97,2,1494129315,1494129315,1),
	(106,'1494129415712112751','81903',18,19,98,0,1494129415,1494129415,1),
	(107,'1494129596451540987','74237',18,19,99,0,1494129596,1494129596,1),
	(108,'1494129612923431988','55073',18,19,100,1,1494129613,1494129613,1),
	(109,'1494406228693463802','84587',18,24,107,1,1494406228,1494406228,10),
	(110,'1494406434695196656','47025',17,24,108,1,1494406434,1494406434,99),
	(111,'1494410232238701100','12949',17,24,115,1,1494410232,1494410232,15),
	(112,'1494638511962430779','10821',16,15,116,1,1494638512,1494638512,10);

/*!40000 ALTER TABLE `o2o_coupons` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_deal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_deal`;

CREATE TABLE `o2o_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `se_category_id` varchar(50) NOT NULL,
  `category_path` varchar(50) NOT NULL DEFAULT '0',
  `bis_id` int(11) NOT NULL DEFAULT '0',
  `location_ids` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `origin_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `current_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `buy_count` int(11) NOT NULL DEFAULT '0',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `coupons_begin_time` int(11) NOT NULL DEFAULT '0',
  `coupons_end_time` int(11) NOT NULL DEFAULT '0',
  `bis_account_id` int(10) NOT NULL DEFAULT '0',
  `xpoint` varchar(20) NOT NULL DEFAULT '',
  `ypoint` varchar(20) NOT NULL DEFAULT '',
  `balance_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `notes` text NOT NULL,
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL,
  `se_city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `se_category_id` (`category_path`),
  KEY `city_id` (`city_id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_deal` WRITE;
/*!40000 ALTER TABLE `o2o_deal` DISABLE KEYS */;

INSERT INTO `o2o_deal` (`id`, `name`, `category_id`, `se_category_id`, `category_path`, `bis_id`, `location_ids`, `image`, `description`, `start_time`, `end_time`, `origin_price`, `current_price`, `city_id`, `buy_count`, `total_count`, `coupons_begin_time`, `coupons_end_time`, `bis_account_id`, `xpoint`, `ypoint`, `balance_price`, `notes`, `list_order`, `status`, `create_time`, `update_time`, `city_path`, `se_city_id`)
VALUES
	(15,'铁木真',1,'1,18,19','8',3,'1,2','\\upload\\20170423\\37ba1d57a67c736cd9eaa77ee6a1ac74.jpg','&lt;p&gt;单人烤肉自助1份，免费停车！免费 Wifi！&lt;br/&gt;&lt;/p&gt;',1556396880,1566398647,88.00,77.00,4,11,99,1492920480,1494043740,9,'116.71203300041','39.551346099335',0.00,'&lt;p&gt;单人烤肉自助1份&lt;/p&gt;',0,1,1492920604,1492920638,'8,9',9),
	(16,'柏尔森烤肉自助餐厅团购',1,'1,19','19',3,'1','\\upload\\20170424\\47e4e45bf6929ca6dea9f31b984ffc29.jpg','&lt;p&gt;&lt;a mon=&quot;element=&amp;amp;position=3&amp;amp;element_type=breadCrumbs&quot; style=&quot;padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; color: rgb(255, 102, 153);&quot;&gt;柏尔森烤肉自助餐厅团购&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',1556396880,1566398647,42.90,29.90,4,10,989,1492963920,1494000720,11,'116.70498264872','39.538246682078',0.00,'&lt;table class=&quot;consume&quot;&gt;&lt;tbody style=&quot;padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;tr style=&quot;padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;&quot; class=&quot;firstRow&quot;&gt;&lt;td style=&quot;padding: 0px; margin: 0px; border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-bottom-color: rgb(240, 240, 240); outline: 0px; font-style: inherit; font-family: songti; font-size: 14px; vertical-align: middle; color: rgb(88, 88, 88);&quot;&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;团购用户暂不享受店内其他优惠&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;每张糯米券限1人使用&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;每次消费不限使用糯米券张数，可叠加使用&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;1米(不含)以下的儿童免费， 1米(含)-1.3米(含)的儿童28元/位 ,70周岁(含)以上的老人凭有效证件可享受35元/位&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;自助餐仅限堂食，不提供打包服务&lt;br/&gt;部分菜品因时令原因有所不同，请以店内当日实际供应为准&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;啤酒中午免费，晚餐是收费的&lt;br/&gt;在公共场所娱乐消费时，请您妥善保管好自己随身携带的财物，以防丢失；注意人身安全，避免发生危险&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',0,1,1492964009,1492964024,'8,9',9),
	(17,'虾吃虾涮团购',1,'1,20','20',3,'2','\\upload\\20170424\\b08341d62ece7d903b94acac9078c921.jpg','&lt;p&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;二大街店2人套餐！免费WiFi，！&lt;/span&gt;&lt;/p&gt;',1492964100,1566398647,138.00,66.00,4,0,99,1492964160,1494000960,16,'116.72938960942','39.540571622006',0.00,'&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;无停车位&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;提供免费WiFi&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;本单堂食外带均可&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;商家免费提供餐后打包服务&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',0,1,1492964201,1492964238,'8,9',9),
	(18,'春园烤肉团购',1,'1,19','19',3,'1','\\upload\\20170424\\65277376ecc6d26af0065f43ff830ce6.jpg','&lt;p&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;价值55元自助餐1位！免费WiFi&lt;/span&gt;&lt;/p&gt;',1492964280,1566398647,55.00,25.00,4,0,99,1492964280,1494001080,13,'116.73145463413','39.534755473004',0.00,'&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;用餐时间2小时&lt;br/&gt;需20押金&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',0,-1,1492964362,1494731085,'8,9',9),
	(19,'丁丁洋回转自助火锅团购',1,'1,20','20',3,'3','\\upload\\20170424\\0209c412af58a2ff5c5136e72072fb07.jpg','&lt;p&gt;&lt;span style=&quot;color: rgb(88, 88, 88); font-family: songti; font-size: 14px; line-height: 39px; text-indent: 10px;&quot;&gt;单人火锅自助&lt;/span&gt;&lt;/p&gt;',1492964580,1566398647,36.90,26.90,4,28,99,1492964580,1494001380,12,'116.71410446597','39.528431526829',0.00,'&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;自助餐仅限堂食，不提供打包服务&lt;br/&gt;部分菜品因时令原因有所不同，请以店内当日实际供应为准&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',0,1,1492964675,1492964691,'8,9',9),
	(20,'伊尔曼都烤肉团购',1,'1,18','1',3,'2','\\upload\\20170424\\8ea85403d9984b920c69684c4f2b5227.jpg','&lt;p&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;仅售26.9元&lt;/span&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;，价值58元平日单人自助1份！免费停车，免费WiFi！&lt;/span&gt;&lt;/p&gt;',1556396880,1566398647,52.00,26.90,4,0,99,1492964760,1497025560,15,'116.71281826585','39.526693586707',0.00,'&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;自助含： 烤肉、蔬菜、水果、甜点、汤类、饮料不限量供应 - 用餐时限：最多可用餐2小时&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',0,1,1492964869,1493995476,'8,9',9),
	(22,'好伦哥的团购',1,'1,20|19|18','1,20,19,18',3,'2,3','\\upload\\20170425\\bb029326ec238f2bb5b8b4d18d6d302f.jpg','&lt;p&gt;描述&lt;/p&gt;',1492964760,1566398647,88.00,77.00,4,0,99,1491129360,1494066960,10,'116.82766516915','39.971231993239',0.00,'&lt;p&gt;须知&lt;/p&gt;',0,1,1493116582,1493118129,'8,9',9),
	(23,'好伦哥的另一个团购',1,'1,19|18|6','1,19,18,6',3,'2,3','\\upload\\20170425\\eee21795acdc6e86175e7fa894461b2f.jpg','&lt;p&gt;描述&lt;/p&gt;',1492964760,1566398647,78.00,77.00,4,0,99,1493117280,1494067740,10,'116.82766516915','39.971231993239',0.00,'&lt;p&gt;须知&lt;/p&gt;',0,1,1493117348,1493117348,'8,9',9),
	(24,'测试团购',1,'1,20|19|18|8|6','1,20,19,18,8,6',3,'2,3','\\upload\\20170425\\af848190fa2a4c7af724d25c5d174ad7.jpg','&lt;p&gt;描述&lt;/p&gt;',1556396880,1566398647,88.00,77.00,4,35,99,1493119020,1494069420,10,'116.82766516915','39.971231993239',0.00,'&lt;p&gt;须知&lt;/p&gt;',0,1,1493119069,1493119080,'8,9',9),
	(25,'一分钱测试购买',1,'1','1',3,'2,3','__STATIC__/index/image/faf2b2119313b07eadf19d880bd7912396dd8ce6.jpg','&lt;p&gt;一分钱测试购买&lt;/p&gt;',1558125380,1566398647,0.02,0.01,4,6345,13699,1563125380,1564075780,10,'116.82766516915','39.971231993239',0.00,'&lt;p&gt;一分钱测试购买&lt;/p&gt;',0,1,1493125413,1493125446,'8,9',9),
	(26,'测试商品1',2,'3','0',3,'1','/upload/20190423/59feae2efc40e64a5304b2becbd398ee.jpg','<p>纷纷</p>',1555994940,1566398647,2.00,3.00,4,0,1,1555994940,1555994940,1,'117.20472669803','39.165717092435',0.00,'<p>怂怂</p>',0,0,1555995150,1555995150,'',0);

/*!40000 ALTER TABLE `o2o_deal` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_featured
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_featured`;

CREATE TABLE `o2o_featured` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_featured` WRITE;
/*!40000 ALTER TABLE `o2o_featured` DISABLE KEYS */;

INSERT INTO `o2o_featured` (`id`, `type`, `title`, `image`, `url`, `description`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(1,0,'新浪体育','','77','22222',0,1,1556010349,1556161893),
	(2,1,'title','/upload/20190423/fbb6deb1f5f8b5a766d5511b05a286b3.jpg','1111','23',0,0,1556010515,1556085183);

/*!40000 ALTER TABLE `o2o_featured` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_order`;

CREATE TABLE `o2o_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) NOT NULL DEFAULT '',
  `transaction_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `pay_time` varchar(20) NOT NULL DEFAULT '',
  `payment_id` tinyint(1) NOT NULL DEFAULT '1',
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `deal_count` int(11) NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0',
  `total_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pay_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `use_type` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `send_status` tinyint(1) DEFAULT '0',
  `bis_id` int(11) NOT NULL DEFAULT '0',
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为未评价，1为已评价',
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_trade_no` (`out_trade_no`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_order` WRITE;
/*!40000 ALTER TABLE `o2o_order` DISABLE KEYS */;

INSERT INTO `o2o_order` (`id`, `out_trade_no`, `transaction_id`, `user_id`, `username`, `pay_time`, `payment_id`, `deal_id`, `deal_count`, `pay_status`, `total_price`, `pay_amount`, `status`, `referer`, `create_time`, `update_time`, `use_type`, `address`, `send_status`, `bis_id`, `is_comment`)
VALUES
	(118,'155652052231737770','',1,'pipi','',1,15,1,0,77.00,0.00,1,'http://localhost:8888/index.php/index/order/confirm.html?id=15&count=1',1556520521,1556520521,0,'',0,0,0),
	(119,'1556524797415144115','',1,'pipi','',1,16,1,0,29.00,0.00,1,'http://localhost:8888/index.php/index/order/confirm.html?id=16&count=1',1556524797,1556524797,0,'',0,0,0),
	(120,'1556524857401781575','',1,'pipi','',1,16,1,0,29.00,0.00,1,'http://localhost:8888/index.php/index/order/confirm.html?id=16&count=1',1556524857,1556524857,0,'',0,0,0),
	(121,'1556525892327954200','',1,'pipi','',1,16,1,0,29.00,0.00,1,'http://localhost:8888/index.php/index/order/confirm.html?id=16&count=1',1556525892,1556525892,0,'',0,0,0),
	(122,'1556533129551013309','',1,'pipi','',1,15,1,0,77.00,0.00,1,'http://localhost:8888/index.php/index/order/confirm.html?id=15&count=1',1556533129,1556533129,0,'',0,0,0);

/*!40000 ALTER TABLE `o2o_order` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table o2o_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `o2o_user`;

CREATE TABLE `o2o_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `list_order` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `o2o_user` WRITE;
/*!40000 ALTER TABLE `o2o_user` DISABLE KEYS */;

INSERT INTO `o2o_user` (`id`, `username`, `password`, `code`, `last_login_ip`, `last_login_time`, `email`, `mobile`, `list_order`, `status`, `create_time`, `update_time`)
VALUES
	(1,'pipi','3c37ccb27683f19f61debaf31fd3743f','890','',1556605121,'906262260@qq.com','',0,1,1556176566,1556605121),
	(4,'pipi2','76c92ccf726acd0f027cd9a480bbff83','5916','',0,'906262260@123.com','',0,1,1556177476,1556177476);

/*!40000 ALTER TABLE `o2o_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
