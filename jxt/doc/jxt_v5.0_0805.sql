/*
Navicat MySQL Data Transfer

Source Server         : JXL
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : jxt

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2013-08-05 23:56:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `comments` varchar(200) default NULL,
  `email` varchar(255) NOT NULL,
  `is_enable` bit(1) default NULL,
  `login_date` datetime default NULL,
  `login_ip` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `role_type` varchar(255) default NULL,
  `username` varchar(255) NOT NULL,
  `agent_id` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_adm_ref_agent` (`agent_id`),
  KEY `fk_adm_ref_self` (`parent_id`),
  CONSTRAINT `fk_adm_ref_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  CONSTRAINT `fk_adm_ref_self` FOREIGN KEY (`parent_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '2013-07-29 22:02:07', '2013-08-05 23:51:27', null, 'admin@admin.com', '', '2013-08-05 23:51:27', '127.0.0.1', 'admin', '8ee751118fceaf13', 'ROLE_SYS_ADMIN', 'admin', '1', null);

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_set_id` bigint(20) NOT NULL,
  `role_set_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`admin_set_id`,`role_set_id`),
  KEY `fk_role_admin_set` (`role_set_id`),
  KEY `fk_admin_role_set` (`admin_set_id`),
  CONSTRAINT `fk_admin_role_set` FOREIGN KEY (`admin_set_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_role_admin_set` FOREIGN KEY (`role_set_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `admin_school`
-- ----------------------------
DROP TABLE IF EXISTS `admin_school`;
CREATE TABLE `admin_school` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `status` int(11) NOT NULL,
  `admin_id` bigint(20) default NULL,
  `school_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_sch2adm_ref_adm` (`admin_id`),
  KEY `fk_sch2adm_ref_sch` (`school_id`),
  CONSTRAINT `fk_sch2adm_ref_adm` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_sch2adm_ref_sch` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_school
-- ----------------------------
INSERT INTO `admin_school` VALUES ('1', '2013-08-05 23:39:26', '2013-08-05 23:39:26', '1', '1', '1');
INSERT INTO `admin_school` VALUES ('2', '2013-08-05 23:39:51', '2013-08-05 23:39:51', '1', '1', '2');
INSERT INTO `admin_school` VALUES ('3', '2013-08-05 23:40:08', '2013-08-05 23:40:08', '1', '1', '3');

-- ----------------------------
-- Table structure for `agent`
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `description` longtext,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(20) default NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent
-- ----------------------------
INSERT INTO `agent` VALUES ('1', '2013-07-30 14:57:09', '2013-07-30 14:57:14', 'test', '联通家校通', '联通家校通', '1');

-- ----------------------------
-- Table structure for `busi_history`
-- ----------------------------
DROP TABLE IF EXISTS `busi_history`;
CREATE TABLE `busi_history` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `charge_phone_num` varchar(20) default NULL,
  `charge_phone_type` int(11) default NULL,
  `effect_time` datetime default NULL,
  `expired_time` datetime default NULL,
  `par_phone_send_status` int(11) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `phone_type` int(11) default NULL,
  `reason` varchar(255) default NULL,
  `student_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_cha_his_ref_stu` (`student_id`),
  CONSTRAINT `fk_cha_his_ref_stu` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of busi_history
-- ----------------------------

-- ----------------------------
-- Table structure for `busi_order`
-- ----------------------------
DROP TABLE IF EXISTS `busi_order`;
CREATE TABLE `busi_order` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `end_date` datetime default NULL,
  `par_phone_send_status` int(11) default NULL,
  `start_date` datetime default NULL,
  `student_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_cha_ser_ref_stu` (`student_id`),
  CONSTRAINT `fk_cha_ser_ref_stu` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of busi_order
-- ----------------------------

-- ----------------------------
-- Table structure for `busi_status`
-- ----------------------------
DROP TABLE IF EXISTS `busi_status`;
CREATE TABLE `busi_status` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `name` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of busi_status
-- ----------------------------
INSERT INTO `busi_status` VALUES ('1', null, null, '初始化待发送（不发短信）');
INSERT INTO `busi_status` VALUES ('2', null, null, '免费试用（发短信）');
INSERT INTO `busi_status` VALUES ('3', null, null, '免费期满待收费（发短信）');
INSERT INTO `busi_status` VALUES ('4', null, null, '免费试用停止（不发短信）');
INSERT INTO `busi_status` VALUES ('5', null, null, '待退订（根据截至日期发送）');
INSERT INTO `busi_status` VALUES ('6', null, null, '已退订（不发短信）');
INSERT INTO `busi_status` VALUES ('7', null, null, '代收费使用中（发短信）');
INSERT INTO `busi_status` VALUES ('8', null, null, '现金收费使用中（发短信）');
INSERT INTO `busi_status` VALUES ('9', null, null, '现金收费停用（不发短信）');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', null, null, '合肥市');
INSERT INTO `city` VALUES ('2', null, null, '芜湖市');
INSERT INTO `city` VALUES ('3', null, null, '蚌埠市');
INSERT INTO `city` VALUES ('4', null, null, '淮南市');
INSERT INTO `city` VALUES ('5', null, null, '马鞍山市');
INSERT INTO `city` VALUES ('6', null, null, '淮北市');
INSERT INTO `city` VALUES ('7', null, null, '铜陵市');
INSERT INTO `city` VALUES ('8', null, null, '安庆市');
INSERT INTO `city` VALUES ('9', null, null, '黄山市');
INSERT INTO `city` VALUES ('10', null, null, '滁州市');
INSERT INTO `city` VALUES ('11', null, null, '阜阳市');
INSERT INTO `city` VALUES ('12', null, null, '宿州市');
INSERT INTO `city` VALUES ('13', null, null, '六安市');
INSERT INTO `city` VALUES ('14', null, null, '亳州市');
INSERT INTO `city` VALUES ('15', null, null, '池州市');
INSERT INTO `city` VALUES ('16', null, null, '宣城市');

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `description` longtext,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `grade_id` bigint(20) default NULL,
  `school_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_cls_ref_grade` (`grade_id`),
  KEY `fk_cls_ref_sch` (`school_id`),
  CONSTRAINT `fk_cls_ref_grade` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_cls_ref_sch` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', '2013-08-05 23:51:48', '2013-08-05 23:51:48', null, '初一(1)班', '1', '10', '1');
INSERT INTO `classes` VALUES ('2', '2013-08-05 23:52:10', '2013-08-05 23:52:10', null, '初三(3)班', '1', '12', '1');
INSERT INTO `classes` VALUES ('3', '2013-08-05 23:52:28', '2013-08-05 23:52:28', null, '初一(2)班', '1', '10', '1');
INSERT INTO `classes` VALUES ('4', '2013-08-05 23:52:48', '2013-08-05 23:52:48', null, '高111', '1', '14', '2');

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `name` varchar(40) NOT NULL,
  `city_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_district_ref_city` (`city_id`),
  CONSTRAINT `fk_district_ref_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', null, null, '瑶海区', '1');
INSERT INTO `district` VALUES ('2', null, null, '庐阳区', '1');
INSERT INTO `district` VALUES ('3', null, null, '蜀山区', '1');
INSERT INTO `district` VALUES ('4', null, null, '包河区', '1');
INSERT INTO `district` VALUES ('5', null, null, '长丰县', '1');
INSERT INTO `district` VALUES ('6', null, null, '肥东县', '1');
INSERT INTO `district` VALUES ('7', null, null, '肥西县', '1');
INSERT INTO `district` VALUES ('8', null, null, '庐江县', '1');
INSERT INTO `district` VALUES ('9', null, null, '巢湖市', '1');
INSERT INTO `district` VALUES ('10', null, null, '镜湖区', '2');
INSERT INTO `district` VALUES ('11', null, null, '弋江区', '2');
INSERT INTO `district` VALUES ('12', null, null, '鸠江区', '2');
INSERT INTO `district` VALUES ('13', null, null, '三山区', '2');
INSERT INTO `district` VALUES ('14', null, null, '芜湖县', '2');
INSERT INTO `district` VALUES ('15', null, null, '繁昌县', '2');
INSERT INTO `district` VALUES ('16', null, null, '南陵县', '2');
INSERT INTO `district` VALUES ('17', null, null, '无为县', '2');
INSERT INTO `district` VALUES ('18', null, null, '龙子湖区', '3');
INSERT INTO `district` VALUES ('19', null, null, '蚌山区', '3');
INSERT INTO `district` VALUES ('20', null, null, '禹会区', '3');
INSERT INTO `district` VALUES ('21', null, null, '淮上区', '3');
INSERT INTO `district` VALUES ('22', null, null, '怀远县', '3');
INSERT INTO `district` VALUES ('23', null, null, '五河县', '3');
INSERT INTO `district` VALUES ('24', null, null, '固镇县', '3');
INSERT INTO `district` VALUES ('25', null, null, '大通区', '4');
INSERT INTO `district` VALUES ('26', null, null, '田家庵区', '4');
INSERT INTO `district` VALUES ('27', null, null, '谢家集区', '4');
INSERT INTO `district` VALUES ('28', null, null, '八公山区', '4');
INSERT INTO `district` VALUES ('29', null, null, '潘集区', '4');
INSERT INTO `district` VALUES ('30', null, null, '凤台县', '4');
INSERT INTO `district` VALUES ('31', null, null, '花山区', '5');
INSERT INTO `district` VALUES ('32', null, null, '雨山区', '5');
INSERT INTO `district` VALUES ('33', null, null, '博望区', '5');
INSERT INTO `district` VALUES ('34', null, null, '当涂县', '5');
INSERT INTO `district` VALUES ('35', null, null, '含山县', '5');
INSERT INTO `district` VALUES ('36', null, null, '和　县', '5');
INSERT INTO `district` VALUES ('37', null, null, '杜集区', '6');
INSERT INTO `district` VALUES ('38', null, null, '相山区', '6');
INSERT INTO `district` VALUES ('39', null, null, '烈山区', '6');
INSERT INTO `district` VALUES ('40', null, null, '濉溪县', '6');
INSERT INTO `district` VALUES ('41', null, null, '铜官山区', '7');
INSERT INTO `district` VALUES ('42', null, null, '狮子山区', '7');
INSERT INTO `district` VALUES ('43', null, null, '郊　区', '7');
INSERT INTO `district` VALUES ('44', null, null, '铜陵县', '7');
INSERT INTO `district` VALUES ('45', null, null, '迎江区', '8');
INSERT INTO `district` VALUES ('46', null, null, '大观区', '8');
INSERT INTO `district` VALUES ('47', null, null, '宜秀区', '8');
INSERT INTO `district` VALUES ('48', null, null, '桐城市', '8');
INSERT INTO `district` VALUES ('49', null, null, '怀宁县', '8');
INSERT INTO `district` VALUES ('50', null, null, '枞阳县', '8');
INSERT INTO `district` VALUES ('51', null, null, '潜山县', '8');
INSERT INTO `district` VALUES ('52', null, null, '太湖县', '8');
INSERT INTO `district` VALUES ('53', null, null, '宿松县', '8');
INSERT INTO `district` VALUES ('54', null, null, '望江县', '8');
INSERT INTO `district` VALUES ('55', null, null, '岳西县', '8');
INSERT INTO `district` VALUES ('56', null, null, '屯溪区', '9');
INSERT INTO `district` VALUES ('57', null, null, '黄山区', '9');
INSERT INTO `district` VALUES ('58', null, null, '徽州区', '9');
INSERT INTO `district` VALUES ('59', null, null, '歙　县', '9');
INSERT INTO `district` VALUES ('60', null, null, '休宁县', '9');
INSERT INTO `district` VALUES ('61', null, null, '黟　县', '9');
INSERT INTO `district` VALUES ('62', null, null, '祁门县', '9');
INSERT INTO `district` VALUES ('63', null, null, '琅琊区', '10');
INSERT INTO `district` VALUES ('64', null, null, '南谯区', '10');
INSERT INTO `district` VALUES ('65', null, null, '天长市', '10');
INSERT INTO `district` VALUES ('66', null, null, '明光市', '10');
INSERT INTO `district` VALUES ('67', null, null, '来安县', '10');
INSERT INTO `district` VALUES ('68', null, null, '全椒县', '10');
INSERT INTO `district` VALUES ('69', null, null, '定远县', '10');
INSERT INTO `district` VALUES ('70', null, null, '凤阳县', '10');
INSERT INTO `district` VALUES ('71', null, null, '颍州区', '11');
INSERT INTO `district` VALUES ('72', null, null, '颍东区', '11');
INSERT INTO `district` VALUES ('73', null, null, '颍泉区', '11');
INSERT INTO `district` VALUES ('74', null, null, '界首市', '11');
INSERT INTO `district` VALUES ('75', null, null, '临泉县', '11');
INSERT INTO `district` VALUES ('76', null, null, '太和县', '11');
INSERT INTO `district` VALUES ('77', null, null, '阜南县', '11');
INSERT INTO `district` VALUES ('78', null, null, '颍上县', '11');
INSERT INTO `district` VALUES ('79', null, null, '埇桥区', '12');
INSERT INTO `district` VALUES ('80', null, null, '砀山县', '12');
INSERT INTO `district` VALUES ('81', null, null, '萧　县', '12');
INSERT INTO `district` VALUES ('82', null, null, '灵璧县', '12');
INSERT INTO `district` VALUES ('83', null, null, '泗　县', '12');
INSERT INTO `district` VALUES ('84', null, null, '金安区', '13');
INSERT INTO `district` VALUES ('85', null, null, '裕安区', '13');
INSERT INTO `district` VALUES ('86', null, null, '寿　县', '13');
INSERT INTO `district` VALUES ('87', null, null, '霍邱县', '13');
INSERT INTO `district` VALUES ('88', null, null, '舒城县', '13');
INSERT INTO `district` VALUES ('89', null, null, '金寨县', '13');
INSERT INTO `district` VALUES ('90', null, null, '霍山县', '13');
INSERT INTO `district` VALUES ('91', null, null, '谯城区', '14');
INSERT INTO `district` VALUES ('92', null, null, '涡阳县', '14');
INSERT INTO `district` VALUES ('93', null, null, '蒙城县', '14');
INSERT INTO `district` VALUES ('94', null, null, '利辛县', '14');
INSERT INTO `district` VALUES ('95', null, null, '贵池区', '15');
INSERT INTO `district` VALUES ('96', null, null, '东至县', '15');
INSERT INTO `district` VALUES ('97', null, null, '石台县', '15');
INSERT INTO `district` VALUES ('98', null, null, '青阳县', '15');
INSERT INTO `district` VALUES ('99', null, null, '宣州区', '16');
INSERT INTO `district` VALUES ('100', null, null, '宁国市', '16');
INSERT INTO `district` VALUES ('101', null, null, '郎溪县', '16');
INSERT INTO `district` VALUES ('102', null, null, '广德县', '16');
INSERT INTO `district` VALUES ('103', null, null, '泾　县', '16');
INSERT INTO `district` VALUES ('104', null, null, '绩溪县', '16');
INSERT INTO `district` VALUES ('105', null, null, '旌德县', '16');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `name` varchar(20) NOT NULL,
  `phase` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', null, null, '幼班', '幼儿园');
INSERT INTO `grade` VALUES ('2', null, null, '中班', '幼儿园');
INSERT INTO `grade` VALUES ('3', null, null, '大班', '幼儿园');
INSERT INTO `grade` VALUES ('4', null, null, '一年级', '小学');
INSERT INTO `grade` VALUES ('5', null, null, '二年级', '小学');
INSERT INTO `grade` VALUES ('6', null, null, '三年级', '小学');
INSERT INTO `grade` VALUES ('7', null, null, '四年级', '小学');
INSERT INTO `grade` VALUES ('8', null, null, '五年级', '小学');
INSERT INTO `grade` VALUES ('9', null, null, '六年级', '小学');
INSERT INTO `grade` VALUES ('10', null, null, '初一', '初中');
INSERT INTO `grade` VALUES ('11', null, null, '初二', '初中');
INSERT INTO `grade` VALUES ('12', null, null, '初三', '初中');
INSERT INTO `grade` VALUES ('13', null, null, '初四', '初中');
INSERT INTO `grade` VALUES ('14', null, null, '高一', '高中');
INSERT INTO `grade` VALUES ('15', null, null, '高二', '高中');
INSERT INTO `grade` VALUES ('16', null, null, '高三', '高中');
INSERT INTO `grade` VALUES ('17', null, null, '高四', '高中');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `from_admin_id` bigint(20) default NULL,
  `to_admin_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_adm_ref_toadm` (`to_admin_id`),
  KEY `fk_adm_ref_fromadm` (`from_admin_id`),
  CONSTRAINT `fk_adm_ref_fromadm` FOREIGN KEY (`from_admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_adm_ref_toadm` FOREIGN KEY (`to_admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `authority_list_store` longtext,
  `description` longtext,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', null, null, '[\"ROLE_SYS_ADMIN\"]', null, '', 'SYS_ADMIN');
INSERT INTO `role` VALUES ('2', null, null, '[\"ROLE_SYS_SERVER\"]', null, '', 'SYS_SERVER');
INSERT INTO `role` VALUES ('3', null, null, '[\"ROLE_UNION_SERVER\"]', null, '', 'UNION_SERVER');
INSERT INTO `role` VALUES ('4', null, null, '[\"ROLE_AGENT_ADMIN\"]', null, '', 'AGENT_ADMIN');
INSERT INTO `role` VALUES ('5', null, null, '[\"ROLE_AGENT_SERVER\"]', null, '', 'AGENT_SERVER');
INSERT INTO `role` VALUES ('6', null, null, '[\"ROLE_SCHOOL_ADMIN\"]', null, '', 'SCHOOL_ADMIN');
INSERT INTO `role` VALUES ('7', null, null, '[\"ROLE_TEACHER\"]', null, '', 'TEACHER');
INSERT INTO `role` VALUES ('8', null, null, '[\"ROLE_PARENT\"]', null, '', 'PARENT');

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `description` longtext NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `agent_id` bigint(20) default NULL,
  `city_id` bigint(20) default NULL,
  `district_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_sch_ref_district` (`district_id`),
  KEY `fk_sch_ref_agent` (`agent_id`),
  KEY `fk_sch_ref_city` (`city_id`),
  CONSTRAINT `fk_sch_ref_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  CONSTRAINT `fk_sch_ref_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_sch_ref_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '2013-08-05 23:39:26', '2013-08-05 23:39:26', 'sdsdssss', '合肥一中', '1', '1', '1', '1');
INSERT INTO `school` VALUES ('2', '2013-08-05 23:39:51', '2013-08-05 23:39:51', '事实上的撒旦', '合肥八中', '1', '1', '1', '3');
INSERT INTO `school` VALUES ('3', '2013-08-05 23:40:08', '2013-08-05 23:40:08', '是的法定分', '芜湖师大附中', '1', '1', '2', '10');

-- ----------------------------
-- Table structure for `sms`
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `charge_phone_num` varchar(255) default NULL,
  `charge_phone_type` int(11) default NULL,
  `content` varchar(200) NOT NULL,
  `failed_reason` varchar(200) default NULL,
  `is_batch` bit(1) default NULL,
  `phone_num` varchar(255) default NULL,
  `phone_type` int(11) default NULL,
  `receive_type` int(11) default NULL,
  `scheduled_time` datetime default NULL,
  `sent_time` datetime default NULL,
  `status` int(11) default NULL,
  `trial_num` int(11) default NULL,
  `admin_receiver_id` bigint(20) default NULL,
  `sender_id` bigint(20) default NULL,
  `sms_batch_id` bigint(20) default NULL,
  `std_receiver_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_sms_ref_smsbatch` (`sms_batch_id`),
  KEY `fk_sms_ref_adm` (`admin_receiver_id`),
  KEY `fk_sms_ref_stu` (`std_receiver_id`),
  CONSTRAINT `fk_sms_ref_adm` FOREIGN KEY (`admin_receiver_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_sms_ref_smsbatch` FOREIGN KEY (`sms_batch_id`) REFERENCES `sms_batch_history` (`id`),
  CONSTRAINT `fk_sms_ref_stu` FOREIGN KEY (`std_receiver_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_batch_history`
-- ----------------------------
DROP TABLE IF EXISTS `sms_batch_history`;
CREATE TABLE `sms_batch_history` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `content` varchar(200) NOT NULL,
  `scheduled_time` datetime NOT NULL,
  `type` int(11) default NULL,
  `classes_id` bigint(20) default NULL,
  `school_id` bigint(20) default NULL,
  `sender_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_his_ref_cls` (`classes_id`),
  KEY `fk_his_ref_adm` (`sender_id`),
  KEY `fk_his_ref_sch` (`school_id`),
  CONSTRAINT `fk_his_ref_adm` FOREIGN KEY (`sender_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_his_ref_cls` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `fk_his_ref_sch` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_batch_history
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_status`
-- ----------------------------
DROP TABLE IF EXISTS `sms_status`;
CREATE TABLE `sms_status` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `name` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_status
-- ----------------------------
INSERT INTO `sms_status` VALUES ('1', null, null, '未发送');
INSERT INTO `sms_status` VALUES ('2', null, null, '发送中');
INSERT INTO `sms_status` VALUES ('3', null, null, '发送成功');
INSERT INTO `sms_status` VALUES ('4', null, null, '发送失败');
INSERT INTO `sms_status` VALUES ('5', null, null, '再次发送');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `modify_date` datetime default NULL,
  `parent_charge_phone_num` varchar(255) default NULL,
  `parent_charge_phone_type` int(11) default NULL,
  `parent_name` varchar(255) default NULL,
  `parent_phone_num` varchar(255) default NULL,
  `parent_phone_type` int(11) default NULL,
  `sms_flag` int(11) default NULL,
  `std_name` varchar(255) default NULL,
  `std_num` varchar(20) default NULL,
  `std_phone_num` varchar(20) default NULL,
  `std_phone_send_status` int(11) default NULL,
  `std_phone_type` int(11) default NULL,
  `std_status` int(11) default NULL,
  `classes_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_stu_ref_cls` (`classes_id`),
  CONSTRAINT `fk_stu_ref_cls` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
