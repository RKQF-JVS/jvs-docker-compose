create database `jvs-message-push` default character set utf8mb4 collate utf8mb4_general_ci;
use jvs-message-push;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inside_notice
-- ----------------------------
DROP TABLE IF EXISTS `inside_notice`;
CREATE TABLE `inside_notice` (
  `id` varchar(50) NOT NULL COMMENT '站内消息id',
  `user_id` varchar(50) DEFAULT NULL COMMENT '接收用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `msg_content` longtext COMMENT '站内消息内容',
  `client_code` varchar(255) DEFAULT NULL COMMENT '消息来源唯一标识',
  `read_is` tinyint(1) DEFAULT NULL COMMENT '是否已读 0未读 1已读',
  `batch_number` varchar(50) DEFAULT NULL COMMENT '消息批次号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by_id` varchar(50) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `tenant_id` varchar(50) DEFAULT NULL COMMENT '租户',
  `large_categories` enum('notice','project') DEFAULT 'notice' COMMENT '消息大类',
  `sub_class` varchar(255) DEFAULT NULL COMMENT '消息子类',
  `call_back_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `notice_avatar` varchar(255) DEFAULT NULL COMMENT '站内信头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='站内消息统一管理';

-- ----------------------------
-- Table structure for message_config
-- ----------------------------
DROP TABLE IF EXISTS `message_config`;
CREATE TABLE `message_config` (
  `id` varchar(50) NOT NULL,
  `client_code` varchar(50) DEFAULT NULL COMMENT '客户端唯一标识',
  `client_name` varchar(50) DEFAULT NULL COMMENT '客户端名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by_id` varchar(50) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UQ_CLIENT_CODE` (`client_code`) USING BTREE COMMENT '客户端唯一标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息配置--客户端';

-- ----------------------------
-- Table structure for message_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `message_config_detail`;
CREATE TABLE `message_config_detail` (
  `id` varchar(50) NOT NULL,
  `config_id` varchar(50) NOT NULL COMMENT '配置id',
  `client_code` varchar(50) NOT NULL COMMENT '终端唯一标识',
  `config_value` text COMMENT '配置详情',
  `platform` enum('EMAIL','WECHAT_WORK_AGENT','WECHAT_WORK_ROBOT','WECHAT_OFFICIAL_ACCOUNT','DING_TALK_CORP','DING_TALK_ROBOT','ALI_SMS','INSIDE_NOTIFICATION') DEFAULT 'EMAIL' COMMENT '平台类型',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by_id` varchar(50) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UQ_CLIENT_CODE` (`client_code`,`platform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置详情';

-- ----------------------------
-- Table structure for message_push_his
-- ----------------------------
DROP TABLE IF EXISTS `message_push_his`;
CREATE TABLE `message_push_his` (
  `id` varchar(50) NOT NULL,
  `batch_number` varchar(50) DEFAULT NULL COMMENT '消息发送批次号',
  `platform` enum('EMAIL','WECHAT_WORK_AGENT','WECHAT_WORK_ROBOT','WECHAT_OFFICIAL_ACCOUNT','DING_TALK_CORP','DING_TALK_ROBOT','ALI_SMS','INSIDE_NOTIFICATION') DEFAULT 'EMAIL' COMMENT '平台',
  `message_type` enum('EMAIL','WECHAT_WORK_AGENT_TEXT','WECHAT_WORK_AGENT_IMAGE','WECHAT_WORK_AGENT_VIDEO','WECHAT_WORK_AGENT_FILE','WECHAT_WORK_AGENT_TEXTCARD','WECHAT_WORK_AGENT_NEWS','WECHAT_WORK_AGENT_MARKDOWN','WECHAT_WORK_ROBOT_TEXT','WECHAT_WORK_ROBOT_IMAGE','WECHAT_WORK_ROBOT_NEWS','WECHAT_WORK_ROBOT_MARKDOWN','WECHAT_OFFICIAL_ACCOUNT_TEXT','WECHAT_OFFICIAL_ACCOUNT_NEWS','WECHAT_OFFICIAL_ACCOUNT_TEMPLATE','DING_TALK_COPR_TEXT','DING_TALK_COPR_MARKDOWN','DING_TALK_COPR_LINK','DING_TALK_COPR_ACTION_CARD_SINGLE','DING_TALK_COPR_ACTION_CARD_MULTI','DING_TALK_COPR_OA','DING_TALK_ROBOT_TEXT','DING_TALK_ROBOT_MARKDOWN','DING_TALK_ROBOT_LINK','DING_TALK_ROBOT_ACTION_CARD_SINGLE','DING_TALK_ROBOT_ACTION_CARD_MULTI','DING_TALK_ROBOT_FEED_CARD','ALI_SMS','INSIDE_NOTIFICATION') DEFAULT 'EMAIL' COMMENT '消息类型',
  `message_content` longtext COMMENT '消息内容',
  `push_status` enum('WAIT','SUCCESS','FAILED') DEFAULT 'WAIT' COMMENT '状态',
  `error_msg` text COMMENT '异常信息',
  `user_id` varchar(50) DEFAULT NULL COMMENT 'jvs 用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT 'jvs 用户名称',
  `client_code` varchar(255) DEFAULT NULL COMMENT '客户端唯一标识',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by_id` varchar(50) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `tenant_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息发送历史';

-- ----------------------------
-- Table structure for sql_performance
-- ----------------------------
DROP TABLE IF EXISTS `sql_performance`;
CREATE TABLE `sql_performance` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sql` varchar(255) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `consuming_time` int(11) DEFAULT NULL,
  `access_type` varchar(50) DEFAULT NULL,
  `slow_sql` varchar(255) DEFAULT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='保存执行计划表';

SET FOREIGN_KEY_CHECKS = 1;
