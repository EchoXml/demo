/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-02-15 18:40:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `student_id` bigint(20) NOT NULL COMMENT '学号',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`book_id`,`student_id`),
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
INSERT INTO `appointment` VALUES ('1003', '1', '2017-02-10 10:39:47');
INSERT INTO `appointment` VALUES ('1008', '1', '2017-02-10 10:43:40');
INSERT INTO `appointment` VALUES ('1002', '1', '2017-02-10 10:44:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8 COMMENT='图书表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1001', '数据结构', '66');
INSERT INTO `book` VALUES ('1002', '设计模式', '67');
INSERT INTO `book` VALUES ('1003', '编译原理', '67');
INSERT INTO `book` VALUES ('1008', '我的奋斗', '30');
INSERT INTO `book` VALUES ('1022', '信息技术', '10');
INSERT INTO `book` VALUES ('1023', 'MySQL从入门到放弃', '10');
INSERT INTO `book` VALUES ('1024', '货币战争', '10');
INSERT INTO `book` VALUES ('1025', 'Java从入门到放弃', '10');
INSERT INTO `book` VALUES ('1029', '圣经', '20');
INSERT INTO `book` VALUES ('1031', '圣经', '20');

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
INSERT INTO `bookrec` VALUES ('10', '310');

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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'zhangsan', 'zhangsan', '张三', '1');
INSERT INTO `userinfo` VALUES ('2', 'lisi', 'lisi', '李四', '1');
INSERT INTO `userinfo` VALUES ('3', 'wangwu', 'wangwu', '王五', '1');
INSERT INTO `userinfo` VALUES ('4', 'admin', 'admin', '管理员账户', '1');
INSERT INTO `userinfo` VALUES ('14', 'admin2', 'admin2', 'admin', '1');
INSERT INTO `userinfo` VALUES ('16', 'echosoul', 'echoecho', 'echo', '1');
INSERT INTO `userinfo` VALUES ('18', 'zhangsan2', 'zhangsan', 'lisi', '1');
INSERT INTO `userinfo` VALUES ('19', 'testest', 'testtest', '测试账号', '1');
INSERT INTO `userinfo` VALUES ('20', 'tangba', 'tangba', '唐八', '1');
INSERT INTO `userinfo` VALUES ('21', 'EchoXml', 'zzzzzzzz', '牡蛎', '1');
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
