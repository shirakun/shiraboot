-- phpMyAdmin SQL Dump
-- version 4.4.15.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-02-05 14:05:52
-- 服务器版本： 5.5.54-log
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srk_boot`
--

-- --------------------------------------------------------

--
-- 表的结构 `srk_api`
--

CREATE TABLE IF NOT EXISTS `srk_api` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `uid` int(11) NOT NULL COMMENT '用户的id号',
  `api_key` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '密钥',
  `expiration` int(11) NOT NULL COMMENT '到期时间',
  `status` int(11) NOT NULL COMMENT '0停用1正常2禁止'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_api`
--

INSERT INTO `srk_api` (`id`, `uid`, `api_key`, `expiration`, `status`) VALUES
(2, 2, 'c35c45188fe3c610536b4792f74b79d9', 1484545145, 1),
(3, 4, '0fc76c4e85e17564a2ef15e399bc2f1e', 1488282500, 1),
(4, 2, 'a82d318f86542dc444e5202e254d6cf6', 1488282688, 1),
(5, 15, 'fb20ba1538834bd01392104bbf1a23fb', 1488290218, 1),
(6, 15, '5a5d173f69d3f7bb61abdca00f338382', 1488803858, 1);

-- --------------------------------------------------------

--
-- 表的结构 `srk_article`
--

CREATE TABLE IF NOT EXISTS `srk_article` (
  `id` int(11) NOT NULL COMMENT 'id',
  `title` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '文章名',
  `content` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT '内容',
  `author` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '作者',
  `time` int(11) NOT NULL COMMENT '时间',
  `type` int(11) DEFAULT '1' COMMENT '0隐藏1普通2顶置'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_article`
--

INSERT INTO `srk_article` (`id`, `title`, `content`, `author`, `time`, `type`) VALUES
(2, '购买说明', '<p>现在为公测期间，开放购买的套餐直接点击购买即可购买成功。</p><p>本站为测试本程序为目的并不会真正用于商业化，公测结束后不开放购买,本程序将发布到github。</p>', 'shirakun', 1485690291, 1),
(5, '公测开始', '<p>本站与2017-1-29日开始实行公测，提供一个免费套餐，本程序现存在很多bug，如果您发现了一个bug请及时联系我。</p><p>api权限现在无法正常使用，已开始的攻击无法停止，请大家注意！</p>', 'shirakun', 1485680130, 1),
(6, '用户须知', '<p>公测随时可能结束，结束时将删除所有的用户数据(但我们可能保留攻击记录),公测时随时可能删除一些数据，请不要滥用，滥用者将永远禁止使用。</p>', 'shirakun', 1485680020, 1),
(7, '目前支持的攻击模式', '<p>目前仅有4层的ntp可以使用,七层攻击暂未开发.</p>', 'shirakun', 1485690159, 2),
(8, '增加vip节点', '<p>2017-02-04,添加vip节点,对vip分类进行测试,目前仍然免费,下一次测试预计为[7层攻击测试+停止攻击]或[支付api对接测试],如果为支付api测试,所有套餐将定价在0.01~0.05之间.</p>', 'shirakun', 1486254146, 1);

-- --------------------------------------------------------

--
-- 表的结构 `srk_cdkey`
--

CREATE TABLE IF NOT EXISTS `srk_cdkey` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `value` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '卡密',
  `plan` int(11) DEFAULT NULL COMMENT '对应套餐号',
  `expiration` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1普通套餐2临时补充包3套餐补充包4api权限5并发补充包',
  `status` int(11) NOT NULL COMMENT '状态',
  `expiry_date` int(11) DEFAULT NULL COMMENT '有效期',
  `num` int(11) DEFAULT NULL COMMENT '临时或套餐补充包的补充数量',
  `uid` int(11) DEFAULT NULL COMMENT '使用者id',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `note` varchar(64) COLLATE utf8mb4_bin DEFAULT '没有备注' COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_cdkey`
--

INSERT INTO `srk_cdkey` (`id`, `value`, `plan`, `expiration`, `type`, `status`, `expiry_date`, `num`, `uid`, `use_time`, `note`) VALUES
(40, 'fdb8ee71a77d5901b0f7eb032b483497', 2, 259200, 1, 0, NULL, NULL, NULL, NULL, '没有备注'),
(41, '0e4dd51180af244c121fd0f156ba7b2b', 2, 259200, 1, 2, NULL, NULL, NULL, NULL, '没有备注'),
(42, '8de06f322a3d4814528bf87ab42c960b', 2, 259200, 1, 1, NULL, NULL, NULL, NULL, '没有备注'),
(43, '04cf3167058817f962a3095d2ce61d44', 2, 259200, 1, 0, NULL, NULL, NULL, NULL, '没有备注');

-- --------------------------------------------------------

--
-- 表的结构 `srk_config`
--

CREATE TABLE IF NOT EXISTS `srk_config` (
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `value` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '值',
  `note` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_config`
--

INSERT INTO `srk_config` (`name`, `value`, `note`) VALUES
('reflect', '["ntp","dns","ssdp","mssql","chargen","snmp","sentinel","netbios","ts3","db2","portmap"]', '反射类型的模式'),
('usually', '["udp","vse","telnet","home","tcp","tcp-se","tcp-ack","tcp-rst","tcp-psh","tcp-fin","tcp-xmas","wizard","dominate","zap","ssyn","essyn","issyn","xsyn","zsyn","csyn"]', '通常类型的模式'),
('application', '["xmlrpc"]', '通常类型的模式'),
('cron_user', '1486253813', '上一次更新用户数据执行的时间'),
('api_buy', '0', '是否可以购买api');

-- --------------------------------------------------------

--
-- 表的结构 `srk_history`
--

CREATE TABLE IF NOT EXISTS `srk_history` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `ip` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '目标ip',
  `mode` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '攻击模式',
  `time` int(11) NOT NULL COMMENT '攻击时间',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `uid` int(11) NOT NULL COMMENT '发起攻击的会员id',
  `stop` int(11) NOT NULL COMMENT '是否人工停止',
  `server_id` int(11) DEFAULT NULL COMMENT '执行任务的节点id'
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_history`
--

INSERT INTO `srk_history` (`id`, `ip`, `mode`, `time`, `start_time`, `uid`, `stop`, `server_id`) VALUES
(1, '8.8.8.8', 'ntp', 300, 1481251726, 2, 0, 1),
(2, '8.8.4.4', 'ssdp', 600, 1481251526, 2, 1, 1),
(4, '4.4.4.4', 'dns', 36000, 1481254203, 2, 0, 1),
(5, '59.56.79.80', 'ntp', 60, 1485676589, 2, 0, 4),
(6, '59.56.79.80', 'ntp', 60, 1485676769, 2, 0, 4),
(7, '59.56.79.80', 'ntp', 61, 1485677006, 2, 0, 4),
(8, '59.56.79.80', 'ntp', 61, 1485677171, 2, 0, 4),
(9, '59.56.79.80', 'ntp', 12, 1485677283, 2, 0, 4),
(10, '59.56.79.84', 'ntp', 60, 1485677295, 2, 0, 4),
(11, '59.56.79.80', 'ntp', 60, 1485677306, 2, 0, 4),
(12, '59.56.79.80', 'ntp', 10, 1485677616, 2, 0, 4),
(13, '59.56.79.80', 'ntp', 60, 1485677650, 2, 0, 4),
(14, '59.56.79.80', 'ntp', 60, 1485687386, 2, 0, 4),
(15, '59.56.79.80', 'ntp', 60, 1485695447, 10, 0, 4),
(16, '58.56.76.122', 'ntp', 60, 1485697944, 9, 0, 4),
(17, 'http://img.ikmoe.com/', 'ntp', 60, 1485698129, 12, 0, 4),
(18, '123.129.242.70', 'ntp', 60, 1485698133, 9, 0, 4),
(19, 'http://img.ikmoe.com/', 'ntp', 60, 1485698225, 12, 0, 4),
(20, '59.111.98.77', 'ntp', 60, 1485698373, 15, 0, 4),
(21, '106.32.69.191', 'ntp', 10, 1485698401, 12, 0, 4),
(22, '106.32.69.191', 'ntp', 20, 1485698481, 12, 0, 4),
(23, '59.56.79.80', 'ntp', 120, 1485698595, 2, 0, 4),
(24, 'blog.ni-co.moe', 'ntp', 60, 1485744734, 2, 0, 4),
(25, '59.56.79.80', 'ntp', 10, 1485744815, 2, 0, 4),
(26, '121.43.180.162', 'ntp', 60, 1486106578, 15, 0, 4),
(27, '120.77.183.201', 'ntp', 60, 1486106719, 15, 0, 4),
(28, '101.200.37.83', 'ntp', 60, 1486127260, 15, 0, 4),
(29, '45.32.14.128', 'ntp', 60, 1486177108, 15, 0, 4),
(30, '120.77.206.39', 'ntp', 60, 1486180922, 15, 0, 4),
(31, '59.56.79.80', 'ntp', 60, 1486193451, 10, 0, 4),
(32, '59.56.79.80', 'ntp', 60, 1486193528, 10, 0, 5),
(33, '113.17.184.186', 'ntp', 60, 1486211772, 15, 0, 4),
(34, '59.56.79.80', 'ntp', 60, 1486255320, 2, 0, 4),
(35, '59.56.79.80', 'ntp', 60, 1486255615, 2, 0, 4),
(36, '59.56.79.80', 'ntp', 60, 1486259484, 2, 0, 4),
(37, '59.56.79.80', 'ntp', 60, 1486259622, 2, 1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `srk_order`
--

CREATE TABLE IF NOT EXISTS `srk_order` (
  `id` int(11) NOT NULL COMMENT '订单编号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `pay_total` varchar(32) NOT NULL COMMENT '支付金额',
  `plan_id` varchar(32) DEFAULT NULL COMMENT '套餐id',
  `pay_type` varchar(32) NOT NULL COMMENT '支付类型',
  `pay_sn` varchar(32) DEFAULT NULL COMMENT '支付编号',
  `pay_status` int(11) NOT NULL COMMENT '支付状态0未支付1已支付',
  `time` int(11) NOT NULL COMMENT '订单创建时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '订单支付时间'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `srk_order`
--

INSERT INTO `srk_order` (`id`, `uid`, `pay_total`, `plan_id`, `pay_type`, `pay_sn`, `pay_status`, `time`, `pay_time`) VALUES
(4, 10, '0.02', '3', 'alipay', 'alip130451486271728', 0, 1486271728, NULL),
(5, 10, '0.02', '3', 'alipay', 'alip130451486271757', 1, 1486271757, 1486271876),

-- --------------------------------------------------------

--
-- 表的结构 `srk_plans`
--

CREATE TABLE IF NOT EXISTS `srk_plans` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `name` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `concern` varchar(300) COLLATE utf8mb4_bin DEFAULT '此套餐暂无简介' COMMENT '简介',
  `price` float NOT NULL COMMENT '价格',
  `type` int(11) DEFAULT '1' COMMENT '1普通2临时3套餐4api5并发',
  `cycle` int(11) DEFAULT NULL COMMENT '付费周期(秒)',
  `maxtime` int(11) DEFAULT NULL COMMENT '最大时间',
  `maxnum` int(11) NOT NULL COMMENT '每日次数',
  `maxboot` int(11) NOT NULL DEFAULT '1' COMMENT '最大并发',
  `status` int(11) NOT NULL COMMENT '状态',
  `vip` int(11) NOT NULL COMMENT '是否为vip'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_plans`
--

INSERT INTO `srk_plans` (`id`, `name`, `concern`, `price`, `type`, `cycle`, `maxtime`, `maxnum`, `maxboot`, `status`, `vip`) VALUES
(1, 'admin2', '这是管理员专属套餐普通会员禁止购买', 999, 1, 2592000, 3600, 100, 1, 0, 1),
(2, 'smaill', '这是一个小型套餐', 0.1, 1, 86400, 60, 20, 1, 1, 0),
(3, 'vip测试套餐', '此套餐暂无简介', 0.2, 1, 86400, 60, 15, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `srk_server`
--

CREATE TABLE IF NOT EXISTS `srk_server` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '节点名称',
  `type` int(11) DEFAULT '1' COMMENT '节点类型',
  `vip` int(11) DEFAULT '0' COMMENT '是否为vip节点',
  `host` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '节点ip或api路径',
  `port` int(11) DEFAULT NULL,
  `username` varchar(32) COLLATE utf8mb4_bin DEFAULT 'root' COMMENT '节点登录用户名',
  `passwd` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '节点或api密码',
  `tool_dir` varchar(320) COLLATE utf8mb4_bin DEFAULT '/root/ddos' COMMENT 'ddos工具的路径(最后一位不带/)',
  `mode` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '节点接受的类型(json)',
  `maximum` int(11) DEFAULT '10' COMMENT '最大并发',
  `note` varchar(320) COLLATE utf8mb4_bin DEFAULT '没有备注' COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_server`
--

INSERT INTO `srk_server` (`id`, `name`, `type`, `vip`, `host`, `port`, `username`, `passwd`, `tool_dir`, `mode`, `maximum`, `note`) VALUES
(4, '普通输出-1', 1, 0, '127.0.0.1', 22, 'root', '123456', '/root', '["ntp"]', 3, '俄罗斯'),
(5, 'vip-1', 1, 1, '127.0.0.1', 22, 'root', '123456', '/root', '["ntp"]', 2, '大水管限流量');

-- --------------------------------------------------------

--
-- 表的结构 `srk_users`
--

CREATE TABLE IF NOT EXISTS `srk_users` (
  `id` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `passwd` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `email` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '邮箱',
  `register_time` int(11) NOT NULL COMMENT '注册时间',
  `status` int(11) NOT NULL COMMENT '用户状态',
  `type` int(11) NOT NULL COMMENT '用户类型',
  `plan` int(11) NOT NULL COMMENT '所属套餐',
  `plan_name` varchar(32) COLLATE utf8mb4_bin DEFAULT '未购买' COMMENT '套餐名称',
  `maxtime` int(11) NOT NULL DEFAULT '0' COMMENT '最大攻击时间',
  `maxnum` int(11) NOT NULL COMMENT '最大次数',
  `maxboot` int(11) NOT NULL DEFAULT '0' COMMENT '最大并发',
  `remainder` int(11) NOT NULL COMMENT '剩余次数',
  `expiration` int(11) NOT NULL COMMENT '到期时间',
  `vip` int(11) NOT NULL COMMENT '是否为vip用户'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_users`
--

INSERT INTO `srk_users` (`id`, `username`, `passwd`, `email`, `register_time`, `status`, `type`, `plan`, `plan_name`, `maxtime`, `maxnum`, `maxboot`, `remainder`, `expiration`, `vip`) VALUES
(2, 'shirakun', '3788a82efc8f82aaecf6b24ba7718dbe', 'test@test.com', 1481185914, 1, 2, 2, 'smaill', 120, 50, 1, 46, 1486972781, 0),
(10, 'shirakun2', '3788a82efc8f82aaecf6b24ba7718dbe', 'test2@test.com', 1485695314, 1, 1, 3, 'vip测试套餐', 60, 15, 1, 15, 1487057440, 1),

-- --------------------------------------------------------

--
-- 表的结构 `srk_verification_code`
--

CREATE TABLE IF NOT EXISTS `srk_verification_code` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `uid` int(11) NOT NULL COMMENT '对应用户的id',
  `value` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '验证码',
  `email` varchar(320) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户邮箱',
  `type` int(11) NOT NULL COMMENT '1激活2更换邮箱3修改密码',
  `expiration` int(11) NOT NULL COMMENT '到期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `srk_white_list`
--

CREATE TABLE IF NOT EXISTS `srk_white_list` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `ip` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ip',
  `note` varchar(64) COLLATE utf8mb4_bin DEFAULT '没有备注' COMMENT '备注',
  `time` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_white_list`
--

INSERT INTO `srk_white_list` (`id`, `ip`, `note`, `time`) VALUES
(1, '127.0.0.1', '', 1485742031);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `srk_api`
--
ALTER TABLE `srk_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_article`
--
ALTER TABLE `srk_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_cdkey`
--
ALTER TABLE `srk_cdkey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_history`
--
ALTER TABLE `srk_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_order`
--
ALTER TABLE `srk_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_plans`
--
ALTER TABLE `srk_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_server`
--
ALTER TABLE `srk_server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_users`
--
ALTER TABLE `srk_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_verification_code`
--
ALTER TABLE `srk_verification_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srk_white_list`
--
ALTER TABLE `srk_white_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `srk_api`
--
ALTER TABLE `srk_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `srk_article`
--
ALTER TABLE `srk_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `srk_cdkey`
--
ALTER TABLE `srk_cdkey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `srk_history`
--
ALTER TABLE `srk_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `srk_order`
--
ALTER TABLE `srk_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `srk_plans`
--
ALTER TABLE `srk_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `srk_server`
--
ALTER TABLE `srk_server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `srk_users`
--
ALTER TABLE `srk_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `srk_verification_code`
--
ALTER TABLE `srk_verification_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号';
--
-- AUTO_INCREMENT for table `srk_white_list`
--
ALTER TABLE `srk_white_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
