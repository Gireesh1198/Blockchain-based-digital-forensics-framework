
CREATE DATABASE  `block_chain_forensic`;

USE `block_chain_forensic`;

/*Table structure for table `data` */

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `caseid` varchar(200) DEFAULT NULL,
  `ip` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `recent` text,
  `modified` text,
  `dataset` longtext,
  `status` varchar(200) DEFAULT 'Initial',
  `t1` varchar(200) DEFAULT NULL,
  `t2` varchar(200) DEFAULT NULL,
  `t3` varchar(200) DEFAULT NULL,
  `t4` varchar(200) DEFAULT NULL,
  `h1` varchar(200) DEFAULT NULL,
  `h2` varchar(200) DEFAULT NULL,
  `h3` varchar(200) DEFAULT NULL,
  `h4` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


