/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : teach

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-09-09 15:51:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buy`
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `bno` varchar(40) NOT NULL,
  `sno` varchar(20) NOT NULL,
  `cno` varchar(20) NOT NULL,
  `btime` datetime DEFAULT NULL,
  PRIMARY KEY (`bno`,`sno`,`cno`),
  KEY `cnos` (`cno`),
  KEY `snos` (`sno`),
  CONSTRAINT `cnos` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`),
  CONSTRAINT `snos` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES ('2019612201522455', '13078390270', '1001', '2019-06-12 20:23:50');
INSERT INTO `buy` VALUES ('2019612202551179', '13078390270', '1001', '2019-06-12 20:26:24');
INSERT INTO `buy` VALUES ('201961393616266', '13078390270', '1001', '2019-06-13 09:36:58');
INSERT INTO `buy` VALUES ('20196622032528', '13078390272', '1001', '2019-06-06 22:02:47');
INSERT INTO `buy` VALUES ('20196622316251', '13078390272', '1001', '2019-06-06 22:03:51');
INSERT INTO `buy` VALUES ('20196622443344', '13078390270', '1001', '2019-06-06 22:45:47');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cono` int(11) NOT NULL AUTO_INCREMENT,
  `cno` varchar(20) NOT NULL,
  `sno` varchar(20) NOT NULL,
  `com` varchar(200) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`cono`,`cno`,`sno`),
  KEY `cno1` (`cno`),
  KEY `sno2` (`sno`),
  CONSTRAINT `cno1` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`),
  CONSTRAINT `sno2` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1001', '13078390270', '这课程太好了', '2019-06-11 15:56:18');
INSERT INTO `comment` VALUES ('1002', '1001', '13078390270', 'fddf', '2019-06-11 19:30:18');
INSERT INTO `comment` VALUES ('1003', '1001', '13078390270', '5555', '2019-06-11 19:55:34');
INSERT INTO `comment` VALUES ('1004', '1001', '13078390270', '555', '2019-06-11 20:11:28');
INSERT INTO `comment` VALUES ('1005', '1001', '13078390270', '123', '2019-06-11 20:38:14');
INSERT INTO `comment` VALUES ('1006', '1001', '13078390270', '777', '2019-06-11 20:48:40');
INSERT INTO `comment` VALUES ('1012', '1001', '13078390270', '8520', '2019-06-11 21:21:20');
INSERT INTO `comment` VALUES ('1013', '1001', '13078390270', '8520', '2019-06-11 21:21:33');
INSERT INTO `comment` VALUES ('1014', '1001', '13078390270', 'I am kobe bryant', '2019-06-11 21:28:54');
INSERT INTO `comment` VALUES ('1015', '1001', '13078390270', '0000', '2019-06-11 21:52:30');
INSERT INTO `comment` VALUES ('1016', '1001', '13078390270', '52200', '2019-06-11 21:55:21');
INSERT INTO `comment` VALUES ('1017', '1001', '13078390270', '还不错', '2019-06-12 21:14:16');
INSERT INTO `comment` VALUES ('1018', '1001', '13078390270', '还不错', '2019-06-12 21:14:22');
INSERT INTO `comment` VALUES ('1019', '1001', '13078390270', '123', '2019-06-12 21:18:06');
INSERT INTO `comment` VALUES ('1020', '1001', '13078390270', '123', '2019-06-12 21:21:33');
INSERT INTO `comment` VALUES ('1021', '1001', '13078390270', '123', '2019-06-12 21:29:19');
INSERT INTO `comment` VALUES ('1022', '1001', '13078390270', '5555', '2019-06-12 21:43:57');
INSERT INTO `comment` VALUES ('1023', '1001', '13078390270', '456', '2019-06-12 22:07:38');
INSERT INTO `comment` VALUES ('1024', '1001', '13078390270', '123', '2019-06-13 09:36:00');
INSERT INTO `comment` VALUES ('1025', '1001', '13078390270', 'kobe', '2019-06-13 12:35:30');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cno` varchar(20) NOT NULL DEFAULT '',
  `cname` varchar(20) DEFAULT NULL,
  `tno` varchar(20) NOT NULL,
  `ctype` varchar(20) DEFAULT NULL,
  `cdescribe` varchar(150) DEFAULT NULL,
  `cphoto` varchar(20) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `cprice` int(7) DEFAULT NULL,
  PRIMARY KEY (`cno`,`tno`),
  KEY `tno` (`tno`),
  KEY `cno` (`cno`),
  CONSTRAINT `tno` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1001', '电脑打字完全教程', '13078390270', '电脑办公', '123', '猴子-1.jpg', '2019-05-29 15:15:53', '35');
INSERT INTO `course` VALUES ('10017', 'PS人像风景后期视频教程', '13078390270', '平面设计', '123', '猴子-1.jpg', '2019-06-01 15:28:39', '65');
INSERT INTO `course` VALUES ('1002', '计算机基础知识教程', '10001', '电脑办公', '123', '猴子-1.jpg', '2019-05-29 15:17:04', '42');
INSERT INTO `course` VALUES ('1003', 'World2016基础教程', '10001', '电脑办公', '123', '猴子-1.jpg', '2019-05-29 15:17:57', '75');
INSERT INTO `course` VALUES ('1004', 'Excel2016基础教程', '10001', '电脑办公', '123', '猴子-1.jpg', '2019-05-29 15:18:36', '99');
INSERT INTO `course` VALUES ('1005', 'PPT2016基础教程', '10001', '电脑办公', '123', '猴子-1.jpg', '2019-05-29 15:19:14', '778');
INSERT INTO `course` VALUES ('1006', 'Excel函数应用教程', '10001', '电脑办公', '123', '猴子-1.jpg', '2019-05-30 15:19:51', '22');
INSERT INTO `course` VALUES ('1007', 'Windows视频教程', '10002', '电脑办公', '123', '猴子-1.jpg', '2019-05-31 15:20:28', '45');
INSERT INTO `course` VALUES ('1008', 'Windows10视频', '10002', '电脑办公', '123', '猴子-1.jpg', '2019-05-30 15:21:06', '66');
INSERT INTO `course` VALUES ('1009', '电脑打字完全教程', '10008', '平面设计 ', '123', '猴子-1.jpg', '2019-05-31 15:22:24', '88');
INSERT INTO `course` VALUES ('1010', 'PhotoshopCC', '10009', '平面设计', '132', '猴子-1.jpg', '2019-06-06 15:23:05', '99');
INSERT INTO `course` VALUES ('1011', 'PhotoshopCs6教程', '10009', '平面设计', '123', '猴子-1.jpg', '2019-06-05 15:23:52', '26');
INSERT INTO `course` VALUES ('1012', 'UI图标设计教程', '10009', '平面设计', '123', '猴子-1.jpg', '2019-06-05 15:24:44', '79');
INSERT INTO `course` VALUES ('1013', '平面综合设计教程', '10010', '平面设计', '123', '猴子-1.jpg', '2019-05-29 12:25:26', '98');
INSERT INTO `course` VALUES ('1014', ' 彩铅手绘教程', '10010', '平面设计', '123', '猴子-1.jpg', '2019-05-31 15:26:05', '97');
INSERT INTO `course` VALUES ('1015', '服装制定教程', '10011', '平面设计', '123', '猴子-1.jpg', '2019-06-18 15:26:59', '96');
INSERT INTO `course` VALUES ('1016', 'ArtCAM2017视频教程', '10011', '平面设计', '123', '猴子-1.jpg', '2019-05-30 15:27:44', '95');
INSERT INTO `course` VALUES ('1017', 'C语言二级考试教程', '10012', '程序开发', '132', '猴子-1.jpg', '2019-05-31 18:55:59', '45');
INSERT INTO `course` VALUES ('1018', 'HMTL5入门教程', '10012', '网页设计', '123', '猴子-1.jpg', '2019-05-28 18:56:36', '12');
INSERT INTO `course` VALUES ('1019', 'AE CC入门教程', '10013', '影视动画', '123', '猴子-1.jpg', '2019-06-19 19:04:20', '82');
INSERT INTO `course` VALUES ('1020', '3DMax教程', '10014', '室内设计', '123', '猴子-1.jpg', '2019-05-29 19:06:26', '75');
INSERT INTO `course` VALUES ('1021', '3D室外图教程', '10015', '室外设计', '123', '猴子-1.jpg', '2019-05-29 19:07:20', '46');
INSERT INTO `course` VALUES ('1022', 'C++语言开发教程', '10016', '程序开发', '123', '猴子-1.jpg', '2019-05-30 09:01:02', '81');
INSERT INTO `course` VALUES ('1023', 'Java语言开发教程', '10017', '程序开发', '123', '猴子-1.jpg', '2019-05-31 09:02:25', '24');
INSERT INTO `course` VALUES ('1024', 'Java进阶教程', '10017', '程序开发', '123', '猴子-1.jpg', '2019-05-31 09:03:33', '56');
INSERT INTO `course` VALUES ('1025', 'Mysql数据库入门教程', '10018', '程序开发', '123', '猴子-1.jpg', '2019-06-01 09:04:44', '68');
INSERT INTO `course` VALUES ('1026', 'SQL server入门教程', '10019', '程序开发', '123', '猴子-1.jpg', '2019-04-26 09:05:20', '79');
INSERT INTO `course` VALUES ('1027', 'Oracle入门开发', '10020', '程序开发', '123', '猴子-1.jpg', '2019-04-30 09:05:59', '88');
INSERT INTO `course` VALUES ('1028', 'Python入门教程', '10021', '程序开发', '123', '猴子-1.jpg', '2019-04-30 09:07:09', '77');
INSERT INTO `course` VALUES ('1029', 'Javascript入门教程', '10022', '网页开发', '123', '猴子-1.jpg', '2019-04-26 09:07:49', '99');
INSERT INTO `course` VALUES ('1030', 'JS进阶教程', '10022', '网页开发', '123', '猴子-1.jpg', '2019-05-31 09:08:21', '100');
INSERT INTO `course` VALUES ('1031', 'HTML图形开发', '10023', '网页开发', '123', '猴子-1.jpg', '2019-07-05 09:09:18', '44');
INSERT INTO `course` VALUES ('1032', '微信小程序开发', '10024', '网页开发', '123', '猴子-1.jpg', '2019-05-29 09:10:20', '55');
INSERT INTO `course` VALUES ('1033', '手机网页开发', '10025', '网页开发', '123', '猴子-1.jpg', '2019-05-23 09:11:04', '46');
INSERT INTO `course` VALUES ('1034', '主流网页开发', '10023', '网页开发', '123', '猴子-1.jpg', '2019-06-07 09:11:59', '74');
INSERT INTO `course` VALUES ('1035', 'PHP入门教程', '10024', '网页开发', '123', '猴子-1.jpg', '2019-04-25 09:13:21', '29');
INSERT INTO `course` VALUES ('201803', 'kobe2', '13078390270', '程序开发', '123', 'pic03.jpg', '2019-06-13 09:42:58', '0');
INSERT INTO `course` VALUES ('2222', 'kobe2', '13078390270', '室内设计', '123', 'banner.jpg', '2019-06-13 09:45:43', '0');
INSERT INTO `course` VALUES ('8883', 'kobe2', '13078390270', '程序开发', '123', '全屏.png', '2019-06-10 23:51:13', '0');
INSERT INTO `course` VALUES ('8888', 'kobe', '13078390270', '网页设计', '123', 'all背.jpg', '2019-06-10 00:53:56', '0');

-- ----------------------------
-- Table structure for `fileone`
-- ----------------------------
DROP TABLE IF EXISTS `fileone`;
CREATE TABLE `fileone` (
  `fno` varchar(20) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `cno` varchar(20) DEFAULT NULL,
  `ftime` datetime DEFAULT NULL,
  `fupload` varchar(20) DEFAULT NULL,
  `fcounts` int(7) DEFAULT NULL,
  `fprice` int(4) DEFAULT NULL,
  PRIMARY KEY (`fno`),
  KEY `cno` (`cno`),
  CONSTRAINT `cno` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fileone
-- ----------------------------
INSERT INTO `fileone` VALUES ('101', '第一章 1本套教程内容纵览', '1001', '2019-05-22 00:00:00', 'qsmy.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('102', '第一章 2输入法的发展与分类', '1001', '2019-06-01 23:47:25', 'qsmy.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('103', '第一章 3安装汉字输入法', '1001', '2019-05-30 23:48:03', 'qsmy.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('104', '第一章 4安装好打字软件', '1001', '2019-05-31 23:48:35', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('105', '第二章 1认识键盘', '1001', '2019-05-31 23:50:36', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('106', '第二章 2键盘功能键（1）', '1001', '2019-05-31 23:51:42', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('107', '第二章 3键盘功能键（2）', '1001', '2019-06-07 23:52:24', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('108', '第二章 4打字姿势要正确', '1001', '2019-06-06 23:53:09', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('109', '第二章 5从基本键开始', '1001', '2019-05-30 23:53:53', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('110', '第二章 6手指击键的分工', '1001', '2019-05-30 23:54:41', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('111', '第二章 7数字键盘的练习', '1001', '2019-05-30 23:55:22', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('112', '第三章 1全拼和简拼输入', '1001', '2019-05-30 23:56:03', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('113', '第三章 2智能输入功能强', '1001', '2019-05-30 23:57:43', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('114', '第三章 3纠错和模糊音帮大忙', '1001', '2019-05-30 23:58:53', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('115', '第三章 4不会打的就用U模式', '1001', '2019-05-30 23:59:37', 'video.mp4', '0', '0');
INSERT INTO `fileone` VALUES ('116', '第三章 5手写输入很简单', '1001', '2019-05-31 00:02:14', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('117', '第三章 6语音录入速度快', '1001', '2019-05-31 00:03:59', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('118', '第三章 7造词和云词库', '1002', '2019-05-31 00:05:33', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('119', '第三章 8让词库跟着自己', '1002', '2019-05-31 00:06:42', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('120', '第四章 1五笔字型的原理', '1002', '2019-05-31 00:08:04', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('121', '第四章 2学习五笔字型的方法', '1002', '2019-05-31 00:08:52', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('122', '第四章 3五笔字型的方法', '1002', '2019-05-31 00:09:24', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('123', '第四章 4五笔字根的记忆方法', '1002', '2019-05-31 00:10:13', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('124', '第四章 5字根理解记忆（1区）', '1002', '2019-05-31 00:10:55', 'video.mp4', '0', '1');
INSERT INTO `fileone` VALUES ('8798', '第一章1 man', '8888', '2019-06-10 00:56:19', 'qsmy.mp4', '0', '2');
INSERT INTO `fileone` VALUES ('8799', '第一章2 man', '8883', '2019-06-10 23:52:05', 'video.mp4', '0', '2');

-- ----------------------------
-- Table structure for `look`
-- ----------------------------
DROP TABLE IF EXISTS `look`;
CREATE TABLE `look` (
  `lno` varchar(20) NOT NULL,
  `sno` varchar(20) NOT NULL,
  `fno` varchar(20) NOT NULL,
  `ltime` datetime DEFAULT NULL,
  PRIMARY KEY (`lno`,`sno`,`fno`),
  KEY `fno` (`fno`),
  KEY `sno` (`sno`),
  CONSTRAINT `fno` FOREIGN KEY (`fno`) REFERENCES `fileone` (`fno`),
  CONSTRAINT `sno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of look
-- ----------------------------
INSERT INTO `look` VALUES ('0001', '13078390270', '101', '2019-06-01 10:00:44');
INSERT INTO `look` VALUES ('23518', '15089895656', '116', '2019-06-13 08:51:24');
INSERT INTO `look` VALUES ('26015', '13078390270', '118', '2019-06-10 15:00:26');
INSERT INTO `look` VALUES ('3350', '13078390270', '120', '2019-06-10 00:05:33');
INSERT INTO `look` VALUES ('394618', '13078390270', '116', '2019-06-12 18:46:40');
INSERT INTO `look` VALUES ('39817', '13078390270', '117', '2019-06-09 17:08:39');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `maccount` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `mpassword` varchar(20) DEFAULT NULL,
  `mright` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`maccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', 'kobe', '123', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` varchar(20) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `spassword` varchar(20) DEFAULT NULL,
  `ssex` varchar(2) DEFAULT NULL,
  `smail` varchar(50) DEFAULT NULL,
  `scoin` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `strend` varchar(30) DEFAULT NULL,
  `sregisterTime` datetime DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('13010102020', 'test', '123', '男', '123@qq.com', '0000', '平面设计', '2019-06-13 09:29:09');
INSERT INTO `student` VALUES ('13012123030', 'kobe bryant', '123', '女', '123@qq.com', '0000', '平面设计', '2019-06-13 12:30:01');
INSERT INTO `student` VALUES ('13056562323', 'kobe bryant', '123', '女', '123@qq.com', '0000', '平面设计', '2019-06-13 09:22:02');
INSERT INTO `student` VALUES ('13058584747', 'kobetest', '123', '女', '123@qq.com', '0000', '平面设计', '2019-06-13 09:17:43');
INSERT INTO `student` VALUES ('13078390270', 'kobe bryant', '123', '男', '123@qq.com', '0312', '室内设计', '2019-05-28 20:42:37');
INSERT INTO `student` VALUES ('13078390272', 'kobe bryant', '123', '女', '123@qq.com', '0000', '影视动画', '2019-06-06 11:02:34');
INSERT INTO `student` VALUES ('13078390278', 'kobe bryant', '123', '女', '123@qq.com', '0000', '平面设计', '2019-06-11 23:29:04');
INSERT INTO `student` VALUES ('13234567891', 'xikee', '123', '男', '123@163.com', '0000', '程序开发', '2019-06-13 09:18:05');
INSERT INTO `student` VALUES ('15023230054', 'kobe', '123', '男', '123@qq.com', '0000', '编程', '2019-05-21 23:07:04');
INSERT INTO `student` VALUES ('15089895656', 'test`', '123', '男', '123@qq.com', '0024', '平面设计', '2019-06-13 08:33:48');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tno` varchar(20) NOT NULL,
  `tname` varchar(20) DEFAULT NULL,
  `tsex` varchar(2) DEFAULT NULL,
  `tpassword` varchar(20) DEFAULT NULL,
  `tphone` varchar(11) DEFAULT NULL,
  `tregisterTime` datetime DEFAULT NULL,
  `temail` varchar(40) DEFAULT NULL,
  `flag` int(1) DEFAULT '0',
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10001', 'kobe', '男', '123', '详细设计.docx', '2019-05-31 10:43:55', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10002', 'kobe3', '女', '123', '详细设计.docx', '2019-06-12 22:20:49', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10008', 'kobe4', '女', '123', '详细设计.docx', '2019-06-12 22:20:53', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10009', 'kobe5', '女', '123', '详细设计.docx', '2019-06-12 22:20:56', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10010', 'kobe6', '女', '123', '详细设计.docx', '2019-06-12 22:20:59', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10011', 'kobe7', '女', '123', '详细设计.docx', '2019-06-12 22:21:02', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10012', 'kobe2', '女', '123', '详细设计.docx', '2019-06-12 22:21:05', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10013', 'kobe8', '男', '123', '详细设计.docx', '2019-06-12 22:21:07', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10014', 'kobe9', '男', '123', '详细设计.docx', '2019-06-12 22:21:10', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10015', 'kobe10', '男', '123', '详细设计.docx', '2019-06-12 22:21:12', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10016', 'kobe11', '男', '123', '详细设计.docx', '2019-06-12 22:21:32', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10017', 'kobe12', '男', '123', '详细设计.docx', '2019-06-12 22:21:37', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10018', 'kobe13', '男', '123', '详细设计.docx', '2019-06-12 22:21:41', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10019', 'kobe14', '男', '123', '详细设计.docx', '2019-06-12 22:21:44', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('10020', 'kobe15', '男', '123', '详细设计.docx', '2019-06-12 22:21:46', '123@qq.com', '0');
INSERT INTO `teacher` VALUES ('10021', 'kobe16', '男', '123', '详细设计.docx', '2019-06-12 22:21:49', '123@qq.com', '0');
INSERT INTO `teacher` VALUES ('10022', 'kobe17', '女', '123', '详细设计.docx', '2019-06-12 22:21:51', '123@qq.com', '0');
INSERT INTO `teacher` VALUES ('10023', 'kobe18', '女', '123', '详细设计.docx', '2019-06-12 22:21:53', '123@qq.com', '0');
INSERT INTO `teacher` VALUES ('10024', 'kobe19', '女', '123', '详细设计.docx', '2019-06-12 22:21:57', '123@qq.com', '0');
INSERT INTO `teacher` VALUES ('10025', 'kobe20', '女', '123', '详细设计.docx', '2019-06-12 22:21:59', '123@qq.com', '0');
INSERT INTO `teacher` VALUES ('13010102020', 'test', '男', '123', 'tt.docx', '2019-06-13 09:29:29', '13010102020', '1');
INSERT INTO `teacher` VALUES ('13056562323', 'kobe bryant', '女', '123', 'tt.docx', '2019-06-13 09:22:33', '13056562323', '1');
INSERT INTO `teacher` VALUES ('13078390270', 'kobe bryant', '男', '123', '详细设计.docx', '2019-06-08 22:21:20', '123@qq.com', '1');
INSERT INTO `teacher` VALUES ('15089895656', 'test`', '男', '123', 'tt.docx', '2019-06-13 09:05:28', '15089895656', '1');
