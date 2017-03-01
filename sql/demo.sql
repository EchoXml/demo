/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-03-01 10:38:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appointment_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `user_id` bigint(20) NOT NULL COMMENT '学号',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  `state` int(11) DEFAULT '1' COMMENT '1-未归还，2-已归还',
  `return_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '归还日期',
  PRIMARY KEY (`appointment_id`),
  KEY `idx_appoint_time` (`appoint_time`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='预约图书表';

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('1', '1003', '25', '2017-02-27 16:51:14', '2', '2017-02-27 16:51:14');
INSERT INTO `appointment` VALUES ('3', '1008', '25', '2017-02-27 16:51:16', '2', '2017-02-27 16:51:16');
INSERT INTO `appointment` VALUES ('4', '1032', '25', '2017-02-27 16:51:17', '2', '2017-02-27 16:51:17');
INSERT INTO `appointment` VALUES ('5', '1033', '25', '2017-02-27 16:51:19', '2', '2017-02-27 16:51:19');
INSERT INTO `appointment` VALUES ('6', '1034', '25', '2017-02-27 16:51:20', '2', '2017-02-27 16:51:20');
INSERT INTO `appointment` VALUES ('7', '1034', '25', '2017-02-27 16:51:21', '2', '2017-02-27 16:51:21');
INSERT INTO `appointment` VALUES ('8', '1034', '25', '2017-02-27 16:51:23', '2', '2017-02-28 10:12:23');
INSERT INTO `appointment` VALUES ('9', '1034', '28', '2017-02-27 21:57:50', '2', '2017-02-27 22:29:54');
INSERT INTO `appointment` VALUES ('10', '1002', '28', '2017-02-27 22:30:24', '2', '2017-02-27 22:30:50');
INSERT INTO `appointment` VALUES ('11', '1003', '28', '2017-02-27 22:31:00', '1', null);
INSERT INTO `appointment` VALUES ('12', '1002', '25', '2017-02-28 14:57:58', '2', '2017-02-28 15:06:42');
INSERT INTO `appointment` VALUES ('14', '1022', '25', '2017-02-28 15:07:43', '2', '2017-02-28 15:07:59');
INSERT INTO `appointment` VALUES ('15', '1002', '36', '2017-02-28 16:16:28', '1', null);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `name` varchar(100) NOT NULL COMMENT '图书名称',
  `number` int(11) NOT NULL COMMENT '馆藏数量',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8 COMMENT='图书表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1002', '设计模式', '2');
INSERT INTO `book` VALUES ('1003', '编译原理', '47');
INSERT INTO `book` VALUES ('1008', '我的奋斗', '26');
INSERT INTO `book` VALUES ('1022', '信息技术', '9');
INSERT INTO `book` VALUES ('1023', 'MySQL从入门到放弃', '10');
INSERT INTO `book` VALUES ('1024', '货币战争', '10');
INSERT INTO `book` VALUES ('1029', '圣经', '17');
INSERT INTO `book` VALUES ('1032', 'HADOOP从入门到放弃', '3');
INSERT INTO `book` VALUES ('1033', '张三的歌', '6');
INSERT INTO `book` VALUES ('1034', '五环之歌', '17');
INSERT INTO `book` VALUES ('1036', '主', '11');

-- ----------------------------
-- Table structure for book_rec
-- ----------------------------
DROP TABLE IF EXISTS `book_rec`;
CREATE TABLE `book_rec` (
  `bookNum` bigint(255) DEFAULT NULL,
  `bookSum` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_rec
-- ----------------------------
INSERT INTO `book_rec` VALUES ('11', '158');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `uq_cityname` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('11', '上饶');
INSERT INTO `city` VALUES ('14', '乌鲁木齐');
INSERT INTO `city` VALUES ('3', '北京');
INSERT INTO `city` VALUES ('2', '南京');
INSERT INTO `city` VALUES ('12', '南昌');
INSERT INTO `city` VALUES ('8', '合肥');
INSERT INTO `city` VALUES ('15', '哈尔滨');
INSERT INTO `city` VALUES ('16', '大连');
INSERT INTO `city` VALUES ('13', '婺源');
INSERT INTO `city` VALUES ('10', '富阳');
INSERT INTO `city` VALUES ('4', '成都');
INSERT INTO `city` VALUES ('1', '杭州');
INSERT INTO `city` VALUES ('7', '武汉');
INSERT INTO `city` VALUES ('5', '重庆');
INSERT INTO `city` VALUES ('9', '阜阳');
INSERT INTO `city` VALUES ('17', '青岛');

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
INSERT INTO `permission` VALUES ('13', 'book:appoint', '3');
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
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `status` int(255) NOT NULL DEFAULT '3' COMMENT '状态',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `role_id` int(11) NOT NULL DEFAULT '3' COMMENT '所属角色',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  KEY `fk_userinfo_roleid_role_roleid` (`role_id`),
  CONSTRAINT `fk_userinfo_roleid_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'zhangsan', 'e81ad89ae567cde464e0bcc5a19a8f38', '张三', '1', '2017-02-22 19:07:57', '4');
INSERT INTO `user_info` VALUES ('16', 'lisisi', '0a88ae9a001e98060b94cff2746eb8e2\r\n', 'echo', '-2', '2017-02-21 18:40:51', '2');
INSERT INTO `user_info` VALUES ('21', 'EchoXml', 'c1cb530f7f9fb583c99421b47fa16387', '牡蛎', '1', '2017-02-21 19:45:13', '1');
INSERT INTO `user_info` VALUES ('25', 'zzzzzzz', 'e81ad89ae567cde464e0bcc5a19a8f38', '张思宁', '1', '2017-02-22 21:48:45', '3');
INSERT INTO `user_info` VALUES ('26', 'aaaaaa', '5238bf4a39eeeeec544b3370dccb51ed', 'aaaa', '1', '2017-02-27 19:05:21', '3');
INSERT INTO `user_info` VALUES ('28', 'zhangsi', '4c79ac921d37ef0d9ca3f21bc7563e57', '唐阿宝', '1', '2017-02-27 21:29:26', '3');
INSERT INTO `user_info` VALUES ('35', 'aasdasdas', '0450e3e06e05f494d585a122621d07cf', 'asdasdas', '1', '2017-02-28 15:11:45', '3');
INSERT INTO `user_info` VALUES ('36', '1111111', '974f899bc6a12058f6dde0a571899adc', '爸爸', '1', '2017-02-28 16:15:20', '3');

-- ----------------------------
-- Table structure for visitor_rec
-- ----------------------------
DROP TABLE IF EXISTS `visitor_rec`;
CREATE TABLE `visitor_rec` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  `ip_address` varchar(255) NOT NULL COMMENT 'ip地址',
  `user_agent` varchar(255) NOT NULL COMMENT '浏览器版本号、类型',
  `request_url` varchar(255) NOT NULL COMMENT '请求的Url',
  PRIMARY KEY (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitor_rec
-- ----------------------------
INSERT INTO `visitor_rec` VALUES ('1', '2017-03-01 08:24:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'none');
INSERT INTO `visitor_rec` VALUES ('7', '2017-03-01 08:24:30', '192.168.99.177', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 6 Build/MOB31K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.91 Mobile Safari/537.36', 'none');
INSERT INTO `visitor_rec` VALUES ('10', '2017-03-01 08:43:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '10692/page/login');
INSERT INTO `visitor_rec` VALUES ('11', '2017-03-01 08:45:19', '192.168.4.113', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '60266/page/login');
INSERT INTO `visitor_rec` VALUES ('12', '2017-03-01 08:52:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:111283/page/login');
INSERT INTO `visitor_rec` VALUES ('13', '2017-03-01 08:53:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:111390/page/login');
INSERT INTO `visitor_rec` VALUES ('14', '2017-03-01 08:59:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:112235/page/login');
INSERT INTO `visitor_rec` VALUES ('15', '2017-03-01 09:06:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:112777/page/login');
INSERT INTO `visitor_rec` VALUES ('16', '2017-03-01 09:08:44', '192.168.4.113', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '192.168.4.11361924/page/login');
INSERT INTO `visitor_rec` VALUES ('17', '2017-03-01 09:12:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:113274/page/login');
INSERT INTO `visitor_rec` VALUES ('18', '2017-03-01 09:17:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:113833/page/login');
INSERT INTO `visitor_rec` VALUES ('19', '2017-03-01 09:20:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:114132/page/login');
INSERT INTO `visitor_rec` VALUES ('20', '2017-03-01 09:22:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:114361/page/login');
INSERT INTO `visitor_rec` VALUES ('21', '2017-03-01 09:25:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:114666/page/login');
INSERT INTO `visitor_rec` VALUES ('22', '2017-03-01 09:28:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:114960/page/login');
INSERT INTO `visitor_rec` VALUES ('23', '2017-03-01 09:54:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:117116/page/login');
INSERT INTO `visitor_rec` VALUES ('24', '2017-03-01 09:55:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:117251/page/login');
INSERT INTO `visitor_rec` VALUES ('25', '2017-03-01 10:02:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:117756/page/login');
INSERT INTO `visitor_rec` VALUES ('26', '2017-03-01 10:32:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0:0:0:0:0:0:0:120784/page/login');

-- ----------------------------
-- Table structure for web_info
-- ----------------------------
DROP TABLE IF EXISTS `web_info`;
CREATE TABLE `web_info` (
  `rec_date` date NOT NULL,
  `user_register_num` int(11) NOT NULL DEFAULT '0' COMMENT '当日用户注册数',
  `rec_ip` int(11) NOT NULL DEFAULT '0' COMMENT '当日网站IP数',
  `rec_book_return` int(11) NOT NULL DEFAULT '0' COMMENT '当日图书归还数',
  `rec_book_appoint` int(11) NOT NULL DEFAULT '0' COMMENT '当日图书预约数',
  `rec_uv` int(11) NOT NULL DEFAULT '0' COMMENT '当日独立访客人数',
  PRIMARY KEY (`rec_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_info
-- ----------------------------
INSERT INTO `web_info` VALUES ('2017-02-28', '2', '2', '1', '4', '0');
INSERT INTO `web_info` VALUES ('2017-03-01', '0', '3', '0', '0', '0');

-- ----------------------------
-- Procedure structure for proaddwebinfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `proaddwebinfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proaddwebinfo`()
BEGIN
insert into web_info  values ();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `appoint_ai`;
DELIMITER ;;
CREATE TRIGGER `appoint_ai` AFTER INSERT ON `appointment` FOR EACH ROW UPDATE web_info w SET w.rec_book_appoint=w.rec_book_appoint+1
where  w.rec_date=CURRENT_DATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `appoint_au`;
DELIMITER ;;
CREATE TRIGGER `appoint_au` AFTER UPDATE ON `appointment` FOR EACH ROW UPDATE web_info w SET w.rec_book_return=w.rec_book_return+1
where  w.rec_date=CURRENT_DATE() and NEW.return_time is not null and OLD.return_time is null
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_ai`;
DELIMITER ;;
CREATE TRIGGER `book_ai` BEFORE INSERT ON `book` FOR EACH ROW UPDATE book_rec b SET b.bookNum=b.bookNum+1,
b.bookSum=b.bookSum+NEW.number
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_au`;
DELIMITER ;;
CREATE TRIGGER `book_au` BEFORE UPDATE ON `book` FOR EACH ROW UPDATE book_rec  set bookSum=bookSum-old.number+new.number
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_ad`;
DELIMITER ;;
CREATE TRIGGER `book_ad` BEFORE DELETE ON `book` FOR EACH ROW UPDATE book_rec b SET b.bookNum=b.bookNum-1,
b.bookSum=b.bookSum-old.number
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `userinfo_ai`;
DELIMITER ;;
CREATE TRIGGER `userinfo_ai` AFTER INSERT ON `user_info` FOR EACH ROW UPDATE web_info w SET w.user_register_num= w.user_register_num+1
where  w.rec_date=CURRENT_DATE()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `visitorrec_ai`;
DELIMITER ;;
CREATE TRIGGER `visitorrec_ai` AFTER INSERT ON `visitor_rec` FOR EACH ROW UPDATE web_info w SET w.rec_ip= (select count(1) from (
select DISTINCT ip_address from visitor_rec v where LEFT(v.visit_time,10)=CURRENT_DATE()) a)
where  w.rec_date=CURRENT_DATE()
;;
DELIMITER ;
