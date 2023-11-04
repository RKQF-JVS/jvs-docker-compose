create database `jvs-document` default character set utf8mb4 collate utf8mb4_general_ci;
use jvs-document;
/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.38-dev
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : 10.0.0.38:3306
 Source Schema         : jvs-document

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 05/07/2022 18:10:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dc_auth_config
-- ----------------------------
DROP TABLE IF EXISTS `dc_auth_config`;
CREATE TABLE `dc_auth_config`  (
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id，系统角色id，部门id，群组id，岗位id',
  `data_auth_type` enum('person','dept','job','role','user_group') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'person' COMMENT '数据权限类型',
  `dc_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文档id',
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档参与人与权限绑定关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_auth_config
-- ----------------------------

-- ----------------------------
-- Table structure for dc_identifying
-- ----------------------------
DROP TABLE IF EXISTS `dc_identifying`;
CREATE TABLE `dc_identifying`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifying_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识名称',
  `identifying_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识key',
  `identifying_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识类型',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `is_select` tinyint(1) NULL DEFAULT 0 COMMENT '是否可以选择 就是一些默认的权限 不用用户选择 系统直接默认的',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限标识' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_identifying
-- ----------------------------
INSERT INTO `dc_identifying` VALUES ('1', '文库删除', 'library_delete', '文库权限', '1', NULL, NULL, '2022-04-15 11:00:56', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('10', '文档分享', 'document_share', '文档权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('11', '文库转移项目', 'library_transfer', '文库权限', '1', NULL, NULL, '2022-04-18 16:08:34', '2022-04-18 16:19:14', NULL, 1);
INSERT INTO `dc_identifying` VALUES ('12', '文档删除', 'document_delete', '文档权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('2', '文库编辑', 'library_update', '文库权限', '1', NULL, NULL, '2022-04-15 11:01:18', '2022-04-18 16:56:36', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('3', '提醒设置', 'library_remind_settings', '文库权限', '1', NULL, NULL, '2022-04-15 11:01:18', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('4', '权限设置', 'library_auth_settings', '文库权限', '1', NULL, NULL, '2022-04-15 11:01:18', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('5', '文库下载', 'library_down', '文库权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('6', '新建文档', 'document_add', '文档权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('7', '文档下载', 'document_down', '文档权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('8', '文档编辑', 'document_update', '文档权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:11:33', NULL, 0);
INSERT INTO `dc_identifying` VALUES ('9', '文档提醒', 'document_remind_settings', '文档权限', '1', NULL, NULL, '2022-04-18 15:27:21', '2022-04-18 16:19:10', NULL, 0);

-- ----------------------------
-- Table structure for dc_identifying_role_binding
-- ----------------------------
DROP TABLE IF EXISTS `dc_identifying_role_binding`;
CREATE TABLE `dc_identifying_role_binding`  (
  `identifying_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限与角色的绑定关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_identifying_role_binding
-- ----------------------------
INSERT INTO `dc_identifying_role_binding` VALUES ('1', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('2', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('3', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('4', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('5', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('6', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('7', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('8', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('9', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('10', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('11', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('12', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('1', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('2', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('3', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('4', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('5', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('11', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('6', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('7', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('8', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('9', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('10', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('12', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('2', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('1', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('12', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('11', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('10', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('9', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('8', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('7', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('6', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('5', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('4', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('3', '1');
INSERT INTO `dc_identifying_role_binding` VALUES ('12', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('10', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('9', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('8', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('7', '2');
INSERT INTO `dc_identifying_role_binding` VALUES ('6', '2');

-- ----------------------------
-- Table structure for dc_label
-- ----------------------------
DROP TABLE IF EXISTS `dc_label`;
CREATE TABLE `dc_label`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT ' 标签',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_label
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library
-- ----------------------------
DROP TABLE IF EXISTS `dc_library`;
CREATE TABLE `dc_library`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `share_role` enum('user','register','all') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user' COMMENT '查看权限/成员开放、注册用户、完全开放',
  `share_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享密码',
  `share` tinyint(1) NULL DEFAULT 0 COMMENT '分享/不分享，分享',
  `share_validity_type` enum('PERPETUAL','ONE_DAY','SEVEN_DAY','THIRTY_DAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享有效期',
  `share_end_time` datetime(0) NULL DEFAULT NULL COMMENT '分享结束时间',
  `share_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享的文档链接,二维码可通过链接生成即可短链接',
  `share_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享key',
  `type` enum('knowledge','directory','document_html','document_xlsx','document_map','document_flow','document_unrecognized','document_upload','office_doc','office_pdf','office_xlsx','office_ppt') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'knowledge' COMMENT '类型\\知识库、目录、文本文档、表格文档、脑图文档、流程文档。',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '上级ID',
  `size` bigint(20) NULL DEFAULT 0 COMMENT '文档大小',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桐名称',
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文件存储路径',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `sub_json` json NULL COMMENT '子集目录的json',
  `order_id` int(11) NULL DEFAULT 0 COMMENT '排序字段',
  `editing_by` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '该文档此时正在被哪个用户编辑,没有则为null',
  `knowledge_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库id',
  `color` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '知识库颜色',
  `read_notify` tinyint(1) NULL DEFAULT 1 COMMENT '自动发送查看提醒开关',
  `label` json NULL COMMENT '标签',
  `searchable` tinyint(1) NULL DEFAULT 1 COMMENT '是否允许搜索 0-否，1-是',
  `commentable` tinyint(1) NULL DEFAULT 1 COMMENT '是否可评论 0-否，1-是',
  `other_json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端用于存储其他字段(例如:脑图需要一个type类型存储）',
  `name_suffix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀名',
  `file_status` enum('NORMAL','UNDERWAY','FAILURE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NORMAL' COMMENT '文件状态',
  `source_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '如果是转换的文件记录一下 源id',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转换文件的报错信息',
  `share_link_original` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原有的字符串',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_knowledge_id`(`knowledge_id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_administration
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_administration`;
CREATE TABLE `dc_library_administration`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `library_type` enum('register','user','all') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可以变更的类型',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id',
  `user_type` enum('person','dept','job','role','user_group') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'person' COMMENT '数据权限类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_administration
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_collect
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_collect`;
CREATE TABLE `dc_library_collect`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `doc_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_collect
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_comment
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_comment`;
CREATE TABLE `dc_library_comment`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '留言',
  `knowledge_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库id',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级评论',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库-用户留言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_like
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_like`;
CREATE TABLE `dc_library_like`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户ID',
  `real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户名',
  `biz_type` enum('LIBRARY','COMMENT') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '业务类型。LIBRARY-知识库，COMMENT-评论',
  `biz_resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '点赞资源id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource`(`biz_resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '知识库-点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_like
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_log
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_log`;
CREATE TABLE `dc_library_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dc_library_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档的ID值',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `operation_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '操作类型',
  `knowledge_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库id',
  `dc_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档名称',
  `type` enum('knowledge','directory','document_html','document_xlsx','document_map','document_flow','document_unrecognized','document_upload','office_doc','office_pdf','office_xlsx','office_ppt') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'knowledge' COMMENT '类型\\知识库、目录、文本文档、表格文档、脑图文档、流程文档。',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '上级ID',
  `name_suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_log
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_read
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_read`;
CREATE TABLE `dc_library_read`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名-标记为已读时，必须要登录',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `knowledge_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库-用户已读记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_read
-- ----------------------------

-- ----------------------------
-- Table structure for dc_library_user
-- ----------------------------
DROP TABLE IF EXISTS `dc_library_user`;
CREATE TABLE `dc_library_user`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `role` enum('owner','admin','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员角色：所有者、管理员、成员',
  `dc_library_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库的ID值',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库-文档对应的用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_library_user
-- ----------------------------

-- ----------------------------
-- Table structure for dc_role
-- ----------------------------
DROP TABLE IF EXISTS `dc_role`;
CREATE TABLE `dc_role`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否为默认值',
  `role_type` enum('owner','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user' COMMENT '角色类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_role
-- ----------------------------
INSERT INTO `dc_role` VALUES ('1', '所有者', NULL, NULL, '2022-02-16 15:37:13', NULL, '2022-04-15 11:28:57', '111', '1', 0, 'owner');
INSERT INTO `dc_role` VALUES ('2', '文库管理员', NULL, NULL, '2022-02-16 15:37:35', '浮世', '2022-06-23 14:48:07', '文档管理人员，对文档有管理权限。', '1', 1, 'user');

-- ----------------------------
-- Table structure for dc_tag
-- ----------------------------
DROP TABLE IF EXISTS `dc_tag`;
CREATE TABLE `dc_tag`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `colour` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文库标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_tag
-- ----------------------------

-- ----------------------------
-- Table structure for dc_tag_binding
-- ----------------------------
DROP TABLE IF EXISTS `dc_tag_binding`;
CREATE TABLE `dc_tag_binding`  (
  `tag_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签id',
  `dc_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '知识库id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库 与标签的绑定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_tag_binding
-- ----------------------------

-- ----------------------------
-- Table structure for dc_template
-- ----------------------------
DROP TABLE IF EXISTS `dc_template`;
CREATE TABLE `dc_template`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档类型',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `other_json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端用于存储其他字段(例如:脑图需要一个type类型存储）',
  `cover_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面桶名称',
  `cover_bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面文件路径',
  `type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'type类型id',
  `template_type` enum('text','variable') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'text' COMMENT '模板类型',
  `name_suffix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀名',
  `save_path_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板替换时生成的新文档保存的父级',
  `variable_data` json DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_template
-- ----------------------------

-- ----------------------------
-- Table structure for dc_template_type
-- ----------------------------
DROP TABLE IF EXISTS `dc_template_type`;
CREATE TABLE `dc_template_type`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `template_type` enum('text','variable') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'text' COMMENT '模板类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模板分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_template_type
-- ----------------------------

-- ----------------------------
-- Table structure for dc_template_variable
-- ----------------------------
DROP TABLE IF EXISTS `dc_template_variable`;
CREATE TABLE `dc_template_variable`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量名称',
  `other_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他值 其他客户定制开发可能需要的',
  `template_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量备注或说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模板变量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_template_variable
-- ----------------------------

-- ----------------------------
-- Table structure for dc_topping
-- ----------------------------
DROP TABLE IF EXISTS `dc_topping`;
CREATE TABLE `dc_topping`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dc_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识库id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '置顶数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_topping
-- ----------------------------

-- ----------------------------
-- Table structure for dc_version
-- ----------------------------
DROP TABLE IF EXISTS `dc_version`;
CREATE TABLE `dc_version`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `dc_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文档id',
  `version_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `mongodb_content` json NULL COMMENT 'mongodb的数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '版本号管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_version
-- ----------------------------

-- ----------------------------
-- Table structure for message_sms
-- ----------------------------
DROP TABLE IF EXISTS `message_sms`;
CREATE TABLE `message_sms`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sign_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信签名名称',
  `template_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信模板CODE',
  `sms_up_extend_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上行短信扩展码',
  `sms_facilitator` enum('ali') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'ali' COMMENT '服务商',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message_sms
-- ----------------------------

-- ----------------------------
-- Table structure for sql_performance
-- ----------------------------
DROP TABLE IF EXISTS `sql_performance`;
CREATE TABLE `sql_performance`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sql` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` int(11) NULL DEFAULT NULL,
  `end_time` int(11) NULL DEFAULT NULL,
  `consuming_time` int(11) NULL DEFAULT NULL,
  `access_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `slow_sql` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保存执行计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sql_performance
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名 ',
  `file_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶名',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `file_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `size` bigint(11) NULL DEFAULT NULL COMMENT '文件大小 单位:字节',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务备注',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `file_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '占位字段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件统一管理，不包含租户信息，只做文件转发和统一保存管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `business_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名',
  `function_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名',
  `thread_user` json NULL COMMENT '当前用户对象JSON',
  `parameters` json NULL COMMENT '请求参数对象JSON',
  `tid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT 'tid',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `consuming_time` int(11) NULL DEFAULT NULL COMMENT '耗时',
  `return_obj` json NULL COMMENT '返回对象JSON',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '返回状态是否是成功',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求IP地址',
  `elements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常数据JSON',
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常消息数据',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境参数',
  `api` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'api地址',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '日志类型:1-AOP拦截,2-过程中的日志,3-自定义日志',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '用户名称',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '租户id',
  `operation_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '操作类型',
  `client_id` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '终端',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `start_time`(`start_time`) USING BTREE,
  INDEX `client_id`(`client_id`(191)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请求日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1544262378172932097', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 619\\\"}\"', 1, '10.0.0.119', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:17', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262378281984001', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 645\\\"}\"', 1, '10.0.0.119', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:17', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262378437173249', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 682\\\"}\"', 1, '10.0.0.119', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:17', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262378688831490', 'document-mgr', '知识库成员-查询知识库成员', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'queryUser', 'cn.bctools.document.controller.DcLibraryUserController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[null, \"f58e60e156a509915d61ff10bac782e9\"]', '--', 'xiaohui', 16, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"current\\\":1,\\\"hitCount\\\":false,\\\"optimizeCountSql\\\":true,\\\"orders\\\":[],\\\"pages\\\":0,\\\"records\\\":[],\\\"searchCount\\\":true,\\\"size\\\":10000,\\\"total\\\":0},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 743\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/query/member/f58e60e156a509915d61ff10bac782e9', 1, '肖辉', '2022-07-05 18:10:17', '1', '查询知识库成员', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262378697220097', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 745\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '肖辉', '2022-07-05 18:10:17', '1', '获取kkfile地址', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262378789494785', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 767\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '肖辉', '2022-07-05 18:10:17', '1', '获取kkfile地址', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262379158593537', 'document-mgr', '知识库-查询用户有权限的知识库', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'findKnowledge', 'cn.bctools.document.controller.DcLibraryController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[null]', '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"current\\\":1,\\\"hitCount\\\":false,\\\"optimizeCountSql\\\":true,\\\"orders\\\":[],\\\"pages\\\":0,\\\"records\\\":[],\\\"searchCount\\\":true,\\\"size\\\":1000,\\\"total\\\":0},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:16 855\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/knowledges', 1, '肖辉', '2022-07-05 18:10:17', '1', '查询用户有权限的知识库', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262379779350530', 'document-mgr', '业务日志-分页查询日志', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'page', 'cn.bctools.document.controller.DcLibraryLogController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[null, {\"id\": \"\", \"type\": null, \"dcName\": \"\", \"userId\": \"\", \"userDto\": null, \"parentId\": \"\", \"userName\": \"\", \"createTime\": null, \"dcLibraryId\": \"\", \"knowledgeId\": \"f58e60e156a509915d61ff10bac782e9\", \"operationType\": \"\"}]', '--', 'xiaohui', 35, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"current\\\":1,\\\"hitCount\\\":false,\\\"optimizeCountSql\\\":true,\\\"orders\\\":[],\\\"pages\\\":0,\\\"records\\\":[],\\\"searchCount\\\":true,\\\"size\\\":10,\\\"total\\\":0},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:17 002\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/log/page', 1, '肖辉', '2022-07-05 18:10:17', '1', '分页查询日志', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262380244918274', 'document-mgr', '知识库-获取目录树', '2022-07-05 18:10:17', '2022-07-05 18:10:17', 'tree', 'cn.bctools.document.controller.DcLibraryController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[\"f58e60e156a509915d61ff10bac782e9\"]', '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"data\\\":[]},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:17 114\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/tree', 1, '肖辉', '2022-07-05 18:10:17', '1', '获取目录树', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262383914934274', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:18', '2022-07-05 18:10:18', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:17 988\\\"}\"', 1, '10.0.0.26', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:18', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262469772337154', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:38', '2022-07-05 18:10:38', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 458\\\"}\"', 1, '10.0.0.119', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:38', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262469856223233', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:38', '2022-07-05 18:10:38', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 479\\\"}\"', 1, '10.0.0.119', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:38', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262470015606786', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 517\\\"}\"', 1, '10.0.0.119', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:39', '', '获取kkfile地址', '--', NULL);
INSERT INTO `sys_log` VALUES ('1544262470124658690', 'document-mgr', '知识库成员-查询知识库成员', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'queryUser', 'cn.bctools.document.controller.DcLibraryUserController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[null, \"f58e60e156a509915d61ff10bac782e9\"]', '--', 'xiaohui', 24, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"current\\\":1,\\\"hitCount\\\":false,\\\"optimizeCountSql\\\":true,\\\"orders\\\":[],\\\"pages\\\":0,\\\"records\\\":[],\\\"searchCount\\\":true,\\\"size\\\":10000,\\\"total\\\":0},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 543\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/query/member/f58e60e156a509915d61ff10bac782e9', 1, '肖辉', '2022-07-05 18:10:39', '1', '查询知识库成员', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262470212739074', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 565\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '肖辉', '2022-07-05 18:10:39', '1', '获取kkfile地址', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262470346956802', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 595\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '肖辉', '2022-07-05 18:10:39', '1', '获取kkfile地址', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262470581837825', 'document-mgr', '知识库-查询用户有权限的知识库', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'findKnowledge', 'cn.bctools.document.controller.DcLibraryController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[null]', '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"current\\\":1,\\\"hitCount\\\":false,\\\"optimizeCountSql\\\":true,\\\"orders\\\":[],\\\"pages\\\":0,\\\"records\\\":[],\\\"searchCount\\\":true,\\\"size\\\":1000,\\\"total\\\":0},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 653\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/knowledges', 1, '肖辉', '2022-07-05 18:10:39', '1', '查询用户有权限的知识库', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262470879633410', 'document-mgr', '业务日志-分页查询日志', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'page', 'cn.bctools.document.controller.DcLibraryLogController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[null, {\"id\": \"\", \"type\": null, \"dcName\": \"\", \"userId\": \"\", \"userDto\": null, \"parentId\": \"\", \"userName\": \"\", \"createTime\": null, \"dcLibraryId\": \"\", \"knowledgeId\": \"f58e60e156a509915d61ff10bac782e9\", \"operationType\": \"\"}]', '--', 'xiaohui', 16, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"current\\\":1,\\\"hitCount\\\":false,\\\"optimizeCountSql\\\":true,\\\"orders\\\":[],\\\"pages\\\":0,\\\"records\\\":[],\\\"searchCount\\\":true,\\\"size\\\":10,\\\"total\\\":0},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 722\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/log/page', 1, '肖辉', '2022-07-05 18:10:39', '1', '分页查询日志', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262471403921410', 'document-mgr', '知识库-获取目录树', '2022-07-05 18:10:39', '2022-07-05 18:10:39', 'tree', 'cn.bctools.document.controller.DcLibraryController', '{\"id\": \"c3f28cc0af0af62f03fb1ba0711120b6\", \"ip\": \" 局域网IP(10.0.0.249)\", \"sex\": \"保密\", \"email\": \"1437246907@qq.com\", \"jobId\": \"\", \"level\": 1, \"phone\": \"15870433033\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"tenant\": {\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}, \"headImg\": \"http://jvsoss.bctools.cn/jvs-public/2022/12/56/2022-05-11709105712445165568-0ebe50b89a3cbd1fea36049eb8edf10.jpg\", \"jobName\": \"\", \"roleIds\": [], \"tenants\": [{\"id\": \"1\", \"icon\": \"\", \"logo\": \"http://jvsoss.bctools.cn/jvs-public/tenantPicture/2022/07/05/2022-07-05728892929212321792-2022-06-27726029543487213568-%E8%BD%AF%E5%BC%80%E4%BC%81%E6%9C%8D.png\", \"name\": \"重庆软开企业服务有限公司\", \"jobId\": \"\", \"level\": \"1\", \"deptId\": \"e460c7be9ae42f684fdf1ce7c015cf30\", \"jobName\": \"\", \"deptName\": \"知识库权限测试\", \"shortName\": \"JVS快速开发服务平台\", \"employeeNo\": \"\", \"loginDomain\": \"\"}], \"clientId\": \"knowledge\", \"deptName\": \"知识库权限测试\", \"password\": \"\", \"realName\": \"肖辉\", \"roleType\": [\"应用管理员\"], \"tenantId\": \"1\", \"adminFlag\": false, \"loginType\": \"帐号密码\", \"userAgent\": \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36\", \"cancelFlag\": false, \"clientName\": \"文档库\", \"employeeNo\": \"\", \"exceptions\": {}, \"accountName\": \"xiaohui\", \"callBackUrl\": \"\", \"platformAdmin\": true}', '[\"f58e60e156a509915d61ff10bac782e9\"]', '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":{\\\"data\\\":[]},\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:38 848\\\"}\"', 1, ' 局域网IP(10.0.0.249)', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/dcLibrary/tree', 1, '肖辉', '2022-07-05 18:10:39', '1', '获取目录树', 'knowledge', '文档库');
INSERT INTO `sys_log` VALUES ('1544262476709715969', 'document-mgr', '不需要授权请求的接口-获取kkfile地址', '2022-07-05 18:10:40', '2022-07-05 18:10:40', 'getUrl', 'cn.bctools.document.controller.DcNoAuthController', NULL, NULL, '--', 'xiaohui', 0, '\"return:{\\\"code\\\":0,\\\"data\\\":\\\"http://10.0.0.38:20812\\\",\\\"msg\\\":\\\"success\\\",\\\"timestamp\\\":\\\"2022-07-05 18:10:40 113\\\"}\"', 1, '10.0.0.26', NULL, NULL, '[document-mgr]-[50033]-[jvs]', '/no/auth/get/kkfile/url', 1, '--', '2022-07-05 18:10:40', '', '获取kkfile地址', '--', NULL);

SET FOREIGN_KEY_CHECKS = 1;
