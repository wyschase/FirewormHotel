-- 根据输入的用户名查询密码
SELECT password
FROM user
WHERE account = '519277638';

-- 根据用户名查询订单号、预计入住时间、入住人员信息
SELECT
  `order`.o_id,
  e_ch_in_time,
  guest.id_card_num,
  g_name,
  g_sex,
  g_tel
FROM `order`, order_guest, guest
WHERE u_id = (SELECT u_id
              FROM user
              WHERE account = 'wangyuansheng')
      AND `order`.o_id = order_guest.o_id
      AND guest.id_card_num = order_guest.id_card_num;

-- 根据入住人员姓名查询订单号，房间号、房间类型、预计入住时间
SELECT
  `order`.o_id,
  g_name,
  guest.id_card_num,
  `order`.rm_id,
  rm_type,
  e_ch_in_time
FROM room, `order`, order_guest, guest
WHERE g_name = '王源盛'
      AND `order`.o_id = order_guest.o_id
      AND guest.id_card_num = order_guest.id_card_num
      AND room.rm_id = `order`.rm_id;

-- 根据入住人员姓名查询订单号，房间号、房间类型、预计入住时间
SELECT
  `order`.o_id,
  g_name,
  guest.id_card_num,
  `order`.rm_id,
  rm_type,
  e_ch_in_time
FROM `order`
  JOIN order_guest ON `order`.o_id = order_guest.o_id
  JOIN guest ON order_guest.id_card_num = guest.id_card_num
  JOIN room r on `order`.rm_id = r.rm_id
WHERE g_name = '王小源';

-- 插入入住人员信息
INSERT IGNORE INTO guest (id_card_num, g_name, g_sex, g_tel) VALUES
  ('442222199801010001', '王源盛', '男', '13282891389'),
  ('442222199801010002', '王小源', '男', '13282893389'),
  ('442222199801010003', '王小盛', '男', '13282891389'),
  ('442222199801010004', '王大源', '男', '13282893389');

-- 修改入住人员联系电话
UPDATE guest
SET g_tel = '13766655578'
WHERE id_card_num = '442222199801010001';

-- 生成预订订单 user-order-guest-room-hotel
INSERT INTO `order` (`o_id`, `u_id`, `h_id`, `rm_id`, `o_create_time`, `payment`, `e_ch_in_time`)
VALUES
  (5, 3, 1, 101, 1529422977, 200, 1529432977),
  (6, 4, 1, 103, 1529422977, 200, 1529432977);
INSERT INTO `guest` (`id_card_num`, `rm_id`, `g_name`, `g_sex`, `g_tel`) VALUES
  ('442222199801010010', 101, '小王', '男', '13282891389'),
  ('442222199801010011', 103, '王小二', '男', '13282893389');
INSERT INTO `order_guest` (`o_id`, `id_card_num`) values
  (5, '442222199801010010'),
  (6, '442222199801010011');
UPDATE room
SET rm_state = '正被使用'
WHERE h_id = 1 AND rm_id = 101;
UPDATE room
SET rm_state = '正被使用'
WHERE h_id = 1 AND rm_id = 103;

