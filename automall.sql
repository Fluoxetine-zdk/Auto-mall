/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : automall

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-11-25 13:55:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '123', '1');
INSERT INTO `admin` VALUES ('test', '123', '1');
INSERT INTO `admin` VALUES ('zz', '123', '0');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brandid` int NOT NULL AUTO_INCREMENT,
  `brandname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('123', '宝马');
INSERT INTO `brand` VALUES ('124', '奥迪');
INSERT INTO `brand` VALUES ('125', '大众');
INSERT INTO `brand` VALUES ('126', '福克斯');
INSERT INTO `brand` VALUES ('127', '丰田');
INSERT INTO `brand` VALUES ('128', '西雅特');
INSERT INTO `brand` VALUES ('129', '奔驰');
INSERT INTO `brand` VALUES ('130', '沃尔沃');
INSERT INTO `brand` VALUES ('131', '凯迪拉克');
INSERT INTO `brand` VALUES ('132', '科迈罗');
INSERT INTO `brand` VALUES ('133', '路虎');
INSERT INTO `brand` VALUES ('136', 'test');

-- ----------------------------
-- Table structure for carinfo
-- ----------------------------
DROP TABLE IF EXISTS `carinfo`;
CREATE TABLE `carinfo` (
  `carid` int NOT NULL AUTO_INCREMENT,
  `carname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float(10,1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modelid` int NOT NULL,
  `brandid` int DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`carid`),
  KEY `modelid` (`modelid`),
  KEY `brandid` (`brandid`),
  CONSTRAINT `carinfo_ibfk_1` FOREIGN KEY (`modelid`) REFERENCES `carmodel` (`modelid`),
  CONSTRAINT `carinfo_ibfk_2` FOREIGN KEY (`brandid`) REFERENCES `brand` (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carinfo
-- ----------------------------
INSERT INTO `carinfo` VALUES ('111101', '奥迪Q5Ltest', '396800.0', '2020款 典范 1.5L 手自一体 精英型', '1', '124', 'https://i1.cximg.com/img2/600x400/84bd33606b889b25/20150715/e11b05ee49834896a1486b13c468450c.jpg');
INSERT INTO `carinfo` VALUES ('111102', '宝马5系', '399000.0', '宝马5系 2020款 典范 2.5L 手自一体 精英型', '1', '123', 'https://youjia-image.cdn.bcebos.com/seriesImage/15881459541681bfaa0f.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111103', '丰田C-HR', '141800.0', '丰田C-HR 2021款 1.5L 手自一体 精英型', '3', '127', 'https://i1.cximg.com/img2/600x400/9c730a0484bd33606b889b25fcc43fa1/20200730/ad981ffa77ea4f0e9b3e89aa09c1e058.png');
INSERT INTO `carinfo` VALUES ('111104', '大众迈腾', '309900.0', '大众迈腾 2021款 精英型 4.0L 1.5T', '1', '125', 'https://i1.cximg.com/img2/600x400/9c730a0484bd33606b889b25fcc43fa1/20200615/6f447e905add4ef99c5ff36adf39806c.png');
INSERT INTO `carinfo` VALUES ('111105', '西雅特LEON', '254600.0', '西雅特LEON 2020款 商务款', '1', '128', 'https://i1.cximg.com/img2/600x400/9c730a0484bd33606b889b25fcc43fa1/20190730/3f6e54f5b99e430ebfad5469bc215301.jpg');
INSERT INTO `carinfo` VALUES ('111106', '奔驰C级', '307800.0', '奔驰C级 2019款', '1', '129', 'https://youjia-image.cdn.bcebos.com/seriesImage/15888517958337c721c1.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111107', '沃尔沃S60', '402900.0', '沃尔沃S60 3.0L', '1', '130', 'https://youjia-image.cdn.bcebos.com/seriesImage/158902078064492db4da.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111108', '宝马3系', '399600.0', '宝马3系 2018款 2.0L', '1', '123', 'https://youjia-image.cdn.bcebos.com/seriesImage/15888525659664089094.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111109', '凯迪拉克ATS-L', '422500.0', '凯迪拉克ATS-L 精英型', '1', '131', 'https://youjia-image.cdn.bcebos.com/seriesImage/1586346371894991b9b3.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111110', '宝马4系', '399600.0', '凯迪拉克ATS-L 6.5L 2.0T', '1', '123', 'https://youjia-image.cdn.bcebos.com/seriesImage/15864328212217fb9fdd.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111111', '奔驰A级', '257800.0', '奔驰A级 2020款 7.6L 2.0T', '1', '129', 'https://youjia-image.cdn.bcebos.com/seriesImage/1588852129368216d90e.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111112', '奥迪A3', '343500.0', '', '1', '124', 'https://youjia-image.cdn.bcebos.com/seriesImage/15881466037947068518.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111113', '福克斯', '242800.0', '', '1', '126', 'https://i1.cximg.com/img2/600x400/9c730a0484bd33606b889b25fcc43fa1/20200416/f2586b598d78458cb0be87930add3db5.png');
INSERT INTO `carinfo` VALUES ('111114', '科迈罗', '399000.0', '', '5', '132', null);
INSERT INTO `carinfo` VALUES ('111115', '奥迪Q5', '396400.0', '', '3', '124', 'https://youjia-image.cdn.bcebos.com/seriesImage/15890231883848387b06.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('111116', '自由光', '181500.0', '', '3', '133', 'https://youjia-image.cdn.bcebos.com/seriesImage/1588146485592665c70b.png@!w_600_fp');
INSERT INTO `carinfo` VALUES ('1000002', 'test', '1000.0', 'test', '3', '133', '');
INSERT INTO `carinfo` VALUES ('1000003', 'test', '1000.0', 'test', '1', '123', '');

-- ----------------------------
-- Table structure for carmodel
-- ----------------------------
DROP TABLE IF EXISTS `carmodel`;
CREATE TABLE `carmodel` (
  `modelid` int NOT NULL AUTO_INCREMENT,
  `modelname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carmodel
-- ----------------------------
INSERT INTO `carmodel` VALUES ('1', '轿车');
INSERT INTO `carmodel` VALUES ('2', '面包车');
INSERT INTO `carmodel` VALUES ('3', 'SUV');
INSERT INTO `carmodel` VALUES ('4', '卡车');
INSERT INTO `carmodel` VALUES ('5', '超跑');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '0',
  `totalprice` float(10,1) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `username` (`username`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'zdk', '2020-08-03 23:19:27', '1', '36000.0');
INSERT INTO `orders` VALUES ('2', 'zdk', '2020-08-05 06:08:51', '-1', '1591600.0');
INSERT INTO `orders` VALUES ('4', 'zdk', '2020-08-05 06:14:29', '1', '562400.0');
INSERT INTO `orders` VALUES ('5', 'zdk', '2020-08-05 06:27:23', '0', '451700.0');
INSERT INTO `orders` VALUES ('6', 'zz', '2020-08-05 06:50:57', '0', '540800.0');
INSERT INTO `orders` VALUES ('7', 'z', '2020-08-05 06:54:13', '1', '822100.0');
INSERT INTO `orders` VALUES ('8', 'zdk', '2020-08-05 11:59:54', '0', '449600.0');
INSERT INTO `orders` VALUES ('9', 'test', '2020-08-06 16:05:52', '-1', '1990600.0');

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int DEFAULT NULL,
  `carid` int DEFAULT NULL,
  `orderid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carid` (`carid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `carinfo` (`carid`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('1', '1', '111101', '1');
INSERT INTO `order_details` VALUES ('2', '1', '111102', '1');
INSERT INTO `order_details` VALUES ('3', '2', '111101', '2');
INSERT INTO `order_details` VALUES ('4', '2', '111102', '2');
INSERT INTO `order_details` VALUES ('5', '1', '111105', '4');
INSERT INTO `order_details` VALUES ('6', '1', '111106', '4');
INSERT INTO `order_details` VALUES ('7', '1', '111103', '5');
INSERT INTO `order_details` VALUES ('8', '1', '111104', '5');
INSERT INTO `order_details` VALUES ('9', '1', '111112', '6');
INSERT INTO `order_details` VALUES ('10', '1', '111103', '6');
INSERT INTO `order_details` VALUES ('11', '1', '111109', '7');
INSERT INTO `order_details` VALUES ('12', '1', '111110', '7');
INSERT INTO `order_details` VALUES ('13', '1', '111106', '8');
INSERT INTO `order_details` VALUES ('14', '1', '111103', '8');
INSERT INTO `order_details` VALUES ('15', '3', '111102', '9');
INSERT INTO `order_details` VALUES ('16', '2', '111101', '9');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `shoppingcartid` int NOT NULL AUTO_INCREMENT,
  `carid` int NOT NULL,
  `number` int NOT NULL,
  `price` float NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`shoppingcartid`),
  KEY `username` (`username`),
  KEY `carid` (`carid`),
  CONSTRAINT `shoppingcart_ibfk_3` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `shoppingcart_ibfk_4` FOREIGN KEY (`carid`) REFERENCES `carinfo` (`carid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('10', '111105', '1', '1', 'a');
INSERT INTO `shoppingcart` VALUES ('23', '111101', '2', '396800', 'zdk');
INSERT INTO `shoppingcart` VALUES ('24', '111102', '2', '399000', 'zdk');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  `classno` int DEFAULT '0',
  PRIMARY KEY (`username`),
  KEY `classno` (`classno`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`classno`) REFERENCES `userclass` (`classno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('a', '123', null, '123', '1234454524@qq.com', '2020-07-31 22:23:17', '1', '0');
INSERT INTO `user` VALUES ('adduser', '123', '男', '123', '', '2020-08-02 23:03:40', '1', '0');
INSERT INTO `user` VALUES ('t', '123', null, 'test', 'test', '2020-07-31 22:18:44', '0', '1');
INSERT INTO `user` VALUES ('test', '123', null, '', '', '2020-08-06 16:04:50', '0', '0');
INSERT INTO `user` VALUES ('z', '123', '男', '123', '123', '2020-08-01 22:00:51', '1', '0');
INSERT INTO `user` VALUES ('zdk', '123', '男', '1234', '123', '2020-07-31 22:18:50', '1', '0');
INSERT INTO `user` VALUES ('zz', '123', null, null, null, '2020-07-31 22:18:52', '0', '0');
INSERT INTO `user` VALUES ('zzz', '123', null, '', '', '2020-07-31 22:41:19', '1', '0');

-- ----------------------------
-- Table structure for userclass
-- ----------------------------
DROP TABLE IF EXISTS `userclass`;
CREATE TABLE `userclass` (
  `classno` int NOT NULL,
  `classname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userclass
-- ----------------------------
INSERT INTO `userclass` VALUES ('0', '普通用户');
INSERT INTO `userclass` VALUES ('1', 'VIP');
