create database `jvs` default character set utf8mb4 collate utf8mb4_general_ci;
use jvs;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flow_design
-- ----------------------------
DROP TABLE IF EXISTS `flow_design`;
CREATE TABLE `flow_design` (
  `id` char(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '工作流名称',
  `design` longtext COMMENT '工作流流程设计JSON（发布的版本）',
  `designing` longtext COMMENT '工作流流程设计JSON（设计中的版本）',
  `data_model_id` char(50) DEFAULT NULL COMMENT '数据模型id',
  `design_group` varchar(255) DEFAULT NULL COMMENT '分类',
  `icon` varchar(255) DEFAULT '/jvs-ui-public/img/headImg.png' COMMENT '图标',
  `extend` json DEFAULT NULL COMMENT '扩展',
  `description` char(255) DEFAULT '没有添加描述' COMMENT '描述',
  `published` tinyint(1) DEFAULT '0' COMMENT '0-待发布，1-已发布',
  `design_changed` tinyint(1) DEFAULT NULL COMMENT '设计是否已变更 0未变更 1 已变更',
  `form_id` char(50) DEFAULT NULL COMMENT '发起人表单id',
  `form_version` varchar(255) DEFAULT NULL COMMENT '发起人表单版本',
  `rule_keys` json DEFAULT NULL COMMENT '关联的逻辑引擎key集合',
  `page_id` char(50) DEFAULT NULL COMMENT '列表设计id',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流设计';

-- ----------------------------
-- Records of flow_design
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_purview
-- ----------------------------
DROP TABLE IF EXISTS `flow_purview`;
CREATE TABLE `flow_purview` (
  `id` char(50) NOT NULL,
  `flow_design_id` char(50) DEFAULT NULL COMMENT '工作流设计id',
  `purview_group` enum('send_flow') DEFAULT NULL COMMENT '权限组',
  `person_type` enum('all','custom') DEFAULT NULL COMMENT '成员类型',
  `users` json DEFAULT NULL COMMENT '权限用户id集合',
  `depts` json DEFAULT NULL COMMENT '权限部门id集合',
  `roles` json DEFAULT NULL COMMENT '权限角色id集合',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流权限';

-- ----------------------------
-- Records of flow_purview
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task` (
  `id` char(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `flow_design_id` char(50) DEFAULT NULL COMMENT '工作流id',
  `flow_design` longtext COMMENT '工作流流程设计JSON',
  `data_model_id` char(50) DEFAULT NULL COMMENT '模型id',
  `design_model_id` char(50) DEFAULT NULL COMMENT '工作流设计的模型id',
  `form_id` char(50) DEFAULT NULL COMMENT '发起人表单id',
  `form_version` varchar(255) DEFAULT NULL COMMENT '发起人表单版本',
  `data_id` char(50) DEFAULT NULL COMMENT '数据id',
  `courses` json DEFAULT NULL COMMENT '处理过程数组',
  `task_status` tinyint(2) DEFAULT NULL COMMENT '状态：1-待审批，2-已同意，3-已拒绝，4-已终止',
  `node_id` char(50) DEFAULT NULL COMMENT '当前环节节点id',
  `node_name` varchar(255) DEFAULT NULL COMMENT '当前环节节点名',
  `flow_manual_nodes` json DEFAULT NULL COMMENT '流转的人工节点',
  `stop_reason` varchar(255) DEFAULT NULL COMMENT '终止任务原由',
  `test` tinyint(2) unsigned DEFAULT '0' COMMENT '是否是测试任务 0否  1是',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_flow_design_id` (`flow_design_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流任务';

-- ----------------------------
-- Records of flow_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task_approval_record
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_approval_record`;
CREATE TABLE `flow_task_approval_record` (
  `id` char(50) NOT NULL,
  `flow_task_id` char(50) DEFAULT NULL COMMENT '工作流任务id',
  `user_id` varchar(50) DEFAULT NULL COMMENT '人员id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_flow_task_id` (`flow_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流审批记录';

-- ----------------------------
-- Records of flow_task_approval_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task_carbon_copy
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_carbon_copy`;
CREATE TABLE `flow_task_carbon_copy` (
  `id` char(50) NOT NULL,
  `flow_task_id` char(50) DEFAULT NULL COMMENT '工作流任务id',
  `node_id` char(50) DEFAULT NULL COMMENT '工作流节点id',
  `user_id` varchar(50) DEFAULT NULL COMMENT '人员id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_flow_task_id` (`flow_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流抄送';

-- ----------------------------
-- Records of flow_task_carbon_copy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_node`;
CREATE TABLE `flow_task_node` (
  `id` char(50) NOT NULL,
  `flow_task_id` char(50) DEFAULT NULL COMMENT '工作流任务id',
  `node_id` char(50) DEFAULT NULL COMMENT '工作流节点id',
  `course` json DEFAULT NULL COMMENT '处理结果数组',
  `process_status` tinyint(2) DEFAULT NULL COMMENT '状态：1-待处理，2-已处理',
  `approval_type` tinyint(2) unsigned DEFAULT '1' COMMENT '审批类型：1-审批，2-加签审批',
  `append_approval` json DEFAULT NULL COMMENT '加签',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_flow_task_id` (`flow_task_id`) USING BTREE,
  KEY `idx_node_id` (`node_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流流转节点';

-- ----------------------------
-- Records of flow_task_node
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task_person
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_person`;
CREATE TABLE `flow_task_person` (
  `id` char(50) NOT NULL,
  `flow_task_id` char(50) DEFAULT NULL COMMENT '工作流任务id',
  `node_id` char(50) DEFAULT NULL COMMENT '工作流节点id',
  `user_id` char(50) DEFAULT NULL COMMENT '人员id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '人员姓名',
  `process_status` tinyint(2) DEFAULT NULL COMMENT '状态：1-待处理，2-已处理',
  `number` int(11) DEFAULT '0' COMMENT '审批顺序',
  `test` tinyint(2) unsigned DEFAULT '0' COMMENT '是否是测试任务 0否  1是',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_flow_task_id` (`flow_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流任务待办人';

-- ----------------------------
-- Records of flow_task_person
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task_proxy
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_proxy`;
CREATE TABLE `flow_task_proxy` (
  `id` char(50) NOT NULL,
  `user_id` char(50) DEFAULT NULL COMMENT '被代理用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '被代理用户姓名',
  `proxy_user_id` char(50) DEFAULT NULL COMMENT '代理用户id',
  `proxy_user_name` varchar(50) DEFAULT NULL COMMENT '代理用户姓名',
  `begin_time` datetime DEFAULT NULL COMMENT '代理开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '代理结束时间',
  `revoke_flag` tinyint(1) unsigned DEFAULT '0' COMMENT '是否撤销 0未撤销  1已撤销',
  `description` char(255) DEFAULT '没有添加说明' COMMENT '说明',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作流任务代理';

-- ----------------------------
-- Records of flow_task_proxy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for function_base
-- ----------------------------
DROP TABLE IF EXISTS `function_base`;
CREATE TABLE `function_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '分类',
  `info` text COMMENT '描述',
  `param_count` json DEFAULT NULL COMMENT '参数数量(不包括可变参数)',
  `dynamic_param` tinyint(1) DEFAULT NULL COMMENT '是否存在可变参数',
  `enable_cache` tinyint(1) DEFAULT NULL COMMENT '是否允许缓存',
  `body` text COMMENT '函数脚本',
  `jvs_param_type` char(25) DEFAULT NULL COMMENT '返回值类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ISEMPTY` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COMMENT='系统函数';

-- ----------------------------
-- Records of function_base
-- ----------------------------
BEGIN;
INSERT INTO `function_base` VALUES (1, 'SUM', '数学函数', '这是一个数学函数', '[0]', 1, 1, 'def SUM(... num){return num.sum()}', 'number');
INSERT INTO `function_base` VALUES (2, 'CONTRACT', '文字函数', '<p>这是一个文字函数，将多个文字组合起来，参数可使用多个</p><p>例如：CONTRACT(&quot;aa&quot;,&quot;bb&quot;,&quot;cc&quot;)</p><p>结果为： aabbcc</p>', '[0]', 1, 1, 'def CONTRACT(... x) {return x==null?\"\":x.join(\'\')}', 'text');
INSERT INTO `function_base` VALUES (3, 'ADD', '数学函数', '<p>加法运算或正号<br/>例：ADD(5,6,7)<br/>注意：参数可以是多个数字</p>', '[0]', 1, 1, 'def ADD(... x) {return x==null?0:x.sum()}', 'number');
INSERT INTO `function_base` VALUES (4, 'SUBTRACT', '数学函数', '<p>第一个数值减去第二个数值</p><p>例：SUBTRACT(20,6)<br/></p>', '[0]', 1, 1, 'def SUBTRACT(... x) {return x==null?0:x.length==1?-x[0]:x.length==2?x[0]-x[1]:0}', 'number');
INSERT INTO `function_base` VALUES (5, 'MULTIPLY', '数学函数', '<p>多个数值相乘</p><p>例：MULTIPLY(7,6,9,3)<br/></p>', '[2]', 0, 1, 'def MULTIPLY(x,y) {return x==null||y==null?0:x*y}', 'number');
INSERT INTO `function_base` VALUES (6, 'DIVIDE', '数学函数', '<p>第一个数值除以第二个数值<br/></p><p>例：DIVIDE(7,6)<br/></p><p>注意：第二个数值不能为0</p>', '[2]', 0, 1, 'def DIVIDE(x,y) {return x==null||y==null?0:x/y}', 'number');
INSERT INTO `function_base` VALUES (7, 'CONCATENAT', '文字函数', '<p>使用自定义连接符拼接多个字符串</p><p>例：CONCATENAT(&quot;-&quot;,&quot;aaa&quot;,&quot;bbb&quot;,&quot;ccc&quot;)<br/>注意：需要拼接的字符串至少为2个</p>', '[2]', 1, 1, 'def CONCATENATE(x,... num){return num.join(x)};', 'text');
INSERT INTO `function_base` VALUES (8, 'LEFT', '文字函数', '<p>从一个文本字符串的第一个字符开始返回指定个数的字符,如果文本长度小于自定字符个数，就将原始文本返回</p><p>例：LEFT(&quot;aaaaaaa&quot;,5)<br/><br/></p>', '[2]', 0, 1, 'def LEFT(x,y){return x.take(y)}', 'text');
INSERT INTO `function_base` VALUES (9, 'RIGHT', '文字函数', '<p>从一个文本字符串的最后一个字符开始返回指定个数的字符,如果文本长度小于自定字符个数，就将原始文本返回</p><p>例：RIGHT(&quot;aaaaaaa&quot;,5)<br/><br/></p>', '[2]', 0, 1, 'def RIGHT(x,y){return (x.length())<y?x:x[(x.length()-y)..x.length()-1]}', 'text');
INSERT INTO `function_base` VALUES (10, 'LOWER', '文字函数', '<p>将一个文本字符串中的所有大写字母转换为小写字母</p><p>例：LOWER(&quot;AAaaaa&quot;)<br/><br/></p>', '[1]', 0, 1, 'def LOWER(x){return x.toLowerCase()}', 'text');
INSERT INTO `function_base` VALUES (11, 'UPPER', '文字函数', '<p>将一个文本字符串中的所有小写字母转换为大写字母</p><p>例：UPPER(&quot;AAaaaa&quot;)<br/><br/></p>', '[1]', 0, 1, 'def UPPER(x){return x.toUpperCase()}', 'text');
INSERT INTO `function_base` VALUES (12, 'REPLACE', '文字函数', '<p>替换参数1中的字符串，从参数2[数值]后开始替换，替换字符数为参数3[数值]，替换的内容为参数4。<br/>例1：REPLACE(&quot;aaabbbccc&quot;,3,3,&quot;ddd&quot;,)，<br/>结果为：aaadddccc</p><p>例2：REPLACE(&quot;aaabbbccc&quot;,3,5,&quot;ddd&quot;,)，<br/>结果为：aaadddc</p>', '[4]', 0, 1, 'def REPLACE(x,y,a,b){  return x.replaceAll(x.substring(y,y+a),b)}', 'text');
INSERT INTO `function_base` VALUES (13, 'LEN', '文字函数', '<p>返回字符串中的字符个数</p><p>例：LEN(&quot;aaggsc&quot;)。</p>', '[1]', 0, 1, 'def LEN(x){return x.length()}', 'text');
INSERT INTO `function_base` VALUES (14, 'REPT', '文字函数', '<p>将文本重复指定次数</p><p>例：REPT(&quot;aaggsc&quot;,3)。</p>', '[2]', 0, 1, 'def REPT(x,y){return x*y}', 'text');
INSERT INTO `function_base` VALUES (15, 'SEARCH', '文字函数', '<p>在第一个文本字符串中查找第二个文本字符串，并返回第一个文本字符串的起始位置的编号，该编号从第二个文本字符串的第一个字符算起。</p><p>例：SEARCH(&#39;vvsssddaaccaa&#39;,&quot;aa&quot;)</p><p>注意：返回 0 则表示未查找到。默认从第一个字符开始查找，如果需要从指定字符开始查找，填写第三个参数，表示从第几个字符开始查找。例如：SEARCH(&quot;aa&quot;,&#39;vvsssddaaccaa&#39;,5)</p>', '[2, 3]', 0, 1, 'def SEARCH(x,y,a=0){return a==0?x.indexOf(y)+1:x.substring(a).indexOf(y)+1}', 'text');
INSERT INTO `function_base` VALUES (16, 'MID', '文字函数', '<p>截取<strong>参数1</strong>字符串，从<strong>参数2</strong>[数值]开始截取，截取<strong>参数3</strong>[数值]个字符。</p><p>例：MID(&quot;vvsssddaaccaa&quot;,3,4)<br/>结果为：sssd</p>', '[3]', 0, 1, 'def MID(x,y,z){ return x.substring(y-1,y+z-1) }', 'text');
INSERT INTO `function_base` VALUES (18, 'AVERAGE', '数学函数', '<p>求多个数值的平均值</p><p>例：AVERAGE(7,8,6,2)<br/></p>', '[0]', 1, 1, 'def AVERAGE(... x){  return x.sum()/x.size() }', 'number');
INSERT INTO `function_base` VALUES (19, 'MAX', '数学函数', '<p>返回一组数字中的最大值</p><p>例：MAX(7,8,9,6,5,4,7)</p><p>结果：9</p>', '[0]', 1, 1, 'def MAX(... x){  return x.max() }', 'number');
INSERT INTO `function_base` VALUES (20, 'MIN', '数学函数', '<p>返回最小的数值</p><p>例：MIN(7,8,9,6,5,4,7)</p><p>结果：4</p>', '[0]', 1, 1, 'def MIN(... x){  return x.min() }', 'number');
INSERT INTO `function_base` VALUES (21, 'ABS', '数学函数', '当数值为负数的时候返回他的绝对值数值', '[1]', 0, 1, 'def ABS(x){  return Math.abs(x) }', 'number');
INSERT INTO `function_base` VALUES (22, 'ROUND', '数学函数', '<p>将数值四舍五入到整数位。<br/>例：ROUND(4.56221)</p>', '[1]', 0, 1, 'def ROUND(x){  return Math.round(x) }', 'number');
INSERT INTO `function_base` VALUES (23, 'CEILING', '数学函数', '<p>返回将参数向上舍入（沿绝对值增大的方向）为最接近的指定基数的倍数。</p><p>例：CEILING(4.56221,2)<br/>结果为：10</p>', '[2]', 0, 1, 'def CEILING(x,y){  return (Math.ceil(x)*y).intValue() }', 'number');
INSERT INTO `function_base` VALUES (24, 'INTNUM', '数学函数', '<p>把数值组件的值向下舍入为整数</p><p>例：INTNUM(4.56221,2)<br/>结果为：4</p>', '[1]', 0, 1, 'def INTNUM(x){  return x.intValue() }', 'number');
INSERT INTO `function_base` VALUES (25, 'LOG', '数学函数', '<p>根据指定底数返回数字的对数</p><p>例：LOG(4,2)<br/></p>', '[2]', 0, 1, 'def LOG(x,y){  return Math.log(y)/Math.log(x) }', 'number');
INSERT INTO `function_base` VALUES (26, 'MOD', '数学函数', '<p>返回2个数值相除的余数</p><p>例：MOD(4,2)<br/></p>', '[2]', 0, 1, 'def MOD(x,y){  return x%y }', 'number');
INSERT INTO `function_base` VALUES (27, 'POWER', '数学函数', '<p>计算出数值组件乘幂的值</p><p>例：POWER(4,2)<br/></p>', '[2]', 0, 1, 'def POWER(x,y){  return Math.pow(2,3) }', 'number');
INSERT INTO `function_base` VALUES (28, 'FIXED', '数学函数', '<p>将数值1四舍五入到指定的小数位数</p><p>例：FIXED(4.5468,2)<br/></p><p>结果：4.55</p>', '[2]', 0, 1, 'def FIXED(x,y){  return Math.round(x*Math.pow(10,y))/Math.pow(10,y) }', 'number');
INSERT INTO `function_base` VALUES (29, 'SQRT', '数学函数', '<p>取参数的平方根</p><p>例：SQRT(9)</p>', '[1]', 0, 1, 'def SQRT(x){  return Math.sqrt(x) }', 'number');
INSERT INTO `function_base` VALUES (30, 'PRODUCT', '数学函数', '数字相乘', '[2]', 0, 1, 'def PRODUCT(x,y){  return x*y }', 'number');
INSERT INTO `function_base` VALUES (31, 'SUMPRODUCT', '数学函数', '<p>在两数值中，若其中存在数组，先将数组自身的元素相乘，返回两数值之和</p><p>例1：SUMPRODUCT([2,2,3],[1,2,3])<br/>结果：18</p><p>例2：SUMPRODUCT([2,2,3],2)</p><p>结果：14</p>', '[2]', 0, 1, 'def SUMPRODUCT(x,y){def result={a -> a.collect().stream().reduce(1, {sum, item -> sum * item}); }; return result.call(x)+result.call(y)}', 'number');
INSERT INTO `function_base` VALUES (32, 'NUMBERCOMP', '逻辑函数', '<p>数值组件与数值组件2比较，大于返回1，等于返回0，小于返回-1</p><p>例1：NUMBERCOMP(3,6)<br/></p>', '[2]', 0, 1, 'def NUMBERCOMPARE(x,y){ return x.compareTo(y)}', 'object');
INSERT INTO `function_base` VALUES (33, 'EQ', '逻辑函数', '<p>两个参数比较，相同返回 true，默认忽略大小写，若不忽略，则填写第三个参数true</p><p>例：EQ(&quot;aaa&quot;,&quot;bbb&quot;)<br/></p><p>结果：false</p>', '[2, 3]', 0, 1, 'def EQ(x,y,b=false){ return b==true?x.equals(y):x.equalsIgnoreCase(y)}', 'bool');
INSERT INTO `function_base` VALUES (34, 'IF', '逻辑函数', '<p>判断参数1是否为真；如果为真返回参数2，如果为假则返回数值3</p><p>例1：IF(EQ(&quot;aaa&quot;,&quot;aab&quot;),&quot;bbb&quot;,&quot;ccc&quot;)<br/></p><p>结果：ccc</p>', '[3]', 0, 1, 'def IF(a,x,y){ if(a){return x}else{return y}};', 'object');
INSERT INTO `function_base` VALUES (35, 'ISEMPTY', '逻辑函数', '<p>判断参数是否为空；如果为空，则返回 true；如果不为空则返回 false</p><p>例1：ISEMPTY(&quot;ddd&quot;)<br/></p><p>结果：true</p>', '[1]', 0, 1, 'def ISEMPTY(x){ return x==null?true:x.empty };', 'bool');
INSERT INTO `function_base` VALUES (36, 'INTERSECTI', '集合函数', '<p>计算两个集合的交集</p><p>例1：INTERSECTIONSET([5,6,7,7],[4,4,3,2,5,7])</p><p>结果：[5, 7]</p>', '[2]', 0, 1, 'def INTERSECTIONSET(x,y){ return x.intersect(y) };', 'object');
INSERT INTO `function_base` VALUES (37, 'UNIONSET', '集合函数', '<p>计算两个集合的并集</p><p>例1：UNIONSET([5,6,7,7],[4,4,3,2,5,7])</p><p>结果：[5, 6, 7, 4, 3, 2]</p>', '[2]', 0, 1, 'def UNIONSET(x,y){ return x.plus(y).unique() }', 'object');
INSERT INTO `function_base` VALUES (38, 'DIFFERENCE', '集合函数', '<p>计算两个集合的差集</p><p>例1：DIFFERENCE([5,6,7,7],[4,4,3,2,5,7])</p><p>结果：[6, 4, 3, 2]</p>', '[2]', 0, 1, 'def DIFFERENCESET(x,y){ return x.plus(y).unique().minus(x.intersect(y)) }', 'object');
INSERT INTO `function_base` VALUES (39, 'SUBSET', '集合函数', '<p>计算第二个集合是否第一个集合的子集</p><p>例1：SUBSET([4,4,3,2,5,7],[4,3])</p><p>结果：true</p>', '[2]', 0, 1, 'def SUBSET(arr1,arr2){ return arr1.containsAll(arr2) }', 'bool');
INSERT INTO `function_base` VALUES (40, 'ARRAYGET', '集合函数', '<p>返回数据集中第几个值</p><p>例1：ARRAYGET([4,4,3,2,5,7],5)</p><p>结果：5</p>', '[2]', 0, 1, 'def ARRAYGET(arr,y){ return arr.get(y-1) }', 'object');
INSERT INTO `function_base` VALUES (41, 'LARGE', '集合函数', '<p>返回集合中第几大的值</p><p>例1：ARRAYGET([4,4,3,2,5,7],2)</p><p>结果：5</p>', '[2]', 0, 1, 'def LARGE(arr,x){ return arr.sort{a,b -> return b.compareTo(a)}.unique().get(x-1) }', 'object');
INSERT INTO `function_base` VALUES (42, 'NE', '逻辑函数', '<p>两个参数比较，不相同返回 true，默认忽略大小写，若不忽略，则填写第三个参数true</p><p>例：NE(&quot;aaa&quot;,&quot;bbb&quot;)<br/></p><p>结果：true</p>', '[2, 3]', 0, 1, 'def NE(x,y,b=false){ return !(b==true?x.equals(y):x.equalsIgnoreCase(y)) }', 'bool');
INSERT INTO `function_base` VALUES (43, 'LT', '逻辑函数', '<p>比较两参数值大小，参数1小于参数2返回 true</p><p>例1：LT(5,7)</p><p>结果：true</p>', '[2]', 0, 1, 'def LT(x,y){ return x<y }', 'bool');
INSERT INTO `function_base` VALUES (44, 'GT', '逻辑函数', '<p>比较两参数值大小，参数1大于参数2返回 true</p><p>例1：GT(5,7)</p><p>结果：false</p>', '[2]', 0, 1, 'def GT(x,y){ return x>y }', 'bool');
INSERT INTO `function_base` VALUES (45, 'LE', '逻辑函数', '<p>比较两参数值大小，参数1小于等于参数2返回 true</p><p>例1：LE(5,5)</p><p>结果：true</p>', '[2]', 0, 1, 'def LE(x,y){ return x<=y }', 'bool');
INSERT INTO `function_base` VALUES (46, 'GE', '逻辑函数', '<p>比较两参数值大小，参数1大于等于参数2返回 true</p><p>例1：GE(8,5)</p>', '[2]', 0, 1, 'def GE(x,y){ return x>=y }', 'bool');
INSERT INTO `function_base` VALUES (47, 'AND', '逻辑函数', '<p>当参数组中的所有参数逻辑值为 true 时（逗号隔开的逻辑式子都满足），才返回 true，当参数组中的任何一个参数逻辑值为 false 时，就会返回false。</p><p>例1：AND(true,EQ(&quot;aa&quot;,&quot;aa&quot;),LT(3,5))</p>', '[0]', 1, 1, 'def AND(... x){ return x==null?false:x.every {it==true} }', 'bool');
INSERT INTO `function_base` VALUES (48, 'OR', '逻辑函数', '<p>在参数组中，任何一个参数逻辑值为 true（逗号隔开的逻辑式子其中一项满足），即返回 true；只有当所有逻辑参数值为 false，才返回 false。</p><p>例1：OR(true,EQ(&quot;aa&quot;,&quot;ccc&quot;),LT(3,5))</p>', '[0]', 1, 1, 'def OR(... x){ return x==null?false:x.any {it==true} }', 'bool');
INSERT INTO `function_base` VALUES (49, 'NOT', '逻辑函数', '<p>对参数逻辑值求反。参数若为 true 则变成 false，参数若为 false 则变为 true。</p><p>例1：OR(true)</p>', '[1]', 0, 1, 'def NOT(x){ return !x }', 'bool');
INSERT INTO `function_base` VALUES (50, 'NOW', '时间函数', '<p>返回当前时间，格式为年-月-日 时-分-秒。</p><p>例1：NOW()</p>', '[0]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def NOW(){ LocalDateTime localDateTime = LocalDateTime.now(); DateTimeFormatter formatter = DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\');return localDateTime.format(formatter) }', 'text');
INSERT INTO `function_base` VALUES (51, 'FLOOR', '数学函数', '<p>将参数1向下舍入（沿绝对值减小的方向）为最接近的参数1的倍数。</p><p>例1：FLOOR(4.76,2)<br/>结果：8<br/>例2：FLOOR(-4.76,2)<br/>结果：-10</p>', '[2]', 0, 1, 'def FLOOR(x,y){  return (Math.floor(x)*y).intValue() };', 'number');
INSERT INTO `function_base` VALUES (52, 'SMALL', '集合函数', '<p>返回数据集中第几个最小值。</p><p>例1：SMALL([4,4,3,2,5,7],2)</p><p>结果：3<br/></p>', '[2]', 0, 1, 'def SMALL(arr,x){ return arr.sort{a,b -> return a.compareTo(b)}.unique().get(x-1) };', 'number');
INSERT INTO `function_base` VALUES (53, 'SETVALUE', '对象函数', '<p>修改对象数据中指定属性的值；第二个参数为要修改的属性名，第三个参数为修改的值。</p><p>例1：SETVALUE(obj,&quot;id&quot;,&quot;20222156&quot;)<br/></p><p>注意：若属性不存在则，在数据中新增属性及值。</p>', '[3]', 0, 1, 'def SETVALUE(arr,x,y){ arr.putAt(x,y);return arr};', 'text');
INSERT INTO `function_base` VALUES (54, 'COPYPROPER', '对象函数', '拷贝第一个对象的属性值到第二个对象。（仅拷贝属性名相同的值）', '[2]', 0, 1, 'def COPYPROPERTIES(source,target) { def jsonSlurper = new groovy.json.JsonSlurper();def obj1 = jsonSlurper.parseText(source);def obj2 = jsonSlurper.parseText(target);obj1.properties.each { key,value -> if (obj2.hasProperty(key) && !(key in [\'class\',\'MetaClass\'])) obj2[key] = value };return new groovy.json.StringEscapeUtils().unescapeJava(new groovy.json.JsonOutput().toJson(obj2)) };', 'text');
INSERT INTO `function_base` VALUES (55, 'GETVALUE', '对象函数', '<p>获取对象数据中指定属性的值。</p><p>例1：GETVALUE(date1,&#39;danWei&#39;)&quot;;</p>', '[2]', 0, 1, 'def GETVALUE(obj,name) { return obj.getAt(name) };', 'object');
INSERT INTO `function_base` VALUES (56, 'LISTADDALL', '集合函数', '<p>将所有参数组合为一个集合返回。</p><p>例1：LISTADDALL(4,5,&quot;aaa&quot;,2,52,5)</p><p>结果：[4, 5, aaa, 2, 52, 5]</p>', '[0]', 1, 1, 'def LISTADDALL(... x) { def list = [];list.addAll(x);return list };', 'object');
INSERT INTO `function_base` VALUES (57, 'LISTGET', '集合函数', '<p>获取集合中指定索引位置的元素。</p><p>例1：LISTGET([4, 5, &quot;aaa&quot;, 2, 52, 5],3)&quot;;</p><p>结果：2</p>', '[2]', 0, 1, 'def LISTGET(arr,x) { return arr.get(x) };', 'object');
INSERT INTO `function_base` VALUES (58, 'LISTADD', '集合函数', '<p>向集合中添加多个元素。</p><p>例1：LISTADD([4, 5, &quot;aaa&quot;, 2, 52, 5],&quot;bbb&quot;)</p><p>结果：[4, 5, aaa, 2, 52, 5, bbb]</p>', '[2]', 1, 1, 'def LISTADD(arr,... x) { def arr1 = arr; arr1.addAll(x);return arr1 }', 'object');
INSERT INTO `function_base` VALUES (59, 'LISTRANDOM', '集合函数', '<p>随机取集合中的某一元素。</p><p>例1：LISTRANDOM([4, 5, &quot;aaa&quot;, 2, 52, 5])</p><p><br/></p>', '[1]', 0, 1, 'def LISTRANDOM(obj) { def index = Math.random()*obj.size() as int;return obj.get(index) };', 'object');
INSERT INTO `function_base` VALUES (60, 'TOJSONOBJ', '对象函数', '<p>将json字符串转换为对象。</p><p>例1：TOJSONOBJ(&quot;{&quot;danWei&quot;:&quot;444&quot;,&quot;zongJia&quot;:555}&quot;)</p><p><br/></p>', '[1]', 0, 1, 'def TOJSONOBJ(x){ return new groovy.json.JsonSlurper().parseText(x)};', 'object');
INSERT INTO `function_base` VALUES (61, 'TIMEFORMAT', '时间函数', '<p>将时间戳转换为指定日期格式。</p><p>例1：TIMEFORMAT(&#39;2022-09-16 16:20:33&#39;,&#39;yyyy-MM-dd&#39;)</p><p><br/></p>', '[2]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter;import cn.hutool.core.date.DateUtil; def TIMEFORMAT(x,y){def newx;if(x instanceof Date){ newx = DateUtil.format(x,\'yyyy-MM-dd HH:mm:ss\')}else{newx = x};LocalDateTime localDate = LocalDateTime.parse(newx,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\')); DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(y);def format = dateTimeFormatter.format(localDate);return format};', 'text');
INSERT INTO `function_base` VALUES (62, 'GETYEAR', '时间函数', '<p>获取指定时间的年份。</p><p>例1：GETYEAR(&#39;2022-09-16 16:20:33&#39;)</p><p><br/></p>', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETYEAR(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getYear()}', 'text');
INSERT INTO `function_base` VALUES (63, 'GETMONTH', '时间函数', '<p>获取指定时间的月份。</p><p>例1：GETMONTH(&#39;2022-09-16 16:20:33&#39;)</p><p><br/></p>', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETMONTH(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getMonthValue()}', 'text');
INSERT INTO `function_base` VALUES (64, 'GETDATE', '时间函数', '<p>获取指定时间的天数，这个月的第几天。</p><p>例1：GETDATE(&#39;2022-09-16 16:20:33&#39;)</p><p><br/></p>', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETDATE(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getDayOfMonth()}', 'text');
INSERT INTO `function_base` VALUES (65, 'GETWEEKDAY', '时间函数', '<p>获取指定时间的星期几。</p><p>例1：GETWEEKDAY(&#39;2022-09-16 16:20:33&#39;)</p><p><br/></p>', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETWEEKDAY(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getDayOfWeek()}', 'text');
INSERT INTO `function_base` VALUES (66, 'COMPARETIME', '时间函数', '<p>比较两个时间的大小，<strong>日期参数1</strong>大于<strong>日期参数2</strong>返回 true，否则返回 false。</p><p>例1：COMPARETIME(&#39;2022-09-16 16:20:33&#39;,&#39;2022-09-12 19:20:33&#39;)</p><p><br/></p>', '[2]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter;import cn.hutool.core.date.DateUtil; def COMPARETIME(x,y){def newx;def newy;if(x instanceof Date){ newx = DateUtil.format(x,\'yyyy-MM-dd HH:mm:ss\')}else{newx = x};if(y instanceof Date){ newy = DateUtil.format(y,\'yyyy-MM-dd HH:mm:ss\')}else{newy = y}; LocalDateTime localDate1 = LocalDateTime.parse(newx,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));LocalDateTime localDate2 = LocalDateTime.parse(newy,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return  localDate1.isAfter(localDate2)};', 'bool');
INSERT INTO `function_base` VALUES (67, 'TIMEBETWEEN', '时间函数', '<p>返回两个日期之间相差的天、月、年、小时等。</p><p>第三个参数使用不同的参数返回同的相差类型：<br/>天（DAYS）、<br/>周（WEEKS）、<br/>月（MONTHS）、<br/>年（YEARS）、<br/>小时（HOURS）、<br/>分钟（MINUTES）、<br/>秒（SECONDS）。</p><p>例1：TIMEBETWEEN(&#39;2022-09-16 16:20:33&#39;,&#39;2022-09-12 19:20:33&#39;,&#39;DAYS&#39;)</p><p>结果：3<br/></p><p>例2：TIMEBETWEEN(&#39;2022-09-16 16:20:33&#39;,&#39;2022-09-12 19:20:33&#39;,&#39;HOURS&#39;)<br/>结果：93</p>', '[3]', 0, 1, 'import java.time.LocalDateTime;import java.time.temporal.ChronoUnit;import java.time.format.DateTimeFormatter; import java.time.Period;import cn.hutool.core.date.DateUtil; def TIMEBETWEEN(x,y,z){def newx;def newy;if(x instanceof Date){ newx = DateUtil.format(x,\'yyyy-MM-dd HH:mm:ss\')}else{newx = x};if(y instanceof Date){ newy = DateUtil.format(y,\'yyyy-MM-dd HH:mm:ss\')}else{newy = y};LocalDateTime localDate1 = LocalDateTime.parse(newx,DateTimeFormatter.ofPattern(\"yyyy-MM-dd HH:mm:ss\"));LocalDateTime localDate2 = LocalDateTime.parse(newy,DateTimeFormatter.ofPattern(\"yyyy-MM-dd HH:mm:ss\"));return ChronoUnit.valueOf(z).between(localDate1,localDate2).abs() }', 'number');
INSERT INTO `function_base` VALUES (68, 'CONTAIN', '集合函数', '<p>返回参数一集合中是否包含参数二，包含返回true，不包含返回false。</p><p>例1：CONTAIN([&quot;bbb&quot;,4,5,6,7],&quot;aa&quot;)</p>', '[2]', 0, 1, 'def CONTAIN(x,y){ return x==null?false:x.containsAll(y) };', 'bool');
INSERT INTO `function_base` VALUES (69, 'LISTSUM', '集合函数', '<p>返回集合中所有元素的累加和。</p><p>例1：LISTSUM([4,5,6,7])</p><p>结果：22<br/>注意：可用于<strong><span style=\"color: rgb(255, 0, 0);\">表格中某列数据</span></strong>汇总求和运算。</p>', '[1]', 0, 1, 'def LISTSUM(x){ return x.sum()};', 'number');
INSERT INTO `function_base` VALUES (70, 'ISVALIDINTEGER', '逻辑函数', '<p>判断参数是否为数字。</p><p>例1：ISVALIDINTEGER(&quot;bbb&quot;)</p><p>注意：<span style=\"color: rgb(255, 0, 0);\">也可用于判断数字类型字段是否为空</span></p>', '[1]', 0, 1, 'def ISVALIDINTEGER(value) {value.toString().isInteger()};', 'bool');
INSERT INTO `function_base` VALUES (71, 'ISNOTEMPTY', '逻辑函数', '<p>判断字符类型参数是否不为空，为空返回false，不为空返回true。</p><p>例1：ISNOTEMPTY(&quot;bbb&quot;)</p>', '[1]', 0, 1, 'def ISNOTEMPTY(x){ return x==null?false:!x.empty };', 'bool');
INSERT INTO `function_base` VALUES (72, 'DENGYU', '逻辑函数', '<p>判断两数值类型参数是否相等。</p><p>例1：DENGYU(4,5)</p>', '[2]', 0, 1, 'def DENGYU(x,y){ return x==y};', 'bool');
INSERT INTO `function_base` VALUES (73, 'CONVERTDIGIT', '数字函数', '<p>将金钱数转换为人民币大写形式。</p><p>例1：CONVERTDIGIT(7888.65)<br/>结果：肆万捌仟陆佰肆拾捌元伍角陆分</p>', '[1]', 0, 1, 'import cn.hutool.core.convert.Convert;def CONVERTDIGIT(x) {def digitUppercase = Convert.digitToChinese(x);return digitUppercase};', 'text');
INSERT INTO `function_base` VALUES (74, 'OBJLISTSUM', '集合函数', '<p>返回参数1[对象数组]中对象的【某个属性】的累加和。</p><p>例:OBJLISTSUM([obj1,obj2,obj3],&#39;金额&#39;)。</p><p>注意：第一个参数为对象数组；第二个参数为对象中要汇总计算的属性名，用双引号包围。</p>', '[2]', 0, 1, 'def OBJLISTSUM(x,y) {return x.getAt(y).sum()};', 'number');
INSERT INTO `function_base` VALUES (75, 'GETCHINESEZODIAC', '时间函数', '<p>根据身份证号自动计算生肖。</p><p>例如：GETCHINESEZODIAC(&#39;549874455212544412&#39;)。</p><p>注意：参数为字符串类型。</p><p><br/></p>', '[1]', 0, 1, 'import cn.hutool.core.date.DateUtil;import cn.hutool.core.util.IdcardUtil; def GETCHINESEZODIAC(x) { def arr1 = IdcardUtil.getYearByIdCard(x); return DateUtil.getChineseZodiac(arr1) };', 'text');
INSERT INTO `function_base` VALUES (76, 'GETZODIAC', '时间函数', '<p>根据身份证号自动计算星座。</p><p>例如：GETZODIAC(&#39;549874455212544412&#39;)。</p><p>注意：参数为字符串类型</p>', '[1]', 0, 1, 'import cn.hutool.core.date.DateUtil;import cn.hutool.core.util.IdcardUtil; def GETZODIAC(x) { def month = IdcardUtil.getMonthByIdCard(x);def day = IdcardUtil.getDayByIdCard(x); return DateUtil.getZodiac(month,day) };', 'text');
INSERT INTO `function_base` VALUES (77, 'QUARTER', '时间函数', '<p>获取日期所在的季度。</p><p>例如：QUARTER(‘2022-09-15 12:34:23’)。</p><p>注意：返回的季度从1开始计数。</p>', '[1]', 0, 1, 'import cn.hutool.core.date.DatePattern;import cn.hutool.core.date.DateTime;def QUARTER(x) { DateTime dateTime1 = new DateTime(x, DatePattern.NORM_DATETIME_FORMAT);return dateTime1.quarter(); };', 'number');
INSERT INTO `function_base` VALUES (78, 'DAYOFFSET', '时间函数', '<p>日期增加或减少指定天数。</p><p>例如：DAYOFFSET(‘2022-09-15 12:34:23’,20)。</p><p>注意：第二个参数为负数时未减少天数</p>', '[1]', 0, 1, 'import cn.hutool.core.date.DateUtil;import cn.hutool.core.date.DateField;import cn.hutool.core.date.DateTime;def DAYOFFSET(x,y) { Date date = DateUtil.parse(x);DateTime newDate = DateUtil.offsetDay(date, y);return newDate.toString() };', 'text');
INSERT INTO `function_base` VALUES (79, 'ARRAYJOIN', '集合函数', '<p>使用间隔符将一个字符串数组连接，转为字符串</p><p>例：ARRAYJOIN(String[],&quot;-&quot;)</p>', '[2]', 0, 1, 'import cn.hutool.core.util.ArrayUtil;def ARRAYJOIN(x,y){ def newlist = (String[])x.toArray(); return ArrayUtil.join(newlist,y)};', 'text');
INSERT INTO `function_base` VALUES (80, 'CONVERTINT', '数字函数', '<p>将字符串转换为整型(整数)<br/>例：CONVERTINT(&#39;1356456&#39;)<br/></p>', '[1]', 0, 1, 'def CONVERTINT(x) {return Integer.valueOf(x)};', 'number');
INSERT INTO `function_base` VALUES (81, 'CONVERTDOUBLE', '数字函数', '<p>将字符串转换为浮点类型（小数）<br/>例：CONVERTDOUBLE(&#39;135.1324&#39;)<br/></p>', '[1]', 0, 1, 'def CONVERTDOUBLE(x) {return Double.valueOf(x)};', 'number');
INSERT INTO `function_base` VALUES (82, 'COMPAREDATE', '时间函数', '<p>比较两个日期的大小，<strong>日期参数1</strong>大于<strong>日期参数2</strong>返回 true，否则返回 false。</p><p>例1：COMPAREDATE(&#39;2022-09-16&#39;,&#39;2022-09-12&#39;)</p><p><br/></p>', '[2]', 0, 1, 'import java.time.LocalDate;import java.time.format.DateTimeFormatter;import cn.hutool.core.date.DateUtil; def COMPAREDATE(x,y){def newx;def newy;if(x instanceof Date){ newx = DateUtil.format(x,\'yyyy-MM-dd\')}else{newx = x};if(y instanceof Date){ newy = DateUtil.format(y,\'yyyy-MM-dd\')}else{newy = y}; LocalDate localDate1 = LocalDate.parse(newx,DateTimeFormatter.ofPattern(\'yyyy-MM-dd\'));LocalDate localDate2 = LocalDate.parse(newy,DateTimeFormatter.ofPattern(\'yyyy-MM-dd\'));return  localDate1.isAfter(localDate2)};', 'bool');
INSERT INTO `function_base` VALUES (83, 'DATEFORMAT', '时间函数', '<p>将日期转换为指定日期格式。</p><p>例1：DATEFORMAT(&#39;2022-09-16&#39;,&#39;yyyy-MM-dd HH:mm:ss&#39;)</p><p><br/></p>', '[2]', 0, 1, 'import cn.hutool.core.date.DateUtil; def DATEFORMAT(x,y){def newx;if(!(x instanceof Date)){ newx = DateUtil.parse(x)}else{newx = x};DateUtil.format(newx, y);};', 'text');
INSERT INTO `function_base` VALUES (84, 'DATEPARSE', '时间函数', '<p>自动识别时间格式，将日期转换为指定日期格式。<br/>例1：DATEPARSE(&quot;2022-09-05T03:21:23.825Z&quot;,&quot;yyyy-MMM-dd&quot;)</p>', '[2]', 0, 1, 'import cn.hutool.core.date.DateUtil; def DATEPARSE(x,y){def datex = DateUtil.parse(x);def format = DateUtil.format(datex,y);return format}', 'text');
INSERT INTO `function_base` VALUES (85, 'ISNUMBER', '逻辑函数', '<p>判断参数是否为数字类型。</p><p>例1：ISNUMBER(&quot;bbb&quot;)</p>', '[1]', 0, 1, 'def ISNUMBER(value) {value.toString().isNumber()};', 'bool');
INSERT INTO `function_base` VALUES (86, 'DECIMALFORMAT', '数学函数', '<p>格式化带有小数的数字，第一个参数为要格式化的数字，第二个参数为格式：</p><p style=\"text-indent: 2em;\">格式中主要以 # 和 0 两种占位符号来指定数字长度。0 表示如果位数不足则以 0 填充，# 表示只要有可能就把数字拉上这个位置。</p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">0 ------ 取一位整数</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">0.00 ------ 取一位整数和两位小数</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">00.000 ------ 取两位整数和三位小数</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\"># ------ 取所有整数部分</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">#.##% ------ 以百分比方式计数，并取两位小数</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">#.#####E0 ------ 显示为科学计数法，并取五位小数</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">,### ------ 每三位以逗号进行分隔，例如：299,792,458</span></p><p style=\"text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">光速大小为每秒,###米 ------ 将格式嵌入文本</span></p>', '[2]', 0, 1, 'import cn.hutool.core.util.NumberUtil;def DECIMALFORMAT(x,y) {return NumberUtil.decimalFormat(y,x)};', 'text');
COMMIT;

-- ----------------------------
-- Table structure for function_business
-- ----------------------------
DROP TABLE IF EXISTS `function_business`;
CREATE TABLE `function_business` (
  `id` char(50) NOT NULL,
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用ID',
  `design_id` char(50) DEFAULT NULL COMMENT '设计id',
  `business_id` varchar(255) DEFAULT NULL COMMENT '业务id',
  `use_case` varchar(255) DEFAULT NULL COMMENT '表达式使用场景',
  `body` text COMMENT '表达式',
  `related_ids` json DEFAULT NULL COMMENT '表达式引用关系',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by_id` varchar(255) DEFAULT NULL COMMENT '创建人id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `parent_type` varchar(255) DEFAULT NULL COMMENT '上级组件类型,可能为空',
  `type` varchar(255) DEFAULT NULL COMMENT '组件类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `design_id` (`design_id`,`use_case`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务编辑好的执行';

-- ----------------------------
-- Records of function_business
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_datasource
-- ----------------------------
DROP TABLE IF EXISTS `gen_datasource`;
CREATE TABLE `gen_datasource` (
  `id` char(50) NOT NULL COMMENT 'id',
  `db_type` varchar(200) DEFAULT NULL COMMENT '数据库类型 MySQL、Oracle、PostgreSQL',
  `data_base_name` varchar(50) DEFAULT NULL COMMENT '数据库名称',
  `conn_name` varchar(200) NOT NULL COMMENT '连接名',
  `conn_url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据源管理';

-- ----------------------------
-- Records of gen_datasource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_info
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_info`;
CREATE TABLE `gen_table_info` (
  `id` char(50) NOT NULL COMMENT 'id',
  `table_name` varchar(200) DEFAULT NULL COMMENT '表名',
  `class_name` varchar(200) DEFAULT NULL COMMENT '类名',
  `table_comment` varchar(200) DEFAULT NULL COMMENT '功能名',
  `author` varchar(200) DEFAULT NULL COMMENT '作者',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `package_name` varchar(200) DEFAULT NULL COMMENT '项目包名',
  `version` varchar(200) DEFAULT NULL COMMENT '项目版本号',
  `backend_path` varchar(500) DEFAULT NULL COMMENT '后端生成路径',
  `frontend_path` varchar(500) DEFAULT NULL COMMENT '前端生成路径',
  `module_name` varchar(200) DEFAULT NULL COMMENT '模块名',
  `sub_module_name` varchar(200) DEFAULT NULL COMMENT '子模块名',
  `datasource_id` bigint(255) DEFAULT NULL COMMENT '数据源ID',
  `baseclass_id` bigint(20) DEFAULT NULL COMMENT '基类ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dependency_version` varchar(10) DEFAULT NULL COMMENT '基础依赖版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `table_name` (`table_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成表';

-- ----------------------------
-- Records of gen_table_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for im_channel_data
-- ----------------------------
DROP TABLE IF EXISTS `im_channel_data`;
CREATE TABLE `im_channel_data` (
  `id` char(50) NOT NULL,
  `server_id` char(50) NOT NULL COMMENT '服务id',
  `user_id` char(50) DEFAULT NULL COMMENT '用户id',
  `store_type` varchar(20) NOT NULL COMMENT '存储方式',
  `store_code` varchar(255) NOT NULL COMMENT '存储唯一编号',
  `business_type` varchar(20) NOT NULL COMMENT '业务类型',
  `expand` json DEFAULT NULL COMMENT '扩展字段',
  `process_status` tinyint(1) DEFAULT NULL COMMENT '0-未处理，1-已处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='IM服务连接相关的数据(服务关闭后，需要处理)';

-- ----------------------------
-- Records of im_channel_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for im_chat_group_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_group_message`;
CREATE TABLE `im_chat_group_message` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `group_id` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '群组id',
  `from_user_id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '发送消息用户id',
  `message` json NOT NULL COMMENT '聊天消息体',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_id` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_group_id` (`group_id`) USING BTREE,
  KEY `idx_from_user_id` (`from_user_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='群聊全量消息表';

-- ----------------------------
-- Records of im_chat_group_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for im_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_message`;
CREATE TABLE `im_chat_message` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `from_user_id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '发送消息用户id',
  `to_user_id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '接收消息用户id',
  `message` json NOT NULL COMMENT '聊天消息体',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_id` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_to_user_id` (`to_user_id`) USING BTREE,
  KEY `idx_from_user_id` (`from_user_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='私聊全量消息表';

-- ----------------------------
-- Records of im_chat_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for im_notify_message
-- ----------------------------
DROP TABLE IF EXISTS `im_notify_message`;
CREATE TABLE `im_notify_message` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `notify_type` tinyint(1) NOT NULL COMMENT '0-广播，1-组通知，2-精确通知',
  `from_user_id` char(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '发送消息用户id(若是系统发送，则默认为0)',
  `group_ids` json DEFAULT NULL COMMENT '目标群组id(JSON数组)',
  `user_ids` json DEFAULT NULL COMMENT '目标用户id(JSON数组)',
  `message` json NOT NULL COMMENT '聊天消息体',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_id` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_notify_type` (`notify_type`) USING BTREE,
  KEY `idx_from_user_id` (`from_user_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='IM通知全量消息表';

-- ----------------------------
-- Records of im_notify_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for im_server_info
-- ----------------------------
DROP TABLE IF EXISTS `im_server_info`;
CREATE TABLE `im_server_info` (
  `id` char(50) NOT NULL,
  `server_id` char(50) NOT NULL COMMENT '服务id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `heartbeat_time` datetime DEFAULT NULL COMMENT '心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='im服务信息';

-- ----------------------------
-- Records of im_server_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_app
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app`;
CREATE TABLE `jvs_app` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '未命名' COMMENT '项目名称',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用凭证',
  `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用图标',
  `logo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '/jvs-ui-public/img/app.png' COMMENT '应用logo',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(40) DEFAULT NULL COMMENT '更新人',
  `tenant_id` char(50) NOT NULL DEFAULT '1' COMMENT '所属租户',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门ID',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人',
  `description` char(255) DEFAULT '没有添加描述' COMMENT '描述',
  `type` varchar(255) DEFAULT NULL COMMENT '项目分类',
  `job_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位ID',
  `is_deploy` tinyint(1) DEFAULT '0' COMMENT '发布状态',
  `role` json DEFAULT NULL COMMENT '权限',
  `types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设计分组',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `imgs` json DEFAULT NULL COMMENT '展示的图片',
  `long_text` longtext COMMENT '详细描述',
  `platform` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '平台名称',
  `free` tinyint(1) DEFAULT NULL COMMENT '是否免费',
  `price` int(5) DEFAULT NULL COMMENT '售价',
  `authorization_key` longtext COMMENT '应用安装的时候授权的key',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `create_by_id` (`create_by_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目表';

-- ----------------------------
-- Records of jvs_app
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_app_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app_template`;
CREATE TABLE `jvs_app_template` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目名称',
  `type` varchar(60) CHARACTER SET utf8mb4 DEFAULT '未分配类型' COMMENT '项目分类',
  `icon` varchar(512) COLLATE utf8mb4_bin DEFAULT '/jvs-ui-public/img/logo.jpg' COMMENT '应用图标',
  `logo` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用logo',
  `imgs` json DEFAULT NULL COMMENT '展示的图片',
  `data` longtext COLLATE utf8mb4_bin COMMENT '应用数据,迁移到data表中',
  `description` longtext CHARACTER SET utf8mb4 COMMENT '描述',
  `types` json NOT NULL COMMENT '设计分组',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '删除状态',
  `version` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '版本应用的版本,前端传递  如果不一样的版本号，可能导致无法使用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `size` int(10) DEFAULT NULL COMMENT '模板大小',
  `platform` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '平台名称',
  `free` tinyint(1) DEFAULT NULL COMMENT '是否免费',
  `price` int(5) DEFAULT NULL COMMENT '售价',
  `primitive` tinyint(1) DEFAULT NULL COMMENT '是否原生应用,原生应用，只做介绍，和联系，不做一键安装应用',
  `deploy` tinyint(1) DEFAULT '0' COMMENT '是否发布,需要通过人工审核，默认发布到模板，都是需要将其把应用发布到公网中才能使用，自己不能发布应用',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='项目_模板';

-- ----------------------------
-- Records of jvs_app_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_app_template_config
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app_template_config`;
CREATE TABLE `jvs_app_template_config` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `description` longtext CHARACTER SET utf8mb4 COMMENT '描述',
  `version` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '版本应用的版本,前端传递  如果不一样的版本号，可能导致无法使用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板名称',
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模板配置url',
  `img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='应用模板配置';

-- ----------------------------
-- Records of jvs_app_template_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_app_template_data
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app_template_data`;
CREATE TABLE `jvs_app_template_data` (
  `id` char(50) NOT NULL COMMENT '主键',
  `template_id` char(50) DEFAULT NULL COMMENT '模板id',
  `sort` int(6) DEFAULT NULL COMMENT '数据排序',
  `data` longtext COMMENT '加密数据串',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `template_id` (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='应用模板数据';

-- ----------------------------
-- Records of jvs_app_template_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_app_url
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app_url`;
CREATE TABLE `jvs_app_url` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `jvs_app_id` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用ID',
  `type` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型',
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `icon` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `url` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面链接',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新人',
  `tenant_id` char(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '1' COMMENT '所属租户',
  `dept_id` char(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '部门ID',
  `create_by_id` char(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  `role` json DEFAULT NULL COMMENT '权限',
  `sort` smallint(6) unsigned zerofill DEFAULT '000000' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='自定义外部页面';

-- ----------------------------
-- Records of jvs_app_url
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_chart_component
-- ----------------------------
DROP TABLE IF EXISTS `jvs_chart_component`;
CREATE TABLE `jvs_chart_component` (
  `id` char(50) NOT NULL,
  `component_json` json DEFAULT NULL COMMENT '数据json 数据来源',
  `type` enum('LineChart','HistogramChart','BarChart','Pie','ScatterChart','FunnelChart','AreaChart','DashBoardChart','DataCard','InfoCard','TimeLineChart') DEFAULT NULL COMMENT '组件',
  `page_id` char(50) DEFAULT NULL COMMENT '数据ID',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `appid` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据来源设计表';

-- ----------------------------
-- Records of jvs_chart_component
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_chart_page
-- ----------------------------
DROP TABLE IF EXISTS `jvs_chart_page`;
CREATE TABLE `jvs_chart_page` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(20) DEFAULT '未命名图表' COMMENT '名称',
  `is_deploy` tinyint(1) DEFAULT '1' COMMENT '发布状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(40) DEFAULT NULL COMMENT '更新人',
  `tenant_id` char(50) NOT NULL DEFAULT '1' COMMENT '所属租户',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门ID',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人',
  `description` char(255) DEFAULT '没有添加描述' COMMENT '描述',
  `job_id` char(50) DEFAULT NULL COMMENT '岗位ID',
  `filter_json` json DEFAULT NULL COMMENT '筛选条件',
  `data_json` json DEFAULT NULL COMMENT '数据json',
  `supported_client_type` enum('all','pc','mobile') DEFAULT NULL COMMENT '多端支持',
  `check_login` tinyint(1) DEFAULT '1' COMMENT '是否校验登录',
  `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'icon-gongyingshangjianlirenyuan1' COMMENT '图标',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用',
  `type` varchar(60) DEFAULT NULL COMMENT '分类',
  `role` json DEFAULT NULL COMMENT '权限集',
  `role_type` tinyint(1) DEFAULT '1' COMMENT '权限类型',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `timer_request` varchar(10) CHARACTER SET utf16le DEFAULT '0' COMMENT '排序',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='页面配置';

-- ----------------------------
-- Records of jvs_chart_page
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_crud_association
-- ----------------------------
DROP TABLE IF EXISTS `jvs_crud_association`;
CREATE TABLE `jvs_crud_association` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(300) DEFAULT '未命名表单' COMMENT '按钮名称',
  `permissionFlag` varchar(300) DEFAULT '未命名表单' COMMENT '按钮名称',
  `design_id` char(50) NOT NULL DEFAULT '1' COMMENT '设计id、表单、列表页',
  `data` json DEFAULT NULL COMMENT '赋值字段集',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用',
  `data_model_id` char(50) DEFAULT NULL COMMENT '数据模型ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据规则配置';

-- ----------------------------
-- Records of jvs_crud_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_crud_form
-- ----------------------------
DROP TABLE IF EXISTS `jvs_crud_form`;
CREATE TABLE `jvs_crud_form` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(300) DEFAULT '未命名表单' COMMENT '表单唯一值',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `view_json` longtext COMMENT '渲染json',
  `classify` enum('normalForm','flowable') DEFAULT 'normalForm' COMMENT '表单类型：多级，普通，详情，流程，步骤',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` char(255) DEFAULT '没有添加描述' COMMENT '表单描述',
  `is_deploy` tinyint(1) DEFAULT '1' COMMENT '是否部署',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门ID',
  `job_id` char(50) DEFAULT NULL COMMENT '岗位ID',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人',
  `supported_client_type` enum('all','pc','mobile') DEFAULT NULL COMMENT '支持的客户端类型',
  `check_login` tinyint(1) DEFAULT '1' COMMENT '是否校验登录, 默认为true',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用',
  `role` json DEFAULT NULL COMMENT '权限集',
  `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'icon-shenfenrenzheng' COMMENT '图标',
  `type` varchar(60) DEFAULT NULL COMMENT '分类',
  `role_type` tinyint(1) DEFAULT '1' COMMENT '权限类型',
  `data_model_id` char(50) DEFAULT NULL COMMENT '数据模型ID',
  `callback_url` varchar(255) DEFAULT NULL COMMENT '数据回调地址',
  `callback_async` tinyint(1) DEFAULT NULL COMMENT '是否为异步回调',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `mobile_code` varchar(255) DEFAULT NULL COMMENT '移动端code码',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `tag_setting` json DEFAULT NULL COMMENT '二维码标签设置',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='表单配置项';

-- ----------------------------
-- Records of jvs_crud_form
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_crud_page
-- ----------------------------
DROP TABLE IF EXISTS `jvs_crud_page`;
CREATE TABLE `jvs_crud_page` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL DEFAULT '未命名列表' COMMENT '页面名称',
  `type` varchar(60) DEFAULT NULL COMMENT '分类',
  `view_json` longtext COMMENT '渲染json',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `is_deploy` tinyint(1) DEFAULT '1' COMMENT '是否已发布',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(40) DEFAULT NULL COMMENT '更新人',
  `code` varchar(64) DEFAULT NULL COMMENT '唯一code',
  `description` char(255) DEFAULT NULL COMMENT '描述',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门ID',
  `job_id` char(50) DEFAULT NULL COMMENT '岗位ID',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用',
  `role` json DEFAULT NULL COMMENT '权限集',
  `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'icon-gongyingshangjianlirenyuan1' COMMENT '图标',
  `role_type` tinyint(1) DEFAULT '1' COMMENT '权限类型',
  `data_model_id` char(50) DEFAULT NULL COMMENT '数据模型ID',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `step_data_permission` tinyint(1) DEFAULT NULL COMMENT '是否跳过数据权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='列表的列表配置项';

-- ----------------------------
-- Records of jvs_crud_page
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_event
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_event`;
CREATE TABLE `jvs_data_event` (
  `id` bigint(20) NOT NULL COMMENT '事件id',
  `app_id` char(40) NOT NULL COMMENT '应用id',
  `model_id` varchar(255) NOT NULL COMMENT '数据模型id',
  `design_id` char(40) NOT NULL COMMENT '套件设计id',
  `before_rule_id` char(40) DEFAULT NULL COMMENT '逻辑设计id(前置)',
  `before_rule_enable` tinyint(1) DEFAULT '0',
  `after_rule_id` char(40) DEFAULT NULL COMMENT '逻辑设计id(后置)',
  `after_rule_enable` tinyint(1) DEFAULT '0',
  `event_type` enum('DATA_NEW','DATA_UPDATE','DATA_DELETE','DATA_IMPORT') NOT NULL COMMENT '事件类型',
  `call_back_url` varchar(255) DEFAULT NULL COMMENT '事件回调地址(该字段已弃用, 事件的处理交给逻辑设计)',
  `async` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否异步回调(该字段已弃用, 是否异步由逻辑设计决定)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by_id` varchar(255) DEFAULT NULL COMMENT '创建人id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `event_name` varchar(50) DEFAULT NULL COMMENT '事件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据模型-事件';

-- ----------------------------
-- Records of jvs_data_event
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_field
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_field`;
CREATE TABLE `jvs_data_field` (
  `id` bigint(20) NOT NULL COMMENT '数据字段id',
  `model_id` varchar(255) DEFAULT NULL COMMENT '数据模型id',
  `design_id` char(40) DEFAULT NULL COMMENT '设计ID',
  `design_type` enum('form','page','workflow') DEFAULT NULL COMMENT '设计类型',
  `field_key` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `field_name` varchar(255) DEFAULT NULL COMMENT '显示名称',
  `field_type` varchar(255) DEFAULT NULL COMMENT '字段类型',
  `enabled_query_types` json DEFAULT NULL COMMENT '支持的查询类型',
  `design_json` json DEFAULT NULL COMMENT '字段设计数据(Json格式)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by_id` varchar(255) DEFAULT NULL COMMENT '创建人id',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `data_model_id` char(20) DEFAULT NULL COMMENT '关联表单的设计id值',
  `is_export` tinyint(1) DEFAULT NULL COMMENT '是否可导出',
  `data_linkage_model_id` char(20) DEFAULT NULL COMMENT '数据联动模型id',
  `linkage_field_key` varchar(255) DEFAULT NULL COMMENT '数据联动显示的字段名',
  `data_linkage_list` json DEFAULT NULL COMMENT '数据联动的条件',
  `encryption` tinyint(1) DEFAULT NULL COMMENT '是否脱敏',
  `encryption_express` varchar(255) DEFAULT NULL COMMENT '正则表达式',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `model_id` (`model_id`) USING BTREE COMMENT '模型字段',
  KEY `appid` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据模型-字段';

-- ----------------------------
-- Records of jvs_data_field
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_id
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_id`;
CREATE TABLE `jvs_data_id` (
  `model_id` bigint(20) NOT NULL COMMENT '数据模型id',
  `current_id` int(11) DEFAULT NULL COMMENT '当前序号(不重置)',
  `current_year_id` int(11) DEFAULT NULL COMMENT '当前序号(按年重置)',
  `current_month_id` int(11) DEFAULT NULL COMMENT '当前序号(按月重置)',
  `current_day_id` int(11) DEFAULT NULL COMMENT '当前序号(按天重置)',
  `current_hour_id` int(11) DEFAULT NULL COMMENT '当前序号(按小时重置)',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据模型-自增序号';

-- ----------------------------
-- Records of jvs_data_id
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_log`;
CREATE TABLE `jvs_data_log` (
  `id` bigint(20) NOT NULL COMMENT '日志id',
  `data_id` bigint(20) DEFAULT NULL COMMENT '数据id',
  `version` int(11) DEFAULT NULL COMMENT '数据版本',
  `content` json DEFAULT NULL COMMENT '数据内容(Json格式)',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by_id` varchar(255) DEFAULT NULL COMMENT '修改人id',
  `operator` text COMMENT '操作记录',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据模型-日志';

-- ----------------------------
-- Records of jvs_data_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_model
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_model`;
CREATE TABLE `jvs_data_model` (
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用id',
  `design_type` varchar(255) DEFAULT NULL COMMENT '首次创建的设计套件类型',
  `design_id` char(50) DEFAULT NULL COMMENT '首次创建的设计套件id',
  `name` varchar(255) DEFAULT '未命名' COMMENT '名称',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `id` bigint(20) NOT NULL COMMENT '数据模型id',
  `setting` json DEFAULT NULL COMMENT '设置信息(Json数据结构)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `workflow_id` varchar(255) DEFAULT NULL,
  `enable_workflow` tinyint(1) DEFAULT '0' COMMENT '是否启用工作流',
  `index_fields` json DEFAULT NULL COMMENT '索引字段集',
  `role` json DEFAULT NULL COMMENT '数据权限',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_app_id` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据模型';

-- ----------------------------
-- Records of jvs_data_model
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_notice
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_notice`;
CREATE TABLE `jvs_data_notice` (
  `id` char(50) NOT NULL,
  `template_type` varchar(20) DEFAULT NULL COMMENT '模板类型：system-系统消息模板，model-模型消息模板',
  `model_id` char(50) DEFAULT NULL COMMENT '数据模型id',
  `name` varchar(50) DEFAULT NULL COMMENT '通知名称',
  `trigger_setting` json DEFAULT NULL COMMENT '触发设置',
  `receiver` json DEFAULT NULL COMMENT '接收者',
  `title_html` longtext COMMENT '标题',
  `content_html` longtext COMMENT '内容',
  `extend` json DEFAULT NULL COMMENT '扩展参数',
  `variable` json DEFAULT NULL COMMENT '模板变量',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '0-禁用，1-启用 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='消息通知';

-- ----------------------------
-- Records of jvs_data_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_design_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_design_template`;
CREATE TABLE `jvs_design_template` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `category` varchar(255) DEFAULT NULL COMMENT '模板分类',
  `type` varchar(255) DEFAULT NULL COMMENT '套件类型',
  `cover` varchar(255) DEFAULT NULL COMMENT '模板封面图片',
  `data` longblob COMMENT '模板数据',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jvs_design_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_h5_design
-- ----------------------------
DROP TABLE IF EXISTS `jvs_h5_design`;
CREATE TABLE `jvs_h5_design` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名字',
  `enable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `design_drawing_json` json DEFAULT NULL COMMENT '设计图',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门id',
  `job_id` char(11) DEFAULT NULL COMMENT '岗位ID',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用id',
  `type` varchar(255) DEFAULT NULL COMMENT '类型分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='H5设计';

-- ----------------------------
-- Records of jvs_h5_design
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_log`;
CREATE TABLE `jvs_log` (
  `id` char(50) NOT NULL COMMENT 'id',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` char(50) DEFAULT NULL COMMENT '创建人',
  `description` char(255) DEFAULT '没有添加描述' COMMENT '操作内容',
  `content` json DEFAULT NULL COMMENT '操作数据',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用Id',
  `jvs_app_name` char(50) DEFAULT NULL COMMENT '应用名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `jvsappId` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='应用操作日志';

-- ----------------------------
-- Records of jvs_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_print_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_print_template`;
CREATE TABLE `jvs_print_template` (
  `id` char(50) NOT NULL,
  `design_id` char(50) NOT NULL COMMENT '关联设计id',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `design_type` tinyint(2) DEFAULT '0' COMMENT '模板类型：0-自定义模板，1-word',
  `design` longtext COMMENT '模板设计JSON',
  `file_url` varchar(1024) DEFAULT NULL COMMENT '模板文件地址',
  `file_type` varchar(10) DEFAULT NULL COMMENT '文件类型',
  `enable_flag` tinyint(1) DEFAULT '1' COMMENT '0-禁用，1-启用',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_design_id` (`design_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='打印模板';

-- ----------------------------
-- Records of jvs_print_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_regexp
-- ----------------------------
DROP TABLE IF EXISTS `jvs_regexp`;
CREATE TABLE `jvs_regexp` (
  `id` char(50) NOT NULL COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '正则名称',
  `expression` varchar(1024) DEFAULT NULL COMMENT '正则表达式',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `unique_name` varchar(255) DEFAULT NULL COMMENT 'UUID,该值唯一且永不改变,用作被引用时的key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='正则表达式,用于在数据表设计时，可以动态修改的模块';

-- ----------------------------
-- Records of jvs_regexp
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_screen
-- ----------------------------
DROP TABLE IF EXISTS `jvs_screen`;
CREATE TABLE `jvs_screen` (
  `jvs_app_id` varchar(255) DEFAULT NULL COMMENT '应用id',
  `design_type` varchar(255) DEFAULT NULL COMMENT '首次创建的设计套件类型',
  `design_id` char(50) DEFAULT NULL COMMENT '首次创建的设计套件id',
  `name` varchar(255) DEFAULT '未命名' COMMENT '名称',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `id` char(50) NOT NULL COMMENT '数据模型id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `role` json DEFAULT NULL COMMENT '数据权限',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门ID',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人',
  `job_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位ID',
  `width` int(4) DEFAULT '1920',
  `height` int(4) DEFAULT '1080',
  `img_url` varchar(255) DEFAULT NULL,
  `background` varchar(12) DEFAULT NULL,
  `components` json DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` char(50) DEFAULT NULL,
  `update_by` char(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '类型处理',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `code` varchar(50) DEFAULT NULL COMMENT '部署编码',
  `ip` char(50) DEFAULT NULL COMMENT '部署ip地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE COMMENT '部署唯一code码',
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='大屏设计';

-- ----------------------------
-- Records of jvs_screen
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_screen_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_screen_template`;
CREATE TABLE `jvs_screen_template` (
  `name` varchar(255) DEFAULT '未命名' COMMENT '名称',
  `id` char(50) NOT NULL COMMENT '数据模型id',
  `width` int(4) DEFAULT '1920',
  `height` int(4) DEFAULT '1080',
  `img_url` varchar(255) DEFAULT NULL,
  `background` varchar(12) DEFAULT NULL,
  `components` json DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '类型处理',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `thumbnail` char(255) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='大屏设计模板';

-- ----------------------------
-- Records of jvs_screen_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_tree
-- ----------------------------
DROP TABLE IF EXISTS `jvs_tree`;
CREATE TABLE `jvs_tree` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称, 同一层级不能重复',
  `value` varchar(2550) DEFAULT NULL COMMENT '显示值',
  `unique_name` varchar(255) DEFAULT NULL COMMENT '唯一标识, 作为该字典被引用的key',
  `group_id` bigint(20) DEFAULT NULL COMMENT '分组id, 区分不同的字典树',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `parent_id` char(50) DEFAULT NULL COMMENT '上级ID, 根节点为-1',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `tenant_id` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_name` (`unique_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义树,可以针对所有的树型结构进行处理,使用方式与字典类似';

-- ----------------------------
-- Records of jvs_tree
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rule_design
-- ----------------------------
DROP TABLE IF EXISTS `rule_design`;
CREATE TABLE `rule_design` (
  `id` char(50) NOT NULL COMMENT '主键',
  `enable` tinyint(1) DEFAULT '0' COMMENT '状态',
  `secret` varchar(255) DEFAULT NULL COMMENT '调用主键',
  `design_drawing_json` json DEFAULT NULL COMMENT '设计图',
  `parameter_pos` json DEFAULT NULL COMMENT '接口参数集合',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门id',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用ID',
  `icons` json DEFAULT NULL COMMENT '这个逻辑 使用到了哪些方法',
  `task` json DEFAULT NULL COMMENT '定时任务逻辑',
  `sync` tinyint(1) DEFAULT '0' COMMENT '是否异步',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` char(255) DEFAULT '界面化拖拽实现简单业务逻辑' COMMENT '介绍',
  `component_id` char(50) DEFAULT NULL COMMENT '组件ID，为了保证是三方组件',
  `flow_design_ids` json DEFAULT NULL COMMENT '工作流ID集',
  `on_task` tinyint(1) DEFAULT '0' COMMENT '是否开启定时任务',
  `component_design_id` char(50) DEFAULT NULL COMMENT '组件设计类型',
  `component_type` varchar(255) DEFAULT NULL COMMENT '组件类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `secret` (`secret`(191)) USING BTREE,
  KEY `secret_id` (`secret`,`del_flag`) USING BTREE,
  KEY `jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='逻辑引擎设计';

-- ----------------------------
-- Records of rule_design
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rule_external
-- ----------------------------
DROP TABLE IF EXISTS `rule_external`;
CREATE TABLE `rule_external` (
  `id` char(50) NOT NULL COMMENT '主键',
  `rule_group` char(20) DEFAULT NULL COMMENT '分组',
  `url` varchar(255) DEFAULT NULL COMMENT '接口API调用第三方',
  `explain_info` varchar(255) DEFAULT NULL COMMENT '解释',
  `name` varchar(25) DEFAULT NULL COMMENT '名称',
  `field_list` json DEFAULT NULL COMMENT '扩展的字段集',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否可用',
  `icon` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='逻辑引擎开放接口';

-- ----------------------------
-- Records of rule_external
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rule_log
-- ----------------------------
DROP TABLE IF EXISTS `rule_log`;
CREATE TABLE `rule_log` (
  `id` char(50) NOT NULL COMMENT '主键',
  `run_type` enum('JOB','TEST','REAL','API') DEFAULT NULL COMMENT '环境',
  `req_run_key` char(50) DEFAULT NULL COMMENT '运行key',
  `start_time` datetime(3) DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(3) DEFAULT NULL COMMENT '结束时间',
  `total_execution_time` int(255) DEFAULT '0' COMMENT ' 消耗时间',
  `flag` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `variable_map` json DEFAULT NULL COMMENT '请求参数',
  `result_variable_map` json DEFAULT NULL COMMENT '执行后的参数',
  `status` tinyint(1) DEFAULT NULL COMMENT '执行状态',
  `req_data` json DEFAULT NULL COMMENT '请求参数',
  `error_msg` text COMMENT '错误参数',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `logs` longtext COMMENT '打印日志',
  `result` longtext COMMENT '返回值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门id',
  `sync` tinyint(1) DEFAULT NULL COMMENT '是否异步执行',
  `jvs_app_id` char(50) DEFAULT NULL COMMENT '应用ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `req_run_key` (`req_run_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='逻辑定义数据';

-- ----------------------------
-- Records of rule_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rule_option
-- ----------------------------
DROP TABLE IF EXISTS `rule_option`;
CREATE TABLE `rule_option` (
  `id` char(50) NOT NULL COMMENT '主键',
  `field` char(200) DEFAULT NULL COMMENT '字段名-后台自动设置，(方法名+参数名+字段名进行拼接)',
  `name` char(20) DEFAULT NULL COMMENT '名称',
  `map` json DEFAULT NULL COMMENT '参数对象',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `field` (`field`(191),`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='逻辑属性配置项';

-- ----------------------------
-- Records of rule_option
-- ----------------------------
BEGIN;
COMMIT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='保存执行计划表';

-- ----------------------------
-- Records of sql_performance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_apply
-- ----------------------------
DROP TABLE IF EXISTS `sys_apply`;
CREATE TABLE `sys_apply` (
  `id` char(50) NOT NULL COMMENT 'ID',
  `name` varchar(10) DEFAULT NULL COMMENT '名称',
  `app_key` char(50) DEFAULT NULL COMMENT 'APPID',
  `app_secret` varchar(255) DEFAULT NULL COMMENT 'app_secret',
  `describes` varchar(255) DEFAULT NULL COMMENT '描述',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `scope` varchar(255) CHARACTER SET utf8 DEFAULT 'server,all' COMMENT '指定client的权限范围，比如读写权限，比如移动端还是web端权限',
  `authorized_grant_types` json DEFAULT NULL COMMENT '可选值 授权码模式:authorization_code,密码模式:password,刷新token: refresh_token, 隐式模式: implicit: 客户端模式: client_credentials。支持多个用逗号分隔',
  `authorities` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '指定用户的权限范围，如果授权的过程需要用户登陆，该字段不生效，implicit和client_credentials需要',
  `access_token_validity_seconds` int(11) DEFAULT '3000' COMMENT '设置access_token的有效时间(秒),默认(60*60*12,12小时)',
  `refresh_token_validity_seconds` int(11) DEFAULT '30000' COMMENT '设置refresh_token有效期(秒)，默认(60*60*24*30, 30填)',
  `additional_information` json DEFAULT NULL COMMENT '值必须是json格式',
  `archived` tinyint(1) DEFAULT '0',
  `trusted` tinyint(1) DEFAULT '0',
  `auto_approve_scopes` text COMMENT '默认false,适用于authorization_code模式,设置用户是否自动approval操作,设置true跳过用户确认授权操作页面，直接跳到redirect_uri',
  `registered_redirect_uris` json DEFAULT NULL,
  `login_domain` varchar(255) DEFAULT NULL COMMENT '应用的域名',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ips` json DEFAULT NULL COMMENT 'ip白名单',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `icon` varchar(400) CHARACTER SET utf8 DEFAULT '/jvs-ui-public/icon/icon.ico' COMMENT 'icon',
  `logo` varchar(400) CHARACTER SET utf8 DEFAULT '/jvs-ui-public/img/logo.jpg' COMMENT 'logo',
  `bg_img` varchar(400) CHARACTER SET utf8 DEFAULT '/jvs-ui-public/img/backImg.jpg' COMMENT '背景图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统应用';

-- ----------------------------
-- Records of sys_apply
-- ----------------------------
BEGIN;
INSERT INTO `sys_apply` VALUES ('1ff53290763d889bb85813d1845b3bc8c', 'JVS开发务平台', 'frame', '$2a$10$RtdtlcyALRa4BhsYWRS3CORtcvzR2sGwrdMcDdy9K7IQYN/vGre3.', 'JVS开发务平台-快速开发基础服务平台', 0, 'server,all', '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', NULL, 30000, 300000, NULL, 0, 0, 'false', NULL, 'localhost', NULL, NULL, '2021-11-15 17:31:43', 'admin', '2022-06-01 13:01:44', NULL, NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg');
INSERT INTO `sys_apply` VALUES ('9ef8d2af615709b3dfd6e9ea13bbc86b', '项目任务管理', 'teamwork', '$2a$10$Ldm7n8lu.ZJ8pfX.acOj3OZlcfbprVLuzLIMvM.Mg631.WHpt8he.', '项目任务管理', 0, 'server,all', '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', NULL, 3000, 30000, NULL, 0, 0, NULL, NULL, NULL, 'admin', '1', '2021-12-20 16:46:42', 'admin', '2022-03-28 22:58:29', NULL, NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg');
INSERT INTO `sys_apply` VALUES ('bbb46b6e0f779fdb156371548b000ba6', '文档库', 'knowledge', '$2a$10$t5Qu8j8XHdGEIpK0RuRS1OMNh8iM1362PDR9qDk1vCPDYTv8.lrem', 'knowledge', 0, 'server,all', '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', NULL, 30000, 300000, NULL, 0, 0, NULL, NULL, 'knowledge.bctools.cn', NULL, NULL, '2021-11-15 17:31:43', '超级管理员', '2022-05-31 16:39:24', NULL, NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg');
COMMIT;

-- ----------------------------
-- Table structure for sys_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `sys_bulletin`;
CREATE TABLE `sys_bulletin` (
  `id` char(50) NOT NULL COMMENT 'ID',
  `title` varchar(80) DEFAULT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `app_keys` json DEFAULT NULL COMMENT '系统应用APPID数组',
  `start_time` datetime NOT NULL COMMENT '公告生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '公告结束时间',
  `publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发布 0-待发布, 1-发布',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 DEFAULT '1' COMMENT '租户id',
  `content_type` enum('IMG','TEXT') DEFAULT NULL COMMENT '图片或文本',
  `type` enum('MOBILE','PC') DEFAULT NULL COMMENT 'PC端或移动端',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统应用公告';

-- ----------------------------
-- Records of sys_bulletin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` char(50) NOT NULL COMMENT '主键',
  `jvs_tenant_id` char(50) DEFAULT NULL COMMENT '租户id',
  `app_id` char(50) DEFAULT NULL COMMENT '系统应用id',
  `type` varchar(20) DEFAULT NULL COMMENT '配置类型',
  `name` varchar(50) DEFAULT NULL COMMENT '属性名称',
  `content` text COMMENT '属性值',
  `role` tinyint(1) DEFAULT NULL COMMENT '是否无权限访问',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_data`;
CREATE TABLE `sys_data` (
  `id` char(50) NOT NULL COMMENT '主键',
  `type` char(20) DEFAULT NULL COMMENT '请求方法',
  `function_name` varchar(255) DEFAULT NULL COMMENT '功能名',
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  `api` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `describes` text NOT NULL COMMENT '描述',
  `tenant_id` char(50) DEFAULT '1' COMMENT '租户ID默认1',
  `remark` json DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据权限资源标识表';

-- ----------------------------
-- Records of sys_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_data_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_role`;
CREATE TABLE `sys_data_role` (
  `role_id` char(50) NOT NULL COMMENT '角色ID',
  `data_id` char(50) NOT NULL COMMENT '权限名称',
  `tenant_id` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '租户ID',
  `remark` json DEFAULT NULL COMMENT '扩展数据权限扩展字段',
  PRIMARY KEY (`role_id`,`data_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与数据权限关联表';

-- ----------------------------
-- Records of sys_data_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` char(255) NOT NULL DEFAULT '0' COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `parent_id` varchar(100) DEFAULT '-1' COMMENT '上级部门为  可能为租户ID，先根据租户进行查询',
  `tenant_id` char(50) DEFAULT '1' COMMENT '租户ID默认1',
  `leader_id` char(50) DEFAULT NULL COMMENT '部门负责人ID',
  `type` enum('dept','branchOffice') DEFAULT 'dept' COMMENT '类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序号',
  `del_flag` tinyint(1) DEFAULT '0',
  `source` enum('DINGTALK_INSIDE','WECHAT_ENTERPRISE_WEB','OWN','STANDARD_OWN') DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` char(50) NOT NULL COMMENT '编号',
  `type` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `system` enum('SYSTEM','BIZ') DEFAULT NULL COMMENT '字典类型',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除状态',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `parent_id` char(50) DEFAULT '-1' COMMENT '上级id，顶级-1',
  `uniq_id` varchar(64) DEFAULT NULL COMMENT '唯一id，数据迁移用到',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('004730a6a64238ea7ca5e39e738c48e8', 'jvs-teamwork-ui-help-url', 'jvs-teamwork-ui-help-url', '2022-06-21 10:47:27', '2022-06-21 10:47:27', 'jvs-teamwork-ui-help-url', 'BIZ', '0', '超级管理员', '-1', '388477df3f6b4b67812a86cc38511396');
INSERT INTO `sys_dict` VALUES ('0f2920b2ec620be14598ff21dc92b238', 'jvsapp', '微应用分类处理', '2021-11-23 18:36:14', '2021-11-23 18:36:14', NULL, 'SYSTEM', '0', 'admin', '-1', '3860e1ef0fe04ea09ba892fcc3b3e152');
INSERT INTO `sys_dict` VALUES ('101', '客户类型', '市场营销客户管理', '2021-05-09 09:48:48', '2021-10-26 14:54:42', '内部客户管理分类', 'SYSTEM', '0', 'admin', '-1', '6592c944e8814df9a52e2a1f89e8c3b8');
INSERT INTO `sys_dict` VALUES ('102', '客户地域', '客户地域', '2021-05-09 09:51:35', '2021-10-26 14:54:42', '客户地域', 'SYSTEM', '0', 'admin', '-1', '428a4eda6b2c4c0eabb6355a34ecff27');
INSERT INTO `sys_dict` VALUES ('103', 'T/F', '是/否', '2021-05-09 09:56:28', '2021-10-26 14:54:42', '是/否', 'SYSTEM', '0', 'admin', '-1', '98f10083a69f4f6db5bd7a56aa15d0f6');
INSERT INTO `sys_dict` VALUES ('104', '有效状态', '有效状态', '2021-05-09 11:15:07', '2021-10-26 14:54:42', '有效状态', 'SYSTEM', '0', 'admin', '-1', 'bb87dc2d30fd46efa8f73aa8c29fd304');
INSERT INTO `sys_dict` VALUES ('105', '市场动作', '市场动作', '2021-05-09 11:26:23', '2021-10-26 14:54:42', '市场动作', 'SYSTEM', '0', 'admin', '-1', '93dd9d1a4eaf42618b130f60645562b5');
INSERT INTO `sys_dict` VALUES ('107', '在职状态', '在职状态', '2021-05-11 19:50:00', '2021-10-26 14:54:42', '在职状态', 'SYSTEM', '0', 'admin', '-1', '7cc5b51b6e8942b68d16cc6720624f66');
INSERT INTO `sys_dict` VALUES ('109', '数据权限', '描述', '2021-05-17 14:55:11', '2021-11-23 19:06:40', '备注', 'SYSTEM', '1', 'admin', '-1', '5cc2492922464e858bfcda19f151114e');
INSERT INTO `sys_dict` VALUES ('125', 'fenbao', '企业性质', '2021-05-25 10:29:43', '2021-10-26 14:54:42', '企业性质', 'SYSTEM', '0', 'admin', '-1', 'a81da949070d41b5b7337b94e2629d3a');
INSERT INTO `sys_dict` VALUES ('126', 'guarantee:letter_status', '保函状态', '2021-05-27 15:02:21', '2021-10-26 14:54:42', NULL, 'SYSTEM', '0', 'admin', '-1', 'fd002e8d6d5641a7a80403bc8f7c4dca');
INSERT INTO `sys_dict` VALUES ('130', '账款专家', '合同执行状态', '2021-05-29 19:33:43', '2021-11-23 19:06:40', '合同执行状态，未签约、已签约', 'SYSTEM', '0', 'admin', '-1', 'a0042888bc6c485f8249998d095eee83');
INSERT INTO `sys_dict` VALUES ('131', '合同类型', '合同类型', '2021-05-30 09:16:44', '2021-11-23 19:06:40', '人事合同、服务合同、商贸合同、采购合同', 'SYSTEM', '0', 'admin', '-1', '83e3b5389a2c46f6a6569e9bbd0cf8b9');
INSERT INTO `sys_dict` VALUES ('132', '核销状态', '核销状态', '2021-05-30 10:00:03', '2021-11-23 19:06:40', '核销状态：未核销、已核销、部分核销', 'SYSTEM', '0', 'admin', '-1', '01ca1b9df8ca4067b6f5e02310448072');
INSERT INTO `sys_dict` VALUES ('133', '签约模式', '合同签约模式', '2021-05-30 10:23:10', '2021-11-23 19:06:40', '在线、离线', 'SYSTEM', '0', 'admin', '-1', 'a99b8f150b3c4ffa9775ed6856751b4f');
INSERT INTO `sys_dict` VALUES ('135', '发票类型', '发票类型', '2021-05-31 21:38:37', '2021-11-23 19:06:40', '增值业务专用发票6%、增值业务专用发票13%、增值业务普通发票3%', 'SYSTEM', '0', 'admin', '-1', 'c02d83cdce3a49ed96f78098319d27e6');
INSERT INTO `sys_dict` VALUES ('139', 'pay', '业务系统支付状态', '2021-06-02 16:15:54', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '5da3561583f540d9b1a16858f02658ad');
INSERT INTO `sys_dict` VALUES ('141', '需求分类', '发布不同类别的需求', '2021-06-07 14:17:15', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '35274afc11634d8daf92604a2ba97432');
INSERT INTO `sys_dict` VALUES ('142', 'jobstatus', '员工在职状态', '2021-06-12 10:23:54', '2021-11-23 19:06:40', '试用、在职、离职', 'SYSTEM', '0', 'admin', '-1', '0d217b44d20942ffa2ddcb4d9d5d3d17');
INSERT INTO `sys_dict` VALUES ('144', 'probationperiod', '试用周期', '2021-06-12 12:17:47', '2021-11-23 19:06:40', '0、1、2、3、6', 'SYSTEM', '0', 'admin', '-1', '989c32fd13e049d19a66d00d6aa25cdb');
INSERT INTO `sys_dict` VALUES ('1617f421bfcc4b83f09b59ad21bc9133', 'sales_customer_attitude', '客户态度', '2021-12-20 10:39:32', '2021-12-20 10:39:32', '客户对我们产品的态度', 'BIZ', '0', 'admin', '-1', '113b492548ad43b790dac71b1c3764a9');
INSERT INTO `sys_dict` VALUES ('168', '性别', '性别', '2021-06-25 14:45:09', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '58fd9222129a4aeda25e6f2db46f9fc0');
INSERT INTO `sys_dict` VALUES ('174c70bf46c1fb4794fecdba21d1275a', 'custmer_type', '客户类型', '2022-04-19 15:57:38', '2022-04-19 15:57:38', NULL, 'BIZ', '0', '超级管理员', '-1', '6a59efed1a2746a7943a3d06bc7f15fb');
INSERT INTO `sys_dict` VALUES ('176', '数据权限', '描述', '2021-07-06 14:12:34', '2021-11-23 19:06:40', '备注', 'SYSTEM', '0', 'admin', '-1', 'c9838805264d4a7a9b938247b11c83f0');
INSERT INTO `sys_dict` VALUES ('186', 'SEO', 'SEO关键词', '2021-07-07 17:04:38', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', 'e3828d744cc74611b4ece712088cd043');
INSERT INTO `sys_dict` VALUES ('187', '测试业务', '测试业务字典', '2021-07-09 16:45:04', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '19a99d0f62d3406c933c4bdb128692bb');
INSERT INTO `sys_dict` VALUES ('1dc044815217ef71d38868af260569fd', '业务类型', '描述', '2021-07-16 15:08:56', '2021-11-23 19:06:40', '备注', 'SYSTEM', '1', 'admin', '-1', '4f31a4aa02254ab88e3d65952ae3ff13');
INSERT INTO `sys_dict` VALUES ('2b29f7d99083602aef6dce5f9c807fd6', 'icon', '所有图标库', '2021-11-16 11:06:28', '2021-11-16 11:06:28', NULL, 'SYSTEM', '0', 'admin', '-1', 'acaf821e73c240be9a2e071e7141dc46');
INSERT INTO `sys_dict` VALUES ('34b0822233113729862a929529c5d3da', 'SEO关键词', 'SEO关键词', '2021-11-02 09:29:40', '2021-11-23 18:39:07', '备注信息', 'BIZ', '1', 'admin', '-1', '4185cf03f62243b2a68674b41a3a3d53');
INSERT INTO `sys_dict` VALUES ('3b5b12eab32ccb710807ab3a708851dc', 'knowledge_template_type', '企业知识库模板分类', '2022-01-05 16:18:57', '2022-01-05 16:18:57', NULL, 'SYSTEM', '0', 'admin', '-1', '0b988c20108d4243a9d57621936f6604');
INSERT INTO `sys_dict` VALUES ('3ed776b1fb5e3a73c134c803074e6ad0', 'jvs-ui-help-url', '前端页面显示帮助的几个地址', '2022-03-24 10:02:18', '2022-03-24 10:02:18', '前端页面显示帮助的几个地址', 'SYSTEM', '0', 'admin', '-1', '39acb148a06e48529644e42dec4649e1');
INSERT INTO `sys_dict` VALUES ('45f03afb7cab252998c9cb9c6b1bc0c6', 'sales_customer_channel', '用户来源渠道', '2021-12-20 10:38:33', '2021-12-20 10:38:33', '用户来源渠道', 'BIZ', '0', 'admin', '-1', 'f1748b5ff00540e8a46480bf69e33e72');
INSERT INTO `sys_dict` VALUES ('52118494eca4204bee9ef42673cdaefa', '测试', '业务系统测试字典用', '2021-07-16 15:58:51', '2021-11-23 19:06:40', '那些', 'SYSTEM', '0', 'admin', '-1', 'aa841b3b77454396a771a860a0d091f6');
INSERT INTO `sys_dict` VALUES ('614bb08c1dfcab7366a47e1aafca8374', 'dsvfdvcsxz', '系统', '2021-10-11 11:04:03', '2021-11-23 19:06:39', NULL, 'SYSTEM', '0', 'admin', '-1', '2351f100f0414a04880f1a609eace77d');
INSERT INTO `sys_dict` VALUES ('7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'meetingStatus', '会议状态', '2021-08-28 18:17:06', '2021-11-23 19:06:40', '会议状态', 'SYSTEM', '0', 'admin', '-1', '8512a1b4b2f44999a54e09ce687b70f7');
INSERT INTO `sys_dict` VALUES ('82', '模板类别', '方便管理不同类别的模板', '2021-03-30 14:10:27', '2021-10-26 14:54:46', NULL, 'SYSTEM', '0', 'admin', '-1', 'a832f40f-fee3-46ae-a38c-84c62e54061a');
INSERT INTO `sys_dict` VALUES ('8dd3ab5dcb3edf54640e6b2f7c0d9148', '会议类型', '会议类型', '2021-08-28 18:17:51', '2021-11-23 19:06:40', '会议类型', 'SYSTEM', '0', 'admin', '-1', '9c1d942280bf4c4aa738aff56e01b079');
INSERT INTO `sys_dict` VALUES ('ab83069fc2b945f9ed7ce5529b1a7b79', 'contractStatus', '合同状态', '2021-08-28 18:09:27', '2021-11-23 19:06:39', '合同状态', 'SYSTEM', '0', 'admin', '-1', '25a2d16777b64ec393954d9bd0065105');
INSERT INTO `sys_dict` VALUES ('add8fed5de4218092b4cea63248f851a', 'jvs_app_links', '应用创建页面的链接', '2022-01-17 15:37:43', '2022-01-17 15:37:43', NULL, 'SYSTEM', '0', 'admin', '-1', '0ca185057a35486ba88dca359b31805a');
INSERT INTO `sys_dict` VALUES ('b31361c96f362603164cf0e359fcdf06', 'jvs-knowledge-ui-help-url', '知识库帮助中心', '2022-06-06 16:03:18', '2022-06-06 16:03:18', '知识库帮助中心', 'BIZ', '0', '超级管理员', '-1', '59436f1da04d4d6a83ed2aa08d2c2855');
INSERT INTO `sys_dict` VALUES ('b5c521d6c646850d6715c46d8b67f683', 'meetingPlace', '会议地点', '2021-08-28 18:16:13', '2021-11-23 19:06:40', '会议地点', 'SYSTEM', '0', 'admin', '-1', '7915b25a32aa4b09be7190cd2ea85948');
INSERT INTO `sys_dict` VALUES ('ce50a4bc4329b0fd47ff7ee619b2a45b', '报销类型', '报销类型', '2022-05-27 14:18:42', '2022-05-27 14:18:42', '报销类型', 'BIZ', '0', '超级管理员', '-1', 'a641673c60ae433da940c3ff24dc67bd');
INSERT INTO `sys_dict` VALUES ('dd5aa4d7c06b919a437e934e5af07032', 'certificate_type', '证件类型', '2021-12-15 16:16:15', '2021-12-15 16:16:15', NULL, 'BIZ', '0', 'admin', '-1', '8d60e3180d5d49b482661da584e78f50');
INSERT INTO `sys_dict` VALUES ('df45ee3c48af5af53cf136be38d9a713', '授信状态', '授信状态', '2021-11-13 22:38:04', '2021-11-23 18:38:59', '授信状态', 'BIZ', '1', 'admin', '-1', 'ea31cf3256614654b35446dbd147f107');
INSERT INTO `sys_dict` VALUES ('ee434c5c5e7011666d48ac0c497eebae', 'sales_customer_type', '营销回访', '2021-12-20 10:36:54', '2021-12-20 10:36:54', '营销回访表单需要的字典', 'BIZ', '0', 'admin', '-1', '22f39835eba74a89a4fd61a5fd492b31');
INSERT INTO `sys_dict` VALUES ('f163f24cb8d0cde06135c7fc676139cc', 'teamwork_document', '任务管理文档', '2022-06-21 10:33:30', '2022-06-21 10:47:13', '任务管理文档', 'BIZ', '1', '超级管理员', '-1', '530ec520d07146538338c54cb7c4980b');
INSERT INTO `sys_dict` VALUES ('fbf99c70ff934a58f0ecfb2d4f588c63', 'design_template_type', '开发套件模板类型', '2022-01-12 15:29:32', '2022-01-12 15:29:32', NULL, 'SYSTEM', '0', 'admin', '-1', '5dd2ac5745f9496d9f1b558767a1ce5b');
INSERT INTO `sys_dict` VALUES ('fc6c2e78401d14cc7125de54877e4f9d', 'document-frequency', '知识库常用搜索关键字', '2022-01-06 16:56:41', '2022-01-06 16:56:53', NULL, 'SYSTEM', '0', 'admin', '-1', '3060d97367e84385b2ae43a41dd42bb5');
INSERT INTO `sys_dict` VALUES ('fc6c2e78401d14cc7125de54877e4f9f', 'control-label', '营业类目', '2021-12-19 10:14:50', '2021-12-19 10:14:50', NULL, 'BIZ', '0', 'admin', '-1', '3060d97367e84385b2ae43a41dd42bb4');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` char(50) NOT NULL COMMENT '编号',
  `dict_id` char(50) NOT NULL,
  `value` text,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（升序）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典项';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_item` VALUES ('006a6cb93ce5893749afb00b7081ec11', '8fe320325009e65644c36d1b16574531', '出纳放款确认', '出纳放款确认', 'processTagType', '出纳放款确认', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0240fbce7233ec943c922211e73ec205', 'bdb79cde74266f58bae93ca65f862efa', '7', '九龙坡区', 'regionType', '九龙坡区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:08', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('029d59f339cb7b3f813063d13286cbed', '3b5b12eab32ccb710807ab3a708851dc', '客户管理', '客户管理', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/e/4/2/4/d/134be1354fe3a6f327a872104b36ccd8.svg', 5, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('02ca9f6ea34139980460645f788b2842', '0f2920b2ec620be14598ff21dc92b238', '项目任务', '项目任务', 'jvsapp', NULL, 7, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('038329ba9c5b8a858948a30221ca0270', '8fe320325009e65644c36d1b16574531', '审贷中心放款审批', '审贷中心放款审批', 'processTagType', '审贷中心放款审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0478285344fdc3901f1e58edf0bf5066', '8fe320325009e65644c36d1b16574531', '财务负责人审批', '财务负责人审批', 'processTagType', '财务负责人审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0483401e0db48b6e2b254f8d4143ea43', '3b5b12eab32ccb710807ab3a708851dc', '教育学习', '教育学习', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/2/6/c/1/1/a67520006f71e5a7c07026db1a478d1d.svg', 2, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('06c7a4bdf3d8f7cab246b91736a809f2', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('07aab34a7f5bc46512eaea56021cb3c4', 'ddf4becc7bdbb0c482bff051166cb54c', 'SH', '上会', '321', '上会', 0, '2021-08-28 18:59:52', '2021-08-28 18:59:52', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('08fed38e870ad52583994e4659f8b069', '45f03afb7cab252998c9cb9c6b1bc0c6', '5', '线下介绍', 'sales_customer_channel', '线下介绍', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0929652bb9485afee7f379032b81c3e9', 'fc6c2e78401d14cc7125de54877e4f9f', '西餐料理', '西餐料理', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0aae3b08006885c53a96ddfda2632f80', 'fc6c2e78401d14cc7125de54877e4f9f', '正餐美食', '正餐美食', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0c624c030c5dc97f002148874069a3f0', 'ee434c5c5e7011666d48ac0c497eebae', '1', '个人客户', 'sales_customer_type', '个人客户', 0, '2021-12-20 10:40:15', '2021-12-20 10:40:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0c6cd764ce423dbe162a6e76721d6d83', '126ceca0dc43d3f84df03221a09b3c75', '4', '云南代表处', 'parent_company', '云南代表处', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0d60d36c5e91bc1a62703fb89d331400', '7ab996b18d4fa75e8837369f4c071b4a', '2', '小额贷款', 'productType', '小额贷款', 0, '2021-08-11 10:14:39', '2021-08-11 10:14:39', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('10f59b2707fef0359e24150756f8d5d6', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'INVALID', '已作废', 'contractStatus', '已作废', 0, '2021-08-28 18:09:45', '2021-08-28 18:09:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('120bfcde61a78451d7a0079541f7a40a', '0f2920b2ec620be14598ff21dc92b238', '项目管理', '项目管理', 'jvsapp', NULL, 4, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('12a49e9a3b8b2e57f90e8351cfad3d96', 'fec53be21d29d0cbf2c8683724dc9e80', '2', '0~100', 'companyScale', '0~100', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('15a62b969a820f51254b8853f03f6aa0', '3b5b12eab32ccb710807ab3a708851dc', '团队协作', '团队协作', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/2/6/c/1/1/a67520006f71e5a7c07026db1a478d1d.svg', 3, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('16dfdce77ce641dca0f8f6955f13e5a9', 'ce50a4bc4329b0fd47ff7ee619b2a45b', '2', '招待费', '报销类型', '招待费', 1, '2022-05-27 14:19:11', '2022-05-27 14:19:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1897d828da804c3547e6c02d89623519', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1a6cd15ede26c7941bace5766a65d75a', '8fe320325009e65644c36d1b16574531', '副总经理审批', '副总经理审批', 'processTagType', '副总经理审批', 0, '2021-08-02 19:37:09', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1a998c249efbdaad709d3ba81b988458', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1a9ef5b74ada804086a4abe6849e5d5b', 'bdb79cde74266f58bae93ca65f862efa', '26', '武隆区', 'regionType', '武隆区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:08', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1b1ad1d1d7b39cb5fa8e1df2e3ae134b', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'SEAL', '已用印未回传', 'contractStatus', '已用印未回传', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1dd4ad8940dea000811717544309a252', '126ceca0dc43d3f84df03221a09b3c75', '1', '公司重庆总部', 'parent_company', '公司重庆总部', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1e1c1da96a7cdaf4d5db340cbfa6415c', 'dd5aa4d7c06b919a437e934e5af07032', 'sfz', '身份证', 'certificate_type', NULL, 0, '2021-12-15 16:16:46', '2021-12-15 16:16:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1f8a2afa8a689240d0bfc1268b288d80', 'e113a39dd3d9b0f785b5b54a25b03e96', 'AA', 'AA', 'customerCreditLevel', 'AA', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1fd2e69a3bc7e987d25cf81bf55c844f', '3b5b12eab32ccb710807ab3a708851dc', '疫情防护', '疫情防护', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/1/9/9/c/a/86f013679565aead9ffb0386c20a25ae.svg', 6, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('207c6fc5f267cbba027697dae75d2055', 'b31361c96f362603164cf0e359fcdf06', 'http://10.0.0.26:10000/#/view?id=11af5e85287006b2036f533625bcd16e', 'event-auto-help', 'jvs-knowledge-ui-help-url', 'http://10.0.0.26:10000/#/view?id=11af5e85287006b2036f533625bcd16e', 0, '2022-06-06 16:08:19', '2022-06-06 16:08:19', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('22e0952a855acb32fe64a73ae5e1ea81', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_1', '无法表示意见的审计报告', 'auditOpinionTypes', '无法表示意见的审计报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('247', '82', '合同模板', NULL, '模板类别', NULL, 0, '2021-03-30 14:20:30', '2021-03-30 14:20:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('252', '80', '2', '已支付', '数据', '订单金额买家成功支付', 0, '2021-04-01 09:29:47', '2021-04-01 09:29:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('253', '80', '1', '未支付', '数据', '买家下单未付款', 0, '2021-04-01 09:29:47', '2021-04-01 09:29:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('265fd5e5845bfe27027c1dc3017eeead', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', '创建第一个应用', 'jvs_app_links', '', 2, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('26c11b60ebb5c36ba0ff2aeb32189a1f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-03-24 10:24:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('27b629090076f8f0357a599a6573a00c', '1617f421bfcc4b83f09b59ad21bc9133', '3', '不沟通', 'sales_customer_attitude', '不沟通', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('298', '94', '0', '首页', 'qifu_imgtype', '首页banner', 0, '2021-04-27 18:18:31', '2021-04-27 18:18:31', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('299', '94', '1', '登录', 'qifu_imgtype', '登录的banner', 0, '2021-04-27 18:19:02', '2021-04-27 18:19:02', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2b6bb88f22f084d344099baebf5377d1', 'bdb79cde74266f58bae93ca65f862efa', '25', '梁平区', 'regionType', '梁平区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:09', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2df560fcaeea55132915b0e1164e5405', '8fe320325009e65644c36d1b16574531', '总经理审批', '总经理审批', 'processTagType', '总经理审批', 0, '2021-08-02 19:37:09', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2e9661aa9eefcc649aab61ed51ebcc09', 'ee434c5c5e7011666d48ac0c497eebae', '0', '企业客户', 'sales_customer_type', '企业客户', 0, '2021-12-20 10:40:15', '2021-12-20 10:40:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2effc2ed59d4c5e750e45272b9db1ca4', '78a9b6c9cc81d2348ee2034fdf69d34d', '3', '提前结清', 'RepayStatus', '提前结清', 3, '2021-07-21 11:20:04', '2021-07-21 11:22:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2fadfa8c11516b267f28779f9c4bf307', '1617f421bfcc4b83f09b59ad21bc9133', '1', '不看好', 'sales_customer_attitude', '不看好', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('310', '95', 'IDENTITY_CARD', '身份证', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('311', '95', 'ARMY_IDENTITY_CARD', '军官证', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('312', '95', 'STUDENT_CARD', '学生证', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('313', '95', 'PASSPORT', '护照', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('314', '95', 'OTHER', '其他证件', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3145a17807ba9ff981aa9c542f787435', 'fec53be21d29d0cbf2c8683724dc9e80', '4', '501~1000', 'companyScale', '501~1000', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('32d730bc5fdad5e7ee5f58e1fd29a4cb', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'CANCEL', '已撤销', 'contractStatus', '已撤销', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3306780a2af5b190e4bc45d3598e511d', '8fe320325009e65644c36d1b16574531', '发起放款审批', '发起放款审批', 'processTagType', '发起放款审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('33631048dcb602ed59f8e55825b543de', 'fc6c2e78401d14cc7125de54877e4f9f', '甜品饮品', '甜品饮品', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('340', '101', '1', '个人客户', '客户类型', '个人客户', 0, '2021-05-09 09:49:14', '2021-05-09 09:49:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('341', '101', '2', '企业客户', '客户类型', '企业客户', 0, '2021-05-09 09:49:14', '2021-05-09 09:49:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('342', '102', '1', '北京', '客户地域', '北京市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('343', '102', '2', '上海', '客户地域', '上海市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('344', '102', '3', '广州', '客户地域', '广州市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('345', '102', '4', '深圳', '客户地域', '深圳市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3450b243b5b94fece4d9c4413043a766', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-03-24 10:25:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('346', '102', '5', '重庆', '客户地域', '重庆市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('347', '103', '0', 'true', 'T/F', '是', 0, '2021-05-09 09:57:10', '2021-05-09 09:57:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('348', '103', '1', 'false', 'T/F', '否', 0, '2021-05-09 09:57:10', '2021-05-09 09:57:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('349', '104', '0', '有效', '线索状态', '有效', 0, '2021-05-09 11:15:59', '2021-05-09 11:15:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('350', '104', '1', '无效', '线索状态', '无效', 0, '2021-05-09 11:15:59', '2021-05-09 11:15:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('351', '105', '1', '电话回访', '市场动作', '电话回访', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('352', '105', '2', '技术交流', '市场动作', '技术交流', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('353', '105', '3', '线下拜访', '市场动作', '线下拜访', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('354', '105', '4', '礼品赠送', '市场动作', '礼品赠送', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('355', '105', '5', '邀约参观', '市场动作', '邀约参观', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('368', '107', '1', '在职', '在职状态', '在职', 0, '2021-05-11 19:50:36', '2021-05-11 19:50:36', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('369', '107', '2', '离职', '在职状态', '离职', 0, '2021-05-11 19:50:36', '2021-05-11 19:50:36', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('37535399e972253b8a2a5960abc3e213', '1059438e8c74d226182966a2a0460597', '1', '等额本息', 'backType', '等额本息', 0, '2021-08-11 10:03:06', '2021-08-11 10:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('375590491fe04f7a0ed56a4f1bcd77d0', 'ee434c5c5e7011666d48ac0c497eebae', '2', '其他', 'sales_customer_type', '其他', 0, '2021-12-20 10:40:15', '2021-12-20 10:40:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('388e44f9ddc6df6aba63f233e8c3c6bb', 'fc6c2e78401d14cc7125de54877e4f9f', '夜宵烧烤', '夜宵烧烤', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b18948bcf36dc802f1be318de4f9f73', '91d9e2833ee1be20f98f09477766a7d4', '4', '其他', 'channelType', '其他', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b37bbcf293f0d14c2ae957b3a3c32b0', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'SUBMIT', '待审核/已提交', 'contractStatus', '待审核/已提交', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b5f246c94581ca5b3a941e8797f3a54', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b800d6e3e05f27a60756cba88e601e8', '78a9b6c9cc81d2348ee2034fdf69d34d', '6', '待还利息', 'RepayStatus', '待还利息', 6, '2021-07-21 11:20:04', '2021-07-21 11:22:22', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b8a2a6fa2e4e5d582bb29bea1a11ed6', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'DELETED', '已经删除/到作废列表去的依据', 'contractStatus', '已经删除/到作废列表去的依据', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3ca268ec2de085ad2f713c03930f93e8', '8fe320325009e65644c36d1b16574531', '合同审核', '合同审核', 'processTagType', '合同审核', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3cac1159deae8e2aa00e1645b575983c', '1617f421bfcc4b83f09b59ad21bc9133', '2', '中立观望', 'sales_customer_attitude', '中立观望', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3db8b50fd197142d4bb5fdb533418a6f', '2a13720000aa29c7cc890ca05849fb3b', '2', '城镇户口', 'residenceType', '城镇户口', 0, '2021-07-19 11:26:01', '2021-07-19 11:26:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('43f4f8426cd028f71d90b7a59ca46c33', 'a9d16a3c562968e982fd64cdb6af1abc', '2', '二楼小会议室', 'roomType', '二楼小会议室', 0, '2021-08-09 17:46:07', '2021-08-09 17:46:07', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('441', '125', '1', '国有参股', 'fenbao', '国有参股', 0, '2021-05-25 10:31:04', '2021-05-25 10:31:04', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('442', '125', '2', '民营企业', 'fenbao', '民营企业', 0, '2021-05-25 10:31:05', '2021-05-25 10:31:05', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('443', '125', '3', '国有控股', 'fenbao', '国有控股', 0, '2021-05-25 10:31:05', '2021-05-25 10:31:05', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('444', '125', '4', '其他', 'fenbao', '其他', 0, '2021-05-25 10:31:05', '2021-05-25 10:31:05', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('448cd20cd4a15ac862c4e8f6c8ef641b', '8fe320325009e65644c36d1b16574531', '总经理助理', '总经理助理', 'processTagType', '总经理助理', 0, '2021-08-02 19:37:09', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('449', '126', '1', '待生成', 'guarantee:letter_status', '待生成', 0, '2021-05-27 15:03:06', '2021-05-27 15:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('450', '126', '2', '待签署', 'guarantee:letter_status', '待签署', 0, '2021-05-27 15:03:06', '2021-05-27 15:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('451', '126', '3', '签署成功', 'guarantee:letter_status', '签署成功', 0, '2021-05-27 15:03:06', '2021-05-27 15:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('462', '130', '0', '待审批', '账款专家', '生成合同草稿未完成审批', 0, '2021-05-29 19:35:58', '2021-05-29 19:35:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('463', '130', '1', '待签约', '账款专家', '为完成签约或未对合同进行回传', 0, '2021-05-29 19:35:58', '2021-05-29 19:35:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('464', '130', '2', '已签收', '账款专家', '完成电子签章或者人工确认签署完成', 0, '2021-05-29 19:35:58', '2021-05-29 19:35:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('465', '131', '1', '服务合同', '合同类型', '服务合同', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('466', '131', '2', '商贸合同', '合同类型', '产品销售', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('467', '131', '3', '人事合同', '合同类型', '员工人事', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('468', '131', '4', '战略协议', '合同类型', '战略合作', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('469', '132', '1', '未核销', '核销状态', '未核销', 0, '2021-05-30 10:04:01', '2021-05-30 10:04:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('46b5665d89cef08aabb9b8b970337d69', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'CHECKED', '已审核未确认', 'contractStatus', '已审核未确认', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('46e99dc7bf6b75da7a2686f2ccecd850', '7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'IN_PROGRESS', '会议中', 'meetingStatus', '会议中', 0, '2021-08-28 18:17:30', '2021-08-28 18:17:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('470', '132', '2', '已核销', '核销状态', '已核销', 0, '2021-05-30 10:04:01', '2021-05-30 10:04:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('471', '132', '3', '部分核销', '核销状态', '部分核销', 0, '2021-05-30 10:04:01', '2021-05-30 10:04:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('472', '133', '1', '在线签约', '签约模式', '在线签约', 0, '2021-05-30 10:26:24', '2021-05-30 10:26:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('473', '133', '2', '离线签约', '签约模式', '离线签约', 0, '2021-05-30 10:26:24', '2021-05-30 10:26:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('475', '108', 'test01', '测试01', 'df ', '描述01', 0, '2021-05-31 17:30:40', '2021-05-31 17:30:40', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('475bfcc8f3f6b9cb34c80fef0133b1fa', '78a9b6c9cc81d2348ee2034fdf69d34d', '1', '待还款', 'RepayStatus', '待还款', 1, '2021-07-21 11:20:04', '2021-07-21 11:22:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('476', '108', 'test02', '测试02', 'df ', '面搜02', 0, '2021-05-31 17:30:40', '2021-05-31 17:30:40', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('477', '135', '1', '增值业务专用发票6%', '发票类型', '6%专票', 0, '2021-05-31 21:40:25', '2021-05-31 21:40:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('47748732562cbe9d1a5857c76cc5860e', '36f93f7c4afff1d0071864e7020fbfe5', '5', '撤销', 'meetStatus', '撤销', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('478', '135', '2', '增值业务专用发票13%', '发票类型', '3%专票', 0, '2021-05-31 21:40:25', '2021-05-31 21:40:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('479', '135', '3', '增值业务普通发票3%', '发票类型', '3%普票', 0, '2021-05-31 21:40:25', '2021-05-31 21:40:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('47c30597bda4ac5cfb87b88746a1fd04', '3b5b12eab32ccb710807ab3a708851dc', '产品研发', '产品研发', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/4/d/e/9/e1deb3b54b4c46a4dbd37725e0fa0193.svg', 8, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('480', '136', '1', '已支付', 'pay', '已支付', 0, '2021-06-02 10:14:13', '2021-06-02 10:14:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('481', '136', '2', '支付完成', 'pay', '支付完成', 0, '2021-06-02 10:14:13', '2021-06-02 10:14:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('482', '136', '0', '未支付', 'pay', '未支付', 0, '2021-06-02 10:14:13', '2021-06-02 10:14:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('486', '139', '0', '待支付', 'pay', '订单状态待支付中', 0, '2021-06-02 16:17:01', '2021-06-02 16:17:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('487', '139', '1', '支付中 ', 'pay', '订单支付中状态', 0, '2021-06-02 16:17:01', '2021-06-02 16:17:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('488', '139', '2', '已支付', 'pay', '订单已经完成支付', 0, '2021-06-02 16:17:01', '2021-06-02 16:17:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('490', '141', NULL, '服务', '需求分类', NULL, 0, '2021-06-07 14:17:45', '2021-06-07 14:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('491', '142', '1', '试用', 'jobstatus', '试用期员工', 0, '2021-06-12 10:31:27', '2021-06-12 10:31:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('492', '142', '2', '在职', 'jobstatus', NULL, 0, '2021-06-12 10:31:27', '2021-06-12 10:31:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('493', '142', '3', '离职', 'jobstatus', NULL, 0, '2021-06-12 10:31:27', '2021-06-12 10:31:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('494', '143', '1', '居民身份证', 'identitytype', '居民身份证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('495', '143', '2', '士官证', 'identitytype', '士官证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('496', '143', '3', '学生证', 'identitytype', '学生证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('497', '143', '4', '驾驶证', 'identitytype', '驾驶证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('498', '143', '5', '护照', 'identitytype', '护照', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('499', '143', '6', '港澳通行证', 'identitytype', '港澳通行证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4aaabd8a659586ea6454a747c3817129', '45f03afb7cab252998c9cb9c6b1bc0c6', '1', '知乎', 'sales_customer_channel', '知乎', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4b2f5123799208ba1164320ff0a1e143', '0c293703b963c510f1245e1948ba3a85', '现金', '现金', 'moneyType', '现金', 0, '2021-07-23 10:47:01', '2021-07-23 10:47:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4bdc62a409d1c1c16fd972a7e4f95547', 'dd5aa4d7c06b919a437e934e5af07032', 'qt', '其他', 'certificate_type', NULL, 0, '2021-12-15 17:29:38', '2021-12-15 17:29:38', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c1081d21668fd0ba287696e6027f159', '174c70bf46c1fb4794fecdba21d1275a', '0', '个人客户', 'custmer_type', '个人客户', 0, '2022-04-19 17:11:14', '2022-04-19 17:11:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c375ebd7a74509a3c2ee1bc9bd64691', 'b5c521d6c646850d6715c46d8b67f683', '五会议室(负一楼)', '五会议室(负一楼)', 'meetingPlace', '五会议室(负一楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c51b01555643252714b11db26238d25', '3b5b12eab32ccb710807ab3a708851dc', '人事办公', '人事办公', 'knowledge_template_type', 'https://p2.kdvas.wpscdn.cn/kdvcover/file/9/4/2/5/2/531d90f6418b00b22428faab5d515c28.svg', 4, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4ed9bf23b383a368d000bd0f47c0dd20', 'bdb79cde74266f58bae93ca65f862efa', '1', '万州区', 'regionType', '万州区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:09', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4fd1c73200287e4b1f34fbe5d8ec3bec', 'b5c521d6c646850d6715c46d8b67f683', '一会议室(五楼)', '一会议室(五楼)', 'meetingPlace', '一会议室(五楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('500', '144', '0', '无试用期', 'probationperiod', '无试用期', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('501', '144', '1', '试用期一个月', 'probationperiod', '试用期一个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('502', '144', '2', '试用期两个月', 'probationperiod', '试用期两个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('502f62cdde60771d02399b8cd345c084', 'bdb79cde74266f58bae93ca65f862efa', '18', '永川区', 'regionType', '永川区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:09', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('503', '144', '3', '试用期三个月', 'probationperiod', '试用期三个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('504', '144', '6', '试用期六个月', 'probationperiod', '试用期六个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('505', '145', '1', '前端', 'workposition', '前端', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('506', '145', '2', '开发', 'workposition', '开发', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('507', '145', '3', '测试', 'workposition', '测试', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('508', '145', '4', '运维', 'workposition', '运维', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('509', '145', '5', '产品', 'workposition', '产品', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('50abcb970c05426fa5d32b92e30369e8', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'BACK', '驳回', 'contractStatus', '驳回', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('510', '145', '6', '人事', 'workposition', '人事', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('511', '145', '7', '财务', 'workposition', '财务', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5118829ca0a2bef6d080c234973dbb68', 'df9cfe7d46016f258f7be32dfc84873d', '3', '个人独资企业营业执照', 'licenseType', '个人独资企业营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('513', '138', '1', '支付状态', '实习生', '描述', 0, '2021-06-23 09:42:20', '2021-06-23 09:42:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('514', '138', '2', '支付过程', '实习生', '描述', 0, '2021-06-23 09:42:35', '2021-06-23 09:42:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5335d331aa44da3ec99605eabe4ca503', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'END', '单据已作废', 'contractStatus', '单据已作废', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('535f11da16cf02e5fb48258ed58ccaf6', '0f2920b2ec620be14598ff21dc92b238', '教育', '教育', 'jvsapp', NULL, 1, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('53b84a438124c89f80d3574a06521e98', 'df9cfe7d46016f258f7be32dfc84873d', '4', '个人独资企业分支机构营业执照', 'licenseType', '个人独资企业分支机构营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('54b0e6de8d33b41a859e8df4d6a47ef5', 'bdb79cde74266f58bae93ca65f862efa', '21', '铜梁区', 'regionType', '铜梁区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('56325080ee5d43a4f3300bc6f8c48a0a', 'a9d16a3c562968e982fd64cdb6af1abc', '1', '大厅会议室', 'roomType', '大厅会议室', 0, '2021-08-09 17:45:47', '2021-08-09 17:45:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('591', '168', '男', '男', '性别', NULL, 0, '2021-06-25 14:45:24', '2021-06-25 14:45:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('592', '168', '女', '女', '性别', NULL, 0, '2021-06-25 14:45:24', '2021-06-25 14:45:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5c8577f3b805d063a35cb972fc433d6c', '8fe320325009e65644c36d1b16574531', '录入尽职调查信息', '录入尽职调查信息', 'processTagType', '录入尽职调查信息', 0, '2021-07-23 10:17:22', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5d1d6616b88961cedb73a42f6be6cebc', '614bb08c1dfcab7366a47e1aafca8374', 'dsc', 'scd', 'dsvfdvcsxz', 'sd', 0, '2021-11-01 15:33:22', '2021-11-01 15:33:22', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5e42a1cf879d6f2e0c66b90e0669ead0', '78a9b6c9cc81d2348ee2034fdf69d34d', '5', '逾期(已确认)', 'RepayStatus', '逾期(已确认)', 5, '2021-07-21 11:20:04', '2021-07-21 11:22:18', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5ea035b2ba090c5eef8d3426398a1910', '7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'BREAK_UP', '已结束', 'meetingStatus', '已结束', 0, '2021-08-28 18:17:30', '2021-08-28 18:17:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('600', '138', '3', '3', '实习生', '3', 0, '2021-07-06 14:03:54', '2021-07-06 14:03:54', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('604', '176', '33', '33', '数据权限', '33', 0, '2021-07-06 14:12:51', '2021-07-06 14:12:51', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('605', '177', '1233', '1233', '123', '1233', 0, '2021-07-06 15:35:08', '2021-07-06 15:35:08', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('606', '177', '3211', '3211', '123', '3211', 0, '2021-07-06 15:35:20', '2021-07-06 15:35:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('609b32d3135fa6f7fdc190e8cd36f7d1', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'SEALING', '用印中', 'contractStatus', '用印中', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('617d071f126850b2d36c7eb25f4a825c', '78a9b6c9cc81d2348ee2034fdf69d34d', '8', '部分还款', 'RepayStatus', '部分还款', 8, '2021-07-21 11:20:04', '2021-07-21 11:22:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('61df564307d13a9f9111e7de72fce52d', 'bdb79cde74266f58bae93ca65f862efa', '15', '长寿区', 'regionType', '长寿区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('625', '185', '重庆进出口融资担保有限公司', 'website_title', 'website_title', '网站标题', 0, '2021-07-07 17:04:03', '2021-07-07 17:04:03', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('626', '186', '进出口担保,担保', 'SEO', 'SEO', 'SEO关键词', 0, '2021-07-07 17:04:56', '2021-07-07 17:04:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('628', '106', '123', '123', 'aa', '123', 0, '2021-07-12 09:30:59', '2021-07-12 09:30:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('629', '108', 'test03', 'test03', 'df ', 'test03', 0, '2021-07-12 09:31:22', '2021-07-12 09:31:22', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('634f61c3bd3f73d80b51c0956807d46e', '3b5b12eab32ccb710807ab3a708851dc', '生活娱乐', '生活娱乐', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/c/a/8/9/c/a21fc45aa1cdd45c84df555c954254c7.svg', 7, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6384a8370cca58bfb4299c377e926f24', '78a9b6c9cc81d2348ee2034fdf69d34d', '9', '部分还款', 'RepayStatus', '部分还款', 9, '2021-07-21 11:20:04', '2021-07-21 11:22:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6460cfadba72b47c839066b316478717', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'AUDITING', '审核中', 'contractStatus', '审核中', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('698d13accc055dd8b83c74e5747188da', 'b5c521d6c646850d6715c46d8b67f683', '二会议室(四楼)', '二会议室(四楼)', 'meetingPlace', '二会议室(四楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('69c6153022acd50b38cefd293e9d8029', 'df9cfe7d46016f258f7be32dfc84873d', '1', '企业法人营业执照', 'licenseType', '企业法人营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('6a4cbd198e9141f2689eebbb6b010e61', '45f03afb7cab252998c9cb9c6b1bc0c6', '4', '百度', 'sales_customer_channel', '百度', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6bad60f4631cc95f11e75b8648dfa32a', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', '访问应用', 'jvs_app_links', '', 3, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6c0e897b11e3163416b1513c25eb055e', '8fe320325009e65644c36d1b16574531', '风控审查审批', '风控审查审批', 'processTagType', '风控审查审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6ec0e94c4df6128cd8e732b04602677c', '78a9b6c9cc81d2348ee2034fdf69d34d', '7', '部分还款', 'RepayStatus', '部分还款', 7, '2021-07-21 11:20:04', '2021-07-21 11:22:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('74a49872044084c38c45b45d50c4af95', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('75a06fdde04fa2eee1674affc981fbbb', '8fe320325009e65644c36d1b16574531', '执行监事审批', '执行监事审批', 'processTagType', '执行监事审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7ac9a513093dfb5c4d979fe67cade856', 'bdb79cde74266f58bae93ca65f862efa', '14', '黔江区', 'regionType', '黔江区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7b8fd841c4d571adc4e2845d6c8f39b3', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_3', '应出具保留意见的审核报告', 'auditOpinionTypes', '应出具保留意见的审核报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d03e62afcef75c479af01e15da29d43', '1059438e8c74d226182966a2a0460597', '2', '利随本清', 'backType', '利随本清', 0, '2021-08-11 10:03:06', '2021-08-11 10:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d09ffd2df019d287573c216d90acdd8', 'bdb79cde74266f58bae93ca65f862efa', '5', '江北区', 'regionType', '江北区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d6d7bc4f4b985f4bcf7fa48a6698988', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'CONFIRMED', '已确认未用印', 'contractStatus', '已确认未用印', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d83d472c910aa1e77d6a2f0d8a2900b', '0f2920b2ec620be14598ff21dc92b238', '人事', '人事', 'jvsapp', NULL, 5, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7ece768fed6d2040c2b967f4cd23a8a8', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', '如何搭建应用', 'jvs_app_links', '', 1, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7f98e545517c6681bde831c7624f4ee5', '8dd3ab5dcb3edf54640e6b2f7c0d9148', 'RISK_HANDLE', '风险处置会', '会议类型', '风险处置会', 0, '2021-08-28 18:18:10', '2021-08-28 18:18:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('80eaa76d6d757d333b832c7313b8f16d', '1617f421bfcc4b83f09b59ad21bc9133', '0', '支持', 'sales_customer_attitude', '支持', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('812a51f2bae8765f17020b01bc85d754', 'e113a39dd3d9b0f785b5b54a25b03e96', 'AA-', 'AA-', 'customerCreditLevel', 'AA-', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('847be73efce145d5760c21aa6a324890', '126ceca0dc43d3f84df03221a09b3c75', '3', '湖南分公司', 'parent_company', '湖南分公司', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8639e1cae14dcb14890d8da5ac2d9aa4', 'bdb79cde74266f58bae93ca65f862efa', '19', '南川区', 'regionType', '南川区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('884d95a240622145423b3e12337d9b0e', '126ceca0dc43d3f84df03221a09b3c75', '2', '四川分公司', 'parent_company', '四川分公司', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8bad4f3ddb790a4b2023593ab8cd992f', 'e113a39dd3d9b0f785b5b54a25b03e96', 'F', 'F', 'customerCreditLevel', 'F', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8c6d5d7ba1777512e1d6b4fcee3ec928', '0f2920b2ec620be14598ff21dc92b238', '生产管理', '生产管理', 'jvsapp', NULL, 0, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('90b4c081c3b07e178b7aa49492c07062', 'bdb79cde74266f58bae93ca65f862efa', '16', '江津区', 'regionType', '江津区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('927c5c0d2e94c26c9d650c9dd2ba7fe4', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-03-24 10:24:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('928d68742cb7f1457eb980b8190a9118', '45f03afb7cab252998c9cb9c6b1bc0c6', '0', '今日头条', 'sales_customer_channel', '今日头条', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('92dded75dfe1ab019ab015de72d2b65a', 'ddf4becc7bdbb0c482bff051166cb54c', 'ZC', '草稿', '321', '草稿', 0, '2021-08-28 18:59:52', '2021-08-28 18:59:52', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('93de132971ad9e16be34634f1a8c7e58', '78a9b6c9cc81d2348ee2034fdf69d34d', '2', '提前部分还款', 'RepayStatus', '提前部分还款', 2, '2021-07-21 11:20:04', '2021-07-21 11:22:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('97afe9d53cda98cf3cc6060f6e2cec6b', '8fe320325009e65644c36d1b16574531', '执行董事审批', '执行董事审批', 'processTagType', '执行董事审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('97bc19d5b7354483645e02a7060f724f', '36f93f7c4afff1d0071864e7020fbfe5', '3', '进行中', 'meetStatus', '进行中', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('98f70239324d8a369603cab1301267e3', 'fec53be21d29d0cbf2c8683724dc9e80', '1', '全部', 'companyScale', '全部', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9c9b200e02b2523cf1663f797e8db094', 'bdb79cde74266f58bae93ca65f862efa', '17', '合川区', 'regionType', '合川区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9cb5d4112578e01af9a8bb52efb30187', '8fe320325009e65644c36d1b16574531', '打印申请单', '打印申请单', 'processTagType', '打印申请单', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9cbffe0ed24b4ab57807f3d73aabdbb5', 'bdb79cde74266f58bae93ca65f862efa', '22', '潼南区', 'regionType', '潼南区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9d34bb22cb7fcb7f1c1bff497bdd02a1', '7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'NOT_BEGIN', '未开始', 'meetingStatus', '未开始', 0, '2021-08-28 18:17:30', '2021-08-28 18:17:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9d9645b88bb6b76106138a2613db6003', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9e293a702be8388c82205899a5bece10', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_5', '应出具带强调查事项无保留意见的审计报告', 'auditOpinionTypes', '应出具带强调查事项无保留意见的审计报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9e85d2bb7360e9ea41cfa59a466ee576', '8fe320325009e65644c36d1b16574531', '风控初审', '风控初审', 'processTagType', '风控初审', 0, '2021-07-23 10:17:47', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9fda2ffb907890450a7fd5fc61c71d02', '8fe320325009e65644c36d1b16574531', '部门放款审批', '部门放款审批', 'processTagType', '部门放款审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a03952976f61cbc51e862f9b1c6735d6', '0f2920b2ec620be14598ff21dc92b238', '为你推荐', '为你推荐', 'jvsapp', NULL, 6, '2022-01-19 15:39:10', '2022-01-19 15:39:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a18df47d5396242e29d9dbe255a2e978', '91d9e2833ee1be20f98f09477766a7d4', '1', '银行', 'channelType', '银行', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a4c636cda323f9e3b3171e0ca9ffa53f', '8dd3ab5dcb3edf54640e6b2f7c0d9148', 'PROJECT_REVIEW', '项目评审会', '会议类型', '项目评审会', 0, '2021-08-28 18:18:10', '2021-08-28 18:18:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a5c09f93f726db4d44b12a9c54842679', '8fe320325009e65644c36d1b16574531', '风控部副经理审批', '风控部副经理审批', 'processTagType', '风控部副经理审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a5d251077fd70ba2fc2067345a61df4c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=8dc70857ce981f28921a3950101c761a&security=false&key=e05146dace9b9f4cb6954fb5a91f10c2', 'form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-03-24 11:10:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a5d86c7704301a95fdea0d0cd77a66e0', 'dc06f6585bb28fc6fbee85a6335d83ad', '2', '民营', 'companyType', '民营', 0, '2021-08-11 10:07:37', '2021-08-11 10:07:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a68ffdb50ea744e6ddf1f85a374a7a0b', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a6b693e621c4cd16c7e219db327b525f', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'DRAFT', '草稿/暂存', 'contractStatus', '草稿/暂存', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a766b943a3d143f126756d300448a8dd', '91d9e2833ee1be20f98f09477766a7d4', '3', '信托公司', 'channelType', '信托公司', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a818ac1b25fc98f47c1a98b28b84bb5e', 'fec53be21d29d0cbf2c8683724dc9e80', '3', '101~500', 'companyScale', '101~500', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('aaa2ca0e79c4629c89d8d7a59c8317a5', 'bdb79cde74266f58bae93ca65f862efa', '2', '涪陵区', 'regionType', '涪陵区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:12', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('aecfaf5e10304d2b3fe2ba211184690e', 'fec53be21d29d0cbf2c8683724dc9e80', '5', '1000+', 'companyScale', '1000+', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('af4fe0c13ec979426f15f6f8d4aedeb6', 'bdb79cde74266f58bae93ca65f862efa', '4', '大渡口区', 'regionType', '大渡口区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:12', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('af9578c6508c06b89d94ea18e0725e3d', '0c293703b963c510f1245e1948ba3a85', '其他', '其他', 'moneyType', '其他', 0, '2021-07-23 10:47:01', '2021-07-23 10:47:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('afa9b05239c9a3b81483722592ff9aa2', 'b5c521d6c646850d6715c46d8b67f683', '保理公司会议室', '保理公司会议室', 'meetingPlace', '保理公司会议室', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b138666fecc64c1d1a6e5b6be6c3a31f', '8fe320325009e65644c36d1b16574531', '关闭订单', '关闭订单', 'processTagType', '关闭订单', 0, '2021-08-02 19:30:24', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b1f5753468264d53fc1013c157dedade', '8fe320325009e65644c36d1b16574531', '会计审批', '会计审批', 'processTagType', '会计审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b23c02c4da403616968fad3a67dc8c9c', 'fbf99c70ff934a58f0ecfb2d4f588c63', '测试类', '测试类', 'design_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/2/c/7/8/eef9b77b2fde0953c98d205e72bd4a8b.svg', 1, '2022-01-14 16:36:46', '2022-01-14 16:36:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b322217867157b2a636a07f31fab2bff', '36f93f7c4afff1d0071864e7020fbfe5', '4', '已结束', 'meetStatus', '已结束', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b3bc5db07200c645b6c1defb46d16b73', '45f03afb7cab252998c9cb9c6b1bc0c6', '2', '51CTO', 'sales_customer_channel', '51CTO', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b6a50f01dd0cd13f8daaf20b3412ecb9', 'b5c521d6c646850d6715c46d8b67f683', '四会议室(二楼)', '四会议室(二楼)', 'meetingPlace', '四会议室(二楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b7fb91083ef434f3da27f34554cb8aeb', 'bdb79cde74266f58bae93ca65f862efa', '12', '渝北区', 'regionType', '渝北区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:12', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b8b5b1956f123cf808a156655a8d469a', 'fc6c2e78401d14cc7125de54877e4f9f', '面条抄手', '面条抄手', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b8d81d8de18fd1eb340897e6924df04f', 'fc6c2e78401d14cc7125de54877e4f9f', '小吃零嘴', '小吃零嘴', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('bde8d1f136b7dcd7e082046894682e6d', 'bdb79cde74266f58bae93ca65f862efa', '20', '璧山区', 'regionType', '璧山区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('bf601879d1eb2ab9722de3d0b4c36e49', 'bdb79cde74266f58bae93ca65f862efa', '24', '开州区', 'regionType', '开州区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('c31ff31ca6a95ce691a335edc76dc7c5', 'df9cfe7d46016f258f7be32dfc84873d', '2', '营业执照', 'licenseType', '营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('c699533396ed895f620d96d9aa5847c4', 'bdb79cde74266f58bae93ca65f862efa', '9', '北碚区', 'regionType', '北碚区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('c99bae1554262fefb800b0e4e242c383', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'RETURN', '已回传', 'contractStatus', '已回传', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('c9ba013f3aad2f7351358cbc7bd68159', '8fe320325009e65644c36d1b16574531', '部门审核', '部门审核', 'processTagType', '部门审核', 0, '2021-07-23 10:17:47', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cadbd66282f5dc4ead18097932bf3b82', '0f2920b2ec620be14598ff21dc92b238', 'IT服务', 'IT服务', 'jvsapp', NULL, 3, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cb58914370879521b39c57d692c78ac9', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cb82abd0ccff56bd0e218539757fb534', 'fc6c2e78401d14cc7125de54877e4f9f', '炸鸡汉堡', '炸鸡汉堡', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cd47f3596e006b2b0adbb432ba026061', 'bdb79cde74266f58bae93ca65f862efa', '10', '綦江区', 'regionType', '綦江区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cdc8be709706771f83be11580f2841b8', 'dc06f6585bb28fc6fbee85a6335d83ad', '1', '国企', 'companyType', '国企', 0, '2021-08-11 10:07:37', '2021-08-11 10:07:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cff67407552b1fcbe1965a9a32278912', 'ddf4becc7bdbb0c482bff051166cb54c', 'ON', '已提交', '321', '已提交', 0, '2021-08-28 18:59:52', '2021-08-28 18:59:52', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d3133356088dfa727dc5a0f0562df532', 'ce50a4bc4329b0fd47ff7ee619b2a45b', '1', '福利费', '报销类型', '福利费', 0, '2022-05-27 14:19:11', '2022-05-27 14:19:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d434341ed6150704ce3c516ea2a370ef', '7ab996b18d4fa75e8837369f4c071b4a', '1', '农信小贷', 'productType', '农信小贷', 0, '2021-08-11 10:14:39', '2021-08-11 10:14:39', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d4958149e0a596c0af12a2515857b4fe', '3b5b12eab32ccb710807ab3a708851dc', '项目管理', '项目管理', 'knowledge_template_type', 'https://p2.kdvas.wpscdn.cn/kdvcover/file/c/1/f/0/2/5356c73214ec98d6fb392183080aa624.svg', 1, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d527ec617e71a89077857536cb7bf184', '91d9e2833ee1be20f98f09477766a7d4', '2', '证券公司', 'channelType', '证券公司', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d6d74535daf2229ed0f338d85011e572', 'bdb79cde74266f58bae93ca65f862efa', '11', '大足区', 'regionType', '大足区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d73403c96afcfda97ef4a05b99ad747f', '78a9b6c9cc81d2348ee2034fdf69d34d', '4', '逾期', 'RepayStatus', '逾期', 4, '2021-07-21 11:20:04', '2021-07-21 11:22:16', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d80d20e995a77c1b34e38c906dccf8d3', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-03-24 10:25:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d9eaf6c705ee71f27a252c99618e9e15', '2a13720000aa29c7cc890ca05849fb3b', '1', '农村户口', 'residenceType', '农村户口', 0, '2021-07-19 11:26:01', '2021-07-19 11:26:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('da362df6261a7333beded0c240437db1', 'df9cfe7d46016f258f7be32dfc84873d', '5', '合伙企业营业执照', 'licenseType', '合伙企业营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('dc20be837e246563c8d685fa9de43d3f', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_2', '无保留意见的审核报告', 'auditOpinionTypes', '无保留意见的审核报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('dc8f2d5d769b6a04d23843659f9c151e', '36f93f7c4afff1d0071864e7020fbfe5', '2', '待开启', 'meetStatus', '待开启', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('dcb67c9e7cf6c9f416c82c1f4172f983', 'fc6c2e78401d14cc7125de54877e4f9f', '冒菜串串', '冒菜串串', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('dde30be59d5d2b6c617cac148603a22c', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_4', '否定意见的审核报告', 'auditOpinionTypes', '否定意见的审核报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e0021a4926623f625523446c062d6dd1', 'bdb79cde74266f58bae93ca65f862efa', '6', '沙坪坝区', 'regionType', '沙坪坝区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e122ece797e1202b5097df4cffc41891', '174c70bf46c1fb4794fecdba21d1275a', '1', '企业客户', 'custmer_type', '企业客户', 1, '2022-04-19 17:11:14', '2022-04-19 17:11:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e21ced886e03545eefcd024086639e8d', 'bdb79cde74266f58bae93ca65f862efa', '13', '巴南区', 'regionType', '巴南区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e54334255dd7a6cae8eca9839440ba72', '3b5b12eab32ccb710807ab3a708851dc', '热门推荐', '热门推荐', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/2/c/7/8/eef9b77b2fde0953c98d205e72bd4a8b.svg', 0, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e5c6fb62765f0a220d9610061120877f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-03-24 11:10:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e75e44bb2a79eeded1cfdf8d42c5c759', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', 'JVS轻应用可以做什么', 'jvs_app_links', '', 0, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e7c18e2a46b7d82598052176b73f6b3a', 'e113a39dd3d9b0f785b5b54a25b03e96', 'B', 'B', 'customerCreditLevel', 'B', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e7e9bfd6b9a975672aec68ce1acd32ec', 'b5c521d6c646850d6715c46d8b67f683', '三会议室(三楼)', '三会议室(三楼)', 'meetingPlace', '三会议室(三楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e8c95f73055415e95420024d785c5c43', 'bdb79cde74266f58bae93ca65f862efa', '23', '荣昌区', 'regionType', '荣昌区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('eb0ff37d2b5fffb4c7e8ba4afc26f715', '8fe320325009e65644c36d1b16574531', '风控复审', '风控复审', 'processTagType', '风控复审', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('eb70d09865c974618103830c9dfa76d6', 'e113a39dd3d9b0f785b5b54a25b03e96', 'A+', 'A+', 'customerCreditLevel', 'A+', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ec7fde09ec3d7ed383d5e9ae91e83c1c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ed62ba034d8f3a030d70c79d8fc25149', '0f2920b2ec620be14598ff21dc92b238', '客户管理', '客户管理', 'jvsapp', NULL, 9, '2022-01-20 15:30:28', '2022-01-20 15:30:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ede016827329cab9fd3af7519adc94c2', 'e113a39dd3d9b0f785b5b54a25b03e96', 'AAA', 'AAA', 'customerCreditLevel', 'AAA', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ee951217f9827c5ef80d1eba3898f530', 'fbf99c70ff934a58f0ecfb2d4f588c63', '热门推荐', '热门推荐', 'design_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/2/c/7/8/eef9b77b2fde0953c98d205e72bd4a8b.svg', 0, '2022-01-12 16:04:13', '2022-01-12 16:04:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ef0ba42b446f86a4e58b0e31e78fc4ec', '614bb08c1dfcab7366a47e1aafca8374', '5ds', '3ws', 'dsvfdvcsxz', '3wd', 0, '2021-11-01 15:33:36', '2021-11-01 15:33:36', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f0dcf138a62572d27c1ca83fb2856adb', '0f2920b2ec620be14598ff21dc92b238', '办公协作', '办公协作', 'jvsapp', NULL, 2, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f5114297aa352d5bccfa3dcc3c501af5', 'bdb79cde74266f58bae93ca65f862efa', '8', '南岸区', 'regionType', '南岸区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f57f331df2da9f09afc95d99b67c0383', 'bdb79cde74266f58bae93ca65f862efa', '3', '渝中区', 'regionType', '渝中区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f7648b0b708cf807b1f980f52b42d862', '45f03afb7cab252998c9cb9c6b1bc0c6', '3', 'CSDN', 'sales_customer_channel', 'CSDN', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f7d9526875dc0dd22e7aed3418ce6b4f', '8fe320325009e65644c36d1b16574531', '风控部负责人审批', '风控部负责人审批', 'processTagType', '风控部负责人审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f82803033990d46e26c5a27f0e98d44c', '36f93f7c4afff1d0071864e7020fbfe5', '1', '草稿箱', 'meetStatus', '草稿箱', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f8bdeb0542d260c98d44890f15ee004c', '004730a6a64238ea7ca5e39e738c48e8', 'http://knowledge.bctools.cn/#/detail/R7vANz《无忧·任务管理产品说明书（V2.1.3）》(文章)', 'event-auto-help', 'jvs-teamwork-ui-help-url', 'http://knowledge.bctools.cn/#/detail/R7vANz《无忧·任务管理产品说明书（V2.1.3）》(文章)', 0, '2022-06-21 10:47:42', '2022-06-21 10:47:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('fa1083f6ec608ef72921833fe49bd5fe', 'e113a39dd3d9b0f785b5b54a25b03e96', 'A', 'A', 'customerCreditLevel', 'A', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('fc6c2e78401d14cc7125de54877e4f93', 'fc6c2e78401d14cc7125de54877e4f9d', 'jvs如何是否开源', 'jvs如何是否开源', 'document-frequency', NULL, 0, '2022-01-06 16:57:11', '2022-01-06 17:19:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('fc6c2e78401d14cc7125de54877e4f9d', 'fc6c2e78401d14cc7125de54877e4f9d', '如何快速部署jvs项目', '如何快速部署jvs项目', 'document-frequency', NULL, 0, '2022-01-06 16:57:11', '2022-01-06 16:57:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('fe7967fc75524aa34f364487512f3631', '0f2920b2ec620be14598ff21dc92b238', '财务报销', '财务报销', 'jvsapp', NULL, 8, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_exec
-- ----------------------------
DROP TABLE IF EXISTS `sys_exec`;
CREATE TABLE `sys_exec` (
  `id` char(50) NOT NULL,
  `bussiness_id` varchar(255) DEFAULT NULL COMMENT '业务id',
  `type` char(50) DEFAULT NULL COMMENT '类型',
  `body` text COMMENT '执行语句',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='函数执行';

-- ----------------------------
-- Records of sys_exec
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` char(50) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名 ',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `bucket_name` varchar(255) DEFAULT NULL COMMENT '桶名',
  `module` varchar(255) DEFAULT NULL COMMENT '模块名',
  `create_time` datetime DEFAULT NULL COMMENT '上传时间',
  `file_path` varchar(400) DEFAULT NULL COMMENT '文件地址',
  `size` bigint(11) DEFAULT NULL COMMENT '文件大小 单位:字节',
  `remark` varchar(255) DEFAULT NULL COMMENT '业务备注',
  `label` varchar(255) DEFAULT NULL COMMENT '标签',
  `file_link` varchar(255) DEFAULT NULL COMMENT '占位字段',
  `tenant_id` char(50) DEFAULT '1' COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `label` (`label`,`file_type`) USING BTREE,
  KEY `label_2` (`label`) USING BTREE,
  KEY `bucket_name` (`bucket_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文件统一管理，不包含租户信息，只做文件转发和统一保存管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES ('ef7640b95905b6844c334a61d86e3eb2', 'Default.jpg', 'image/jpeg', 'jvs-public', 'application', '2022-06-27 19:38:36', 'application/2022/38/35/2022-06-27726159497440956416-Default.jpg', 1006065, NULL, '背景', NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `id` char(50) NOT NULL COMMENT 'id',
  `name` char(10) DEFAULT NULL COMMENT '类型',
  `type` varchar(255) DEFAULT NULL COMMENT '语法',
  `info` text COMMENT '详细描述',
  `body` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统函数';

-- ----------------------------
-- Records of sys_function
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_gateway_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_code`;
CREATE TABLE `sys_gateway_code` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `code` int(4) NOT NULL COMMENT '具体错误码确定',
  `msg` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '错误信息确定，与代码保持一致',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '其它信息备注',
  `matching_method` enum('PreMatch','PostMatch','PerfectMatch') COLLATE utf8mb4_bin DEFAULT 'PerfectMatch' COMMENT '匹配方式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `msg` (`msg`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='code异常码转换关系和业务类型区分表-主要用于网关返回给前端 业务返回，默认在feign标准返回给上层,代码示例为new BusinessException("这是一个测试异常")';

-- ----------------------------
-- Records of sys_gateway_code
-- ----------------------------
BEGIN;
INSERT INTO `sys_gateway_code` VALUES ('1', -2, '登录已失效', '退出的异常code码', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('10', -106, '授权码不正确', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('11', -107, '发布license失败', '发布license失败', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('14', -1, '用户名或密码错误', '用户或密码错误', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('2', -2, 'access token has expired,please reacquire token', '退出的异常code码', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('3', -2, 'Invalid refresh token:', '退出的异常code码', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('4', -100, '授权已过期', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('5', -101, '授权即将到期', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('6', -102, '设备未授权', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('7', -103, 'license验证未通过', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('7845460490562bb0161af28f265d54f4', -1, '您选择的代理用户已将任务转交他人,请重新选择', '1', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('8', -104, '应用未授权', 'License是否包含应用', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('9', -105, 'license格式错误', 'License是否包含应用', 'PerfectMatch');
COMMIT;

-- ----------------------------
-- Table structure for sys_gateway_ignore_encode
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_encode`;
CREATE TABLE `sys_gateway_ignore_encode` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='网关不加密接口，主要是mgr的地址';

-- ----------------------------
-- Records of sys_gateway_ignore_encode
-- ----------------------------
BEGIN;
INSERT INTO `sys_gateway_ignore_encode` VALUES ('1', '/mgr/document/only/office', '获取onlyoffice地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('3', '/mgr/document/dcLibrary/file/get/file/byte/**', '获取文件流下载地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('4', '/mgr/jvs-design/JvsAppTemplate/list', '应用模板列表地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('5', '/mgr/jvs-design/JvsAppTemplate/detail/**', '应用获取详情地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('588828b9c9a6df9720754e827c3a81c6', '/mgr/teamwork-ultimate//project/folder/file/only/office/call', '任务文库文件编辑回调');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('6', '/mgr/jvs-design/JvsAppTemplate/download/**', '应用下载地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('ca2ed1cb6c497c157ae702e656b7af03', '/mgr/jvs-design/api/**', '逻辑引擎API');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('ee267d8c5d6c4a77fdbd27c6a95d414f', '/mgr/teamwork-ultimate//project/master/annex/only/office/call', '任务附件编辑回调');
COMMIT;

-- ----------------------------
-- Table structure for sys_gateway_ignore_ip
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_ip`;
CREATE TABLE `sys_gateway_ignore_ip` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='网关不加密ip地址，主要是mgr的地址';

-- ----------------------------
-- Records of sys_gateway_ignore_ip
-- ----------------------------
BEGIN;
INSERT INTO `sys_gateway_ignore_ip` VALUES ('1', '10.0.0.17', '获取onlyoffice地址');
COMMIT;

-- ----------------------------
-- Table structure for sys_gateway_ignore_path
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_path`;
CREATE TABLE `sys_gateway_ignore_path` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='网关路径忽略';

-- ----------------------------
-- Records of sys_gateway_ignore_path
-- ----------------------------
BEGIN;
INSERT INTO `sys_gateway_ignore_path` VALUES ('10', '/im/**', 'IM消息');
INSERT INTO `sys_gateway_ignore_path` VALUES ('11', '/auth/**', '认证授权地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('112', '/gateway/**', '多关消息注册方法');
INSERT INTO `sys_gateway_ignore_path` VALUES ('12', '/mgr/**', '开发环境默认配置所有,因为现在超级管理员所有权限都没有所以需要放开所有的');
INSERT INTO `sys_gateway_ignore_path` VALUES ('145', '/api/**', '默认api接口开放地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('146', '/oauth/api/dict/list/*', '系统字典查询接口');
INSERT INTO `sys_gateway_ignore_path` VALUES ('148', '/websocket/**', '邮件Websocket放开');
INSERT INTO `sys_gateway_ignore_path` VALUES ('155', '/inside/**', '任务socket');
INSERT INTO `sys_gateway_ignore_path` VALUES ('1f850ac1b510d9f70ac4b77c6dda2282', '/mgr/jvs-design/api/**', '逻辑引擎api');
INSERT INTO `sys_gateway_ignore_path` VALUES ('8eb6ccd391f579f7856342ec63471ab3', '/mgr/jvs-design/screen/use/**', '大屏部署使用地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('cd1b4cbce402d05f9587364f92532ba8', '/task/server/endpoint/**', '任务管理-任务');
COMMIT;

-- ----------------------------
-- Table structure for sys_gateway_ignore_xss
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_xss`;
CREATE TABLE `sys_gateway_ignore_xss` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Xss放开地址';

-- ----------------------------
-- Records of sys_gateway_ignore_xss
-- ----------------------------
BEGIN;
INSERT INTO `sys_gateway_ignore_xss` VALUES ('0a7938b4f1adac5bf5a5d62bd2b1a05f', '/***', '全部放行');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('1', '/auth/**', '授权');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('10', '/mgr/jvs-auth/role/role/**', '角色权限赋予');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('11', '/mgr/document/dcLibrary/save/content/**', '文档保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('112', '/mgr/document/dcLibrary', '文档添加成员');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('12', '/mgr/jvs-design/dynamic/data/**', '列表设计保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('145', '/mgr/jvs-design/data/model/data/**', '数据模型保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('146', '/mgr/document/upload/jvs-knowledge', '知识库上传图片');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('148', '/mgr/jvs-design/form/design/check', '表单内容校验');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('155', '/mgr/jvs-design/page/design/update/**', '表单、工作流、列表页更新');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('ed1c6fb291397dc29ca6b88e602f16ab', '/**', 'ces');
COMMIT;

-- ----------------------------
-- Table structure for sys_gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_route`;
CREATE TABLE `sys_gateway_route` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '备注说明',
  `uri` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='网关路由表';

-- ----------------------------
-- Records of sys_gateway_route
-- ----------------------------
BEGIN;
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('auth', '/auth/**', '权限', 'lb://jvs-auth');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('auth-mgr', '/mgr/jvs-auth/**', '权限', 'lb://jvs-auth-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('design-mgr', '/mgr/jvs-design/**', '低代码', 'lb://jvs-design-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('document', '/mgr/document/**', '知识库', 'lb://document-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('im', '/im/**', 'im', 'lb:ws://im');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('mail', '/websocket/**', 'teamwork-task', 'lb:ws://mail-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('ot', '/api/ot-server', 'ot', 'ws://ot-server:8080');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('plugins', '/api/jvs-knowledge-plugins/config.js', 'plugins', 'lb://document-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('push', '/mgr/message-push/**', 'jvs-message-push', 'lb://message-push-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('teamwork', '/inside/**', 'teamwork', 'lb:ws://message-push-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('teamwork-task', '/task/server/endpoint/**', 'teamwork-task', 'lb:ws://teamwork-ultimate-mgr');
INSERT INTO `jvs`.`sys_gateway_route` (`id`, `path`, `remark`, `uri`) VALUES ('teamwork-ultimate-mgr', '/mgr/teamwork-ultimate/**', 'teamwork-ultimate-mgr', 'lb://teamwork-ultimate-mgr');

COMMIT;

-- ----------------------------
-- Table structure for sys_help
-- ----------------------------
DROP TABLE IF EXISTS `sys_help`;
CREATE TABLE `sys_help` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `client_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `client_name` varchar(255) DEFAULT NULL COMMENT '终端名称',
  `label` varchar(255) NOT NULL COMMENT '帮助Key',
  `type` varchar(255) DEFAULT NULL COMMENT '视频还是连接，直接输入中文即可,\r\n\r\n设计器\r\n     目录\r\n         组件\r\n             视频\r\n             链接\r\n             文本\r\n \r\n\r\n视频\r\n链接\r\n文本\r\n ',
  `parent_id` char(50) DEFAULT '-1' COMMENT '上级ID',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`label`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='所有终端的帮助入口';

-- ----------------------------
-- Records of sys_help
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` char(50) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `tenant_id` char(50) DEFAULT '1' COMMENT '租户ID默认1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='岗位表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` char(50) NOT NULL,
  `business_name` varchar(32) DEFAULT NULL COMMENT '项目名',
  `function_name` varchar(64) DEFAULT NULL COMMENT '功能名',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `method_name` varchar(128) DEFAULT NULL COMMENT '方法名',
  `class_name` varchar(255) DEFAULT NULL COMMENT '类名',
  `thread_user` json DEFAULT NULL COMMENT '当前用户对象JSON',
  `parameters` json DEFAULT NULL COMMENT '请求参数对象JSON',
  `tid` varchar(128) DEFAULT '--' COMMENT 'tid',
  `version` varchar(32) DEFAULT NULL COMMENT '版本号',
  `consuming_time` int(11) DEFAULT NULL COMMENT '耗时',
  `return_obj` json DEFAULT NULL COMMENT '返回对象JSON',
  `status` tinyint(1) DEFAULT '0' COMMENT '返回状态是否是成功',
  `ip` varchar(50) DEFAULT NULL COMMENT '请求IP地址',
  `elements` longtext COMMENT '异常数据JSON',
  `exception_message` text COMMENT '异常消息数据',
  `env` varchar(255) DEFAULT NULL COMMENT '环境参数',
  `api` text COMMENT 'api地址',
  `type` tinyint(1) DEFAULT '1' COMMENT '日志类型:1-AOP拦截,2-过程中的日志,3-自定义日志',
  `user_name` varchar(255) DEFAULT '--' COMMENT '用户名称',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) DEFAULT '--' COMMENT '租户id',
  `operation_type` char(50) DEFAULT '--' COMMENT '操作类型',
  `client_id` char(200) DEFAULT '--' COMMENT '终端',
  `client_name` varchar(255) DEFAULT NULL COMMENT '终端名称',
  `user_id` char(50) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `start_time` (`start_time`) USING BTREE,
  KEY `client_id` (`client_id`(191)) USING BTREE,
  KEY `function_name` (`function_name`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='请求日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` char(50) NOT NULL COMMENT '菜单ID',
  `name` varchar(128) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址（如果为HTTP开头的，为外部地址，如果为/开头的地址，会自动拼接环境配置地址）',
  `parent_id` char(50) DEFAULT '-1' COMMENT '父菜单ID(只支持一层父级),为-1时为最上级',
  `apply_id` char(50) DEFAULT NULL COMMENT '应用ID',
  `layer` int(255) DEFAULT NULL COMMENT '层关系',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '1' COMMENT '默认排序值(用户可搜藏后自定义重新排序)',
  `new_window` tinyint(1) DEFAULT '0' COMMENT '是否新窗口打开',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by_id` char(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('05188fad2900f805d462ec0d3a76bee3', 'fdsafdsa', 'dfsa', 'ecb434e9e9131a7aa63ab75a5627ab2f', 'ea7e4b3d4b0f7957091da0632f22f65d', 3, 'sadf', 1, 0, 0, '2022-11-08 19:20:29', '2022-11-08 19:20:29', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('0b7d7c1fc0412ecbb0344b1ed46f5a4f', '系统管理', NULL, '9d4de661d2888cf0b37cc070642965fa', '1ff53290763d889bb85813d1845b3bc8c', 2, NULL, 1, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('1d1219dd156b6f00cef7afcf0376f3c5', '角色管理', '/jvs-upms-ui/role', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 4, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('3c22bb607e36e6b3b63f7dce9ad1d1a3', 'dsfa', NULL, 'ea7e4b3d4b0f7957091da0632f22f65d', 'ea7e4b3d4b0f7957091da0632f22f65d', 1, NULL, 1, 0, 0, '2022-11-08 19:20:15', '2022-11-08 19:20:15', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('41efeb1a3de895bd91a988fc674df08a', '登录日志', '/jvs-upms-ui/loginlogs', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 9, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('5b0caf87a54457d204667be6808fd459', '数据库', '/jvs-upms-ui/databank', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 13, 0, 0, '2022-10-09 17:09:48', '2022-10-09 17:19:24', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('78890fc1a1b2729833428d3c9eb2e761', '数据智仓', '/jvs-upms-ui/dataintellect', '1ff53290763d889bb85813d1845b3bc8c', '1ff53290763d889bb85813d1845b3bc8c', 1, NULL, 101, 0, 1, '2022-10-09 17:09:33', '2022-10-09 17:18:06', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('7c233a179e4050b2b11d4e710383202e', '团队管理', '/jvs-upms-ui/group', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 1, 0, 0, NULL, '2022-06-27 19:28:43', '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('94c370101f09f399da14ff6ce2e4e4fe', '操作日志', '/jvs-upms-ui/errlogs', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 1, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('9ab1da11f953b5218f17557fbf883324', '数据智仓', '/jvs-upms-ui/dataintellect', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 12, 0, 0, '2022-10-09 17:18:58', '2022-10-09 17:19:17', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('9d4de661d2888cf0b37cc070642965fa', '系统管理', '/', '1ff53290763d889bb85813d1845b3bc8c', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 1, 0, 1, '2022-06-27 19:25:11', '2022-06-27 19:25:11', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('b46a674830edf3c48962395b1bae976c', '公告管理', '/jvs-upms-ui/bulletin', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 11, 0, 0, NULL, '2022-10-09 17:19:11', '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('beb0019b2cc6b0c3deeeb7a698d02568', '登录令牌', '/jvs-upms-ui/onlineUser', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 8, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('dc635856ebc3018b5cda782121eb124c', '文件管理', '/jvs-upms-ui/file', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 10, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('ddf4ab133c0bac34aa9a6833f47e7562', '岗位管理', '/jvs-upms-ui/postList', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 6, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('e999dd44952be57f1b2de6981088fe5a', '用户管理', '/jvs-upms-ui/department', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 5, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('ecb434e9e9131a7aa63ab75a5627ab2f', 'sdaf', NULL, '3c22bb607e36e6b3b63f7dce9ad1d1a3', 'ea7e4b3d4b0f7957091da0632f22f65d', 2, NULL, 1, 0, 0, '2022-11-08 19:20:19', '2022-11-08 19:20:19', '1', '超级管理员', '超级管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `id` char(50) NOT NULL COMMENT '主键',
  `send_type` enum('sms','email','interior','DING_H5','WECHAT_MP_MESSAGE','WX_ENTERPRISE') DEFAULT NULL COMMENT '发送类型\\短信\\邮件\\站内信',
  `send_message_type` enum('broadcast','warning','notification','system','business') DEFAULT NULL COMMENT '消息类型： 广播消息\\警告消息\\通知消息\\系统消息\\业务消息',
  `status` tinyint(5) unsigned NOT NULL DEFAULT '2' COMMENT '发送状态(0失败;1成功;2未发送;3发送中)',
  `send_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息成功发送次数',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `source` varchar(255) DEFAULT NULL COMMENT '消息来源',
  `content` longtext COMMENT '发送内容,如果是邮件和站内信，支持html标签功能',
  `recipients` longtext COMMENT '批量收件人,最多500个，多余500会切分，可能是用户id，可能是用户手机号',
  `other` text COMMENT '发送返回信息,邮件和短信发送的消息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `extension` json DEFAULT NULL COMMENT '用于业务扩展字段方便排查问题',
  `business_id` char(50) DEFAULT NULL COMMENT '业务id',
  `business_name` varchar(255) DEFAULT NULL COMMENT '业务系统,如果业务系统需要发送站内信，直接使用mq-core进行发送即可查收',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `template_id` char(50) DEFAULT NULL COMMENT '模板id值',
  `template_data` longtext COMMENT '模板数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='消息发送日志';

-- ----------------------------
-- Records of sys_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_message_user_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_user_log`;
CREATE TABLE `sys_message_user_log` (
  `id` char(50) NOT NULL COMMENT '主建',
  `user_id` char(50) DEFAULT NULL COMMENT '用户ID',
  `read_status` tinyint(1) DEFAULT '0' COMMENT '读取状态,默认未读',
  `read_time` datetime DEFAULT NULL COMMENT '读取时间',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `hide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏,默认显示',
  `source` varchar(255) DEFAULT NULL COMMENT '消息来源,默认系统发送为系统,人工发送为某个人',
  `send_message_type` enum('broadcast','warning','notification','system','business') DEFAULT NULL COMMENT '消息类型： 广播消息\\警告消息\\通知消息\\系统消息\\业务消息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`,`read_status`,`hide`,`send_message_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='站内信用户消息';

-- ----------------------------
-- Records of sys_message_user_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_opinion
-- ----------------------------
DROP TABLE IF EXISTS `sys_opinion`;
CREATE TABLE `sys_opinion` (
  `id` char(50) NOT NULL COMMENT 'id',
  `text` text,
  `img` text COMMENT '图片',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `create_by_head_img` text COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='意见反馈';

-- ----------------------------
-- Records of sys_opinion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` char(50) NOT NULL COMMENT '主键',
  `permission` varchar(200) DEFAULT NULL COMMENT '资源标识(随机生成-建议使用中文名称进行拼音生成以_分割) 如果添加了忽略字段集，则直接放开即可,如果删除了，会生成uuid进行占位',
  `name` varchar(50) NOT NULL COMMENT '资源名称(为Swagger的注解名，或前端的按钮|资源名称)',
  `api` json DEFAULT NULL COMMENT '请求地址',
  `type` enum('button','remark') NOT NULL COMMENT '按钮、说明',
  `client_name` varchar(50) DEFAULT NULL COMMENT '客户端或服务端名称',
  `menu_id` char(50) NOT NULL COMMENT '将资源挂在菜单上（不能挂一级菜单）',
  `apply_id` char(50) NOT NULL COMMENT '应用ID',
  `remark` json DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='资源数据表，用于统计所有项目的请求地址';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('008a96ccd080df9825a854a80a4385a8', 'upms_systemSetting_page', '查询', '[\"get /api/jvs-auth/index/this/tenant\"]', 'button', NULL, '5626986adcd3b25907ebcbcfc5e15967', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('188e8a0029d15bcf32daac6e7c4ae62f', 'Publish_to_template', '发布到模板', '[]', 'button', NULL, '6eb3657a9dd014868ef2f23fcba7744d', 'bbb46b6e0f779fdb156371548b000ba6', NULL);
INSERT INTO `sys_permission` VALUES ('1e19071f08c6a6e455b8092c0893e835', 'upms_dataAuth_page', '查询', '[\"get /api/jvs-auth/data/page\"]', 'button', NULL, 'd68d57e618aae912474c092779f38202', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('1f93ef281db660a44ff67c03ac38d414', 'upms_group_delete', '删除群组', '[\"delete /api/jvs-auth/user/group/{id}\"]', 'button', NULL, '7c233a179e4050b2b11d4e710383202e', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('20bc106cb5e88fe680b12c97e3a68d80', 'upms_group_remove', '移出成员', '[\"delete /api/jvs-auth/user/group/user/{userId}/{groupId}\"]', 'button', NULL, '7c233a179e4050b2b11d4e710383202e', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('24ef17953dc14ac7f408b138c4df71dd', 'page_application_deploy_template', '发布到模板', '[\"post /mgr/jvs-design/JvsApp/deployTemplate\"]', 'button', NULL, 'cb106a550ca0241e1ebfa068311b1d9d', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('27e43591222e004c7c56b5df4a574535', 'Add_to_Help', '添加到帮助', '[]', 'button', NULL, '6eb3657a9dd014868ef2f23fcba7744d', 'bbb46b6e0f779fdb156371548b000ba6', NULL);
INSERT INTO `sys_permission` VALUES ('30fa28475dc14d28e9d2092a0b2a917e', 'upms_role_permision_menu', '菜单权限', '[\"get /api/jvs-auth/role/role/menus/{roleId}\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('34247c7c395e66155924da21f05c3fcb', 'upms_dict_items_page', '字典项-查询', '[\"get /api/jvs-auth/dict/item/{id}\"]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('3491741e5ac1a1fa45197ce15127d292', 'upms_dept_delete', '删除部门', '[\"delete /mgr/jvs-auth/dept/{id}\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('3929e30e912d7937b3390bc81e7fb48f', 'upms_dict_items_save', '字典项-保存', '[\"post /api/jvs-auth/dict/item/{id}\"]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('3a4c08ab2a8d2742995433efa0a32e48', 'upms_role_add', '新增角色', '[\"post /api/jvs-auth/role/save\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('3b303d7344c685e184990958b73cf480', 'upms_dict_page', '查询', '[\"get /api/jvs-auth/dict/page\"]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('42f550be8c76d32a44dffad5ffbbef50', 'upms_dept_editUser', '编辑成员', '[\"put /api/jvs-auth/user/update\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('43982e2bc69e9e331e545da678a65a44', 'upms_post_add', '添加岗位', '[\"post /api/jvs-auth/job\"]', 'button', NULL, 'ddf4ab133c0bac34aa9a6833f47e7562', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('484521eff1e0f2a4df33f1378426bdb7', 'upms_dict_add', '新增', '[\"post /api/jvs-auth/dict\"]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('4ccf3944529f3524d21e1108458e5d4a', 'upms_post_remove', '移除成员', '[\"delete /api/jvs-auth/job/user/{userId}\"]', 'button', NULL, 'ddf4ab133c0bac34aa9a6833f47e7562', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('511e5bd5abcdd7b46acd5e87c423e705', 'upms_menu_add', '新增菜单', '[\"post /api/jvs-auth/menu/menu\"]', 'button', NULL, '16cd9e27febd5c3e9d2e969f7e5a33f2', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('52d8da9546717bf571545728a90edda0', 'upms_dept_page', '查询', '[\"get /api/jvs-auth/dept/all\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('65093b3bfeefb020813dbd830b980e5a', 'upms_role_delete', '删除角色', '[\"delete /api/jvs-auth/role/{id}\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('6c88ae4ad447f1601ab7b9102ae1c135', 'upms_dict_delete', '删除', '[\"delete /api/jvs-auth/dict/{id}\"]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('763e209c020ada1065d4af9c93ae9b1d', 'upms_systemSetting_save', '保存', '[\"put /api/jvs-auth/tenant/info\"]', 'button', NULL, '5626986adcd3b25907ebcbcfc5e15967', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('7ef6e15541a3dac8ce0ad9d827e6da55', 'upms_menu_delete', '删除菜单', '[\"delete /api/jvs-auth/menu/menu/{id}\"]', 'button', NULL, '16cd9e27febd5c3e9d2e969f7e5a33f2', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('8c81e07aee0ca5b50dc8f79af7f1fe09', 'upms_group_addUser', '添加成员', '[\"put /api/jvs-auth/user/group/user/{groupId}\"]', 'button', NULL, '7c233a179e4050b2b11d4e710383202e', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('941dff68413878c3daca8fedcb91f8ee', 'upms_dept_viewUser', '成员详情', '[]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('9954e6a123d984f17173c44f673410f8', 'upms_role_edit', '修改角色', '[\"put /api/jvs-auth/role/update\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('9ba9749d07788ef7f9d1951eda1636d3', 'upms_role_addUser', '添加人员', '[\"put /api/jvs-auth/role/user/{roleId}\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('a1f6ef3988b2bbb3695381b07dd8a0ce', 'upms_role_permision_data', '数据权限', '[\"get /api/jvs-auth/role/role/data/{roleId}\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('a30398dd2cdc768f41b8827a32c1f4f9', 'upms_post_page', '查询', '[\"get /api/jvs-auth/job/list\"]', 'button', NULL, 'ddf4ab133c0bac34aa9a6833f47e7562', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ac650daceca120b40769ed2c0818d42b', 'upms_dept_addUser', '添加成员', '[\"post /api/jvs-auth/user/save\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ad33654fc3d108bb489ded4493bd473d', 'upms_dept_invite', '邀请成员', '[\"get /api/jvs-auth/user/get/invite\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('b451106effa87eed57529dccd819d74d', 'upms_explain_edit', '编辑解释', '[]', 'button', NULL, '16cd9e27febd5c3e9d2e969f7e5a33f2', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ba0b8994a586b819411b65c105b37554', 'upms_role_remove', '移出人员', '[\"delete /api/jvs-auth/role/user/{roleId}/{userId}\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('caac8515772f6f2cd06d9b7cae3cac3e', 'upms_dept_disableUser', '禁用成员', '[\"delete /api/jvs-auth/user/users/disabled/{userId}\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('cb4e88e00345f10d443bf2816d67ed63', 'upms_dept_enableUser', '启用成员', '[\"delete /api/jvs-auth/user/users/enable/{userId}\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('cddfb6cd123e7e435608406751ec160b', 'upms_dept_add', '添加部门', '[\"post /api/jvs-auth/dept/save\"]', 'button', NULL, 'e999dd44952be57f1b2de6981088fe5a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('d203a0eb2866fca9943af21d56ffa2c6', 'upms_dataAuth_edit', '编辑', '[\"put /api/jvs-auth/data\"]', 'button', NULL, 'd68d57e618aae912474c092779f38202', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('d2efe80967ebaa3839e49442057207b2', 'upms_group_edit', '编辑群组', '[\"put /api/jvs-auth/user/group\"]', 'button', NULL, '7c233a179e4050b2b11d4e710383202e', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('d5123f9547156fbff96fce86e5338706', 'upms_dataAuth_add', '新增', '[\"get /api/jvs-auth/data/page\"]', 'button', NULL, 'd68d57e618aae912474c092779f38202', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('d61aed962684fe3ab901d3e1bbb65ebe', 'upms_post_addUser', '添加成员', '[\"put /api/jvs-auth/job/user/{jobId}\"]', 'button', NULL, 'ddf4ab133c0bac34aa9a6833f47e7562', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('dcbe95135136006d44e9186804c457bd', 'upms_post_delete', '删除岗位', '[\"delete /api/jvs-auth/job/{jobId}\"]', 'button', NULL, 'ddf4ab133c0bac34aa9a6833f47e7562', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('e0c48892edafbb5430daa831d58552e9', 'upms_login_log', '查询', '[\"get /api/jvs-auth/login/log/page\"]', 'button', NULL, '41efeb1a3de895bd91a988fc674df08a', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('e72a6e1d549a9384ff7521a9682d9ae1', 'upms_resource_edit', '编辑资源', '[\"post /api/jvs-auth/permission/permission/{menuId}\"]', 'button', NULL, '16cd9e27febd5c3e9d2e969f7e5a33f2', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('e86c863ff5ceca09706840e5a2b8d553', 'upms_dataAuth_delete', '删除', '[\"delete /api/jvs-auth/data/{id}\"]', 'button', NULL, 'd68d57e618aae912474c092779f38202', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('e8c3269e3e1a8e69bb98d0d1485bc5d6', 'upms_group_add', '添加群组', '[\"post /api/jvs-auth/user/group\"]', 'button', NULL, '7c233a179e4050b2b11d4e710383202e', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('e9dfa603521d01a5576c12043e60e1ed', 'upms_menu_edit', '编辑菜单', '[\"put /api/jvs-auth/menu/menu\"]', 'button', NULL, '16cd9e27febd5c3e9d2e969f7e5a33f2', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ea7d0b0ffe99db502355d09fcc2a623e', 'upms_role_page', '查询', '[\"get /api/jvs-auth/role/all/{type}\"]', 'button', NULL, '1d1219dd156b6f00cef7afcf0376f3c5', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ed957b733876b4b89beefa938ff5654a', 'upms_post_edit', '编辑岗位', '[\"put /api/jvs-auth/job\"]', 'button', NULL, 'ddf4ab133c0bac34aa9a6833f47e7562', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ee6d7cfd82d01272b148c037365d3246', 'upms_dict_view', '查看', '[]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('ef61cddc42ffc10215d376e0f9b9b0c1', 'upms_dict_edit', '编辑', '[\"put /api/jvs-auth/dict\"]', 'button', NULL, '7be8c08582dd3a1b80787b80e650ab85', '1ff53290763d889bb85813d1845b3bc8c', NULL);
INSERT INTO `sys_permission` VALUES ('fd2a13109dcdac5d2d2c4248e580851f', '', '查询', '[\"get /api/jvs-auth/user/group/list\"]', 'button', NULL, '7c233a179e4050b2b11d4e710383202e', '1ff53290763d889bb85813d1845b3bc8c', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `role_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色解释',
  `type` enum('tenantRole','userRole') COLLATE utf8mb4_bin DEFAULT 'userRole' COMMENT '系统角色、租户角色',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` char(50) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '租户ID默认1',
  `ds_type` enum('all','oneself','subordinate','custom') COLLATE utf8mb4_bin DEFAULT 'all' COMMENT 'all:所有部门\r\noneself: 当前部门\r\nsubordinate:当前部门及以下部门\r\ncustom:自定义部门集使用,分割',
  `data_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所有的部门数据集IDS,当ds_type为custom,时，此字段才会生效',
  `auto_grant` tinyint(1) DEFAULT '0' COMMENT '加入组织后是否自动赋予该权限,此角色不允许删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('5b41137255bf881b74c645cb8862464c', '应用管理员', '应用管理员角色, 此角色信息不能删除', 'userRole', '2021-11-18 14:35:12', '2022-05-13 10:20:57', 0, '1', 'all', NULL, 1);
INSERT INTO `sys_role` VALUES ('b16a6b13e98b6eba6770e7ca0ccd4364', '系统管理员', '系统管理员', 'tenantRole', '2021-09-07 18:08:39', '2022-06-24 12:25:27', 0, '1', 'all', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `role_id` char(50) NOT NULL COMMENT '角色ID',
  `type` enum('menu','button') NOT NULL COMMENT '资源类型(数据权限，和网络权限，菜单,、租户，分别对应的为sys_permission\\sys_menu\\sys_tenant',
  `permission_id` char(50) NOT NULL COMMENT '资源ID',
  `apply_id` char(50) DEFAULT NULL COMMENT '应用id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('5b41137255bf881b74c645cb8862464c', 'menu', '7851fc6a7f6e2c81bde8b2fb0b085a6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('5b41137255bf881b74c645cb8862464c', 'menu', '9d4de661d2888cf0b37cc070642965fa', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_sql
-- ----------------------------
DROP TABLE IF EXISTS `sys_sql`;
CREATE TABLE `sys_sql` (
  `id` char(50) NOT NULL COMMENT '主键',
  `application_name` varchar(40) DEFAULT NULL COMMENT '服务名',
  `executed_sql` text COMMENT '执行SQL',
  `start_time` datetime DEFAULT NULL COMMENT '执行时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `consuming_time` int(2) DEFAULT NULL COMMENT '消耗时间',
  `tenant_id` char(50) DEFAULT '1' COMMENT '租户ID默认1',
  `slow_sql` tinyint(1) DEFAULT NULL COMMENT '是否是慢sql',
  `access_type` varchar(255) DEFAULT NULL COMMENT '访问类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `application_name` (`application_name`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='SQL执行记录';

-- ----------------------------
-- Records of sys_sql
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` char(50) NOT NULL COMMENT '公司ID',
  `name` varchar(80) NOT NULL COMMENT '公司全称',
  `short_name` varchar(20) NOT NULL COMMENT '系统名称',
  `addr` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `desc_msg` varchar(500) DEFAULT NULL COMMENT '公司简介',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `admin_user_account` varchar(60) DEFAULT NULL COMMENT '管理员帐号',
  `admin_user_id` varchar(64) NOT NULL COMMENT '管理员Id',
  `login_domain` varchar(255) DEFAULT NULL COMMENT '登录域名',
  `default_index_url` varchar(255) DEFAULT NULL COMMENT '默认首页',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0禁用',
  `icon` varchar(400) DEFAULT '/jvs-ui-public/icon/icon.ico' COMMENT 'icon',
  `logo` varchar(400) DEFAULT '/jvs-ui-public/img/logo.jpg' COMMENT 'logo',
  `bg_img` varchar(400) DEFAULT '/jvs-ui-public/img/backImg.jpg' COMMENT '背景图',
  `parent_id` char(50) DEFAULT NULL COMMENT '上级租户id,如果是顶级租户，该值和顶级租户的id一样',
  `remark` json DEFAULT NULL COMMENT '备注其它信息\r\n',
  `default_password` varchar(255) DEFAULT NULL COMMENT '用户默认密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公司租户管理';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
BEGIN;
INSERT INTO `sys_tenant` VALUES ('1', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', '测试地址', '此为测试企业信息，如果需要私有化部署请联系我们。', '2022-06-29 10:22:49', '2021-08-27 17:41:28', '0', NULL, '1', 'aaa', NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg', NULL, '{}', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '用户',
  `real_name` varchar(255) COLLATE utf8mb4_bin DEFAULT 'JVS用户' COMMENT '真名',
  `user_type` enum('BACKEND_USER','FRONT_USER','OTHER_USER') COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户类型。\r\n1、后端用户\r\n2、业务用户\r\n',
  `account_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '帐号名',
  `email` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮件',
  `head_img` varchar(255) COLLATE utf8mb4_bin DEFAULT '/jvs-ui-public/img/headImg.png' COMMENT '头像',
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT '$2a$10$rV8aIFfDTg6G2SsQdkE9C.Be1kFb0kery5akAh8pdjc3C9c.6lLiu' COMMENT '密码(默认123456)',
  `phone` char(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `cancel_flag` tinyint(1) DEFAULT '0' COMMENT '0-正常，1- 注销  不要逻辑删除，删除后，业务找不到数据',
  `sex` enum('male','female','unknown') COLLATE utf8mb4_bin DEFAULT 'unknown' COMMENT '性别 ',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `invite` char(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邀请用户的ID做上下级关系',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`account_name`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE COMMENT '手机号索引全局唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '超级管理员', NULL, 'admin', NULL, '/jvs-ui-public/img/headImg.png', '$2a$10$rV8aIFfDTg6G2SsQdkE9C.Be1kFb0kery5akAh8pdjc3C9c.6lLiu', '17323369667', '2021-03-29 17:59:56', '2022-05-09 21:37:26', 0, 'male', '2021-08-27', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_extension
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_extension`;
CREATE TABLE `sys_user_extension` (
  `id` char(50) NOT NULL COMMENT '主鍵',
  `user_id` char(50) DEFAULT NULL COMMENT '用户ID',
  `type` varchar(64) NOT NULL COMMENT '三方类型',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称显示',
  `open_id` char(50) DEFAULT NULL COMMENT '三方唯一键',
  `extension` json DEFAULT NULL COMMENT '三方信息扩展字段',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` json DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of sys_user_extension
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_external_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_external_group`;
CREATE TABLE `sys_user_external_group` (
  `id` char(50) NOT NULL,
  `user_id` char(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '分组名称',
  `del_flag` char(2) DEFAULT '0' COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `config_id` char(50) DEFAULT NULL COMMENT '邮箱配置id',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `dept_id` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `job_id` char(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='外部用户分组';

-- ----------------------------
-- Records of sys_user_external_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_external_mail
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_external_mail`;
CREATE TABLE `sys_user_external_mail` (
  `id` char(50) NOT NULL,
  `user_id` char(50) DEFAULT NULL COMMENT '用户id（发送人）',
  `group_id` char(50) NOT NULL DEFAULT '0' COMMENT '分组id',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `del_flag` char(2) DEFAULT '0' COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='外部用户邮箱';

-- ----------------------------
-- Records of sys_user_external_mail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group` (
  `id` char(50) COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户组名称',
  `principal_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人姓名',
  `principal_id` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人id',
  `users` json DEFAULT NULL COMMENT '用户数组对象',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建人',
  `tenant_id` char(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户组';

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_invite
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_invite`;
CREATE TABLE `sys_user_invite` (
  `id` char(50) NOT NULL COMMENT '主键',
  `user_id` char(50) DEFAULT NULL COMMENT '用户ID',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邀请用户待审核';

-- ----------------------------
-- Records of sys_user_invite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_level
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_level`;
CREATE TABLE `sys_user_level` (
  `id` char(50) DEFAULT NULL COMMENT '主键',
  `name` char(50) DEFAULT NULL COMMENT '用户等级名称',
  `sort` int(11) DEFAULT NULL COMMENT '等级排序',
  `index_url` char(255) DEFAULT NULL COMMENT '用户等级首页',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户等级';

-- ----------------------------
-- Records of sys_user_level
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log` (
  `id` char(50) NOT NULL COMMENT '主键',
  `user_id` char(50) DEFAULT NULL COMMENT '用户id',
  `account_name` varchar(255) DEFAULT NULL COMMENT '帐号',
  `real_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `operate_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `device` varchar(255) DEFAULT NULL COMMENT '设备',
  `user_agent` varchar(999) DEFAULT NULL COMMENT '请求标识头',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '登录成功状态',
  `login_type` varchar(255) DEFAULT NULL COMMENT '登录类型',
  `client_id` char(200) DEFAULT NULL COMMENT '终端',
  `tenant_name` char(255) DEFAULT NULL COMMENT '公司名称',
  `tenant_short_name` varchar(255) DEFAULT NULL COMMENT '简称',
  `client_name` varchar(255) DEFAULT NULL COMMENT '终端名称',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='逻辑定义数据';

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_login_log` VALUES ('2477ff2232283be58586c82a988984ff', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:42:47', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('323d883e90c2adb77f8b78df88be03e8', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:34:04', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('403274b2ceaae9c461444657d608daa3', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:24:02', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('45615c9f32a66dfa8b99b924ae340278', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:26:07', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('5b96bb0f538b3c33ff7869b0fdc19ccb', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:27:38', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('5fed1c05e3380ac0d8e9a969e08c250a', '1', 'admin', '超级管理员', '172.19.0.1', '2022-12-22 10:38:32', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('7885ff78e4c45fe30de477708bcd3d44', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:40:28', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('bb0221bbcf96136c9d0394d9c524fecd', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:27:55', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('c35da992f140a5195b2576ca57494474', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:27:31', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
INSERT INTO `sys_user_login_log` VALUES ('e2dd820d09c23be551c808b7c8152dad', '1', 'admin', '超级管理员', '\" 局域网\"(172.19.0.1)', '2022-12-22 10:46:03', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', NULL, 0, 1, '帐号密码', 'frame', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', 'JVS开发务平台', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_mail_config`;
CREATE TABLE `sys_user_mail_config` (
  `id` char(50) NOT NULL COMMENT 'id',
  `sys_user_id` char(50) NOT NULL COMMENT 'sys_user -> id',
  `mail_type` varchar(50) NOT NULL COMMENT '邮箱类型',
  `account` varchar(50) NOT NULL COMMENT '账号名称',
  `send_host` varchar(255) DEFAULT NULL COMMENT '服务器地址（发送)',
  `send_port` int(32) DEFAULT NULL COMMENT '端口（发送)',
  `accept_host` varchar(255) DEFAULT NULL COMMENT '服务器地址（接受）',
  `accept_port` varchar(255) DEFAULT NULL COMMENT '端口（接受）',
  `accept_ssl` int(1) DEFAULT '0' COMMENT '0 未勾选 1 勾选',
  `send_ssl` int(1) DEFAULT '0' COMMENT '0 未勾选 1 勾选',
  `username` varchar(255) DEFAULT NULL COMMENT '邮箱名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `accept_protocol` varchar(255) DEFAULT NULL COMMENT '接受协议（POP/IMAP）',
  `send_protocol` varchar(20) DEFAULT NULL COMMENT '发送协议（SMTP）',
  `default_encoding` varchar(20) DEFAULT NULL COMMENT '编码',
  `jndi_name` varchar(255) DEFAULT NULL COMMENT 'Session JNDI name. When set, takes precedence over other Session settings.',
  `use_way` bigint(1) DEFAULT '0' COMMENT '是否启用 0是未启用 1是启用',
  `del_flag` char(2) DEFAULT '0' COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_user_id` (`sys_user_id`) USING BTREE COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='个人邮箱配置';

-- ----------------------------
-- Records of sys_user_mail_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` char(50) NOT NULL COMMENT '用户ID',
  `role_id` char(50) NOT NULL COMMENT '角色ID',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '5b41137255bf881b74c645cb8862464c', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_tenant`;
CREATE TABLE `sys_user_tenant` (
  `id` char(50) NOT NULL COMMENT '主键',
  `real_name` varchar(255) DEFAULT NULL COMMENT '用户名称,对应用户真名',
  `user_id` char(50) NOT NULL COMMENT '用户ID',
  `employee_no` char(50) DEFAULT NULL COMMENT '职工编号',
  `level` char(11) DEFAULT '1' COMMENT '帐号等级',
  `hire_date` date DEFAULT NULL COMMENT '入职时间',
  `job_id` char(50) DEFAULT NULL COMMENT '岗位ID',
  `job_name` char(50) DEFAULT NULL COMMENT '岗位名称',
  `dept_id` char(255) DEFAULT NULL COMMENT '部门ID',
  `dept_name` char(50) DEFAULT NULL COMMENT '部门名称',
  `tenant_id` char(50) NOT NULL DEFAULT '1' COMMENT '租户ID',
  `cancel_flag` tinyint(1) DEFAULT '0' COMMENT '0-正常，1- 注销  不要逻辑删除，删除后，业务找不到数据',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`tenant_id`) USING BTREE COMMENT '租户用户id唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='租户和用户关联表（用于确定某个租户下的所有用户）';

-- ----------------------------
-- Records of sys_user_tenant
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_tenant` VALUES ('1', '超级管理员', '1', '0001', '1', '2018-08-31', NULL, NULL, NULL, NULL, '1', 0, '2022-06-27 17:40:18', '17323369667');
COMMIT;

-- ----------------------------
-- Table structure for sys_wx_mp
-- ----------------------------
DROP TABLE IF EXISTS `sys_wx_mp`;
CREATE TABLE `sys_wx_mp` (
  `id` varchar(50) NOT NULL,
  `subscribe_url` json DEFAULT NULL COMMENT '关注时发送的图片文件 每次修改文件名称不能与上次一样 多条时使用逗号分隔',
  `welcome_text` varchar(255) DEFAULT NULL COMMENT '关注时的欢迎语',
  `keyword_text` varchar(255) DEFAULT NULL COMMENT '关键字信息',
  `keyword_json` json DEFAULT NULL COMMENT '关键字对应的回复内容',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信公众号配置';

-- ----------------------------
-- Records of sys_wx_mp
-- ----------------------------
BEGIN;
INSERT INTO `sys_wx_mp` VALUES ('fc49c834e7d4c48eb38f8ede15a24802', '[]', '欢迎关注!', '欢迎关注!', '[]', '超级管理员', '1', '2022-06-27 19:20:10', '超级管理员', '2022-06-27 19:20:10');
COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(64) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_group` VALUES (4, 'jvs-design-mgr', 'jvs-design-mgr', 0, 'http://172.19.0.15:21734/', '2022-12-22 10:50:31');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `I_trigger_time` (`trigger_time`) USING BTREE,
  KEY `I_handle_code` (`handle_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_log_report` VALUES (174, '2022-06-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (175, '2022-06-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (176, '2022-06-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (177, '2022-06-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (178, '2022-12-22 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (179, '2022-12-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (180, '2022-12-20 00:00:00', 0, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_g_k_v` (`registry_group`,`registry_key`(191),`registry_value`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_registry` VALUES (2, 'EXECUTOR', 'jvs-design-mgr', 'http://172.19.0.15:21734/', '2022-12-22 10:50:35');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `oauth_other`;
CREATE TABLE `oauth_other`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台名称 用来区分不同平台的帐号',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权的api',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获取accessToken的api',
  `user_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获取用户信息的api',
  `client_id` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'clientid',
  `client_secret` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'secret',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调地址,需要和三方配置时一致.如:http://10.0.0.17:10000/auth/just/callbackUrl?type=CUSTOMGITLAB',
  `ignore_check_state` tinyint(1) NULL DEFAULT 1 COMMENT '是否校验state',
  `type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型,会根据类型进行处理',
  `login_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆地址 , 三方回调首先会回调后台 redirect_url  http://10.0.0.17:10000/auth/just/callbackUrl?type=CUSTOMGITLAB',
  `filed_json` json NULL COMMENT '用户字段json说明',
  `dept_json` json NULL COMMENT '部门结构json',
  `model` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模式, code模式 oauth2模式',
  `dept_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步部门接口',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '三方应用' ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `jvs`.`jvs_chart_page` MODIFY COLUMN `timer_request` varchar(10) CHARACTER SET utf16le COLLATE utf16le_general_ci NULL DEFAULT '0' COMMENT '定时请求' AFTER `del_flag`;
ALTER TABLE `jvs`.`jvs_app_template` ADD COLUMN `long_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '应用的文字描述' AFTER `sort`;
ALTER TABLE `jvs`.`jvs_chart_page` ADD COLUMN `is_fixed` tinyint(1) NULL DEFAULT NULL COMMENT '固定搜索栏' AFTER `sort`;
ALTER TABLE `jvs`.`sys_tenant` MODIFY COLUMN `default_index_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认首页' AFTER `login_domain`;
SET FOREIGN_KEY_CHECKS=1;