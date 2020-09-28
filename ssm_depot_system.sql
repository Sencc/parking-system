-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.5-m8 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 ssm_depot_system 的数据库结构
CREATE DATABASE IF NOT EXISTS `ssm_depot_system` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ssm_depot_system`;

-- 导出  表 ssm_depot_system.card 结构
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '停车场卡信息表',
  `cardnum` varchar(50) DEFAULT NULL COMMENT '卡号',
  `type` int(11) DEFAULT NULL COMMENT '卡类型',
  `money` double(11,2) DEFAULT '0.00' COMMENT '余额',
  `time` datetime DEFAULT NULL COMMENT '发卡时间',
  `islose` int(11) DEFAULT '0' COMMENT '是否挂失',
  `illegalcount` int(11) DEFAULT '0' COMMENT '违规次数',
  `carnum` varchar(50) DEFAULT NULL COMMENT '假如没有办卡那么就用车牌来标识',
  `deductedtime` datetime DEFAULT NULL COMMENT '扣费时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.card 的数据：~5 rows (大约)
DELETE FROM `card`;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` (`id`, `cardnum`, `type`, `money`, `time`, `islose`, `illegalcount`, `carnum`, `deductedtime`) VALUES
	(18, '1810274610220200629', 1, 852.00, '2020-06-29 22:40:47', 0, 0, NULL, NULL),
	(19, '1392717884520200630', 2, 2000.00, '2020-06-30 01:33:39', 0, 0, NULL, '2020-06-30 01:33:39'),
	(20, '134551487620200630', 1, 426.00, '2020-06-30 02:22:49', 0, 0, NULL, NULL),
	(21, '1366154528720200701', 3, 47000.00, '2020-07-01 14:38:41', 0, 0, NULL, '2020-07-01 14:38:41'),
	(22, '136542398720200701', 1, 1500.00, '2020-07-01 14:48:55', 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.cardtype 结构
CREATE TABLE IF NOT EXISTS `cardtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡类型表',
  `type` varchar(50) DEFAULT NULL COMMENT '卡类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.cardtype 的数据：~3 rows (大约)
DELETE FROM `cardtype`;
/*!40000 ALTER TABLE `cardtype` DISABLE KEYS */;
INSERT INTO `cardtype` (`id`, `type`) VALUES
	(1, '普通卡'),
	(2, '月卡'),
	(3, '年卡');
/*!40000 ALTER TABLE `cardtype` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.coupon 结构
CREATE TABLE IF NOT EXISTS `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponNum` varchar(255) DEFAULT NULL COMMENT '优惠券号码',
  `money` int(11) DEFAULT NULL COMMENT '优惠金额',
  `cardnum` varchar(255) DEFAULT NULL COMMENT '卡号',
  `time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.coupon 的数据：~1 rows (大约)
DELETE FROM `coupon`;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` (`id`, `couponNum`, `money`, `cardnum`, `time`) VALUES
	(4, '8684914d6c5345078acaea7d261a3ba5', 100, '1234567891020190220', '2019-02-01 21:11:11');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.depotinfo 结构
CREATE TABLE IF NOT EXISTS `depotinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '停车场信息表',
  `hourmoney` varchar(50) DEFAULT NULL COMMENT '停车场名',
  `monthcard` varchar(50) DEFAULT NULL COMMENT '停车场电话',
  `yearcard` varchar(255) DEFAULT NULL COMMENT '停车场地址',
  `illegal` varchar(255) DEFAULT NULL COMMENT '总车位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.depotinfo 的数据：~1 rows (大约)
DELETE FROM `depotinfo`;
/*!40000 ALTER TABLE `depotinfo` DISABLE KEYS */;
INSERT INTO `depotinfo` (`id`, `hourmoney`, `monthcard`, `yearcard`, `illegal`) VALUES
	(1, '10', '1920', '21120', '50');
/*!40000 ALTER TABLE `depotinfo` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.email 结构
CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendid` int(11) DEFAULT NULL COMMENT '发送方',
  `toid` int(11) DEFAULT NULL COMMENT '接收方',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `time` datetime DEFAULT NULL COMMENT '发送时间',
  `managerisread` int(11) DEFAULT '0',
  `userisread` int(11) DEFAULT '0' COMMENT '是否被读',
  `userdeleted` int(11) DEFAULT '0',
  `managedelete` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.email 的数据：~12 rows (大约)
DELETE FROM `email`;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` (`id`, `sendid`, `toid`, `title`, `content`, `time`, `managerisread`, `userisread`, `userdeleted`, `managedelete`) VALUES
	(1, 16, 0, '213231', '213213132', '2019-01-28 11:50:52', 2, 1, 0, 0),
	(3, 1, 16, '回复：213231', '555555555', '2019-01-28 20:54:32', 0, 1, 1, 1),
	(4, 16, 0, '12312', '3121233', '2019-02-21 20:44:38', 1, 0, 0, 1),
	(5, 16, 0, '444', 'stupid', '2019-02-21 20:46:17', 2, 0, 0, 0),
	(6, 1, 16, '回复：444', 'ok', '2019-02-21 20:47:12', 0, 1, 0, 0),
	(7, 16, 0, '5555', '222', '2019-02-21 20:48:18', 2, 0, 0, 0),
	(8, 2, 16, '回复：5555', 'ok', '2019-02-21 20:48:41', 0, 1, 0, 0),
	(9, 16, 0, 'test1', 'test1', '2019-02-21 21:33:13', 2, 0, 0, 0),
	(10, 16, 0, 'test2', 'test2', '2019-02-21 21:33:22', 0, 0, 0, 0),
	(11, 1, 16, '回复：test1', '123761238762381', '2019-02-21 21:38:27', 0, 0, 0, 0),
	(12, 10, 0, '12', '12', '2019-09-11 15:22:16', 0, 0, 1, 0),
	(13, 10, 0, '关于价格问题', '这个多次是否有优惠呢？', '2019-09-11 15:22:52', 0, 0, 0, 0);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.illegalinfo 结构
CREATE TABLE IF NOT EXISTS `illegalinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardnum` varchar(255) DEFAULT NULL COMMENT '停车卡号',
  `illegalInfo` varchar(255) DEFAULT NULL COMMENT '违规信息',
  `parkin` datetime DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT '违规时间',
  `uid` int(11) DEFAULT '0' COMMENT '添加的管理员',
  `carnum` varchar(255) DEFAULT NULL COMMENT '车牌号，临时停车的话用车牌号记录',
  `deleted` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.illegalinfo 的数据：~1 rows (大约)
DELETE FROM `illegalinfo`;
/*!40000 ALTER TABLE `illegalinfo` DISABLE KEYS */;
INSERT INTO `illegalinfo` (`id`, `cardnum`, `illegalInfo`, `parkin`, `time`, `uid`, `carnum`, `deleted`) VALUES
	(21, '1314938242720171217', '违规', '2020-06-29 22:08:35', '2020-06-29 22:08:53', 1, '粤A125JK', 'N');
/*!40000 ALTER TABLE `illegalinfo` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.income 结构
CREATE TABLE IF NOT EXISTS `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(20,2) DEFAULT '0.00' COMMENT '收入',
  `method` int(11) DEFAULT '0' COMMENT '收入方式（0现金，1支付宝，2微信，9从卡中扣费）',
  `type` int(11) DEFAULT '0' COMMENT '收入类型（0临时停车，1普通卡，2月卡，3年卡）',
  `carnum` varchar(255) DEFAULT NULL,
  `cardnum` varchar(255) DEFAULT NULL,
  `isillegal` int(11) DEFAULT '0' COMMENT '是否有违规',
  `source` int(11) DEFAULT '1' COMMENT '收入来源，0充值卡，1出库收费',
  `time` datetime DEFAULT NULL COMMENT '收入时间',
  `duration` bigint(20) DEFAULT NULL COMMENT '停车时长',
  `trueincome` int(5) DEFAULT '0' COMMENT '是否真正收入（0：否，1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.income 的数据：~28 rows (大约)
DELETE FROM `income`;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` (`id`, `money`, `method`, `type`, `carnum`, `cardnum`, `isillegal`, `source`, `time`, `duration`, `trueincome`) VALUES
	(32, 456.00, 1, 1, NULL, '1314938242720171217', 0, 0, '2019-12-06 20:51:54', 0, 0),
	(33, 300.00, 1, 1, NULL, '1581345771220190221', 0, 0, '2019-02-06 20:53:26', 0, 0),
	(34, 58.00, 9, 1, '12312', '1581345771220190221', 1, 1, '2019-02-06 21:00:19', 1, 1),
	(35, 58.00, 9, 1, '12321321321', '1581345771220190221', 1, 1, '2019-02-06 21:01:42', 1, 1),
	(36, 58.00, 9, 1, '123132321231', '1581345771220190221', 1, 1, '2019-02-06 21:02:45', 1, 1),
	(37, 58.00, 9, 1, '123123', '1581345771220190221', 1, 1, '2019-02-06 21:03:41', 1, 1),
	(38, 58.00, 9, 1, '123123312213', '1581345771220190221', 1, 1, '2019-02-06 21:13:46', 1, 1),
	(39, 58.00, 9, 1, '123123312123', '1581345771220190221', 1, 1, '2019-02-06 21:16:08', 1, 1),
	(40, 58.00, 9, 1, '213321321', '1581345771220190221', 1, 1, '2019-02-06 21:18:16', 1, 1),
	(41, 58.00, 9, 1, '213312132312', '7458214563220190206', 1, 1, '2019-02-11 21:08:56', 2, 0),
	(42, 10.00, 0, 0, '213123123', '', 0, 1, '2019-02-20 10:31:06', 9, 0),
	(43, 10.00, 9, 0, '12', '', 0, 1, '2019-09-11 15:24:41', 1, 0),
	(44, 1920.00, 1, 2, NULL, '1302250240420190911', 0, 0, '2019-09-11 15:35:49', 0, 0),
	(45, 70150.00, 1, 0, '苏A12312', '', 0, 1, '2020-06-29 22:07:51', 420881, 0),
	(46, 10.00, 0, 0, '粤A12345', '', 0, 1, '2020-06-29 22:14:39', 1, 0),
	(47, 0.00, 1, 1, NULL, '1810274610220200629', 0, 0, '2020-06-29 22:40:47', 0, 0),
	(48, 70160.00, 9, 0, '苏A12345', '', 0, 1, '2020-06-29 22:41:42', 420917, 0),
	(49, 10.00, 9, 0, '粤AGH365', '', 0, 1, '2020-06-29 22:42:36', 1, 0),
	(50, 1000.00, 1, 2, NULL, '1392717884520200630', 0, 0, '2020-06-30 01:33:39', 0, 0),
	(51, 10.00, 1, 0, '粤A777FF', '', 0, 1, '2020-06-30 01:39:13', 3, 0),
	(52, 0.00, 2, 1, NULL, '134551487620200630', 0, 0, '2020-06-30 02:22:49', 0, 0),
	(53, 342.00, 1, 1, NULL, '134551487620200630', 0, 0, '2020-06-30 09:55:31', 0, 0),
	(54, 442.00, 0, 1, NULL, '134551487620200630', 0, 0, '2020-06-30 09:55:44', 0, 0),
	(55, 10.00, 1, 0, '粤A123456', '', 0, 1, '2020-06-30 11:00:43', 1, 0),
	(56, 10.00, 1, 0, '粤A163IJ', '', 0, 1, '2020-07-01 14:35:09', 1, 0),
	(57, 3000.00, 2, 3, NULL, '1366154528720200701', 0, 0, '2020-07-01 14:38:41', 0, 0),
	(58, 10.00, 2, 0, '粤A13654', '', 0, 1, '2020-07-01 14:48:29', 1, 0),
	(59, 0.00, 0, 1, NULL, '136542398720200701', 0, 0, '2020-07-01 14:48:55', 0, 0);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.parkinfo 结构
CREATE TABLE IF NOT EXISTS `parkinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parknum` int(11) DEFAULT NULL COMMENT '停车位号，对应parkspace的parkid',
  `cardnum` varchar(50) DEFAULT NULL COMMENT '卡号',
  `carnum` varchar(50) DEFAULT NULL COMMENT '车牌号',
  `parkin` datetime DEFAULT NULL COMMENT '停入时间',
  `parktemp` int(11) DEFAULT '0' COMMENT '0正常停车，1临时停车',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.parkinfo 的数据：~2 rows (大约)
DELETE FROM `parkinfo`;
/*!40000 ALTER TABLE `parkinfo` DISABLE KEYS */;
INSERT INTO `parkinfo` (`id`, `parknum`, `cardnum`, `carnum`, `parkin`, `parktemp`) VALUES
	(28, 1, '1392717884520200630', '闽A25GI', '2020-06-30 01:35:21', 0),
	(31, 2, '1392717884520200630', '粤A1124', '2020-06-30 01:52:35', 0);
/*!40000 ALTER TABLE `parkinfo` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.parkinfoall 结构
CREATE TABLE IF NOT EXISTS `parkinfoall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardnum` varchar(255) DEFAULT NULL,
  `parknum` int(11) DEFAULT NULL,
  `carnum` varchar(255) DEFAULT NULL,
  `parkin` datetime DEFAULT NULL,
  `parkout` datetime DEFAULT NULL,
  `parktemp` int(11) DEFAULT '0' COMMENT '0正常停车，1临时停车',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.parkinfoall 的数据：~16 rows (大约)
DELETE FROM `parkinfoall`;
/*!40000 ALTER TABLE `parkinfoall` DISABLE KEYS */;
INSERT INTO `parkinfoall` (`id`, `cardnum`, `parknum`, `carnum`, `parkin`, `parkout`, `parktemp`) VALUES
	(25, '', 2, '苏A12312', '2019-09-11 15:27:10', '2020-06-29 22:07:51', 0),
	(26, '1314938242720171217', 2, '粤A125JK', '2020-06-29 22:08:35', '2020-06-29 22:11:46', 0),
	(27, '', 4, '粤A12345', '2020-06-29 22:14:28', '2020-06-29 22:14:39', 0),
	(28, '1314938242720171217', 3, '粤DTk124', '2020-06-29 22:11:35', '2020-06-29 22:15:07', 0),
	(29, '', 1, '苏A12345', '2019-09-11 15:25:09', '2020-06-29 22:41:42', 0),
	(30, '', 1, '粤AGH365', '2020-06-29 22:42:24', '2020-06-29 22:42:36', 0),
	(31, '1810274610220200629', 2, '粤A128HN', '2020-06-29 22:41:30', '2020-06-30 01:02:31', 0),
	(32, '', 2, '粤A777FF', '2020-06-30 01:36:36', '2020-06-30 01:39:13', 0),
	(33, '1810274610220200629', 3, '000', '2020-06-30 01:40:08', '2020-06-30 01:40:14', 0),
	(34, '1810274610220200629', 3, '粤A3325A', '2020-06-30 01:53:24', '2020-06-30 01:53:31', 0),
	(35, '1810274610220200629', 3, '粤AJH124', '2020-06-30 02:11:24', '2020-06-30 02:11:46', 0),
	(36, '134551487620200630', 3, '粤A54HJ1', '2020-06-30 09:36:56', '2020-06-30 09:41:05', 0),
	(37, '134551487620200630', 3, '粤BIJ124', '2020-06-30 09:41:37', '2020-06-30 11:00:29', 0),
	(38, '', 4, '粤A123456', '2020-06-30 11:00:07', '2020-06-30 11:00:43', 0),
	(39, '', 3, '粤A163IJ', '2020-07-01 14:34:20', '2020-07-01 14:35:09', 0),
	(40, '', 3, '粤A13654', '2020-07-01 14:48:15', '2020-07-01 14:48:29', 0);
/*!40000 ALTER TABLE `parkinfoall` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.parkspace 结构
CREATE TABLE IF NOT EXISTS `parkspace` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '停车位表',
  `parkid` int(11) DEFAULT NULL COMMENT '车位号',
  `status` int(11) DEFAULT '0' COMMENT '是否停车',
  `tag` int(11) DEFAULT '1' COMMENT '停车类型，1：正常，2：临时，3紧急',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.parkspace 的数据：~100 rows (大约)
DELETE FROM `parkspace`;
/*!40000 ALTER TABLE `parkspace` DISABLE KEYS */;
INSERT INTO `parkspace` (`id`, `parkid`, `status`, `tag`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1),
	(3, 3, 0, 1),
	(4, 4, 0, 1),
	(5, 5, 0, 1),
	(6, 6, 0, 1),
	(7, 7, 0, 1),
	(8, 8, 0, 1),
	(9, 9, 0, 1),
	(10, 10, 0, 1),
	(11, 11, 0, 1),
	(12, 12, 0, 1),
	(13, 13, 0, 1),
	(14, 14, 0, 1),
	(15, 15, 0, 1),
	(16, 16, 0, 1),
	(17, 17, 0, 1),
	(18, 18, 0, 1),
	(19, 19, 0, 1),
	(20, 20, 0, 1),
	(21, 21, 0, 1),
	(22, 22, 0, 1),
	(23, 23, 0, 1),
	(24, 24, 0, 1),
	(25, 25, 0, 1),
	(26, 26, 0, 1),
	(27, 27, 0, 1),
	(28, 28, 0, 1),
	(29, 29, 0, 1),
	(30, 30, 0, 1),
	(31, 31, 0, 1),
	(32, 32, 0, 1),
	(33, 33, 0, 1),
	(34, 34, 0, 1),
	(35, 35, 0, 1),
	(36, 36, 0, 1),
	(37, 37, 0, 1),
	(38, 38, 0, 1),
	(39, 39, 0, 1),
	(40, 40, 0, 1),
	(41, 41, 0, 1),
	(42, 42, 0, 1),
	(43, 43, 0, 1),
	(44, 44, 0, 1),
	(45, 45, 0, 1),
	(46, 46, 0, 1),
	(47, 47, 0, 1),
	(48, 48, 0, 1),
	(49, 49, 0, 1),
	(50, 50, 0, 1),
	(51, 51, 0, 1),
	(52, 52, 0, 1),
	(53, 53, 0, 1),
	(54, 54, 0, 1),
	(55, 55, 0, 1),
	(56, 56, 0, 1),
	(57, 57, 0, 1),
	(58, 58, 0, 1),
	(59, 59, 0, 1),
	(60, 60, 0, 1),
	(61, 61, 0, 1),
	(62, 62, 0, 1),
	(63, 63, 0, 1),
	(64, 64, 0, 1),
	(65, 65, 0, 1),
	(66, 66, 0, 1),
	(67, 67, 0, 1),
	(68, 68, 0, 1),
	(69, 69, 0, 1),
	(70, 70, 0, 2),
	(71, 71, 0, 2),
	(72, 72, 0, 2),
	(73, 73, 0, 2),
	(74, 74, 0, 2),
	(75, 75, 0, 2),
	(76, 76, 0, 2),
	(77, 77, 0, 2),
	(78, 78, 0, 2),
	(79, 79, 0, 2),
	(80, 80, 0, 2),
	(81, 81, 0, 2),
	(82, 82, 0, 2),
	(83, 83, 0, 2),
	(84, 84, 0, 2),
	(85, 85, 0, 2),
	(86, 86, 0, 2),
	(87, 87, 0, 2),
	(88, 88, 0, 2),
	(89, 89, 0, 2),
	(90, 90, 0, 2),
	(91, 91, 0, 3),
	(92, 92, 0, 3),
	(93, 93, 0, 3),
	(94, 94, 0, 3),
	(95, 95, 0, 3),
	(96, 96, 0, 3),
	(97, 97, 0, 3),
	(98, 98, 0, 3),
	(99, 99, 0, 3),
	(100, 100, 0, 3);
/*!40000 ALTER TABLE `parkspace` ENABLE KEYS */;

-- 导出  表 ssm_depot_system.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员信息表',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `sex` varchar(10) DEFAULT '男' COMMENT '性别',
  `tel` varchar(50) DEFAULT '' COMMENT '联系电话',
  `role` int(11) DEFAULT '3' COMMENT '权限/职位（1超级管理员，2管理员，3用户）',
  `cardid` int(11) DEFAULT '0' COMMENT '停车场卡（停车用户才有的）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- 正在导出表  ssm_depot_system.user 的数据：~9 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `name`, `password`, `sex`, `tel`, `role`, `cardid`) VALUES
	(1, 'admin', '张三', 'admin', '男', '', 1, 0),
	(2, 'tcc', '李四', '123456', '男', '13149382427', 2, 0),
	(15, 'zsc', 'zhangsencai', '123', '男', NULL, 1, 0),
	(25, '18102746102', 'a123', '18102746102', '男', '18102746102', 3, 18),
	(27, '13927178845', 'tom', '13927178845', '男', '13927178845', 3, 19),
	(29, '1345514876', 'cxk', '1345514876', '女', '1364458795', 3, 20),
	(30, '13661545287', 'zgh', '13661545287', '男', '13661545287', 3, 21),
	(31, '1365423987', 'sjk', '1365423987', '男', '1365423987', 3, 22),
	(32, '112456', '112456', '123456', '女', '1801236547', 3, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
