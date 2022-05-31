/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.0.67-community-nt : Database - streetfood
*********************************************************************
Server version : 5.0.67-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `streetfood`;

USE `streetfood`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`email`,`password`) values (1,'krk','krk@gmail.com','krk');

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` int(100) NOT NULL auto_increment,
  `restemail` varchar(100) default NULL,
  `itemid` int(100) default NULL,
  `custemail` varchar(100) default NULL,
  `itemcost` double default NULL,
  `quantity` int(100) default NULL,
  `totalcost` double default NULL,
  `status` int(10) default NULL,
  `delstatus` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `bookings` */

insert  into `bookings`(`id`,`restemail`,`itemid`,`custemail`,`itemcost`,`quantity`,`totalcost`,`status`,`delstatus`) values (1,'sha@gmail.com',2,'rev@gmail.com',400,3,1200,-1,1),(2,'sha@gmail.com',1,'rev@gmail.com',100,2,200,1,1),(3,'rohith@gmail.com',4,'rev@gmail.com',500,2,1000,1,0),(4,'rohith@gmail.com',5,'rev@gmail.com',1000,5,5000,-2,-1),(9,'rohith@gmail.com',4,'rev@gmail.com',500,11,5500,1,1),(11,'sha@gmail.com',1,'shiva@gmail.com',100,2,200,1,0),(12,'rohith@gmail.com',5,'shiva@gmail.com',1000,11,11000,-1,-1),(13,'sha@gmail.com',1,'shiva@gmail.com',100,6,600,1,-1),(14,'sha@gmail.com',6,'rev@gmail.com',894,9,8046,-1,-1);

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `subject` varchar(1000) default NULL,
  `message` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `contact` */

insert  into `contact`(`id`,`name`,`email`,`subject`,`message`) values (1,'jasdfh jnasdjdf','jsd@gmail.com','jadsf jdjdfb','jsadh jshadfkjhsad f'),(2,'kjadf ','njdjf@gmail.com','jnfj n','jnjndfjandf jsdnfj'),(3,'jkasddfhuj','jkhadj@gmail.com','jkdfjajfnjj jnsdfj jdfj nsadkjfnwerb jdbsf asdfnjadsnfkj','kjbndsfj jsdbfj njdfkjn jkadnfienadfnadsdfj');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `address` varchar(500) default NULL,
  `mobile` longtext,
  `status` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`id`,`name`,`email`,`password`,`address`,`mobile`,`status`) values (1,'rev','rev@gmail.com','rev','jdf jksdf','7895874569',1),(2,'shiva','shiva@gmail.com','shiva','kjadfn jndjkfn jka','7857485748',1);

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `description` varchar(100) default NULL,
  `cost` double default NULL,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `item` */

insert  into `item`(`id`,`name`,`description`,`cost`,`email`) values (1,'biryani','jfnj knjkdfnjk nsfm ',100,'sha@gmail.com'),(2,'veg fried rice','kjddfka',400,'sha@gmail.com'),(4,'egg rice','kjafhiewn ooefe hewirjsdnafjkn kjndf',500,'rohith@gmail.com'),(5,'chiken rice','uiweqrh iuehjsdnfkja ',1000,'rohith@gmail.com'),(6,'veg biryani','kjsadfn jknsdfn',894,'sha@gmail.com');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(100) NOT NULL auto_increment,
  `restemail` varchar(100) default NULL,
  `custemail` varchar(100) default NULL,
  `rate` int(10) default NULL,
  `comment` varchar(1000) default NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`id`,`restemail`,`custemail`,`rate`,`comment`,`time`) values (1,'rohith@gmail.com','rev@gmail.com',4,'iunsdkjfnsdkjfn jndsjfn akjsdnfkjsadnfkjsadnfkjasdnjfknsdkjfjk kjasdafnjk sdfkj ','2022-05-02 13:30:29'),(2,'sha@gmail.com','rev@gmail.com',4,'jadhfjk sdjfjk','2022-05-02 13:31:07');

/*Table structure for table `vender` */

DROP TABLE IF EXISTS `vender`;

CREATE TABLE `vender` (
  `id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `address` varchar(500) default NULL,
  `mobile` longtext,
  `status` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `vender` */

insert  into `vender`(`id`,`name`,`email`,`password`,`address`,`mobile`,`status`) values (1,'sha','sha@gmail.com','sha','jdf jksdf','7895874569',1),(2,'rohith','rohith@gmail.com','rohith','kjadsfnj ndjskfn kjna','9878748596',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
