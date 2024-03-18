/*
Navicat MySQL Data Transfer

Source Server         : 本地服务器
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : webscan

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2023-08-20 02:26:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user', '7', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user', '7', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user', '7', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can view user', '7', 'view_user');
INSERT INTO `auth_permission` VALUES ('29', 'Can add port', '8', 'add_port');
INSERT INTO `auth_permission` VALUES ('30', 'Can change port', '8', 'change_port');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete port', '8', 'delete_port');
INSERT INTO `auth_permission` VALUES ('32', 'Can view port', '8', 'view_port');
INSERT INTO `auth_permission` VALUES ('33', 'Can add scan result', '9', 'add_scanresult');
INSERT INTO `auth_permission` VALUES ('34', 'Can change scan result', '9', 'change_scanresult');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete scan result', '9', 'delete_scanresult');
INSERT INTO `auth_permission` VALUES ('36', 'Can view scan result', '9', 'view_scanresult');
INSERT INTO `auth_permission` VALUES ('37', 'Can add task result', '10', 'add_taskresult');
INSERT INTO `auth_permission` VALUES ('38', 'Can change task result', '10', 'change_taskresult');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete task result', '10', 'delete_taskresult');
INSERT INTO `auth_permission` VALUES ('40', 'Can view task result', '10', 'view_taskresult');
INSERT INTO `auth_permission` VALUES ('41', 'Can add chord counter', '11', 'add_chordcounter');
INSERT INTO `auth_permission` VALUES ('42', 'Can change chord counter', '11', 'change_chordcounter');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete chord counter', '11', 'delete_chordcounter');
INSERT INTO `auth_permission` VALUES ('44', 'Can view chord counter', '11', 'view_chordcounter');
INSERT INTO `auth_permission` VALUES ('45', 'Can add port', '12', 'add_port');
INSERT INTO `auth_permission` VALUES ('46', 'Can change port', '12', 'change_port');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete port', '12', 'delete_port');
INSERT INTO `auth_permission` VALUES ('48', 'Can view port', '12', 'view_port');
INSERT INTO `auth_permission` VALUES ('49', 'Can add scan result', '13', 'add_scanresult');
INSERT INTO `auth_permission` VALUES ('50', 'Can change scan result', '13', 'change_scanresult');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete scan result', '13', 'delete_scanresult');
INSERT INTO `auth_permission` VALUES ('52', 'Can view scan result', '13', 'view_scanresult');
INSERT INTO `auth_permission` VALUES ('53', 'Can add scan result', '14', 'add_scanresult');
INSERT INTO `auth_permission` VALUES ('54', 'Can change scan result', '14', 'change_scanresult');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete scan result', '14', 'delete_scanresult');
INSERT INTO `auth_permission` VALUES ('56', 'Can view scan result', '14', 'view_scanresult');
INSERT INTO `auth_permission` VALUES ('57', 'Can add tools', '15', 'add_tools');
INSERT INTO `auth_permission` VALUES ('58', 'Can change tools', '15', 'change_tools');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete tools', '15', 'delete_tools');
INSERT INTO `auth_permission` VALUES ('60', 'Can view tools', '15', 'view_tools');
INSERT INTO `auth_permission` VALUES ('61', 'Can add ctf_webs', '16', 'add_ctf_webs');
INSERT INTO `auth_permission` VALUES ('62', 'Can change ctf_webs', '16', 'change_ctf_webs');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete ctf_webs', '16', 'delete_ctf_webs');
INSERT INTO `auth_permission` VALUES ('64', 'Can view ctf_webs', '16', 'view_ctf_webs');
INSERT INTO `auth_permission` VALUES ('65', 'Can add scan result', '17', 'add_scanresult');
INSERT INTO `auth_permission` VALUES ('66', 'Can change scan result', '17', 'change_scanresult');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete scan result', '17', 'delete_scanresult');
INSERT INTO `auth_permission` VALUES ('68', 'Can view scan result', '17', 'view_scanresult');
INSERT INTO `auth_permission` VALUES ('69', 'Can add cw e_info', '18', 'add_cwe_info');
INSERT INTO `auth_permission` VALUES ('70', 'Can change cw e_info', '18', 'change_cwe_info');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete cw e_info', '18', 'delete_cwe_info');
INSERT INTO `auth_permission` VALUES ('72', 'Can view cw e_info', '18', 'view_cwe_info');
INSERT INTO `auth_permission` VALUES ('73', 'Can add article', '19', 'add_article');
INSERT INTO `auth_permission` VALUES ('74', 'Can change article', '19', 'change_article');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete article', '19', 'delete_article');
INSERT INTO `auth_permission` VALUES ('76', 'Can view article', '19', 'view_article');
INSERT INTO `auth_permission` VALUES ('77', 'Can add article_info', '20', 'add_article_info');
INSERT INTO `auth_permission` VALUES ('78', 'Can change article_info', '20', 'change_article_info');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete article_info', '20', 'delete_article_info');
INSERT INTO `auth_permission` VALUES ('80', 'Can view article_info', '20', 'view_article_info');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$216000$Ejg3MJvbBgDE$vHitrqQzbrbXP/Z6zFGRlaaDCiJYNV4MYJsb6O30hQ0=', null, '0', 'xhwdm', '', '', '', '0', '1', '2023-04-03 13:46:42.862132');
INSERT INTO `auth_user` VALUES ('6', 'pbkdf2_sha256$216000$4YADMyAZnJ6H$em/IJDBVTYVqQhj4JWcG1o0Wxat9tlNtNIW2jzoSQJQ=', null, '0', 'xh', '', '', '', '0', '1', '2023-04-03 14:17:27.070093');
INSERT INTO `auth_user` VALUES ('9', 'pbkdf2_sha256$216000$p44uMc95G5rt$2WdBQNmb+SCIoZAFFd6/6DEIDkJ+LWGm9Gj+8hV7eoM=', null, '0', '1663233', '', '', '', '0', '1', '2023-04-03 14:23:09.046967');
INSERT INTO `auth_user` VALUES ('10', 'pbkdf2_sha256$216000$xnuIJgGAczjZ$waXp6UK+kea+5KvmvEkOSVaF4v6rmTvljVnhxUR22DM=', null, '0', 'HHHH', '', '', '', '0', '1', '2023-04-03 14:27:12.164407');
INSERT INTO `auth_user` VALUES ('11', 'pbkdf2_sha256$216000$nhK3eWUdKgjM$aRWpbX7lswRj/JIFNR7V8NyazhKht4BC+YCFi+CJPKU=', null, '0', 'TEST1', '', '', '', '0', '1', '2023-04-03 14:27:36.880758');
INSERT INTO `auth_user` VALUES ('13', 'pbkdf2_sha256$216000$jmAFhRNpEqzZ$nEiqel8aHFTTusnAi8mpYXRN+eBx/tqfiv40in0gGDs=', null, '0', 'test2', '', '', '', '0', '1', '2023-04-03 14:33:12.941482');
INSERT INTO `auth_user` VALUES ('17', 'pbkdf2_sha256$216000$GALTEXzO1ZxT$h9meZUfm06eMoXyT0AFLqz6wA+durJ62JJj5xyoH80A=', null, '0', 'TEST3', '', '', '', '0', '1', '2023-04-03 14:41:01.002189');
INSERT INTO `auth_user` VALUES ('18', 'pbkdf2_sha256$216000$Cqq74RIy8BU5$Y6cKB5S38MXOgHqrSvHySlULBpvOKLteSg+Q69y2FxY=', null, '0', 'test4', '', '', '', '0', '1', '2023-04-03 14:43:23.790753');
INSERT INTO `auth_user` VALUES ('19', 'pbkdf2_sha256$216000$ben7beXv1JyL$TVSPZ8Hx3u9nZdK4Q8lOVRHk5VAWLu+c14rRy7wEPVk=', null, '0', '123', '', '', '', '0', '1', '2023-04-03 14:47:34.700620');
INSERT INTO `auth_user` VALUES ('25', 'pbkdf2_sha256$216000$fBw2dzkGWAHS$a4prEFS2puo4ob9nGgHik2lrGjqxKvUA7KN3knisOzo=', null, '0', 'TEST6', '', '', '', '0', '1', '2023-04-03 14:56:26.209137');
INSERT INTO `auth_user` VALUES ('26', 'pbkdf2_sha256$216000$IjjNCmwlpfjN$YcvjDpl1VclXcF+sJ/t+chBvB08Z9l76zkTt9yWFd4M=', null, '0', 'TEST8', '', '', '', '0', '1', '2023-04-03 14:57:00.439694');
INSERT INTO `auth_user` VALUES ('28', 'pbkdf2_sha256$150000$ZKBu2xGV9Jzc$LZzoDpiFQBcPl5Vd5zhnkyZ4Jd/BEcFSoWKUpLCKMIA=', '2023-08-19 18:16:09.062788', '0', '1484333494@qq.com', '', '', '', '0', '1', '2023-04-03 15:15:14.382028');
INSERT INTO `auth_user` VALUES ('31', 'pbkdf2_sha256$600000$P0GlFsOQ3wFC4GoAqObwLH$Tx/G/wj1PXZ5sxgEXX6IFWrqKleaeE8R6qarTDXWGUM=', null, '0', '毕业设计', '', '', '', '0', '1', '2023-04-26 15:20:03.678013');
INSERT INTO `auth_user` VALUES ('32', 'pbkdf2_sha256$600000$ic08BLpRtI774pkUceDYcX$5w695/tyMbtNqcLliGMB53zq9RndZ3CP5edI7Zbpz+g=', null, '0', '毕业设计@mh', '', '', '', '0', '1', '2023-04-26 15:20:21.586114');
INSERT INTO `auth_user` VALUES ('33', 'pbkdf2_sha256$600000$sJmBtQkR8nMc2tuDS9Pd8B$eiTMIEqpFJcfO4n1wj8SrBRTDkQ4BmWdNon7Mx+duTQ=', '2023-04-26 15:20:52.927284', '0', '1663233@123', '', '', '', '0', '1', '2023-04-26 15:20:49.575252');
INSERT INTO `auth_user` VALUES ('40', 'pbkdf2_sha256$150000$Tkp68QMwpTZF$qa3vuFhKAB6FNThaZ60EEjrOZeTGCXhgpHgnw7U8xko=', null, '0', 'maverick0407', '', '', '', '0', '1', '2023-08-18 20:53:56.383673');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for dirscan_scanresult
-- ----------------------------
DROP TABLE IF EXISTS `dirscan_scanresult`;
CREATE TABLE `dirscan_scanresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `target_url` varchar(255) NOT NULL,
  `scan_path` varchar(255) NOT NULL,
  `response_code` smallint unsigned NOT NULL,
  `access_status` varchar(20) NOT NULL,
  `scan_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dirscan_scanresult_chk_1` CHECK ((`response_code` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of dirscan_scanresult
-- ----------------------------
INSERT INTO `dirscan_scanresult` VALUES ('41', 'www.baidu.com', 'http://www.baidu.com//index.php', '200', '成功', '2023-04-11 10:10:54.525607');
INSERT INTO `dirscan_scanresult` VALUES ('42', 'www.baidu.com', 'http://www.baidu.com//robots.txt', '200', '成功', '2023-04-11 10:10:55.040319');
INSERT INTO `dirscan_scanresult` VALUES ('43', 'www.baidu.com', 'http://www.baidu.com/index.php', '200', '成功', '2023-04-11 10:10:57.559461');
INSERT INTO `dirscan_scanresult` VALUES ('44', 'www.baidu.com', 'http://www.baidu.com/robots.txt', '200', '成功', '2023-04-11 10:10:57.902728');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_results_chordcounter
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_results_chordcounter`;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  CONSTRAINT `django_celery_results_chordcounter_chk_1` CHECK ((`count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_celery_results_chordcounter
-- ----------------------------

-- ----------------------------
-- Table structure for django_celery_results_taskresult
-- ----------------------------
DROP TABLE IF EXISTS `django_celery_results_taskresult`;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_date_done_49edada6` (`date_done`),
  KEY `django_celery_results_taskresult_status_cbbed23a` (`status`),
  KEY `django_celery_results_taskresult_task_name_90987df3` (`task_name`),
  KEY `django_celery_results_taskresult_worker_f8711389` (`worker`),
  KEY `django_celery_results_taskresult_date_created_099f3424` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_celery_results_taskresult
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('14', 'dirscan', 'scanresult');
INSERT INTO `django_content_type` VALUES ('11', 'django_celery_results', 'chordcounter');
INSERT INTO `django_content_type` VALUES ('10', 'django_celery_results', 'taskresult');
INSERT INTO `django_content_type` VALUES ('7', 'login', 'user');
INSERT INTO `django_content_type` VALUES ('12', 'portscan', 'port');
INSERT INTO `django_content_type` VALUES ('13', 'portscan', 'scanresult');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('16', 'tools', 'ctf_webs');
INSERT INTO `django_content_type` VALUES ('15', 'tools', 'tools');
INSERT INTO `django_content_type` VALUES ('17', 'vulscan', 'scanresult');
INSERT INTO `django_content_type` VALUES ('19', 'webscan', 'article');
INSERT INTO `django_content_type` VALUES ('20', 'webscan', 'article_info');
INSERT INTO `django_content_type` VALUES ('18', 'webscan', 'cwe_info');
INSERT INTO `django_content_type` VALUES ('8', 'webscan', 'port');
INSERT INTO `django_content_type` VALUES ('9', 'webscan', 'scanresult');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2023-04-03 13:25:57.168564');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2023-04-03 13:25:57.276836');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2023-04-03 13:25:57.537867');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2023-04-03 13:25:57.621644');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2023-04-03 13:25:57.628625');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2023-04-03 13:25:57.694448');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2023-04-03 13:25:57.735339');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2023-04-03 13:25:57.774235');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2023-04-03 13:25:57.781216');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2023-04-03 13:25:57.819116');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2023-04-03 13:25:57.822108');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2023-04-03 13:25:57.830085');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2023-04-03 13:25:57.869979');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2023-04-03 13:25:57.908875');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2023-04-03 13:25:57.945777');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2023-04-03 13:25:57.952758');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2023-04-03 13:25:57.992262');
INSERT INTO `django_migrations` VALUES ('18', 'login', '0001_initial', '2023-04-03 13:25:58.009809');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2023-04-03 13:25:58.027760');
INSERT INTO `django_migrations` VALUES ('20', 'login', '0002_auto_20230403_2149', '2023-04-03 13:49:44.968328');
INSERT INTO `django_migrations` VALUES ('21', 'webscan', '0001_initial', '2023-04-05 08:30:09.745310');
INSERT INTO `django_migrations` VALUES ('22', 'webscan', '0002_scanresult', '2023-04-05 11:30:39.003836');
INSERT INTO `django_migrations` VALUES ('23', 'django_celery_results', '0001_initial', '2023-04-08 06:52:58.130341');
INSERT INTO `django_migrations` VALUES ('24', 'django_celery_results', '0002_add_task_name_args_kwargs', '2023-04-08 06:52:58.169236');
INSERT INTO `django_migrations` VALUES ('25', 'django_celery_results', '0003_auto_20181106_1101', '2023-04-08 06:52:58.174225');
INSERT INTO `django_migrations` VALUES ('26', 'django_celery_results', '0004_auto_20190516_0412', '2023-04-08 06:52:58.216111');
INSERT INTO `django_migrations` VALUES ('27', 'django_celery_results', '0005_taskresult_worker', '2023-04-08 06:52:58.241045');
INSERT INTO `django_migrations` VALUES ('28', 'django_celery_results', '0006_taskresult_date_created', '2023-04-08 06:52:58.281935');
INSERT INTO `django_migrations` VALUES ('29', 'django_celery_results', '0007_remove_taskresult_hidden', '2023-04-08 06:52:58.317839');
INSERT INTO `django_migrations` VALUES ('30', 'django_celery_results', '0008_chordcounter', '2023-04-08 06:52:58.334793');
INSERT INTO `django_migrations` VALUES ('31', 'portscan', '0001_initial', '2023-04-09 09:56:55.712388');
INSERT INTO `django_migrations` VALUES ('32', 'webscan', '0003_delete_port_delete_scanresult', '2023-04-09 09:56:55.731337');
INSERT INTO `django_migrations` VALUES ('33', 'dirscan', '0001_initial', '2023-04-11 07:31:33.851959');
INSERT INTO `django_migrations` VALUES ('34', 'tools', '0001_initial', '2023-04-14 10:03:25.975141');
INSERT INTO `django_migrations` VALUES ('35', 'tools', '0002_ctf_webs', '2023-04-14 11:54:02.353800');
INSERT INTO `django_migrations` VALUES ('36', 'vulscan', '0001_initial', '2023-04-16 15:21:42.581775');
INSERT INTO `django_migrations` VALUES ('37', 'vulscan', '0002_scanresult_info_vulns', '2023-04-17 07:08:39.567400');
INSERT INTO `django_migrations` VALUES ('38', 'vulscan', '0003_scanresult_scan_mode', '2023-04-17 07:28:08.231506');
INSERT INTO `django_migrations` VALUES ('39', 'vulscan', '0004_alter_scanresult_scan_mode', '2023-04-17 07:28:08.236493');
INSERT INTO `django_migrations` VALUES ('40', 'vulscan', '0005_remove_scanresult_scan_mode', '2023-04-17 07:28:08.239485');
INSERT INTO `django_migrations` VALUES ('41', 'vulscan', '0006_scanresult_scan_mode', '2023-04-17 07:28:08.243474');
INSERT INTO `django_migrations` VALUES ('42', 'vulscan', '0007_alter_scanresult_scan_mode', '2023-04-17 07:28:08.247464');
INSERT INTO `django_migrations` VALUES ('43', 'vulscan', '0008_alter_scanresult_scan_mode', '2023-04-17 07:28:08.250456');
INSERT INTO `django_migrations` VALUES ('44', 'vulscan', '0009_alter_scanresult_scan_mode', '2023-04-17 07:28:08.254445');
INSERT INTO `django_migrations` VALUES ('45', 'vulscan', '0010_alter_scanresult_scan_mode', '2023-04-17 07:29:45.599705');
INSERT INTO `django_migrations` VALUES ('46', 'vulscan', '0011_rename_created_at_scanresult_created_time', '2023-04-17 07:35:39.556759');
INSERT INTO `django_migrations` VALUES ('47', 'vulscan', '0012_alter_scanresult_scan_mode', '2023-04-17 08:20:35.077387');
INSERT INTO `django_migrations` VALUES ('48', 'vulscan', '0013_alter_scanresult_scan_mode', '2023-04-17 08:37:48.429923');
INSERT INTO `django_migrations` VALUES ('49', 'webscan', '0004_initial', '2023-04-22 14:29:32.445866');
INSERT INTO `django_migrations` VALUES ('50', 'webscan', '0005_article', '2023-04-23 08:35:09.925308');
INSERT INTO `django_migrations` VALUES ('51', 'webscan', '0006_article_info_delete_article', '2023-04-23 09:28:02.416764');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('10hw8pou9brl1ien9hzsd6n2eywkmu1x', '.eJxVj8sOgjAQRf-layGllHbq0r3fQKYzU8EHJBTCwvjvQnSh2_s4ufepWlzmrl2yTG3P6qgMqMOvGJFuMuwOX3G4jCWNwzz1sdwj5dfN5XlkuZ--2T9Ah7nbuQnFWW-8RI1AXhpy4KPWNSbW4IipBq4q00iyIGKDINQuBdYMnvwG5X7KhEM7Y759xgZTAUaCwgNDYXVjimArLmJILqRoQx3op7hM9620ruu2u-dlu_JQrzfbdlN6:1pnJgG:RXIwpWbybjcFPirOVwtqQRkmwpztFn36yherhhYsIEM', '2023-04-28 13:41:36.574758');
INSERT INTO `django_session` VALUES ('16nwdqimmmbauo4hgb7lhxki5d7pdcch', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DGZipVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLE8Tpd0yYH1x3QnestyZzq-syJ7kr8qBdXhvx83K4fwcFe_nWHuykHSvlQGkdUvYw6uTQAxgAS-gV-YxqsMQ8gBnGwIYME2bIkw_i_QHgrjen:1pjx2W:pnZFMoDAYk3EoAY4IQh7_DQd6khKdgF9q3imb3wdLY4', '2023-04-19 06:54:40.214148');
INSERT INTO `django_session` VALUES ('3nms90whky4to9b70wsn1s8cbi7f5mlx', '.eJxVjjsOwjAQRO_iOrKcn72hpOcM0Xp3TQKWI8Vxhbg7BFJAN5p5epqHGrFs01iyrOPM6qQaUNVv6ZHukvaFb5iui6Ylbevs9Y7oY836srDE88H-CSbM0-4NKLZzjRNvEMhJTxacN6bFwAYsMbXAdd30EjoQ6QZBaG0Y2DA4cm_phvn-OZlKjJUqa_zG5wtVHUGr:1plUaP:rmsgG3ZX0YUmR-BT6gs4dbT2bUdnDmnhs5O-dtxOHic', '2023-04-23 12:56:01.380906');
INSERT INTO `django_session` VALUES ('6dp7cm0vmlqwjfaql8ikvwke83e7gned', 'NDRmMmMxNjk5OWFkNzQ2MzA0ODAwODNhY2FiY2M5M2Y5ZTU3Njc5ZTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjQwOTc0Mjc4NmQzZWI1MzAzNmMxZmY5NmQ5MGFjZjhiY2Q3ZTAzYyJ9', '2023-09-02 18:16:09.069282');
INSERT INTO `django_session` VALUES ('7aa85zwygcywr8zq2uz49li3dhboeg02', '.eJxVjMsOwiAQAP-FsyEUKGw9eu83NMvuIlVTkj5Oxn83JD3odWYybzXhsZfp2GSdZlZXZUFdfmFCesrSDD9wuVdNddnXOemW6NNueqwsr9vZ_g0KbqV9M0rw0UZJBoGi9BQgJmMcZjYQiMkBd53tJXsQ8YMguJAHNgyRovp8ASECOK8:1pnxFX:vseYIrViZToSLA8ycqj8JaiT14T4ihbAH0BTW1OqUJk', '2023-04-30 07:56:39.891260');
INSERT INTO `django_session` VALUES ('7e9qasebs45rcjtywyy3w62ikywk41y1', '.eJxVjMsOwiAQAP-FsyEUKGw9eu83NMvuIlVTkj5Oxn83JD3odWYybzXhsZfp2GSdZlZXZUFdfmFCesrSDD9wuVdNddnXOemW6NNueqwsr9vZ_g0KbqV9M0rw0UZJBoGi9BQgJmMcZjYQiMkBd53tJXsQ8YMguJAHNgyRovp8ASECOK8:1pq9fd:2pz8-Uf9Dm4a9wUxtNUIjRGyvMeTL4C2bkZJ4Nd1mMg', '2023-05-06 09:36:41.580604');
INSERT INTO `django_session` VALUES ('fccz3u15gvenvvzpjaxjpnqegxdhqdqh', '.eJxtjklqxDAQRe_idWRkjaUss88ZTKmqFDvdscEDXoTcvWW6IR3I9g-P9930uG9Dv6-y9CM3r42B5uU5zEgXmc6GP3H6mFuap20Zc3tO2ke7tu8zy_Xtsf0DGHAdTm5BCS6aKFkjUBRPAWLW2mJhDYGYLHDXGS_FgYhLgmBDSawZIsUK3XC93CXJeY1itQLvrHLoSGUDWaHx0FEIEFKqh3251vFxHNVz5L2qf9WUx2UlnPpfHGZjdUdWCcainE2okmSvNLNByNmQKU_H_7A_NzcwaGI:1pnCfm:oaLa6ApawDHsZQ0otqGciP_s2HmeSmMzn5LG-1kdX6k', '2023-04-28 06:12:38.528326');
INSERT INTO `django_session` VALUES ('gd8i331724lg6m2xf2u1ixogvzgg8k76', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DGZipVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLE8Tpd0yYH1x3QnestyZzq-syJ7kr8qBdXhvx83K4fwcFe_nWHuykHSvlQGkdUvYw6uTQAxgAS-gV-YxqsMQ8gBnGwIYME2bIkw_i_QHgrjen:1pjx5n:CpXfr7S7NHIwvxkxccwTZZOwZgLLUFpSeafXIifZ1nU', '2023-04-19 06:58:03.116118');
INSERT INTO `django_session` VALUES ('gxzan2pduf94ao45e2mbg5ge14s3lmid', '.eJxVjMsOwiAQAP-FsyEUKGw9eu83NMvuIlVTkj5Oxn83JD3odWYybzXhsZfp2GSdZlZXZUFdfmFCesrSDD9wuVdNddnXOemW6NNueqwsr9vZ_g0KbqV9M0rw0UZJBoGi9BQgJmMcZjYQiMkBd53tJXsQ8YMguJAHNgyRovp8ASECOK8:1pnzPt:lAMZCQqjXkrsloA-WXW5ZsvdTf6FW8ArmGXvrE2Hydc', '2023-04-30 10:15:29.011803');
INSERT INTO `django_session` VALUES ('hjt58yan8rll0xceamftp9sp3zfuvjhx', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DGZipVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLE8Tpd0yYH1x3QnestyZzq-syJ7kr8qBdXhvx83K4fwcFe_nWHuykHSvlQGkdUvYw6uTQAxgAS-gV-YxqsMQ8gBnGwIYME2bIkw_i_QHgrjen:1pkQWp:zoRiJUmjyjqOgwZTyUO-7dCcd2POkBD_PPe91ZWo0yQ', '2023-04-20 14:23:55.238027');
INSERT INTO `django_session` VALUES ('oruz00k6ausxnckjbls5bshl5w2srld7', '.eJxVjEEOwiAQRe_C2hCgDFCX7j0DGZipVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLE8Tpd0yYH1x3QnestyZzq-syJ7kr8qBdXhvx83K4fwcFe_nWHuykHSvlQGkdUvYw6uTQAxgAS-gV-YxqsMQ8gBnGwIYME2bIkw_i_QHgrjen:1pjxvN:ZQZf9Oe9bjvQBQRw7tPfd8FAesxnDt4CeabnCjmx2qk', '2023-04-19 07:51:21.050124');
INSERT INTO `django_session` VALUES ('p9peh6m5turf77odp085f6p7s0syibkq', '.eJxtjstqhTAQht_FdSOTZHLr8uz7DJJkMtWeUwWjuCh990YQegrd_peP76sb4r6Nw17LOkzUvXZady_PYYr5XuazoY84vy99XuZtnVJ_Tvqrrf3bQuVxu7Z_AGOs48mNDot1jJKlJGXIFKvQG6dz8AGcLQSgXcKIOjEkRss66eAwJgBVGnSL9X5JKoM2yCRQKxbYcCJYlMJIz2TYk0Zuh319tPFxHM1zor2pf7aUprXmOA-_OAc5yZiLIJlJoGMQPlslCiTDmj2g4qfjf9jvHyL-Zto:1prhV5:HXn06-rPUemY4M3hBevMcJ0VWZ9aJCMeMg1D5YaWkZU', '2023-05-10 15:56:11.083053');
INSERT INTO `django_session` VALUES ('pucn7ie65mtktgypz4z77in74q93crba', '.eJxVjkEOgjAQRe_StZCWlra4dO8ZyHRmKohCQiEsjHe3RBa6nf_m5b1EC-vStWviue1JnEXlxen3GAAHHveF7jDephKncZn7UO5IeaypvE7Ej8vB_gk6SN3ujcDWuMpxkODRcY3WuyClhkjSWyTUnpSqao7GM5uGwWsbG5LkHbosXSAN30hQKhodY0GsQ2EqFYpsDQWiC9FyU1vF-WGdHxneti139rTm9Kd4fwC-eU4Y:1pnzDs:FIc2GFIR75VZxd3Pa_ucC75BTa_kYZknrAjTIPVNIog', '2023-04-30 10:03:04.746460');
INSERT INTO `django_session` VALUES ('zd8acgfsp3ik175erk0ptfo1emsj68h0', 'NDRmMmMxNjk5OWFkNzQ2MzA0ODAwODNhY2FiY2M5M2Y5ZTU3Njc5ZTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjQwOTc0Mjc4NmQzZWI1MzAzNmMxZmY5NmQ5MGFjZjhiY2Q3ZTAzYyJ9', '2023-08-15 18:08:53.458570');

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of login_user
-- ----------------------------

-- ----------------------------
-- Table structure for portscan_port
-- ----------------------------
DROP TABLE IF EXISTS `portscan_port`;
CREATE TABLE `portscan_port` (
  `id` int NOT NULL AUTO_INCREMENT,
  `port_number` int unsigned NOT NULL,
  `service` varchar(100) NOT NULL,
  `protocol` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `port_number` (`port_number`),
  CONSTRAINT `portscan_port_chk_1` CHECK ((`port_number` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of portscan_port
-- ----------------------------
INSERT INTO `portscan_port` VALUES ('1', '21', 'FTP', 'TCP');
INSERT INTO `portscan_port` VALUES ('2', '22', 'SSH', 'TCP');
INSERT INTO `portscan_port` VALUES ('3', '23', 'Telnet', 'TCP');
INSERT INTO `portscan_port` VALUES ('4', '25', 'SMTP', 'TCP');
INSERT INTO `portscan_port` VALUES ('5', '53', 'DNS', 'UDP/TCP');
INSERT INTO `portscan_port` VALUES ('6', '67', 'DHCP', 'UDP');
INSERT INTO `portscan_port` VALUES ('7', '68', 'DHCP', 'UDP');
INSERT INTO `portscan_port` VALUES ('8', '80', 'HTTP', 'TCP');
INSERT INTO `portscan_port` VALUES ('9', '110', 'POP3', 'TCP');
INSERT INTO `portscan_port` VALUES ('10', '119', 'NNTP', 'TCP');
INSERT INTO `portscan_port` VALUES ('11', '123', 'NTP', 'UDP');
INSERT INTO `portscan_port` VALUES ('12', '137', 'NetBIOS', 'UDP');
INSERT INTO `portscan_port` VALUES ('13', '138', 'NetBIOS', 'UDP');
INSERT INTO `portscan_port` VALUES ('14', '139', 'NetBIOS', 'TCP');
INSERT INTO `portscan_port` VALUES ('15', '143', 'IMAP', 'TCP');
INSERT INTO `portscan_port` VALUES ('16', '161', 'SNMP', 'UDP');
INSERT INTO `portscan_port` VALUES ('17', '162', 'SNMP', 'UDP');
INSERT INTO `portscan_port` VALUES ('18', '389', 'LDAP', 'TCP/UDP');
INSERT INTO `portscan_port` VALUES ('19', '443', 'HTTPS', 'TCP');
INSERT INTO `portscan_port` VALUES ('20', '445', 'SMB/CIFS', 'TCP/UDP');
INSERT INTO `portscan_port` VALUES ('21', '465', 'SMTPS', 'TCP');
INSERT INTO `portscan_port` VALUES ('22', '514', 'Syslog', 'UDP');
INSERT INTO `portscan_port` VALUES ('23', '515', 'Line Printer Daemon', 'TCP/UDP');
INSERT INTO `portscan_port` VALUES ('24', '543', 'LDAP over SSL', 'TCP');
INSERT INTO `portscan_port` VALUES ('25', '544', 'Kerberos', 'TCP/UDP');
INSERT INTO `portscan_port` VALUES ('26', '548', 'AFP', 'TCP');
INSERT INTO `portscan_port` VALUES ('27', '587', 'SMTP Submission', 'TCP');
INSERT INTO `portscan_port` VALUES ('28', '636', 'LDAP over SSL', 'TCP');
INSERT INTO `portscan_port` VALUES ('29', '873', 'rsync', 'TCP/UDP');
INSERT INTO `portscan_port` VALUES ('30', '902', 'VMware Server Console', 'TCP/UDP');
INSERT INTO `portscan_port` VALUES ('31', '989', 'sftp', 'tcp');
INSERT INTO `portscan_port` VALUES ('32', '990', 'ftps', 'tcp');
INSERT INTO `portscan_port` VALUES ('33', '993', 'imaps', 'tcp');
INSERT INTO `portscan_port` VALUES ('34', '995', 'pop3s', 'tcp');
INSERT INTO `portscan_port` VALUES ('35', '1080', 'socks', 'tcp/udp');
INSERT INTO `portscan_port` VALUES ('36', '1194', 'openvpn', 'udp');
INSERT INTO `portscan_port` VALUES ('37', '1433', 'ms-sql-s', 'tcp');
INSERT INTO `portscan_port` VALUES ('38', '1434', 'ms-sql-m', 'tcp/udp');
INSERT INTO `portscan_port` VALUES ('39', '1521', 'oracle', 'tcp');
INSERT INTO `portscan_port` VALUES ('40', '1723', 'pptp', 'tcp');
INSERT INTO `portscan_port` VALUES ('41', '2049', 'nfs', 'tcp/udp');
INSERT INTO `portscan_port` VALUES ('42', '2181', 'zookeeper', 'tcp');
INSERT INTO `portscan_port` VALUES ('43', '3306', 'mysql', 'tcp');
INSERT INTO `portscan_port` VALUES ('44', '3389', 'rdp', 'tcp');
INSERT INTO `portscan_port` VALUES ('45', '3690', 'svn', 'tcp');
INSERT INTO `portscan_port` VALUES ('46', '4369', 'erlang-port-mapper', 'tcp');
INSERT INTO `portscan_port` VALUES ('47', '5432', 'postgresql', 'tcp');
INSERT INTO `portscan_port` VALUES ('48', '5555', 'freeciv', 'tcp');
INSERT INTO `portscan_port` VALUES ('49', '5900', 'vnc', 'tcp');
INSERT INTO `portscan_port` VALUES ('50', '6000', 'x11', 'tcp');
INSERT INTO `portscan_port` VALUES ('51', '6379', 'redis', 'tcp');
INSERT INTO `portscan_port` VALUES ('52', '6667', 'irc', 'tcp');
INSERT INTO `portscan_port` VALUES ('53', '6697', 'ircs', 'tcp');
INSERT INTO `portscan_port` VALUES ('54', '8000', 'http-alt', 'tcp');
INSERT INTO `portscan_port` VALUES ('55', '8080', 'http-proxy', 'tcp');
INSERT INTO `portscan_port` VALUES ('56', '8443', 'https-alt', 'tcp');
INSERT INTO `portscan_port` VALUES ('57', '8888', 'http-alt', 'tcp');
INSERT INTO `portscan_port` VALUES ('58', '9000', 'cslistener', 'tcp');
INSERT INTO `portscan_port` VALUES ('59', '9090', 'websm', 'tcp');
INSERT INTO `portscan_port` VALUES ('60', '9200', 'elasticsearch', 'tcp');
INSERT INTO `portscan_port` VALUES ('61', '9418', 'git', 'tcp');
INSERT INTO `portscan_port` VALUES ('62', '9999', 'abyss', 'tcp');
INSERT INTO `portscan_port` VALUES ('63', '10000', 'snet-sensor-mgmt', 'tcp');
INSERT INTO `portscan_port` VALUES ('64', '11211', 'memcached', 'tcp');

-- ----------------------------
-- Table structure for portscan_scanresult
-- ----------------------------
DROP TABLE IF EXISTS `portscan_scanresult`;
CREATE TABLE `portscan_scanresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `port` int NOT NULL,
  `scan_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of portscan_scanresult
-- ----------------------------
INSERT INTO `portscan_scanresult` VALUES ('1', 'www.baidu.com', '110', '2023-04-09 09:58:03.119671');
INSERT INTO `portscan_scanresult` VALUES ('2', 'www.baidu.com', '80', '2023-04-09 09:58:03.150586');
INSERT INTO `portscan_scanresult` VALUES ('3', 'www.baidu.com', '443', '2023-04-09 09:58:06.180487');
INSERT INTO `portscan_scanresult` VALUES ('4', 'www.baidu.com', '25', '2023-04-09 09:58:07.173831');
INSERT INTO `portscan_scanresult` VALUES ('5', '127.0.0.1', '902', '2023-04-09 11:47:44.894844');
INSERT INTO `portscan_scanresult` VALUES ('6', '127.0.0.1', '912', '2023-04-09 11:47:53.971578');
INSERT INTO `portscan_scanresult` VALUES ('7', '127.0.0.1', '443', '2023-04-09 11:48:06.129079');
INSERT INTO `portscan_scanresult` VALUES ('8', '127.0.0.1', '445', '2023-04-09 11:48:07.160322');
INSERT INTO `portscan_scanresult` VALUES ('9', '127.0.0.1', '135', '2023-04-09 11:50:17.787133');
INSERT INTO `portscan_scanresult` VALUES ('10', '127.0.0.1', '5040', '2023-04-09 11:56:20.527457');
INSERT INTO `portscan_scanresult` VALUES ('11', '127.0.0.1', '9100', '2023-04-09 11:56:20.548400');
INSERT INTO `portscan_scanresult` VALUES ('12', '127.0.0.1', '35432', '2023-04-09 11:56:32.791671');
INSERT INTO `portscan_scanresult` VALUES ('13', '127.0.0.1', '8000', '2023-04-09 11:56:40.756380');
INSERT INTO `portscan_scanresult` VALUES ('14', '127.0.0.1', '33060', '2023-04-09 11:56:40.913959');
INSERT INTO `portscan_scanresult` VALUES ('15', '127.0.0.1', '5357', '2023-04-09 11:56:57.952412');
INSERT INTO `portscan_scanresult` VALUES ('16', '127.0.0.1', '1024', '2023-04-09 11:57:05.071381');
INSERT INTO `portscan_scanresult` VALUES ('17', '127.0.0.1', '8307', '2023-04-09 11:57:08.126215');
INSERT INTO `portscan_scanresult` VALUES ('18', '127.0.0.1', '1040', '2023-04-09 11:57:20.339566');
INSERT INTO `portscan_scanresult` VALUES ('19', '127.0.0.1', '9180', '2023-04-09 11:57:40.402932');
INSERT INTO `portscan_scanresult` VALUES ('20', '127.0.0.1', '11344', '2023-04-09 12:03:24.646569');
INSERT INTO `portscan_scanresult` VALUES ('21', '127.0.0.1', '2017', '2023-04-09 12:04:18.469690');
INSERT INTO `portscan_scanresult` VALUES ('22', '127.0.0.1', '5939', '2023-04-09 12:04:20.075397');
INSERT INTO `portscan_scanresult` VALUES ('23', '127.0.0.1', '10000', '2023-04-09 12:04:21.509563');
INSERT INTO `portscan_scanresult` VALUES ('24', '127.0.0.1', '63342', '2023-04-09 12:04:23.948045');
INSERT INTO `portscan_scanresult` VALUES ('25', '127.0.0.1', '54530', '2023-04-09 12:04:31.849921');
INSERT INTO `portscan_scanresult` VALUES ('26', '127.0.0.1', '19531', '2023-04-09 12:04:32.656764');
INSERT INTO `portscan_scanresult` VALUES ('27', '127.0.0.1', '54533', '2023-04-09 12:04:33.871517');
INSERT INTO `portscan_scanresult` VALUES ('28', '127.0.0.1', '6379', '2023-04-09 12:04:40.792017');
INSERT INTO `portscan_scanresult` VALUES ('29', '127.0.0.1', '6942', '2023-04-09 12:04:43.687278');
INSERT INTO `portscan_scanresult` VALUES ('30', '127.0.0.1', '3443', '2023-04-09 12:04:44.787337');
INSERT INTO `portscan_scanresult` VALUES ('31', '127.0.0.1', '3306', '2023-04-09 12:04:47.710522');
INSERT INTO `portscan_scanresult` VALUES ('32', '127.0.0.1', '12966', '2023-04-09 12:04:48.022688');
INSERT INTO `portscan_scanresult` VALUES ('33', '127.0.0.1', '4301', '2023-04-09 12:05:03.046527');
INSERT INTO `portscan_scanresult` VALUES ('34', '127.0.0.1', '49664', '2023-04-09 12:05:06.297835');
INSERT INTO `portscan_scanresult` VALUES ('35', '127.0.0.1', '49665', '2023-04-09 12:05:06.302821');
INSERT INTO `portscan_scanresult` VALUES ('36', '127.0.0.1', '49666', '2023-04-09 12:05:06.305814');
INSERT INTO `portscan_scanresult` VALUES ('37', '127.0.0.1', '49667', '2023-04-09 12:05:06.309803');
INSERT INTO `portscan_scanresult` VALUES ('38', '127.0.0.1', '49668', '2023-04-09 12:05:06.312795');
INSERT INTO `portscan_scanresult` VALUES ('39', '127.0.0.1', '55268', '2023-04-09 12:05:10.185442');
INSERT INTO `portscan_scanresult` VALUES ('40', '127.0.0.1', '27018', '2023-04-09 12:05:40.974138');
INSERT INTO `portscan_scanresult` VALUES ('41', '127.0.0.1', '9123', '2023-04-09 12:11:52.073118');
INSERT INTO `portscan_scanresult` VALUES ('42', '127.0.0.1', '10246', '2023-04-09 12:11:56.126284');
INSERT INTO `portscan_scanresult` VALUES ('43', '127.0.0.1', '10580', '2023-04-09 12:12:50.878920');
INSERT INTO `portscan_scanresult` VALUES ('44', '127.0.0.1', '1263', '2023-04-12 08:13:49.674865');
INSERT INTO `portscan_scanresult` VALUES ('45', '127.0.0.1', '1269', '2023-04-12 08:13:54.845914');
INSERT INTO `portscan_scanresult` VALUES ('46', '127.0.0.1', '7890', '2023-04-12 08:14:37.451014');
INSERT INTO `portscan_scanresult` VALUES ('47', '127.0.0.1', '59007', '2023-04-12 08:14:55.108379');
INSERT INTO `portscan_scanresult` VALUES ('48', '127.0.0.1', '9889', '2023-04-12 08:15:17.045320');
INSERT INTO `portscan_scanresult` VALUES ('49', '127.0.0.1', '50368', '2023-04-12 08:15:36.639031');
INSERT INTO `portscan_scanresult` VALUES ('50', '127.0.0.1', '1230', '2023-04-12 08:15:38.047593');
INSERT INTO `portscan_scanresult` VALUES ('51', '127.0.0.1', '8680', '2023-04-21 09:42:21.950608');
INSERT INTO `portscan_scanresult` VALUES ('52', '127.0.0.1', '14585', '2023-04-21 09:42:47.442040');
INSERT INTO `portscan_scanresult` VALUES ('53', '127.0.0.1', '28317', '2023-04-21 09:42:59.726880');
INSERT INTO `portscan_scanresult` VALUES ('54', '127.0.0.1', '32100', '2023-04-21 09:43:02.845271');
INSERT INTO `portscan_scanresult` VALUES ('55', '127.0.0.1', '10001', '2023-04-21 09:43:22.862847');
INSERT INTO `portscan_scanresult` VALUES ('56', '127.0.0.1', '1043', '2023-04-21 09:43:24.617417');
INSERT INTO `portscan_scanresult` VALUES ('57', '127.0.0.1', '1465', '2023-04-21 09:43:27.650678');
INSERT INTO `portscan_scanresult` VALUES ('58', '127.0.0.1', '22331', '2023-04-21 09:43:34.100562');
INSERT INTO `portscan_scanresult` VALUES ('59', '127.0.0.1', '9901', '2023-04-21 09:44:04.397447');
INSERT INTO `portscan_scanresult` VALUES ('60', '127.0.0.1', '7680', '2023-04-21 09:44:23.370122');
INSERT INTO `portscan_scanresult` VALUES ('61', '127.0.0.1', '50240', '2023-04-21 09:44:24.278855');
INSERT INTO `portscan_scanresult` VALUES ('62', '127.0.0.1', '56547', '2023-04-21 09:44:31.329335');

-- ----------------------------
-- Table structure for tools_ctf_webs
-- ----------------------------
DROP TABLE IF EXISTS `tools_ctf_webs`;
CREATE TABLE `tools_ctf_webs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img_src` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tools_ctf_webs
-- ----------------------------
INSERT INTO `tools_ctf_webs` VALUES ('1', 'https://ctfever.uniiem.com/', 'CTFever', 'https://ctfever.uniiem.com/icon.svg', '这是为 CTF 发烧者准备的的工具套件，助你过关斩将、攻克难关。目前基础功能和一部分高级功能已经完成，可以在 GitHub 上查看工具列表和开发进度。欢迎给我们的开源仓库 star、pr。');
INSERT INTO `tools_ctf_webs` VALUES ('2', 'https://ctf-wiki.org/', 'CTFwiki', 'https://ctf-wiki.org/static/img/logo.png', 'CTF Wiki 源于社区，作为独立的组织，提倡知识自由，在未来也绝不会商业化，将始终保持独立自由的性质。\r\n\r\n');
INSERT INTO `tools_ctf_webs` VALUES ('3', 'https://github.com/Harmoc/CTFTools', 'CTFTools', 'https://img-blog.csdnimg.cn/20210514181202315.png', '此工具包最初是基于精灵表哥和一个佚名表哥的工具包整理的，后来加上本人打CTF和渗透时所添加的一些工具，应当还算全面。\r\n\r\n希望这份工具包可以为刚刚接触CTF的朋友构造自己的工具链带来一些微小的帮助。');
INSERT INTO `tools_ctf_webs` VALUES ('4', 'https://adworld.xctf.org.cn/', '攻防世界', 'https://adworld.xctf.org.cn/media/banner_images/a4d31d8a-9ffb-4149-9dcf-425c9881ee11.jpg', '攻防世界是由一群信息安全大咖共同研究的答题、竞赛、以游戏方式结合的新型学习平台，融入多种场景在线题型，集实战、理论、避味于一体');
INSERT INTO `tools_ctf_webs` VALUES ('5', 'https://www.ctfhub.com/#/calendar', 'CTFHub', 'https://www.ctfhub.com/img/ctfhub_logo.0265db54.svg', '暂无简介');
INSERT INTO `tools_ctf_webs` VALUES ('6', 'https://ctf.show/register', 'CTFShow', 'https://ctf.show/files/3610e17797f646d95cbef131154b8c08/logo2.png', 'CTFSHOW\r\n——萌新入门的好地方\r\n\r\n拥有 1500+ 的原创题目\r\n欢乐 有爱 的学习氛围\r\n超过 10000+ CTFer的共同打造');
INSERT INTO `tools_ctf_webs` VALUES ('7', 'http://www.websec.fr/#', 'WebSec', 'https://pics0.baidu.com/feed/e824b899a9014c0865855ad9cde907037af4f4a9.png@f_auto?token=98f4a04789971a03c28f97d0e5e8da66', 'This is a wargame site providing various web-based challenges');
INSERT INTO `tools_ctf_webs` VALUES ('8', 'https://ctflearn.com/', 'CTFLearn', 'https://pics6.baidu.com/feed/77c6a7efce1b9d168d46ca38474cb1848d546407.png@f_auto?token=9f8c17050c757fd2810290cd807e2cf7', 'The most beginner-friendly way to get into hacking.');
INSERT INTO `tools_ctf_webs` VALUES ('9', 'https://buuoj.cn/', 'BUUCTF', 'https://img.buuoj.cn/buugirl/img.php', '欢迎访问\r\nBUUCTF');
INSERT INTO `tools_ctf_webs` VALUES ('10', 'https://www.bugku.com/', 'bugku', 'https://www.bugku.com/template/bygsjw/image/logo.png', 'Powered by Discuz © 2016-2021 Bugku.');
INSERT INTO `tools_ctf_webs` VALUES ('11', 'https://www.ichunqiu.com/battalion?t=1', 'i春秋', 'https://static2.ichunqiu.com/icq/resources/images/template/logo.png?v=1.0', '培育信息时代的安全感');
INSERT INTO `tools_ctf_webs` VALUES ('12', 'https://www.isclab.org.cn/', 'isclab', 'http://www.isclab.org.cn/wp-content/uploads/2019/12/BFS_logo_%E7%8E%AF%E5%BD%A2_%E5%8E%9F%E8%89%B2.gif', '北京理工大学信息系统及安全对抗实验中心成立于2009年，其前身为信息与电子学院信息安全与对抗技术实验室');
INSERT INTO `tools_ctf_webs` VALUES ('13', 'https://www.hetianlab.com/', '合天网安实验室', 'https://www.shentoushi.top/Public/home/images/icons/hetianlab.ico', '合天网安实验室提供在线实验与课程,包含web安全\\渗透测试\\密码学应用\\软件安全\\CTF挑战\\漏洞挖掘等多方面的内容,大量靶场实战提升操作能力,助你快速成长');

-- ----------------------------
-- Table structure for tools_tools
-- ----------------------------
DROP TABLE IF EXISTS `tools_tools`;
CREATE TABLE `tools_tools` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img_src` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tools_tools
-- ----------------------------
INSERT INTO `tools_tools` VALUES ('66', 'http://www.hiencode.com/base64.html', 'Base在线编解码', 'http://www.hiencode.com/static/images/ctf/code.png', 'Base64、Base32、Base16');
INSERT INTO `tools_tools` VALUES ('67', 'http://www.hiencode.com/hex.html', 'Hex在线编解码', 'http://www.hiencode.com/static/images/ctf/hex.png', 'Hex，十六进制编码转换');
INSERT INTO `tools_tools` VALUES ('68', 'http://www.hiencode.com/url.html', 'URL在线编解码', 'http://www.hiencode.com/static/images/ctf/url.png', 'Url');
INSERT INTO `tools_tools` VALUES ('69', 'http://www.hiencode.com/quoted.html', 'Quoted在线编解码', 'http://www.hiencode.com/static/images/ctf/quoted.png', 'Quoted-printable');
INSERT INTO `tools_tools` VALUES ('70', 'http://www.hiencode.com/mimetypes.html', '获取http消息头应用类型', 'http://www.hiencode.com/static/images/ctf/mimetypes.png', '获取http消息头应用类型');
INSERT INTO `tools_tools` VALUES ('71', 'http://www.hiencode.com/html_en.html', 'HTML在线编解码', 'http://www.hiencode.com/static/images/ctf/html.png', 'Html');
INSERT INTO `tools_tools` VALUES ('72', 'http://www.hiencode.com/escape.html', 'Escape在线编解码', 'http://www.hiencode.com/static/images/ctf/escape.png', 'Escape');
INSERT INTO `tools_tools` VALUES ('73', 'http://www.hiencode.com/tapcode.html', '敲击码', 'http://www.hiencode.com/static/images/ctf/tapcode.png', 'Tap code');
INSERT INTO `tools_tools` VALUES ('74', 'http://www.hiencode.com/morse.html', '莫尔斯电码', 'http://www.hiencode.com/static/images/ctf/morse.png', 'Morse code');
INSERT INTO `tools_tools` VALUES ('75', 'http://www.hiencode.com/hash.html', '哈希计算', 'http://www.hiencode.com/static/images/ctf/hash.png', 'Hash');
INSERT INTO `tools_tools` VALUES ('76', 'http://www.hiencode.com/caes.html', 'AES在线加解密', 'http://www.hiencode.com/static/images/ctf/aes.png', '支持5种模式，5种填充');
INSERT INTO `tools_tools` VALUES ('77', 'http://www.hiencode.com/cdes.html', 'DES在线加解密', 'http://www.hiencode.com/static/images/ctf/des.png', '支持5种模式，5种填充');
INSERT INTO `tools_tools` VALUES ('78', 'http://www.hiencode.com/tdes.html', '3DES在线加解密', 'http://www.hiencode.com/static/images/ctf/3des.png', '支持5种模式，5种填充');
INSERT INTO `tools_tools` VALUES ('79', 'http://www.hiencode.com/rc4.html', 'RC4在线加解密', 'http://www.hiencode.com/static/images/ctf/rc4.png', '多种字符集、Base64输出');
INSERT INTO `tools_tools` VALUES ('80', 'http://www.hiencode.com/jinzhi.html', '进制转换', 'http://www.hiencode.com/static/images/ctf/int.png', 'ASCII、任意进制转换');
INSERT INTO `tools_tools` VALUES ('81', 'http://www.hiencode.com/base36w.html', 'Base36在线编解码', 'http://www.hiencode.com/static/images/ctf/base36.png', 'Base36，支持整数');
INSERT INTO `tools_tools` VALUES ('82', 'http://www.hiencode.com/base58w.html', 'Base58在线编解码', 'http://www.hiencode.com/static/images/ctf/base58.png', '字符母表，支持中文编码');
INSERT INTO `tools_tools` VALUES ('83', 'http://www.hiencode.com/base62.html', 'Base62在线编解码', 'http://www.hiencode.com/static/images/ctf/base62.png', 'Base62，整数与字符串互转');
INSERT INTO `tools_tools` VALUES ('84', 'http://www.hiencode.com/base91.html', 'Base91在线编解码', 'http://www.hiencode.com/static/images/ctf/base91.png', 'Base91，整数与字符串互转');
INSERT INTO `tools_tools` VALUES ('85', 'http://www.hiencode.com/pub_asys.html', '公钥解析', 'http://www.hiencode.com/static/images/ctf/pubkey.png', '获取加密类型、n、e等参数');
INSERT INTO `tools_tools` VALUES ('86', 'http://www.hiencode.com/priv_asys.html', '提取RS私钥的构成元素，如n、e、d、p、q', 'http://www.hiencode.com/static/images/ctf/rsa_asys.png', '提取私钥的n、e、d、p、q');
INSERT INTO `tools_tools` VALUES ('87', 'http://www.hiencode.com/base92.html', 'Base92在线编解码', 'http://www.hiencode.com/static/images/ctf/base92.png', 'Base92在线编码、解码');
INSERT INTO `tools_tools` VALUES ('88', 'http://www.hiencode.com/base85.html', 'Base85在线编解码', 'http://www.hiencode.com/static/images/ctf/base85.png', 'Base85在线编码、解码');
INSERT INTO `tools_tools` VALUES ('89', 'http://www.hiencode.com/cencode.html', 'ASCII编码转换', 'http://www.hiencode.com/static/images/ctf/unicode.png', 'Unicode、UTF-16、UTF-32');
INSERT INTO `tools_tools` VALUES ('90', 'http://www.hiencode.com/adfgx.html', 'ADFG Cipher', 'http://www.hiencode.com/static/images/ctf/adfg.png', 'ADFG Cipher');
INSERT INTO `tools_tools` VALUES ('91', 'http://www.hiencode.com/adfgvx.html', 'ADFGVX Cipher', 'http://www.hiencode.com/static/images/ctf/adfgv.png', 'ADFGVX Cipher');
INSERT INTO `tools_tools` VALUES ('92', 'http://www.hiencode.com/affine.html', 'Affine Cipher', 'http://www.hiencode.com/static/images/ctf/affine.png', 'Affine Cipher');
INSERT INTO `tools_tools` VALUES ('93', 'http://www.hiencode.com/autokey.html', 'Autokey Cipher', 'http://www.hiencode.com/static/images/ctf/autokey.png', 'Autokey Cipher');
INSERT INTO `tools_tools` VALUES ('94', 'http://www.hiencode.com/atbash.html', 'Atbash Cipher', 'http://www.hiencode.com/static/images/ctf/atbash.png', 'Atbash Cipher');
INSERT INTO `tools_tools` VALUES ('95', 'http://www.hiencode.com/beaufort.html', 'Beaufort Cipher', 'http://www.hiencode.com/static/images/ctf/beaufort.png', 'Beaufort Cipher');
INSERT INTO `tools_tools` VALUES ('96', 'http://www.hiencode.com/bifid.html', 'Bifid Cipher', 'http://www.hiencode.com/static/images/ctf/bifid.png', 'Bifid Cipher');
INSERT INTO `tools_tools` VALUES ('97', 'http://www.hiencode.com/caesar.html', 'Caesar Cipher', 'http://www.hiencode.com/static/images/ctf/caesar.png', 'Caesar Cipher');
INSERT INTO `tools_tools` VALUES ('98', 'http://www.hiencode.com/colum.html', 'Columnar Transposition Cipher', 'http://www.hiencode.com/static/images/ctf/columnar.png', 'Columnar Transposition Cipher');
INSERT INTO `tools_tools` VALUES ('99', 'http://www.hiencode.com/#', 'Enigma M3 Cipher', 'http://www.hiencode.com/static/images/ctf/enigma.png', 'Enigma M3 Cipher');
INSERT INTO `tools_tools` VALUES ('100', 'http://www.hiencode.com/four.html', 'Foursquare Cipher', 'http://www.hiencode.com/static/images/ctf/foursquare.png', 'Foursquare Cipher');
INSERT INTO `tools_tools` VALUES ('101', 'http://www.hiencode.com/gronsfeld.html', 'Gronsfeld Cipher', 'http://www.hiencode.com/static/images/ctf/gronsfeld.png', 'Gronsfeld Cipher');
INSERT INTO `tools_tools` VALUES ('102', 'http://www.hiencode.com/#', 'M-209 Cipher', 'http://www.hiencode.com/static/images/ctf/m209.png', 'M-209 Cipher');
INSERT INTO `tools_tools` VALUES ('103', 'http://www.hiencode.com/playfair.html', 'Playfair Cipher', 'http://www.hiencode.com/static/images/ctf/playfair.png', 'Playfair Cipher');
INSERT INTO `tools_tools` VALUES ('104', 'http://www.hiencode.com/#', 'Polybius Square Cipher', 'http://www.hiencode.com/static/images/ctf/polybius.png', 'Polybius Square Cipher');
INSERT INTO `tools_tools` VALUES ('105', 'http://www.hiencode.com/porta.html', 'Porta Cipher', 'http://www.hiencode.com/static/images/ctf/porta.png', 'Porta Cipher');
INSERT INTO `tools_tools` VALUES ('106', 'http://www.hiencode.com/railfence.html', 'Railfence Cipher', 'http://www.hiencode.com/static/images/ctf/railfence.png', 'Railfence Cipher');
INSERT INTO `tools_tools` VALUES ('107', 'http://www.hiencode.com/rot13.html', 'Rot13 Cipher', 'http://www.hiencode.com/static/images/ctf/rot13.png', 'Rot13 Cipher');
INSERT INTO `tools_tools` VALUES ('108', 'http://www.hiencode.com/simple.html', 'Simple Substitution Cipher', 'http://www.hiencode.com/static/images/ctf/simple.png', 'Simple Substitution Cipher');
INSERT INTO `tools_tools` VALUES ('109', 'http://www.hiencode.com/vigenere.html', 'Vigenere Cipher', 'http://www.hiencode.com/static/images/ctf/vigenere.png', 'Vigenere Cipher');
INSERT INTO `tools_tools` VALUES ('110', 'http://www.hiencode.com/pigpen.html', 'Pigpen Cipher', 'http://www.hiencode.com/static/images/ctf/pig.png', 'Pigpen Cipher');
INSERT INTO `tools_tools` VALUES ('111', 'http://www.hiencode.com/yd_pigpen.html', 'Pigpen Cipher', 'http://www.hiencode.com/static/images/ctf/pig.png', 'Pigpen Cipher');
INSERT INTO `tools_tools` VALUES ('112', 'http://www.hiencode.com/baconian.html', 'Baconian Cipher', 'http://www.hiencode.com/static/images/ctf/peigen.png', 'Baconian Cipher');
INSERT INTO `tools_tools` VALUES ('113', 'http://www.hiencode.com/runkey.html', 'Running Key Cipher', 'http://www.hiencode.com/static/images/ctf/runkey.png', 'Running Key Cipher');
INSERT INTO `tools_tools` VALUES ('114', 'http://www.hiencode.com/#', 'Hill Cipher', 'http://www.hiencode.com/static/images/ctf/hill.png', 'Hill Cipher');
INSERT INTO `tools_tools` VALUES ('115', 'http://www.hiencode.com/keyword.html', 'Keyword Cipher', 'http://www.hiencode.com/static/images/ctf/keyword.png', 'Keyword Cipher');
INSERT INTO `tools_tools` VALUES ('116', 'http://www.hiencode.com/a1z26.html', 'A1z26 Cipher', 'http://www.hiencode.com/static/images/ctf/a1z26.png', 'A1z26 Cipher');
INSERT INTO `tools_tools` VALUES ('117', 'http://www.hiencode.com/xxencode.html', 'XXencode', 'http://www.hiencode.com/static/images/ctf/xxencode.png', 'XXencode');
INSERT INTO `tools_tools` VALUES ('118', 'http://www.hiencode.com/uu.html', 'UUencode', 'http://www.hiencode.com/static/images/ctf/uuencode.png', 'UUencode');
INSERT INTO `tools_tools` VALUES ('119', 'http://www.hiencode.com/ppencode.html', 'PPencode', 'http://www.hiencode.com/static/images/ctf/ppencode.png', 'PPencode');
INSERT INTO `tools_tools` VALUES ('120', 'http://www.hiencode.com/aaencode.html', 'AAencode', 'http://www.hiencode.com/static/images/ctf/aaencode.png', 'AAencode');
INSERT INTO `tools_tools` VALUES ('121', 'http://www.hiencode.com/jjencode.html', 'JJencode', 'http://www.hiencode.com/static/images/ctf/jjencode.png', 'JJencode');
INSERT INTO `tools_tools` VALUES ('122', 'http://www.hiencode.com/cvencode.html', '社会主义核心价值观', 'http://www.hiencode.com/static/images/ctf/rrencode.png', '社会主义核心价值观，学习一下');
INSERT INTO `tools_tools` VALUES ('123', 'http://www.hiencode.com/jsfuck.html', 'JSfuck', 'http://www.hiencode.com/static/images/ctf/jsfuck.png', 'JSfuck，玩一下');
INSERT INTO `tools_tools` VALUES ('124', 'http://www.hiencode.com/brain.html', 'Brainfuck', 'http://www.hiencode.com/static/images/ctf/brainfuck.png', 'Brainfuck，玩一下');
INSERT INTO `tools_tools` VALUES ('125', 'http://www.hiencode.com/bubble.html', 'Babble', 'http://www.hiencode.com/static/images/ctf/bubble.png', 'BubbleBabble');
INSERT INTO `tools_tools` VALUES ('126', 'http://www.hiencode.com/handycode.html', 'Handycode', 'http://www.hiencode.com/static/images/ctf/handycode.png', 'Handycode');
INSERT INTO `tools_tools` VALUES ('127', 'http://www.hiencode.com/punycode.html', 'Punycode', 'http://www.hiencode.com/static/images/ctf/puny.png', 'Punycode');
INSERT INTO `tools_tools` VALUES ('128', 'http://www.hiencode.com/#', 'Poemcode', 'http://www.hiencode.com/static/images/ctf/poem.png', 'Poemcode');
INSERT INTO `tools_tools` VALUES ('129', 'http://www.hiencode.com/web_socket.html', '在线WebSocket链路测试，发送数据', 'http://www.hiencode.com/static/images/ctf/websocket.png', 'WebSocket链路测试，发送数据');
INSERT INTO `tools_tools` VALUES ('130', 'http://www.hiencode.com/http_head.html', '查看请求的响应头信息，支持HTTP、HTTPS', 'http://www.hiencode.com/static/images/ctf/http_head.png', '查看请求的响应头信息');
INSERT INTO `tools_tools` VALUES ('131', 'http://www.atoolbox.net/Tool.php?Id=699', '图片隐写术', 'https://img.tukuppt.com/bg_grid/00/04/87/JxKPBztK6d.jpg%21/fh/350', '这个工具可以在图片中隐藏文字信息，并且不影响图片的显示');

-- ----------------------------
-- Table structure for vulscan_scanresult
-- ----------------------------
DROP TABLE IF EXISTS `vulscan_scanresult`;
CREATE TABLE `vulscan_scanresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `target_url` varchar(200) NOT NULL,
  `target_id` varchar(50) NOT NULL,
  `scan_id` varchar(50) NOT NULL,
  `low_vulns` int unsigned NOT NULL,
  `medium_vulns` int unsigned NOT NULL,
  `high_vulns` int unsigned NOT NULL,
  `total_vulns` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `task_status` varchar(50) NOT NULL,
  `info_vulns` int unsigned NOT NULL,
  `scan_mode` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `vulscan_scanresult_chk_1` CHECK ((`low_vulns` >= 0)),
  CONSTRAINT `vulscan_scanresult_chk_2` CHECK ((`medium_vulns` >= 0)),
  CONSTRAINT `vulscan_scanresult_chk_3` CHECK ((`high_vulns` >= 0)),
  CONSTRAINT `vulscan_scanresult_chk_4` CHECK ((`total_vulns` >= 0)),
  CONSTRAINT `vulscan_scanresult_chk_5` CHECK ((`info_vulns` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of vulscan_scanresult
-- ----------------------------
INSERT INTO `vulscan_scanresult` VALUES ('8', 'http://127.0.0.1', '84c8d0f0-1d6a-448e-b24e-13b2a585f780', 'b748696b-6a0e-43d7-8012-c4a571cdcd6c', '0', '0', '0', '0', '2023-04-17 12:43:49.301404', 'completed', '0', 'High Risk Vulnerabilities');
INSERT INTO `vulscan_scanresult` VALUES ('9', 'http://www.baidu.com', '35f17ef9-f434-44a6-a66d-6e645ce2dacf', '7ae01344-9a89-491e-b1f0-e7d87651b9d9', '0', '0', '0', '0', '2023-04-18 11:08:44.867971', 'completed', '0', 'Recheck File_Inclusion');
INSERT INTO `vulscan_scanresult` VALUES ('10', 'http://www.baidu.com', '034e8600-2935-4cba-86c0-5656d70def94', '93066ade-d421-4fbe-86bd-9c27042f6e26', '21', '7', '0', '31', '2023-04-18 15:37:41.991177', 'completed', '3', 'Full Scan');
INSERT INTO `vulscan_scanresult` VALUES ('11', 'http://127.0.0.1', '278b54da-92f0-4354-bb34-e2bf50cd0772', 'd9275a55-16f6-4ec3-bdbb-24feca9f09ce', '0', '0', '0', '0', '2023-04-20 12:54:55.174616', 'completed', '0', 'Full Scan');
INSERT INTO `vulscan_scanresult` VALUES ('12', 'http://127.0.0.1', 'f9491a8b-0ebe-4c75-8d40-28be6289eded', '3858e167-53c2-4f9e-b5c0-62da3afe4d4a', '0', '0', '0', '0', '2023-04-20 13:00:18.449056', 'completed', '0', 'Crawl Only');
INSERT INTO `vulscan_scanresult` VALUES ('13', 'http://127.0.0.1', 'eced9ed2-6484-4a1b-8323-0afc95fb20b0', '9a63d3aa-8b7d-4311-8ce2-1b056c078383', '0', '0', '0', '0', '2023-04-20 13:00:50.068269', 'completed', '0', 'Malware Scan');
INSERT INTO `vulscan_scanresult` VALUES ('14', 'http://www.baidu.com', '3b4f9db1-8c65-42d5-acda-727a730b9a32', '00bdf565-f511-4383-baf0-5e2175bc53ac', '0', '0', '0', '0', '2023-04-20 13:14:06.173568', 'completed', '0', 'Crawl Only');
INSERT INTO `vulscan_scanresult` VALUES ('15', 'www.baidu.com', '42e48c62-b1bb-4099-b4fd-99aa529655b0', '429698c3-1232-49bc-bef8-008e0d5f9d33', '29', '10', '3', '46', '2023-08-01 18:10:59.558629', 'completed', '4', 'Full Scan');

-- ----------------------------
-- Table structure for webscan_article_info
-- ----------------------------
DROP TABLE IF EXISTS `webscan_article_info`;
CREATE TABLE `webscan_article_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_href` varchar(100) NOT NULL,
  `article_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `author_image_url` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of webscan_article_info
-- ----------------------------
INSERT INTO `webscan_article_info` VALUES ('1', 'https://www.freebuf.com/vuls/364212.html', '364212', 'Weblogic CVE 2023-21839漏洞复现', 'WebLogic 存在远程代码执行漏洞（CVE-2023-21839/CNVD-2023-04389），由于Weblogic IIOP/T3...', 'https://image.3001.net/images/20230420/1681977131_6440ef2b471c78147b5d8.png', 'lbug', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-04-20');
INSERT INTO `webscan_article_info` VALUES ('2', 'https://www.freebuf.com/vuls/363700.html', '363700', '详解Nodejs中命令执行原型链污染等漏洞', '仅供各位学习，还请各位师傅们点评。', 'https://image.3001.net/images/20230419/1681903326_643fcede1493d35921362.jpg!small', 'superLeeH', 'https://image.3001.net/images/20210326/1616743364_605d8bc401f71d3c3cbd8.png', '2023-04-14');
INSERT INTO `webscan_article_info` VALUES ('3', 'https://www.freebuf.com/vuls/363647.html', '363647', 'CVE-2023-28432 MiniO信息泄露到RCE', 'MinIO 是一个基于 Apache License v2.0 开源协议的对象存储服务。', 'https://image.3001.net/images/20230414/1681466150_64392326e861df5c6515f.png', 'Ocean', 'https://image.3001.net/images/20211215/1639581163_61ba05ebeb81e716e68db.png', '2023-04-14');
INSERT INTO `webscan_article_info` VALUES ('4', 'https://www.freebuf.com/vuls/363435.html', '363435', 'SQL Injection(Blind)-黑盒测试', '盲注全级别黑盒测试', 'https://image.3001.net/images/20230413/1681348243_64375693759cac37d4f6f.png', '新之助', 'https://image.3001.net/images/20230327/1679879074_6420eba277b9e1b82f2b7.png', '2023-04-13');
INSERT INTO `webscan_article_info` VALUES ('5', 'https://www.freebuf.com/vuls/363434.html', '363434', 'SQL Injection-黑盒测试', 'SQL回显注入全级别黑盒测试', 'https://image.3001.net/images/20230418/1681816492_643e7bacd382d2120fdea.jpg!small', '新之助', 'https://image.3001.net/images/20230327/1679879074_6420eba277b9e1b82f2b7.png', '2023-04-13');
INSERT INTO `webscan_article_info` VALUES ('6', 'https://www.freebuf.com/vuls/363295.html', '363295', 'File Upload-黑盒测试', '文件上传漏洞黑盒测试', 'https://image.3001.net/images/20230423/1682230312_6444cc28a59d2733eda11.jpg!small', '新之助', 'https://image.3001.net/images/20230327/1679879074_6420eba277b9e1b82f2b7.png', '2023-04-12');
INSERT INTO `webscan_article_info` VALUES ('7', 'https://www.freebuf.com/vuls/363284.html', '363284', '病毒丨3601lpk劫持病毒分析', '3601lpk劫持病毒分析。', 'https://image.3001.net/images/20230411/1681222824_64356ca868f2f617c4a49.png', '极安御信安全研究院', 'https://image.3001.net/images/20220602/1654103164_62979c7cbd33f39c6cab2.png', '2023-04-11');
INSERT INTO `webscan_article_info` VALUES ('8', 'https://www.freebuf.com/vuls/363237.html', '363237', '免杀不是万能，修改流量特征是关键——一个关于免杀的网络安全事件分享', '总而言之，免杀不是万能的，修改流量特征才是关键。', 'https://image.3001.net/images/20230411/1681203456_643521009061c16a0bdc3.png', '左家庄的赵姑娘', 'https://image.3001.net/images/20210324/1616566790_605ada06e4e760c86d275.png', '2023-04-11');
INSERT INTO `webscan_article_info` VALUES ('9', 'https://www.freebuf.com/vuls/363050.html', '363050', 'java反序列化CC7链', 'JDK1.0引入，实现Map接口，用于存储K，V键值对的集合类。 主要特点：Key不可为空、多线程安全、无序。底层采用数组 + 链表 的结构...', 'https://image.3001.net/images/20230411/1681179402_6434c30ad05b4adcd3b23.jpg!small', 'c0rr1y', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-04-09');
INSERT INTO `webscan_article_info` VALUES ('10', 'https://www.freebuf.com/vuls/362933.html', '362933', 'Metasploit之Msfvenom实战渗透', 'Metasploit之Msfvenom实战渗透自己电脑。', 'https://image.3001.net/images/20230407/1680861896_642feac8cda7f45ac615d.png!small', 'Hnucm_Security', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-04-07');
INSERT INTO `webscan_article_info` VALUES ('11', 'https://www.freebuf.com/vuls/362838.html', '362838', 'SQL注入万字文章详解', 'SQL注入详解', 'https://image.3001.net/images/20230407/1680828663_642f68f7b217d448a334d.png', '追光者Top', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-04-07');
INSERT INTO `webscan_article_info` VALUES ('12', 'https://www.freebuf.com/vuls/362799.html', '362799', 'ThinkPHP多语言rce复现分析', '前段时间爆出的ThinkPHP多语言rce很有意思，最近刚好有时间就学习一下。', 'https://image.3001.net/images/20230406/1680773791_642e929f88490bac88deb.png', '雷石安全实验室', 'https://image.3001.net/images/20211206/1638778782_61adc79e071131a1c1fc5.png', '2023-04-06');
INSERT INTO `webscan_article_info` VALUES ('13', 'https://www.freebuf.com/vuls/362777.html', '362777', 'Mysql LOAD DATA读取客户端任意文件', 'MySQL客户端和服务端通信过程中是通过对话的形式来实现的，客户端发送一个操作请求，然后服务端根据客户端发送的请求来响应客户端，在这个过程中...', 'https://image.3001.net/images/20230406/1680767762_642e7b121edf120ab8e6f.png', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-04-06');
INSERT INTO `webscan_article_info` VALUES ('14', 'https://www.freebuf.com/vuls/362682.html', '362682', '暴雷漏洞', '视频制作不易，求三联支持，拜谢~+公众账号（极安御信安全研究院/北京极安御信安全研究院）报暗号：“资料” 即可领取视频相关工具、源码、学习...', 'https://image.3001.net/images/20230405/1680691559_642d5167ba49c5ed8942b.png', '极安御信安全研究院', 'https://image.3001.net/images/20220602/1654103164_62979c7cbd33f39c6cab2.png', '2023-04-05');
INSERT INTO `webscan_article_info` VALUES ('15', 'https://www.freebuf.com/vuls/362673.html', '362673', 'Java渗透测试靶场“天境”通关系列：XSS', '天境是一款基于Java编写的经典渗透测试靶场。本文是针对其中的经典关卡XSS关卡(共16关)进行通关讲解。不同于其他靶场，天境的XSS关卡非...', 'https://image.3001.net/images/20230405/1680674029_642d0ced767da72bff4b9.png', '安全大头兵', 'https://image.3001.net/images/20220707/1657165136_62c65550237035fa3ee29.png', '2023-04-05');
INSERT INTO `webscan_article_info` VALUES ('16', 'https://www.freebuf.com/vuls/361294.html', '361294', '客户现场的一次PostgreSQL注入', '记一次在客户现场的PostgreSQL注入后，引发的所有用户登录失败的渗透经历。', 'https://image.3001.net/images/20230330/1680176315_642574bbe65259664da6a.jpg!small', 'GetFlags', 'https://image.3001.net/images/20221011/1665469875_63450db37a58bf740d7e9.png', '2023-04-05');
INSERT INTO `webscan_article_info` VALUES ('17', 'https://www.freebuf.com/vuls/362664.html', '362664', 'Python反序列化中的Opcode构造原理', 'pickle实际上可以看作一种独立的语言，通过对opcode的更改编写可以执行python代码、覆盖变量等操作。', 'https://image.3001.net/images/20230413/1681359902_6437841e1839962c97cfb.jpg!small', 'superLeeH', 'https://image.3001.net/images/20210326/1616743364_605d8bc401f71d3c3cbd8.png', '2023-04-04');
INSERT INTO `webscan_article_info` VALUES ('18', 'https://www.freebuf.com/vuls/362578.html', '362578', '小皮1-click漏洞的代码审计学习笔记', '漏洞起源于前段时间比较火的小皮 1-click 漏洞，用户名登录处缺少过滤，导致可以直接构造恶意 payload 实现存储型 XSS ，结合...', 'https://image.3001.net/images/20230404/1680593670_642bd306eadb0c30d936f.png', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-04-04');
INSERT INTO `webscan_article_info` VALUES ('19', 'https://www.freebuf.com/vuls/362384.html', '362384', 'CSRF-黑盒测试', '首先我们先来了解一下CSRF攻击条件：攻击条件：1.用户处于登录状态2.伪造的链接与正常应用请求的链接一致3.后台未对用户业务开展合法性做校...', 'https://image.3001.net/images/20230413/1681370799_6437aeaf455b2d5f6cbf8.jpg!small', '新之助', 'https://image.3001.net/images/20230327/1679879074_6420eba277b9e1b82f2b7.png', '2023-04-03');
INSERT INTO `webscan_article_info` VALUES ('20', 'https://www.freebuf.com/vuls/362369.html', '362369', 'Command Injection-代码审计', 'Low级别：源码：1.首先使用isset函数判断是否接收到了POST型的Submit参数值，如果接收到了代表用户提交数据接着使用$_REQU...', 'https://image.3001.net/images/20230402/1680438164_64297394765100c0508ff.png', '新之助', 'https://image.3001.net/images/20230327/1679879074_6420eba277b9e1b82f2b7.png', '2023-04-02');
INSERT INTO `webscan_article_info` VALUES ('21', 'https://www.freebuf.com/vuls/364470.html', '364470', '【漏洞复现】利用禅道系统RCE命令执行漏洞反弹shell', '禅道命令执行漏洞复现', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '十九线菜鸟学安全', 'https://image.3001.net/images/20221102/1667402244_63628a0407e70a9989142.png', '2023-04-23');
INSERT INTO `webscan_article_info` VALUES ('22', 'https://www.freebuf.com/vuls/363996.html', '363996', 'sql漏洞快速挖掘并快速筛选', '这篇文章我想写一下使用google hacking收集网址，并用sqlmap自动化扫描，最后筛选出存在注入的网址，用于提交到漏洞盒子（或者别...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '安达与岛村1', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-04-18');
INSERT INTO `webscan_article_info` VALUES ('23', 'https://www.freebuf.com/vuls/375383.html', '375383', '一例ReactNative App分析', 'RN使用Javascript语言，类似于HTML的JSX，以及CSS来开发移动应用。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '雷石安全实验室', 'https://image.3001.net/images/20211206/1638778782_61adc79e071131a1c1fc5.png', '2023-08-18');
INSERT INTO `webscan_article_info` VALUES ('24', 'https://www.freebuf.com/vuls/374965.html', '374965', 'Smartbi 修改用户密码漏洞', '通过查看 Smartbi 的补丁包信息，发现存在漏洞在某种特定情况下修改用户的密码，进行简单的复现和分析。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-08-15');
INSERT INTO `webscan_article_info` VALUES ('25', 'https://www.freebuf.com/vuls/374757.html', '374757', 'Dedecms V110最新版RCE---Tricks', '刚发现Dedecms更新了发布版本，顺便测试一下之前的day有没有修复，突然想到了新的tricks去实现RCE。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-08-14');
INSERT INTO `webscan_article_info` VALUES ('26', 'https://www.freebuf.com/vuls/374609.html', '374609', 'NPS未授权访问漏洞详解', 'NPS是一款轻量级、高性能、功能强大的内网渗透代理服务器，具有强大的Web管理终端。在红蓝队攻防战经常被用来进行内网穿透，流量代理。相比...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'yitaiqi', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-08-11');
INSERT INTO `webscan_article_info` VALUES ('27', 'https://www.freebuf.com/vuls/374356.html', '374356', '一次暴露面全开的红帽渗透测试【getshell】', '本次测试周期长，测试目标暴露点多，非常有趣的一次渗透实战。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-08-10');
INSERT INTO `webscan_article_info` VALUES ('28', 'https://www.freebuf.com/vuls/374262.html', '374262', 'OpenSSL 心脏滴血漏洞(CVE-2014-0160)', 'Heartbleed漏洞，这项严重缺陷(CVE-2014-0160)的产生是由于未能在memcpy()调用受害用户输入内容作为长度参数之前正...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '睡不醒的阿茶', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-08-09');
INSERT INTO `webscan_article_info` VALUES ('29', 'https://www.freebuf.com/vuls/374261.html', '374261', '聚焦Web前端安全：最新揭秘漏洞防御方法 | 京东云技术团队', '在 Web 安全中，服务端一直扮演着十分重要的角色。然而前端的问题也不容小觑，它也会导致信息泄露等诸如此类的问题。在这篇文章中，我们将向读者...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '京东云技术团队', 'https://image.3001.net/images/20230609/1686293498_6482cbfa295f755223a6e.png', '2023-08-09');
INSERT INTO `webscan_article_info` VALUES ('30', 'https://www.freebuf.com/vuls/374256.html', '374256', 'DVWA——SQL注入', '接上文SQL注入讲解，此篇为SQL注入实战。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '睡不醒的阿茶', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-08-09');
INSERT INTO `webscan_article_info` VALUES ('31', 'https://www.freebuf.com/vuls/289710.html', '289710', 'Spring Boot框架敏感信息泄露的完整介绍与SRC实战(附专属字典与PoC)', 'Spring框架功能很强大，但是就算是一个很简单的项目，我们也要配置很多东西，因此就有了Spring Boot框架。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'Johnson666', 'https://image.3001.net/images/20210616/1623842546_60c9def2397d6a78c2066.png', '2023-08-06');
INSERT INTO `webscan_article_info` VALUES ('32', 'https://www.freebuf.com/vuls/373696.html', '373696', 'Log4j2 JNDI注入漏洞(CVE-2021-44228)', '在java开发主流的框架中，比如springboot，大部分都是将log4j2作为日志管理工具。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'XiLitter', 'https://image.3001.net/images/20230321/1679381058_641952425c6fa0fcf998e.png', '2023-08-02');
INSERT INTO `webscan_article_info` VALUES ('33', 'https://www.freebuf.com/vuls/373669.html', '373669', '浅析白盒白名单SQL注入绕过利用', '洞就送在眼前了，只需要变通一下，就可以成为一个新的洞了。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'Met32', 'https://image.3001.net/images/20220120/1642679155_61e94b73d247ac30f997d.png', '2023-08-02');
INSERT INTO `webscan_article_info` VALUES ('34', 'https://www.freebuf.com/vuls/373587.html', '373587', 'Apache RocketMQ 远程代码执行漏洞（CVE-2023-33246）分析', 'RocketMQ的NameServer、Broker、Controller等多个组件外网泄露，缺乏权限验证，攻击者可以利用该漏洞利用更新配置...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-08-01');
INSERT INTO `webscan_article_info` VALUES ('35', 'https://www.freebuf.com/vuls/373512.html', '373512', 'Apache RocketMQ 远程代码执行漏洞（CVE-2023-37582）', '由于对 CVE-2023-33246 修复不完善，导致在Apache RocketMQ NameServer 存在未授权访问的情况下，攻击者...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-08-01');
INSERT INTO `webscan_article_info` VALUES ('36', 'https://www.freebuf.com/vuls/373422.html', '373422', '干货 | CVE-2023-21768漏洞分析与利用', 'windows提权漏洞,漏洞位在afd.sys AfdNotifyRemoveIoCompletion函数中.', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'ashl', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-07-30');
INSERT INTO `webscan_article_info` VALUES ('37', 'https://www.freebuf.com/vuls/373401.html', '373401', '对 Conic Finance攻击事件的解读', '在 2023.07.21  Conic Finance的被攻击 造成项目方损失3.5million美元的损失的,本文对此次攻击事件进行解读', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '怕瓦落地', 'https://image.3001.net/images/20221008/1665190343_6340c9c71d8dc4c52ed1d.png', '2023-07-30');
INSERT INTO `webscan_article_info` VALUES ('38', 'https://www.freebuf.com/vuls/373397.html', '373397', '浅谈AFL++ fuzzing（上）：如何用进行有效且规整的fuzzing', '适用于白盒fuzzing.', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'Cheney辰星', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-07-29');
INSERT INTO `webscan_article_info` VALUES ('39', 'https://www.freebuf.com/vuls/373393.html', '373393', 'hevd-windows内核漏洞练习-BUFFER_OVERFLOW_STACK', 'hevd windows内核漏洞练习-BUFFER_OVERFLOW_STACK使用的环境是hevd的windows 内核漏洞靶场.直接找到...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'ashl', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-07-28');
INSERT INTO `webscan_article_info` VALUES ('40', 'https://www.freebuf.com/vuls/373392.html', '373392', 'afl-fuzz源码分析', 'afl-fuzz源码分析GCC编译流程预处理（Preprocessing）：对源代码进行预处理，如宏替换、条件编译等，生成经过预处理的源代码...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', 'ashl', 'https://image.3001.net/images/index/wp-user-avatar-50x50.png', '2023-07-28');
INSERT INTO `webscan_article_info` VALUES ('41', 'https://www.freebuf.com/vuls/373382.html', '373382', 'Hutool 路径遍历漏洞 CVE-2018-17297', '0x01 概述Hutool 是一个Java工具库，提供了丰富的工具和方法，方便开发者在Java应用程序中进行各种常见任务的处理。它具有简单易...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '洞源实验室INSBUG', 'https://image.3001.net/images/20230426/1682494626_6448d4a23dcd1775c7737.png', '2023-07-28');
INSERT INTO `webscan_article_info` VALUES ('42', 'https://www.freebuf.com/vuls/373353.html', '373353', 'VMPWN的入门级别题目详解（二）', '这道题应该算是虚拟机保护的一个变种，是一个解释器类型的程序，何为解释器？解释器是一种计算机程序，用于解释和执行源代码。解释器可以理解源代码中...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-07-28');
INSERT INTO `webscan_article_info` VALUES ('43', 'https://www.freebuf.com/vuls/375389.html', '375389', '用友NC-ActionHandlerServlet反序列化漏洞分析', '通过公开信息得知，用友NC 的ActionHandlerServlet接口存在反序列化漏洞。', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '雷石安全实验室', 'https://image.3001.net/images/20211206/1638778782_61adc79e071131a1c1fc5.png', '2023-08-18');
INSERT INTO `webscan_article_info` VALUES ('44', 'https://www.freebuf.com/vuls/374621.html', '374621', 'Apache Tomcat安全限制绕过漏洞 CVE-2017-5664', '0x01 概述Apache Tomcat是一个开源的Java Servlet容器和JavaServer Pages（JSP）容器。它是由Ap...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '洞源实验室INSBUG', 'https://image.3001.net/images/20230426/1682494626_6448d4a23dcd1775c7737.png', '2023-08-11');
INSERT INTO `webscan_article_info` VALUES ('45', 'https://www.freebuf.com/vuls/374371.html', '374371', '条件竞争漏洞Double Fetch', 'Double Fetch是内核的一种漏洞类型，内核从用户空间拷贝数据时，第一次拷贝会进行安全检测，而第二次拷贝时才会进行数据的使用，那么在第...', 'https://seopic.699pic.com/photo/50060/4466.jpg_wh1200.jpg', '蚁景科技', 'https://image.3001.net/images/20210324/1616566736_605ad9d0cd5e7d6ce4ca9.png', '2023-08-10');

-- ----------------------------
-- Table structure for webscan_cwe_info
-- ----------------------------
DROP TABLE IF EXISTS `webscan_cwe_info`;
CREATE TABLE `webscan_cwe_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cwe_ranking` int unsigned NOT NULL,
  `cwe_id` varchar(50) NOT NULL,
  `cwe_name` varchar(255) NOT NULL,
  `cwe_score` decimal(5,2) NOT NULL,
  `cwe_comparison` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `webscan_cwe_info_chk_1` CHECK ((`cwe_ranking` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of webscan_cwe_info
-- ----------------------------
INSERT INTO `webscan_cwe_info` VALUES ('1', '1', 'CWE-787', '越界写入', '64.20', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('2', '2', 'CWE-79', '跨站脚本', '45.97', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('3', '3', 'CWE-89', 'SQL注入', '22.11', '3.00');
INSERT INTO `webscan_cwe_info` VALUES ('4', '4', 'CWE-20', '输入验证不当', '20.63', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('5', '5', 'CWE-125', '越界读取', '17.67', '-2.00');
INSERT INTO `webscan_cwe_info` VALUES ('6', '6', 'CWE-78', 'OS命令注入', '17.53', '-1.00');
INSERT INTO `webscan_cwe_info` VALUES ('7', '7', 'CWE-416', 'Use-After-Free', '15.50', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('8', '8', 'CWE-22', '路径遍历', '14.08', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('9', '9', 'CWE-352', '跨站请求伪造(CSRF)', '11.53', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('10', '10', 'CWE-434', '文件上传', '9.56', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('11', '11', 'CWE-476', 'NULL指针解引用', '7.15', '4.00');
INSERT INTO `webscan_cwe_info` VALUES ('12', '12', 'CWE-502', '反序列化', '6.68', '1.00');
INSERT INTO `webscan_cwe_info` VALUES ('13', '13', 'CWE-190', '整数溢出', '6.53', '-1.00');
INSERT INTO `webscan_cwe_info` VALUES ('14', '14', 'CWE-287', '身份验证不当', '6.35', '0.00');
INSERT INTO `webscan_cwe_info` VALUES ('15', '15', 'CWE-798', '使用硬编码凭证', '5.66', '1.00');
INSERT INTO `webscan_cwe_info` VALUES ('16', '16', 'CWE-862', '缺少授权', '5.53', '2.00');
INSERT INTO `webscan_cwe_info` VALUES ('17', '17', 'CWE-77', '命令注入', '5.42', '8.00');
INSERT INTO `webscan_cwe_info` VALUES ('18', '18', 'CWE-306', '缺少关键功能的身份验证', '5.15', '-7.00');
INSERT INTO `webscan_cwe_info` VALUES ('19', '19', 'CWE-119', '内存缓冲区范围内的操作限制不当', '4.85', '-2.00');
INSERT INTO `webscan_cwe_info` VALUES ('20', '20', 'CWE-276', '不正确的默认权限', '4.84', '-1.00');
INSERT INTO `webscan_cwe_info` VALUES ('21', '21', 'CWE-918', '服务器端请求伪造(SSRF)', '4.27', '3.00');
INSERT INTO `webscan_cwe_info` VALUES ('22', '22', 'CWE-362', '竞争条件', '3.57', '11.00');
INSERT INTO `webscan_cwe_info` VALUES ('23', '23', 'CWE-400', '不受控制的资源消耗', '3.56', '4.00');
INSERT INTO `webscan_cwe_info` VALUES ('24', '24', 'CWE-611', 'XML外部实体引用限制不当', '3.38', '-1.00');
INSERT INTO `webscan_cwe_info` VALUES ('25', '25', 'CWE-94', '代码注入', '3.32', '3.00');
