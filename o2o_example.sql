/*
Navicat MySQL Data Transfer

Source Server         : localhost_wangyu
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : imooc_o2o

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-05-18 22:46:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for o2o_admin
-- ----------------------------
DROP TABLE IF EXISTS `o2o_admin`;
CREATE TABLE `o2o_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `last_login_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_admin
-- ----------------------------
INSERT INTO `o2o_admin` VALUES ('1', 'admin', 'admin', '0', '1495108805', '1495108805', '1');

-- ----------------------------
-- Table structure for o2o_area
-- ----------------------------
DROP TABLE IF EXISTS `o2o_area`;
CREATE TABLE `o2o_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_area
-- ----------------------------

-- ----------------------------
-- Table structure for o2o_bis
-- ----------------------------
DROP TABLE IF EXISTS `o2o_bis`;
CREATE TABLE `o2o_bis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `licence_logo` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '',
  `bank_info` varchar(50) NOT NULL DEFAULT '',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(50) NOT NULL DEFAULT '',
  `bank_user` varchar(50) NOT NULL DEFAULT '',
  `faren` varchar(20) NOT NULL DEFAULT '',
  `faren_tel` varchar(20) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_bis
-- ----------------------------
INSERT INTO `o2o_bis` VALUES ('13', '小明商户', '578464694@qq.com', '\\upload\\20170415\\35177232adce03e47b5ae49771541d8f.jpg', '\\upload\\20170415\\c0e3fd9844a26c029d13b20b4fb8724a.jpg', '这里是商铺介绍', '0', '0,0', '88885555', '0.00', '农业银行', '小明', '小明', '15075652703', '0', '1', '1492243992', '1492515313');
INSERT INTO `o2o_bis` VALUES ('14', '小小明商户', '578464694@qq.com', '\\upload\\20170415\\68609fe5e22d8dbcfafe72f4cb7f7329.jpg', '\\upload\\20170415\\0661b02442501e57de81b54231b5284b.jpg', '这里是商铺介绍', '1', '1,2', '7676655', '0.00', '农业银行', '小小明', '小小明', '15075652703', '0', '1', '1492248598', '1492515248');
INSERT INTO `o2o_bis` VALUES ('15', '小红商户', '578464694@qq.com', '\\upload\\20170415\\3d219b9a50fd2cb98ee301fd96a4bf26.jpg', '\\upload\\20170415\\51fc7807e7c00c1b161223ecbbdf8ec9.jpg', '<p>店铺介绍</p>', '8', '8,9', '8888888', '0.00', '农业银行', '小红', '小红', '13931644281', '0', '1', '1492266832', '1492515216');
INSERT INTO `o2o_bis` VALUES ('19', '柯南商户', '578464694@qq.com', '\\upload\\20170415\\aefec9b158b10e2e92a4274863b59a7e.jpg', '\\upload\\20170415\\5477609d1236acef16120f6e8c2ea55d.jpg', '店铺介绍', '8', '8,9', '8888', '0.00', '农业', '柯南', '柯南', '15075652703', '0', '1', '1492268752', '1492318901');
INSERT INTO `o2o_bis` VALUES ('20', '柯北商户', '578464694@qq.com', '\\upload\\20170415\\fc075f60c4c92233ada22cd10426830f.jpg', '\\upload\\20170415\\d437f9eecc2b470c5912e2b9a07896ce.jpg', '店铺介绍', '3', '3,7', '8888', '0.00', '农业', '柯北', '柯北', '15075652703', '0', '2', '1492268859', '1492515529');
INSERT INTO `o2o_bis` VALUES ('21', '柯西商户', '578464694@qq.com', '\\upload\\20170416\\fd728f8aaf8759b2141bac428601b400.jpg', '\\upload\\20170416\\8c32a1e588dfa06afc0643891f14c058.jpg', '<p>dddfd</p>', '8', '8,9', '344444', '0.00', '农业', '柯西', '柯西', '15075652703', '0', '2', '1492310543', '1492515505');
INSERT INTO `o2o_bis` VALUES ('22', '在下坂本，有何贵干', '578464694@qq.com', '\\upload\\20170416\\4e77f4385ef2cc205e3e30418ac1efd4.jpg', '\\upload\\20170416\\41ce37aa038387fd955cf091ef72afa9.jpg', '<p>我是王宇&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '坂本', '坂本', '15075652703', '0', '2', '1492328612', '1492515482');
INSERT INTO `o2o_bis` VALUES ('23', '王小明', '578464694@qq.com', '\\upload\\20170422\\b112890b0df2e5fc4abc8f59e23007dd.jpg', '\\upload\\20170422\\87b952f1b3d01e675577e2d9f7eec2b2.jpg', '&lt;p&gt;介绍&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492862012', '1492862065');
INSERT INTO `o2o_bis` VALUES ('24', '好伦哥团购', '578464694@qq.com', '\\upload\\20170423\\f88080c3dfe0829b3ff3b6c5dc8d214b.jpg', '\\upload\\20170423\\8d6753f94a42d933b052f8bb5eef04e3.jpg', '&lt;p&gt;好伦哥西餐&lt;br/&gt;&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492961325', '1492961400');
INSERT INTO `o2o_bis` VALUES ('25', '柏尔森烤肉自助餐厅', '1259865838@qq.com', '\\upload\\20170423\\56ef8c3c9118617fc171f9f821d55917.jpg', '\\upload\\20170423\\fbbe63a3e69b661508f44cca3bb0926f.jpg', '&lt;p&gt;烤肉自助餐厅&lt;br/&gt;&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492961881', '1492961908');
INSERT INTO `o2o_bis` VALUES ('26', '丁丁洋回转自助火锅', '578464694@qq.com', '\\upload\\20170423\\af2aa997eb31f30a8d2c61bb863bca7e.jpg', '\\upload\\20170423\\c498a8c005f2fde65f098f0c353f2fbb.jpg', '&lt;p&gt;自助火锅&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492962196', '1492962992');
INSERT INTO `o2o_bis` VALUES ('27', '春园烤肉', '578464694@qq.com', '\\upload\\20170423\\b13f0862a1bc077b56a23eba56fdabfe.jpg', '\\upload\\20170423\\a151f7481fb15ff0be06bf8113365730.jpg', '&lt;p&gt;春园烤肉&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492962467', '1492962822');
INSERT INTO `o2o_bis` VALUES ('28', '布拉丝卡南美烤肉', '578464694@qq.com', '\\upload\\20170423\\c59f29555ade5aa91212786aeed41abc.jpg', '\\upload\\20170423\\b92fad767b81463fd6b66c1de523c5b6.jpg', '&lt;p&gt;布拉丝卡南美烤肉&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492962770', '1492962800');
INSERT INTO `o2o_bis` VALUES ('29', '伊尔曼都烤肉', '1259865838@qq.com', '\\upload\\20170423\\505d2e1eda7d4dfcc0688c0f89abeb0c.jpg', '\\upload\\20170423\\83643ff55a012c13d9c4b21640101135.jpg', '&lt;h2 style=&quot;font-size: 24px; margin: 8px 0px 2px; padding: 0px; border: 0px; outline: 0px; font-weight: 500; font-family: &amp;#39;Microsoft Yahei&amp;#39;; vertical-align: baseline; line-height: 36px; color: rgb(51, 51, 51); white-space: normal;&quot;&gt;伊尔曼都烤肉&lt;/h2&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492963188', '1492963637');
INSERT INTO `o2o_bis` VALUES ('30', '虾吃虾涮', '578464694@qq.com', '\\upload\\20170424\\76166986c7a6444d9667b8d44e410e2d.jpg', '\\upload\\20170424\\5e1a984fe16a240d63c59e815e6206c2.jpg', '&lt;h2 style=&quot;font-size: 24px; margin: 8px 0px 2px; padding: 0px; border: 0px; outline: 0px; font-weight: 500; font-family: &amp;#39;Microsoft Yahei&amp;#39;; vertical-align: baseline; line-height: 36px; color: rgb(51, 51, 51); white-space: normal;&quot;&gt;虾吃虾涮(二大街店)&lt;/h2&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '1', '1492963617', '1492963630');
INSERT INTO `o2o_bis` VALUES ('31', 'testqueue', '578464694@qq.com', '\\upload\\20170506\\a5016c1d83145aced1c4003cc5981115.jpg', '\\upload\\20170506\\3aa075f4b6e39835835e7cec5619ae81.jpg', '&lt;p&gt;测试邮件队列&lt;/p&gt;', '8', '8,9', '6228481006486106160', '0.00', '中国农业银行', '王宇', '王宇', '15075652703', '0', '0', '1494065718', '1494065718');

-- ----------------------------
-- Table structure for o2o_bis_account
-- ----------------------------
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
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bis_id` (`bis_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_bis_account
-- ----------------------------
INSERT INTO `o2o_bis_account` VALUES ('1', 'wangyu', '123456', '', '0', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `o2o_bis_account` VALUES ('2', 'wy7452525', '54a518ce54e8684f02d8bde81c6236c3', '2486', '13', '', '0', '1', '0', '2', '1492243992', '1492515313');
INSERT INTO `o2o_bis_account` VALUES ('3', 'admin2', '19687420fc5d27865b4c864005181e11', '9944', '14', '', '0', '1', '0', '2', '1492248598', '1492515248');
INSERT INTO `o2o_bis_account` VALUES ('4', 'wang7452525', 'd8aeb59d8350d805d6b625af69ed2bb9', '4305', '15', '', '0', '1', '0', '2', '1492266832', '1492515216');
INSERT INTO `o2o_bis_account` VALUES ('5', 'aaaaaa', 'f732e7f6395ff855048bf80debc753f2', '8391', '19', '', '0', '1', '0', '2', '1492268752', '1492318901');
INSERT INTO `o2o_bis_account` VALUES ('6', 'eeeeeee', '9ccb947335722b6443447400ea5d5890', '3340', '20', '', '0', '1', '0', '2', '1492268859', '1492515529');
INSERT INTO `o2o_bis_account` VALUES ('7', 'jjuuuuuu', '8553d20dd98c633a5c08b3df01173334', '502', '21', '', '0', '1', '0', '2', '1492310543', '1492515505');
INSERT INTO `o2o_bis_account` VALUES ('8', '7452525', 'a413fb6676a7ae4dc0427efe93dc8c31', '8946', '21', '', '1492440526', '1', '0', '2', '1492328612', '1492515505');
INSERT INTO `o2o_bis_account` VALUES ('9', 'wangwang', 'ae6a5d68d052adc8db0fb4c02d5dcc95', '1122', '23', '', '1492862082', '1', '0', '1', '1492862012', '1492862082');
INSERT INTO `o2o_bis_account` VALUES ('10', 'haolunge', '1dda7e1dc8e48d2992be2f718308e7e6', '9203', '24', '', '1494079534', '1', '0', '1', '1492961325', '1494079534');
INSERT INTO `o2o_bis_account` VALUES ('11', 'boersen', 'fdda33d0613401f135695a6189543070', '583', '25', '', '1492963742', '1', '0', '1', '1492961881', '1492963742');
INSERT INTO `o2o_bis_account` VALUES ('12', 'dingdingyang', '329a11a6a1b509db5ae5e391dae685a2', '9352', '26', '', '1494850249', '1', '0', '1', '1492962196', '1494850249');
INSERT INTO `o2o_bis_account` VALUES ('13', 'chunyuan', '546deea80011293f311d69b588853dfc', '1333', '27', '', '1494730790', '1', '0', '1', '1492962467', '1494730790');
INSERT INTO `o2o_bis_account` VALUES ('14', 'bulasika', 'ff1518c1f484e76fec789a1f97e8f18b', '6569', '28', '', '0', '1', '0', '1', '1492962770', '1492962800');
INSERT INTO `o2o_bis_account` VALUES ('15', 'yiermandu', '315aaa4d43a9ae450b13850914da3448', '2989', '29', '', '1493995181', '1', '0', '1', '1492963188', '1493995181');
INSERT INTO `o2o_bis_account` VALUES ('16', 'xiachi', '98bfcb35944d9bf9efb0d97df920f448', '882', '30', '', '1492964088', '1', '0', '1', '1492963617', '1492964088');
INSERT INTO `o2o_bis_account` VALUES ('17', 'testqueue', '8c6d18246af8921056740afe71796dc7', '8543', '31', '', '0', '1', '0', '0', '1494065718', '1494065718');

-- ----------------------------
-- Table structure for o2o_bis_location
-- ----------------------------
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
  `open_time` varchar(50) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `api_address` varchar(255) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_path` varchar(50) NOT NULL DEFAULT '',
  `bank_info` varchar(50) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `bis_id` (`bis_id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_bis_location
-- ----------------------------
INSERT INTO `o2o_bis_location` VALUES ('3', '柯南的分店', '\\upload\\20170415\\cea5f9408699fed2814d4598bc4d0e9d.jpg', '河北省霸州市信安镇', '15075652703', '王宇', '116.65313694621', '39.158729930098', '19', '', '这里是店铺介绍', '1', '', '8', '8,9', '2', '2,3', '', '0', '1', '1492240685', '1492471905');
INSERT INTO `o2o_bis_location` VALUES ('4', '坂本的分店', '\\upload\\20170415\\059924dc3f4e4c800cd9d403d0a5f252.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '22', '7:00-8:00', '这里是店铺介绍', '1', '', '8', '8,9', '11', '11,12', '', '0', '2', '1492243718', '1492515482');
INSERT INTO `o2o_bis_location` VALUES ('6', '有家客栈', '\\upload\\20170415\\234a5e4500a8b9f48ca0f37286d986a2.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '12', '7:00-8:00', '这里是店铺介绍', '1', '', '3', '3,7', '11', '11,', '', '0', '-1', '1492243935', '1494509522');
INSERT INTO `o2o_bis_location` VALUES ('9', '大米店铺', '\\upload\\20170415\\3d219b9a50fd2cb98ee301fd96a4bf26.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', '15', '08:00-22:00', '<p>扛把子</p>', '1', '河北省霸州市信安镇爱国街', '8', '8,9', '9', '9,', '', '0', '2', '1492266832', '1492515216');
INSERT INTO `o2o_bis_location` VALUES ('10', 'bilibili', '\\upload\\20170415\\aefec9b158b10e2e92a4274863b59a7e.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '19', '09:00-22:00', '门店介绍', '1', '河北省廊坊市广阳区新华路199号', '8', '8,9', '9', '9,14|10', '', '0', '1', '1492268752', '1492318901');
INSERT INTO `o2o_bis_location` VALUES ('11', '智能姬', '\\upload\\20170415\\fc075f60c4c92233ada22cd10426830f.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '20', '09:00-22:00', '门店介绍', '1', '河北省廊坊市广阳区新华路199号', '3', '3,7', '9', '9,14|10', '', '0', '2', '1492268859', '1492515529');
INSERT INTO `o2o_bis_location` VALUES ('12', 'bilibili的修改分店', '\\upload\\20170416\\fd728f8aaf8759b2141bac428601b400.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', '21', '08:00-09:00', '<p>水电费</p>', '0', '河北省霸州市信安镇爱国街', '8', '8,0', '9', '9,on', '', '0', '-1', '1492310543', '1492444383');
INSERT INTO `o2o_bis_location` VALUES ('13', '小明店铺3', '\\upload\\20170416\\96aae8af9ffdad4e5d562b0d5d54e5b4.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '22', '08:00-22:00', '<p>王宇的店铺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', '0', '河北省廊坊市广阳区新华路199号', '8', '8,0', '1', '1,on', '', '0', '1', '1492328612', '1492350787');
INSERT INTO `o2o_bis_location` VALUES ('14', '小明的店铺', '\\upload\\20170416\\d258d7d2271fe30a5da68dfa4150e949.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', '22', '08:00-22:00', '<p>王小明的门店介绍</p>', '0', '河北省霸州市信安镇爱国街', '8', '8,9', '1', '1,6', '', '0', '1', '1492342526', '1492437190');
INSERT INTO `o2o_bis_location` VALUES ('16', '小明的分店', '\\upload\\20170417\\2fc496aacc8c8342fb2019607b78ecd2.gif', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', '21', '08:00-22:00', '<p>王小明分店介绍</p>', '0', '河北省霸州市信安镇爱国街', '8', '8,9', '2', '2,3', '', '0', '-1', '1492435204', '1492438420');
INSERT INTO `o2o_bis_location` VALUES ('17', '我的门店', '\\upload\\20170417\\a2fdd2eca1ef5e5dc182faba7cf0fe8f.jpg', '河北省廊坊市新华路199号', '18855522445', '小明', '116.71203300041', '39.551346099335', '21', '08:00-22:00', '<p>这是门店介绍</p>', '0', '河北省廊坊市新华路199号', '8', '8,9', '1', '1,6', '', '0', '-1', '1492440405', '1492445041');
INSERT INTO `o2o_bis_location` VALUES ('18', 'bilibili的另一个门店', '\\upload\\20170417\\425149654da4dab16695c504fc82c75a.gif', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '21', '06:00-22:00', '<p>bilibili的另一个门店介绍</p>', '0', '河北省廊坊市广阳区新华路199号', '3', '3,7', '2', '2,3', '', '0', '1', '1492444317', '1492471896');
INSERT INTO `o2o_bis_location` VALUES ('19', 'bilibili的另一个门店', '\\upload\\20170418\\7cda152b0845cf3e8071b1cccccaf253.jpg', '河北省霸州市信安镇爱国街', '15075652703', '王宇', '116.65313694621', '39.158729930098', '21', '08:00-22:00', '<p>bilibili的另一个门店</p>', '0', '河北省霸州市信安镇爱国街', '8', '8,9', '2', '2,3', '', '0', '1', '1492472197', '1492472207');
INSERT INTO `o2o_bis_location` VALUES ('20', 'bilibili的新加门店', '\\upload\\20170418\\c66ca528b6efee7bde8b4bfb966cb5f4.jpg', '河北省廊坊市安次区爱民东道14号', '15075652703', '王宇', '116.70194823648', '39.532415835593', '21', '07:00-23:00', '<p>bilibili的新加门店</p>', '0', '河北省廊坊市安次区爱民东道14号', '3', '3,7', '2', '2,3', '', '0', '1', '1492472323', '1492472370');
INSERT INTO `o2o_bis_location` VALUES ('21', '王小明', '\\upload\\20170422\\b112890b0df2e5fc4abc8f59e23007dd.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '23', '09:00-22:00', '&lt;p&gt;门店&lt;/p&gt;', '1', '河北省廊坊市广阳区新华路199号', '8', '8,9', '1', '1,', '', '0', '1', '1492862012', '1492862065');
INSERT INTO `o2o_bis_location` VALUES ('22', 'wangwang的门店', '\\upload\\20170422\\90e69f82caed9b9797964df32121afea.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '23', '08:00-22:00', '&lt;p&gt;介绍&lt;/p&gt;', '0', '河北省廊坊市广阳区新华路199号', '8', '8,9', '1', '1,8|6', '', '0', '1', '1492862163', '1492862181');
INSERT INTO `o2o_bis_location` VALUES ('23', '好伦哥团购', '\\upload\\20170423\\f88080c3dfe0829b3ff3b6c5dc8d214b.jpg', '廊坊市燕郊天洋广场A馆1层F1A-04号', '15075652703', '王宇', '116.82766516915', '39.971231993239', '24', '11:00-21:00', '&lt;p&gt;提供免费停车位，提供免费WiFi&lt;/p&gt;', '1', '廊坊市燕郊天洋广场A馆1层F1A-04号', '8', '8,9', '1', '1,18', '', '0', '1', '1492961325', '1492961400');
INSERT INTO `o2o_bis_location` VALUES ('24', '柏尔森烤肉自助餐厅', '\\upload\\20170423\\56ef8c3c9118617fc171f9f821d55917.jpg', '廊坊市广阳区银河北路119号乐都新天地6楼', '15075652703', '王宇', '116.70498264872', '39.538246682078', '25', '18:00-21:30', '&lt;p&gt;&lt;span class=&quot;text-main&quot;&gt;免费停车，免费WiFi！&lt;/span&gt;&lt;/p&gt;', '1', '廊坊市广阳区银河北路119号乐都新天地6楼', '8', '8,9', '1', '1,19', '', '0', '1', '1492961881', '1492961908');
INSERT INTO `o2o_bis_location` VALUES ('25', '丁丁洋回转自助火锅', '\\upload\\20170423\\af2aa997eb31f30a8d2c61bb863bca7e.jpg', '廊坊市广阳区万达广场F座家乐福超市地下一层', '15075652703', '王宇', '116.71410446597', '39.528431526829', '26', '11:00-21:00', '&lt;p&gt;&lt;span class=&quot;text-main&quot;&gt;万达店单人自助火锅&lt;/span&gt;&lt;/p&gt;', '1', '廊坊市广阳区万达广场F座家乐福超市地下一层', '8', '8,9', '1', '1,20', '', '0', '1', '1492962196', '1492962992');
INSERT INTO `o2o_bis_location` VALUES ('26', '春园烤肉', '\\upload\\20170423\\b13f0862a1bc077b56a23eba56fdabfe.jpg', '廊坊市广阳区第四大街肯德基4楼', '15075652703', '王宇', '116.73145463413', '39.534755473004', '27', '10:30-21:30', '&lt;h2&gt;春园烤肉(四大街店)&lt;/h2&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '廊坊市广阳区第四大街肯德基4楼', '8', '8,9', '1', '1,', '', '0', '1', '1492962467', '1492962822');
INSERT INTO `o2o_bis_location` VALUES ('27', '布拉丝卡南美烤肉', '\\upload\\20170423\\c59f29555ade5aa91212786aeed41abc.jpg', '廊坊市广阳区新华路57号月色广场3楼东侧', '15075652703', '王宇', '116.71504276045', '39.527328713462', '28', '11:00-14:00', '&lt;p&gt;提供免费停车位，提供免费WiFi&lt;/p&gt;', '1', '廊坊市广阳区新华路57号月色广场3楼东侧', '8', '8,9', '1', '1,19', '', '0', '1', '1492962770', '1492962800');
INSERT INTO `o2o_bis_location` VALUES ('28', '伊尔曼都烤肉', '\\upload\\20170423\\505d2e1eda7d4dfcc0688c0f89abeb0c.jpg', '廊坊市广阳区新华路50号万达广场六楼', '15075652703', '王宇', '116.71281826585', '39.526693586707', '29', '11:00-21:00', '&lt;p&gt;提供免费停车位，提供免费WiFi&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1', '廊坊市广阳区新华路50号万达广场六楼', '8', '8,9', '1', '1,19', '', '0', '1', '1492963188', '1492963637');
INSERT INTO `o2o_bis_location` VALUES ('29', '虾吃虾涮', '\\upload\\20170424\\76166986c7a6444d9667b8d44e410e2d.jpg', '廊坊市广阳区二大街北外街中段', '15075652703', '王宇', '116.72938960942', '39.540571622006', '30', '11:00-21:30', '&lt;p&gt;&lt;span style=&quot;color: rgb(88, 88, 88); font-family: &amp;#39;Hiragino Sans GB&amp;#39;, arial, Verdana, tahoma, 宋体, sans-serif; font-size: 14px; line-height: 25px;&quot;&gt;店内免费提供应季新鲜水果，另店内提供南瓜粥自助、小凉菜自助&lt;/span&gt;&lt;/p&gt;', '1', '廊坊市广阳区二大街北外街中段', '8', '8,9', '1', '1,20', '', '0', '1', '1492963617', '1492963630');
INSERT INTO `o2o_bis_location` VALUES ('30', 'testqueue', '\\upload\\20170506\\a5016c1d83145aced1c4003cc5981115.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '31', '08:00-22:00', '&lt;p&gt;测试邮件队列的介绍&lt;/p&gt;', '1', '河北省廊坊市广阳区新华路199号', '8', '8,9', '1', '1,20', '', '0', '0', '1494065718', '1494065718');
INSERT INTO `o2o_bis_location` VALUES ('843', '小米店铺', '\\upload\\20170415\\68609fe5e22d8dbcfafe72f4cb7f7329.jpg', '河北省廊坊市广阳区新华路199号', '15075652703', '王宇', '116.71203300041', '39.551346099335', '14', '09:00-22:00', '这里是店铺介绍', '1', '河北省廊坊市广阳区新华路199号', '1', '1,2', '9', '9,', '', '0', '2', '1492248598', '1492515248');
INSERT INTO `o2o_bis_location` VALUES ('844', '新加的丁丁洋自助火锅', '\\upload\\20170511\\1f371b331b59d32e2b8e6f8c8f1fbdc7.jpg', '景德镇市珠山区浙江路与广场南路交汇处东20米路南', '15075652703', '王宇', '117.22107434143', '29.29152538553', '26', '08:00-21:00', '&lt;p&gt;一个新加的丁丁洋自助火锅&lt;/p&gt;', '0', '景德镇市珠山区浙江路与广场南路交汇处东20米路南', '3', '3,7', '1', '1,20', '', '0', '1', '1494508960', '1494509491');

-- ----------------------------
-- Table structure for o2o_category
-- ----------------------------
DROP TABLE IF EXISTS `o2o_category`;
CREATE TABLE `o2o_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_category
-- ----------------------------
INSERT INTO `o2o_category` VALUES ('1', '美食', '0', '10', '1', '1491992020', '1492652898');
INSERT INTO `o2o_category` VALUES ('2', '旅游', '0', '12', '1', '1491992054', '1492652975');
INSERT INTO `o2o_category` VALUES ('3', '飞机', '2', '0', '1', '1491992107', '0');
INSERT INTO `o2o_category` VALUES ('5', '阅读', '0', '23', '-1', '1491992493', '1492072867');
INSERT INTO `o2o_category` VALUES ('6', '麻辣烫', '1', '0', '1', '1491995365', '1491995365');
INSERT INTO `o2o_category` VALUES ('8', '拉面', '1', '0', '1', '1491995777', '1491995777');
INSERT INTO `o2o_category` VALUES ('9', '电影', '0', '11', '1', '1492060639', '1492652917');
INSERT INTO `o2o_category` VALUES ('10', '文艺电影', '9', '6', '1', '1492060659', '1492071287');
INSERT INTO `o2o_category` VALUES ('11', '汽车', '0', '9', '-1', '1492075333', '1493117146');
INSERT INTO `o2o_category` VALUES ('12', '宝马', '11', '0', '1', '1492075357', '1492075357');
INSERT INTO `o2o_category` VALUES ('13', '文学名著', '5', '0', '1', '1492078888', '1492078888');
INSERT INTO `o2o_category` VALUES ('14', '哈利波特', '9', '0', '1', '1492079999', '1492079999');
INSERT INTO `o2o_category` VALUES ('15', '休闲', '0', '0', '1', '1492777548', '1492777548');
INSERT INTO `o2o_category` VALUES ('16', '娱乐', '0', '0', '1', '1492777558', '1492777558');
INSERT INTO `o2o_category` VALUES ('17', '酒店', '0', '5', '1', '1492777621', '1492777633');
INSERT INTO `o2o_category` VALUES ('18', '西餐', '1', '0', '1', '1492961252', '1492961252');
INSERT INTO `o2o_category` VALUES ('19', '自助烤肉', '1', '0', '1', '1492961810', '1492961810');
INSERT INTO `o2o_category` VALUES ('20', '火锅', '1', '0', '1', '1492962070', '1492962070');

-- ----------------------------
-- Table structure for o2o_city
-- ----------------------------
DROP TABLE IF EXISTS `o2o_city`;
CREATE TABLE `o2o_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `uname` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_city
-- ----------------------------
INSERT INTO `o2o_city` VALUES ('1', '北京', 'beijing', '0', '0', '0', '1', '1474013959', '0');
INSERT INTO `o2o_city` VALUES ('2', '朝阳', 'chaoyang', '1', '0', '0', '1', '1492132250', '0');
INSERT INTO `o2o_city` VALUES ('3', '江西', 'jiangxi', '0', '0', '0', '1', '1492132287', '0');
INSERT INTO `o2o_city` VALUES ('4', '南昌', 'nanchang', '3', '1', '0', '1', '1492132318', '0');
INSERT INTO `o2o_city` VALUES ('5', '上饶', 'shangrao', '3', '0', '0', '1', '1492132347', '0');
INSERT INTO `o2o_city` VALUES ('6', '抚州', 'fuzhou', '3', '0', '0', '1', '1492132369', '0');
INSERT INTO `o2o_city` VALUES ('7', '景德镇', 'jingdezhen', '3', '0', '0', '1', '1492132394', '0');
INSERT INTO `o2o_city` VALUES ('8', '河北', 'hebei', '0', '0', '0', '1', '1492132500', '0');
INSERT INTO `o2o_city` VALUES ('9', '廊坊', 'langfang', '8', '0', '0', '1', '1492132600', '0');

-- ----------------------------
-- Table structure for o2o_comment
-- ----------------------------
DROP TABLE IF EXISTS `o2o_comment`;
CREATE TABLE `o2o_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0为删除，1 为正常 ',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `comment_class` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为好评，1为中评，2为差评',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_comment
-- ----------------------------
INSERT INTO `o2o_comment` VALUES ('27', 'wangyu', '16', '第四次评论', '19', '1', '1494329205', '1', '1494329205');
INSERT INTO `o2o_comment` VALUES ('26', 'wangyu', '16', '第三次评论', '19', '1', '1494329190', '2', '1494329190');
INSERT INTO `o2o_comment` VALUES ('25', 'wangyu', '16', '第二次评论', '19', '1', '1494329179', '1', '1494329179');
INSERT INTO `o2o_comment` VALUES ('24', 'wangyu', '16', '我在测试我的评论', '19', '1', '1494329147', '0', '1494329147');
INSERT INTO `o2o_comment` VALUES ('28', 'wangyu', '16', '我在测试铁木真的评论', '15', '1', '1494684824', '2', '1494684824');

-- ----------------------------
-- Table structure for o2o_coupons
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_coupons
-- ----------------------------
INSERT INTO `o2o_coupons` VALUES ('102', '1494127003133162325', '50207', '16', '19', '94', '2', '1494127003', '1494127003', '1');
INSERT INTO `o2o_coupons` VALUES ('103', '1494129026908310540', '62209', '16', '19', '95', '2', '1494129026', '1494129026', '1');
INSERT INTO `o2o_coupons` VALUES ('104', '1494129132231921359', '88367', '16', '19', '96', '2', '1494129132', '1494129132', '1');
INSERT INTO `o2o_coupons` VALUES ('105', '1494129315884357750', '64259', '16', '19', '97', '2', '1494129315', '1494129315', '1');
INSERT INTO `o2o_coupons` VALUES ('106', '1494129415712112751', '81903', '18', '19', '98', '0', '1494129415', '1494129415', '1');
INSERT INTO `o2o_coupons` VALUES ('107', '1494129596451540987', '74237', '18', '19', '99', '0', '1494129596', '1494129596', '1');
INSERT INTO `o2o_coupons` VALUES ('108', '1494129612923431988', '55073', '18', '19', '100', '1', '1494129613', '1494129613', '1');
INSERT INTO `o2o_coupons` VALUES ('109', '1494406228693463802', '84587', '18', '24', '107', '1', '1494406228', '1494406228', '10');
INSERT INTO `o2o_coupons` VALUES ('110', '1494406434695196656', '47025', '17', '24', '108', '1', '1494406434', '1494406434', '99');
INSERT INTO `o2o_coupons` VALUES ('111', '1494410232238701100', '12949', '17', '24', '115', '1', '1494410232', '1494410232', '15');
INSERT INTO `o2o_coupons` VALUES ('112', '1494638511962430779', '10821', '16', '15', '116', '1', '1494638512', '1494638512', '10');

-- ----------------------------
-- Table structure for o2o_deal
-- ----------------------------
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
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_deal
-- ----------------------------
INSERT INTO `o2o_deal` VALUES ('15', '铁木真', '1', '1,8', '8', '23', '22,21', '\\upload\\20170423\\37ba1d57a67c736cd9eaa77ee6a1ac74.jpg', '&lt;p&gt;单人烤肉自助1份，免费停车！免费 Wifi！&lt;br/&gt;&lt;/p&gt;', '1493006880', '1499444760', '88.00', '77.00', '8', '11', '99', '1492920480', '1494043740', '9', '116.71203300041', '39.551346099335', '0.00', '&lt;p&gt;单人烤肉自助1份&lt;/p&gt;', '0', '1', '1492920604', '1492920638', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('16', '柏尔森烤肉自助餐厅团购', '1', '1,19', '19', '25', '24', '\\upload\\20170424\\47e4e45bf6929ca6dea9f31b984ffc29.jpg', '&lt;p&gt;&lt;a mon=&quot;element=&amp;amp;position=3&amp;amp;element_type=breadCrumbs&quot; style=&quot;padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; color: rgb(255, 102, 153);&quot;&gt;柏尔森烤肉自助餐厅团购&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1492963860', '1499444760', '42.90', '29.90', '8', '10', '989', '1492963920', '1494000720', '11', '116.70498264872', '39.538246682078', '0.00', '&lt;table class=&quot;consume&quot;&gt;&lt;tbody style=&quot;padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;tr style=&quot;padding: 0px; margin: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;&quot; class=&quot;firstRow&quot;&gt;&lt;td style=&quot;padding: 0px; margin: 0px; border-top-width: 0px; border-right-width: 0px; border-left-width: 0px; border-bottom-color: rgb(240, 240, 240); outline: 0px; font-style: inherit; font-family: songti; font-size: 14px; vertical-align: middle; color: rgb(88, 88, 88);&quot;&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;团购用户暂不享受店内其他优惠&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;每张糯米券限1人使用&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;每次消费不限使用糯米券张数，可叠加使用&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;1米(不含)以下的儿童免费， 1米(含)-1.3米(含)的儿童28元/位 ,70周岁(含)以上的老人凭有效证件可享受35元/位&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;自助餐仅限堂食，不提供打包服务&lt;br/&gt;部分菜品因时令原因有所不同，请以店内当日实际供应为准&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;啤酒中午免费，晚餐是收费的&lt;br/&gt;在公共场所娱乐消费时，请您妥善保管好自己随身携带的财物，以防丢失；注意人身安全，避免发生危险&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1', '1492964009', '1492964024', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('17', '虾吃虾涮团购', '1', '1,20', '20', '30', '29', '\\upload\\20170424\\b08341d62ece7d903b94acac9078c921.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;二大街店2人套餐！免费WiFi，！&lt;/span&gt;&lt;/p&gt;', '1492964100', '1499448888', '138.00', '66.00', '8', '0', '99', '1492964160', '1494000960', '16', '116.72938960942', '39.540571622006', '0.00', '&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;无停车位&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;提供免费WiFi&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;本单堂食外带均可&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;商家免费提供餐后打包服务&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1', '1492964201', '1492964238', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('18', '春园烤肉团购', '1', '1,19', '19', '27', '26', '\\upload\\20170424\\65277376ecc6d26af0065f43ff830ce6.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;价值55元自助餐1位！免费WiFi&lt;/span&gt;&lt;/p&gt;', '1492964280', '1499488888', '55.00', '25.00', '8', '0', '99', '1492964280', '1494001080', '13', '116.73145463413', '39.534755473004', '0.00', '&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;用餐时间2小时&lt;br/&gt;需20押金&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '-1', '1492964362', '1494731085', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('19', '丁丁洋回转自助火锅团购', '1', '1,20', '20', '26', '25', '\\upload\\20170424\\0209c412af58a2ff5c5136e72072fb07.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(88, 88, 88); font-family: songti; font-size: 14px; line-height: 39px; text-indent: 10px;&quot;&gt;单人火锅自助&lt;/span&gt;&lt;/p&gt;', '1492964580', '1499449999', '36.90', '26.90', '8', '28', '99', '1492964580', '1494001380', '12', '116.71410446597', '39.528431526829', '0.00', '&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;自助餐仅限堂食，不提供打包服务&lt;br/&gt;部分菜品因时令原因有所不同，请以店内当日实际供应为准&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1', '1492964675', '1492964691', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('20', '伊尔曼都烤肉团购', '1', '1,on', '1,on', '29', '28', '\\upload\\20170424\\8ea85403d9984b920c69684c4f2b5227.jpg', '&lt;p&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;仅售26.9元&lt;/span&gt;&lt;span style=&quot;color: rgb(153, 153, 153); font-family: SimSun; font-size: 14px; line-height: 28px;&quot;&gt;，价值58元平日单人自助1份！免费停车，免费WiFi！&lt;/span&gt;&lt;/p&gt;', '1492964760', '1499444760', '52.00', '26.90', '8', '0', '99', '1492964760', '1497025560', '15', '116.71281826585', '39.526693586707', '0.00', '&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;自助含： 烤肉、蔬菜、水果、甜点、汤类、饮料不限量供应 - 用餐时限：最多可用餐2小时&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '1', '1492964869', '1493995476', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('22', '好伦哥的团购', '1', '1,20|19|18', '1,20,19,18', '24', '23', '\\upload\\20170425\\bb029326ec238f2bb5b8b4d18d6d302f.jpg', '&lt;p&gt;描述&lt;/p&gt;', '1492964760', '1494066960', '88.00', '77.00', '8', '0', '99', '1491129360', '1494066960', '10', '116.82766516915', '39.971231993239', '0.00', '&lt;p&gt;须知&lt;/p&gt;', '0', '1', '1493116582', '1493118129', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('23', '好伦哥的另一个团购', '1', '1,19|18|6', '1,19,18,6', '24', '23', '\\upload\\20170425\\eee21795acdc6e86175e7fa894461b2f.jpg', '&lt;p&gt;描述&lt;/p&gt;', '1492964760', '1494067680', '78.00', '77.00', '8', '0', '99', '1493117280', '1494067740', '10', '116.82766516915', '39.971231993239', '0.00', '&lt;p&gt;须知&lt;/p&gt;', '0', '1', '1493117348', '1493117348', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('24', '测试团购', '1', '1,20|19|18|8|6', '1,20,19,18,8,6', '24', '23', '\\upload\\20170425\\af848190fa2a4c7af724d25c5d174ad7.jpg', '&lt;p&gt;描述&lt;/p&gt;', '1492964760', '1499448888', '88.00', '77.00', '8', '35', '99', '1493119020', '1494069420', '10', '116.82766516915', '39.971231993239', '0.00', '&lt;p&gt;须知&lt;/p&gt;', '0', '1', '1493119069', '1493119080', '8,9', '9');
INSERT INTO `o2o_deal` VALUES ('25', '一分钱测试购买', '1', '1,on|on|on|on|on', '1,on,on,on,on,on', '24', '23', '\\upload\\20170425\\0da57aecdff73eac758f4df64f5210f0.jpg', '&lt;p&gt;一分钱测试购买&lt;/p&gt;', '1493125380', '1499449999', '0.01', '0.01', '8', '0', '99', '1493125380', '1494075780', '10', '116.82766516915', '39.971231993239', '0.00', '&lt;p&gt;一分钱测试购买&lt;/p&gt;', '0', '1', '1493125413', '1493125446', '8,9', '9');

-- ----------------------------
-- Table structure for o2o_featured
-- ----------------------------
DROP TABLE IF EXISTS `o2o_featured`;
CREATE TABLE `o2o_featured` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_featured
-- ----------------------------
INSERT INTO `o2o_featured` VALUES ('1', '0', '王宇的更新推荐位', '\\upload\\20170419\\e45e20f589ab5f479c1867b13ec1a20c.jpg', 'http://www.baidu.com', '这是王宇的描述', '99', '-1', '1492598261', '1492609421');
INSERT INTO `o2o_featured` VALUES ('2', '0', '王宇的另一个推荐位', '\\upload\\20170419\\07f97b1ee92da86c2507d02898a48ba0.png', 'http://www.sohu.com', '推荐另一个', '88', '-1', '1492607608', '1492652493');
INSERT INTO `o2o_featured` VALUES ('3', '0', '夏日狂欢季', '\\upload\\20170422\\5608f5b36f04b3f275302dfae3987925.jpg', 'https://lf.nuomi.com/326', '夏日狂欢季', '0', '1', '1492828776', '1492828776');
INSERT INTO `o2o_featured` VALUES ('4', '1', '1毛钱吃大餐', '\\upload\\20170422\\1b2ae61a3d5a04bd283b55193e534fd6.jpg', 'http://d.nuomi.com/?1009764s', '1毛钱吃大餐', '0', '1', '1492828926', '1492828926');
INSERT INTO `o2o_featured` VALUES ('5', '0', '西饼屋', '\\upload\\20170422\\483d6277491966b980bb125f6d84485d.jpg', 'http://www.meituan.com/deal/25564519.html?mtt=1.index%2Ffloornew.ip.9.j1so8tl5', '西饼屋', '0', '0', '1492830500', '1492830500');
INSERT INTO `o2o_featured` VALUES ('6', '0', '杨千嬅演唱会', '\\upload\\20170422\\40bb1e6d5fd6afc77e4952dac50d1861.jpg', 'https://ju.taobao.com/jusp/nv/yangqianhuhu/tp.htm?spm=608.2291429.102204.1.ehNHeq&amp;banner_id=32184', '杨千嬅演唱会', '0', '1', '1492831403', '1493982372');

-- ----------------------------
-- Table structure for o2o_order
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_order
-- ----------------------------
INSERT INTO `o2o_order` VALUES ('94', '1494127003133162325', '', '16', 'wangyu', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494127002', '1494329147', '0', '', '0', '26', '1');
INSERT INTO `o2o_order` VALUES ('95', '149412902690831054', '', '16', 'wangyu', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494129025', '1494329179', '0', '', '0', '26', '1');
INSERT INTO `o2o_order` VALUES ('96', '1494129132231921359', '', '16', 'wangyu', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494129131', '1494329190', '0', '', '0', '26', '1');
INSERT INTO `o2o_order` VALUES ('97', '149412931588435775', '', '16', 'wangyu', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494129314', '1494329205', '0', '', '0', '26', '1');
INSERT INTO `o2o_order` VALUES ('98', '1494129415712112751', '', '18', 'qianxukang2', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494129415', '1494129415', '0', '', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('99', '1494129596451540987', '', '18', 'qianxukang2', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494129595', '1494129595', '0', '', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('100', '1494129612923431988', '', '18', 'qianxukang2', '', '1', '19', '1', '1', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494129612', '1494129612', '0', '', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('101', '1494135986804094250', '', '18', 'qianxukang2', '', '1', '19', '10', '0', '269.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=10', '1494135986', '1494147665', '2', '', '3', '26', '0');
INSERT INTO `o2o_order` VALUES ('102', '1494136044607346084', '', '18', 'qianxukang2', '', '1', '19', '10', '0', '269.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=10', '1494136044', '1494136044', '1', '', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('103', '1494136061515385529', '', '18', 'qianxukang2', '', '1', '19', '10', '0', '269.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=10', '1494136061', '1494136061', '2', '测试地点', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('104', '14941365452931119', '', '18', 'qianxukang2', '', '1', '19', '1', '0', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494136544', '1494136544', '1', '', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('105', '1494136594580799338', '', '18', 'qianxukang2', '', '1', '19', '1', '0', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494136594', '1494136594', '1', '', '0', '26', '0');
INSERT INTO `o2o_order` VALUES ('106', '1494136609606667250', '', '18', 'qianxukang2', '', '1', '19', '1', '0', '26.90', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=19&count=1', '1494136608', '1494509642', '2', '河北省霸州市信安镇爱国街', '3', '26', '0');
INSERT INTO `o2o_order` VALUES ('107', '1494406228693463802', '', '18', 'qianxukang2', '', '1', '24', '10', '1', '770.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=10', '1494406228', '1494406228', '1', '', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('108', '1494406434695196656', '', '17', 'qianxukang', '', '1', '24', '99', '1', '7623.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=99', '1494406434', '1494406434', '1', '', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('109', '1494407933915992435', '', '17', 'qianxukang', '', '1', '24', '89', '0', '6853.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=89', '1494407933', '1494407933', '2', '河北省廊坊市河北工业大学城市学院廊坊分校', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('110', '1494409831696494393', '', '17', 'qianxukang', '', '1', '24', '4', '0', '308.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=4', '1494409831', '1494409831', '2', '河北省霸州市信安镇爱国街110号', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('111', '1494409898441368775', '', '17', 'qianxukang', '', '1', '24', '10', '0', '770.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=10', '1494409897', '1494409897', '2', '河北省霸州市信安镇爱国街110号', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('112', '1494409995745830055', '', '17', 'qianxukang', '', '1', '24', '10', '0', '770.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=10', '1494409995', '1494409995', '2', '河北省霸州市信安镇爱国街110号', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('113', '1494410109761394482', '', '17', 'qianxukang', '', '1', '24', '10', '0', '770.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=10', '1494410109', '1494410109', '2', '河北省霸州市信安镇爱国街110号', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('114', '1494410163811438018', '', '17', 'qianxukang', '', '1', '24', '10', '0', '770.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=10', '1494410163', '1494410163', '2', '河北省廊坊市广阳区新华路199号', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('115', '14944102322387011', '', '17', 'qianxukang', '', '1', '24', '15', '1', '1155.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=24&count=15', '1494410231', '1494410231', '1', '', '0', '24', '0');
INSERT INTO `o2o_order` VALUES ('116', '1494638511962430779', '', '16', 'wangyu', '', '1', '15', '10', '1', '770.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=15&count=10', '1494638511', '1494684824', '1', '', '0', '23', '1');
INSERT INTO `o2o_order` VALUES ('117', '1494685100986118413', '', '16', 'wangyu', '', '1', '15', '1', '0', '77.00', '0.00', '1', 'http://o2o.xm.com/index.php/index/order/confirm.html?id=15&count=1', '1494685100', '1494685100', '2', '廊坊市广阳区新华路199号', '0', '23', '0');

-- ----------------------------
-- Table structure for o2o_test
-- ----------------------------
DROP TABLE IF EXISTS `o2o_test`;
CREATE TABLE `o2o_test` (
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `nimei` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_test
-- ----------------------------
INSERT INTO `o2o_test` VALUES ('1492678673', '1492678673', 'dfd', 'dddd', '1');
INSERT INTO `o2o_test` VALUES ('1492678860', '1492678860', null, '', '2');

-- ----------------------------
-- Table structure for o2o_user
-- ----------------------------
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
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o2o_user
-- ----------------------------
INSERT INTO `o2o_user` VALUES ('2', 'wangyu2', '09d03004b3964d2bef78920148b44373', '3128', '', '0', '1259865838@qq.com', '15075652703', '0', '1', '1492676268', '1492676268');
INSERT INTO `o2o_user` VALUES ('3', 'wangyu3', '3001c9168bb9978b59ff55f5143875e8', '9211', '', '0', '12598658381@qq.com', '15075652702', '0', '1', '1492676374', '1492676374');
INSERT INTO `o2o_user` VALUES ('5', 'wangyu4', 'ca88f4dd12757a7ac290ca8cf8f48840', '4578', '', '0', '9699587@qq.com', '15075652701', '0', '1', '1492676462', '1492676462');
INSERT INTO `o2o_user` VALUES ('10', 'wangyudd', 'c508a86a73da590e9a9429d2ddb6c4f4', '5097', '', '0', '585888@qq.com', '15075652700', '0', '1', '1492683421', '1492683421');
INSERT INTO `o2o_user` VALUES ('11', 'wangyudee', 'fce971560ed71172568bdda3f97c58c9', '7587', '', '0', '5871e@qq.com', '15075652710', '0', '1', '1492684773', '1492684773');
INSERT INTO `o2o_user` VALUES ('14', 'sdfser', '1c92213e27caad744a861481a081d4af', '1265', '', '0', '5fgf8e@qq.com', '15075652705', '0', '1', '1492684997', '1494518525');
INSERT INTO `o2o_user` VALUES ('15', 'deee', '02a8239687c6d3be8ba22fa09cd00cdc', '6212', '', '0', 'efgd@qq.com', '15075652711', '0', '-1', '1492685112', '1494517510');
INSERT INTO `o2o_user` VALUES ('16', 'wangyu', 'c08b9a1e323b8d76f2273898d41dbf74', '6463', '127.0.0.1', '1494899308', '578464694@qq.com', '15075652788', '0', '1', '1492758321', '1494899308');
INSERT INTO `o2o_user` VALUES ('17', 'qianxukang', '80669370dfd641f1841899122ac4f882', '8976', '127.0.0.1', '1494406277', '565238711@qq.com', '15075652799', '0', '1', '1494079875', '1494406276');
INSERT INTO `o2o_user` VALUES ('18', 'qianxukang2', 'f2988c9c6aab598b6f2c89e999c235ae', '2144', '127.0.0.1', '1494406172', '1229594507@qq.com', '15175652703', '0', '1', '1494080377', '1494406172');
