/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.28 : Database - car_demo
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`car_demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `car_demo`;

/*Table structure for table `tab_permission` */

DROP TABLE IF EXISTS `tab_permission`;

CREATE TABLE `tab_permission` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `details` varchar(50) DEFAULT NULL COMMENT '权限描述',
  `url` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tab_permission` */

insert  into `tab_permission`(`id`,`details`,`url`) 
values 
(1,'管理人员',NULL),
(2,'管理车辆',NULL),
(3,'一般权限',NULL);

/*Table structure for table `tab_record` */

DROP TABLE IF EXISTS `tab_record`;

CREATE TABLE `tab_record` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用车记录编号',
  `vehicleId` int(4) NOT NULL COMMENT '车辆编号',
  `departDate` datetime DEFAULT NULL COMMENT '出车时间',
  `backDate` datetime DEFAULT NULL COMMENT '还车日期',
  `level` varchar(4) DEFAULT NULL COMMENT '紧急程度',
  `event` varchar(50) DEFAULT NULL COMMENT '用车事由',
  `status1` int(2) DEFAULT '0' COMMENT '审核状态1',
  `realDepartDate` datetime DEFAULT NULL COMMENT '实际出车时间',
  `realBackDate` datetime DEFAULT NULL COMMENT '实际还车时间',
  `status2` int(2) DEFAULT '0' COMMENT '审核状态2',
  `timeout` int(2) DEFAULT '0' COMMENT '是否超时未还',
  `username` varchar(16) NOT NULL COMMENT '申请人账号',
  `name` varchar(16) DEFAULT NULL COMMENT '用车人姓名',
  PRIMARY KEY (`id`),
  KEY `vehicleId` (`vehicleId`),
  CONSTRAINT `tab_record_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `tab_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tab_record` */

insert  into `tab_record`(`id`,`vehicleId`,`departDate`,`backDate`,`level`,`event`,`status1`,`realDepartDate`,`realBackDate`,`status2`,`timeout`,`username`,`name`) 
values 
(1,1,'2020-12-01 12:02:00','2020-12-12 15:15:00','高','因公需要',0,NULL,NULL,0,0,'demo1','就删除他');

/*Table structure for table `tab_role` */

DROP TABLE IF EXISTS `tab_role`;

CREATE TABLE `tab_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `details` varchar(50) DEFAULT '普通用户' COMMENT '角色描述',
  `ps` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tab_role` */

insert  into `tab_role`(`id`,`details`,`ps`) values (1,'系统管理员',NULL),(2,'车辆管理员',NULL),(3,'普通员工',NULL);

/*Table structure for table `tab_role_permission` */

DROP TABLE IF EXISTS `tab_role_permission`;

CREATE TABLE `tab_role_permission` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `roleId` int(8) NOT NULL,
  `permissionId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `permissionId` (`permissionId`),
  CONSTRAINT `tab_role_permission_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `tab_role` (`id`),
  CONSTRAINT `tab_role_permission_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `tab_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tab_role_permission` */

insert  into `tab_role_permission`(`id`,`roleId`,`permissionId`) 
values 
(1,1,1),
(2,2,2),
(3,3,3);

/*Table structure for table `tab_user` */

DROP TABLE IF EXISTS `tab_user`;

CREATE TABLE `tab_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(6) NOT NULL DEFAULT '000000' COMMENT '用户密码',
  `name` varchar(16) NOT NULL COMMENT '用户姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tab_user` */

insert  into `tab_user`(`id`,`username`,`password`,`name`,`phone`) 
values (1,'admin','123456','admin','00000000000'),
(2,'crm','123456','民','00000000000'),
(3,'htd','123456','德','00000000000'),
(4,'lkq','123456','启','00000000000'),
(5,'khf','123456','锋','00000000000'),
(6,'zzq','123456','萁','00000000000'),
(7,'yym','123456','铭','00000000000'),
(8,'demo1','123456','就删除他','00000000000');

/*Table structure for table `tab_user_role` */

DROP TABLE IF EXISTS `tab_user_role`;

CREATE TABLE `tab_user_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userId` int(8) NOT NULL,
  `roleId` int(4) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `tab_user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tab_user` (`id`),
  CONSTRAINT `tab_user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `tab_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tab_user_role` */

insert  into `tab_user_role`(`id`,`userId`,`roleId`) 
values 
(1,1,1),
(2,2,2),
(3,3,2),
(4,4,2),
(5,5,3),
(6,6,3),
(7,7,3),
(8,8,3);

/*Table structure for table `tab_vehicle` */

DROP TABLE IF EXISTS `tab_vehicle`;

CREATE TABLE `tab_vehicle` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '车辆编号',
  `vehicleNumber` varchar(16) NOT NULL DEFAULT '000000' COMMENT '车牌号',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '车辆是否可用',
  `seats` int(2) DEFAULT '4' COMMENT '座位数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tab_vehicle` */

insert  into `tab_vehicle`(`id`,`vehicleNumber`,`status`,`seats`) 
values 
(1,'陕A12345',1,4),
(2,'粤A12345',1,6),
(3,'鄂A54321',2,4),
(4,'京A54321',2,4),
(5,'沪A54321',0,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
