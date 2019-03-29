/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50543
Source Host           : localhost:3306
Source Database       : huellas_ganga

Target Server Type    : MYSQL
Target Server Version : 50543
File Encoding         : 65001

Date: 2018-01-05 16:53:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `core_domains`
-- ----------------------------
DROP TABLE IF EXISTS `core_domains`;
CREATE TABLE `core_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `site_id` int(11) NOT NULL,
  `type` enum('park','redirect') NOT NULL DEFAULT 'park',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`domain`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_domains
-- ----------------------------

-- ----------------------------
-- Table structure for `core_settings`
-- ----------------------------
DROP TABLE IF EXISTS `core_settings`;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

-- ----------------------------
-- Records of core_settings
-- ----------------------------
INSERT INTO `core_settings` VALUES ('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y');
INSERT INTO `core_settings` VALUES ('lang_direction', 'ltr', 'ltr');
INSERT INTO `core_settings` VALUES ('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- ----------------------------
-- Table structure for `core_sites`
-- ----------------------------
DROP TABLE IF EXISTS `core_sites`;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_sites
-- ----------------------------
INSERT INTO `core_sites` VALUES ('1', 'Default Site', 'default', 'localhost', '1', '1449514193', '0');

-- ----------------------------
-- Table structure for `core_users`
-- ----------------------------
DROP TABLE IF EXISTS `core_users`;
CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';

-- ----------------------------
-- Records of core_users
-- ----------------------------
INSERT INTO `core_users` VALUES ('1', 'jeysongar@gmail.com', '9b49f8bab694daedff56d9cd8bf5028c06971410', '27fbf', '1', '', '1', '', '1449514192', '1449514192', 'jeysongar', null, null);

-- ----------------------------
-- Table structure for `default_admin_notifications`
-- ----------------------------
DROP TABLE IF EXISTS `default_admin_notifications`;
CREATE TABLE `default_admin_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `state` int(11) DEFAULT NULL,
  `process` varchar(455) COLLATE utf8_unicode_ci DEFAULT 'not-process',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_admin_notifications
-- ----------------------------
INSERT INTO `default_admin_notifications` VALUES ('1', '8', 'Hay una nueva publicacion revisar su proceso cuanto antes! ', '0', 'not-process');
INSERT INTO `default_admin_notifications` VALUES ('2', '8', 'Se realizo el proceso de edicion de una publicacion revisa su proceso cuanto antes! ', '1', 'not-process');
INSERT INTO `default_admin_notifications` VALUES ('3', '8', 'Se realizo el proceso de edicion de una publicacion revisa su proceso cuanto antes! ', '1', 'not-process');
INSERT INTO `default_admin_notifications` VALUES ('4', '2', 'Se realizo el proceso de edicion de una publicacion revisa su proceso cuanto antes! ', '1', 'not-process');
INSERT INTO `default_admin_notifications` VALUES ('5', '2', 'Hay una nueva peticion de compra revisa su proceso cuanto antes! ', '0', 'pre-order');

-- ----------------------------
-- Table structure for `default_answers`
-- ----------------------------
DROP TABLE IF EXISTS `default_answers`;
CREATE TABLE `default_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_answers
-- ----------------------------
INSERT INTO `default_answers` VALUES ('1', '1', '1', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', '::1', '2017-12-29 12:32:11', '2');
INSERT INTO `default_answers` VALUES ('2', '1', '2', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour', '::1', '2018-01-02 09:59:19', '1');
INSERT INTO `default_answers` VALUES ('3', '1', '2', 'prueba segunda respuesta ', '::1', '2018-01-02 09:59:28', '2');
INSERT INTO `default_answers` VALUES ('4', '1', '3', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue', '::1', '2018-01-02 09:59:41', '2');
INSERT INTO `default_answers` VALUES ('5', '1', '4', 'Prueba no aparece en notificaciones ', '::1', '2018-01-02 10:50:58', '1');
INSERT INTO `default_answers` VALUES ('6', '1', '6', 'sadfkhsdfjkashdjkfhaskdfhaskdfh', '::1', '2018-01-02 11:27:02', '2');
INSERT INTO `default_answers` VALUES ('7', '1', '6', 'Esta repuesta es correcta ', '::1', '2018-01-02 11:39:02', '1');

-- ----------------------------
-- Table structure for `default_blog`
-- ----------------------------
DROP TABLE IF EXISTS `default_blog`;
CREATE TABLE `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_blog
-- ----------------------------
INSERT INTO `default_blog` VALUES ('1', '2017-12-28 19:21:00', '2017-12-28 19:21:00', '1', '1', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit</span>', 'prueba', 'prueba', '0', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span>', '', '', '1', '1514506860', '1514506860', '2 weeks', 'live', 'wysiwyg-advanced', '');

-- ----------------------------
-- Table structure for `default_blog_categories`
-- ----------------------------
DROP TABLE IF EXISTS `default_blog_categories`;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_blog_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `default_categories`
-- ----------------------------
DROP TABLE IF EXISTS `default_categories`;
CREATE TABLE `default_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` text COLLATE utf8_unicode_ci,
  `main` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_categories
-- ----------------------------
INSERT INTO `default_categories` VALUES ('1', 'Vehiculos', 'uploads/default/categories/9cfe78423f4575e48e54ad0aa612672c.jpg', '0', null);
INSERT INTO `default_categories` VALUES ('2', 'Motos', 'uploads/default/categories/0cefcedd946ca7b05697ac9aeee3f57c.jpg', '1', null);
INSERT INTO `default_categories` VALUES ('3', 'Carros-Camionetas', 'uploads/default/categories/b87ca6c96a787a3715424552acbc4e8a.png', '1', null);
INSERT INTO `default_categories` VALUES ('4', 'Camiones', 'uploads/default/categories/4b8328721add4dbc7660e817e91a0cb0.jpeg', '1', null);
INSERT INTO `default_categories` VALUES ('6', 'Otros', 'uploads/default/categories/d920694309945de5df14b2666e00bf74.jpg', '1', null);
INSERT INTO `default_categories` VALUES ('7', 'Propiedades-Inmuebles', 'uploads/default/categories/cbb3ea7fd74021495bd863fcaef66bf5.jpg', '0', null);
INSERT INTO `default_categories` VALUES ('8', 'Apartamentos-Casas', 'uploads/default/categories/a41894918841d9ba9b6003d94e5b5ddb.jpg', '7', null);
INSERT INTO `default_categories` VALUES ('11', 'Otros', 'uploads/default/categories/b8eb4dd4f70e3e1814d4536826355a6a.jpeg', '7', null);

-- ----------------------------
-- Table structure for `default_ci_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `default_ci_sessions`;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_ci_sessions
-- ----------------------------
INSERT INTO `default_ci_sessions` VALUES ('f1d6370d1f2a628509fa337be4edbfe0', '66.249.65.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471097156', '');
INSERT INTO `default_ci_sessions` VALUES ('08e0861e5148c8050ed76172a0d28677', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471085533', '');
INSERT INTO `default_ci_sessions` VALUES ('a9d3b6b761a3ae5d9085ac40bedb05be', '66.249.65.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471107825', '');
INSERT INTO `default_ci_sessions` VALUES ('18e8a6afb9eda7be8d65331d72ee70f6', '93.158.152.34', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '1471103497', '');
INSERT INTO `default_ci_sessions` VALUES ('dfbf33283d413e1d20fb25625d729eea', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471102129', '');
INSERT INTO `default_ci_sessions` VALUES ('9314f77f57509766b9acafa6c1458f15', '66.240.219.146', '0', '1471102833', '');
INSERT INTO `default_ci_sessions` VALUES ('33d53b138f0c941721fc87ec90986d0d', '66.240.219.146', '0', '1471102833', '');
INSERT INTO `default_ci_sessions` VALUES ('004718c1cc366f878ba2ab0a91a86658', '157.55.39.213', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471120523', '');
INSERT INTO `default_ci_sessions` VALUES ('b2da8ccba70a8c9851aea4568cd707f9', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471120518', '');
INSERT INTO `default_ci_sessions` VALUES ('42781281a564fd73dd5ae000af782b4b', '207.46.13.16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471131179', '');
INSERT INTO `default_ci_sessions` VALUES ('d9ce3cd7ca7d391b3381159255e095fa', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471128441', '');
INSERT INTO `default_ci_sessions` VALUES ('46e680fdf6c4492a5d3991d4a24c8e01', '66.249.65.129', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471144312', '');
INSERT INTO `default_ci_sessions` VALUES ('318e50556462afc23efbf02ccacb8a46', '151.80.31.163', 'Mozilla/5.0 (compatible; AhrefsBot/5.1; +http://ahrefs.com/robot/)', '1471144714', '');
INSERT INTO `default_ci_sessions` VALUES ('71d64d5d5cbfdfefe8b281e8b3efb97c', '180.76.15.158', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1471145298', '');
INSERT INTO `default_ci_sessions` VALUES ('fcc38b31fb6db0b22872a93c388bc153', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471146183', '');
INSERT INTO `default_ci_sessions` VALUES ('66dad59df718ad1e8f0eab8716af8228', '40.77.167.35', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471147454', '');
INSERT INTO `default_ci_sessions` VALUES ('606ebb83e426c397d9f67ff623ac7233', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471148678', '');
INSERT INTO `default_ci_sessions` VALUES ('bd333edee9c5afb0a6b62fc20680270c', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471148888', '');
INSERT INTO `default_ci_sessions` VALUES ('682137c13a8b2caaf2ff685ba832781e', '207.46.13.53', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471150875', '');
INSERT INTO `default_ci_sessions` VALUES ('d195cef13e2a07d776896df0288492cc', '207.46.13.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471153694', '');
INSERT INTO `default_ci_sessions` VALUES ('a7e2d3397f22b6e368c49805e07a544d', '157.55.39.80', 'msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)', '1471154064', '');
INSERT INTO `default_ci_sessions` VALUES ('dd12dd1996b083766500099ff9b4cb08', '207.46.13.16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471173168', '');
INSERT INTO `default_ci_sessions` VALUES ('71a9247ab2a349bcf6dfcd75b329d161', '187.161.191.156', 'Wget(linux)', '1471177466', '');
INSERT INTO `default_ci_sessions` VALUES ('ee59c358cdca1fcc93778e4f4a0b8b89', '187.161.191.156', 'Wget(linux)', '1471177466', '');
INSERT INTO `default_ci_sessions` VALUES ('345597f54785a0e01e54f0f8f5697865', '187.161.191.156', 'Wget(linux)', '1471177466', '');
INSERT INTO `default_ci_sessions` VALUES ('f9b6777d09bf135ff20a5fda39f9d8e2', '187.161.191.156', 'Wget(linux)', '1471177466', '');
INSERT INTO `default_ci_sessions` VALUES ('6feabd6dffb3369536f64867c0dbc98b', '187.161.191.156', 'Wget(linux)', '1471177467', '');
INSERT INTO `default_ci_sessions` VALUES ('e519581848bddbaff163b1084266c650', '40.77.167.35', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471178210', '');
INSERT INTO `default_ci_sessions` VALUES ('8d1ffc5e61fee42e1eea97a7ceb08408', '40.77.167.35', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471178214', '');
INSERT INTO `default_ci_sessions` VALUES ('fca16d788561dbf7bafd86e16aef13e1', '207.46.13.163', 'msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)', '1471183455', '');
INSERT INTO `default_ci_sessions` VALUES ('91641049f391fd87d30841d6b1df1f63', '176.117.40.23', 'Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0', '1471115049', '');
INSERT INTO `default_ci_sessions` VALUES ('bebf72e97465a1ef0c7aa06908a026cf', '66.249.65.184', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471114816', '');
INSERT INTO `default_ci_sessions` VALUES ('a83b20f8646e910fd01fe37e4d660816', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471110215', '');
INSERT INTO `default_ci_sessions` VALUES ('70ec59c5a0d4552de6453eebf3c7d097', '207.46.13.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471116517', '');
INSERT INTO `default_ci_sessions` VALUES ('318a17f3ab963c0e6a0de6f1cb88e3bf', '40.77.167.71', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471110223', '');
INSERT INTO `default_ci_sessions` VALUES ('48dced4c67f878ca08dd512477225b33', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471138155', '');
INSERT INTO `default_ci_sessions` VALUES ('70e3e9d6bbfa4ebd9efaa36c4e84f919', '157.55.39.169', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471139778', '');
INSERT INTO `default_ci_sessions` VALUES ('cc303a01763a9068b5e3b930aa2da8c4', '40.77.167.35', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471140389', '');
INSERT INTO `default_ci_sessions` VALUES ('ad7490978db34a4a3a12dbfc1129c16f', '163.172.36.219', '0', '1471142219', '');
INSERT INTO `default_ci_sessions` VALUES ('49f1489a3da1c74b46170f61bbee82c4', '207.46.13.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471143106', '');
INSERT INTO `default_ci_sessions` VALUES ('04ffb7db4639dd722ee34b829a49340f', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471143212', '');
INSERT INTO `default_ci_sessions` VALUES ('6e42ae4f65c43cc6b4f56e2fb0f76ae6', '157.55.39.49', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471071944', '');
INSERT INTO `default_ci_sessions` VALUES ('f5dd1c7de1b094ab11b260c0648d68c8', '157.55.39.49', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471075728', '');
INSERT INTO `default_ci_sessions` VALUES ('3b0a6ce75131fc89d11e9c35ab5f4528', '207.46.13.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471075800', '');
INSERT INTO `default_ci_sessions` VALUES ('d968b8e1f9e53f84418132f3309bc119', '66.249.65.129', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471086662', '');
INSERT INTO `default_ci_sessions` VALUES ('45072c0ed693f8a155182bed124f6fea', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471061470', '');
INSERT INTO `default_ci_sessions` VALUES ('0ac9b1b1f5db740fa8b6b3d2b7a3708f', '207.46.13.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471076932', '');
INSERT INTO `default_ci_sessions` VALUES ('1ce519bd092c25ba9d69c32055a7a44d', '185.25.148.240', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1471080027', '');
INSERT INTO `default_ci_sessions` VALUES ('4c077a8ceb0ddcff0c11652834238e29', '167.114.250.3', 'Go-http-client/1.1', '1471076555', '');
INSERT INTO `default_ci_sessions` VALUES ('2a9a5beefc7257927beaac95b3f04708', '195.22.127.139', 'Mozilla/5.0 (Windows NT 6.1; rv:39.0) Gecko/20100101 Firefox/39.0', '1471076695', '');
INSERT INTO `default_ci_sessions` VALUES ('62bad0a040d651989c8f651272259111', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471086672', '');
INSERT INTO `default_ci_sessions` VALUES ('e1bd294b9b8dbd91d6e6fa8c1d8c70e6', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471087225', '');
INSERT INTO `default_ci_sessions` VALUES ('c5cc92e3f51a3d7791126fe513aeb62c', '40.77.167.71', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471088593', '');
INSERT INTO `default_ci_sessions` VALUES ('eb034876095854ee1f876d4e29e0e145', '40.77.167.71', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471088686', '');
INSERT INTO `default_ci_sessions` VALUES ('3134e30a4450a8382b17170037e43768', '173.252.90.85', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '1471093003', '');
INSERT INTO `default_ci_sessions` VALUES ('ce47b541a2a4b0b138540113f51354fa', '207.46.13.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471094964', '');
INSERT INTO `default_ci_sessions` VALUES ('05d264b2c9944632c75160aae6f19611', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471095344', '');
INSERT INTO `default_ci_sessions` VALUES ('7d61d36abb8f0e927052e33383828eff', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471097156', '');
INSERT INTO `default_ci_sessions` VALUES ('e1efc235e23cd09bbe49314d7e20d2d9', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471205141', '');
INSERT INTO `default_ci_sessions` VALUES ('ae62e21ae8b677cbfa316887618665b8', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471206431', '');
INSERT INTO `default_ci_sessions` VALUES ('d557f85c815bbd4343dc6c9a540c24e8', '157.55.39.225', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471250946', '');
INSERT INTO `default_ci_sessions` VALUES ('18f511e6264d81e0dad086e18311aef5', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471251186', '');
INSERT INTO `default_ci_sessions` VALUES ('b74465c4ec5cd97675dbfe8eeaafbb96', '180.76.15.10', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471256703', '');
INSERT INTO `default_ci_sessions` VALUES ('8761d70709e7e31599b504055747affc', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471259283', '');
INSERT INTO `default_ci_sessions` VALUES ('9b6ccde96d9c6461e3ea9365aa625426', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471259652', '');
INSERT INTO `default_ci_sessions` VALUES ('2da721c46eddb843cd611f2627165099', '91.196.50.33', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1471262296', '');
INSERT INTO `default_ci_sessions` VALUES ('d52f3ad71251827634629691a479014f', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471264294', '');
INSERT INTO `default_ci_sessions` VALUES ('d29416421b247fa065827a9592ed83b3', '66.249.65.129', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471268347', '');
INSERT INTO `default_ci_sessions` VALUES ('86afb81d6ab7a0c243168d21be7519e5', '46.229.164.98', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471243781', '');
INSERT INTO `default_ci_sessions` VALUES ('a88a811d6dc1242d0a564006e887e702', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471212459', '');
INSERT INTO `default_ci_sessions` VALUES ('b00fc729e939264b90165c1e36775885', '207.46.13.16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471217053', '');
INSERT INTO `default_ci_sessions` VALUES ('21edc6abc1ce33328861168dacdc2c4b', '207.46.13.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471221802', '');
INSERT INTO `default_ci_sessions` VALUES ('ccd69eade482bd3c8ea6d7a264cfc51c', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471249272', '');
INSERT INTO `default_ci_sessions` VALUES ('cceee3ac54101e8c67a697f810212e06', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471248548', '');
INSERT INTO `default_ci_sessions` VALUES ('f6d39febefcc013b1784f7ab35953a36', '66.249.65.190', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471283064', '');
INSERT INTO `default_ci_sessions` VALUES ('63a40106cd9402c3ba7f99bd5c5e221f', '93.158.152.34', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '1471301930', '');
INSERT INTO `default_ci_sessions` VALUES ('57f143f81a7f25fc58a71bfb2dc37c8c', '66.249.65.190', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471304466', '');
INSERT INTO `default_ci_sessions` VALUES ('88081d5132ccde0e1377ab8747eb0119', '180.76.15.6', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1471395117', '');
INSERT INTO `default_ci_sessions` VALUES ('3be9d9f104e735a0124766aaae5f7c3f', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471397352', '');
INSERT INTO `default_ci_sessions` VALUES ('355f930d436c1bd0167f9d29f498101c', '189.202.24.84', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0', '1471397499', '');
INSERT INTO `default_ci_sessions` VALUES ('aeb34f6f807ccca658a11d428320df86', '71.6.167.124', '0', '1471398048', '');
INSERT INTO `default_ci_sessions` VALUES ('989a5e053a1b429eb8266ce4dfa1ca4d', '71.6.167.124', '0', '1471398048', '');
INSERT INTO `default_ci_sessions` VALUES ('70e805d9d295b65c9a0f059932fb4bbd', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471400421', '');
INSERT INTO `default_ci_sessions` VALUES ('678bb1ae053105fb7ea728057ad4a798', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471400457', '');
INSERT INTO `default_ci_sessions` VALUES ('2e24633eb364ba20e753f20ea5882668', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471313503', '');
INSERT INTO `default_ci_sessions` VALUES ('a715db68c4a13840b4c1147d76cc5ca5', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471317548', '');
INSERT INTO `default_ci_sessions` VALUES ('c32df5e7439898210e94e87452112cf0', '207.46.13.57', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471317773', '');
INSERT INTO `default_ci_sessions` VALUES ('e7584d27ec64be9941fcad8f393b1872', '58.221.46.206', 'Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)', '1471317868', '');
INSERT INTO `default_ci_sessions` VALUES ('2e056fba616d388f9ca8f18b544b3fd9', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471318194', '');
INSERT INTO `default_ci_sessions` VALUES ('967d56de63e49bf860d81ae59f3475bc', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471321269', '');
INSERT INTO `default_ci_sessions` VALUES ('08b9284b0c141b9caedc0163c94a75b1', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471321748', '');
INSERT INTO `default_ci_sessions` VALUES ('18dae00ff8b70b0a8c419d3841ae9b82', '195.154.181.168', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', '1471334469', '');
INSERT INTO `default_ci_sessions` VALUES ('15ee938f1b376610e41d5cf6b1c8b43b', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471334497', '');
INSERT INTO `default_ci_sessions` VALUES ('f996dfe188ee21d989327a72bed19efb', '66.249.65.181', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471335497', '');
INSERT INTO `default_ci_sessions` VALUES ('52de09d2fc66d669630021c83422b492', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471340091', '');
INSERT INTO `default_ci_sessions` VALUES ('9c1169a053e24305554d8267d38430e1', '157.55.39.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471341323', '');
INSERT INTO `default_ci_sessions` VALUES ('64b10b0166539512d4cd89762eb01e50', '66.249.65.149', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471346362', '');
INSERT INTO `default_ci_sessions` VALUES ('6985eef8fa66b395ffbe92397b10386f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('8764e1d0e08a4abc3b02b0789a1c52e6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('e82e64cc8238141b1eb04cbe3ec2b005', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471402343', '');
INSERT INTO `default_ci_sessions` VALUES ('144d4e1e3521006d716ce447fda03f6e', '207.46.13.57', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471402961', '');
INSERT INTO `default_ci_sessions` VALUES ('44d2642251b12b4976893b02738a2693', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471404195', '');
INSERT INTO `default_ci_sessions` VALUES ('a706a94e02f082252ff7f74240c4c2dc', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471406443', '');
INSERT INTO `default_ci_sessions` VALUES ('e73051ff483d10b8f6150e19e0d06449', '157.55.39.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471407431', '');
INSERT INTO `default_ci_sessions` VALUES ('39cb260bc2b2b4eb2b25190b4e5b63f8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('79b93a76ac7e06da1f938cb6f1f1c3cb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('1487a1050400223ed0890265e8c12f17', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('36a1a25f3c95d3d6daef7242cc4bf3d1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('a5a3e2db741e6240d99bac784635b358', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', 'a:1:{s:14:\"admin_redirect\";s:15:\"admin/login.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('37c0533b158281c0c1d58c97b62d59cc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('1edd07be5e0699faf7d00209a0f60c85', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('edb53eb110d73fa8807c66b654030491', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('75dba46699b9f04ad65f65f075ba9780', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', '');
INSERT INTO `default_ci_sessions` VALUES ('d483616e7e7aef7658ef96f9cc65d411', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414359', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('0348553b9adaf6f3fae1df7eaedf29ed', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414360', 'a:1:{s:14:\"admin_redirect\";s:23:\"admin/controlpanel.html\";}');
INSERT INTO `default_ci_sessions` VALUES ('13c6e254a0bd0bd206d0484510f87635', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414360', 'a:1:{s:14:\"admin_redirect\";s:16:\"admin/login.html\";}');
INSERT INTO `default_ci_sessions` VALUES ('1f70687501925c048bbb840efa99cde9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414360', 'a:1:{s:14:\"admin_redirect\";s:15:\"admin/login.htm\";}');
INSERT INTO `default_ci_sessions` VALUES ('3ea2a8b239d3ec435fa089867a573856', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414360', 'a:1:{s:14:\"admin_redirect\";s:14:\"admin/home.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('75849412b7da9cb5c388db726ff78239', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414360', 'a:1:{s:14:\"admin_redirect\";s:18:\"admin/account.html\";}');
INSERT INTO `default_ci_sessions` VALUES ('3224d384d397a52a53075c69b4856059', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414361', 'a:1:{s:14:\"admin_redirect\";s:12:\"admin/cp.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('6cb0941f0ad2586ecdd242474054af52', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414361', 'a:1:{s:14:\"admin_redirect\";s:21:\"admin/adminLogin.html\";}');
INSERT INTO `default_ci_sessions` VALUES ('698e64f21dd2d9db4317370fbb44f960', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414361', 'a:1:{s:14:\"admin_redirect\";s:22:\"admin/controlpanel.htm\";}');
INSERT INTO `default_ci_sessions` VALUES ('520a45ad1b22acb3d4321195ae3c94fc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414361', 'a:1:{s:14:\"admin_redirect\";s:20:\"admin/adminLogin.htm\";}');
INSERT INTO `default_ci_sessions` VALUES ('99eb9d86f72655c5fad4e00e6fb1d839', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414361', 'a:1:{s:14:\"admin_redirect\";s:21:\"admin/admin_login.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('8fad58e64bd31c1db61872d26739c39f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727) Havij', '1471414361', 'a:1:{s:14:\"admin_redirect\";s:22:\"admin/controlpanel.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('f695eb5b8f877469103029ba3ae73693', '67.198.139.61', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', '1471414363', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('d661126fd52a688b0735eaf28e16e8c7', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414371', '');
INSERT INTO `default_ci_sessions` VALUES ('554d226b811b8fcb7809e479645860b5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('51a8b3fa042faaafc1aa52aa33dd0fa8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('fc38d5ff85d3ab9d5850bdffe297ae55', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('be1124f1320fcadbacf7310cbca1fc71', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('515ddfe5a49d97e7e19c46ebfed99f0e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('770654dfed9bd1976d2e7ad42d966870', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('c376ce2bd93f5c195cd60fb0a431401a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('61f41ffcff9d209ff01cb1ceacfbba60', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('b78c96cc04b7a10bb45f340f4672e773', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('3e642a264aa9f060b71113dea454ed99', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('8f0c34a770cd54c40b1494a915a915ea', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('e033aa8e7854f5625f9083c0ac1beeb2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('a19e67084c3ebb0c7036a09f3a1e3aaa', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('bffe63144922f007e2270c689f8f661d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('0f04eea5f94584ae897161d72c8b9d49', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('2e1bd852bbdd2c61960b38e82811d2a2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414372', '');
INSERT INTO `default_ci_sessions` VALUES ('59f5ea0c56d98c17b6b2189d2ca1a719', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('c17e21bc960fdb821bcbd8aaf1143606', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('3261c1871c0ad13ed6d722483625ff20', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('863d9484836828f2638cce09ce8f7398', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('eeaf63b225546730e79cc3dc718f9d7e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('65b02b53ddd0351fde71d41652572eea', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('a05ed5d8646b35cde992d06a5f9cd972', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('90b35b3db536dd4b182a10dad783fb50', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('87ba5091beb6920edae10af585414e2b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('750ac35142a2ddba09294b0cc0f307f5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('cedde6e40ca064c077a4617f3287d152', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('96cc9006ed40eb28ae286c8e6f05cf8d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('55d7ee8daca7cff77e79e2defd2447d1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('ed69a980ee453e7deb086c9963b6f6fc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('4ea49a34fe135d17758ad033177dcfaf', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('496329186d6f489ed0d1552ff35ef3c4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('b998308a4123d981fc28c7445001caf9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('2aa8f00f2d98860f3f2486292e8d9556', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('124e49c97a37c01ad93b65a88624c6b4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414373', '');
INSERT INTO `default_ci_sessions` VALUES ('a0fbe176ed000968546cc8a3ae3946dd', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('f5182e11681db98ee5626e534381b69d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('55b9f4da99345d5fa046ba76b544ec22', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('bcde1eb48f91fb96d271345b92596b3c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('932bc54b0716d502d339135060a12e8d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('45dedf89239f91760ade86c364c1c4c6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('95b62c17c3f3d955c643a8bb5e1ac0ba', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('ece5483b3b400dda89424e8010b41c6f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('0cc5d94c313d09f1218c41bde6a63f1b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('d9d1bbbd8ee3318e5081675a7deb8771', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('740d20d8f2d797a5034772d469369d58', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('9f39726e28357028dd3ee639ffb63eb9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('17bf6a383c3147f5ffece09ebba5ccc2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('b92cd536ab4a224a736b3f2fb695076f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('5c3338ee4896c7a7303ff87c7f7f0eb8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('972788aa49b88aa17336f16ab91b38fc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414374', '');
INSERT INTO `default_ci_sessions` VALUES ('3ab52866373f9b3cacfbf8f41a77fefa', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('3e346375399f59685220a5d950678ca0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('691ee611d3efce71cc6048bd9d320cf4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('122b318a70b678e1cbbcb1c8beabe39c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('8573d8235039c0e644279985852441ed', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('50167e1603b791870d4c9c7ae4e16dde', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('8715e2dfc3abf0efde1826207680d39e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('36ee21587ee52755cd6218b8ec743a59', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('4d8f37b984525c7ef3686a1dac974eac', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('a71c4185f60e1990fea457802a377f8e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('31e7161d95009f658f4969d2011c2231', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('06a44341f0d4842a6ff9b697e8067387', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('3ebc7ce7f2e5e2b6c9577cb5d9e31fbb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('7a47840c0902da55ccf741a0ab3a71e5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('400cf88cfd9ae0a220c4d36ac63cdb25', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('978a13f93f9a9431f88e244b1b564cac', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('fc31897d8874b6e4e5053ca7ae20058c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('35eda02428b124c274c1a20d750cee4f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('59e1238cb99150cac72e7d81a446f0e6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('98cfd11ae8c004de9edab8ba34d82f06', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('afc86e0e8354fac2f4cea0046a908b35', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('3f6103f4ce5e7ccacf09defd25b90464', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('0cbfc61e833c86c95b3123150b100264', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414375', '');
INSERT INTO `default_ci_sessions` VALUES ('d1c6bc407a938a666aec9028701cb418', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('b9a5b2620900b1c0ed001d004d8c4f4d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('e9e22327c0a7f2e9f1628c2f009212da', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('e0c4cf9a69e08ec1970a09bfe0c20303', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('3ae123d2969acf00fe2f72e38fc134ec', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('d38a4fd29e98ef5be862e932e21dbd65', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('72a6126787f2c3d2a0a47df0dd4444ee', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('9bce4d053c796485030018e41c573897', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('6b9a2a0d6f849283323ca3d2df919e06', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('4c34340cc7806adf28c38374138fb9cd', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('8974394f7dd017d6ddb54c4d67eea92f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('ffdcfafe8004af093d1cbd523ff71514', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('ea2384b8fd0922b5e25a1709104a5188', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('710e892a22795512d5558df21b07ae27', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('80eaad5156a049d240bc74e48b802242', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('01b105a825579bad0748b54a1d066803', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('0c531e57ffdc87326f85ab4164a830be', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('65fcd4f7856e62c84bf1df867e13a0b6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('3e764a3ea76bebd4f7b96c4a9f791bcf', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('2009792a4bb6c7aaa5adc5a09e7d9bff', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('c69a30e6d53194ce64e08bf90086e3e7', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('7ce32e26b33cce548c25b4a061480dd4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('b962a22bd7ada40067032967114e3c77', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414376', '');
INSERT INTO `default_ci_sessions` VALUES ('8eab8b0fea9a4129b2b799c6a18bab40', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('e5f00ede4e9f45a50264c70bf21a519a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('300705635e0fce861fe17a10fdbb1c35', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('2cdfe06e6c9b6f9922259b82999b3fe8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('cf08b9cf0439345524750d6760d29c6e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('b8a8661b2da18a6ed8e7366287d9f20d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('b1b7b3163ddd79f97d43efa2cf33c62d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('21306484f2e98c49a1a6a6f4f3c25857', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('7d8295f25900963d202983f8c2fb00ff', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('38a701839e90fdd2cb2494c89b1f45f4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('abe3901573cbf61ba0554d460d2746b4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('5ad3569fdeaf5f9e532c693debcbf62b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('ba63f8fb87af2901228525d72dc33f92', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('15cb0416e30120138d1aba535c156612', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414377', '');
INSERT INTO `default_ci_sessions` VALUES ('2bf571f3f6645eb9fe99e182e0dc618c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('5adfe01bdc7f2992814b8f667a32a5f8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('d1e449e5cbc09cbfbc0ee3cb4bf961bb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('66100c3e1c3151d211b0ec70920af779', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('b30aba45a0e20cd79665d28ae4f1172d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('b13a702a6268c2186beb55a0039d23d2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('25c2a1d012cdb2489ded4887a601dd6f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('6e6111ef360dcd556c3284fbc397af1c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('43926f8596d9aafe2dd711cf58423522', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('0f786e656f78880412309ee8efcd6475', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('ae2a6fbd632a53e9fb1070c44e118657', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('b033120f6f7770a77ea48d1826eb2614', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('53eff54d36c3451480baf66804d86c5b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('2e0b390d8fa818456fde0d1d59c0ec56', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('7ebcf72c4a77a234b235453f8826b84b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('3a880343d879ef11103e7a30542a3a3e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('76e9113be7f13a197b0193aabaef81a6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('6eb78800401074b5e232cd069d321778', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414379', '');
INSERT INTO `default_ci_sessions` VALUES ('0c33a93ae3f4aacbc402d00dc42541fc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('664024f58fea0a50edd66ac1aed370cb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('43f00e910519dd758f8ec7253cbaf46b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('b9b53fa1a3fb7b8fdb1fcd1e0357255d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('971e3aee15950fe0d50d272f6ba92c7a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('1e2fb6d1d4a44a2301cc06782d53528b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('5439c007573cce5a648daa1961466158', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('542bcb73c29f253dd4ba18efa3a95354', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('888730460333686c724abe745ccaf1a3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('c23911554015532c1f978ab9065eface', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('4f4571fd72fd16ca37bc992902e397fe', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('902eed792565191cbf617d57de4a4d19', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('25e95575412a275453119cda218e71a0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('a4e7e65d56c364ec8c1485258c52dd68', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('8fbcf9f4f5e13fc77d132dd4a5e34766', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('3816346cbe6694eda1855e8505c6070b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('d6764476181a807f62ed23589c1f5f0b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('d576bdefd7f84c754ffac6a495a22455', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('a9363845998c17b2b8e6debcbf8c75f9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('b6b4d1ae88a685f19c331d1c3334cfd2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('126782be0360d03e0a24c59b62cd76d1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('c775fb6cbeb57ab2aa78c94c42c68925', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414380', '');
INSERT INTO `default_ci_sessions` VALUES ('3e5261376039cda79a2658b944ed0148', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414381', '');
INSERT INTO `default_ci_sessions` VALUES ('7cf676414eee32fd42864a8e6c31b654', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414381', '');
INSERT INTO `default_ci_sessions` VALUES ('208bfa631604043e96b429bd2e09a8ee', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('2ef6a5698ebbd7835d24dad8f17cf969', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('bbccda31aac425a3012394cc0f8bef5f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('6621cfe6153b658f21cb1d6a1c6f1ee6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('f3b95f919d1847e0187d063c5e96f592', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('ccd160264882f02092330f07a0cbc804', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('d58ad04dd8997bdca67b1a74b75274d8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('7eb36711c87a23f860836e26f4ce61fe', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('8be1b0e9cb8de461e6eaa04114c7fe90', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('8133167e7e3c77cdafd186af53835ca8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('0bd3e7e8f54b2913805f523de36b056b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('a0bf057bcd4e509c5c256e996ec2edb2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('ec09592ec91e6be6dedad92576938a33', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('0c7fc68bc7d3ec7400a62bd157b401bc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('ba7c5ddfaa50172ef572e953ee87ba25', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('4d103dbb61e233b9695a346d436f2810', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('ae1641a8151a35c565a914613e32315d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('532a17f046b062bf783d1e8bf0d4174a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('cd83b5acf37ee7fb5f624c5f2b715fd3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('7990e98d72ecc89ccca454187a92d378', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414382', '');
INSERT INTO `default_ci_sessions` VALUES ('6e6378f9120f9b7fc29cfe0364387edd', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('5e87b510308c1e7ac044453dc4052831', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('3a4086a3c36c08ac69d274af825dc82b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('5a904df0890a5f92ca471de29e4cc1a8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('e7cb171788ba8b50551d9888de46dfd5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('05a694fab45e7bdd80b95442447bd16e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('4acaf36bb77df2be1758bbe8d52d906f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('7cec9dc54ef3c05a7058efa6d23ab720', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('b5b9dd46a557a902a16cf8e0db147456', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('14a510b9a0fee95e193b34e26711fc78', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('2729f6e13b9393957d2bee211ac9ec75', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('4d71d9ba2a5a56d5c33515f64d700292', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('12ef4be1ffcbd7e56185fbe41f874a69', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('17902134c19e55c4209992bebac1a024', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('76c1dd21246577385b4f6056b4d4afe6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('1a0dde88f8eeb97ebbe238c71289f110', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('1d700e945aa6b9036c3c88748e2d4f0d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('09a959531efde57e6a3a73fa7117a0c5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('42edb3af0aceb41e8e85891a1652f94d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('d3f439665732ba7ee24ebda22389c60e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('9fc57e6458e6f142ff1ec5e37a9a385d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('bcf74ea0eb857b2ea2c1e418da385613', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', '');
INSERT INTO `default_ci_sessions` VALUES ('83778c52f6d152c4bcdc9f2150855e99', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414383', 'a:1:{s:14:\"admin_redirect\";s:11:\"users/admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e84fe9b04044cbcb9662e27b106ace7a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('ed5203b4f817c44a40ae4ea4f2dd5f40', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('2b1f254b39bd2a4eff3985ca2a1fe010', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('fdc7b5fcb5a4614708ef1d31c48089c2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('ad6172f24f74fc950ef3f4b9253c8fa8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('db2e03866d2b653330c3d94ff256f3ac', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('bbac9734b5fa73712d4c7a1730d4e63b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('d10be40299f224ef74a8ce7fb2cedbb1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('7c88f9b3e3d04413a7272fa966fa40ae', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('d8987f0ec0598f8e384bfdbe92bd0fc0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('229dd66963e5258e53292fde134af7df', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('97cd9340378160485151d8d7b62ca303', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('64e2415635ced5ae2515de42bead29e4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('c6e7b8a565752d5bb2834570eb8f77c1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('587786f7df0edc1b82bc95b748d2a1ba', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('bd2d4d7be5fcf901a68dd61a65ca29c8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('8fc2f57562b1bd7c775d9cefb5830e60', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('45018dbdb89b58c76d64e3617f2f1034', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('41bb0aef4ed4688ccafc3b27dcfb97cd', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414384', '');
INSERT INTO `default_ci_sessions` VALUES ('89b9f14d7040ab909a1396444b107cef', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('8b4596661ebd87aad9bef621b975b328', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('ef0c2fccdfd93b0f7c07d33b56580f79', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('87d41eade6942668b4235108daf8c526', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('40046ae62e19590fd62ee3a1541a2e84', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('19a736625ee63f3785bcdbd24f9fc934', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('12b1fbf113f62ef84517e65ad944f028', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('a84d5375ac7de6b2fc0dfa8ea0122331', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('2ac461190bcaccb9b4c44c21263cdac8', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414385', '');
INSERT INTO `default_ci_sessions` VALUES ('506581a8648a69ca535f9b6029a2cf47', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414386', '');
INSERT INTO `default_ci_sessions` VALUES ('bb8b414d89b6a275ab05f933a870a0d5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414386', '');
INSERT INTO `default_ci_sessions` VALUES ('128d7f377a64ce5fc028ff93228ca0d4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('8a4430562d2ca111058b4c33e2b1aadb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('4b42edd5784299570095f38604881d4d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('72180f58bee1e2a1c3e8ed0ca4c98b17', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('6f64bba599b86f60a5a3796812a76538', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('70e41623684066f1c4221e8d35335594', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('45f9af46467cd2ae4ba111ca3ee9ab03', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('2dc56bfdfc70e14e0243221fc92bbc35', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('c5d7dca664bb2c427e804a38257a9dee', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('58c41f69a03413ffa2677b454691e935', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('d374de6c5644e20111c1e628e4f410e7', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('3d5e8a35296901f70f8969dfc38e3c62', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('a69f3da3af2a4f31a5b98d9b1937351c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('1d3672df18de47f351c9f2e4bfc03194', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('6b480db4df3bf043b14e249fa4a219eb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('e2f27aa34f4cbb33374edfc7b7bad09a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('1dd55c91d505f811d103c2027f0268e2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('73ea817a4383cc7186bff2e1cbda18b1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('01231d71b8a04283530b4be680b4d554', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('1674ad6109e624c006d36cb5f3f12593', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414387', '');
INSERT INTO `default_ci_sessions` VALUES ('e089682106f6457a9cfb30fe4871ca75', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('88d7479eab17b37894d6af6d269a9a75', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('a1eb7a3f3ebf34dbe264d3d63e5a5025', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('57a2ef88885e3784e445c8331168b7a9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('29624f118dd7afc79b3f1b9227b8b41f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('c56ac182b3dd254cae378349eb9f51d5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('593065e81657232fbbb7085d3f0cc750', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('90393c4ac92523ab329da6a78df07cf5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('3ca6c2c66cdd8a97cfd3b62802bb8c80', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('1ce6f2d1c4bc9b3b2695fc1b4f4a9c0e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('19a90031bea7ca924193f3f80215ea6e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('3ce9bbe41decc0a1a809150237fac5f3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('24501c09f55618516bbb164303b72ed0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('d74d8d89dea6019dc055598eefacc950', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('d18afe54a5767b933cdd2cab27f1f35a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('6075e0058bb187de409da3bfb3908428', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('de1bfbf04fafead6f1b4d397477028f6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('66f66b000fbf8caa594fd5e09dffeafb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('e264d2ed3344492ed254deaf03d7032b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('ae56c0ff62e46a900bc899f2a53ffc98', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('4af340542857024c9e3de79b5e224dd4', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('e2a0e9e87fd033054ef33d8e1e1cec5a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('88b4c5d3f58cb3c27065d28b96678ae3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('0eeb42f52deb4f2f44ff86efbc24a4e5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('6002e1610d6cb223170c82ae107ce309', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414388', '');
INSERT INTO `default_ci_sessions` VALUES ('d3025320a61dde232be570068535aaed', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('fb40c12372afc5b469b631d8e1a7f988', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('8d66cf6dcdb24a3a594d69c0549e1f9c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('867bcf2eb39494cab4f92ae6d9819776', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('4c1e9bf4d27f32f49ccb250da63d99cd', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('cb2bf5e423e9da97918bba492ff944b9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('5b2f5102ed79c70f5c3fc14552c8cfdc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('c988857cfcf43a84db7c50ac06f0df35', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('dbd4f3dd23c02eacf9f7db40cdba2467', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414389', '');
INSERT INTO `default_ci_sessions` VALUES ('8d0a2234179c7075e1b6e36f506022b0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('b0898f5245584a57cb7fd5673a6d2206', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('2fc0d56c1940bfd461bd65f2f39e865b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('3788a32d460706fc914ec7e519381e63', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('f0893749aa485cac90d660de18658a80', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('74e9baa0cb051cb13add3e91e6f87f87', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('f4af65fffacfb548bc10665b5b2386c2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('27bea24abb7d1ff3ca257e65b53cea70', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('bd2f52c6fdec162bcac7dc208cfeb16a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('005225e45fc988f3264b71c8f4f92841', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('047bffb7fa1403b127d1adecb466ac04', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('90c895b9ee8d5f93c39a4b0d9cd1f72f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('4941f9a90dcce6e3271915d27a4b05e5', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414390', '');
INSERT INTO `default_ci_sessions` VALUES ('7e4d3d6777afbbd19b8487cd703a6923', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('33ad8a1c8281d78ec17e31dd12627343', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('4b86cbe4fc9553e7e210534d78ebc3ad', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('87af1e849a8e5c4a067c097f4d9002b1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('b91348cdccb8d6c492a3aa85ca494d05', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('fbde021365522673504b0e84a26ccc20', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('0865720f3d18559f538df955f7d29ad1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('b7a165ba3cee7648046b6229582c13bf', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('3b5e099451ed9dc5eaeae37acb52ec3e', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('09107e052d7246354774f5236b655737', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('fbc1879a3d2c5834cb7ad625ebe61e0d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('dfe3d5e0927ee2b699925108df75b665', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('18fe61904403e0d52a2f01090e450869', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('38916ac3ec3288a583034ed932c1551a', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('4ade1b1b6b1117c7e5aad10ccad9b9fc', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('5903fce7723d58e27397027d93c2307d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('14934ec21be994e40c77f4dfa00ff8ea', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('5965a7184a96483f7788e40b032270e3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('720edb55cf901749edbf73bf9b1bdc38', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('548595d237315741c9b0e884b7f5c26d', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('62226726ad05bda194185acb48be0cfb', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414391', '');
INSERT INTO `default_ci_sessions` VALUES ('fe510dbf2a8497b816247531e82610a6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('e8a5a06ff0d8868ce6ce4b308bf3cf46', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('2de028ac8e99a033dfe9d027b7ca040f', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('3ebbd72d7b77a08916af456c375def49', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('96a72431f12f1baaf8f176a815ad6fa7', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('30c5b50c20a37b10b31e51b237eff023', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('17b007b602a1641f9ffe0882aa7da4c3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('db1e3f17d7234244bdfb4e7af613da10', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('77d7b229e87adb2aa5887fca13ea47c1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('2b83d5b60ceb57b9972665e3a195fbf0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('613e205535af9857e4f99de4619c1be2', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('78e79d7dc913480464e5d13bb6ea2115', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('a543533f4d30d3de80e283f299dbb6a9', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('a8f3e95def3e9c2077b7af270b54a7df', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('0ce0c5e0d206d17147ae50180cfd82b0', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('44790699d59d2a648e7843338aea53a1', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('309d91fea93bb53acc0843270c36af23', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('79099e26e6ab9cc96a1410f63dabd549', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('2a9246f54adac3c86abbbb32d16edf8c', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414392', '');
INSERT INTO `default_ci_sessions` VALUES ('880650eeb9ab92cd6710d233bacb2bc6', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('ff804435538a2c5fed8dfd21955a530b', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('70338a97562627f1cfe3aa6f36165d26', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471314067', '');
INSERT INTO `default_ci_sessions` VALUES ('4828d0433f5611117fd69fa678eb330a', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471314845', '');
INSERT INTO `default_ci_sessions` VALUES ('35c06b63de915df97d62efb0de107104', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471315206', '');
INSERT INTO `default_ci_sessions` VALUES ('6aebd6a79d289f6e4d5f9cddbc832864', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471312787', '');
INSERT INTO `default_ci_sessions` VALUES ('b09549ef390b29aad2819db121e76309', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471313349', '');
INSERT INTO `default_ci_sessions` VALUES ('350f4542810d25711d65d151ff43aeeb', '66.249.65.190', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471328616', '');
INSERT INTO `default_ci_sessions` VALUES ('ac845964dcc1b3112896187b3c5a7c0c', '5.9.106.81', 'Mozilla/5.0 (Windows NT 6.2; rv:16.0) Gecko/20100101 Firefox/16.0', '1471329958', '');
INSERT INTO `default_ci_sessions` VALUES ('2ae3a10b34dbb448f6400263e1b8ae97', '66.249.65.133', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471331756', '');
INSERT INTO `default_ci_sessions` VALUES ('7848b0c919e0fa110a292e1638eb55c3', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471329617', '');
INSERT INTO `default_ci_sessions` VALUES ('c01b3cb395cbe948b620b99fb75e9ac4', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471331956', '');
INSERT INTO `default_ci_sessions` VALUES ('ff1133e9f887754913fa63a14e2e0f00', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471351418', '');
INSERT INTO `default_ci_sessions` VALUES ('1ae50f49419d9763b0b0efe28cac0e73', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471380924', '');
INSERT INTO `default_ci_sessions` VALUES ('101da9cd30e49206057a55ce637c69b6', '5.141.232.155', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471379182', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('4ccc436321315b651960b4abb6d8e7e2', '5.141.232.155', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471379118', '');
INSERT INTO `default_ci_sessions` VALUES ('6aebc45ba778c64f43f3525a7c0c0aa4', '5.141.232.155', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471378817', '');
INSERT INTO `default_ci_sessions` VALUES ('233da2c9215fd4e8d1d45d76dd67f2b9', '5.141.232.155', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471378368', '');
INSERT INTO `default_ci_sessions` VALUES ('81c3bdb8486c63b8dbc43cbc6f86f0eb', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471377725', '');
INSERT INTO `default_ci_sessions` VALUES ('5c49b76297cbde6478158c5ed2b674ee', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471376433', '');
INSERT INTO `default_ci_sessions` VALUES ('d73f9459e77ec68340094bb2de857415', '66.249.65.180', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471375014', '');
INSERT INTO `default_ci_sessions` VALUES ('318679a2415a66d5d715fe07a9f83372', '207.46.13.57', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471362006', '');
INSERT INTO `default_ci_sessions` VALUES ('e5806a95150cf54d43757287ad5e13e2', '157.55.39.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471371056', '');
INSERT INTO `default_ci_sessions` VALUES ('6bdbb51b328197ef3975225a49845d23', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('25543630fa0444b83dbe333ce9c31ede', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471414489', '');
INSERT INTO `default_ci_sessions` VALUES ('cfc4c523f548013cba4fe93936638d7d', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471416078', '');
INSERT INTO `default_ci_sessions` VALUES ('3a3e550e728510468239d5c9a0bc0f48', '66.249.88.8', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471438932', '');
INSERT INTO `default_ci_sessions` VALUES ('2878feb36947feda992338d50a8429d3', '66.249.88.62', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471438939', '');
INSERT INTO `default_ci_sessions` VALUES ('5e470f47fe3e1cefaffed0c68071493f', '66.249.88.2', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471438945', '');
INSERT INTO `default_ci_sessions` VALUES ('23d06984c93a9ac3a75d06d37036f9b8', '66.249.65.190', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471439166', '');
INSERT INTO `default_ci_sessions` VALUES ('d016a0a8812eb487a1c6b9f82351885a', '157.55.39.128', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449255', '');
INSERT INTO `default_ci_sessions` VALUES ('8c11dab82194f43facf1c366ac897adb', '181.142.200.199', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471439485', '');
INSERT INTO `default_ci_sessions` VALUES ('bef6762c7367cbcb1ab8909cbd76dfd8', '66.249.88.8', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471439243', '');
INSERT INTO `default_ci_sessions` VALUES ('70c5af40fb0453a02c1b2e11edcc3159', '66.249.88.62', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471439248', '');
INSERT INTO `default_ci_sessions` VALUES ('e3a0b98fdfd368eb3fdf691138ac9987', '181.142.200.199', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471439301', '');
INSERT INTO `default_ci_sessions` VALUES ('64d0ed23bf5e22b368b7b80720ae9518', '66.249.88.2', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471439362', '');
INSERT INTO `default_ci_sessions` VALUES ('a58f414b2a0c508776f51a5ab4805d72', '66.249.88.62', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471439428', '');
INSERT INTO `default_ci_sessions` VALUES ('210950d655debf67776fc813c6343e2c', '181.143.170.90', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471461331', 'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:23:\"administrador@admin.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}');
INSERT INTO `default_ci_sessions` VALUES ('6274ed153d9a8137ca8066ab5e674dea', '72.76.221.220', 'panscient.com', '1471464971', '');
INSERT INTO `default_ci_sessions` VALUES ('fd87d91c6a97a11e1e7e7a65d069562e', '72.76.221.220', 'panscient.com', '1471464972', '');
INSERT INTO `default_ci_sessions` VALUES ('ed32527ce568e06ce3cca17c5b4f0e4f', '72.76.221.220', 'panscient.com', '1471464972', '');
INSERT INTO `default_ci_sessions` VALUES ('9af94bde8dc45c25feb430f8a36e7e1e', '72.76.221.220', 'panscient.com', '1471464974', '');
INSERT INTO `default_ci_sessions` VALUES ('3919f0d517efb84a95a0c99361da084a', '72.76.221.220', 'panscient.com', '1471464981', '');
INSERT INTO `default_ci_sessions` VALUES ('8049a0748ba0be704454c16b3c92d982', '72.76.221.220', 'panscient.com', '1471464984', '');
INSERT INTO `default_ci_sessions` VALUES ('738a3565f314133443ce0531ddaf7f8f', '72.76.221.220', 'panscient.com', '1471464988', '');
INSERT INTO `default_ci_sessions` VALUES ('4aa2f22bc8640441b92da1532cf4ec8d', '72.76.221.220', 'panscient.com', '1471464989', '');
INSERT INTO `default_ci_sessions` VALUES ('7dc71b881e1390b6dbdfd266a4b7aa28', '72.76.221.220', 'panscient.com', '1471464993', '');
INSERT INTO `default_ci_sessions` VALUES ('44e5ae1b788b736eac02298b2b1de98a', '72.76.221.220', 'panscient.com', '1471465007', '');
INSERT INTO `default_ci_sessions` VALUES ('190f5b4acdbd70b8014553f5a729cd49', '157.55.39.128', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471466012', '');
INSERT INTO `default_ci_sessions` VALUES ('0e1b1491aa7b2a0cc2ec83a5b4ee4c82', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471468476', '');
INSERT INTO `default_ci_sessions` VALUES ('acacfb92d869c65d877fc60fdab42965', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471469000', '');
INSERT INTO `default_ci_sessions` VALUES ('0e4b1173cec78a589fdad8375b49c99f', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471469953', '');
INSERT INTO `default_ci_sessions` VALUES ('90960dfb521c6f3a4096614bbd14713b', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471473271', '');
INSERT INTO `default_ci_sessions` VALUES ('c9eb86739b1da6bb2b276efae32787a6', '180.76.15.155', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471475482', '');
INSERT INTO `default_ci_sessions` VALUES ('b03c5edf620dbcdda69690d5cbbe1fa9', '180.76.15.150', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471475482', '');
INSERT INTO `default_ci_sessions` VALUES ('e3663aa8ee1ddf44e4dac2807eff025e', '180.76.15.7', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1471475489', '');
INSERT INTO `default_ci_sessions` VALUES ('2bf00b6e779ca281d14f1dc8746868f5', '66.249.65.129', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471475821', '');
INSERT INTO `default_ci_sessions` VALUES ('84d9ed156e804544c44c1e7a0ddd6532', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('b48ec7bad7756d0873b852e47025f9cf', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('2fb0fdc213188fec6aba7d7829314de3', '67.198.139.61', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727)', '1471414393', '');
INSERT INTO `default_ci_sessions` VALUES ('ab06bc2eab966d3412ef57c260639e00', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471437709', '');
INSERT INTO `default_ci_sessions` VALUES ('30825925f04599c617860d4590e4e910', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471437538', '');
INSERT INTO `default_ci_sessions` VALUES ('934f9734f8e7940b064c4bc708d06d4d', '161.18.35.52', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471437226', '');
INSERT INTO `default_ci_sessions` VALUES ('2bb7294a9e1e1c529bf49becd80ef271', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471436883', '');
INSERT INTO `default_ci_sessions` VALUES ('6155ad1ce317667397f2d14a205c6897', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471432953', '');
INSERT INTO `default_ci_sessions` VALUES ('edda48e7d4e5290ed83e78fcf6c564dc', '213.239.205.118', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36', '1471431312', '');
INSERT INTO `default_ci_sessions` VALUES ('2b820fc178635720f3e5e1242c2abfc6', '180.76.15.162', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471428744', '');
INSERT INTO `default_ci_sessions` VALUES ('f9b65616d99ec40c8152044e6b2d1989', '180.76.15.21', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471428744', '');
INSERT INTO `default_ci_sessions` VALUES ('1797907f61d854dd96dd8c0aca39aeda', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471427911', '');
INSERT INTO `default_ci_sessions` VALUES ('47ac6cd5dc07edb273dcf01cb1159b87', '180.76.15.6', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471422749', '');
INSERT INTO `default_ci_sessions` VALUES ('93393239d7cd31d6daa69a4c6d4095e4', '180.76.15.143', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471422749', '');
INSERT INTO `default_ci_sessions` VALUES ('9a456df33526f4dac06e958038f47b28', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471418742', '');
INSERT INTO `default_ci_sessions` VALUES ('b9f9ab89c8452770472b8c97afd034df', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471417507', '');
INSERT INTO `default_ci_sessions` VALUES ('3b4a8ff5b2abaa0e3b90d5081fd96709', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471419819', '');
INSERT INTO `default_ci_sessions` VALUES ('ba669406a6a616415e5e4c6174d6d59c', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471419797', '');
INSERT INTO `default_ci_sessions` VALUES ('bc83f299fb1692e1a2867ab6e147f098', '190.13.109.253', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445262', 'a:7:{s:8:\"username\";s:10:\"superadmin\";s:5:\"email\";s:19:\"contacto@3buweb.com\";s:2:\"id\";s:2:\"36\";s:7:\"user_id\";s:2:\"36\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}');
INSERT INTO `default_ci_sessions` VALUES ('2a82c20ce15201850efe213a0432dbef', '66.249.88.8', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445263', '');
INSERT INTO `default_ci_sessions` VALUES ('55752967a74139f779b17c6b1e79338b', '66.249.88.62', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445263', 'a:1:{s:11:\"redirect_to\";s:5:\"users\";}');
INSERT INTO `default_ci_sessions` VALUES ('84d64696a03928b42bc7fcf81961b4df', '157.55.39.128', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471445389', '');
INSERT INTO `default_ci_sessions` VALUES ('e744d7c5337eec795dbaa92f319ce83d', '66.249.65.177', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471446614', '');
INSERT INTO `default_ci_sessions` VALUES ('6bd0a28acf9221b1125a201b06c0bc84', '181.49.153.173', 'Mozilla/5.0 (Linux; Android 6.0.1; D5803 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471451581', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:31:\"jeyson.garcia@imaginamos.com.co\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('fe6bca441f152b0c0adc4e3da934d3dc', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471452361', '');
INSERT INTO `default_ci_sessions` VALUES ('05ae584874b1d08431dda6510f78727a', '201.244.193.243', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471452745', '');
INSERT INTO `default_ci_sessions` VALUES ('095fab4ed4e61d01471864bf4a18ee75', '181.143.170.90', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471454824', '');
INSERT INTO `default_ci_sessions` VALUES ('4815b2488b2c1fc60b53476c834a10ed', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471455139', '');
INSERT INTO `default_ci_sessions` VALUES ('7ee3e9a2cc997a7ae203157cd3639765', '157.55.39.128', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471456302', '');
INSERT INTO `default_ci_sessions` VALUES ('d58add72b359a0ece7ce2945600291e6', '157.55.39.128', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471456325', '');
INSERT INTO `default_ci_sessions` VALUES ('987c5b23f5a4ac2f16f65152b97af335', '157.55.39.128', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471456635', '');
INSERT INTO `default_ci_sessions` VALUES ('4698f8f06d7a5e0e97923b6a1c8a2b86', '157.55.39.161', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '1471457242', '');
INSERT INTO `default_ci_sessions` VALUES ('a671fc2ec74c523b53181b48a2dc703f', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471459288', '');
INSERT INTO `default_ci_sessions` VALUES ('ea0d278dfc9ac091830d0cb93e621072', '66.249.65.153', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471460442', '');
INSERT INTO `default_ci_sessions` VALUES ('013390907f3defcbc4a6994afd0f913b', '192.243.55.135', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381850', '');
INSERT INTO `default_ci_sessions` VALUES ('081d264253f3bbe8d7f3c034dbaa2701', '192.243.55.130', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381883', '');
INSERT INTO `default_ci_sessions` VALUES ('a382d1246466993b994b9ab226862eff', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381933', '');
INSERT INTO `default_ci_sessions` VALUES ('404d3552a7de15e65e7b299bb8f48474', '192.243.55.132', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381947', '');
INSERT INTO `default_ci_sessions` VALUES ('2dc0a401dc0e09b190344d9234351f2c', '192.243.55.133', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381976', '');
INSERT INTO `default_ci_sessions` VALUES ('831ba2285487d5947318fcbb5fa5fd2a', '192.243.55.130', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382008', '');
INSERT INTO `default_ci_sessions` VALUES ('60ff4c68b08697ae20931cfc384e9fd8', '192.243.55.136', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382049', '');
INSERT INTO `default_ci_sessions` VALUES ('7dad4771e7213c0ccaa04ab31488a90d', '192.243.55.133', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382080', '');
INSERT INTO `default_ci_sessions` VALUES ('8d8ca06e33060d36702c32809509b34d', '192.243.55.133', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382110', '');
INSERT INTO `default_ci_sessions` VALUES ('00f60ddbc04e67d14886efd1e2a7ab45', '192.243.55.136', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382144', '');
INSERT INTO `default_ci_sessions` VALUES ('48b544d89529c2a805c1065c7a2c12a8', '181.142.200.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471382539', '');
INSERT INTO `default_ci_sessions` VALUES ('1945e6080dd2b80006a9e9339c557763', '192.243.55.130', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382170', '');
INSERT INTO `default_ci_sessions` VALUES ('2795c94c197265154b585294f425762c', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382203', '');
INSERT INTO `default_ci_sessions` VALUES ('3ed17e5d1587af3259d597334667c4f2', '192.243.55.135', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382239', '');
INSERT INTO `default_ci_sessions` VALUES ('854b9d9ffeb5835803b9b363a5f38e58', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471382266', '');
INSERT INTO `default_ci_sessions` VALUES ('6d0ed0269c10ab8b28c4a5f50e686166', '84.91.216.86', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471383273', '');
INSERT INTO `default_ci_sessions` VALUES ('5a0a3a481d5b5f0a70d8a71b23328477', '84.91.216.86', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471383813', '');
INSERT INTO `default_ci_sessions` VALUES ('a3520d79301edc436151994e05dfe79b', '84.91.216.86', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471384211', '');
INSERT INTO `default_ci_sessions` VALUES ('a4f4461eee1470392d878e283fc0d54c', '84.91.216.86', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471384278', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e4d41b57930b283c3f0957ebca5c41e9', '217.144.169.109', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471385000', '');
INSERT INTO `default_ci_sessions` VALUES ('54e387bdcc0cb2992812490b5ab753c2', '207.46.13.102', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471385238', '');
INSERT INTO `default_ci_sessions` VALUES ('a577e05500144ce2768cc4ac2aa82b87', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471385644', '');
INSERT INTO `default_ci_sessions` VALUES ('a1f4f45d5966f657b37da328d9372152', '217.144.169.109', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471385650', '');
INSERT INTO `default_ci_sessions` VALUES ('7d6588acdde2e33bfca0838f0a0a2610', '217.144.169.109', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471386233', '');
INSERT INTO `default_ci_sessions` VALUES ('0bc856774f1066ccc84abc90d15b2e9d', '217.144.169.109', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471386328', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('363438c0e8808a6f588b93e87d89e536', '188.242.26.39', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471387240', '');
INSERT INTO `default_ci_sessions` VALUES ('3f1fb068c101d5a05b3081e79f468d78', '188.242.26.39', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471387682', '');
INSERT INTO `default_ci_sessions` VALUES ('bd9c95d0f856f33f92bbfcf3eaa34bf1', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471387920', '');
INSERT INTO `default_ci_sessions` VALUES ('4d633ba682e8249468adf4552e9c63b4', '188.242.26.39', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471387960', '');
INSERT INTO `default_ci_sessions` VALUES ('5eae96143238555d3b8f03f04048fbb4', '188.242.26.39', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471388026', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('27c902eacbf421d299ce21ccf36a9c41', '188.162.171.28', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471388314', '');
INSERT INTO `default_ci_sessions` VALUES ('8a4df53eb7b339141cb14e210b664d29', '188.162.171.28', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471388842', '');
INSERT INTO `default_ci_sessions` VALUES ('0d2aec787ad645023b6ffb612b0b5dad', '188.162.171.28', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471389306', '');
INSERT INTO `default_ci_sessions` VALUES ('129af04d07b7b77fd95b58c722f9132b', '188.162.171.28', 'Mozilla/5.0 (Windows NT 6.0; rv:34.0) Gecko/20100101 Firefox/34.0', '1471389396', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('724b6acc63e7f26c72da61de192a9f05', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471389789', '');
INSERT INTO `default_ci_sessions` VALUES ('26c68a4b6d6b22b9ab027a07ee5cabe8', '91.196.50.33', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1471351636', '');
INSERT INTO `default_ci_sessions` VALUES ('6197633d73687fb767d32999a4c33ac4', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471351871', '');
INSERT INTO `default_ci_sessions` VALUES ('8bdc720acbbad055bfcb2f01a84896dd', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471355433', '');
INSERT INTO `default_ci_sessions` VALUES ('09e5b85192e7b17ca37876251fe982be', '180.76.15.11', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1471357763', '');
INSERT INTO `default_ci_sessions` VALUES ('6cfcd5db0eed48e1b21513997e26fa2c', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471358551', '');
INSERT INTO `default_ci_sessions` VALUES ('34deefda5e24b00cbb032f075c7a83f2', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471360462', '');
INSERT INTO `default_ci_sessions` VALUES ('99bcfbe3d4087ad9e7fc1f4059eba9a4', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381675', '');
INSERT INTO `default_ci_sessions` VALUES ('7d3f1e4bc4a8557fb9420fd2d78eb8d9', '192.243.55.130', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381691', '');
INSERT INTO `default_ci_sessions` VALUES ('d0dfa37eff0a18d333994c57dd80b967', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381768', '');
INSERT INTO `default_ci_sessions` VALUES ('c5ddbcd886e1b37cfb89301182effc37', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471381809', '');
INSERT INTO `default_ci_sessions` VALUES ('d1f4e07c2b8db8ac5f3974d7bbef53ed', '66.249.88.8', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445226', 'a:1:{s:11:\"redirect_to\";s:5:\"users\";}');
INSERT INTO `default_ci_sessions` VALUES ('31704401ce7365613fd98f2e7e19e26f', '66.249.88.2', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445226', '');
INSERT INTO `default_ci_sessions` VALUES ('8c9af7e465dda6302dff0d2486c2c5ad', '181.142.200.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471445140', 'a:1:{s:17:\"flash:old:success\";s:25:\"You have been logged out.\";}');
INSERT INTO `default_ci_sessions` VALUES ('3d073dc60f5bfcda5e375cf754c3b098', '66.249.88.62', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445179', '');
INSERT INTO `default_ci_sessions` VALUES ('d2f0ff2ba05e72d81570833d4e241c1a', '157.55.39.128', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449255', '');
INSERT INTO `default_ci_sessions` VALUES ('235af87ef027e9c00915a6489c905611', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449245', '');
INSERT INTO `default_ci_sessions` VALUES ('204d0b834a923cc4a6c8bdf8fd6a17b2', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449245', '');
INSERT INTO `default_ci_sessions` VALUES ('4d9617bf02453f49c9fc4c8cce928c27', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449249', '');
INSERT INTO `default_ci_sessions` VALUES ('23ec9c3bfed7193137687fe815dbfe10', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449249', '');
INSERT INTO `default_ci_sessions` VALUES ('9533295d1e1dbd06d76c795bbbada26e', '180.76.15.139', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1471201576', '');
INSERT INTO `default_ci_sessions` VALUES ('343ad8b2bee51037403ad88692ffa6c9', '157.55.39.185', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471225079', '');
INSERT INTO `default_ci_sessions` VALUES ('3a2ecf77a847f2ddd24d4965ca0d0ef0', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471229306', '');
INSERT INTO `default_ci_sessions` VALUES ('234a1fff1f162cfbf268f483178d6360', '216.139.247.41', '0', '1471235107', '');
INSERT INTO `default_ci_sessions` VALUES ('bd7dccb701936d6b5d65c63fc486b13d', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471236800', '');
INSERT INTO `default_ci_sessions` VALUES ('08cdc3db75bfb760e47fac849f7f1c25', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471196525', '');
INSERT INTO `default_ci_sessions` VALUES ('b64391f7c94a6a66cc9fb360c86f8935', '207.46.13.163', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471196519', '');
INSERT INTO `default_ci_sessions` VALUES ('7d46169452fe079a1e1ba1bbcb0a1fd1', '180.76.15.145', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471186907', '');
INSERT INTO `default_ci_sessions` VALUES ('1ced413958f509d622b24a72118704c1', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471191707', '');
INSERT INTO `default_ci_sessions` VALUES ('2421633262dcfe6a108159ffcb133cbf', '66.249.65.177', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471495486', '');
INSERT INTO `default_ci_sessions` VALUES ('df5460b81fa5c2cf509273faa10ce315', '66.249.65.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471490355', '');
INSERT INTO `default_ci_sessions` VALUES ('b841062c2e2c1add746e0764190974ab', '66.249.65.190', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471485327', '');
INSERT INTO `default_ci_sessions` VALUES ('19b7751f94b5159e35370bf2d42a81f3', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471485240', '');
INSERT INTO `default_ci_sessions` VALUES ('45b9e67c861f8dee4d5974d890ea0cbd', '66.249.65.190', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471484205', '');
INSERT INTO `default_ci_sessions` VALUES ('7318782198839af9479c97b070a36c7f', '66.249.65.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471480020', '');
INSERT INTO `default_ci_sessions` VALUES ('e25b4a4fea9b24695b75b7081a8ef2c4', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471476250', '');
INSERT INTO `default_ci_sessions` VALUES ('d45050153146086d62750448c00d9ca5', '66.249.65.190', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471484198', '');
INSERT INTO `default_ci_sessions` VALUES ('ba80ba9cdffd95ac653693eeda7795fb', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471480886', '');
INSERT INTO `default_ci_sessions` VALUES ('ef2928f06c32a93b4317c3683d512709', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471484198', '');
INSERT INTO `default_ci_sessions` VALUES ('eca4793a9345edf1a61190b61c2f0b9f', '180.97.106.162', '0', '1471495401', '');
INSERT INTO `default_ci_sessions` VALUES ('499311effe742794b0dc492c4f3d0706', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471495275', '');
INSERT INTO `default_ci_sessions` VALUES ('d746ac3863854ce3d07bbcc6a71e83b0', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471495222', '');
INSERT INTO `default_ci_sessions` VALUES ('7ca7bfd635e76120b9bd73cf9b0ed46d', '66.249.65.190', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471491417', '');
INSERT INTO `default_ci_sessions` VALUES ('1e9b035653e7150021c77f29e7fe721b', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471494165', '');
INSERT INTO `default_ci_sessions` VALUES ('0858e6f0a13ed652a020a8c26d1a50f0', '66.249.65.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471496388', '');
INSERT INTO `default_ci_sessions` VALUES ('c1a1c72c48b430eb553995c6d1f3ed8c', '86.122.158.240', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36 OPR/31.0.1', '1471505605', 'a:1:{s:14:\"admin_redirect\";s:16:\"admin/config.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('01dd06f3ed47bbd210f265e8f62f93c1', '66.249.65.149', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471503937', '');
INSERT INTO `default_ci_sessions` VALUES ('6f725cc7f0873b4d8c2574583916cf97', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471503717', '');
INSERT INTO `default_ci_sessions` VALUES ('e726f0b486b8c329add90879466aae7e', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471519751', '');
INSERT INTO `default_ci_sessions` VALUES ('098d61dc20464db499a00b3d3c3b1d5b', '201.244.193.243', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471537433', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:31:\"jeyson.garcia@imaginamos.com.co\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:32:\"You have logged in successfully.\";}');
INSERT INTO `default_ci_sessions` VALUES ('11f5d6aaefe4ade1210a59351af8bd57', '185.25.151.159', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1471536269', '');
INSERT INTO `default_ci_sessions` VALUES ('cc24a4a993f8f3b7d50cb316e3d280f3', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471535693', '');
INSERT INTO `default_ci_sessions` VALUES ('de9ea1b74bb641c24c7aa13f49926dfa', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471531557', '');
INSERT INTO `default_ci_sessions` VALUES ('6218762a997576c12fd74c4afc693dac', '66.249.65.190', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471531374', '');
INSERT INTO `default_ci_sessions` VALUES ('7ffe806a50199487a1b3cc6ec8182e59', '157.55.39.141', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470927478', '');
INSERT INTO `default_ci_sessions` VALUES ('550c2c97caaee122fb853b3581fda1aa', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470938281', '');
INSERT INTO `default_ci_sessions` VALUES ('769e9649a5a2bce7e89501ff2c66a3e5', '157.55.39.137', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470938590', '');
INSERT INTO `default_ci_sessions` VALUES ('3f5733d0f41910f2ae611e865ce64582', '173.252.90.247', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', '1470943754', '');
INSERT INTO `default_ci_sessions` VALUES ('1354f052dd6f128be94cb436aacc7518', '157.55.39.141', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470944896', '');
INSERT INTO `default_ci_sessions` VALUES ('aafc030f79fb861f688d4ce793f6a810', '207.46.13.173', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1470944981', '');
INSERT INTO `default_ci_sessions` VALUES ('ddcd25df339eef0c9ea2135eaf92f648', '181.142.200.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1470945800', '');
INSERT INTO `default_ci_sessions` VALUES ('fb53357706ed4dcbf4ef145a733d868f', '207.46.13.173', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1470946870', '');
INSERT INTO `default_ci_sessions` VALUES ('0a791723fbe1a8974cb3cf629a87ea58', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1470948045', '');
INSERT INTO `default_ci_sessions` VALUES ('bac58f5c1246ecefa3230f8fc7ce2ed5', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471502891', '');
INSERT INTO `default_ci_sessions` VALUES ('4a0052a6a56e84c943741a7b66d014b4', '66.249.65.187', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471507437', '');
INSERT INTO `default_ci_sessions` VALUES ('a555afba2c648d70b4386c2fc51b9f8c', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471513518', '');
INSERT INTO `default_ci_sessions` VALUES ('66040e131d12cf8147da86e184760590', '157.55.39.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471515532', '');
INSERT INTO `default_ci_sessions` VALUES ('7778fa04db1104572bba802c620f7f70', '66.249.65.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471517573', '');
INSERT INTO `default_ci_sessions` VALUES ('93acd94c562b530011e408225a7f4037', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471520639', '');
INSERT INTO `default_ci_sessions` VALUES ('74ff23313d177e8f7af707580aa728eb', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471520986', '');
INSERT INTO `default_ci_sessions` VALUES ('d6486fc38d43a328c76dcf37a0f6513d', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471521181', '');
INSERT INTO `default_ci_sessions` VALUES ('b2b7bc48f4894ceb31ea12434be68fc7', '207.46.13.57', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471522834', '');
INSERT INTO `default_ci_sessions` VALUES ('42453717f3f1b93ec50c9d71ecfdc7ca', '157.55.39.161', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471524557', '');
INSERT INTO `default_ci_sessions` VALUES ('7c50debcf5d367ada961ae753be08795', '157.55.39.128', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471524953', '');
INSERT INTO `default_ci_sessions` VALUES ('23da1ae49446c0253706efbe9bf4405b', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471528760', '');
INSERT INTO `default_ci_sessions` VALUES ('0ee713be5efe23d757d45aea52af27ce', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471531374', '');
INSERT INTO `default_ci_sessions` VALUES ('985afa868fdb42e9a54f5dab85986f54', '157.55.39.141', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470962010', '');
INSERT INTO `default_ci_sessions` VALUES ('67daf5fe7d21f6828c492c8601a8e23c', '91.210.146.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36', '1470959466', '');
INSERT INTO `default_ci_sessions` VALUES ('f0ab63c6a8e220e44ff5a1e06a90f20c', '157.55.39.49', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470956524', '');
INSERT INTO `default_ci_sessions` VALUES ('6c264995beff0722673ec667a48835b7', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470955918', '');
INSERT INTO `default_ci_sessions` VALUES ('2e4d7bb55906e9339dbc5286f700feb5', '180.76.15.157', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1470950331', '');
INSERT INTO `default_ci_sessions` VALUES ('5af399d65892cc639f8d987e67962b42', '162.210.196.100', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', '1470948875', '');
INSERT INTO `default_ci_sessions` VALUES ('f83c46461b867e28c02a061048c9a45f', '162.210.196.100', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', '1470948873', '');
INSERT INTO `default_ci_sessions` VALUES ('268f159ea465ec26a894f68689228dd4', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1470948676', '');
INSERT INTO `default_ci_sessions` VALUES ('93f49dabc2983e13fda32f737bc89de9', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1470948045', '');
INSERT INTO `default_ci_sessions` VALUES ('ee55c2e00a6be750c091d2a94bdd3c53', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1470962623', '');
INSERT INTO `default_ci_sessions` VALUES ('d07c43d74ff82adb24cd7a5e0d699c77', '207.46.13.173', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1470965268', '');
INSERT INTO `default_ci_sessions` VALUES ('1626d3d43509b7bb6db080c18510c64d', '157.55.39.141', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470966286', '');
INSERT INTO `default_ci_sessions` VALUES ('bc74e3909f2e9c0f186fb2b7373c2d35', '207.46.13.173', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470967243', '');
INSERT INTO `default_ci_sessions` VALUES ('da7a5dc1e73ba64c97c4ebe8bfe670b9', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1470969391', '');
INSERT INTO `default_ci_sessions` VALUES ('dfc01d41eef9bfcfe71c6e1e33043519', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471010481', '');
INSERT INTO `default_ci_sessions` VALUES ('8828fb6bd280df87ed3c56d9a69bd9a8', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471010481', '');
INSERT INTO `default_ci_sessions` VALUES ('579aff8f1e118cc15b31877cbbec09ca', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471010481', '');
INSERT INTO `default_ci_sessions` VALUES ('512f66b799be5ca43ee3c22668fed8d3', '66.249.65.137', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471007755', '');
INSERT INTO `default_ci_sessions` VALUES ('e46368057eead5f91dd9233c1f58e097', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471010481', '');
INSERT INTO `default_ci_sessions` VALUES ('ab1d3a3cfd70a2d0a7dfd293e49e3e6d', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471010466', '');
INSERT INTO `default_ci_sessions` VALUES ('94ab8be271fcf29609033df1d83b3cba', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471012379', '');
INSERT INTO `default_ci_sessions` VALUES ('c630246084adf24dbd2dc34ae5e7c673', '157.55.39.99', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471013302', '');
INSERT INTO `default_ci_sessions` VALUES ('c7493d4ca5a690ad81a323d4763ca044', '180.76.15.31', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471015225', '');
INSERT INTO `default_ci_sessions` VALUES ('f3feef90056c99c0c4f2d8308053d5cd', '180.76.15.137', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471015224', '');
INSERT INTO `default_ci_sessions` VALUES ('6e603242a965aa7eeaef1ef6acf81142', '138.204.238.11', 'Mozilla/5.0 (Linux; Android 5.1; XT1022 Build/LPC23.13-34.8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 ', '1471445225', 'a:7:{s:8:\"username\";s:10:\"superadmin\";s:5:\"email\";s:19:\"contacto@3buweb.com\";s:2:\"id\";s:2:\"36\";s:7:\"user_id\";s:2:\"36\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}');
INSERT INTO `default_ci_sessions` VALUES ('ba8de11387479935eb79afe74b9dab78', '207.46.13.57', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471443839', '');
INSERT INTO `default_ci_sessions` VALUES ('c52db8773ddac87847a9fc27943581f6', '185.25.148.240', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1471442588', '');
INSERT INTO `default_ci_sessions` VALUES ('2220d5eb1b3492d2c4f972869d0e5d4b', '66.249.65.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471439166', '');
INSERT INTO `default_ci_sessions` VALUES ('208d7aa997980f9ae4347e415e2b5e8d', '157.55.39.161', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449245', '');
INSERT INTO `default_ci_sessions` VALUES ('97b65e3595bf8a1b4d22cdda05c75108', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449240', '');
INSERT INTO `default_ci_sessions` VALUES ('d7541800042d5d59666e0493460b51fc', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471448912', '');
INSERT INTO `default_ci_sessions` VALUES ('1be6fc8623d237b7fcafa955d0751bfc', '157.55.39.68', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471449240', '');
INSERT INTO `default_ci_sessions` VALUES ('9e19fae650cbb025a7559f9b394f9dd4', '66.85.75.154', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '1471143453', '');
INSERT INTO `default_ci_sessions` VALUES ('e37b2a1404b0c1b769cc0874bf4c8e9d', '180.76.15.22', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471169895', '');
INSERT INTO `default_ci_sessions` VALUES ('b1bd8f414d77950331796e584634fa8e', '66.249.65.180', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471160849', '');
INSERT INTO `default_ci_sessions` VALUES ('97f2b365b6094bc93214d47c11034e87', '66.249.65.180', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471161680', '');
INSERT INTO `default_ci_sessions` VALUES ('d8deafb228a8fd8deb904a798ca600c4', '66.249.65.149', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471162903', '');
INSERT INTO `default_ci_sessions` VALUES ('d09e5a0c59b4fccd7737ad8c59521e12', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471164971', '');
INSERT INTO `default_ci_sessions` VALUES ('c309ce121c6a3c189c9e258903dee458', '91.196.50.33', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1471168364', '');
INSERT INTO `default_ci_sessions` VALUES ('6f099c3ed39739b76de75f010419147f', '5.189.144.121', 'Morfeus Fucking Scanner', '1471169385', '');
INSERT INTO `default_ci_sessions` VALUES ('4aad3d348bc63d5ebd58d4fb6382361f', '180.76.15.136', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471169895', '');
INSERT INTO `default_ci_sessions` VALUES ('0a77c620f547640399a0e6c0ce732b14', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471244790', '');
INSERT INTO `default_ci_sessions` VALUES ('544766ad9c842d06ca30897b45d54fe6', '207.46.13.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471245745', '');
INSERT INTO `default_ci_sessions` VALUES ('f2077c4e114894497af4171a3c1b1f35', '71.6.167.124', '0', '1471247669', '');
INSERT INTO `default_ci_sessions` VALUES ('3f3420abada940763947a633630c4371', '71.6.167.124', '0', '1471247669', '');
INSERT INTO `default_ci_sessions` VALUES ('d54befe1bb1db8a8a06e0ea548c091d5', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471247738', '');
INSERT INTO `default_ci_sessions` VALUES ('e26cd901473de00711ded94bd5cfceee', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471201787', '');
INSERT INTO `default_ci_sessions` VALUES ('cef783fdf0a5e219798efe1db867fbef', '66.249.65.180', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471204238', '');
INSERT INTO `default_ci_sessions` VALUES ('1b0906b2f9347f3fa7d05f11f3fc33f1', '157.55.39.225', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471244767', '');
INSERT INTO `default_ci_sessions` VALUES ('77ffaa3e065e843a50361f08a70d8866', '207.46.13.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471208080', '');
INSERT INTO `default_ci_sessions` VALUES ('7c5fac7fe0fc29dabc82da616ee2860b', '157.55.39.225', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471210141', '');
INSERT INTO `default_ci_sessions` VALUES ('ff466b1cba9a53b6791c38cafa970894', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471268347', '');
INSERT INTO `default_ci_sessions` VALUES ('ee66fd2252c8adbe4734154d1ec26b82', '66.249.79.172', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471275414', '');
INSERT INTO `default_ci_sessions` VALUES ('5d961cab375075a7216217bf6cd7493e', '180.76.15.154', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', '1471286007', '');
INSERT INTO `default_ci_sessions` VALUES ('dc78fb36ca8e6118ef4fda7bc3a56ff6', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471287860', '');
INSERT INTO `default_ci_sessions` VALUES ('94198cf55facba21926c336b578c6e55', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471291009', '');
INSERT INTO `default_ci_sessions` VALUES ('cbb2c5ff92e0f15af8c2f94229cbafa1', '207.46.13.163', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471295873', '');
INSERT INTO `default_ci_sessions` VALUES ('ac2ae540e7aac89e119d09068833e605', '66.249.65.149', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471285475', '');
INSERT INTO `default_ci_sessions` VALUES ('4fc5fc67f3ec9dd51d01816eddaa07d6', '191.96.249.42', '0', '1471299505', 'a:1:{s:14:\"admin_redirect\";s:14:\"admin/ajax.php\";}');
INSERT INTO `default_ci_sessions` VALUES ('d72b6869e46f52f7708e65b951119df0', '207.46.13.16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471276162', '');
INSERT INTO `default_ci_sessions` VALUES ('8a250b835b7b22bfc5f6c1e3ad282580', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471301029', '');
INSERT INTO `default_ci_sessions` VALUES ('e736effc432ef6729ad97ea6c497ca6a', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471280603', '');
INSERT INTO `default_ci_sessions` VALUES ('17281f65f72829a725d6ee0440b9a55d', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471311296', '');
INSERT INTO `default_ci_sessions` VALUES ('919c67536c45f5236f8c888eaccac148', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1470991280', '');
INSERT INTO `default_ci_sessions` VALUES ('0b7d6be6756f56124c116e010437fde0', '192.243.55.135', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018178', '');
INSERT INTO `default_ci_sessions` VALUES ('e2ab96fb36117e578841ced8117af50d', '157.55.39.99', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471059134', '');
INSERT INTO `default_ci_sessions` VALUES ('3cd7f3183a1fde47d7698e54df87334c', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471060292', '');
INSERT INTO `default_ci_sessions` VALUES ('fd985c05871163a8022491a180b88efc', '66.249.65.181', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471061470', '');
INSERT INTO `default_ci_sessions` VALUES ('088f6b6e2f1b3ce3f3d946a1036ffb84', '207.46.13.173', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470972793', '');
INSERT INTO `default_ci_sessions` VALUES ('1cbdf854ccf7db6982a6fd0360e241b6', '157.55.39.99', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470974553', '');
INSERT INTO `default_ci_sessions` VALUES ('21edb4c4bb7e937e65434ee9992af580', '157.55.39.99', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470974558', '');
INSERT INTO `default_ci_sessions` VALUES ('1c9734c7cdb458e77080e48345aa9841', '157.55.39.99', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470974643', '');
INSERT INTO `default_ci_sessions` VALUES ('fd45b9762ce3f90fda1562da337425ce', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1470975505', '');
INSERT INTO `default_ci_sessions` VALUES ('f715c3d693e7fa6abdc56006765f2c18', '180.97.106.37', '0', '1470977594', '');
INSERT INTO `default_ci_sessions` VALUES ('8e2915869b8a2f216dc471769a9d05ab', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470982687', '');
INSERT INTO `default_ci_sessions` VALUES ('d0c4f9c526a41a9aaf43d39f527cd715', '91.196.50.33', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/31.0', '1470986768', '');
INSERT INTO `default_ci_sessions` VALUES ('9f3cb67b9316747031f74ce94e056898', '66.249.65.149', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1470990696', '');
INSERT INTO `default_ci_sessions` VALUES ('bf7e8931574bf72f9483ffc10561d02d', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471010481', '');
INSERT INTO `default_ci_sessions` VALUES ('d4e9be0f53918a3fa6446fb226649aa0', '66.249.65.181', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471011457', '');
INSERT INTO `default_ci_sessions` VALUES ('c1db222d77509223bee156fc65a9c993', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471014246', '');
INSERT INTO `default_ci_sessions` VALUES ('b981851a8745723193d73a846cb5bc65', '180.76.15.17', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '1471015410', '');
INSERT INTO `default_ci_sessions` VALUES ('54f47412eaa5e5cf87418da3f3b71d15', '192.187.101.170', '0', '1471017089', '');
INSERT INTO `default_ci_sessions` VALUES ('0047fe341f705a869aa8db50e6181c04', '192.187.101.170', '0', '1471017089', '');
INSERT INTO `default_ci_sessions` VALUES ('ae28b206147ed75a96cc348bbc161a9c', '192.187.101.170', '0', '1471017089', '');
INSERT INTO `default_ci_sessions` VALUES ('08e9bc4b5f42586a813300b7e63c22f6', '192.187.101.170', '0', '1471017089', '');
INSERT INTO `default_ci_sessions` VALUES ('91fbeece2781441a0dcf243b9a014364', '192.187.101.170', '0', '1471017089', '');
INSERT INTO `default_ci_sessions` VALUES ('2f7f3cd765b4f9e92a48b19e3cb7f87d', '192.187.101.170', '0', '1471017089', '');
INSERT INTO `default_ci_sessions` VALUES ('d09ee6189bab1292dc493fe18a7c4302', '207.46.13.173', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471017259', '');
INSERT INTO `default_ci_sessions` VALUES ('9d53340943388cf41f78fd98ec4107d1', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017673', '');
INSERT INTO `default_ci_sessions` VALUES ('568cf8691807022a590d49eddcd9b4e6', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017714', '');
INSERT INTO `default_ci_sessions` VALUES ('fe9af0ccd93d3d0bf87d951d30a2be75', '192.243.55.136', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017740', '');
INSERT INTO `default_ci_sessions` VALUES ('489762f559065210fffb619db7b8b303', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017773', '');
INSERT INTO `default_ci_sessions` VALUES ('6d404a66beeb2c26bef6c925b6491fa6', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017808', '');
INSERT INTO `default_ci_sessions` VALUES ('c9d46dc448ecd168dde653060dbd7104', '192.243.55.133', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017849', '');
INSERT INTO `default_ci_sessions` VALUES ('27282660f566bb487478255c11477e78', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017886', '');
INSERT INTO `default_ci_sessions` VALUES ('51e1d608ec7a37aa9cb5c859ea9f9d4d', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017910', '');
INSERT INTO `default_ci_sessions` VALUES ('bc13812d9c4863ea89d6859295b6193b', '192.243.55.131', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017949', '');
INSERT INTO `default_ci_sessions` VALUES ('a93f8b23c5a38907c792d12137630c9e', '192.243.55.132', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471017979', '');
INSERT INTO `default_ci_sessions` VALUES ('95bd0d5ecd2873b2e91bcd6d9e273b6c', '192.243.55.137', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018014', '');
INSERT INTO `default_ci_sessions` VALUES ('fbcdc9df21b777074c9ce3388d8f8bee', '192.243.55.137', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018048', '');
INSERT INTO `default_ci_sessions` VALUES ('ec3ddbc6c6dd63020740453a49565abc', '192.243.55.136', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018078', '');
INSERT INTO `default_ci_sessions` VALUES ('9b2cc37fbc963acf6930735d94b6e324', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018108', '');
INSERT INTO `default_ci_sessions` VALUES ('d270db10fb2b58627b93918091fb1ac1', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018147', '');
INSERT INTO `default_ci_sessions` VALUES ('86ea3f8def890ee02cf1f8135c496840', '157.55.39.49', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470991242', '');
INSERT INTO `default_ci_sessions` VALUES ('c39551e6e06de90085c443de087c80b0', '66.249.65.190', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1470991280', '');
INSERT INTO `default_ci_sessions` VALUES ('d03ef736a513da769be1fd16866d099f', '157.55.39.1', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470993351', '');
INSERT INTO `default_ci_sessions` VALUES ('817c754126fcd03e4e330e2338e58859', '157.55.39.20', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470993399', '');
INSERT INTO `default_ci_sessions` VALUES ('a29eeb1109e03f44d8cd4a0617903c5c', '157.55.39.20', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470993400', '');
INSERT INTO `default_ci_sessions` VALUES ('3ae6deae792c9ab8226a0aebea4fc78a', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470997498', '');
INSERT INTO `default_ci_sessions` VALUES ('8aa2765b25b55428a7cab3cd07f109b0', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1470999401', '');
INSERT INTO `default_ci_sessions` VALUES ('75a95f20d9862539b98c3fd2c3dbf40e', '207.46.13.173', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471001395', '');
INSERT INTO `default_ci_sessions` VALUES ('96410260ddea898bce84519d15629f1f', '157.55.39.80', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471004399', '');
INSERT INTO `default_ci_sessions` VALUES ('7a635f51fae4dbc624a4cfa0e94f58d2', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471006656', '');
INSERT INTO `default_ci_sessions` VALUES ('7dd7228c9e9d3bcf21fd3bb5186bfccb', '192.243.55.132', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018218', '');
INSERT INTO `default_ci_sessions` VALUES ('894fab3eda31ddaa8fa2a9795aff1c2f', '192.243.55.137', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018250', '');
INSERT INTO `default_ci_sessions` VALUES ('7eef1d42a36afb9e0393556a79a523f1', '192.243.55.135', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018292', '');
INSERT INTO `default_ci_sessions` VALUES ('b4d5fd9f8240ef8d9ff2ed67aee2ecb6', '192.243.55.132', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018309', '');
INSERT INTO `default_ci_sessions` VALUES ('6bc15bfdfc8b25ccca0444e4cf3c9f69', '192.243.55.134', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018344', '');
INSERT INTO `default_ci_sessions` VALUES ('f6149530b30a71718f736fe77826a3ea', '192.243.55.138', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018374', '');
INSERT INTO `default_ci_sessions` VALUES ('1314d53c6744fa7bf1dc54f18b3b328d', '192.243.55.132', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018407', '');
INSERT INTO `default_ci_sessions` VALUES ('7743d49cce78a873818cab98e6f247ff', '192.243.55.129', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018442', '');
INSERT INTO `default_ci_sessions` VALUES ('3ebee68b97419adfad6a8edb377fdba0', '192.243.55.132', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471018478', '');
INSERT INTO `default_ci_sessions` VALUES ('43613897811c32512b4bcd560bc95ac4', '181.142.200.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471019770', '');
INSERT INTO `default_ci_sessions` VALUES ('328cc3abf2a319f9c5c5133a9b00bd9b', '207.46.13.173', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471019876', '');
INSERT INTO `default_ci_sessions` VALUES ('60108e151b310447c3ca629b4142da25', '220.202.123.178', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)', '1471021789', '');
INSERT INTO `default_ci_sessions` VALUES ('a921c01278e014f513f11e9b9d57aca1', '181.142.200.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '1471021991', '');
INSERT INTO `default_ci_sessions` VALUES ('a3688e59c6719629ad7e6c1ffd29f332', '151.80.31.156', 'Mozilla/5.0 (compatible; AhrefsBot/5.1; +http://ahrefs.com/robot/)', '1471022389', '');
INSERT INTO `default_ci_sessions` VALUES ('d21a0b66a930da66616abf74c508a46b', '157.55.39.196', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471024206', '');
INSERT INTO `default_ci_sessions` VALUES ('77e19949ecbb634f4fcce44c99ee08df', '46.229.164.99', 'Mozilla/5.0 (compatible; SemrushBot/1.1~bl; +http://www.semrush.com/bot.html)', '1471027083', '');
INSERT INTO `default_ci_sessions` VALUES ('639b409d78d07087df63d4cd00c074e6', '66.249.65.174', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471033625', '');
INSERT INTO `default_ci_sessions` VALUES ('e01a726736caeb28de1b5a8117604d83', '157.55.39.192', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471041735', '');
INSERT INTO `default_ci_sessions` VALUES ('5f50716599e6c94b6493d622ae427b14', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471047368', '');
INSERT INTO `default_ci_sessions` VALUES ('77010ecd6291cb171ae0d9c800eb5856', '66.249.65.190', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471076363', '');
INSERT INTO `default_ci_sessions` VALUES ('fd5c669c84551bd89921ed9104bcac6a', '66.249.65.149', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471113347', '');
INSERT INTO `default_ci_sessions` VALUES ('2b517e23d52cb6ba88f9f6ab55081e32', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471118315', '');
INSERT INTO `default_ci_sessions` VALUES ('5475e3a274c63d6a1b84d6e9b129576e', '40.77.167.71', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471119215', '');
INSERT INTO `default_ci_sessions` VALUES ('a39e48e3ecf7185569aa5c6ccace34c6', '40.77.167.71', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471119216', '');
INSERT INTO `default_ci_sessions` VALUES ('3e31ff724bbcefb790e8cb5808502bc1', '66.249.65.128', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mob', '1471119281', '');
INSERT INTO `default_ci_sessions` VALUES ('ad298baa625b86283840931020df2af6', '65.181.118.38', 'AdnormCrawler www.adnorm.com/crawler', '1471120530', '');
INSERT INTO `default_ci_sessions` VALUES ('22c3771735abf7073d2a16bda07470f3', '157.55.39.241', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471124838', '');
INSERT INTO `default_ci_sessions` VALUES ('fe56a4f614f841ba36dad17fb7c206ba', '157.55.39.241', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '1471124845', '');
INSERT INTO `default_ci_sessions` VALUES ('75a4012d5671b97e4356f7171f14f47b', '40.77.167.35', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471125358', '');
INSERT INTO `default_ci_sessions` VALUES ('465a4933095f530a182cdefc73ac6879', '157.55.39.80', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465', '1471125499', '');
INSERT INTO `default_ci_sessions` VALUES ('15dd10145ac3caba5485d6d2d291ddd0', '66.249.65.128', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471125812', '');
INSERT INTO `default_ci_sessions` VALUES ('bbd8d5a0573678d9f61a10a55f73791c', '66.249.65.132', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '1471131372', '');
INSERT INTO `default_ci_sessions` VALUES ('7f5f88d3ac71a73f47702bf80557b996', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491682681', 'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('148f14fd3b465ba25d531f4207492913', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491682212', '');
INSERT INTO `default_ci_sessions` VALUES ('a3dbf0c9533d3b16daa1d34472f57a4a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491694568', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('f22d25d27b92900cb2ed0ba0e183305a', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1491694857', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('9698132c0641c863e01285c19a157dc5', '::1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobi', '1491694908', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('56e0f429047a217aab1de8609f2644fc', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491696372', '');
INSERT INTO `default_ci_sessions` VALUES ('b9eeacf5b457468a7e6eddd6eac2d0dd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491863685', '');
INSERT INTO `default_ci_sessions` VALUES ('ada37141b67350ac588e505dcb4718a7', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1491863956', '');
INSERT INTO `default_ci_sessions` VALUES ('804c85000e35fbcac3b3fb036c2248df', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491867324', '');
INSERT INTO `default_ci_sessions` VALUES ('f206b89c52fa002ba457f861aa1b1881', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1491868227', '');
INSERT INTO `default_ci_sessions` VALUES ('6d7252e7e332ba506c2c53a0f3906b67', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491948102', '');
INSERT INTO `default_ci_sessions` VALUES ('1d8dc7a4329f85383ab984a3d57688df', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1491948370', '');
INSERT INTO `default_ci_sessions` VALUES ('4c45d93e0d4f411473cdae0111a7be89', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491949026', '');
INSERT INTO `default_ci_sessions` VALUES ('eaa1f45ae86239e97fb4224602279e79', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1491949170', '');
INSERT INTO `default_ci_sessions` VALUES ('7b6c2609d6c0c9a15c52eeef17efd276', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1491949232', '');
INSERT INTO `default_ci_sessions` VALUES ('cd26239f2e39da549bcf39c94eb26524', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.3', '1492748245', '');
INSERT INTO `default_ci_sessions` VALUES ('07604e63abcfd52669113c4b6c4831a9', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1494271877', '');
INSERT INTO `default_ci_sessions` VALUES ('6dde5b08ec7ae426782e049a8ca98b05', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1493896713', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('6d1346e943430500f6fe0c88c14d033f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1493978643', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('75377fbfb008b76274af597311ebb459', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1493979019', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('8867b581db3e33aff56b9fd1b1c83b43', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1493980724', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('85678b1de3019e1a33a119a7faeb3796', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1494188525', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('3a51d1fab78995df3d85a5c1adaf9bee', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494188597', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('7125c36e4850bcfb028a46ffef2b0b6a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1494270985', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('0b53f420ece743aabc0bdf72401718c0', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494271383', '');
INSERT INTO `default_ci_sessions` VALUES ('a623981e0a0f4e7f27cb671ad76a98c1', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494272045', '');
INSERT INTO `default_ci_sessions` VALUES ('3d7afd1f4c40dd3a5bea6a09b9dd90ca', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1494272462', '');
INSERT INTO `default_ci_sessions` VALUES ('706ef8ebefb09da0341a9672b6a9a8cb', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494272741', '');
INSERT INTO `default_ci_sessions` VALUES ('6049b1af505bc1df53e8cdea4e038f1d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1494281580', 'a:1:{s:10:\"categories\";a:1:{s:8:\"category\";N;}}');
INSERT INTO `default_ci_sessions` VALUES ('830fc8a3b3e2d6f75cc471d6b5cf307a', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494282323', '');
INSERT INTO `default_ci_sessions` VALUES ('057ee8d1eb5b4285bc41d1419341272c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '1494285060', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:5:\"Autos\";}}');
INSERT INTO `default_ci_sessions` VALUES ('3c2b16459c057f281966bda2a0b964cd', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494285104', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:5:\"Autos\";}}');
INSERT INTO `default_ci_sessions` VALUES ('eb72df9a2971097803493258fa160970', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', '1494465457', 'a:8:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:38:\"Los registros se guardaron con éxito.\";s:10:\"categories\";a:1:{s:8:\"category\";s:18:\"Apartamentos-Casas\";}}');
INSERT INTO `default_ci_sessions` VALUES ('43015ddc0f5f12b3eda21fb7d54ba36b', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494465809', 'a:6:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:38:\"Los registros se guardaron con éxito.\";}');
INSERT INTO `default_ci_sessions` VALUES ('238ab8d4c067df86448e01ae099ebbca', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', '1494889953', 'a:9:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:17:\"Carros-Camionetas\";}s:17:\"flash:old:success\";s:38:\"Los registros se guardaron con éxito.\";s:17:\"flash:new:success\";s:38:\"Los registros se guardaron con éxito.\";}');
INSERT INTO `default_ci_sessions` VALUES ('a8b2531a92f6b67eb89ac074b17882da', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143', '1494890020', '');
INSERT INTO `default_ci_sessions` VALUES ('e4fc776ac3b5b0d76795134e88ceb5e3', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', '1494902814', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:18:\"Apartamentos-Casas\";}}');
INSERT INTO `default_ci_sessions` VALUES ('875941d5776336783fe922430f994e3e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', '1498615984', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('de289243cf0f0550800b1b708d5a0c3d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.3', '1499729790', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:17:\"Carros-Camionetas\";}}');
INSERT INTO `default_ci_sessions` VALUES ('35564ec0e1fad97793c7a58417ace371', '161.18.157.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.3', '1499930296', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('45291f4f10b7f470b868b89b79743996', '181.49.139.222', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1499825146', 'a:7:{s:8:\"username\";s:11:\"luis.puerto\";s:5:\"email\";s:20:\"puertolu@hotmail.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:10:\"categories\";a:1:{s:8:\"category\";s:5:\"Motos\";}}');
INSERT INTO `default_ci_sessions` VALUES ('5322ddcaadac5b8cda18cb76649e7eb4', '66.249.85.176', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/5', '1499927518', '');
INSERT INTO `default_ci_sessions` VALUES ('faab9577dd368d2c1d48356b037a587c', '66.249.88.52', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1499927527', '');
INSERT INTO `default_ci_sessions` VALUES ('7914cea6b540788c72ce9cd899407b94', '66.249.88.3', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1499976433', '');
INSERT INTO `default_ci_sessions` VALUES ('7ad1f34eae1d8c7bc7c25f49d60b1d6b', '66.249.88.53', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1500059399', '');
INSERT INTO `default_ci_sessions` VALUES ('6a8ac0d7765040d9445ecf4355a93a50', '66.249.88.52', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1500245164', '');
INSERT INTO `default_ci_sessions` VALUES ('629967088ec87c2a1bd0f6086ab8dc55', '66.249.88.52', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1500458229', '');
INSERT INTO `default_ci_sessions` VALUES ('f6a4d9fc422cae7636b01953834bc868', '66.249.88.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1500814802', '');
INSERT INTO `default_ci_sessions` VALUES ('5916ae71cb5544b3ad8c467b61c4ddb6', '66.249.88.3', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1501029130', '');
INSERT INTO `default_ci_sessions` VALUES ('1c4de0480787b55700d7c1a616ed222f', '66.249.88.9', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1501114288', '');
INSERT INTO `default_ci_sessions` VALUES ('7fdf004229f568c75b20c08f872e9381', '66.249.88.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1501284329', '');
INSERT INTO `default_ci_sessions` VALUES ('71168136a01b72faf21ce8c9f3afab0d', '186.86.118.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1501482399', 'a:7:{s:8:\"username\";s:11:\"luis.puerto\";s:5:\"email\";s:20:\"puertolu@hotmail.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:10:\"categories\";a:1:{s:8:\"category\";s:5:\"Otros\";}}');
INSERT INTO `default_ci_sessions` VALUES ('7a0a87b63e07923c1a5cd86deb945eb1', '181.49.139.222', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1501625731', 'a:6:{s:8:\"username\";s:11:\"luis.puerto\";s:5:\"email\";s:20:\"puertolu@hotmail.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}');
INSERT INTO `default_ci_sessions` VALUES ('2b27796dd9cc178967ea6e1b2bcea23d', '181.49.139.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '1501540355', 'a:7:{s:8:\"username\";s:11:\"luis.puerto\";s:5:\"email\";s:20:\"puertolu@hotmail.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:10:\"categories\";a:1:{s:8:\"category\";s:18:\"Apartamentos-Casas\";}}');
INSERT INTO `default_ci_sessions` VALUES ('bb3c1ef1bc05fbea3f1af8365467e5b9', '181.49.139.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '1501615568', '');
INSERT INTO `default_ci_sessions` VALUES ('bbcdadd0006bc9145507e991120f8744', '181.49.139.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '1501615576', '');
INSERT INTO `default_ci_sessions` VALUES ('26c4712fe49bb53db7588a60f02bea16', '161.18.47.226', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.3', '1502238535', '');
INSERT INTO `default_ci_sessions` VALUES ('458ac17d7d0af9043fe1095360597872', '174.138.37.189', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.3', '1502242738', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('ead1f3355d55c8a8a3b2da2576fd5ea8', '179.18.33.14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1502256332', '');
INSERT INTO `default_ci_sessions` VALUES ('b61d0e678fbeadcaf4370fc6ab8b849d', '186.86.118.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1502259001', 'a:7:{s:8:\"username\";s:11:\"luis.puerto\";s:5:\"email\";s:20:\"puertolu@hotmail.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:32:\"You have logged in successfully.\";}');
INSERT INTO `default_ci_sessions` VALUES ('4be233c9b31a3556343402ad8a1fbdcb', '190.67.240.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mob', '1502308215', '');
INSERT INTO `default_ci_sessions` VALUES ('d8fbb8e6c0cd716deb3e77aa7a6f54f7', '190.67.240.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mob', '1502308216', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e81f4756e7f5727aac7d3d3561822cbf', '181.49.139.222', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1502311966', 'a:1:{s:11:\"redirect_to\";s:5:\"users\";}');
INSERT INTO `default_ci_sessions` VALUES ('eb49954e5bc0abdaa4281e02010cad08', '66.249.88.54', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1502338704', '');
INSERT INTO `default_ci_sessions` VALUES ('543f3a76335c45a8f035798813960545', '66.249.88.54', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1502423884', '');
INSERT INTO `default_ci_sessions` VALUES ('008f149169a12d369b3e5dc210e277c7', '179.18.39.22', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X) AppleWebKit/602.4.6 (KHTML, like Gecko) Version/10.0 Mobile/14D', '1502431579', '');
INSERT INTO `default_ci_sessions` VALUES ('e76062cc08372aa395def4dbed8d5ad6', '179.18.58.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X) AppleWebKit/602.4.6 (KHTML, like Gecko) Version/10.0 Mobile/14D', '1502477415', '');
INSERT INTO `default_ci_sessions` VALUES ('85ef0f8cd0c9764ebea435c54a59d28d', '179.18.58.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X) AppleWebKit/602.4.6 (KHTML, like Gecko) Version/10.0 Mobile/14D', '1502477417', '');
INSERT INTO `default_ci_sessions` VALUES ('fd8b208d5626b5723c62346802912d61', '186.86.118.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1502673493', '');
INSERT INTO `default_ci_sessions` VALUES ('0ffb4a90576117c5f5b7b2bd40717981', '66.249.88.3', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1502673723', '');
INSERT INTO `default_ci_sessions` VALUES ('c18a2f062405317b72067e9bcee651eb', '66.249.88.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1502754490', '');
INSERT INTO `default_ci_sessions` VALUES ('6701e6210d5bb2f9d8ac37b01924b846', '161.18.53.51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '1502835971', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:5:\"Motos\";}}');
INSERT INTO `default_ci_sessions` VALUES ('c2de62334b2aaed3c068228ec12fede4', '66.249.88.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1502942409', '');
INSERT INTO `default_ci_sessions` VALUES ('ed276c7461c46a7854dd267656bd5c55', '181.49.139.222', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '1503101913', '');
INSERT INTO `default_ci_sessions` VALUES ('3a0d792cf5860a2c044d9b1fb934b437', '66.249.88.9', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503124304', '');
INSERT INTO `default_ci_sessions` VALUES ('91256d3f4b43ae76460aa52566fd06fe', '147.75.121.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '1503191565', '');
INSERT INTO `default_ci_sessions` VALUES ('984742b06815dd16a0834eac4427bd00', '66.249.88.3', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503295539', '');
INSERT INTO `default_ci_sessions` VALUES ('909b7160c487720a7fe63f72e36f93dc', '66.249.88.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503389083', '');
INSERT INTO `default_ci_sessions` VALUES ('87d79232f08d00e241a04d46433edfea', '66.249.88.9', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503461577', '');
INSERT INTO `default_ci_sessions` VALUES ('c122126693cb25602060a18f7f827d1e', '66.249.88.9', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503567072', '');
INSERT INTO `default_ci_sessions` VALUES ('7b3a0e078d79356b2ba406980706e30f', '66.249.88.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503680189', '');
INSERT INTO `default_ci_sessions` VALUES ('7f0f00c52174381e339c41915c625ba0', '66.249.88.3', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 Google Favicon', '1503732517', '');
INSERT INTO `default_ci_sessions` VALUES ('1a4f6a994d88f6024e14fb4c7a87d37e', '66.249.88.6', 'Mozilla/5.0 (Linux; Android 5.1.1; SGP312 Build/10.7.A.0.222) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.10', '1503827149', '');
INSERT INTO `default_ci_sessions` VALUES ('215bb7486858b5967b6dd7a90891069f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513383828', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:9:\"Vehiculos\";}}');
INSERT INTO `default_ci_sessions` VALUES ('136e2e246300b2aa3ca44fda1850dbed', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513384594', '');
INSERT INTO `default_ci_sessions` VALUES ('15f34e08de4f636550f37ba43ac14f93', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513391815', '');
INSERT INTO `default_ci_sessions` VALUES ('4947649091e1624eb5f47c8af623b3fa', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513793332', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('509ff62b609ef82ca20c304ae7e33be1', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513794272', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('288164c3e3698de5c1b5d22fc4f8d1c2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513794661', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e2349550a470ad99c90f84b6da421c94', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513794663', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('16752459b1ab4d614c926fe0ae4d2b19', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513794977', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c7ad6cca33570b4fe95e91a6f323433b', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513889658', 'a:6:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:18:\"flash:old:proccess\";s:5:\"error\";}');
INSERT INTO `default_ci_sessions` VALUES ('894307751e6f7af08f62adcc4472b92b', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513891212', 'a:1:{s:18:\"flash:old:proccess\";s:2:\"ok\";}');
INSERT INTO `default_ci_sessions` VALUES ('fc30c9bfe2f80b031c668ff0b09d99a9', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513891401', 'a:1:{s:18:\"flash:old:proccess\";s:2:\"ok\";}');
INSERT INTO `default_ci_sessions` VALUES ('bf90ce55b46a73526da9b0782c25d8cf', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513894698', 'a:1:{s:18:\"flash:old:proccess\";s:5:\"error\";}');
INSERT INTO `default_ci_sessions` VALUES ('87908ca4956e8c152e43ae110bcf56f9', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513897491', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('12ea88f9a3dea4ac1ca0c550d8d2daae', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513905598', 'a:6:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:18:\"flash:old:proccess\";s:5:\"error\";}');
INSERT INTO `default_ci_sessions` VALUES ('4eeb9f488a0049aa52efcc4b2b96ce34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513907368', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c44654aa7666bd45ec3c2ed65341998d', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513969191', 'a:6:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:18:\"flash:old:proccess\";s:5:\"error\";}');
INSERT INTO `default_ci_sessions` VALUES ('798befd34392eb2673f7a661127ad36c', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513969984', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('afaa57573693f3f60fcabd683262a9a2', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513970058', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('a663e8ffbb743a1d2b17f0303bef15ef', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513970577', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('76a57b627fca56a6e23e5a5c99ab4c48', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513970753', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('7e7449419c80619a11122b6c528a24cb', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513975350', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('0df5d44d335fd8332a1c79bdc5c6babb', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1513975675', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('39bd1a0fe5f8c54e91add1d8f7ba0465', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514340307', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:17:\"Carros-Camionetas\";}}');
INSERT INTO `default_ci_sessions` VALUES ('4ba36fb408bd58544568e7b403e23082', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513980876', '');
INSERT INTO `default_ci_sessions` VALUES ('cde3a91f5e1fe2d07aad7658cb339749', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513980877', '');
INSERT INTO `default_ci_sessions` VALUES ('ec0f9debd9e6c7318407ffbda8b8f864', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513980877', '');
INSERT INTO `default_ci_sessions` VALUES ('727fce7a734ffa6301bc3875a78a8774', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513981937', '');
INSERT INTO `default_ci_sessions` VALUES ('9f6a10bb871784f3a5fee6c7df4d6888', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513981938', '');
INSERT INTO `default_ci_sessions` VALUES ('867839105d0ea461001b21ff62d092ef', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1513981938', '');
INSERT INTO `default_ci_sessions` VALUES ('4ff3c5b7d36d4b2337bd567c7a2a9078', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514320046', '');
INSERT INTO `default_ci_sessions` VALUES ('eb21cd8cb6c99acc7848d9428272ef0d', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514320047', '');
INSERT INTO `default_ci_sessions` VALUES ('54487b06b5af94f2c04faa841e82e4b4', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514320047', '');
INSERT INTO `default_ci_sessions` VALUES ('2f01d960754d6268b98426c8bf99c4f0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514341404', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('e9aca8cea4f14acfd65534d0fea1889d', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1514341584', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('28e1bed1f9aa3fcea040b13985aa070e', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514508436', 'a:6:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:10:\"categories\";a:1:{s:8:\"category\";s:17:\"Carros-Camionetas\";}}');
INSERT INTO `default_ci_sessions` VALUES ('4701ba6369f7e4c640814972cca4e153', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514580734', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('ead2ecad84b64e5e943d4e7061b0c899', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514580735', '');
INSERT INTO `default_ci_sessions` VALUES ('4f65ec61c4edf3359f8241777894f1a6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514581824', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('55ab209055f1c507cbff3d82f32cd62e', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514588344', 'a:6:{s:8:\"username\";s:9:\"max.saens\";s:5:\"email\";s:17:\"prueba@prueba.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}');
INSERT INTO `default_ci_sessions` VALUES ('28ce1a70df1a66c7cd74d77d03bd9233', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514581825', '');
INSERT INTO `default_ci_sessions` VALUES ('b4bcf58eb3a09e4f7d44c93c1631a4b1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514586632', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c1afc05528690139c1e2b6e49451a848', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514917396', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('835901bb87aa3c669c93c9f1ed9c8f4b', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514916707', '');
INSERT INTO `default_ci_sessions` VALUES ('a0c872fa545b88dd984043c7effef01b', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514916708', '');
INSERT INTO `default_ci_sessions` VALUES ('093b3482bbb51f517a46932b3265877c', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514916708', '');
INSERT INTO `default_ci_sessions` VALUES ('8af50490502ccc94b025f490f578587a', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Mobile', '1514917595', 'a:7:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:41:\"Usted se ha conectado satisfactoriamente.\";}');
INSERT INTO `default_ci_sessions` VALUES ('201efa3b157d6b4963adc267c2204b6a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514922883', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('8cbe1296e134c6d87899f3d725c72d67', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514918880', '');
INSERT INTO `default_ci_sessions` VALUES ('eb1fb70bf0bc1679e51ee274a58b25b9', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1514928220', 'a:6:{s:8:\"username\";s:9:\"jeysongar\";s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
INSERT INTO `default_ci_sessions` VALUES ('c99a8185032f7c217c521504b26d6dfe', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1515029148', 'a:6:{s:8:\"username\";s:9:\"max.saens\";s:5:\"email\";s:17:\"prueba@prueba.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}');
INSERT INTO `default_ci_sessions` VALUES ('b5ac7a287df35f2acdaf9c658052d24a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '1515197909', 'a:5:{s:5:\"email\";s:19:\"jeysongar@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');

-- ----------------------------
-- Table structure for `default_comments`
-- ----------------------------
DROP TABLE IF EXISTS `default_comments`;
CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'gana',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_comments
-- ----------------------------
INSERT INTO `default_comments` VALUES ('2', '1', '1', '', '', 'gana', 'Esta es una pregunta de prueba', null, 'publications', '1', null, null, null, null, null, '2017-12-28 15:41:34', '::1');

-- ----------------------------
-- Table structure for `default_comment_blacklists`
-- ----------------------------
DROP TABLE IF EXISTS `default_comment_blacklists`;
CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_comment_blacklists
-- ----------------------------
INSERT INTO `default_comment_blacklists` VALUES ('1', 'gana', 'jeysongar@gmail.com');

-- ----------------------------
-- Table structure for `default_contact_log`
-- ----------------------------
DROP TABLE IF EXISTS `default_contact_log`;
CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_contact_log
-- ----------------------------

-- ----------------------------
-- Table structure for `default_data_fields`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_fields`;
CREATE TABLE `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_fields
-- ----------------------------
INSERT INTO `default_data_fields` VALUES ('1', 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613A323A7B733A31313A22656469746F725F74797065223B733A363A2273696D706C65223B733A31303A22616C6C6F775F74616773223B733A313A2279223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('2', 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613A323A7B733A31313A22656469746F725F74797065223B733A383A22616476616E636564223B733A31303A22616C6C6F775F74616773223B733A313A2279223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('3', 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A35303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('4', 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A35303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('8', 'lang:profile_dob', 'dob', 'users', 'datetime', 0x613A353A7B733A383A227573655F74696D65223B733A323A226E6F223B733A31303A2273746172745F64617465223B733A353A222D31303059223B733A383A22656E645F64617465223B4E3B733A373A2273746F72616765223B733A343A22756E6978223B733A31303A22696E7075745F74797065223B733A383A2264726F70646F776E223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('10', 'lang:profile_phone', 'phone', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B693A32303B733A31333A2264656661756C745F76616C7565223B4E3B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('11', 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A323A223230223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('17', 'Documento de identidad', 'documento_de_identidad', 'users', 'text', 0x613A323A7B733A31303A226D61785F6C656E677468223B733A323A223330223B733A31333A2264656661756C745F76616C7565223B733A303A22223B7D, null, 'no');
INSERT INTO `default_data_fields` VALUES ('18', 'Imagen', 'imagen', 'users', 'file', 0x613A323A7B733A363A22666F6C646572223B733A313A2231223B733A31333A22616C6C6F7765645F7479706573223B733A31323A226A70677C6A7065677C706E67223B7D, null, 'no');

-- ----------------------------
-- Table structure for `default_data_field_assignments`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_field_assignments`;
CREATE TABLE `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_field_assignments
-- ----------------------------
INSERT INTO `default_data_field_assignments` VALUES ('1', '1', '1', '1', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('2', '1', '2', '2', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('3', '1', '3', '3', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('4', '2', '3', '4', 'yes', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('8', '3', '3', '8', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('10', '4', '3', '10', 'no', 'no', null, null);
INSERT INTO `default_data_field_assignments` VALUES ('11', '5', '3', '11', 'no', 'no', '', null);
INSERT INTO `default_data_field_assignments` VALUES ('17', '6', '3', '17', 'no', 'no', '', null);
INSERT INTO `default_data_field_assignments` VALUES ('18', '7', '3', '18', 'no', 'no', '', null);

-- ----------------------------
-- Table structure for `default_data_streams`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_streams`;
CREATE TABLE `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_streams
-- ----------------------------
INSERT INTO `default_data_streams` VALUES ('1', 'lang:blog:blog_title', 'blog', 'blogs', null, null, 0x613A323A7B693A303B733A323A226964223B693A313B733A373A2263726561746564223B7D, null, 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('2', 'Default', 'def_page_fields', 'pages', null, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613A323A7B693A303B733A323A226964223B693A313B733A373A2263726561746564223B7D, null, 'title', null, 'no', null);
INSERT INTO `default_data_streams` VALUES ('3', 'lang:user_profile_fields_label', 'profiles', 'users', null, 'Profiles for users module', 0x613A313A7B693A303B733A31323A22646973706C61795F6E616D65223B7D, 'display_name', 'title', null, 'no', null);

-- ----------------------------
-- Table structure for `default_data_stream_searches`
-- ----------------------------
DROP TABLE IF EXISTS `default_data_stream_searches`;
CREATE TABLE `default_data_stream_searches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `search_term` text COLLATE utf8_unicode_ci,
  `ip_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_results` int(11) NOT NULL,
  `query_string` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_data_stream_searches
-- ----------------------------

-- ----------------------------
-- Table structure for `default_def_page_fields`
-- ----------------------------
DROP TABLE IF EXISTS `default_def_page_fields`;
CREATE TABLE `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_def_page_fields
-- ----------------------------
INSERT INTO `default_def_page_fields` VALUES ('5', '2015-12-07 19:50:07', null, '1', null, '<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>');

-- ----------------------------
-- Table structure for `default_documents`
-- ----------------------------
DROP TABLE IF EXISTS `default_documents`;
CREATE TABLE `default_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `file` text COLLATE utf8_unicode_ci,
  `category` text COLLATE utf8_unicode_ci,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `virtual_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_documents
-- ----------------------------
INSERT INTO `default_documents` VALUES ('1', '1', 'El mundo empresarial más cerca de usted editado', 'uploads/default/documents/7ba3fb691bba7589615868fdcd84209a.pdf', 'normatividad', '2016-01-04 00:00:00', '0', 'es');
INSERT INTO `default_documents` VALUES ('2', '1', 'Prueba de calendario', 'uploads/default/documents/8b080974e3c77af5ee0c251e4591f4cf.pdf', 'calendario', '2016-01-05 13:50:19', '0', 'es');
INSERT INTO `default_documents` VALUES ('4', '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'uploads/default/documents/59c05b9efed5396f3909b4315550c9f5.pdf', 'acta_de_reunion', '2016-01-05 13:55:49', '0', 'es');
INSERT INTO `default_documents` VALUES ('5', '2', 'Prueba documento', 'uploads/default/documents/26dd37a11ab0abc276f8db3d2a2a1b3e.pdf', 'proyectos', '2016-01-28 08:42:37', '0', 'es');
INSERT INTO `default_documents` VALUES ('6', '0', 'Reunión virtual pregunta 1', 'uploads/default/documents/befeafd439afe09ef9982085a9948b31.pdf', 'reunion_virtual', '2016-02-15 12:15:34', '1', 'es');
INSERT INTO `default_documents` VALUES ('7', '0', 'Nuevo Documento', 'uploads/default/documents/d3bf4476b3cd24307ed63dac53f612f9.pdf', 'reunion_virtual', '2016-02-15 12:16:47', '2', 'es');
INSERT INTO `default_documents` VALUES ('8', '0', 'Nuevo Documento', 'uploads/default/documents/30a1e124217c429931658159bc7239fa.pdf', 'reunion_virtual', '2016-02-15 12:17:14', '3', 'es');
INSERT INTO `default_documents` VALUES ('10', '0', 'Nueva capacitacion', 'uploads/default/documents/6b3ffa7275c1beabb4517f46bf5ceef9.pdf', 'reunion_virtual', '2016-02-15 12:19:10', '1', 'es');
INSERT INTO `default_documents` VALUES ('11', '0', 'Prueba evento ', 'uploads/default/documents/91c884e01c26faa5d624386324c886bf.pdf', 'reunion_virtual', '2016-02-15 12:19:20', '1', 'es');
INSERT INTO `default_documents` VALUES ('12', '1', 'imaginamos ', 'uploads/default/documents/e4f3faaea730dc7b47d4562acd9ea304.xls', 'presupuesto', '2016-03-04 14:54:49', '0', 'es');

-- ----------------------------
-- Table structure for `default_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `default_email_templates`;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_email_templates
-- ----------------------------
INSERT INTO `default_email_templates` VALUES ('1', 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>', 'en', '1', 'comments');
INSERT INTO `default_email_templates` VALUES ('2', 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', 'This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n				\n				{{ email }}', 'en', '1', 'pages');
INSERT INTO `default_email_templates` VALUES ('3', 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('4', 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('5', 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', '1', 'users');
INSERT INTO `default_email_templates` VALUES ('6', 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>', 'en', '1', 'users');

-- ----------------------------
-- Table structure for `default_files`
-- ----------------------------
DROP TABLE IF EXISTS `default_files`;
CREATE TABLE `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_files
-- ----------------------------
INSERT INTO `default_files` VALUES ('12d67fbc920f42c', '1', '3', 'i', '8.jpg', '6113c8f8372c2a16d3152d145572c207.jpg', '{{ url:site }}files/large/6113c8f8372c2a16d3152d145572c207.jpg', '', '.jpg', 'image/jpeg', '', '96', '96', '2', '', '0', '1514574868', '0');
INSERT INTO `default_files` VALUES ('14e0088d6e8b9b5', '1', '4', 'i', '3.jpg', '9892790c1c0da799dfd0fdee829f2c2a.jpg', '{{ url:site }}files/large/9892790c1c0da799dfd0fdee829f2c2a.jpg', '', '.jpg', 'image/jpeg', '', '96', '96', '3', '', '0', '1514576450', '0');
INSERT INTO `default_files` VALUES ('403375b72b6aab4', '1', '1', 'i', 'avatar.jpg', '4a71d91c4cadf9946436ff0e817b6c47.jpg', '{{ url:site }}files/large/4a71d91c4cadf9946436ff0e817b6c47.jpg', '', '.jpg', 'image/jpeg', '', '224', '225', '1', '', '0', '1514576319', '0');
INSERT INTO `default_files` VALUES ('47ae09a5ac9b5a5', '1', '1', 'i', 'unnamed.jpg', 'a72d3cc9b98260b9e2a87ff498571638.jpg', '{{ url:site }}files/large/a72d3cc9b98260b9e2a87ff498571638.jpg', '', '.jpg', 'image/jpeg', '', '640', '869', '42', '', '0', '1514493347', '0');
INSERT INTO `default_files` VALUES ('d4106811dfea670', '1', '1', 'i', '1024px-bugatti_veyron_16.4__frontansicht_2_5_._april_2012_duesseldorf_.jpg', 'a1c9ca863b3989f95f126da80535f7a1.jpg', '{{ url:site }}files/large/a1c9ca863b3989f95f126da80535f7a1.jpg', '', '.jpg', 'image/jpeg', '', '1024', '545', '142', '', '1', '1514491023', '0');

-- ----------------------------
-- Table structure for `default_file_folders`
-- ----------------------------
DROP TABLE IF EXISTS `default_file_folders`;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_file_folders
-- ----------------------------
INSERT INTO `default_file_folders` VALUES ('1', '0', 'users-images', 'Users_images', 'local', '', '1514490089', '1514490089', '0');

-- ----------------------------
-- Table structure for `default_groups`
-- ----------------------------
DROP TABLE IF EXISTS `default_groups`;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_groups
-- ----------------------------
INSERT INTO `default_groups` VALUES ('1', 'admin', 'Administrator');
INSERT INTO `default_groups` VALUES ('2', 'user', 'User');

-- ----------------------------
-- Table structure for `default_home`
-- ----------------------------
DROP TABLE IF EXISTS `default_home`;
CREATE TABLE `default_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_home
-- ----------------------------

-- ----------------------------
-- Table structure for `default_home_banner`
-- ----------------------------
DROP TABLE IF EXISTS `default_home_banner`;
CREATE TABLE `default_home_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `position_text` text COLLATE utf8_unicode_ci,
  `color_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_home_banner
-- ----------------------------
INSERT INTO `default_home_banner` VALUES ('1', 'uploads/default/home_banner/9fa043aeabe450d55310c8b235b1cf94.jpg', 'Lorem ipsum dolor sit amet', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', null, null, 'https://www.google.es/', 'es');
INSERT INTO `default_home_banner` VALUES ('2', 'uploads/default/home_banner/f566aec9f868de0616343f50343761be.jpg', 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', null, null, 'https://www.google.es/', 'es');

-- ----------------------------
-- Table structure for `default_home_customers`
-- ----------------------------
DROP TABLE IF EXISTS `default_home_customers`;
CREATE TABLE `default_home_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_home_customers
-- ----------------------------

-- ----------------------------
-- Table structure for `default_home_outstanding`
-- ----------------------------
DROP TABLE IF EXISTS `default_home_outstanding`;
CREATE TABLE `default_home_outstanding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `type` int(1) DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_home_outstanding
-- ----------------------------
INSERT INTO `default_home_outstanding` VALUES ('1', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/4afe3d1d329e4b81d4bdf79b589be13d.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('2', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/4ebc1c03b5d3d41727d3a777683c4799.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('3', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/3efa4414ac18bdb28058e31d5486ab26.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('4', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/8a2e85af21cd08c1ce25bf6b0bfe5b3e.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('5', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/27d6a0866acd5048d54dfd2d79173000.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('6', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/6057e4af82e96a6f71b69905cc24bb32.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('7', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/e7283ebfb0ebff6535a10632c7fb3b83.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('8', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/e29e79ab59a1f971013d2543c70d00da.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('9', 'Lorem ipsum dolor sit amet', 'uploads/default/home_outstanding/866728ccdb447d5ef0b44bb18de6effe.png', null, '1', 'https://www.google.es/', 'es');
INSERT INTO `default_home_outstanding` VALUES ('10', 'LOREM IPSUM DOLOR SIT AMET', 'uploads/default/home_outstanding/4cd908beef4b133aaca9776b6d4d0d1f.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '2', 'http://vimeo.com/101373765', 'es');

-- ----------------------------
-- Table structure for `default_home_text_info`
-- ----------------------------
DROP TABLE IF EXISTS `default_home_text_info`;
CREATE TABLE `default_home_text_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_home_text_info
-- ----------------------------
INSERT INTO `default_home_text_info` VALUES ('1', '', '', '', 'es');

-- ----------------------------
-- Table structure for `default_images_publicate`
-- ----------------------------
DROP TABLE IF EXISTS `default_images_publicate`;
CREATE TABLE `default_images_publicate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) NOT NULL,
  `file` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of default_images_publicate
-- ----------------------------
INSERT INTO `default_images_publicate` VALUES ('2', '1', 'uploads/default/publications/6e0062d3780c756900372849949f0a8f.jpg');
INSERT INTO `default_images_publicate` VALUES ('3', '2', 'uploads/default/publications/5f3b578abb7f689ed4e09db9722e41f6.jpeg');
INSERT INTO `default_images_publicate` VALUES ('4', '1', 'uploads/default/publications/caf6f1a0a5bb744089274121c4d59870.jpg');
INSERT INTO `default_images_publicate` VALUES ('5', '3', 'uploads/default/publications/dd4122ac7ac868c1d4f72179eb99949f.jpg');
INSERT INTO `default_images_publicate` VALUES ('6', '4', 'uploads/default/publications/421e0f87dcc3e47eafe135c22c244058.jpg');
INSERT INTO `default_images_publicate` VALUES ('7', '5', 'uploads/default/publications/886f094b8fd9c675b2f094a96bbc3ddc.jpg');
INSERT INTO `default_images_publicate` VALUES ('8', '7', 'uploads/default/publications/ca4b7c1dad2ed7d1260e7984ad870389.jpg');
INSERT INTO `default_images_publicate` VALUES ('10', '8', 'uploads/default/publications/77b804d2b9d21164bcdd3a39dd5e75d5.jpg');
INSERT INTO `default_images_publicate` VALUES ('11', '8', 'uploads/default/publications/a6169cfc3441e22aa92012158db325a3.jpg');

-- ----------------------------
-- Table structure for `default_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `default_keywords`;
CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for `default_keywords_applied`
-- ----------------------------
DROP TABLE IF EXISTS `default_keywords_applied`;
CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_keywords_applied
-- ----------------------------

-- ----------------------------
-- Table structure for `default_marca_autos`
-- ----------------------------
DROP TABLE IF EXISTS `default_marca_autos`;
CREATE TABLE `default_marca_autos` (
  `marca_id` int(11) NOT NULL,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of default_marca_autos
-- ----------------------------
INSERT INTO `default_marca_autos` VALUES ('2', 'AGRALE');
INSERT INTO `default_marca_autos` VALUES ('3', 'ALFA ROMEO');
INSERT INTO `default_marca_autos` VALUES ('4', 'AUDI');
INSERT INTO `default_marca_autos` VALUES ('5', 'BMW');
INSERT INTO `default_marca_autos` VALUES ('6', 'CHERY');
INSERT INTO `default_marca_autos` VALUES ('7', 'CHEVROLET');
INSERT INTO `default_marca_autos` VALUES ('8', 'CHRYSLER');
INSERT INTO `default_marca_autos` VALUES ('9', 'CITROEN');
INSERT INTO `default_marca_autos` VALUES ('10', 'DACIA');
INSERT INTO `default_marca_autos` VALUES ('11', 'DAEWO');
INSERT INTO `default_marca_autos` VALUES ('12', 'DAIHATSU');
INSERT INTO `default_marca_autos` VALUES ('13', 'DODGE');
INSERT INTO `default_marca_autos` VALUES ('14', 'FERRARI');
INSERT INTO `default_marca_autos` VALUES ('15', 'FIAT');
INSERT INTO `default_marca_autos` VALUES ('16', 'FORD');
INSERT INTO `default_marca_autos` VALUES ('17', 'GALLOPER');
INSERT INTO `default_marca_autos` VALUES ('18', 'HEIBAO');
INSERT INTO `default_marca_autos` VALUES ('19', 'HONDA');
INSERT INTO `default_marca_autos` VALUES ('20', 'HYUNDAI');
INSERT INTO `default_marca_autos` VALUES ('21', 'ISUZU');
INSERT INTO `default_marca_autos` VALUES ('22', 'JAGUAR');
INSERT INTO `default_marca_autos` VALUES ('23', 'JEEP');
INSERT INTO `default_marca_autos` VALUES ('24', 'KIA');
INSERT INTO `default_marca_autos` VALUES ('25', 'LADA');
INSERT INTO `default_marca_autos` VALUES ('26', 'LAND ROVER');
INSERT INTO `default_marca_autos` VALUES ('27', 'LEXUS');
INSERT INTO `default_marca_autos` VALUES ('28', 'MASERATI');
INSERT INTO `default_marca_autos` VALUES ('29', 'MAZDA');
INSERT INTO `default_marca_autos` VALUES ('30', 'MERCEDES BENZ');
INSERT INTO `default_marca_autos` VALUES ('31', 'MG');
INSERT INTO `default_marca_autos` VALUES ('32', 'MINI');
INSERT INTO `default_marca_autos` VALUES ('33', 'MITSUBISHI');
INSERT INTO `default_marca_autos` VALUES ('34', 'NISSAN');
INSERT INTO `default_marca_autos` VALUES ('35', 'PEUGEOT');
INSERT INTO `default_marca_autos` VALUES ('36', 'PORSCHE');
INSERT INTO `default_marca_autos` VALUES ('37', 'RAM');
INSERT INTO `default_marca_autos` VALUES ('38', 'RENAULT');
INSERT INTO `default_marca_autos` VALUES ('39', 'ROVER');
INSERT INTO `default_marca_autos` VALUES ('40', 'SAAB');
INSERT INTO `default_marca_autos` VALUES ('41', 'SEAT');
INSERT INTO `default_marca_autos` VALUES ('42', 'SMART');
INSERT INTO `default_marca_autos` VALUES ('43', 'SSANGYONG');
INSERT INTO `default_marca_autos` VALUES ('44', 'SUBARU');
INSERT INTO `default_marca_autos` VALUES ('45', 'SUZUKI');
INSERT INTO `default_marca_autos` VALUES ('46', 'TATA');
INSERT INTO `default_marca_autos` VALUES ('47', 'TOYOTA');
INSERT INTO `default_marca_autos` VALUES ('48', 'VOLKSWAGEN');
INSERT INTO `default_marca_autos` VALUES ('49', 'VOLVO');

-- ----------------------------
-- Table structure for `default_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `default_migrations`;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_migrations
-- ----------------------------
INSERT INTO `default_migrations` VALUES ('128');

-- ----------------------------
-- Table structure for `default_modules`
-- ----------------------------
DROP TABLE IF EXISTS `default_modules`;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_modules
-- ----------------------------
INSERT INTO `default_modules` VALUES ('1', 'a:25:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fa\";s:14:\"تنظیمات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"tw\";s:12:\"網站設定\";s:2:\"cn\";s:12:\"网站设定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}', 'settings', '1.0.0', null, 'a:25:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fa\";s:105:\"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:118:\"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"tw\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"cn\";s:99:\"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}', '1', '0', '1', 'settings', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('2', 'a:11:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";s:2:\"tw\";s:14:\"Streams 核心\";s:2:\"cn\";s:14:\"Streams 核心\";s:2:\"ar\";s:31:\"الجداول الأساسية\";s:2:\"it\";s:12:\"Streams Core\";s:2:\"fa\";s:26:\"هسته استریم ها\";s:2:\"fi\";s:13:\"Striimit ydin\";}', 'streams_core', '1.0.0', null, 'a:11:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";s:2:\"tw\";s:29:\"Streams 核心資料模組。\";s:2:\"cn\";s:29:\"Streams 核心资料模组。\";s:2:\"ar\";s:57:\"وحدة البيانات الأساسية للجداول\";s:2:\"it\";s:17:\"Core dello Stream\";s:2:\"fa\";s:48:\"ماژول مرکزی برای استریم ها\";s:2:\"fi\";s:48:\"Ydin datan hallinoiva moduuli striimejä varten.\";}', '1', '0', '0', '0', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('3', 'a:21:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fa\";s:26:\"قالب های ایمیل\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"tw\";s:12:\"郵件範本\";s:2:\"cn\";s:12:\"邮件范本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}', 'templates', '1.1.0', null, 'a:21:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fa\";s:92:\"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"tw\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"cn\";s:61:\"新增、编辑与储存可显示动态资料的 email 范本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}', '1', '0', '1', 'structure', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('4', 'a:25:{s:2:\"en\";s:7:\"Add-ons\";s:2:\"ar\";s:16:\"الإضافات\";s:2:\"br\";s:12:\"Complementos\";s:2:\"pt\";s:12:\"Complementos\";s:2:\"cs\";s:8:\"Doplňky\";s:2:\"da\";s:7:\"Add-ons\";s:2:\"de\";s:13:\"Erweiterungen\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:9:\"Agregados\";s:2:\"fa\";s:17:\"افزونه ها\";s:2:\"fi\";s:9:\"Lisäosat\";s:2:\"fr\";s:10:\"Extensions\";s:2:\"he\";s:12:\"תוספות\";s:2:\"id\";s:7:\"Pengaya\";s:2:\"it\";s:7:\"Add-ons\";s:2:\"lt\";s:7:\"Priedai\";s:2:\"nl\";s:7:\"Add-ons\";s:2:\"pl\";s:12:\"Rozszerzenia\";s:2:\"ru\";s:20:\"Дополнения\";s:2:\"sl\";s:11:\"Razširitve\";s:2:\"tw\";s:12:\"附加模組\";s:2:\"cn\";s:12:\"附加模组\";s:2:\"hu\";s:14:\"Bővítmények\";s:2:\"th\";s:27:\"ส่วนเสริม\";s:2:\"se\";s:8:\"Tillägg\";}', 'addons', '2.0.0', null, 'a:25:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fa\";s:93:\"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"tw\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"cn\";s:54:\"管理员可以检视目前已经安装模组的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}', '0', '0', '1', '0', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('5', 'a:17:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}', 'blog', '2.0.0', null, 'a:25:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}', '1', '1', '1', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('6', 'a:25:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"fa\";s:10:\"نظرات\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"tw\";s:6:\"回應\";s:2:\"cn\";s:6:\"回应\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}', 'comments', '1.1.0', null, 'a:25:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fa\";s:168:\"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"tw\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"cn\";s:75:\"用户和访客可以针对新闻、页面与照片等内容发表回应。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}', '0', '0', '1', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('7', 'a:25:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fa\";s:18:\"تماس با ما\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"tw\";s:12:\"聯絡我們\";s:2:\"cn\";s:12:\"联络我们\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}', 'contact', '1.0.0', null, 'a:25:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"fa\";s:239:\"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"tw\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"cn\";s:147:\"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}', '0', '0', '0', '0', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('8', 'a:8:{s:2:\"en\";s:7:\"Domains\";s:2:\"el\";s:7:\"Domains\";s:2:\"fr\";s:8:\"Domaines\";s:2:\"se\";s:8:\"Domäner\";s:2:\"it\";s:6:\"Domini\";s:2:\"ar\";s:27:\"أسماء النطاقات\";s:2:\"tw\";s:6:\"網域\";s:2:\"cn\";s:6:\"网域\";}', 'domains', '1.0.0', null, 'a:8:{s:2:\"en\";s:39:\"Create domain aliases for your website.\";s:2:\"el\";s:91:\"Διαχειριστείτε συνώνυμα domain για τον ιστότοπό σας.\";s:2:\"fr\";s:47:\"Créer des alias de domaine pour votre site web\";s:2:\"se\";s:36:\"Skapa domänalias för din webbplats\";s:2:\"it\";s:26:\"Crea alias per il tuo sito\";s:2:\"ar\";s:57:\"أنشئ أسماء نطاقات بديلة لموقعك.\";s:2:\"tw\";s:33:\"為您的網站建立網域別名\";s:2:\"cn\";s:33:\"为您的网站建立网域别名\";}', '0', '0', '1', 'structure', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('9', 'a:24:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fa\";s:13:\"فایل ها\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"tw\";s:6:\"檔案\";s:2:\"cn\";s:6:\"档案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}', 'files', '2.0.0', null, 'a:24:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fa\";s:79:\"مدیریت فایل های چند رسانه ای و فولدر ها سایت\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"tw\";s:33:\"管理網站中的檔案與目錄\";s:2:\"cn\";s:33:\"管理网站中的档案与目录\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}', '0', '0', '1', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('10', 'a:24:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fa\";s:13:\"گروه ها\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"tw\";s:6:\"群組\";s:2:\"cn\";s:6:\"群组\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}', 'groups', '1.0.0', null, 'a:24:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fa\";s:149:\"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"tw\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"cn\";s:45:\"用户可以依群组分类并管理其权限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}', '0', '0', '1', 'users', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('11', 'a:17:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fa\";s:21:\"کلمات کلیدی\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"tw\";s:6:\"鍵詞\";s:2:\"cn\";s:6:\"键词\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}', 'keywords', '1.1.0', null, 'a:17:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fa\";s:110:\"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"tw\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"cn\";s:64:\"集中管理可用于标题与内容的键词(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}', '0', '0', '1', 'data', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('12', 'a:15:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fa\";s:15:\"نگه داری\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"it\";s:12:\"Manutenzione\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"tw\";s:6:\"維護\";s:2:\"cn\";s:6:\"维护\";}', 'maintenance', '1.0.0', null, 'a:15:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"it\";s:65:\"Gestisci la cache del sito e esporta le informazioni dal database\";s:2:\"fa\";s:73:\"مدیریت کش سایت و صدور اطلاعات از دیتابیس\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"tw\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"cn\";s:45:\"经由管理介面手动删除暂存资料。\";}', '0', '0', '1', 'data', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('13', 'a:25:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fa\";s:11:\"منو ها\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"tw\";s:12:\"導航選單\";s:2:\"cn\";s:12:\"导航选单\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}', 'navigation', '1.1.0', null, 'a:25:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fa\";s:68:\"مدیریت منو ها و گروه های مربوط به آنها\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"tw\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"cn\";s:72:\"管理导航选单中的连结，以及它们所隶属的导航群组。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";}', '0', '0', '1', 'structure', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('14', 'a:25:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fa\";s:14:\"صفحه ها \";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"tw\";s:6:\"頁面\";s:2:\"cn\";s:6:\"页面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}', 'pages', '2.2.0', null, 'a:25:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fa\";s:96:\"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"tw\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"cn\";s:39:\"为您的网站新增自定的页面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}', '1', '1', '1', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('15', 'a:25:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fa\";s:15:\"اجازه ها\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"tw\";s:6:\"權限\";s:2:\"cn\";s:6:\"权限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}', 'permissions', '1.0.0', null, 'a:25:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fa\";s:59:\"مدیریت اجازه های گروه های کاربری\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"tw\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"cn\";s:81:\"用来控制不同类别的用户，设定其浏览特定网站内容的权限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}', '0', '0', '1', 'users', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('16', 'a:24:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fa\";s:17:\"انتقال ها\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"tw\";s:6:\"轉址\";s:2:\"cn\";s:6:\"转址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"pl\";s:14:\"Przekierowania\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}', 'redirects', '1.0.0', null, 'a:24:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fa\";s:63:\"انتقال دادن یک صفحه به یک آدرس دیگر\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"tw\";s:33:\"將網址轉址、重新定向。\";s:2:\"cn\";s:33:\"将网址转址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"pl\";s:44:\"Przekierowanie z jednego adresu URL na inny.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}', '0', '0', '1', 'structure', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('17', 'a:9:{s:2:\"en\";s:6:\"Search\";s:2:\"fr\";s:9:\"Recherche\";s:2:\"se\";s:4:\"Sök\";s:2:\"ar\";s:10:\"البحث\";s:2:\"tw\";s:6:\"搜尋\";s:2:\"cn\";s:6:\"搜寻\";s:2:\"it\";s:7:\"Ricerca\";s:2:\"fa\";s:10:\"جستجو\";s:2:\"fi\";s:4:\"Etsi\";}', 'search', '1.0.0', null, 'a:9:{s:2:\"en\";s:72:\"Search through various types of content with this modular search system.\";s:2:\"fr\";s:84:\"Rechercher parmi différents types de contenus avec système de recherche modulaire.\";s:2:\"se\";s:36:\"Sök igenom olika typer av innehåll\";s:2:\"ar\";s:102:\"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.\";s:2:\"tw\";s:63:\"此模組可用以搜尋網站中不同類型的資料內容。\";s:2:\"cn\";s:63:\"此模组可用以搜寻网站中不同类型的资料内容。\";s:2:\"it\";s:71:\"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare\";s:2:\"fa\";s:115:\"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.\";s:2:\"fi\";s:76:\"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.\";}', '0', '0', '0', '0', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('18', 'a:20:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fa\";s:17:\"نقشه سایت\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"tw\";s:12:\"網站地圖\";s:2:\"cn\";s:12:\"网站地图\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}', 'sitemap', '1.3.0', null, 'a:21:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fa\";s:150:\"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"tw\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"cn\";s:84:\"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}', '0', '1', '0', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('19', 'a:6:{s:2:\"en\";s:7:\"Streams\";s:2:\"es\";s:7:\"Streams\";s:2:\"de\";s:7:\"Streams\";s:2:\"el\";s:8:\"Ροές\";s:2:\"lt\";s:7:\"Srautai\";s:2:\"fr\";s:7:\"Streams\";}', 'streams', '2.3.3', null, 'a:6:{s:2:\"en\";s:36:\"Manage, structure, and display data.\";s:2:\"es\";s:41:\"Administra, estructura, y presenta datos.\";s:2:\"de\";s:49:\"Verwalte, strukturiere und veröffentliche Daten.\";s:2:\"el\";s:106:\"Διαχείριση, δόμηση και προβολή πληροφοριών και δεδομένων.\";s:2:\"lt\";N;s:2:\"fr\";s:43:\"Gérer, structurer et afficher des données\";}', '0', '0', '1', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('20', 'a:25:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fa\";s:14:\"کاربران\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"tw\";s:6:\"用戶\";s:2:\"cn\";s:6:\"用户\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}', 'users', '1.1.0', null, 'a:25:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fa\";s:151:\"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"tw\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"cn\";s:87:\"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}', '0', '0', '1', '0', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('21', 'a:25:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fa\";s:16:\"متغییرها\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"tw\";s:12:\"系統變數\";s:2:\"cn\";s:12:\"系统变数\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";s:2:\"hu\";s:10:\"Változók\";}', 'variables', '1.0.0', null, 'a:25:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fa\";s:136:\"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:92:\"Gérer des variables globales pour pouvoir y accéder depuis n\'importe quel endroit du site.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"tw\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"cn\";s:45:\"管理此网站内可存取的全局变数。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}', '0', '0', '1', 'data', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('22', 'a:23:{s:2:\"en\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"da\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fa\";s:13:\"ویجت ها\";s:2:\"fi\";s:9:\"Vimpaimet\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"tw\";s:9:\"小組件\";s:2:\"cn\";s:9:\"小组件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";s:2:\"ar\";s:14:\"الودجتس\";}', 'widgets', '1.2.0', null, 'a:23:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:132:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"ودجتس\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fa\";s:76:\"مدیریت قسمت های کوچکی از سایت به طور مستقل\";s:2:\"fi\";s:81:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Vimpaimia\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"tw\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"cn\";s:103:\"可将小段的程式码透过小组件来管理。即所谓 \"Widgets\"，或称为小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}', '1', '0', '1', 'content', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('23', 'a:9:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"fa\";s:7:\"WYSIWYG\";s:2:\"fr\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";s:2:\"tw\";s:7:\"WYSIWYG\";s:2:\"cn\";s:7:\"WYSIWYG\";s:2:\"ar\";s:27:\"المحرر الرسومي\";s:2:\"it\";s:7:\"WYSIWYG\";}', 'wysiwyg', '1.0.0', null, 'a:10:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"fa\";s:73:\"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. \";s:2:\"fr\";s:63:\"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";s:2:\"tw\";s:83:\"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。\";s:2:\"cn\";s:83:\"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。\";s:2:\"ar\";s:76:\"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.\";s:2:\"it\";s:57:\"Fornisce l\'editor WYSIWYG per PtroCMS creato con CKEditor\";}', '0', '0', '0', '0', '1', '1', '1', '1491668699');
INSERT INTO `default_modules` VALUES ('24', 'a:4:{s:2:\"en\";s:14:\"API Management\";s:2:\"el\";s:24:\"Διαχείριση API\";s:2:\"fr\";s:18:\"Gestionnaire d\'API\";s:2:\"hu\";s:12:\"API Kezelés\";}', 'api', '1.0.0', null, 'a:4:{s:2:\"en\";s:66:\"Set up a RESTful API with API Keys and out in JSON, XML, CSV, etc.\";s:2:\"el\";s:129:\"Ρυθμίσεις για ένα RESTful API με κλειδιά API και αποτελέσματα σε JSON, XML, CSV, κτλ.\";s:2:\"fr\";s:79:\"Paramétrage d\'une API RESTgul avec clés API et export en JSON, XML, CSV, etc.\";s:2:\"hu\";s:159:\"Körültekintően állítsd be az API-t (alkalmazásprogramozási felület) az API Kulcsokkal együtt és küldd JSON-ba, XML-be, CSV-be, vagy bármi egyébbe.\";}', '0', '1', '1', 'utilities', '0', '0', '0', '1491668699');
INSERT INTO `default_modules` VALUES ('27', 'a:2:{s:2:\"es\";s:17:\"Datos de Contacto\";s:2:\"en\";s:13:\"Contacts Data\";}', 'contact_us', '1.0', null, 'a:2:{s:2:\"es\";s:89:\"Modulo información de contacto © Brayan Acebo, Luis Fernando Salazar, Christian España\";s:2:\"en\";s:75:\"Manage Info Data © Christian España , Brayan Acebo, Luis fernando Salazar\";}', '0', '1', '1', 'content', '0', '0', '0', '1449673168');
INSERT INTO `default_modules` VALUES ('52', 'a:2:{s:2:\"es\";s:10:\"newsletter\";s:2:\"en\";s:10:\"newsletter\";}', 'newsletter', '1.2', null, 'a:2:{s:2:\"es\";s:10:\"newsletter\";s:2:\"en\";s:10:\"newsletter\";}', '0', '1', '1', 'content', '1', '1', '0', '1513803599');
INSERT INTO `default_modules` VALUES ('29', 'a:2:{s:2:\"es\";s:11:\"Propiedades\";s:2:\"en\";s:11:\"Propiedades\";}', 'properties', '1.0', null, 'a:2:{s:2:\"es\";s:18:\"Modulo Propiedades\";s:2:\"en\";s:18:\"Modulo Propiedades\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('30', 'a:2:{s:2:\"en\";s:7:\"banners\";s:2:\"es\";s:7:\"banners\";}', 'banners', '1.1', null, 'a:2:{s:2:\"en\";s:27:\"This is a module of banners\";s:2:\"es\";s:17:\"Modulo de banners\";}', '0', '1', '0', 'content', '1', '1', '0', '1455919915');
INSERT INTO `default_modules` VALUES ('31', 'a:2:{s:2:\"es\";s:20:\"Administrar usuarios\";s:2:\"en\";s:20:\"Administrar usuarios\";}', 'admin_users', '1.0', null, 'a:2:{s:2:\"es\";s:27:\"Modulo Administrar usuarios\";s:2:\"en\";s:27:\"Modulo Administrar usuarios\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('32', 'a:2:{s:2:\"en\";s:9:\"documents\";s:2:\"es\";s:9:\"documents\";}', 'documents', '1.1', null, 'a:2:{s:2:\"en\";s:29:\"This is a module of documents\";s:2:\"es\";s:19:\"Modulo de documents\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('33', 'a:2:{s:2:\"en\";s:8:\"services\";s:2:\"es\";s:8:\"services\";}', 'services', '1.1', null, 'a:2:{s:2:\"en\";s:28:\"This is a module of services\";s:2:\"es\";s:18:\"Modulo de services\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('34', 'a:2:{s:2:\"es\";s:15:\"Reunion virtual\";s:2:\"en\";s:15:\"Reunion virtual\";}', 'virtual_meeting', '1.0', null, 'a:2:{s:2:\"es\";s:22:\"Modulo Reunion virtual\";s:2:\"en\";s:22:\"Modulo Reunion virtual\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('37', 'a:1:{s:2:\"en\";s:6:\"Examen\";}', 'examen', '1.0.0', null, 'a:1:{s:2:\"en\";s:28:\"Examen © Jeyson Garcia 2015\";}', '0', '1', '0', '0', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('36', 'a:1:{s:2:\"en\";s:16:\"Examen_preguntas\";}', 'examen_preguntas', '1.0.0', null, 'a:1:{s:2:\"en\";s:38:\"Examen_preguntas © Jeyson Garcia 2015\";}', '0', '1', '0', '0', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('38', 'a:2:{s:2:\"en\";s:20:\"preguntas_frecuentes\";s:2:\"es\";s:20:\"preguntas_frecuentes\";}', 'preguntas_frecuentes', '1.1', null, 'a:2:{s:2:\"en\";s:40:\"This is a module of preguntas_frecuentes\";s:2:\"es\";s:30:\"Modulo de preguntas_frecuentes\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('39', 'a:2:{s:2:\"en\";s:12:\"clasificados\";s:2:\"es\";s:12:\"clasificados\";}', 'clasificados', '1.1', null, 'a:2:{s:2:\"en\";s:32:\"This is a module of clasificados\";s:2:\"es\";s:22:\"Modulo de clasificados\";}', '0', '1', '0', 'content', '1', '1', '0', '1454945455');
INSERT INTO `default_modules` VALUES ('40', 'a:2:{s:2:\"en\";s:4:\"news\";s:2:\"es\";s:4:\"news\";}', 'news', '1.1', null, 'a:2:{s:2:\"en\";s:24:\"This is a module of news\";s:2:\"es\";s:14:\"Modulo de news\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202873');
INSERT INTO `default_modules` VALUES ('41', 'a:2:{s:2:\"en\";s:8:\"reservas\";s:2:\"es\";s:8:\"reservas\";}', 'reservas', '1.1', null, 'a:2:{s:2:\"en\";s:28:\"This is a module of reservas\";s:2:\"es\";s:18:\"Modulo de reservas\";}', '0', '1', '0', 'content', '1', '1', '0', '1455202879');
INSERT INTO `default_modules` VALUES ('47', 'a:2:{s:2:\"es\";s:13:\"Publicaciones\";s:2:\"en\";s:13:\"Publicaciones\";}', 'publications', '1.1', null, 'a:2:{s:2:\"es\";s:13:\"Publicaciones\";s:2:\"en\";s:13:\"Publicaciones\";}', '0', '1', '1', 'content', '1', '1', '0', '1514385780');
INSERT INTO `default_modules` VALUES ('48', 'a:2:{s:2:\"es\";s:10:\"categories\";s:2:\"en\";s:10:\"categories\";}', 'categories', '1.0', null, 'a:2:{s:2:\"es\";s:11:\"categories \";s:2:\"en\";s:16:\"Basic categories\";}', '0', '0', '1', 'content', '1', '1', '0', '1494451161');
INSERT INTO `default_modules` VALUES ('49', 'a:2:{s:2:\"es\";s:4:\"shop\";s:2:\"en\";s:4:\"shop\";}', 'shop', '1.1', null, 'a:2:{s:2:\"es\";s:4:\"shop\";s:2:\"en\";s:4:\"shop\";}', '0', '1', '1', 'content', '1', '1', '0', '1498615080');
INSERT INTO `default_modules` VALUES ('51', 'a:2:{s:2:\"es\";s:4:\"Home\";s:2:\"en\";s:4:\"Home\";}', 'home', '1.1', null, 'a:2:{s:2:\"es\";s:15:\"©Jeyson_Garcia\";s:2:\"en\";s:15:\"©Jeyson_Garcia\";}', '0', '1', '1', 'content', '1', '1', '0', '1513731437');

-- ----------------------------
-- Table structure for `default_navigation_groups`
-- ----------------------------
DROP TABLE IF EXISTS `default_navigation_groups`;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_navigation_groups
-- ----------------------------
INSERT INTO `default_navigation_groups` VALUES ('1', 'Header', 'header');
INSERT INTO `default_navigation_groups` VALUES ('2', 'Sidebar', 'sidebar');
INSERT INTO `default_navigation_groups` VALUES ('3', 'Footer', 'footer');

-- ----------------------------
-- Table structure for `default_navigation_links`
-- ----------------------------
DROP TABLE IF EXISTS `default_navigation_links`;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_navigation_links
-- ----------------------------
INSERT INTO `default_navigation_links` VALUES ('2', 'Blog', null, 'module', null, 'blog', '', '', '1', '2', null, null, '');

-- ----------------------------
-- Table structure for `default_news`
-- ----------------------------
DROP TABLE IF EXISTS `default_news`;
CREATE TABLE `default_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `date` text COLLATE utf8_unicode_ci,
  `contenido` text COLLATE utf8_unicode_ci,
  `file` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_news
-- ----------------------------
INSERT INTO `default_news` VALUES ('2', '1', 'Nueva noticia ', '11/02/2016', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 'uploads/default/news/049b30cbf5dde6d92f43090aa30f952a.jpg', 'es');

-- ----------------------------
-- Table structure for `default_newsletter`
-- ----------------------------
DROP TABLE IF EXISTS `default_newsletter`;
CREATE TABLE `default_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_newsletter
-- ----------------------------

-- ----------------------------
-- Table structure for `default_newsletter_info`
-- ----------------------------
DROP TABLE IF EXISTS `default_newsletter_info`;
CREATE TABLE `default_newsletter_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `terms_cond` longtext COLLATE utf8_unicode_ci,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_newsletter_info
-- ----------------------------
INSERT INTO `default_newsletter_info` VALUES ('1', 'Terminos y condiciones', '<h3>El pasaje est&aacute;ndar Lorem Ipsum, usado desde el a&ntilde;o 1500.</h3>\r\n<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\r\n<h3>Secci&oacute;n 1.10.32 de \"de Finibus Bonorum et Malorum\", escrito por Cicero en el 45 antes de Cristo</h3>\r\n<p>\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\r\n<h3>Traducci&oacute;n hecha por H. Rackham en 1914</h3>\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '', '', 'es');

-- ----------------------------
-- Table structure for `default_pages`
-- ----------------------------
DROP TABLE IF EXISTS `default_pages`;
CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_pages
-- ----------------------------
INSERT INTO `default_pages` VALUES ('5', '404', '', 'Page missing', '404', '0', '1', '5', null, null, null, '', null, null, null, '0', '0', 'live', '1449514209', '0', '', '0', '1', '1449514209');

-- ----------------------------
-- Table structure for `default_page_types`
-- ----------------------------
DROP TABLE IF EXISTS `default_page_types`;
CREATE TABLE `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_page_types
-- ----------------------------
INSERT INTO `default_page_types` VALUES ('1', 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', '2', '', null, '', '<div class=\"row mt margin_login\">\r\n    <div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3\" style=\"height: 329px;\">\r\n\r\n        \r\n        <div class=\"box\">\r\n            <form action=\"http://localhost:8080/3bu/users/login\" method=\"post\" accept-charset=\"utf-8\" id=\"login\" class=\"form-signin box-body ng-pristine ng-valid\" novalidate=\"novalidate\">\r\n<div style=\"display:none;\">\r\n<input type=\"hidden\" name=\"redirect_to\" value=\"\">\r\n</div>            \r\n            <h1 class=\"text-center\"><img src=\"http://localhost:8080/3bu/addons/shared_addons/themes/picasso/img/logo-imaginamos.png\"></h1>\r\n            <div class=\"form-group has-feedback-left\">\r\n                <input type=\"email\" name=\"email\" value=\"\" class=\"form-control\" placeholder=\"E-mail\">\r\n                <span class=\"icon-user form-control-feedback\"></span>\r\n            </div>\r\n            <div class=\"form-group has-feedback-left\">\r\n                <input type=\"password\" name=\"password\" value=\"\" class=\"form-control\" placeholder=\"Password\">\r\n                <span class=\"icon-lock form-control-feedback\"></span>\r\n            </div>\r\n          \r\n            <div class=\"row mtop10\">\r\n                <div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12\">\r\n                    <label class=\"checkbox\" style=\"margin-top:0; line-height: 28px;\">\r\n                        <input name=\"remember\" type=\"checkbox\" value=\"remember-me\" style=\"margin-top: 8px;\"> Mantenerme conectado\r\n                    </label>                    \r\n                </div>\r\n                <div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12 boton-ingresar\">\r\n                    <button class=\"btn btn-primary\" type=\"submit\" style=\"width:100%; background-color:#ffc000 !important; color:#fff; font-size:16px !important\">Ingresar</button>\r\n                </div>\r\n                <div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12\">\r\n                    <a href=\"http://localhost:8080/3bu/users/reset_pass\" style=\"text-decoration:underline; display:block; line-height: 28px; font-size:16px !important\">Restablecer Contraseña</a>                    \r\n                </div>\r\n                <div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12 boton-crear\">\r\n                    <a href=\"http://localhost:8080/3bu/users/register\" class=\"btn btn-primary\">Crear Nueva Cuenta</a>\r\n                </div>\r\n            </div>\r\n            \r\n            </form>            \r\n        </div>\r\n    </div>\r\n</div>', '', '', '404.html', '1453648254', 'n', '', '');

-- ----------------------------
-- Table structure for `default_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `default_permissions`;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `default_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `default_profiles`;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dob` int(11) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  `documento_de_identidad` int(30) DEFAULT NULL,
  `imagen` char(15) COLLATE utf8_unicode_ci DEFAULT '403375b72b6aab4',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_profiles
-- ----------------------------
INSERT INTO `default_profiles` VALUES ('1', null, null, null, null, '1', 'Jeyson Garcia', 'Jeyson Andres', 'Garcia Carvajal', '711604800', '7555555', '3115274037', '1514493406', '1073511282', '47ae09a5ac9b5a5');
INSERT INTO `default_profiles` VALUES ('33', '2016-01-26 17:37:37', null, '1', '13', '34', 'prueba.conseje', 'Prueba', 'conseje', '0', null, '3115274037', '1457123260', '75315985', '403375b72b6aab4');
INSERT INTO `default_profiles` VALUES ('32', '2016-01-26 16:56:17', null, '1', '12', '32', 'de_la_rosa_meza_user', 'Zully ', 'De La Rosa Meza user', '0', null, '3115274037', '1453820341', '32800568', '403375b72b6aab4');
INSERT INTO `default_profiles` VALUES ('24', '2016-01-26 01:06:48', null, '1', '11', '24', 'prueba.imaginamos1', 'Prueba edicion', 'edit', '0', null, '3115274037', '1454943696', '1073511282', '403375b72b6aab4');
INSERT INTO `default_profiles` VALUES ('34', '2016-03-04 20:09:20', null, '2', '14', '35', 'ballesteros', 'valentina', 'ballesteros', null, null, '3142556789', null, '13245678', '403375b72b6aab4');
INSERT INTO `default_profiles` VALUES ('35', '2016-07-25 16:29:44', null, '1', '15', '36', 'Super Adminstrador', 'Gerente', 'Dash', '0', null, '555555555', '1469836046', '123456789', '403375b72b6aab4');
INSERT INTO `default_profiles` VALUES ('41', '2017-07-11 14:26:53', null, null, '16', '2', 'luis.puerto', 'luis', 'puerto', null, null, null, null, null, '403375b72b6aab4');
INSERT INTO `default_profiles` VALUES ('42', '2017-12-29 09:08:23', null, null, '17', '3', 'chloe.mindfor', 'Chloe', 'Mindfor', '-68400', null, null, '1514574868', null, '12d67fbc920f42c');
INSERT INTO `default_profiles` VALUES ('43', '2017-12-29 09:35:56', null, null, '18', '4', 'max.saens', 'Max', 'Saens', '-68400', null, null, '1514576450', null, '14e0088d6e8b9b5');

-- ----------------------------
-- Table structure for `default_properties`
-- ----------------------------
DROP TABLE IF EXISTS `default_properties`;
CREATE TABLE `default_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `private_area` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_properties
-- ----------------------------

-- ----------------------------
-- Table structure for `default_publications`
-- ----------------------------
DROP TABLE IF EXISTS `default_publications`;
CREATE TABLE `default_publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `subcategoria` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `marca_moto` varchar(255) DEFAULT NULL,
  `ano` varchar(255) DEFAULT NULL,
  `kilometraje` varchar(255) DEFAULT NULL,
  `cilindraje` varchar(255) DEFAULT NULL,
  `condicion` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `tipo_vivienda` varchar(255) DEFAULT NULL,
  `cuartos` varchar(255) DEFAULT NULL,
  `banos` varchar(255) DEFAULT NULL,
  `garajes` varchar(255) DEFAULT NULL,
  `mts` varchar(255) DEFAULT NULL,
  `antiguedad` varchar(255) DEFAULT NULL,
  `estrato` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `precio_real` varchar(255) NOT NULL,
  `precio_ganga` varchar(255) NOT NULL,
  `plan` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT '0',
  `destacado` int(11) DEFAULT '0',
  `sello_calidad` int(11) DEFAULT '0',
  `shiping` int(11) DEFAULT '0',
  `comprador_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of default_publications
-- ----------------------------
INSERT INTO `default_publications` VALUES ('1', '1', '1', '3', 'Hyundai Como Nuevo', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '20', null, '2017', '1400', null, '1', 'Azul', 'abc-123', null, null, null, null, null, null, null, null, null, null, '80000000', '50000000', '1', '2017-05-15 14:11:08', '1', '1', '0', '0', '0');
INSERT INTO `default_publications` VALUES ('2', '1', '1', '2', 'BMW en perfecto estado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', null, 'BMW', '2017', '7000', '250', '2', 'Negro', 'HTG-124', null, null, null, null, null, null, null, null, null, null, '110000000', '80000000', '2', '2017-05-15 14:24:37', '1', '1', '1', '0', '4');
INSERT INTO `default_publications` VALUES ('3', '1', '7', '8', 'Casa Lote', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', null, null, null, null, null, null, null, null, 'casas', '3', '1', '1', '40', '10', '3', 'Bogotá', 'Cundinamarca', 'Cra 87 a N 56 c 20', '130000000', '90000000', '3', '2017-05-15 16:05:27', '1', '1', '0', '0', '0');
INSERT INTO `default_publications` VALUES ('4', '2', '1', '3', 'mazda cx7 urgente vendo', 'mazda cx7 modelo 2008 kilometraje 120,000  version 2,3 turbo', '2', null, '2008', '120.000', null, '2', 'negro', '164', null, null, null, null, null, null, null, null, null, null, '44000000', '36000000', '3', '2017-07-11 14:57:43', '1', '1', '0', '0', '0');
INSERT INTO `default_publications` VALUES ('5', '2', '1', '2', 'BMW serie 6', 'fcercreca', null, 'Ayco', '2009', '667778', '5667', '2', 'jkhl', 'uto', null, null, null, null, null, null, null, null, null, null, '678900999', '5', '3', '2017-07-11 16:08:31', '1', '0', '0', '0', '0');
INSERT INTO `default_publications` VALUES ('6', '2', '1', '3', 'remato mazda cx7 urgente', 'perfecto estado papeles AL DIA NUNCA ESTRELLADA', '29', null, '2017', '-3', null, '1', '', '', null, null, null, null, null, null, null, null, null, null, '15000000', '10000000', '3', '2017-07-31 12:27:12', '0', '0', '0', '0', '0');
INSERT INTO `default_publications` VALUES ('7', '1', '1', '3', 'Bugatti veyron ', 'El Bugatti Veyron EB 16.4 es un automóvil superdeportivo diseñado y desarrollado por el Grupo Volkswagen y producido en Molsheim, Francia por Bugatti Automobiles S.A.S. desde 2001. La versión básica del coche (Veyron 16.4) se fabricó hasta 2011, y más tarde las versiones Grand Sport y Super Sport se iniciaron en 2009 y 2010. En el episodio final de la temporada 14 durante el \"Top Gear Awards Ceremony\", Clarkson decidió que, siendo el final de una década (2000-2010), deberían premiar también el \'Coche de la Década\'. Clarkson comentó que el ganador de este premio tenía que ser el Bugatti Veyron, el único coche merecedor. Desde que el formato de Top Gear comenzara a principios de la década de los \'00, solo se ha otorgado una vez este premio.', '17', null, '2017', '25000', null, '2', 'Negro', 'abc026', null, null, null, null, null, null, null, null, null, null, '1800000000', '970000000', '3', '2017-12-26 13:59:31', '3', '1', '1', '1', '4');
INSERT INTO `default_publications` VALUES ('8', '1', '1', '3', 'Porsche Cayman GT4', 'El Porsche Cayman es un automóvil deportivo de dos asientos con tracción trasera y motor en posición central producido por Porsche AG de Alemania desde el año 2006. El Cayman es un coupé derivado del convertible Boxster. A mediados de 2016 el Cayman pasó a denomnarse 718 Cayman.', '36', null, '2016', '68000', null, '2', 'Blanco lineas rojas', 'WGT856', null, null, null, null, null, null, null, null, null, null, '560000000', '320000000', '2', '2017-12-26 14:20:16', '1', '1', '1', '0', '4');

-- ----------------------------
-- Table structure for `default_questions`
-- ----------------------------
DROP TABLE IF EXISTS `default_questions`;
CREATE TABLE `default_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `publication_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_questions
-- ----------------------------
INSERT INTO `default_questions` VALUES ('1', '3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1', '::1', '2017-12-29 12:31:53', '1');
INSERT INTO `default_questions` VALUES ('2', '4', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth', '1', '::1', '2017-12-29 12:14:54', '2');
INSERT INTO `default_questions` VALUES ('3', '4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', '7', '::1', '2018-01-02 09:55:23', '1');
INSERT INTO `default_questions` VALUES ('4', '4', 'Esta es una pregunta de prueba ', '2', '::1', '2018-01-02 10:21:43', '1');
INSERT INTO `default_questions` VALUES ('5', '4', 'dfasdfkasdfbsdkjbfkajsdbfjkasdbfj', '2', '::1', '2018-01-02 11:19:06', '2');
INSERT INTO `default_questions` VALUES ('6', '4', 'Pregunta de prueba para respuesta eliminada ', '8', '::1', '2018-01-02 11:22:15', '1');

-- ----------------------------
-- Table structure for `default_redirects`
-- ----------------------------
DROP TABLE IF EXISTS `default_redirects`;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_redirects
-- ----------------------------

-- ----------------------------
-- Table structure for `default_results`
-- ----------------------------
DROP TABLE IF EXISTS `default_results`;
CREATE TABLE `default_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reunion_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuesta_id` int(11) NOT NULL,
  `observacion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of default_results
-- ----------------------------
INSERT INTO `default_results` VALUES ('9', '32', '1', '2', '11', 'sdagdafgsdfgsdfg');
INSERT INTO `default_results` VALUES ('10', '32', '1', '3', '6', 'fdgsdfgsdfgdsfgsdfg');

-- ----------------------------
-- Table structure for `default_result_user`
-- ----------------------------
DROP TABLE IF EXISTS `default_result_user`;
CREATE TABLE `default_result_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reunion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of default_result_user
-- ----------------------------
INSERT INTO `default_result_user` VALUES ('3', '32', '1');

-- ----------------------------
-- Table structure for `default_search_index`
-- ----------------------------
DROP TABLE IF EXISTS `default_search_index`;
CREATE TABLE `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_search_index
-- ----------------------------
INSERT INTO `default_search_index` VALUES ('5', 'Page missing', '', null, null, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5');
INSERT INTO `default_search_index` VALUES ('11', 'prueba', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', null, null, 'blog', 'blog:post', 'blog:posts', '1', 'blog/2017/12/prueba', 'admin/blog/edit/1', 'admin/blog/delete/1');

-- ----------------------------
-- Table structure for `default_settings`
-- ----------------------------
DROP TABLE IF EXISTS `default_settings`;
CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_settings
-- ----------------------------
INSERT INTO `default_settings` VALUES ('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '1', '0=activate_by_admin|1=activate_by_email|2=no_activation', '0', '1', 'users', '961');
INSERT INTO `default_settings` VALUES ('addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', '1', '0', '', '0');
INSERT INTO `default_settings` VALUES ('admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', '1', '1', '', '0');
INSERT INTO `default_settings` VALUES ('admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', '1', '0', '', '0');
INSERT INTO `default_settings` VALUES ('akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', '0', '1', 'integration', '981');
INSERT INTO `default_settings` VALUES ('api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '0', '0=Disabled|1=Enabled', '0', '0', 'api', '0');
INSERT INTO `default_settings` VALUES ('api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', '0', '0', 'api', '0');
INSERT INTO `default_settings` VALUES ('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', '0', '1', 'users', '964');
INSERT INTO `default_settings` VALUES ('cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', '0', '1', 'integration', '1000');
INSERT INTO `default_settings` VALUES ('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(\'textarea#intro.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'pyroimages\'],\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	extraPlugins: \'pyroimages\',\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(\'textarea.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(\'textarea.wysiwyg-advanced\').ckeditor({\r\n	toolbar: [\r\n		[\'Maximize\'],\r\n		[\'pyroimages\', \'pyrofiles\'],\r\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\r\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\r\n		[\'Link\',\'Unlink\'],\r\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\r\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\r\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\r\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	],\r\n	extraPlugins: \'pyroimages,pyrofiles\',\r\n	width: \'99%\',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	removePlugins: \'elementspath\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});', '', '1', '1', 'wysiwyg', '993');
INSERT INTO `default_settings` VALUES ('comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', '1', '1', 'comments', '965');
INSERT INTO `default_settings` VALUES ('comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', '1', '1', 'comments', '966');
INSERT INTO `default_settings` VALUES ('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'jeyson.garcia@imaginamos.com.co', '', '', '1', '1', 'email', '979');
INSERT INTO `default_settings` VALUES ('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', '1', '1', '', '994');
INSERT INTO `default_settings` VALUES ('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', '0', '1', '', '990');
INSERT INTO `default_settings` VALUES ('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', '1', '1', '', '989');
INSERT INTO `default_settings` VALUES ('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', '1', '1', '', '995');
INSERT INTO `default_settings` VALUES ('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'gangaweb', 'func:get_themes', '1', '0', '', '0');
INSERT INTO `default_settings` VALUES ('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '0', '1=Enabled|0=Disabled', '1', '1', 'comments', '968');
INSERT INTO `default_settings` VALUES ('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', '1', '1', 'users', '963');
INSERT INTO `default_settings` VALUES ('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', '0', '1', 'users', '961');
INSERT INTO `default_settings` VALUES ('files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', '1', '1', 'files', '986');
INSERT INTO `default_settings` VALUES ('files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', '0', '1', 'files', '989');
INSERT INTO `default_settings` VALUES ('files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>', 'text', '', '', '', '0', '1', 'files', '990');
INSERT INTO `default_settings` VALUES ('files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', '0', '1', 'files', '994');
INSERT INTO `default_settings` VALUES ('files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>', 'text', '', '', '', '0', '1', 'files', '993');
INSERT INTO `default_settings` VALUES ('files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', '1', '1', 'files', '991');
INSERT INTO `default_settings` VALUES ('files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', '0', '1', 'files', '992');
INSERT INTO `default_settings` VALUES ('files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon\'s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', '0', '1', 'files', '991');
INSERT INTO `default_settings` VALUES ('files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', '1', '1', 'files', '987');
INSERT INTO `default_settings` VALUES ('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', '1', '1', '', '988');
INSERT INTO `default_settings` VALUES ('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', '0', '1', 'integration', '983');
INSERT INTO `default_settings` VALUES ('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href=\"https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US\" target=\"_blank\">Authorized Access to your Google Account</a>', 'password', '', '', '', '0', '1', 'integration', '982');
INSERT INTO `default_settings` VALUES ('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', '0', '1', 'integration', '984');
INSERT INTO `default_settings` VALUES ('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', '0', '1', 'integration', '985');
INSERT INTO `default_settings` VALUES ('mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', '0', '1', 'email', '972');
INSERT INTO `default_settings` VALUES ('mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', '1', '1', 'email', '977');
INSERT INTO `default_settings` VALUES ('mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', '0', '1', 'email', '972');
INSERT INTO `default_settings` VALUES ('mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', '0', '1', 'email', '976');
INSERT INTO `default_settings` VALUES ('mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', '0', '1', 'email', '975');
INSERT INTO `default_settings` VALUES ('mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', '0', '1', 'email', '974');
INSERT INTO `default_settings` VALUES ('mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', '0', '1', 'email', '973');
INSERT INTO `default_settings` VALUES ('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', '', '', '0', '1', '', '998');
INSERT INTO `default_settings` VALUES ('moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '0', '1=Enabled|0=Disabled', '1', '1', 'comments', '967');
INSERT INTO `default_settings` VALUES ('profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', '0', '1', 'users', '960');
INSERT INTO `default_settings` VALUES ('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', '1', '1', '', '992');
INSERT INTO `default_settings` VALUES ('registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', '0', '1', 'users', '962');
INSERT INTO `default_settings` VALUES ('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', '1', '1', '', '991');
INSERT INTO `default_settings` VALUES ('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', '1', '1', 'email', '978');
INSERT INTO `default_settings` VALUES ('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'es', 'func:get_supported_lang', '1', '1', '', '997');
INSERT INTO `default_settings` VALUES ('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'Ganga web', '', '1', '1', '', '1000');
INSERT INTO `default_settings` VALUES ('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'es', 'func:get_supported_lang', '1', '1', '', '996');
INSERT INTO `default_settings` VALUES ('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', '', '', '0', '1', '', '999');
INSERT INTO `default_settings` VALUES ('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', '0', '1', '', '987');

-- ----------------------------
-- Table structure for `default_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `default_shipping`;
CREATE TABLE `default_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `publication_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for `default_theme_options`
-- ----------------------------
DROP TABLE IF EXISTS `default_theme_options`;
CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_theme_options
-- ----------------------------
INSERT INTO `default_theme_options` VALUES ('1', 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('2', 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('3', 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('4', 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms');
INSERT INTO `default_theme_options` VALUES ('5', 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'default');
INSERT INTO `default_theme_options` VALUES ('6', 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', '2 column', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', '1', 'default');
INSERT INTO `default_theme_options` VALUES ('7', 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_original');
INSERT INTO `default_theme_options` VALUES ('8', 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_original');
INSERT INTO `default_theme_options` VALUES ('9', 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_original');
INSERT INTO `default_theme_options` VALUES ('10', 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_original');
INSERT INTO `default_theme_options` VALUES ('11', 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'fabric', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('12', 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('13', 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('14', 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'base');
INSERT INTO `default_theme_options` VALUES ('15', 'framework', 'Framework', 'Cambia el framework css', 'select', 'Picasso', 'Picasso', 'frameworks/materialize = Materialize CSS | frameworks/bootstrap = Boostrap 3 | framework/foundation = Foundation 5', '1', 'picasso');
INSERT INTO `default_theme_options` VALUES ('16', 'jquery', 'Versión Jquery', 'Cambia el la versión de Jquery', 'select', 'Picasso', 'Picasso', 'libs/jquery/jquery-1.11.0 = 1.11.0 | libs/jquery/jquery-1.9.1 = 1.9.1', '1', 'picasso');
INSERT INTO `default_theme_options` VALUES ('17', 'theme', 'Tema', 'Cambia el tema predeterminado', 'select', 'Picasso', 'Picasso', 'themes/default = Default | themes/custom = Custom', '1', 'picasso');
INSERT INTO `default_theme_options` VALUES ('18', 'tipo', 'Tipografía', 'Cambia la tipografía del sitio', 'select', 'Picasso', 'Picasso', 'variations/style1/default = Default | style1/tipo = Estilo 1 | style2/tipo = Estilo 2 | style3/tipo = Estilo 3', '1', 'picasso');
INSERT INTO `default_theme_options` VALUES ('19', 'show_acordeon', 'Habilitar destacados en acordeón', 'Si selecciones si, se mostraran los destacados como un acordeon.', 'radio', 'no', 'no', 'yes=Yes|no=No', '0', 'picasso');
INSERT INTO `default_theme_options` VALUES ('20', 'showmenu_footer', 'Habilita el menú del footer', 'Si selecciones si, se mostraran la navegación en el footer.', 'radio', 'no', 'no', 'yes=Yes|no=No', '0', 'picasso');
INSERT INTO `default_theme_options` VALUES ('21', 'aboutus', 'Quienes Somos', 'Cambia el layout de Quienes Somos', 'select', 'Picasso', 'Picasso', 'variations/style1/default = Default | variations/style1/aboutus = Estilo 1 | variations/style2/aboutus = Estilo 2 | variations/style3/aboutus = Estilo 3', '1', 'picasso');
INSERT INTO `default_theme_options` VALUES ('22', 'show_modernlayout', 'Habilitar destacados en acordeón', 'Si selecciones si, se mostraran los destacados como un acordeon.', 'radio', 'no', 'no', 'yes=Yes|no=No', '0', 'picasso');
INSERT INTO `default_theme_options` VALUES ('23', 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_imaginamos');
INSERT INTO `default_theme_options` VALUES ('24', 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_imaginamos');
INSERT INTO `default_theme_options` VALUES ('25', 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_imaginamos');
INSERT INTO `default_theme_options` VALUES ('26', 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', '1', 'pyrocms_imaginamos');
INSERT INTO `default_theme_options` VALUES ('27', 'framework', 'Framework', 'Cambia el framework css', 'select', 'Gangaweb', 'Gangaweb', 'frameworks/materialize = Materialize CSS | frameworks/bootstrap = Boostrap 3 | framework/foundation = Foundation 5', '1', 'gangaweb');

-- ----------------------------
-- Table structure for `default_users`
-- ----------------------------
DROP TABLE IF EXISTS `default_users`;
CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';

-- ----------------------------
-- Records of default_users
-- ----------------------------
INSERT INTO `default_users` VALUES ('1', 'jeysongar@gmail.com', '9b49f8bab694daedff56d9cd8bf5028c06971410', '7cbe15', '1', '', '1', '', '1449514192', '1514928223', 'jeysongar', 'ea61c4b8aacec15a2ffb40b81e83c994b5263489', '7886d011f8a75b677af36a4d9c09cb50487a078d');
INSERT INTO `default_users` VALUES ('2', 'puertolu@hotmail.com', 'afcf3ee2062157cf0fd1e8a289731ed263e907e3', '73259b', '2', '181.49.139.222', '1', '', '1499819213', '1502259054', 'luis.puerto', null, null);
INSERT INTO `default_users` VALUES ('3', 'jeyson.garcia@hotmail.com', '309d395fb18eb032cf09e8376a3e49258b3b6604', '1d489c', '2', '::1', '1', 'db7c323c3f431381cc342904dcfda4839266b80f', '1514574502', '1514574596', 'chloe.mindfor', null, null);
INSERT INTO `default_users` VALUES ('4', 'prueba@prueba.com', '5dfaa41007a7e9c73085d854f736d6d5c37f1dc9', 'e673ed', '2', '::1', '1', 'fd2cde649e89188dd736cff186124682ffc2c2ce', '1514576156', '1514923103', 'max.saens', null, null);

-- ----------------------------
-- Table structure for `default_users_notifications`
-- ----------------------------
DROP TABLE IF EXISTS `default_users_notifications`;
CREATE TABLE `default_users_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `publication_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `process` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_users_notifications
-- ----------------------------
INSERT INTO `default_users_notifications` VALUES ('1', '1', '7', '¡Felicitaciones! su publicación  \"Bugatti veyron\" ha sido puesta a la venta esperamos que tengas muchas ofertas gracias por contar con nosotros.', 'acepto', '1');
INSERT INTO `default_users_notifications` VALUES ('2', '1', '8', 'Disculpa las molestias! Tu publicación no pudo ser colocada en nuestra pagina web ya que la placa de tu vehículo esta mal te daremos la oportunidad de cambiarla y volver a hacer la solicitud perdona por los inconvenientes', 'declino', '1');
INSERT INTO `default_users_notifications` VALUES ('3', '1', '8', 'Proceso Exitoso! Su publicacion fue editada con exito uno de nuestros administradores revisara su solicitud lo mas pronto posible gracias por contar con nosotros', 'in_progress', '1');
INSERT INTO `default_users_notifications` VALUES ('4', '1', '8', 'Proceso Exitoso! Su publicacion fue editada con exito uno de nuestros administradores revisara su solicitud lo mas pronto posible gracias por contar con nosotros', 'in_progress', '1');
INSERT INTO `default_users_notifications` VALUES ('5', '1', '2', 'Proceso Exitoso! Su publicacion fue editada con exito uno de nuestros administradores revisara su solicitud lo mas pronto posible gracias por contar con nosotros', 'in_progress', '1');
INSERT INTO `default_users_notifications` VALUES ('6', '1', '2', 'Su petición de edición fue exitosa! su publicación \"BMW en perfecto estado\" ha sido puesta a la venta esperamos que tengas muchas ofertas gracias por contar con nosotros.', 'acepto', '1');
INSERT INTO `default_users_notifications` VALUES ('7', '1', '8', '¡Felicitaciones! su publicación  \"Porsche Cayman GT4\" ha sido puesta a la venta esperamos que tengas muchas ofertas gracias por contar con nosotros.', 'acepto', '1');
INSERT INTO `default_users_notifications` VALUES ('8', '1', '7', 'Una persona tiene una pregunta respecto a tu producto \"Bugatti veyron \"', 'question-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('9', '1', '1', 'Una persona tiene una respuesta respecto a tu producto \"Hyundai Como Nuevo\"', 'answer-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('10', '1', '1', 'La respuesta del producto \"Hyundai Como Nuevo\" no cumple con nuestros terminos y condiciones reformula la pregunta o ponte en contacto con servicio al cliente', 'answer-delete', '1');
INSERT INTO `default_users_notifications` VALUES ('11', '1', '7', 'La respuesta del producto \"Bugatti veyron \" no cumple con nuestros terminos y condiciones reformula la pregunta o ponte en contacto con servicio al cliente', 'answer-delete', '1');
INSERT INTO `default_users_notifications` VALUES ('12', '1', '2', 'Una persona tiene una pregunta respecto a tu producto \"BMW en perfecto estado\"', 'question-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('13', '1', '2', 'Una persona tiene una respuesta respecto a tu producto \"BMW en perfecto estado\"', 'answer-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('14', '1', '2', 'Una persona tiene una respuesta respecto al producto \"BMW en perfecto estado\"', 'answer-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('15', '1', '2', 'Una persona tiene una respuesta respecto al producto \"BMW en perfecto estado\"', 'answer-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('16', '4', '2', 'Una persona tiene una respuesta respecto al producto \"BMW en perfecto estado\"', 'answer-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('17', '4', '2', 'La pregunta del producto \"BMW en perfecto estado\" no cumple con nuestros terminos y condiciones reformula la pregunta o ponte en contacto con servicio al cliente', 'question-delete', '1');
INSERT INTO `default_users_notifications` VALUES ('18', '1', '8', 'Una persona tiene una pregunta respecto a tu producto \"Porsche Cayman GT4\"', 'question-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('19', '1', '8', 'La respuesta del producto \"Porsche Cayman GT4\" no cumple con nuestros terminos y condiciones reformula la respuesta o ponte en contacto con servicio al cliente', 'answer-delete', '1');
INSERT INTO `default_users_notifications` VALUES ('20', '1', '8', 'La respuesta del producto \"Porsche Cayman GT4\" no cumple con nuestros terminos y condiciones reformula la respuesta o ponte en contacto con servicio al cliente', 'answer-delete', '1');
INSERT INTO `default_users_notifications` VALUES ('21', '6', '8', 'Hola! tienes una respuesta del producto \"Porsche Cayman GT4\"', 'answer-ok', '0');
INSERT INTO `default_users_notifications` VALUES ('22', '6', '8', 'Hola! tienes una respuesta del producto \"Porsche Cayman GT4\"', 'answer-ok', '0');
INSERT INTO `default_users_notifications` VALUES ('23', '4', '8', 'Hola! tienes una respuesta del producto \"Porsche Cayman GT4\"', 'answer-ok', '1');
INSERT INTO `default_users_notifications` VALUES ('24', '4', '7', 'Proceso exitoso! Tu peticion de compra fue enviada pronto uno de nuestros acesores se pondra en contacto con tigo para el proceso de compra', 'ok', '1');
INSERT INTO `default_users_notifications` VALUES ('25', '4', '2', 'Proceso exitoso! Tu peticion de compra fue enviada pronto uno de nuestros acesores se pondra en contacto con tigo para el proceso de compra', 'ok', '1');
INSERT INTO `default_users_notifications` VALUES ('26', '4', '7', 'Perdona las molestias! Nos comunicamos con el dueño del producto y nos dijo que lamentablemente el producto no esta disponible y por ende no podemos seguir con el proceso de compra sentimos que halla ocurrido esto te invitamos a que revises nuestra gran variedad de productos y encuentres el que mas desees', 'no-disponible', '1');
INSERT INTO `default_users_notifications` VALUES ('27', '4', '7', 'Esto es una prueba para no disponible ', 'no-disponible', '1');
INSERT INTO `default_users_notifications` VALUES ('28', '1', '7', 'Gracias por comprar con nosotros', 'termino', '1');
INSERT INTO `default_users_notifications` VALUES ('29', '4', '7', 'El vehículo ya es tullo felicidades ', 'termino', '1');

-- ----------------------------
-- Table structure for `default_variables`
-- ----------------------------
DROP TABLE IF EXISTS `default_variables`;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_variables
-- ----------------------------

-- ----------------------------
-- Table structure for `default_widgets`
-- ----------------------------
DROP TABLE IF EXISTS `default_widgets`;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_widgets
-- ----------------------------
INSERT INTO `default_widgets` VALUES ('1', 'google_maps', 'a:10:{s:2:\"en\";s:11:\"Google Maps\";s:2:\"el\";s:19:\"Χάρτης Google\";s:2:\"nl\";s:11:\"Google Maps\";s:2:\"br\";s:11:\"Google Maps\";s:2:\"pt\";s:11:\"Google Maps\";s:2:\"ru\";s:17:\"Карты Google\";s:2:\"id\";s:11:\"Google Maps\";s:2:\"fi\";s:11:\"Google Maps\";s:2:\"fr\";s:11:\"Google Maps\";s:2:\"fa\";s:17:\"نقشه گوگل\";}', 'a:10:{s:2:\"en\";s:32:\"Display Google Maps on your site\";s:2:\"el\";s:78:\"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας\";s:2:\"nl\";s:27:\"Toon Google Maps in uw site\";s:2:\"br\";s:34:\"Mostra mapas do Google no seu site\";s:2:\"pt\";s:34:\"Mostra mapas do Google no seu site\";s:2:\"ru\";s:80:\"Выводит карты Google на страницах вашего сайта\";s:2:\"id\";s:37:\"Menampilkan Google Maps di Situs Anda\";s:2:\"fi\";s:39:\"Näytä Google Maps kartta sivustollasi\";s:2:\"fr\";s:42:\"Publiez un plan Google Maps sur votre site\";s:2:\"fa\";s:59:\"نمایش داده نقشه گوگل بر روی سایت \";}', 'Gregory Athons', 'http://www.gregathons.com', '1.0.0', '1', '1', '1513796168');
INSERT INTO `default_widgets` VALUES ('2', 'html', 's:4:\"HTML\";', 'a:10:{s:2:\"en\";s:28:\"Create blocks of custom HTML\";s:2:\"el\";s:80:\"Δημιουργήστε περιοχές με δικό σας κώδικα HTML\";s:2:\"br\";s:41:\"Permite criar blocos de HTML customizados\";s:2:\"pt\";s:41:\"Permite criar blocos de HTML customizados\";s:2:\"nl\";s:30:\"Maak blokken met maatwerk HTML\";s:2:\"ru\";s:83:\"Создание HTML-блоков с произвольным содержимым\";s:2:\"id\";s:24:\"Membuat blok HTML apapun\";s:2:\"fi\";s:32:\"Luo lohkoja omasta HTML koodista\";s:2:\"fr\";s:36:\"Créez des blocs HTML personnalisés\";s:2:\"fa\";s:58:\"ایجاد قسمت ها به صورت اچ تی ام ال\";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', '1', '2', '1513796168');
INSERT INTO `default_widgets` VALUES ('3', 'login', 'a:10:{s:2:\"en\";s:5:\"Login\";s:2:\"el\";s:14:\"Σύνδεση\";s:2:\"nl\";s:5:\"Login\";s:2:\"br\";s:5:\"Login\";s:2:\"pt\";s:5:\"Login\";s:2:\"ru\";s:22:\"Вход на сайт\";s:2:\"id\";s:5:\"Login\";s:2:\"fi\";s:13:\"Kirjautuminen\";s:2:\"fr\";s:9:\"Connexion\";s:2:\"fa\";s:10:\"لاگین\";}', 'a:10:{s:2:\"en\";s:36:\"Display a simple login form anywhere\";s:2:\"el\";s:96:\"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε\";s:2:\"br\";s:69:\"Permite colocar um formulário de login em qualquer lugar do seu site\";s:2:\"pt\";s:69:\"Permite colocar um formulário de login em qualquer lugar do seu site\";s:2:\"nl\";s:32:\"Toon overal een simpele loginbox\";s:2:\"ru\";s:72:\"Выводит простую форму для входа на сайт\";s:2:\"id\";s:32:\"Menampilkan form login sederhana\";s:2:\"fi\";s:52:\"Näytä yksinkertainen kirjautumislomake missä vain\";s:2:\"fr\";s:54:\"Affichez un formulaire de connexion où vous souhaitez\";s:2:\"fa\";s:70:\"نمایش یک لاگین ساده در هر قسمتی از سایت\";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', '1', '3', '1513796168');
INSERT INTO `default_widgets` VALUES ('4', 'navigation', 'a:10:{s:2:\"en\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"fi\";s:10:\"Navigaatio\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"fa\";s:10:\"منوها\";}', 'a:10:{s:2:\"en\";s:40:\"Display a navigation group with a widget\";s:2:\"el\";s:100:\"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο\";s:2:\"nl\";s:38:\"Toon een navigatiegroep met een widget\";s:2:\"br\";s:62:\"Exibe um grupo de links de navegação como widget em seu site\";s:2:\"pt\";s:62:\"Exibe um grupo de links de navegação como widget no seu site\";s:2:\"ru\";s:88:\"Отображает навигационную группу внутри виджета\";s:2:\"id\";s:44:\"Menampilkan grup navigasi menggunakan widget\";s:2:\"fi\";s:37:\"Näytä widgetillä navigaatio ryhmä\";s:2:\"fr\";s:47:\"Affichez un groupe de navigation dans un widget\";s:2:\"fa\";s:71:\"نمایش گروهی از منوها با استفاده از ویجت\";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', '1', '4', '1513796168');
INSERT INTO `default_widgets` VALUES ('5', 'rss_feed', 'a:10:{s:2:\"en\";s:8:\"RSS Feed\";s:2:\"el\";s:24:\"Τροφοδοσία RSS\";s:2:\"nl\";s:8:\"RSS Feed\";s:2:\"br\";s:8:\"Feed RSS\";s:2:\"pt\";s:8:\"Feed RSS\";s:2:\"ru\";s:31:\"Лента новостей RSS\";s:2:\"id\";s:8:\"RSS Feed\";s:2:\"fi\";s:10:\"RSS Syöte\";s:2:\"fr\";s:8:\"Flux RSS\";s:2:\"fa\";s:19:\"خبر خوان RSS\";}', 'a:10:{s:2:\"en\";s:41:\"Display parsed RSS feeds on your websites\";s:2:\"el\";s:82:\"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS\";s:2:\"nl\";s:28:\"Toon RSS feeds op uw website\";s:2:\"br\";s:48:\"Interpreta e exibe qualquer feed RSS no seu site\";s:2:\"pt\";s:48:\"Interpreta e exibe qualquer feed RSS no seu site\";s:2:\"ru\";s:94:\"Выводит обработанную ленту новостей на вашем сайте\";s:2:\"id\";s:42:\"Menampilkan kutipan RSS feed di situs Anda\";s:2:\"fi\";s:39:\"Näytä purettu RSS syöte sivustollasi\";s:2:\"fr\";s:39:\"Affichez un flux RSS sur votre site web\";s:2:\"fa\";s:46:\"نمایش خوراک های RSS در سایت\";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', '1', '5', '1513796168');
INSERT INTO `default_widgets` VALUES ('6', 'social_bookmark', 'a:10:{s:2:\"en\";s:15:\"Social Bookmark\";s:2:\"el\";s:35:\"Κοινωνική δικτύωση\";s:2:\"nl\";s:19:\"Sociale Bladwijzers\";s:2:\"br\";s:15:\"Social Bookmark\";s:2:\"pt\";s:15:\"Social Bookmark\";s:2:\"ru\";s:37:\"Социальные закладки\";s:2:\"id\";s:15:\"Social Bookmark\";s:2:\"fi\";s:24:\"Sosiaalinen kirjanmerkki\";s:2:\"fr\";s:13:\"Liens sociaux\";s:2:\"fa\";s:52:\"بوکمارک های شبکه های اجتماعی\";}', 'a:10:{s:2:\"en\";s:47:\"Configurable social bookmark links from AddThis\";s:2:\"el\";s:111:\"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis\";s:2:\"nl\";s:43:\"Voeg sociale bladwijzers toe vanuit AddThis\";s:2:\"br\";s:87:\"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações\";s:2:\"pt\";s:87:\"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações\";s:2:\"ru\";s:90:\"Конфигурируемые социальные закладки с сайта AddThis\";s:2:\"id\";s:60:\"Tautan social bookmark yang dapat dikonfigurasi dari AddThis\";s:2:\"fi\";s:59:\"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä\";s:2:\"fr\";s:43:\"Liens sociaux personnalisables avec AddThis\";s:2:\"fa\";s:71:\"تنظیم و نمایش لینک های شبکه های اجتماعی\";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', '1', '6', '1513796168');
INSERT INTO `default_widgets` VALUES ('7', 'archive', 'a:8:{s:2:\"en\";s:7:\"Archive\";s:2:\"br\";s:15:\"Arquivo do Blog\";s:2:\"fa\";s:10:\"آرشیو\";s:2:\"pt\";s:15:\"Arquivo do Blog\";s:2:\"el\";s:33:\"Αρχείο Ιστολογίου\";s:2:\"fr\";s:16:\"Archives du Blog\";s:2:\"ru\";s:10:\"Архив\";s:2:\"id\";s:7:\"Archive\";}', 'a:8:{s:2:\"en\";s:64:\"Display a list of old months with links to posts in those months\";s:2:\"br\";s:95:\"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente\";s:2:\"fa\";s:101:\"نمایش لیست ماه های گذشته به همراه لینک به پست های مربوطه\";s:2:\"pt\";s:95:\"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente\";s:2:\"el\";s:155:\"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς\";s:2:\"fr\";s:95:\"Permet d\'afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois\";s:2:\"ru\";s:114:\"Выводит список по месяцам со ссылками на записи в этих месяцах\";s:2:\"id\";s:63:\"Menampilkan daftar bulan beserta tautan post di setiap bulannya\";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', '1', '7', '1513796168');
INSERT INTO `default_widgets` VALUES ('8', 'blog_categories', 'a:8:{s:2:\"en\";s:15:\"Blog Categories\";s:2:\"br\";s:18:\"Categorias do Blog\";s:2:\"pt\";s:18:\"Categorias do Blog\";s:2:\"el\";s:41:\"Κατηγορίες Ιστολογίου\";s:2:\"fr\";s:19:\"Catégories du Blog\";s:2:\"ru\";s:29:\"Категории Блога\";s:2:\"id\";s:12:\"Kateori Blog\";s:2:\"fa\";s:28:\"مجموعه های بلاگ\";}', 'a:8:{s:2:\"en\";s:30:\"Show a list of blog categories\";s:2:\"br\";s:57:\"Mostra uma lista de navegação com as categorias do Blog\";s:2:\"pt\";s:57:\"Mostra uma lista de navegação com as categorias do Blog\";s:2:\"el\";s:97:\"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας\";s:2:\"fr\";s:49:\"Permet d\'afficher la liste de Catégories du Blog\";s:2:\"ru\";s:57:\"Выводит список категорий блога\";s:2:\"id\";s:35:\"Menampilkan daftar kategori tulisan\";s:2:\"fa\";s:55:\"نمایش لیستی از مجموعه های بلاگ\";}', 'Stephen Cozart', 'http://github.com/clip/', '1.0.0', '1', '8', '1513796168');
INSERT INTO `default_widgets` VALUES ('9', 'latest_posts', 'a:8:{s:2:\"en\";s:12:\"Latest posts\";s:2:\"br\";s:24:\"Artigos recentes do Blog\";s:2:\"fa\";s:26:\"آخرین ارسال ها\";s:2:\"pt\";s:24:\"Artigos recentes do Blog\";s:2:\"el\";s:62:\"Τελευταίες αναρτήσεις ιστολογίου\";s:2:\"fr\";s:17:\"Derniers articles\";s:2:\"ru\";s:31:\"Последние записи\";s:2:\"id\";s:12:\"Post Terbaru\";}', 'a:8:{s:2:\"en\";s:39:\"Display latest blog posts with a widget\";s:2:\"br\";s:81:\"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog\";s:2:\"fa\";s:65:\"نمایش آخرین پست های وبلاگ در یک ویجت\";s:2:\"pt\";s:81:\"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog\";s:2:\"el\";s:103:\"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας\";s:2:\"fr\";s:68:\"Permet d\'afficher la liste des derniers posts du blog dans un Widget\";s:2:\"ru\";s:100:\"Выводит список последних записей блога внутри виджета\";s:2:\"id\";s:51:\"Menampilkan posting blog terbaru menggunakan widget\";}', 'Erik Berman', 'http://www.nukleo.fr', '1.0.0', '1', '9', '1513796168');
INSERT INTO `default_widgets` VALUES ('11', 'social_media', 'a:2:{s:2:\"en\";s:12:\"social_media\";s:2:\"es\";s:22:\"Redes sociales(Widget)\";}', 'a:2:{s:2:\"en\";s:0:\"\";s:2:\"es\";s:62:\"Configuración de redes sociales con el modulo de contactenos.\";}', 'William Daza', 'www.imaginamos.com', '1.0', '1', '11', '1513796168');
INSERT INTO `default_widgets` VALUES ('12', 'menu_categories', 'a:2:{s:2:\"en\";s:15:\"menu_categories\";s:2:\"es\";s:18:\"Categorias(Widget)\";}', 'a:2:{s:2:\"en\";s:15:\"menu_categories\";s:2:\"es\";s:18:\"Categorias(Widget)\";}', 'Jeyson Garcia', '', '1.0', '1', '12', '1513970584');
INSERT INTO `default_widgets` VALUES ('13', 'notifications', 'a:2:{s:2:\"en\";s:13:\"notifications\";s:2:\"es\";s:13:\"notifications\";}', 'a:2:{s:2:\"en\";s:13:\"notifications\";s:2:\"es\";s:13:\"notifications\";}', 'Jeyson Garcia', '', '1.0', '1', '13', '1514417883');

-- ----------------------------
-- Table structure for `default_widget_areas`
-- ----------------------------
DROP TABLE IF EXISTS `default_widget_areas`;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_widget_areas
-- ----------------------------
INSERT INTO `default_widget_areas` VALUES ('1', 'sidebar', 'Sidebar');
INSERT INTO `default_widget_areas` VALUES ('3', 'redes-sociales', 'Redes Sociales');
INSERT INTO `default_widget_areas` VALUES ('4', 'menu_categories', 'menu_categories');
INSERT INTO `default_widget_areas` VALUES ('5', 'notifications', 'notifications');

-- ----------------------------
-- Table structure for `default_widget_instances`
-- ----------------------------
DROP TABLE IF EXISTS `default_widget_instances`;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of default_widget_instances
-- ----------------------------
INSERT INTO `default_widget_instances` VALUES ('2', 'Redes', '11', '3', 'a:0:{}', '1', '1513796256', '0');
INSERT INTO `default_widget_instances` VALUES ('4', 'Categorias', '12', '4', 'a:0:{}', '1', '1513970660', '0');
INSERT INTO `default_widget_instances` VALUES ('5', 'notifications', '13', '5', 'a:0:{}', '1', '1514417970', '0');
