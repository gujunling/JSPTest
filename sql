/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : test4

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-12-24 08:45:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(32) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'haha', '111', '哈哈', '男', '26', '河南', '1123456723', 'qwertffdca1998@163.com');
INSERT INTO `user` VALUES ('2', 'heihei', '222', '嘿嘿嘿', '女', '25', '河南', '1234905780', 'hahaha1asdreq@163.com');
INSERT INTO `user` VALUES ('3', 'xiaoming', '333', '小小明', '男', '23', '湖南', '1234434356', 'heiheiheiqwSED@163.com');
INSERT INTO `user` VALUES ('4', '贱人', '444', '贱人', '女', '18', '广东', '1527895780', 'jianjian1998@163.com');
INSERT INTO `user` VALUES ('10', null, null, '小徐璈', '女', '24', '河南', '7894562890', 'asdfghgjhk@163.com');
INSERT INTO `user` VALUES ('11', null, null, '小红', '女', '26', '河南', '1234567890', 'qwertyuiop@163.com');
INSERT INTO `user` VALUES ('12', '1212', '1212', '小赵', '男', '25', '广东', '4567891230', 'asdfghjkl@163.com');
INSERT INTO `user` VALUES ('13', null, null, '小李', '男', '28', '河南', '1234567890', 'zxcvbnmasd@163.com');
INSERT INTO `user` VALUES ('14', null, null, '娃哈哈', '男', '26', '广西', '1234567890', 'qwertyuiop@163.com');
INSERT INTO `user` VALUES ('15', null, null, '尼米', '女', '28', '湖南', '1234556311', 'hnevuosod@qq.com');
INSERT INTO `user` VALUES ('16', null, null, '金克木', '女', '25', '广东', '7894561230', 'qwertyjhfji@qq.com');
INSERT INTO `user` VALUES ('17', '1717', '1717', '明明', '男', '23', '湖南', '1234567890', 'qwertyuioa@qq.com');
INSERT INTO `user` VALUES ('20', null, null, '张明', '女', '26', '广东', '1234567890', 'qwerasdfzxcv@qq.com');
INSERT INTO `user` VALUES ('21', null, null, '李华', '男', '26', '湖南', '1234567890', 'qwerasdfzxcv@qq.com');
INSERT INTO `user` VALUES ('23', null, null, '徐华清', '女', '26', '河南', '1234567856', 'qwerasdfzxcv@qq.com');
INSERT INTO `user` VALUES ('25', null, null, '佟丽娅', '女', '26', '湖南', '1234534566', 'qwerasdfzxcv@qq.com');
INSERT INTO `user` VALUES ('28', null, null, '王力宏', '男', '26', '湖南', '1234533390', 'qwerasdfzxcv@qq.com');
INSERT INTO `user` VALUES ('29', null, null, '周杰伦', '男', '26', '广东', '1232227890', 'qwerasdfzxcv@qq.com');
INSERT INTO `user` VALUES ('30', null, null, '杨幂', '女', '46', '河南', '4849494116', 'xrdctrfgyuhnj@163.com');
INSERT INTO `user` VALUES ('40', null, null, '***啊', '男', '23', '河南', '1234567890', 'qwertypasd@163.com');
