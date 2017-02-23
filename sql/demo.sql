/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-02-23 21:44:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `user_id` bigint(20) NOT NULL COMMENT '学号',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`book_id`,`user_id`),
  KEY `idx_appoint_time` (`appoint_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约图书表';

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('1000', '12345678910', '2017-02-07 15:11:59');
INSERT INTO `appointment` VALUES ('1000', '1208080808', '2017-02-07 16:08:46');
INSERT INTO `appointment` VALUES ('1000', '20000', '2017-02-07 16:11:37');
INSERT INTO `appointment` VALUES ('1001', '1208080808', '2017-02-08 20:34:14');
INSERT INTO `appointment` VALUES ('1000', '1', '2017-02-10 10:06:48');
INSERT INTO `appointment` VALUES ('1006', '1', '2017-02-10 10:08:20');
INSERT INTO `appointment` VALUES ('1005', '1', '2017-02-10 10:14:50');
INSERT INTO `appointment` VALUES ('1010', '1', '2017-02-10 10:34:59');
INSERT INTO `appointment` VALUES ('1008', '1', '2017-02-10 10:43:40');
INSERT INTO `appointment` VALUES ('1001', '1', '2017-02-10 10:47:21');
INSERT INTO `appointment` VALUES ('1016', '1', '2017-02-10 10:49:23');
INSERT INTO `appointment` VALUES ('1011', '1', '2017-02-10 10:50:37');
INSERT INTO `appointment` VALUES ('1009', '1', '2017-02-10 16:46:22');
INSERT INTO `appointment` VALUES ('1018', '1', '2017-02-11 17:26:25');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `name` varchar(100) NOT NULL COMMENT '图书名称',
  `number` int(11) NOT NULL COMMENT '馆藏数量',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8 COMMENT='图书表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1002', '设计模式', '11');
INSERT INTO `book` VALUES ('1003', '编译原理', '67');
INSERT INTO `book` VALUES ('1008', '我的奋斗', '30');
INSERT INTO `book` VALUES ('1022', '信息技术', '10');
INSERT INTO `book` VALUES ('1023', 'MySQL从入门到放弃', '10');
INSERT INTO `book` VALUES ('1024', '货币战争', '10');
INSERT INTO `book` VALUES ('1029', '圣经', '20');
INSERT INTO `book` VALUES ('1032', 'HADOOP从入门到放弃', '10');
INSERT INTO `book` VALUES ('1033', '张三的歌', '10');

-- ----------------------------
-- Table structure for bookrec
-- ----------------------------
DROP TABLE IF EXISTS `bookrec`;
CREATE TABLE `bookrec` (
  `bookNum` bigint(255) DEFAULT NULL,
  `bookSum` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookrec
-- ----------------------------
INSERT INTO `bookrec` VALUES ('9', '178');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `fk_permission_id_role_id` (`role_id`),
  CONSTRAINT `fk_permission_id_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'user:select', '1');
INSERT INTO `permission` VALUES ('2', 'user:select', '2');
INSERT INTO `permission` VALUES ('3', 'user:update', '2');
INSERT INTO `permission` VALUES ('4', 'user:delete', '1');
INSERT INTO `permission` VALUES ('5', 'user:update', '1');
INSERT INTO `permission` VALUES ('6', 'user:add', '1');
INSERT INTO `permission` VALUES ('7', 'book:add', '2');
INSERT INTO `permission` VALUES ('8', 'book:update', '1');
INSERT INTO `permission` VALUES ('9', 'book:delete', '1');
INSERT INTO `permission` VALUES ('11', 'book:add', '1');
INSERT INTO `permission` VALUES ('12', 'book:delete', '2');
INSERT INTO `permission` VALUES ('13', 'book:apoint', '3');
INSERT INTO `permission` VALUES ('14', 'book:select', '1');
INSERT INTO `permission` VALUES ('15', 'book:select', '2');
INSERT INTO `permission` VALUES ('16', 'book:select', '3');
INSERT INTO `permission` VALUES ('17', 'book:update', '2');
INSERT INTO `permission` VALUES ('18', 'user:select', '4');
INSERT INTO `permission` VALUES ('19', 'appoint:del', '1');
INSERT INTO `permission` VALUES ('20', 'appoint:del', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'superadmin');
INSERT INTO `role` VALUES ('2', 'admin');
INSERT INTO `role` VALUES ('3', 'register');
INSERT INTO `role` VALUES ('4', 'guess');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `status` int(255) NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  KEY `fk_userinfo_roleid_role_roleid` (`role_id`),
  CONSTRAINT `fk_userinfo_roleid_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'zhangsan', 'e81ad89ae567cde464e0bcc5a19a8f38', '张三', '1', '2017-02-22 19:07:57', '4');
INSERT INTO `userinfo` VALUES ('16', 'lisisi', '0a88ae9a001e98060b94cff2746eb8e2\r\n', 'echo', '-2', '2017-02-21 18:40:51', '2');
INSERT INTO `userinfo` VALUES ('21', 'EchoXml', 'c1cb530f7f9fb583c99421b47fa16387', '牡蛎', '1', '2017-02-21 19:45:13', '1');
INSERT INTO `userinfo` VALUES ('25', 'zzzzzzz', 'e81ad89ae567cde464e0bcc5a19a8f38', '张思宁', '1', '2017-02-22 21:48:45', '3');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `status` int(255) NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'zhangsan', 'zhangsan', '张三', '1', '2017-02-07 19:51:18');
INSERT INTO `users` VALUES ('3', 'wangwu', 'wangwu', '王五', '1', '2017-02-02 19:52:01');
INSERT INTO `users` VALUES ('4', 'admi', 'admin', '管理员账户', '1', '2017-02-16 15:11:06');
INSERT INTO `users` VALUES ('16', 'echoecho', 'echoecho', 'echo', '-2', '2017-02-16 15:07:14');
INSERT INTO `users` VALUES ('20', 'tangba', 'tangba', '唐八', '1', '2017-02-06 19:52:25');
INSERT INTO `users` VALUES ('21', 'EchoXml', 'zzzzzzzz', '牡蛎', '1', '2017-02-07 19:52:30');
INSERT INTO `users` VALUES ('23', 't95921', 'zzzzzzzz', 't95921', '1', '2017-02-16 14:07:37');
DROP TRIGGER IF EXISTS `book_ai`;
DELIMITER ;;
CREATE TRIGGER `book_ai` BEFORE INSERT ON `book` FOR EACH ROW UPDATE bookrec b SET b.bookNum=b.bookNum+1,
b.bookSum=b.bookSum+NEW.number
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_au`;
DELIMITER ;;
CREATE TRIGGER `book_au` BEFORE UPDATE ON `book` FOR EACH ROW UPDATE bookrec  set bookSum=bookSum-old.number+new.number
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_ad`;
DELIMITER ;;
CREATE TRIGGER `book_ad` BEFORE DELETE ON `book` FOR EACH ROW UPDATE bookrec b SET b.bookNum=b.bookNum-1,
b.bookSum=b.bookSum-old.number
;;
DELIMITER ;
