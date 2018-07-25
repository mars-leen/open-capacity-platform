CREATE DATABASE IF NOT EXISTS `boot_security` DEFAULT CHARACTER SET = utf8mb4;

Use `boot_security`;

set session
sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

SET FOREIGN_KEY_CHECKS=0;


# Host: 192.168.3.150  (Version 5.7.22)
# Date: 2018-06-24 11:52:30
# Generator: MySQL-Front 5.4  (Build 4.153) - http://www.mysqlfront.de/

/*!40101 SET NAMES utf8 */;
#
# Structure for table "file_info"
#

DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` varchar(32) NOT NULL COMMENT '文件md5',
  `contentType` varchar(128) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(255) NOT NULL COMMENT '物理路径',
  `url` varchar(1024) NOT NULL,
  `type` int(1) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "file_info"
#

INSERT INTO `file_info` VALUES ('c5ca69c2971ac9add9efe91115bf500c','image/png',12105,'d:/files/2018/05/28/c5ca69c2971ac9add9efe91115bf500c.png','/2018/05/28/c5ca69c2971ac9add9efe91115bf500c.png',1,'2018-05-28 02:54:47','2018-05-28 02:54:47');

#
# Structure for table "oauth_access_token"
#

DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(48) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "oauth_access_token"
#


#
# Structure for table "oauth_approvals"
#

DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "oauth_approvals"
#


#
# Structure for table "oauth_client_details"
#

DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(48) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "oauth_client_details"
#

INSERT INTO `oauth_client_details` VALUES (1,'app',NULL,'app','app','password,refresh_token',NULL,NULL,180000,NULL,'{}','true'),(2,'mobile','mobile,test','mobile','all','password,refresh_token',NULL,NULL,180000,NULL,'{}','true'),(3,'test','test','test','test','password,refresh_token',NULL,NULL,180000,NULL,'{}','true'),(4,'webApp',NULL,'webApp','app','authorization_code,password,refresh_token,client_credentials',NULL,NULL,180000,NULL,'{}','true'),(5,'clientId','','clientSecret','all','authorization_code,password,refresh_token,client_credentials','http://www.baidu.com','',180000,NULL,'{}','true'),(6,'owen',NULL,'owen','app','authorization_code,password,refresh_token,client_credentials','http://127.0.0.1:9997/clientOne/login',NULL,180000,NULL,'{}','true');

#
# Structure for table "oauth_client_token"
#

DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(48) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "oauth_client_token"
#


#
# Structure for table "oauth_code"
#

DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "oauth_code"
#


#
# Structure for table "oauth_refresh_token"
#

DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "oauth_refresh_token"
#

INSERT INTO `oauth_refresh_token` VALUES ('b96e057b4e1c4920428e833db48d4c15',X'ACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002462303132643438372D613930382D343361662D613865662D3533633533393963386264367372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613B74C98E78',X'ACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000009770400000009737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F61646D696E7371007E000D740006617069646F637371007E000D74000C64617461626173652F6C6F677371007E000D74000673797374656D7371007E000D740008757365722F6164647371007E000D74000B757365722F64656C6574657371007E000D740009757365722F656469747371007E000D740009757365722F766965777371007E000D740008757365724C6973747871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0024787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00224C000573636F706571007E00247870740006776562417070737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00227870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F7479706574000870617373776F7264740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000174000361707078017371007E0033770C000000103F40000000000000787371007E002A3F40000000000000770800000010000000007870707371007E0033770C000000103F40000000000000787371007E0033770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000977040000000971007E000F71007E001171007E001371007E001571007E001771007E001971007E001B71007E001D71007E001F7871007E003D737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E002A3F400000000000067708000000080000000271007E002C71007E002D71007E002E71007E002F780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00244C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0030737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000971007E000F71007E001171007E001371007E001571007E001771007E001971007E001B71007E001D71007E001F787074000561646D696E');

#
# Structure for table "properties"
#

DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `lable` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "properties"
#

INSERT INTO `properties` VALUES (1,'zuul.debug.request','false','unieap-eureka-config-client','dev','master');

#
# Structure for table "sys_client_permission"
#

DROP TABLE IF EXISTS `sys_client_permission`;
CREATE TABLE `sys_client_permission` (
  `clientId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`clientId`,`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_client_permission"
#

INSERT INTO `sys_client_permission` VALUES (1,71),(1,72),(1,73),(1,74),(1,75),(2,71),(2,72),(2,73),(2,74),(2,75),(3,71),(3,72),(3,73),(3,74),(3,75),(4,71),(4,72),(4,73),(4,74),(4,75),(5,71),(5,72),(5,73),(5,74),(5,75);

#
# Structure for table "sys_client_server"
#

DROP TABLE IF EXISTS `sys_client_server`;
CREATE TABLE `sys_client_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL COMMENT '模块ID',
  `serverId` int(11) DEFAULT NULL COMMENT '服务ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务授权表';

#
# Data for table "sys_client_server"
#


#
# Structure for table "sys_logs"
#

DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `module` varchar(50) DEFAULT NULL COMMENT '模块名',
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '成功失败',
  `remark` text COMMENT '备注',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `createTime` (`createTime`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_logs"
#

INSERT INTO `sys_logs` VALUES (1,1,'登陆',1,NULL,'2018-03-14 03:59:44'),(2,1,'登陆',1,NULL,'2018-03-14 06:26:11'),(3,1,'登陆',1,NULL,'2018-03-14 08:39:16'),(4,1,'保存用户',1,NULL,'2018-03-14 08:43:48'),(5,1,'修改用户',1,NULL,'2018-03-14 08:43:56'),(6,1,'登陆',1,NULL,'2018-03-14 10:12:39'),(7,1,'登陆',1,NULL,'2018-03-14 13:01:21'),(8,1,'保存用户',1,NULL,'2018-03-14 13:02:36'),(9,1,'保存角色',1,NULL,'2018-03-14 13:03:08'),(10,1,'保存角色',1,NULL,'2018-03-14 13:03:18'),(11,1,'保存角色',1,NULL,'2018-03-14 13:03:36'),(12,1,'修改用户',1,NULL,'2018-03-14 13:03:43'),(13,1,'退出',1,NULL,'2018-03-14 13:03:50'),(14,4,'登陆',1,NULL,'2018-03-14 13:03:55'),(15,4,'退出',1,NULL,'2018-03-14 13:04:04'),(16,1,'登陆',1,NULL,'2018-03-14 13:04:09'),(17,1,'保存角色',1,NULL,'2018-03-14 13:04:18'),(18,1,'退出',1,NULL,'2018-03-14 13:04:22'),(19,4,'登陆',1,NULL,'2018-03-14 13:04:27'),(20,4,'退出',1,NULL,'2018-03-14 13:13:39'),(21,4,'登陆',1,NULL,'2018-03-14 13:13:45'),(22,4,'退出',1,NULL,'2018-03-14 13:22:28'),(23,4,'登陆',1,NULL,'2018-03-14 13:22:32'),(24,4,'退出',1,NULL,'2018-03-14 13:24:27'),(25,4,'登陆',1,NULL,'2018-03-14 13:24:31'),(26,4,'退出',1,NULL,'2018-03-14 13:24:50'),(27,4,'登陆',1,NULL,'2018-03-14 13:24:54'),(28,4,'登陆',1,NULL,'2018-03-14 15:49:48'),(29,4,'退出',1,NULL,'2018-03-14 15:51:00'),(30,4,'登陆',1,NULL,'2018-03-14 15:51:03'),(31,4,'退出',1,NULL,'2018-03-14 15:52:06'),(32,4,'登陆',1,NULL,'2018-03-14 15:52:09'),(33,4,'退出',1,NULL,'2018-03-14 15:56:29'),(34,4,'登陆',1,NULL,'2018-03-14 15:56:32'),(35,4,'登陆',1,NULL,'2018-03-14 15:57:21'),(36,4,'退出',1,NULL,'2018-03-14 16:03:58'),(37,4,'登陆',1,NULL,'2018-03-14 16:04:01'),(38,4,'退出',1,NULL,'2018-03-14 16:26:27'),(39,1,'登陆',1,NULL,'2018-03-14 16:26:31'),(40,1,'退出',1,NULL,'2018-03-14 16:26:48'),(41,4,'登陆',1,NULL,'2018-03-14 16:26:51'),(42,4,'退出',1,NULL,'2018-03-14 16:34:39'),(43,1,'登陆',1,NULL,'2018-03-14 16:35:19'),(44,1,'登陆',1,NULL,'2018-03-14 18:45:34'),(45,1,'登陆',1,NULL,'2018-03-14 23:30:14'),(46,1,'添加定时任务',1,NULL,'2018-03-15 00:00:08'),(47,4,'��½',1,NULL,'2018-03-15 04:37:19'),(48,1,'登陆',1,NULL,'2018-03-15 04:43:52'),(49,1,'生成代码',0,NULL,'2018-03-15 04:44:50'),(50,1,'生成代码',0,NULL,'2018-03-15 04:45:13'),(51,1,'修改菜单',1,NULL,'2018-03-15 04:45:57'),(52,1,'登陆',1,NULL,'2018-03-25 23:30:29'),(53,1,'登陆',1,NULL,'2018-03-26 18:16:00'),(54,1,'保存角色',1,NULL,'2018-03-26 18:16:20'),(55,1,'退出',1,NULL,'2018-03-26 18:16:29'),(56,1,'登陆',1,NULL,'2018-03-26 18:16:34'),(57,1,'退出',1,NULL,'2018-03-26 19:29:52'),(58,1,'登陆',1,NULL,'2018-03-26 19:29:57'),(59,1,'退出',1,NULL,'2018-03-26 19:31:43'),(60,1,'登陆',1,NULL,'2018-03-26 19:31:52'),(61,1,'登陆',1,NULL,'2018-03-26 22:36:47'),(62,1,'登陆',1,NULL,'2018-03-27 00:38:15'),(63,1,'登陆',1,NULL,'2018-03-27 00:46:41'),(64,1,'登陆',1,NULL,'2018-03-27 00:52:14'),(65,1,'登陆',1,NULL,'2018-03-27 00:54:55'),(66,1,'登陆',1,NULL,'2018-03-27 01:23:12'),(67,1,'登陆',1,NULL,'2018-03-27 02:20:42'),(68,1,'登陆',1,NULL,'2018-03-27 03:42:26'),(69,1,'登陆',1,NULL,'2018-03-27 04:56:58'),(70,1,'登陆',1,NULL,'2018-03-27 04:57:23'),(71,1,'登陆',1,NULL,'2018-03-27 04:58:41'),(72,1,'登陆',1,NULL,'2018-03-27 05:02:02'),(73,1,'登陆',1,NULL,'2018-03-27 19:17:50'),(74,4,'登陆',1,NULL,'2018-03-28 23:12:13'),(75,4,'登陆',1,NULL,'2018-03-28 23:41:49'),(76,4,'退出',1,NULL,'2018-03-28 23:41:53'),(77,1,'登陆',1,NULL,'2018-03-28 23:41:58'),(78,1,'退出',1,NULL,'2018-03-28 23:44:53'),(79,1,'登陆',1,NULL,'2018-03-28 23:44:57'),(80,1,'退出',1,NULL,'2018-03-28 23:46:18'),(81,1,'登陆',1,NULL,'2018-03-28 23:46:23'),(82,1,'登陆',1,NULL,'2018-03-31 03:31:00'),(83,1,'登陆',1,NULL,'2018-03-31 04:08:08'),(84,1,'登陆',1,NULL,'2018-04-03 00:08:01'),(85,1,'保存角色',1,NULL,'2018-04-03 00:08:29'),(86,1,'退出',1,NULL,'2018-04-03 00:08:37'),(87,1,'登陆',1,NULL,'2018-04-03 00:08:42'),(88,1,'登陆',1,NULL,'2018-04-03 01:18:56'),(89,1,'登陆',1,NULL,'2018-04-04 23:00:02'),(90,1,'登陆',1,NULL,'2018-04-09 06:48:29'),(91,1,'登陆',1,NULL,'2018-04-12 00:19:47'),(92,1,'登陆',1,NULL,'2018-04-14 20:01:20'),(93,1,'退出',1,NULL,'2018-04-14 20:01:26'),(94,1,'登陆',1,NULL,'2018-04-14 20:16:46'),(95,1,'登陆',1,NULL,'2018-04-14 20:42:45'),(96,1,'登陆',1,NULL,'2018-04-14 21:22:18'),(97,1,'登陆',1,NULL,'2018-04-14 21:42:05'),(98,1,'保存用户',1,NULL,'2018-04-14 21:42:43'),(99,1,'修改菜单',1,NULL,'2018-04-14 21:43:11'),(100,1,'生成代码',0,NULL,'2018-04-14 21:44:00'),(101,1,'生成代码',0,NULL,'2018-04-14 21:46:30'),(102,1,'生成代码',0,NULL,'2018-04-14 21:47:02'),(103,1,'生成代码',0,NULL,'2018-04-14 21:49:52'),(104,1,'生成代码',0,NULL,'2018-04-14 21:50:10'),(105,1,'生成代码',1,NULL,'2018-04-14 22:04:21'),(106,1,'文件上传',1,NULL,'2018-04-14 22:12:57'),(107,1,'文件删除',1,NULL,'2018-04-14 22:14:21'),(108,1,'登陆',1,NULL,'2018-04-15 01:43:48'),(109,1,'退出',1,NULL,'2018-04-15 01:49:59'),(110,1,'登陆',1,NULL,'2018-04-15 01:50:09'),(111,1,'登陆',1,NULL,'2018-04-15 11:36:18'),(112,1,'保存角色',1,NULL,'2018-04-15 11:39:42'),(113,1,'退出',1,NULL,'2018-04-15 11:39:46'),(114,1,'登陆',1,NULL,'2018-04-15 11:39:51'),(115,1,'生成代码',1,NULL,'2018-04-15 11:42:35'),(116,1,'退出',1,NULL,'2018-04-15 11:47:17'),(117,1,'登陆',1,NULL,'2018-04-15 11:47:21'),(118,1,'退出',1,NULL,'2018-04-15 12:11:38'),(119,1,'登陆',1,NULL,'2018-04-15 12:11:44'),(120,1,'登陆',1,NULL,'2018-04-24 10:29:06'),(121,1,'登陆',1,NULL,'2018-04-24 10:32:11'),(122,1,'登陆',1,NULL,'2018-04-24 10:34:41'),(123,1,'登陆',1,NULL,'2018-04-24 10:55:53'),(124,1,'登陆',1,NULL,'2018-04-24 10:57:04'),(125,1,'登陆',1,NULL,'2018-04-24 10:59:25'),(126,1,'退出',1,NULL,'2018-04-24 11:07:13'),(127,1,'登陆',1,NULL,'2018-04-24 11:09:14'),(128,1,'保存角色',1,NULL,'2018-04-24 11:09:34'),(129,1,'文件上传',1,NULL,'2018-04-24 11:09:48'),(130,1,'文件删除',1,NULL,'2018-04-24 11:09:58'),(131,1,'登陆',1,NULL,'2018-04-24 17:46:26'),(132,1,'保存角色',1,NULL,'2018-04-24 17:47:12'),(133,1,'登陆',1,NULL,'2018-04-25 14:38:39'),(134,1,'退出',1,NULL,'2018-04-25 14:39:03'),(135,1,'登陆',1,NULL,'2018-04-25 14:39:09'),(136,1,'退出',1,NULL,'2018-04-25 14:46:06'),(137,1,'登陆',1,NULL,'2018-04-25 14:57:04'),(138,1,'退出',1,NULL,'2018-04-25 14:57:42'),(139,1,'登陆',1,NULL,'2018-04-25 15:03:02'),(140,1,'退出',1,NULL,'2018-04-25 15:03:08'),(141,1,'登陆',1,NULL,'2018-04-25 15:08:17'),(142,1,'退出',1,NULL,'2018-04-25 15:09:17'),(143,1,'登陆',1,NULL,'2018-04-25 15:23:24'),(144,1,'退出',1,NULL,'2018-04-25 15:30:49'),(145,1,'登陆',1,NULL,'2018-04-25 15:30:57'),(146,1,'保存角色',1,NULL,'2018-04-25 15:52:18'),(147,1,'保存角色',1,NULL,'2018-04-25 15:53:03'),(148,1,'登陆',1,NULL,'2018-04-25 16:02:21'),(149,1,'退出',1,NULL,'2018-04-25 16:03:22'),(150,1,'登陆',1,NULL,'2018-04-26 09:32:24'),(151,1,'修改菜单',1,NULL,'2018-04-26 09:33:47'),(152,1,'退出',1,NULL,'2018-04-26 09:33:59'),(153,1,'登陆',1,NULL,'2018-04-26 09:34:07'),(154,1,'退出',1,NULL,'2018-04-26 09:36:21'),(155,1,'登陆',1,NULL,'2018-04-26 09:36:36'),(156,1,'修改菜单',1,NULL,'2018-04-26 09:37:12'),(157,1,'退出',1,NULL,'2018-04-26 09:37:22'),(158,1,'登陆',1,NULL,'2018-04-26 09:37:33'),(159,1,'登陆',1,NULL,'2018-04-26 09:39:50'),(160,1,'退出',1,NULL,'2018-04-26 10:25:09'),(161,1,'登陆',1,NULL,'2018-04-26 10:25:16'),(162,1,'保存角色',1,NULL,'2018-04-26 10:49:07'),(163,1,'退出',1,NULL,'2018-04-26 10:51:52'),(164,1,'登陆',1,NULL,'2018-04-26 10:52:46'),(165,1,'登陆',1,NULL,'2018-04-26 10:57:38'),(166,1,'保存角色',1,NULL,'2018-04-26 11:16:36'),(167,1,'登陆',1,NULL,'2018-04-26 17:48:38'),(168,1,'登陆',1,NULL,'2018-04-27 10:30:53'),(169,1,'登陆',1,NULL,'2018-05-02 11:58:33'),(170,1,'登陆',1,NULL,'2018-05-02 15:05:51'),(171,1,'登陆',1,NULL,'2018-05-03 14:44:52'),(172,1,'退出',1,NULL,'2018-05-03 14:53:01'),(173,1,'登陆',1,NULL,'2018-05-03 14:53:08'),(174,1,'退出',1,NULL,'2018-05-03 14:54:07'),(175,1,'登陆',1,NULL,'2018-05-03 14:54:18'),(176,1,'登陆',1,NULL,'2018-05-03 15:12:14'),(177,1,'登陆',1,NULL,'2018-05-04 09:43:22'),(178,1,'登陆',1,NULL,'2018-05-04 10:05:30'),(179,1,'登陆',1,NULL,'2018-05-04 12:16:22'),(180,1,'登陆',1,NULL,'2018-05-14 15:25:11'),(181,1,'保存角色',1,NULL,'2018-05-14 15:25:53'),(182,1,'退出',1,NULL,'2018-05-14 15:25:56'),(183,1,'登陆',1,NULL,'2018-05-14 15:26:01'),(184,1,'退出',1,NULL,'2018-05-14 15:26:15'),(185,1,'登陆',1,NULL,'2018-05-14 15:26:23'),(186,1,'保存模块',1,NULL,'2018-05-14 15:27:33'),(187,1,'保存模块',1,NULL,'2018-05-14 15:28:06'),(188,1,'保存服务',1,NULL,'2018-05-14 15:29:41'),(189,1,'保存服务',1,NULL,'2018-05-14 15:30:10'),(190,1,'修改服务',1,NULL,'2018-05-14 15:30:24'),(191,1,'退出',1,NULL,'2018-05-15 20:25:15'),(192,1,'登陆',1,NULL,'2018-05-15 20:25:16'),(193,1,'退出',1,NULL,'2018-05-15 20:29:35'),(194,1,'登陆',1,NULL,'2018-05-15 20:29:36'),(195,1,'退出',1,NULL,'2018-05-15 20:30:02'),(196,1,'登陆',1,NULL,'2018-05-15 20:30:03'),(197,1,'退出',1,NULL,'2018-05-15 20:43:21'),(198,1,'登陆',1,NULL,'2018-05-15 20:43:22'),(199,1,'退出',1,NULL,'2018-05-15 21:12:00'),(200,1,'登陆',1,NULL,'2018-05-15 21:12:02'),(201,1,'退出',1,NULL,'2018-05-15 21:21:59'),(202,1,'登陆',1,NULL,'2018-05-15 21:22:00'),(203,1,'登陆',1,NULL,'2018-05-16 10:45:32'),(204,1,'登陆',1,NULL,'2018-05-16 11:12:57'),(205,1,'登陆',1,NULL,'2018-05-16 11:16:12'),(206,1,'登陆',1,NULL,'2018-05-16 11:37:20'),(207,1,'退出',1,NULL,'2018-05-16 11:54:56'),(208,1,'登陆',1,NULL,'2018-05-16 11:54:57'),(209,1,'退出',1,NULL,'2018-05-16 14:05:34'),(210,1,'登陆',1,NULL,'2018-05-16 14:05:36'),(211,1,'退出',1,NULL,'2018-05-16 14:13:04'),(212,1,'登陆',1,NULL,'2018-05-16 14:13:05'),(213,1,'登陆',1,NULL,'2018-05-16 14:20:20'),(214,1,'登陆',1,NULL,'2018-05-16 14:33:50'),(215,1,'登陆',1,NULL,'2018-05-16 14:44:44'),(216,1,'退出',1,NULL,'2018-05-16 14:46:48'),(217,1,'登陆',1,NULL,'2018-05-16 14:46:49'),(218,1,'退出',1,NULL,'2018-05-16 14:55:08'),(219,1,'登陆',1,NULL,'2018-05-16 14:55:09'),(220,1,'登陆',1,NULL,'2018-05-16 15:29:35'),(221,1,'退出',1,NULL,'2018-05-16 16:12:33'),(222,1,'登陆',1,NULL,'2018-05-16 16:12:34'),(223,1,'登陆',1,NULL,'2018-05-16 16:12:40'),(224,1,'登陆',1,NULL,'2018-05-16 16:36:01'),(225,1,'登陆',1,NULL,'2018-05-16 17:07:55'),(226,1,'登陆',1,NULL,'2018-05-16 17:31:19'),(227,1,'登陆',1,NULL,'2018-05-16 17:49:52'),(228,1,'登陆',1,NULL,'2018-05-16 17:55:27'),(229,1,'登陆',1,NULL,'2018-05-17 14:12:25'),(230,1,'登陆',1,NULL,'2018-05-17 14:48:04'),(231,1,'登陆',1,NULL,'2018-05-17 14:52:12'),(232,1,'登陆',1,NULL,'2018-05-17 15:08:28'),(233,1,'登陆',1,NULL,'2018-05-17 15:09:36'),(234,1,'登陆',1,NULL,'2018-05-17 15:13:14'),(235,1,'登陆',1,NULL,'2018-05-17 15:43:52'),(236,1,'登陆',1,NULL,'2018-05-17 15:46:45'),(237,1,'登陆',1,NULL,'2018-05-17 15:50:35'),(238,1,'登陆',1,NULL,'2018-05-17 15:51:46'),(239,1,'登陆',1,NULL,'2018-05-17 15:57:28'),(240,1,'退出',1,NULL,'2018-05-17 17:05:21'),(241,1,'登陆',1,NULL,'2018-05-17 17:05:25'),(242,1,'登陆',1,NULL,'2018-05-17 17:05:34'),(243,1,'登陆',1,NULL,'2018-05-17 17:46:35'),(244,1,'登陆',1,NULL,'2018-05-17 17:47:56'),(245,1,'登陆',1,NULL,'2018-05-17 17:49:23'),(246,1,'登陆',1,NULL,'2018-05-17 17:56:50'),(247,1,'登陆',1,NULL,'2018-05-17 18:00:28'),(248,1,'登陆',1,NULL,'2018-05-17 18:01:21'),(249,1,'退出',1,NULL,'2018-05-17 20:01:38'),(250,1,'登陆',1,NULL,'2018-05-17 20:01:39'),(251,1,'退出',1,NULL,'2018-05-17 20:02:27'),(252,1,'登陆',1,NULL,'2018-05-17 20:02:34'),(253,1,'登陆',1,NULL,'2018-05-17 20:05:36'),(254,1,'登陆',1,NULL,'2018-05-17 20:07:47'),(255,1,'登陆',1,NULL,'2018-05-17 20:08:29'),(256,1,'登陆',1,NULL,'2018-05-17 20:10:24'),(257,1,'登陆',1,NULL,'2018-05-17 21:07:53'),(258,1,'登陆',1,NULL,'2018-05-17 21:26:35'),(259,1,'退出',1,NULL,'2018-05-17 21:36:48'),(260,1,'登陆',1,NULL,'2018-05-17 21:37:01'),(261,1,'登陆',1,NULL,'2018-05-17 21:43:10'),(262,1,'登陆',1,NULL,'2018-05-17 21:51:16'),(263,1,'登陆',1,NULL,'2018-05-18 11:09:20'),(264,1,'登陆',1,NULL,'2018-06-07 10:00:30'),(265,1,'退出',1,NULL,'2018-06-07 10:01:04'),(266,1,'登陆',1,NULL,'2018-06-11 05:00:07'),(267,1,'退出',1,NULL,'2018-06-11 05:02:34'),(268,1,'登陆',1,NULL,'2018-06-11 05:26:20'),(269,1,'退出',1,NULL,'2018-06-11 05:29:11'),(270,1,'登陆',1,NULL,'2018-06-11 05:29:34'),(271,1,'修改菜单',1,NULL,'2018-06-11 05:30:12'),(272,1,'退出',1,NULL,'2018-06-11 05:30:16'),(273,1,'登陆',1,NULL,'2018-06-11 05:30:22'),(274,1,'登陆',1,NULL,'2018-06-12 04:19:00'),(275,1,'登陆',1,NULL,'2018-06-22 06:44:06'),(276,1,'登陆',1,NULL,'2018-06-22 11:56:38'),(277,1,'删除应用',1,NULL,'2018-06-22 11:56:50'),(278,1,'删除应用',1,NULL,'2018-06-22 11:56:53'),(279,1,'删除应用',1,NULL,'2018-06-22 11:56:56'),(280,1,'删除应用',1,NULL,'2018-06-22 11:56:58'),(281,1,'删除应用',1,NULL,'2018-06-22 11:57:00'),(282,1,'保存应用',1,NULL,'2018-06-22 11:59:22'),(283,1,'删除应用',1,NULL,'2018-06-22 12:00:12'),(284,1,'保存应用',1,NULL,'2018-06-22 12:00:25'),(285,1,'登陆',1,NULL,'2018-06-22 17:01:36'),(286,1,'保存菜单',1,NULL,'2018-06-22 17:09:40'),(287,1,'保存角色',1,NULL,'2018-06-22 17:09:54'),(288,1,'退出',1,NULL,'2018-06-22 17:09:57'),(289,1,'登陆',1,NULL,'2018-06-22 17:10:01'),(290,1,'退出',1,NULL,'2018-06-22 17:25:57'),(291,1,'登陆',1,NULL,'2018-06-22 17:26:01'),(292,1,'删除菜单',1,NULL,'2018-06-22 17:32:50'),(293,1,'删除菜单',1,NULL,'2018-06-22 17:33:18'),(294,1,'退出',1,NULL,'2018-06-22 17:44:04'),(295,1,'登陆',1,NULL,'2018-06-22 17:44:09'),(296,1,'修改服务',1,NULL,'2018-06-22 17:53:35'),(297,1,'保存服务',1,NULL,'2018-06-22 17:53:55'),(298,1,'删除服务',0,'\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'permissionId\' in \'where clause\'\r\n### The error may involve com.open.capacity.security.dao.ServiceDao.deleteRolePermission-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_services where permissionId = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'permissionId\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'permissionId\' in \'where clause\'','2018-06-22 17:54:10'),(299,1,'删除服务',1,NULL,'2018-06-22 17:57:45'),(300,1,'删除服务',1,NULL,'2018-06-22 17:59:05'),(301,1,'删除服务',1,NULL,'2018-06-22 17:59:08'),(302,1,'删除服务',1,NULL,'2018-06-22 17:59:10'),(303,1,'删除服务',1,NULL,'2018-06-22 17:59:13'),(304,1,'删除服务',1,NULL,'2018-06-22 17:59:15'),(305,1,'删除服务',1,NULL,'2018-06-22 17:59:17'),(306,1,'删除服务',1,NULL,'2018-06-22 17:59:19'),(307,1,'删除服务',1,NULL,'2018-06-22 17:59:21'),(308,1,'删除服务',1,NULL,'2018-06-22 17:59:24'),(309,1,'删除服务',1,NULL,'2018-06-22 17:59:26'),(310,1,'修改服务',1,NULL,'2018-06-22 17:59:42'),(311,1,'删除服务',1,NULL,'2018-06-22 18:00:25'),(312,1,'删除服务',1,NULL,'2018-06-22 18:00:29'),(313,1,'删除服务',1,NULL,'2018-06-22 18:00:38'),(314,1,'退出',1,NULL,'2018-06-22 07:23:01'),(315,1,'登陆',1,NULL,'2018-06-22 07:23:06'),(316,1,'保存服务',1,NULL,'2018-06-22 07:23:44'),(317,1,'保存服务',1,NULL,'2018-06-22 07:24:18'),(318,1,'修改服务',1,NULL,'2018-06-22 07:24:57'),(319,1,'保存服务',1,NULL,'2018-06-22 07:27:46'),(320,1,'修改服务',1,NULL,'2018-06-22 07:28:14'),(321,1,'保存服务',1,NULL,'2018-06-22 07:28:36'),(322,1,'保存服务',1,NULL,'2018-06-22 07:28:53'),(323,1,'保存服务',1,NULL,'2018-06-22 07:34:15'),(324,1,'保存服务',1,NULL,'2018-06-22 07:35:51'),(325,1,'修改服务',1,NULL,'2018-06-22 07:36:29'),(326,1,'修改服务',1,NULL,'2018-06-22 07:37:17'),(327,1,'保存服务',1,NULL,'2018-06-22 07:38:37'),(328,1,'修改服务',1,NULL,'2018-06-22 07:38:52'),(329,1,'保存菜单',1,NULL,'2018-06-22 07:44:33'),(330,1,'修改菜单',1,NULL,'2018-06-22 07:44:49'),(331,1,'修改菜单',1,NULL,'2018-06-22 07:45:05'),(332,1,'退出',1,NULL,'2018-06-22 07:45:10'),(333,1,'登陆',1,NULL,'2018-06-22 07:45:16'),(334,1,'保存角色',1,NULL,'2018-06-22 07:45:57'),(335,1,'退出',1,NULL,'2018-06-22 07:46:02'),(336,1,'登陆',1,NULL,'2018-06-22 07:46:07'),(337,1,'保存角色',1,NULL,'2018-06-22 07:46:48'),(338,1,'删除菜单',1,NULL,'2018-06-22 07:47:03'),(339,1,'退出',1,NULL,'2018-06-22 07:47:06'),(340,1,'登陆',1,NULL,'2018-06-22 07:47:12'),(341,1,'修改菜单',1,NULL,'2018-06-22 07:47:33'),(342,1,'退出',1,NULL,'2018-06-22 07:47:37'),(343,1,'登陆',1,NULL,'2018-06-22 07:47:45'),(344,1,'修改菜单',1,NULL,'2018-06-22 07:48:01'),(345,1,'退出',1,NULL,'2018-06-22 07:48:05'),(346,1,'登陆',1,NULL,'2018-06-22 07:48:11'),(347,1,'登陆',1,NULL,'2018-06-22 07:51:15'),(348,1,'退出',1,NULL,'2018-06-22 07:52:00'),(349,1,'登陆',1,NULL,'2018-06-22 07:52:05'),(350,1,'登陆',1,NULL,'2018-06-22 07:52:37'),(351,1,'登陆',1,NULL,'2018-06-22 07:54:01'),(352,1,'登陆',1,NULL,'2018-06-22 07:54:35'),(353,1,'登陆',1,NULL,'2018-06-22 07:54:51'),(354,1,'登陆',1,NULL,'2018-06-22 08:40:43'),(355,1,'保存应用',0,'webApp已存在','2018-06-22 08:40:57'),(356,1,'保存应用',0,'webApp已存在','2018-06-22 08:43:01'),(357,1,'保存应用',0,'webApp已存在','2018-06-22 08:44:30'),(358,1,'保存应用',0,'webApp已存在','2018-06-22 08:44:47'),(359,1,'保存服务',1,NULL,'2018-06-22 08:52:37'),(360,1,'修改服务',1,NULL,'2018-06-22 08:53:04'),(361,1,'保存服务',1,NULL,'2018-06-22 08:53:31');

#
# Structure for table "sys_module"
#

DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '模块名',
  `index_page` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '模块首页',
  `if_show` varchar(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否显示（1：显示；0：不显示）',
  `sort` int(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='模块表';

#
# Data for table "sys_module"
#

INSERT INTO `sys_module` VALUES (1,NULL,'',NULL,'认证中心','/auth','1',100),(2,NULL,'',NULL,'演示demo','/client','1',100);

#
# Structure for table "sys_permission"
#

DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  `href` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_permission"
#

INSERT INTO `sys_permission` VALUES (1,0,'用户管理','fa-users','',1,'',2),(2,1,'用户查询','fa-user','pages/user/userList.html',1,'',3),(3,2,'查询','','',2,'sys:user:query',100),(4,2,'新增','','',2,'sys:user:add',100),(6,1,'修改密码','fa-pencil-square-o','pages/user/changePassword.html',1,'sys:user:password',4),(7,0,'系统设置','fa-gears','',1,'',5),(8,7,'菜单','fa-cog','pages/menu/menuList.html',1,'',6),(9,8,'查询','','',2,'sys:menu:query',100),(10,8,'新增','','',2,'sys:menu:add',100),(11,8,'删除','','',2,'sys:menu:del',100),(12,7,'角色','fa-user-secret','pages/role/roleList.html',1,'',7),(13,12,'查询','','',2,'sys:role:query',100),(14,12,'新增','','',2,'sys:role:add',100),(15,12,'删除','','',2,'sys:role:del',100),(16,0,'文件管理','fa-folder-open','pages/file/fileList.html',1,'',8),(17,16,'查询','','',2,'sys:file:query',100),(18,16,'删除','','',2,'sys:file:del',100),(19,0,'数据源监控','fa-eye','druid/index.html',1,'',9),(26,0,'日志查询','fa-reorder','pages/log/logList.html',1,'sys:log:query',13),(41,0,'注册中心','fa-th-list','pages/euraka/euraka.html',1,'',18),(42,0,'配置中心','fa-th-list','http://127.0.0.1:8070',1,'',19),(56,0,'工作流管理','fa-th-list',NULL,1,NULL,22),(57,56,'流程管理',NULL,'/pages/activiti/actList.html',1,NULL,21),(58,56,'模型列表','','/pages/activiti/actModelList.html',1,'',22),(60,41,'操作','','',2,'job:add',100),(61,66,'应用管理','','pages/client/clientList.html',1,'',10),(62,61,'查询','','',2,'sys:role:query',100),(63,61,'新增','','',2,'sys:role:add',100),(64,61,'删除','','',2,'sys:role:del',100),(65,66,'服务管理','','pages/service/serviceList.html',1,'',1),(66,0,'资源管理','','',1,'',100);

#
# Structure for table "sys_role"
#

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES (1,'ADMIN','管理员','2017-05-01 13:25:39','2018-06-22 07:46:48'),(2,'USER','11','2017-08-01 21:47:31','2018-06-21 11:09:12'),(3,'test1','test1','2018-03-14 13:03:36','2018-06-21 11:09:32'),(4,'ttttt','ttt1','2018-04-24 11:09:34','2018-06-21 11:12:26'),(5,'11111','222222','2018-04-24 17:47:12','2018-04-26 10:49:07');

#
# Structure for table "sys_role_permission"
#

DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_role_permission"
#

INSERT INTO `sys_role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,26),(1,41),(1,42),(1,56),(1,57),(1,58),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(2,1),(2,2),(2,3),(2,4),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(3,1),(3,2),(3,3),(3,7),(3,12),(3,13),(3,14),(3,15),(4,1),(4,2),(4,3),(4,4),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,26),(4,41),(4,42),(5,1),(5,2),(5,3),(5,4),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,26),(5,38),(5,39),(5,40),(5,41),(5,42);

#
# Structure for table "sys_role_user"
#

DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_role_user"
#

INSERT INTO `sys_role_user` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(4,3),(5,1),(5,2);

#
# Structure for table "sys_server"
#

DROP TABLE IF EXISTS `sys_server`;
CREATE TABLE `sys_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `moduleId` int(11) DEFAULT NULL COMMENT '模块ID',
  `name` varchar(100) DEFAULT NULL COMMENT '服务名称',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `description` varchar(255) DEFAULT NULL COMMENT '服务描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='服务管理表';

#
# Data for table "sys_server"
#

INSERT INTO `sys_server` VALUES (1,0,1,'token服务','/user/token','用户名密码获取token',100),(2,0,1,'token服务','/client/token','clientId获取token',100);

#
# Structure for table "sys_services"
#

DROP TABLE IF EXISTS `sys_services`;
CREATE TABLE `sys_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  `href` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_services"
#

INSERT INTO `sys_services` VALUES (71,0,'授权服务','','/auth',1,'',1),(72,71,'用户授权token','','/auth/user/token',1,'',100),(73,71,'应用申请token','','/auth/client/token',1,'',100),(74,0,'测试微服务','','/client',1,'',100),(75,74,'hello接口','','/client/hello',1,'',100);

#
# Structure for table "sys_user"
#

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headImgUrl` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES (1,'admin','$2a$10$q54rooCXqDTWYkf29d4ZFu/L3zkq5Uoa6jdA/spRNSwpxksEqJYpy','管理员',NULL,'','','','1998-07-01',0,1,'2017-04-10 15:21:38','2018-05-28 02:49:01'),(2,'user','$2a$10$ooGb4wjT7Hg3zgU2RhZp6eVu3jvG29i/U4L6VRwiZZ4.DZ0OOEAHu','用户',NULL,'22222','2222','',NULL,1,1,'2017-08-01 21:47:18','2018-06-21 21:05:02'),(3,'test123','$2a$10$MGxO0dynaARStolVS9tzk.ZGwzlC2WZ2LZ/LzxixWxCUoftU5Xtnq','test111',NULL,'18571111111','221','22','2018-03-14',1,1,'2018-03-14 08:43:48','2018-06-21 21:04:47'),(4,'owen','$2a$10$JTuOh..ec2N1BBi6NOsn1.beg72gN7je7uNvFn.VWbfkrAsPZ3otC','test',NULL,'18571111111','','11@11.com','2018-03-20',0,1,'2018-03-14 13:02:36','2018-06-12 20:56:07'),(5,'111111111','$2a$10$mJuBGzs67CyExiTZkk5iLOF9sE09GDK7jLf2O6gosMh.g/fDeKEiS','111111',NULL,'11111111111','11111111111','11@11.com','2018-04-11',0,1,'2018-04-14 21:42:43','2018-04-14 21:42:43');

#
# Structure for table "t_dict"
#

DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `k` varchar(16) NOT NULL,
  `val` varchar(64) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`k`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_dict"
#

INSERT INTO `t_dict` VALUES (1,'sex','0','女','2017-11-17 09:58:24','2017-11-18 14:21:05'),(2,'sex','1','男','2017-11-17 10:03:46','2017-11-17 10:03:46'),(3,'userStatus','0','无效','2017-11-17 16:26:06','2017-11-17 16:26:09'),(4,'userStatus','1','正常','2017-11-17 16:26:06','2017-11-17 16:26:09'),(5,'userStatus','2','锁定','2017-11-17 16:26:06','2017-11-17 16:26:09'),(6,'noticeStatus','0','草稿','2017-11-17 16:26:06','2017-11-17 16:26:09'),(7,'noticeStatus','1','发布','2017-11-17 16:26:06','2017-11-17 16:26:09'),(8,'isRead','0','未读','2017-11-17 16:26:06','2017-11-17 16:26:09'),(9,'isRead','1','已读','2017-11-17 16:26:06','2017-11-17 16:26:09');

#
# Structure for table "t_job"
#

DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cron` varchar(64) NOT NULL,
  `springBeanName` varchar(64) NOT NULL COMMENT 'springBean名',
  `methodName` varchar(64) NOT NULL COMMENT '方法名',
  `isSysJob` tinyint(1) NOT NULL COMMENT '是否是系统job',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobName` (`jobName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_job"
#


#
# Structure for table "t_mail"
#

DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '发送人',
  `subject` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '正文',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_mail"
#


#
# Structure for table "t_mail_to"
#

DROP TABLE IF EXISTS `t_mail_to`;
CREATE TABLE `t_mail_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailId` int(11) NOT NULL,
  `toUser` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1成功，0失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_mail_to"
#


#
# Structure for table "t_notice"
#

DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_notice"
#


#
# Structure for table "t_notice_read"
#

DROP TABLE IF EXISTS `t_notice_read`;
CREATE TABLE `t_notice_read` (
  `noticeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`noticeId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_notice_read"
#


#
# Structure for table "t_token"
#

DROP TABLE IF EXISTS `t_token`;
CREATE TABLE `t_token` (
  `id` varchar(36) NOT NULL COMMENT 'token',
  `val` text NOT NULL COMMENT 'LoginUser的json串',
  `expireTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "t_token"
#


#
# Structure for table "user_leave"
#

DROP TABLE IF EXISTS `user_leave`;
CREATE TABLE `user_leave` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `user_name` varchar(18) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `process_instance_Id` varchar(32) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user_leave"
#

