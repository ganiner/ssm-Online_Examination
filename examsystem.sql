/*
 Navicat Premium Data Transfer

 Source Server         : mamp
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3307
 Source Schema         : examsystem

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/04/2019 10:33:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `maid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_maid`(`maid`) USING BTREE,
  CONSTRAINT `fk_maid` FOREIGN KEY (`maid`) REFERENCES `major` (`maid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depart` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_information
-- ----------------------------
DROP TABLE IF EXISTS `exam_information`;
CREATE TABLE `exam_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chaptertwo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `begindate` date NULL DEFAULT NULL,
  `enddate` date NULL DEFAULT NULL,
  `examtime` float NULL DEFAULT NULL,
  `choicenum` int(11) NULL DEFAULT NULL,
  `choicescore` float NULL DEFAULT NULL,
  `judgenum` int(11) NULL DEFAULT NULL,
  `judgescore` float NULL DEFAULT NULL,
  `difficulty` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_result
-- ----------------------------
DROP TABLE IF EXISTS `exam_result`;
CREATE TABLE `exam_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) NULL DEFAULT NULL,
  `examid` int(11) NULL DEFAULT NULL,
  `stuanswer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examhistory
-- ----------------------------
DROP TABLE IF EXISTS `examhistory`;
CREATE TABLE `examhistory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examid`(`examid`) USING BTREE,
  INDEX `studentid`(`studentid`) USING BTREE,
  CONSTRAINT `examhistory_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `maid` int(11) NOT NULL AUTO_INCREMENT,
  `maname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seid` int(11) NOT NULL,
  PRIMARY KEY (`maid`) USING BTREE,
  INDEX `fk_seid`(`seid`) USING BTREE,
  INDEX `maid`(`maid`) USING BTREE,
  CONSTRAINT `fk_seid` FOREIGN KEY (`seid`) REFERENCES `semester` (`seid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for paper_choice
-- ----------------------------
DROP TABLE IF EXISTS `paper_choice`;
CREATE TABLE `paper_choice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aoption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `boption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `coption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `doption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `examid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examid`(`examid`) USING BTREE,
  CONSTRAINT `paper_choice_ibfk_1` FOREIGN KEY (`examid`) REFERENCES `exam_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for paper_judge
-- ----------------------------
DROP TABLE IF EXISTS `paper_judge`;
CREATE TABLE `paper_judge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examid`(`examid`) USING BTREE,
  CONSTRAINT `paper_judge_ibfk_1` FOREIGN KEY (`examid`) REFERENCES `exam_information` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for point1
-- ----------------------------
DROP TABLE IF EXISTS `point1`;
CREATE TABLE `point1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pointname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for point2
-- ----------------------------
DROP TABLE IF EXISTS `point2`;
CREATE TABLE `point2`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE,
  INDEX `fk_point_id`(`aid`) USING BTREE,
  CONSTRAINT `point2_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `point1` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`seid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sit
-- ----------------------------
DROP TABLE IF EXISTS `sit`;
CREATE TABLE `sit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `classname` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `num` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, 'root', 'root', '1601312', '1160131230');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'admin');
INSERT INTO `tb_user` VALUES (3, 'root', 'root');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'root', '自动化', '讲师', '12345@qq.com', 'root');

-- ----------------------------
-- Table structure for tk_choice
-- ----------------------------
DROP TABLE IF EXISTS `tk_choice`;
CREATE TABLE `tk_choice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答题编号',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题内容',
  `aoption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项A',
  `boption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项B',
  `coption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项C',
  `doption` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项D',
  `answer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题答案',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试题解析',
  `chapter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '章节编号',
  `chaptertwo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `difficulty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题难度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tk_judge
-- ----------------------------
DROP TABLE IF EXISTS `tk_judge`;
CREATE TABLE `tk_judge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chapter` int(11) NOT NULL,
  `chaptertwo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
