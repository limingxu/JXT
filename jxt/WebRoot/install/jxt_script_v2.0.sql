/*
 Version 2.0
 #1. 修改table命名策略：  
     tb_****
     删除多对多关联表中间的2，代替tb_a_b
     表名小写
	 
 #2. 添加外键
 #3. 替换用户权限相关表
 #4. 添加drop 语句 
 #5. 添加模拟数据
Date: 2013-07-23 11:14:34
*/

drop database IF EXISTS jxt_v2;

CREATE DATABASE jxt_v2 CHARACTER SET utf8 COLLATE utf8_bin;

use jxt_v2;

DROP TABLE IF EXISTS tb_admin;

CREATE TABLE tb_admin (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) default NULL,/*用户姓名*/
  password varchar(255) NOT NULL, /*保存MD5加密后的用户密码*/
  username varchar(255) NOT NULL,/*登陆名称*/
  email varchar(255) NOT NULL,
  
  pid int default null, /*创建者id,如没有，则为系统超级管理员*/
  
  phone_num char(20), /*接收短信的手机号*/
  phone_type int default -1,  /* 0为异网手机用户，1为联通手机用户*/
  charge_phone_num char(20) default '', /*用于计费的手机号，如无特别指定，此字段与phone_num字段相同或置空*/
  charge_phone_type int default -1, /*同phone_type*/
  
  sms_flag int(0) default 1, /*是否发送短信的标识位，默认为发送*/
  
  is_account_enabled bit(1) NOT NULL,
  is_account_expired bit(1) NOT NULL,
  is_account_locked bit(1) NOT NULL,
  is_credentials_expired bit(1) NOT NULL,
  locked_date datetime default NULL,
  login_date datetime default NULL,
  login_failure_count int(11) NOT NULL,
  login_ip varchar(255) default NULL,

  create_date datetime default NULL,
  modify_date datetime default NULL,
  comments varchar(200), /*用户,备注*/
  
  PRIMARY KEY  (id),
  UNIQUE KEY username (username)
);
 INSERT INTO tb_admin(id,name,password,username,email,is_account_enabled,is_account_expired,is_account_locked,is_credentials_expired,login_failure_count) 
     VALUES (1,'ADMIN','e10adc3949ba59abbe56e057f20f883e','admin','admin@gmail.com', 1,0,0,0,5);


ALTER TABLE tb_admin ADD INDEX user_idx_2 (name);


DROP TABLE IF EXISTS tb_role;

CREATE TABLE tb_role (
  id int(32) NOT NULL,
  create_date datetime default NULL,
  modify_date datetime default NULL,
  authority_list_store text,
  description text,
  is_system bit(1) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY  (id)
);

INSERT INTO tb_role VALUES (1, '2011-01-01 00:00:00', '2011-01-01 00:00:00', '[\"ROLE_GOODS\",\"ROLE_GOODS_NOTIFY\",\"ROLE_GOODS_CATEGORY\",\"ROLE_GOODS_TYPE\",\"ROLE_SPECIFICATION\",\"ROLE_BRAND\",\"ROLE_ORDER\",\"ROLE_PAYMENT\",\"ROLE_REFUND\",\"ROLE_SHIPPING\",\"ROLE_RESHIP\",\"ROLE_MEMBER\",\"ROLE_MEMBER_RANK\",\"ROLE_MEMBER_ATTRIBUTE\",\"ROLE_COMMENT\",\"ROLE_LEAVE_MESSAGE\",\"ROLE_NAVIGATION\",\"ROLE_ARTICLEE\",\"ROLE_ARTICLE_CATEGORY\",\"ROLE_FRIEND_LINK\",\"ROLE_PAGE_TEMPLATE\",\"ROLE_MAIL_TEMPLATE\",\"ROLE_PRINT_TEMPLATE\",\"ROLE_CACHE\",\"ROLE_BUILD_HTML\",\"ROLE_ADMIN\",\"ROLE_ROLE\",\"ROLE_MESSAGE\",\"ROLE_LOG\",\"ROLE_SETTING\",\"ROLE_INSTANT_MESSAGING\",\"ROLE_PAYMENT_CONFIG\",\"ROLE_DELIVERY_TYPE\",\"ROLE_AREA\",\"ROLE_DELIVERY_CORP\",\"ROLE_DELIVERY_CENTER\",\"ROLE_DELIVERY_TEMPLATE\",\"ROLE_BASE\"]', '拥有后台管理最高权限', '', '超级管理员');

DROP TABLE IF EXISTS tb_admin_role;
CREATE TABLE tb_admin_role (
  id int(32) NOT NULL AUTO_INCREMENT,
  admin_set_id int(32) NOT NULL,
  role_set_id int(32) NOT NULL,
  PRIMARY KEY  (id,admin_set_id,role_set_id),
  KEY xx_role_admin_set (role_set_id),
  KEY xx_admin_role_set (admin_set_id),
  CONSTRAINT tb_admin_role_ibfk_1 FOREIGN KEY (admin_set_id) REFERENCES tb_admin (id),
  CONSTRAINT tb_admin_role_ibfk_2 FOREIGN KEY (role_set_id) REFERENCES tb_role (id)
);

 insert into tb_admin_role values(1,1,1);

/* *********************************************************分割线************************************************************************************************** */

DROP TABLE IF EXISTS tb_city;
CREATE TABLE tb_city(
   id int not null primary key AUTO_INCREMENT,
   name varchar(40) not null
);

ALTER TABLE tb_city ADD INDEX tb_city_idx_1 (id);

DROP TABLE IF EXISTS tb_district;
CREATE TABLE tb_district(
   id int not null primary key AUTO_INCREMENT,
   name varchar(40) not null,
   city_id int not null,
   
    constraint tb_district_fk1  foreign key (city_id) references tb_city(id)
);

ALTER TABLE tb_district ADD INDEX district_idx_2 (city_id);

DROP TABLE IF EXISTS tb_agent;
CREATE TABLE tb_agent(
   id int not null primary key AUTO_INCREMENT,
   name varchar(50) not null, /*代理商名称*/
   short_name char(20), /*代理商简称*/
   description varchar(2000), /*代理商的信息描述*/
   status int not null default 1
);

ALTER TABLE tb_agent ADD INDEX agent_idx_1 (id);

DROP TABLE IF EXISTS tb_user_agent;
CREATE TABLE tb_user_agent(
   id int not null primary key AUTO_INCREMENT,
   user_id int not null,
   agent_id int not null,
   status int not null default 1,
	
  constraint tb_user_agent_fk1 foreign key(user_id) references tb_admin(id),
	constraint tb_user_agent_fk2 foreign key(agent_id) references tb_agent(id)
);

ALTER TABLE  tb_user_agent ADD INDEX u2a_idx_1 (user_id);
ALTER TABLE  tb_user_agent ADD INDEX u2a_idx_2 (agent_id);

DROP TABLE IF EXISTS tb_school;
CREATE TABLE tb_school(
   id int not null primary key AUTO_INCREMENT,
   name varchar(50) not null,
   city_id int not null,
   district_id int not null,
   agent_id int not null, /*学校所属代理商信息*/
   description varchar(2000) not null, /*保留字段*/
   status int not null default 1,
   
   constraint tb_school_fk1 foreign key(city_id) references tb_city(id),
   constraint tb_school_fk2 foreign key(district_id) references tb_district(id),
   constraint tb_school_fk3 foreign key(agent_id) references tb_agent(id)
);

DROP TABLE IF EXISTS tb_grade;
CREATE TABLE tb_grade( /* 该表为静态表，供学生升级或毕业时使用*/
   id int not null primary key,
   name char(20) not null, /* 年级名称，值为幼班、中班、大班、一到六年纪、初一到初四、高一到高四*/
   phase char(20) not null /* 年级所在学段，值为幼儿园、小学、初中、高中、大学*/
);

ALTER TABLE tb_school ADD INDEX school_idx_1 (id);
ALTER TABLE tb_school ADD INDEX school_idx_2 (district_id);
ALTER TABLE tb_school ADD INDEX school_idx_3 (agent_id);


DROP TABLE IF EXISTS tb_class;
CREATE TABLE tb_class(
   id int not null primary key AUTO_INCREMENT,
   name varchar(50) not null,
   grade_id int not null, /*班级所在年级*/
   school_id int not null,
   status int not null default 1, /*1 有效，2 已毕业*/
	
    constraint tb_class_fk1 FOREIGN key(grade_id) REFERENCES tb_grade(id), 
		constraint tb_class_fk2 FOREIGN key(school_id) REFERENCES tb_school(id)
);


ALTER TABLE tb_class ADD INDEX class_idx_1 (id);
ALTER TABLE tb_class ADD INDEX class_idx_2 (school_id);



DROP TABLE IF EXISTS tb_user_school;
CREATE TABLE tb_user_school (
   id int not null primary key AUTO_INCREMENT,
   user_id int not null, /*代理商管理员，代理商客服，学校管理员，老师。注意：当代理商管理员创建一个学校时，需要将此代理商下属的所有管理员都加入此表*/
   school_id int not null,
   status int not null default 1,
	 
   constraint tb_user_school_fk1 FOREIGN key(user_id) REFERENCES tb_admin(id),
   constraint tb_user_school_fk2 FOREIGN key(school_id) REFERENCES tb_school(id) 
);

ALTER TABLE tb_user_school ADD INDEX u2s_idx_1 (user_id);
ALTER TABLE tb_user_school ADD INDEX u2s_idx_2 (school_id);


DROP TABLE IF EXISTS tb_student;
CREATE TABLE tb_student(
   id int not null primary key AUTO_INCREMENT,
   std_num char(20), /*学生学号*/
   name char(20) not null,
   std_phone_num char(20), /*此字段预留*/
   std_phone_type int default -1, /*此字段预留*/
   std_phone_send_status int default 0, /*此字段预留*/
   parent_id int(20) not null,
   class_id int not null,
   status int not null default 1, /*1 在校，2 离校*/

   constraint tb_student_fk1 FOREIGN key(parent_id) REFERENCES tb_admin(id),
   constraint tb_student_fk2 FOREIGN key(class_id) REFERENCES tb_class(id) 
);

ALTER TABLE tb_student ADD INDEX student_idx_1 (id);
ALTER TABLE tb_student ADD INDEX student_idx_2 (class_id);

/*
CREATE TABLE tb_parent(
   id int not null primary key AUTO_INCREMENT,
   name char(20) not null,
   par_phone_num  char(20) not null,
   par_phone_type int default -1,
   par_charge_phone_num char(20),
   par_charge_phone_type int,
  student_id int not null, 
   status int not null default 1
);

ALTER TABLE tb_parent ADD INDEX parent_idx_1 (id);
ALTER TABLE tb_parent ADD INDEX parent_idx_2 (student_id);
*/


/* 广义父母，可能相关亲属 */
DROP TABLE IF EXISTS tb_student_parent;
CREATE TABLE tb_student_parent (
   id int(32) not null primary key AUTO_INCREMENT,
   student_id int not null,
   parent_id int not null,
   par_phone_send_status int default -1, /*此处保存用户最新的服务定制状态*/
   
    constraint tb_student_parent_fk1 foreign key(student_id) references tb_student(id),
    constraint tb_student_parent_fk2 foreign key(parent_id) references tb_admin(id)
);

ALTER TABLE tb_student_parent ADD INDEX s2p_idx_1 (student_id);
ALTER TABLE tb_student_parent ADD INDEX s2p_idx_2 (parent_id);

DROP TABLE IF EXISTS tb_charge_history;
CREATE TABLE tb_charge_history ( /*历史信息表，记录所有家长的服务定制历史信息，只做插入操作*/
   id int not null primary key AUTO_INCREMENT,
   student_id int,
   parent_id int,
   phone_num char(20) not null,
   phone_type int default -1,
   charge_phone_num char(20),
   charge_phone_type int default -1,
   effect_time datetime not null,
   expired_time datetime,
   par_phone_send_status int not null default 1,
   reason varchar(100),
   
    constraint tb_charge_history_fk1 foreign key(student_id) references tb_student(id),
    constraint tb_charge_history_fk2 foreign key(parent_id) references tb_admin(id)
);

ALTER TABLE tb_charge_history ADD INDEX his_idx_1 (student_id);
ALTER TABLE tb_charge_history ADD INDEX his_idx_2 (parent_id);

DROP TABLE IF EXISTS tb_sms_operation_history;
CREATE TABLE tb_sms_operation_history ( /*历史信息表，记录所有系统内批量发送短信的操作，只做插入操作*/
   id int not null primary key AUTO_INCREMENT,
   operation_user_id int not null, /*发送短信者的user id*/
   type int not null, /*此字段判断短信是发送给全校老师还是家长，1代表老师，2代表家长*/
   school_id int, 
   class_id int, 
   content varchar(200) not null,
   scheduled_time datetime not null,
   
   constraint tb_sms_operation_history_fk1 foreign key(school_id) references tb_school(id),
   constraint tb_sms_operation_history_fk2 foreign key(class_id) references tb_class(id)
   
);

ALTER TABLE tb_sms_operation_history ADD INDEX soh_idx_1 (id);
ALTER TABLE tb_sms_operation_history ADD INDEX soh_idx_2 (operation_user_id);

DROP TABLE IF EXISTS tb_sms_info;
CREATE TABLE tb_sms_info(
   id int not null primary key AUTO_INCREMENT,
   operation_id int default -1, /*-1代表短信不是批量发送*/
   receive_type int, /*此字段判断短信是发送给老师还是家长，1代表老师，2代表家长*/
   receive_user_id int default 0, /*如发送给老师，则此字段有值*/
   student_id int default 0, /*如发送给家长，则此字段有值*/
   parent_id int default 0, /*如发送给家长，则此字段有值*/
   phone_num char(20) not null,
   phone_type int default -1,
   charge_phone_num char(20),
   charge_phone_type int default -1,
   content varchar(200) not null,
   scheduled_time datetime,
   sent_time datetime,
   status int default 1,
   trial_num int default 0,
   failed_reason varchar(200) default '',
   
   constraint tb_sms_info_fk1 foreign key(receive_user_id) references tb_admin(id),
   constraint tb_sms_info_fk2 foreign key(student_id) references tb_admin(id),
   constraint tb_sms_info_fk3 foreign key(parent_id) references tb_admin(id)
);

ALTER TABLE tb_sms_info ADD INDEX sms_idx_1 (id);
ALTER TABLE tb_sms_info ADD INDEX sms_idx_2 (student_id);
ALTER TABLE tb_sms_info ADD INDEX sms_idx_3 (parent_id);
ALTER TABLE tb_sms_info ADD INDEX sms_idx_4 (receive_user_id);

DROP TABLE IF EXISTS tb_charge_status;
CREATE TABLE tb_charge_status(
   id int not null primary key,
   name varchar(40)
);

CREATE TABLE tb_send_status(
   id int not null primary key,
   name varchar(40)
);

CREATE TABLE tb_notification(  /*此表存放系统管理员的公告和代理商的申请*/
   id int not null primary key,
   subject varchar(100) not null,
   content varchar(500) not null default '',
   from_user_id int not null, /*发送者的userid*/
   to_user_id int not null, /*接收者的userid*/
   status int not null default 1, /*1 此通知未读，2 此通知已读*/
   created_date datetime not null, /*1 通知发布时间*/
   
   constraint tb_notification_fk1 foreign key(from_user_id) references tb_admin(id),
   constraint tb_notification_fk2 foreign key(to_user_id) references tb_admin(id)
);

ALTER TABLE tb_notification ADD INDEX ntf_idx_1 (from_user_id);
ALTER TABLE tb_notification ADD INDEX ntf_idx_2 (to_user_id);

-- insert init data

/*
insert into role_info (name) values ('家校通系统管理员');
insert into role_info (name) values ('家校通客服');
insert into role_info (name) values ('联通客服');
insert into role_info (name) values ('代理商管理员');
insert into role_info (name) values ('代理商客服');
insert into role_info (name) values ('学校信息员');
insert into role_info (name) values ('老师');
insert into role_info (name) values ('家长');
*/

insert into tb_agent (name, short_name, description) values ('安徽锦佳科技有限公司', '锦佳科技', '');

insert into tb_user_agent (user_id, agent_id, status) values (1, 1, 1);

insert into tb_city (name) values ('合肥市');
insert into tb_district (name, city_id) values ('瑶海区', 1);
insert into tb_district (name, city_id) values ('庐阳区', 1);
insert into tb_district (name, city_id) values ('蜀山区', 1);
insert into tb_district (name, city_id) values ('包河区', 1);
insert into tb_district (name, city_id) values ('长丰县', 1);
insert into tb_district (name, city_id) values ('肥东县', 1);
insert into tb_district (name, city_id) values ('肥西县', 1);
insert into tb_district (name, city_id) values ('庐江县', 1);
insert into tb_district (name, city_id) values ('巢湖市', 1);
insert into tb_city (name) values ('芜湖市');
insert into tb_district (name, city_id) values ('镜湖区', 2);
insert into tb_district (name, city_id) values ('弋江区', 2);
insert into tb_district (name, city_id) values ('鸠江区', 2);
insert into tb_district (name, city_id) values ('三山区', 2);
insert into tb_district (name, city_id) values ('芜湖县', 2);
insert into tb_district (name, city_id) values ('繁昌县', 2);
insert into tb_district (name, city_id) values ('南陵县', 2);
insert into tb_district (name, city_id) values ('无为县', 2);
insert into tb_city (name) values ('蚌埠市');
insert into tb_district (name, city_id) values ('龙子湖区', 3);
insert into tb_district (name, city_id) values ('蚌山区', 3);
insert into tb_district (name, city_id) values ('禹会区', 3);
insert into tb_district (name, city_id) values ('淮上区', 3);
insert into tb_district (name, city_id) values ('怀远县', 3);
insert into tb_district (name, city_id) values ('五河县', 3);
insert into tb_district (name, city_id) values ('固镇县', 3);
insert into tb_city (name) values ('淮南市');
insert into tb_district (name, city_id) values ('大通区', 4);
insert into tb_district (name, city_id) values ('田家庵区', 4);
insert into tb_district (name, city_id) values ('谢家集区', 4);
insert into tb_district (name, city_id) values ('八公山区', 4);
insert into tb_district (name, city_id) values ('潘集区', 4);
insert into tb_district (name, city_id) values ('凤台县', 4);
insert into tb_city (name) values ('马鞍山市');
insert into tb_district (name, city_id) values ('花山区', 5);
insert into tb_district (name, city_id) values ('雨山区', 5);
insert into tb_district (name, city_id) values ('博望区', 5);
insert into tb_district (name, city_id) values ('当涂县', 5);
insert into tb_district (name, city_id) values ('含山县', 5);
insert into tb_district (name, city_id) values ('和　县', 5);
insert into tb_city (name) values ('淮北市');
insert into tb_district (name, city_id) values ('杜集区', 6);
insert into tb_district (name, city_id) values ('相山区', 6);
insert into tb_district (name, city_id) values ('烈山区', 6);
insert into tb_district (name, city_id) values ('濉溪县', 6);
insert into tb_city (name) values ('铜陵市');
insert into tb_district (name, city_id) values ('铜官山区', 7);
insert into tb_district (name, city_id) values ('狮子山区', 7);
insert into tb_district (name, city_id) values ('郊　区', 7);
insert into tb_district (name, city_id) values ('铜陵县', 7);
insert into tb_city (name) values ('安庆市');
insert into tb_district (name, city_id) values ('迎江区', 8);
insert into tb_district (name, city_id) values ('大观区', 8);
insert into tb_district (name, city_id) values ('宜秀区', 8);
insert into tb_district (name, city_id) values ('桐城市', 8);
insert into tb_district (name, city_id) values ('怀宁县', 8);
insert into tb_district (name, city_id) values ('枞阳县', 8);
insert into tb_district (name, city_id) values ('潜山县', 8);
insert into tb_district (name, city_id) values ('太湖县', 8);
insert into tb_district (name, city_id) values ('宿松县', 8);
insert into tb_district (name, city_id) values ('望江县', 8);
insert into tb_district (name, city_id) values ('岳西县', 8);
insert into tb_city (name) values ('黄山市');
insert into tb_district (name, city_id) values ('屯溪区', 9);
insert into tb_district (name, city_id) values ('黄山区', 9);
insert into tb_district (name, city_id) values ('徽州区', 9);
insert into tb_district (name, city_id) values ('歙　县', 9);
insert into tb_district (name, city_id) values ('休宁县', 9);
insert into tb_district (name, city_id) values ('黟　县', 9);
insert into tb_district (name, city_id) values ('祁门县', 9);
insert into tb_city (name) values ('滁州市');
insert into tb_district (name, city_id) values ('琅琊区', 10);
insert into tb_district (name, city_id) values ('南谯区', 10);
insert into tb_district (name, city_id) values ('天长市', 10);
insert into tb_district (name, city_id) values ('明光市', 10);
insert into tb_district (name, city_id) values ('来安县', 10);
insert into tb_district (name, city_id) values ('全椒县', 10);
insert into tb_district (name, city_id) values ('定远县', 10);
insert into tb_district (name, city_id) values ('凤阳县', 10);
insert into tb_city (name) values ('阜阳市');
insert into tb_district (name, city_id) values ('颍州区', 11);
insert into tb_district (name, city_id) values ('颍东区', 11);
insert into tb_district (name, city_id) values ('颍泉区', 11);
insert into tb_district (name, city_id) values ('界首市', 11);
insert into tb_district (name, city_id) values ('临泉县', 11);
insert into tb_district (name, city_id) values ('太和县', 11);
insert into tb_district (name, city_id) values ('阜南县', 11);
insert into tb_district (name, city_id) values ('颍上县', 11);
insert into tb_city (name) values ('宿州市');
insert into tb_district (name, city_id) values ('埇桥区', 12);
insert into tb_district (name, city_id) values ('砀山县', 12);
insert into tb_district (name, city_id) values ('萧　县', 12);
insert into tb_district (name, city_id) values ('灵璧县', 12);
insert into tb_district (name, city_id) values ('泗　县', 12);
insert into tb_city (name) values ('六安市');
insert into tb_district (name, city_id) values ('金安区', 13);
insert into tb_district (name, city_id) values ('裕安区', 13);
insert into tb_district (name, city_id) values ('寿　县', 13);
insert into tb_district (name, city_id) values ('霍邱县', 13);
insert into tb_district (name, city_id) values ('舒城县', 13);
insert into tb_district (name, city_id) values ('金寨县', 13);
insert into tb_district (name, city_id) values ('霍山县', 13);
insert into tb_city (name) values ('亳州市');
insert into tb_district (name, city_id) values ('谯城区', 14);
insert into tb_district (name, city_id) values ('涡阳县', 14);
insert into tb_district (name, city_id) values ('蒙城县', 14);
insert into tb_district (name, city_id) values ('利辛县', 14);
insert into tb_city (name) values ('池州市');
insert into tb_district (name, city_id) values ('贵池区', 15);
insert into tb_district (name, city_id) values ('东至县', 15);
insert into tb_district (name, city_id) values ('石台县', 15);
insert into tb_district (name, city_id) values ('青阳县', 15);
insert into tb_city (name) values ('宣城市');
insert into tb_district (name, city_id) values ('宣州区', 16);
insert into tb_district (name, city_id) values ('宁国市', 16);
insert into tb_district (name, city_id) values ('郎溪县', 16);
insert into tb_district (name, city_id) values ('广德县', 16);
insert into tb_district (name, city_id) values ('泾　县', 16);
insert into tb_district (name, city_id) values ('绩溪县', 16);
insert into tb_district (name, city_id) values ('旌德县', 16);

insert into tb_charge_status (id, name) values (1, '初始化待发送（不发短信）');
insert into tb_charge_status (id, name) values (2, '免费试用（发短信）');
insert into tb_charge_status (id, name) values (3, '免费期满待收费（发短信）');
insert into tb_charge_status (id, name) values (4, '免费试用停止（不发短信）');
insert into tb_charge_status (id, name) values (5, '待退订（根据截至日期发送）');
insert into tb_charge_status (id, name) values (6, '已退订（不发短信）');
insert into tb_charge_status (id, name) values (7, '代收费使用中（发短信）');
insert into tb_charge_status (id, name) values (8, '现金收费使用中（发短信）');
insert into tb_charge_status (id, name) values (9, '现金收费停用（不发短信）');

insert into tb_send_status (id, name) values (1, '未发送');
insert into tb_send_status (id, name) values (2, '发送中');
insert into tb_send_status (id, name) values (3, '发送成功');
insert into tb_send_status (id, name) values (4, '发送失败');
insert into tb_send_status (id, name) values (5, '再次发送');



/*test data

delete from tb_sms_info;
insert into tb_sms_info (receive_type, phone_num, content, scheduled_time, status, trial_num, phone_type) values (1, '13565023568', 'test', now(), 1, 0, 1);
insert into tb_sms_info (receive_type, phone_num, content, scheduled_time, status, trial_num, phone_type) values (1, '13965027206', '工作真没意思，你说对不？', now(), 1, 0, 0);

*/



