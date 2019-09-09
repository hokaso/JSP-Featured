/*
 Navicat Premium Data Transfer

 Source Server         : yusheng
 Source Server Type    : MySQL
 Source Server Version : 50521
 Source Host           : localhost:3306
 Source Schema         : online_diary

 Target Server Type    : MySQL
 Target Server Version : 50521
 File Encoding         : 65001

 Date: 07/06/2019 23:08:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(255) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '男', '123456@', '110', '123456');
INSERT INTO `admin` VALUES (2, '余生', '男', '987654321@qq.com', '13211056387', '111111');
INSERT INTO `admin` VALUES (3, 'gray', '男', '321654@qq.com', '112', '111111');
INSERT INTO `admin` VALUES (4, '梁耀辉', '男', '123456789@qq.com', '120', '111111');

-- ----------------------------
-- Table structure for diary
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary`  (
  `d_id` int(255) NOT NULL AUTO_INCREMENT,
  `d_theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `d_word` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `d_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_bgmusic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_mood` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_weather` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_time` datetime NULL DEFAULT NULL,
  `d_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `ds_id` int(255) NULL DEFAULT NULL,
  `u_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE,
  INDEX `diary_foreign_ key1`(`ds_id`) USING BTREE,
  INDEX `diary_foreign_ key2`(`u_id`) USING BTREE,
  CONSTRAINT `diary_foreign_ key1` FOREIGN KEY (`ds_id`) REFERENCES `diarys` (`ds_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `diary_foreign_ key2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES (1, '1', '今天天气不错', NULL, NULL, '开心', '广东省肇庆市肇庆学院', '晴天', '2019-06-06 17:09:14', '1', 1, 1);

-- ----------------------------
-- Table structure for diarys
-- ----------------------------
DROP TABLE IF EXISTS `diarys`;
CREATE TABLE `diarys`  (
  `ds_id` int(255) NOT NULL AUTO_INCREMENT,
  `ds_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ds_id`) USING BTREE,
  INDEX `ds_fk_u_id`(`u_id`) USING BTREE,
  CONSTRAINT `diarys_foreign_ key` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of diarys
-- ----------------------------
INSERT INTO `diarys` VALUES (1, '日记本1', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(255) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `u_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_last_online` datetime NULL DEFAULT NULL,
  `u_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_birthday` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 667 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '用户1', '123456', '女', '1', '123456321', '2019-06-06 17:06:42', '123456@qq,cin', '肇庆学院', '余生1', '2019-02-15 17:07:19');
INSERT INTO `user` VALUES (2, 'test', '123456', '女', '1', '123654987', '2019-06-05 12:42:20', '32154@qq.com', '湛江', '阿斯蒂', '2019-06-06 12:42:40');
INSERT INTO `user` VALUES (666, '测试', '123456', '男', '1', '123456789', '2019-06-06 17:07:28', '321654@qq.com', '广东', '天使', '2019-06-06 17:07:48');

SET FOREIGN_KEY_CHECKS = 1;
