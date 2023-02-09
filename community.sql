/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-04-02 18:50:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL COMMENT '父类ID',
  `type` int(11) NOT NULL COMMENT '父类类型',
  `commentator` int(11) NOT NULL COMMENT '评论人ID',
  `gmt_create` varchar(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` varchar(20) NOT NULL COMMENT '更新时间',
  `like_count` bigint(20) DEFAULT '0' COMMENT '点赞数',
  `content` varchar(1024) DEFAULT NULL,
  `comment_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '1', '2020-03-24 15:29:16', '2020-03-24 15:29:16', '0', '测试', '0');
INSERT INTO `comment` VALUES ('2', '1', '1', '1', '2020-03-24 15:33:53', '2020-03-24 15:33:53', '0', '测试2', '0');
INSERT INTO `comment` VALUES ('3', '1', '1', '1', '2020-03-24 15:35:46', '2020-03-24 15:35:46', '0', '测试3', '0');
INSERT INTO `comment` VALUES ('4', '1', '1', '1', '2020-03-25 20:57:18', '2020-03-25 20:57:18', '0', '测试4', '0');
INSERT INTO `comment` VALUES ('5', '1', '1', '1', '2020-03-25 21:12:51', '2020-03-25 21:12:51', '0', '测试5', '0');
INSERT INTO `comment` VALUES ('6', '1', '1', '1', '2020-03-25 23:44:14', '2020-03-25 23:44:14', '0', '测试6', '0');
INSERT INTO `comment` VALUES ('7', '1', '1', '1', '2020-03-26 13:48:59', '2020-03-26 13:48:59', '0', '测试7', '0');
INSERT INTO `comment` VALUES ('8', '1', '1', '3', '2020-03-26 13:50:39', '2020-03-26 13:50:39', '0', '测试8', '0');
INSERT INTO `comment` VALUES ('9', '1', '1', '2', '2020-03-26 13:50:53', '2020-03-26 13:50:53', '0', '测试9', '0');
INSERT INTO `comment` VALUES ('10', '1', '1', '2', '2020-03-26 15:22:09', '2020-03-26 15:22:09', '0', '测试10', '0');
INSERT INTO `comment` VALUES ('11', '1', '1', '2', '2020-03-26 15:44:23', '2020-03-26 15:44:23', '0', '测试11', '0');
INSERT INTO `comment` VALUES ('12', '1', '1', '2', '2020-03-26 15:47:39', '2020-03-26 15:47:39', '0', '测试12', '0');
INSERT INTO `comment` VALUES ('13', '1', '1', '3', '2020-03-26 15:47:58', '2020-03-26 15:47:58', '0', '测试13', '0');
INSERT INTO `comment` VALUES ('14', '1', '1', '3', '2020-03-26 21:04:26', '2020-03-26 21:04:26', '0', '测试14', '0');
INSERT INTO `comment` VALUES ('15', '1', '1', '3', '2020-03-26 21:05:16', '2020-03-26 21:05:16', '0', '测试15', '0');
INSERT INTO `comment` VALUES ('16', '1', '1', '3', '2020-03-26 21:05:50', '2020-03-26 21:05:50', '0', '测试16', '0');
INSERT INTO `comment` VALUES ('17', '1', '1', '3', '2020-03-26 21:06:33', '2020-03-26 21:06:33', '0', '测试17', '0');
INSERT INTO `comment` VALUES ('18', '1', '1', '3', '2020-03-26 21:07:09', '2020-03-26 21:07:09', '0', '测试18', '0');
INSERT INTO `comment` VALUES ('19', '18', '2', '2', '2020-03-27 17:03:48', '2020-03-27 17:03:48', '0', '二级回复1', '0');
INSERT INTO `comment` VALUES ('20', '18', '2', '2', '2020-03-27 17:07:20', '2020-03-27 17:07:20', '0', '二级回复2', '0');
INSERT INTO `comment` VALUES ('21', '18', '2', '2', '2020-03-27 17:11:07', '2020-03-27 17:11:07', '0', '二级回复3', '0');
INSERT INTO `comment` VALUES ('22', '18', '2', '2', '2020-03-27 17:14:23', '2020-03-27 17:14:23', '0', '二级回复4', '0');
INSERT INTO `comment` VALUES ('23', '18', '2', '3', '2020-03-27 17:23:35', '2020-03-27 17:23:35', '0', '二级回复5', '0');
INSERT INTO `comment` VALUES ('24', '18', '2', '2', '2020-03-27 17:25:25', '2020-03-27 17:25:25', '0', '二级回复6', '0');
INSERT INTO `comment` VALUES ('25', '13', '1', '2', '2020-03-27 17:37:09', '2020-03-27 17:37:09', '0', '测试1', '0');
INSERT INTO `comment` VALUES ('26', '13', '1', '2', '2020-03-27 17:42:43', '2020-03-27 17:42:43', '0', '测试2', '0');
INSERT INTO `comment` VALUES ('27', '13', '1', '2', '2020-03-27 17:43:45', '2020-03-27 17:43:45', '0', '测试3', '0');
INSERT INTO `comment` VALUES ('28', '13', '1', '2', '2020-03-27 17:44:34', '2020-03-27 17:44:34', '0', '测试4', '0');
INSERT INTO `comment` VALUES ('29', '13', '1', '2', '2020-03-27 17:45:59', '2020-03-27 17:45:59', '0', '测试5', '0');
INSERT INTO `comment` VALUES ('30', '13', '1', '2', '2020-03-27 17:46:26', '2020-03-27 17:46:26', '0', '测试6', '0');
INSERT INTO `comment` VALUES ('31', '13', '1', '2', '2020-03-27 17:46:52', '2020-03-27 17:46:52', '0', '测试7', '0');
INSERT INTO `comment` VALUES ('32', '13', '1', '2', '2020-03-27 17:47:17', '2020-03-27 17:47:17', '0', '测试8', '0');
INSERT INTO `comment` VALUES ('33', '13', '1', '2', '2020-03-27 17:47:58', '2020-03-27 17:47:58', '0', '测试9', '0');
INSERT INTO `comment` VALUES ('34', '13', '1', '2', '2020-03-27 17:49:25', '2020-03-27 17:49:25', '0', '测试10', '0');
INSERT INTO `comment` VALUES ('35', '13', '1', '2', '2020-03-27 17:51:12', '2020-03-27 17:51:12', '0', '测试11', '0');
INSERT INTO `comment` VALUES ('36', '34', '2', '2', '2020-03-27 17:51:43', '2020-03-27 17:51:43', '0', '二级回复1', '0');
INSERT INTO `comment` VALUES ('37', '35', '2', '3', '2020-03-27 18:20:45', '2020-03-27 18:20:45', '0', '11-1', '0');
INSERT INTO `comment` VALUES ('38', '35', '2', '2', '2020-03-27 18:27:19', '2020-03-27 18:27:19', '0', '11-2', '0');
INSERT INTO `comment` VALUES ('39', '35', '2', '2', '2020-03-27 18:27:26', '2020-03-27 18:27:26', '0', '11-2', '0');
INSERT INTO `comment` VALUES ('40', '12', '1', '2', '2020-03-27 22:01:18', '2020-03-27 22:01:18', '0', '测试', '0');
INSERT INTO `comment` VALUES ('41', '12', '1', '2', '2020-03-27 22:02:30', '2020-03-27 22:02:30', '0', '测试', '0');
INSERT INTO `comment` VALUES ('42', '12', '1', '2', '2020-03-27 22:03:12', '2020-03-27 22:03:12', '0', '测试2', '0');
INSERT INTO `comment` VALUES ('43', '42', '2', '2', '2020-03-27 22:03:30', '2020-03-27 22:03:30', '0', '测试', '0');
INSERT INTO `comment` VALUES ('44', '42', '2', '2', '2020-03-27 22:04:14', '2020-03-27 22:04:14', '0', '测试', '0');
INSERT INTO `comment` VALUES ('45', '42', '2', '2', '2020-03-27 22:04:24', '2020-03-27 22:04:24', '0', '测试', '0');
INSERT INTO `comment` VALUES ('46', '42', '2', '2', '2020-03-27 22:04:40', '2020-03-27 22:04:40', '0', '测试', '0');
INSERT INTO `comment` VALUES ('47', '35', '2', '2', '2020-03-27 22:06:00', '2020-03-27 22:06:00', '0', '测试', '0');
INSERT INTO `comment` VALUES ('48', '35', '2', '2', '2020-03-28 01:48:15', '2020-03-28 01:48:15', '0', '11-3', '0');
INSERT INTO `comment` VALUES ('49', '35', '2', '2', '2020-03-28 01:49:50', '2020-03-28 01:49:50', '0', '11-4', '0');
INSERT INTO `comment` VALUES ('50', '34', '2', '2', '2020-03-28 01:52:22', '2020-03-28 01:52:22', '0', '10-1', '0');
INSERT INTO `comment` VALUES ('51', '33', '2', '2', '2020-03-28 01:53:52', '2020-03-28 01:53:52', '0', '9-1', '0');
INSERT INTO `comment` VALUES ('52', '34', '2', '2', '2020-03-28 01:53:59', '2020-03-28 01:53:59', '0', '10-2', '0');
INSERT INTO `comment` VALUES ('53', '13', '1', '2', '2020-03-28 01:54:25', '2020-03-28 01:54:25', '0', '测试12', '0');
INSERT INTO `comment` VALUES ('54', '13', '1', '2', '2020-03-28 01:58:10', '2020-03-28 01:58:10', '0', '测试13', '0');
INSERT INTO `comment` VALUES ('55', '13', '1', '2', '2020-03-28 02:00:15', '2020-03-28 02:00:15', '0', '测试14', '0');
INSERT INTO `comment` VALUES ('56', '13', '1', '2', '2020-03-28 02:02:13', '2020-03-28 02:02:13', '0', '测试15', '0');
INSERT INTO `comment` VALUES ('57', '13', '1', '2', '2020-03-28 02:14:38', '2020-03-28 02:14:38', '0', '测试16', '0');
INSERT INTO `comment` VALUES ('58', '13', '1', '2', '2020-03-28 02:19:41', '2020-03-28 02:19:41', '0', '测试17', '0');
INSERT INTO `comment` VALUES ('59', '13', '1', '2', '2020-03-28 02:22:16', '2020-03-28 02:22:16', '0', '测试18', '0');
INSERT INTO `comment` VALUES ('60', '59', '2', '2', '2020-03-28 02:22:21', '2020-03-28 02:22:21', '0', '18-1', '0');
INSERT INTO `comment` VALUES ('61', '13', '1', '2', '2020-03-28 02:26:33', '2020-03-28 02:26:33', '0', '测试19', '0');
INSERT INTO `comment` VALUES ('62', '61', '2', '2', '2020-03-28 02:26:39', '2020-03-28 02:26:39', '0', '19-1', '0');
INSERT INTO `comment` VALUES ('63', '13', '1', '2', '2020-03-28 02:27:59', '2020-03-28 02:27:59', '0', '测试20', '0');
INSERT INTO `comment` VALUES ('64', '63', '2', '2', '2020-03-28 02:28:09', '2020-03-28 02:28:09', '0', '20-1', '0');
INSERT INTO `comment` VALUES ('65', '14', '1', '3', '2020-03-28 02:32:58', '2020-03-28 02:32:58', '0', '测试一下', '3');
INSERT INTO `comment` VALUES ('66', '65', '2', '3', '2020-03-28 02:33:04', '2020-03-28 02:33:04', '0', '二级', '0');
INSERT INTO `comment` VALUES ('67', '65', '2', '3', '2020-03-28 02:33:15', '2020-03-28 02:33:15', '0', '111', '0');
INSERT INTO `comment` VALUES ('68', '65', '2', '2', '2020-03-28 02:33:31', '2020-03-28 02:33:31', '0', '222', '0');
INSERT INTO `comment` VALUES ('69', '14', '1', '2', '2020-03-28 02:33:35', '2020-03-28 02:33:35', '0', '测试一下', '2');
INSERT INTO `comment` VALUES ('70', '69', '2', '2', '2020-03-28 02:33:40', '2020-03-28 02:33:40', '0', '3333', '0');
INSERT INTO `comment` VALUES ('71', '69', '2', '3', '2020-03-28 02:33:46', '2020-03-28 02:33:46', '0', '222222', '0');
INSERT INTO `comment` VALUES ('72', '14', '1', '2', '2020-03-28 17:15:02', '2020-03-28 17:15:02', '0', '测试', '0');
INSERT INTO `comment` VALUES ('73', '14', '1', '2', '2020-03-28 17:35:18', '2020-03-28 17:35:18', '0', '测试2', '3');
INSERT INTO `comment` VALUES ('74', '73', '2', '2', '2020-03-28 17:35:29', '2020-03-28 17:35:29', '0', '测试', '0');
INSERT INTO `comment` VALUES ('75', '73', '2', '2', '2020-03-28 17:35:47', '2020-03-28 17:35:47', '0', '测试2', '0');
INSERT INTO `comment` VALUES ('76', '73', '2', '2', '2020-03-28 18:11:41', '2020-03-28 18:11:41', '0', '测试3', '0');
INSERT INTO `comment` VALUES ('77', '14', '1', '2', '2020-03-28 18:11:49', '2020-03-28 18:11:49', '0', '测试3', '5');
INSERT INTO `comment` VALUES ('78', '77', '2', '2', '2020-03-28 18:11:57', '2020-03-28 18:11:57', '0', '测试', '0');
INSERT INTO `comment` VALUES ('79', '77', '2', '2', '2020-03-28 18:26:37', '2020-03-28 18:26:37', '0', '测试2', '0');
INSERT INTO `comment` VALUES ('80', '77', '2', '2', '2020-03-28 18:29:45', '2020-03-28 18:29:45', '0', '测试3', '0');
INSERT INTO `comment` VALUES ('81', '77', '2', '2', '2020-03-28 18:39:06', '2020-03-28 18:39:06', '0', '测试4', '0');
INSERT INTO `comment` VALUES ('82', '77', '2', '2', '2020-03-28 18:39:34', '2020-03-28 18:39:34', '0', '测试5', '0');
INSERT INTO `comment` VALUES ('83', '20', '1', '2', '2020-03-30 19:50:22', '2020-03-30 19:50:22', '0', '测试', '1');
INSERT INTO `comment` VALUES ('84', '20', '1', '2', '2020-03-30 19:51:24', '2020-03-30 19:51:24', '0', '测试', '0');
INSERT INTO `comment` VALUES ('85', '20', '1', '2', '2020-03-30 19:52:56', '2020-03-30 19:52:56', '0', '测试', '0');
INSERT INTO `comment` VALUES ('86', '20', '1', '2', '2020-03-30 22:29:18', '2020-03-30 22:29:18', '0', '测试2', '0');
INSERT INTO `comment` VALUES ('87', '20', '1', '2', '2020-03-30 22:29:25', '2020-03-30 22:29:25', '0', '测试3', '0');
INSERT INTO `comment` VALUES ('88', '20', '1', '2', '2020-03-30 22:29:37', '2020-03-30 22:29:37', '0', '测试4', '0');
INSERT INTO `comment` VALUES ('89', '83', '2', '2', '2020-03-30 22:31:14', '2020-03-30 22:31:14', '0', '测试', '0');
INSERT INTO `comment` VALUES ('90', '17', '1', '2', '2020-03-31 00:57:24', '2020-03-31 00:57:24', '0', '来了', '1');
INSERT INTO `comment` VALUES ('91', '90', '2', '2', '2020-03-31 00:57:30', '2020-03-31 00:57:30', '0', '知道了', '0');
INSERT INTO `comment` VALUES ('92', '26', '1', '2', '2020-04-01 02:35:09', '2020-04-01 02:35:09', '0', '好好学习', '1');
INSERT INTO `comment` VALUES ('93', '92', '2', '3', '2020-04-01 02:35:27', '2020-04-01 02:35:27', '0', '感谢', '0');
INSERT INTO `comment` VALUES ('94', '26', '1', '3', '2020-04-01 02:42:37', '2020-04-01 02:42:37', '0', '学习', '0');
INSERT INTO `comment` VALUES ('95', '26', '1', '3', '2020-04-01 02:45:42', '2020-04-01 02:45:42', '0', '学习', '2');
INSERT INTO `comment` VALUES ('96', '95', '2', '2', '2020-04-01 02:46:01', '2020-04-01 02:46:01', '0', '加油', '0');
INSERT INTO `comment` VALUES ('97', '95', '2', '3', '2020-04-01 02:46:16', '2020-04-01 02:46:16', '0', '感谢', '0');
INSERT INTO `comment` VALUES ('98', '26', '1', '2', '2020-04-01 02:47:01', '2020-04-01 02:47:01', '0', '学习', '2');
INSERT INTO `comment` VALUES ('99', '98', '2', '3', '2020-04-01 02:47:20', '2020-04-01 02:47:20', '0', '谢谢', '0');
INSERT INTO `comment` VALUES ('100', '98', '2', '2', '2020-04-01 02:47:41', '2020-04-01 02:47:41', '0', '不用', '0');

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `outerId` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '类型：1.问题的评论 2.二级评论',
  `gmt_create` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0.未读 1.已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES ('1', '2', '2', '20', '1', '2020-03-30 19:50:22', '1');
INSERT INTO `notification` VALUES ('2', '2', '2', '20', '1', '2020-03-30 19:51:24', '0');
INSERT INTO `notification` VALUES ('3', '2', '2', '20', '1', '2020-03-30 19:52:56', '0');
INSERT INTO `notification` VALUES ('4', '2', '2', '20', '1', '2020-03-30 22:29:18', '0');
INSERT INTO `notification` VALUES ('5', '2', '2', '20', '1', '2020-03-30 22:29:25', '0');
INSERT INTO `notification` VALUES ('6', '2', '2', '20', '1', '2020-03-30 22:29:37', '0');
INSERT INTO `notification` VALUES ('7', '2', '2', '83', '2', '2020-03-30 22:31:14', '1');
INSERT INTO `notification` VALUES ('8', '2', '2', '17', '1', '2020-03-31 00:57:24', '1');
INSERT INTO `notification` VALUES ('9', '2', '2', '90', '2', '2020-03-31 00:57:30', '1');
INSERT INTO `notification` VALUES ('10', '2', '3', '26', '1', '2020-04-01 02:35:09', '1');
INSERT INTO `notification` VALUES ('11', '3', '2', '92', '2', '2020-04-01 02:35:27', '1');
INSERT INTO `notification` VALUES ('12', '3', '3', '26', '1', '2020-04-01 02:42:37', '1');
INSERT INTO `notification` VALUES ('13', '2', '3', '95', '2', '2020-04-01 02:46:01', '1');
INSERT INTO `notification` VALUES ('14', '2', '3', '26', '1', '2020-04-01 02:47:01', '1');
INSERT INTO `notification` VALUES ('15', '3', '2', '98', '2', '2020-04-01 02:47:20', '1');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `like_count` int(11) DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '验证问题1', '测试一下1', '2020-03-20 19:36:00', '2020-03-21 18:49:58', '1', '14', '294', '0', '验证1');
INSERT INTO `question` VALUES ('2', '验证问题2', '测试一下2', '2020-03-20 22:55:00', '2020-03-20 22:55:00', '1', '0', '2', '0', '验证2');
INSERT INTO `question` VALUES ('3', '验证问题3', '测试一下3', '2020-03-20 23:41:16', '2020-03-22 13:49:04', '1', '0', '0', '0', '验证3');
INSERT INTO `question` VALUES ('6', '验证问题', '测试一下', '2020-03-21 18:50:40', '2020-03-21 18:50:40', '1', '0', '0', '0', '验证');
INSERT INTO `question` VALUES ('8', '验证问题4', '测试一下4', '2020-03-22 00:30:13', '2020-03-22 02:12:28', '1', '0', '0', '0', '验证4');
INSERT INTO `question` VALUES ('9', '验证问题5', '测试一下5', '2020-03-22 00:30:29', '2020-03-22 00:30:29', '1', '0', '1', '0', '验证5');
INSERT INTO `question` VALUES ('10', '验证问题6', '测试一下6', '2020-03-22 02:13:15', '2020-03-22 02:13:15', '1', '0', '0', '0', '验证6');
INSERT INTO `question` VALUES ('11', '验证问题8', '测试一下8', '2020-03-24 19:25:00', '2020-03-24 19:30:26', '2', '0', '23', '0', '验证8');
INSERT INTO `question` VALUES ('12', '验证问题7', '测试一下7', '2020-03-26 13:45:46', '2020-03-26 13:45:46', '3', '3', '14', '0', '验证7');
INSERT INTO `question` VALUES ('13', '验证问题9', '测试一下9', '2020-03-27 17:36:22', '2020-03-27 17:36:22', '2', '20', '197', '0', '验证9');
INSERT INTO `question` VALUES ('14', '验证问题11', '测试一下11', '2020-03-28 02:32:30', '2020-03-28 02:32:44', '3', '5', '48', '0', '验证11');
INSERT INTO `question` VALUES ('15', 'Spring Boot', 'Spring Boot', '2020-03-28 19:13:55', '2020-03-28 19:13:55', '2', '0', '26', '0', 'Spring Boot,Spring,Java');
INSERT INTO `question` VALUES ('16', 'Spring MVC', 'Spring MVC', '2020-03-29 00:26:12', '2020-03-29 00:26:12', '2', '0', '7', '0', 'Spring,Java');
INSERT INTO `question` VALUES ('17', 'Java', 'Java', '2020-03-29 00:26:25', '2020-03-29 00:26:25', '2', '1', '8', '0', 'Java');
INSERT INTO `question` VALUES ('18', 'Spring', 'Spring', '2020-03-29 00:29:22', '2020-03-29 00:29:22', '3', '0', '97', '0', 'Spring');
INSERT INTO `question` VALUES ('19', 'html', 'html', '2020-03-29 23:40:26', '2020-03-29 23:40:26', '2', '0', '3', '0', 'css,html,html5');
INSERT INTO `question` VALUES ('20', 'html5', 'html5', '2020-03-29 23:41:59', '2020-03-29 23:41:59', '2', '6', '17', '0', 'html5,html,css');
INSERT INTO `question` VALUES ('21', 'java', '```java\n @GetMapping(\"/logout\")\n public String logout(HttpServletRequest request,\n HttpServletResponse response){\n request.getSession().removeAttribute(\"user\");\n Cookie cookie = new Cookie(\"token\", null);\n cookie.setMaxAge(0);\n response.addCookie(cookie);\n return \"redirect:/\";\n }\n```', '2020-03-31 17:29:50', '2020-03-31 18:33:33', '2', '0', '53', '0', 'java');
INSERT INTO `question` VALUES ('22', '1', '11', '2020-03-31 18:08:16', '2020-03-31 18:08:16', '2', '0', '4', '0', 'java');
INSERT INTO `question` VALUES ('23', 'pp', '<script></script>', '2020-03-31 18:46:59', '2020-03-31 18:46:59', '2', '0', '6', '0', 'java');
INSERT INTO `question` VALUES ('24', 'html', '```html\n<!DOCTYPE HTML>\n<html xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <title>发布 - 社区</title>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    <link rel=\"stylesheet\" href=\"/css/bootstrap.min.css\">\n    <link rel=\"stylesheet\" href=\"/css/bootstrap-theme.min.css\">\n    <link rel=\"stylesheet\" href=\"/css/community.css\">\n    <link rel=\"stylesheet\" href=\"/css/editormd.min.css\">\n</head>\n<body>\n<div th:replace=\"navigation :: nav\"></div>\n<div class=\"container-fluid main\">\n    <div class=\"row\">\n        <div class=\"col-lg-9 col-md-12 col-sm-12 col-xs-12\">\n            <h2><span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\">发起</span></h2>\n            <hr/>\n            <form>\n                <div class=\"form-group\">\n                    <label for=\"title\">问题标题:</label>\n                    <input type=\"text\" class=\"form-control\" id=\"title\" name=\"title\" placeholder=\"问题标题...\">\n                    <span class=\"help-block\"></span>\n                </div>\n                <div class=\"form-group description\" id=\"question-editor\">\n                    <textarea name=\"description\" id=\"description\" class=\"form-control\" rows=\"10\" style=\"display: none;\"></textarea>\n                    <span class=\"help-block\"></span>\n                </div>\n                <div class=\"form-group\">\n                    <label for=\"title\">添加标签:</label>\n                    <input type=\"text\" class=\"form-control\" id=\"tag\" name=\"tag\"\n                           onclick=\"showSelectTag()\" autocomplete=\"off\" placeholder=\"输入标签，以,隔开\">\n                    <span class=\"help-block\"></span>\n                    <div id=\"select-tag\">\n                        <ul class=\"nav nav-tabs\" role=\"tablist\">\n                            <li role=\"presentation\" class=\"active\">\n                                <a href=\"#language\" aria-controls=\"language\" role=\"tab\" data-toggle=\"tab\" onclick=\"selectTags(1,\'language\')\">开发语言</a>\n                            </li>\n                            <li role=\"presentation\">\n                                <a href=\"#framework\" aria-controls=\"framework\" role=\"tab\" data-toggle=\"tab\" onclick=\"selectTags(2, \'framework\')\">平台框架</a>\n                            </li>\n                            <li role=\"presentation\">\n                                <a href=\"#server\" aria-controls=\"messages\" role=\"tab\" data-toggle=\"tab\" onclick=\"selectTags(3, \'server\')\">服务器</a>\n                            </li>\n                            <li role=\"presentation\">\n                                <a href=\"#database\" aria-controls=\"database\" role=\"tab\" data-toggle=\"tab\" onclick=\"selectTags(4, \'database\')\">数据库</a>\n                            </li>\n                            <li role=\"presentation\">\n                                <a href=\"#tool\" aria-controls=\"tool\" role=\"tab\" data-toggle=\"tab\" onclick=\"selectTags(5, \'tool\')\">开发工具</a>\n                            </li>\n                        </ul>\n                        <div class=\"tab-content\">\n                            <div role=\"tabpanel\" class=\"tab-pane active\" id=\"language\"></div>\n                            <div role=\"tabpanel\" class=\"tab-pane\" id=\"framework\"></div>\n                            <div role=\"tabpanel\" class=\"tab-pane\" id=\"server\"></div>\n                            <div role=\"tabpanel\" class=\"tab-pane\" id=\"database\"></div>\n                            <div role=\"tabpanel\" class=\"tab-pane\" id=\"tool\"></div>\n                        </div>\n                    </div>\n                </div>\n                <button id=\"releaseBtn\" type=\"button\" class=\"btn btn-success btn-publish\">发布</button>\n            </form>\n        </div>\n        <div class=\"col-lg-3 col-md-12 col-sm-12 col-xs-12\">\n            <h2>问题发起指南</h2>\n            • 问题标题: 请用精简的语言描述您发布的问题，不超过25字<br>\n            • 问题补充: 详细补充您的问题内容，并确保问题描述清晰直观, 并提供一些相关的资料<br>\n            • 选择标签: 选择一个或者多个合适的标签，用逗号隔开，每个标签不超过10个字\n        </div>\n    </div>\n</div>\n<script src=\"/jquery/jquery-2.1.1.min.js\"></script>\n<script src=\"/js/bootstrap.min.js\"></script>\n<script src=\"/js/editormd.min.js\"></script>\n<script src=\"/jquery/layer/layer.js\"></script>\n<script type=\"text/javascript\" src=\"/js/publish.js\"></script>\n</body>\n</html>\n```', '2020-03-31 18:50:02', '2020-03-31 18:50:02', '2', '0', '10', '0', 'html,html5');
INSERT INTO `question` VALUES ('25', '关于java', '![](http://thexwen.oss-cn-zhangjiakou.aliyuncs.com/411cdcc0-7de4-4961-9a77-69974a377b89.jpg?Expires=1587150369&OSSAccessKeyId=LTAI4FsPFh3JLANquriC6Kta&Signature=nyGDlbVOegBp9nmdjg8%2BhfbvBVg%3D)\n```java\n@ResponseBody\n    @PostMapping(\"/file/upload\")\n    public FileDTO upload(HttpServletRequest request){\n        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;\n        MultipartFile file = multipartRequest.getFile(\"editormd-image-file\");\n        try {\n            URL fileUrl = aliyunProvider.upload(file.getInputStream(), file.getOriginalFilename());\n            FileDTO fileDTO = new FileDTO();\n            fileDTO.setSuccess(1);\n            fileDTO.setUrl(fileUrl);\n            return fileDTO;\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n        FileDTO fileDTO = new FileDTO();\n        fileDTO.setSuccess(1);\n        //fileDTO.setUrl(\"/images/logos/editormd-logo-16x16.png\");\n        return fileDTO;\n    }\n```\n这样可以码', '2020-04-01 02:25:59', '2020-04-01 02:25:59', '2', '0', '1', '0', 'java');
INSERT INTO `question` VALUES ('26', '如何快速学习java', '如何快速学习java', '2020-04-01 02:29:33', '2020-04-01 02:29:33', '3', '4', '25', '0', 'java');
INSERT INTO `question` VALUES ('27', 'java ee', 'java ee', '2020-04-01 21:23:20', '2020-04-01 21:23:20', '2', '0', '0', '0', 'java');
INSERT INTO `question` VALUES ('28', 'java怎么学习', 'java怎么学习', '2020-04-01 21:23:42', '2020-04-01 21:23:42', '2', '0', '2', '0', 'java');
INSERT INTO `question` VALUES ('29', 'java', 'java', '2020-04-01 21:24:14', '2020-04-01 21:24:14', '2', '0', '0', '0', 'java');
INSERT INTO `question` VALUES ('30', 'java', 'java', '2020-04-01 21:24:21', '2020-04-01 21:24:21', '2', '0', '0', '0', 'java');
INSERT INTO `question` VALUES ('31', 'java', 'java', '2020-04-01 21:24:25', '2020-04-01 21:24:25', '2', '0', '0', '0', 'java');
INSERT INTO `question` VALUES ('32', 'java', 'java', '2020-04-01 21:24:34', '2020-04-01 21:24:34', '2', '0', '0', '0', 'java');
INSERT INTO `question` VALUES ('33', 'java', 'java', '2020-04-01 21:24:38', '2020-04-01 21:24:38', '2', '0', '0', '0', 'java');
INSERT INTO `question` VALUES ('34', 'java', 'java', '2020-04-01 21:24:43', '2020-04-01 21:24:43', '2', '0', '10', '0', 'java');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '标签类型：1.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'javascript', '1');
INSERT INTO `tag` VALUES ('2', 'php', '1');
INSERT INTO `tag` VALUES ('3', 'css', '1');
INSERT INTO `tag` VALUES ('4', 'html', '1');
INSERT INTO `tag` VALUES ('5', 'html5', '1');
INSERT INTO `tag` VALUES ('6', 'java', '1');
INSERT INTO `tag` VALUES ('7', 'node.js', '1');
INSERT INTO `tag` VALUES ('8', 'python', '1');
INSERT INTO `tag` VALUES ('9', 'c++', '1');
INSERT INTO `tag` VALUES ('10', 'c', '1');
INSERT INTO `tag` VALUES ('11', 'golang', '1');
INSERT INTO `tag` VALUES ('12', 'objective-c', '1');
INSERT INTO `tag` VALUES ('13', 'typescript', '1');
INSERT INTO `tag` VALUES ('14', 'shell', '1');
INSERT INTO `tag` VALUES ('15', 'swift', '1');
INSERT INTO `tag` VALUES ('16', 'c#', '1');
INSERT INTO `tag` VALUES ('17', 'sass', '1');
INSERT INTO `tag` VALUES ('18', 'ruby', '1');
INSERT INTO `tag` VALUES ('19', 'bash', '1');
INSERT INTO `tag` VALUES ('20', 'less', '1');
INSERT INTO `tag` VALUES ('21', 'asp.net', '1');
INSERT INTO `tag` VALUES ('22', 'lua', '1');
INSERT INTO `tag` VALUES ('23', 'scala', '1');
INSERT INTO `tag` VALUES ('24', 'coffeescript', '1');
INSERT INTO `tag` VALUES ('25', 'actionscript', '1');
INSERT INTO `tag` VALUES ('26', 'rust', '1');
INSERT INTO `tag` VALUES ('27', 'erlang', '1');
INSERT INTO `tag` VALUES ('28', 'perl', '1');
INSERT INTO `tag` VALUES ('29', 'laravel', '2');
INSERT INTO `tag` VALUES ('30', 'spring', '2');
INSERT INTO `tag` VALUES ('31', 'express', '2');
INSERT INTO `tag` VALUES ('32', 'django', '2');
INSERT INTO `tag` VALUES ('33', 'flask', '2');
INSERT INTO `tag` VALUES ('34', 'yii', '2');
INSERT INTO `tag` VALUES ('35', 'ruby-on-rails', '2');
INSERT INTO `tag` VALUES ('36', 'tornado', '2');
INSERT INTO `tag` VALUES ('37', 'koa', '2');
INSERT INTO `tag` VALUES ('38', 'struts', '2');
INSERT INTO `tag` VALUES ('39', 'linux', '3');
INSERT INTO `tag` VALUES ('40', 'nginx', '3');
INSERT INTO `tag` VALUES ('41', 'docker', '3');
INSERT INTO `tag` VALUES ('42', 'apache', '3');
INSERT INTO `tag` VALUES ('43', 'ubuntu', '3');
INSERT INTO `tag` VALUES ('44', 'centos', '3');
INSERT INTO `tag` VALUES ('45', '缓存', '3');
INSERT INTO `tag` VALUES ('46', '负载均衡', '3');
INSERT INTO `tag` VALUES ('47', 'unix', '3');
INSERT INTO `tag` VALUES ('48', 'hadoop', '3');
INSERT INTO `tag` VALUES ('49', 'windows-server', '3');
INSERT INTO `tag` VALUES ('50', 'mysql', '4');
INSERT INTO `tag` VALUES ('51', 'redis', '4');
INSERT INTO `tag` VALUES ('52', 'mongodb', '4');
INSERT INTO `tag` VALUES ('53', 'sql', '4');
INSERT INTO `tag` VALUES ('54', 'oracle', '4');
INSERT INTO `tag` VALUES ('55', 'nosql', '4');
INSERT INTO `tag` VALUES ('56', 'sqlserver', '4');
INSERT INTO `tag` VALUES ('57', 'postgresql', '4');
INSERT INTO `tag` VALUES ('58', 'sqlite', '4');
INSERT INTO `tag` VALUES ('59', 'git', '5');
INSERT INTO `tag` VALUES ('60', 'github', '5');
INSERT INTO `tag` VALUES ('61', 'visual-studio-code', '5');
INSERT INTO `tag` VALUES ('62', 'vim', '5');
INSERT INTO `tag` VALUES ('63', 'sublime-text', '5');
INSERT INTO `tag` VALUES ('64', 'xcode', '5');
INSERT INTO `tag` VALUES ('65', 'eclipse', '5');
INSERT INTO `tag` VALUES ('66', 'maven', '5');
INSERT INTO `tag` VALUES ('67', 'ide', '5');
INSERT INTO `tag` VALUES ('68', 'svn', '5');
INSERT INTO `tag` VALUES ('69', 'visual-studio', '5');
INSERT INTO `tag` VALUES ('70', 'atom', '5');
INSERT INTO `tag` VALUES ('71', 'textmate', '5');
INSERT INTO `tag` VALUES ('72', 'hg', '5');
INSERT INTO `tag` VALUES ('73', 'emacs', '5');
INSERT INTO `tag` VALUES ('74', 'memcached', '4');
INSERT INTO `tag` VALUES ('75', 'intellij-idea', '5');
INSERT INTO `tag` VALUES ('76', 'tomcat', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `token` char(36) DEFAULT NULL,
  `gmt_create` bigint(20) DEFAULT NULL,
  `gmt_modified` bigint(20) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '58874862', 'xw', '2f8ab59f-a3ac-42ad-b5cb-559672e949bb', '1584704143366', '1585034404017', null, 'https://avatars0.githubusercontent.com/u/58874862?v=4');
INSERT INTO `user` VALUES ('2', '5404568', 'xw98', 'c5b6607b-2682-43b5-adc4-32fafc2437d6', '1585049028538', '1585748042584', null, 'https://portrait.gitee.com/uploads/avatars/user/1801/5404568_xw98_1585049181.png');
INSERT INTO `user` VALUES ('3', '7370217', 'thexwen', '043ba375-fa5e-48fe-8087-6d4930609401', '1585201458551', '1585680328256', null, 'https://portrait.gitee.com/uploads/avatars/user/2456/7370217_thexwen_1585201641.png');
