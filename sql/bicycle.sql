-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.14 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 bicycle 的数据库结构
CREATE DATABASE IF NOT EXISTS `bicycle` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bicycle`;


-- 导出  表 bicycle.cart 结构
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `goods` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbwmtmeiueb6bjxo3tg1op4b5q` (`user_id`),
  CONSTRAINT `FK_cart_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKbwmtmeiueb6bjxo3tg1op4b5q` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  bicycle.cart 的数据：~0 rows (大约)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


-- 导出  表 bicycle.flower 结构
CREATE TABLE IF NOT EXISTS `flower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `foregift` double DEFAULT NULL COMMENT '押金',
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3nw97hes4efijfb4jodepww66` (`cart_id`),
  CONSTRAINT `FK3nw97hes4efijfb4jodepww66` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  bicycle.flower 的数据：~3 rows (大约)
DELETE FROM `flower`;
/*!40000 ALTER TABLE `flower` DISABLE KEYS */;
INSERT INTO `flower` (`id`, `amount`, `name`, `price`, `foregift`, `cart_id`) VALUES
	(1, 99, '飞鸽', 10, 100, NULL),
	(2, 99, '凤凰', 20, 200, NULL),
	(3, 99, '机器猫', 30, 300, NULL);
/*!40000 ALTER TABLE `flower` ENABLE KEYS */;


-- 导出  表 bicycle.indent 结构
CREATE TABLE IF NOT EXISTS `indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) DEFAULT NULL,
  `deal_details` varchar(50) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `pay_state` int(11) DEFAULT NULL,
  `pay_style` int(11) DEFAULT NULL,
  `post_style` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `total_money` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `flower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgnq8m5rsiigyq7vbkpsnss57q` (`flower_id`),
  KEY `FKmnqwxl1mi1lacuhun4h0n6ssj` (`user_id`),
  CONSTRAINT `FK_indent_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKgnq8m5rsiigyq7vbkpsnss57q` FOREIGN KEY (`flower_id`) REFERENCES `flower` (`id`),
  CONSTRAINT `FKmnqwxl1mi1lacuhun4h0n6ssj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  bicycle.indent 的数据：~0 rows (大约)
DELETE FROM `indent`;
/*!40000 ALTER TABLE `indent` DISABLE KEYS */;
INSERT INTO `indent` (`id`, `address`, `deal_details`, `pay_date`, `pay_state`, `pay_style`, `post_style`, `state`, `total_money`, `user_id`, `flower_id`) VALUES
	(1, NULL, '机器猫*1', '2016-12-27 10:47:19', NULL, 1, NULL, 1, 30, 1, NULL),
	(2, NULL, '机器猫*2,飞鸽*1', '2016-12-27 11:16:25', NULL, 1, NULL, 1, 70, 1, NULL);
/*!40000 ALTER TABLE `indent` ENABLE KEYS */;


-- 导出  表 bicycle.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` double DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  bicycle.user 的数据：~0 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `account`, `city`, `gender`, `name`, `number`, `password`, `realname`, `role`) VALUES
	(1, NULL, '海角天涯', NULL, 'test', '15851932796', 'test', '测试用户', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
