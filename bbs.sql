/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 24/12/2019 17:25:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id（主键）',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `limitation` int(2) NOT NULL COMMENT '权限（0表示普通管理员，1表示超级管理员）',
  `sculpture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '徐凯', '123456', 1, '头像', '15720998888', '2248736974@qq.com');
INSERT INTO `admin` VALUES (2, '杨发', '123456', 1, '头像', '110', '842582120qq.com');
INSERT INTO `admin` VALUES (3, '刘新立', '123456', 1, '头像', '110', '153852254qq.com');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id（主键）',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `time` datetime(0) DEFAULT NULL COMMENT '发布时间',
  `praise_points` int(50) DEFAULT NULL COMMENT '点赞数',
  `comment` int(50) DEFAULT NULL COMMENT '评论数',
  `category_id` int(10) DEFAULT NULL COMMENT '文章类型',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关键字',
  `istop` int(2) DEFAULT NULL COMMENT '是否置顶',
  `time_istop` bigint(20) DEFAULT 0 COMMENT '置顶时间',
  `authorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (2, 'NBA', '官宣：詹姆斯&戴维斯圣诞大战出战存疑', '北京时间12月24日，洛杉矶湖人官方宣布，球队两大核心勒布朗-詹姆斯与安东尼-戴维斯均受伤病困扰，能否出席圣诞大战暂时存疑。\r\n詹姆斯由于胸肌以及腹股沟拉伤缺席了球队对阵丹佛掘金的比赛，这是他本赛季迄今首度缺席比赛，而戴维斯在此役也意外扭伤膝盖，他们两人随后均被球队列入圣诞大战出战存疑的名单。', '2019-12-24 10:59:46', 0, 0, 3, '篮球', 1, 1577179109465, 1);
INSERT INTO `article` VALUES (1, '薛之谦', '薛之谦，1983年7月17日出生于上海市，中国内地男歌手、音乐制作人、演员、商人。', '薛之谦 - 木偶人\r\n作词：薛之谦\r\n作曲：薛之谦\r\n听专情的古人\r\n把美言留给最爱的人\r\n看裹小脚的人\r\n为诗人的恶习在隐忍\r\n你没读懂课本\r\n可世人硬要捧\r\n看感情里的人\r\n用肉眼分出三六九等\r\n再配合些掌声\r\n看上去全都忠心耿耿\r\n谁定的烂台本\r\n可当代都在跟\r\n气氛已麻木不仁\r\n所以\r\n当我们都变成木偶人\r\n你何苦再做一个\r\n痴情人表忠贞\r\n文字叙述工整\r\n配上廉价伤痕\r\n你还会哭多感人\r\n让我们都变成木偶人\r\n再缝几针爱几次后就不会疼\r\n去除惦记功能\r\n再遇到你时像个陌生人\r\n以前爱过的人\r\n偷偷的藏起红绿两本\r\n现在相爱的人\r\n能耍的方式五花八门\r\n要一式要两份\r\n把热吻当罪证\r\n让动了情的人\r\n还要去分辨好人坏人\r\n别在雨里对阵\r\n用可乐拉环陪你的人\r\n已变成俗剧本\r\n你何必太当真\r\n不要提那辛路历程\r\n所以\r\n当我们都变成木偶人\r\n你何苦再做一个\r\n痴情人表忠贞\r\n文字叙述工整\r\n重复廉价伤痕\r\n你还会哭多感人\r\n让我们都变成木偶人\r\n再缝几针爱几次后就不会疼\r\n去除惦记功能\r\n再遇到你时像个陌生人\r\n没有人能变成木偶人\r\n无非是在感情里的逃避过程\r\n我们盛气凌人\r\n掩饰无权过问\r\n遇见谁要拆几针\r\n当我们都羡慕木偶人\r\n学会他在场面上的玩弄过程\r\n美化措辞追捧\r\n似拟人的掌声是我爱人\r\n防备厚厚一本\r\n是我献出自己的后遗症\r\n制作人：陈迪@TalentUnion\r\n编曲：陈迪\r\n吉他：劳国贤\r\n贝斯：崔文正\r\n鼓：王鹏\r\n弦乐团：中国爱乐乐团\r\n人声监制：杨祎\r\n缩混：杨祎@RaySound Studio\r\n母带：鲍锐@录顶技\r\n', '2019-12-17 08:25:24', 0, 0, 1, '薛之谦', 0, 1577177889064, 1);
INSERT INTO `article` VALUES (23, 'asdas', '13231', '123123', '2019-12-24 16:41:27', 0, 0, 1, '213321', 0, 0, 5);
INSERT INTO `article` VALUES (24, 'asdas', '1231', '46456', '2019-12-24 17:16:52', 0, 0, 1, '121312', 0, 0, 5);
INSERT INTO `article` VALUES (25, 'asdas', '1231', '46456', '2019-12-24 17:18:34', 0, 0, 1, '121312', 0, 0, 5);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id（主键）',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '文艺', '文学和艺术，有时指文学或表演艺术，是人们对生活的提炼，升华和表达。');
INSERT INTO `category` VALUES (3, '体育', '体育是一种复杂的社会文化现象，增强体质与提高运动能力、改善生活方式与提高生活质量的一种有意识、有目的、有组织的社会活动。');
INSERT INTO `category` VALUES (8, '科技', '社会上习惯于把科学和技术连在一起，统称为科学技术，简称科技。');
INSERT INTO `category` VALUES (5, '娱乐', '现代娱乐可被看作是一种通过表现喜怒哀乐或自己和他人的技巧而使与受者喜悦、放松，并带有一定启发性的活动。');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id（主键）',
  `user_id` int(10) NOT NULL COMMENT '用户名id(谁评论的？？？）',
  `article_id` int(11) NOT NULL COMMENT '评论的文章id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `time_comment` timestamp(0) NOT NULL COMMENT '评论时间',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, '我真特么帅', '2019-12-24 10:55:02', 0);
INSERT INTO `comment` VALUES (2, 1, 2, '据悉，尽管詹姆斯与戴维斯今日均现身训练馆，但他们并未随队参加训练。\r\n湖人主帅弗兰克-沃格尔在接受采访时透露：“我们会等到比赛前一天再看看情况，他们目前都被球队列为出战存疑状态，我们需要继续观察他们的伤病状况。”', '2019-12-24 11:03:27', 1);
INSERT INTO `comment` VALUES (8, 1, 2, 'asdasdsad', '2019-12-24 12:20:13', 1);
INSERT INTO `comment` VALUES (9, 5, 1, '测试', '2019-12-24 15:34:36', 0);
INSERT INTO `comment` VALUES (10, 8, 2, 'zxc\r\n', '2019-12-24 16:45:07', 0);
INSERT INTO `comment` VALUES (11, 5, 1, 'vnvmn', '2019-12-24 17:15:59', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id（主键）',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '12' COMMENT '昵称',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123123' COMMENT '个性签名',
  `sculpture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '12' COMMENT '头像',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123' COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123' COMMENT '邮箱',
  `integral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '12312' COMMENT '积分数',
  `nature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '213213' COMMENT '工作性质',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123123' COMMENT '工作地点',
  `status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '活跃',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前端用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '徐凯', '123456', '徐', '个性签名', '123', '15687459562', '2248736974@qq.com', '34555', '学生1', '123', '活跃');
INSERT INTO `user` VALUES (5, '杨发', '123456', '杨', '个性签名', '234', '152487598563', '840582120@qq.cpm3', '321321', '学生22', '南昌1', '活跃');
INSERT INTO `user` VALUES (8, '123', '123', '12', '123123', '12', '123123123', '', '12312', '213213', '123123', '活跃');
INSERT INTO `user` VALUES (9, '1231', '123456', '12', '123123', '12', '45645', 'pxpliu@hotmail.com', '12312', '213213', '123123', '活跃');

SET FOREIGN_KEY_CHECKS = 1;
