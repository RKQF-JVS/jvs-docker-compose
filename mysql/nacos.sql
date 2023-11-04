create database `nacos` default character set utf8mb4 collate utf8mb4_general_ci;
use nacos;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1000, 'application.yml', 'DEFAULT_GROUP', 'spring:\n  rabbitmq:\n    host: rabbitmq\n    port: 5672\n    username: jvs\n    password: jvs\n    # 使用其他环境时需要覆盖此属性\n    virtual-host: /jvs\n    listener:\n      simple:\n        acknowledge-mode: auto\n  servlet:\n    multipart:\n      enabled: true\n      max-request-size: 20MB\n      max-file-size: 20MB\n  redis:\n    host: jvs-redis\n    port: 6379\n    timeout: 3000\n    database: 0\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n\n  cloud:\n  #10.0.0.126:8858\n    sentinel.transport.dashboard: sentinel:8084\n    sentinel.log.dir: log/sentinel\n  jackson:\n    default-property-inclusion: non_null\nlogging:\n  #使用logstash方式日志传递\n  config: classpath:logback-logstash.xml\n  level:\n    #屏蔽 nacos 心跳日志,因为日志打印太频繁\n    com.alibaba.nacos.client.naming: error\nmybatis-plus:\n  global-config:\n    db-config:\n      #全局逻辑删除字段值\n      logic-delete-field: delFlag\n  # 支持统配符 * 或者 ; 分割\n  typeEnumsPackage: cn.**.entity.enums\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 使用枚举的name值进行映射\n    default-enum-type-handler: \'\'\n    # 使用枚举的标号进行映射\n    #default-enum-type-handler: org.apache.ibatis.type.EnumOrdinalTypeHandler\n\n\n#SQL性能分析，其它环境建议关闭。只在测试环境进行处理\nsql:\n  #SQL 执行最大时长，毫秒，如果超长会有提示\n  maxTime: 200\n  #是否开启日志记录\n  log: true\n  # SQL分析,将SQL拿来做explain解释器\n  explainIs: true\n  # 动态创建租户数据库,租户id动态路由开关\n  dynamicTenantDatabase: false\n\n\n#阿里短信,现在帐号用的喜哥的\nsms:\n  signature: \n  accessKeyId: \n  accessKeySecret: \n  template:\n    login: SMS_187752507\n\n# Swagger文档开关\nswagger:\n  enable: true\n\n#文件存储内容\noss:\n  #选择阿里oss存储   name : minio   建议使用minio最新版本，oss需要一个桶绑定一个域名， 否则前端使用时会导致图片无法显示\n  name: minio\n  endpoint: http://jvs-minio:9000\n  access-key: miniominio\n  secret-key: miniominio\n  #声明公共桶，获取地址的时候直接为公有地址\n  publicBuckets:\n    - jvs-public\n    - jvs-auth\n    \n#是否做加密数据返回处理\ngateway:\n  #网关返回数据加密,返回数据为R并为成功时才加密，失败不加密,只加密mgr的数据\n  encrypt: true\n  #前端对应的加密，后端权限扫描器数据传输加密,现只加密mgr的请求，其它请求不加密\n  encryptKey: jvs\n\n\n#网关地址 授权认证\ngatewayUrl: http://gateway:10000\n#认证授权地址\noauthUrl: http://jvs-auth:3000\nsecurity:\n  oauth2:\n    client:\n      # 默认使用项目名做为client\n      client-id: frame\n      client-secret: frame\n      access-token-uri: ${oauthUrl}/oauth/token\n      user-authorization-uri: ${oauthUrl}/oauth/authorize\n      scope: server\n    resource:\n      token-info-uri: ${oauthUrl}/oauth/check_token\n      user-info-uri: ${oauthUrl}/user\n    authorization:\n      check-token-access: ${oauthUrl}/oauth/check_token\n\n#arthas\narthas:\n  telnet-port: 0\n  http-port: 0\n  disabled-commands: stop\n  #slient-init: false\n  # tunnel-server: ws://127.0.0.1:7777/ws\n \n\njvs:\n  email:\n    host:  \n    pass:  \n    from: \n\n\n# Seata默认配置\nseata:\n  # 事务分组名称(与服务端一致)\n  tx-service-group: my_test_tx_group\n  # 获取Seata服务端ip:port的方式\n  registry:\n    type: nacos\n    nacos:\n      namespace: ${spring.cloud.nacos.discovery.namespace}\n      server-addr: ${spring.cloud.nacos.discovery.server-addr}\n  client:\n    rm:\n      # 获取全局锁相关配置\n      lock:\n        # 重试次数\n        retry-times: 10\n        # 每次等待时间(ms)\n        retry-interval: 1000\n        # 尝试获取全局锁失败时是否立即报错(false时会等待锁)\n        retry-policy-branch-rollback-on-conflict: false\n\nwx:\n  # 微信小程序\n  miniapp:\n    appid: xxx\n    secret: xxx\n    config-storage:\n      type: redistemplate\n\n#扫码登录三方帐号和回调地址\n#扫码登录三方帐号和回调地址\njustauth:\n  enabled: true\n  cache:\n    type: redis\n    prefix: \'justauth:social:state:\'\n    timeout: 1h\n  type:\n  #开放平台微信扫码登录，需要创建应用\n    # WECHAT_OPEN:\n    #   client-id:  \n    #   client-secret:  \n    #   redirect-uri:  \n    WECHAT_OPEN:\n      client-id: \n      client-secret: \n      redirect-uri:\n\n\n\n\n# # 授权许可\n# license:\n#   code: ', '08e9188f4496b5b317b3a4b26a900cc6', '2022-02-21 02:32:45', '2022-02-21 02:57:13', NULL, '172.22.0.1', '', 'jvs', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (1001, 'jvs-gateway', 'jvs', 'server: \n  port: 10000\n#是否做加密数据返回处理\ngateway:\n  #网关返回数据加密,返回数据为R并为成功时才加密，失败不加密,只加密mgr的数据\n  encrypt: true\n  #前端对应的加密，后端权限扫描器数据传输加密,现只加密mgr的请求，其它请求不加密\n  encryptKey: jvs\n  \nspring:\n  servlet:\n    multipart:\n      max-file-size: 20MB\n      max-request-size: 20MB\n\n', 'cbf66d588544070dd60a0a07ce33590c', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (1002, 'jvs-apply-document.yml', 'DEFAULT_GROUP', 'spring:\n  elasticsearch:\n    rest:\n      uris: elasticsearch:9200\n\n#忽略权限地址\njvs:\n  oauth2:\n    permitUrls:\n      - /help/**\n      - /dcLibrary/comment/page/**\n      - /dcLibrary/like/list\n      - /dcLibrary/document/read/total/**\n      - /dcLibrary/document/edit/log\n      - /dcLibrary/share/**\n      - /dcLibrary/preview/document/**\n', 'd9fdc001b72467b5067c0065fa548d39', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (1003, 'jvs-apply-rule.yml', 'DEFAULT_GROUP', '#配置默认数据源\nspring:\n  datasource:\n    dynamic:\n      primary: default\n      datasource:\n        default:\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n          username: root\n          password: root', '340b3198298df218c756ab6118811c17', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (1004, 'jvs-apply-sentinel.yml', 'jvs', 'server:\n  port: 8084\nauth:\n  #帐号\n  username: admin\n  #密码\n  password: admin', '1aa99def19e20d1225f592e02a130c6e', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (1005, 'jvs-gateway-sentinel', 'jvs', '[]', 'd751713988987e9331980363e24189ce', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (1006, 'agreement', 'DEFAULT_GROUP', '#fa', '2bb844bc6e79ace6dc9c9c02132f7b78', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (1007, 'jvs-design.yml', 'DEFAULT_GROUP', 'jvs:\n  oauth2:\n    # 放行路径\n    permitUrls:\n      # 获取图表设计数据\n      - /use/*\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: \'\'\n', 'ce5a203e686b53e709d1d46c5e13c0ac', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (1008, 'jvs-modules-im.yml', 'DEFAULT_GROUP', '# Arangodb配置\narangodb:\n  host: 10.0.0.123\n  port: 32505\n  user-name: root\n  password: root\n  db-name: im\n\njim:\n  # ip\n  bing: \n    ip: 0.0.0.0\n  # 端口  \n  # port: 8888\n  # 心跳超时时长。大于0表示开启心跳监测\n  heartbeat: \n    timeout: 0\n  # 是否开启消息持久化(on:开启,off:不开启)  \n  store: \"off\"\n  # 是否开启集群(on:开启,off:不开启)\n  cluster: \"on\"\n  # 是否开启SSL(on:开启,off:不开启)\n  ssl: \"off\"\n  # 证书\n  key:\n    store:\n      # JKS证书地址\n      path: classpath:ssl/keystore.jks\n      # JKS证书密码\n      pwd: 214323428310224\n\n  # http协议    \n  http:\n    # html/css/js等的根目录，支持classpath:也支持绝对路径\n    page: pages\n    # http mvc扫描包路径\n    scan:\n      packages: org.jim.server.demo.ImServerDemoStart\n      # http资源缓存时长\n    max:\n      live:\n        time: 0', '07f86bf714789c06d866f5b142f4e6a7', '2022-02-21 02:32:45', '2022-02-21 02:32:45', NULL, '172.20.0.1', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (1016, 'jvs-teamwork.yml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs-team-work?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100', '30599d859de10778a9adfe2b838215c9', '2022-05-08 03:32:14', '2022-05-08 03:32:14', NULL, '172.18.0.1', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL);

COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1410 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (0, 1400, 'application.yml', 'DEFAULT_GROUP', '', 'spring:\n  servlet:\n    multipart:\n      enabled: true\n      max-request-size: 20MB\n      max-file-size: 20MB\n  redis:\n    host: jvs-redis\n    port: 6379\n    timeout: 3000\n    database: 0\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n\n  cloud:\n  #10.0.0.126:8858\n    sentinel.transport.dashboard: sentinel:8084\n    sentinel.log.dir: log/sentinel\n  jackson:\n    default-property-inclusion: non_null\nlogging:\n  #使用logstash方式日志传递\n  config: classpath:logback-logstash.xml\n  level:\n    #屏蔽 nacos 心跳日志,因为日志打印太频繁\n    com.alibaba.nacos.client.naming: error\nmybatis-plus:\n  global-config:\n    db-config:\n      #全局逻辑删除字段值\n      logic-delete-field: delFlag\n  # 支持统配符 * 或者 ; 分割\n  typeEnumsPackage: cn.**.entity.enums\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 使用枚举的name值进行映射\n    default-enum-type-handler: \'\'\n    # 使用枚举的标号进行映射\n    #default-enum-type-handler: org.apache.ibatis.type.EnumOrdinalTypeHandler\n\n\n#SQL性能分析，其它环境建议关闭。只在测试环境进行处理\nsql:\n  #SQL 执行最大时长，毫秒，如果超长会有提示\n  maxTime: 200\n  #是否开启日志记录\n  log: true\n  # SQL分析,将SQL拿来做explain解释器\n  explainIs: true\n  # 动态创建租户数据库,租户id动态路由开关\n  dynamicTenantDatabase: false\n\n\n#阿里短信,现在帐号用的喜哥的\nsms:\n  signature: \n  accessKeyId: \n  accessKeySecret: \n  template:\n    login: SMS_187752507\n\n# Swagger文档开关\nswagger:\n  enable: true\n\n#文件存储内容\noss:\n  #选择阿里oss存储   name : minio   建议使用minio最新版本，oss需要一个桶绑定一个域名， 否则前端使用时会导致图片无法显示\n  name: minio\n  endpoint: http://10.0.0.17:9000\n  access-key: miniominio\n  secret-key: miniominio\n  #声明公共桶，获取地址的时候直接为公有地址\n  publicBuckets:\n    - jvs-public\n    - jvs-auth\n    \n#是否做加密数据返回处理\ngateway:\n  #网关返回数据加密,返回数据为R并为成功时才加密，失败不加密,只加密mgr的数据\n  encrypt: true\n  #前端对应的加密，后端权限扫描器数据传输加密,现只加密mgr的请求，其它请求不加密\n  encryptKey: jvs\n\n\n#网关地址 授权认证\ngatewayUrl: http://gateway:10000\n#认证授权地址\noauthUrl: http://jvs-auth:3000\nsecurity:\n  oauth2:\n    client:\n      # 默认使用项目名做为client\n      client-id: frame\n      client-secret: frame\n      access-token-uri: ${oauthUrl}/oauth/token\n      user-authorization-uri: ${oauthUrl}/oauth/authorize\n      scope: server\n    resource:\n      token-info-uri: ${oauthUrl}/oauth/check_token\n      user-info-uri: ${oauthUrl}/user\n    authorization:\n      check-token-access: ${oauthUrl}/oauth/check_token\n\n#arthas\narthas:\n  telnet-port: 0\n  http-port: 0\n  disabled-commands: stop\n  #slient-init: false\n  # tunnel-server: ws://127.0.0.1:7777/ws\n \n\njvs:\n  email:\n    host:  \n    pass:  \n    from: \n\n\n# Seata默认配置\nseata:\n  # 事务分组名称(与服务端一致)\n  tx-service-group: my_test_tx_group\n  # 获取Seata服务端ip:port的方式\n  registry:\n    type: nacos\n    nacos:\n      namespace: ${spring.cloud.nacos.discovery.namespace}\n      server-addr: ${spring.cloud.nacos.discovery.server-addr}\n  client:\n    rm:\n      # 获取全局锁相关配置\n      lock:\n        # 重试次数\n        retry-times: 10\n        # 每次等待时间(ms)\n        retry-interval: 1000\n        # 尝试获取全局锁失败时是否立即报错(false时会等待锁)\n        retry-policy-branch-rollback-on-conflict: false\n\nwx:\n  # 微信小程序\n  miniapp:\n    appid: xxx\n    secret: xxx\n    config-storage:\n      type: redistemplate\n\n#扫码登录三方帐号和回调地址\n#扫码登录三方帐号和回调地址\njustauth:\n  enabled: true\n  cache:\n    type: redis\n    prefix: \'justauth:social:state:\'\n    timeout: 1h\n  type:\n  #开放平台微信扫码登录，需要创建应用\n    # WECHAT_OPEN:\n    #   client-id:  \n    #   client-secret:  \n    #   redirect-uri:  \n    WECHAT_OPEN:\n      client-id: \n      client-secret: \n      redirect-uri:\n\n\n\n\n# # 授权许可\n# license:\n#   code: ', '7efa8198a54369f7ed09acfcb3420efc', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1401, 'jvs-gateway', 'jvs', '', 'server: \n  port: 10000\n#是否做加密数据返回处理\ngateway:\n  #网关返回数据加密,返回数据为R并为成功时才加密，失败不加密,只加密mgr的数据\n  encrypt: true\n  #前端对应的加密，后端权限扫描器数据传输加密,现只加密mgr的请求，其它请求不加密\n  encryptKey: jvs\n  \nspring:\n  servlet:\n    multipart:\n      max-file-size: 20MB\n      max-request-size: 20MB\n\n', 'cbf66d588544070dd60a0a07ce33590c', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1402, 'jvs-apply-document.yml', 'DEFAULT_GROUP', '', 'spring:\n  elasticsearch:\n    rest:\n      uris: elasticsearch:9200\n\n#忽略权限地址\njvs:\n  oauth2:\n    permitUrls:\n      - /help/**\n      - /dcLibrary/comment/page/**\n      - /dcLibrary/like/list\n      - /dcLibrary/document/read/total/**\n      - /dcLibrary/document/edit/log\n      - /dcLibrary/share/**\n      - /dcLibrary/preview/document/**\n', 'd9fdc001b72467b5067c0065fa548d39', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1403, 'jvs-apply-rule.yml', 'DEFAULT_GROUP', '', '#配置默认数据源\nspring:\n  datasource:\n    dynamic:\n      primary: default\n      datasource:\n        default:\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n          username: root\n          password: root', '340b3198298df218c756ab6118811c17', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1404, 'jvs-apply-sentinel.yml', 'jvs', '', 'server:\n  port: 8084\nauth:\n  #帐号\n  username: admin\n  #密码\n  password: admin', '1aa99def19e20d1225f592e02a130c6e', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1405, 'jvs-gateway-sentinel', 'jvs', '', '[]', 'd751713988987e9331980363e24189ce', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1406, 'agreement', 'DEFAULT_GROUP', '', '#fa', '2bb844bc6e79ace6dc9c9c02132f7b78', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1407, 'jvs-design.yml', 'DEFAULT_GROUP', '', 'jvs:\n  oauth2:\n    # 放行路径\n    permitUrls:\n      # 获取图表设计数据\n      - /use/*\n\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: \'\'\n', 'ce5a203e686b53e709d1d46c5e13c0ac', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (0, 1408, 'jvs-modules-im.yml', 'DEFAULT_GROUP', '', '# Arangodb配置\narangodb:\n  host: 10.0.0.123\n  port: 32505\n  user-name: root\n  password: root\n  db-name: im\n\njim:\n  # ip\n  bing: \n    ip: 0.0.0.0\n  # 端口  \n  # port: 8888\n  # 心跳超时时长。大于0表示开启心跳监测\n  heartbeat: \n    timeout: 0\n  # 是否开启消息持久化(on:开启,off:不开启)  \n  store: \"off\"\n  # 是否开启集群(on:开启,off:不开启)\n  cluster: \"on\"\n  # 是否开启SSL(on:开启,off:不开启)\n  ssl: \"off\"\n  # 证书\n  key:\n    store:\n      # JKS证书地址\n      path: classpath:ssl/keystore.jks\n      # JKS证书密码\n      pwd: 214323428310224\n\n  # http协议    \n  http:\n    # html/css/js等的根目录，支持classpath:也支持绝对路径\n    page: pages\n    # http mvc扫描包路径\n    scan:\n      packages: org.jim.server.demo.ImServerDemoStart\n      # http资源缓存时长\n    max:\n      live:\n        time: 0', '07f86bf714789c06d866f5b142f4e6a7', '2022-02-21 16:32:44', '2022-02-21 02:32:45', NULL, '172.20.0.1', 'I', 'jvs');
INSERT INTO `his_config_info` VALUES (1000, 1409, 'application.yml', 'DEFAULT_GROUP', '', 'spring:\n  servlet:\n    multipart:\n      enabled: true\n      max-request-size: 20MB\n      max-file-size: 20MB\n  redis:\n    host: jvs-redis\n    port: 6379\n    timeout: 3000\n    database: 0\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n\n  cloud:\n  #10.0.0.126:8858\n    sentinel.transport.dashboard: sentinel:8084\n    sentinel.log.dir: log/sentinel\n  jackson:\n    default-property-inclusion: non_null\nlogging:\n  #使用logstash方式日志传递\n  config: classpath:logback-logstash.xml\n  level:\n    #屏蔽 nacos 心跳日志,因为日志打印太频繁\n    com.alibaba.nacos.client.naming: error\nmybatis-plus:\n  global-config:\n    db-config:\n      #全局逻辑删除字段值\n      logic-delete-field: delFlag\n  # 支持统配符 * 或者 ; 分割\n  typeEnumsPackage: cn.**.entity.enums\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 使用枚举的name值进行映射\n    default-enum-type-handler: \'\'\n    # 使用枚举的标号进行映射\n    #default-enum-type-handler: org.apache.ibatis.type.EnumOrdinalTypeHandler\n\n\n#SQL性能分析，其它环境建议关闭。只在测试环境进行处理\nsql:\n  #SQL 执行最大时长，毫秒，如果超长会有提示\n  maxTime: 200\n  #是否开启日志记录\n  log: true\n  # SQL分析,将SQL拿来做explain解释器\n  explainIs: true\n  # 动态创建租户数据库,租户id动态路由开关\n  dynamicTenantDatabase: false\n\n\n#阿里短信,现在帐号用的喜哥的\nsms:\n  signature: \n  accessKeyId: \n  accessKeySecret: \n  template:\n    login: SMS_187752507\n\n# Swagger文档开关\nswagger:\n  enable: true\n\n#文件存储内容\noss:\n  #选择阿里oss存储   name : minio   建议使用minio最新版本，oss需要一个桶绑定一个域名， 否则前端使用时会导致图片无法显示\n  name: minio\n  endpoint: http://10.0.0.17:9000\n  access-key: miniominio\n  secret-key: miniominio\n  #声明公共桶，获取地址的时候直接为公有地址\n  publicBuckets:\n    - jvs-public\n    - jvs-auth\n    \n#是否做加密数据返回处理\ngateway:\n  #网关返回数据加密,返回数据为R并为成功时才加密，失败不加密,只加密mgr的数据\n  encrypt: true\n  #前端对应的加密，后端权限扫描器数据传输加密,现只加密mgr的请求，其它请求不加密\n  encryptKey: jvs\n\n\n#网关地址 授权认证\ngatewayUrl: http://gateway:10000\n#认证授权地址\noauthUrl: http://jvs-auth:3000\nsecurity:\n  oauth2:\n    client:\n      # 默认使用项目名做为client\n      client-id: frame\n      client-secret: frame\n      access-token-uri: ${oauthUrl}/oauth/token\n      user-authorization-uri: ${oauthUrl}/oauth/authorize\n      scope: server\n    resource:\n      token-info-uri: ${oauthUrl}/oauth/check_token\n      user-info-uri: ${oauthUrl}/user\n    authorization:\n      check-token-access: ${oauthUrl}/oauth/check_token\n\n#arthas\narthas:\n  telnet-port: 0\n  http-port: 0\n  disabled-commands: stop\n  #slient-init: false\n  # tunnel-server: ws://127.0.0.1:7777/ws\n \n\njvs:\n  email:\n    host:  \n    pass:  \n    from: \n\n\n# Seata默认配置\nseata:\n  # 事务分组名称(与服务端一致)\n  tx-service-group: my_test_tx_group\n  # 获取Seata服务端ip:port的方式\n  registry:\n    type: nacos\n    nacos:\n      namespace: ${spring.cloud.nacos.discovery.namespace}\n      server-addr: ${spring.cloud.nacos.discovery.server-addr}\n  client:\n    rm:\n      # 获取全局锁相关配置\n      lock:\n        # 重试次数\n        retry-times: 10\n        # 每次等待时间(ms)\n        retry-interval: 1000\n        # 尝试获取全局锁失败时是否立即报错(false时会等待锁)\n        retry-policy-branch-rollback-on-conflict: false\n\nwx:\n  # 微信小程序\n  miniapp:\n    appid: xxx\n    secret: xxx\n    config-storage:\n      type: redistemplate\n\n#扫码登录三方帐号和回调地址\n#扫码登录三方帐号和回调地址\njustauth:\n  enabled: true\n  cache:\n    type: redis\n    prefix: \'justauth:social:state:\'\n    timeout: 1h\n  type:\n  #开放平台微信扫码登录，需要创建应用\n    # WECHAT_OPEN:\n    #   client-id:  \n    #   client-secret:  \n    #   redirect-uri:  \n    WECHAT_OPEN:\n      client-id: \n      client-secret: \n      redirect-uri:\n\n\n\n\n# # 授权许可\n# license:\n#   code: ', 'bf73ebd684a544f0d8868e2451c09a63', '2022-02-21 16:57:14', '2022-02-21 02:57:13', NULL, '172.22.0.1', 'U', 'jvs');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('nacosjvs', 'jvs:*:*', 'r');
INSERT INTO `permissions` VALUES ('ZXyjXjrCJZpQmczMZXyjXjrCJZpQmczM', 'ZXyjXjrCJZpQmczMZXyjXjrCJZpQmczM:*:*', 'rw');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('ZXyjXjrCJZpQmczM', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
INSERT INTO `tenant_info` VALUES (6, '1', 'jvs', 'jvs', 'jvs', 'nacos', 1629336775823, 1629336775823);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$wXCNtzCsAV0NtkY6w274IuDIkcSTK3EFVocAsxSDTlHSNFI/svjCS', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
