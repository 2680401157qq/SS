/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : dormitory

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-06-03 18:09:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin', '1', '超级管理员', '0', '13211111112', 'jack@126.com');
INSERT INTO `tb_admin` VALUES ('2', 'stu', 'E10ADC3949BA59ABBE56E057F20F883E', '露丝', '2', null, '0', '12345678900', '123@126.com');
INSERT INTO `tb_admin` VALUES ('3', '维修人员1', 'E10ADC3949BA59ABBE56E057F20F883E', '电工', '4', null, '1', '13211111111', '123@qq.com');
INSERT INTO `tb_admin` VALUES ('4', '维修人员2', 'E10ADC3949BA59ABBE56E057F20F883E', '水工', '4', null, '1', '13211111111', '12321@126.com');
INSERT INTO `tb_admin` VALUES ('5', '班级管理员', 'E10ADC3949BA59ABBE56E057F20F883E', '班级管理员', '5', null, '1', '13211111111', '123654@126.com');

-- ----------------------------
-- Table structure for tb_adminlog
-- ----------------------------
DROP TABLE IF EXISTS `tb_adminlog`;
CREATE TABLE `tb_adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminUsername` varchar(255) DEFAULT NULL,
  `loginIp` varchar(255) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `logoutTime` datetime DEFAULT NULL,
  `isSafeExit` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_adminlog
-- ----------------------------
INSERT INTO `tb_adminlog` VALUES ('173', 'jack', '0:0:0:0:0:0:0:1', '2020-06-02 18:55:34', '2020-06-02 18:56:37', '1');
INSERT INTO `tb_adminlog` VALUES ('174', 'stu', '0:0:0:0:0:0:0:1', '2020-06-03 12:53:35', '2020-06-03 12:54:21', '1');
INSERT INTO `tb_adminlog` VALUES ('175', 'admin', '0:0:0:0:0:0:0:1', '2020-06-03 12:54:39', '2020-06-03 12:58:36', '1');
INSERT INTO `tb_adminlog` VALUES ('176', 'admin', '0:0:0:0:0:0:0:1', '2020-06-03 17:56:51', '2020-06-03 18:08:33', '1');

-- ----------------------------
-- Table structure for tb_class
-- ----------------------------
DROP TABLE IF EXISTS `tb_class`;
CREATE TABLE `tb_class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(255) DEFAULT NULL,
  `classNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_class
-- ----------------------------
INSERT INTO `tb_class` VALUES ('1', '计算机一班', '优秀班集体');
INSERT INTO `tb_class` VALUES ('2', '计算机二班', '很好的班级');
INSERT INTO `tb_class` VALUES ('4', '自动化二班', '自动化专业');
INSERT INTO `tb_class` VALUES ('6', '机械工程一班', '优秀班集体');
INSERT INTO `tb_class` VALUES ('7', '机械工程二班', '不错的班级');
INSERT INTO `tb_class` VALUES ('8', '人文历史一班', '还行');
INSERT INTO `tb_class` VALUES ('9', '自动化三班', '不错');

-- ----------------------------
-- Table structure for tb_clean
-- ----------------------------
DROP TABLE IF EXISTS `tb_clean`;
CREATE TABLE `tb_clean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cleanTime` datetime DEFAULT NULL,
  `studentId` int(111) DEFAULT NULL,
  `cleanLevel` int(11) DEFAULT NULL,
  `dormitoryId` int(111) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_clean
-- ----------------------------
INSERT INTO `tb_clean` VALUES ('12', '2017-06-03 00:00:00', '11', '0', '9');

-- ----------------------------
-- Table structure for tb_dormitory
-- ----------------------------
DROP TABLE IF EXISTS `tb_dormitory`;
CREATE TABLE `tb_dormitory` (
  `dormitoryId` int(11) NOT NULL AUTO_INCREMENT,
  `dormitoryNumber` varchar(255) DEFAULT NULL,
  `dormitoryPhoto` varchar(255) DEFAULT NULL,
  `dormitoryPhotoDetail` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`dormitoryId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_dormitory
-- ----------------------------
INSERT INTO `tb_dormitory` VALUES ('9', '478', '/ssm_layui_dormitory/file/78230680-f3d4-42d7-bf67-ddf705866b76.jpg', '');

-- ----------------------------
-- Table structure for tb_fix
-- ----------------------------
DROP TABLE IF EXISTS `tb_fix`;
CREATE TABLE `tb_fix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixTime` datetime DEFAULT NULL,
  `dormitoryId` int(11) DEFAULT NULL,
  `fixPepoleId` int(11) DEFAULT NULL,
  `fixStatus` int(11) DEFAULT NULL,
  `fixNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_fix
-- ----------------------------
INSERT INTO `tb_fix` VALUES ('9', '2016-06-03 00:00:00', '9', '4', '1', '马桶');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `menuId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `perms` varchar(255) DEFAULT NULL,
  `spread` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `sorting` bigint(255) unsigned DEFAULT NULL,
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '后台首页', 'layui-icon-home', null, null, 'false', '0', '1');
INSERT INTO `tb_menu` VALUES ('2', '我的面板', 'layui-icon-username', null, null, 'false', '0', '2');
INSERT INTO `tb_menu` VALUES ('3', '个人信息', 'layui-icon-username', '../admin/personalDate', null, 'false', '2', '111');
INSERT INTO `tb_menu` VALUES ('4', '修改密码', 'layui-icon-password', '../admin/changePassword', null, 'false', '2', '112');
INSERT INTO `tb_menu` VALUES ('5', '登录日志', 'layui-icon-log', '../admin/adminLoginLog', null, 'false', '2', '113');
INSERT INTO `tb_menu` VALUES ('6', '管理员管理', 'layui-icon-set', null, null, 'false', '0', '3');
INSERT INTO `tb_menu` VALUES ('7', '管理员列表', 'layui-icon-more-vertical', '../admin/adminList', null, 'false', '6', '114');
INSERT INTO `tb_menu` VALUES ('8', '角色管理', 'layui-icon-form', '../admin/roleList', null, 'false', '6', '115');
INSERT INTO `tb_menu` VALUES ('9', '学生管理', 'layui-icon-password', null, null, 'false', '0', '4');
INSERT INTO `tb_menu` VALUES ('10', '学生列表', 'layui-icon-username', '../student/studentList', null, 'flase', '9', '116');
INSERT INTO `tb_menu` VALUES ('11', '班级管理', 'layui-icon-home', null, null, 'false', '0', '5');
INSERT INTO `tb_menu` VALUES ('12', '班级列表', 'layui-icon-form', '../class/classList', null, 'false', '11', '117');
INSERT INTO `tb_menu` VALUES ('13', '宿舍管理', 'layui-icon-username', null, null, 'false', '0', '6');
INSERT INTO `tb_menu` VALUES ('14', '宿舍信息', 'layui-icon-more-vertical', '../dormitory/dormitoryList', null, 'false', '13', '118');
INSERT INTO `tb_menu` VALUES ('15', '卫生打扫记录', 'layui-icon-password', '../clean/cleanList', null, 'false', '13', '119');
INSERT INTO `tb_menu` VALUES ('16', '维修记录', 'layui-icon-username', '../fix/fixList', null, 'flase', '13', '120');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `roleRemark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '超级管理员', '所有权限');
INSERT INTO `tb_role` VALUES ('2', '学生管理员', '管理学生信息');
INSERT INTO `tb_role` VALUES ('3', '宿舍管理员', '维护宿舍信息');
INSERT INTO `tb_role` VALUES ('4', '维修管理员', '负责宿舍维修');
INSERT INTO `tb_role` VALUES ('5', '班级管理员', '维护班级信息');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `roleId` bigint(20) NOT NULL,
  `menuId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('1', '1');
INSERT INTO `tb_role_menu` VALUES ('1', '2');
INSERT INTO `tb_role_menu` VALUES ('1', '3');
INSERT INTO `tb_role_menu` VALUES ('1', '4');
INSERT INTO `tb_role_menu` VALUES ('1', '5');
INSERT INTO `tb_role_menu` VALUES ('1', '6');
INSERT INTO `tb_role_menu` VALUES ('1', '7');
INSERT INTO `tb_role_menu` VALUES ('1', '8');
INSERT INTO `tb_role_menu` VALUES ('1', '9');
INSERT INTO `tb_role_menu` VALUES ('1', '10');
INSERT INTO `tb_role_menu` VALUES ('1', '11');
INSERT INTO `tb_role_menu` VALUES ('1', '12');
INSERT INTO `tb_role_menu` VALUES ('1', '13');
INSERT INTO `tb_role_menu` VALUES ('1', '14');
INSERT INTO `tb_role_menu` VALUES ('1', '15');
INSERT INTO `tb_role_menu` VALUES ('1', '16');
INSERT INTO `tb_role_menu` VALUES ('4', '1');
INSERT INTO `tb_role_menu` VALUES ('4', '2');
INSERT INTO `tb_role_menu` VALUES ('4', '3');
INSERT INTO `tb_role_menu` VALUES ('4', '4');
INSERT INTO `tb_role_menu` VALUES ('4', '5');
INSERT INTO `tb_role_menu` VALUES ('4', '13');
INSERT INTO `tb_role_menu` VALUES ('4', '16');
INSERT INTO `tb_role_menu` VALUES ('3', '1');
INSERT INTO `tb_role_menu` VALUES ('3', '2');
INSERT INTO `tb_role_menu` VALUES ('3', '3');
INSERT INTO `tb_role_menu` VALUES ('3', '4');
INSERT INTO `tb_role_menu` VALUES ('3', '5');
INSERT INTO `tb_role_menu` VALUES ('3', '13');
INSERT INTO `tb_role_menu` VALUES ('3', '14');
INSERT INTO `tb_role_menu` VALUES ('2', '1');
INSERT INTO `tb_role_menu` VALUES ('2', '2');
INSERT INTO `tb_role_menu` VALUES ('2', '3');
INSERT INTO `tb_role_menu` VALUES ('2', '4');
INSERT INTO `tb_role_menu` VALUES ('2', '5');
INSERT INTO `tb_role_menu` VALUES ('2', '9');
INSERT INTO `tb_role_menu` VALUES ('2', '10');
INSERT INTO `tb_role_menu` VALUES ('5', '1');
INSERT INTO `tb_role_menu` VALUES ('5', '2');
INSERT INTO `tb_role_menu` VALUES ('5', '3');
INSERT INTO `tb_role_menu` VALUES ('5', '4');
INSERT INTO `tb_role_menu` VALUES ('5', '5');
INSERT INTO `tb_role_menu` VALUES ('5', '11');
INSERT INTO `tb_role_menu` VALUES ('5', '12');
INSERT INTO `tb_role_menu` VALUES ('6', '1');
INSERT INTO `tb_role_menu` VALUES ('6', '2');
INSERT INTO `tb_role_menu` VALUES ('6', '3');
INSERT INTO `tb_role_menu` VALUES ('6', '4');
INSERT INTO `tb_role_menu` VALUES ('6', '5');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `classId` int(11) NOT NULL,
  `dormitoryId` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('9', '邓世杰', '12345678930', '123@qq.com', '广州', '无', '2', '9', '1', '1', '2009-06-03');
INSERT INTO `tb_student` VALUES ('10', '李茂源', '12345678902', '123456@qq.com', '湛江', '帅哥', '2', '9', '1', '1', '2013-06-03');
INSERT INTO `tb_student` VALUES ('11', '林凯', '12306456789', '0321@qq.com', '广州', '无', '2', '9', '0', '0', '2012-06-03');

-- ----------------------------
-- View structure for stu
-- ----------------------------
DROP VIEW IF EXISTS `stu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stu` AS select `tb_student`.`id` AS `id`,`tb_student`.`username` AS `username`,`tb_student`.`phone` AS `phone`,`tb_student`.`email` AS `email`,`tb_student`.`address` AS `address`,`tb_student`.`note` AS `note`,`tb_student`.`classId` AS `classId`,`tb_student`.`dormitoryId` AS `dormitoryId`,`tb_student`.`level` AS `level`,`tb_student`.`sex` AS `sex`,`tb_student`.`birthday` AS `birthday` from `tb_student` ;
