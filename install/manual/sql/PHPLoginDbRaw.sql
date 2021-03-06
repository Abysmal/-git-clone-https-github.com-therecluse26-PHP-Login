SET 
@base_dir = 'C:\\xampp2\\htdocs\\PHP-Login\\', /* Base directory of PHP-Login (for Windows, use double backslashes) */
@base_url = 'http://localhost/PHP-Login', /* Website base URL */
@site_name = 'Just a Website', /* Your website name */
@curl_enabled = true, /* If cURL is enabled in PHP */
@mail_server = '', /* SMTP server. Ex: 'smtp.gmail.com' */
@mail_user = '', /* SMTP user */
@mail_pw = '', /* SMTP password */
@mail_security = 'tls', /* SMTP security type */
@mail_port = '587', /* SMTP port */
@sa_user = 'superadmin', /* Superadmin Username */
@sa_id = '0000000000000000000001', /* Superadmin ID, 23 alpha-numeric characters */
@sa_email = 'you@website.com', /* Superadmin email */
@sa_password = '$2y$10$i432YJ.YYM4znFu2lUYUFuH7raZ7D1/Bws7pO4Mk8wSA4GKHl7jqW' /* Hashed password. Default is: PHPLogin! CHANGE THIS AFTER FIRST LOGIN! */;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `adminid` char(23) NOT NULL DEFAULT 'uuid_short();',
  `userid` char(23) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `superadmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminid`,`userid`),
  UNIQUE KEY `adminid_UNIQUE` (`adminid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  CONSTRAINT `fk_userid_admins` FOREIGN KEY (`userid`) REFERENCES `members` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appconfig`
--

DROP TABLE IF EXISTS `appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appconfig` (
  `setting` char(26) NOT NULL,
  `value` varchar(12000) NOT NULL,
  `sortorder` int(5) DEFAULT NULL,
  `category` varchar(25) NOT NULL,
  `type` varchar(15) NOT NULL,
  `description` varchar(140) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting`),
  UNIQUE KEY `setting_UNIQUE` (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cookies`
--

DROP TABLE IF EXISTS `cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cookies` (
  `cookieid` char(23) NOT NULL,
  `userid` char(23) NOT NULL,
  `tokenid` char(25) NOT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deletedmembers`
--

DROP TABLE IF EXISTS `deletedmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedmembers` (
  `id` char(23) NOT NULL,
  `username` varchar(65) NOT NULL DEFAULT '',
  `password` varchar(65) NOT NULL DEFAULT '',
  `email` varchar(65) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `mod_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loginattempts`
--

DROP TABLE IF EXISTS `loginattempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginattempts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(65) DEFAULT NULL,
  `IP` varchar(20) NOT NULL,
  `Attempts` int(11) NOT NULL,
  `LastLogin` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maillog`
--

DROP TABLE IF EXISTS `maillog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL DEFAULT 'generic',
  `status` varchar(45) DEFAULT NULL,
  `recipient` varchar(5000) DEFAULT NULL,
  `response` mediumtext NOT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memberinfo`
--

DROP TABLE IF EXISTS `memberinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberinfo` (
  `userid` char(23) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(55) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `bio` varchar(20000) DEFAULT NULL,
  `userimage` varchar(255) DEFAULT NULL,
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  KEY `fk_userid_idx` (`userid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` char(23) NOT NULL,
  `username` varchar(65) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(65) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `mod_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER add_admin AFTER INSERT ON members FOR EACH ROW BEGIN IF (NEW.admin = 1) THEN  INSERT INTO admins (adminid, userid, active, superadmin ) VALUES (uuid_short(), NEW.id, 1, 0 ); END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER add_admin_beforeUpdate BEFORE UPDATE ON members FOR EACH ROW BEGIN set @s = (SELECT superadmin from admins where userid = NEW.id); set @a = (SELECT adminid from admins where userid = NEW.id); IF (NEW.admin = 1 && isnull(@a)) THEN INSERT INTO admins ( adminid, userid, active, superadmin ) VALUES ( uuid_short(), NEW.id, 1, 0 ); ELSEIF (NEW.admin = 0) THEN IF (@s = 0) THEN DELETE FROM admins WHERE userid = NEW.id and superadmin = 0; ELSEIF (@s = 1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Cannot delete superadmin'; END IF; END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER move_to_deleted_members AFTER DELETE ON members FOR EACH ROW BEGIN DELETE FROM deleted_members WHERE deleted_members.id = OLD.id; UPDATE admins SET active = '0' where admins.userid = OLD.id;  INSERT INTO deleted_members ( id, username, password, email, verified, admin) VALUES ( OLD.id, OLD.username, OLD.password, OLD.email, OLD.verified, OLD.admin ); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `tokenid` char(25) NOT NULL,
  `userid` char(23) NOT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tokenid`),
  UNIQUE KEY `tokenid_UNIQUE` (`tokenid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  CONSTRAINT `userid_t` FOREIGN KEY (`userid`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'login234234234'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `cleanupOldDeleted` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = latin1 */ ;;
/*!50003 SET character_set_results = latin1 */ ;;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `cleanupOldDeleted` ON SCHEDULE EVERY 1 DAY STARTS '2017-03-20 18:33:40' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Removes deleted records older than 30 days.' DO BEGIN DELETE FROM deleted_members WHERE mod_timestamp < DATE_SUB(NOW(), INTERVAL 30 DAY); END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'login234234234'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-20 19:41:31

REPLACE INTO app_config (`sortorder`,`setting`,`category`,`value`,`type`,`description`,`required`) VALUES (27,'active_email','Messages','Your new account is now active! Click this link to log in!','text','Email message when account is verified',1), (26,'active_msg','Messages','Your account has been verified!','text','Display message when account is verified',1), (21,'admin_verify','Security','false','boolean','Require admin verification',1), (6,'avatar_dir','Website','/user/avatars','text','Directory where user avatars should be stored inside of base site directory. Do not include base_dir path.',1), (2,'base_dir','Website', @base_dir ,'hidden','Base directory of website in filesystem. \"C:\\...\" in windows, \"/...\" in unix systems',1), (3,'base_url','Website', @base_url, 'url','Base URL of website. Example: \"http://sitename.com\"',1), (19,'cookie_expire_seconds','Security','2592000','number','Cookie expiration (in seconds)',1), (13,'from_email','Mailer',@mail_user,'email','From email address. Should typically be the same as \"mail_user\" email.',1), (14,'from_name','Mailer','Test Website','text','Name that shows up in \"from\" field of emails',1), (4,'htmlhead','Website','<!DOCTYPE html><html lang=\'en\'><head><meta charset=\'utf-8\'><meta name=\'viewport\' content-width=\'device-width\', initial-scale=\'1\', shrink-to-fit=\'no\'>','textarea','Main HTML header of website (without login-specific includes and script tags). Do not close <html> tag! Will break application functionality',1), (20,'jwt_secret','Security','php-login','text','Secret for JWT for tokens (Can be anything)',1), (18,'login_timeout','Security','300','number','Cooloff time for too many failed logins (in seconds)',1), (12,'mail_port','Mailer',@mail_port,'number','Mail port. Common settings are 465 for ssl, 587 for tls, 25 for other',1), (10,'mail_pw','Mailer',@mail_pw,'password','Email password to authenticate mailer',1), (11,'mail_security','Mailer',@mail_security,'text','Mail security type. Possible values are \"ssl\", \"tls\" or leave blank',1), (8,'mail_server','Mailer',@mail_server,'text','Mail server address. Example: \"smtp.email.com\"',1), (7,'mail_server_type','Mailer','smtp','text','Type of email server. SMTP is most typical. Other server types untested.',1), (9,'mail_user','Mailer',@mail_user,'email','Email user',1), (5,'mainlogo','Website','','url','URL of main site logo. Example \"http://sitename.com/logo.jpg\"',1), (17,'max_attempts','Security','5','number','Maximum login attempts',1), (16,'password_min_length','Security','6','number','Minimum password length if \"password_policy_enforce\" is set to true',1), (15,'password_policy_enforce','Security','true','boolean','Require a mixture of upper and lowercase letters and minimum password length (set by \"password_min_length\")',1), (28,'reset_email','Messages','Click the link below to reset your password','text','Email message when user wants to reset their password',1), (23,'signup_requires_admin','Messages','Thank you for signing up! Before you can login, your account needs to be activated by an administrator.','text','Message displayed when user signs up, but requires admin approval',1), (22,'signup_thanks','Messages','Thank you for signing up! You will receive an email shortly confirming the verification of your account.','text','Message displayed when user signs up and can verify themselves via email',1), (1,'site_name','Website', @site_name,'text','Website name',1), (24,'verify_email_admin','Messages','Thank you for signing up! Your account will be reviewed by an admin shortly','text','Email message when account requires admin verification',1), (25,'verify_email_noadmin','Messages','Click this link to verify your new account!','text','Email message when user can verify themselves',1), (29, 'curl_enabled','Website',@curl_enabled, 'boolean','Enable curl for various processes such as background email sending', 1), (30, 'email_working','Mailer','false', 'hidden','Indicates if email settings are correct and can connect to a mail server', 1), (31, 'admin_email','Website',@sa_email, 'text','Site administrator email address', 1);

SET FOREIGN_KEY_CHECKS= 0; REPLACE INTO members (id, username, password, email, verified, admin) values(@sa_id, @sa_user, @sa_password, @sa_email, 1, 1); SET FOREIGN_KEY_CHECKS= 1;

SET FOREIGN_KEY_CHECKS = 0; UPDATE admins set superadmin = 1 where userid = @sa_id; SET FOREIGN_KEY_CHECKS = 1;