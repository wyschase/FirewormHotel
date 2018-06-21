-- 创建并切换到数据库
create database IF NOT EXISTS db_hotel;
use db_hotel;

-- 创建用户表
CREATE TABLE IF NOT EXISTS `user` (
  `u_id`     int(11)     NOT NULL AUTO_INCREMENT,
  `account`  varchar(20) NOT NULL UNIQUE,
  `password` varchar(15) NOT NULL,
  `u_tel`    varchar(15) NOT NULL,
  `nickname` varchar(10) NOT NULL,
  PRIMARY KEY (`u_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入用户数据
INSERT INTO `user` (`u_id`, `account`, `password`, `u_tel`, `nickname`) VALUES
  (1, 'wangyuansheng', '123321', '13789621145', '绿豆汤圆'),
  (2, 'liuyanqi', '6435487', '13711434665', '冻豆腐'),
  (3, '519277638', '648320', '13888889625', '巧克力'),
  (4, '7878wys', '0453215', '13711323325', 'whatever'),
  (5, 'chase300', '666777', '13766669625', '言言言三');

-- 创建服务表
CREATE TABLE IF NOT EXISTS `service` (
  `sv_id`   int(11)     NOT NULL AUTO_INCREMENT,
  `sv_name` varchar(20) NOT NULL UNIQUE,
  `sv_dept` varchar(20) NOT NULL,
  PRIMARY KEY (`sv_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入服务表
INSERT INTO `service` (`sv_id`, `sv_name`, `sv_dept`) VALUES
  (1, '叫醒服务', '后勤部'),
  (2, '衣服清洗', '清洁部'),
  (3, '送餐服务', '餐饮部'),
  (4, '洗车服务', '车辆管理部'),
  (5, '房间清理', '清洁部');

-- 创建酒店表
CREATE TABLE IF NOT EXISTS `hotel` (
  `h_id`      int(11)     NOT NULL AUTO_INCREMENT,
  `h_name`    varchar(20) NOT NULL UNIQUE,
  `address`   varchar(50) NOT NULL UNIQUE,
  `h_tel`     varchar(15) NOT NULL UNIQUE,
  `h_grade`   varchar(10) NOT NULL,
  `equipment` varchar(50) NOT NULL,
  PRIMARY KEY (`h_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入酒店表
INSERT INTO `hotel` (`h_id`, `h_name`, `address`, `h_tel`, `h_grade`, `equipment`) VALUES
  (1, '莹家三亚红塘湾建国度假酒店', '广州市大石镇河村村南大路275号', '020-89621145', '豪华型', '免费Wifi++停车场++高尔夫球场'),
  (2, '莹家广州盘福路越秀公园和颐至尚酒店', '广州市广园东路1933号－1935号', '020-11434665', '豪华型', '免费Wifi++停车场++游泳池'),
  (3, '莹家长白山酒店', '广州市海珠区珠电路8号', '020-88889625', '舒适型', '免费Wifi++停车场'),
  (4, '莹家广州黄埔东区时代城店', '广州市番禺区大学城10号', '020-11366233', '舒适型', '免费Wifi++停车场++免费早餐'),
  (5, '莹家广州番禺长隆北门店', '广州市番禺区长隆10号', '020-71164896', '经济型', '免费Wifi');

-- 创建房间价格表
CREATE TABLE IF NOT EXISTS `room_price_list` (
  `h_id`    int(11)     NOT NULL,
  `rm_type` varchar(20) NOT NULL,
  `price`   varchar(5)  NOT NULL,
  PRIMARY KEY (`h_id`, `rm_type`),
  foreign key (`h_id`) references `hotel` (`h_id`)
    ON DELETE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入房间价格表
INSERT INTO `room_price_list` (`h_id`, `rm_type`, `price`) VALUES
  (1, '单人房', '117'), (1, '双人房', '168'), (1, '大床房', '179'), (1, '豪华套房', '431'),
  (2, '单人房', '117'), (2, '双人房', '168'), (2, '大床房', '179'), (2, '豪华套房', '431'),
  (3, '单人房', '117'), (3, '双人房', '168'), (3, '大床房', '179'), (3, '豪华套房', '431'),
  (4, '单人房', '117'), (4, '双人房', '168'), (4, '大床房', '179'), (4, '豪华套房', '431'),
  (5, '单人房', '117'), (5, '双人房', '168'), (5, '大床房', '179'), (5, '豪华套房', '431');

-- 创建员工表
CREATE TABLE IF NOT EXISTS `staff` (
  `s_id`     int(11)         NOT NULL UNIQUE,
  `h_id`     int(11)         NOT NULL,
  `sv_id`    int(11),
  `s_name`   varchar(5)      NOT NULL,
  `s_sex`    enum ('男', '女') NOT NULL,
  `s_dept`   varchar(20)     NOT NULL,
  `s_tel`    varchar(15)     NOT NULL,
  `ofi_time` varchar(30)     NOT NULL,
  PRIMARY KEY (`s_id`),
  foreign key (`h_id`) references `hotel` (`h_id`)
    ON DELETE CASCADE,
  foreign key (`sv_id`) references `service` (`sv_id`)
    ON DELETE SET NULL

)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入员工表
INSERT INTO `staff` (`s_id`, `h_id`, `sv_id`, `s_name`, `s_sex`, `s_dept`, `s_tel`, `ofi_time`) VALUES
  (1, 2, 1, '王源盛', '男', '清洁部', '13766669625', '8:30-16:30'),
  (2, 2, 1, 'wys', '男', '清洁部', '13766669625', '16:30-24:30');

-- 创建房间表
CREATE TABLE IF NOT EXISTS `room` (
  `h_id`     int(11)                    NOT NULL,
  `rm_id`    int(11)                    NOT NULL UNIQUE,
  `s_id`     int(11),
  `rm_type`  varchar(20)                NOT NULL,
  `area`     varchar(5)                 NOT NULL,
  `rm_state` enum ('正被使用', '待清理', '空闲') NOT NULL,
  PRIMARY KEY (`h_id`, `rm_id`),
  foreign key (`h_id`) references `hotel` (`h_id`)
    ON DELETE CASCADE,
  foreign key (`s_id`) references `staff` (`s_id`)
    ON DELETE SET NULL

)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入房间价格表
INSERT INTO `room` (`h_id`, `rm_id`, `s_id`, `rm_type`, `area`, `rm_state`) VALUES
  (1, 101, 1, '双人房', '13㎡', '空闲'),
  (1, 102, 2, '单人房', '10㎡', '空闲'),
  (1, 103, 1, '大床房房', '12㎡', '空闲'),
  (1, 104, 2, '豪华套房', '20㎡', '空闲');

-- 创建评论表
CREATE TABLE IF NOT EXISTS `comment` (
  `cm_id`    int(11)      NOT NULL UNIQUE AUTO_INCREMENT,
  `h_id`     int(11)      NOT NULL,
  `cm_grade` int(1)       NOT NULL,
  `u_id`     int(11)      NOT NULL,
  `content`  varchar(150) NOT NULL,
  PRIMARY KEY (`cm_id`),
  foreign key (`h_id`) references `hotel` (`h_id`)
    ON DELETE CASCADE,
  foreign key (`u_id`) references `user` (`u_id`)
    ON DELETE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入评论表
INSERT INTO `comment` (`cm_id`, `h_id`, `cm_grade`, `u_id`, `content`) VALUES
  (1, 1, 5, 4, '舒适的一晚上，美滋滋~'),
  (2, 1, 5, 3, '酒店环境挺不错的'),
  (3, 1, 4, 2, '空调有点冷'),
  (4, 2, 2, 1, '住的不舒服呀！');

-- 创建入住人员表
CREATE TABLE IF NOT EXISTS `guest` (
  `id_card_num` char(18)        NOT NULL UNIQUE,
  `rm_id`       int(11),
  `g_name`      varchar(5)      NOT NULL,
  `g_sex`       enum ('男', '女') NOT NULL,
  `g_tel`       varchar(15)     NOT NULL,
  PRIMARY KEY (`id_card_num`),
  foreign key (`rm_id`) references `room` (`rm_id`)
    ON DELETE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入入住人员表
INSERT INTO `guest` (`id_card_num`, `rm_id`, `g_name`, `g_sex`, `g_tel`) VALUES
  ('442222199801010001', 101, '王源盛', '男', '13282891389'),
  ('442222199801010002', 102, '王小源', '男', '13282893389');

-- 创建订单表
CREATE TABLE IF NOT EXISTS `order` (
  `o_id`          int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `u_id`          int(11) NOT NULL,
  `h_id`          int(11) NOT NULL,
  `rm_id`         int(11) NOT NULL,
  `o_create_time` int(13) NOT NULL,
  `payment`       int(5)  NOT NULL,
  `e_ch_in_time`  int(13) NOT NULL,
  `ch_in_time`    int(13),
  `ch_out_time`   int(13),
  PRIMARY KEY (`o_id`),
  foreign key (`u_id`) references `user` (u_id),
  foreign key (`h_id`) references `hotel` (`h_id`),
  foreign key (`rm_id`) references `room` (`rm_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入订单表
INSERT INTO `order` (`o_id`, `u_id`, `h_id`, `rm_id`, `o_create_time`, `payment`, `e_ch_in_time`, `ch_in_time`, `ch_out_time`)
VALUES
  (1, 1, 1, 101, 1529422977, 200, 1529432977, 1529442977, 1529522977),
  (2, 2, 1, 103, 1529422977, 200, 1529432977, 1529442977, 1529522977);

-- 创建订单-服务联系表
CREATE TABLE IF NOT EXISTS `order_service` (
  `o_id`  int(11) NOT NULL,
  `sv_id` int(11) NOT NULL,
  PRIMARY KEY (`o_id`, `sv_id`),
  foreign key (`o_id`) references `order` (`o_id`),
  foreign key (`sv_id`) references `service` (`sv_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入订单-服务联系表
INSERT INTO `order_service` (`o_id`, `sv_id`) values
  (1, 1);

-- 创建订单-入住人员联系表
CREATE TABLE IF NOT EXISTS `order_guest` (
  `o_id`        int(11)  NOT NULL,
  `id_card_num` char(18) NOT NULL,
  PRIMARY KEY (`o_id`, `id_card_num`),
  foreign key (`o_id`) references `order` (`o_id`),
  foreign key (`id_card_num`) references `guest` (`id_card_num`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入订单-入住人员联系表
INSERT INTO `order_guest` (`o_id`, `id_card_num`) values
  (1, '442222199801010001'),
  (2,'442222199801010002');

-- 创建图片表
CREATE TABLE IF NOT EXISTS `img` (
  `img_id`  int(11)                           NOT NULL UNIQUE AUTO_INCREMENT,
  `type`    enum ('room', 'hotel', 'comment') NOT NULL,
  `type_id` int(11)                           NOT NULL,
  `img_url` varchar(50)                       NOT NULL,
  PRIMARY KEY (`img_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- 插入图片表
INSERT INTO `img` (`img_id`, `type`, `type_id`, `img_url`) values
  (1, 'room', 1, '../images/gz01.jpg');
