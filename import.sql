-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-13 09:28:37
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shiraboot`
--

-- --------------------------------------------------------

--
-- 表的结构 `srk_article`
--

CREATE TABLE `srk_article` (
  `id` int(11) NOT NULL COMMENT 'id',
  `title` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '文章名',
  `content` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT '内容',
  `author` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '作者',
  `time` int(11) NOT NULL COMMENT '时间',
  `type` int(11) DEFAULT '1' COMMENT '0隐藏1普通2顶置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_article`
--

INSERT INTO `srk_article` (`id`, `title`, `content`, `author`, `time`, `type`) VALUES
(1, '测试文章2222', '<p>3333333333333333</p>', 'shirakun', 1481507346, 2),
(2, '测试文章2', '<p>这是第二个测试文章</p>', 'shirakun', 1481508908, 2),
(3, '这是一个隐藏文章', '<p>这是一个隐藏文章</p>', 'shirakun', 1481508944, 0),
(4, '这是一个普通文字', '<p>啊啊啊啊啊啊啊啊啊啊</p>', 'shirakun', 1481508963, 1);

-- --------------------------------------------------------

--
-- 表的结构 `srk_cdkey`
--

CREATE TABLE `srk_cdkey` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `value` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '卡密',
  `plan` int(11) NOT NULL COMMENT '对应套餐号',
  `expiration` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态',
  `expiry_date` int(11) DEFAULT NULL COMMENT '有效期',
  `uid` int(11) DEFAULT NULL COMMENT '使用者id',
  `note` varchar(64) COLLATE utf8mb4_bin DEFAULT '没有备注' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_cdkey`
--

INSERT INTO `srk_cdkey` (`id`, `value`, `plan`, `expiration`, `status`, `expiry_date`, `uid`, `note`) VALUES
(40, 'fdb8ee71a77d5901b0f7eb032b483497', 2, 259200, 0, NULL, NULL, '没有备注'),
(41, '0e4dd51180af244c121fd0f156ba7b2b', 2, 259200, 2, NULL, NULL, '没有备注'),
(42, '8de06f322a3d4814528bf87ab42c960b', 2, 259200, 1, NULL, NULL, '没有备注'),
(43, '04cf3167058817f962a3095d2ce61d44', 2, 259200, 0, NULL, NULL, '没有备注');

-- --------------------------------------------------------

--
-- 表的结构 `srk_config`
--

CREATE TABLE `srk_config` (
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `value` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '值',
  `note` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_config`
--

INSERT INTO `srk_config` (`name`, `value`, `note`) VALUES
('reflect', '["ntp","dns","ssdp","mssql","chargen","snmp","sentinel","netbios","ts3","db2","portmap"]', '反射类型的模式'),
('usually', '["udp","vse","telnet","home","tcp","tcp-se","tcp-ack","tcp-rst","tcp-psh","tcp-fin","tcp-xmas","wizard","dominate","zap","ssyn","essyn","issyn","xsyn","zsyn","csyn"]', '通常类型的模式');

-- --------------------------------------------------------

--
-- 表的结构 `srk_history`
--

CREATE TABLE `srk_history` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `ip` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '目标ip',
  `mode` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '攻击模式',
  `time` int(11) NOT NULL COMMENT '攻击时间',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `uid` int(11) NOT NULL COMMENT '发起攻击的会员id',
  `stop` int(11) NOT NULL COMMENT '是否人工停止',
  `server_id` int(11) DEFAULT NULL COMMENT '执行任务的节点id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_history`
--

INSERT INTO `srk_history` (`id`, `ip`, `mode`, `time`, `start_time`, `uid`, `stop`, `server_id`) VALUES
(1, '8.8.8.8', 'ntp', 300, 1481251726, 2, 0, 1),
(2, '8.8.4.4', 'ssdp', 600, 1481251526, 2, 1, 1),
(4, '4.4.4.4', 'dns', 36000, 1481254203, 2, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `srk_plans`
--

CREATE TABLE `srk_plans` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `name` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `concern` varchar(300) COLLATE utf8mb4_bin DEFAULT '此套餐暂无简介' COMMENT '简介',
  `price` int(11) NOT NULL COMMENT '价格',
  `cycle` int(11) NOT NULL COMMENT '付费周期(秒)',
  `maxtime` int(11) NOT NULL COMMENT '最大时间',
  `maxnum` int(11) NOT NULL COMMENT '每日次数',
  `maxboot` int(11) NOT NULL DEFAULT '1' COMMENT '最大并发',
  `status` int(11) NOT NULL COMMENT '状态',
  `vip` int(11) NOT NULL COMMENT '是否为vip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_plans`
--

INSERT INTO `srk_plans` (`id`, `name`, `concern`, `price`, `cycle`, `maxtime`, `maxnum`, `maxboot`, `status`, `vip`) VALUES
(1, 'admin2', '这是管理员专属套餐普通会员禁止购买', 999, 2592000, 3600, 100, 1, 0, 1),
(2, 'smaill', '这是一个小型套餐', 30, 2592000, 120, 50, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `srk_server`
--

CREATE TABLE `srk_server` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_server`
--

INSERT INTO `srk_server` (`id`, `name`, `type`, `vip`, `host`, `port`, `username`, `passwd`, `tool_dir`, `mode`, `maximum`, `note`) VALUES
(2, 'test服务器api', 2, 0, 'http://shiraboot.lan/test.php', 80, 'root', '8f394c89369d2b7a7e40917293c1492e', '/root/ddos', '["dns","ntp","ssdp"]', 3, '测试用节点api'),
(3, 'shirakun2', 1, 1, '8.8.4.4', 22, 'shirakun', '123456', '/root/ddos', '["ntp","dns"]', 3, '332211');

-- --------------------------------------------------------

--
-- 表的结构 `srk_users`
--

CREATE TABLE `srk_users` (
  `id` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(16) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `passwd` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `email` varchar(320) COLLATE utf8mb4_bin NOT NULL COMMENT '邮箱',
  `register_time` int(11) NOT NULL COMMENT '注册时间',
  `status` int(11) NOT NULL COMMENT '用户状态',
  `type` int(11) NOT NULL COMMENT '用户类型',
  `plan` int(11) NOT NULL COMMENT '所属套餐',
  `plan_name` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '未购买' COMMENT '套餐名称',
  `maxtime` int(11) NOT NULL DEFAULT '0' COMMENT '最大攻击时间',
  `maxnum` int(11) NOT NULL COMMENT '最大次数',
  `maxboot` int(11) NOT NULL DEFAULT '0' COMMENT '最大并发',
  `remainder` int(11) NOT NULL COMMENT '剩余次数',
  `expiration` int(11) NOT NULL COMMENT '到期时间',
  `vip` int(11) NOT NULL COMMENT '是否为vip用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `srk_users`
--

INSERT INTO `srk_users` (`id`, `username`, `passwd`, `email`, `register_time`, `status`, `type`, `plan`, `plan_name`, `maxtime`, `maxnum`, `maxboot`, `remainder`, `expiration`, `vip`) VALUES
(2, 'shirakun', 'd3590861347be1691af0dc1883fbd758', 'nico@ni-co.moe', 1481185914, 2, 2, 2, 'smaill', 120, 50, 1, 50, 1484380781, 0),
(3, 'shirakun2', 'd3590861347be1691af0dc1883fbd758', 'nico@ni-co.moe', 1481186770, 2, 1, 0, '未购买', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `srk_verification_code`
--

CREATE TABLE `srk_verification_code` (
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

CREATE TABLE `srk_white_list` (
  `id` int(11) NOT NULL COMMENT 'id号',
  `ip` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'ip',
  `note` varchar(64) COLLATE utf8mb4_bin DEFAULT '没有备注' COMMENT '备注',
  `time` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

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
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `srk_article`
--
ALTER TABLE `srk_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `srk_cdkey`
--
ALTER TABLE `srk_cdkey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号', AUTO_INCREMENT=44;
--
-- 使用表AUTO_INCREMENT `srk_history`
--
ALTER TABLE `srk_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `srk_plans`
--
ALTER TABLE `srk_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `srk_server`
--
ALTER TABLE `srk_server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `srk_users`
--
ALTER TABLE `srk_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `srk_verification_code`
--
ALTER TABLE `srk_verification_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号';
--
-- 使用表AUTO_INCREMENT `srk_white_list`
--
ALTER TABLE `srk_white_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id号', AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
