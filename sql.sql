DROP TABLE IF EXISTS `employee_user`;
CREATE TABLE `employee_user`(
	   `employee_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工用户ID',
`employee_job_number` varchar(64) NOT NULL UNIQUE comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`department` varchar(64) comment '部门',
`position` varchar(64) comment '职位',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (employee_user_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工用户';

DROP TABLE IF EXISTS `department_management`;
CREATE TABLE `department_management`(
	   `department_management_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门管理ID',
`department_number` varchar(64) comment '部门编号',
`department` varchar(64) comment '部门',
`person_in_charge` varchar(64) comment '负责人',
`number_of_departments` int(11) DEFAULT 0 comment '部门人数',
`date_of_incorporation` date comment '成立日期',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (department_management_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '部门管理';
insert into `department_management` values (1,'部门编号1','部门1','负责人1',5,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (2,'部门编号2','部门2','负责人2',10,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (3,'部门编号3','部门3','负责人3',15,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (4,'部门编号4','部门4','负责人4',20,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (5,'部门编号5','部门5','负责人5',25,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (6,'部门编号6','部门6','负责人6',30,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (7,'部门编号7','部门7','负责人7',35,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `department_management` values (8,'部门编号8','部门8','负责人8',40,'2022-4-7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `employee_attendance`;
CREATE TABLE `employee_attendance`(
	   `employee_attendance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工考勤ID',
`staff` int(11) DEFAULT 0 comment '员工',
`attendance_month` varchar(64) comment '考勤月份',
`days_due` int(11) DEFAULT 0 comment '应到天数',
`actual_arrival_days` int(11) DEFAULT 0 comment '实到天数',
`absence_days` int(11) DEFAULT 0 comment '缺勤天数',
`attendance` varchar(64) comment '出勤率',
`remarks` text comment '备注',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (employee_attendance_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工考勤';
insert into `employee_attendance` values (1,0,'考勤月份1',5,5,5,'出勤率1','备注1','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (2,0,'考勤月份2',10,10,10,'出勤率2','备注2','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (3,0,'考勤月份3',15,15,15,'出勤率3','备注3','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (4,0,'考勤月份4',20,20,20,'出勤率4','备注4','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (5,0,'考勤月份5',25,25,25,'出勤率5','备注5','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (6,0,'考勤月份6',30,30,30,'出勤率6','备注6','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (7,0,'考勤月份7',35,35,35,'出勤率7','备注7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_attendance` values (8,0,'考勤月份8',40,40,40,'出勤率8','备注8','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `employee_overtime`;
CREATE TABLE `employee_overtime`(
	   `employee_overtime_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工加班ID',
`staff` int(11) DEFAULT 0 comment '员工',
`overtime_date` date comment '加班日期',
`overtime_hours` varchar(64) comment '加班时长',
`closing_time` datetime comment '下班时间',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (employee_overtime_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工加班';
insert into `employee_overtime` values (1,0,'2022-4-7','加班时长1','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (2,0,'2022-4-7','加班时长2','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (3,0,'2022-4-7','加班时长3','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (4,0,'2022-4-7','加班时长4','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (5,0,'2022-4-7','加班时长5','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (6,0,'2022-4-7','加班时长6','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (7,0,'2022-4-7','加班时长7','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_overtime` values (8,0,'2022-4-7','加班时长8','2022-4-7 9:25:46','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `employee_salary`;
CREATE TABLE `employee_salary`(
	   `employee_salary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工工资ID',
`staff` int(11) DEFAULT 0 comment '员工',
`salary_month` varchar(64) comment '发薪月份',
`base_pay` int(11) DEFAULT 0 comment '基本工资',
`overtime_pay` int(11) DEFAULT 0 comment '加班费',
`commission` int(11) DEFAULT 0 comment '提成',
`attendance_deduction` int(11) DEFAULT 0 comment '考勤扣款',
`five_insurances_and_one_fund` int(11) DEFAULT 0 comment '五险一金',
`taxation` int(11) DEFAULT 0 comment '税费',
`net_salary` varchar(64) comment '实发工资',
`remarks` varchar(64) comment '备注',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (employee_salary_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工工资';
insert into `employee_salary` values (1,0,'发薪月份1',5,5,5,5,5,5,'实发工资1','备注1','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (2,0,'发薪月份2',10,10,10,10,10,10,'实发工资2','备注2','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (3,0,'发薪月份3',15,15,15,15,15,15,'实发工资3','备注3','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (4,0,'发薪月份4',20,20,20,20,20,20,'实发工资4','备注4','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (5,0,'发薪月份5',25,25,25,25,25,25,'实发工资5','备注5','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (6,0,'发薪月份6',30,30,30,30,30,30,'实发工资6','备注6','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (7,0,'发薪月份7',35,35,35,35,35,35,'实发工资7','备注7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_salary` values (8,0,'发薪月份8',40,40,40,40,40,40,'实发工资8','备注8','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `vaccination`;
CREATE TABLE `vaccination`(
	   `vaccination_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '疫苗接种ID',
`employee_job_number` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`department` varchar(64) comment '部门',
`vaccination_date` date comment '接种日期',
`number_of_inoculation_needles` varchar(64) comment '接种针数',
`vaccination_certificate` varchar(255) comment '接种凭证',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (vaccination_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '疫苗接种';
insert into `vaccination` values (1,0,'员工姓名1','部门1','2022-4-7','接种针数1','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (2,0,'员工姓名2','部门2','2022-4-7','接种针数2','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (3,0,'员工姓名3','部门3','2022-4-7','接种针数3','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (4,0,'员工姓名4','部门4','2022-4-7','接种针数4','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (5,0,'员工姓名5','部门5','2022-4-7','接种针数5','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (6,0,'员工姓名6','部门6','2022-4-7','接种针数6','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (7,0,'员工姓名7','部门7','2022-4-7','接种针数7','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `vaccination` values (8,0,'员工姓名8','部门8','2022-4-7','接种针数8','点此播放','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `employee_leave`;
CREATE TABLE `employee_leave`(
	   `employee_leave_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工请假ID',
`employee_job_number` int(11) DEFAULT 0 comment '员工工号',
`employee_name` varchar(64) comment '员工姓名',
`department` varchar(64) comment '部门',
`leave_type` varchar(64) comment '请假类型',
`leave_days` int(11) DEFAULT 0 comment '请假天数',
`start_time` datetime comment '开始时间',
`end_time` datetime comment '结束时间',
`reason_for_leave` text comment '请假原因',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (employee_leave_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '员工请假';
insert into `employee_leave` values (1,0,'员工姓名1','部门1','请假类型1',5,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因1','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (2,0,'员工姓名2','部门2','请假类型2',10,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因2','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (3,0,'员工姓名3','部门3','请假类型3',15,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因3','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (4,0,'员工姓名4','部门4','请假类型4',20,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因4','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (5,0,'员工姓名5','部门5','请假类型5',25,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因5','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (6,0,'员工姓名6','部门6','请假类型6',30,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因6','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (7,0,'员工姓名7','部门7','请假类型7',35,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因7','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `employee_leave` values (8,0,'员工姓名8','部门8','请假类型8',40,'2022-4-7 9:25:46','2022-4-7 9:25:46','请假原因8','未审核','','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `notice_announcement`;
CREATE TABLE `notice_announcement`(
	   `notice_announcement_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知公告ID',
`title` varchar(64) comment '标题',
`relevant_attachments` varchar(255) comment '相关附件',
`release_date` date comment '发布日期',
`publisher` varchar(64) comment '发布人',
`content` text comment '内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (notice_announcement_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '通知公告';
insert into `notice_announcement` values (1,'标题1','点此下载','2022-4-7','发布人1','内容1','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (2,'标题2','点此下载','2022-4-7','发布人2','内容2','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (3,'标题3','点此下载','2022-4-7','发布人3','内容3','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (4,'标题4','点此下载','2022-4-7','发布人4','内容4','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (5,'标题5','点此下载','2022-4-7','发布人5','内容5','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (6,'标题6','点此下载','2022-4-7','发布人6','内容6','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (7,'标题7','点此下载','2022-4-7','发布人7','内容7','0','2022-04-07 09:25:46','2022-04-07 09:25:46');
insert into `notice_announcement` values (8,'标题8','点此下载','2022-4-7','发布人8','内容8','0','2022-04-07 09:25:46','2022-04-07 09:25:46');

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` varchar(500) DEFAULT NULL COMMENT '添加字段：',
  `field_set` varchar(500) DEFAULT NULL COMMENT '修改字段：',
  `field_get` varchar(500) DEFAULT NULL COMMENT '查询字段：',
  `table_nav_name` varchar(255) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(255) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定制授权';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员',"2022-04-19 07:32:09.000 ",null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/avatar.jpg',"2022-04-19 07:32:09.000 ");
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
insert into `auth` values ('1','管理员','员工用户','employee_user','员工用户','/employee_user/table','','_blank','1','1','1','1','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('2','管理员','员工用户','employee_user','员工用户详情','/employee_user/view','','_blank','1','1','1','1','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('3','管理员','部门管理','department_management','部门管理','/department_management/table','','_blank','1','1','1','1','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('4','管理员','部门管理','department_management','部门管理详情','/department_management/view','','_blank','1','1','1','1','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('5','管理员','员工考勤','employee_attendance','员工考勤','/employee_attendance/table','','_blank','1','1','1','1','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks',null,'0','{"figure":true}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('6','管理员','员工考勤','employee_attendance','员工考勤详情','/employee_attendance/view','','_blank','1','1','1','1','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('7','管理员','员工加班','employee_overtime','员工加班','/employee_overtime/table','','_blank','1','1','1','1','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('8','管理员','员工加班','employee_overtime','员工加班详情','/employee_overtime/view','','_blank','1','1','1','1','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('9','管理员','员工工资','employee_salary','员工工资','/employee_salary/table','','_blank','1','1','1','1','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('10','管理员','员工工资','employee_salary','员工工资详情','/employee_salary/view','','_blank','1','1','1','1','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('11','管理员','疫苗接种','vaccination','疫苗接种','/vaccination/table','','_blank','1','1','1','1','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('12','管理员','疫苗接种','vaccination','疫苗接种详情','/vaccination/view','','_blank','1','1','1','1','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('13','管理员','员工请假','employee_leave','员工请假','/employee_leave/table','','_blank','1','1','1','1','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave',null,'0','{"examine":true,"figure":true}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('14','管理员','员工请假','employee_leave','员工请假详情','/employee_leave/view','','_blank','1','1','1','1','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('15','管理员','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','1','1','1','1','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('16','管理员','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','1','1','1','1','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('17','管理员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('19','管理员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('20','管理员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('21','游客','员工用户','employee_user','员工用户','/employee_user/table','','_blank','0','0','0','0','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('22','游客','员工用户','employee_user','员工用户详情','/employee_user/view','','_blank','0','0','0','0','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('23','游客','部门管理','department_management','部门管理','/department_management/table','','_blank','0','0','0','0','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('24','游客','部门管理','department_management','部门管理详情','/department_management/view','','_blank','0','0','0','0','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('25','游客','员工考勤','employee_attendance','员工考勤','/employee_attendance/table','','_blank','0','0','0','0','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks',null,'0','{"figure":false}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('26','游客','员工考勤','employee_attendance','员工考勤详情','/employee_attendance/view','','_blank','0','0','0','0','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('27','游客','员工加班','employee_overtime','员工加班','/employee_overtime/table','','_blank','0','0','0','0','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('28','游客','员工加班','employee_overtime','员工加班详情','/employee_overtime/view','','_blank','0','0','0','0','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('29','游客','员工工资','employee_salary','员工工资','/employee_salary/table','','_blank','0','0','0','0','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('30','游客','员工工资','employee_salary','员工工资详情','/employee_salary/view','','_blank','0','0','0','0','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('31','游客','疫苗接种','vaccination','疫苗接种','/vaccination/table','','_blank','0','0','0','0','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('32','游客','疫苗接种','vaccination','疫苗接种详情','/vaccination/view','','_blank','0','0','0','0','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('33','游客','员工请假','employee_leave','员工请假','/employee_leave/table','','_blank','0','0','0','0','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave',null,'0','{"examine":false,"figure":false}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('34','游客','员工请假','employee_leave','员工请假详情','/employee_leave/view','','_blank','0','0','0','0','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('35','游客','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','0','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('36','游客','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','0','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('37','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('38','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('39','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('40','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('41','员工用户','员工用户','employee_user','员工用户','/employee_user/table','','_blank','0','0','0','0','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('42','员工用户','员工用户','employee_user','员工用户详情','/employee_user/view','','_blank','0','0','0','0','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position','employee_job_number,employee_name,department,position',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('43','员工用户','部门管理','department_management','部门管理','/department_management/table','','_blank','0','0','0','0','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('44','员工用户','部门管理','department_management','部门管理详情','/department_management/view','','_blank','0','0','0','0','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation','department_number,department,person_in_charge,number_of_departments,date_of_incorporation',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('45','员工用户','员工考勤','employee_attendance','员工考勤','/employee_attendance/table','','_blank','0','0','0','1','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks',null,'0','{"figure":true}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('46','员工用户','员工考勤','employee_attendance','员工考勤详情','/employee_attendance/view','','_blank','0','0','0','1','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks','staff,attendance_month,days_due,actual_arrival_days,absence_days,attendance,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('47','员工用户','员工加班','employee_overtime','员工加班','/employee_overtime/table','','_blank','0','0','0','1','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('48','员工用户','员工加班','employee_overtime','员工加班详情','/employee_overtime/view','','_blank','0','0','0','1','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time','staff,overtime_date,overtime_hours,closing_time',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('49','员工用户','员工工资','employee_salary','员工工资','/employee_salary/table','','_blank','0','0','0','1','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('50','员工用户','员工工资','employee_salary','员工工资详情','/employee_salary/view','','_blank','0','0','0','1','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks','staff,salary_month,base_pay,overtime_pay,commission,attendance_deduction,five_insurances_and_one_fund,taxation,net_salary,remarks',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('51','员工用户','疫苗接种','vaccination','疫苗接种','/vaccination/table','','_blank','1','1','0','1','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('52','员工用户','疫苗接种','vaccination','疫苗接种详情','/vaccination/view','','_blank','1','1','0','1','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate','employee_job_number,employee_name,department,vaccination_date,number_of_inoculation_needles,vaccination_certificate',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('53','员工用户','员工请假','employee_leave','员工请假','/employee_leave/table','','_blank','1','1','0','1','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave',null,'0','{"examine":false,"figure":false}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('54','员工用户','员工请假','employee_leave','员工请假详情','/employee_leave/view','','_blank','1','1','0','1','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave','employee_job_number,employee_name,department,leave_type,leave_days,start_time,end_time,reason_for_leave',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('55','员工用户','通知公告','notice_announcement','通知公告','/notice_announcement/table','','_blank','0','0','0','1','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('56','员工用户','通知公告','notice_announcement','通知公告详情','/notice_announcement/view','','_blank','0','0','0','1','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content','title,relevant_attachments,release_date,publisher,content',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('57','员工用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('58','员工用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('59','员工用户','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `auth` values ('60','员工用户','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `user_group` values ('1','100','管理员',null,'','','0',null,"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `user_group` values ('2','100','游客',null,'','','0','0',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
insert into `user_group` values ('3','100','员工用户',null,'employee_user','employee_user_id','0','0',"2022-04-07 01:25:46.000 ","2022-04-07 01:25:46.000 ");
