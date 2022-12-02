/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : course

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 02/12/2022 22:05:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `online_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wl', 'wl', '2022-11-09 21:56:23', '2022-11-09 21:56:03');
INSERT INTO `user` VALUES (2, 'gmh', 'gmh', '2022-11-09 21:56:26', '2022-11-09 21:56:08');
INSERT INTO `user` VALUES (3, 'lkw', 'lkw', '2022-11-09 21:56:28', '2022-11-09 21:56:11');
INSERT INTO `user` VALUES (4, 'xy', 'xy', '2022-11-09 21:56:32', '2022-11-09 21:56:14');
INSERT INTO `user` VALUES (6, 'lkw', NULL, NULL, NULL);
INSERT INTO `user` VALUES (7, 'lkw', '123', NULL, NULL);
INSERT INTO `user` VALUES (8, 'lkw', '123', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
