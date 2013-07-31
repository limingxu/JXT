/*
Navicat MySQL Data Transfer

Source Server         : JXL
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : jxt

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2013-07-25 15:08:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agent_info
-- ----------------------------
DROP TABLE IF EXISTS agent_info;
CREATE TABLE agent_info (
  id int(11) NOT NULL auto_increment,
  name varchar(50) collate utf8_bin NOT NULL,
  short_name char(20) collate utf8_bin default NULL,
  contact_info varchar(1000) collate utf8_bin default NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY agent_idx_1 (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of agent_info
-- ----------------------------
INSERT INTO agent_info VALUES ('1', '安徽锦佳科技有限公司', '锦佳科技', '', '1');

-- ----------------------------
-- Table structure for charge_history
-- ----------------------------
DROP TABLE IF EXISTS charge_history;
CREATE TABLE charge_history (
  id int(11) NOT NULL auto_increment,
  student_id int(11) default NULL,
  parent_id int(11) default NULL,
  phone_num char(20) collate utf8_bin NOT NULL,
  phone_type int(11) default NULL,
  charge_phone_num char(20) collate utf8_bin default NULL,
  charge_phone_type int(11) default NULL,
  effect_time datetime NOT NULL,
  expired_time datetime default NULL,
  par_phone_send_status int(11) NOT NULL default '1',
  reason varchar(100) collate utf8_bin default NULL,
  PRIMARY KEY  (id),
  KEY his_idx_1 (student_id),
  KEY his_idx_2 (parent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charge_history
-- ----------------------------

-- ----------------------------
-- Table structure for charge_status
-- ----------------------------
DROP TABLE IF EXISTS charge_status;
CREATE TABLE charge_status (
  id int(11) NOT NULL,
  name varchar(40) collate utf8_bin default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charge_status
-- ----------------------------
INSERT INTO charge_status VALUES ('1', '初始化待发送（不发短信）');
INSERT INTO charge_status VALUES ('2', '免费试用（发短信）');
INSERT INTO charge_status VALUES ('3', '免费期满待收费（发短信）');
INSERT INTO charge_status VALUES ('4', '免费试用停止（不发短信）');
INSERT INTO charge_status VALUES ('5', '待退订（根据截至日期发送）');
INSERT INTO charge_status VALUES ('6', '已退订（不发短信）');
INSERT INTO charge_status VALUES ('7', '代收费使用中（发短信）');
INSERT INTO charge_status VALUES ('8', '现金收费使用中（发短信）');
INSERT INTO charge_status VALUES ('9', '现金收费停用（不发短信）');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS city;
CREATE TABLE city (
  id int(11) NOT NULL auto_increment,
  name varchar(40) collate utf8_bin NOT NULL,
  PRIMARY KEY  (id),
  KEY city_idx_1 (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO city VALUES ('1', '合肥市');
INSERT INTO city VALUES ('2', '芜湖市');
INSERT INTO city VALUES ('3', '蚌埠市');
INSERT INTO city VALUES ('4', '淮南市');
INSERT INTO city VALUES ('5', '马鞍山市');
INSERT INTO city VALUES ('6', '淮北市');
INSERT INTO city VALUES ('7', '铜陵市');
INSERT INTO city VALUES ('8', '安庆市');
INSERT INTO city VALUES ('9', '黄山市');
INSERT INTO city VALUES ('10', '滁州市');
INSERT INTO city VALUES ('11', '阜阳市');
INSERT INTO city VALUES ('12', '宿州市');
INSERT INTO city VALUES ('13', '六安市');
INSERT INTO city VALUES ('14', '亳州市');
INSERT INTO city VALUES ('15', '池州市');
INSERT INTO city VALUES ('16', '宣城市');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS class_info;
CREATE TABLE class_info (
  id int(11) NOT NULL auto_increment,
  name varchar(50) collate utf8_bin NOT NULL,
  grade_id int(11) NOT NULL,
  school_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY class_idx_1 (id),
  KEY class_idx_2 (school_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of class_info
-- ----------------------------

-- ----------------------------
-- Table structure for district
-- ----------------------------
DROP TABLE IF EXISTS district;
CREATE TABLE district (
  id int(11) NOT NULL auto_increment,
  name varchar(40) collate utf8_bin NOT NULL,
  city_id int(11) NOT NULL,
  PRIMARY KEY  (id),
  KEY district_idx_1 (id),
  KEY district_idx_2 (city_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO district VALUES ('1', '瑶海区', '1');
INSERT INTO district VALUES ('2', '庐阳区', '1');
INSERT INTO district VALUES ('3', '蜀山区', '1');
INSERT INTO district VALUES ('4', '包河区', '1');
INSERT INTO district VALUES ('5', '长丰县', '1');
INSERT INTO district VALUES ('6', '肥东县', '1');
INSERT INTO district VALUES ('7', '肥西县', '1');
INSERT INTO district VALUES ('8', '庐江县', '1');
INSERT INTO district VALUES ('9', '巢湖市', '1');
INSERT INTO district VALUES ('10', '镜湖区', '2');
INSERT INTO district VALUES ('11', '弋江区', '2');
INSERT INTO district VALUES ('12', '鸠江区', '2');
INSERT INTO district VALUES ('13', '三山区', '2');
INSERT INTO district VALUES ('14', '芜湖县', '2');
INSERT INTO district VALUES ('15', '繁昌县', '2');
INSERT INTO district VALUES ('16', '南陵县', '2');
INSERT INTO district VALUES ('17', '无为县', '2');
INSERT INTO district VALUES ('18', '龙子湖区', '3');
INSERT INTO district VALUES ('19', '蚌山区', '3');
INSERT INTO district VALUES ('20', '禹会区', '3');
INSERT INTO district VALUES ('21', '淮上区', '3');
INSERT INTO district VALUES ('22', '怀远县', '3');
INSERT INTO district VALUES ('23', '五河县', '3');
INSERT INTO district VALUES ('24', '固镇县', '3');
INSERT INTO district VALUES ('25', '大通区', '4');
INSERT INTO district VALUES ('26', '田家庵区', '4');
INSERT INTO district VALUES ('27', '谢家集区', '4');
INSERT INTO district VALUES ('28', '八公山区', '4');
INSERT INTO district VALUES ('29', '潘集区', '4');
INSERT INTO district VALUES ('30', '凤台县', '4');
INSERT INTO district VALUES ('31', '花山区', '5');
INSERT INTO district VALUES ('32', '雨山区', '5');
INSERT INTO district VALUES ('33', '博望区', '5');
INSERT INTO district VALUES ('34', '当涂县', '5');
INSERT INTO district VALUES ('35', '含山县', '5');
INSERT INTO district VALUES ('36', '和　县', '5');
INSERT INTO district VALUES ('37', '杜集区', '6');
INSERT INTO district VALUES ('38', '相山区', '6');
INSERT INTO district VALUES ('39', '烈山区', '6');
INSERT INTO district VALUES ('40', '濉溪县', '6');
INSERT INTO district VALUES ('41', '铜官山区', '7');
INSERT INTO district VALUES ('42', '狮子山区', '7');
INSERT INTO district VALUES ('43', '郊　区', '7');
INSERT INTO district VALUES ('44', '铜陵县', '7');
INSERT INTO district VALUES ('45', '迎江区', '8');
INSERT INTO district VALUES ('46', '大观区', '8');
INSERT INTO district VALUES ('47', '宜秀区', '8');
INSERT INTO district VALUES ('48', '桐城市', '8');
INSERT INTO district VALUES ('49', '怀宁县', '8');
INSERT INTO district VALUES ('50', '枞阳县', '8');
INSERT INTO district VALUES ('51', '潜山县', '8');
INSERT INTO district VALUES ('52', '太湖县', '8');
INSERT INTO district VALUES ('53', '宿松县', '8');
INSERT INTO district VALUES ('54', '望江县', '8');
INSERT INTO district VALUES ('55', '岳西县', '8');
INSERT INTO district VALUES ('56', '屯溪区', '9');
INSERT INTO district VALUES ('57', '黄山区', '9');
INSERT INTO district VALUES ('58', '徽州区', '9');
INSERT INTO district VALUES ('59', '歙　县', '9');
INSERT INTO district VALUES ('60', '休宁县', '9');
INSERT INTO district VALUES ('61', '黟　县', '9');
INSERT INTO district VALUES ('62', '祁门县', '9');
INSERT INTO district VALUES ('63', '琅琊区', '10');
INSERT INTO district VALUES ('64', '南谯区', '10');
INSERT INTO district VALUES ('65', '天长市', '10');
INSERT INTO district VALUES ('66', '明光市', '10');
INSERT INTO district VALUES ('67', '来安县', '10');
INSERT INTO district VALUES ('68', '全椒县', '10');
INSERT INTO district VALUES ('69', '定远县', '10');
INSERT INTO district VALUES ('70', '凤阳县', '10');
INSERT INTO district VALUES ('71', '颍州区', '11');
INSERT INTO district VALUES ('72', '颍东区', '11');
INSERT INTO district VALUES ('73', '颍泉区', '11');
INSERT INTO district VALUES ('74', '界首市', '11');
INSERT INTO district VALUES ('75', '临泉县', '11');
INSERT INTO district VALUES ('76', '太和县', '11');
INSERT INTO district VALUES ('77', '阜南县', '11');
INSERT INTO district VALUES ('78', '颍上县', '11');
INSERT INTO district VALUES ('79', '埇桥区', '12');
INSERT INTO district VALUES ('80', '砀山县', '12');
INSERT INTO district VALUES ('81', '萧　县', '12');
INSERT INTO district VALUES ('82', '灵璧县', '12');
INSERT INTO district VALUES ('83', '泗　县', '12');
INSERT INTO district VALUES ('84', '金安区', '13');
INSERT INTO district VALUES ('85', '裕安区', '13');
INSERT INTO district VALUES ('86', '寿　县', '13');
INSERT INTO district VALUES ('87', '霍邱县', '13');
INSERT INTO district VALUES ('88', '舒城县', '13');
INSERT INTO district VALUES ('89', '金寨县', '13');
INSERT INTO district VALUES ('90', '霍山县', '13');
INSERT INTO district VALUES ('91', '谯城区', '14');
INSERT INTO district VALUES ('92', '涡阳县', '14');
INSERT INTO district VALUES ('93', '蒙城县', '14');
INSERT INTO district VALUES ('94', '利辛县', '14');
INSERT INTO district VALUES ('95', '贵池区', '15');
INSERT INTO district VALUES ('96', '东至县', '15');
INSERT INTO district VALUES ('97', '石台县', '15');
INSERT INTO district VALUES ('98', '青阳县', '15');
INSERT INTO district VALUES ('99', '宣州区', '16');
INSERT INTO district VALUES ('100', '宁国市', '16');
INSERT INTO district VALUES ('101', '郎溪县', '16');
INSERT INTO district VALUES ('102', '广德县', '16');
INSERT INTO district VALUES ('103', '泾　县', '16');
INSERT INTO district VALUES ('104', '绩溪县', '16');
INSERT INTO district VALUES ('105', '旌德县', '16');

-- ----------------------------
-- Table structure for grade_info
-- ----------------------------
DROP TABLE IF EXISTS grade_info;
CREATE TABLE grade_info (
  id int(11) NOT NULL,
  name char(20) collate utf8_bin NOT NULL,
  phase char(20) collate utf8_bin NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of grade_info
-- ----------------------------

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS notification;
CREATE TABLE notification (
  id int(11) NOT NULL,
  subject varchar(100) collate utf8_bin NOT NULL,
  content varchar(500) collate utf8_bin NOT NULL default '',
  from_user_id int(11) NOT NULL,
  to_user_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  created_date datetime NOT NULL,
  PRIMARY KEY  (id),
  KEY ntf_idx_1 (from_user_id),
  KEY ntf_idx_2 (to_user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for parent_info
-- ----------------------------
DROP TABLE IF EXISTS parent_info;
CREATE TABLE parent_info (
  id int(11) NOT NULL auto_increment,
  name char(20) collate utf8_bin NOT NULL,
  par_phone_num char(20) collate utf8_bin NOT NULL,
  par_phone_type int(11) default NULL,
  par_charge_phone_num char(20) collate utf8_bin default NULL,
  par_charge_phone_type int(11) default NULL,
  student_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY parent_idx_1 (id),
  KEY parent_idx_2 (student_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of parent_info
-- ----------------------------

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS role_info;
CREATE TABLE role_info (
  id int(11) NOT NULL auto_increment,
  name varchar(40) collate utf8_bin default NULL,
  status int(10) default '1',
  PRIMARY KEY  (id),
  KEY role_idx (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO role_info VALUES ('1', '家校通系统管理员', '1');
INSERT INTO role_info VALUES ('2', '家校通客服', '1');
INSERT INTO role_info VALUES ('3', '联通客服', '1');
INSERT INTO role_info VALUES ('4', '代理商管理员', '1');
INSERT INTO role_info VALUES ('5', '代理商客服', '1');
INSERT INTO role_info VALUES ('6', '学校信息员', '1');
INSERT INTO role_info VALUES ('7', '老师', '1');
INSERT INTO role_info VALUES ('8', '家长', '1');

-- ----------------------------
-- Table structure for school_info
-- ----------------------------
DROP TABLE IF EXISTS school_info;
CREATE TABLE school_info (
  id int(11) NOT NULL auto_increment,
  name varchar(50) collate utf8_bin NOT NULL,
  city_id int(11) NOT NULL,
  district_id int(11) NOT NULL,
  agent_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY school_idx_1 (id),
  KEY school_idx_2 (district_id),
  KEY school_idx_3 (agent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of school_info
-- ----------------------------

-- ----------------------------
-- Table structure for send_status
-- ----------------------------
DROP TABLE IF EXISTS send_status;
CREATE TABLE send_status (
  id int(11) NOT NULL,
  name varchar(40) collate utf8_bin default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of send_status
-- ----------------------------
INSERT INTO send_status VALUES ('1', '未发送');
INSERT INTO send_status VALUES ('2', '发送中');
INSERT INTO send_status VALUES ('3', '发送成功');
INSERT INTO send_status VALUES ('4', '发送失败');
INSERT INTO send_status VALUES ('5', '再次发送');

-- ----------------------------
-- Table structure for sms_info
-- ----------------------------
DROP TABLE IF EXISTS sms_info;
CREATE TABLE sms_info (
  id int(11) NOT NULL auto_increment,
  operation_id int(11) default '-1',
  receive_type int(11) NOT NULL,
  receive_user_id int(11) default '0',
  student_id int(11) default '0',
  parent_id int(11) default '0',
  phone_num char(20) collate utf8_bin NOT NULL,
  phone_type int(11) default NULL,
  charge_phone_num char(20) collate utf8_bin NOT NULL,
  charge_phone_type int(11) default NULL,
  content varchar(200) collate utf8_bin NOT NULL,
  scheduled_time datetime NOT NULL,
  sent_time datetime default NULL,
  status int(11) NOT NULL default '1',
  trial_num int(11) NOT NULL default '0',
  failed_reason varchar(200) collate utf8_bin default NULL,
  PRIMARY KEY  (id),
  KEY sms_idx_1 (id),
  KEY sms_idx_2 (student_id),
  KEY sms_idx_3 (parent_id),
  KEY sms_idx_4 (receive_user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_info
-- ----------------------------

-- ----------------------------
-- Table structure for sms_operation_history
-- ----------------------------
DROP TABLE IF EXISTS sms_operation_history;
CREATE TABLE sms_operation_history (
  id int(11) NOT NULL auto_increment,
  operation_user_id int(11) NOT NULL,
  type int(11) NOT NULL,
  school_id int(11) default NULL,
  class_id int(11) default NULL,
  content varchar(200) collate utf8_bin NOT NULL,
  scheduled_time datetime NOT NULL,
  PRIMARY KEY  (id),
  KEY soh_idx_1 (id),
  KEY soh_idx_2 (operation_user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_operation_history
-- ----------------------------

-- ----------------------------
-- Table structure for student_2_parent
-- ----------------------------
DROP TABLE IF EXISTS student_2_parent;
CREATE TABLE student_2_parent (
  student_id int(11) NOT NULL,
  parent_id int(11) NOT NULL,
  par_phone_send_status int(11) default '-1',
  KEY s2p_idx_1 (student_id),
  KEY s2p_idx_2 (parent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student_2_parent
-- ----------------------------

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS student_info;
CREATE TABLE student_info (
  id int(11) NOT NULL auto_increment,
  std_num char(20) collate utf8_bin default NULL,
  name char(20) collate utf8_bin NOT NULL,
  std_phone_num char(20) collate utf8_bin default NULL,
  std_phone_type int(11) default NULL,
  std_phone_send_status int(11) default '0',
  parent_id char(20) collate utf8_bin NOT NULL,
  class_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY student_idx_1 (id),
  KEY student_idx_2 (class_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_2_agent
-- ----------------------------
DROP TABLE IF EXISTS user_2_agent;
CREATE TABLE user_2_agent (
  id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  agent_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY u2a_idx_1 (user_id),
  KEY u2a_idx_2 (agent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_agent
-- ----------------------------
INSERT INTO user_2_agent VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for user_2_role
-- ----------------------------
DROP TABLE IF EXISTS user_2_role;
CREATE TABLE user_2_role (
  id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  role_id int(11) NOT NULL,
  PRIMARY KEY  (id),
  KEY u2r_idx_1 (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_role
-- ----------------------------
INSERT INTO user_2_role VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for user_2_school
-- ----------------------------
DROP TABLE IF EXISTS user_2_school;
CREATE TABLE user_2_school (
  id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  school_id int(11) NOT NULL,
  status int(11) NOT NULL default '1',
  PRIMARY KEY  (id),
  KEY u2s_idx_1 (user_id),
  KEY u2s_idx_2 (school_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_school
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS user_info;
CREATE TABLE user_info (
  id int(11) NOT NULL auto_increment,
  name varchar(40) collate utf8_bin default NULL,
  password varchar(100) collate utf8_bin default NULL,
  phone_num char(20) collate utf8_bin default NULL,
  phone_type int(11) default NULL,
  charge_phone_num char(20) collate utf8_bin default '',
  charge_phone_type int(11) default NULL,
  status int(11) default '1',
  sms_flag int(11) default '1',
  PRIMARY KEY  (id),
  KEY user_idx_1 (id),
  KEY user_idx_2 (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO user_info VALUES ('1', '系统管理员', 'P@ssword#123', null, null, '', null, '1', '0');
/*
Navicat MySQL Data Transfer

Source Server         : JXL
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : jxt

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2013-07-25 15:08:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agent_info`
-- ----------------------------
DROP TABLE IF EXISTS `agent_info`;
CREATE TABLE `agent_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `short_name` char(20) collate utf8_bin default NULL,
  `contact_info` varchar(1000) collate utf8_bin default NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `agent_idx_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of agent_info
-- ----------------------------
INSERT INTO `agent_info` VALUES ('1', '安徽锦佳科技有限公司', '锦佳科技', '', '1');

-- ----------------------------
-- Table structure for `charge_history`
-- ----------------------------
DROP TABLE IF EXISTS `charge_history`;
CREATE TABLE `charge_history` (
  `id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `phone_num` char(20) collate utf8_bin NOT NULL,
  `phone_type` int(11) default NULL,
  `charge_phone_num` char(20) collate utf8_bin default NULL,
  `charge_phone_type` int(11) default NULL,
  `effect_time` datetime NOT NULL,
  `expired_time` datetime default NULL,
  `par_phone_send_status` int(11) NOT NULL default '1',
  `reason` varchar(100) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`),
  KEY `his_idx_1` (`student_id`),
  KEY `his_idx_2` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charge_history
-- ----------------------------

-- ----------------------------
-- Table structure for `charge_status`
-- ----------------------------
DROP TABLE IF EXISTS `charge_status`;
CREATE TABLE `charge_status` (
  `id` int(11) NOT NULL,
  `name` varchar(40) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charge_status
-- ----------------------------
INSERT INTO `charge_status` VALUES ('1', '初始化待发送（不发短信）');
INSERT INTO `charge_status` VALUES ('2', '免费试用（发短信）');
INSERT INTO `charge_status` VALUES ('3', '免费期满待收费（发短信）');
INSERT INTO `charge_status` VALUES ('4', '免费试用停止（不发短信）');
INSERT INTO `charge_status` VALUES ('5', '待退订（根据截至日期发送）');
INSERT INTO `charge_status` VALUES ('6', '已退订（不发短信）');
INSERT INTO `charge_status` VALUES ('7', '代收费使用中（发短信）');
INSERT INTO `charge_status` VALUES ('8', '现金收费使用中（发短信）');
INSERT INTO `charge_status` VALUES ('9', '现金收费停用（不发短信）');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `city_idx_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '合肥市');
INSERT INTO `city` VALUES ('2', '芜湖市');
INSERT INTO `city` VALUES ('3', '蚌埠市');
INSERT INTO `city` VALUES ('4', '淮南市');
INSERT INTO `city` VALUES ('5', '马鞍山市');
INSERT INTO `city` VALUES ('6', '淮北市');
INSERT INTO `city` VALUES ('7', '铜陵市');
INSERT INTO `city` VALUES ('8', '安庆市');
INSERT INTO `city` VALUES ('9', '黄山市');
INSERT INTO `city` VALUES ('10', '滁州市');
INSERT INTO `city` VALUES ('11', '阜阳市');
INSERT INTO `city` VALUES ('12', '宿州市');
INSERT INTO `city` VALUES ('13', '六安市');
INSERT INTO `city` VALUES ('14', '亳州市');
INSERT INTO `city` VALUES ('15', '池州市');
INSERT INTO `city` VALUES ('16', '宣城市');

-- ----------------------------
-- Table structure for `class_info`
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `grade_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `class_idx_1` (`id`),
  KEY `class_idx_2` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of class_info
-- ----------------------------

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `district_idx_1` (`id`),
  KEY `district_idx_2` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '瑶海区', '1');
INSERT INTO `district` VALUES ('2', '庐阳区', '1');
INSERT INTO `district` VALUES ('3', '蜀山区', '1');
INSERT INTO `district` VALUES ('4', '包河区', '1');
INSERT INTO `district` VALUES ('5', '长丰县', '1');
INSERT INTO `district` VALUES ('6', '肥东县', '1');
INSERT INTO `district` VALUES ('7', '肥西县', '1');
INSERT INTO `district` VALUES ('8', '庐江县', '1');
INSERT INTO `district` VALUES ('9', '巢湖市', '1');
INSERT INTO `district` VALUES ('10', '镜湖区', '2');
INSERT INTO `district` VALUES ('11', '弋江区', '2');
INSERT INTO `district` VALUES ('12', '鸠江区', '2');
INSERT INTO `district` VALUES ('13', '三山区', '2');
INSERT INTO `district` VALUES ('14', '芜湖县', '2');
INSERT INTO `district` VALUES ('15', '繁昌县', '2');
INSERT INTO `district` VALUES ('16', '南陵县', '2');
INSERT INTO `district` VALUES ('17', '无为县', '2');
INSERT INTO `district` VALUES ('18', '龙子湖区', '3');
INSERT INTO `district` VALUES ('19', '蚌山区', '3');
INSERT INTO `district` VALUES ('20', '禹会区', '3');
INSERT INTO `district` VALUES ('21', '淮上区', '3');
INSERT INTO `district` VALUES ('22', '怀远县', '3');
INSERT INTO `district` VALUES ('23', '五河县', '3');
INSERT INTO `district` VALUES ('24', '固镇县', '3');
INSERT INTO `district` VALUES ('25', '大通区', '4');
INSERT INTO `district` VALUES ('26', '田家庵区', '4');
INSERT INTO `district` VALUES ('27', '谢家集区', '4');
INSERT INTO `district` VALUES ('28', '八公山区', '4');
INSERT INTO `district` VALUES ('29', '潘集区', '4');
INSERT INTO `district` VALUES ('30', '凤台县', '4');
INSERT INTO `district` VALUES ('31', '花山区', '5');
INSERT INTO `district` VALUES ('32', '雨山区', '5');
INSERT INTO `district` VALUES ('33', '博望区', '5');
INSERT INTO `district` VALUES ('34', '当涂县', '5');
INSERT INTO `district` VALUES ('35', '含山县', '5');
INSERT INTO `district` VALUES ('36', '和　县', '5');
INSERT INTO `district` VALUES ('37', '杜集区', '6');
INSERT INTO `district` VALUES ('38', '相山区', '6');
INSERT INTO `district` VALUES ('39', '烈山区', '6');
INSERT INTO `district` VALUES ('40', '濉溪县', '6');
INSERT INTO `district` VALUES ('41', '铜官山区', '7');
INSERT INTO `district` VALUES ('42', '狮子山区', '7');
INSERT INTO `district` VALUES ('43', '郊　区', '7');
INSERT INTO `district` VALUES ('44', '铜陵县', '7');
INSERT INTO `district` VALUES ('45', '迎江区', '8');
INSERT INTO `district` VALUES ('46', '大观区', '8');
INSERT INTO `district` VALUES ('47', '宜秀区', '8');
INSERT INTO `district` VALUES ('48', '桐城市', '8');
INSERT INTO `district` VALUES ('49', '怀宁县', '8');
INSERT INTO `district` VALUES ('50', '枞阳县', '8');
INSERT INTO `district` VALUES ('51', '潜山县', '8');
INSERT INTO `district` VALUES ('52', '太湖县', '8');
INSERT INTO `district` VALUES ('53', '宿松县', '8');
INSERT INTO `district` VALUES ('54', '望江县', '8');
INSERT INTO `district` VALUES ('55', '岳西县', '8');
INSERT INTO `district` VALUES ('56', '屯溪区', '9');
INSERT INTO `district` VALUES ('57', '黄山区', '9');
INSERT INTO `district` VALUES ('58', '徽州区', '9');
INSERT INTO `district` VALUES ('59', '歙　县', '9');
INSERT INTO `district` VALUES ('60', '休宁县', '9');
INSERT INTO `district` VALUES ('61', '黟　县', '9');
INSERT INTO `district` VALUES ('62', '祁门县', '9');
INSERT INTO `district` VALUES ('63', '琅琊区', '10');
INSERT INTO `district` VALUES ('64', '南谯区', '10');
INSERT INTO `district` VALUES ('65', '天长市', '10');
INSERT INTO `district` VALUES ('66', '明光市', '10');
INSERT INTO `district` VALUES ('67', '来安县', '10');
INSERT INTO `district` VALUES ('68', '全椒县', '10');
INSERT INTO `district` VALUES ('69', '定远县', '10');
INSERT INTO `district` VALUES ('70', '凤阳县', '10');
INSERT INTO `district` VALUES ('71', '颍州区', '11');
INSERT INTO `district` VALUES ('72', '颍东区', '11');
INSERT INTO `district` VALUES ('73', '颍泉区', '11');
INSERT INTO `district` VALUES ('74', '界首市', '11');
INSERT INTO `district` VALUES ('75', '临泉县', '11');
INSERT INTO `district` VALUES ('76', '太和县', '11');
INSERT INTO `district` VALUES ('77', '阜南县', '11');
INSERT INTO `district` VALUES ('78', '颍上县', '11');
INSERT INTO `district` VALUES ('79', '埇桥区', '12');
INSERT INTO `district` VALUES ('80', '砀山县', '12');
INSERT INTO `district` VALUES ('81', '萧　县', '12');
INSERT INTO `district` VALUES ('82', '灵璧县', '12');
INSERT INTO `district` VALUES ('83', '泗　县', '12');
INSERT INTO `district` VALUES ('84', '金安区', '13');
INSERT INTO `district` VALUES ('85', '裕安区', '13');
INSERT INTO `district` VALUES ('86', '寿　县', '13');
INSERT INTO `district` VALUES ('87', '霍邱县', '13');
INSERT INTO `district` VALUES ('88', '舒城县', '13');
INSERT INTO `district` VALUES ('89', '金寨县', '13');
INSERT INTO `district` VALUES ('90', '霍山县', '13');
INSERT INTO `district` VALUES ('91', '谯城区', '14');
INSERT INTO `district` VALUES ('92', '涡阳县', '14');
INSERT INTO `district` VALUES ('93', '蒙城县', '14');
INSERT INTO `district` VALUES ('94', '利辛县', '14');
INSERT INTO `district` VALUES ('95', '贵池区', '15');
INSERT INTO `district` VALUES ('96', '东至县', '15');
INSERT INTO `district` VALUES ('97', '石台县', '15');
INSERT INTO `district` VALUES ('98', '青阳县', '15');
INSERT INTO `district` VALUES ('99', '宣州区', '16');
INSERT INTO `district` VALUES ('100', '宁国市', '16');
INSERT INTO `district` VALUES ('101', '郎溪县', '16');
INSERT INTO `district` VALUES ('102', '广德县', '16');
INSERT INTO `district` VALUES ('103', '泾　县', '16');
INSERT INTO `district` VALUES ('104', '绩溪县', '16');
INSERT INTO `district` VALUES ('105', '旌德县', '16');

-- ----------------------------
-- Table structure for `grade_info`
-- ----------------------------
DROP TABLE IF EXISTS `grade_info`;
CREATE TABLE `grade_info` (
  `id` int(11) NOT NULL,
  `name` char(20) collate utf8_bin NOT NULL,
  `phase` char(20) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of grade_info
-- ----------------------------

-- ----------------------------
-- Table structure for `notification`
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) collate utf8_bin NOT NULL,
  `content` varchar(500) collate utf8_bin NOT NULL default '',
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  `created_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ntf_idx_1` (`from_user_id`),
  KEY `ntf_idx_2` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for `parent_info`
-- ----------------------------
DROP TABLE IF EXISTS `parent_info`;
CREATE TABLE `parent_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(20) collate utf8_bin NOT NULL,
  `par_phone_num` char(20) collate utf8_bin NOT NULL,
  `par_phone_type` int(11) default NULL,
  `par_charge_phone_num` char(20) collate utf8_bin default NULL,
  `par_charge_phone_type` int(11) default NULL,
  `student_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_idx_1` (`id`),
  KEY `parent_idx_2` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of parent_info
-- ----------------------------

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin default NULL,
  `status` int(10) default '1',
  PRIMARY KEY  (`id`),
  KEY `role_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '家校通系统管理员', '1');
INSERT INTO `role_info` VALUES ('2', '家校通客服', '1');
INSERT INTO `role_info` VALUES ('3', '联通客服', '1');
INSERT INTO `role_info` VALUES ('4', '代理商管理员', '1');
INSERT INTO `role_info` VALUES ('5', '代理商客服', '1');
INSERT INTO `role_info` VALUES ('6', '学校信息员', '1');
INSERT INTO `role_info` VALUES ('7', '老师', '1');
INSERT INTO `role_info` VALUES ('8', '家长', '1');

-- ----------------------------
-- Table structure for `school_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_info`;
CREATE TABLE `school_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `school_idx_1` (`id`),
  KEY `school_idx_2` (`district_id`),
  KEY `school_idx_3` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of school_info
-- ----------------------------

-- ----------------------------
-- Table structure for `send_status`
-- ----------------------------
DROP TABLE IF EXISTS `send_status`;
CREATE TABLE `send_status` (
  `id` int(11) NOT NULL,
  `name` varchar(40) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of send_status
-- ----------------------------
INSERT INTO `send_status` VALUES ('1', '未发送');
INSERT INTO `send_status` VALUES ('2', '发送中');
INSERT INTO `send_status` VALUES ('3', '发送成功');
INSERT INTO `send_status` VALUES ('4', '发送失败');
INSERT INTO `send_status` VALUES ('5', '再次发送');

-- ----------------------------
-- Table structure for `sms_info`
-- ----------------------------
DROP TABLE IF EXISTS `sms_info`;
CREATE TABLE `sms_info` (
  `id` int(11) NOT NULL auto_increment,
  `operation_id` int(11) default '-1',
  `receive_type` int(11) NOT NULL,
  `receive_user_id` int(11) default '0',
  `student_id` int(11) default '0',
  `parent_id` int(11) default '0',
  `phone_num` char(20) collate utf8_bin NOT NULL,
  `phone_type` int(11) default NULL,
  `charge_phone_num` char(20) collate utf8_bin NOT NULL,
  `charge_phone_type` int(11) default NULL,
  `content` varchar(200) collate utf8_bin NOT NULL,
  `scheduled_time` datetime NOT NULL,
  `sent_time` datetime default NULL,
  `status` int(11) NOT NULL default '1',
  `trial_num` int(11) NOT NULL default '0',
  `failed_reason` varchar(200) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`),
  KEY `sms_idx_1` (`id`),
  KEY `sms_idx_2` (`student_id`),
  KEY `sms_idx_3` (`parent_id`),
  KEY `sms_idx_4` (`receive_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_operation_history`
-- ----------------------------
DROP TABLE IF EXISTS `sms_operation_history`;
CREATE TABLE `sms_operation_history` (
  `id` int(11) NOT NULL auto_increment,
  `operation_user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `school_id` int(11) default NULL,
  `class_id` int(11) default NULL,
  `content` varchar(200) collate utf8_bin NOT NULL,
  `scheduled_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `soh_idx_1` (`id`),
  KEY `soh_idx_2` (`operation_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_operation_history
-- ----------------------------

-- ----------------------------
-- Table structure for `student_2_parent`
-- ----------------------------
DROP TABLE IF EXISTS `student_2_parent`;
CREATE TABLE `student_2_parent` (
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `par_phone_send_status` int(11) default '-1',
  KEY `s2p_idx_1` (`student_id`),
  KEY `s2p_idx_2` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student_2_parent
-- ----------------------------

-- ----------------------------
-- Table structure for `student_info`
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `id` int(11) NOT NULL auto_increment,
  `std_num` char(20) collate utf8_bin default NULL,
  `name` char(20) collate utf8_bin NOT NULL,
  `std_phone_num` char(20) collate utf8_bin default NULL,
  `std_phone_type` int(11) default NULL,
  `std_phone_send_status` int(11) default '0',
  `parent_id` char(20) collate utf8_bin NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `student_idx_1` (`id`),
  KEY `student_idx_2` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user_2_agent`
-- ----------------------------
DROP TABLE IF EXISTS `user_2_agent`;
CREATE TABLE `user_2_agent` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `u2a_idx_1` (`user_id`),
  KEY `u2a_idx_2` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_agent
-- ----------------------------
INSERT INTO `user_2_agent` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for `user_2_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_2_role`;
CREATE TABLE `user_2_role` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `u2r_idx_1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_role
-- ----------------------------
INSERT INTO `user_2_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `user_2_school`
-- ----------------------------
DROP TABLE IF EXISTS `user_2_school`;
CREATE TABLE `user_2_school` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `u2s_idx_1` (`user_id`),
  KEY `u2s_idx_2` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_school
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin default NULL,
  `password` varchar(100) collate utf8_bin default NULL,
  `phone_num` char(20) collate utf8_bin default NULL,
  `phone_type` int(11) default NULL,
  `charge_phone_num` char(20) collate utf8_bin default '',
  `charge_phone_type` int(11) default NULL,
  `status` int(11) default '1',
  `sms_flag` int(11) default '1',
  PRIMARY KEY  (`id`),
  KEY `user_idx_1` (`id`),
  KEY `user_idx_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '系统管理员', 'P@ssword#123', null, null, '', null, '1', '0');
/*
Navicat MySQL Data Transfer

Source Server         : JXL
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : jxt

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2013-07-25 15:08:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agent_info`
-- ----------------------------
DROP TABLE IF EXISTS `agent_info`;
CREATE TABLE `agent_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `short_name` char(20) collate utf8_bin default NULL,
  `contact_info` varchar(1000) collate utf8_bin default NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `agent_idx_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of agent_info
-- ----------------------------
INSERT INTO `agent_info` VALUES ('1', '安徽锦佳科技有限公司', '锦佳科技', '', '1');

-- ----------------------------
-- Table structure for `charge_history`
-- ----------------------------
DROP TABLE IF EXISTS `charge_history`;
CREATE TABLE `charge_history` (
  `id` int(11) NOT NULL auto_increment,
  `student_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `phone_num` char(20) collate utf8_bin NOT NULL,
  `phone_type` int(11) default NULL,
  `charge_phone_num` char(20) collate utf8_bin default NULL,
  `charge_phone_type` int(11) default NULL,
  `effect_time` datetime NOT NULL,
  `expired_time` datetime default NULL,
  `par_phone_send_status` int(11) NOT NULL default '1',
  `reason` varchar(100) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`),
  KEY `his_idx_1` (`student_id`),
  KEY `his_idx_2` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charge_history
-- ----------------------------

-- ----------------------------
-- Table structure for `charge_status`
-- ----------------------------
DROP TABLE IF EXISTS `charge_status`;
CREATE TABLE `charge_status` (
  `id` int(11) NOT NULL,
  `name` varchar(40) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of charge_status
-- ----------------------------
INSERT INTO `charge_status` VALUES ('1', '初始化待发送（不发短信）');
INSERT INTO `charge_status` VALUES ('2', '免费试用（发短信）');
INSERT INTO `charge_status` VALUES ('3', '免费期满待收费（发短信）');
INSERT INTO `charge_status` VALUES ('4', '免费试用停止（不发短信）');
INSERT INTO `charge_status` VALUES ('5', '待退订（根据截至日期发送）');
INSERT INTO `charge_status` VALUES ('6', '已退订（不发短信）');
INSERT INTO `charge_status` VALUES ('7', '代收费使用中（发短信）');
INSERT INTO `charge_status` VALUES ('8', '现金收费使用中（发短信）');
INSERT INTO `charge_status` VALUES ('9', '现金收费停用（不发短信）');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `city_idx_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '合肥市');
INSERT INTO `city` VALUES ('2', '芜湖市');
INSERT INTO `city` VALUES ('3', '蚌埠市');
INSERT INTO `city` VALUES ('4', '淮南市');
INSERT INTO `city` VALUES ('5', '马鞍山市');
INSERT INTO `city` VALUES ('6', '淮北市');
INSERT INTO `city` VALUES ('7', '铜陵市');
INSERT INTO `city` VALUES ('8', '安庆市');
INSERT INTO `city` VALUES ('9', '黄山市');
INSERT INTO `city` VALUES ('10', '滁州市');
INSERT INTO `city` VALUES ('11', '阜阳市');
INSERT INTO `city` VALUES ('12', '宿州市');
INSERT INTO `city` VALUES ('13', '六安市');
INSERT INTO `city` VALUES ('14', '亳州市');
INSERT INTO `city` VALUES ('15', '池州市');
INSERT INTO `city` VALUES ('16', '宣城市');

-- ----------------------------
-- Table structure for `class_info`
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `grade_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `class_idx_1` (`id`),
  KEY `class_idx_2` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of class_info
-- ----------------------------

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `district_idx_1` (`id`),
  KEY `district_idx_2` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '瑶海区', '1');
INSERT INTO `district` VALUES ('2', '庐阳区', '1');
INSERT INTO `district` VALUES ('3', '蜀山区', '1');
INSERT INTO `district` VALUES ('4', '包河区', '1');
INSERT INTO `district` VALUES ('5', '长丰县', '1');
INSERT INTO `district` VALUES ('6', '肥东县', '1');
INSERT INTO `district` VALUES ('7', '肥西县', '1');
INSERT INTO `district` VALUES ('8', '庐江县', '1');
INSERT INTO `district` VALUES ('9', '巢湖市', '1');
INSERT INTO `district` VALUES ('10', '镜湖区', '2');
INSERT INTO `district` VALUES ('11', '弋江区', '2');
INSERT INTO `district` VALUES ('12', '鸠江区', '2');
INSERT INTO `district` VALUES ('13', '三山区', '2');
INSERT INTO `district` VALUES ('14', '芜湖县', '2');
INSERT INTO `district` VALUES ('15', '繁昌县', '2');
INSERT INTO `district` VALUES ('16', '南陵县', '2');
INSERT INTO `district` VALUES ('17', '无为县', '2');
INSERT INTO `district` VALUES ('18', '龙子湖区', '3');
INSERT INTO `district` VALUES ('19', '蚌山区', '3');
INSERT INTO `district` VALUES ('20', '禹会区', '3');
INSERT INTO `district` VALUES ('21', '淮上区', '3');
INSERT INTO `district` VALUES ('22', '怀远县', '3');
INSERT INTO `district` VALUES ('23', '五河县', '3');
INSERT INTO `district` VALUES ('24', '固镇县', '3');
INSERT INTO `district` VALUES ('25', '大通区', '4');
INSERT INTO `district` VALUES ('26', '田家庵区', '4');
INSERT INTO `district` VALUES ('27', '谢家集区', '4');
INSERT INTO `district` VALUES ('28', '八公山区', '4');
INSERT INTO `district` VALUES ('29', '潘集区', '4');
INSERT INTO `district` VALUES ('30', '凤台县', '4');
INSERT INTO `district` VALUES ('31', '花山区', '5');
INSERT INTO `district` VALUES ('32', '雨山区', '5');
INSERT INTO `district` VALUES ('33', '博望区', '5');
INSERT INTO `district` VALUES ('34', '当涂县', '5');
INSERT INTO `district` VALUES ('35', '含山县', '5');
INSERT INTO `district` VALUES ('36', '和　县', '5');
INSERT INTO `district` VALUES ('37', '杜集区', '6');
INSERT INTO `district` VALUES ('38', '相山区', '6');
INSERT INTO `district` VALUES ('39', '烈山区', '6');
INSERT INTO `district` VALUES ('40', '濉溪县', '6');
INSERT INTO `district` VALUES ('41', '铜官山区', '7');
INSERT INTO `district` VALUES ('42', '狮子山区', '7');
INSERT INTO `district` VALUES ('43', '郊　区', '7');
INSERT INTO `district` VALUES ('44', '铜陵县', '7');
INSERT INTO `district` VALUES ('45', '迎江区', '8');
INSERT INTO `district` VALUES ('46', '大观区', '8');
INSERT INTO `district` VALUES ('47', '宜秀区', '8');
INSERT INTO `district` VALUES ('48', '桐城市', '8');
INSERT INTO `district` VALUES ('49', '怀宁县', '8');
INSERT INTO `district` VALUES ('50', '枞阳县', '8');
INSERT INTO `district` VALUES ('51', '潜山县', '8');
INSERT INTO `district` VALUES ('52', '太湖县', '8');
INSERT INTO `district` VALUES ('53', '宿松县', '8');
INSERT INTO `district` VALUES ('54', '望江县', '8');
INSERT INTO `district` VALUES ('55', '岳西县', '8');
INSERT INTO `district` VALUES ('56', '屯溪区', '9');
INSERT INTO `district` VALUES ('57', '黄山区', '9');
INSERT INTO `district` VALUES ('58', '徽州区', '9');
INSERT INTO `district` VALUES ('59', '歙　县', '9');
INSERT INTO `district` VALUES ('60', '休宁县', '9');
INSERT INTO `district` VALUES ('61', '黟　县', '9');
INSERT INTO `district` VALUES ('62', '祁门县', '9');
INSERT INTO `district` VALUES ('63', '琅琊区', '10');
INSERT INTO `district` VALUES ('64', '南谯区', '10');
INSERT INTO `district` VALUES ('65', '天长市', '10');
INSERT INTO `district` VALUES ('66', '明光市', '10');
INSERT INTO `district` VALUES ('67', '来安县', '10');
INSERT INTO `district` VALUES ('68', '全椒县', '10');
INSERT INTO `district` VALUES ('69', '定远县', '10');
INSERT INTO `district` VALUES ('70', '凤阳县', '10');
INSERT INTO `district` VALUES ('71', '颍州区', '11');
INSERT INTO `district` VALUES ('72', '颍东区', '11');
INSERT INTO `district` VALUES ('73', '颍泉区', '11');
INSERT INTO `district` VALUES ('74', '界首市', '11');
INSERT INTO `district` VALUES ('75', '临泉县', '11');
INSERT INTO `district` VALUES ('76', '太和县', '11');
INSERT INTO `district` VALUES ('77', '阜南县', '11');
INSERT INTO `district` VALUES ('78', '颍上县', '11');
INSERT INTO `district` VALUES ('79', '埇桥区', '12');
INSERT INTO `district` VALUES ('80', '砀山县', '12');
INSERT INTO `district` VALUES ('81', '萧　县', '12');
INSERT INTO `district` VALUES ('82', '灵璧县', '12');
INSERT INTO `district` VALUES ('83', '泗　县', '12');
INSERT INTO `district` VALUES ('84', '金安区', '13');
INSERT INTO `district` VALUES ('85', '裕安区', '13');
INSERT INTO `district` VALUES ('86', '寿　县', '13');
INSERT INTO `district` VALUES ('87', '霍邱县', '13');
INSERT INTO `district` VALUES ('88', '舒城县', '13');
INSERT INTO `district` VALUES ('89', '金寨县', '13');
INSERT INTO `district` VALUES ('90', '霍山县', '13');
INSERT INTO `district` VALUES ('91', '谯城区', '14');
INSERT INTO `district` VALUES ('92', '涡阳县', '14');
INSERT INTO `district` VALUES ('93', '蒙城县', '14');
INSERT INTO `district` VALUES ('94', '利辛县', '14');
INSERT INTO `district` VALUES ('95', '贵池区', '15');
INSERT INTO `district` VALUES ('96', '东至县', '15');
INSERT INTO `district` VALUES ('97', '石台县', '15');
INSERT INTO `district` VALUES ('98', '青阳县', '15');
INSERT INTO `district` VALUES ('99', '宣州区', '16');
INSERT INTO `district` VALUES ('100', '宁国市', '16');
INSERT INTO `district` VALUES ('101', '郎溪县', '16');
INSERT INTO `district` VALUES ('102', '广德县', '16');
INSERT INTO `district` VALUES ('103', '泾　县', '16');
INSERT INTO `district` VALUES ('104', '绩溪县', '16');
INSERT INTO `district` VALUES ('105', '旌德县', '16');

-- ----------------------------
-- Table structure for `grade_info`
-- ----------------------------
DROP TABLE IF EXISTS `grade_info`;
CREATE TABLE `grade_info` (
  `id` int(11) NOT NULL,
  `name` char(20) collate utf8_bin NOT NULL,
  `phase` char(20) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of grade_info
-- ----------------------------

-- ----------------------------
-- Table structure for `notification`
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) collate utf8_bin NOT NULL,
  `content` varchar(500) collate utf8_bin NOT NULL default '',
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  `created_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ntf_idx_1` (`from_user_id`),
  KEY `ntf_idx_2` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for `parent_info`
-- ----------------------------
DROP TABLE IF EXISTS `parent_info`;
CREATE TABLE `parent_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(20) collate utf8_bin NOT NULL,
  `par_phone_num` char(20) collate utf8_bin NOT NULL,
  `par_phone_type` int(11) default NULL,
  `par_charge_phone_num` char(20) collate utf8_bin default NULL,
  `par_charge_phone_type` int(11) default NULL,
  `student_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_idx_1` (`id`),
  KEY `parent_idx_2` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of parent_info
-- ----------------------------

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin default NULL,
  `status` int(10) default '1',
  PRIMARY KEY  (`id`),
  KEY `role_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '家校通系统管理员', '1');
INSERT INTO `role_info` VALUES ('2', '家校通客服', '1');
INSERT INTO `role_info` VALUES ('3', '联通客服', '1');
INSERT INTO `role_info` VALUES ('4', '代理商管理员', '1');
INSERT INTO `role_info` VALUES ('5', '代理商客服', '1');
INSERT INTO `role_info` VALUES ('6', '学校信息员', '1');
INSERT INTO `role_info` VALUES ('7', '老师', '1');
INSERT INTO `role_info` VALUES ('8', '家长', '1');

-- ----------------------------
-- Table structure for `school_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_info`;
CREATE TABLE `school_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_bin NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `school_idx_1` (`id`),
  KEY `school_idx_2` (`district_id`),
  KEY `school_idx_3` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of school_info
-- ----------------------------

-- ----------------------------
-- Table structure for `send_status`
-- ----------------------------
DROP TABLE IF EXISTS `send_status`;
CREATE TABLE `send_status` (
  `id` int(11) NOT NULL,
  `name` varchar(40) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of send_status
-- ----------------------------
INSERT INTO `send_status` VALUES ('1', '未发送');
INSERT INTO `send_status` VALUES ('2', '发送中');
INSERT INTO `send_status` VALUES ('3', '发送成功');
INSERT INTO `send_status` VALUES ('4', '发送失败');
INSERT INTO `send_status` VALUES ('5', '再次发送');

-- ----------------------------
-- Table structure for `sms_info`
-- ----------------------------
DROP TABLE IF EXISTS `sms_info`;
CREATE TABLE `sms_info` (
  `id` int(11) NOT NULL auto_increment,
  `operation_id` int(11) default '-1',
  `receive_type` int(11) NOT NULL,
  `receive_user_id` int(11) default '0',
  `student_id` int(11) default '0',
  `parent_id` int(11) default '0',
  `phone_num` char(20) collate utf8_bin NOT NULL,
  `phone_type` int(11) default NULL,
  `charge_phone_num` char(20) collate utf8_bin NOT NULL,
  `charge_phone_type` int(11) default NULL,
  `content` varchar(200) collate utf8_bin NOT NULL,
  `scheduled_time` datetime NOT NULL,
  `sent_time` datetime default NULL,
  `status` int(11) NOT NULL default '1',
  `trial_num` int(11) NOT NULL default '0',
  `failed_reason` varchar(200) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`),
  KEY `sms_idx_1` (`id`),
  KEY `sms_idx_2` (`student_id`),
  KEY `sms_idx_3` (`parent_id`),
  KEY `sms_idx_4` (`receive_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_operation_history`
-- ----------------------------
DROP TABLE IF EXISTS `sms_operation_history`;
CREATE TABLE `sms_operation_history` (
  `id` int(11) NOT NULL auto_increment,
  `operation_user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `school_id` int(11) default NULL,
  `class_id` int(11) default NULL,
  `content` varchar(200) collate utf8_bin NOT NULL,
  `scheduled_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `soh_idx_1` (`id`),
  KEY `soh_idx_2` (`operation_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sms_operation_history
-- ----------------------------

-- ----------------------------
-- Table structure for `student_2_parent`
-- ----------------------------
DROP TABLE IF EXISTS `student_2_parent`;
CREATE TABLE `student_2_parent` (
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `par_phone_send_status` int(11) default '-1',
  KEY `s2p_idx_1` (`student_id`),
  KEY `s2p_idx_2` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student_2_parent
-- ----------------------------

-- ----------------------------
-- Table structure for `student_info`
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `id` int(11) NOT NULL auto_increment,
  `std_num` char(20) collate utf8_bin default NULL,
  `name` char(20) collate utf8_bin NOT NULL,
  `std_phone_num` char(20) collate utf8_bin default NULL,
  `std_phone_type` int(11) default NULL,
  `std_phone_send_status` int(11) default '0',
  `parent_id` char(20) collate utf8_bin NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `student_idx_1` (`id`),
  KEY `student_idx_2` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user_2_agent`
-- ----------------------------
DROP TABLE IF EXISTS `user_2_agent`;
CREATE TABLE `user_2_agent` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `u2a_idx_1` (`user_id`),
  KEY `u2a_idx_2` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_agent
-- ----------------------------
INSERT INTO `user_2_agent` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for `user_2_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_2_role`;
CREATE TABLE `user_2_role` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `u2r_idx_1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_role
-- ----------------------------
INSERT INTO `user_2_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `user_2_school`
-- ----------------------------
DROP TABLE IF EXISTS `user_2_school`;
CREATE TABLE `user_2_school` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `u2s_idx_1` (`user_id`),
  KEY `u2s_idx_2` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_2_school
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(40) collate utf8_bin default NULL,
  `password` varchar(100) collate utf8_bin default NULL,
  `phone_num` char(20) collate utf8_bin default NULL,
  `phone_type` int(11) default NULL,
  `charge_phone_num` char(20) collate utf8_bin default '',
  `charge_phone_type` int(11) default NULL,
  `status` int(11) default '1',
  `sms_flag` int(11) default '1',
  PRIMARY KEY  (`id`),
  KEY `user_idx_1` (`id`),
  KEY `user_idx_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '系统管理员', 'P@ssword#123', null, null, '', null, '1', '0');
