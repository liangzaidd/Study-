/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.0.96-community-nt : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ssm`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookID` int(11) NOT NULL auto_increment COMMENT '书id',
  `bookName` varchar(100) NOT NULL COMMENT '书名',
  `bookCounts` int(11) NOT NULL COMMENT '数量',
  `detail` varchar(200) NOT NULL COMMENT '描述',
  `isdelete` int(11) NOT NULL default '0' COMMENT '0为在书库，1为删除',
  KEY `bookID` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`bookID`,`bookName`,`bookCounts`,`detail`,`isdelete`) values (1,'Java',8,'从入门到放弃',0),(2,'MySQL',10,'从删库到跑路',0),(3,'Linux',5,'从进门到进牢',0),(4,'SSM框架整合',9,'配置的东西有点多啊',0),(5,'SpringBoot',12,'还没学不知道咋样',1),(6,'SpringBoot',55,'听说很简单  面向注释开发',0),(7,'docker',23,'还没学不知道咋样',1),(8,'C++',2,'快跑啊',0),(9,'Vue',10,'这是啥，不知道啊',0),(10,'再加一本',2,'test',1),(11,'JUC并发编程',2,'并发编程学习',0),(12,'Html',1,'前端三大要素之一',0),(13,'css',1,'前端三大要素之一',0),(14,'JavaScript',1,'前端三大要素之一',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `isdelete` int(11) NOT NULL default '0' COMMENT '0为存在 1为删除',
  `perms` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`isdelete`,`perms`) values (3,'update','123456',0,'admin:update'),(4,'admin','123456',0,'admin:root'),(6,'add','123456',0,'admin:add');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
