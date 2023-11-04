/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.170
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : 10.0.0.170:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 28/12/2022 16:42:18
*/
create database `nacos` default character set utf8mb4 collate utf8mb4_general_ci;
use nacos;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1028 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1000, 'application.yml', 'DEFAULT_GROUP', 'server:\n  undertow:\n    io-threads: 16\n    worker-threads: 512\n    buffer-size: 2048\n    direct-buffers: true\nspring:\n  task:\n    execution:\n      pool:\n        core-size: 12\n        max-size: 30\n        queue-capacity: 20\n        keep-alive: 60s\n        allow-core-thread-timeout: true\n      shutdown:\n        await-termination: false\n        await-termination-period: 30s\n      thread-name-prefix: jvs-\n  arthas:\n   enabled: false\n#mongo\n  data:\n    mongodb:\n      uri: mongodb://jvs-mongo:27017/jvs_data\n#邮件发送组件\n  mail:\n    host:  \n    pass:  \n    from:  \n  rabbitmq:\n    host: rabbitmq\n    port: 5672\n    username: jvs\n    password: jvs\n    # 使用其他环境时需要覆盖此属性\n    virtual-host: /jvs\n    listener:\n      simple:\n        acknowledge-mode: auto\n  servlet:\n    multipart:\n      enabled: true\n      max-request-size: 20MB\n      max-file-size: 20MB\n  redis:\n    host: jvs-redis\n    port: 6379\n    timeout: 3000\n    database: 0\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n\n  cloud:\n  #10.0.0.126:8858\n    sentinel.transport.dashboard: sentinel:8084\n    sentinel.log.dir: log/sentinel\n  jackson:\n    default-property-inclusion: non_null\nlogging:\n  #使用logstash方式日志传递\n  config: classpath:logback-logstash.xml\n  level:\n    #屏蔽 nacos 心跳日志,因为日志打印太频繁\n    com.alibaba.nacos.client.naming: error\nmybatis-plus:\n  global-config:\n    db-config:\n      #全局逻辑删除字段值\n      logic-delete-field: delFlag\n  # 支持统配符 * 或者 ; 分割\n  typeEnumsPackage: cn.**.entity.enums\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 使用枚举的name值进行映射\n    default-enum-type-handler: \'\'\n    # 使用枚举的标号进行映射\n    #default-enum-type-handler: org.apache.ibatis.type.EnumOrdinalTypeHandler\n\nfeign:\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n    max-connections: 1000\n    max-connections-per-route: 100\n  compression:\n    request:\n      mime-types: text/xml,application/xml,application/json\n      min-request-size: 2048\n      enabled: true\n    response:\n      enabled: true\n\n#SQL性能分析，其它环境建议关闭。只在测试环境进行处理\nsql:\n  #SQL 执行最大时长，毫秒，如果超长会有提示\n  maxTime: 200\n  #是否开启日志记录\n  log: false\n  # SQL分析,将SQL拿来做explain解释器\n  explainIs: false\n  # 动态创建租户数据库,租户id动态路由开关\n  dynamicTenantDatabase: false\n\n\n# Swagger文档开关\nswagger:\n  enable: true\n  #是否做加密数据返回处理\ngateway:\n  #网关返回数据加密,返回数据为R并为成功时才加密，失败不加密,只加密mgr的数据\n  encrypt: true\n  #前端对应的加密，后端权限扫描器数据传输加密,现只加密mgr的请求，其它请求不加密\n  encryptKey: jvs\n\n#文件存储内容\noss:\n  #选择阿里oss存储   name : minio   建议使用minio最新版本，oss需要一个桶绑定一个域名， 否则前端使用时会导致图片无法显示\n  name: minio\n  endpoint: jvs-minio:9000\n  access-key: miniominio\n  secret-key: miniominio\n  #声明公共桶，获取地址的时候直接为公有地址\n  publicBuckets:\n    - jvs-public\n    - jvs-auth\n\n\n#网关地址 授权认证\ngatewayUrl: http://gateway:10000\n#认证授权地址\noauthUrl: http://jvs-auth:3000\n\n#arthas\narthas:\n  telnet-port: 0\n  http-port: 0\n  disabled-commands: stop\n  #slient-init: false\n  # tunnel-server: ws://127.0.0.1:7777/ws\n\n# Seata默认配置\nseata:\n  # 事务分组名称(与服务端一致)\n  tx-service-group: my_test_tx_group\n  # 获取Seata服务端ip:port的方式\n  registry:\n    type: nacos\n    nacos:\n      namespace: ${spring.cloud.nacos.discovery.namespace}\n      server-addr: ${spring.cloud.nacos.discovery.server-addr}\n  client:\n    rm:\n      # 获取全局锁相关配置\n      lock:\n        # 重试次数\n        retry-times: 10\n        # 每次等待时间(ms)\n        retry-interval: 1000\n        # 尝试获取全局锁失败时是否立即报错(false时会等待锁)\n        retry-policy-branch-rollback-on-conflict: false\n\n#扫码登录三方帐号和回调地址\njustauth:\n  enabled: true\n  cache:\n    type: redis\n    prefix: \'justauth:social:state:\'\n    timeout: 1h\n  # type:\n  # #开放平台微信扫码登录，需要创建应用\n  #   WECHAT_OPEN:\n  #     client-id:  \n  #     client-secret:  \n  #     redirect-uri: http://www.bctools.cn/auth/just/callback\n\n#微信小程序\nwx:\n  miniapp:\n    appid: xxx\n    secret: xxx\n    config-storage:\n      type: redistemplate\n  #微信公众号 登录使用\n  # mp:\n  #   appId:   \n  #   secret:  \n  #   token:  \n  #   aesKey:  \n', 'f5c540d9856e9d293006fe0f423d3e0e', '2022-02-21 02:32:45', '2022-12-21 20:11:49', NULL, '172.19.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1001, 'jvs-gateway', 'jvs', 'server: \n  port: 10000\n\n  \nspring:\n  servlet:\n    multipart:\n      max-file-size: 20MB\n      max-request-size: 20MB\n\n    sentinel.transport.dashboard: sentinel:8084\n    sentinel.log.dir: log/sentinel\n    ##取消Sentinel控制台懒加载,即项目启动即连接sentinel\n    sentinel.eager: true\n    sentinel:\n      datasource:\n        ds:\n          nacos:\n            username: nacos\n            password: nacos\n            server-addr: ${spring.cloud.nacos.config.server-addr}\n            dataId: ${spring.application.name}-sentinel\n            groupId: ${spring.cloud.nacos.config.group}\n            namespace: ${spring.cloud.nacos.config.namespace}\n            #路由方式\n            rule-type: flow\n    gateway:\n      globalcors:\n        cors-configurations:\n          \'[/**]\':\n            allowCredentials: true\n            exposedHeaders: \"Content-Disposition,Content-Type,Cache-Control\"\n            allowedHeaders: \"*\"\n            allowedMethods: \"*\"\n            allowedOriginPatterns: \"*\"\n      httpclient:\n        websocket:\n          #WEBsocket 请求内容大小  15M\n          max-frame-payload-length: 10485760', '188f9c1625419e9bb987e3ec7d4625ce', '2022-02-21 02:32:45', '2022-06-27 06:42:35', NULL, '172.18.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1002, 'jvs-apply-document.yml', 'DEFAULT_GROUP', 'spring:\n  elasticsearch:\n    rest:\n      uris: elasticsearch:9200\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs-document?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n  data:\n    mongodb:\n      uri: mongodb://jvs-mongo:27017/yanmao\n\ncommon:\n  #替换为自己的ip\n  documentUrl: http://documentIpAddress:20812\n  #只需要替换ip\n  onlyOfficeUrl: http://documentIpAddress:32467/ConvertService.ashx\n  #orc请求地址\n\n#忽略权限地址\njvs:\n  oauth2:\n    permitUrls:\n      - /help/**\n      - /dcLibrary/comment/page/**\n      - /dcLibrary/like/list\n      - /dcLibrary/document/read/total/**\n      - /dcLibrary/document/edit/log\n      - /dcLibrary/share/**\n      - /no/auth/**\n      - /only/office/**\n      - /dcLibrary/file/get/url/**\n      - /jvs-knowledge-plugins/config.js\n      - /link/**\n      - /dcLibrary/file/preview/url/**\n\n', '023471b44a78454f1036dea4527875d3', '2022-02-21 02:32:45', '2022-07-17 20:53:38', NULL, '10.0.0.249', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1005, 'jvs-gateway-sentinel', 'jvs', '[]', 'd751713988987e9331980363e24189ce', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.18.0.1', '', 'jvs', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (1007, 'jvs-design.yml', 'DEFAULT_GROUP', 'jvs:\n  oauth2:\n    # 放行路径\n    permitUrls:\n      # 获取图表设计数据\n      #- /use/*\n      #应用模板的直接使用\n      - /JvsAppTemplate/**\n      #逻辑引擎api\n      - /api/**\n      #大屏的使用， 保证可以正常使用\n      - /screen/use/**\nlogging.level.org.springframework.data.mongodb.core: debug', 'e1860298777aaa62b6a997fd96bfca25', '2022-02-21 02:32:45', '2022-12-21 20:13:34', NULL, '172.19.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1008, 'jvs-modules-im.yml', 'DEFAULT_GROUP', '# IM用户存取策略。可选-arangodb(使用arangodb)、userAuth(jvs授权服务)\nsocial: userAuth\n\njim:\n  # ip\n  bing: \n    ip: 0.0.0.0\n  # 端口  \n  # port: 8888\n  # 心跳超时时长。大于0表示开启心跳监测\n  heartbeat: \n    timeout: 0\n  # 是否开启消息持久化(on:开启,off:不开启)  \n  store: \"off\"\n  # 是否开启集群(on:开启,off:不开启)\n  cluster: \"on\"\n  # 是否开启SSL(on:开启,off:不开启)\n  ssl: \"off\"\n  # 证书\n  key:\n    store:\n      # JKS证书地址\n      path: classpath:ssl/keystore.jks\n      # JKS证书密码\n      pwd: 214323428310224\n\n  # http协议    \n  http:\n    # html/css/js等的根目录，支持classpath:也支持绝对路径\n    page: pages\n    # http mvc扫描包路径\n    scan:\n      packages: org.jim.server.demo.ImServerDemoStart\n      # http资源缓存时长\n    max:\n      live:\n        time: 0', '778b9c96269ced113d29d45e80566382', '2022-02-21 02:32:45', '2022-04-12 02:06:57', NULL, '172.18.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1012, 'jvs-teamwork-ultimate.yml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs-team-work-ultimate?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n      read-only: false\n      maximumPoolSize: 10\n      idleTimeout: 120000\n      connectionTimeout: 300000\n      leakDetectionThreshold: 300000\n\njvs:\n  oauth2:\n    permitUrls:\n      - /inside/**\n      - /task/server/endpoint/**\n      - /project/folder/file/only/office/call\n      - /project/master/annex/only/office/call\n\ndata:\n  auth:\n    checkUrl:\n      - url: \'/index\'\n        isOpen: false', 'af52b5d800d9db20c2b56105b8013785', '2022-04-12 01:42:01', '2022-05-08 03:32:52', NULL, '172.18.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1020, 'jvs-knowledge-plugins.js', 'web_configuration', '{\"onlyOfficeUrl\":\"http://documentIpAddress:32467/web-apps/apps/api/documents/api.js\", //word套件地址\n\"officeCallBackUrl\":\"http://documentIpAddress:10000\",//套件回调地址\n\"uploadFileLimit\":5,//批量上传文件的个数\n\"otClientUrl\":\"ws://documentIpAddress:10000/api/ot-server\",//富文本协同地址\n\"openOTClient\":true,//是否打开协同\n\"autoSaveUrl\":\"http://documentIpAddress:10000\"//富文本保存地址\n}', '3e703bb6681136a00c2c39e272fdc7fc', '2022-06-27 06:44:11', '2022-07-17 20:55:08', NULL, '10.0.0.249', '', 'jvs', '', '', '', 'json', '');
INSERT INTO `config_info` VALUES (1021, 'license.yml', 'sys_configuration', 'license:\n code: \n', '0646b38b4fa7c39f908f79fb02e70506', '2022-06-27 06:44:11', '2022-12-21 20:15:51', NULL, '172.19.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1027, 'message-push-mgr.yml', 'jvs', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://jvs-mysql:3306/jvs-message-push?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\r\n    username: root\r\n    password: root\r\n    hikari:\r\n      maximum-pool-size: 100\r\n      read-only: false\r\n      maximumPoolSize: 10\r\n      idleTimeout: 120000\r\n      connectionTimeout: 300000\r\n      leakDetectionThreshold: 300000\r\n\r\njvs:\r\n  oauth2:\r\n    permitUrls:\r\n      - /inside/**\r\n      - /message/utils/api/batch/send', '39239d88988827425f02b7b4bd95037e', '2022-12-28 02:41:45', '2022-12-28 02:41:45', NULL, '10.0.0.70', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);



-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 8, 'message-push-mgr.yml', 'jvs', '', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://jvs-mysql:3306/jvs-message-push?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\r\n    username: root\r\n    password: root\r\n    hikari:\r\n      maximum-pool-size: 100\r\n      read-only: false\r\n      maximumPoolSize: 10\r\n      idleTimeout: 120000\r\n      connectionTimeout: 300000\r\n      leakDetectionThreshold: 300000\r\n\r\njvs:\r\n  oauth2:\r\n    permitUrls:\r\n      - /inside/**\r\n      - /message/utils/api/batch/send', '39239d88988827425f02b7b4bd95037e', '2022-12-28 16:41:44', '2022-12-28 02:41:45', NULL, '10.0.0.70', 'I', 'jvs');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('nacosjvs', 'jvs:*:*', 'r');
INSERT INTO `permissions` VALUES ('ZXyjXjrCJZpQmczMZXyjXjrCJZpQmczM', 'ZXyjXjrCJZpQmczMZXyjXjrCJZpQmczM:*:*', 'rw');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('ZXyjXjrCJZpQmczM', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (6, '1', 'jvs', 'jvs', 'jvs', 'nacos', 1629336775823, 1629336775823);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$wXCNtzCsAV0NtkY6w274IuDIkcSTK3EFVocAsxSDTlHSNFI/svjCS', 1);

SET FOREIGN_KEY_CHECKS = 1;
