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

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `flow_design_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流id',
  `flow_design` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '工作流流程设计JSON',
  `data_model_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型id',
  `form_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起人表单id',
  `form_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起人表单版本',
  `data_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据id',
  `courses` json NULL COMMENT '处理过程数组',
  `task_status` tinyint(2) NULL DEFAULT NULL COMMENT '状态：1-待审批，2-已同意，3-已拒绝，4-已终止',
  `node_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前环节节点id',
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前环节节点名',
  `flow_manual_nodes` json NULL COMMENT '流转的人工节点',
  `stop_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终止任务原由',
  `test` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '是否是测试任务 0否  1是',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_flow_design_id`(`flow_design_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_task_carbon_copy
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_carbon_copy`;
CREATE TABLE `flow_task_carbon_copy`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `flow_task_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流任务id',
  `node_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流节点id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_flow_task_id`(`flow_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流抄送' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task_carbon_copy
-- ----------------------------

-- ----------------------------
-- Table structure for flow_task_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_node`;
CREATE TABLE `flow_task_node`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `flow_task_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流任务id',
  `node_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流节点id',
  `course` json NULL COMMENT '处理结果数组',
  `process_status` tinyint(2) NULL DEFAULT NULL COMMENT '状态：1-待处理，2-已处理',
  `approval_type` tinyint(2) UNSIGNED NULL DEFAULT 1 COMMENT '审批类型：1-审批，2-加签审批',
  `append_approval` json NULL COMMENT '加签',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_flow_task_id`(`flow_task_id`) USING BTREE,
  INDEX `idx_node_id`(`node_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流流转节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task_node
-- ----------------------------

-- ----------------------------
-- Table structure for flow_task_person
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_person`;
CREATE TABLE `flow_task_person`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `flow_task_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流任务id',
  `node_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流节点id',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `process_status` tinyint(2) NULL DEFAULT NULL COMMENT '状态：1-待处理，2-已处理',
  `number` int(11) NULL DEFAULT 0 COMMENT '审批顺序',
  `test` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '是否是测试任务 0否  1是',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_flow_task_id`(`flow_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流任务待办人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task_person
-- ----------------------------

-- ----------------------------
-- Table structure for flow_task_proxy
-- ----------------------------
DROP TABLE IF EXISTS `flow_task_proxy`;
CREATE TABLE `flow_task_proxy`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被代理用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被代理用户姓名',
  `proxy_user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理用户id',
  `proxy_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理用户姓名',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '代理开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '代理结束时间',
  `revoke_flag` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否撤销 0未撤销  1已撤销',
  `description` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '没有添加说明' COMMENT '说明',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流任务代理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task_proxy
-- ----------------------------

-- ----------------------------
-- Table structure for function_base
-- ----------------------------
DROP TABLE IF EXISTS `function_base`;
CREATE TABLE `function_base`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `param_count` json NULL COMMENT '参数数量(不包括可变参数)',
  `dynamic_param` tinyint(1) NULL DEFAULT NULL COMMENT '是否存在可变参数',
  `enable_cache` tinyint(1) NULL DEFAULT NULL COMMENT '是否允许缓存',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '函数脚本',
  `jvs_param_type` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回值类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ISEMPTY`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统函数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of function_base
-- ----------------------------
INSERT INTO `function_base` VALUES (1, 'SUM', '数学函数', '这是一个数学函数', '[0]', 1, 1, 'def SUM(... num){return num.sum()}', 'number');
INSERT INTO `function_base` VALUES (2, 'CONTRACT', '文字函数', '这是一个文字函数，将多个文字组合起来', '[0]', 1, 1, 'def CONTRACT(... x) {return x==null?\"\":x.join(\'\')}', 'text');
INSERT INTO `function_base` VALUES (3, 'ADD', '数学函数', '加法运算或正号', '[0]', 1, 1, 'def ADD(... x) {return x==null?0:x.sum()}', 'number');
INSERT INTO `function_base` VALUES (4, 'SUBTRACT', '数学函数', '减法运算或负号', '[0]', 1, 1, 'def SUBTRACT(... x) {return x==null?0:x.length==1?-x[0]:x.length==2?x[0]-x[1]:0}', 'number');
INSERT INTO `function_base` VALUES (5, 'MULTIPLY', '数学函数', '乘法运算', '[2]', 0, 1, 'def MULTIPLY(x,y) {return x==null||y==null?0:x*y}', 'number');
INSERT INTO `function_base` VALUES (6, 'DIVIDE', '数学函数', '除法运算', '[2]', 0, 1, 'def DIVIDE(x,y) {return x==null||y==null?0:x/y}', 'number');
INSERT INTO `function_base` VALUES (7, 'CONCATENAT', '文字函数', '将多个字符串拼接合成一个文本字符串', '[0]', 1, 1, 'def CONCATENATE(... num){return num.join()}', 'text');
INSERT INTO `function_base` VALUES (8, 'LEFT', '文字函数', '从一个文本字符串的第一个字符开始返回指定个数的字符,如果文本长度小于自定字符个数，就将原始文本返回', '[2]', 0, 1, 'def LEFT(x,y){return x.take(y)}', 'text');
INSERT INTO `function_base` VALUES (9, 'RIGHT', '文字函数', '从一个文本字符串的最后一个字符开始返回指定个数的字符,如果文本长度小于自定字符个数，就将原始文本返回', '[2]', 0, 1, 'def RIGHT(x,y){return (x.length())<y?x:x[(x.length()-y)..x.length()-1]}', 'text');
INSERT INTO `function_base` VALUES (10, 'LOWER', '文字函数', '将一个文本字符串中的所有大写字母转换为小写字母', '[1]', 0, 1, 'def LOWER(x){return x.toLowerCase()}', 'text');
INSERT INTO `function_base` VALUES (11, 'UPPER', '文字函数', '将一个文本字符串中的所有小写字母转换为大写字母', '[1]', 0, 1, 'def UPPER(x){return x.toUpperCase()}', 'text');
INSERT INTO `function_base` VALUES (12, 'REPLACE', '文字函数', '根据指定的字符数，将部分文本字符串替换为不同的文本字符串', '[4]', 0, 1, 'def REPLACE(x,y,a,b){  return x.replaceAll(x.substring(y,y+a),b)}', 'text');
INSERT INTO `function_base` VALUES (13, 'LEN', '文字函数', '返回文本字符串中的字符个数', '[1]', 0, 1, 'def LEN(x){return x.length()}', 'text');
INSERT INTO `function_base` VALUES (14, 'REPT', '文字函数', '将文本重复指定次数', '[2]', 0, 1, 'def REPT(x,y){return x*y}', 'text');
INSERT INTO `function_base` VALUES (15, 'SEARCH', '文字函数', '在第二个文本字符串中查找第一个文本字符串，并返回第一个文本字符串的起始位置的编号，该编号从第二个文本字符串的第一个字符算起。返回 0 则表示未查找到', '[2, 3]', 0, 1, 'def SEARCH(x,y,a=0){return a==0?x.indexOf(y)+1:x.substring(a).indexOf(y)+1}', 'text');
INSERT INTO `function_base` VALUES (16, 'MID', '文字函数', '截取文本的有效部分内容', '[3]', 0, 1, 'def MID(x,y,z){ return x.substring(y-1,y+z-1) }', 'text');
INSERT INTO `function_base` VALUES (18, 'AVERAGE', '数学函数', '求多个数值的平均值', '[0]', 1, 1, 'def AVERAGE(... x){  return x.sum()/x.size() }', 'number');
INSERT INTO `function_base` VALUES (19, 'MAX', '数学函数', '返回一组数字中的最大值', '[0]', 1, 1, 'def MAX(... x){  return x.max() }', 'number');
INSERT INTO `function_base` VALUES (20, 'MIN', '数学函数', '返回最小的数值', '[0]', 1, 1, 'def MIN(... x){  return x.min() }', 'number');
INSERT INTO `function_base` VALUES (21, 'ABS', '数学函数', '当数值为负数的时候返回他的绝对值数值', '[1]', 0, 1, 'def ABS(x){  return Math.abs(x) }', 'number');
INSERT INTO `function_base` VALUES (22, 'ROUND', '数学函数', '数值出现小数点的时候，将小位数指定到对应的位数', '[1]', 0, 1, 'def ROUND(x){  return Math.round(x) }', 'number');
INSERT INTO `function_base` VALUES (23, 'CEILING', '数学函数', '返回将参数\n  number 向上舍入（沿绝对值增大的方向）为最接近的指定基数的倍数', '[2]', 0, 1, 'def CEILING(x,y){  return (Math.ceil(x)*y).intValue() }', 'number');
INSERT INTO `function_base` VALUES (24, 'INTNUM', '数学函数', '把数值组件的值向下舍入为整数', '[1]', 0, 1, 'def INTNUM(x){  return x.intValue() }', 'number');
INSERT INTO `function_base` VALUES (25, 'LOG', '数学函数', '根据指定底数返回数字的对数', '[2]', 0, 1, 'def LOG(x,y){  return Math.log(y)/Math.log(x) }', 'number');
INSERT INTO `function_base` VALUES (26, 'MOD', '数学函数', '返回2个数值相除的余数', '[2]', 0, 1, 'def MOD(x,y){  return x%y }', 'number');
INSERT INTO `function_base` VALUES (27, 'POWER', '数学函数', '计算出数值组件乘幂的值', '[2]', 0, 1, 'def POWER(x,y){  return Math.pow(2,3) }', 'number');
INSERT INTO `function_base` VALUES (28, 'FIXED', '数学函数', '将数字舍入到指定的小数位数，以十进制数格式对该数进行格式设置，并以数字形式返回结果', '[2]', 0, 1, 'def FIXED(x,y){  return Math.round(x*Math.pow(10,y))/Math.pow(10,y) }', 'number');
INSERT INTO `function_base` VALUES (29, 'SQRT', '数学函数', '取数值组件值正的平方根', '[1]', 0, 1, 'def SQRT(x){  return Math.sqrt(x) }', 'number');
INSERT INTO `function_base` VALUES (30, 'PRODUCT', '数学函数', '数字相乘', '[2]', 0, 1, 'def PRODUCT(x,y){  return x*y }', 'number');
INSERT INTO `function_base` VALUES (31, 'SUMPRODUCT', '数学函数', '在给定的数组中，将数组间对应的元素相乘，并返回乘积之和', '[2]', 0, 1, 'def SUMPRODUCT(x,y){def result={a -> a.collect().stream().reduce(1, {sum, item -> sum * item}); }; return result.call(x)+result.call(y)}', 'number');
INSERT INTO `function_base` VALUES (32, 'NUMBERCOMP', '逻辑函数', '数值组件与数值组件2比较，大于返回1，等于返回0，小于返回-1', '[2]', 0, 1, 'def NUMBERCOMPARE(x,y){ return x.compareTo(y)}', 'object');
INSERT INTO `function_base` VALUES (33, 'EQ', '逻辑函数', '两个值比较，相等返回 true，默认忽略大小写，若不忽略，则填写第三个参数true', '[2, 3]', 0, 1, 'def EQ(x,y,b=false){ return b==true?x.equals(y):x.equalsIgnoreCase(y)}', 'bool');
INSERT INTO `function_base` VALUES (34, 'IF', '逻辑函数', '判断一个条件能否满足；如果满足返回一个值，如果不满足则返回另外一个值', '[3]', 0, 1, 'def IF(a,x,y){ return a==true?x:y}', 'object');
INSERT INTO `function_base` VALUES (35, 'ISEMPTY', '逻辑函数', '判断一个字段是否为空；如果为空，则返回 true；如果不为空则返回 false', '[1]', 0, 1, 'def ISEMPTY(x){ return x==null?true:x.empty };', 'bool');
INSERT INTO `function_base` VALUES (36, 'INTERSECTI', '集合函数', '计算两个集合的交集', '[2]', 0, 1, 'def INTERSECTIONSET(x,y){ return x.intersect(y) };', 'object');
INSERT INTO `function_base` VALUES (37, 'UNIONSET', '集合函数', '计算两个集合的并集', '[2]', 0, 1, 'def UNIONSET(x,y){ return x.plus(y).unique() }', 'object');
INSERT INTO `function_base` VALUES (38, 'DIFFERENCE', '集合函数', '计算两个集合的差集', '[2]', 0, 1, 'def DIFFERENCESET(x,y){ return x.plus(y).unique().minus(x.intersect(y)) }', 'object');
INSERT INTO `function_base` VALUES (39, 'SUBSET', '集合函数', '计算第二个集合是否第一个集合的子集', '[2]', 0, 1, 'def SUBSET(arr1,arr2){ return arr1.containsAll(arr2) }', 'bool');
INSERT INTO `function_base` VALUES (40, 'ARRAYGET', '集合函数', '返回数据集中第 k 个值', '[2]', 0, 1, 'def ARRAYGET(arr,y){ return arr.get(y-1) }', 'object');
INSERT INTO `function_base` VALUES (41, 'LARGE', '集合函数', '返回子表的指定（数值组件）列中第x个最大值', '[2]', 0, 1, 'def LARGE(arr,x){ return arr.sort{a,b -> return b.compareTo(a)}.unique().get(x-1) }', 'object');
INSERT INTO `function_base` VALUES (42, 'NE', '逻辑函数', '两个值比较，不相等返回 true，默认忽略大小写，若不忽略，则填写第三个参数true', '[2, 3]', 0, 1, 'def NE(x,y,b=false){ return !(b==true?x.equals(y):x.equalsIgnoreCase(y)) }', 'bool');
INSERT INTO `function_base` VALUES (43, 'LT', '逻辑函数', 'x小于y返回 true', '[2]', 0, 1, 'def LT(x,y){ return x<y }', 'bool');
INSERT INTO `function_base` VALUES (44, 'GT', '逻辑函数', 'x大于y返回 true', '[2]', 0, 1, 'def GT(x,y){ return x>y }', 'bool');
INSERT INTO `function_base` VALUES (45, 'LE', '逻辑函数', 'x小于等于y返回 true', '[2]', 0, 1, 'def LE(x,y){ return x<=y }', 'bool');
INSERT INTO `function_base` VALUES (46, 'GE', '逻辑函数', 'x大于等于y返回 true', '[2]', 0, 1, 'def GE(x,y){ return x>=y }', 'bool');
INSERT INTO `function_base` VALUES (47, 'AND', '逻辑函数', '当参数组中的所有参数逻辑值为 true 时（逗号隔开的逻辑式子都满足），才返回 true，当参数组中的任何一个参数逻辑值为 false 时，就会返回false。', '[0]', 1, 1, 'def AND(... x){ return x==null?false:x.every {it==true} }', 'bool');
INSERT INTO `function_base` VALUES (48, 'OR', '逻辑函数', '在参数组中，任何一个参数逻辑值为 true（逗号隔开的逻辑式子其中一项满足），即返回 true；只有当所有逻辑参数值为 false，才返回 false。', '[0]', 1, 1, 'def OR(... x){ return x==null?false:x.any {it==true} }', 'bool');
INSERT INTO `function_base` VALUES (49, 'NOT', '逻辑函数', '对参数逻辑值求反。NOT 比较简单，就是把括号里为 true 的值变成 false，括号里为 false 的值变为 true。', '[1]', 0, 1, 'def NOT(x){ return !x }', 'bool');
INSERT INTO `function_base` VALUES (50, 'NOW', '时间函数', '返回当前时间，格式为年-月-日 时-分-秒', '[0]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def NOW(){ LocalDateTime localDateTime = LocalDateTime.now(); DateTimeFormatter formatter = DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\');return localDateTime.format(formatter) }', 'text');
INSERT INTO `function_base` VALUES (51, 'FLOOR', '数学函数', '将参数\n  x向下舍入（沿绝对值减小的方向）为最接近的 y的倍数', '[2]', 0, 1, 'def FLOOR(x,y){  return (Math.floor(x)*y).intValue() };', 'number');
INSERT INTO `function_base` VALUES (52, 'SMALL', '集合函数', '返回数据集中第x个最小值', '[2]', 0, 1, 'def SMALL(arr,x){ return arr.sort{a,b -> return a.compareTo(b)}.unique().get(x-1) };', 'number');
INSERT INTO `function_base` VALUES (53, 'SETVALUE', '对象函数', '修改json数据中指定属性的值；第二个参数为要修改的属性名，第三个参数为修改的值。若属性不存在则，在数据中新增属性及值。', '[3]', 0, 1, 'def SETVALUE(arr,x,y){ def obj = new groovy.json.JsonSlurper().parseText(arr); obj.(x)=y;return new groovy.json.JsonOutput().toJson(obj) };', 'text');
INSERT INTO `function_base` VALUES (54, 'COPYPROPER', '对象函数', '拷贝第一个对象的属性值到第二个对象。（仅拷贝属性名相同的值）', '[2]', 0, 1, 'def COPYPROPERTIES(source,target) { def jsonSlurper = new groovy.json.JsonSlurper();def obj1 = jsonSlurper.parseText(source);def obj2 = jsonSlurper.parseText(target);obj1.properties.each { key,value -> if (obj2.hasProperty(key) && !(key in [\'class\',\'MetaClass\'])) obj2[key] = value };return new groovy.json.StringEscapeUtils().unescapeJava(new groovy.json.JsonOutput().toJson(obj2)) };', 'text');
INSERT INTO `function_base` VALUES (55, 'GETVALUE', '对象函数', '获取json数据中指定属性的值', '[2]', 0, 1, 'def GETVALUE(obj,name) { return obj.get(name) };', 'object');
INSERT INTO `function_base` VALUES (56, 'LISTADDALL', '集合函数', '将所有参数组合为一个集合返回', '[0]', 1, 1, 'def LISTADDALL(... x) { def list = [];list.addAll(x);return list };', 'object');
INSERT INTO `function_base` VALUES (57, 'LISTGET', '集合函数', '获取集合中指定索引位置的元素', '[2]', 0, 1, 'def LISTGET(arr,x) { return arr.get(x) };', 'object');
INSERT INTO `function_base` VALUES (58, 'LISTADD', '集合函数', '向集合中添加多个元素', '[2]', 1, 1, 'def LISTADD(arr,... x) { def arr1 = arr; arr1.addAll(x);return arr1 }', 'object');
INSERT INTO `function_base` VALUES (59, 'LISTRANDOM', '集合函数', '随机取集合中的某一元素', '[1]', 0, 1, 'def LISTRANDOM(obj) { def index = Math.random()*obj.size() as int;return obj.get(index) };', 'object');
INSERT INTO `function_base` VALUES (60, 'TOJSONOBJ', '对象函数', '将json字符串转换为对象', '[1]', 0, 1, 'def TOJSONOBJ(x){ return new groovy.json.JsonSlurper().parseText(x)};', 'object');
INSERT INTO `function_base` VALUES (61, 'TIMEFORMAT', '时间函数', '将时间戳转换为指定日期格式', '[2]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def TIMEFORMAT(x,y){LocalDateTime localDate = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\')); DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(y);def format = dateTimeFormatter.format(localDate);return format}', 'text');
INSERT INTO `function_base` VALUES (62, 'GETYEAR', '时间函数', '获取指定时间的年份', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETYEAR(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getYear()}', 'text');
INSERT INTO `function_base` VALUES (63, 'GETMONTH', '时间函数', '获取指定时间的月份', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETMONTH(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getMonthValue()}', 'text');
INSERT INTO `function_base` VALUES (64, 'GETDATE', '时间函数', '获取指定时间的天数，这个月的第几天', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETDATE(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getDayOfMonth()}', 'text');
INSERT INTO `function_base` VALUES (65, 'GETWEEKDAY', '时间函数', '获取指定时间的星期几', '[1]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def GETWEEKDAY(x){LocalDateTime localDateTime = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return localDateTime.getDayOfWeek()}', 'text');
INSERT INTO `function_base` VALUES (66, 'COMPARE', '时间函数', '比较两个时间的大小，日期1 大于 日期2 返回 true，否则返回 false', '[2]', 0, 1, 'import java.time.LocalDateTime;import java.time.format.DateTimeFormatter; def COMPARETIME(x,y){LocalDateTime localDate1 = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));LocalDateTime localDate2 = LocalDateTime.parse(y,DateTimeFormatter.ofPattern(\'yyyy-MM-dd HH:mm:ss\'));return  localDate1.isAfter(localDate2)}', 'bool');
INSERT INTO `function_base` VALUES (67, 'TIMEBETWEEN', '时间函数', '返回两个日期之间相差的天、月、年、小时等。\r\n第三个参数使用不同的参数返回同的相差类型：天（DAYS）、周（WEEKS）、月（MONTHS）、年（YEARS）、小时（HOURS）、分钟（MINUTES）、秒（SECONDS）。', '[3]', 0, 1, 'import java.time.LocalDateTime;import java.time.temporal.ChronoUnit;import java.time.format.DateTimeFormatter; import java.time.Period; def TIMEBETWEEN(x,y,z){LocalDateTime localDate1 = LocalDateTime.parse(x,DateTimeFormatter.ofPattern(\"yyyy-MM-dd HH:mm:ss\"));LocalDateTime localDate2 = LocalDateTime.parse(y,DateTimeFormatter.ofPattern(\"yyyy-MM-dd HH:mm:ss\"));return ChronoUnit.valueOf(z).between(localDate1,localDate2).abs() }', 'number');
INSERT INTO `function_base` VALUES (68, 'CONTAIN', '集合函数', '返回参数一集合中是否包含参数二，包含返回true，不包含返回false', '[2]', 0, 1, 'def CONTAIN(x,y){ return x==null?false:x.containsAll(y) };', 'bool');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务编辑好的执行';

-- ----------------------------
-- Records of function_business
-- ----------------------------

-- ----------------------------
-- Table structure for im_channel_data
-- ----------------------------
DROP TABLE IF EXISTS `im_channel_data`;
CREATE TABLE `im_channel_data`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `server_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务id',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `store_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储方式',
  `store_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储唯一编号',
  `business_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务类型',
  `expand` json NULL COMMENT '扩展字段',
  `process_status` tinyint(1) NULL DEFAULT NULL COMMENT '0-未处理，1-已处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'IM服务连接相关的数据(服务关闭后，需要处理)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_channel_data
-- ----------------------------

-- ----------------------------
-- Table structure for im_chat_group_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_group_message`;
CREATE TABLE `im_chat_group_message`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `group_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '群组id',
  `from_user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '发送消息用户id',
  `message` json NOT NULL COMMENT '聊天消息体',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1-删除',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_id`(`group_id`) USING BTREE,
  INDEX `idx_from_user_id`(`from_user_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '群聊全量消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_group_message
-- ----------------------------

-- ----------------------------
-- Table structure for im_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_message`;
CREATE TABLE `im_chat_message`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `from_user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '发送消息用户id',
  `to_user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '接收消息用户id',
  `message` json NOT NULL COMMENT '聊天消息体',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1-删除',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_to_user_id`(`to_user_id`) USING BTREE,
  INDEX `idx_from_user_id`(`from_user_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '私聊全量消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_chat_message
-- ----------------------------

-- ----------------------------
-- Table structure for im_notify_message
-- ----------------------------
DROP TABLE IF EXISTS `im_notify_message`;
CREATE TABLE `im_notify_message`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `notify_type` tinyint(1) NOT NULL COMMENT '0-广播，1-组通知，2-精确通知',
  `from_user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '发送消息用户id(若是系统发送，则默认为0)',
  `group_ids` json NULL COMMENT '目标群组id(JSON数组)',
  `user_ids` json NULL COMMENT '目标用户id(JSON数组)',
  `message` json NOT NULL COMMENT '聊天消息体',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1-删除',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_notify_type`(`notify_type`) USING BTREE,
  INDEX `idx_from_user_id`(`from_user_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM通知全量消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_notify_message
-- ----------------------------

-- ----------------------------
-- Table structure for im_server_info
-- ----------------------------
DROP TABLE IF EXISTS `im_server_info`;
CREATE TABLE `im_server_info`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `server_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `heartbeat_time` datetime NULL DEFAULT NULL COMMENT '心跳时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'im服务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_server_info
-- ----------------------------

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
  `type` varchar(60) DEFAULT NULL COMMENT '项目分类',
  `job_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位ID',
  `is_deploy` tinyint(1) DEFAULT '0' COMMENT '发布状态',
  `role` json DEFAULT NULL COMMENT '权限',
  `types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设计分组',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `imgs` json DEFAULT NULL COMMENT '展示的图片',
  `long_text` longtext COMMENT '详细描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `create_by_id` (`create_by_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目表';

-- ----------------------------
-- Records of jvs_app
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_app_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app_template`;
CREATE TABLE `jvs_app_template`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '项目名称',
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目分类',
  `icon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/jvs-ui-public/img/logo.jpg' COMMENT '应用图标',
  `logo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '应用logo',
  `imgs` json NULL COMMENT '展示的图片',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '应用数据',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `types` json NOT NULL COMMENT '设计分组',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '版本应用的版本,前端传递  如果不一样的版本号，可能导致无法使用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '项目_模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_app_template
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_app_template_config
-- ----------------------------
DROP TABLE IF EXISTS `jvs_app_template_config`;
CREATE TABLE `jvs_app_template_config`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '版本应用的版本,前端传递  如果不一样的版本号，可能导致无法使用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '模板名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '模板配置url',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '应用模板配置' ROW_FORMAT = Dynamic;

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
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='页面配置';
-- ----------------------------
-- Records of jvs_chart_page
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_crud_association
-- ----------------------------
DROP TABLE IF EXISTS `jvs_crud_association`;
CREATE TABLE `jvs_crud_association`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '未命名表单' COMMENT '按钮名称',
  `permissionFlag` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '未命名表单' COMMENT '按钮名称',
  `design_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '设计id、表单、列表页',
  `data` json NULL COMMENT '赋值字段集',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `jvs_app_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用',
  `data_model_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据模型ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据规则配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_crud_association
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='表单配置项';

-- ----------------------------
-- Records of jvs_crud_form
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='列表的列表配置项';

-- ----------------------------
-- Records of jvs_crud_page
-- ----------------------------

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

-- ----------------------------
-- Table structure for jvs_data_field
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_field`;
CREATE TABLE `jvs_data_field`  (
  `id` bigint(20) NOT NULL COMMENT '数据字段id',
  `model_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据模型id',
  `design_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设计ID',
  `design_type` enum('form','page','workflow') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设计类型',
  `field_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  `field_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `enabled_query_types` json NULL COMMENT '支持的查询类型',
  `design_json` json NULL COMMENT '字段设计数据(Json格式)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_by_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `data_model_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表单的设计id值',
  `is_export` tinyint(1) NULL DEFAULT NULL COMMENT '是否可导出',
  `data_linkage_model_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据联动模型id',
  `linkage_field_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据联动显示的字段名',
  `data_linkage_list` json NULL COMMENT '数据联动的条件',
  `encryption` tinyint(1) NULL DEFAULT NULL COMMENT '是否脱敏',
  `encryption_express` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正则表达式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据模型-字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_data_field
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_data_id
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_id`;
CREATE TABLE `jvs_data_id`  (
  `model_id` bigint(20) NOT NULL COMMENT '数据模型id',
  `current_id` int(11) NULL DEFAULT NULL COMMENT '当前序号(不重置)',
  `current_year_id` int(11) NULL DEFAULT NULL COMMENT '当前序号(按年重置)',
  `current_month_id` int(11) NULL DEFAULT NULL COMMENT '当前序号(按月重置)',
  `current_day_id` int(11) NULL DEFAULT NULL COMMENT '当前序号(按天重置)',
  `current_hour_id` int(11) NULL DEFAULT NULL COMMENT '当前序号(按小时重置)',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据模型-自增序号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_data_id
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_data_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_log`;
CREATE TABLE `jvs_data_log`  (
  `id` bigint(20) NOT NULL COMMENT '日志id',
  `data_id` bigint(20) NULL DEFAULT NULL COMMENT '数据id',
  `version` int(11) NULL DEFAULT NULL COMMENT '数据版本',
  `content` json NULL COMMENT '数据内容(Json格式)',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人id',
  `operator` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作记录',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据模型-日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_data_log
-- ----------------------------

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

-- ----------------------------
-- Table structure for jvs_design_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_design_template`;
CREATE TABLE `jvs_design_template`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板分类',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套件类型',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板封面图片',
  `data` longblob NULL COMMENT '模板数据',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_design_template
-- ----------------------------

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

-- ----------------------------
-- Table structure for jvs_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_log`;
CREATE TABLE `jvs_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `description` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '没有添加描述' COMMENT '操作内容',
  `content` json NULL COMMENT '操作数据',
  `jvs_app_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用Id',
  `jvs_app_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_log
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_print_template
-- ----------------------------
DROP TABLE IF EXISTS `jvs_print_template`;
CREATE TABLE `jvs_print_template`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `design_type` tinyint(2) NULL DEFAULT 0 COMMENT '模板类型：0-自定义模板，1-word',
  `design` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板数据',
  `design_byte` mediumblob NULL COMMENT '模板文件二进制',
  `file_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '打印模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_print_template
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_regexp
-- ----------------------------
DROP TABLE IF EXISTS `jvs_regexp`;
CREATE TABLE `jvs_regexp`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正则名称',
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正则表达式',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `unique_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'UUID,该值唯一且永不改变,用作被引用时的key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '正则表达式,用于在数据表设计时，可以动态修改的模块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_regexp
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jvs_app_id` (`jvs_app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='大屏设计';

-- ----------------------------
-- Records of jvs_screen
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_tree
-- ----------------------------
DROP TABLE IF EXISTS `jvs_tree`;
CREATE TABLE `jvs_tree`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称, 同一层级不能重复',
  `value` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示值',
  `unique_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一标识, 作为该字典被引用的key',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '分组id, 区分不同的字典树',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级ID, 根节点为-1',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自定义树,可以针对所有的树型结构进行处理,使用方式与字典类似' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jvs_tree
-- ----------------------------
INSERT INTO `jvs_tree` VALUES ('001ad7956236475db40a2a40a2fcb4b8', '轮胎制造', '轮胎制造', '001ad7956236475db40a2a40a2fcb4b8', 1461518083062722560, 417, '', '242dd78213414f0f9c3ac611b510ec7e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('002c1ccf20434b23b809eb17eb1e4059', '银矿采选', '银矿采选', '002c1ccf20434b23b809eb17eb1e4059', 1461518083062722560, 106, '', '4158f69d42a14c8c904c417676863403', 0, '1');
INSERT INTO `jvs_tree` VALUES ('006b43f447b0419684db7af43401f98c', '首饰、工艺品及收藏品批发', '首饰、工艺品及收藏品批发', '006b43f447b0419684db7af43401f98c', 1461518083062722560, 891, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('007e07e5aab6271df2844f2a33ba8627', '木片加工', '木片加工', '1536311398964736052', 1461518083062722560, 268, '', '1536311398964736044', 0, '1');
INSERT INTO `jvs_tree` VALUES ('00d90a3e54fc4c47b928bd83ae0fb741', '集装箱及金属包装容器制造', '集装箱及金属包装容器制造', '00d90a3e54fc4c47b928bd83ae0fb741', 1461518083062722560, 519, '', 'fb030bf0f03346d09a84b55753afc762', 0, '1');
INSERT INTO `jvs_tree` VALUES ('010abe89489605cc686cac3e44b55e66', '钟表与计时仪器制造', '钟表与计时仪器制造', '1536310829881569620', 1461518083062722560, 782, '', '1536310829881569600', 0, '1');
INSERT INTO `jvs_tree` VALUES ('012505b384e445b0a35062f005b5fa39', '林业有害生物防治服务', '林业有害生物防治服务', '012505b384e445b0a35062f005b5fa39', 1461518083062722560, 76, '', '789befc4bd144da18ee07645854cb3cc', 0, '1');
INSERT INTO `jvs_tree` VALUES ('013e1c3e73ff4825b2f4794030124743', '米、面制品制造', '米、面制品制造', '013e1c3e73ff4825b2f4794030124743', 1461518083062722560, 166, '', 'eae71131d4e64599b3c04654b478073e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('016ee816d30efe4e9571c1119376c73b', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', '1536310379493011727', 1461518083062722560, 809, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('019bf10bef964d49a416b8f035f49698', '其他基础化学原料制造', '其他基础化学原料制造', '019bf10bef964d49a416b8f035f49698', 1461518083062722560, 356, '', '91dc97eb105d4ba29bbf67a3eee45596', 0, '1');
INSERT INTO `jvs_tree` VALUES ('01c8162be0274678aef1c27cfa6e70b2', '化肥批发', '化肥批发', '01c8162be0274678aef1c27cfa6e70b2', 1461518083062722560, 903, '', '40b02e3c160241a8870c0e6451672907', 0, '1');
INSERT INTO `jvs_tree` VALUES ('01e1d829d1e245d5bf3a066ce77191f3', '水果种植', '水果种植', '01e1d829d1e245d5bf3a066ce77191f3', 1461518083062722560, 22, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, '1');
INSERT INTO `jvs_tree` VALUES ('023d478398f87edf87e7053aa708c818', '钟表与计时仪器制造', '钟表与计时仪器制造', '1536307437964702036', 1461518083062722560, 782, '', '1536307437964702016', 0, '1');
INSERT INTO `jvs_tree` VALUES ('02625d2fd20f4a779bafe64ee8010fdd', '乳制品制造', '乳制品制造', '02625d2fd20f4a779bafe64ee8010fdd', 1461518083062722560, 169, '', 'bdccc103aea04c328baa79ac2d2af736', 0, '1');
INSERT INTO `jvs_tree` VALUES ('027fc042482ef40b3012c0fe75a56cfe', '文化、办公用机械制造', '文化、办公用机械制造', '1536311398964736172', 1461518083062722560, 584, '', '1536311398964736112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('02a4e41da086495abdb0d7399055ffd1', '其他建筑安装业', '其他建筑安装业', '02a4e41da086495abdb0d7399055ffd1', 1461518083062722560, 848, '', '1bc0fe7f5c88495a938bfbb1613ecbef', 0, '1');
INSERT INTO `jvs_tree` VALUES ('02d5474d0f2f4735ffe6ac7de5496530', '光学仪器制造', '光学仪器制造', '1536294082927472954', 1461518083062722560, 784, '', '1536294082927472950', 0, '1');
INSERT INTO `jvs_tree` VALUES ('02f7b8c90d2e4515988d4c99dfb6c9a3', '其他文化用品零售', '其他文化用品零售', '02f7b8c90d2e4515988d4c99dfb6c9a3', 1461518083062722560, 957, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, '1');
INSERT INTO `jvs_tree` VALUES ('034de10ed9434b67946c80c8e2fb8a78', '旅行社及相关服务', '旅行社及相关服务', '034de10ed9434b67946c80c8e2fb8a78', 1461518083062722560, 1171, '', '1d4aa2be74514a73925194b48b570791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('038fddb3b35229a3f911f0dac1e4d025', '通信设备制造', '通信设备制造', '1536307437964702000', 1461518083062722560, 743, '', '1536307437964701996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('03f044d1aeba4004b6cd8df985b4a718', '运输设备及生产用计数仪表制造', '运输设备及生产用计数仪表制造', '03f044d1aeba4004b6cd8df985b4a718', 1461518083062722560, 774, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0412f1959db3dd595a46969669291dce', '食品、饮料、烟草及饲料生产专用设备制造', '食品、饮料、烟草及饲料生产专用设备制造', '1536311398964736216', 1461518083062722560, 613, '', '1536311398964736184', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0425e3ce9ed84fc493944dbd4663ba4e', '物料搬运设备制造', '物料搬运设备制造', '0425e3ce9ed84fc493944dbd4663ba4e', 1461518083062722560, 559, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('042dd370aa4043dda89c95b854ba7f87', '水污染治理', '水污染治理', '042dd370aa4043dda89c95b854ba7f87', 1461518083062722560, 1241, '', '72c2cabaf7c9440f9933fe2b664a6fc7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('043cb412a73e4ca18e859bc16f6fed7a', '共青团', '共青团', '043cb412a73e4ca18e859bc16f6fed7a', 1461518083062722560, 1411, '', 'b78db952034f49eca2e0456b36962c91', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0459f0f6c745477abb9148c31f5cbe04', '铝压延加工', '铝压延加工', '0459f0f6c745477abb9148c31f5cbe04', 1461518083062722560, 505, '', '834d7ba750384e2eb50b08718329951f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('045c8fd747a56e9a16d8d0bf06b4d7f9', '汽车制造业', '汽车制造业', '1536294082927472858', 1461518083062722560, 660, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0471081c4ae44b2ea04546cd10b14f32', '搪瓷卫生洁具制造', '搪瓷卫生洁具制造', '0471081c4ae44b2ea04546cd10b14f32', 1461518083062722560, 533, '', 'f1cc0d5ef61e42f6a7dc652cf650b5eb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('049d9950a2bd472ca238f1d4c4414391', '非织造布制造', '非织造布制造', '049d9950a2bd472ca238f1d4c4414391', 1461518083062722560, 236, '', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('04a5a05cee214eb096d670718e4fc305', '运输代理业', '运输代理业', '04a5a05cee214eb096d670718e4fc305', 1461518083062722560, 1036, '', '7a9d922832254652b30aa78bd8faf763', 0, '1');
INSERT INTO `jvs_tree` VALUES ('052157cc3e7c4c94b921054b5038282b', '照明器具制造', '照明器具制造', '052157cc3e7c4c94b921054b5038282b', 1461518083062722560, 730, '', '52ffeaa5459542128bf67a6d04df1dda', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0528a2780f402c08cd783fd0544553f7', '电影机械制造', '电影机械制造', '1536294082927472782', 1461518083062722560, 585, '', '1536294082927472778', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0544d31098c648be8370a8ddbade83c5', '其他水的处理、利用与分配', '其他水的处理、利用与分配', '0544d31098c648be8370a8ddbade83c5', 1461518083062722560, 825, '', 'f2dddd6c1808403185f836583368d9b7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0557c81765464e3590b3241db99b5610', '防洪除涝设施管理', '防洪除涝设施管理', '0557c81765464e3590b3241db99b5610', 1461518083062722560, 1229, '', 'e792c27ee8404ea6b700ef2a508103b0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('056f1b64c0255e3ad78427a403fc637d', '物料搬运设备制造', '物料搬运设备制造', '1536307437964701812', 1461518083062722560, 559, '', '1536307437964701808', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0598f7123dff4a018e3f5efed12d5b95', '内河货物运输', '内河货物运输', '0598f7123dff4a018e3f5efed12d5b95', 1461518083062722560, 1018, '', 'f686b1e78ecb4b0d91fbfd2a1a605018', 0, '1');
INSERT INTO `jvs_tree` VALUES ('05c035e831a94d07a2bedce0ce29f47f', '锡矿采选', '锡矿采选', '05c035e831a94d07a2bedce0ce29f47f', 1461518083062722560, 99, '', 'e3e5f433000e4a8582130236036331bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('060f08e0258648e09f90a27c210cd896', '基层群众自治组织', '基层群众自治组织', '060f08e0258648e09f90a27c210cd896', 1461518083062722560, 1419, '', '947e0f87323b430ea5d5c7689ab006cf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('06300e5762fffd76c2a3f5d30ca1d095', '电影机械制造', '电影机械制造', '1536311398964736176', 1461518083062722560, 585, '', '1536311398964736172', 0, '1');
INSERT INTO `jvs_tree` VALUES ('06790070f03b4994afefdbe2d41dfb26', '钾肥制造', '钾肥制造', '06790070f03b4994afefdbe2d41dfb26', 1461518083062722560, 360, '', '10f07810f0d947289092d4489bea5968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0685394892054b2fbdb978a802bf44f0', '蔬菜加工', '蔬菜加工', '0685394892054b2fbdb978a802bf44f0', 1461518083062722560, 151, '', 'ba575e30d21f4b14a6fb7d0e5e8e0724', 0, '1');
INSERT INTO `jvs_tree` VALUES ('06ce25c29b42405782d837b99f268c4f', '计算机零部件制造', '计算机零部件制造', '06ce25c29b42405782d837b99f268c4f', 1461518083062722560, 740, '', 'f8f60b812bca4c15ac143f477661ba23', 0, '1');
INSERT INTO `jvs_tree` VALUES ('06e7f980143a449ca6e9045b8a2cc9c9', '玻璃制造', '玻璃制造', '06e7f980143a449ca6e9045b8a2cc9c9', 1461518083062722560, 450, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0725fd875921eac346c3721a2a0efbb4', '视听设备制造', '视听设备制造', '1536294082927472922', 1461518083062722560, 751, '', '1536294082927472906', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0747191f774b48baa44ed68ea5de9c04', '加工纸制造', '加工纸制造', '0747191f774b48baa44ed68ea5de9c04', 1461518083062722560, 300, '', '94b9ee4c5b044aff82a1db919eea8470', 0, '1');
INSERT INTO `jvs_tree` VALUES ('07572ebe3367483db949671c9f3abe9a', '化妆品及卫生用品批发', '化妆品及卫生用品批发', '07572ebe3367483db949671c9f3abe9a', 1461518083062722560, 880, '', '3fed51964f224f8faa5db756cfafda81', 0, '1');
INSERT INTO `jvs_tree` VALUES ('07676f9f210566cbbd3fef353acc98e3', '汽车车身、挂车制造', '汽车车身、挂车制造', '1536310829881569548', 1461518083062722560, 665, '', '1536310829881569532', 0, '1');
INSERT INTO `jvs_tree` VALUES ('076cfbad4a3b4762936bf7d9336715f9', '针织或钩针编织物及其制品制造', '针织或钩针编织物及其制品制造', '076cfbad4a3b4762936bf7d9336715f9', 1461518083062722560, 226, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('077ab5bdfceb402097523d5746a3141c', '其他土木工程建筑', '其他土木工程建筑', '077ab5bdfceb402097523d5746a3141c', 1461518083062722560, 844, '', '7ed8bf1d78f34e0d83e5cc49318096f9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('07a6cb62fabc4b2a91ad407132d5a0fd', '风能原动设备制造', '风能原动设备制造', '07a6cb62fabc4b2a91ad407132d5a0fd', 1461518083062722560, 550, '', 'eeb06ef1eabf45dc9214022934a5ad13', 0, '1');
INSERT INTO `jvs_tree` VALUES ('07c2aae74e1f4c9cbe62223b5ea5e33a', '丙纶纤维制造', '丙纶纤维制造', '07c2aae74e1f4c9cbe62223b5ea5e33a', 1461518083062722560, 412, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, '1');
INSERT INTO `jvs_tree` VALUES ('07c3a1892f8547d49dcc1cdb06cbe9ea', '房地产中介服务', '房地产中介服务', '07c3a1892f8547d49dcc1cdb06cbe9ea', 1461518083062722560, 1133, '', 'b58bd9253692458cbbfdf0e589c39e11', 0, '1');
INSERT INTO `jvs_tree` VALUES ('07ffe97b533243538d9e58edb4ffe7a6', '清洁服务', '清洁服务', '07ffe97b533243538d9e58edb4ffe7a6', 1461518083062722560, 1283, '', 'b241a5716023498ca4b2cf684ed0a71d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('081ab2ce413940ca9c6024181ec97263', '饲料生产专用设备制造', '饲料生产专用设备制造', '081ab2ce413940ca9c6024181ec97263', 1461518083062722560, 617, '', '2efc07fcfa8841a180e277a88ffd4807', 0, '1');
INSERT INTO `jvs_tree` VALUES ('082967eb27b74dadb7c3c5505e155ece', '摩托车零部件及配件制造', '摩托车零部件及配件制造', '082967eb27b74dadb7c3c5505e155ece', 1461518083062722560, 689, '', '43f3b671e3994032b015723214288d9f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0830355035e34ff698c659dd8924ce20', '水产饲料制造', '水产饲料制造', '0830355035e34ff698c659dd8924ce20', 1461518083062722560, 147, '', '69030142a6a040f0afe0598c6f9d15b8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0835d6af067244cdbd679abb37910c37', '科学研究和技术服务业', '科学研究和技术服务业', '0835d6af067244cdbd679abb37910c37', 1461518083062722560, 1187, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('086a5eba03bd4f51844c1a74682184a3', '毛皮鞣制加工', '毛皮鞣制加工', '086a5eba03bd4f51844c1a74682184a3', 1461518083062722560, 253, '', 'c7fd52d88c344084baf1c4dbd3621cc3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('087938bbe3b74b8bb662d936ee8800ce', '音像制品及电子出版物批发', '音像制品及电子出版物批发', '087938bbe3b74b8bb662d936ee8800ce', 1461518083062722560, 890, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('088709e17f8f44bbb834ddf29cba1f94', '放射性废物治理', '放射性废物治理', '088709e17f8f44bbb834ddf29cba1f94', 1461518083062722560, 1245, '', '72c2cabaf7c9440f9933fe2b664a6fc7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0888e14ec3974ab29ce2919250e07b7d', '技术推广服务', '技术推广服务', '0888e14ec3974ab29ce2919250e07b7d', 1461518083062722560, 1219, '', '66c44ad92f454958bed23351116b07a4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('08a1fc9f693f48129e4bf075c2623051', '公共设施管理业', '公共设施管理业', '08a1fc9f693f48129e4bf075c2623051', 1461518083062722560, 1247, '', 'd0159dee15c84e7497612587f32232e5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('08b2a42c7a104cc4ad24ffd9432fc72d', '灌溉服务', '灌溉服务', '08b2a42c7a104cc4ad24ffd9432fc72d', 1461518083062722560, 72, '', '4d80a3b8b1be4d279344ac1771122b85', 0, '1');
INSERT INTO `jvs_tree` VALUES ('08c234aebbb444c99b04de865d8f2efb', '木制品制造', '木制品制造', '08c234aebbb444c99b04de865d8f2efb', 1461518083062722560, 276, '', '423a2ec66ad24b9a9ec95c606a136fbd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('08d09a74d0b6457aa93edcfd85139760', '信息技术咨询服务', '信息技术咨询服务', '08d09a74d0b6457aa93edcfd85139760', 1461518083062722560, 1083, '', '18b70958583a491eba2567d01105d429', 0, '1');
INSERT INTO `jvs_tree` VALUES ('08d59ec80817453dab64b68c44915755', '客运轮渡运输', '客运轮渡运输', '08d59ec80817453dab64b68c44915755', 1461518083062722560, 1014, '', 'd39afb8696c948ba88baadc8b053221a', 0, '1');
INSERT INTO `jvs_tree` VALUES ('090c7dc402b04c499aa4878c441e823b', '邮政业', '邮政业', '090c7dc402b04c499aa4878c441e823b', 1461518083062722560, 1046, '', '842789d652984bcc9618bfe915b8dd6b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('097e8e61cb4241e4a2a192e9d51911df', '大气污染治理', '大气污染治理', '097e8e61cb4241e4a2a192e9d51911df', 1461518083062722560, 1242, '', '72c2cabaf7c9440f9933fe2b664a6fc7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('098524a60a02f87119b1ed3b13041550', '饲料生产专用设备制造', '饲料生产专用设备制造', '1536310379493011595', 1461518083062722560, 617, '', '1536310379493011583', 0, '1');
INSERT INTO `jvs_tree` VALUES ('099eb799b16e4c15bdd339b34f471c1b', '家用电子产品修理', '家用电子产品修理', '099eb799b16e4c15bdd339b34f471c1b', 1461518083062722560, 1275, '', '43ce8c991ff7473387cda3efda83ab52', 0, '1');
INSERT INTO `jvs_tree` VALUES ('09c324a6948d4cb09e0bf57e427b08b0', '金属制厨房用器具制造', '金属制厨房用器具制造', '09c324a6948d4cb09e0bf57e427b08b0', 1461518083062722560, 536, '', '46922c9d081a4bd2a30860d15b5837ab', 0, '1');
INSERT INTO `jvs_tree` VALUES ('09cd0743353b460720559fd1fe55e5f7', '文化、体育和娱乐业', '文化、体育和娱乐业', '1536294082927473026', 1461518083062722560, 1340, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('09d1a7d6b297d0bef21f583bef1ee40e', '专科疾病防治院（所、站）', '专科疾病防治院（所、站）', '1536310829881569696', 1461518083062722560, 1326, '', '1536310829881569668', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0a25c1759af3403cbb50173520bdd57e', '固定电信服务', '固定电信服务', '0a25c1759af3403cbb50173520bdd57e', 1461518083062722560, 1069, '', 'a5ef7f7b5c784ad9b3ea357ad6f98182', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0a4a52bdf9d74ae48a0682d8f2cd54b6', '家用通风电器具制造', '家用通风电器具制造', '0a4a52bdf9d74ae48a0682d8f2cd54b6', 1461518083062722560, 721, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0a63f6f5aab8447585ef1d6375a7337a', '汽车车身、挂车制造', '汽车车身、挂车制造', '0a63f6f5aab8447585ef1d6375a7337a', 1461518083062722560, 665, '', '2c9f7f83b1a041279b95fd1b35c8a23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0a7a5f3c5c944fc89f681be2afd3cf12', '人民政协', '人民政协', '0a7a5f3c5c944fc89f681be2afd3cf12', 1461518083062722560, 1403, '', '66b2c24fecfd4459b8da087a21ff6156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0a89b5ec288b8d94c419c35d177dcf15', '农、林、牧、渔业', '农、林、牧、渔业', '1536311398964736000', 1461518083062722560, 1, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0aac505288d34317b668b204361b0dfb', '缝制机械制造', '缝制机械制造', '0aac505288d34317b668b204361b0dfb', 1461518083062722560, 629, '', '4346899fad9a423595fb6c48789dd99d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0abe36f4503d45f9b4584495c7e3b0fd', '锦纶纤维制造', '锦纶纤维制造', '0abe36f4503d45f9b4584495c7e3b0fd', 1461518083062722560, 408, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0ac277d9877fe70a05770478a9544952', '塑料加工专用设备制造', '塑料加工专用设备制造', '1536310379493011575', 1461518083062722560, 609, '', '1536310379493011567', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0ae7538c6f9f4841a19494e0b018b12f', '城市公共交通运输', '城市公共交通运输', '0ae7538c6f9f4841a19494e0b018b12f', 1461518083062722560, 999, '', 'b64282a18c5f4980b1432a50ceb588fd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0ae7bdc5662a47bcb41322873d54d5f7', '配电开关控制设备制造', '配电开关控制设备制造', '0ae7bdc5662a47bcb41322873d54d5f7', 1461518083062722560, 705, '', 'e6d81ec118e14452ae27560ad9c35f44', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0af114f6710c4fe1950cb9d026b88789', '道路运输辅助活动', '道路运输辅助活动', '0af114f6710c4fe1950cb9d026b88789', 1461518083062722560, 1006, '', 'b64282a18c5f4980b1432a50ceb588fd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0b17afac4f624e45a2c5ad3b8dbab787', '其他肥料制造', '其他肥料制造', '0b17afac4f624e45a2c5ad3b8dbab787', 1461518083062722560, 363, '', '10f07810f0d947289092d4489bea5968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0b26cff69bfbd8d14153cf574414268b', '家具制造业', '家具制造业', '1536311398964736076', 1461518083062722560, 287, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0b5a9a0fec844b959ab24e6ba6666a14', '通信设备零售', '通信设备零售', '0b5a9a0fec844b959ab24e6ba6666a14', 1461518083062722560, 970, '', '30c19ce6a3094ce983f55d95dd4b19e1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0b617ceda4024f2fac96021803366916', '纺织面料鞋制造', '纺织面料鞋制造', '0b617ceda4024f2fac96021803366916', 1461518083062722560, 260, '', 'c3f468119b194c1a99edf99ae5c8066c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0b683ad9ef3b4cb5a8adf7609f446e0b', '镍氢电池制造', '镍氢电池制造', '0b683ad9ef3b4cb5a8adf7609f446e0b', 1461518083062722560, 716, '', '41b7992560624658b1f1f8cfa1971782', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0b8d6822dd364068b593143df2cb7d62', '海洋旅客运输', '海洋旅客运输', '0b8d6822dd364068b593143df2cb7d62', 1461518083062722560, 1012, '', 'd39afb8696c948ba88baadc8b053221a', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0bcac134f7e44cec92781e6a678479ee', '金属门窗制造', '金属门窗制造', '0bcac134f7e44cec92781e6a678479ee', 1461518083062722560, 512, '', 'f74e5170fd574a4fba166abdba4e1d75', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0bdf405bfaff4e0083309dace34266f3', '棉印染精加工', '棉印染精加工', '0bdf405bfaff4e0083309dace34266f3', 1461518083062722560, 210, '', '4739e3203d83477d83623b72b751e445', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0be77ac09f0f4ee28a8c5900897beab9', '兽用药品制造', '兽用药品制造', '0be77ac09f0f4ee28a8c5900897beab9', 1461518083062722560, 400, '', 'e4a034315f244268b87181669e0a6580', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0c0d3dbbcf7f41caac097b5a5610c468', '化妆品制造', '化妆品制造', '0c0d3dbbcf7f41caac097b5a5610c468', 1461518083062722560, 391, '', 'b5210ed1f0304474a251e592d21f2258', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0c411a55f4414d27b7e0ab69f81e0ffc', '文具用品批发', '文具用品批发', '0c411a55f4414d27b7e0ab69f81e0ffc', 1461518083062722560, 886, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0c5349af423a49d8bba9a3d2b8f6a3d1', '火力发电', '火力发电', '0c5349af423a49d8bba9a3d2b8f6a3d1', 1461518083062722560, 812, '', '5ecd006a532c49b6b294f268e35f4fa1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0c57f08d78c246d3b786e68d9e47e3a7', '纺织品、针织品及原料批发', '纺织品、针织品及原料批发', '0c57f08d78c246d3b786e68d9e47e3a7', 1461518083062722560, 877, '', '3fed51964f224f8faa5db756cfafda81', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0c8bbdc676a64bd5aee5e8a5c9b4860a', '广播电视节目制作及发射设备制造', '广播电视节目制作及发射设备制造', '0c8bbdc676a64bd5aee5e8a5c9b4860a', 1461518083062722560, 747, '', '15c74911c46e4a99bc107e9108a890fb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0cc3464755cf4c4341d784d22753009d', '其他仪器仪表制造业', '其他仪器仪表制造业', '1536310379493011719', 1461518083062722560, 786, '', '1536310379493011687', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0cc8be65ba5747c9923921d884f64836', '其他室内装饰材料零售', '其他室内装饰材料零售', '0cc8be65ba5747c9923921d884f64836', 1461518083062722560, 980, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0d06a8b250eb4960bcc1435549fedc3e', '房地产业', '房地产业', '0d06a8b250eb4960bcc1435549fedc3e', 1461518083062722560, 1129, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0d2243f4cfebaffb563eec4fbb555430', '废弃资源综合利用业', '废弃资源综合利用业', '1536311398968930426', 1461518083062722560, 794, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0d9be38d193e4f138f40daabc500c32b', '木竹材林产品采集', '木竹材林产品采集', '0d9be38d193e4f138f40daabc500c32b', 1461518083062722560, 45, '', '13d771471e684f0daa181b376b6cd3f0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0dbf34f66beddb9e4d0242d69c776217', '计算机、通信和其他电子设备制造业', '计算机、通信和其他电子设备制造业', '1536307437964701996', 1461518083062722560, 737, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0dfd3e7a6c3abb95edf19d5401d5cbc6', '专科医院', '专科医院', '1536307437964702104', 1461518083062722560, 1317, '', '1536307437964702088', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0e0b8e3aafb44405b58b4810c0c8d981', '毛染整精加工', '毛染整精加工', '0e0b8e3aafb44405b58b4810c0c8d981', 1461518083062722560, 214, '', '3b6376f16a31444bb1b51564e8396af2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0e1272104e3d4cdc82b7e3cfd57e1cb2', '中乐器制造', '中乐器制造', '0e1272104e3d4cdc82b7e3cfd57e1cb2', 1461518083062722560, 319, '', '8c16b25978dd4f4c9d4c18bc84cce536', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0e1b5599b0374fd99f225f6416c6c3f9', '其他酒制造', '其他酒制造', '0e1b5599b0374fd99f225f6416c6c3f9', 1461518083062722560, 193, '', 'f6f9e986c5a64965b65cc4b7569d7949', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0e383e75b36fe2fe4ec0e767250437ed', '废弃资源综合利用业', '废弃资源综合利用业', '1536310379493011723', 1461518083062722560, 794, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0e85c30755b2427c98c3b5406ec53523', '教育', '教育', '0e85c30755b2427c98c3b5406ec53523', 1461518083062722560, 1288, '', 'c3796786035442a7a380f1bd92404d42', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0ea25d3c53f5af0c8c7a6471122a490e', '竹、藤家具制造', '竹、藤家具制造', '1536310379488817236', 1461518083062722560, 289, '', '1536310379488817228', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0eab499df5964b2c814f6eea9431a1ec', '机场', '机场', '0eab499df5964b2c814f6eea9431a1ec', 1461518083062722560, 1029, '', 'ed3a0d30eeac49ff8a4cdcd53d6e5c2b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0eba886ad0ed7fd47e7b023d260c09ad', '计划生育技术服务活动', '计划生育技术服务活动', '1536294082927473018', 1461518083062722560, 1324, '', '1536294082927472994', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0ed10aa470e04d5c989dca17a5a39eef', '电气信号设备装置制造', '电气信号设备装置制造', '0ed10aa470e04d5c989dca17a5a39eef', 1461518083062722560, 735, '', 'a8fcffdb8e8a4da4af04e6a3ea3d90f5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0eecd86a6ebb1dc3056dc5dec492ea68', '制造业', '制造业', '1536311398964736004', 1461518083062722560, 132, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0f0270e7bce259a05e849dbcfd3820e6', '建筑工程用机械制造', '建筑工程用机械制造', '1536311398964736196', 1461518083062722560, 602, '', '1536311398964736188', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0f02e0530f7c4f0593049cb2f8bb7ee4', '电力电子元器件制造', '电力电子元器件制造', '0f02e0530f7c4f0593049cb2f8bb7ee4', 1461518083062722560, 706, '', 'e6d81ec118e14452ae27560ad9c35f44', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0f11151ba1584bf7a04b1035dbe144e7', '麻纤维纺前加工和纺纱', '麻纤维纺前加工和纺纱', '0f11151ba1584bf7a04b1035dbe144e7', 1461518083062722560, 216, '', '8ca4b0fd89624ea6bbc42c9ee45a1508', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0f112be70e764582b03da28160224065', '无线广播电视传输服务', '无线广播电视传输服务', '0f112be70e764582b03da28160224065', 1461518083062722560, 1074, '', 'f3260d4f0e554e7dabc3d81e4b13a42e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0f3759f529204d54a0cd24143bae29dc', '核子及核辐射测量仪器制造', '核子及核辐射测量仪器制造', '0f3759f529204d54a0cd24143bae29dc', 1461518083062722560, 779, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0fa140532b2a48ab81e02e3c428182e8', '蜜饯制作', '蜜饯制作', '0fa140532b2a48ab81e02e3c428182e8', 1461518083062722560, 164, '', '6b6bcb3ce4704d60909fa9f6599f124b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0fb8c81012dbbfbfa27d5b36e613745a', '计算机、通信和其他电子设备制造业', '计算机、通信和其他电子设备制造业', '1536294082927472906', 1461518083062722560, 737, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0fc018619911a1e33ffde27b52f684cd', '建筑工程用机械制造', '建筑工程用机械制造', '1536307437964701892', 1461518083062722560, 602, '', '1536307437964701884', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0fe7133cc86cc2fa055e55ebc6b09a59', '电气机械和器材制造业', '电气机械和器材制造业', '1536294082927472878', 1461518083062722560, 697, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('0ffdf33cd3f745c1b5312c024dbda106', '城市轨道交通', '城市轨道交通', '0ffdf33cd3f745c1b5312c024dbda106', 1461518083062722560, 1001, '', '0ae7538c6f9f4841a19494e0b018b12f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('101d7771811b426996443ffff9527787', '食用植物油加工', '食用植物油加工', '101d7771811b426996443ffff9527787', 1461518083062722560, 137, '', '6d0c5911296c4095a8c32e2a9e61a483', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1025ca6361fd4f8e8b12e75aeb06b2b0', '其他专用设备制造', '其他专用设备制造', '1025ca6361fd4f8e8b12e75aeb06b2b0', 1461518083062722560, 659, '', '8b87fe3dddb440b5942961d52baf7863', 0, '1');
INSERT INTO `jvs_tree` VALUES ('103b64dac2795a2db8387d62c9baeeed', '建筑工程用机械制造', '建筑工程用机械制造', '1536294082927472802', 1461518083062722560, 602, '', '1536294082927472794', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1049a31de24841379226962a640aad76', '针织或钩针编织物印染精加工', '针织或钩针编织物印染精加工', '1049a31de24841379226962a640aad76', 1461518083062722560, 228, '', '076cfbad4a3b4762936bf7d9336715f9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('105616de9739494193db0055d7c40e4e', '地质勘探和地震专用仪器制造', '地质勘探和地震专用仪器制造', '105616de9739494193db0055d7c40e4e', 1461518083062722560, 777, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, '1');
INSERT INTO `jvs_tree` VALUES ('108fb7ba7a6b7207d23ac18d2cf75d24', '泵及真空设备制造', '泵及真空设备制造', '1536307437964701832', 1461518083062722560, 567, '', '1536307437964701828', 0, '1');
INSERT INTO `jvs_tree` VALUES ('10addac3842a64929d09a05d7e1298f7', '广播电视节目制作及发射设备制造', '广播电视节目制作及发射设备制造', '1536310379493011679', 1461518083062722560, 747, '', '1536310379493011675', 0, '1');
INSERT INTO `jvs_tree` VALUES ('10ae35648f994f9a9ee7c2e39cffdff4', '烘炉、熔炉及电炉制造', '烘炉、熔炉及电炉制造', '10ae35648f994f9a9ee7c2e39cffdff4', 1461518083062722560, 576, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('10c86007c5f4e8162fe42efef5145758', '轴承、齿轮和传动部件制造', '轴承、齿轮和传动部件制造', '1536310379493011507', 1461518083062722560, 571, '', '1536310379493011479', 0, '1');
INSERT INTO `jvs_tree` VALUES ('10d4275dba6aca037d8bdf6554695fad', '专科疾病防治院（所、站）', '专科疾病防治院（所、站）', '1536310379493011783', 1461518083062722560, 1326, '', '1536310379493011755', 0, '1');
INSERT INTO `jvs_tree` VALUES ('10f07810f0d947289092d4489bea5968', '肥料制造', '肥料制造', '10f07810f0d947289092d4489bea5968', 1461518083062722560, 357, '', 'c01cf4a89346492eb44865639a074a45', 0, '1');
INSERT INTO `jvs_tree` VALUES ('111865d3535c002ec3e94a32c6faa69a', 'tree.jvstree', NULL, NULL, NULL, 133, NULL, '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('111b3d7fc3364dfea496a12261021c65', '视听设备制造', '视听设备制造', '111b3d7fc3364dfea496a12261021c65', 1461518083062722560, 751, '', '33c10b41d3a34c66aa7898793302dd15', 0, '1');
INSERT INTO `jvs_tree` VALUES ('112', '重庆', 'Chongqing', '69d92db2-24b7-4dca-a1d2-46b2dca1466f', 1461518083066916871, 112, NULL, '111', 0, '1');
INSERT INTO `jvs_tree` VALUES ('11310138961c20162bafd6a5aa2b2618', '纸制品制造', '纸制品制造', '1536310829881569384', 1461518083062722560, 301, '', '1536310829881569372', 0, '1');
INSERT INTO `jvs_tree` VALUES ('11346842b1a74a689462a4003b8551e1', '小麦种植', '小麦种植', '11346842b1a74a689462a4003b8551e1', 1461518083062722560, 5, '', 'efd3cd9b3fc745ca949140f3f401446e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1171809ee5027d8d0188aa6a574ce405', '研究和试验发展', '研究和试验发展', '1536310379899858944', 1461518083062722560, 1188, '', '1536310379828555780', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1176e590a72540f39b211f635ebda40d', '耐火土石开采', '耐火土石开采', '1176e590a72540f39b211f635ebda40d', 1461518083062722560, 117, '', '338fddda90714633a35486487f31961e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('11bb8e3d4243489a94d9b3cd74db3523', '汽车零售', '汽车零售', '11bb8e3d4243489a94d9b3cd74db3523', 1461518083062722560, 962, '', 'cf46f0a4428749fbbbeabeeadd53969d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('11e574043c1a40a784a6efb7a27060ae', '泵及真空设备制造', '泵及真空设备制造', '11e574043c1a40a784a6efb7a27060ae', 1461518083062722560, 567, '', '5fb0f7308897486587d113f21523204f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('12034bde62f0945cd63d4e92028df81d', '塑料家具制造', '塑料家具制造', '1536307437964701784', 1461518083062722560, 291, '', '1536307437964701772', 0, '1');
INSERT INTO `jvs_tree` VALUES ('121043b9d59245aea5db133e67b2e324', '机械零部件加工', '机械零部件加工', '121043b9d59245aea5db133e67b2e324', 1461518083062722560, 595, '', 'b7d629b5dd27447dbbf8664c3521e653', 0, '1');
INSERT INTO `jvs_tree` VALUES ('121dce92ecaa4f5cb78e09a68578a842', '典当', '典当', '121dce92ecaa4f5cb78e09a68578a842', 1461518083062722560, 1097, '', 'db8176d86056497cb391d51ff575ca81', 0, '1');
INSERT INTO `jvs_tree` VALUES ('12513ff9fae8deb856003bf691cbef8f', '其他传动部件制造', '其他传动部件制造', '1536311398964736144', 1461518083062722560, 574, '', '1536311398964736140', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1252f909d72346af845c29fa0eb898f6', '墨水、墨汁制造', '墨水、墨汁制造', '1252f909d72346af845c29fa0eb898f6', 1461518083062722560, 316, '', '8f10e9c4cb3f4f9f844b41c521bdfa55', 0, '1');
INSERT INTO `jvs_tree` VALUES ('125bd0967f854c19ad5a57322485a0ff', '葡萄酒制造', '葡萄酒制造', '125bd0967f854c19ad5a57322485a0ff', 1461518083062722560, 192, '', 'f6f9e986c5a64965b65cc4b7569d7949', 0, '1');
INSERT INTO `jvs_tree` VALUES ('126616505b0048ce98a6b7f0e6faa60b', '羽毛(绒)加工及制品制造', '羽毛(绒)加工及制品制造', '126616505b0048ce98a6b7f0e6faa60b', 1461518083062722560, 256, '', '41d6e99c8a134d7992628343e52ff28a', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1267a9510f414156a0b157e7573a30d0', '其他合成材料制造', '其他合成材料制造', '1267a9510f414156a0b157e7573a30d0', 1461518083062722560, 377, '', 'f7a803f3d94a4c97a9d7a53b720aaddc', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1268395c5b414a8f900a6e47fcd436b4', '铜冶炼', '铜冶炼', '1268395c5b414a8f900a6e47fcd436b4', 1461518083062722560, 485, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1276db4d3eb05bb092e107d3e9b04ba4', '木质家具制造', '木质家具制造', '1536294082927472686', 1461518083062722560, 288, '', '1536294082927472682', 0, '1');
INSERT INTO `jvs_tree` VALUES ('129c9e0333e143d7b16ee0dc78f92cf7', '洗涤机械制造', '洗涤机械制造', '129c9e0333e143d7b16ee0dc78f92cf7', 1461518083062722560, 630, '', '4346899fad9a423595fb6c48789dd99d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('12ac9a70dfb545fbad15ee889c0b8548', '公路管理与养护', '公路管理与养护', '12ac9a70dfb545fbad15ee889c0b8548', 1461518083062722560, 1008, '', '0af114f6710c4fe1950cb9d026b88789', 0, '1');
INSERT INTO `jvs_tree` VALUES ('12e59469193c40438e8cd4b4b028332c', '非木竹浆制造', '非木竹浆制造', '12e59469193c40438e8cd4b4b028332c', 1461518083062722560, 296, '', '4b51f060d88a4896b978a2aa42d01f48', 0, '1');
INSERT INTO `jvs_tree` VALUES ('12e9ef8ec810464aa7f549724c19fd19', '社会保障', '社会保障', '12e9ef8ec810464aa7f549724c19fd19', 1461518083062722560, 1406, '', '59197d85c9ec4799b796470efc98f65b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13198f03811f4c629b233ca5d8609dfa', '柑橘类种植', '柑橘类种植', '13198f03811f4c629b233ca5d8609dfa', 1461518083062722560, 25, '', '01e1d829d1e245d5bf3a066ce77191f3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13248d32d83345a881d99c847b7fe2ca', '家用视听设备零售', '家用视听设备零售', '13248d32d83345a881d99c847b7fe2ca', 1461518083062722560, 967, '', '30c19ce6a3094ce983f55d95dd4b19e1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('134cab9ffd0047485aaeae33fbe55929', '卫生和社会工作', '卫生和社会工作', '1536294082927472990', 1461518083062722560, 1310, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('137079afc3ec448a8e75f670e8a79f71', '体校及体育培训', '体校及体育培训', '137079afc3ec448a8e75f670e8a79f71', 1461518083062722560, 1306, '', '3f2332f633b643479907b872201e7387', 0, '1');
INSERT INTO `jvs_tree` VALUES ('137558089ddc423aac152b7355339a22', '海洋工程建筑', '海洋工程建筑', '137558089ddc423aac152b7355339a22', 1461518083062722560, 839, '', '7ed8bf1d78f34e0d83e5cc49318096f9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('138a6c5ef30f059daf82ac01c7d5433e', '饲料加工', '饲料加工', '1536310379828555776', 1461518083062722560, 135, '', '1536310379761446912', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13b1898b59f84dba9a2069de30a79b39', '铝冶炼', '铝冶炼', '13b1898b59f84dba9a2069de30a79b39', 1461518083062722560, 490, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13b7b9685b4c898b49e4821149a446cd', '制造业', '制造业', '1536307437964701700', 1461518083062722560, 132, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13b82a1d93e133a9284b9c495a4be9f9', '专用仪器仪表制造', '专用仪器仪表制造', '1536310379493011691', 1461518083062722560, 772, '', '1536310379493011687', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13d75bb0e0d1450aaac9436826617835', '农、林、牧、渔业', '农、林、牧、渔业', '13d75bb0e0d1450aaac9436826617835', 1461518083062722560, 1, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('13d771471e684f0daa181b376b6cd3f0', '林产品采集', '林产品采集', '13d771471e684f0daa181b376b6cd3f0', 1461518083062722560, 44, '', 'e222f63d0cbe4b659bb50ec78a197c7d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('14290e9b34234430abf57e418dbcacce', '化学试剂和助剂制造', '化学试剂和助剂制造', '14290e9b34234430abf57e418dbcacce', 1461518083062722560, 379, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1441197de554515855d5125a07cd6086', '地质勘探和地震专用仪器制造', '地质勘探和地震专用仪器制造', '1536294082927472938', 1461518083062722560, 777, '', '1536294082927472930', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1442c769265e4886426728cfbccacfa2', '电池制造', '电池制造', '1536294082927472890', 1461518083062722560, 714, '', '1536294082927472878', 0, '1');
INSERT INTO `jvs_tree` VALUES ('145148bf32184b6a8311fe783ef0e544', '石棉及其他非金属矿采选', '石棉及其他非金属矿采选', '145148bf32184b6a8311fe783ef0e544', 1461518083062722560, 121, '', '3f113a8e5ed742cca5693a4009ed9a65', 0, '1');
INSERT INTO `jvs_tree` VALUES ('148ff1ffb8bf4ad69d2f6d648298a9b8', '文具用品零售', '文具用品零售', '148ff1ffb8bf4ad69d2f6d648298a9b8', 1461518083062722560, 949, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, '1');
INSERT INTO `jvs_tree` VALUES ('149397955be5d06c4cc968f6bebbc475', '烟草生产专用设备制造', '烟草生产专用设备制造', '1536294082927472830', 1461518083062722560, 616, '', '1536294082927472822', 0, '1');
INSERT INTO `jvs_tree` VALUES ('149c4710a9f0474b977ce838a6b25d9e', '知识产权服务', '知识产权服务', '149c4710a9f0474b977ce838a6b25d9e', 1461518083062722560, 1165, '', '1d4aa2be74514a73925194b48b570791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('14a3cd0771c3a7fd122555f27ce31286', '纸制品制造', '纸制品制造', '1536294082927472710', 1461518083062722560, 301, '', '1536294082927472698', 0, '1');
INSERT INTO `jvs_tree` VALUES ('14cd1160b51347f7af080f844905b128', '光学仪器及眼镜制造', '光学仪器及眼镜制造', '14cd1160b51347f7af080f844905b128', 1461518083062722560, 783, '', '316c339beabb4599a6534e2870ccdf6d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('14d274c21db54e44a4377a35e42f901d', '非食用植物油加工', '非食用植物油加工', '14d274c21db54e44a4377a35e42f901d', 1461518083062722560, 138, '', '6d0c5911296c4095a8c32e2a9e61a483', 0, '1');
INSERT INTO `jvs_tree` VALUES ('150be912de0a49dbab6c00c4d0af06a6', '制镜及类似品加工', '制镜及类似品加工', '150be912de0a49dbab6c00c4d0af06a6', 1461518083062722560, 460, '', '7f127fa7b9644592b4899ee6820f5647', 0, '1');
INSERT INTO `jvs_tree` VALUES ('151f92d67fa84c46acfb591a1e30a7e7', '交通安全、管制及类似专用设备制造', '交通安全、管制及类似专用设备制造', '151f92d67fa84c46acfb591a1e30a7e7', 1461518083062722560, 657, '', '8b87fe3dddb440b5942961d52baf7863', 0, '1');
INSERT INTO `jvs_tree` VALUES ('151fda4bcc894e1a3709b17fa6ab8662', '连续搬运设备制造', '连续搬运设备制造', '1536310379493011487', 1461518083062722560, 563, '', '1536310379493011483', 0, '1');
INSERT INTO `jvs_tree` VALUES ('156e8758efb74ce8824c73d0ac0111c3', '歌舞厅娱乐活动', '歌舞厅娱乐活动', '156e8758efb74ce8824c73d0ac0111c3', 1461518083062722560, 1375, '', '367085faa6ce4b71b269b4adf385b76e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('159f8d0098f24323b8673953fc1879a5', '自然保护区管理', '自然保护区管理', '159f8d0098f24323b8673953fc1879a5', 1461518083062722560, 1236, '', '34b3891c4b974d5791e24e2c61ab1bd5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('15ad1558a0f0d23ae92edee863e36718', '炼油、化工生产专用设备制造', '炼油、化工生产专用设备制造', '1536310379493011571', 1461518083062722560, 607, '', '1536310379493011567', 0, '1');
INSERT INTO `jvs_tree` VALUES ('15aecc175ecb4ae28c72c0208ed0c259', '石墨及其他非金属矿物制品制造', '石墨及其他非金属矿物制品制造', '15aecc175ecb4ae28c72c0208ed0c259', 1461518083062722560, 474, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('15b8107e655c461d92a04081482765ac', '石棉水泥制品制造', '石棉水泥制品制造', '15b8107e655c461d92a04081482765ac', 1461518083062722560, 440, '', '1e55bff094854d93bb468c6f213265de', 0, '1');
INSERT INTO `jvs_tree` VALUES ('15c74911c46e4a99bc107e9108a890fb', '广播电视设备制造', '广播电视设备制造', '15c74911c46e4a99bc107e9108a890fb', 1461518083062722560, 746, '', '33c10b41d3a34c66aa7898793302dd15', 0, '1');
INSERT INTO `jvs_tree` VALUES ('15cec00cd1bc4c8282b33f51af3bb5f6', '风动和电动工具制造', '风动和电动工具制造', '15cec00cd1bc4c8282b33f51af3bb5f6', 1461518083062722560, 580, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1611b23fc7984c5fa508984e2aa3889d', '航空客货运输', '航空客货运输', '1611b23fc7984c5fa508984e2aa3889d', 1461518083062722560, 1024, '', '3b03d37482194755857827cf9bbe4be3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('165a799bef7944d0944d4e46dbeed94f', '艺术表演场馆', '艺术表演场馆', '165a799bef7944d0944d4e46dbeed94f', 1461518083062722560, 1359, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1670086ac33f47e09b7a8fb80faa2fb2', '其他水果种植', '其他水果种植', '1670086ac33f47e09b7a8fb80faa2fb2', 1461518083062722560, 27, '', '01e1d829d1e245d5bf3a066ce77191f3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('16d3833b6d494813a81de2d3f76c7c5c', '紧固件制造', '紧固件制造', '16d3833b6d494813a81de2d3f76c7c5c', 1461518083062722560, 593, '', 'b7d629b5dd27447dbbf8664c3521e653', 0, '1');
INSERT INTO `jvs_tree` VALUES ('16e1e9018dfa4f0abc037f5ca0283e97', '其他玻璃制造', '其他玻璃制造', '16e1e9018dfa4f0abc037f5ca0283e97', 1461518083062722560, 452, '', '06e7f980143a449ca6e9045b8a2cc9c9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('171f90812b05457990a6bf5f3450c44b', '通讯及广播电视设备批发', '通讯及广播电视设备批发', '171f90812b05457990a6bf5f3450c44b', 1461518083062722560, 915, '', 'e821e1d643de40508001dfe91309f8fd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1765780bfe434cf4b7c8f8475788ac10', '书、报刊印刷', '书、报刊印刷', '1765780bfe434cf4b7c8f8475788ac10', 1461518083062722560, 306, '', 'fda69d6ec01941ab8f44bdda8eeb3402', 0, '1');
INSERT INTO `jvs_tree` VALUES ('17bf57afe7b6447dbac54dbfd0b294e6', '飞机制造', '飞机制造', '17bf57afe7b6447dbac54dbfd0b294e6', 1461518083062722560, 683, '', '63c782a68b2d4768b625fb2673c9b222', 0, '1');
INSERT INTO `jvs_tree` VALUES ('17fd8b163a6749a48002036d0684caa1', '工程准备活动', '工程准备活动', '17fd8b163a6749a48002036d0684caa1', 1461518083062722560, 851, '', '8ed66bafdee04fd781dc83a103dcc577', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1821b71b6b595340e817c8b546fac404', '电车制造', '电车制造', '1536311398968930334', 1461518083062722560, 664, '', '1536311398968930322', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1829181520b11818c1b37ba6efa3965d', '木片加工', '木片加工', '1536307437964701748', 1461518083062722560, 268, '', '1536307437964701740', 0, '1');
INSERT INTO `jvs_tree` VALUES ('18a0adb9266445c796fb703d0530e267', '其他毛皮制品加工', '其他毛皮制品加工', '18a0adb9266445c796fb703d0530e267', 1461518083062722560, 255, '', 'c7fd52d88c344084baf1c4dbd3621cc3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('18b70958583a491eba2567d01105d429', '软件和信息技术服务业', '软件和信息技术服务业', '18b70958583a491eba2567d01105d429', 1461518083062722560, 1080, '', '9dff8e99b53f46a08b2a82d317b1ce82', 0, '1');
INSERT INTO `jvs_tree` VALUES ('18ca24e42dd1453daaa1cb34b8a4714c', '其他商务服务业', '其他商务服务业', '18ca24e42dd1453daaa1cb34b8a4714c', 1461518083062722560, 1179, '', '1d4aa2be74514a73925194b48b570791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('191fbff8b3511d97fa5cec40e92c2c50', '烘炉、熔炉及电炉制造', '烘炉、熔炉及电炉制造', '1536294082927472758', 1461518083062722560, 576, '', '1536294082927472754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('192c20279d0944c6b81516e00902f3d5', '珠宝首饰及有关物品制造', '珠宝首饰及有关物品制造', '192c20279d0944c6b81516e00902f3d5', 1461518083062722560, 331, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('19493c65e8fa413a92c97fe37446f1ff', '印刷、制药、日化及日用品生产专用设备制造', '印刷、制药、日化及日用品生产专用设备制造', '19493c65e8fa413a92c97fe37446f1ff', 1461518083062722560, 618, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('196969e76c044d5280fd58008700d1d4', '医院', '医院', '196969e76c044d5280fd58008700d1d4', 1461518083062722560, 1312, '', '4801a7689f0d49c8b12f7c356f357333', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1990c3a7eb084644b53b1d038fc7d4d9', '鸡的饲养', '鸡的饲养', '1990c3a7eb084644b53b1d038fc7d4d9', 1461518083062722560, 56, '', '313dcc6dc6fd41d7a953ce6ac730e1e7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('199590b5952142d4bd4e7a1b5af5bb0f', '肉、禽、蛋、奶及水产品批发', '肉、禽、蛋、奶及水产品批发', '199590b5952142d4bd4e7a1b5af5bb0f', 1461518083062722560, 870, '', 'b28ff0b238614f3bba8f268424209280', 0, '1');
INSERT INTO `jvs_tree` VALUES ('19a60ca5cac04fb4bae6d2cb8c8fe801', '研究和试验发展', '研究和试验发展', '19a60ca5cac04fb4bae6d2cb8c8fe801', 1461518083062722560, 1188, '', '0835d6af067244cdbd679abb37910c37', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1a3542caf9fe46cbae7ce59157e1ce82', '其他园艺作物种植', '其他园艺作物种植', '1a3542caf9fe46cbae7ce59157e1ce82', 1461518083062722560, 21, '', '404950a038404d92b860ec3e34694303', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1a58ed2dc319424f9fc5b0eb496aa6c3', '铁路机车车辆及动车组制造', '铁路机车车辆及动车组制造', '1a58ed2dc319424f9fc5b0eb496aa6c3', 1461518083062722560, 669, '', '80d9141616884b538edef0504a7dbe76', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1a8821e8970b438baabbb0a4878464cf', '期刊出版', '期刊出版', '1a8821e8970b438baabbb0a4878464cf', 1461518083062722560, 1346, '', '7ef056b6bde840c3bc6b6186f8d032ed', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1a88df1120744101b4c2725242c44fb1', '篷、帆布制造', '篷、帆布制造', '1a88df1120744101b4c2725242c44fb1', 1461518083062722560, 239, '', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1a97333c57bf473d876aaecbc695130a', '镍钴冶炼', '镍钴冶炼', '1a97333c57bf473d876aaecbc695130a', 1461518083062722560, 487, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1aa65b0584ba4e97841f13b62ae46a22', '珠宝首饰零售', '珠宝首饰零售', '1aa65b0584ba4e97841f13b62ae46a22', 1461518083062722560, 953, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1aca338490c347948973d24d5e78ae8f', '其他金属制日用品制造', '其他金属制日用品制造', '1aca338490c347948973d24d5e78ae8f', 1461518083062722560, 539, '', '46922c9d081a4bd2a30860d15b5837ab', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1ada1a3d047a4201bbc794b13f7a1dfc', '塑料家具制造', '塑料家具制造', '1ada1a3d047a4201bbc794b13f7a1dfc', 1461518083062722560, 291, '', '5c0163f1f7124c4993575b0d7c6aeb99', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1aeb504cdf603e0dd4ff5a7dc3d77f0b', '泵及真空设备制造', '泵及真空设备制造', '1536294082927472742', 1461518083062722560, 567, '', '1536294082927472738', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1b02b48c97e14fef8a9b2d5d1f794c16', '其他未列明餐饮业', '其他未列明餐饮业', '1b02b48c97e14fef8a9b2d5d1f794c16', 1461518083062722560, 1065, '', '62af44e381044e2cba12bffa1e0b47ec', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1b32e1838818afb7d434216cf8910519', '仪器仪表制造业', '仪器仪表制造业', '1536310379493011687', 1461518083062722560, 764, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1b79e7d71a93412b84167289a86f79c3', '抽纱刺绣工艺品制造', '抽纱刺绣工艺品制造', '1b79e7d71a93412b84167289a86f79c3', 1461518083062722560, 329, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1bc0fe7f5c88495a938bfbb1613ecbef', '建筑安装业', '建筑安装业', '1bc0fe7f5c88495a938bfbb1613ecbef', 1461518083062722560, 845, '', 'b67183c5310442e5bd939723ca155dea', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1bd7e8aa69e7ccfa59bd10da718ad612', '制冷、空调设备制造', '制冷、空调设备制造', '1536307437964701856', 1461518083062722560, 579, '', '1536307437964701844', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1c047feeb426485aacda4b500a0567af', '国标行业', '', '1c047feeb426485aacda4b500a0567af', 1461518083062722560, 0, '', '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1c791a5df6fe457ebc0ac073b76f1af0', '通用设备制造业', '通用设备制造业', '1c791a5df6fe457ebc0ac073b76f1af0', 1461518083062722560, 544, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1c7f78ea1e2a4bad92ee848aee29e4dd', '饲料批发', '饲料批发', '1c7f78ea1e2a4bad92ee848aee29e4dd', 1461518083062722560, 861, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1ccf08ea4e044e26aa2d52269cf48de2', '其他专业咨询', '其他专业咨询', '1ccf08ea4e044e26aa2d52269cf48de2', 1461518083062722560, 1163, '', '9b6d9e6363d64e32a9e6aa0aade9cd27', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d02fedd900d4a5db196ea9a573236df', '提供住宿社会工作', '提供住宿社会工作', '1d02fedd900d4a5db196ea9a573236df', 1461518083062722560, 1330, '', '6a4f510a481b4087950d90df6f0f458e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d0b5138491a3e8f64ed930fe9eeef7d', '专科疾病防治院（所、站）', '专科疾病防治院（所、站）', '1536311398968930486', 1461518083062722560, 1326, '', '1536311398968930458', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d39e5fecaa14f3da344f3acc3fb1313', '中西医结合医院', '中西医结合医院', '1d39e5fecaa14f3da344f3acc3fb1313', 1461518083062722560, 1315, '', '196969e76c044d5280fd58008700d1d4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d461a3070864ed088eddbbdb225857e', '其他非电力家用器具制造', '其他非电力家用器具制造', '1d461a3070864ed088eddbbdb225857e', 1461518083062722560, 729, '', 'afaab8c4990b42cf8d2d8c7b2e0d8db0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d4aa2be74514a73925194b48b570791', '商务服务业', '商务服务业', '1d4aa2be74514a73925194b48b570791', 1461518083062722560, 1149, '', 'e1e6b0a4b29646b78775f21cc5577e5b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d5041433cab4ca8a9ad33f3eb73e46b', '平板玻璃制造', '平板玻璃制造', '1d5041433cab4ca8a9ad33f3eb73e46b', 1461518083062722560, 451, '', '06e7f980143a449ca6e9045b8a2cc9c9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d796d19eee9a23c8798f52d758097d7', '洗涤机械制造', '洗涤机械制造', '1536310379493011615', 1461518083062722560, 630, '', '1536310379493011607', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1d9cbdd251624c95b50f64b1fdd764d8', '家用电器批发', '家用电器批发', '1d9cbdd251624c95b50f64b1fdd764d8', 1461518083062722560, 883, '', '3fed51964f224f8faa5db756cfafda81', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1dbb53ba44624b7fa1325734fb82318e', '鸭的饲养', '鸭的饲养', '1dbb53ba44624b7fa1325734fb82318e', 1461518083062722560, 57, '', '313dcc6dc6fd41d7a953ce6ac730e1e7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1de88c44d1334a8bba2e7446387718f4', '肥皂及合成洗涤剂制造', '肥皂及合成洗涤剂制造', '1de88c44d1334a8bba2e7446387718f4', 1461518083062722560, 390, '', 'b5210ed1f0304474a251e592d21f2258', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1df2ebd9d0c44ab7a4d68679ec7864c8', '农副食品加工专用设备制造', '农副食品加工专用设备制造', '1df2ebd9d0c44ab7a4d68679ec7864c8', 1461518083062722560, 615, '', '2efc07fcfa8841a180e277a88ffd4807', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e21ed3878ac7f9283036765e5ca320d', '建筑工程用机械制造', '建筑工程用机械制造', '1536310379493011563', 1461518083062722560, 602, '', '1536310379493011555', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e2e1464fd1f816c914e5782e77b0b5d', '锂离子电池制造', '锂离子电池制造', '1536294082927472894', 1461518083062722560, 715, '', '1536294082927472890', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e2ebe2b0cfb4b9791d4d855dbd7e4af', '计算机外围设备制造', '计算机外围设备制造', '1e2ebe2b0cfb4b9791d4d855dbd7e4af', 1461518083062722560, 741, '', 'f8f60b812bca4c15ac143f477661ba23', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e4c1b63531646d4850b4196b528d9f5', '机动车、电子产品和日用产品修理业', '机动车、电子产品和日用产品修理业', '1e4c1b63531646d4850b4196b528d9f5', 1461518083062722560, 1266, '', 'ca487ef1343d40f084234fc555aa3361', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e55bff094854d93bb468c6f213265de', '石膏、水泥制品及类似制品制造', '石膏、水泥制品及类似制品制造', '1e55bff094854d93bb468c6f213265de', 1461518083062722560, 437, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e832f3f2ce34652bd38c281bfb5bccf', '内陆养殖', '内陆养殖', '1e832f3f2ce34652bd38c281bfb5bccf', 1461518083062722560, 65, '', 'e7e6b4bb13f64d21b4c77f127df970d7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e84d8803f5005722960733dcb7836ee', '民族医院', '民族医院', '1536311398968930474', 1461518083062722560, 1316, '', '1536311398968930462', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1e8878e187fbadf2212a6f09fa4f93cf', '饲料加工', '饲料加工', '1536288251121037312', 1461518083062722560, 135, '', '1536288239628644352', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1ea0817984234c53af9c01070945e0fc', '旅客票务代理', '旅客票务代理', '1ea0817984234c53af9c01070945e0fc', 1461518083062722560, 1038, '', '04a5a05cee214eb096d670718e4fc305', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1eaa3aba20139f41b22249e5583c2382', '娱乐业', '娱乐业', '1536294082927473042', 1461518083062722560, 1373, '', '1536294082927473026', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1eacc358e92c4dfc96ff617e3b5e975e', '干部休养所', '干部休养所', '1eacc358e92c4dfc96ff617e3b5e975e', 1461518083062722560, 1331, '', '1d02fedd900d4a5db196ea9a573236df', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1ef601afc6784679817c4b40b199d39b', '技术玻璃制品制造', '技术玻璃制品制造', '1ef601afc6784679817c4b40b199d39b', 1461518083062722560, 454, '', '7f127fa7b9644592b4899ee6820f5647', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1ef7aa85e24d4b58930ef773f16385fa', '专项化学用品制造', '专项化学用品制造', '1ef7aa85e24d4b58930ef773f16385fa', 1461518083062722560, 380, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1efeeb730bc14c778d6071408da57297', '娱乐业', '娱乐业', '1efeeb730bc14c778d6071408da57297', 1461518083062722560, 1373, '', '567845af441a427eacdd14dfec55fe15', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1f252e49307d4563b6c40b7574cad667', '羽毛（绒）加工', '羽毛（绒）加工', '1f252e49307d4563b6c40b7574cad667', 1461518083062722560, 257, '', '126616505b0048ce98a6b7f0e6faa60b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1f3c77715931404386c5ad3fe1f56b2f', '木片加工', '木片加工', '1f3c77715931404386c5ad3fe1f56b2f', 1461518083062722560, 268, '', '5deb274a51d94adb8b7a3f0856a0934e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1f723983036484235022ad464b0e6bd4', '废弃资源综合利用业', '废弃资源综合利用业', '1536310829881569636', 1461518083062722560, 794, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1f920ea0b4ae4b0aa39bbac9b5128997', '水泥、石灰和石膏制造', '水泥、石灰和石膏制造', '1f920ea0b4ae4b0aa39bbac9b5128997', 1461518083062722560, 434, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1f949565905448af8b4f739daaf36224', '其他木材加工', '其他木材加工', '1f949565905448af8b4f739daaf36224', 1461518083062722560, 270, '', '5deb274a51d94adb8b7a3f0856a0934e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('1fef54327b76471b9dc681925e8ad057', '其他仪器仪表制造业', '其他仪器仪表制造业', '1fef54327b76471b9dc681925e8ad057', 1461518083062722560, 786, '', '316c339beabb4599a6534e2870ccdf6d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2001ec2e7cae0ec4974a08ab49e13b7f', '广播、电视、电影和影视录音制作业', '广播、电视、电影和影视录音制作业', '1536310829881569704', 1461518083062722560, 1350, '', '1536310829881569700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('200ac025feab6fcbba98158410874ada', '农副食品加工业', '农副食品加工业', '1536294082923278344', 1461518083062722560, 133, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2022ff6ed35e4ac88d19cd4254ab06c8', '纺织、服装及日用品专门零售', '纺织、服装及日用品专门零售', '2022ff6ed35e4ac88d19cd4254ab06c8', 1461518083062722560, 938, '', '47cb2cc4493644aa90fc6922d3b34448', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2036935e92624c0ca3eb541e8553173d', '客运港口', '客运港口', '2036935e92624c0ca3eb541e8553173d', 1461518083062722560, 1020, '', '4a35af8714dc4478b013db7e2bea5c33', 0, '1');
INSERT INTO `jvs_tree` VALUES ('20472e6f19294c06a9298653183e3016', '机动车燃料零售', '机动车燃料零售', '20472e6f19294c06a9298653183e3016', 1461518083062722560, 965, '', 'cf46f0a4428749fbbbeabeeadd53969d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('204b9cd5e13545bdaad5a9f781515930', '中等教育', '中等教育', '204b9cd5e13545bdaad5a9f781515930', 1461518083062722560, 1293, '', '0e85c30755b2427c98c3b5406ec53523', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2091dc6f36b7bf5a3e09c757ad5898e8', '软木制品及其他木制品制造', '软木制品及其他木制品制造', '1536310829881569352', 1461518083062722560, 281, '', '1536310829881569344', 0, '1');
INSERT INTO `jvs_tree` VALUES ('20a8e1d3b8fddcbce28d4630fd617c8b', '专科医院', '专科医院', '1536310829881569688', 1461518083062722560, 1317, '', '1536310829881569672', 0, '1');
INSERT INTO `jvs_tree` VALUES ('20d92bb19b40cb3523394ef359514f08', '卫生', '卫生', '1536310379493011755', 1461518083062722560, 1311, '', '1536310379493011751', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21142ec3bdce42d38955016c542ae73b', '其他水上运输辅助活动', '其他水上运输辅助活动', '21142ec3bdce42d38955016c542ae73b', 1461518083062722560, 1022, '', '4a35af8714dc4478b013db7e2bea5c33', 0, '1');
INSERT INTO `jvs_tree` VALUES ('215adb4559d2962838b8669d8c53bff6', '印刷、制药、日化及日用品生产专用设备制造', '印刷、制药、日化及日用品生产专用设备制造', '1536310379493011599', 1461518083062722560, 618, '', '1536310379493011551', 0, '1');
INSERT INTO `jvs_tree` VALUES ('216218ad682743e3b744ee57f4727717', '废弃资源综合利用业', '废弃资源综合利用业', '216218ad682743e3b744ee57f4727717', 1461518083062722560, 794, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('216a14ae1ba347e18230f23302ee2703', '城市轨道交通设备制造', '城市轨道交通设备制造', '216a14ae1ba347e18230f23302ee2703', 1461518083062722560, 674, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21a1ba905a554975fb53cc03ec2c6b78', '废弃资源综合利用业', '废弃资源综合利用业', '1536294082927472962', 1461518083062722560, 794, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21aa7973adac40a8a00ddf0d03e333a6', '其他提供住宿社会救助', '其他提供住宿社会救助', '21aa7973adac40a8a00ddf0d03e333a6', 1461518083062722560, 1336, '', '1d02fedd900d4a5db196ea9a573236df', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21b27ff2919a4dd29f6909bbd2193a2d', '藤制品制造', '藤制品制造', '21b27ff2919a4dd29f6909bbd2193a2d', 1461518083062722560, 284, '', 'ffbf154fce954e5a83fdf7c1ca00f8ba', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21bc82a41a33cdd9bfdd832646bfdf0e', '中医医院', '中医医院', '1536307437964702092', 1461518083062722560, 1314, '', '1536307437964702088', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21befdfbcf864225bf325e09a78f2aea', '其他塑料制品制造', '其他塑料制品制造', '21befdfbcf864225bf325e09a78f2aea', 1461518083062722560, 432, '', '50976a2f43bc4cc5955a536de9d07368', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21c40639d4d502d99ddecf744c8e3b3a', '风机、风扇制造', '风机、风扇制造', '1536310379493011523', 1461518083062722560, 577, '', '1536310379493011515', 0, '1');
INSERT INTO `jvs_tree` VALUES ('21f0650e267c4f718ac838d213c81de3', '休闲健身活动', '休闲健身活动', '21f0650e267c4f718ac838d213c81de3', 1461518083062722560, 1371, '', 'cf82b0dc32824fb98ef01061303d5bb4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('22065fd703c84fae93dd2722dbf1a276', '计算机、软件及辅助设备零售', '计算机、软件及辅助设备零售', '22065fd703c84fae93dd2722dbf1a276', 1461518083062722560, 969, '', '30c19ce6a3094ce983f55d95dd4b19e1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('220bac419f86462f9aadb73c4ac17d25', '律师及相关法律服务', '律师及相关法律服务', '220bac419f86462f9aadb73c4ac17d25', 1461518083062722560, 1156, '', '739b13a055de454c89429dc1e176db48', 0, '1');
INSERT INTO `jvs_tree` VALUES ('22e743754b8a4fe3a4904630338552c3', '机制纸及纸板制造', '机制纸及纸板制造', '22e743754b8a4fe3a4904630338552c3', 1461518083062722560, 298, '', '94b9ee4c5b044aff82a1db919eea8470', 0, '1');
INSERT INTO `jvs_tree` VALUES ('232e90a17cca443aa592d6aea13dc44a', '造纸和纸制品业', '造纸和纸制品业', '232e90a17cca443aa592d6aea13dc44a', 1461518083062722560, 293, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('236c4b2f6209d252740d02c44abf3a78', '电影和影视节目发行', '电影和影视节目发行', '1536310379493011795', 1461518083062722560, 1354, '', '1536310379493011791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('237fea0ccdbe4fccb41abf5201ae1fc7', '旅行社服务', '旅行社服务', '237fea0ccdbe4fccb41abf5201ae1fc7', 1461518083062722560, 1172, '', '034de10ed9434b67946c80c8e2fb8a78', 0, '1');
INSERT INTO `jvs_tree` VALUES ('23b352c1fee040e6bd0168d76ccc26d2', '新材料技术推广服务', '新材料技术推广服务', '23b352c1fee040e6bd0168d76ccc26d2', 1461518083062722560, 1222, '', '0888e14ec3974ab29ce2919250e07b7d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('242dd78213414f0f9c3ac611b510ec7e', '橡胶制品业', '橡胶制品业', '242dd78213414f0f9c3ac611b510ec7e', 1461518083062722560, 416, '', '9f741ded47174b37b13f861f4e8e7d1e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2430f436461be4bbc04b7eaf958ac9a3', '仪器仪表制造业', '仪器仪表制造业', '1536310829881569600', 1461518083062722560, 764, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('243a876e2a3d4f8db992165e25094c18', '新闻业', '新闻业', '243a876e2a3d4f8db992165e25094c18', 1461518083062722560, 1342, '', 'fb2f0ae09e894c0d8ed893878ac111ac', 0, '1');
INSERT INTO `jvs_tree` VALUES ('245a071a1fbc4bf7b08fc1ffcf089dad', '稀有稀土金属矿采选', '稀有稀土金属矿采选', '245a071a1fbc4bf7b08fc1ffcf089dad', 1461518083062722560, 108, '', 'b9630eb6fbec4c15b18f6b2d89fdb1ae', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2472399a51294549356a5bce4579e64b', '汽车制造业', '汽车制造业', '1536310379493011619', 1461518083062722560, 660, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('24be122fe92248d6b368f4e8b6687777', '中医医院', '中医医院', '24be122fe92248d6b368f4e8b6687777', 1461518083062722560, 1314, '', '196969e76c044d5280fd58008700d1d4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('24e3c8fb6b904c38b7f758deab41cc4f', '本册印制', '本册印制', '24e3c8fb6b904c38b7f758deab41cc4f', 1461518083062722560, 307, '', 'fda69d6ec01941ab8f44bdda8eeb3402', 0, '1');
INSERT INTO `jvs_tree` VALUES ('252806822254f39a8d8a43c44c5b3bfc', '其他木材加工', '其他木材加工', '1536307437964701756', 1461518083062722560, 270, '', '1536307437964701740', 0, '1');
INSERT INTO `jvs_tree` VALUES ('252f3153787925e4d8c30b2d7ca035bb', '城市', '', '1471309211608862720', 1471309211608862720, 0, NULL, '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('253413aebc934fbb9b4da1d295258810', '文化、娱乐、体育经纪代理', '文化、娱乐、体育经纪代理', '253413aebc934fbb9b4da1d295258810', 1461518083062722560, 1381, '', '1efeeb730bc14c778d6071408da57297', 0, '1');
INSERT INTO `jvs_tree` VALUES ('256f01f678df53a434ee07a7bf15430b', '化工、木材、非金属加工专用设备制造', '化工、木材、非金属加工专用设备制造', '1536294082927472806', 1461518083062722560, 606, '', '1536294082927472790', 0, '1');
INSERT INTO `jvs_tree` VALUES ('257a140a8dce48a1a45f204534ab989c', '自行车制造', '自行车制造', '257a140a8dce48a1a45f204534ab989c', 1461518083062722560, 690, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, '1');
INSERT INTO `jvs_tree` VALUES ('25da045260c0afa5ede5f3a2c148eb86', '木材加工', '木材加工', '1536307437964701740', 1461518083062722560, 266, '', '1536307437964701736', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2627dcd0581f43708f92b0978f2b2d9b', '林业产品批发', '林业产品批发', '2627dcd0581f43708f92b0978f2b2d9b', 1461518083062722560, 863, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('262ce3ced8b04d758bd307269abb61fc', '低速载货汽车制造', '低速载货汽车制造', '262ce3ced8b04d758bd307269abb61fc', 1461518083062722560, 663, '', '2c9f7f83b1a041279b95fd1b35c8a23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('263d5745b025eb606452819efc7142e0', '其他传动部件制造', '其他传动部件制造', '1536310829881569424', 1461518083062722560, 574, '', '1536310829881569420', 0, '1');
INSERT INTO `jvs_tree` VALUES ('265e60bbae17baf3d6eb25209224c956', '化工、木材、非金属加工专用设备制造', '化工、木材、非金属加工专用设备制造', '1536311398964736200', 1461518083062722560, 606, '', '1536311398964736184', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2671b2421fe447219393a226a5eb2bda', '水源及供水设施工程建筑', '水源及供水设施工程建筑', '2671b2421fe447219393a226a5eb2bda', 1461518083062722560, 836, '', 'ba5038703b2d45b7ae25a76b55542b75', 0, '1');
INSERT INTO `jvs_tree` VALUES ('26848897a07e4010900786828f0745cb', '天然气开采', '天然气开采', '26848897a07e4010900786828f0745cb', 1461518083062722560, 89, '', 'f5b88214f5184db3a6d8bcced3d91ad7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('26c6d90996824a62b0116d2b581a1821', '村民自治组织', '村民自治组织', '26c6d90996824a62b0116d2b581a1821', 1461518083062722560, 1421, '', '060f08e0258648e09f90a27c210cd896', 0, '1');
INSERT INTO `jvs_tree` VALUES ('27690fec91a49ff06cc2da8d26c380a2', '室内娱乐活动', '室内娱乐活动', '1536310829881569720', 1461518083062722560, 1374, '', '1536310829881569716', 0, '1');
INSERT INTO `jvs_tree` VALUES ('27b6f993c6e9b508ab821847615cc415', '电池制造', '电池制造', '1536307437964701980', 1461518083062722560, 714, '', '1536307437964701968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('27d034b6686b19b73ef224f11ce73d50', '塑料加工专用设备制造', '塑料加工专用设备制造', '1536294082927472814', 1461518083062722560, 609, '', '1536294082927472806', 0, '1');
INSERT INTO `jvs_tree` VALUES ('27f6747acb81418da54e0b3bb5b96e31', '其他日用品零售', '其他日用品零售', '27f6747acb81418da54e0b3bb5b96e31', 1461518083062722560, 947, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('27f9c563a6ca5067e810d9b476a79350', '制造业', '制造业', '1536294082923278340', 1461518083062722560, 132, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28204973ff6b4f1f8ddb8383a14823c6', '软木制品及其他木制品制造', '软木制品及其他木制品制造', '28204973ff6b4f1f8ddb8383a14823c6', 1461518083062722560, 281, '', '08c234aebbb444c99b04de865d8f2efb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28224952ba16442cacd6f708db40218e', '文化艺术培训', '文化艺术培训', '28224952ba16442cacd6f708db40218e', 1461518083062722560, 1307, '', '3f2332f633b643479907b872201e7387', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2839b7e70965084a1a12f0889894ac7e', '文化、体育和娱乐业', '文化、体育和娱乐业', '1536311398968930490', 1461518083062722560, 1340, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28409837b38d82a4b46ecc9434784ebb', '泵、阀门、压缩机及类似机械制造', '泵、阀门、压缩机及类似机械制造', '1536311398964736132', 1461518083062722560, 566, '', '1536311398964736112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28431578cb7545b4afd7fd13da26977d', '文化、办公用机械制造', '文化、办公用机械制造', '28431578cb7545b4afd7fd13da26977d', 1461518083062722560, 584, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2844031aad55474cb8b060eb687e7a2f', '保险经纪与代理服务', '保险经纪与代理服务', '2844031aad55474cb8b060eb687e7a2f', 1461518083062722560, 1118, '', '957d60e6ff6847e08c6514eb084a4b35', 0, '1');
INSERT INTO `jvs_tree` VALUES ('284e0de10465544e378e54643cde6ad1', '专科疾病防治院（所、站）', '专科疾病防治院（所、站）', '1536294082927473022', 1461518083062722560, 1326, '', '1536294082927472994', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28530ba9830c4010b9932ef55ef869ae', '畜牧机械制造', '畜牧机械制造', '28530ba9830c4010b9932ef55ef869ae', 1461518083062722560, 638, '', '96416de0d629464ab952c86bdfc99406', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28ac3f7dba2c4423bff5973e8a0f080a', '改装汽车制造', '改装汽车制造', '28ac3f7dba2c4423bff5973e8a0f080a', 1461518083062722560, 662, '', '2c9f7f83b1a041279b95fd1b35c8a23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('28d4346a5c3749bcbc5d8902f851aa5b', '成人初中教育', '成人初中教育', '28d4346a5c3749bcbc5d8902f851aa5b', 1461518083062722560, 1296, '', '204b9cd5e13545bdaad5a9f781515930', 0, '1');
INSERT INTO `jvs_tree` VALUES ('290d1de7fa9943d3a1cc37efcf38c215', '专科疾病防治院（所、站）', '专科疾病防治院（所、站）', '290d1de7fa9943d3a1cc37efcf38c215', 1461518083062722560, 1326, '', '4801a7689f0d49c8b12f7c356f357333', 0, '1');
INSERT INTO `jvs_tree` VALUES ('291208d9972f749a40d7324200485999', '运输设备及生产用计数仪表制造', '运输设备及生产用计数仪表制造', '1536294082927472934', 1461518083062722560, 774, '', '1536294082927472930', 0, '1');
INSERT INTO `jvs_tree` VALUES ('291a2faa228fca493205563c33a9f6a3', '文化、娱乐、体育经纪代理', '文化、娱乐、体育经纪代理', '1536307437964702144', 1461518083062722560, 1381, '', '1536307437964702132', 0, '1');
INSERT INTO `jvs_tree` VALUES ('296f2001aca93cbd75b0b78cbc4f916d', '饲料加工', '饲料加工', '1536307438430269440', 1461518083062722560, 135, '', '1536307438337994752', 0, '1');
INSERT INTO `jvs_tree` VALUES ('297d519594f5453590ad8c52ce5ce0f5', '耐火材料制品制造', '耐火材料制品制造', '297d519594f5453590ad8c52ce5ce0f5', 1461518083062722560, 470, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('299a8784a9ee47189dc0840a418cb503', '精制茶加工', '精制茶加工', '299a8784a9ee47189dc0840a418cb503', 1461518083062722560, 201, '', '4848e0cf19cd4cd8ac32aebeb342e689', 0, '1');
INSERT INTO `jvs_tree` VALUES ('29b41dc4eb2d4efea641b7978812987a', '化学纤维制造业', '化学纤维制造业', '29b41dc4eb2d4efea641b7978812987a', 1461518083062722560, 403, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2a0835ecbd4749bc9fd2805c2e58f555', '建筑物拆除活动', '建筑物拆除活动', '2a0835ecbd4749bc9fd2805c2e58f555', 1461518083062722560, 852, '', '17fd8b163a6749a48002036d0684caa1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2a0938cb874546ea98c8bc9b41f9c9a8', '牲畜批发', '牲畜批发', '2a0938cb874546ea98c8bc9b41f9c9a8', 1461518083062722560, 864, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2a0da2b48eb24bc7bae25a32f2b07881', '脚踏自行车及残疾人座车制造', '脚踏自行车及残疾人座车制造', '2a0da2b48eb24bc7bae25a32f2b07881', 1461518083062722560, 691, '', '257a140a8dce48a1a45f204534ab989c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2a365d35308341dd9efdc9bc1a6938ba', '棉花加工机械制造', '棉花加工机械制造', '2a365d35308341dd9efdc9bc1a6938ba', 1461518083062722560, 641, '', '96416de0d629464ab952c86bdfc99406', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2ac56bc476af4695e44e332608fcd49c', '食品、饮料、烟草及饲料生产专用设备制造', '食品、饮料、烟草及饲料生产专用设备制造', '1536294082927472822', 1461518083062722560, 613, '', '1536294082927472790', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2aeed8c7540e0577e3dafc0b727de8d1', '烟草生产专用设备制造', '烟草生产专用设备制造', '1536310829881569504', 1461518083062722560, 616, '', '1536310829881569496', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2b227ad448424e66a0ef3ddb49e57624', '轴承、齿轮和传动部件制造', '轴承、齿轮和传动部件制造', '2b227ad448424e66a0ef3ddb49e57624', 1461518083062722560, 571, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2b2f994ed3254b1e82afef4b59bb7b08', '农业机械租赁', '农业机械租赁', '2b2f994ed3254b1e82afef4b59bb7b08', 1461518083062722560, 1140, '', '8f386fcc48054b529a2ac3b11d704051', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2b8dc87d9995640f6529bb027aac4563', '木材加工', '木材加工', '1536311398964736044', 1461518083062722560, 266, '', '1536311398964736040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2b8fa97bef91706e11a2fa0394c0fd21', '包装专用设备制造', '包装专用设备制造', '1536311398964736168', 1461518083062722560, 583, '', '1536311398964736148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2b9bc73438d1452693f8729a731c0618', '其他采矿业', '其他采矿业', '2b9bc73438d1452693f8729a731c0618', 1461518083062722560, 131, '', 'f7537336d12f49f5b9b6a66d9437bbdc', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2ba31caff80641139f086d2d7d8aa880', '磷肥制造', '磷肥制造', '2ba31caff80641139f086d2d7d8aa880', 1461518083062722560, 359, '', '10f07810f0d947289092d4489bea5968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c0462b3fe104000a32c23174dd7d19e', '搪瓷日用品及其他搪瓷制品制造', '搪瓷日用品及其他搪瓷制品制造', '2c0462b3fe104000a32c23174dd7d19e', 1461518083062722560, 534, '', 'f1cc0d5ef61e42f6a7dc652cf650b5eb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c1a64a0ba700fa1e350070b89145340', '锂离子电池制造', '锂离子电池制造', '1536310829881569568', 1461518083062722560, 715, '', '1536310829881569564', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c1dfdaf17eb41db8e66fb3f200351da', '化工、木材、非金属加工专用设备制造', '化工、木材、非金属加工专用设备制造', '2c1dfdaf17eb41db8e66fb3f200351da', 1461518083062722560, 606, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c28308543bb4cefaf2812319c864fdb', '农药批发', '农药批发', '2c28308543bb4cefaf2812319c864fdb', 1461518083062722560, 904, '', '40b02e3c160241a8870c0e6451672907', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c287e11ac70d8b99e9a4bca0140b11b', '精制茶加工', '精制茶加工', '1536311398964736020', 1461518083062722560, 201, '', '1536311398964736016', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c739cd1164d4867b113744da77be804', '其他建筑、安全用金属制品制造', '其他建筑、安全用金属制品制造', '2c739cd1164d4867b113744da77be804', 1461518083062722560, 528, '', 'c31948a1fb464bb493ac2cbd9eea7190', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2c9f7f83b1a041279b95fd1b35c8a23c', '汽车制造业', '汽车制造业', '2c9f7f83b1a041279b95fd1b35c8a23c', 1461518083062722560, 660, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2cb5d019338e462b955cff0033b7d35c', '通信设备制造', '通信设备制造', '2cb5d019338e462b955cff0033b7d35c', 1461518083062722560, 743, '', '33c10b41d3a34c66aa7898793302dd15', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2cb689c0b40b4e63a355621957592423', '木材采运', '木材采运', '2cb689c0b40b4e63a355621957592423', 1461518083062722560, 42, '', '4d150f671040463cbebe29034b022008', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d1167bc0bf54233aaca7bd5459a8b47', '风险和损失评估', '风险和损失评估', '2d1167bc0bf54233aaca7bd5459a8b47', 1461518083062722560, 1121, '', 'abfffb81021d45a1b6e265a3122fcc62', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d1454bf02a44fa4892d7d33ad68ea80', '环境保护监测', '环境保护监测', '2d1454bf02a44fa4892d7d33ad68ea80', 1461518083062722560, 1201, '', '3b6f81ca40dc4af7984d11ae3fbfd230', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d1f3cce747f4a22861891816a7282d2', '糖料种植', '糖料种植', '2d1f3cce747f4a22861891816a7282d2', 1461518083062722560, 15, '', '8714f4525bd24e41bc090ac4dd94b150', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d2a839928b44b2298ef9bdee72d30af', '固体废物治理', '固体废物治理', '2d2a839928b44b2298ef9bdee72d30af', 1461518083062722560, 1243, '', '72c2cabaf7c9440f9933fe2b664a6fc7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d3d3629abf54e12937d480fa585b6d6', '饲料加工', '饲料加工', '2d3d3629abf54e12937d480fa585b6d6', 1461518083062722560, 135, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d44cf405e9c40cea7c6d022aa539241', '汽车修理与维护', '汽车修理与维护', '2d44cf405e9c40cea7c6d022aa539241', 1461518083062722560, 1268, '', '8a91d822da204f2d9eb92674273239c0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d5b5441cff9c67d6abb2104d98194ad', '光学仪器及眼镜制造', '光学仪器及眼镜制造', '1536311398968930414', 1461518083062722560, 783, '', '1536311398968930390', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2d99b6c2ce6a4026b54bb889cb9ba628', '麻织造加工', '麻织造加工', '2d99b6c2ce6a4026b54bb889cb9ba628', 1461518083062722560, 217, '', '8ca4b0fd89624ea6bbc42c9ee45a1508', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2db6d51d35902c912d713b764ffe9e32', '文化、办公用机械制造', '文化、办公用机械制造', '1536310379493011539', 1461518083062722560, 584, '', '1536310379493011479', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2dc00c9b7ed223fbeb57434c2aa11a5c', '木质家具制造', '木质家具制造', '1536310379488817232', 1461518083062722560, 288, '', '1536310379488817228', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2de4513d54c1d14c0bf5e6c5e736aa77', '连续搬运设备制造', '连续搬运设备制造', '1536310829881569400', 1461518083062722560, 563, '', '1536310829881569396', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2de95c24fb73ded0ee76807d9d539e49', '广播电视设备制造', '广播电视设备制造', '1536307437964702004', 1461518083062722560, 746, '', '1536307437964701996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2e124a92605af1f6522c805caf8572ba', '其他非金属加工专用设备制造', '其他非金属加工专用设备制造', '1536310379493011579', 1461518083062722560, 612, '', '1536310379493011567', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2e1f1d07903b4d3690784b1bacb833f8', '职业初中教育', '职业初中教育', '2e1f1d07903b4d3690784b1bacb833f8', 1461518083062722560, 1295, '', '204b9cd5e13545bdaad5a9f781515930', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2e3e0dc003bf4601b8f05d6013a3315b', '塑料板、管、型材制造', '塑料板、管、型材制造', '2e3e0dc003bf4601b8f05d6013a3315b', 1461518083062722560, 425, '', '50976a2f43bc4cc5955a536de9d07368', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2e578f57df4042f89fbcea070329a3c4', '包装专用设备制造', '包装专用设备制造', '2e578f57df4042f89fbcea070329a3c4', 1461518083062722560, 583, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2e6c5f17eafea8a37ad9d8764e6c4ba1', '卫生', '卫生', '1536307437964702084', 1461518083062722560, 1311, '', '1536307437964702080', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2e8cb7d8f59f4aefab5641b6c4594e64', '汽车零配件零售', '汽车零配件零售', '2e8cb7d8f59f4aefab5641b6c4594e64', 1461518083062722560, 963, '', 'cf46f0a4428749fbbbeabeeadd53969d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2ebc5a9d26ad4fe9a4d891978b6501d3', '狩猎和捕捉动物', '狩猎和捕捉动物', '2ebc5a9d26ad4fe9a4d891978b6501d3', 1461518083062722560, 60, '', '9356c86a6cb8446093e3ec27ae0ef3b5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2efc07fcfa8841a180e277a88ffd4807', '食品、饮料、烟草及饲料生产专用设备制造', '食品、饮料、烟草及饲料生产专用设备制造', '2efc07fcfa8841a180e277a88ffd4807', 1461518083062722560, 613, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f0f15c2b9a643baa1b69cd35803fab9', '焰火、鞭炮产品制造', '焰火、鞭炮产品制造', '2f0f15c2b9a643baa1b69cd35803fab9', 1461518083062722560, 388, '', 'ecd416806da0431c909e98e8f3bffd4f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f29e9990c6143cb9092fbc9cbbb3dfd', '其他谷物种植', '其他谷物种植', '2f29e9990c6143cb9092fbc9cbbb3dfd', 1461518083062722560, 7, '', 'efd3cd9b3fc745ca949140f3f401446e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f312342a4cd0f6a2ed9afbeed1f954c', '造纸和纸制品业', '造纸和纸制品业', '1536294082927472698', 1461518083062722560, 293, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f3ecbcf952749348f0e85797af7bd04', '档案馆', '档案馆', '2f3ecbcf952749348f0e85797af7bd04', 1461518083062722560, 1362, '', '9d882fb2f70147d29752b7c7f495e603', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f59f262862187e039011ea3541ca0c2', '饲料加工', '饲料加工', '1536294082923278348', 1461518083062722560, 135, '', '1536294082923278344', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f6bcefd63b641198860de06c8ef18fb', '丝绢纺织及印染精加工', '丝绢纺织及印染精加工', '2f6bcefd63b641198860de06c8ef18fb', 1461518083062722560, 219, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f823d1b885e40039523866f381c88fd', '烟草生产专用设备制造', '烟草生产专用设备制造', '2f823d1b885e40039523866f381c88fd', 1461518083062722560, 616, '', '2efc07fcfa8841a180e277a88ffd4807', 0, '1');
INSERT INTO `jvs_tree` VALUES ('2f831d4d10a94030adbeaa228c0aaf1c', '其他道路、隧道和桥梁工程建筑', '其他道路、隧道和桥梁工程建筑', '2f831d4d10a94030adbeaa228c0aaf1c', 1461518083062722560, 834, '', 'bb9b27e8b29448acbc29064678ff48ba', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3003252ee9b049180585135dc6dad886', '中西医结合医院', '中西医结合医院', '1536310829881569680', 1461518083062722560, 1315, '', '1536310829881569672', 0, '1');
INSERT INTO `jvs_tree` VALUES ('30723ce315e2da178c248107317c8a98', '泵及真空设备制造', '泵及真空设备制造', '1536311398964736136', 1461518083062722560, 567, '', '1536311398964736132', 0, '1');
INSERT INTO `jvs_tree` VALUES ('307367d2136940eaab97126a74ec97e1', '生物技术推广服务', '生物技术推广服务', '307367d2136940eaab97126a74ec97e1', 1461518083062722560, 1221, '', '0888e14ec3974ab29ce2919250e07b7d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3074e14afed997dd6f5717b18802d9b1', '运输设备及生产用计数仪表制造', '运输设备及生产用计数仪表制造', '1536307437964702024', 1461518083062722560, 774, '', '1536307437964702020', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3078986d66d44d1180ed5e5350ee0051', '其他仓储业', '其他仓储业', '3078986d66d44d1180ed5e5350ee0051', 1461518083062722560, 1045, '', '9343f99c36194dca80b0bccab544ba1d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('30c19ce6a3094ce983f55d95dd4b19e1', '家用电器及电子产品专门零售', '家用电器及电子产品专门零售', '30c19ce6a3094ce983f55d95dd4b19e1', 1461518083062722560, 966, '', '47cb2cc4493644aa90fc6922d3b34448', 0, '1');
INSERT INTO `jvs_tree` VALUES ('31179ae8e08740f08ffa95c1aafc8ef3', '工程管理服务', '工程管理服务', '31179ae8e08740f08ffa95c1aafc8ef3', 1461518083062722560, 1210, '', '86ca8baeccd64086a08a406039a460f0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('313094ad5f8f4e38d1a88ca4ec807bb2', '地质勘探和地震专用仪器制造', '地质勘探和地震专用仪器制造', '1536310829881569612', 1461518083062722560, 777, '', '1536310829881569604', 0, '1');
INSERT INTO `jvs_tree` VALUES ('313dcc6dc6fd41d7a953ce6ac730e1e7', '家禽饲养', '家禽饲养', '313dcc6dc6fd41d7a953ce6ac730e1e7', 1461518083062722560, 55, '', '9356c86a6cb8446093e3ec27ae0ef3b5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('316c339beabb4599a6534e2870ccdf6d', '仪器仪表制造业', '仪器仪表制造业', '316c339beabb4599a6534e2870ccdf6d', 1461518083062722560, 764, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3179d833c9724e5cbf622038fdddda16', '社区卫生服务中心（站）', '社区卫生服务中心（站）', '3179d833c9724e5cbf622038fdddda16', 1461518083062722560, 1320, '', 'b6e94e52f60f4f88a00b19602cd26aa8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('31a17bcb9cf24935a1052bbc68fa9d07', '电线、电缆、光缆及电工器材制造', '电线、电缆、光缆及电工器材制造', '31a17bcb9cf24935a1052bbc68fa9d07', 1461518083062722560, 709, '', '52ffeaa5459542128bf67a6d04df1dda', 0, '1');
INSERT INTO `jvs_tree` VALUES ('31c43a02b1258e86892a229fe05fc0f2', '专科医院', '专科医院', '1536311398968930478', 1461518083062722560, 1317, '', '1536311398968930462', 0, '1');
INSERT INTO `jvs_tree` VALUES ('31c84fc435c8fade6e56feb20b4377f3', '纸制品制造', '纸制品制造', '1536310379493011471', 1461518083062722560, 301, '', '1536310379493011459', 0, '1');
INSERT INTO `jvs_tree` VALUES ('31f92c79ddbd85db34e86ca0533a1ea5', '非木竹浆制造', '非木竹浆制造', '1536310829881569380', 1461518083062722560, 296, '', '1536310829881569376', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32120eb4f6864757a814e0fa610b223c', '其他传动部件制造', '其他传动部件制造', '32120eb4f6864757a814e0fa610b223c', 1461518083062722560, 574, '', '2b227ad448424e66a0ef3ddb49e57624', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32216406f5ab47c38d3c914c481909a6', '塑料加工专用设备制造', '塑料加工专用设备制造', '32216406f5ab47c38d3c914c481909a6', 1461518083062722560, 609, '', '2c1dfdaf17eb41db8e66fb3f200351da', 0, '1');
INSERT INTO `jvs_tree` VALUES ('322e1bec6dd041e9a3833dc80102fc0e', '工程勘察设计', '工程勘察设计', '322e1bec6dd041e9a3833dc80102fc0e', 1461518083062722560, 1211, '', '86ca8baeccd64086a08a406039a460f0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('327c66b315ce47d2fa2fcbb0792d6d35', '核子及核辐射测量仪器制造', '核子及核辐射测量仪器制造', '1536310379493011703', 1461518083062722560, 779, '', '1536310379493011691', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3286420c1dc5f8f39a45877bbc7804de', '电线、电缆、光缆及电工器材制造', '电线、电缆、光缆及电工器材制造', '1536310379493011643', 1461518083062722560, 709, '', '1536310379493011639', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3286545d2dfc4c3180383b7e6d84ede0', '理发及美容服务', '理发及美容服务', '3286545d2dfc4c3180383b7e6d84ede0', 1461518083062722560, 1260, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3291363a04824a4a83fa735df8baf155', '文化及日用品出租', '文化及日用品出租', '3291363a04824a4a83fa735df8baf155', 1461518083062722560, 1144, '', '33724e4a2902407a9bf88addebadaa7e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32c03e1b1dc4c269cce3fdbe2e16c1fe', '室内娱乐活动', '室内娱乐活动', '1536311398968930510', 1461518083062722560, 1374, '', '1536311398968930506', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32c16e788d25fd8bcf6aa49cb0dce3c6', '羽毛（绒）加工', '羽毛（绒）加工', '1536310379488817188', 1461518083062722560, 257, '', '1536310379488817184', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32e20f37f4f5f1fe445bb0c750e2fae3', '风机、风扇制造', '风机、风扇制造', '1536294082927472762', 1461518083062722560, 577, '', '1536294082927472754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32f1113f95c1941add5ca013248aee06', '纸浆制造', '纸浆制造', '1536311398964736096', 1461518083062722560, 294, '', '1536311398964736092', 0, '1');
INSERT INTO `jvs_tree` VALUES ('32fbc7b2a9df8b91da75b8ce215432a7', '房地产业', '房地产业', '1536294082927472974', 1461518083062722560, 1129, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('335f783b36f847ec8022628e4ca90726', '其他文教办公用品制造', '其他文教办公用品制造', '335f783b36f847ec8022628e4ca90726', 1461518083062722560, 317, '', '8f10e9c4cb3f4f9f844b41c521bdfa55', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33724e4a2902407a9bf88addebadaa7e', '租赁业', '租赁业', '33724e4a2902407a9bf88addebadaa7e', 1461518083062722560, 1137, '', 'e1e6b0a4b29646b78775f21cc5577e5b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('338f8b50d3454e388c8a4a67d035df31', '天然植物纤维编织工艺品制造', '天然植物纤维编织工艺品制造', '338f8b50d3454e388c8a4a67d035df31', 1461518083062722560, 328, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('338fddda90714633a35486487f31961e', '土砂石开采', '土砂石开采', '338fddda90714633a35486487f31961e', 1461518083062722560, 114, '', '3f113a8e5ed742cca5693a4009ed9a65', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33902f50b421f712cce33e1fe81a62f9', '宝圣街道', '22', '1471310659713290240', 1461518083066916882, 5, NULL, '427eb99eebf8e9179e1e933f8c279c5a', 1, '1');
INSERT INTO `jvs_tree` VALUES ('33aa0ed0456f23d10ee982e640d2cb46', '运输设备及生产用计数仪表制造', '运输设备及生产用计数仪表制造', '1536311398968930398', 1461518083062722560, 774, '', '1536311398968930394', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33ba03135262429d98b52baf8647cc38', '文具制造', '文具制造', '33ba03135262429d98b52baf8647cc38', 1461518083062722560, 313, '', '8f10e9c4cb3f4f9f844b41c521bdfa55', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33c0f837ead24babb2b94bc16a9cd212', '家具零售', '家具零售', '33c0f837ead24babb2b94bc16a9cd212', 1461518083062722560, 975, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33c10b41d3a34c66aa7898793302dd15', '计算机、通信和其他电子设备制造业', '计算机、通信和其他电子设备制造业', '33c10b41d3a34c66aa7898793302dd15', 1461518083062722560, 737, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33c29a6531194b8eb97bb83191114c7a', '行政监督检查机构', '行政监督检查机构', '33c29a6531194b8eb97bb83191114c7a', 1461518083062722560, 1397, '', 'feeac738e0214b64869a7e61bbf2505c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33d34ae2c6db4f24b6d2c780767c2d07', '服装批发', '服装批发', '33d34ae2c6db4f24b6d2c780767c2d07', 1461518083062722560, 878, '', '3fed51964f224f8faa5db756cfafda81', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33ea7e3532ad636d9b1551dd76a0418a', '羽毛（绒）加工', '羽毛（绒）加工', '1536294082927472642', 1461518083062722560, 257, '', '1536294082923278368', 0, '1');
INSERT INTO `jvs_tree` VALUES ('33f58e510b683e73457c7c1bde368047', '广播、电视、电影和影视录音制作业', '广播、电视、电影和影视录音制作业', '1536294082927473030', 1461518083062722560, 1350, '', '1536294082927473026', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3403baa7fd26442b91239235f2c57a5f', '其他水泥类似制品制造', '其他水泥类似制品制造', '3403baa7fd26442b91239235f2c57a5f', 1461518083062722560, 442, '', '1e55bff094854d93bb468c6f213265de', 0, '1');
INSERT INTO `jvs_tree` VALUES ('34239d2de516487780ed899f12af6d7b', '金属结构制造', '金属结构制造', '34239d2de516487780ed899f12af6d7b', 1461518083062722560, 511, '', 'f74e5170fd574a4fba166abdba4e1d75', 0, '1');
INSERT INTO `jvs_tree` VALUES ('348cc0f95ad84c6ea6e6f4fd8d19316b', '蔬菜、水果罐头制造', '蔬菜、水果罐头制造', '348cc0f95ad84c6ea6e6f4fd8d19316b', 1461518083062722560, 173, '', '8e1163acd8d046d580f42436854753c4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('349ab46a84bc793c98f8e3fad023fb3d', '中医医院', '中医医院', '1536294082927473002', 1461518083062722560, 1314, '', '1536294082927472998', 0, '1');
INSERT INTO `jvs_tree` VALUES ('34b3891c4b974d5791e24e2c61ab1bd5', '生态保护', '生态保护', '34b3891c4b974d5791e24e2c61ab1bd5', 1461518083062722560, 1235, '', '38b064ab24f945c0ba520217586ff09c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('34b6553563e6222d34d8203317982d16', '纺织、服装和皮革加工专用设备制造', '纺织、服装和皮革加工专用设备制造', '1536310829881569520', 1461518083062722560, 626, '', '1536310829881569464', 0, '1');
INSERT INTO `jvs_tree` VALUES ('34c158731dce943d0aac46d57660b48a', '电梯、自动扶梯及升降机制造', '电梯、自动扶梯及升降机制造', '1536310829881569404', 1461518083062722560, 564, '', '1536310829881569396', 0, '1');
INSERT INTO `jvs_tree` VALUES ('34fecdf1a3cb4d2a811fc1a0d62056e2', '农、林、牧产品批发', '农、林、牧产品批发', '34fecdf1a3cb4d2a811fc1a0d62056e2', 1461518083062722560, 858, '', 'a7f809990927455bba2350c3cbd65540', 0, '1');
INSERT INTO `jvs_tree` VALUES ('354043273dba4112ad620067fc1524a6', '云母制品制造', '云母制品制造', '354043273dba4112ad620067fc1524a6', 1461518083062722560, 472, '', '297d519594f5453590ad8c52ce5ce0f5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('35723d0b387f4206a01df8eb0ec779f8', '其他未列明专业技术服务业', '其他未列明专业技术服务业', '35723d0b387f4206a01df8eb0ec779f8', 1461518083062722560, 1217, '', 'd0ebd453a05c4e08a1bdcbc641239503', 0, '1');
INSERT INTO `jvs_tree` VALUES ('36', '总公司', 'zgs', '3ce89b9f-4a86-4a02-a73e-4a08ae2d1f40', 1461518083066916879, 6, '组织架构', '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('360782c4eb58eb2c3ebe849ee4065571', '纸制品制造', '纸制品制造', '1536307437964701800', 1461518083062722560, 301, '', '1536307437964701788', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3630238eeb0d408bbaccf8fe447490a0', '训练健身器材制造', '训练健身器材制造', '3630238eeb0d408bbaccf8fe447490a0', 1461518083062722560, 336, '', 'bf6890967d994d25a26161fb732004c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('367085faa6ce4b71b269b4adf385b76e', '室内娱乐活动', '室内娱乐活动', '367085faa6ce4b71b269b4adf385b76e', 1461518083062722560, 1374, '', '1efeeb730bc14c778d6071408da57297', 0, '1');
INSERT INTO `jvs_tree` VALUES ('369d732ce6df4252848d55023b104c65', '电影放映', '电影放映', '369d732ce6df4252848d55023b104c65', 1461518083062722560, 1355, '', '45b720ad902c4b4790710c3d15cc1883', 0, '1');
INSERT INTO `jvs_tree` VALUES ('36c918f435c443ea83635d6d4d923b7b', '其他未列明农副食品加工', '其他未列明农副食品加工', '36c918f435c443ea83635d6d4d923b7b', 1461518083062722560, 157, '', 'abe8451608a641289138e19f9b7ee698', 0, '1');
INSERT INTO `jvs_tree` VALUES ('37073ca32f854f098441ad55b8b02e3d', '锯材加工', '锯材加工', '37073ca32f854f098441ad55b8b02e3d', 1461518083062722560, 267, '', '5deb274a51d94adb8b7a3f0856a0934e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('37123016865444cb81c5c51aaa968585', '出租车客运', '出租车客运', '37123016865444cb81c5c51aaa968585', 1461518083062722560, 1002, '', '0ae7538c6f9f4841a19494e0b018b12f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('371e3486e3178ac7d19cd4786e006255', '照明器具制造', '照明器具制造', '1536307437964701992', 1461518083062722560, 730, '', '1536307437964701968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('374875dba1ac4949a53bebad66915168', '一般旅馆', '一般旅馆', '374875dba1ac4949a53bebad66915168', 1461518083062722560, 1052, '', '58984e57abfd4f499dde649df815b791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3752277a301543e2ab49d618d3b8f293', '家用清洁卫生电器具制造', '家用清洁卫生电器具制造', '3752277a301543e2ab49d618d3b8f293', 1461518083062722560, 723, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, '1');
INSERT INTO `jvs_tree` VALUES ('37548784746641db890b5b7c0b83f34f', '其他未列明保险活动', '其他未列明保险活动', '37548784746641db890b5b7c0b83f34f', 1461518083062722560, 1122, '', 'abfffb81021d45a1b6e265a3122fcc62', 0, '1');
INSERT INTO `jvs_tree` VALUES ('37a6e6dc44a84c4ebcba0085e1d2420b', '国家机构', '国家机构', '37a6e6dc44a84c4ebcba0085e1d2420b', 1461518083062722560, 1389, '', '947e0f87323b430ea5d5c7689ab006cf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('37d27313ec0f482d98d6f5f85ba6fca2', '其他未列明信息技术服务业', '其他未列明信息技术服务业', '37d27313ec0f482d98d6f5f85ba6fca2', 1461518083062722560, 1089, '', 'be130eaa590c400eab7eb771b3df4849', 0, '1');
INSERT INTO `jvs_tree` VALUES ('37e38118a9d94d02a6614cadf52c30ab', '养老金', '养老金', '37e38118a9d94d02a6614cadf52c30ab', 1461518083062722560, 1117, '', '957d60e6ff6847e08c6514eb084a4b35', 0, '1');
INSERT INTO `jvs_tree` VALUES ('380020abfca3426e9a73cca4c7926bd6', '街道卫生院', '街道卫生院', '380020abfca3426e9a73cca4c7926bd6', 1461518083062722560, 1321, '', 'b6e94e52f60f4f88a00b19602cd26aa8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3864247ec2fa4f2f8afe0ffd7490bd69', '蔬菜种植', '蔬菜种植', '3864247ec2fa4f2f8afe0ffd7490bd69', 1461518083062722560, 18, '', '404950a038404d92b860ec3e34694303', 0, '1');
INSERT INTO `jvs_tree` VALUES ('387a0a7156c84177b0a7059ff79d442f', '行业性团体', '行业性团体', '387a0a7156c84177b0a7059ff79d442f', 1461518083062722560, 1415, '', '39e8412e569a4466a76366e0212268c4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('38911e77e1854d1ebc7cbefbbade4472', '其他家禽饲养', '其他家禽饲养', '38911e77e1854d1ebc7cbefbbade4472', 1461518083062722560, 59, '', '313dcc6dc6fd41d7a953ce6ac730e1e7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('389433977d6f4192aff7cb4794a56b15', '纤维板制造', '纤维板制造', '389433977d6f4192aff7cb4794a56b15', 1461518083062722560, 273, '', '97753ff411f04aadb0ab4b230d80c204', 0, '1');
INSERT INTO `jvs_tree` VALUES ('38b064ab24f945c0ba520217586ff09c', '生态保护和环境治理业', '生态保护和环境治理业', '38b064ab24f945c0ba520217586ff09c', 1461518083062722560, 1234, '', 'd0159dee15c84e7497612587f32232e5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('39419c00ca564a50b0cae40f29dbe28d', '体育器材及配件制造', '体育器材及配件制造', '39419c00ca564a50b0cae40f29dbe28d', 1461518083062722560, 335, '', 'bf6890967d994d25a26161fb732004c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3943a2a8bedc43a0b7b46d815262bf01', '鞋帽零售', '鞋帽零售', '3943a2a8bedc43a0b7b46d815262bf01', 1461518083062722560, 941, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('396da73738a6204ba5e171ef3a9b2f86', '通用设备制造业', '通用设备制造业', '1536310829881569392', 1461518083062722560, 544, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('398494bea9cf4ee28bf3c1549527d6bf', '鬃毛加工、制刷及清扫工具制造', '鬃毛加工、制刷及清扫工具制造', '398494bea9cf4ee28bf3c1549527d6bf', 1461518083062722560, 789, '', 'e36b473401e34f57990cf97d36e59196', 0, '1');
INSERT INTO `jvs_tree` VALUES ('398efc8b475d433682b16b4046dd883d', '制造业', '制造业', '398efc8b475d433682b16b4046dd883d', 1461518083062722560, 132, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3995635d7fc74d7b97de0ae8e9a377d3', '其他金属制品制造', '其他金属制品制造', '3995635d7fc74d7b97de0ae8e9a377d3', 1461518083062722560, 540, '', 'fb030bf0f03346d09a84b55753afc762', 0, '1');
INSERT INTO `jvs_tree` VALUES ('39abeaf546e84c2bac3579836971defa', '其他牲畜饲养', '其他牲畜饲养', '39abeaf546e84c2bac3579836971defa', 1461518083062722560, 54, '', 'cecc6d30ab22456791361548e1d0f5db', 0, '1');
INSERT INTO `jvs_tree` VALUES ('39e8412e569a4466a76366e0212268c4', '社会团体', '社会团体', '39e8412e569a4466a76366e0212268c4', 1461518083062722560, 1413, '', '5954a785d7a0417d91fca5ff381a0c70', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3a1507e08e704652941cf492f34595de', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '3a1507e08e704652941cf492f34595de', 1461518083062722560, 1190, '', '19a60ca5cac04fb4bae6d2cb8c8fe801', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3a1e44cd71584fd08d76ab615b0412bc', '超级市场零售', '超级市场零售', '3a1e44cd71584fd08d76ab615b0412bc', 1461518083062722560, 927, '', 'a557fefd5b904730a9b141c5bc5d7e6c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3a2b49f40476fbe1f263d46df4ec60c0', '酒、饮料和精制茶制造业', '酒、饮料和精制茶制造业', '1536294082923278352', 1461518083062722560, 186, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3a3c4235c8e345dba416dfb3b40084bf', '教育辅助服务', '教育辅助服务', '3a3c4235c8e345dba416dfb3b40084bf', 1461518083062722560, 1308, '', '3f2332f633b643479907b872201e7387', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3a55ce58d13f426cae230c558412a795', '燃气生产和供应业', '燃气生产和供应业', '3a55ce58d13f426cae230c558412a795', 1461518083062722560, 820, '', '4218674804e549bfb3c9fcfb99ab4d56', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3a90cad3ea0c4b7ca1ec806a7d5b3d83', '中等职业学校教育', '中等职业学校教育', '3a90cad3ea0c4b7ca1ec806a7d5b3d83', 1461518083062722560, 1299, '', '204b9cd5e13545bdaad5a9f781515930', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3adfac929c8e94a4bb955c96ce4764bb', '包装专用设备制造', '包装专用设备制造', '1536294082927472774', 1461518083062722560, 583, '', '1536294082927472754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3ae52864a513d622128f257e5f60ed56', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', '1536311398968930430', 1461518083062722560, 809, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b03d37482194755857827cf9bbe4be3', '航空运输业', '航空运输业', '3b03d37482194755857827cf9bbe4be3', 1461518083062722560, 1023, '', '842789d652984bcc9618bfe915b8dd6b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b05b9e40ce65f4eed70c9892aadb6a3', '建筑工程用机械制造', '建筑工程用机械制造', '1536310829881569476', 1461518083062722560, 602, '', '1536310829881569468', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b09348ede57bab20759e2dae24c450c', '单板加工', '单板加工', '1536307437964701752', 1461518083062722560, 269, '', '1536307437964701740', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b2459ce8e864e75be4cce841a6011dd', '印制电路板制造', '印制电路板制造', '3b2459ce8e864e75be4cce841a6011dd', 1461518083062722560, 762, '', 'dc22550138d34dbabaf1c338b18d8e32', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b256c947ceb467c8c0b9ab4688a1afc', '香料作物种植', '香料作物种植', '3b256c947ceb467c8c0b9ab4688a1afc', 1461518083062722560, 31, '', 'aed77cd8c3894c43b0ba71a3e2b9156f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b28632ffd09f2353ea92e784cae50b2', '文化、娱乐、体育经纪代理', '文化、娱乐、体育经纪代理', '1536294082927473054', 1461518083062722560, 1381, '', '1536294082927473042', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b38608568b74c0f8468220ab85487a7', '殡葬服务', '殡葬服务', '3b38608568b74c0f8468220ab85487a7', 1461518083062722560, 1264, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b43c7c29493a9565084178b13243d41', '计算机、通信和其他电子设备制造业', '计算机、通信和其他电子设备制造业', '1536310829881569580', 1461518083062722560, 737, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b6376f16a31444bb1b51564e8396af2', '毛纺织及染整精加工', '毛纺织及染整精加工', '3b6376f16a31444bb1b51564e8396af2', 1461518083062722560, 211, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b6f81ca40dc4af7984d11ae3fbfd230', '环境与生态监测', '环境与生态监测', '3b6f81ca40dc4af7984d11ae3fbfd230', 1461518083062722560, 1200, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3b7c8297f56549abaf7b78f87e8a26c1', '其他黑色金属矿采选', '其他黑色金属矿采选', '3b7c8297f56549abaf7b78f87e8a26c1', 1461518083062722560, 93, '', '3cd116a5463f493da52595279d895ca3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3bb428afeed4e26c844ccf69fffda9f3', '中西医结合医院', '中西医结合医院', '1536294082927473006', 1461518083062722560, 1315, '', '1536294082927472998', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3bcdeee22fa44217a2505feebf9e6c9b', '其他金融业', '其他金融业', '3bcdeee22fa44217a2505feebf9e6c9b', 1461518083062722560, 1123, '', 'aa7eae86426348798b655780cb183d98', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3bfc2e0aa74d40e0b14005910cd845b4', '职业技能培训', '职业技能培训', '3bfc2e0aa74d40e0b14005910cd845b4', 1461518083062722560, 1305, '', '3f2332f633b643479907b872201e7387', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3c6ad52e369f425eba00b690983a20c4', '水轮机及辅机制造', '水轮机及辅机制造', '3c6ad52e369f425eba00b690983a20c4', 1461518083062722560, 549, '', 'eeb06ef1eabf45dc9214022934a5ad13', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3c6f59ff76564127871d8457f2e1a5da', '内陆捕捞', '内陆捕捞', '3c6f59ff76564127871d8457f2e1a5da', 1461518083062722560, 68, '', 'd15152d0699b4ac393614a5f6f04df30', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3c7dae82be75403a90d2316821cc6b34', '光纤、光缆制造', '光纤、光缆制造', '3c7dae82be75403a90d2316821cc6b34', 1461518083062722560, 711, '', '31a17bcb9cf24935a1052bbc68fa9d07', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3c852b811e35689ad27833f9ab7025ea', '洗涤机械制造', '洗涤机械制造', '1536307437964701944', 1461518083062722560, 630, '', '1536307437964701936', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3cc1986bd179aa1645fcc478418fb711', '核子及核辐射测量仪器制造', '核子及核辐射测量仪器制造', '1536311398968930406', 1461518083062722560, 779, '', '1536311398968930394', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3cc79fb3e3bcf142e69f13d76edc8333', '纺织、服装和皮革加工专用设备制造', '纺织、服装和皮革加工专用设备制造', '1536294082927472846', 1461518083062722560, 626, '', '1536294082927472790', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3cd116a5463f493da52595279d895ca3', '黑色金属矿采选业', '黑色金属矿采选业', '3cd116a5463f493da52595279d895ca3', 1461518083062722560, 90, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3ce8eb11bcbdb47111785d8579b3cf6a', '泵、阀门、压缩机及类似机械制造', '泵、阀门、压缩机及类似机械制造', '1536307437964701828', 1461518083062722560, 566, '', '1536307437964701808', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3d03e6b6449546d8851794c243889280', '其他物料搬运设备制造', '其他物料搬运设备制造', '3d03e6b6449546d8851794c243889280', 1461518083062722560, 565, '', '0425e3ce9ed84fc493944dbd4663ba4e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3d119acd540b40d3b4e68291146bba29', '涂料零售', '涂料零售', '3d119acd540b40d3b4e68291146bba29', 1461518083062722560, 976, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3d3d6af03ce444c199a84d47f3604639', '生产专用搪瓷制品制造', '生产专用搪瓷制品制造', '3d3d6af03ce444c199a84d47f3604639', 1461518083062722560, 531, '', 'f1cc0d5ef61e42f6a7dc652cf650b5eb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3d7779e48b21f7337f9f976de6f190a8', '酒、饮料和精制茶制造业', '酒、饮料和精制茶制造业', '1536310379488817168', 1461518083062722560, 186, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3d94212feb84f6c620873702f5d44868', '燃气生产和供应业', '燃气生产和供应业', '1536307437964702060', 1461518083062722560, 820, '', '1536307437964702056', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3db9bb1b24e34db0899ac3a15c7ee479', '无机碱制造', '无机碱制造', '3db9bb1b24e34db0899ac3a15c7ee479', 1461518083062722560, 353, '', '91dc97eb105d4ba29bbf67a3eee45596', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3e2a5d49ca1fc68d5c92318dbfaf79c7', '木材加工和木、竹、藤、棕、草制品业', '木材加工和木、竹、藤、棕、草制品业', '1536307437964701736', 1461518083062722560, 265, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3e5247bc8341490eb91662c2f0d5613f', '采矿、冶金、建筑专用设备制造', '采矿、冶金、建筑专用设备制造', '3e5247bc8341490eb91662c2f0d5613f', 1461518083062722560, 599, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3ea436bc816c1bd64f69ef6b8db04427', '其他非金属加工专用设备制造', '其他非金属加工专用设备制造', '1536311398964736212', 1461518083062722560, 612, '', '1536311398964736200', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3ea77c8c4f4487e6a172418664669d8c', '文化、娱乐、体育经纪代理', '文化、娱乐、体育经纪代理', '1536310829881569728', 1461518083062722560, 1381, '', '1536310829881569716', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3ed261d7403c401ca4e62b19f74fa629', '光电子器件及其他电子器件制造', '光电子器件及其他电子器件制造', '3ed261d7403c401ca4e62b19f74fa629', 1461518083062722560, 759, '', '7b5fc101b3194fbe909a9bbbd7fda9ce', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3f0497878f5f40b79eb69ae65a725e11', '通讯设备修理', '通讯设备修理', '3f0497878f5f40b79eb69ae65a725e11', 1461518083062722560, 1272, '', '411c027a667740188bb631c54aa2c258', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3f113a8e5ed742cca5693a4009ed9a65', '非金属矿采选业', '非金属矿采选业', '3f113a8e5ed742cca5693a4009ed9a65', 1461518083062722560, 113, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3f17841046934332b6147dd9a026e57a', '电信、广播电视和卫星传输服务', '电信、广播电视和卫星传输服务', '3f17841046934332b6147dd9a026e57a', 1461518083062722560, 1067, '', '9dff8e99b53f46a08b2a82d317b1ce82', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3f2332f633b643479907b872201e7387', '技能培训、教育辅助及其他教育', '技能培训、教育辅助及其他教育', '3f2332f633b643479907b872201e7387', 1461518083062722560, 1304, '', '0e85c30755b2427c98c3b5406ec53523', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3f5dfbc4750e47ada29ac5f1c49c4068', '光学仪器制造', '光学仪器制造', '3f5dfbc4750e47ada29ac5f1c49c4068', 1461518083062722560, 784, '', '14cd1160b51347f7af080f844905b128', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3fc1c1c4e9d393bbc1f20a172b0843d7', '电车制造', '电车制造', '1536294082927472870', 1461518083062722560, 664, '', '1536294082927472858', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3fed51964f224f8faa5db756cfafda81', '纺织、服装及家庭用品批发', '纺织、服装及家庭用品批发', '3fed51964f224f8faa5db756cfafda81', 1461518083062722560, 876, '', 'a7f809990927455bba2350c3cbd65540', 0, '1');
INSERT INTO `jvs_tree` VALUES ('3fee66250c816533c16931319c2efdd5', '科学研究和技术服务业', '科学研究和技术服务业', '1536294082805837824', 1461518083062722560, 1187, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40', '重庆市', 'cq', '8ec52cbc-1964-458e-8409-66be3fb5e98c', 1461518083066916882, 1, '区域规划', '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('401d939ba1bba54dd3f9be564a28a1ff', '电气机械和器材制造业', '电气机械和器材制造业', '1536307437964701968', 1461518083062722560, 697, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('401f94de6b02ed7a3555ec1620b9c57c', '风机、风扇制造', '风机、风扇制造', '1536307437964701852', 1461518083062722560, 577, '', '1536307437964701844', 0, '1');
INSERT INTO `jvs_tree` VALUES ('402d331194e2560104277b36994aff2f', '光纤、光缆制造', '光纤、光缆制造', '1536307437964701976', 1461518083062722560, 711, '', '1536307437964701972', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4039629929464f0ba4aa9f37902fe9ee', '计算机和辅助设备修理', '计算机和辅助设备修理', '4039629929464f0ba4aa9f37902fe9ee', 1461518083062722560, 1271, '', '411c027a667740188bb631c54aa2c258', 0, '1');
INSERT INTO `jvs_tree` VALUES ('403f49ecdd754e7595295013c6530789', '海洋服务', '海洋服务', '403f49ecdd754e7595295013c6530789', 1461518083062722560, 1197, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4043512c84214eed89ae59bae2117751', '其他机械与设备租赁', '其他机械与设备租赁', '4043512c84214eed89ae59bae2117751', 1461518083062722560, 1143, '', '8f386fcc48054b529a2ac3b11d704051', 0, '1');
INSERT INTO `jvs_tree` VALUES ('404950a038404d92b860ec3e34694303', '蔬菜、食用菌及园艺作物种植', '蔬菜、食用菌及园艺作物种植', '404950a038404d92b860ec3e34694303', 1461518083062722560, 17, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4059ec1ff9fc4ed388be8fb68baac632', '切削工具制造', '切削工具制造', '4059ec1ff9fc4ed388be8fb68baac632', 1461518083062722560, 514, '', 'e46d02ed330f4a32aeb2acda611aba43', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4099a65882e347058de96ce285f8159a', '体育用品及器材批发', '体育用品及器材批发', '4099a65882e347058de96ce285f8159a', 1461518083062722560, 887, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40a18400e4df490991ad12bcba3ab9cb', '有机肥料及微生物肥料制造', '有机肥料及微生物肥料制造', '40a18400e4df490991ad12bcba3ab9cb', 1461518083062722560, 362, '', '10f07810f0d947289092d4489bea5968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40a7153320e84d20af83852bd00c80d5', '野生动物保护', '野生动物保护', '40a7153320e84d20af83852bd00c80d5', 1461518083062722560, 1237, '', '34b3891c4b974d5791e24e2c61ab1bd5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40b02e3c160241a8870c0e6451672907', '矿产品、建材及化工产品批发', '矿产品、建材及化工产品批发', '40b02e3c160241a8870c0e6451672907', 1461518083062722560, 897, '', 'a7f809990927455bba2350c3cbd65540', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40bb53f34d8549bb8fb5f2d20b1da1a4', '玻璃纤维增强塑料制品制造', '玻璃纤维增强塑料制品制造', '40bb53f34d8549bb8fb5f2d20b1da1a4', 1461518083062722560, 464, '', 'eb2bead065184cf19e67349e3cc301ca', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40d1b8f902a743ff86efe8ee18f74802', '茶饮料及其他饮料制造', '茶饮料及其他饮料制造', '40d1b8f902a743ff86efe8ee18f74802', 1461518083062722560, 200, '', 'f77c488fca9e415bb74990de42777f54', 0, '1');
INSERT INTO `jvs_tree` VALUES ('40d8e0af73854209a20dfc0dcd2423f7', '光学玻璃制造', '光学玻璃制造', '40d8e0af73854209a20dfc0dcd2423f7', 1461518083062722560, 455, '', '7f127fa7b9644592b4899ee6820f5647', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41', '重庆', 'chongqing', 'bbdd8168-3902-459b-b80f-2a93958da5a3', 1461518083066916882, 2, '区域规划', '40', 1, '1');
INSERT INTO `jvs_tree` VALUES ('410eaf13103c4023abcdb2239c3e2c6c', '营养食品制造', '营养食品制造', '410eaf13103c4023abcdb2239c3e2c6c', 1461518083062722560, 180, '', 'f6c96d4d4a84467a99e973b643e6651e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('411c027a667740188bb631c54aa2c258', '计算机和办公设备维修', '计算机和办公设备维修', '411c027a667740188bb631c54aa2c258', 1461518083062722560, 1270, '', '1e4c1b63531646d4850b4196b528d9f5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4141f0e75ba244238cadb4893c376245', '豆制品制造', '豆制品制造', '4141f0e75ba244238cadb4893c376245', 1461518083062722560, 155, '', 'abe8451608a641289138e19f9b7ee698', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4158f69d42a14c8c904c417676863403', '贵金属矿采选', '贵金属矿采选', '4158f69d42a14c8c904c417676863403', 1461518083062722560, 104, '', 'b9630eb6fbec4c15b18f6b2d89fdb1ae', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4190f0ce31bdd4d4fcb75f90a526e207', '塑料加工专用设备制造', '塑料加工专用设备制造', '1536307437964701904', 1461518083062722560, 609, '', '1536307437964701896', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41924a7278334436a61b6a1368c7eec9', '汽车批发', '汽车批发', '41924a7278334436a61b6a1368c7eec9', 1461518083062722560, 909, '', 'e821e1d643de40508001dfe91309f8fd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41adaf0713ea4695e65a4113bef596ed', '电梯、自动扶梯及升降机制造', '电梯、自动扶梯及升降机制造', '1536311398964736124', 1461518083062722560, 564, '', '1536311398964736116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41b7992560624658b1f1f8cfa1971782', '电池制造', '电池制造', '41b7992560624658b1f1f8cfa1971782', 1461518083062722560, 714, '', '52ffeaa5459542128bf67a6d04df1dda', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41cd3c1dd78c8a4ea83b31a0a47b9b1b', '视听设备制造', '视听设备制造', '1536311398968930386', 1461518083062722560, 751, '', '1536311398968930370', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41d6e99c8a134d7992628343e52ff28a', '皮革、毛皮、羽毛及其制品和制鞋业', '皮革、毛皮、羽毛及其制品和制鞋业', '41d6e99c8a134d7992628343e52ff28a', 1461518083062722560, 245, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41e545234403449db53700a84cd46c8c', '社区自治组织', '社区自治组织', '41e545234403449db53700a84cd46c8c', 1461518083062722560, 1420, '', '060f08e0258648e09f90a27c210cd896', 0, '1');
INSERT INTO `jvs_tree` VALUES ('41f6765fdef74d1da4ba35e198ce3473', '开采辅助活动', '开采辅助活动', '41f6765fdef74d1da4ba35e198ce3473', 1461518083062722560, 126, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, '1');
INSERT INTO `jvs_tree` VALUES ('42', '合川', 'hc', '175d9e28-5a49-41fb-ac05-5630b6b6fd82', 1461518083066916882, 3, '区域规划', '41', 1, '1');
INSERT INTO `jvs_tree` VALUES ('4218674804e549bfb3c9fcfb99ab4d56', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', '4218674804e549bfb3c9fcfb99ab4d56', 1461518083062722560, 809, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('423a2ec66ad24b9a9ec95c606a136fbd', '木材加工和木、竹、藤、棕、草制品业', '木材加工和木、竹、藤、棕、草制品业', '423a2ec66ad24b9a9ec95c606a136fbd', 1461518083062722560, 265, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4247d03ff97946cb99b2d71dcb7fc67d', '锂离子电池制造', '锂离子电池制造', '4247d03ff97946cb99b2d71dcb7fc67d', 1461518083062722560, 715, '', '41b7992560624658b1f1f8cfa1971782', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4251652a2d4248a28d3b351459e60f34', '冷冻饮品及食用冰制造', '冷冻饮品及食用冰制造', '4251652a2d4248a28d3b351459e60f34', 1461518083062722560, 182, '', 'f6c96d4d4a84467a99e973b643e6651e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('426877ecfc5e051b615c1b978bd4a48e', '燃气生产和供应业', '燃气生产和供应业', '1536310829881569644', 1461518083062722560, 820, '', '1536310829881569640', 0, '1');
INSERT INTO `jvs_tree` VALUES ('427eb99eebf8e9179e1e933f8c279c5a', '江北区', '11', '1471310507388751872', 1461518083066916882, 4, NULL, '41', 1, '1');
INSERT INTO `jvs_tree` VALUES ('42b8726d7632aca0ced93a9fccd4232f', '泵、阀门、压缩机及类似机械制造', '泵、阀门、压缩机及类似机械制造', '1536294082927472738', 1461518083062722560, 566, '', '1536294082927472718', 0, '1');
INSERT INTO `jvs_tree` VALUES ('42e4b587bdfa2fe0595e07a0c51abafa', '钟表与计时仪器制造', '钟表与计时仪器制造', '1536294082927472946', 1461518083062722560, 782, '', '1536294082927472926', 0, '1');
INSERT INTO `jvs_tree` VALUES ('42fda63c874e45ddb61229f9ad670644', '针织或钩针编织物织造', '针织或钩针编织物织造', '42fda63c874e45ddb61229f9ad670644', 1461518083062722560, 227, '', '076cfbad4a3b4762936bf7d9336715f9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('43', '长寿', 'cs', '14107f27-b8ea-4850-922a-c57df8cac5ea', 1461518083066916882, 4, '区域规划', '41', 1, '1');
INSERT INTO `jvs_tree` VALUES ('432cc778671c445190ebe29833845a9f', '其他未列明零售业', '其他未列明零售业', '432cc778671c445190ebe29833845a9f', 1461518083062722560, 989, '', '746a5b49b5be4a56bad4573e269b6578', 0, '1');
INSERT INTO `jvs_tree` VALUES ('433fc6d9dd8bc832d7d8cdd581c6b94f', '娱乐业', '娱乐业', '1536311398968930506', 1461518083062722560, 1373, '', '1536311398968930490', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4346899fad9a423595fb6c48789dd99d', '纺织、服装和皮革加工专用设备制造', '纺织、服装和皮革加工专用设备制造', '4346899fad9a423595fb6c48789dd99d', 1461518083062722560, 626, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('435c8fa381674942adee2f05521b9a42', '卫生和社会工作', '卫生和社会工作', '435c8fa381674942adee2f05521b9a42', 1461518083062722560, 1310, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4363efc7cd94200cca48a79288650caa', '其他物料搬运设备制造', '其他物料搬运设备制造', '1536310379493011495', 1461518083062722560, 565, '', '1536310379493011483', 0, '1');
INSERT INTO `jvs_tree` VALUES ('43ce8c991ff7473387cda3efda83ab52', '家用电器修理', '家用电器修理', '43ce8c991ff7473387cda3efda83ab52', 1461518083062722560, 1274, '', '1e4c1b63531646d4850b4196b528d9f5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('43f3b671e3994032b015723214288d9f', '摩托车制造', '摩托车制造', '43f3b671e3994032b015723214288d9f', 1461518083062722560, 687, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, '1');
INSERT INTO `jvs_tree` VALUES ('441976492779497d82e64ffa942410cd', '沿海货物运输', '沿海货物运输', '441976492779497d82e64ffa942410cd', 1461518083062722560, 1017, '', 'f686b1e78ecb4b0d91fbfd2a1a605018', 0, '1');
INSERT INTO `jvs_tree` VALUES ('441dbbf0006afdfd11c7201ec6b2621b', '化工、木材、非金属加工专用设备制造', '化工、木材、非金属加工专用设备制造', '1536310379493011567', 1461518083062722560, 606, '', '1536310379493011551', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4423ab1d0b2542cc887f131afdbe0182', '电影和影视节目发行', '电影和影视节目发行', '4423ab1d0b2542cc887f131afdbe0182', 1461518083062722560, 1354, '', '45b720ad902c4b4790710c3d15cc1883', 0, '1');
INSERT INTO `jvs_tree` VALUES ('444e78708ad74fc4b12fe29eb4388153', '纸制品制造', '纸制品制造', '444e78708ad74fc4b12fe29eb4388153', 1461518083062722560, 301, '', '232e90a17cca443aa592d6aea13dc44a', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4452b4f794e5479485e27ebcbeb3d114', '铅锌矿采选', '铅锌矿采选', '4452b4f794e5479485e27ebcbeb3d114', 1461518083062722560, 97, '', 'e3e5f433000e4a8582130236036331bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4469bb5350f14352945815c5e0b9dd81', '其他娱乐用品制造', '其他娱乐用品制造', '4469bb5350f14352945815c5e0b9dd81', 1461518083062722560, 343, '', 'af190cf547144f178f1234471d7b5b57', 0, '1');
INSERT INTO `jvs_tree` VALUES ('446b8133cfe2966426c7973ce81ee1ca', '家具制造业', '家具制造业', '1536307437964701772', 1461518083062722560, 287, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('44a38cc58e4041d0a405168c13663b83', '五金产品批发', '五金产品批发', '44a38cc58e4041d0a405168c13663b83', 1461518083062722560, 912, '', 'e821e1d643de40508001dfe91309f8fd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('44b53034e1524e6d83744f1668f2c3a1', '群众文化活动', '群众文化活动', '44b53034e1524e6d83744f1668f2c3a1', 1461518083062722560, 1366, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('44bf3553d20f46b395f89e92cd0b84e2', '金属工艺品制造', '金属工艺品制造', '44bf3553d20f46b395f89e92cd0b84e2', 1461518083062722560, 325, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('44d79f3eed0644ca8e9a01d5a37a38cb', '小吃服务', '小吃服务', '44d79f3eed0644ca8e9a01d5a37a38cb', 1461518083062722560, 1063, '', '62af44e381044e2cba12bffa1e0b47ec', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45424bddbd6e0ae3b5640323d1bfb9a2', '仪器仪表制造业', '仪器仪表制造业', '1536294082927472926', 1461518083062722560, 764, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45496abf8406dbb7110b9ece3eac7598', '镍氢电池制造', '镍氢电池制造', '1536311398968930362', 1461518083062722560, 716, '', '1536311398968930354', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45606acdc1f6843503355dc724934f55', '竹、藤家具制造', '竹、藤家具制造', '1536311398964736084', 1461518083062722560, 289, '', '1536311398964736076', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45698e8d5094466a92027c830d329b92', '乐器零售', '乐器零售', '45698e8d5094466a92027c830d329b92', 1461518083062722560, 955, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45a9d534d9fc456b9fa4e38d40977809', '广告业', '广告业', '45a9d534d9fc456b9fa4e38d40977809', 1461518083062722560, 1164, '', '1d4aa2be74514a73925194b48b570791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45b720ad902c4b4790710c3d15cc1883', '广播、电视、电影和影视录音制作业', '广播、电视、电影和影视录音制作业', '45b720ad902c4b4790710c3d15cc1883', 1461518083062722560, 1350, '', '567845af441a427eacdd14dfec55fe15', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45da078812a3406494ccac7796c81735', '船用配套设备制造', '船用配套设备制造', '45da078812a3406494ccac7796c81735', 1461518083062722560, 679, '', '98490bfbacce404285880451a06a29fe', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45e05ef36112422fa2ae90520ff7a1de', '货币金融服务', '货币金融服务', '45e05ef36112422fa2ae90520ff7a1de', 1461518083062722560, 1091, '', 'aa7eae86426348798b655780cb183d98', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45e5ea67b32998c77c735ddb9af86c33', '其他仪器仪表制造业', '其他仪器仪表制造业', '1536311398968930422', 1461518083062722560, 786, '', '1536311398968930390', 0, '1');
INSERT INTO `jvs_tree` VALUES ('45fb087207364d13980e2e8aebd3b408', '公证服务', '公证服务', '45fb087207364d13980e2e8aebd3b408', 1461518083062722560, 1157, '', '739b13a055de454c89429dc1e176db48', 0, '1');
INSERT INTO `jvs_tree` VALUES ('46922c9d081a4bd2a30860d15b5837ab', '金属制日用品制造', '金属制日用品制造', '46922c9d081a4bd2a30860d15b5837ab', 1461518083062722560, 535, '', 'fb030bf0f03346d09a84b55753afc762', 0, '1');
INSERT INTO `jvs_tree` VALUES ('46d42b41e227407081b546a65aae2d2e', '化学药品原料药制造', '化学药品原料药制造', '46d42b41e227407081b546a65aae2d2e', 1461518083062722560, 396, '', 'e4a034315f244268b87181669e0a6580', 0, '1');
INSERT INTO `jvs_tree` VALUES ('46f0cc5d9835466e92d8a31ae90bebdb', '水泥制造', '水泥制造', '46f0cc5d9835466e92d8a31ae90bebdb', 1461518083062722560, 435, '', '1f920ea0b4ae4b0aa39bbac9b5128997', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4732c6f2dab84f238caa29ff6c4fb952', '竹、藤家具制造', '竹、藤家具制造', '4732c6f2dab84f238caa29ff6c4fb952', 1461518083062722560, 289, '', '5c0163f1f7124c4993575b0d7c6aeb99', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4739e3203d83477d83623b72b751e445', '棉纺织及印染精加工', '棉纺织及印染精加工', '4739e3203d83477d83623b72b751e445', 1461518083062722560, 207, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('473e5ffc6667494f9006549f04b2ea6a', '石棉制品制造', '石棉制品制造', '473e5ffc6667494f9006549f04b2ea6a', 1461518083062722560, 471, '', '297d519594f5453590ad8c52ce5ce0f5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('475d8bb5844d4b3fbf8743cb94ac334d', '其他合成纤维制造', '其他合成纤维制造', '475d8bb5844d4b3fbf8743cb94ac334d', 1461518083062722560, 414, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, '1');
INSERT INTO `jvs_tree` VALUES ('47761e3a7f1b10ecd4e2b667e70da991', '电车制造', '电车制造', '1536310829881569544', 1461518083062722560, 664, '', '1536310829881569532', 0, '1');
INSERT INTO `jvs_tree` VALUES ('47cb2cc4493644aa90fc6922d3b34448', '零售业', '零售业', '47cb2cc4493644aa90fc6922d3b34448', 1461518083062722560, 924, '', '8b6fbbb6b949405e9b03521bc9a45933', 0, '1');
INSERT INTO `jvs_tree` VALUES ('47d156e744d249739b5117992298cbe3', '医疗用品及器材零售', '医疗用品及器材零售', '47d156e744d249739b5117992298cbe3', 1461518083062722560, 960, '', '48f6fec9283745829d4a7dc3b21008bb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4801a7689f0d49c8b12f7c356f357333', '卫生', '卫生', '4801a7689f0d49c8b12f7c356f357333', 1461518083062722560, 1311, '', '435c8fa381674942adee2f05521b9a42', 0, '1');
INSERT INTO `jvs_tree` VALUES ('48237bad29f0d430221f87e874e7f205', '塑料家具制造', '塑料家具制造', '1536310379488817240', 1461518083062722560, 291, '', '1536310379488817228', 0, '1');
INSERT INTO `jvs_tree` VALUES ('482a2d0e94954b298e699d4393641a82', '公共电汽车客运', '公共电汽车客运', '482a2d0e94954b298e699d4393641a82', 1461518083062722560, 1000, '', '0ae7538c6f9f4841a19494e0b018b12f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('483631d723cb483a880dd15cebcb7857', '建筑工程用机械制造', '建筑工程用机械制造', '483631d723cb483a880dd15cebcb7857', 1461518083062722560, 602, '', '3e5247bc8341490eb91662c2f0d5613f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4839307f8f0f43ad8322b64b21f44f9e', '公园和游览景区管理', '公园和游览景区管理', '4839307f8f0f43ad8322b64b21f44f9e', 1461518083062722560, 1252, '', '08a1fc9f693f48129e4bf075c2623051', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4848e0cf19cd4cd8ac32aebeb342e689', '酒、饮料和精制茶制造业', '酒、饮料和精制茶制造业', '4848e0cf19cd4cd8ac32aebeb342e689', 1461518083062722560, 186, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4878cc42ccdeb310be00af9ddc7614f0', '饲料加工', '饲料加工', '1536307437964701708', 1461518083062722560, 135, '', '1536307437964701704', 0, '1');
INSERT INTO `jvs_tree` VALUES ('488e29668ddd42d7b1ca441266dee0ec', '其他农牧产品批发', '其他农牧产品批发', '488e29668ddd42d7b1ca441266dee0ec', 1461518083062722560, 865, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('48f6fec9283745829d4a7dc3b21008bb', '医药及医疗器材专门零售', '医药及医疗器材专门零售', '48f6fec9283745829d4a7dc3b21008bb', 1461518083062722560, 958, '', '47cb2cc4493644aa90fc6922d3b34448', 0, '1');
INSERT INTO `jvs_tree` VALUES ('491646d9da4f4e1eb31d90c2a6e0793c', '发电机及发电机组制造', '发电机及发电机组制造', '491646d9da4f4e1eb31d90c2a6e0793c', 1461518083062722560, 699, '', '7a259f23ded444af8a75c658e8ab752a', 0, '1');
INSERT INTO `jvs_tree` VALUES ('49790b74b0b24b8aaeb5877d62953f49', '猪的饲养', '猪的饲养', '49790b74b0b24b8aaeb5877d62953f49', 1461518083062722560, 51, '', 'cecc6d30ab22456791361548e1d0f5db', 0, '1');
INSERT INTO `jvs_tree` VALUES ('498aa9a80f7244fe8e0c171d6e955890', '其他文化艺术业', '其他文化艺术业', '498aa9a80f7244fe8e0c171d6e955890', 1461518083062722560, 1367, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('49ec563e93284d0abc7c7a27bbee2ebd', '建筑装饰搪瓷制品制造', '建筑装饰搪瓷制品制造', '49ec563e93284d0abc7c7a27bbee2ebd', 1461518083062722560, 532, '', 'f1cc0d5ef61e42f6a7dc652cf650b5eb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a21e8c89c414019a78b56da7f586178', '人民法院', '人民法院', '4a21e8c89c414019a78b56da7f586178', 1461518083062722560, 1399, '', '64f96eb5bcbf434a8dad552b0bdc856e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a3157dc8d99432eada4d0bb4522b748', '货物运输代理', '货物运输代理', '4a3157dc8d99432eada4d0bb4522b748', 1461518083062722560, 1037, '', '04a5a05cee214eb096d670718e4fc305', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a35af8714dc4478b013db7e2bea5c33', '水上运输辅助活动', '水上运输辅助活动', '4a35af8714dc4478b013db7e2bea5c33', 1461518083062722560, 1019, '', 'b815134170f74bb08ef895c26c8fd01f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a3e1fab8671052e68aa205825d6fb3a', '光学仪器及眼镜制造', '光学仪器及眼镜制造', '1536310379493011711', 1461518083062722560, 783, '', '1536310379493011687', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a3f2c2b8e2b5b84105492b9e717b0ab', '酒、饮料和精制茶制造业', '酒、饮料和精制茶制造业', '1536307437964701712', 1461518083062722560, 186, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a656a8f92cf440186e54989a4c3aa26', '化纤浆粕制造', '化纤浆粕制造', '4a656a8f92cf440186e54989a4c3aa26', 1461518083062722560, 405, '', 'abda87bdef4f49788c0af9d56167c0a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4a838f0be0ca4400bf9fdba0b60de519', '其他法律服务', '其他法律服务', '4a838f0be0ca4400bf9fdba0b60de519', 1461518083062722560, 1158, '', '739b13a055de454c89429dc1e176db48', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4aafca223c424234b1b1ec53842ab3aa', '水资源管理', '水资源管理', '4aafca223c424234b1b1ec53842ab3aa', 1461518083062722560, 1230, '', 'e792c27ee8404ea6b700ef2a508103b0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4ab5289c010d4259bea5925d82e7dbcb', '宝石、玉石采选', '宝石、玉石采选', '4ab5289c010d4259bea5925d82e7dbcb', 1461518083062722560, 124, '', '145148bf32184b6a8311fe783ef0e544', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4ab90a2c088142ccb7e25c3ffd09eb8e', '笔的制造', '笔的制造', '4ab90a2c088142ccb7e25c3ffd09eb8e', 1461518083062722560, 314, '', '8f10e9c4cb3f4f9f844b41c521bdfa55', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4ad6912230f9479cbbf79e6268ed0d4f', '啤酒制造', '啤酒制造', '4ad6912230f9479cbbf79e6268ed0d4f', 1461518083062722560, 190, '', 'f6f9e986c5a64965b65cc4b7569d7949', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b0a0c5677797a20c0393583df2f0ec5', '风动和电动工具制造', '风动和电动工具制造', '1536307437964701860', 1461518083062722560, 580, '', '1536307437964701844', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b300beb8a83444a846020fb1c8daf91', '灯具零售', '灯具零售', '4b300beb8a83444a846020fb1c8daf91', 1461518083062722560, 974, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b3c9923751841b6a41656b9e894f17b', '鹅的饲养', '鹅的饲养', '4b3c9923751841b6a41656b9e894f17b', 1461518083062722560, 58, '', '313dcc6dc6fd41d7a953ce6ac730e1e7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b459416d922b7465afe19d6cdc12783', '单板加工', '单板加工', '1536310829881569336', 1461518083062722560, 269, '', '1536310829881569324', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b51f060d88a4896b978a2aa42d01f48', '纸浆制造', '纸浆制造', '4b51f060d88a4896b978a2aa42d01f48', 1461518083062722560, 294, '', '232e90a17cca443aa592d6aea13dc44a', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b84ab08d9c74553b870821049a9af6e', '建筑装饰及水暖管道零件制造', '建筑装饰及水暖管道零件制造', '4b84ab08d9c74553b870821049a9af6e', 1461518083062722560, 526, '', 'c31948a1fb464bb493ac2cbd9eea7190', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b894ea49d2d4b809e67720d7efb55ac', '渔业服务业', '渔业服务业', '4b894ea49d2d4b809e67720d7efb55ac', 1461518083062722560, 81, '', 'e0274cb31c084751a6fe5ca5629964a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4b9a52e2c0fca48c2641b76de63146e3', '电影和影视节目发行', '电影和影视节目发行', '1536294082927473034', 1461518083062722560, 1354, '', '1536294082927473030', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4be22276751c42d38dcc98e6df3f9e62', '其他机械和设备修理业', '其他机械和设备修理业', '4be22276751c42d38dcc98e6df3f9e62', 1461518083062722560, 808, '', 'a30057bad4994bfa9049c45c55b82e81', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4c3f90cf9316a9aba7dcb60e5d6a3427', '纸浆制造', '纸浆制造', '1536307437964701792', 1461518083062722560, 294, '', '1536307437964701788', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4c44de1597e64a0ffc3c8aa2bc91e2e7', '锯材加工', '锯材加工', '1536310829881569328', 1461518083062722560, 267, '', '1536310829881569324', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4cd02f4defaf4103aa2444a2fda1e8bd', '木门窗、楼梯制造', '木门窗、楼梯制造', '4cd02f4defaf4103aa2444a2fda1e8bd', 1461518083062722560, 278, '', '08c234aebbb444c99b04de865d8f2efb', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4cf56a68c1984d479a76596febc29752', '其他饮料及冷饮服务', '其他饮料及冷饮服务', '4cf56a68c1984d479a76596febc29752', 1461518083062722560, 1061, '', 'd29526550a3c4c2eb00d1e245e8244e8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d150106283a4d9988f4c56ecb4ba96d', '其他日用品生产专用设备制造', '其他日用品生产专用设备制造', '4d150106283a4d9988f4c56ecb4ba96d', 1461518083062722560, 625, '', '19493c65e8fa413a92c97fe37446f1ff', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d150f671040463cbebe29034b022008', '木材和竹材采运', '木材和竹材采运', '4d150f671040463cbebe29034b022008', 1461518083062722560, 41, '', 'e222f63d0cbe4b659bb50ec78a197c7d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d33315bfe8140e8b456bfd16e3056b9', '钟表与计时仪器制造', '钟表与计时仪器制造', '4d33315bfe8140e8b456bfd16e3056b9', 1461518083062722560, 782, '', '316c339beabb4599a6534e2870ccdf6d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d64c8c5f0c84997a11ab3eff05a6762', '拍卖', '拍卖', '4d64c8c5f0c84997a11ab3eff05a6762', 1461518083062722560, 919, '', '5ce62088c5924e39b3ecbcd705486863', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d80a3b8b1be4d279344ac1771122b85', '农业服务业', '农业服务业', '4d80a3b8b1be4d279344ac1771122b85', 1461518083062722560, 70, '', 'e0274cb31c084751a6fe5ca5629964a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d8ebb66ab022b6444211564ad3408a7', '农副食品加工业', '农副食品加工业', '1536311398964736008', 1461518083062722560, 133, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4d91f48759954854be1f6cf1cb0012f0', '水力发电', '水力发电', '4d91f48759954854be1f6cf1cb0012f0', 1461518083062722560, 813, '', '5ecd006a532c49b6b294f268e35f4fa1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4e479c06ed944985a1760ce50d84fa19', '其他计算机制造', '其他计算机制造', '4e479c06ed944985a1760ce50d84fa19', 1461518083062722560, 742, '', 'f8f60b812bca4c15ac143f477661ba23', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4e53ddc5945f2b1199e9c009fa0453dc', '广播电视节目制作及发射设备制造', '广播电视节目制作及发射设备制造', '1536307437964702008', 1461518083062722560, 747, '', '1536307437964702004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4e60fe2893514443b1d114d89ef2ec15', '烟草制品零售', '烟草制品零售', '4e60fe2893514443b1d114d89ef2ec15', 1461518083062722560, 936, '', 'd138659de1744d208b52d77abf92cd51', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4e75050ab8bc45cca31bb3644e612888', '铁矿采选', '铁矿采选', '4e75050ab8bc45cca31bb3644e612888', 1461518083062722560, 91, '', '3cd116a5463f493da52595279d895ca3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4eaae2658f6a5b88bca7419227430f88', '饲料加工', '饲料加工', '1536310830233890816', 1461518083062722560, 135, '', '1536310830170976256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4eabcc30527fa2310e2f73ad4b75cd39', '物料搬运设备制造', '物料搬运设备制造', '1536294082927472722', 1461518083062722560, 559, '', '1536294082927472718', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4efc62f840775fdd18b5e8ff1bf95480', '通信设备制造', '通信设备制造', '1536310379493011671', 1461518083062722560, 743, '', '1536310379493011667', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4f39c2da2aaa4c16502e6b77bd399adc', '木材加工和木、竹、藤、棕、草制品业', '木材加工和木、竹、藤、棕、草制品业', '1536310829881569320', 1461518083062722560, 265, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4f6f6996ae7b4c42ba5dbe08ee064ad5', '其他贵金属矿采选', '其他贵金属矿采选', '4f6f6996ae7b4c42ba5dbe08ee064ad5', 1461518083062722560, 107, '', '4158f69d42a14c8c904c417676863403', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4f70ea50616d40658913e69a9207fed1', '金属船舶制造', '金属船舶制造', '4f70ea50616d40658913e69a9207fed1', 1461518083062722560, 676, '', '98490bfbacce404285880451a06a29fe', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4f8705d29e0949288841fa772527f3e4', '箱、包零售', '箱、包零售', '4f8705d29e0949288841fa772527f3e4', 1461518083062722560, 944, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4fc60b9b0277445cbbb2c8c416e32221', '旅游管理服务', '旅游管理服务', '4fc60b9b0277445cbbb2c8c416e32221', 1461518083062722560, 1173, '', '034de10ed9434b67946c80c8e2fb8a78', 0, '1');
INSERT INTO `jvs_tree` VALUES ('4ff6f69878a1419897369b1ccfa428e5', '水泥制品制造', '水泥制品制造', '4ff6f69878a1419897369b1ccfa428e5', 1461518083062722560, 438, '', '1e55bff094854d93bb468c6f213265de', 0, '1');
INSERT INTO `jvs_tree` VALUES ('500aee82eacf4f57924d2d7092c7bc60', '游艺用品及室内游艺器材制造', '游艺用品及室内游艺器材制造', '500aee82eacf4f57924d2d7092c7bc60', 1461518083062722560, 342, '', 'af190cf547144f178f1234471d7b5b57', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5011db89261d475fa1a566792f508aeb', '木质家具制造', '木质家具制造', '5011db89261d475fa1a566792f508aeb', 1461518083062722560, 288, '', '5c0163f1f7124c4993575b0d7c6aeb99', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5033bf8f61334e1e93d6600c371bb00e', '运动防护用具制造', '运动防护用具制造', '5033bf8f61334e1e93d6600c371bb00e', 1461518083062722560, 337, '', 'bf6890967d994d25a26161fb732004c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('503ad07cee4a4c99b9816df8697da03f', '其他文化及日用品出租', '其他文化及日用品出租', '503ad07cee4a4c99b9816df8697da03f', 1461518083062722560, 1148, '', '3291363a04824a4a83fa735df8baf155', 0, '1');
INSERT INTO `jvs_tree` VALUES ('50887d4b3f96461591a7553d5551dcb3', '牲畜屠宰', '牲畜屠宰', '50887d4b3f96461591a7553d5551dcb3', 1461518083062722560, 141, '', 'a86fe03eff0340ee869bea35b1c7c364', 0, '1');
INSERT INTO `jvs_tree` VALUES ('50976a2f43bc4cc5955a536de9d07368', '塑料制品业', '塑料制品业', '50976a2f43bc4cc5955a536de9d07368', 1461518083062722560, 423, '', '9f741ded47174b37b13f861f4e8e7d1e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('50ce062215aa444a88a8bdd1c9d3ddc7', '连续搬运设备制造', '连续搬运设备制造', '50ce062215aa444a88a8bdd1c9d3ddc7', 1461518083062722560, 563, '', '0425e3ce9ed84fc493944dbd4663ba4e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('50de002323614fb6a9d3fc4982f702a4', '风机、风扇制造', '风机、风扇制造', '50de002323614fb6a9d3fc4982f702a4', 1461518083062722560, 577, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('510a8f421f154833add59dae5c2ce045', '畜牧服务业', '畜牧服务业', '510a8f421f154833add59dae5c2ce045', 1461518083062722560, 80, '', 'e0274cb31c084751a6fe5ca5629964a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('511d2df538f641b5855cd1502139cfb0', '安全服务', '安全服务', '511d2df538f641b5855cd1502139cfb0', 1461518083062722560, 1176, '', '75759f7c7e814c42ae1389ee2a613800', 0, '1');
INSERT INTO `jvs_tree` VALUES ('512c12147ca1b5fca67cf059a5f9c0f9', '木门窗、楼梯制造', '木门窗、楼梯制造', '1536307437964701764', 1461518083062722560, 278, '', '1536307437964701760', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5133104633754825a91294a7e3f50830', '生物化学农药及微生物农药制造', '生物化学农药及微生物农药制造', '5133104633754825a91294a7e3f50830', 1461518083062722560, 366, '', 'ac8071f49ea34a98ad9f120c3a7e9273', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5141899aa0c3435b9c6bdd5bb5f2990d', '烘炉、风机、衡器、包装等设备制造', '烘炉、风机、衡器、包装等设备制造', '5141899aa0c3435b9c6bdd5bb5f2990d', 1461518083062722560, 575, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5143cc03471243c5a3de89f2820783d5', '玻璃仪器制造', '玻璃仪器制造', '5143cc03471243c5a3de89f2820783d5', 1461518083062722560, 456, '', '7f127fa7b9644592b4899ee6820f5647', 0, '1');
INSERT INTO `jvs_tree` VALUES ('515651d487e045b48a21fc7343ea4d25', '其他污染治理', '其他污染治理', '515651d487e045b48a21fc7343ea4d25', 1461518083062722560, 1246, '', '72c2cabaf7c9440f9933fe2b664a6fc7', 0, '1');
INSERT INTO `jvs_tree` VALUES ('518edca30ece4e59931d175bd373dcb0', '其他林业服务', '其他林业服务', '518edca30ece4e59931d175bd373dcb0', 1461518083062722560, 79, '', '789befc4bd144da18ee07645854cb3cc', 0, '1');
INSERT INTO `jvs_tree` VALUES ('519c2619bd7a4eb188f2faa2e023fc98', '其他未列明教育', '其他未列明教育', '519c2619bd7a4eb188f2faa2e023fc98', 1461518083062722560, 1309, '', '3f2332f633b643479907b872201e7387', 0, '1');
INSERT INTO `jvs_tree` VALUES ('51b53d196631f5a1479679f2b56cb6a0', '单板加工', '单板加工', '1536310379488817208', 1461518083062722560, 269, '', '1536310379488817196', 0, '1');
INSERT INTO `jvs_tree` VALUES ('51cb934f7a8142b4885881d99d8ebf45', '基础地质勘查', '基础地质勘查', '51cb934f7a8142b4885881d99d8ebf45', 1461518083062722560, 1207, '', '593642eaef7f4d56841c28795fa2f9de', 0, '1');
INSERT INTO `jvs_tree` VALUES ('51eb472d208f4e2184f02daa0cefc92d', '米、面制品及食用油批发', '米、面制品及食用油批发', '51eb472d208f4e2184f02daa0cefc92d', 1461518083062722560, 867, '', 'b28ff0b238614f3bba8f268424209280', 0, '1');
INSERT INTO `jvs_tree` VALUES ('51ef0656765b4baebc95701837b43608', '气象服务', '气象服务', '51ef0656765b4baebc95701837b43608', 1461518083062722560, 1195, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, '1');
INSERT INTO `jvs_tree` VALUES ('51fb0a63b319593ea5cbd1c1d96ec7e6', '炼油、化工生产专用设备制造', '炼油、化工生产专用设备制造', '1536311398964736204', 1461518083062722560, 607, '', '1536311398964736200', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5229523bb57148e98dee62379c777be8', '制冷、空调设备制造', '制冷、空调设备制造', '5229523bb57148e98dee62379c777be8', 1461518083062722560, 579, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('523de11a06b144d6a3d651fbeedc197b', '照相机及器材制造', '照相机及器材制造', '523de11a06b144d6a3d651fbeedc197b', 1461518083062722560, 587, '', '28431578cb7545b4afd7fd13da26977d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5261846ac13d5f6b4324e2b595fe05f5', '软木制品及其他木制品制造', '软木制品及其他木制品制造', '1536294082927472678', 1461518083062722560, 281, '', '1536294082927472670', 0, '1');
INSERT INTO `jvs_tree` VALUES ('526f4dd6346d4507917314ae7a96a180', '民族医院', '民族医院', '526f4dd6346d4507917314ae7a96a180', 1461518083062722560, 1316, '', '196969e76c044d5280fd58008700d1d4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('527a26a12d5cbd818b0695c9afde86bc', '非木竹浆制造', '非木竹浆制造', '1536310379493011467', 1461518083062722560, 296, '', '1536310379493011463', 0, '1');
INSERT INTO `jvs_tree` VALUES ('52a61c75f10c37c2201fced69e522d80', '科学研究和技术服务业', '科学研究和技术服务业', '1536310829881569652', 1461518083062722560, 1187, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('52bd5ff444864ebdb41417fcd352ec9a', '其他综合零售', '其他综合零售', '52bd5ff444864ebdb41417fcd352ec9a', 1461518083062722560, 928, '', 'a557fefd5b904730a9b141c5bc5d7e6c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('52e66cb9d9fea9004356d0f5c4fa0503', '锯材加工', '锯材加工', '1536311398964736048', 1461518083062722560, 267, '', '1536311398964736044', 0, '1');
INSERT INTO `jvs_tree` VALUES ('52ffeaa5459542128bf67a6d04df1dda', '电气机械和器材制造业', '电气机械和器材制造业', '52ffeaa5459542128bf67a6d04df1dda', 1461518083062722560, 697, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('538dadf2f5b449c322b2ee241fc03a7b', '核子及核辐射测量仪器制造', '核子及核辐射测量仪器制造', '1536294082927472942', 1461518083062722560, 779, '', '1536294082927472930', 0, '1');
INSERT INTO `jvs_tree` VALUES ('538dbef31e06445386074576e83e9f03', '铁路运输设备修理', '铁路运输设备修理', '538dbef31e06445386074576e83e9f03', 1461518083062722560, 802, '', 'eb874e229b154ae8b8db2ed8a5bd965f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5393180163ba47e6a1b99bbe693315dc', '道路货物运输', '道路货物运输', '5393180163ba47e6a1b99bbe693315dc', 1461518083062722560, 1005, '', 'b64282a18c5f4980b1432a50ceb588fd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('53a643303722439c95f5a99da5b17651', '其他铁路运输辅助活动', '其他铁路运输辅助活动', '53a643303722439c95f5a99da5b17651', 1461518083062722560, 997, '', '83441daa2a8049aebbba94511aee5316', 0, '1');
INSERT INTO `jvs_tree` VALUES ('53b648f2acdf4a7b9bf848a186a3af03', '自行车零售', '自行车零售', '53b648f2acdf4a7b9bf848a186a3af03', 1461518083062722560, 946, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('53b6b8263a1b4f0eb2f2e26d7a960c14', '电影机械制造', '电影机械制造', '53b6b8263a1b4f0eb2f2e26d7a960c14', 1461518083062722560, 585, '', '28431578cb7545b4afd7fd13da26977d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('53d2d15adc4a4c1ab77c8830a82c6b09', '国家权力机构', '国家权力机构', '53d2d15adc4a4c1ab77c8830a82c6b09', 1461518083062722560, 1390, '', '37a6e6dc44a84c4ebcba0085e1d2420b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('540f58289cdc882944667231f04ce9cf', '光学仪器制造', '光学仪器制造', '1536311398968930418', 1461518083062722560, 784, '', '1536311398968930414', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5440e6c6af754748a4a5bbd1d59b13c9', '花卉种植', '花卉种植', '5440e6c6af754748a4a5bbd1d59b13c9', 1461518083062722560, 20, '', '404950a038404d92b860ec3e34694303', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5471074c19825eaf2bb36c6a3772a586', '化工、木材、非金属加工专用设备制造', '化工、木材、非金属加工专用设备制造', '1536310829881569480', 1461518083062722560, 606, '', '1536310829881569464', 0, '1');
INSERT INTO `jvs_tree` VALUES ('54860cf082a48028ffa9f48b19473beb', '家具制造业', '家具制造业', '1536310829881569356', 1461518083062722560, 287, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('548c966aafb0255f77df9fccc473c61b', '包装专用设备制造', '包装专用设备制造', '1536310379493011535', 1461518083062722560, 583, '', '1536310379493011515', 0, '1');
INSERT INTO `jvs_tree` VALUES ('54ee509d834f6e5adcc04f4155de7f9b', '专科疾病防治院（所、站）', '专科疾病防治院（所、站）', '1536307437964702112', 1461518083062722560, 1326, '', '1536307437964702084', 0, '1');
INSERT INTO `jvs_tree` VALUES ('54eea1ebac9d449a8c0a71f4cad0df91', '计划生育技术服务活动', '计划生育技术服务活动', '54eea1ebac9d449a8c0a71f4cad0df91', 1461518083062722560, 1324, '', '4801a7689f0d49c8b12f7c356f357333', 0, '1');
INSERT INTO `jvs_tree` VALUES ('554e56332728c760bc5f86d5c60425c4', '木材加工', '木材加工', '1536310829881569324', 1461518083062722560, 266, '', '1536310829881569320', 0, '1');
INSERT INTO `jvs_tree` VALUES ('559128f608654f4582e8eb81e8ad2b78', '企业管理服务', '企业管理服务', '559128f608654f4582e8eb81e8ad2b78', 1461518083062722560, 1150, '', '1d4aa2be74514a73925194b48b570791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('55950c03b3fa1885fdf6ba91d135747f', '专用设备制造业', '专用设备制造业', '1536310379493011551', 1461518083062722560, 598, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('560d027e2ee4e224887953df3e226e39', '锂离子电池制造', '锂离子电池制造', '1536311398968930358', 1461518083062722560, 715, '', '1536311398968930354', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5661115b721b15aed4508eb662c92608', '农副食品加工专用设备制造', '农副食品加工专用设备制造', '1536311398964736220', 1461518083062722560, 615, '', '1536311398964736216', 0, '1');
INSERT INTO `jvs_tree` VALUES ('56673aa6005cd4838bed3f2316e379da', '室内娱乐活动', '室内娱乐活动', '1536310379493011807', 1461518083062722560, 1374, '', '1536310379493011803', 0, '1');
INSERT INTO `jvs_tree` VALUES ('567845af441a427eacdd14dfec55fe15', '文化、体育和娱乐业', '文化、体育和娱乐业', '567845af441a427eacdd14dfec55fe15', 1461518083062722560, 1340, '', '1c047feeb426485aacda4b500a0567af', 0, '1');
INSERT INTO `jvs_tree` VALUES ('56adc15f30099457c2168b8b78071fad', '竹、藤家具制造', '竹、藤家具制造', '1536310829881569364', 1461518083062722560, 289, '', '1536310829881569356', 0, '1');
INSERT INTO `jvs_tree` VALUES ('56cb9981ac28453985fa8fa45b630c38', '担保服务', '担保服务', '56cb9981ac28453985fa8fa45b630c38', 1461518083062722560, 1185, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('56d36c62c406b36e99b311a643d4dfdb', '电气机械和器材制造业', '电气机械和器材制造业', '1536311398968930342', 1461518083062722560, 697, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('56da05588150431ea7ac6535c3b430e1', '皮革服装制造', '皮革服装制造', '56da05588150431ea7ac6535c3b430e1', 1461518083062722560, 248, '', 'f1a4f35774454eba9c9613fab6dfb3a1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('57438c6e2cb5aed303074c4258016911', '化学纤维制造业', '化学纤维制造业', '1536310829881569388', 1461518083062722560, 403, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('578abd2ffe9e45559a8b301d9249eb0b', '造林和更新', '造林和更新', '578abd2ffe9e45559a8b301d9249eb0b', 1461518083062722560, 39, '', 'e222f63d0cbe4b659bb50ec78a197c7d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('578f93a2b30b49af961ee916b069af17', '数字内容服务', '数字内容服务', '578f93a2b30b49af961ee916b069af17', 1461518083062722560, 1087, '', 'be130eaa590c400eab7eb771b3df4849', 0, '1');
INSERT INTO `jvs_tree` VALUES ('57992877ab4b5978fe291ede8134d598', '房地产业', '房地产业', '1536310379493011735', 1461518083062722560, 1129, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('57a09feab7ab4f64a77796ad393d0987', '窄轨机车车辆制造', '窄轨机车车辆制造', '57a09feab7ab4f64a77796ad393d0987', 1461518083062722560, 670, '', '80d9141616884b538edef0504a7dbe76', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5841761c928e486ab3e3b58c3b003415', '电力供应', '电力供应', '5841761c928e486ab3e3b58c3b003415', 1461518083062722560, 818, '', '7927ead2d9cf4f388670c7f34997a3e5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5841fcad496a493b811ed15dfa93f038', '葡萄种植', '葡萄种植', '5841fcad496a493b811ed15dfa93f038', 1461518083062722560, 24, '', '01e1d829d1e245d5bf3a066ce77191f3', 0, '1');
INSERT INTO `jvs_tree` VALUES ('58944620846043bf9ef844ca7f029084', '电梯、自动扶梯及升降机制造', '电梯、自动扶梯及升降机制造', '58944620846043bf9ef844ca7f029084', 1461518083062722560, 564, '', '0425e3ce9ed84fc493944dbd4663ba4e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5894cdd2eef44eb0b64faf7b0ae34f72', '专用仪器仪表制造', '专用仪器仪表制造', '5894cdd2eef44eb0b64faf7b0ae34f72', 1461518083062722560, 772, '', '316c339beabb4599a6534e2870ccdf6d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('58984e57abfd4f499dde649df815b791', '住宿业', '住宿业', '58984e57abfd4f499dde649df815b791', 1461518083062722560, 1050, '', 'b7cdad97032448c4bea15d48a998a4e4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('58b8e5f121fa1951d9241adc169f6111', '光纤、光缆制造', '光纤、光缆制造', '1536311398968930350', 1461518083062722560, 711, '', '1536311398968930346', 0, '1');
INSERT INTO `jvs_tree` VALUES ('58dce0abb3a8f79342a304e36d27dafe', '印刷、制药、日化及日用品生产专用设备制造', '印刷、制药、日化及日用品生产专用设备制造', '1536311398964736232', 1461518083062722560, 618, '', '1536311398964736184', 0, '1');
INSERT INTO `jvs_tree` VALUES ('59197d85c9ec4799b796470efc98f65b', '社会保障', '社会保障', '59197d85c9ec4799b796470efc98f65b', 1461518083062722560, 1405, '', '947e0f87323b430ea5d5c7689ab006cf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('591d6809e9d3415b8d86c896b06c089d', '体育组织', '体育组织', '591d6809e9d3415b8d86c896b06c089d', 1461518083062722560, 1369, '', 'cf82b0dc32824fb98ef01061303d5bb4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('593642eaef7f4d56841c28795fa2f9de', '地质勘查', '地质勘查', '593642eaef7f4d56841c28795fa2f9de', 1461518083062722560, 1203, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5945424b0827482ca25284bb80b7fdc0', '豆类、油料和薯类种植', '豆类、油料和薯类种植', '5945424b0827482ca25284bb80b7fdc0', 1461518083062722560, 8, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5954a785d7a0417d91fca5ff381a0c70', '群众团体、社会团体和其他成员组织', '群众团体、社会团体和其他成员组织', '5954a785d7a0417d91fca5ff381a0c70', 1461518083062722560, 1407, '', '947e0f87323b430ea5d5c7689ab006cf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('598e88553d27466987480a6ae74c73c3', '绘图、计算及测量仪器制造', '绘图、计算及测量仪器制造', '598e88553d27466987480a6ae74c73c3', 1461518083062722560, 768, '', 'd0f29cd031234e9f86540ef6ebf43e55', 0, '1');
INSERT INTO `jvs_tree` VALUES ('59e6cce734d10e63ae1e88f40315cf59', '镍氢电池制造', '镍氢电池制造', '1536310829881569572', 1461518083062722560, 716, '', '1536310829881569564', 0, '1');
INSERT INTO `jvs_tree` VALUES ('59ed654cade14eefa5f8ebfdbc751ade', '保险监管服务', '保险监管服务', '59ed654cade14eefa5f8ebfdbc751ade', 1461518083062722560, 1119, '', '957d60e6ff6847e08c6514eb084a4b35', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5a06f96f6ffe4eeeaae95f8f1bb27d77', '其他工艺美术品制造', '其他工艺美术品制造', '5a06f96f6ffe4eeeaae95f8f1bb27d77', 1461518083062722560, 332, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5a17a059e56241e4ac8a51cdf7dbd583', '石油钻采专用设备制造', '石油钻采专用设备制造', '5a17a059e56241e4ac8a51cdf7dbd583', 1461518083062722560, 601, '', '3e5247bc8341490eb91662c2f0d5613f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5a394faf716b441a99e25fbd523f8095', '其他未列明服务业', '其他未列明服务业', '5a394faf716b441a99e25fbd523f8095', 1461518083062722560, 1286, '', 'b241a5716023498ca4b2cf684ed0a71d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5a5aed3e14114f43b44c708744449a1c', '核燃料加工', '核燃料加工', '5a5aed3e14114f43b44c708744449a1c', 1461518083062722560, 349, '', 'af344b73bd07415f97213c1ba915aaac', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5a9e54d5a3d2a4b043d6295f2c3356bf', '电影和影视节目发行', '电影和影视节目发行', '1536310829881569708', 1461518083062722560, 1354, '', '1536310829881569704', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5abf7735309745e1bbdb9fc8b551db6a', '学前教育', '学前教育', '5abf7735309745e1bbdb9fc8b551db6a', 1461518083062722560, 1289, '', '0e85c30755b2427c98c3b5406ec53523', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5add10cfabe74ace99289f417b3f0d33', '兽医服务', '兽医服务', '5add10cfabe74ace99289f417b3f0d33', 1461518083062722560, 1216, '', 'd0ebd453a05c4e08a1bdcbc641239503', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5aee9b6a1dc043ca859e4a5a69a807a7', '图书出租', '图书出租', '5aee9b6a1dc043ca859e4a5a69a807a7', 1461518083062722560, 1146, '', '3291363a04824a4a83fa735df8baf155', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b3e72d0e9b74ceeab8dfe816ebd8f8d', '劳务派遣服务', '劳务派遣服务', '5b3e72d0e9b74ceeab8dfe816ebd8f8d', 1461518083062722560, 1169, '', 'fdd9cb4ea4a4478285b5deadde6900b9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b5eac5f91404f2d83f628c931331bcd', '百货零售', '百货零售', '5b5eac5f91404f2d83f628c931331bcd', 1461518083062722560, 926, '', 'a557fefd5b904730a9b141c5bc5d7e6c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b60b9b6e0904b528bc94bd368ab072e', '营养和保健品批发', '营养和保健品批发', '5b60b9b6e0904b528bc94bd368ab072e', 1461518083062722560, 872, '', 'b28ff0b238614f3bba8f268424209280', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b78e94fe153777aafdcc0513b2b3919', '研究和试验发展', '研究和试验发展', '1536310829881569656', 1461518083062722560, 1188, '', '1536310829881569652', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b7ff43e222b4adbb96d61a7ece99365', '水产品冷冻加工', '水产品冷冻加工', '5b7ff43e222b4adbb96d61a7ece99365', 1461518083062722560, 145, '', '69030142a6a040f0afe0598c6f9d15b8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b8d39fa3acf439bb983f98de1ad421a', '其他开采辅助活动', '其他开采辅助活动', '5b8d39fa3acf439bb983f98de1ad421a', 1461518083062722560, 129, '', '41f6765fdef74d1da4ba35e198ce3473', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b9b2ce652f94faba950732dbeaa404e', '管道运输业', '管道运输业', '5b9b2ce652f94faba950732dbeaa404e', 1461518083062722560, 1032, '', '842789d652984bcc9618bfe915b8dd6b', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5b9f97716fc25b52be010d0a4ff39400', '制冷、空调设备制造', '制冷、空调设备制造', '1536311398964736160', 1461518083062722560, 579, '', '1536311398964736148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5bac23b9386c43aa82723a870e990c66', '隔热和隔音材料制造', '隔热和隔音材料制造', '5bac23b9386c43aa82723a870e990c66', 1461518083062722560, 448, '', '762baad6d4d74de8996e592c528088a8', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5bb68040ddce875eeccc472ce5e99c8d', '烘炉、熔炉及电炉制造', '烘炉、熔炉及电炉制造', '1536307437964701848', 1461518083062722560, 576, '', '1536307437964701844', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5bc210a4c6dd029220ac4dfa5cd71302', '木制品制造', '木制品制造', '1536311398964736064', 1461518083062722560, 276, '', '1536311398964736040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5bd461da30cd4b9286148ddbd983b63b', '专科医院', '专科医院', '5bd461da30cd4b9286148ddbd983b63b', 1461518083062722560, 1317, '', '196969e76c044d5280fd58008700d1d4', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5bf29ddb434cc76355b57f632a69fd56', '光学仪器及眼镜制造', '光学仪器及眼镜制造', '1536310829881569624', 1461518083062722560, 783, '', '1536310829881569600', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5bf43d52f3344782b97778214225be53', '单板加工', '单板加工', '5bf43d52f3344782b97778214225be53', 1461518083062722560, 269, '', '5deb274a51d94adb8b7a3f0856a0934e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c0163f1f7124c4993575b0d7c6aeb99', '家具制造业', '家具制造业', '5c0163f1f7124c4993575b0d7c6aeb99', 1461518083062722560, 287, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c0d88dcca91e248c7904267360077b0', '低速载货汽车制造', '低速载货汽车制造', '1536310379493011627', 1461518083062722560, 663, '', '1536310379493011619', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c32ab6189f74dc5a7c9da1483e79f6a', '其他原动设备制造', '其他原动设备制造', '5c32ab6189f74dc5a7c9da1483e79f6a', 1461518083062722560, 551, '', 'eeb06ef1eabf45dc9214022934a5ad13', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c5cb7c36f1af0a90bc7e3224bbad373', '电气机械和器材制造业', '电气机械和器材制造业', '1536310829881569552', 1461518083062722560, 697, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c717bc9efb84ed19f97c6fe7de2959c', '烟煤和无烟煤开采洗选', '烟煤和无烟煤开采洗选', '5c717bc9efb84ed19f97c6fe7de2959c', 1461518083062722560, 84, '', 'bc265bb0211c48f8b8e8a38afaf2579e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c83d76a57d74a5aa3f0c5b69841aadd', '专用设备制造业', '专用设备制造业', '5c83d76a57d74a5aa3f0c5b69841aadd', 1461518083062722560, 598, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5c92afcc506d092b7cf72d402ce8e46b', '光学仪器制造', '光学仪器制造', '1536307437964702044', 1461518083062722560, 784, '', '1536307437964702040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5cc4e6c9b5c2b9c87bdb8f4e27c084e1', '塑料加工专用设备制造', '塑料加工专用设备制造', '1536310829881569488', 1461518083062722560, 609, '', '1536310829881569480', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ce510f41a6448809daaf0ed8c3da64a', '移动电信服务', '移动电信服务', '5ce510f41a6448809daaf0ed8c3da64a', 1461518083062722560, 1070, '', 'a5ef7f7b5c784ad9b3ea357ad6f98182', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ce62088c5924e39b3ecbcd705486863', '贸易经纪与代理', '贸易经纪与代理', '5ce62088c5924e39b3ecbcd705486863', 1461518083062722560, 917, '', 'a7f809990927455bba2350c3cbd65540', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5cf60391a8d3447f95f2f6c078c2227e', '其他非金属加工专用设备制造', '其他非金属加工专用设备制造', '5cf60391a8d3447f95f2f6c078c2227e', 1461518083062722560, 612, '', '2c1dfdaf17eb41db8e66fb3f200351da', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5d379f04ced1452e8b9df2b18a42a7c3', '炼油、化工生产专用设备制造', '炼油、化工生产专用设备制造', '5d379f04ced1452e8b9df2b18a42a7c3', 1461518083062722560, 607, '', '2c1dfdaf17eb41db8e66fb3f200351da', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5d6d87c20356480baa3f7ea8c9430e20', '家具和相关物品修理', '家具和相关物品修理', '5d6d87c20356480baa3f7ea8c9430e20', 1461518083062722560, 1280, '', '74d5892b1f97481d8539373b97b8650c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5d98d5b76b3f4b48a1b16354cb6a8ae6', '农业机械服务', '农业机械服务', '5d98d5b76b3f4b48a1b16354cb6a8ae6', 1461518083062722560, 71, '', '4d80a3b8b1be4d279344ac1771122b85', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5da2c75b27ac4375aeca9ccb15ca3884', '谷物、豆及薯类批发', '谷物、豆及薯类批发', '5da2c75b27ac4375aeca9ccb15ca3884', 1461518083062722560, 859, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5dd1218f1c254139869d661c0e8c018d', '电车制造', '电车制造', '5dd1218f1c254139869d661c0e8c018d', 1461518083062722560, 664, '', '2c9f7f83b1a041279b95fd1b35c8a23c', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5deb274a51d94adb8b7a3f0856a0934e', '木材加工', '木材加工', '5deb274a51d94adb8b7a3f0856a0934e', 1461518083062722560, 266, '', '423a2ec66ad24b9a9ec95c606a136fbd', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5dfbfcea21f04c9bb86baaf7a2c9c5ea', '含乳饮料和植物蛋白饮料制造', '含乳饮料和植物蛋白饮料制造', '5dfbfcea21f04c9bb86baaf7a2c9c5ea', 1461518083062722560, 198, '', 'f77c488fca9e415bb74990de42777f54', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5e04443694dd46a89c9da0223f5f754b', '茶及其他饮料作物种植', '茶及其他饮料作物种植', '5e04443694dd46a89c9da0223f5f754b', 1461518083062722560, 32, '', 'aed77cd8c3894c43b0ba71a3e2b9156f', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5e0a554aeaa44f6ea1f59feacde6ac8b', '农用薄膜批发', '农用薄膜批发', '5e0a554aeaa44f6ea1f59feacde6ac8b', 1461518083062722560, 905, '', '40b02e3c160241a8870c0e6451672907', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5e0ad6835b4248f5873a5de9e4d16926', '数据处理和存储服务', '数据处理和存储服务', '5e0ad6835b4248f5873a5de9e4d16926', 1461518083062722560, 1084, '', '18b70958583a491eba2567d01105d429', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5e3265acd448d8dc382f713a0108ed5a', '专用仪器仪表制造', '专用仪器仪表制造', '1536311398968930394', 1461518083062722560, 772, '', '1536311398968930390', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5e60133d452842f4aa7a38063d79d3ec', '测绘服务', '测绘服务', '5e60133d452842f4aa7a38063d79d3ec', 1461518083062722560, 1198, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5e9481dc18dc4eafbc5b7c349c86f704', '塑料薄膜制造', '塑料薄膜制造', '5e9481dc18dc4eafbc5b7c349c86f704', 1461518083062722560, 424, '', '50976a2f43bc4cc5955a536de9d07368', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ebd5d1d33624d6886a8430612170d23', '人造原油制造', '人造原油制造', '5ebd5d1d33624d6886a8430612170d23', 1461518083062722560, 347, '', 'f60f3ba8db444b7da5a8bb48b1b38978', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ec312983cf63ab00f3d3dee072c553e', '计算机、通信和其他电子设备制造业', '计算机、通信和其他电子设备制造业', '1536310379493011667', 1461518083062722560, 737, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ecae4cdbd5444908dc21364611c3104', '棉织造加工', '棉织造加工', '5ecae4cdbd5444908dc21364611c3104', 1461518083062722560, 209, '', '4739e3203d83477d83623b72b751e445', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ecd006a532c49b6b294f268e35f4fa1', '电力生产', '电力生产', '5ecd006a532c49b6b294f268e35f4fa1', 1461518083062722560, 811, '', '7927ead2d9cf4f388670c7f34997a3e5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ecf9c4372b0463590d3dd5250f2cc2c', '安全、消防用金属制品制造', '安全、消防用金属制品制造', '5ecf9c4372b0463590d3dd5250f2cc2c', 1461518083062722560, 527, '', 'c31948a1fb464bb493ac2cbd9eea7190', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ed90afabfb749a381d0b606031f88d5', '纺织服装、服饰业', '纺织服装、服饰业', '5ed90afabfb749a381d0b606031f88d5', 1461518083062722560, 241, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5ef0d34da8ea4f35a71a790414db8990', '医药及医疗器材批发', '医药及医疗器材批发', '5ef0d34da8ea4f35a71a790414db8990', 1461518083062722560, 893, '', 'a7f809990927455bba2350c3cbd65540', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5f0a03bf84a741049ca976cf95c8420a', '银冶炼', '银冶炼', '5f0a03bf84a741049ca976cf95c8420a', 1461518083062722560, 495, '', 'dc8e1fdb844d4d368f777b31e3593eb9', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5f26a5ad4f534ac19640fbd39d9f930f', '农副食品加工业', '农副食品加工业', '5f26a5ad4f534ac19640fbd39d9f930f', 1461518083062722560, 133, '', '398efc8b475d433682b16b4046dd883d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5f31f26c0ee942f08ab599760c996397', '其他非家用纺织制成品制造', '其他非家用纺织制成品制造', '5f31f26c0ee942f08ab599760c996397', 1461518083062722560, 240, '', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5f4e8fb2642b4f2a80e1362aa33d8a99', '电工机械专用设备制造', '电工机械专用设备制造', '5f4e8fb2642b4f2a80e1362aa33d8a99', 1461518083062722560, 632, '', '95f1f45df4ed4154a3c9cadf5ff3819d', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5fb0f7308897486587d113f21523204f', '泵、阀门、压缩机及类似机械制造', '泵、阀门、压缩机及类似机械制造', '5fb0f7308897486587d113f21523204f', 1461518083062722560, 566, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5fb987ea06d541689321818d23369130', '热力生产和供应', '热力生产和供应', '5fb987ea06d541689321818d23369130', 1461518083062722560, 819, '', '7927ead2d9cf4f388670c7f34997a3e5', 0, '1');
INSERT INTO `jvs_tree` VALUES ('5fd3e4eccf0a0568a97c37d51ddcaadd', '光学仪器制造', '光学仪器制造', '1536310829881569628', 1461518083062722560, 784, '', '1536310829881569624', 0, '1');
INSERT INTO `jvs_tree` VALUES ('603fd40f0d88bdc4fa233affa8d6e6c2', '采矿、冶金、建筑专用设备制造', '采矿、冶金、建筑专用设备制造', '1536294082927472794', 1461518083062722560, 599, '', '1536294082927472790', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6043ad5d4d3c4dfa928d6a8f62898753', '中国共产党机关', '中国共产党机关', '6043ad5d4d3c4dfa928d6a8f62898753', 1461518083062722560, 1388, '', 'a467e8b079c9404588ae5433a0a51093', 0, '1');
INSERT INTO `jvs_tree` VALUES ('606d943a7a944194a814550b102ee6b1', '棉纺纱加工', '棉纺纱加工', '606d943a7a944194a814550b102ee6b1', 1461518083062722560, 208, '', '4739e3203d83477d83623b72b751e445', 0, '1');
INSERT INTO `jvs_tree` VALUES ('60ef42a2a98846fcb14e5820d655d430', '报刊批发', '报刊批发', '60ef42a2a98846fcb14e5820d655d430', 1461518083062722560, 889, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, '1');
INSERT INTO `jvs_tree` VALUES ('610fe12814d7481fad9f84e5d92cfac8', '管道运输业', '管道运输业', '610fe12814d7481fad9f84e5d92cfac8', 1461518083062722560, 1033, '', '5b9b2ce652f94faba950732dbeaa404e', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180218', '齿轮及齿轮减、变速箱制造', '齿轮及齿轮减、变速箱制造', 'ac90f2d1790e4ebea65f95f57f72803f', 1461518083062722560, 573, NULL, '617032149848985838', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180219', '旧货零售', '旧货零售', 'aca35dc304444641afb75e2cc6b7b55c', 1461518083062722560, 987, NULL, '617032149853179932', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180220', '精神康复服务', '精神康复服务', 'acde93295d5942a6895fd41fb03361e2', 1461518083062722560, 1333, NULL, '617032149848985770', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180221', '谷物磨制', '谷物磨制', 'acf8e7b86d3a4a55a229ba704154412b', 1461518083062722560, 134, NULL, '617032149848986142', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180222', '其他橡胶制品制造', '其他橡胶制品制造', 'ad0a5cd81b5143b18c8588e91db6cb8e', 1461518083062722560, 422, NULL, '617032149848985810', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180223', '生产专用车辆制造', '生产专用车辆制造', 'ad3818f998084cf5ba8dc4b6f67ccb93', 1461518083062722560, 562, NULL, '617032149848985614', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180224', '锰矿、铬矿采选', '锰矿、铬矿采选', 'ad876619ef5f4704991cc3e400e8ae47', 1461518083062722560, 92, NULL, '617032149848985939', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180225', '含油果种植', '含油果种植', 'ada584a67fbd4a63946bcfe9ec2345dc', 1461518083062722560, 30, NULL, '617032149853180231', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180226', '电视', '电视', 'ae355ad27d1d440b8ae166c1c880f73d', 1461518083062722560, 1352, NULL, '617032149848985994', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180227', '核力发电', '核力发电', 'ae3a40b3a2554dbba451af13f5d0d768', 1461518083062722560, 814, NULL, '617032149848986137', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180228', '非金融机构支付服务', '非金融机构支付服务', 'ae54ab63cc79400dbc340aaf103d8013', 1461518083062722560, 1126, NULL, '617032149848985934', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180229', '婚姻服务', '婚姻服务', 'aeaf5db1400c4a4ea56a1b632c2953a2', 1461518083062722560, 1263, NULL, '617032149853180646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180230', '通信系统设备制造', '通信系统设备制造', 'aeafb5e1579342ce9ae36ce8de76f348', 1461518083062722560, 744, NULL, '617032149848985847', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180231', '坚果、含油果、香料和饮料作物种植', '坚果、含油果、香料和饮料作物种植', 'aed77cd8c3894c43b0ba71a3e2b9156f', 1461518083062722560, 28, NULL, '617032149853180245', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180232', '汽车零配件批发', '汽车零配件批发', 'aeeb9424578545bd80fb8755b26b1aea', 1461518083062722560, 910, NULL, '617032149853180568', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180233', '玻璃、陶瓷和搪瓷制品生产专用设备制造', '玻璃、陶瓷和搪瓷制品生产专用设备制造', 'af15ffa4171e4df5a01c1e3832b4f60f', 1461518083062722560, 624, NULL, '617032149848985750', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180234', '游艺器材及娱乐用品制造', '游艺器材及娱乐用品制造', 'af190cf547144f178f1234471d7b5b57', 1461518083062722560, 340, NULL, '617032149853180153', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180235', '石油加工、炼焦和核燃料加工业', '石油加工、炼焦和核燃料加工业', 'af344b73bd07415f97213c1ba915aaac', 1461518083062722560, 344, NULL, '617032149848985918', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180236', '金属压力容器制造', '金属压力容器制造', 'af6bd77050ab47afaef50ceaa01b2902', 1461518083062722560, 521, NULL, '617032149848985603', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180237', '其他航空航天器制造', '其他航空航天器制造', 'af9693cdded749b891636e34f70e3979', 1461518083062722560, 686, NULL, '617032149848986165', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180238', '非电力家用器具制造', '非电力家用器具制造', 'afaab8c4990b42cf8d2d8c7b2e0d8db0', 1461518083062722560, 727, NULL, '617032149848986072', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180239', '铜矿采选', '铜矿采选', 'afb2f69625eb44c0baf6d03bcea517f3', 1461518083062722560, 96, NULL, '617032149853180542', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180240', '球类制造', '球类制造', 'afd3826ffd3b46daaa56988163eecdad', 1461518083062722560, 334, NULL, '617032149853180342', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180241', '河湖治理及防洪设施工程建筑', '河湖治理及防洪设施工程建筑', 'afdbbd69ee604099a37a1cb417d58fec', 1461518083062722560, 837, NULL, '617032149853180311', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180242', '国际组织', '国际组织', 'b000a8a119d04cf9a767824b91b76c50', 1461518083062722560, 1424, NULL, '617032149848986153', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180243', '纺织业', '纺织业', 'b043f4c16e124cbb9905c6d0d8e76fd1', 1461518083062722560, 206, NULL, '617032149848985918', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180244', '汽车整车制造', '汽车整车制造', 'b081fc392c9340d68c37ba643310c3c1', 1461518083062722560, 661, NULL, '617032149848985846', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180245', '农业', '农业', 'b0aa9ed2d25f4c6181f4fa057fdef141', 1461518083062722560, 2, NULL, '617032149848985720', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180246', '文物及非物质文化遗产保护', '文物及非物质文化遗产保护', 'b0c98438277e46a4aa7d7820b63c366e', 1461518083062722560, 1363, NULL, '617032149853180250', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180247', '其他卫生活动', '其他卫生活动', 'b12bd6ac0ef0476485df4f8db8234835', 1461518083062722560, 1328, NULL, '617032149848986007', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180248', '有色金属合金制造', '有色金属合金制造', 'b1782354ca11422484782dad6ccb559b', 1461518083062722560, 501, NULL, '617032149853180682', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180249', '毛皮服装加工', '毛皮服装加工', 'b181a03747c040739296324b0fa156b9', 1461518083062722560, 254, NULL, '617032149853180385', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180250', '文化艺术业', '文化艺术业', 'b183152094554cbdbc98dc8ac74fb6d0', 1461518083062722560, 1357, NULL, '617032149848986082', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180251', '涤纶纤维制造', '涤纶纤维制造', 'b18babf021b94e86858ae638249ff345', 1461518083062722560, 409, NULL, '617032149853180496', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180252', '丝印染精加工', '丝印染精加工', 'b1b5334668ec4ab6a4ff103a06a96e4e', 1461518083062722560, 222, NULL, '617032149848985865', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180253', '会计、审计及税务服务', '会计、审计及税务服务', 'b1cc8dd74c484270890e2d21d7e05c40', 1461518083062722560, 1160, NULL, '617032149853180144', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180254', '电动机制造', '电动机制造', 'b21a48f6ff9d4439abac3c9c8f391fb2', 1461518083062722560, 700, NULL, '617032149853179971', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180255', '其他服务业', '其他服务业', 'b241a5716023498ca4b2cf684ed0a71d', 1461518083062722560, 1282, NULL, '617032149853180396', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180256', '货币银行服务', '货币银行服务', 'b28220a99c7a42608c3a4393df015c7c', 1461518083062722560, 1093, NULL, '617032149848985996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180257', '食品、饮料及烟草制品批发', '食品、饮料及烟草制品批发', 'b28ff0b238614f3bba8f268424209280', 1461518083062722560, 866, NULL, '617032149853180199', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180258', '气体、液体分离及纯净设备制造', '气体、液体分离及纯净设备制造', 'b290fb638ba04f7291c1e113459b4184', 1461518083062722560, 578, NULL, '617032149848986060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180259', '医疗仪器设备及器械制造', '医疗仪器设备及器械制造', 'b2eac7458a9e4b62869529e05c8b1f22', 1461518083062722560, 643, NULL, '617032149848986119', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180260', '服饰制造', '服饰制造', 'b2fc30f526e04e89968135939fc74bb3', 1461518083062722560, 244, NULL, '617032149848986139', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180261', '电气设备修理', '电气设备修理', 'b31b956ba8a94d0eac42c24eac0249d9', 1461518083062722560, 806, NULL, '617032149853180182', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180262', '管道和设备安装', '管道和设备安装', 'b353d0206fd3451290489d23e611bf7b', 1461518083062722560, 847, NULL, '617032149848985765', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180263', '中成药生产', '中成药生产', 'b3c72e56881c46f4b6382f1f35f86b8f', 1461518083062722560, 399, NULL, '617032149853180546', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180264', '刨花板制造', '刨花板制造', 'b4065f88999d45bc82c714dffa40cfe0', 1461518083062722560, 274, NULL, '617032149853180126', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180265', '石油开采', '石油开采', 'b466508383604072b9530e8e0208d117', 1461518083062722560, 88, NULL, '617032149853180637', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180266', '颜料制造', '颜料制造', 'b48ff30384a94787a68e806d5ca398f4', 1461518083062722560, 370, NULL, '617032149853180272', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180267', '综合医院', '综合医院', 'b4b0c0dcf5964fee840f479f79c1c824', 1461518083062722560, 1313, NULL, '617032149848985751', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180268', '日用化学产品制造', '日用化学产品制造', 'b5210ed1f0304474a251e592d21f2258', 1461518083062722560, 389, NULL, '617032149853180346', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180269', '塑料包装箱及容器制造', '塑料包装箱及容器制造', 'b52b2bcf068345d482625cf7a538d468', 1461518083062722560, 429, NULL, '617032149848986054', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180270', '工业自动控制系统装置制造', '工业自动控制系统装置制造', 'b55f052cfc11484ca8b6efaea52c7d26', 1461518083062722560, 766, NULL, '617032149853180437', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180271', '其他安全保护服务', '其他安全保护服务', 'b57567d4ff5e45f79b1878e22cf38c7d', 1461518083062722560, 1178, NULL, '617032149853179941', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180272', '涂料、油墨、颜料及类似产品制造', '涂料、油墨、颜料及类似产品制造', 'b582e29d66aa4ac4bb3ec657198b0477', 1461518083062722560, 367, NULL, '617032149853180346', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180273', '房地产业', '房地产业', 'b58bd9253692458cbbfdf0e589c39e11', 1461518083062722560, 1130, NULL, '617032149848985679', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180274', '锑冶炼', '锑冶炼', 'b58c62690dd347f4bef562246ef4dfa4', 1461518083062722560, 489, NULL, '617032149853180545', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180275', '其他纸制品制造', '其他纸制品制造', 'b58cbe491c784c578642e43ad5edaab8', 1461518083062722560, 303, NULL, '617032149848985985', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180276', '其他房地产业', '其他房地产业', 'b5bd316b3f304169b6ca86221528cc30', 1461518083062722560, 1135, NULL, '617032149853180273', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180277', '羊的饲养', '羊的饲养', 'b5f170d2b0984c259cd9b9fa27632f85', 1461518083062722560, 52, NULL, '617032149853180415', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180278', '生活用燃料零售', '生活用燃料零售', 'b60b8dfd42484b8e89f46f5970111a8d', 1461518083062722560, 988, NULL, '617032149853179932', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180279', '日用玻璃制品制造', '日用玻璃制品制造', 'b62b1bd59d994738acc39c83c7b24d5e', 1461518083062722560, 457, NULL, '617032149853180004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180280', '潜水及水下救捞装备制造', '潜水及水下救捞装备制造', 'b6394f7571594ccf95d188ac87a1a448', 1461518083062722560, 695, NULL, '617032149853180438', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180281', '道路运输业', '道路运输业', 'b64282a18c5f4980b1432a50ceb588fd', 1461518083062722560, 998, NULL, '617032149853180024', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180282', '文化、体育用品及器材批发', '文化、体育用品及器材批发', 'b6553f5fc13d4359acc4a0467709a7bf', 1461518083062722560, 885, NULL, '617032149853180199', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180283', '建筑业', '建筑业', 'b67183c5310442e5bd939723ca155dea', 1461518083062722560, 826, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180284', '水产品罐头制造', '水产品罐头制造', 'b692663c29ea4326a636191ba5ce9e29', 1461518083062722560, 172, NULL, '617032149853180077', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180285', '社区医疗与卫生院', '社区医疗与卫生院', 'b6e94e52f60f4f88a00b19602cd26aa8', 1461518083062722560, 1319, NULL, '617032149848986007', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180286', '蛋品加工', '蛋品加工', 'b72d815c5fe4451294f416dd1525e4db', 1461518083062722560, 156, NULL, '617032149853180213', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180287', '餐饮业', '餐饮业', 'b7677f90d185460a8e7dea5ad7a69354', 1461518083062722560, 1054, NULL, '617032149853180290', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180288', '群众团体', '群众团体', 'b78db952034f49eca2e0456b36962c91', 1461518083062722560, 1408, NULL, '617032149848986097', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180289', '公路旅客运输', '公路旅客运输', 'b7b1aa0c3372435bbaa39c785c7455b8', 1461518083062722560, 1004, NULL, '617032149853180281', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180290', '住宿和餐饮业', '住宿和餐饮业', 'b7cdad97032448c4bea15d48a998a4e4', 1461518083062722560, 1049, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180291', '通用零部件制造', '通用零部件制造', 'b7d629b5dd27447dbbf8664c3521e653', 1461518083062722560, 591, NULL, '617032149848985767', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180292', '其他水产品加工', '其他水产品加工', 'b802e97d7b2b4be79190e330cf68d146', 1461518083062722560, 149, NULL, '617032149848986196', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180293', '水上运输业', '水上运输业', 'b815134170f74bb08ef895c26c8fd01f', 1461518083062722560, 1010, NULL, '617032149853180024', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180294', '骆驼饲养', '骆驼饲养', 'b8705a6ea4e84490b21d9956a46812de', 1461518083062722560, 53, NULL, '617032149853180415', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180295', '房屋建筑业', '房屋建筑业', 'b8768c0cbac64280b07e18fe5ad34950', 1461518083062722560, 827, NULL, '617032149853180283', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180296', '原油加工及石油制品制造', '原油加工及石油制品制造', 'b88d93edc2ed4a328438aa3706db3ecc', 1461518083062722560, 346, NULL, '617032149853180640', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180297', '盐及调味品批发', '盐及调味品批发', 'b8a2e0cb7bab4681ae38e5cf1f956237', 1461518083062722560, 871, NULL, '617032149853180257', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180298', '影视录放设备制造', '影视录放设备制造', 'b8a610ee184c44aa8cdd9bf233058962', 1461518083062722560, 754, NULL, '617032149848985699', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180299', '老年人、残疾人养护服务', '老年人、残疾人养护服务', 'b8ce00fbe5dd4c128f5563fcf9b357a5', 1461518083062722560, 1334, NULL, '617032149848985770', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180300', '市政道路工程建筑', '市政道路工程建筑', 'b8d325587ee84c079fbb5c577c59632e', 1461518083062722560, 833, NULL, '617032149853180323', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180301', '其他常用有色金属冶炼', '其他常用有色金属冶炼', 'b8f0ab7b439e4c41b7e18a2513763e06', 1461518083062722560, 492, NULL, '617032149853180545', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180302', '洗染服务', '洗染服务', 'b8f1da43ff144b07ac820602e523c419', 1461518083062722560, 1259, NULL, '617032149853180646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180303', '中药材种植', '中药材种植', 'b91f46f572a444679c1ec214a45051cf', 1461518083062722560, 33, NULL, '617032149853180245', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180304', '财产保险', '财产保险', 'b92c424c84a84b55bc8b388bc7264c6d', 1461518083062722560, 1115, NULL, '617032149853180112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180305', '有色金属矿采选业', '有色金属矿采选业', 'b9630eb6fbec4c15b18f6b2d89fdb1ae', 1461518083062722560, 94, NULL, '617032149853180484', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180306', '市政设施管理', '市政设施管理', 'b99e8e8decca47a7a48112aeb683baab', 1461518083062722560, 1248, NULL, '617032149848985647', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180307', '职业中介服务', '职业中介服务', 'b99f07a292ce4d8f908e71f6c04aef65', 1461518083062722560, 1168, NULL, '617032149853180680', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180308', '民主党派', '民主党派', 'b9af5c7b559e4ea4a06b552e3b25459d', 1461518083062722560, 1404, NULL, '617032149848986183', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180309', '音像制品及电子出版物零售', '音像制品及电子出版物零售', 'b9de5a0eb4cd4413a3725e1ebe5ae51f', 1461518083062722560, 952, NULL, '617032149853179949', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180310', '食品及饲料添加剂制造', '食品及饲料添加剂制造', 'ba00e62b89634c45912959f8845db7b2', 1461518083062722560, 184, NULL, '617032149853180645', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180311', '水利和内河港口工程建筑', '水利和内河港口工程建筑', 'ba5038703b2d45b7ae25a76b55542b75', 1461518083062722560, 835, NULL, '617032149853179999', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180312', '蔬菜、水果和坚果加工', '蔬菜、水果和坚果加工', 'ba575e30d21f4b14a6fb7d0e5e8e0724', 1461518083062722560, 150, NULL, '617032149848986142', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180313', '黑色金属冶炼和压延加工业', '黑色金属冶炼和压延加工业', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 1461518083062722560, 477, NULL, '617032149848985918', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180314', '木竹浆制造', '木竹浆制造', 'ba746a41a9e74e04bf2731afbe248d85', 1461518083062722560, 295, NULL, '617032149848986029', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180315', '饼干及其他焙烤食品制造', '饼干及其他焙烤食品制造', 'ba796df3cfb24131878429d177c873cc', 1461518083062722560, 161, NULL, '617032149853180187', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180316', '社会事务管理机构', '社会事务管理机构', 'ba87c678485e4627a6d27578adec63ae', 1461518083062722560, 1395, NULL, '617032149853180686', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180317', '期货市场管理服务', '期货市场管理服务', 'ba97fa65858f4794b5a805aa99b9219e', 1461518083062722560, 1106, NULL, '617032149853180156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180318', '烟草制品批发', '烟草制品批发', 'baab5838e31e4086b0479cd0a7e6acde', 1461518083062722560, 874, NULL, '617032149853180257', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180319', '机械治疗及病房护理设备制造', '机械治疗及病房护理设备制造', 'bae6efcfc0be4ac59705109601d0789d', 1461518083062722560, 648, NULL, '617032149853180259', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180320', '信息化学品制造', '信息化学品制造', 'bb141041575a483383996b2724513cc4', 1461518083062722560, 382, NULL, '617032149853180148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180321', '其他通用零部件制造', '其他通用零部件制造', 'bb4990b53aa242f6b47a120ae423555e', 1461518083062722560, 596, NULL, '617032149853180291', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180322', '专业化设计服务', '专业化设计服务', 'bb7cea158f67498499cbcac11f48d63e', 1461518083062722560, 1214, NULL, '617032149853180436', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180323', '铁路、道路、隧道和桥梁工程建筑', '铁路、道路、隧道和桥梁工程建筑', 'bb9b27e8b29448acbc29064678ff48ba', 1461518083062722560, 830, NULL, '617032149853179999', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180324', '煤炭开采和洗选业', '煤炭开采和洗选业', 'bc265bb0211c48f8b8e8a38afaf2579e', 1461518083062722560, 83, NULL, '617032149853180484', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180325', '企业总部管理', '企业总部管理', 'bc704279b429415f89ac350749f2f4cb', 1461518083062722560, 1151, NULL, '617032149848986081', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180326', '坚果种植', '坚果种植', 'bcc3c21a970d4da48f602e1f07493162', 1461518083062722560, 29, NULL, '617032149853180231', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180327', '烈士陵园、纪念馆', '烈士陵园、纪念馆', 'bcf224f87f184269836087114259d07e', 1461518083062722560, 1365, NULL, '617032149853180250', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180328', '酱油、食醋及类似制品制造', '酱油、食醋及类似制品制造', 'bd059b0fa8614e798d1c7ac8b00d482e', 1461518083062722560, 177, NULL, '617032149853180666', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180329', '广播电视接收设备及器材制造', '广播电视接收设备及器材制造', 'bd199d7bfa624101afa7978892ecd4d0', 1461518083062722560, 748, NULL, '617032149848985735', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180330', '基金会', '基金会', 'bd54634fc745408f97349360e2b9e3c5', 1461518083062722560, 1417, NULL, '617032149848986097', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180331', '电工仪器仪表制造', '电工仪器仪表制造', 'bdab5e0f45f74b92b9a20a22bbf5695b', 1461518083062722560, 767, NULL, '617032149853180437', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180332', '食品制造业', '食品制造业', 'bdccc103aea04c328baa79ac2d2af736', 1461518083062722560, 158, NULL, '617032149848985918', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180333', '其他信息技术服务业', '其他信息技术服务业', 'be130eaa590c400eab7eb771b3df4849', 1461518083062722560, 1086, NULL, '617032149848985747', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180334', '矿山机械制造', '矿山机械制造', 'be4b9e71c98e4f80bcae2eb866a82ac8', 1461518083062722560, 600, NULL, '617032149848985944', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180335', '腈纶纤维制造', '腈纶纤维制造', 'be7f73a51ed045a2b0193b4eaa1cc9a8', 1461518083062722560, 410, NULL, '617032149853180496', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180336', '港口及航运设施工程建筑', '港口及航运设施工程建筑', 'be9daa7ee0164df7b381a0bf65894f41', 1461518083062722560, 838, NULL, '617032149853180311', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180337', '地质勘查专用设备制造', '地质勘查专用设备制造', 'becd97b515444eeabf323b6111d253b2', 1461518083062722560, 653, NULL, '617032149853180060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180338', '中央银行服务', '中央银行服务', 'befc9f8864764e4e91b944c62c1a97b5', 1461518083062722560, 1092, NULL, '617032149848985996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180339', '电线、电缆制造', '电线、电缆制造', 'bf0533ae97fe4210b968a2d9e8c55ef3', 1461518083062722560, 710, NULL, '617032149848985875', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180340', '日用电器修理', '日用电器修理', 'bf087c130d004359a9203384d0fe8ca1', 1461518083062722560, 1276, NULL, '617032149848985981', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180341', '家庭服务', '家庭服务', 'bf0d94be42ab41f8a610f78363273462', 1461518083062722560, 1257, NULL, '617032149853180646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180342', '体育用品制造', '体育用品制造', 'bf6890967d994d25a26161fb732004c8', 1461518083062722560, 333, NULL, '617032149853180153', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180343', '纸和纸板容器制造', '纸和纸板容器制造', 'bf6c03542a9a4ccfb4c76f4bea1d145e', 1461518083062722560, 302, NULL, '617032149848985985', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180344', '工矿工程建筑', '工矿工程建筑', 'bfddaafa884b46c88daf513160dfff5c', 1461518083062722560, 840, NULL, '617032149853179999', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180345', '白酒制造', '白酒制造', 'bfed8cb2ce3f4628bc6513caca196c49', 1461518083062722560, 189, NULL, '617032149853180648', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180346', '化学原料和化学制品制造业', '化学原料和化学制品制造业', 'c01cf4a89346492eb44865639a074a45', 1461518083062722560, 350, NULL, '617032149848985918', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180347', '酒、饮料及茶叶零售', '酒、饮料及茶叶零售', 'c0b1e3297e1f4ac288f1f342cf852995', 1461518083062722560, 935, NULL, '617032149853180439', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180348', '其他道路运输辅助活动', '其他道路运输辅助活动', 'c0b67d8f45384abcb942d646bfc3c79d', 1461518083062722560, 1009, NULL, '617032149848985664', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180349', '塑料鞋制造', '塑料鞋制造', 'c19244a94a5c48e683aea1e2938c7a3f', 1461518083062722560, 262, NULL, '617032149853180366', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180350', '水资源专用机械制造', '水资源专用机械制造', 'c1d235d0826c4893ad363fc488e0b10f', 1461518083062722560, 658, NULL, '617032149853180060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180351', '速冻食品制造', '速冻食品制造', 'c21d26f9f0b4477a804fce132ccfc7ae', 1461518083062722560, 167, NULL, '617032149853180578', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180352', '林产品初级加工服务', '林产品初级加工服务', 'c280aa92feed4a2c9f6b36072ee56ba1', 1461518083062722560, 78, NULL, '617032149853179959', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180353', '木制容器制造', '木制容器制造', 'c2b7187f81674dc68fcdf211151accdf', 1461518083062722560, 280, NULL, '617032149848985649', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180354', '橡胶加工专用设备制造', '橡胶加工专用设备制造', 'c2e16d9bf87b4dcc84995d3402df3f79', 1461518083062722560, 608, NULL, '617032149848985843', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180355', '其他住宿业', '其他住宿业', 'c2f13c83b65343c59a7ca6bb4bd59a1d', 1461518083062722560, 1053, NULL, '617032149848986092', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180356', '建筑、安全用金属制品制造', '建筑、安全用金属制品制造', 'c31948a1fb464bb493ac2cbd9eea7190', 1461518083062722560, 524, NULL, '617032149853180671', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180357', '金矿采选', '金矿采选', 'c319bc47b17641fd884990672ca8ed66', 1461518083062722560, 105, NULL, '617032149848985967', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180358', '塑料人造革、合成革制造', '塑料人造革、合成革制造', 'c33b2dd70a974d3380508f597f3f8571', 1461518083062722560, 428, NULL, '617032149848986054', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180359', '烟叶复烤', '烟叶复烤', 'c33b3f4788a34219b3b2e6d53fe23e6b', 1461518083062722560, 203, NULL, '617032149848986151', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180360', '林木育苗', '林木育苗', 'c36a20a9876c4fcab9cd2d4d6362c253', 1461518083062722560, 38, NULL, '617032149853180130', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180361', '教育', '教育', 'c3796786035442a7a380f1bd92404d42', 1461518083062722560, 1287, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180362', '危险废物治理', '危险废物治理', 'c37eead7fdb94c9886893945f3ff1759', 1461518083062722560, 1244, NULL, '617032149853179914', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180363', '市场管理', '市场管理', 'c390d9b9da854779b84785330af663a6', 1461518083062722560, 1180, NULL, '617032149848985748', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180364', '安全系统监控服务', '安全系统监控服务', 'c39f4641ef404d2f8ff61eb846313661', 1461518083062722560, 1177, NULL, '617032149853179941', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180365', '谷物、棉花等农产品仓储', '谷物、棉花等农产品仓储', 'c3accf30125748639c0d5930c9944eb7', 1461518083062722560, 1041, NULL, '617032149853180099', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180366', '制鞋业', '制鞋业', 'c3f468119b194c1a99edf99ae5c8066c', 1461518083062722560, 259, NULL, '617032149848985970', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180367', '塑料丝、绳及编织品制造', '塑料丝、绳及编织品制造', 'c4529689c02641f8aa9cf319eef8648e', 1461518083062722560, 426, NULL, '617032149848986054', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180368', '阀门和旋塞制造', '阀门和旋塞制造', 'c4ce6fd369384958bad783eef207a734', 1461518083062722560, 569, NULL, '617032149848986145', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180369', '毛织造加工', '毛织造加工', 'c50e19af8df44164a9adff705008044c', 1461518083062722560, 213, NULL, '617032149848985931', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180370', '其他体育', '其他体育', 'c5b7f439f79747a8b0418b5f3b07ff82', 1461518083062722560, 1372, NULL, '617032149853180422', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180371', '货运火车站', '货运火车站', 'c5dcc2b1c6754393854f6b948a8ce1d5', 1461518083062722560, 996, NULL, '617032149853180018', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180372', '社会人文科学研究', '社会人文科学研究', 'c5eeee964f024f649db3c84852d82948', 1461518083062722560, 1193, NULL, '617032149848985754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180373', '地震服务', '地震服务', 'c60c62b9bfcc4346993be89d72569a0e', 1461518083062722560, 1196, NULL, '617032149853180598', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180374', '公共就业服务', '公共就业服务', 'c6440c2649c34ed38c0d3a72e9d32def', 1461518083062722560, 1167, NULL, '617032149853180680', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180375', '塑料零件制造', '塑料零件制造', 'c645c0a03e53438895c165ddb94df20d', 1461518083062722560, 431, NULL, '617032149848986054', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180376', '其他互联网服务', '其他互联网服务', 'c65de6f15b284b19a2eeaa8e5ddc3cd5', 1461518083062722560, 1079, NULL, '617032149853180615', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180377', '其他输配电及控制设备制造', '其他输配电及控制设备制造', 'c674dd95111b487bb2cc31b220b0c14a', 1461518083062722560, 708, NULL, '617032149853180559', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180378', '锡冶炼', '锡冶炼', 'c6bdcbb8330e42fab9b99c419d15a999', 1461518083062722560, 488, NULL, '617032149853180545', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180379', '疗养院', '疗养院', 'c6d58b8b0e3048f9a1ce45414036aacd', 1461518083062722560, 1318, NULL, '617032149848985751', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180380', '机械化农业及园艺机具制造', '机械化农业及园艺机具制造', 'c71e14ccd31d46af92ed1fd6dccfdb95', 1461518083062722560, 636, NULL, '617032149853180117', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180381', '商业、饮食、服务专用设备制造', '商业、饮食、服务专用设备制造', 'c7439fe172424ea6a92f8d7c626883da', 1461518083062722560, 655, NULL, '617032149853180060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180382', '远洋货物运输', '远洋货物运输', 'c7832cb0ab7d487d84f59c0a49b3aac3', 1461518083062722560, 1016, NULL, '617032149853180643', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180383', '稀土金属冶炼', '稀土金属冶炼', 'c7ba1030bd574b6fb8c90e68a1a3552d', 1461518083062722560, 499, NULL, '617032149848986227', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180384', '医疗、外科及兽医用器械制造', '医疗、外科及兽医用器械制造', 'c7c4adba557245d397578cd7cac65674', 1461518083062722560, 647, NULL, '617032149853180259', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180385', '毛皮鞣制及制品加工', '毛皮鞣制及制品加工', 'c7fd52d88c344084baf1c4dbd3621cc3', 1461518083062722560, 252, NULL, '617032149848985970', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180386', '卷烟制造', '卷烟制造', 'c87a21e3c3154e43b41c9bd5d3b92a8e', 1461518083062722560, 204, NULL, '617032149848986151', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180387', '纺织带和帘子布制造', '纺织带和帘子布制造', 'c9094585d26b49f99049f8c76e8718ae', 1461518083062722560, 238, NULL, '617032149853180548', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180388', '铁路运输业', '铁路运输业', 'c915fdd52cd44480af9cb34c7d1b379f', 1461518083062722560, 991, NULL, '617032149853180024', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180389', '财务公司', '财务公司', 'c93ab81e5436419b8b4608786cc77d71', 1461518083062722560, 1096, NULL, '617032149853180491', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180390', '图书馆', '图书馆', 'c9554509d7a2450b835981372b9c08ef', 1461518083062722560, 1361, NULL, '617032149853180152', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180391', '香蕉等亚热带水果种植', '香蕉等亚热带水果种植', 'c98ceba8431443a88a3a9b71bbb9cbcd', 1461518083062722560, 26, NULL, '617032149848985608', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180392', '其他玻璃制品制造', '其他玻璃制品制造', 'c9a6a25499084b35b0bd68dc09c71f88', 1461518083062722560, 461, NULL, '617032149853180004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180393', '医学研究和试验发展', '医学研究和试验发展', 'c9c03ff2596c414d9859ea496dae9961', 1461518083062722560, 1192, NULL, '617032149848985754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180394', '绢纺和丝织加工', '绢纺和丝织加工', 'c9c626edf66f48418f70a9f1f19acf29', 1461518083062722560, 221, NULL, '617032149848985865', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180395', '果品、蔬菜批发', '果品、蔬菜批发', 'ca05e0f6d8c64c52a682bc721fd39f69', 1461518083062722560, 869, NULL, '617032149853180257', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180396', '居民服务、修理和其他服务业', '居民服务、修理和其他服务业', 'ca487ef1343d40f084234fc555aa3361', 1461518083062722560, 1255, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180397', '人寿保险', '人寿保险', 'ca8ef80962fa4f0cb4975063f42ce457', 1461518083062722560, 1113, NULL, '617032149853180620', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180398', '衡器制造', '衡器制造', 'cac43a585ca64b3d9eb6359984cab144', 1461518083062722560, 582, NULL, '617032149848986060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180399', '非公路休闲车及零配件制造', '非公路休闲车及零配件制造', 'caf6ea049a234df98e4cef4ec6bb9c0a', 1461518083062722560, 693, NULL, '617032149853180673', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180400', '化学药品制剂制造', '化学药品制剂制造', 'cba04180e7974dd299be04da07fd79b6', 1461518083062722560, 397, NULL, '617032149853180546', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180401', '其他期货市场服务', '其他期货市场服务', 'cbe91e515985425dbc019e6f8014ae04', 1461518083062722560, 1107, NULL, '617032149853180156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180402', '金属成形机床制造', '金属成形机床制造', 'cc05639e153745b7ae5de789991a2256', 1461518083062722560, 554, NULL, '617032149853180035', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180403', '农业科学研究和试验发展', '农业科学研究和试验发展', 'cc063bb0e39348bba6b7a1eb14b43ab0', 1461518083062722560, 1191, NULL, '617032149848985754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180404', '褐煤开采洗选', '褐煤开采洗选', 'cc94c380675d4b75a00493baf99db8b3', 1461518083062722560, 85, NULL, '617032149853180324', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180405', '应用电视设备及其他广播电视设备制造', '应用电视设备及其他广播电视设备制造', 'cd4036f37a7b453ebc3e15a7c2588983', 1461518083062722560, 749, NULL, '617032149848985735', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180406', '实验分析仪器制造', '实验分析仪器制造', 'cd4a0429578d45c48c39635d5d2e901e', 1461518083062722560, 769, NULL, '617032149853180437', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180407', '其他专用仪器制造', '其他专用仪器制造', 'cd4aa0658c7b4cd7aafeff79d2e5be55', 1461518083062722560, 781, NULL, '617032149848986091', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180408', '工艺美术品制造', '工艺美术品制造', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 1461518083062722560, 323, NULL, '617032149853180153', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180409', '香料、香精制造', '香料、香精制造', 'cd8c09e056554b4a84226d0af3ee7d73', 1461518083062722560, 393, NULL, '617032149853180268', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180410', '家用空气调节器制造', '家用空气调节器制造', 'cdcc8241026845668ce5472a631f08ee', 1461518083062722560, 720, NULL, '617032149853180589', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180411', '中药饮片加工', '中药饮片加工', 'cde624d138924d9a8c34331138323a0d', 1461518083062722560, 398, NULL, '617032149853180546', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180412', '金属密封件制造', '金属密封件制造', 'ce41c65b785541e3b28c15438a7c7aa6', 1461518083062722560, 592, NULL, '617032149853180291', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180413', '营养和保健品零售', '营养和保健品零售', 'ce6ae28ae4194132b4457577b0a1da4d', 1461518083062722560, 934, NULL, '617032149853180439', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180414', '其他农业服务', '其他农业服务', 'ce7e4080e07a4d2bb33dbb2d1c8ee89d', 1461518083062722560, 74, NULL, '617032149848986039', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180415', '牲畜饲养', '牲畜饲养', 'cecc6d30ab22456791361548e1d0f5db', 1461518083062722560, 48, NULL, '617032149853180100', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180416', '橡胶零件制造', '橡胶零件制造', 'cedba29210464644832095394cc178ae', 1461518083062722560, 419, NULL, '617032149848985810', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180417', '保健服务', '保健服务', 'cf001265955241438ff59d4085631a7f', 1461518083062722560, 1262, NULL, '617032149853180646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180418', '放射性金属矿采选', '放射性金属矿采选', 'cf268b7fb0e040108729919c172ba257', 1461518083062722560, 111, NULL, '617032149848985812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180419', '太阳能发电', '太阳能发电', 'cf29a384bd4c4ab38a90c2038e0fec41', 1461518083062722560, 816, NULL, '617032149848986137', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180420', '汽车、摩托车、燃料及零配件专门零售', '汽车、摩托车、燃料及零配件专门零售', 'cf46f0a4428749fbbbeabeeadd53969d', 1461518083062722560, 961, NULL, '617032149848986005', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180421', '其他不提供住宿社会工作', '其他不提供住宿社会工作', 'cf7334e7ede84a7dbec8369f888bcc62', 1461518083062722560, 1339, NULL, '617032149853180170', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180422', '体育', '体育', 'cf82b0dc32824fb98ef01061303d5bb4', 1461518083062722560, 1368, NULL, '617032149848986082', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180423', '其他食品零售', '其他食品零售', 'cf878fe92e6446d8bb569c055ad2207b', 1461518083062722560, 937, NULL, '617032149853180439', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180424', '稀土金属矿采选', '稀土金属矿采选', 'cf8840df946f453f9c70fe819da805a4', 1461518083062722560, 110, NULL, '617032149848985812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180425', '博物馆', '博物馆', 'cf8bc931c9e74810b747545033c5e121', 1461518083062722560, 1364, NULL, '617032149853180250', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180426', '化学农药制造', '化学农药制造', 'cfd4da379eb245758615c1b60d0fbe8c', 1461518083062722560, 365, NULL, '617032149853180216', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180427', '人造纤维（纤维素纤维）制造', '人造纤维（纤维素纤维）制造', 'cfec3e9ec5e9470197eb642b58a5b980', 1461518083062722560, 406, NULL, '617032149853180212', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180428', '环境保护专用设备制造', '环境保护专用设备制造', 'cfffc79d9a774609bbd30cc6c8e048e1', 1461518083062722560, 652, NULL, '617032149853180060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180429', '粘土及其他土砂石开采', '粘土及其他土砂石开采', 'd006433159d245fe8538b459e50c2498', 1461518083062722560, 118, NULL, '617032149848985884', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180430', '水利、环境和公共设施管理业', '水利、环境和公共设施管理业', 'd0159dee15c84e7497612587f32232e5', 1461518083062722560, 1227, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180431', '有机化学原料制造', '有机化学原料制造', 'd02079cda2c84ed2b556c9739cdd8a37', 1461518083062722560, 355, NULL, '617032149853180094', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180432', '银行监管服务', '银行监管服务', 'd02bd90eaf2b4083895ccecd21a67340', 1461518083062722560, 1099, NULL, '617032149848985996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180433', '冶金专用设备制造', '冶金专用设备制造', 'd0adf9d7b14447959e70251aba4796a9', 1461518083062722560, 605, NULL, '617032149848985944', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180434', '玩具制造', '玩具制造', 'd0db53f4ca1e439dbe39c2169579dca0', 1461518083062722560, 339, NULL, '617032149853180153', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180435', '其他畜牧业', '其他畜牧业', 'd0e797a7706a410081fb6a8df71a335c', 1461518083062722560, 61, NULL, '617032149853180100', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180436', '其他专业技术服务业', '其他专业技术服务业', 'd0ebd453a05c4e08a1bdcbc641239503', 1461518083062722560, 1213, NULL, '617032149853180598', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180437', '通用仪器仪表制造', '通用仪器仪表制造', 'd0f29cd031234e9f86540ef6ebf43e55', 1461518083062722560, 765, NULL, '617032149848985873', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180438', '潜水救捞及其他未列明运输设备制造', '潜水救捞及其他未列明运输设备制造', 'd0ffcc5e893541dcac53472927b87a41', 1461518083062722560, 694, NULL, '617032149853180673', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180439', '食品、饮料及烟草制品专门零售', '食品、饮料及烟草制品专门零售', 'd138659de1744d208b52d77abf92cd51', 1461518083062722560, 929, NULL, '617032149848986005', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180440', '水产捕捞', '水产捕捞', 'd15152d0699b4ac393614a5f6f04df30', 1461518083062722560, 66, NULL, '617032149853180639', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180441', '其他通用设备制造业', '其他通用设备制造业', 'd15aab9c846f4a21ab46650592712689', 1461518083062722560, 597, NULL, '617032149848985767', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180442', '金属制品修理', '金属制品修理', 'd19622421fea4348a8763cd708b8ddc1', 1461518083062722560, 798, NULL, '617032149853180182', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180443', '棉花仓储', '棉花仓储', 'd1ce2889e8c047b9883699591362fa5e', 1461518083062722560, 1043, NULL, '617032149853180365', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180444', '化纤织物染整精加工', '化纤织物染整精加工', 'd20843ae7fa44568b7b6f3380850b642', 1461518083062722560, 225, NULL, '617032149853180186', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180445', '文艺创作与表演', '文艺创作与表演', 'd21ff93502a34be4bdaf86bf89b8e6d3', 1461518083062722560, 1358, NULL, '617032149853180250', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180446', '农产品初加工服务', '农产品初加工服务', 'd23c646900a9475cba7cb4768e9f4b7e', 1461518083062722560, 73, NULL, '617032149848986039', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180447', '饮料及冷饮服务', '饮料及冷饮服务', 'd29526550a3c4c2eb00d1e245e8244e8', 1461518083062722560, 1057, NULL, '617032149853180287', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180448', '油料种植', '油料种植', 'd2bbb35d44b64dc0b56f217b9ad05b65', 1461518083062722560, 10, NULL, '617032149848986096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180449', '碳酸饮料制造', '碳酸饮料制造', 'd2f36cb8dcba41c7b0e3b16e1161370d', 1461518083062722560, 195, NULL, '617032149853180655', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180450', '其他国家机构', '其他国家机构', 'd36788a81f164ada827360e3253036c4', 1461518083062722560, 1401, NULL, '617032149848985906', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180451', '日用塑料制品制造', '日用塑料制品制造', 'd3917ed59bca4241a9fb34cbd1ae88cf', 1461518083062722560, 430, NULL, '617032149848986054', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180452', '水上旅客运输', '水上旅客运输', 'd39afb8696c948ba88baadc8b053221a', 1461518083062722560, 1011, NULL, '617032149853180293', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180453', '非木竹材林产品采集', '非木竹材林产品采集', 'd3bd550e4fef4cd7862b56f2382e19a0', 1461518083062722560, 46, NULL, '617032149848985721', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180454', '公路工程建筑', '公路工程建筑', 'd3ce8b16b19148be8af8e2fc8af1df79', 1461518083062722560, 832, NULL, '617032149853180323', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180455', '金属表面处理及热处理加工', '金属表面处理及热处理加工', 'd41e7573ec094e2a9ccd365c7794fb84', 1461518083062722560, 529, NULL, '617032149853180671', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180456', '砼结构构件制造', '砼结构构件制造', 'd44f118ad22e425f97ddff7b7b129e76', 1461518083062722560, 439, NULL, '617032149848985781', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180457', '孤残儿童收养和庇护服务', '孤残儿童收养和庇护服务', 'd45fb286903e4a7b842bbca10facbd64', 1461518083062722560, 1335, NULL, '617032149848985770', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180458', '煤炭开采和洗选辅助活动', '煤炭开采和洗选辅助活动', 'd4973cf85be34a23a4676581e4e89c76', 1461518083062722560, 127, NULL, '617032149848985972', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180459', '农林牧渔专用仪器仪表制造', '农林牧渔专用仪器仪表制造', 'd4eb07c2a339491fa56669a0a3ad0c4a', 1461518083062722560, 776, NULL, '617032149848986091', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180460', '起重机制造', '起重机制造', 'd4ff24c9de6f490d948938c2546455fe', 1461518083062722560, 561, NULL, '617032149848985614', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180461', '其他农产品仓储', '其他农产品仓储', 'd5050bf71cd1490a9cff1dec04ed778c', 1461518083062722560, 1044, NULL, '617032149853180365', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180462', '照明器具生产专用设备制造', '照明器具生产专用设备制造', 'd50dbc169bdd44e091edf9944c59e13d', 1461518083062722560, 623, NULL, '617032149848985750', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180463', '耐火陶瓷制品及其他耐火材料制造', '耐火陶瓷制品及其他耐火材料制造', 'd573448648704c41bcd9cdc08220218b', 1461518083062722560, 473, NULL, '617032149848985831', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180464', '内河旅客运输', '内河旅客运输', 'd594061459c8450c9b73da2a427fc52b', 1461518083062722560, 1013, NULL, '617032149853180452', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180465', '记录媒介复制', '记录媒介复制', 'd5ba274f4a414f2aa6b6e9a34e4fbd57', 1461518083062722560, 310, NULL, '617032149853180089', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180466', '医疗实验室及医用消毒设备和器具制造', '医疗实验室及医用消毒设备和器具制造', 'd5c8029881a7479b8a919b0180a59a99', 1461518083062722560, 646, NULL, '617032149853180259', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180467', '绳、索、缆制造', '绳、索、缆制造', 'd60c8fcf069f42f698d11ae47506af4b', 1461518083062722560, 237, NULL, '617032149853180548', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180468', '其他企业管理服务', '其他企业管理服务', 'd623fc33e4684bae9e9c2156e1e6d3ec', 1461518083062722560, 1154, NULL, '617032149848986081', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180469', '金融信托与管理服务', '金融信托与管理服务', 'd63c542220d842d482e107ebfb395b7f', 1461518083062722560, 1124, NULL, '617032149848985934', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180470', '喷枪及类似器具制造', '喷枪及类似器具制造', 'd6b8593a668745ac83e26e298bf07432', 1461518083062722560, 581, NULL, '617032149848986060', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180471', '绿化管理', '绿化管理', 'd6edf1e6e55a458693dd1ff9572a2a43', 1461518083062722560, 1251, NULL, '617032149848985647', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180472', '其他未列明电气机械及器材制造', '其他未列明电气机械及器材制造', 'd710c7c1542548559979bbf37b12fe47', 1461518083062722560, 736, NULL, '617032149853180204', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180473', '机床附件制造', '机床附件制造', 'd72218ae53404417b333d2d8e872a1d5', 1461518083062722560, 557, NULL, '617032149853180035', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180474', '海水养殖', '海水养殖', 'd73c54ad0528485c8edca0745dbec4b6', 1461518083062722560, 64, NULL, '617032149853180567', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180475', '其他未列明商务服务业', '其他未列明商务服务业', 'd75017a567284acc935357756379fc3e', 1461518083062722560, 1186, NULL, '617032149848985748', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180476', '谷物仓储', '谷物仓储', 'd7bc37b40b6c4931a4d9fb8cb5f496ba', 1461518083062722560, 1042, NULL, '617032149853180365', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180477', '皮革、毛皮及其制品加工专用设备制造', '皮革、毛皮及其制品加工专用设备制造', 'd7d4fd457f2344ca84056d0197464f79', 1461518083062722560, 628, NULL, '617032149848985979', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180478', '铁路专用设备及器材、配件制造', '铁路专用设备及器材、配件制造', 'd80b75b41d25488cac7cca3383833ca3', 1461518083062722560, 672, NULL, '617032149853180010', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180479', '彩票活动', '彩票活动', 'd86d42b1a00f42c6a6e2904efe54e5c5', 1461518083062722560, 1380, NULL, '617032149848985787', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180480', '摩托车修理与维护', '摩托车修理与维护', 'd896679dd4f14d6394b95f0048dea78f', 1461518083062722560, 1269, NULL, '617032149853180055', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180481', '特种陶瓷制品制造', '特种陶瓷制品制造', 'd8b720b62c37432cbf71d234bde30636', 1461518083062722560, 467, NULL, '617032149853180183', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180482', '肉、禽类罐头制造', '肉、禽类罐头制造', 'd93d83f676294bc781906ca590d33885', 1461518083062722560, 171, NULL, '617032149853180077', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180483', '建筑用木料及木材组件加工', '建筑用木料及木材组件加工', 'd95784396bde4143b28ab476b62d8015', 1461518083062722560, 277, NULL, '617032149848985649', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180484', '采矿业', '采矿业', 'd974c20c756c4036a1309e5d09e9ffab', 1461518083062722560, 82, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180485', '能源矿产地质勘查', '能源矿产地质勘查', 'd97b5b4d509a4f68b84b5549e960c6f6', 1461518083062722560, 1204, NULL, '617032149848986095', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180486', '建筑、家具用金属配件制造', '建筑、家具用金属配件制造', 'd9c2d52a7352468b94e38d10acc6085c', 1461518083062722560, 525, NULL, '617032149853180356', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180487', '西乐器制造', '西乐器制造', 'da33ce38d14942409f7bc43beea6a0bc', 1461518083062722560, 320, NULL, '617032149853180062', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180488', '环境监测专用仪器仪表制造', '环境监测专用仪器仪表制造', 'da6e48954e0e47c7b2bc0f492f36dbd4', 1461518083062722560, 773, NULL, '617032149848986091', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180489', '风力发电', '风力发电', 'da7c61e949634bb4ab1857eb851d1431', 1461518083062722560, 815, NULL, '617032149848986137', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180490', '铁路旅客运输', '铁路旅客运输', 'db0c1f2d10e04e18bd957bf0dbcfdd0e', 1461518083062722560, 992, NULL, '617032149853180388', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180491', '非货币银行服务', '非货币银行服务', 'db8176d86056497cb391d51ff575ca81', 1461518083062722560, 1094, NULL, '617032149848985996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180492', '供应用仪表及其他通用仪器制造', '供应用仪表及其他通用仪器制造', 'dba9869020844ced9879fd40197bd880', 1461518083062722560, 771, NULL, '617032149853180437', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180493', '石棉、云母矿采选', '石棉、云母矿采选', 'dbe151058b82403f8a3deaf1cfabf594', 1461518083062722560, 122, NULL, '617032149848985724', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180494', '化纤织造加工', '化纤织造加工', 'dbfb0ed22b074139a7460bef1a834009', 1461518083062722560, 224, NULL, '617032149853180186', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180495', '电子元件制造', '电子元件制造', 'dc22550138d34dbabaf1c338b18d8e32', 1461518083062722560, 760, NULL, '617032149848985887', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180496', '合成纤维制造', '合成纤维制造', 'dc2608acc24745618cdf1dc1f346ee05', 1461518083062722560, 407, NULL, '617032149848985833', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180497', '船舶修理', '船舶修理', 'dc29258a5322485bbbf92fc38d850649', 1461518083062722560, 803, NULL, '617032149853180580', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180498', '其他罐头食品制造', '其他罐头食品制造', 'dc365828e0fc42fa85ef5d891f211a7e', 1461518083062722560, 174, NULL, '617032149853180077', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180499', '镁矿采选', '镁矿采选', 'dc5ef9684e184da0b1f0d0b3bdeabb3c', 1461518083062722560, 102, NULL, '617032149853180542', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180500', '贵金属冶炼', '贵金属冶炼', 'dc8e1fdb844d4d368f777b31e3593eb9', 1461518083062722560, 493, NULL, '617032149853180682', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180501', '社会看护与帮助服务', '社会看护与帮助服务', 'dc953ffbfafa461cbb61e0a0beeca1f1', 1461518083062722560, 1338, NULL, '617032149853180170', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180502', '锻件及粉末冶金制品制造', '锻件及粉末冶金制品制造', 'dc9aeee52a1d4e67b205506f409f3448', 1461518083062722560, 541, NULL, '617032149848985919', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180503', '国际组织', '国际组织', 'dd0396744960426ba0ced78a806e2ed3', 1461518083062722560, 1422, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180504', '内燃机及配件制造', '内燃机及配件制造', 'ddb26cb3831c4fa3bb537542097f648b', 1461518083062722560, 547, NULL, '617032149853180597', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180505', '其他文化艺术经纪代理', '其他文化艺术经纪代理', 'ddf3ce0fa10f40d5b2c9c0061c9b89f6', 1461518083062722560, 1384, NULL, '617032149848985815', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180506', '瓶（罐）装饮用水制造', '瓶（罐）装饮用水制造', 'ddf96141f9c942a182c7bcc1673f2dbc', 1461518083062722560, 196, NULL, '617032149853180655', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180507', '石墨及碳素制品制造', '石墨及碳素制品制造', 'de117891c7e54f7ea643785c713abd78', 1461518083062722560, 475, NULL, '617032149848985733', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180508', '其他室内娱乐活动', '其他室内娱乐活动', 'de3793d895084e82a5c8281a740d45a9', 1461518083062722560, 1378, NULL, '617032149848985898', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180509', '集装箱制造', '集装箱制造', 'de3f7a5ca72247af82d53362d876a355', 1461518083062722560, 520, NULL, '617032149848985603', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180510', '食品、酒、饮料及茶生产专用设备制造', '食品、酒、饮料及茶生产专用设备制造', 'de571673e4db49618b5ff01f19ca9f91', 1461518083062722560, 614, NULL, '617032149848985861', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180511', '货摊食品零售', '货摊食品零售', 'de6bfddeee6245ea8814cb924c2192a9', 1461518083062722560, 982, NULL, '617032149853179932', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180512', '花画工艺品制造', '花画工艺品制造', 'dec6cf2ec6a04079bc2f882a44d19215', 1461518083062722560, 327, NULL, '617032149853180408', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180513', '其他人造板制造', '其他人造板制造', 'decff818289b4b84a0d4a4c0c6f0d8ca', 1461518083062722560, 275, NULL, '617032149853180126', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180514', '集成电路制造', '集成电路制造', 'df1eaae88b974640b098cd895709f708', 1461518083062722560, 758, NULL, '617032149853179976', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180515', '电子乐器制造', '电子乐器制造', 'df42202933c34078b2200d0c0fdae295', 1461518083062722560, 321, NULL, '617032149853180062', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180516', '电子测量仪器制造', '电子测量仪器制造', 'df4d0b896de5471396b850a5f6beb837', 1461518083062722560, 780, NULL, '617032149848986091', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180517', '玻璃保温容器制造', '玻璃保温容器制造', 'df7105e39fb84e148983abb78e7239a9', 1461518083062722560, 459, NULL, '617032149853180004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180518', '自行车修理', '自行车修理', 'dfd0478638c144a6b6a1d65f8714fce5', 1461518083062722560, 1278, NULL, '617032149853179939', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180519', '农、林、牧、渔服务业', '农、林、牧、渔服务业', 'e0274cb31c084751a6fe5ca5629964a2', 1461518083062722560, 69, NULL, '617032149848985720', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180520', '有线广播电视传输服务', '有线广播电视传输服务', 'e04f795c609c4795ad7c583ab69fc3dd', 1461518083062722560, 1073, NULL, '617032149853180621', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180521', '其他建筑材料制造', '其他建筑材料制造', 'e0901f40732d4273865f490865ed50d3', 1461518083062722560, 449, NULL, '617032149853179943', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180522', '石油及制品批发', '石油及制品批发', 'e0a4cb2d3ca44920b74df8354aa241e5', 1461518083062722560, 899, NULL, '617032149848985960', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180523', '毛巾类制品制造', '毛巾类制品制造', 'e0fc037e16234ca38999cd7c66de3c84', 1461518083062722560, 232, NULL, '617032149848986173', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180524', '其他电工器材制造', '其他电工器材制造', 'e1392ab8d6e240c49bc48be2afd1ad5d', 1461518083062722560, 713, NULL, '617032149848985875', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180525', '橡胶鞋制造', '橡胶鞋制造', 'e13eb33614484d0ebca3d9c207c9fba8', 1461518083062722560, 263, NULL, '617032149853180366', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180526', '卫生材料及医药用品制造', '卫生材料及医药用品制造', 'e1784ff2d65840599aafc29394164a90', 1461518083062722560, 402, NULL, '617032149853180546', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180527', '人民检察院', '人民检察院', 'e183f028611f436fb7de29c30a916477', 1461518083062722560, 1400, NULL, '617032149848986169', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180528', '疾病预防控制中心', '疾病预防控制中心', 'e1bebeac0730475d8227d5fb3c7f3d53', 1461518083062722560, 1327, NULL, '617032149848986007', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180529', '制糖业', '制糖业', 'e1e325d5d6a24b18963f20c6b0efe72f', 1461518083062722560, 139, NULL, '617032149848986142', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180530', '租赁和商务服务业', '租赁和商务服务业', 'e1e6b0a4b29646b78775f21cc5577e5b', 1461518083062722560, 1136, NULL, '617032149848985766', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180531', '环境污染处理专用药剂材料制造', '环境污染处理专用药剂材料制造', 'e21b8ede1bd04170b66bc088517af26a', 1461518083062722560, 383, NULL, '617032149853180148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180532', '林业', '林业', 'e222f63d0cbe4b659bb50ec78a197c7d', 1461518083062722560, 35, NULL, '617032149848985720', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180533', '炼钢', '炼钢', 'e268ac474641406a885b7919b7997d44', 1461518083062722560, 479, NULL, '617032149853180313', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180534', '其他金属加工机械制造', '其他金属加工机械制造', 'e2996ba573a4420baf27bf0e4cbd9abd', 1461518083062722560, 558, NULL, '617032149853180035', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180535', '建筑装饰业', '建筑装饰业', 'e2d4ba74360841349680a9410b9322eb', 1461518083062722560, 850, NULL, '617032149853180080', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180536', '核辐射加工', '核辐射加工', 'e362587868aa4976a44c8438409067ac', 1461518083062722560, 792, NULL, '617032149848986152', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180537', '日用杂品制造', '日用杂品制造', 'e36b473401e34f57990cf97d36e59196', 1461518083062722560, 788, NULL, '617032149848986152', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180538', '铁路机车车辆配件制造', '铁路机车车辆配件制造', 'e3750f0747f448268c0680f34ebc51d1', 1461518083062722560, 671, NULL, '617032149853180010', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180539', '导航、气象及海洋专用仪器制造', '导航、气象及海洋专用仪器制造', 'e3b65f728ee948bf87dcb4ef110b65dc', 1461518083062722560, 775, NULL, '617032149848986091', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180540', '酒吧服务', '酒吧服务', 'e3b95549526c49588de4605faa8a48a2', 1461518083062722560, 1060, NULL, '617032149853180447', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180541', '其他电信服务', '其他电信服务', 'e3bbb4a7bfcb4680bc7ecac9fe1a2168', 1461518083062722560, 1071, NULL, '617032149853180190', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180542', '常用有色金属矿采选', '常用有色金属矿采选', 'e3e5f433000e4a8582130236036331bf', 1461518083062722560, 95, NULL, '617032149853180305', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180543', '金属工具制造', '金属工具制造', 'e46d02ed330f4a32aeb2acda611aba43', 1461518083062722560, 513, NULL, '617032149853180671', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180544', '口腔清洁用品制造', '口腔清洁用品制造', 'e48880323ac94df5a35c3ab1051edc3b', 1461518083062722560, 392, NULL, '617032149853180268', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180545', '常用有色金属冶炼', '常用有色金属冶炼', 'e49064c7cacb47d19a48b381ffed1a07', 1461518083062722560, 484, NULL, '617032149853180682', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180546', '医药制造业', '医药制造业', 'e4a034315f244268b87181669e0a6580', 1461518083062722560, 395, NULL, '617032149848985918', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180547', '妇幼保健院（所、站）', '妇幼保健院（所、站）', 'e4e947fd64424d8d875c5c17f8e29580', 1461518083062722560, 1325, NULL, '617032149848986007', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180548', '非家用纺织制成品制造', '非家用纺织制成品制造', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 1461518083062722560, 235, NULL, '617032149853180243', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180549', '金融信息服务', '金融信息服务', 'e51ad97577d1461993910fdb489526c7', 1461518083062722560, 1127, NULL, '617032149848985934', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180550', '报纸出版', '报纸出版', 'e52b3f927a7b418e9c244539add333ef', 1461518083062722560, 1345, NULL, '617032149853180002', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180551', '餐饮配送服务', '餐饮配送服务', 'e53cfa37b939479e9a38ece592a0bfcc', 1461518083062722560, 1064, NULL, '617032149848986155', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180552', '钨钼矿采选', '钨钼矿采选', 'e547bc1709c14d2eba48e5e23823f8e7', 1461518083062722560, 109, NULL, '617032149848985812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180553', '地板制造', '地板制造', 'e5d6774cdb184ce38914ecdfe9050a52', 1461518083062722560, 279, NULL, '617032149848985649', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180554', '客运汽车站', '客运汽车站', 'e61bd3626d1144d3961dfc91623f4310', 1461518083062722560, 1007, NULL, '617032149848985664', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180555', '仪器仪表修理', '仪器仪表修理', 'e6461485993b4931bfcf1cf4ece8e00b', 1461518083062722560, 807, NULL, '617032149853180182', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180556', '钟表、眼镜零售', '钟表、眼镜零售', 'e668b95b7ef243dc93af1b080b0cf364', 1461518083062722560, 943, NULL, '617032149848985793', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180557', '航天器制造', '航天器制造', 'e6cda3bcd7a34a3e99ac545b0c391c02', 1461518083062722560, 684, NULL, '617032149848986165', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180558', '炸药及火工产品制造', '炸药及火工产品制造', 'e6d2810ca4524277ae4db0e8db4a8761', 1461518083062722560, 387, NULL, '617032149853180586', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180559', '输配电及控制设备制造', '输配电及控制设备制造', 'e6d81ec118e14452ae27560ad9c35f44', 1461518083062722560, 702, NULL, '617032149848986072', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180560', '金属家具制造', '金属家具制造', 'e6f1c964b92044e0b5851aad332caa19', 1461518083062722560, 290, NULL, '617032149848986116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180561', '录音制作', '录音制作', 'e6f818adf14343428413994a809b6124', 1461518083062722560, 1356, NULL, '617032149848985994', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180562', '草及其他制品制造', '草及其他制品制造', 'e73a93d84c414f2191d89fb3c069f9ca', 1461518083062722560, 286, NULL, '617032149853180690', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180563', '其他家具制造', '其他家具制造', 'e74825a1ee504cc981052f502fe958d1', 1461518083062722560, 292, NULL, '617032149848986116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180564', '日用陶瓷制品制造', '日用陶瓷制品制造', 'e77d62239f224d1e92709bcb3041fa16', 1461518083062722560, 468, NULL, '617032149853180183', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180565', '水利管理业', '水利管理业', 'e792c27ee8404ea6b700ef2a508103b0', 1461518083062722560, 1228, NULL, '617032149853180430', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180566', '其他皮革制品制造', '其他皮革制品制造', 'e7a8b172fb75406c8db8f32c48b803a7', 1461518083062722560, 251, NULL, '617032149853180611', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180567', '水产养殖', '水产养殖', 'e7e6b4bb13f64d21b4c77f127df970d7', 1461518083062722560, 63, NULL, '617032149853180639', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180568', '机械设备、五金产品及电子产品批发', '机械设备、五金产品及电子产品批发', 'e821e1d643de40508001dfe91309f8fd', 1461518083062722560, 907, NULL, '617032149853180199', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180569', '羽毛（绒）制品加工', '羽毛（绒）制品加工', 'e833026ac9cc45259fda55125e7a7116', 1461518083062722560, 258, NULL, '617032149848985708', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180570', '马的饲养', '马的饲养', 'e85f7741d2134c12829d23f2004f01af', 1461518083062722560, 50, NULL, '617032149853180415', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180571', '糖果、巧克力制造', '糖果、巧克力制造', 'e86b2a56795f46528408444c995f6078', 1461518083062722560, 163, NULL, '617032149848986210', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180572', '麻类种植', '麻类种植', 'e8ec6bb4a5f74279875346fa5a3fdfa4', 1461518083062722560, 14, NULL, '617032149853180040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180573', '普通初中教育', '普通初中教育', 'ea7934ea64224ae4a75daf3126fab4f1', 1461518083062722560, 1294, NULL, '617032149848985796', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180574', '电子出版物出版', '电子出版物出版', 'ea805965407c4387929ffdf4e35b1b25', 1461518083062722560, 1348, NULL, '617032149853180002', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180575', '镍钴矿采选', '镍钴矿采选', 'ea90a39bcfef42c9ae38b7711fb22566', 1461518083062722560, 98, NULL, '617032149853180542', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180576', '电光源制造', '电光源制造', 'ead352e96e434738a95cc7acc0152ad6', 1461518083062722560, 731, NULL, '617032149848985621', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180577', '航空、航天相关设备制造', '航空、航天相关设备制造', 'ead6a9a975d74f95a8bc5cc9be791669', 1461518083062722560, 685, NULL, '617032149848986165', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180578', '方便食品制造', '方便食品制造', 'eae71131d4e64599b3c04654b478073e', 1461518083062722560, 165, NULL, '617032149853180332', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180579', '玻璃纤维和玻璃纤维增强塑料制品制造', '玻璃纤维和玻璃纤维增强塑料制品制造', 'eb2bead065184cf19e67349e3cc301ca', 1461518083062722560, 462, NULL, '617032149848986172', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180580', '铁路、船舶、航空航天等运输设备修理', '铁路、船舶、航空航天等运输设备修理', 'eb874e229b154ae8b8db2ed8a5bd965f', 1461518083062722560, 801, NULL, '617032149853180182', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180581', '轴承制造', '轴承制造', 'ebabfe380aab4b1ba376ab477416c851', 1461518083062722560, 572, NULL, '617032149848985838', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180582', '鞋和皮革修理', '鞋和皮革修理', 'ebc8be7d2e8e49a2aaf2d645c179b186', 1461518083062722560, 1279, NULL, '617032149853179939', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180583', '证券经纪交易服务', '证券经纪交易服务', 'ebd4c97cfdd74defa2a1320e462f99a4', 1461518083062722560, 1103, NULL, '617032149853179927', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180584', '节能技术推广服务', '节能技术推广服务', 'ebdab3dd7b054281b99ac3f233860295', 1461518083062722560, 1223, NULL, '617032149848985646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180585', '黑色金属铸造', '黑色金属铸造', 'ec236b7e6ef847eab841d2cf010b40ff', 1461518083062722560, 480, NULL, '617032149853180313', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180586', '炸药、火工及焰火产品制造', '炸药、火工及焰火产品制造', 'ecd416806da0431c909e98e8f3bffd4f', 1461518083062722560, 386, NULL, '617032149853180346', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180587', '医疗用品及器材批发', '医疗用品及器材批发', 'ecead1b2046e4707afd288426339d39a', 1461518083062722560, 896, NULL, '617032149848986140', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180588', '对外事务管理机构', '对外事务管理机构', 'ecee10208d2a4923a15aa20110bf91a6', 1461518083062722560, 1393, NULL, '617032149853180686', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180589', '家用电力器具制造', '家用电力器具制造', 'ecf22c328f394eeaa42105e5801a4f75', 1461518083062722560, 718, NULL, '617032149848986072', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180590', '航空运输辅助活动', '航空运输辅助活动', 'ed3a0d30eeac49ff8a4cdcd53d6e5c2b', 1461518083062722560, 1028, NULL, '617032149848985927', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180591', '黄酒制造', '黄酒制造', 'ed3f49e693d0463f80ae0031b66d504e', 1461518083062722560, 191, NULL, '617032149853180648', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180592', '其他电子设备制造', '其他电子设备制造', 'ed5e2a884d7f44d2855775e47831449f', 1461518083062722560, 763, NULL, '617032149848985887', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180593', '模具制造', '模具制造', 'ed6f4e9f2477409da1beda527f2ff24d', 1461518083062722560, 611, NULL, '617032149848985843', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180594', '拖拉机制造', '拖拉机制造', 'edbb7446f7a8426286f85b28bff99de2', 1461518083062722560, 635, NULL, '617032149853180117', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180595', '森林防火服务', '森林防火服务', 'ee8078cfcb0544549cba3907b82c4fc4', 1461518083062722560, 77, NULL, '617032149853179959', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180596', '淀粉及淀粉制品制造', '淀粉及淀粉制品制造', 'eea11ab16ffe48bab6b8cd1fb0c8be6e', 1461518083062722560, 154, NULL, '617032149853180213', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180597', '锅炉及原动设备制造', '锅炉及原动设备制造', 'eeb06ef1eabf45dc9214022934a5ad13', 1461518083062722560, 545, NULL, '617032149848985767', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180598', '专业技术服务业', '专业技术服务业', 'ef8532cb75574d1e89d50b62cfc96d92', 1461518083062722560, 1194, NULL, '617032149848985642', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180599', '谷物种植', '谷物种植', 'efd3cd9b3fc745ca949140f3f401446e', 1461518083062722560, 3, NULL, '617032149853180245', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180600', '固体饮料制造', '固体饮料制造', 'f00f33731f5c4479b30cd83db6d8ef6f', 1461518083062722560, 199, NULL, '617032149853180655', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180601', '纺织专用设备制造', '纺织专用设备制造', 'f037a460330848f7a906829443e2d801', 1461518083062722560, 627, NULL, '617032149848985979', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180602', '窗帘、布艺类产品制造', '窗帘、布艺类产品制造', 'f082027e259949c4b0243d29aadc4a56', 1461518083062722560, 233, NULL, '617032149848986173', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180603', '包装服务', '包装服务', 'f082abeb13924215b46a1d55e35c2629', 1461518083062722560, 1182, NULL, '617032149848985748', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180604', '广播', '广播', 'f0b46455403b41e5bbb4d2863a022369', 1461518083062722560, 1351, NULL, '617032149848985994', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180605', '医疗诊断、监护及治疗设备制造', '医疗诊断、监护及治疗设备制造', 'f0ec1cd3fee44084bad24dfea2faa8f3', 1461518083062722560, 644, NULL, '617032149853180259', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180606', '豆类种植', '豆类种植', 'f10c0a915cbf45cd8a9919dd5279a372', 1461518083062722560, 9, NULL, '617032149848986096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180607', '其他稀有金属矿采选', '其他稀有金属矿采选', 'f10efde4f65542498f1b97a6882ae827', 1461518083062722560, 112, NULL, '617032149848985812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180608', '其他自然保护', '其他自然保护', 'f13cdee031a943ca8f9d0fc948a46d71', 1461518083062722560, 1239, NULL, '617032149848985893', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180609', '其他非金属矿物制品制造', '其他非金属矿物制品制造', 'f15df6f38b7744db96f0d84f1053ebaf', 1461518083062722560, 476, NULL, '617032149848985733', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180610', '生物药品制造', '生物药品制造', 'f163cfe0882c48f5a0c077e9c7c8911f', 1461518083062722560, 401, NULL, '617032149853180546', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180611', '皮革制品制造', '皮革制品制造', 'f1a4f35774454eba9c9613fab6dfb3a1', 1461518083062722560, 247, NULL, '617032149848985970', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180612', '微电机及其他电机制造', '微电机及其他电机制造', 'f1b170d3fbec409bbf9fc6cdc6d95bfe', 1461518083062722560, 701, NULL, '617032149853179971', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180613', '搪瓷制品制造', '搪瓷制品制造', 'f1cc0d5ef61e42f6a7dc652cf650b5eb', 1461518083062722560, 530, NULL, '617032149853180671', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180614', '固体矿产地质勘查', '固体矿产地质勘查', 'f1e4aba3c7fe4d8abe12a4cb0a716995', 1461518083062722560, 1205, NULL, '617032149848986095', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180615', '互联网和相关服务', '互联网和相关服务', 'f23500ffa36f47dda2908527522317f5', 1461518083062722560, 1076, NULL, '617032149853180154', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180616', '木材加工机械制造', '木材加工机械制造', 'f27972803fad4c68856b4e16c9ffecbf', 1461518083062722560, 610, NULL, '617032149848985843', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180617', '森林经营和管护', '森林经营和管护', 'f298a6278cfb45b7a8e4ffe929c7e754', 1461518083062722560, 40, NULL, '617032149853180532', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180618', '稀有稀土金属压延加工', '稀有稀土金属压延加工', 'f2bbbf161fba45d28d17fa1178a654cb', 1461518083062722560, 507, NULL, '617032149853180019', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180619', '水的生产和供应业', '水的生产和供应业', 'f2dddd6c1808403185f836583368d9b7', 1461518083062722560, 822, NULL, '617032149848985973', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180620', '人身保险', '人身保险', 'f315a33e96664b5a8b8a8d1e74bacf72', 1461518083062722560, 1112, NULL, '617032149853180112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180621', '广播电视传输服务', '广播电视传输服务', 'f3260d4f0e554e7dabc3d81e4b13a42e', 1461518083062722560, 1072, NULL, '617032149848985948', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180622', '涂料制造', '涂料制造', 'f3397b6975054c019bb446c7571ea125', 1461518083062722560, 368, NULL, '617032149853180272', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180623', '其他未列明制造业', '其他未列明制造业', 'f33e790e738b4f49bd1be6bf8272fd46', 1461518083062722560, 793, NULL, '617032149848986152', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180624', '幻灯及投影设备制造', '幻灯及投影设备制造', 'f35d385b21864cdd937a7b4775e2ae40', 1461518083062722560, 586, NULL, '617032149848985825', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180625', '邮政基本服务', '邮政基本服务', 'f363863325674ba297644b0b91b277b8', 1461518083062722560, 1047, NULL, '617032149848985652', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180626', '金属丝绳及其制品制造', '金属丝绳及其制品制造', 'f371d8b8442246a0a0c970b7e44912e7', 1461518083062722560, 523, NULL, '617032149853180671', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180627', '卫生洁具零售', '卫生洁具零售', 'f3819daef529413c94e3ea85f6ac27c8', 1461518083062722560, 977, NULL, '617032149853180139', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180628', '客运火车站', '客运火车站', 'f3a1a536d7b04f32a983ad89a38326f5', 1461518083062722560, 995, NULL, '617032149853180018', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180629', '再保险', '再保险', 'f3c390fdcae2443ea65e453fdee97827', 1461518083062722560, 1116, NULL, '617032149853180112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180630', '娱乐船和运动船制造', '娱乐船和运动船制造', 'f3cec56894d542dc9fb92edb50f748c5', 1461518083062722560, 678, NULL, '617032149853180129', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180631', '床上用品制造', '床上用品制造', 'f43139fd254a4a078b86f8cceb6574ff', 1461518083062722560, 231, NULL, '617032149848986173', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180632', '家用电力器具专用配件制造', '家用电力器具专用配件制造', 'f4857f8c5ee1447a9ea98466762f6bae', 1461518083062722560, 725, NULL, '617032149853180589', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180633', '建材批发', '建材批发', 'f4f50ca42e784bfaaf36d0bf7ec1830d', 1461518083062722560, 902, NULL, '617032149848985960', 0, '1');
INSERT INTO `jvs_tree` VALUES ('617032149853180634', '烟草种植', '烟草种植', 'f570ed680fb74edc87290c79458e5d93', 1461518083062722560, 16, NULL, '617032149853180040', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180635', '其他化工产品批发', '其他化工产品批发', 'f58c5513d4a441efabd2e60a2e14661c', 1461518083062722560, 906, NULL, '617032149848985960', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180636', '变压器、整流器和电感器制造', '变压器、整流器和电感器制造', 'f5a2f7f3385a4c49812f4115ace7af3b', 1461518083062722560, 703, NULL, '617032149853180559', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180637', '石油和天然气开采业', '石油和天然气开采业', 'f5b88214f5184db3a6d8bcced3d91ad7', 1461518083062722560, 87, NULL, '617032149853180484', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180638', '其他调味品、发酵制品制造', '其他调味品、发酵制品制造', 'f5ba54465a8a47e5bf3a270864fdf386', 1461518083062722560, 178, NULL, '617032149853180666', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180639', '渔业', '渔业', 'f5c88e85ebeb40b5b705d0a15fc42924', 1461518083062722560, 62, NULL, '617032149848985720', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180640', '精炼石油产品制造', '精炼石油产品制造', 'f60f3ba8db444b7da5a8bb48b1b38978', 1461518083062722560, 345, NULL, '617032149853180235', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180641', '农业机械批发', '农业机械批发', 'f63e54fc595b4f26ae1ccd9c136db1b0', 1461518083062722560, 908, NULL, '617032149853180568', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180642', '证券市场管理服务', '证券市场管理服务', 'f6404f2d7af94e23aea5f04d4b3e7ccd', 1461518083062722560, 1102, NULL, '617032149853179927', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180643', '水上货物运输', '水上货物运输', 'f686b1e78ecb4b0d91fbfd2a1a605018', 1461518083062722560, 1015, NULL, '617032149853180293', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180644', '试验机制造', '试验机制造', 'f6a827f34ea94491842392d2dd063f92', 1461518083062722560, 770, NULL, '617032149853180437', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180645', '其他食品制造', '其他食品制造', 'f6c96d4d4a84467a99e973b643e6651e', 1461518083062722560, 179, NULL, '617032149853180332', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180646', '居民服务业', '居民服务业', 'f6d5e5bb19ec486ba11a1afb7838a36b', 1461518083062722560, 1256, NULL, '617032149853180396', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180647', '非金属船舶制造', '非金属船舶制造', 'f6ee83eb8d7c4c8695b5c26ee7251bff', 1461518083062722560, 677, NULL, '617032149853180129', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180648', '酒的制造', '酒的制造', 'f6f9e986c5a64965b65cc4b7569d7949', 1461518083062722560, 187, NULL, '617032149848986011', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180649', '轻质建筑材料制造', '轻质建筑材料制造', 'f700945cef6f4537abafc7f51b7c5824', 1461518083062722560, 441, NULL, '617032149848985781', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180650', '门诊部（所）', '门诊部（所）', 'f70c2d03a70d4d43b7b3c4bbf44fd353', 1461518083062722560, 1323, NULL, '617032149848986007', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180651', '玻璃纤维及制品制造', '玻璃纤维及制品制造', 'f714090565b44222858e2d4b87ff3bbb', 1461518083062722560, 463, NULL, '617032149853180579', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180652', '音像制品出租', '音像制品出租', 'f73817bf67a44602a380d2874090ef6f', 1461518083062722560, 1147, NULL, '617032149848985880', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180653', '结构性金属制品制造', '结构性金属制品制造', 'f74e5170fd574a4fba166abdba4e1d75', 1461518083062722560, 510, NULL, '617032149853180671', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180654', '其他采矿业', '其他采矿业', 'f7537336d12f49f5b9b6a66d9437bbdc', 1461518083062722560, 130, NULL, '617032149853180484', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180655', '饮料制造', '饮料制造', 'f77c488fca9e415bb74990de42777f54', 1461518083062722560, 194, NULL, '617032149848986011', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180656', '合成材料制造', '合成材料制造', 'f7a803f3d94a4c97a9d7a53b720aaddc', 1461518083062722560, 373, NULL, '617032149853180346', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180657', '宗教组织', '宗教组织', 'f7b66837beea4d1db16bea2b7b9a01c4', 1461518083062722560, 1418, NULL, '617032149848986097', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180658', '城乡市容管理', '城乡市容管理', 'f7f7d2408f6d417ea7746c4b16346327', 1461518083062722560, 1250, NULL, '617032149848985647', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180659', '味精制造', '味精制造', 'f8587a35bdea42948e74ac7d30f8d488', 1461518083062722560, 176, NULL, '617032149853180666', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180660', '计算机及通讯设备租赁', '计算机及通讯设备租赁', 'f869025dc61843ca838794872e9aa86f', 1461518083062722560, 1142, NULL, '617032149853180084', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180661', '计算机制造', '计算机制造', 'f8f60b812bca4c15ac143f477661ba23', 1461518083062722560, 738, NULL, '617032149848985887', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180662', '装订及印刷相关服务', '装订及印刷相关服务', 'f934d3606b33452988be7ba39611d19e', 1461518083062722560, 309, NULL, '617032149853180089', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180663', '图书批发', '图书批发', 'f96fc757dc42400da64763438e7d2327', 1461518083062722560, 888, NULL, '617032149853180282', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180664', '煤制品制造', '煤制品制造', 'f99124c9cfe6418dbdcfbf49b2b252a3', 1461518083062722560, 791, NULL, '617032149848986152', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180665', '竹材采运', '竹材采运', 'f9a7b57c124f4523b1ea5ffeec9470b2', 1461518083062722560, 43, NULL, '617032149848986036', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180666', '调味品、发酵制品制造', '调味品、发酵制品制造', 'f9dd72346d594ba1aa1468374485baf7', 1461518083062722560, 175, NULL, '617032149853180332', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180667', '石油和天然气开采辅助活动', '石油和天然气开采辅助活动', 'fa79e6c6fbe449eaa77c9994b7e15b18', 1461518083062722560, 128, NULL, '617032149848985972', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180668', '其他电池制造', '其他电池制造', 'fab1bfdecc2d4dc7982f0bd1e19a0cd3', 1461518083062722560, 717, NULL, '617032149848985969', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180669', '物业管理', '物业管理', 'fad6a7e804b54c91a4986e259307fd22', 1461518083062722560, 1132, NULL, '617032149853180273', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180670', '正餐服务', '正餐服务', 'fada5400b4ff44439d7ae64e6dc68ae9', 1461518083062722560, 1055, NULL, '617032149853180287', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180671', '金属制品业', '金属制品业', 'fb030bf0f03346d09a84b55753afc762', 1461518083062722560, 509, NULL, '617032149848985918', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180672', '新闻和出版业', '新闻和出版业', 'fb2f0ae09e894c0d8ed893878ac111ac', 1461518083062722560, 1341, NULL, '617032149848986082', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180673', '铁路、船舶、航空航天和其他运输设备制造业', '铁路、船舶、航空航天和其他运输设备制造业', 'fc02edb12dd7437e92f93a88c15e2702', 1461518083062722560, 667, NULL, '617032149848985918', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180674', '社会经济咨询', '社会经济咨询', 'fc63b303f8ff4911b5abb48925cd85c4', 1461518083062722560, 1162, NULL, '617032149853180144', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180675', '化妆品及卫生用品零售', '化妆品及卫生用品零售', 'fc99895ae4c04e3c84d12316019be082', 1461518083062722560, 942, NULL, '617032149848985793', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180676', '农用及园林用金属工具制造', '农用及园林用金属工具制造', 'fcebd9020bdd417984358f7f8ada6592', 1461518083062722560, 516, NULL, '617032149853180543', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180677', '其他未列明非金属矿采选', '其他未列明非金属矿采选', 'fd6d54ee825f4efd904cc919729edb02', 1461518083062722560, 125, NULL, '617032149848985724', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180678', '电视机制造', '电视机制造', 'fd85c4bf070348b49147009179252b9a', 1461518083062722560, 752, NULL, '617032149848985699', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180679', '印刷', '印刷', 'fda69d6ec01941ab8f44bdda8eeb3402', 1461518083062722560, 305, NULL, '617032149853180089', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180680', '人力资源服务', '人力资源服务', 'fdd9cb4ea4a4478285b5deadde6900b9', 1461518083062722560, 1166, NULL, '617032149848985773', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180681', '粘土砖瓦及建筑砌块制造', '粘土砖瓦及建筑砌块制造', 'fddede0df9ec42fd8676c1d521bcc87d', 1461518083062722560, 444, NULL, '617032149853179943', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180682', '有色金属冶炼和压延加工业', '有色金属冶炼和压延加工业', 'fe277f2855704704a0562cc62cff05ac', 1461518083062722560, 483, NULL, '617032149848985918', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180683', '资本市场服务', '资本市场服务', 'fe3e3e4436c9442eae431f53420dde54', 1461518083062722560, 1100, NULL, '617032149853180208', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180684', '再生物资回收与批发', '再生物资回收与批发', 'fe50eb2a87044dc2808bc0de7fb4f482', 1461518083062722560, 922, NULL, '617032149853180009', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180685', '音像制品出版', '音像制品出版', 'fe6071f3159a4791b392ff28d026d99b', 1461518083062722560, 1347, NULL, '617032149853180002', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180686', '国家行政机构', '国家行政机构', 'feeac738e0214b64869a7e61bbf2505c', 1461518083062722560, 1391, NULL, '617032149848985906', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180687', '气体压缩机械制造', '气体压缩机械制造', 'ff465ca6b2fd4769a17514d55bd520fb', 1461518083062722560, 568, NULL, '617032149848986145', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180688', '工会', '工会', 'ff673b40cf374e62b8223c8894474d9e', 1461518083062722560, 1409, NULL, '617032149853180288', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180689', '化学矿开采', '化学矿开采', 'ffbefe8a7f7f425c966fca8eed96942d', 1461518083062722560, 119, NULL, '617032149848985947', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('617032149853180690', '竹、藤、棕、草等制品制造', '竹、藤、棕、草等制品制造', 'ffbf154fce954e5a83fdf7c1ca00f8ba', 1461518083062722560, 282, NULL, '617032149848985974', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('618b46a419ad351464da9b53137820b3', '锂离子电池制造', '锂离子电池制造', '1536307437964701984', 1461518083062722560, 715, '', '1536307437964701980', 0, '1');
INSERT INTO `jvs_tree` VALUES ('61c5ac332567456ca78da58904d39606', '烟草制品业', '烟草制品业', '61c5ac332567456ca78da58904d39606', 1461518083062722560, 202, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('623299992df24d2a80a2bd611558f27e', '其他制造业', '其他制造业', '623299992df24d2a80a2bd611558f27e', 1461518083062722560, 787, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('625a69df0c304c27b1c479b1c4a6bf47', '国际组织', '国际组织', '625a69df0c304c27b1c479b1c4a6bf47', 1461518083062722560, 1423, '', 'dd0396744960426ba0ced78a806e2ed3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('627067c97848b5e865a2e8c4158220e0', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536311398968930450', 1461518083062722560, 1190, '', '1536311398968930446', 0, '1');
INSERT INTO `jvs_tree` VALUES ('62712551c51b7f7b82d16544463b03e8', '农副食品加工业', '农副食品加工业', '1536307437964701704', 1461518083062722560, 133, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('62847461009f43eb9b7568826faa23bb', '天然水收集与分配', '天然水收集与分配', '62847461009f43eb9b7568826faa23bb', 1461518083062722560, 1231, '', 'e792c27ee8404ea6b700ef2a508103b0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('62af44e381044e2cba12bffa1e0b47ec', '其他餐饮业', '其他餐饮业', '62af44e381044e2cba12bffa1e0b47ec', 1461518083062722560, 1062, '', 'b7677f90d185460a8e7dea5ad7a69354', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('62b2e50428ff2c2a19a5d35f6541788d', '汽车车身、挂车制造', '汽车车身、挂车制造', '1536311398968930338', 1461518083062722560, 665, '', '1536311398968930322', 0, '1');
INSERT INTO `jvs_tree` VALUES ('62ce2c6d30011e6b485f91cfbc49a629', '科学研究和技术服务业', '科学研究和技术服务业', '1536310379493011739', 1461518083062722560, 1187, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('62d03e9231d641d2a5fd2297f64d146c', '无机盐制造', '无机盐制造', '62d03e9231d641d2a5fd2297f64d146c', 1461518083062722560, 354, '', '91dc97eb105d4ba29bbf67a3eee45596', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('62e7ab2d8e6e4d378a5e364e02b7262e', '包装装潢及其他印刷', '包装装潢及其他印刷', '62e7ab2d8e6e4d378a5e364e02b7262e', 1461518083062722560, 308, '', 'fda69d6ec01941ab8f44bdda8eeb3402', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('62fd56a294074bdcf510171205720b0c', '其他仪器仪表制造业', '其他仪器仪表制造业', '1536307437964702048', 1461518083062722560, 786, '', '1536307437964702016', 0, '1');
INSERT INTO `jvs_tree` VALUES ('633b3b2756054ab8bc3fdc6c5afa81b3', '其他未列明批发业', '其他未列明批发业', '633b3b2756054ab8bc3fdc6c5afa81b3', 1461518083062722560, 923, '', '80c70ebf068e476ab81172056022e17e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('63464d13cb7646fdb4a7d0234293f003', '电子游艺厅娱乐活动', '电子游艺厅娱乐活动', '63464d13cb7646fdb4a7d0234293f003', 1461518083062722560, 1376, '', '367085faa6ce4b71b269b4adf385b76e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('63570f41698445598fcaf1285b2abde3', '复混肥料制造', '复混肥料制造', '63570f41698445598fcaf1285b2abde3', 1461518083062722560, 361, '', '10f07810f0d947289092d4489bea5968', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('63634eae85187ee7a6beb584ba6c9631', '包装专用设备制造', '包装专用设备制造', '1536307437964701864', 1461518083062722560, 583, '', '1536307437964701844', 0, '1');
INSERT INTO `jvs_tree` VALUES ('637da64fd67547e9a5c0a9b17ac28832', '针织或钩针编织品制造', '针织或钩针编织品制造', '637da64fd67547e9a5c0a9b17ac28832', 1461518083062722560, 229, '', '076cfbad4a3b4762936bf7d9336715f9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6388e40f23c9348710f0eacf6d90eb54', '农副食品加工业', '农副食品加工业', '1536310379488817160', 1461518083062722560, 133, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('638ada7c53904a9dabd75507752f9702', '船舶改装与拆除', '船舶改装与拆除', '638ada7c53904a9dabd75507752f9702', 1461518083062722560, 680, '', '98490bfbacce404285880451a06a29fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('63a80ad718d94f20b759cd39aa6abe1b', '质检技术服务', '质检技术服务', '63a80ad718d94f20b759cd39aa6abe1b', 1461518083062722560, 1199, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('63bac92c710f4f41b523d4a5c62297a2', '货运港口', '货运港口', '63bac92c710f4f41b523d4a5c62297a2', 1461518083062722560, 1021, '', '4a35af8714dc4478b013db7e2bea5c33', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('63c782a68b2d4768b625fb2673c9b222', '航空、航天器及设备制造', '航空、航天器及设备制造', '63c782a68b2d4768b625fb2673c9b222', 1461518083062722560, 682, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('647459b456304c9bb3a5f21001b3580b', '其他电力生产', '其他电力生产', '647459b456304c9bb3a5f21001b3580b', 1461518083062722560, 817, '', '5ecd006a532c49b6b294f268e35f4fa1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('647c196eaba7a7bf7e93f0cecbc1679b', '研究和试验发展', '研究和试验发展', '1536311398968930446', 1461518083062722560, 1188, '', '1536311398968930442', 0, '1');
INSERT INTO `jvs_tree` VALUES ('647db458b91c47d7b8de46696291aa4b', '其他工程准备活动', '其他工程准备活动', '647db458b91c47d7b8de46696291aa4b', 1461518083062722560, 853, '', '17fd8b163a6749a48002036d0684caa1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('64a23887de94a4ba45d14b2970977f52', '电影放映', '电影放映', '1536311398968930502', 1461518083062722560, 1355, '', '1536311398968930494', 0, '1');
INSERT INTO `jvs_tree` VALUES ('64e780e796484393bc66fc7de995021f', '燃气生产和供应业', '燃气生产和供应业', '64e780e796484393bc66fc7de995021f', 1461518083062722560, 821, '', '3a55ce58d13f426cae230c558412a795', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('64eeae61e71b57ba6e06be96c4a806b2', '中西医结合医院', '中西医结合医院', '1536307437964702096', 1461518083062722560, 1315, '', '1536307437964702088', 0, '1');
INSERT INTO `jvs_tree` VALUES ('64f96eb5bcbf434a8dad552b0bdc856e', '人民法院和人民检察院', '人民法院和人民检察院', '64f96eb5bcbf434a8dad552b0bdc856e', 1461518083062722560, 1398, '', '37a6e6dc44a84c4ebcba0085e1d2420b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('651147f68bfe818023a8f2adc6381647', '塑料家具制造', '塑料家具制造', '1536294082927472694', 1461518083062722560, 291, '', '1536294082927472682', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6512291f5987437fa04b6d3cb1698d12', '漆器工艺品制造', '漆器工艺品制造', '6512291f5987437fa04b6d3cb1698d12', 1461518083062722560, 326, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6521876efc477e33dbe6cf422266d914', '饲料加工', '饲料加工', NULL, 1461518083062722560, 135, '', '1536282904184545280', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6524ba4674064eba8513425ce19b9213', '橡胶板、管、带制造', '橡胶板、管、带制造', '6524ba4674064eba8513425ce19b9213', 1461518083062722560, 418, '', '242dd78213414f0f9c3ac611b510ec7e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6552f5230d9d57cdaca1ae44051826ab', '改装汽车制造', '改装汽车制造', '1536307437964701952', 1461518083062722560, 662, '', '1536307437964701948', 0, '1');
INSERT INTO `jvs_tree` VALUES ('65a7ae426d7748eaade5fc8a25a5d23c', '非金属矿物制品业', '非金属矿物制品业', '65a7ae426d7748eaade5fc8a25a5d23c', 1461518083062722560, 433, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('65b1efb0ed234319ba2d96b04df0cfbf', '家用纺织制成品制造', '家用纺织制成品制造', '65b1efb0ed234319ba2d96b04df0cfbf', 1461518083062722560, 230, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('65d8d53a969c457f90a7b1de35a45e17', '电子真空器件制造', '电子真空器件制造', '65d8d53a969c457f90a7b1de35a45e17', 1461518083062722560, 756, '', '7b5fc101b3194fbe909a9bbbd7fda9ce', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('65dca476f52f4b5506933e6e3cdb5758', '制冷、空调设备制造', '制冷、空调设备制造', '1536310379493011527', 1461518083062722560, 579, '', '1536310379493011515', 0, '1');
INSERT INTO `jvs_tree` VALUES ('660fa28e432b43d1b3475ed03d108aa5', '金属制卫生器具制造', '金属制卫生器具制造', '660fa28e432b43d1b3475ed03d108aa5', 1461518083062722560, 538, '', '46922c9d081a4bd2a30860d15b5837ab', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6623d1e26d03487696bbd079c120a880', '竹制品制造', '竹制品制造', '6623d1e26d03487696bbd079c120a880', 1461518083062722560, 283, '', 'ffbf154fce954e5a83fdf7c1ca00f8ba', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('663eefddcb9b41ac98cfee68e21a9561', '纺织品及针织品零售', '纺织品及针织品零售', '663eefddcb9b41ac98cfee68e21a9561', 1461518083062722560, 939, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6644d9333c8b89ebcd9df6d033e4d9fe', '其他非金属加工专用设备制造', '其他非金属加工专用设备制造', '1536294082927472818', 1461518083062722560, 612, '', '1536294082927472806', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6658b16e6cae4e1f939efd2a072d9298', '普通高中教育', '普通高中教育', '6658b16e6cae4e1f939efd2a072d9298', 1461518083062722560, 1297, '', '204b9cd5e13545bdaad5a9f781515930', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66a09b824dadfa854df234c7c3bdb190', '连续搬运设备制造', '连续搬运设备制造', '1536307437964701816', 1461518083062722560, 563, '', '1536307437964701812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('66a9b664f22a4c0eabd54d48bd052ab7', '电容器及其配套设备制造', '电容器及其配套设备制造', '66a9b664f22a4c0eabd54d48bd052ab7', 1461518083062722560, 704, '', 'e6d81ec118e14452ae27560ad9c35f44', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66aaa3ce1dbb434fa31c83de9424931e', '绝缘制品制造', '绝缘制品制造', '66aaa3ce1dbb434fa31c83de9424931e', 1461518083062722560, 712, '', '31a17bcb9cf24935a1052bbc68fa9d07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66ab955ca2264302a87ceb06ab070616', '石灰石、石膏开采', '石灰石、石膏开采', '66ab955ca2264302a87ceb06ab070616', 1461518083062722560, 115, '', '338fddda90714633a35486487f31961e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66b287251733487c83581c9c3a66fab5', '航空旅客运输', '航空旅客运输', '66b287251733487c83581c9c3a66fab5', 1461518083062722560, 1025, '', '1611b23fc7984c5fa508984e2aa3889d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66b2c24fecfd4459b8da087a21ff6156', '人民政协、民主党派', '人民政协、民主党派', '66b2c24fecfd4459b8da087a21ff6156', 1461518083062722560, 1402, '', '947e0f87323b430ea5d5c7689ab006cf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66c1720a4a4c688394a9a4829a19cf37', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536310830305193988', 1461518083062722560, 1190, '', '1536310830305193984', 0, '1');
INSERT INTO `jvs_tree` VALUES ('66c44ad92f454958bed23351116b07a4', '科技推广和应用服务业', '科技推广和应用服务业', '66c44ad92f454958bed23351116b07a4', 1461518083062722560, 1218, '', '0835d6af067244cdbd679abb37910c37', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('66dad707839f4c0090ed2f7ec7f10d2b', '薯类种植', '薯类种植', '66dad707839f4c0090ed2f7ec7f10d2b', 1461518083062722560, 11, '', '5945424b0827482ca25284bb80b7fdc0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('67109d2aee85416caecd441d8ac7c125', '普通小学教育', '普通小学教育', '67109d2aee85416caecd441d8ac7c125', 1461518083062722560, 1291, '', '850c835c54ee4939a082219ee49d6fb2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6716e7c5bbb2cf9b06d1ab686a908dba', '仪器仪表制造业', '仪器仪表制造业', '1536307437964702016', 1461518083062722560, 764, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('671f8be8990e07df7896562ed8cd8e6b', '木制品制造', '木制品制造', '1536310379488817216', 1461518083062722560, 276, '', '1536310379488817192', 0, '1');
INSERT INTO `jvs_tree` VALUES ('67732a13c38a45bfa9c698bc2d14996c', '其他清洁服务', '其他清洁服务', '67732a13c38a45bfa9c698bc2d14996c', 1461518083062722560, 1285, '', '07ffe97b533243538d9e58edb4ffe7a6', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('679122a19bff4e2ab3c415f863f0e72a', '其他未列明建筑业', '其他未列明建筑业', '679122a19bff4e2ab3c415f863f0e72a', 1461518083062722560, 855, '', '8ed66bafdee04fd781dc83a103dcc577', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('67b1b253f9034d62ba932d49e64e39f3', '西药批发', '西药批发', '67b1b253f9034d62ba932d49e64e39f3', 1461518083062722560, 894, '', '5ef0d34da8ea4f35a71a790414db8990', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('67d00869b0bd4ff38ff67ed4b69034c8', '托儿所服务', '托儿所服务', '67d00869b0bd4ff38ff67ed4b69034c8', 1461518083062722560, 1258, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('67e13889ba7b8c2128d4855dbb71ad7d', '羽毛(绒)加工及制品制造', '羽毛(绒)加工及制品制造', '1536307437964701728', 1461518083062722560, 256, '', '1536307437964701724', 0, '1');
INSERT INTO `jvs_tree` VALUES ('680f9d7b88ec4a5183de1b82fa721cb2', '玻璃包装容器制造', '玻璃包装容器制造', '680f9d7b88ec4a5183de1b82fa721cb2', 1461518083062722560, 458, '', '7f127fa7b9644592b4899ee6820f5647', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('681a914eff7f485591ec36afb0e36648', '金融租赁服务', '金融租赁服务', '681a914eff7f485591ec36afb0e36648', 1461518083062722560, 1095, '', 'db8176d86056497cb391d51ff575ca81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6856f2e74f754b35a433a8238d379b63', '自有房地产经营活动', '自有房地产经营活动', '6856f2e74f754b35a433a8238d379b63', 1461518083062722560, 1134, '', 'b58bd9253692458cbbfdf0e589c39e11', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6859715cbc1741d39fc0001829b6ffdf', '机织服装制造', '机织服装制造', '6859715cbc1741d39fc0001829b6ffdf', 1461518083062722560, 242, '', '5ed90afabfb749a381d0b606031f88d5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('689224a62a424f1f7ee81f5af30c7790', '通信设备制造', '通信设备制造', '1536311398968930374', 1461518083062722560, 743, '', '1536311398968930370', 0, '1');
INSERT INTO `jvs_tree` VALUES ('68b058d94e8f5708fe93a313d678d387', '文化、体育和娱乐业', '文化、体育和娱乐业', '1536310379493011787', 1461518083062722560, 1340, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('68c4c0c44d72eb2413d7227e843ec66c', '皮革、毛皮、羽毛及其制品和制鞋业', '皮革、毛皮、羽毛及其制品和制鞋业', '1536310379488817180', 1461518083062722560, 245, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('68ef4638b0d24363915874284db41bf9', '乡镇卫生院', '乡镇卫生院', '68ef4638b0d24363915874284db41bf9', 1461518083062722560, 1322, '', 'b6e94e52f60f4f88a00b19602cd26aa8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('69030142a6a040f0afe0598c6f9d15b8', '水产品加工', '水产品加工', '69030142a6a040f0afe0598c6f9d15b8', 1461518083062722560, 144, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6945a1067db24d839086748ea0c5c487', '肉制品及副产品加工', '肉制品及副产品加工', '6945a1067db24d839086748ea0c5c487', 1461518083062722560, 143, '', 'a86fe03eff0340ee869bea35b1c7c364', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6952296b64d6272f8bb5b4253eea81f9', '软木制品及其他木制品制造', '软木制品及其他木制品制造', '1536310379488817224', 1461518083062722560, 281, '', '1536310379488817216', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6964532a7ce9d3dd0431f4a0b47aba8e', '烟草生产专用设备制造', '烟草生产专用设备制造', '1536307437964701920', 1461518083062722560, 616, '', '1536307437964701912', 0, '1');
INSERT INTO `jvs_tree` VALUES ('696826039f2440e582e9797f857fd890', '棕制品制造', '棕制品制造', '696826039f2440e582e9797f857fd890', 1461518083062722560, 285, '', 'ffbf154fce954e5a83fdf7c1ca00f8ba', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('697a02a5f30443f2b1dda98df0af995a', '牛的饲养', '牛的饲养', '697a02a5f30443f2b1dda98df0af995a', 1461518083062722560, 49, '', 'cecc6d30ab22456791361548e1d0f5db', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('69c3f992740fb0a8888cbbb026d060bd', '卫生和社会工作', '卫生和社会工作', '1536311398968930454', 1461518083062722560, 1310, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('69c85bd92cbd41a59677ede5f9e84e17', '鱼糜制品及水产品干腌制加工', '鱼糜制品及水产品干腌制加工', '69c85bd92cbd41a59677ede5f9e84e17', 1461518083062722560, 146, '', '69030142a6a040f0afe0598c6f9d15b8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('69dcc255f7c83805fd2147797bfbe6e0', '酒、饮料和精制茶制造业', '酒、饮料和精制茶制造业', '1536311398964736016', 1461518083062722560, 186, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6a01d0c702cd42278d043cbc75c42444', '证券期货监管服务', '证券期货监管服务', '6a01d0c702cd42278d043cbc75c42444', 1461518083062722560, 1108, '', 'fe3e3e4436c9442eae431f53420dde54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6a01dd9823b2463da022fa697cc35315', '计算器及货币专用设备制造', '计算器及货币专用设备制造', '6a01dd9823b2463da022fa697cc35315', 1461518083062722560, 589, '', '28431578cb7545b4afd7fd13da26977d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6a1a29e6b1274ded996eba6a3060aa34', '雷达及配套设备制造', '雷达及配套设备制造', '6a1a29e6b1274ded996eba6a3060aa34', 1461518083062722560, 750, '', '33c10b41d3a34c66aa7898793302dd15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6a323939ed044a8784953bfdd0b4a57d', '其他制鞋业', '其他制鞋业', '6a323939ed044a8784953bfdd0b4a57d', 1461518083062722560, 264, '', 'c3f468119b194c1a99edf99ae5c8066c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6a3e86d0f55d4d0e9544584f765b957a', '炼铁', '炼铁', '6a3e86d0f55d4d0e9544584f765b957a', 1461518083062722560, 478, '', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6a4f510a481b4087950d90df6f0f458e', '社会工作', '社会工作', '6a4f510a481b4087950d90df6f0f458e', 1461518083062722560, 1329, '', '435c8fa381674942adee2f05521b9a42', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6a733acf5d4d4d5599b3b0aa8033b73a', '网吧活动', '网吧活动', '6a733acf5d4d4d5599b3b0aa8033b73a', 1461518083062722560, 1377, '', '367085faa6ce4b71b269b4adf385b76e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6aa674cda10b4825bb89fcfa3d3ffb77', '公园管理', '公园管理', '6aa674cda10b4825bb89fcfa3d3ffb77', 1461518083062722560, 1253, '', '4839307f8f0f43ad8322b64b21f44f9e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6ad9f49549e8a8d2070229c1f5ac2641', '化学纤维制造业', '化学纤维制造业', '1536311398964736108', 1461518083062722560, 403, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6af50099ff6f477eb2467a4fba352035', '汽车零部件及配件制造', '汽车零部件及配件制造', '6af50099ff6f477eb2467a4fba352035', 1461518083062722560, 666, '', '2c9f7f83b1a041279b95fd1b35c8a23c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6b6bcb3ce4704d60909fa9f6599f124b', '糖果、巧克力及蜜饯制造', '糖果、巧克力及蜜饯制造', '6b6bcb3ce4704d60909fa9f6599f124b', 1461518083062722560, 162, '', 'bdccc103aea04c328baa79ac2d2af736', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6b86bc8cd6394f838f7981ecf7b70c65', '其他群众团体', '其他群众团体', '6b86bc8cd6394f838f7981ecf7b70c65', 1461518083062722560, 1412, '', 'b78db952034f49eca2e0456b36962c91', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6bbf16c3d066b7829c0e4917ddb1bea9', '软木制品及其他木制品制造', '软木制品及其他木制品制造', '1536311398964736072', 1461518083062722560, 281, '', '1536311398964736064', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6bc7d856581791acac8a4ebaa9824f98', '电影和影视节目发行', '电影和影视节目发行', '1536307437964702124', 1461518083062722560, 1354, '', '1536307437964702120', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6bee4c9af06b430189461426a31b5be1', '光伏设备及元器件制造', '光伏设备及元器件制造', '6bee4c9af06b430189461426a31b5be1', 1461518083062722560, 707, '', 'e6d81ec118e14452ae27560ad9c35f44', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6c020ab0cbb046e0a9a7e4ddf9a232bc', '架线和管道工程建筑', '架线和管道工程建筑', '6c020ab0cbb046e0a9a7e4ddf9a232bc', 1461518083062722560, 841, '', '7ed8bf1d78f34e0d83e5cc49318096f9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6c06fc8099314cec8ed838b485c9481a', '咖啡馆服务', '咖啡馆服务', '6c06fc8099314cec8ed838b485c9481a', 1461518083062722560, 1059, '', 'd29526550a3c4c2eb00d1e245e8244e8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6c23ed8bb6a1535f591d09239996f766', '木材加工和木、竹、藤、棕、草制品业', '木材加工和木、竹、藤、棕、草制品业', '1536294082927472646', 1461518083062722560, 265, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6c26aba5fa8b7dadeec3a3d609ac51e1', '木制品制造', '木制品制造', '1536310829881569344', 1461518083062722560, 276, '', '1536310829881569320', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6c4308999bfadad4e109bf5919aacb74', '农、林、牧、渔业', '农、林、牧、渔业', '1536310379488817152', 1461518083062722560, 1, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6c626937f542422fa9ef7036b959e4db', '轻小型起重设备制造', '轻小型起重设备制造', '6c626937f542422fa9ef7036b959e4db', 1461518083062722560, 560, '', '0425e3ce9ed84fc493944dbd4663ba4e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6c94a23e66424a4e910304cdfb457780', '铁路货物运输', '铁路货物运输', '6c94a23e66424a4e910304cdfb457780', 1461518083062722560, 993, '', 'c915fdd52cd44480af9cb34c7d1b379f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6ca8a458aed4440db68412acc4320ba7', '助动自行车制造', '助动自行车制造', '6ca8a458aed4440db68412acc4320ba7', 1461518083062722560, 692, '', '257a140a8dce48a1a45f204534ab989c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6cb52965c231415fbe04dac6141365fb', '其他资本市场服务', '其他资本市场服务', '6cb52965c231415fbe04dac6141365fb', 1461518083062722560, 1110, '', 'fe3e3e4436c9442eae431f53420dde54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6ccbafa2184c49cb91b247c42334c30e', '集成电路设计', '集成电路设计', '6ccbafa2184c49cb91b247c42334c30e', 1461518083062722560, 1085, '', '18b70958583a491eba2567d01105d429', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6ce57f53a5b792c1416906978604a468', '纺织服装、服饰业', '纺织服装、服饰业', '1536311398964736024', 1461518083062722560, 241, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6d0c5911296c4095a8c32e2a9e61a483', '植物油加工', '植物油加工', '6d0c5911296c4095a8c32e2a9e61a483', 1461518083062722560, 136, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6d5097cf64154b56ad65380b83576e70', '其他农、林、牧、渔业机械制造', '其他农、林、牧、渔业机械制造', '6d5097cf64154b56ad65380b83576e70', 1461518083062722560, 642, '', '96416de0d629464ab952c86bdfc99406', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6dd6a6e06eda20a4d19bde89ad7cdd3b', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536310829881569660', 1461518083062722560, 1190, '', '1536310829881569656', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6e187f06068643068865eabf2d87e17a', '厨房用具及日用杂品零售', '厨房用具及日用杂品零售', '6e187f06068643068865eabf2d87e17a', 1461518083062722560, 945, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6e53bbac4ef140ef8069af84e11d7257', '图书、报刊零售', '图书、报刊零售', '6e53bbac4ef140ef8069af84e11d7257', 1461518083062722560, 951, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6e73311888be4c799619675d8a8aee73', '采盐', '采盐', '6e73311888be4c799619675d8a8aee73', 1461518083062722560, 120, '', '3f113a8e5ed742cca5693a4009ed9a65', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6e8e84df09f012b65501defd54783e74', '造纸和纸制品业', '造纸和纸制品业', '1536310829881569372', 1461518083062722560, 293, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('6eb62d0517b548a5bad3936d4d68aa95', '111', '222', '1461531364918407168', 1461531007068778496, 1, NULL, 'cc33a6ba12291960c53b12a3a3340ba2', 1, NULL);
INSERT INTO `jvs_tree` VALUES ('6eca6a434c1f4086adc5ba042bcfc0e0', '其他医疗设备及器械制造', '其他医疗设备及器械制造', '6eca6a434c1f4086adc5ba042bcfc0e0', 1461518083062722560, 650, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6f27225652514a18a161d16e3dce2ceb', '再生橡胶制造', '再生橡胶制造', '6f27225652514a18a161d16e3dce2ceb', 1461518083062722560, 420, '', '242dd78213414f0f9c3ac611b510ec7e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6faa325e961b4edfb8ab64b573e808fe', '稀有稀土金属冶炼', '稀有稀土金属冶炼', '6faa325e961b4edfb8ab64b573e808fe', 1461518083062722560, 497, '', 'fe277f2855704704a0562cc62cff05ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6fd012c2aa3a401c8fb89c9c4956d260', '糕点、面包制造', '糕点、面包制造', '6fd012c2aa3a401c8fb89c9c4956d260', 1461518083062722560, 160, '', 'a545bfa546f84451a0df365f1a1b2c2c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6fe64f59632f4a40be465910267a62a4', '毛条和毛纱线加工', '毛条和毛纱线加工', '6fe64f59632f4a40be465910267a62a4', 1461518083062722560, 212, '', '3b6376f16a31444bb1b51564e8396af2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('6fea67a178cc446ebf0d1d10cade1e5d', '手工具制造', '手工具制造', '6fea67a178cc446ebf0d1d10cade1e5d', 1461518083062722560, 515, '', 'e46d02ed330f4a32aeb2acda611aba43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('700ae26f497732682652db1498b7aeb5', '食品、饮料、烟草及饲料生产专用设备制造', '食品、饮料、烟草及饲料生产专用设备制造', '1536310379493011583', 1461518083062722560, 613, '', '1536310379493011551', 0, '1');
INSERT INTO `jvs_tree` VALUES ('701aa17676634794a5bb814a80fa2605', '建筑物清洁服务', '建筑物清洁服务', '701aa17676634794a5bb814a80fa2605', 1461518083062722560, 1284, '', '07ffe97b533243538d9e58edb4ffe7a6', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('701b685557f0b40050f52ab529006ca3', '地质勘探和地震专用仪器制造', '地质勘探和地震专用仪器制造', '1536307437964702028', 1461518083062722560, 777, '', '1536307437964702020', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7035c19933474914b96de0ad8929cc7c', '其他铁路运输设备制造', '其他铁路运输设备制造', '7035c19933474914b96de0ad8929cc7c', 1461518083062722560, 673, '', '80d9141616884b538edef0504a7dbe76', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('70c6bf1108e94374b0cfdd15ced6170d', '卫生陶瓷制品制造', '卫生陶瓷制品制造', '70c6bf1108e94374b0cfdd15ced6170d', 1461518083062722560, 466, '', 'a402270dd3274eec896e0ea9e5f4b851', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('70dea05c03334cf7a36e39dc0b73694b', '其他家用纺织制成品制造', '其他家用纺织制成品制造', '70dea05c03334cf7a36e39dc0b73694b', 1461518083062722560, 234, '', '65b1efb0ed234319ba2d96b04df0cfbf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('710c473037fa4ef2bfcfcbfae4205d79', '锑矿采选', '锑矿采选', '710c473037fa4ef2bfcfcbfae4205d79', 1461518083062722560, 100, '', 'e3e5f433000e4a8582130236036331bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7118bdbdfba7e81db82a4c5fcea422c8', '软木制品及其他木制品制造', '软木制品及其他木制品制造', '1536307437964701768', 1461518083062722560, 281, '', '1536307437964701760', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7122044ca7e247c68688f3161b3befbd', '其他食品批发', '其他食品批发', '7122044ca7e247c68688f3161b3befbd', 1461518083062722560, 875, '', 'b28ff0b238614f3bba8f268424209280', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7124818f53ae43059c2a283872861bc8', '通用设备修理', '通用设备修理', '7124818f53ae43059c2a283872861bc8', 1461518083062722560, 799, '', 'a30057bad4994bfa9049c45c55b82e81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7151385b22694a33a68cb2fe2f42bab8', '其他出版业', '其他出版业', '7151385b22694a33a68cb2fe2f42bab8', 1461518083062722560, 1349, '', '7ef056b6bde840c3bc6b6186f8d032ed', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('715ada210f144e12ad25e79d114698f7', '林产化学产品制造', '林产化学产品制造', '715ada210f144e12ad25e79d114698f7', 1461518083062722560, 381, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7176b976634c89c4b544989a29c82743', '精制茶加工', '精制茶加工', '1536307437964701716', 1461518083062722560, 201, '', '1536307437964701712', 0, '1');
INSERT INTO `jvs_tree` VALUES ('718f513bc9473c57adf798dc591cf0b9', '连续搬运设备制造', '连续搬运设备制造', '1536294082927472726', 1461518083062722560, 563, '', '1536294082927472722', 0, '1');
INSERT INTO `jvs_tree` VALUES ('71bbb8b143d54d93be276de7d2e03504', '铁合金冶炼', '铁合金冶炼', '71bbb8b143d54d93be276de7d2e03504', 1461518083062722560, 482, '', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('71bf29eda1274ee9bb6867812dfb588b', '家用制冷电器具制造', '家用制冷电器具制造', '71bf29eda1274ee9bb6867812dfb588b', 1461518083062722560, 719, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('71cd876b45cc4a12925ca801e1f709dd', '单位后勤管理服务', '单位后勤管理服务', '71cd876b45cc4a12925ca801e1f709dd', 1461518083062722560, 1153, '', '559128f608654f4582e8eb81e8ad2b78', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('71d14320f5f6407db17d1c21a498903c', '自来水生产和供应', '自来水生产和供应', '71d14320f5f6407db17d1c21a498903c', 1461518083062722560, 823, '', 'f2dddd6c1808403185f836583368d9b7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('71e11583c1e848ad841eaf3cd2e9095c', '锅炉及辅助设备制造', '锅炉及辅助设备制造', '71e11583c1e848ad841eaf3cd2e9095c', 1461518083062722560, 546, '', 'eeb06ef1eabf45dc9214022934a5ad13', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('71e9d76d90df4c38d16a6944e5840893', '纺织服装、服饰业', '纺织服装、服饰业', '1536310379488817176', 1461518083062722560, 241, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('722403a713474058894703240bc5b6db', '其他金属工具制造', '其他金属工具制造', '722403a713474058894703240bc5b6db', 1461518083062722560, 518, '', 'e46d02ed330f4a32aeb2acda611aba43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72442faba8d34c7fafea19a7da3be4fb', '资本投资服务', '资本投资服务', '72442faba8d34c7fafea19a7da3be4fb', 1461518083062722560, 1109, '', 'fe3e3e4436c9442eae431f53420dde54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7280023bb4be4ec3943682c9783566d0', '其他乐器及零件制造', '其他乐器及零件制造', '7280023bb4be4ec3943682c9783566d0', 1461518083062722560, 322, '', '8c16b25978dd4f4c9d4c18bc84cce536', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72c1b34898ea4d70946254c28589a1a7', '针织或钩针编织服装制造', '针织或钩针编织服装制造', '72c1b34898ea4d70946254c28589a1a7', 1461518083062722560, 243, '', '5ed90afabfb749a381d0b606031f88d5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72c2cabaf7c9440f9933fe2b664a6fc7', '环境治理业', '环境治理业', '72c2cabaf7c9440f9933fe2b664a6fc7', 1461518083062722560, 1240, '', '38b064ab24f945c0ba520217586ff09c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72d9cec011084196b5a7cf38e1dd9072', '皮鞋制造', '皮鞋制造', '72d9cec011084196b5a7cf38e1dd9072', 1461518083062722560, 261, '', 'c3f468119b194c1a99edf99ae5c8066c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72dcaa552383422392eb87a25574373e', '规划管理', '规划管理', '72dcaa552383422392eb87a25574373e', 1461518083062722560, 1212, '', '86ca8baeccd64086a08a406039a460f0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72de951e6c8d4951863ecc8dae9e66c6', '口腔科用设备及器具制造', '口腔科用设备及器具制造', '72de951e6c8d4951863ecc8dae9e66c6', 1461518083062722560, 645, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('72e6d57979fa47eab8edd02b52f0ac62', '洗浴服务', '洗浴服务', '72e6d57979fa47eab8edd02b52f0ac62', 1461518083062722560, 1261, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('733846a6bb4244728c77f045657cc454', '房地产开发经营', '房地产开发经营', '733846a6bb4244728c77f045657cc454', 1461518083062722560, 1131, '', 'b58bd9253692458cbbfdf0e589c39e11', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7358cec793fa40f28dbdcad386c5e0d3', '邮政专用机械及器材制造', '邮政专用机械及器材制造', '7358cec793fa40f28dbdcad386c5e0d3', 1461518083062722560, 654, '', '8b87fe3dddb440b5942961d52baf7863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7381371c19f6be407b291e82190ce961', '光纤、光缆制造', '光纤、光缆制造', '1536310829881569560', 1461518083062722560, 711, '', '1536310829881569556', 0, '1');
INSERT INTO `jvs_tree` VALUES ('738ffd54b9044b4da18ad1a656ab290e', '照明灯具制造', '照明灯具制造', '738ffd54b9044b4da18ad1a656ab290e', 1461518083062722560, 732, '', '052157cc3e7c4c94b921054b5038282b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('739b13a055de454c89429dc1e176db48', '法律服务', '法律服务', '739b13a055de454c89429dc1e176db48', 1461518083062722560, 1155, '', '1d4aa2be74514a73925194b48b570791', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('73a5214d4abf44b19bccc976f277e420', '架线及设备工程建筑', '架线及设备工程建筑', '73a5214d4abf44b19bccc976f277e420', 1461518083062722560, 842, '', '6c020ab0cbb046e0a9a7e4ddf9a232bc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('73cff2c3e7be4b768010510f42be9b37', '海洋工程专用设备制造', '海洋工程专用设备制造', '73cff2c3e7be4b768010510f42be9b37', 1461518083062722560, 603, '', '3e5247bc8341490eb91662c2f0d5613f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('73e64b7533efd59c473ef658ef4929ea', '照相机及器材制造', '照相机及器材制造', '1536294082927472786', 1461518083062722560, 587, '', '1536294082927472778', 0, '1');
INSERT INTO `jvs_tree` VALUES ('73fcabb431ce4dbaadf3fae5d7840dde', '电气设备批发', '电气设备批发', '73fcabb431ce4dbaadf3fae5d7840dde', 1461518083062722560, 913, '', 'e821e1d643de40508001dfe91309f8fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('741c9c10d459466e8035faacba909f60', '刀剪及类似日用金属工具制造', '刀剪及类似日用金属工具制造', '741c9c10d459466e8035faacba909f60', 1461518083062722560, 517, '', 'e46d02ed330f4a32aeb2acda611aba43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7422c3c971f147c9be4044fab97ada13', '证券市场服务', '证券市场服务', '7422c3c971f147c9be4044fab97ada13', 1461518083062722560, 1101, '', 'fe3e3e4436c9442eae431f53420dde54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('743877fca4124ec2bf258314760185a8', '有色金属铸造', '有色金属铸造', '743877fca4124ec2bf258314760185a8', 1461518083062722560, 502, '', 'fe277f2855704704a0562cc62cff05ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('743c9a186b6a480caa8e5a776c614848', '电影和影视节目制作', '电影和影视节目制作', '743c9a186b6a480caa8e5a776c614848', 1461518083062722560, 1353, '', '45b720ad902c4b4790710c3d15cc1883', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('743e9a15f2ad4d94bf1282b807450f0d', '其他科技推广和应用服务业', '其他科技推广和应用服务业', '743e9a15f2ad4d94bf1282b807450f0d', 1461518083062722560, 1226, '', '66c44ad92f454958bed23351116b07a4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('74412d4ad2c646bc9659c5493f3a9df3', '摄影扩印服务', '摄影扩印服务', '74412d4ad2c646bc9659c5493f3a9df3', 1461518083062722560, 1215, '', 'd0ebd453a05c4e08a1bdcbc641239503', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('746a5b49b5be4a56bad4573e269b6578', '货摊、无店铺及其他零售业', '货摊、无店铺及其他零售业', '746a5b49b5be4a56bad4573e269b6578', 1461518083062722560, 981, '', '47cb2cc4493644aa90fc6922d3b34448', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7481aef09779404aa8624b742b2b4cb2', '玉米种植', '玉米种植', '7481aef09779404aa8624b742b2b4cb2', 1461518083062722560, 6, '', 'efd3cd9b3fc745ca949140f3f401446e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('748566bed641478ba8f70d280c9abf4c', '其他未列明食品制造', '其他未列明食品制造', '748566bed641478ba8f70d280c9abf4c', 1461518083062722560, 185, '', 'f6c96d4d4a84467a99e973b643e6651e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('748dcddf4fb2427a9990bf9daa9f6954', '货摊日用品零售', '货摊日用品零售', '748dcddf4fb2427a9990bf9daa9f6954', 1461518083062722560, 984, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('749c6485fa6ef678bb0e757fcc7744ef', '羽毛(绒)加工及制品制造', '羽毛(绒)加工及制品制造', '1536311398964736032', 1461518083062722560, 256, '', '1536311398964736028', 0, '1');
INSERT INTO `jvs_tree` VALUES ('74a9c58c4eed4eb2bccbe5169660f20d', '快餐服务', '快餐服务', '74a9c58c4eed4eb2bccbe5169660f20d', 1461518083062722560, 1056, '', 'b7677f90d185460a8e7dea5ad7a69354', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('74c11d406a98427e97806e2820c481c6', '图书出版', '图书出版', '74c11d406a98427e97806e2820c481c6', 1461518083062722560, 1344, '', '7ef056b6bde840c3bc6b6186f8d032ed', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('74cebe51ee5a4f3084e667d60e89668e', '快递服务', '快递服务', '74cebe51ee5a4f3084e667d60e89668e', 1461518083062722560, 1048, '', '090c7dc402b04c499aa4878c441e823b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('74d5892b1f97481d8539373b97b8650c', '其他日用产品修理业', '其他日用产品修理业', '74d5892b1f97481d8539373b97b8650c', 1461518083062722560, 1277, '', '1e4c1b63531646d4850b4196b528d9f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7502ef0ab9af4e628414d9fe2aaf9265', '办公服务', '办公服务', '7502ef0ab9af4e628414d9fe2aaf9265', 1461518083062722560, 1183, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('751348f30b519581192ce96f267dec25', '广播电视设备制造', '广播电视设备制造', '1536294082927472914', 1461518083062722560, 746, '', '1536294082927472906', 0, '1');
INSERT INTO `jvs_tree` VALUES ('755dcd1f9f4a50023302f6995165ea52', '研究和试验发展', '研究和试验发展', '1536307437964702072', 1461518083062722560, 1188, '', '1536307437964702068', 0, '1');
INSERT INTO `jvs_tree` VALUES ('75759f7c7e814c42ae1389ee2a613800', '安全保护服务', '安全保护服务', '75759f7c7e814c42ae1389ee2a613800', 1461518083062722560, 1175, '', '1d4aa2be74514a73925194b48b570791', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('75b65768084f4d219723b4d2788b5cdf', '皮手套及皮装饰制品制造', '皮手套及皮装饰制品制造', '75b65768084f4d219723b4d2788b5cdf', 1461518083062722560, 250, '', 'f1a4f35774454eba9c9613fab6dfb3a1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('75c736b8423befbdfe4ce5e05b8de3f9', '木门窗、楼梯制造', '木门窗、楼梯制造', '1536310379488817220', 1461518083062722560, 278, '', '1536310379488817216', 0, '1');
INSERT INTO `jvs_tree` VALUES ('75e1feb8340a2ad0ef87946ca45ab122', '连续搬运设备制造', '连续搬运设备制造', '1536311398964736120', 1461518083062722560, 563, '', '1536311398964736116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('762baad6d4d74de8996e592c528088a8', '砖瓦、石材等建筑材料制造', '砖瓦、石材等建筑材料制造', '762baad6d4d74de8996e592c528088a8', 1461518083062722560, 443, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('763450fb1c3a419c9c70dc0c8a134ce8', '其他稀有金属冶炼', '其他稀有金属冶炼', '763450fb1c3a419c9c70dc0c8a134ce8', 1461518083062722560, 500, '', '6faa325e961b4edfb8ab64b573e808fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7679c159f3e248b093e972f0e568a569', '盐加工', '盐加工', '7679c159f3e248b093e972f0e568a569', 1461518083062722560, 183, '', 'f6c96d4d4a84467a99e973b643e6651e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('76a20bbc7a324a659bf6caf5153c0901', '计算机整机制造', '计算机整机制造', '76a20bbc7a324a659bf6caf5153c0901', 1461518083062722560, 739, '', 'f8f60b812bca4c15ac143f477661ba23', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('77587aa5b26a49c9b29ed01d77f884f9', '其他水利管理业', '其他水利管理业', '77587aa5b26a49c9b29ed01d77f884f9', 1461518083062722560, 1233, '', 'e792c27ee8404ea6b700ef2a508103b0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('779406b52cbd4c7ab91ebdf786fccae7', '建筑陶瓷制品制造', '建筑陶瓷制品制造', '779406b52cbd4c7ab91ebdf786fccae7', 1461518083062722560, 445, '', '762baad6d4d74de8996e592c528088a8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('779538c6a91e4e14a759a39a9a61a5ef', '文化、体育用品及器材专门零售', '文化、体育用品及器材专门零售', '779538c6a91e4e14a759a39a9a61a5ef', 1461518083062722560, 948, '', '47cb2cc4493644aa90fc6922d3b34448', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('779f7b1923684e2eb03b2afc463dc818', '露天游乐场所游乐设备制造', '露天游乐场所游乐设备制造', '779f7b1923684e2eb03b2afc463dc818', 1461518083062722560, 341, '', 'af190cf547144f178f1234471d7b5b57', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('77b15bcc68514559bb9f1aafce924d7c', '稻谷种植', '稻谷种植', '77b15bcc68514559bb9f1aafce924d7c', 1461518083062722560, 4, '', 'efd3cd9b3fc745ca949140f3f401446e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('77f4447744ee4f548d5bae4e11704607', '体育用品及器材零售', '体育用品及器材零售', '77f4447744ee4f548d5bae4e11704607', 1461518083062722560, 950, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('77fa38ca08464976a0d7925133258f8b', '金冶炼', '金冶炼', '77fa38ca08464976a0d7925133258f8b', 1461518083062722560, 494, '', 'dc8e1fdb844d4d368f777b31e3593eb9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('781e2964b76e4d8dbba1289e72dca3a0', '钨钼冶炼', '钨钼冶炼', '781e2964b76e4d8dbba1289e72dca3a0', 1461518083062722560, 498, '', '6faa325e961b4edfb8ab64b573e808fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('782f47d3f59647d8af475197893dad4d', '其他城市公共交通运输', '其他城市公共交通运输', '782f47d3f59647d8af475197893dad4d', 1461518083062722560, 1003, '', '0ae7538c6f9f4841a19494e0b018b12f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('786e18d48e754afd9e7a9509ee22c67e', '计算机、软件及辅助设备批发', '计算机、软件及辅助设备批发', '786e18d48e754afd9e7a9509ee22c67e', 1461518083062722560, 914, '', 'e821e1d643de40508001dfe91309f8fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('78729623fdd04dc8a38d09e2ac3442d4', '果品、蔬菜零售', '果品、蔬菜零售', '78729623fdd04dc8a38d09e2ac3442d4', 1461518083062722560, 932, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7878fe509db04b82adca5e259fddd206', '其他贸易经纪与代理', '其他贸易经纪与代理', '7878fe509db04b82adca5e259fddd206', 1461518083062722560, 920, '', '5ce62088c5924e39b3ecbcd705486863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('789befc4bd144da18ee07645854cb3cc', '林业服务业', '林业服务业', '789befc4bd144da18ee07645854cb3cc', 1461518083062722560, 75, '', 'e0274cb31c084751a6fe5ca5629964a2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('78d861912c5449779202d7ea4b053fd9', '木质装饰材料零售', '木质装饰材料零售', '78d861912c5449779202d7ea4b053fd9', 1461518083062722560, 978, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('78eb48026d074f49a9f50e6b27a59f18', '贵金属压延加工', '贵金属压延加工', '78eb48026d074f49a9f50e6b27a59f18', 1461518083062722560, 506, '', '834d7ba750384e2eb50b08718329951f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('78efe02b8b23375bd2aed695bb9d2feb', '改装汽车制造', '改装汽车制造', '1536310379493011623', 1461518083062722560, 662, '', '1536310379493011619', 0, '1');
INSERT INTO `jvs_tree` VALUES ('78f0bd3a69c248669295e5e94914db84', '高等教育', '高等教育', '78f0bd3a69c248669295e5e94914db84', 1461518083062722560, 1300, '', '0e85c30755b2427c98c3b5406ec53523', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7915bd7d56284989800362e9d87acf00', '生态监测', '生态监测', '7915bd7d56284989800362e9d87acf00', 1461518083062722560, 1202, '', '3b6f81ca40dc4af7984d11ae3fbfd230', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('791f2c47ff97464db6565028613154fe', '铅锌冶炼', '铅锌冶炼', '791f2c47ff97464db6565028613154fe', 1461518083062722560, 486, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7927ead2d9cf4f388670c7f34997a3e5', '电力、热力生产和供应业', '电力、热力生产和供应业', '7927ead2d9cf4f388670c7f34997a3e5', 1461518083062722560, 810, '', '4218674804e549bfb3c9fcfb99ab4d56', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7942175bed2d45257ee959b86a06a594', '皮革、毛皮、羽毛及其制品和制鞋业', '皮革、毛皮、羽毛及其制品和制鞋业', '1536311398964736028', 1461518083062722560, 245, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('795cf88ccb294e108750d2fcfec4657f', '呼叫中心', '呼叫中心', '795cf88ccb294e108750d2fcfec4657f', 1461518083062722560, 1088, '', 'be130eaa590c400eab7eb771b3df4849', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('79bdacbbbff272b2ffbca32aecf7af5d', '洗涤机械制造', '洗涤机械制造', '1536311398968930318', 1461518083062722560, 630, '', '1536311398968930310', 0, '1');
INSERT INTO `jvs_tree` VALUES ('79cde7d9a0bf442cad5df9d15710fc6a', '其他烟草制品制造', '其他烟草制品制造', '79cde7d9a0bf442cad5df9d15710fc6a', 1461518083062722560, 205, '', '61c5ac332567456ca78da58904d39606', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('79e873083c6b4681ab0dd02a5244be03', '建筑材料生产专用机械制造', '建筑材料生产专用机械制造', '79e873083c6b4681ab0dd02a5244be03', 1461518083062722560, 604, '', '3e5247bc8341490eb91662c2f0d5613f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('79f6aee4f04c4ddf9dc6da91a2c4883b', '体育经纪人', '体育经纪人', '79f6aee4f04c4ddf9dc6da91a2c4883b', 1461518083062722560, 1383, '', '253413aebc934fbb9b4da1d295258810', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7a0c1d450948458da568650adf3d1fc6', '氨纶纤维制造', '氨纶纤维制造', '7a0c1d450948458da568650adf3d1fc6', 1461518083062722560, 413, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7a259f23ded444af8a75c658e8ab752a', '电机制造', '电机制造', '7a259f23ded444af8a75c658e8ab752a', 1461518083062722560, 698, '', '52ffeaa5459542128bf67a6d04df1dda', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7a417aa5f0c3bb458d3e3542b88ffe0c', '农副食品加工专用设备制造', '农副食品加工专用设备制造', '1536310379493011587', 1461518083062722560, 615, '', '1536310379493011583', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7a75fcb6430b47b9824dda6de2463da7', '液压和气压动力机械及元件制造', '液压和气压动力机械及元件制造', '7a75fcb6430b47b9824dda6de2463da7', 1461518083062722560, 570, '', '5fb0f7308897486587d113f21523204f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7a9d922832254652b30aa78bd8faf763', '装卸搬运和运输代理业', '装卸搬运和运输代理业', '7a9d922832254652b30aa78bd8faf763', 1461518083062722560, 1034, '', '842789d652984bcc9618bfe915b8dd6b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7acf066b8a8a474ea4febfbb66fa6797', '密封用填料及类似品制造', '密封用填料及类似品制造', '7acf066b8a8a474ea4febfbb66fa6797', 1461518083062722560, 372, '', 'b582e29d66aa4ac4bb3ec657198b0477', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7b5208a3d7d82a5af5e6b3ce57707e4e', '其他木材加工', '其他木材加工', '1536294082927472666', 1461518083062722560, 270, '', '1536294082927472650', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7b5215dca8a8eea32e611b9cf69db488', '专科医院', '专科医院', '1536310379493011775', 1461518083062722560, 1317, '', '1536310379493011759', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7b59fc1e149e45ddaa9d3f12515f330c', '其他家庭用品批发', '其他家庭用品批发', '7b59fc1e149e45ddaa9d3f12515f330c', 1461518083062722560, 884, '', '3fed51964f224f8faa5db756cfafda81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7b5fc101b3194fbe909a9bbbd7fda9ce', '电子器件制造', '电子器件制造', '7b5fc101b3194fbe909a9bbbd7fda9ce', 1461518083062722560, 755, '', '33c10b41d3a34c66aa7898793302dd15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7b66dfcf585d49858e12cb26b5572ce1', '厨房、卫生间用具及日用杂货批发', '厨房、卫生间用具及日用杂货批发', '7b66dfcf585d49858e12cb26b5572ce1', 1461518083062722560, 881, '', '3fed51964f224f8faa5db756cfafda81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7b68b9d79c7f0a2eca2eb9ed08a83f3d', '其他木材加工', '其他木材加工', '1536310829881569340', 1461518083062722560, 270, '', '1536310829881569324', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7bbff924aba94e00bbdffb4b3dea6660', '鱼油提取及制品制造', '鱼油提取及制品制造', '7bbff924aba94e00bbdffb4b3dea6660', 1461518083062722560, 148, '', '69030142a6a040f0afe0598c6f9d15b8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7bc2027a198c441a8ad098e6d4300eb7', '粮油零售', '粮油零售', '7bc2027a198c441a8ad098e6d4300eb7', 1461518083062722560, 930, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7be012566f59448ebad02d92f394801d', '提供施工设备服务', '提供施工设备服务', '7be012566f59448ebad02d92f394801d', 1461518083062722560, 854, '', '8ed66bafdee04fd781dc83a103dcc577', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7be49e999d19492dbb393ededff170cd', '市场调查', '市场调查', '7be49e999d19492dbb393ededff170cd', 1461518083062722560, 1161, '', '9b6d9e6363d64e32a9e6aa0aade9cd27', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7bf5fa3a20764c24ad32f654b026a20a', '货摊纺织、服装及鞋零售', '货摊纺织、服装及鞋零售', '7bf5fa3a20764c24ad32f654b026a20a', 1461518083062722560, 983, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7c09dc1b821e450b8d9bc8e1e86a3f42', '日用及医用橡胶制品制造', '日用及医用橡胶制品制造', '7c09dc1b821e450b8d9bc8e1e86a3f42', 1461518083062722560, 421, '', '242dd78213414f0f9c3ac611b510ec7e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7c2f030c72d8425e8fcc947983bf52d0', '成人高中教育', '成人高中教育', '7c2f030c72d8425e8fcc947983bf52d0', 1461518083062722560, 1298, '', '204b9cd5e13545bdaad5a9f781515930', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7c306c63518542c68b957cc78cc8b431', '成人高等教育', '成人高等教育', '7c306c63518542c68b957cc78cc8b431', 1461518083062722560, 1302, '', '78f0bd3a69c248669295e5e94914db84', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7c4430d15cc54a17abdf4e9617c139fc', '防水建筑材料制造', '防水建筑材料制造', '7c4430d15cc54a17abdf4e9617c139fc', 1461518083062722560, 447, '', '762baad6d4d74de8996e592c528088a8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7c57e5ac59c047c090d8464ba62a8487', '水、二氧化碳等矿产地质勘查', '水、二氧化碳等矿产地质勘查', '7c57e5ac59c047c090d8464ba62a8487', 1461518083062722560, 1206, '', '593642eaef7f4d56841c28795fa2f9de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7c64e136f6c371c92327c9e23a8efc6c', '泵、阀门、压缩机及类似机械制造', '泵、阀门、压缩机及类似机械制造', '1536310379493011499', 1461518083062722560, 566, '', '1536310379493011479', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7c7704e09c4564eea55748376d2e9203', '印刷、制药、日化及日用品生产专用设备制造', '印刷、制药、日化及日用品生产专用设备制造', '1536294082927472838', 1461518083062722560, 618, '', '1536294082927472790', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7c7a7a9e37374302b94b211e2cbbbe43', '泡沫塑料制造', '泡沫塑料制造', '7c7a7a9e37374302b94b211e2cbbbe43', 1461518083062722560, 427, '', '50976a2f43bc4cc5955a536de9d07368', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7cac06db6c5745fa9f74bb4915e4ce63', '鞋帽批发', '鞋帽批发', '7cac06db6c5745fa9f74bb4915e4ce63', 1461518083062722560, 879, '', '3fed51964f224f8faa5db756cfafda81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7cb2e59679894d3cafb0fd2991001650', '其他办公设备维修', '其他办公设备维修', '7cb2e59679894d3cafb0fd2991001650', 1461518083062722560, 1273, '', '411c027a667740188bb631c54aa2c258', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7cc8aef294f480a417b1d0442055a6ba', '卫生和社会工作', '卫生和社会工作', '1536310829881569664', 1461518083062722560, 1310, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7ce7a08678ef2dd02a88866d0f075f00', '广播电视设备制造', '广播电视设备制造', '1536310829881569588', 1461518083062722560, 746, '', '1536310829881569580', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7ced03251ff14ddcbe915c83e7f12fa4', '通信终端设备制造', '通信终端设备制造', '7ced03251ff14ddcbe915c83e7f12fa4', 1461518083062722560, 745, '', '2cb5d019338e462b955cff0033b7d35c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7d134a61718f42fbbc5777fd174875c6', '日用化工专用设备制造', '日用化工专用设备制造', '7d134a61718f42fbbc5777fd174875c6', 1461518083062722560, 621, '', '19493c65e8fa413a92c97fe37446f1ff', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7d3de6627a5d4c24875e55d9f0ff7ba1', '电子工业专用设备制造', '电子工业专用设备制造', '7d3de6627a5d4c24875e55d9f0ff7ba1', 1461518083062722560, 633, '', '95f1f45df4ed4154a3c9cadf5ff3819d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7d67c234282d4592bf3231dd2ff5a46a', '海水捕捞', '海水捕捞', '7d67c234282d4592bf3231dd2ff5a46a', 1461518083062722560, 67, '', 'd15152d0699b4ac393614a5f6f04df30', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7d8e3cee47fa4612821cca82e3d4ebea', '麻染整精加工', '麻染整精加工', '7d8e3cee47fa4612821cca82e3d4ebea', 1461518083062722560, 218, '', '8ca4b0fd89624ea6bbc42c9ee45a1508', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7da15ff8b5fb4350b651ac0c1032a693', '维纶纤维制造', '维纶纤维制造', '7da15ff8b5fb4350b651ac0c1032a693', 1461518083062722560, 411, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7da7a96cf5cf8a27c4583d92bedd0074', '其他物料搬运设备制造', '其他物料搬运设备制造', '1536311398964736128', 1461518083062722560, 565, '', '1536311398964736116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7daabf02c3e1439e881f434a01837a8e', '茶馆服务', '茶馆服务', '7daabf02c3e1439e881f434a01837a8e', 1461518083062722560, 1058, '', 'd29526550a3c4c2eb00d1e245e8244e8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7dc6c0ba68eb419abdafd17ffd586b28', '方便面及其他方便食品制造', '方便面及其他方便食品制造', '7dc6c0ba68eb419abdafd17ffd586b28', 1461518083062722560, 168, '', 'eae71131d4e64599b3c04654b478073e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7e649faeef4eadf1e23941f761d1acab', '木质家具制造', '木质家具制造', '1536311398964736080', 1461518083062722560, 288, '', '1536311398964736076', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7eaa830a4ea175f3145cf6429e302b0b', '木材加工', '木材加工', '1536310379488817196', 1461518083062722560, 266, '', '1536310379488817192', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7ed8bf1d78f34e0d83e5cc49318096f9', '土木工程建筑业', '土木工程建筑业', '7ed8bf1d78f34e0d83e5cc49318096f9', 1461518083062722560, 829, '', 'b67183c5310442e5bd939723ca155dea', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7edbf6db6cd442e8b1bff68d45e84184', '营林及木竹采伐机械制造', '营林及木竹采伐机械制造', '7edbf6db6cd442e8b1bff68d45e84184', 1461518083062722560, 637, '', '96416de0d629464ab952c86bdfc99406', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7eea77d0947309efccd6d5c012503135', '木材加工和木、竹、藤、棕、草制品业', '木材加工和木、竹、藤、棕、草制品业', '1536310379488817192', 1461518083062722560, 265, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7eedc2724d6041c49733c3aa70b55e95', '油墨及类似产品制造', '油墨及类似产品制造', '7eedc2724d6041c49733c3aa70b55e95', 1461518083062722560, 369, '', 'b582e29d66aa4ac4bb3ec657198b0477', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7ef056b6bde840c3bc6b6186f8d032ed', '出版业', '出版业', '7ef056b6bde840c3bc6b6186f8d032ed', 1461518083062722560, 1343, '', 'fb2f0ae09e894c0d8ed893878ac111ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7ef218ade43c408f87de2537de492e65', '水果和坚果加工', '水果和坚果加工', '7ef218ade43c408f87de2537de492e65', 1461518083062722560, 152, '', 'ba575e30d21f4b14a6fb7d0e5e8e0724', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7f127fa7b9644592b4899ee6820f5647', '玻璃制品制造', '玻璃制品制造', '7f127fa7b9644592b4899ee6820f5647', 1461518083062722560, 453, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7f39cecee41c4c40ac083c67c34a768a', '其他有色金属压延加工', '其他有色金属压延加工', '7f39cecee41c4c40ac083c67c34a768a', 1461518083062722560, 508, '', '834d7ba750384e2eb50b08718329951f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7f4c20fbf8d38c6eb570d8cce73fedc3', '医院', '医院', '1536294082927472998', 1461518083062722560, 1312, '', '1536294082927472994', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7f71c30a08b4ce733f718632f2f15732', '运输设备及生产用计数仪表制造', '运输设备及生产用计数仪表制造', '1536310829881569608', 1461518083062722560, 774, '', '1536310829881569604', 0, '1');
INSERT INTO `jvs_tree` VALUES ('7f8b2f4f5f4f49a294185a666d566aca', '家用厨房电器具制造', '家用厨房电器具制造', '7f8b2f4f5f4f49a294185a666d566aca', 1461518083062722560, 722, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7f9fb4dbd8e0403eb477c66ba1d094b8', '铁路工程建筑', '铁路工程建筑', '7f9fb4dbd8e0403eb477c66ba1d094b8', 1461518083062722560, 831, '', 'bb9b27e8b29448acbc29064678ff48ba', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7fb915474e284ece8b51f2a17e1f1b6a', '科技中介服务', '科技中介服务', '7fb915474e284ece8b51f2a17e1f1b6a', 1461518083062722560, 1225, '', '66c44ad92f454958bed23351116b07a4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('7fe25e59eff18739aa68151836f45808', '风动和电动工具制造', '风动和电动工具制造', '1536310379493011531', 1461518083062722560, 580, '', '1536310379493011515', 0, '1');
INSERT INTO `jvs_tree` VALUES ('80c70ebf068e476ab81172056022e17e', '其他批发业', '其他批发业', '80c70ebf068e476ab81172056022e17e', 1461518083062722560, 921, '', 'a7f809990927455bba2350c3cbd65540', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('80d9141616884b538edef0504a7dbe76', '铁路运输设备制造', '铁路运输设备制造', '80d9141616884b538edef0504a7dbe76', 1461518083062722560, 668, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('81018ed1510b452dabe2d272168d3a84', '其他日用化学产品制造', '其他日用化学产品制造', '81018ed1510b452dabe2d272168d3a84', 1461518083062722560, 394, '', 'b5210ed1f0304474a251e592d21f2258', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8108c2d29a30475f8ddfc212155223c4', '煤炭及制品批发', '煤炭及制品批发', '8108c2d29a30475f8ddfc212155223c4', 1461518083062722560, 898, '', '40b02e3c160241a8870c0e6451672907', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('81659a1b578b43308cb625ce70c57ff8', '假肢、人工器官及植（介）入器械制造', '假肢、人工器官及植（介）入器械制造', '81659a1b578b43308cb625ce70c57ff8', 1461518083062722560, 649, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('81b0522c54c0cb0876791794dea23442', '照明器具制造', '照明器具制造', '1536310829881569576', 1461518083062722560, 730, '', '1536310829881569552', 0, '1');
INSERT INTO `jvs_tree` VALUES ('82', '重庆', 'chongqing', '5d44d2be-5f50-4926-8f42-6a0087662fb2', 1461518083071111168, 2, '城市管理new', '81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('82220daef3df4480aac9318e2eed1d7e', '合成纤维单（聚合）体制造', '合成纤维单（聚合）体制造', '82220daef3df4480aac9318e2eed1d7e', 1461518083062722560, 376, '', 'f7a803f3d94a4c97a9d7a53b720aaddc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('823c92516513435aeaabc26acdca23a8', '广播电视设备制造', '广播电视设备制造', '1536310379493011675', 1461518083062722560, 746, '', '1536310379493011667', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8291a9f0db7fef77590fa30afa2a7292', '文化、娱乐、体育经纪代理', '文化、娱乐、体育经纪代理', '1536310379493011815', 1461518083062722560, 1381, '', '1536310379493011803', 0, '1');
INSERT INTO `jvs_tree` VALUES ('82990b510b5b44e2bad3eed97c313774', '互联网接入及相关服务', '互联网接入及相关服务', '82990b510b5b44e2bad3eed97c313774', 1461518083062722560, 1077, '', 'f23500ffa36f47dda2908527522317f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('829c8b7954e944e49770d25d1ef58585', '渔业机械制造', '渔业机械制造', '829c8b7954e944e49770d25d1ef58585', 1461518083062722560, 639, '', '96416de0d629464ab952c86bdfc99406', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('83', '合川', 'hc', '7234104b-0c79-4756-b1c8-6b973d8999d0', 1461518083071111168, 3, '行政规划', '82', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8303cb5445734ee7a060927404db3fc5', '其他未列明运输设备制造', '其他未列明运输设备制造', '8303cb5445734ee7a060927404db3fc5', 1461518083062722560, 696, '', 'd0ffcc5e893541dcac53472927b87a41', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('831cfebe8b3789fee26bec59e1f1ddc7', '低速载货汽车制造', '低速载货汽车制造', '1536310829881569540', 1461518083062722560, 663, '', '1536310829881569532', 0, '1');
INSERT INTO `jvs_tree` VALUES ('834383f8227864640fb8e03eb23959be', '光学仪器及眼镜制造', '光学仪器及眼镜制造', '1536307437964702040', 1461518083062722560, 783, '', '1536307437964702016', 0, '1');
INSERT INTO `jvs_tree` VALUES ('83441daa2a8049aebbba94511aee5316', '铁路运输辅助活动', '铁路运输辅助活动', '83441daa2a8049aebbba94511aee5316', 1461518083062722560, 994, '', 'c915fdd52cd44480af9cb34c7d1b379f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('834d7ba750384e2eb50b08718329951f', '有色金属压延加工', '有色金属压延加工', '834d7ba750384e2eb50b08718329951f', 1461518083062722560, 503, '', 'fe277f2855704704a0562cc62cff05ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8369efb7c9944db1b230542e1f9f3fac', '金属切削机床制造', '金属切削机床制造', '8369efb7c9944db1b230542e1f9f3fac', 1461518083062722560, 553, '', '85eb2a5a58c04227b32578b29f92b940', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('83b4df0092fa431d82288a4ab21bd16b', '地质勘查技术服务', '地质勘查技术服务', '83b4df0092fa431d82288a4ab21bd16b', 1461518083062722560, 1208, '', '593642eaef7f4d56841c28795fa2f9de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('83b9dda43e541f544b8ce99637c272fe', '制冷、空调设备制造', '制冷、空调设备制造', '1536310829881569440', 1461518083062722560, 579, '', '1536310829881569428', 0, '1');
INSERT INTO `jvs_tree` VALUES ('83c4ce6c6ac9b8ed21d512eb7ca7a193', '民族医院', '民族医院', '1536310379493011771', 1461518083062722560, 1316, '', '1536310379493011759', 0, '1');
INSERT INTO `jvs_tree` VALUES ('83ecefdb67fc490084b1ca4e99d9c877', '公共安全管理机构', '公共安全管理机构', '83ecefdb67fc490084b1ca4e99d9c877', 1461518083062722560, 1394, '', 'feeac738e0214b64869a7e61bbf2505c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('84', '长寿', 'cs', 'b5b80a20-2193-495e-b24e-a6984c548034', 1461518083071111168, 4, '行政规划', '82', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8413dc68a2c54955a4f560dcac671e0e', '其他未列明金融业', '其他未列明金融业', '8413dc68a2c54955a4f560dcac671e0e', 1461518083062722560, 1128, '', '3bcdeee22fa44217a2505feebf9e6c9b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('842789d652984bcc9618bfe915b8dd6b', '交通运输、仓储和邮政业', '交通运输、仓储和邮政业', '842789d652984bcc9618bfe915b8dd6b', 1461518083062722560, 990, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('847257a4522a1d08d14713cdc137634d', '其他日用品生产专用设备制造', '其他日用品生产专用设备制造', '1536311398968930306', 1461518083062722560, 625, '', '1536311398964736232', 0, '1');
INSERT INTO `jvs_tree` VALUES ('84798cf6a06b4c1ea9f6be5da0ba377c', '专业性团体', '专业性团体', '84798cf6a06b4c1ea9f6be5da0ba377c', 1461518083062722560, 1414, '', '39e8412e569a4466a76366e0212268c4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('84947550359548a5b5210985f935c5e6', '摩托车及零配件零售', '摩托车及零配件零售', '84947550359548a5b5210985f935c5e6', 1461518083062722560, 964, '', 'cf46f0a4428749fbbbeabeeadd53969d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('84a27a6abca34d15b93c0ef72e2e1cc0', '石灰和石膏制造', '石灰和石膏制造', '84a27a6abca34d15b93c0ef72e2e1cc0', 1461518083062722560, 436, '', '1f920ea0b4ae4b0aa39bbac9b5128997', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('84a575a5b2c2262c831ffedf2a1f6473', '羽毛（绒）加工', '羽毛（绒）加工', '1536310829881569316', 1461518083062722560, 257, '', '1536310829881569312', 0, '1');
INSERT INTO `jvs_tree` VALUES ('84a5ac22d51d4da7bd87a78a57816595', '教学用模型及教具制造', '教学用模型及教具制造', '84a5ac22d51d4da7bd87a78a57816595', 1461518083062722560, 315, '', '8f10e9c4cb3f4f9f844b41c521bdfa55', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('84da88bab756ff0c4e852bae4c922904', '汽车制造业', '汽车制造业', '1536307437964701948', 1461518083062722560, 660, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('84e85dcbc7187b9fbecc77b8722aad5a', '研究和试验发展', '研究和试验发展', '1536307438530932736', 1461518083062722560, 1188, '', '1536307438430269444', 0, '1');
INSERT INTO `jvs_tree` VALUES ('84ff2d0c7989421298be2af282a50213', '野生植物保护', '野生植物保护', '84ff2d0c7989421298be2af282a50213', 1461518083062722560, 1238, '', '34b3891c4b974d5791e24e2c61ab1bd5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('85', '总公司', 'zgs', '173ad22a-1e01-4e26-b46b-ada947724d34', 1461518083066916879, 6, '组织架构', '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('850c835c54ee4939a082219ee49d6fb2', '初等教育', '初等教育', '850c835c54ee4939a082219ee49d6fb2', 1461518083062722560, 1290, '', '0e85c30755b2427c98c3b5406ec53523', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('850d4e0802055ab1c56f596a46f2e642', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', '1536307437964702056', 1461518083062722560, 809, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('850deb77f59a40cba88ccd0db7244868', '环境卫生管理', '环境卫生管理', '850deb77f59a40cba88ccd0db7244868', 1461518083062722560, 1249, '', '08a1fc9f693f48129e4bf075c2623051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('851dfe0760438575d87fdb721cb33945', '木片加工', '木片加工', '1536310379488817204', 1461518083062722560, 268, '', '1536310379488817196', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8537e1912b1744b9b3f93d0eafe4f171', '其他日用杂品制造', '其他日用杂品制造', '8537e1912b1744b9b3f93d0eafe4f171', 1461518083062722560, 790, '', 'e36b473401e34f57990cf97d36e59196', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8570670ee8294499ab4608a9af549e72', '照相器材零售', '照相器材零售', '8570670ee8294499ab4608a9af549e72', 1461518083062722560, 956, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('85990b3e5000f32500e376003b6aba17', '羽毛(绒)加工及制品制造', '羽毛(绒)加工及制品制造', '1536310829881569312', 1461518083062722560, 256, '', '1536310829881569308', 0, '1');
INSERT INTO `jvs_tree` VALUES ('859ee33a344d40978c4b0fb0a7f76975', '初级形态塑料及合成树脂制造', '初级形态塑料及合成树脂制造', '859ee33a344d40978c4b0fb0a7f76975', 1461518083062722560, 374, '', 'f7a803f3d94a4c97a9d7a53b720aaddc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('85b2cdccc654ccd3d92ee8105477ab4d', '民族医院', '民族医院', '1536307437964702100', 1461518083062722560, 1316, '', '1536307437964702088', 0, '1');
INSERT INTO `jvs_tree` VALUES ('85ce67d61e95b30e0b29427320c948f5', '低速载货汽车制造', '低速载货汽车制造', '1536311398968930330', 1461518083062722560, 663, '', '1536311398968930322', 0, '1');
INSERT INTO `jvs_tree` VALUES ('85eb2a5a58c04227b32578b29f92b940', '金属加工机械制造', '金属加工机械制造', '85eb2a5a58c04227b32578b29f92b940', 1461518083062722560, 552, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('86', '渝北', 'yubei1', 'bd51f336-dcd4-4747-9a77-de920257c31e', 1461518083071111168, 7, NULL, '82', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('865da4a1695a42c4976c0bb992500e62', '其他技术推广服务', '其他技术推广服务', '865da4a1695a42c4976c0bb992500e62', 1461518083062722560, 1224, '', '0888e14ec3974ab29ce2919250e07b7d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8675f36c1fae8afd7fcbf22b358edef1', '医院', '医院', '1536310829881569672', 1461518083062722560, 1312, '', '1536310829881569668', 0, '1');
INSERT INTO `jvs_tree` VALUES ('867ff17cae06cfd95d32d32ba032a419', '酒、饮料和精制茶制造业', '酒、饮料和精制茶制造业', '1536310829881569296', 1461518083062722560, 186, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('86baaca519044cf390a7deca05f322bb', '农、林、牧、渔业', '农、林、牧、渔业', '1536307437964701696', 1461518083062722560, 1, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('86c59d7b836fe9793de80a33a57711cc', '采矿、冶金、建筑专用设备制造', '采矿、冶金、建筑专用设备制造', '1536310829881569468', 1461518083062722560, 599, '', '1536310829881569464', 0, '1');
INSERT INTO `jvs_tree` VALUES ('86ca8baeccd64086a08a406039a460f0', '工程技术', '工程技术', '86ca8baeccd64086a08a406039a460f0', 1461518083062722560, 1209, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('86e19d2531681e5ac04da7b54b93d244', '皮革、毛皮、羽毛及其制品和制鞋业', '皮革、毛皮、羽毛及其制品和制鞋业', '1536310829881569308', 1461518083062722560, 245, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('86f1ed5fc4d84be1b83b4113c5138a06', '棉花种植', '棉花种植', '86f1ed5fc4d84be1b83b4113c5138a06', 1461518083062722560, 13, '', '8714f4525bd24e41bc090ac4dd94b150', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('87', '钓鱼街道', 'dyjd', 'cf2d22e2-41d2-4fe5-a43b-0f4a2710ea63', 1461518083071111168, 8, NULL, '83', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('871265b154a94b97a8599792998b8348', '灯用电器附件及其他照明器具制造', '灯用电器附件及其他照明器具制造', '871265b154a94b97a8599792998b8348', 1461518083062722560, 733, '', '052157cc3e7c4c94b921054b5038282b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8714f4525bd24e41bc090ac4dd94b150', '棉、麻、糖、烟草种植', '棉、麻、糖、烟草种植', '8714f4525bd24e41bc090ac4dd94b150', 1461518083062722560, 12, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('871cc284330a42ed87879679cb71c42d', '糕点、糖果及糖批发', '糕点、糖果及糖批发', '871cc284330a42ed87879679cb71c42d', 1461518083062722560, 868, '', 'b28ff0b238614f3bba8f268424209280', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('871e072356eff8618302a623dc58c98e', '中医医院', '中医医院', '1536310379493011763', 1461518083062722560, 1314, '', '1536310379493011759', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8735fe46ee8647299c4f4e088f94ee98', '控股公司服务', '控股公司服务', '8735fe46ee8647299c4f4e088f94ee98', 1461518083062722560, 1125, '', '3bcdeee22fa44217a2505feebf9e6c9b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('874162e1a81d45f9b904409cebf44ee6', '软件开发', '软件开发', '874162e1a81d45f9b904409cebf44ee6', 1461518083062722560, 1081, '', '18b70958583a491eba2567d01105d429', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('877f9492af4a411fb23fe14933fa7d01', '半导体分立器件制造', '半导体分立器件制造', '877f9492af4a411fb23fe14933fa7d01', 1461518083062722560, 757, '', '7b5fc101b3194fbe909a9bbbd7fda9ce', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('87e7676e6d1b428d8726ea9ad3ee17bf', '燃气、太阳能及类似能源家用器具制造', '燃气、太阳能及类似能源家用器具制造', '87e7676e6d1b428d8726ea9ad3ee17bf', 1461518083062722560, 728, '', 'afaab8c4990b42cf8d2d8c7b2e0d8db0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('87fd85753494e2a9ebd0895cbe57699f', '电梯、自动扶梯及升降机制造', '电梯、自动扶梯及升降机制造', '1536310379493011491', 1461518083062722560, 564, '', '1536310379493011483', 0, '1');
INSERT INTO `jvs_tree` VALUES ('880ae8567e8b49569f37846260c775d5', '信息系统集成服务', '信息系统集成服务', '880ae8567e8b49569f37846260c775d5', 1461518083062722560, 1082, '', '18b70958583a491eba2567d01105d429', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('882095408f3749cd809e548818dc38ed', '其他电子产品零售', '其他电子产品零售', '882095408f3749cd809e548818dc38ed', 1461518083062722560, 971, '', '30c19ce6a3094ce983f55d95dd4b19e1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('885b953eeed2dd2d51ef3ff4e74bc2be', '低速载货汽车制造', '低速载货汽车制造', '1536307437964701956', 1461518083062722560, 663, '', '1536307437964701948', 0, '1');
INSERT INTO `jvs_tree` VALUES ('88fd57e009834b5d9e627bfa43633e39', '印刷专用设备制造', '印刷专用设备制造', '88fd57e009834b5d9e627bfa43633e39', 1461518083062722560, 620, '', '19493c65e8fa413a92c97fe37446f1ff', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('89', '重庆市', 'cq', '13d3ce07-b4e4-4a59-ad9c-c1933e6980e1', 1461518083066916882, 1, '区域规划', '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8971762e88d34c98a0b4c68d0e2c1393', '航空航天器修理', '航空航天器修理', '8971762e88d34c98a0b4c68d0e2c1393', 1461518083062722560, 804, '', 'eb874e229b154ae8b8db2ed8a5bd965f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('89c38e8e55c749a1b0274484ab29395a', '其他专用化学产品制造', '其他专用化学产品制造', '89c38e8e55c749a1b0274484ab29395a', 1461518083062722560, 385, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('89cbfe8389bbdfff163277855f904738', '烘炉、风机、衡器、包装等设备制造', '烘炉、风机、衡器、包装等设备制造', '1536311398964736148', 1461518083062722560, 575, '', '1536311398964736112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('89eaa11274734dc3533cfcc0230f6d8d', '羽毛（绒）加工', '羽毛（绒）加工', '1536311398964736036', 1461518083062722560, 257, '', '1536311398964736032', 0, '1');
INSERT INTO `jvs_tree` VALUES ('89f59d7a5df240eaa1cb503be3b3cbe7', '药品零售', '药品零售', '89f59d7a5df240eaa1cb503be3b3cbe7', 1461518083062722560, 959, '', '48f6fec9283745829d4a7dc3b21008bb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8a0a652bc7e949cba21c480aeb8a0f66', '糕点、面包零售', '糕点、面包零售', '8a0a652bc7e949cba21c480aeb8a0f66', 1461518083062722560, 931, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8a27f75a8215f5c4bb7f5e4c7d09731e', '视听设备制造', '视听设备制造', '1536310379493011683', 1461518083062722560, 751, '', '1536310379493011667', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8a5e5dc11f0249a8bccfdb12d8bd2523', '其他人力资源服务', '其他人力资源服务', '8a5e5dc11f0249a8bccfdb12d8bd2523', 1461518083062722560, 1170, '', 'fdd9cb4ea4a4478285b5deadde6900b9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8a65c9c67597457aa14be08daca38153', '会议及展览服务', '会议及展览服务', '8a65c9c67597457aa14be08daca38153', 1461518083062722560, 1181, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8a6ecba4dc0b23d0abd790e28f78dd46', '通用设备制造业', '通用设备制造业', '1536311398964736112', 1461518083062722560, 544, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8a91d822da204f2d9eb92674273239c0', '汽车、摩托车修理与维护', '汽车、摩托车修理与维护', '8a91d822da204f2d9eb92674273239c0', 1461518083062722560, 1267, '', '1e4c1b63531646d4850b4196b528d9f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8aa3c67042564988b82aa4a138ef00d1', '基金管理服务', '基金管理服务', '8aa3c67042564988b82aa4a138ef00d1', 1461518083062722560, 1104, '', '7422c3c971f147c9be4044fab97ada13', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8abfee0d92564238bf0c7dceb2276413', '摩托车整车制造', '摩托车整车制造', '8abfee0d92564238bf0c7dceb2276413', 1461518083062722560, 688, '', '43f3b671e3994032b015723214288d9f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8aca6aba7270d426b6625660184f3934', '竹、藤家具制造', '竹、藤家具制造', '1536307437964701780', 1461518083062722560, 289, '', '1536307437964701772', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8b2e34b3cd0e443eb49da3f786407ae7', '娱乐及体育设备出租', '娱乐及体育设备出租', '8b2e34b3cd0e443eb49da3f786407ae7', 1461518083062722560, 1145, '', '3291363a04824a4a83fa735df8baf155', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8b31738d90a4970ad601910943846154', '室内娱乐活动', '室内娱乐活动', '1536307437964702136', 1461518083062722560, 1374, '', '1536307437964702132', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8b4fc71b9592d34c3f19fa014e9eb68a', '镍氢电池制造', '镍氢电池制造', '1536310379493011659', 1461518083062722560, 716, '', '1536310379493011651', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8b6fbbb6b949405e9b03521bc9a45933', '批发和零售业', '批发和零售业', '8b6fbbb6b949405e9b03521bc9a45933', 1461518083062722560, 856, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8b87fe3dddb440b5942961d52baf7863', '环保、社会公共服务及其他专用设备制造', '环保、社会公共服务及其他专用设备制造', '8b87fe3dddb440b5942961d52baf7863', 1461518083062722560, 651, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8b92d10affe04c4ebdc031b934ad44a0', '其他未列明金属制品制造', '其他未列明金属制品制造', '8b92d10affe04c4ebdc031b934ad44a0', 1461518083062722560, 543, '', '3995635d7fc74d7b97de0ae8e9a377d3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8b9837e675d76fc4bb736fcef7e3eec5', '其他物料搬运设备制造', '其他物料搬运设备制造', '1536294082927472734', 1461518083062722560, 565, '', '1536294082927472722', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8c16b25978dd4f4c9d4c18bc84cce536', '乐器制造', '乐器制造', '8c16b25978dd4f4c9d4c18bc84cce536', 1461518083062722560, 318, '', '9df0963d73874bb6854f911bb726f362', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8c19982401f6476090ff63089e86dec1', '中药批发', '中药批发', '8c19982401f6476090ff63089e86dec1', 1461518083062722560, 895, '', '5ef0d34da8ea4f35a71a790414db8990', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8c24b0d0c2ce4d3c9454c54085f5ab75', '其他贵金属冶炼', '其他贵金属冶炼', '8c24b0d0c2ce4d3c9454c54085f5ab75', 1461518083062722560, 496, '', 'dc8e1fdb844d4d368f777b31e3593eb9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8c2b53a4b9f743b6e09aa80fdab08a0a', '造纸和纸制品业', '造纸和纸制品业', '1536307437964701788', 1461518083062722560, 293, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8c35ca4c495b462f8cefc89abc7cc1fb', '经济事务管理机构', '经济事务管理机构', '8c35ca4c495b462f8cefc89abc7cc1fb', 1461518083062722560, 1396, '', 'feeac738e0214b64869a7e61bbf2505c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8c5c47c0866a48418212583e45568c8c', '林木育种', '林木育种', '8c5c47c0866a48418212583e45568c8c', 1461518083062722560, 37, '', '9869ca6063ba4b0c95c3dec891cf3494', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8c6b32a3281940b9988ea342d3d96ba9', '非金属废料和碎屑加工处理', '非金属废料和碎屑加工处理', '8c6b32a3281940b9988ea342d3d96ba9', 1461518083062722560, 796, '', '216218ad682743e3b744ee57f4727717', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8ca4b0fd89624ea6bbc42c9ee45a1508', '麻纺织及染整精加工', '麻纺织及染整精加工', '8ca4b0fd89624ea6bbc42c9ee45a1508', 1461518083062722560, 215, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8cab4068436447f788aea338e3440bcb', '金属废料和碎屑加工处理', '金属废料和碎屑加工处理', '8cab4068436447f788aea338e3440bcb', 1461518083062722560, 795, '', '216218ad682743e3b744ee57f4727717', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8cb57aeb1a444cf2808e8f66d79b9b96', '金属及金属矿批发', '金属及金属矿批发', '8cb57aeb1a444cf2808e8f66d79b9b96', 1461518083062722560, 901, '', '40b02e3c160241a8870c0e6451672907', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8cbb47c4cf404d8abcffccbd1c4f69ee', '园林、陈设艺术及其他陶瓷制品制造', '园林、陈设艺术及其他陶瓷制品制造', '8cbb47c4cf404d8abcffccbd1c4f69ee', 1461518083062722560, 469, '', 'a402270dd3274eec896e0ea9e5f4b851', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8cc96d71849240f2bfd163e932d2a5ca', '其他体育用品制造', '其他体育用品制造', '8cc96d71849240f2bfd163e932d2a5ca', 1461518083062722560, 338, '', 'bf6890967d994d25a26161fb732004c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8d167e0e6e78979c0a7332ff147ad065', '纸制品制造', '纸制品制造', '1536311398964736104', 1461518083062722560, 301, '', '1536311398964736092', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8d2d2ad140214323b3332902ef0b02b8', '投资与资产管理', '投资与资产管理', '8d2d2ad140214323b3332902ef0b02b8', 1461518083062722560, 1152, '', '559128f608654f4582e8eb81e8ad2b78', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8d6af4ffdaa94e3fb7be37ee9433a929', '水文服务', '水文服务', '8d6af4ffdaa94e3fb7be37ee9433a929', 1461518083062722560, 1232, '', 'e792c27ee8404ea6b700ef2a508103b0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8dac297c3cd4423f88b52316c3389a5f', '卫星传输服务', '卫星传输服务', '8dac297c3cd4423f88b52316c3389a5f', 1461518083062722560, 1075, '', '3f17841046934332b6147dd9a026e57a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8dc9afa42f574aa183881ac6b6df1660', '铸造机械制造', '铸造机械制造', '8dc9afa42f574aa183881ac6b6df1660', 1461518083062722560, 555, '', '85eb2a5a58c04227b32578b29f92b940', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8dd08d67159557d5aed671dbae9d9ad4', '纺织、服装和皮革加工专用设备制造', '纺织、服装和皮革加工专用设备制造', '1536310379493011607', 1461518083062722560, 626, '', '1536310379493011551', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8dfaac541159df71764a5d763891982a', '化学纤维制造业', '化学纤维制造业', '1536294082927472714', 1461518083062722560, 403, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8e1163acd8d046d580f42436854753c4', '罐头食品制造', '罐头食品制造', '8e1163acd8d046d580f42436854753c4', 1461518083062722560, 170, '', 'bdccc103aea04c328baa79ac2d2af736', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8e28d9fe58764f1faa4ef0adcdade9f2', '成人小学教育', '成人小学教育', '8e28d9fe58764f1faa4ef0adcdade9f2', 1461518083062722560, 1292, '', '850c835c54ee4939a082219ee49d6fb2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8e42f9c7ed204f5c8a0d3623ae45adf6', '皮革鞣制加工', '皮革鞣制加工', '8e42f9c7ed204f5c8a0d3623ae45adf6', 1461518083062722560, 246, '', '41d6e99c8a134d7992628343e52ff28a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8ed66bafdee04fd781dc83a103dcc577', '建筑装饰和其他建筑业', '建筑装饰和其他建筑业', '8ed66bafdee04fd781dc83a103dcc577', 1461518083062722560, 849, '', 'b67183c5310442e5bd939723ca155dea', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8f005a9f8e98441f9bff10a1f432440a', '互联网信息服务', '互联网信息服务', '8f005a9f8e98441f9bff10a1f432440a', 1461518083062722560, 1078, '', 'f23500ffa36f47dda2908527522317f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8f10e9c4cb3f4f9f844b41c521bdfa55', '文教办公用品制造', '文教办公用品制造', '8f10e9c4cb3f4f9f844b41c521bdfa55', 1461518083062722560, 312, '', '9df0963d73874bb6854f911bb726f362', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8f16e6b0930248aea2e231285bf9fa53', '健康和意外保险', '健康和意外保险', '8f16e6b0930248aea2e231285bf9fa53', 1461518083062722560, 1114, '', 'f315a33e96664b5a8b8a8d1e74bacf72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8f386fcc48054b529a2ac3b11d704051', '机械设备租赁', '机械设备租赁', '8f386fcc48054b529a2ac3b11d704051', 1461518083062722560, 1138, '', '33724e4a2902407a9bf88addebadaa7e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8f425183abfce4cd52167603f66e8cd2', '化学纤维制造业', '化学纤维制造业', '1536310379493011475', 1461518083062722560, 403, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8f5bf30614bd40d0bff35dfb8fb1e38c', '其他机械设备及电子产品批发', '其他机械设备及电子产品批发', '8f5bf30614bd40d0bff35dfb8fb1e38c', 1461518083062722560, 916, '', 'e821e1d643de40508001dfe91309f8fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('8fb7ae93bd5b1f76bdb865989f3bd43b', '包装专用设备制造', '包装专用设备制造', '1536310829881569448', 1461518083062722560, 583, '', '1536310829881569428', 0, '1');
INSERT INTO `jvs_tree` VALUES ('8fe7a3ef9e3723047fd827f5c62d53ae', '娱乐业', '娱乐业', '1536310829881569716', 1461518083062722560, 1373, '', '1536310829881569700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('90', '重庆', 'chongqing', '9540a615-e7ce-4bd3-a53d-0702c7bd0398', 1461518083066916882, 2, '区域规划', '89', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('901fef52f5c3496e927adae6fac86974', '房屋建筑业', '房屋建筑业', '901fef52f5c3496e927adae6fac86974', 1461518083062722560, 828, '', 'b8768c0cbac64280b07e18fe5ad34950', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('903b61ef90ade319833ed4d6ab94987e', '烘炉、风机、衡器、包装等设备制造', '烘炉、风机、衡器、包装等设备制造', '1536310829881569428', 1461518083062722560, 575, '', '1536310829881569392', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9044f50e5094ebb79ca97c2ccc32a20d', '电池制造', '电池制造', '1536310829881569564', 1461518083062722560, 714, '', '1536310829881569552', 0, '1');
INSERT INTO `jvs_tree` VALUES ('905cd9ad94134de29a206a05678bf444', '金属制餐具和器皿制造', '金属制餐具和器皿制造', '905cd9ad94134de29a206a05678bf444', 1461518083062722560, 537, '', '46922c9d081a4bd2a30860d15b5837ab', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('905d2a8936a50134f032eb937eb6e431', '造纸和纸制品业', '造纸和纸制品业', '1536310379493011459', 1461518083062722560, 293, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('90ac37054768fd7bcb3ab8e599353fe2', '歌舞厅娱乐活动', '歌舞厅娱乐活动', '1536307437964702140', 1461518083062722560, 1375, '', '1536307437964702136', 0, '1');
INSERT INTO `jvs_tree` VALUES ('90b6210fedcb43768645e86948a26c73', '保健食品制造', '保健食品制造', '90b6210fedcb43768645e86948a26c73', 1461518083062722560, 181, '', 'f6c96d4d4a84467a99e973b643e6651e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('90dce92b097a4d6d99cae39395a5af92', '印刷和记录媒介复制业', '印刷和记录媒介复制业', '90dce92b097a4d6d99cae39395a5af92', 1461518083062722560, 304, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('90f772df52fb537c4c56bc2c90cf8c7f', '非木竹浆制造', '非木竹浆制造', '1536311398964736100', 1461518083062722560, 296, '', '1536311398964736096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('91', '合川', 'hc', '9e1a37dd-aac0-4305-bde2-c84c8a2b9091', 1461518083066916882, 3, '区域规划', '90', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('911a76842379411e81cd0338deb2a59c', '农业技术推广服务', '农业技术推广服务', '911a76842379411e81cd0338deb2a59c', 1461518083062722560, 1220, '', '0888e14ec3974ab29ce2919250e07b7d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('91669cd1a64748e7947dbb790bc6669c', '其他煤炭采选', '其他煤炭采选', '91669cd1a64748e7947dbb790bc6669c', 1461518083062722560, 86, '', 'bc265bb0211c48f8b8e8a38afaf2579e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('91950c4c8cda004f0c120355898b0cf6', '广播、电视、电影和影视录音制作业', '广播、电视、电影和影视录音制作业', '1536311398968930494', 1461518083062722560, 1350, '', '1536311398968930490', 0, '1');
INSERT INTO `jvs_tree` VALUES ('91a238bc14801124e664b00960e8be8c', '电池制造', '电池制造', '1536311398968930354', 1461518083062722560, 714, '', '1536311398968930342', 0, '1');
INSERT INTO `jvs_tree` VALUES ('91ba9fa0dc6d4d43813b496da4d18918', '无机酸制造', '无机酸制造', '91ba9fa0dc6d4d43813b496da4d18918', 1461518083062722560, 352, '', '91dc97eb105d4ba29bbf67a3eee45596', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('91d0bc3401324942b5fea5aa1338a39e', '金属切割及焊接设备制造', '金属切割及焊接设备制造', '91d0bc3401324942b5fea5aa1338a39e', 1461518083062722560, 556, '', '85eb2a5a58c04227b32578b29f92b940', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('91dc97eb105d4ba29bbf67a3eee45596', '基础化学原料制造', '基础化学原料制造', '91dc97eb105d4ba29bbf67a3eee45596', 1461518083062722560, 351, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('91ed941c78674aa3b26a0bc3888e1873', '文化娱乐经纪人', '文化娱乐经纪人', '91ed941c78674aa3b26a0bc3888e1873', 1461518083062722560, 1382, '', '253413aebc934fbb9b4da1d295258810', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('92', '长寿', 'cs', '01d47e04-cee1-453f-bafd-383853ea1cba', 1461518083066916882, 4, '区域规划', '90', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('920fc154ae8a4751bf1f75e12bb8fdb3', '信用服务', '信用服务', '920fc154ae8a4751bf1f75e12bb8fdb3', 1461518083062722560, 1184, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('922b93f57b9ffd035b0bc93c064d382a', '汽车车身、挂车制造', '汽车车身、挂车制造', '1536307437964701964', 1461518083062722560, 665, '', '1536307437964701948', 0, '1');
INSERT INTO `jvs_tree` VALUES ('922c25384827a45ad486896103eac223', '研究和试验发展', '研究和试验发展', '1536310379493011743', 1461518083062722560, 1188, '', '1536310379493011739', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9240adba6cb34317a385990accbaf345', '汽车租赁', '汽车租赁', '9240adba6cb34317a385990accbaf345', 1461518083062722560, 1139, '', '8f386fcc48054b529a2ac3b11d704051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('92589f4a72ab42bb8a3de2d53db54757', '皮箱、包（袋）制造', '皮箱、包（袋）制造', '92589f4a72ab42bb8a3de2d53db54757', 1461518083062722560, 249, '', 'f1a4f35774454eba9c9613fab6dfb3a1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('92668d9e571ecf84144e5026c3ff6b4d', '歌舞厅娱乐活动', '歌舞厅娱乐活动', '1536310379493011811', 1461518083062722560, 1375, '', '1536310379493011807', 0, '1');
INSERT INTO `jvs_tree` VALUES ('928db2c7bb61cabebb5a337b4eea96af', '木片加工', '木片加工', '1536294082927472658', 1461518083062722560, 268, '', '1536294082927472650', 0, '1');
INSERT INTO `jvs_tree` VALUES ('92c968f9190f9e4e144d2c0b21359be4', '风动和电动工具制造', '风动和电动工具制造', '1536310829881569444', 1461518083062722560, 580, '', '1536310829881569428', 0, '1');
INSERT INTO `jvs_tree` VALUES ('93', '合川', 'hc2', 'aad23ec7-0c97-4575-ae5b-a238a8581859', 1461518083071111168, 14, NULL, '82', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('933b8b884e126686833dc66a9ce800b5', '照相机及器材制造', '照相机及器材制造', '1536307437964701876', 1461518083062722560, 587, '', '1536307437964701868', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9343f99c36194dca80b0bccab544ba1d', '仓储业', '仓储业', '9343f99c36194dca80b0bccab544ba1d', 1461518083062722560, 1040, '', '842789d652984bcc9618bfe915b8dd6b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9356c86a6cb8446093e3ec27ae0ef3b5', '畜牧业', '畜牧业', '9356c86a6cb8446093e3ec27ae0ef3b5', 1461518083062722560, 47, '', '13d75bb0e0d1450aaac9436826617835', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('93622c6d61df43929e245974c0c0f0e6', '服装零售', '服装零售', '93622c6d61df43929e245974c0c0f0e6', 1461518083062722560, 940, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('93b04f158abf46408ac5135d79dd5dce', '金属包装容器制造', '金属包装容器制造', '93b04f158abf46408ac5135d79dd5dce', 1461518083062722560, 522, '', '00d90a3e54fc4c47b928bd83ae0fb741', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('93e59a71a7354d70bd5eb08efdc33b4e', '农林牧渔机械配件制造', '农林牧渔机械配件制造', '93e59a71a7354d70bd5eb08efdc33b4e', 1461518083062722560, 640, '', '96416de0d629464ab952c86bdfc99406', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9400d4cfc89fb7322bc99c37b0badd1e', '其他非金属加工专用设备制造', '其他非金属加工专用设备制造', '1536307437964701908', 1461518083062722560, 612, '', '1536307437964701896', 0, '1');
INSERT INTO `jvs_tree` VALUES ('94478746b54337a54c5e2a39d1ace140', '文化、娱乐、体育经纪代理', '文化、娱乐、体育经纪代理', '1536311398968930518', 1461518083062722560, 1381, '', '1536311398968930506', 0, '1');
INSERT INTO `jvs_tree` VALUES ('947e0f87323b430ea5d5c7689ab006cf', '公共管理、社会保障和社会组织', '公共管理、社会保障和社会组织', '947e0f87323b430ea5d5c7689ab006cf', 1461518083062722560, 1386, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('948494f486254807b6e561e885f27676', '教学专用仪器制造', '教学专用仪器制造', '948494f486254807b6e561e885f27676', 1461518083062722560, 778, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('949095373fd543bba4828f9855313e7e', '特殊教育', '特殊教育', '949095373fd543bba4828f9855313e7e', 1461518083062722560, 1303, '', '0e85c30755b2427c98c3b5406ec53523', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('94b9ee4c5b044aff82a1db919eea8470', '造纸', '造纸', '94b9ee4c5b044aff82a1db919eea8470', 1461518083062722560, 297, '', '232e90a17cca443aa592d6aea13dc44a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('94f83bbc2c2d4d0499e7b92902937295', '其他未列明日用产品修理业', '其他未列明日用产品修理业', '94f83bbc2c2d4d0499e7b92902937295', 1461518083062722560, 1281, '', '74d5892b1f97481d8539373b97b8650c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('94faa344afa447dab397f1613efb4982', '陶瓷、石材装饰材料零售', '陶瓷、石材装饰材料零售', '94faa344afa447dab397f1613efb4982', 1461518083062722560, 979, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('95304716b6445526b94176c6a9f931ba', '羽毛（绒）加工', '羽毛（绒）加工', '1536307437964701732', 1461518083062722560, 257, '', '1536307437964701728', 0, '1');
INSERT INTO `jvs_tree` VALUES ('95313f75ed3e42b18b540f0e2805f8b8', '手工纸制造', '手工纸制造', '95313f75ed3e42b18b540f0e2805f8b8', 1461518083062722560, 299, '', '94b9ee4c5b044aff82a1db919eea8470', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9547ea55e11a422596e6c07752634186', '体育场馆', '体育场馆', '9547ea55e11a422596e6c07752634186', 1461518083062722560, 1370, '', 'cf82b0dc32824fb98ef01061303d5bb4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('957d60e6ff6847e08c6514eb084a4b35', '保险业', '保险业', '957d60e6ff6847e08c6514eb084a4b35', 1461518083062722560, 1111, '', 'aa7eae86426348798b655780cb183d98', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('959c243ff38c4beea453079a4882cbd0', '建筑用石加工', '建筑用石加工', '959c243ff38c4beea453079a4882cbd0', 1461518083062722560, 446, '', '762baad6d4d74de8996e592c528088a8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('95a974a9b3844e0c8e3ebf2b58eb75bb', '社会公共安全设备及器材制造', '社会公共安全设备及器材制造', '95a974a9b3844e0c8e3ebf2b58eb75bb', 1461518083062722560, 656, '', '8b87fe3dddb440b5942961d52baf7863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('95f1f45df4ed4154a3c9cadf5ff3819d', '电子和电工机械专用设备制造', '电子和电工机械专用设备制造', '95f1f45df4ed4154a3c9cadf5ff3819d', 1461518083062722560, 631, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('960221a73ff8b05598d5005b9c448528', '羽毛(绒)加工及制品制造', '羽毛(绒)加工及制品制造', '1536310379488817184', 1461518083062722560, 256, '', '1536310379488817180', 0, '1');
INSERT INTO `jvs_tree` VALUES ('961e354bcbd74638a80476ebafffcf02', '互联网零售', '互联网零售', '961e354bcbd74638a80476ebafffcf02', 1461518083062722560, 985, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('96416de0d629464ab952c86bdfc99406', '农、林、牧、渔专用机械制造', '农、林、牧、渔专用机械制造', '96416de0d629464ab952c86bdfc99406', 1461518083062722560, 634, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('96429cd6b9e46925f4510c1d48a93a20', '电影和影视节目发行', '电影和影视节目发行', '1536311398968930498', 1461518083062722560, 1354, '', '1536311398968930494', 0, '1');
INSERT INTO `jvs_tree` VALUES ('964e4de1adcc4e729a8dcdc2c96b117f', '交通及公共管理用金属标牌制造', '交通及公共管理用金属标牌制造', '964e4de1adcc4e729a8dcdc2c96b117f', 1461518083062722560, 542, '', '3995635d7fc74d7b97de0ae8e9a377d3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('96503a6c60aa4639b4e44b5c4bedd0a4', '禽类屠宰', '禽类屠宰', '96503a6c60aa4639b4e44b5c4bedd0a4', 1461518083062722560, 142, '', 'a86fe03eff0340ee869bea35b1c7c364', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('96887dbf17d0635f1b9a2611d916d11c', '家具制造业', '家具制造业', '1536294082927472682', 1461518083062722560, 287, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('96fe23d787984ca99ed6a946a6a9e431', '游览景区管理', '游览景区管理', '96fe23d787984ca99ed6a946a6a9e431', 1461518083062722560, 1254, '', '4839307f8f0f43ad8322b64b21f44f9e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('971b32f7632940699602e26157d74e2c', '其他社会团体', '其他社会团体', '971b32f7632940699602e26157d74e2c', 1461518083062722560, 1416, '', '39e8412e569a4466a76366e0212268c4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9721646d53e142789ff39d7632647bd3', '航标器材及其他相关装置制造', '航标器材及其他相关装置制造', '9721646d53e142789ff39d7632647bd3', 1461518083062722560, 681, '', '98490bfbacce404285880451a06a29fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('972c55f171b863286016f61d692a46cf', '广播电视节目制作及发射设备制造', '广播电视节目制作及发射设备制造', '1536311398968930382', 1461518083062722560, 747, '', '1536311398968930378', 0, '1');
INSERT INTO `jvs_tree` VALUES ('973355c2e18f4952b3200c452cf1abf3', '装卸搬运', '装卸搬运', '973355c2e18f4952b3200c452cf1abf3', 1461518083062722560, 1035, '', '7a9d922832254652b30aa78bd8faf763', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9737ea5ac2e54797a5524ebc3f03849e', '制浆和造纸专用设备制造', '制浆和造纸专用设备制造', '9737ea5ac2e54797a5524ebc3f03849e', 1461518083062722560, 619, '', '19493c65e8fa413a92c97fe37446f1ff', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9743516e9e9e40e59ddffe48b81fa1d2', '建筑装饰用石开采', '建筑装饰用石开采', '9743516e9e9e40e59ddffe48b81fa1d2', 1461518083062722560, 116, '', '338fddda90714633a35486487f31961e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('97753ff411f04aadb0ab4b230d80c204', '人造板制造', '人造板制造', '97753ff411f04aadb0ab4b230d80c204', 1461518083062722560, 271, '', '423a2ec66ad24b9a9ec95c606a136fbd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('981fcbc225d04c0b8ed149ab9c1baa8e', '其他家用电力器具制造', '其他家用电力器具制造', '981fcbc225d04c0b8ed149ab9c1baa8e', 1461518083062722560, 726, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('98360d8bae334cd9ba7ce05091f42f4e', '石墨、滑石采选', '石墨、滑石采选', '98360d8bae334cd9ba7ce05091f42f4e', 1461518083062722560, 123, '', '145148bf32184b6a8311fe783ef0e544', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('98490bfbacce404285880451a06a29fe', '船舶及相关装置制造', '船舶及相关装置制造', '98490bfbacce404285880451a06a29fe', 1461518083062722560, 675, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9869ca6063ba4b0c95c3dec891cf3494', '林木育种和育苗', '林木育种和育苗', '9869ca6063ba4b0c95c3dec891cf3494', 1461518083062722560, 36, '', 'e222f63d0cbe4b659bb50ec78a197c7d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('98956217a13c53e30e046d4becbabdd0', '核子及核辐射测量仪器制造', '核子及核辐射测量仪器制造', '1536307437964702032', 1461518083062722560, 779, '', '1536307437964702020', 0, '1');
INSERT INTO `jvs_tree` VALUES ('98dfa75341f6abf64586f381fa3a9630', '炼油、化工生产专用设备制造', '炼油、化工生产专用设备制造', '1536307437964701900', 1461518083062722560, 607, '', '1536307437964701896', 0, '1');
INSERT INTO `jvs_tree` VALUES ('996119c5b2294f3f92b5c3cdb0988810', '酒、饮料及茶叶批发', '酒、饮料及茶叶批发', '996119c5b2294f3f92b5c3cdb0988810', 1461518083062722560, 873, '', 'b28ff0b238614f3bba8f268424209280', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9969813135bf62df9e343b1e380b6b24', '运输设备及生产用计数仪表制造', '运输设备及生产用计数仪表制造', '1536310379493011695', 1461518083062722560, 774, '', '1536310379493011691', 0, '1');
INSERT INTO `jvs_tree` VALUES ('996efd854a9f4538bf0f3cb25f4a94c9', '肉、禽、蛋、奶及水产品零售', '肉、禽、蛋、奶及水产品零售', '996efd854a9f4538bf0f3cb25f4a94c9', 1461518083062722560, 933, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('99ecedfe2c4d4c9e90825e92c7cef7fd', '其他文化、办公用机械制造', '其他文化、办公用机械制造', '99ecedfe2c4d4c9e90825e92c7cef7fd', 1461518083062722560, 590, '', '28431578cb7545b4afd7fd13da26977d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9a0344401c4408bc86adea5ffa94fdad', '医院', '医院', '1536307437964702088', 1461518083062722560, 1312, '', '1536307437964702084', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9a0f53f9c5242f8c238ae1b085940b32', '国标行业.txt', NULL, '1536311398855684096', 1536311398855684096, 0, NULL, '-1', 1, '1');
INSERT INTO `jvs_tree` VALUES ('9a25014ba5b04ea3edab2b59434c7fa0', '其他非金属加工专用设备制造', '其他非金属加工专用设备制造', '1536310829881569492', 1461518083062722560, 612, '', '1536310829881569480', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9a481a587b5743b19be1c6af9e541145', '弹簧制造', '弹簧制造', '9a481a587b5743b19be1c6af9e541145', 1461518083062722560, 594, '', 'b7d629b5dd27447dbbf8664c3521e653', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9a4c21535ecf705fd5cd84042e74b8d9', '木制品制造', '木制品制造', '1536307437964701760', 1461518083062722560, 276, '', '1536307437964701736', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9a6eb48d5b2e44d7a7a2e5a6c8c9f1d7', '综合事务管理机构', '综合事务管理机构', '9a6eb48d5b2e44d7a7a2e5a6c8c9f1d7', 1461518083062722560, 1392, '', 'feeac738e0214b64869a7e61bbf2505c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9aa16a99506845378959018da0c1c305', '果菜汁及果菜汁饮料制造', '果菜汁及果菜汁饮料制造', '9aa16a99506845378959018da0c1c305', 1461518083062722560, 197, '', 'f77c488fca9e415bb74990de42777f54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9aa39eb68efb40c59ede48198bf1a17d', '家用美容、保健电器具制造', '家用美容、保健电器具制造', '9aa39eb68efb40c59ede48198bf1a17d', 1461518083062722560, 724, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9ac48bcdf1254e4db5e94e2fed4b368e', '日用家电设备零售', '日用家电设备零售', '9ac48bcdf1254e4db5e94e2fed4b368e', 1461518083062722560, 968, '', '30c19ce6a3094ce983f55d95dd4b19e1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9ac718d3a2674cd3ba0eb93f96c19874', '五金、家具及室内装饰材料专门零售', '五金、家具及室内装饰材料专门零售', '9ac718d3a2674cd3ba0eb93f96c19874', 1461518083062722560, 972, '', '47cb2cc4493644aa90fc6922d3b34448', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9ac8fbbe5e7d426ea78f15654b6eb377', '棉、麻批发', '棉、麻批发', '9ac8fbbe5e7d426ea78f15654b6eb377', 1461518083062722560, 862, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9af8c5dea1fa4f4f9e72c5c6716c9632', '其他运输设备修理', '其他运输设备修理', '9af8c5dea1fa4f4f9e72c5c6716c9632', 1461518083062722560, 805, '', 'eb874e229b154ae8b8db2ed8a5bd965f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9b30e5410ac1404e9d0be06bc34b8980', '音响设备制造', '音响设备制造', '9b30e5410ac1404e9d0be06bc34b8980', 1461518083062722560, 753, '', '111b3d7fc3364dfea496a12261021c65', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9b4a757d5b704ad875d586bec873d458', '文化、办公用机械制造', '文化、办公用机械制造', '1536310829881569452', 1461518083062722560, 584, '', '1536310829881569392', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9b4c274148a547889be1a732d0d5d2cb', '炼焦', '炼焦', '9b4c274148a547889be1a732d0d5d2cb', 1461518083062722560, 348, '', 'af344b73bd07415f97213c1ba915aaac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9b6d9e6363d64e32a9e6aa0aade9cd27', '咨询与调查', '咨询与调查', '9b6d9e6363d64e32a9e6aa0aade9cd27', 1461518083062722560, 1159, '', '1d4aa2be74514a73925194b48b570791', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9b838b6e3fde4e96a9780341f1726855', '复印和胶印设备制造', '复印和胶印设备制造', '9b838b6e3fde4e96a9780341f1726855', 1461518083062722560, 588, '', '28431578cb7545b4afd7fd13da26977d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9b8cc24b3e6e466184a62a35f5b06f00', '邮购及电视、电话零售', '邮购及电视、电话零售', '9b8cc24b3e6e466184a62a35f5b06f00', 1461518083062722560, 986, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9b9390b4aad6415f902c273f18056544', '摩托车及零配件批发', '摩托车及零配件批发', '9b9390b4aad6415f902c273f18056544', 1461518083062722560, 911, '', 'e821e1d643de40508001dfe91309f8fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9bd394833dd6402cb2a5999b79e4ac43', '专用化学产品制造', '专用化学产品制造', '9bd394833dd6402cb2a5999b79e4ac43', 1461518083062722560, 378, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9bdf52ff60cf64798dffa4c03b5917a2', '其他物料搬运设备制造', '其他物料搬运设备制造', '1536307437964701824', 1461518083062722560, 565, '', '1536307437964701812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9beb65bb65f44163aad408849ae3f87e', '雕塑工艺品制造', '雕塑工艺品制造', '9beb65bb65f44163aad408849ae3f87e', 1461518083062722560, 324, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9c539b2f3c374ec285af2833bac804a7', '钢压延加工', '钢压延加工', '9c539b2f3c374ec285af2833bac804a7', 1461518083062722560, 481, '', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9c864033246b8b44c33827508d3ec47b', '电线、电缆、光缆及电工器材制造', '电线、电缆、光缆及电工器材制造', '1536307437964701972', 1461518083062722560, 709, '', '1536307437964701968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9cd374facd5921c90ddf2b0459b17b05', '计划生育技术服务活动', '计划生育技术服务活动', '1536307437964702108', 1461518083062722560, 1324, '', '1536307437964702084', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9d486dc9a041665b8eea755b14819805', '中医医院', '中医医院', '1536311398968930466', 1461518083062722560, 1314, '', '1536311398968930462', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9d55dd2844954503ab161d88e8faae57', '旅游饭店', '旅游饭店', '9d55dd2844954503ab161d88e8faae57', 1461518083062722560, 1051, '', '58984e57abfd4f499dde649df815b791', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9d882fb2f70147d29752b7c7f495e603', '图书馆与档案馆', '图书馆与档案馆', '9d882fb2f70147d29752b7c7f495e603', 1461518083062722560, 1360, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9d8b894d3d13758fe4d638705a7d404a', '缝制机械制造', '缝制机械制造', '1536310829881569524', 1461518083062722560, 629, '', '1536310829881569520', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9df0963d73874bb6854f911bb726f362', '文教、工美、体育和娱乐用品制造业', '文教、工美、体育和娱乐用品制造业', '9df0963d73874bb6854f911bb726f362', 1461518083062722560, 311, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9dff8e99b53f46a08b2a82d317b1ce82', '信息传输、软件和信息技术服务业', '信息传输、软件和信息技术服务业', '9dff8e99b53f46a08b2a82d317b1ce82', 1461518083062722560, 1066, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9e0aaca4f0e69d72ccda5218eea9f316', '缝制机械制造', '缝制机械制造', '1536307437964701940', 1461518083062722560, 629, '', '1536307437964701936', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9e1ffa4c6996473090d892dfabcecd2b', '灯具、装饰物品批发', '灯具、装饰物品批发', '9e1ffa4c6996473090d892dfabcecd2b', 1461518083062722560, 882, '', '3fed51964f224f8faa5db756cfafda81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9e28bf4268f54cb8a9385fd5024c7fec', '期货市场服务', '期货市场服务', '9e28bf4268f54cb8a9385fd5024c7fec', 1461518083062722560, 1105, '', 'fe3e3e4436c9442eae431f53420dde54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9e29165441dc45d79b592f1cf405dc7a', '其他运输代理业', '其他运输代理业', '9e29165441dc45d79b592f1cf405dc7a', 1461518083062722560, 1039, '', '04a5a05cee214eb096d670718e4fc305', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9e7f2a5b81824838930e7283fe491bc5', '镁冶炼', '镁冶炼', '9e7f2a5b81824838930e7283fe491bc5', 1461518083062722560, 491, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9e99069b90591068cd1fe97eaf009793', '洗涤机械制造', '洗涤机械制造', '1536310829881569528', 1461518083062722560, 630, '', '1536310829881569520', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9ea5a006251048ffb0403fc8ffc4f71d', '汽轮机及辅机制造', '汽轮机及辅机制造', '9ea5a006251048ffb0403fc8ffc4f71d', 1461518083062722560, 548, '', 'eeb06ef1eabf45dc9214022934a5ad13', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9ee66b5e90334cf8a88212031b5e82fe', '染料制造', '染料制造', '9ee66b5e90334cf8a88212031b5e82fe', 1461518083062722560, 371, '', 'b582e29d66aa4ac4bb3ec657198b0477', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9eee25850e8d4171933ec926d7e1e834', '游乐园', '游乐园', '9eee25850e8d4171933ec926d7e1e834', 1461518083062722560, 1379, '', '1efeeb730bc14c778d6071408da57297', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f0493e3ebfe4735ba50dcd0543d807f', '其他非货币银行服务', '其他非货币银行服务', '9f0493e3ebfe4735ba50dcd0543d807f', 1461518083062722560, 1098, '', 'db8176d86056497cb391d51ff575ca81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f056a97bc214b238d885d4accd08d34', '自然科学研究和试验发展', '自然科学研究和试验发展', '9f056a97bc214b238d885d4accd08d34', 1461518083062722560, 1189, '', '19a60ca5cac04fb4bae6d2cb8c8fe801', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f3237a2d8b10917056e684f7e255fcd', '其他物料搬运设备制造', '其他物料搬运设备制造', '1536310829881569408', 1461518083062722560, 565, '', '1536310829881569396', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9f44a41d49744778abeeae62980a25f1', '其他娱乐业', '其他娱乐业', '9f44a41d49744778abeeae62980a25f1', 1461518083062722560, 1385, '', '1efeeb730bc14c778d6071408da57297', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f741ded47174b37b13f861f4e8e7d1e', '橡胶和塑料制品业', '橡胶和塑料制品业', '9f741ded47174b37b13f861f4e8e7d1e', 1461518083062722560, 415, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f952c227bad4255b9b4089abbda47d3', '氮肥制造', '氮肥制造', '9f952c227bad4255b9b4089abbda47d3', 1461518083062722560, 358, '', '10f07810f0d947289092d4489bea5968', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f9618d9baf74be1b2fd478c5e7333c3', '制药专用设备制造', '制药专用设备制造', '9f9618d9baf74be1b2fd478c5e7333c3', 1461518083062722560, 622, '', '19493c65e8fa413a92c97fe37446f1ff', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9f99af85252e480c83ee87e10d0f2cf7', '缫丝加工', '缫丝加工', '9f99af85252e480c83ee87e10d0f2cf7', 1461518083062722560, 220, '', '2f6bcefd63b641198860de06c8ef18fb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('9fa0b52505648b0e98077b779c725d24', '医院', '医院', '1536311398968930462', 1461518083062722560, 1312, '', '1536311398968930458', 0, '1');
INSERT INTO `jvs_tree` VALUES ('9fa279832b9d4579a0fbd2061c22f525', '妇联', '妇联', '9fa279832b9d4579a0fbd2061c22f525', 1461518083062722560, 1410, '', 'b78db952034f49eca2e0456b36962c91', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a002095b0fa94f118241d7287713fb09', '不提供住宿社会工作', '不提供住宿社会工作', 'a002095b0fa94f118241d7287713fb09', 1461518083062722560, 1337, '', '6a4f510a481b4087950d90df6f0f458e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a0221f4c8b9d4d8e9fc093bb7a1d0127', '建筑工程机械与设备租赁', '建筑工程机械与设备租赁', 'a0221f4c8b9d4d8e9fc093bb7a1d0127', 1461518083062722560, 1141, '', '8f386fcc48054b529a2ac3b11d704051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a045ed3ee271415fb91e1384e8f1b5f6', '护理机构服务', '护理机构服务', 'a045ed3ee271415fb91e1384e8f1b5f6', 1461518083062722560, 1332, '', '1d02fedd900d4a5db196ea9a573236df', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a059016ac0824447a5a0c5ffcfc38f2d', '污水处理及其再生利用', '污水处理及其再生利用', 'a059016ac0824447a5a0c5ffcfc38f2d', 1461518083062722560, 824, '', 'f2dddd6c1808403185f836583368d9b7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a05924b51b4244eaa4831a7fe560fc66', '普通高等教育', '普通高等教育', 'a05924b51b4244eaa4831a7fe560fc66', 1461518083062722560, 1301, '', '78f0bd3a69c248669295e5e94914db84', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a06489bc93635d15322f58e06b24b46b', '计划生育技术服务活动', '计划生育技术服务活动', '1536310829881569692', 1461518083062722560, 1324, '', '1536310829881569668', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a07c620a84af0e66b183d2dd16a527e6', '改装汽车制造', '改装汽车制造', '1536310829881569536', 1461518083062722560, 662, '', '1536310829881569532', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a08a1771a11eaf184b8e511054a6ad24', '纸浆制造', '纸浆制造', '1536310379493011463', 1461518083062722560, 294, '', '1536310379493011459', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a0a8189a315f80c6238b550267104209', '物料搬运设备制造', '物料搬运设备制造', '1536311398964736116', 1461518083062722560, 559, '', '1536311398964736112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a0dc50c7e39ff1d6e6bcfa4356a065a7', '室内娱乐活动', '室内娱乐活动', '1536294082927473046', 1461518083062722560, 1374, '', '1536294082927473042', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a0eb5f51cc3cf40e68c3ebd8551b0e1b', '广播、电视、电影和影视录音制作业', '广播、电视、电影和影视录音制作业', '1536310379493011791', 1461518083062722560, 1350, '', '1536310379493011787', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a1244a1898e945ebbb44aeb13a95b69f', '酒精制造', '酒精制造', 'a1244a1898e945ebbb44aeb13a95b69f', 1461518083062722560, 188, '', 'f6f9e986c5a64965b65cc4b7569d7949', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a18dba1f852119c28fcd2e4e32dbbdfe', '卫生', '卫生', '1536310829881569668', 1461518083062722560, 1311, '', '1536310829881569664', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a1c185b7f35bc8ce05d62e90d9d28ca7', '地质勘探和地震专用仪器制造', '地质勘探和地震专用仪器制造', '1536311398968930402', 1461518083062722560, 777, '', '1536311398968930394', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a1d18a8c7d174316b7a3d37f12185218', '电气安装', '电气安装', 'a1d18a8c7d174316b7a3d37f12185218', 1461518083062722560, 846, '', '1bc0fe7f5c88495a938bfbb1613ecbef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a1dab6820d7d431f83901d9819d5ef89', '五金零售', '五金零售', 'a1dab6820d7d431f83901d9819d5ef89', 1461518083062722560, 973, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a20b7c0692ed3071586d693ca6ed000c', '烟草生产专用设备制造', '烟草生产专用设备制造', '1536311398964736224', 1461518083062722560, 616, '', '1536311398964736216', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a21004f21ace03a9a61613b832f932f4', '农、林、牧、渔业', '农、林、牧、渔业', '1536294082923278336', 1461518083062722560, 1, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a23b00d3a4314645b032db560f645988', '其他旅行社相关服务', '其他旅行社相关服务', 'a23b00d3a4314645b032db560f645988', 1461518083062722560, 1174, '', '034de10ed9434b67946c80c8e2fb8a78', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a298e5d79baf46bc85bd0a4e34e3b7c4', '其他农业', '其他农业', 'a298e5d79baf46bc85bd0a4e34e3b7c4', 1461518083062722560, 34, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a2abd528b6ea4f6cb22af195724b1694', '其他常用有色金属矿采选', '其他常用有色金属矿采选', 'a2abd528b6ea4f6cb22af195724b1694', 1461518083062722560, 103, '', 'e3e5f433000e4a8582130236036331bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a2e5ecb223e49059eea1a4c37805f1de', '塑料家具制造', '塑料家具制造', '1536310829881569368', 1461518083062722560, 291, '', '1536310829881569356', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a2f1159020b44c108435d2fdd5410e60', '眼镜制造', '眼镜制造', 'a2f1159020b44c108435d2fdd5410e60', 1461518083062722560, 785, '', '14cd1160b51347f7af080f844905b128', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a30057bad4994bfa9049c45c55b82e81', '金属制品、机械和设备修理业', '金属制品、机械和设备修理业', 'a30057bad4994bfa9049c45c55b82e81', 1461518083062722560, 797, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a3bbc036477c87e84fcd201c08b76757', '木材加工', '木材加工', '1536294082927472650', 1461518083062722560, 266, '', '1536294082927472646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a402270dd3274eec896e0ea9e5f4b851', '陶瓷制品制造', '陶瓷制品制造', 'a402270dd3274eec896e0ea9e5f4b851', 1461518083062722560, 465, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a421ab27a1494a27859c926d0c6df5ab', '其他居民服务业', '其他居民服务业', 'a421ab27a1494a27859c926d0c6df5ab', 1461518083062722560, 1265, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a467e8b079c9404588ae5433a0a51093', '中国共产党机关', '中国共产党机关', 'a467e8b079c9404588ae5433a0a51093', 1461518083062722560, 1387, '', '947e0f87323b430ea5d5c7689ab006cf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a4d441ddb98146c5885de5fe8230d0f6', '化纤织造及印染精加工', '化纤织造及印染精加工', 'a4d441ddb98146c5885de5fe8230d0f6', 1461518083062722560, 223, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a4fab73c59283ddea616f07bd678b5fc', '民族医院', '民族医院', '1536310829881569684', 1461518083062722560, 1316, '', '1536310829881569672', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a545bfa546f84451a0df365f1a1b2c2c', '焙烤食品制造', '焙烤食品制造', 'a545bfa546f84451a0df365f1a1b2c2c', 1461518083062722560, 159, '', 'bdccc103aea04c328baa79ac2d2af736', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a557fefd5b904730a9b141c5bc5d7e6c', '综合零售', '综合零售', 'a557fefd5b904730a9b141c5bc5d7e6c', 1461518083062722560, 925, '', '47cb2cc4493644aa90fc6922d3b34448', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a55c3508f100159bba91d531d61dfc16', '电车制造', '电车制造', '1536307437964701960', 1461518083062722560, 664, '', '1536307437964701948', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a5b18d7cb143f99c5ba4a9f6642d5911', '计划生育技术服务活动', '计划生育技术服务活动', '1536310379493011779', 1461518083062722560, 1324, '', '1536310379493011755', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a5c3b5ba60784605877fbe03bdcf00c1', '仁果类和核果类水果种植', '仁果类和核果类水果种植', 'a5c3b5ba60784605877fbe03bdcf00c1', 1461518083062722560, 23, '', '01e1d829d1e245d5bf3a066ce77191f3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a5ef7f7b5c784ad9b3ea357ad6f98182', '电信', '电信', 'a5ef7f7b5c784ad9b3ea357ad6f98182', 1461518083062722560, 1068, '', '3f17841046934332b6147dd9a026e57a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a5fa5658096541a8bebd7e661896c4a7', '工艺美术品及收藏品零售', '工艺美术品及收藏品零售', 'a5fa5658096541a8bebd7e661896c4a7', 1461518083062722560, 954, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a6165341cc10bac606460dcbbe34ed60', '汽车制造业', '汽车制造业', '1536310829881569532', 1461518083062722560, 660, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a61858ba7a004b92a29eec49210a38f7', '铝矿采选', '铝矿采选', 'a61858ba7a004b92a29eec49210a38f7', 1461518083062722560, 101, '', 'e3e5f433000e4a8582130236036331bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a63d4909cd46450aa65afa722c3dd627', '航空货物运输', '航空货物运输', 'a63d4909cd46450aa65afa722c3dd627', 1461518083062722560, 1026, '', '1611b23fc7984c5fa508984e2aa3889d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a68524e0745c4f7da53766d8581b75af', '专用设备修理', '专用设备修理', 'a68524e0745c4f7da53766d8581b75af', 1461518083062722560, 800, '', 'a30057bad4994bfa9049c45c55b82e81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a6932ec98d1774469e819a8e11266bc3', '纺织服装、服饰业', '纺织服装、服饰业', '1536294082923278360', 1461518083062722560, 241, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a6bca12884e346d8821c1d7981f07337', '胶合板制造', '胶合板制造', 'a6bca12884e346d8821c1d7981f07337', 1461518083062722560, 272, '', '97753ff411f04aadb0ab4b230d80c204', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a6eb103c258943c396c72b2087608bd4', '其他航空运输辅助活动', '其他航空运输辅助活动', 'a6eb103c258943c396c72b2087608bd4', 1461518083062722560, 1031, '', 'ed3a0d30eeac49ff8a4cdcd53d6e5c2b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a6f3c56f2b9c9f3611e0c7110e117866', '科学研究和技术服务业', '科学研究和技术服务业', '1536311398968930442', 1461518083062722560, 1187, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a7a9d4f76a264329abd5e763f87e6e4c', '贸易代理', '贸易代理', 'a7a9d4f76a264329abd5e763f87e6e4c', 1461518083062722560, 918, '', '5ce62088c5924e39b3ecbcd705486863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a7bd9c17d35f4ad3a18468626a8056ad', '空中交通管理', '空中交通管理', 'a7bd9c17d35f4ad3a18468626a8056ad', 1461518083062722560, 1030, '', 'ed3a0d30eeac49ff8a4cdcd53d6e5c2b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a7f809990927455bba2350c3cbd65540', '批发业', '批发业', 'a7f809990927455bba2350c3cbd65540', 1461518083062722560, 857, '', '8b6fbbb6b949405e9b03521bc9a45933', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a7fe440d4a62034d87aa328855201939', '通用设备制造业', '通用设备制造业', '1536307437964701808', 1461518083062722560, 544, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a83c359407bb4707971c974505382c34', '合成橡胶制造', '合成橡胶制造', 'a83c359407bb4707971c974505382c34', 1461518083062722560, 375, '', 'f7a803f3d94a4c97a9d7a53b720aaddc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a83db2419ed14222ac5c8fb814940609', '其他文化用品批发', '其他文化用品批发', 'a83db2419ed14222ac5c8fb814940609', 1461518083062722560, 892, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a8543300332043dba7d6c03531a38208', '管道工程建筑', '管道工程建筑', 'a8543300332043dba7d6c03531a38208', 1461518083062722560, 843, '', '6c020ab0cbb046e0a9a7e4ddf9a232bc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a86fe03eff0340ee869bea35b1c7c364', '屠宰及肉类加工', '屠宰及肉类加工', 'a86fe03eff0340ee869bea35b1c7c364', 1461518083062722560, 140, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a8fcffdb8e8a4da4af04e6a3ea3d90f5', '其他电气机械及器材制造', '其他电气机械及器材制造', 'a8fcffdb8e8a4da4af04e6a3ea3d90f5', 1461518083062722560, 734, '', '52ffeaa5459542128bf67a6d04df1dda', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('a96a9f49a98755345c23dfaadb2ffac2', '核子及核辐射测量仪器制造', '核子及核辐射测量仪器制造', '1536310829881569616', 1461518083062722560, 779, '', '1536310829881569604', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a9ac3e16d36590d72c05a556563fb2dd', '钟表与计时仪器制造', '钟表与计时仪器制造', '1536311398968930410', 1461518083062722560, 782, '', '1536311398968930390', 0, '1');
INSERT INTO `jvs_tree` VALUES ('a9c1496b58f24d2b96209a1bf30dab5c', '地毯、挂毯制造', '地毯、挂毯制造', 'a9c1496b58f24d2b96209a1bf30dab5c', 1461518083062722560, 330, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aa47b412a9b9485aaf48188dca24916d', '电子元件及组件制造', '电子元件及组件制造', 'aa47b412a9b9485aaf48188dca24916d', 1461518083062722560, 761, '', 'dc22550138d34dbabaf1c338b18d8e32', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aa4f7af85e2142ab83ad067dd9312411', '种子批发', '种子批发', 'aa4f7af85e2142ab83ad067dd9312411', 1461518083062722560, 860, '', '34fecdf1a3cb4d2a811fc1a0d62056e2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aa582ac87cb05e7d88e850b3eceb086b', '其他木材加工', '其他木材加工', '1536310379488817212', 1461518083062722560, 270, '', '1536310379488817196', 0, '1');
INSERT INTO `jvs_tree` VALUES ('aa7eae86426348798b655780cb183d98', '金融业', '金融业', 'aa7eae86426348798b655780cb183d98', 1461518083062722560, 1090, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aa9dae2cd52e4057aec328209e155812', '食用菌种植', '食用菌种植', 'aa9dae2cd52e4057aec328209e155812', 1461518083062722560, 19, '', '404950a038404d92b860ec3e34694303', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aa9db11ec962424d847b95f8dc45e105', '动物胶制造', '动物胶制造', 'aa9db11ec962424d847b95f8dc45e105', 1461518083062722560, 384, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aab4fbfa4ce14462adf31e710f964d77', '通用航空服务', '通用航空服务', 'aab4fbfa4ce14462adf31e710f964d77', 1461518083062722560, 1027, '', '3b03d37482194755857827cf9bbe4be3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aae2b0523ea6d29e5bca896eb8d33b67', '皮革、毛皮、羽毛及其制品和制鞋业', '皮革、毛皮、羽毛及其制品和制鞋业', '1536307437964701724', 1461518083062722560, 245, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ab53e793c8e424ee3f74410e6ea02c6b', '烘炉、风机、衡器、包装等设备制造', '烘炉、风机、衡器、包装等设备制造', '1536310379493011515', 1461518083062722560, 575, '', '1536310379493011479', 0, '1');
INSERT INTO `jvs_tree` VALUES ('abda87bdef4f49788c0af9d56167c0a2', '纤维素纤维原料及纤维制造', '纤维素纤维原料及纤维制造', 'abda87bdef4f49788c0af9d56167c0a2', 1461518083062722560, 404, '', '29b41dc4eb2d4efea641b7978812987a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('abe8451608a641289138e19f9b7ee698', '其他农副食品加工', '其他农副食品加工', 'abe8451608a641289138e19f9b7ee698', 1461518083062722560, 153, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('abfffb81021d45a1b6e265a3122fcc62', '其他保险活动', '其他保险活动', 'abfffb81021d45a1b6e265a3122fcc62', 1461518083062722560, 1120, '', '957d60e6ff6847e08c6514eb084a4b35', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ac123d98640b4fd19ec3a8f965b17c73', '铜压延加工', '铜压延加工', 'ac123d98640b4fd19ec3a8f965b17c73', 1461518083062722560, 504, '', '834d7ba750384e2eb50b08718329951f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ac2a9d77758826de744767368c8f74a7', '制造业', '制造业', '1536310829881569284', 1461518083062722560, 132, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ac8071f49ea34a98ad9f120c3a7e9273', '农药制造', '农药制造', 'ac8071f49ea34a98ad9f120c3a7e9273', 1461518083062722560, 364, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ac80dc1fa352e56a4fcb7201245b67df', '锯材加工', '锯材加工', '1536294082927472654', 1461518083062722560, 267, '', '1536294082927472650', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ac8f342689804c8db08dda39b94f7cff', '非金属矿及制品批发', '非金属矿及制品批发', 'ac8f342689804c8db08dda39b94f7cff', 1461518083062722560, 900, '', '40b02e3c160241a8870c0e6451672907', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ac90f2d1790e4ebea65f95f57f72803f', '齿轮及齿轮减、变速箱制造', '齿轮及齿轮减、变速箱制造', 'ac90f2d1790e4ebea65f95f57f72803f', 1461518083062722560, 573, '', '2b227ad448424e66a0ef3ddb49e57624', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aca35dc304444641afb75e2cc6b7b55c', '旧货零售', '旧货零售', 'aca35dc304444641afb75e2cc6b7b55c', 1461518083062722560, 987, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('acaf52c01252e2f67239e9a5203a6964', '电影放映', '电影放映', '1536294082927473038', 1461518083062722560, 1355, '', '1536294082927473030', 0, '1');
INSERT INTO `jvs_tree` VALUES ('acde93295d5942a6895fd41fb03361e2', '精神康复服务', '精神康复服务', 'acde93295d5942a6895fd41fb03361e2', 1461518083062722560, 1333, '', '1d02fedd900d4a5db196ea9a573236df', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('acf8e7b86d3a4a55a229ba704154412b', '谷物磨制', '谷物磨制', 'acf8e7b86d3a4a55a229ba704154412b', 1461518083062722560, 134, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ad0a5cd81b5143b18c8588e91db6cb8e', '其他橡胶制品制造', '其他橡胶制品制造', 'ad0a5cd81b5143b18c8588e91db6cb8e', 1461518083062722560, 422, '', '242dd78213414f0f9c3ac611b510ec7e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ad3818f998084cf5ba8dc4b6f67ccb93', '生产专用车辆制造', '生产专用车辆制造', 'ad3818f998084cf5ba8dc4b6f67ccb93', 1461518083062722560, 562, '', '0425e3ce9ed84fc493944dbd4663ba4e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ad876619ef5f4704991cc3e400e8ae47', '锰矿、铬矿采选', '锰矿、铬矿采选', 'ad876619ef5f4704991cc3e400e8ae47', 1461518083062722560, 92, '', '3cd116a5463f493da52595279d895ca3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ad9f8745297c2f845206250d9c352fa8', '仪器仪表制造业', '仪器仪表制造业', '1536311398968930390', 1461518083062722560, 764, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ada584a67fbd4a63946bcfe9ec2345dc', '含油果种植', '含油果种植', 'ada584a67fbd4a63946bcfe9ec2345dc', 1461518083062722560, 30, '', 'aed77cd8c3894c43b0ba71a3e2b9156f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('addb22e1e06bae5461b33d81898c03ee', '锯材加工', '锯材加工', '1536307437964701744', 1461518083062722560, 267, '', '1536307437964701740', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ae1406f3373aa771616d694b4cfb311c', '卫生', '卫生', '1536311398968930458', 1461518083062722560, 1311, '', '1536311398968930454', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ae355ad27d1d440b8ae166c1c880f73d', '电视', '电视', 'ae355ad27d1d440b8ae166c1c880f73d', 1461518083062722560, 1352, '', '45b720ad902c4b4790710c3d15cc1883', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ae3a40b3a2554dbba451af13f5d0d768', '核力发电', '核力发电', 'ae3a40b3a2554dbba451af13f5d0d768', 1461518083062722560, 814, '', '5ecd006a532c49b6b294f268e35f4fa1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ae54ab63cc79400dbc340aaf103d8013', '非金融机构支付服务', '非金融机构支付服务', 'ae54ab63cc79400dbc340aaf103d8013', 1461518083062722560, 1126, '', '3bcdeee22fa44217a2505feebf9e6c9b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aeaf5db1400c4a4ea56a1b632c2953a2', '婚姻服务', '婚姻服务', 'aeaf5db1400c4a4ea56a1b632c2953a2', 1461518083062722560, 1263, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aeafb5e1579342ce9ae36ce8de76f348', '通信系统设备制造', '通信系统设备制造', 'aeafb5e1579342ce9ae36ce8de76f348', 1461518083062722560, 744, '', '2cb5d019338e462b955cff0033b7d35c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aed77cd8c3894c43b0ba71a3e2b9156f', '坚果、含油果、香料和饮料作物种植', '坚果、含油果、香料和饮料作物种植', 'aed77cd8c3894c43b0ba71a3e2b9156f', 1461518083062722560, 28, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('aeeb9424578545bd80fb8755b26b1aea', '汽车零配件批发', '汽车零配件批发', 'aeeb9424578545bd80fb8755b26b1aea', 1461518083062722560, 910, '', 'e821e1d643de40508001dfe91309f8fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('af15ffa4171e4df5a01c1e3832b4f60f', '玻璃、陶瓷和搪瓷制品生产专用设备制造', '玻璃、陶瓷和搪瓷制品生产专用设备制造', 'af15ffa4171e4df5a01c1e3832b4f60f', 1461518083062722560, 624, '', '19493c65e8fa413a92c97fe37446f1ff', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('af190cf547144f178f1234471d7b5b57', '游艺器材及娱乐用品制造', '游艺器材及娱乐用品制造', 'af190cf547144f178f1234471d7b5b57', 1461518083062722560, 340, '', '9df0963d73874bb6854f911bb726f362', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('af251c5ef042c221677fb05822beb045', '食品、饮料、烟草及饲料生产专用设备制造', '食品、饮料、烟草及饲料生产专用设备制造', '1536307437964701912', 1461518083062722560, 613, '', '1536307437964701880', 0, '1');
INSERT INTO `jvs_tree` VALUES ('af344b73bd07415f97213c1ba915aaac', '石油加工、炼焦和核燃料加工业', '石油加工、炼焦和核燃料加工业', 'af344b73bd07415f97213c1ba915aaac', 1461518083062722560, 344, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('af6bd77050ab47afaef50ceaa01b2902', '金属压力容器制造', '金属压力容器制造', 'af6bd77050ab47afaef50ceaa01b2902', 1461518083062722560, 521, '', '00d90a3e54fc4c47b928bd83ae0fb741', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('af9693cdded749b891636e34f70e3979', '其他航空航天器制造', '其他航空航天器制造', 'af9693cdded749b891636e34f70e3979', 1461518083062722560, 686, '', '63c782a68b2d4768b625fb2673c9b222', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('afaab8c4990b42cf8d2d8c7b2e0d8db0', '非电力家用器具制造', '非电力家用器具制造', 'afaab8c4990b42cf8d2d8c7b2e0d8db0', 1461518083062722560, 727, '', '52ffeaa5459542128bf67a6d04df1dda', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('afb2f69625eb44c0baf6d03bcea517f3', '铜矿采选', '铜矿采选', 'afb2f69625eb44c0baf6d03bcea517f3', 1461518083062722560, 96, '', 'e3e5f433000e4a8582130236036331bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('afd3826ffd3b46daaa56988163eecdad', '球类制造', '球类制造', 'afd3826ffd3b46daaa56988163eecdad', 1461518083062722560, 334, '', 'bf6890967d994d25a26161fb732004c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('afdbbd69ee604099a37a1cb417d58fec', '河湖治理及防洪设施工程建筑', '河湖治理及防洪设施工程建筑', 'afdbbd69ee604099a37a1cb417d58fec', 1461518083062722560, 837, '', 'ba5038703b2d45b7ae25a76b55542b75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b000a8a119d04cf9a767824b91b76c50', '国际组织', '国际组织', 'b000a8a119d04cf9a767824b91b76c50', 1461518083062722560, 1424, '', '625a69df0c304c27b1c479b1c4a6bf47', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b043f4c16e124cbb9905c6d0d8e76fd1', '纺织业', '纺织业', 'b043f4c16e124cbb9905c6d0d8e76fd1', 1461518083062722560, 206, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b081fc392c9340d68c37ba643310c3c1', '汽车整车制造', '汽车整车制造', 'b081fc392c9340d68c37ba643310c3c1', 1461518083062722560, 661, '', '2c9f7f83b1a041279b95fd1b35c8a23c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b0aa9ed2d25f4c6181f4fa057fdef141', '农业', '农业', 'b0aa9ed2d25f4c6181f4fa057fdef141', 1461518083062722560, 2, '', '13d75bb0e0d1450aaac9436826617835', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b0c98438277e46a4aa7d7820b63c366e', '文物及非物质文化遗产保护', '文物及非物质文化遗产保护', 'b0c98438277e46a4aa7d7820b63c366e', 1461518083062722560, 1363, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b0cbc289b1bbcf0c37f6dacd08100d19', '其他传动部件制造', '其他传动部件制造', '1536294082927472750', 1461518083062722560, 574, '', '1536294082927472746', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b0cea9d08fd9c81d32479b815231663e', '医院', '医院', '1536310379493011759', 1461518083062722560, 1312, '', '1536310379493011755', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b12bd6ac0ef0476485df4f8db8234835', '其他卫生活动', '其他卫生活动', 'b12bd6ac0ef0476485df4f8db8234835', 1461518083062722560, 1328, '', '4801a7689f0d49c8b12f7c356f357333', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b13c366a4a0fc35ba0b007af1c6f3649', '烘炉、风机、衡器、包装等设备制造', '烘炉、风机、衡器、包装等设备制造', '1536307437964701844', 1461518083062722560, 575, '', '1536307437964701808', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b1756e493dff1c5dfc135888b3ad2d5e', '饲料生产专用设备制造', '饲料生产专用设备制造', '1536294082927472834', 1461518083062722560, 617, '', '1536294082927472822', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b1782354ca11422484782dad6ccb559b', '有色金属合金制造', '有色金属合金制造', 'b1782354ca11422484782dad6ccb559b', 1461518083062722560, 501, '', 'fe277f2855704704a0562cc62cff05ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b181a03747c040739296324b0fa156b9', '毛皮服装加工', '毛皮服装加工', 'b181a03747c040739296324b0fa156b9', 1461518083062722560, 254, '', 'c7fd52d88c344084baf1c4dbd3621cc3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b183152094554cbdbc98dc8ac74fb6d0', '文化艺术业', '文化艺术业', 'b183152094554cbdbc98dc8ac74fb6d0', 1461518083062722560, 1357, '', '567845af441a427eacdd14dfec55fe15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b18babf021b94e86858ae638249ff345', '涤纶纤维制造', '涤纶纤维制造', 'b18babf021b94e86858ae638249ff345', 1461518083062722560, 409, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b1aab88b665b3d7cd7ae90b8b1e76f1b', '其他仪器仪表制造业', '其他仪器仪表制造业', '1536310829881569632', 1461518083062722560, 786, '', '1536310829881569600', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b1b5334668ec4ab6a4ff103a06a96e4e', '丝印染精加工', '丝印染精加工', 'b1b5334668ec4ab6a4ff103a06a96e4e', 1461518083062722560, 222, '', '2f6bcefd63b641198860de06c8ef18fb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b1cc8dd74c484270890e2d21d7e05c40', '会计、审计及税务服务', '会计、审计及税务服务', 'b1cc8dd74c484270890e2d21d7e05c40', 1461518083062722560, 1160, '', '9b6d9e6363d64e32a9e6aa0aade9cd27', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b2093067d435da881be79d942af18db2', '纺织、服装和皮革加工专用设备制造', '纺织、服装和皮革加工专用设备制造', '1536311398968930310', 1461518083062722560, 626, '', '1536311398964736184', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b21a48f6ff9d4439abac3c9c8f391fb2', '电动机制造', '电动机制造', 'b21a48f6ff9d4439abac3c9c8f391fb2', 1461518083062722560, 700, '', '7a259f23ded444af8a75c658e8ab752a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b241a5716023498ca4b2cf684ed0a71d', '其他服务业', '其他服务业', 'b241a5716023498ca4b2cf684ed0a71d', 1461518083062722560, 1282, '', 'ca487ef1343d40f084234fc555aa3361', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b28220a99c7a42608c3a4393df015c7c', '货币银行服务', '货币银行服务', 'b28220a99c7a42608c3a4393df015c7c', 1461518083062722560, 1093, '', '45e05ef36112422fa2ae90520ff7a1de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b28ff0b238614f3bba8f268424209280', '食品、饮料及烟草制品批发', '食品、饮料及烟草制品批发', 'b28ff0b238614f3bba8f268424209280', 1461518083062722560, 866, '', 'a7f809990927455bba2350c3cbd65540', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b290fb638ba04f7291c1e113459b4184', '气体、液体分离及纯净设备制造', '气体、液体分离及纯净设备制造', 'b290fb638ba04f7291c1e113459b4184', 1461518083062722560, 578, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b2d5e10784367827e7bfe3822b447220', '纺织服装、服饰业', '纺织服装、服饰业', '1536310829881569304', 1461518083062722560, 241, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b2eac7458a9e4b62869529e05c8b1f22', '医疗仪器设备及器械制造', '医疗仪器设备及器械制造', 'b2eac7458a9e4b62869529e05c8b1f22', 1461518083062722560, 643, '', '5c83d76a57d74a5aa3f0c5b69841aadd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b2fc30f526e04e89968135939fc74bb3', '服饰制造', '服饰制造', 'b2fc30f526e04e89968135939fc74bb3', 1461518083062722560, 244, '', '5ed90afabfb749a381d0b606031f88d5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b31b956ba8a94d0eac42c24eac0249d9', '电气设备修理', '电气设备修理', 'b31b956ba8a94d0eac42c24eac0249d9', 1461518083062722560, 806, '', 'a30057bad4994bfa9049c45c55b82e81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b353d0206fd3451290489d23e611bf7b', '管道和设备安装', '管道和设备安装', 'b353d0206fd3451290489d23e611bf7b', 1461518083062722560, 847, '', '1bc0fe7f5c88495a938bfbb1613ecbef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b36cae014d00dd6f838cab6490743de3', '光学仪器制造', '光学仪器制造', '1536310379493011715', 1461518083062722560, 784, '', '1536310379493011711', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b3b48985053b0f389678f35647918284', '炼油、化工生产专用设备制造', '炼油、化工生产专用设备制造', '1536310829881569484', 1461518083062722560, 607, '', '1536310829881569480', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b3c72e56881c46f4b6382f1f35f86b8f', '中成药生产', '中成药生产', 'b3c72e56881c46f4b6382f1f35f86b8f', 1461518083062722560, 399, '', 'e4a034315f244268b87181669e0a6580', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b4065f88999d45bc82c714dffa40cfe0', '刨花板制造', '刨花板制造', 'b4065f88999d45bc82c714dffa40cfe0', 1461518083062722560, 274, '', '97753ff411f04aadb0ab4b230d80c204', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b42877391ab8cdc3a9a1762c69cedfd9', '采矿、冶金、建筑专用设备制造', '采矿、冶金、建筑专用设备制造', '1536311398964736188', 1461518083062722560, 599, '', '1536311398964736184', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b466508383604072b9530e8e0208d117', '石油开采', '石油开采', 'b466508383604072b9530e8e0208d117', 1461518083062722560, 88, '', 'f5b88214f5184db3a6d8bcced3d91ad7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b47042f07a4d9424fd4dd43d26275150', '木材加工和木、竹、藤、棕、草制品业', '木材加工和木、竹、藤、棕、草制品业', '1536311398964736040', 1461518083062722560, 265, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b48ff30384a94787a68e806d5ca398f4', '颜料制造', '颜料制造', 'b48ff30384a94787a68e806d5ca398f4', 1461518083062722560, 370, '', 'b582e29d66aa4ac4bb3ec657198b0477', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b4b0c0dcf5964fee840f479f79c1c824', '综合医院', '综合医院', 'b4b0c0dcf5964fee840f479f79c1c824', 1461518083062722560, 1313, '', '196969e76c044d5280fd58008700d1d4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b51a112c86751aebd8171a11c473fe93', '食品、饮料、烟草及饲料生产专用设备制造', '食品、饮料、烟草及饲料生产专用设备制造', '1536310829881569496', 1461518083062722560, 613, '', '1536310829881569464', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b5210ed1f0304474a251e592d21f2258', '日用化学产品制造', '日用化学产品制造', 'b5210ed1f0304474a251e592d21f2258', 1461518083062722560, 389, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b52b2bcf068345d482625cf7a538d468', '塑料包装箱及容器制造', '塑料包装箱及容器制造', 'b52b2bcf068345d482625cf7a538d468', 1461518083062722560, 429, '', '50976a2f43bc4cc5955a536de9d07368', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b5460f18ff68dcf9652d167cad52b2ad', '采矿、冶金、建筑专用设备制造', '采矿、冶金、建筑专用设备制造', '1536310379493011555', 1461518083062722560, 599, '', '1536310379493011551', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b55f052cfc11484ca8b6efaea52c7d26', '工业自动控制系统装置制造', '工业自动控制系统装置制造', 'b55f052cfc11484ca8b6efaea52c7d26', 1461518083062722560, 766, '', 'd0f29cd031234e9f86540ef6ebf43e55', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b57567d4ff5e45f79b1878e22cf38c7d', '其他安全保护服务', '其他安全保护服务', 'b57567d4ff5e45f79b1878e22cf38c7d', 1461518083062722560, 1178, '', '75759f7c7e814c42ae1389ee2a613800', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b582e29d66aa4ac4bb3ec657198b0477', '涂料、油墨、颜料及类似产品制造', '涂料、油墨、颜料及类似产品制造', 'b582e29d66aa4ac4bb3ec657198b0477', 1461518083062722560, 367, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b58bd9253692458cbbfdf0e589c39e11', '房地产业', '房地产业', 'b58bd9253692458cbbfdf0e589c39e11', 1461518083062722560, 1130, '', '0d06a8b250eb4960bcc1435549fedc3e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b58c62690dd347f4bef562246ef4dfa4', '锑冶炼', '锑冶炼', 'b58c62690dd347f4bef562246ef4dfa4', 1461518083062722560, 489, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b58cbe491c784c578642e43ad5edaab8', '其他纸制品制造', '其他纸制品制造', 'b58cbe491c784c578642e43ad5edaab8', 1461518083062722560, 303, '', '444e78708ad74fc4b12fe29eb4388153', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b5bc9e28489faf023857ef6437e3c8ba', '饲料加工', '饲料加工', '1536310829881569292', 1461518083062722560, 135, '', '1536310829881569288', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b5bd316b3f304169b6ca86221528cc30', '其他房地产业', '其他房地产业', 'b5bd316b3f304169b6ca86221528cc30', 1461518083062722560, 1135, '', 'b58bd9253692458cbbfdf0e589c39e11', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b5f170d2b0984c259cd9b9fa27632f85', '羊的饲养', '羊的饲养', 'b5f170d2b0984c259cd9b9fa27632f85', 1461518083062722560, 52, '', 'cecc6d30ab22456791361548e1d0f5db', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b60b8dfd42484b8e89f46f5970111a8d', '生活用燃料零售', '生活用燃料零售', 'b60b8dfd42484b8e89f46f5970111a8d', 1461518083062722560, 988, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b62b1bd59d994738acc39c83c7b24d5e', '日用玻璃制品制造', '日用玻璃制品制造', 'b62b1bd59d994738acc39c83c7b24d5e', 1461518083062722560, 457, '', '7f127fa7b9644592b4899ee6820f5647', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b6394f7571594ccf95d188ac87a1a448', '潜水及水下救捞装备制造', '潜水及水下救捞装备制造', 'b6394f7571594ccf95d188ac87a1a448', 1461518083062722560, 695, '', 'd0ffcc5e893541dcac53472927b87a41', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b64282a18c5f4980b1432a50ceb588fd', '道路运输业', '道路运输业', 'b64282a18c5f4980b1432a50ceb588fd', 1461518083062722560, 998, '', '842789d652984bcc9618bfe915b8dd6b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b6553f5fc13d4359acc4a0467709a7bf', '文化、体育用品及器材批发', '文化、体育用品及器材批发', 'b6553f5fc13d4359acc4a0467709a7bf', 1461518083062722560, 885, '', 'a7f809990927455bba2350c3cbd65540', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b67183c5310442e5bd939723ca155dea', '建筑业', '建筑业', 'b67183c5310442e5bd939723ca155dea', 1461518083062722560, 826, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b67a4c0ca830b76b441e80b99b28a103', '燃气生产和供应业', '燃气生产和供应业', '1536311398968930434', 1461518083062722560, 820, '', '1536311398968930430', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b68aef08db4aa1d9bf03c44bda3f4962', '其他传动部件制造', '其他传动部件制造', '1536307437964701840', 1461518083062722560, 574, '', '1536307437964701836', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b692663c29ea4326a636191ba5ce9e29', '水产品罐头制造', '水产品罐头制造', 'b692663c29ea4326a636191ba5ce9e29', 1461518083062722560, 172, '', '8e1163acd8d046d580f42436854753c4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b6ceaaa5be5525191fa4b09cc1a1bea6', '电线、电缆、光缆及电工器材制造', '电线、电缆、光缆及电工器材制造', '1536311398968930346', 1461518083062722560, 709, '', '1536311398968930342', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b6e94e52f60f4f88a00b19602cd26aa8', '社区医疗与卫生院', '社区医疗与卫生院', 'b6e94e52f60f4f88a00b19602cd26aa8', 1461518083062722560, 1319, '', '4801a7689f0d49c8b12f7c356f357333', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b70c0b39e990e7a59fc16b1a078f64de', '饲料加工', '饲料加工', NULL, 1461518083062722560, 135, '', '1536287528912220160', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b72d815c5fe4451294f416dd1525e4db', '蛋品加工', '蛋品加工', 'b72d815c5fe4451294f416dd1525e4db', 1461518083062722560, 156, '', 'abe8451608a641289138e19f9b7ee698', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b7677f90d185460a8e7dea5ad7a69354', '餐饮业', '餐饮业', 'b7677f90d185460a8e7dea5ad7a69354', 1461518083062722560, 1054, '', 'b7cdad97032448c4bea15d48a998a4e4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b78db952034f49eca2e0456b36962c91', '群众团体', '群众团体', 'b78db952034f49eca2e0456b36962c91', 1461518083062722560, 1408, '', '5954a785d7a0417d91fca5ff381a0c70', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b7a5784234b8657604fca54373e6ff4c', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536307438530932740', 1461518083062722560, 1190, '', '1536307438530932736', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b7b1aa0c3372435bbaa39c785c7455b8', '公路旅客运输', '公路旅客运输', 'b7b1aa0c3372435bbaa39c785c7455b8', 1461518083062722560, 1004, '', 'b64282a18c5f4980b1432a50ceb588fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b7c7a1da12e8aa312b55e3c7d8ede617', '石油钻采专用设备制造', '石油钻采专用设备制造', '1536310829881569472', 1461518083062722560, 601, '', '1536310829881569468', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b7cdad97032448c4bea15d48a998a4e4', '住宿和餐饮业', '住宿和餐饮业', 'b7cdad97032448c4bea15d48a998a4e4', 1461518083062722560, 1049, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b7d629b5dd27447dbbf8664c3521e653', '通用零部件制造', '通用零部件制造', 'b7d629b5dd27447dbbf8664c3521e653', 1461518083062722560, 591, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b802e97d7b2b4be79190e330cf68d146', '其他水产品加工', '其他水产品加工', 'b802e97d7b2b4be79190e330cf68d146', 1461518083062722560, 149, '', '69030142a6a040f0afe0598c6f9d15b8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b815134170f74bb08ef895c26c8fd01f', '水上运输业', '水上运输业', 'b815134170f74bb08ef895c26c8fd01f', 1461518083062722560, 1010, '', '842789d652984bcc9618bfe915b8dd6b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8705a6ea4e84490b21d9956a46812de', '骆驼饲养', '骆驼饲养', 'b8705a6ea4e84490b21d9956a46812de', 1461518083062722560, 53, '', 'cecc6d30ab22456791361548e1d0f5db', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8768c0cbac64280b07e18fe5ad34950', '房屋建筑业', '房屋建筑业', 'b8768c0cbac64280b07e18fe5ad34950', 1461518083062722560, 827, '', 'b67183c5310442e5bd939723ca155dea', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b88d93edc2ed4a328438aa3706db3ecc', '原油加工及石油制品制造', '原油加工及石油制品制造', 'b88d93edc2ed4a328438aa3706db3ecc', 1461518083062722560, 346, '', 'f60f3ba8db444b7da5a8bb48b1b38978', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8a2e0cb7bab4681ae38e5cf1f956237', '盐及调味品批发', '盐及调味品批发', 'b8a2e0cb7bab4681ae38e5cf1f956237', 1461518083062722560, 871, '', 'b28ff0b238614f3bba8f268424209280', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8a610ee184c44aa8cdd9bf233058962', '影视录放设备制造', '影视录放设备制造', 'b8a610ee184c44aa8cdd9bf233058962', 1461518083062722560, 754, '', '111b3d7fc3364dfea496a12261021c65', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8ce00fbe5dd4c128f5563fcf9b357a5', '老年人、残疾人养护服务', '老年人、残疾人养护服务', 'b8ce00fbe5dd4c128f5563fcf9b357a5', 1461518083062722560, 1334, '', '1d02fedd900d4a5db196ea9a573236df', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8d325587ee84c079fbb5c577c59632e', '市政道路工程建筑', '市政道路工程建筑', 'b8d325587ee84c079fbb5c577c59632e', 1461518083062722560, 833, '', 'bb9b27e8b29448acbc29064678ff48ba', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8f0ab7b439e4c41b7e18a2513763e06', '其他常用有色金属冶炼', '其他常用有色金属冶炼', 'b8f0ab7b439e4c41b7e18a2513763e06', 1461518083062722560, 492, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8f1da43ff144b07ac820602e523c419', '洗染服务', '洗染服务', 'b8f1da43ff144b07ac820602e523c419', 1461518083062722560, 1259, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b8f57c7173f64314e58f4ba913fe94b2', '其他日用品生产专用设备制造', '其他日用品生产专用设备制造', '1536310829881569516', 1461518083062722560, 625, '', '1536310829881569512', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b91f46f572a444679c1ec214a45051cf', '中药材种植', '中药材种植', 'b91f46f572a444679c1ec214a45051cf', 1461518083062722560, 33, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b92c424c84a84b55bc8b388bc7264c6d', '财产保险', '财产保险', 'b92c424c84a84b55bc8b388bc7264c6d', 1461518083062722560, 1115, '', '957d60e6ff6847e08c6514eb084a4b35', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b93a3eb108a216a90120bd6fc49d6101', '娱乐业', '娱乐业', '1536310379493011803', 1461518083062722560, 1373, '', '1536310379493011787', 0, '1');
INSERT INTO `jvs_tree` VALUES ('b9630eb6fbec4c15b18f6b2d89fdb1ae', '有色金属矿采选业', '有色金属矿采选业', 'b9630eb6fbec4c15b18f6b2d89fdb1ae', 1461518083062722560, 94, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b99e8e8decca47a7a48112aeb683baab', '市政设施管理', '市政设施管理', 'b99e8e8decca47a7a48112aeb683baab', 1461518083062722560, 1248, '', '08a1fc9f693f48129e4bf075c2623051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b99f07a292ce4d8f908e71f6c04aef65', '职业中介服务', '职业中介服务', 'b99f07a292ce4d8f908e71f6c04aef65', 1461518083062722560, 1168, '', 'fdd9cb4ea4a4478285b5deadde6900b9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b9af5c7b559e4ea4a06b552e3b25459d', '民主党派', '民主党派', 'b9af5c7b559e4ea4a06b552e3b25459d', 1461518083062722560, 1404, '', '66b2c24fecfd4459b8da087a21ff6156', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('b9de5a0eb4cd4413a3725e1ebe5ae51f', '音像制品及电子出版物零售', '音像制品及电子出版物零售', 'b9de5a0eb4cd4413a3725e1ebe5ae51f', 1461518083062722560, 952, '', '779538c6a91e4e14a759a39a9a61a5ef', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba00e62b89634c45912959f8845db7b2', '食品及饲料添加剂制造', '食品及饲料添加剂制造', 'ba00e62b89634c45912959f8845db7b2', 1461518083062722560, 184, '', 'f6c96d4d4a84467a99e973b643e6651e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba5038703b2d45b7ae25a76b55542b75', '水利和内河港口工程建筑', '水利和内河港口工程建筑', 'ba5038703b2d45b7ae25a76b55542b75', 1461518083062722560, 835, '', '7ed8bf1d78f34e0d83e5cc49318096f9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba575e30d21f4b14a6fb7d0e5e8e0724', '蔬菜、水果和坚果加工', '蔬菜、水果和坚果加工', 'ba575e30d21f4b14a6fb7d0e5e8e0724', 1461518083062722560, 150, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba701823a1c85b767615f5fb860bd8d3', '饲料生产专用设备制造', '饲料生产专用设备制造', '1536307437964701924', 1461518083062722560, 617, '', '1536307437964701912', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ba7027fac1a10ff85aaf86b9737a47f0', '泵、阀门、压缩机及类似机械制造', '泵、阀门、压缩机及类似机械制造', '1536310829881569412', 1461518083062722560, 566, '', '1536310829881569392', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ba71dda4283b4a00aabe5dcf2bbb4d26', '黑色金属冶炼和压延加工业', '黑色金属冶炼和压延加工业', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 1461518083062722560, 477, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba746a41a9e74e04bf2731afbe248d85', '木竹浆制造', '木竹浆制造', 'ba746a41a9e74e04bf2731afbe248d85', 1461518083062722560, 295, '', '4b51f060d88a4896b978a2aa42d01f48', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba796df3cfb24131878429d177c873cc', '饼干及其他焙烤食品制造', '饼干及其他焙烤食品制造', 'ba796df3cfb24131878429d177c873cc', 1461518083062722560, 161, '', 'a545bfa546f84451a0df365f1a1b2c2c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba87c678485e4627a6d27578adec63ae', '社会事务管理机构', '社会事务管理机构', 'ba87c678485e4627a6d27578adec63ae', 1461518083062722560, 1395, '', 'feeac738e0214b64869a7e61bbf2505c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ba97fa65858f4794b5a805aa99b9219e', '期货市场管理服务', '期货市场管理服务', 'ba97fa65858f4794b5a805aa99b9219e', 1461518083062722560, 1106, '', '9e28bf4268f54cb8a9385fd5024c7fec', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('baab5838e31e4086b0479cd0a7e6acde', '烟草制品批发', '烟草制品批发', 'baab5838e31e4086b0479cd0a7e6acde', 1461518083062722560, 874, '', 'b28ff0b238614f3bba8f268424209280', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('baad0ec665a80dad39429acdae639b3c', '风机、风扇制造', '风机、风扇制造', '1536311398964736156', 1461518083062722560, 577, '', '1536311398964736148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bae6efcfc0be4ac59705109601d0789d', '机械治疗及病房护理设备制造', '机械治疗及病房护理设备制造', 'bae6efcfc0be4ac59705109601d0789d', 1461518083062722560, 648, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bb141041575a483383996b2724513cc4', '信息化学品制造', '信息化学品制造', 'bb141041575a483383996b2724513cc4', 1461518083062722560, 382, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bb4990b53aa242f6b47a120ae423555e', '其他通用零部件制造', '其他通用零部件制造', 'bb4990b53aa242f6b47a120ae423555e', 1461518083062722560, 596, '', 'b7d629b5dd27447dbbf8664c3521e653', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bb4bc24f165c1a562c65795b278b59b1', '电影机械制造', '电影机械制造', '1536307437964701872', 1461518083062722560, 585, '', '1536307437964701868', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bb7cea158f67498499cbcac11f48d63e', '专业化设计服务', '专业化设计服务', 'bb7cea158f67498499cbcac11f48d63e', 1461518083062722560, 1214, '', 'd0ebd453a05c4e08a1bdcbc641239503', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bb9b27e8b29448acbc29064678ff48ba', '铁路、道路、隧道和桥梁工程建筑', '铁路、道路、隧道和桥梁工程建筑', 'bb9b27e8b29448acbc29064678ff48ba', 1461518083062722560, 830, '', '7ed8bf1d78f34e0d83e5cc49318096f9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bbbf4da3703146709d23ddb80fcc9768', '计划生育技术服务活动', '计划生育技术服务活动', '1536311398968930482', 1461518083062722560, 1324, '', '1536311398968930458', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bc265bb0211c48f8b8e8a38afaf2579e', '煤炭开采和洗选业', '煤炭开采和洗选业', 'bc265bb0211c48f8b8e8a38afaf2579e', 1461518083062722560, 83, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bc2679bbd64d139ae100679c2b1593cd', '农、林、牧、渔业', '农、林、牧、渔业', '1536310829881569280', 1461518083062722560, 1, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bc704279b429415f89ac350749f2f4cb', '企业总部管理', '企业总部管理', 'bc704279b429415f89ac350749f2f4cb', 1461518083062722560, 1151, '', '559128f608654f4582e8eb81e8ad2b78', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bcb42bf9e1b83a94eb9b3ec67a6b71b3', '塑料加工专用设备制造', '塑料加工专用设备制造', '1536311398964736208', 1461518083062722560, 609, '', '1536311398964736200', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bcc3c21a970d4da48f602e1f07493162', '坚果种植', '坚果种植', 'bcc3c21a970d4da48f602e1f07493162', 1461518083062722560, 29, '', 'aed77cd8c3894c43b0ba71a3e2b9156f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bcf224f87f184269836087114259d07e', '烈士陵园、纪念馆', '烈士陵园、纪念馆', 'bcf224f87f184269836087114259d07e', 1461518083062722560, 1365, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bd059b0fa8614e798d1c7ac8b00d482e', '酱油、食醋及类似制品制造', '酱油、食醋及类似制品制造', 'bd059b0fa8614e798d1c7ac8b00d482e', 1461518083062722560, 177, '', 'f9dd72346d594ba1aa1468374485baf7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bd0ddf8f49a93c6d78e580ee33e0c551', '光纤、光缆制造', '光纤、光缆制造', '1536294082927472886', 1461518083062722560, 711, '', '1536294082927472882', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bd199d7bfa624101afa7978892ecd4d0', '广播电视接收设备及器材制造', '广播电视接收设备及器材制造', 'bd199d7bfa624101afa7978892ecd4d0', 1461518083062722560, 748, '', '15c74911c46e4a99bc107e9108a890fb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bd245f68ece29c08287e3da3bdb7168d', '单板加工', '单板加工', '1536294082927472662', 1461518083062722560, 269, '', '1536294082927472650', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bd44da1fcf2a8942ea278f7f9e40039b', '烘炉、熔炉及电炉制造', '烘炉、熔炉及电炉制造', '1536311398964736152', 1461518083062722560, 576, '', '1536311398964736148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bd463d60b4be1cd2be6001f7b5e019e9', '电影机械制造', '电影机械制造', '1536310379493011543', 1461518083062722560, 585, '', '1536310379493011539', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bd54634fc745408f97349360e2b9e3c5', '基金会', '基金会', 'bd54634fc745408f97349360e2b9e3c5', 1461518083062722560, 1417, '', '5954a785d7a0417d91fca5ff381a0c70', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bdab5e0f45f74b92b9a20a22bbf5695b', '电工仪器仪表制造', '电工仪器仪表制造', 'bdab5e0f45f74b92b9a20a22bbf5695b', 1461518083062722560, 767, '', 'd0f29cd031234e9f86540ef6ebf43e55', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bdc1c4e68a4d8403ff09bdd944b54c33', '纺织服装、服饰业', '纺织服装、服饰业', '1536307437964701720', 1461518083062722560, 241, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bdccc103aea04c328baa79ac2d2af736', '食品制造业', '食品制造业', 'bdccc103aea04c328baa79ac2d2af736', 1461518083062722560, 158, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bdd48c0cb61dc9f001c172bdbd06c462', '燃气生产和供应业', '燃气生产和供应业', '1536310379493011731', 1461518083062722560, 820, '', '1536310379493011727', 0, '1');
INSERT INTO `jvs_tree` VALUES ('bdf6f4a2ac452ebde4966e3d9ac621a1', '烟草生产专用设备制造', '烟草生产专用设备制造', '1536310379493011591', 1461518083062722560, 616, '', '1536310379493011583', 0, '1');
INSERT INTO `jvs_tree` VALUES ('be130eaa590c400eab7eb771b3df4849', '其他信息技术服务业', '其他信息技术服务业', 'be130eaa590c400eab7eb771b3df4849', 1461518083062722560, 1086, '', '18b70958583a491eba2567d01105d429', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('be4b9e71c98e4f80bcae2eb866a82ac8', '矿山机械制造', '矿山机械制造', 'be4b9e71c98e4f80bcae2eb866a82ac8', 1461518083062722560, 600, '', '3e5247bc8341490eb91662c2f0d5613f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('be7f73a51ed045a2b0193b4eaa1cc9a8', '腈纶纤维制造', '腈纶纤维制造', 'be7f73a51ed045a2b0193b4eaa1cc9a8', 1461518083062722560, 410, '', 'dc2608acc24745618cdf1dc1f346ee05', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('be9daa7ee0164df7b381a0bf65894f41', '港口及航运设施工程建筑', '港口及航运设施工程建筑', 'be9daa7ee0164df7b381a0bf65894f41', 1461518083062722560, 838, '', 'ba5038703b2d45b7ae25a76b55542b75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('beb681c40c597426308d0a025bbcac70', '广播、电视、电影和影视录音制作业', '广播、电视、电影和影视录音制作业', '1536307437964702120', 1461518083062722560, 1350, '', '1536307437964702116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('beb7cdd432ead3002019e19977b77a74', '歌舞厅娱乐活动', '歌舞厅娱乐活动', '1536311398968930514', 1461518083062722560, 1375, '', '1536311398968930510', 0, '1');
INSERT INTO `jvs_tree` VALUES ('becd97b515444eeabf323b6111d253b2', '地质勘查专用设备制造', '地质勘查专用设备制造', 'becd97b515444eeabf323b6111d253b2', 1461518083062722560, 653, '', '8b87fe3dddb440b5942961d52baf7863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('beec84b34d87a058f297da8bed4f5006', '木制品制造', '木制品制造', '1536294082927472670', 1461518083062722560, 276, '', '1536294082927472646', 0, '1');
INSERT INTO `jvs_tree` VALUES ('befa94c88da95a9a2290b988ceba00fe', '泵及真空设备制造', '泵及真空设备制造', '1536310829881569416', 1461518083062722560, 567, '', '1536310829881569412', 0, '1');
INSERT INTO `jvs_tree` VALUES ('befb89c2b046fae5bb6b26baef92a9cd', '民族医院', '民族医院', '1536294082927473010', 1461518083062722560, 1316, '', '1536294082927472998', 0, '1');
INSERT INTO `jvs_tree` VALUES ('befc9f8864764e4e91b944c62c1a97b5', '中央银行服务', '中央银行服务', 'befc9f8864764e4e91b944c62c1a97b5', 1461518083062722560, 1092, '', '45e05ef36112422fa2ae90520ff7a1de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bf0533ae97fe4210b968a2d9e8c55ef3', '电线、电缆制造', '电线、电缆制造', 'bf0533ae97fe4210b968a2d9e8c55ef3', 1461518083062722560, 710, '', '31a17bcb9cf24935a1052bbc68fa9d07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bf087c130d004359a9203384d0fe8ca1', '日用电器修理', '日用电器修理', 'bf087c130d004359a9203384d0fe8ca1', 1461518083062722560, 1276, '', '43ce8c991ff7473387cda3efda83ab52', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bf0d94be42ab41f8a610f78363273462', '家庭服务', '家庭服务', 'bf0d94be42ab41f8a610f78363273462', 1461518083062722560, 1257, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bf6890967d994d25a26161fb732004c8', '体育用品制造', '体育用品制造', 'bf6890967d994d25a26161fb732004c8', 1461518083062722560, 333, '', '9df0963d73874bb6854f911bb726f362', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bf6c03542a9a4ccfb4c76f4bea1d145e', '纸和纸板容器制造', '纸和纸板容器制造', 'bf6c03542a9a4ccfb4c76f4bea1d145e', 1461518083062722560, 302, '', '444e78708ad74fc4b12fe29eb4388153', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bfddaafa884b46c88daf513160dfff5c', '工矿工程建筑', '工矿工程建筑', 'bfddaafa884b46c88daf513160dfff5c', 1461518083062722560, 840, '', '7ed8bf1d78f34e0d83e5cc49318096f9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('bfed8cb2ce3f4628bc6513caca196c49', '白酒制造', '白酒制造', 'bfed8cb2ce3f4628bc6513caca196c49', 1461518083062722560, 189, '', 'f6f9e986c5a64965b65cc4b7569d7949', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c01cf4a89346492eb44865639a074a45', '化学原料和化学制品制造业', '化学原料和化学制品制造业', 'c01cf4a89346492eb44865639a074a45', 1461518083062722560, 350, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c055c5de334015d88819dd798a9e0a95', '饲料加工', '饲料加工', '1536310379488817164', 1461518083062722560, 135, '', '1536310379488817160', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c0b1e3297e1f4ac288f1f342cf852995', '酒、饮料及茶叶零售', '酒、饮料及茶叶零售', 'c0b1e3297e1f4ac288f1f342cf852995', 1461518083062722560, 935, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c0b67d8f45384abcb942d646bfc3c79d', '其他道路运输辅助活动', '其他道路运输辅助活动', 'c0b67d8f45384abcb942d646bfc3c79d', 1461518083062722560, 1009, '', '0af114f6710c4fe1950cb9d026b88789', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c1110e380cb2621ff8a2049bbd5c7ae7', '木门窗、楼梯制造', '木门窗、楼梯制造', '1536311398964736068', 1461518083062722560, 278, '', '1536311398964736064', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c157549f8b625af12af99d6cd4fccc12', '照明器具制造', '照明器具制造', '1536294082927472902', 1461518083062722560, 730, '', '1536294082927472878', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c19244a94a5c48e683aea1e2938c7a3f', '塑料鞋制造', '塑料鞋制造', 'c19244a94a5c48e683aea1e2938c7a3f', 1461518083062722560, 262, '', 'c3f468119b194c1a99edf99ae5c8066c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c1d235d0826c4893ad363fc488e0b10f', '水资源专用机械制造', '水资源专用机械制造', 'c1d235d0826c4893ad363fc488e0b10f', 1461518083062722560, 658, '', '8b87fe3dddb440b5942961d52baf7863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c214468f14c8c17dabf96de5529da5fe', '专用仪器仪表制造', '专用仪器仪表制造', '1536310829881569604', 1461518083062722560, 772, '', '1536310829881569600', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c21d26f9f0b4477a804fce132ccfc7ae', '速冻食品制造', '速冻食品制造', 'c21d26f9f0b4477a804fce132ccfc7ae', 1461518083062722560, 167, '', 'eae71131d4e64599b3c04654b478073e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c21d5a6d823e919d5d68ba191baac865', '电影机械制造', '电影机械制造', '1536310829881569456', 1461518083062722560, 585, '', '1536310829881569452', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c280aa92feed4a2c9f6b36072ee56ba1', '林产品初级加工服务', '林产品初级加工服务', 'c280aa92feed4a2c9f6b36072ee56ba1', 1461518083062722560, 78, '', '789befc4bd144da18ee07645854cb3cc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c28c4c296880a02402fc8920dc339dd6', '饲料加工', '饲料加工', NULL, 1461518083062722560, 135, '', '1536282457583443968', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c2b533476b4d0afa56024bc3aac936a4', '缝制机械制造', '缝制机械制造', '1536294082927472850', 1461518083062722560, 629, '', '1536294082927472846', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c2b7187f81674dc68fcdf211151accdf', '木制容器制造', '木制容器制造', 'c2b7187f81674dc68fcdf211151accdf', 1461518083062722560, 280, '', '08c234aebbb444c99b04de865d8f2efb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c2e16d9bf87b4dcc84995d3402df3f79', '橡胶加工专用设备制造', '橡胶加工专用设备制造', 'c2e16d9bf87b4dcc84995d3402df3f79', 1461518083062722560, 608, '', '2c1dfdaf17eb41db8e66fb3f200351da', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c2e6e8d1a04b70c991cfbb239179218e', '科学研究和技术服务业', '科学研究和技术服务业', '1536307437964702068', 1461518083062722560, 1187, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c2f13c83b65343c59a7ca6bb4bd59a1d', '其他住宿业', '其他住宿业', 'c2f13c83b65343c59a7ca6bb4bd59a1d', 1461518083062722560, 1053, '', '58984e57abfd4f499dde649df815b791', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c31948a1fb464bb493ac2cbd9eea7190', '建筑、安全用金属制品制造', '建筑、安全用金属制品制造', 'c31948a1fb464bb493ac2cbd9eea7190', 1461518083062722560, 524, '', 'fb030bf0f03346d09a84b55753afc762', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c319bc47b17641fd884990672ca8ed66', '金矿采选', '金矿采选', 'c319bc47b17641fd884990672ca8ed66', 1461518083062722560, 105, '', '4158f69d42a14c8c904c417676863403', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c33194c8b6acd8ba0b905b2f3d8b2315', '中西医结合医院', '中西医结合医院', '1536310379493011767', 1461518083062722560, 1315, '', '1536310379493011759', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c33b2dd70a974d3380508f597f3f8571', '塑料人造革、合成革制造', '塑料人造革、合成革制造', 'c33b2dd70a974d3380508f597f3f8571', 1461518083062722560, 428, '', '50976a2f43bc4cc5955a536de9d07368', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c33b3f4788a34219b3b2e6d53fe23e6b', '烟叶复烤', '烟叶复烤', 'c33b3f4788a34219b3b2e6d53fe23e6b', 1461518083062722560, 203, '', '61c5ac332567456ca78da58904d39606', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c36a20a9876c4fcab9cd2d4d6362c253', '林木育苗', '林木育苗', 'c36a20a9876c4fcab9cd2d4d6362c253', 1461518083062722560, 38, '', '9869ca6063ba4b0c95c3dec891cf3494', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c3796786035442a7a380f1bd92404d42', '教育', '教育', 'c3796786035442a7a380f1bd92404d42', 1461518083062722560, 1287, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c37eead7fdb94c9886893945f3ff1759', '危险废物治理', '危险废物治理', 'c37eead7fdb94c9886893945f3ff1759', 1461518083062722560, 1244, '', '72c2cabaf7c9440f9933fe2b664a6fc7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c390d9b9da854779b84785330af663a6', '市场管理', '市场管理', 'c390d9b9da854779b84785330af663a6', 1461518083062722560, 1180, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c39f4641ef404d2f8ff61eb846313661', '安全系统监控服务', '安全系统监控服务', 'c39f4641ef404d2f8ff61eb846313661', 1461518083062722560, 1177, '', '75759f7c7e814c42ae1389ee2a613800', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c3accf30125748639c0d5930c9944eb7', '谷物、棉花等农产品仓储', '谷物、棉花等农产品仓储', 'c3accf30125748639c0d5930c9944eb7', 1461518083062722560, 1041, '', '9343f99c36194dca80b0bccab544ba1d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c3be8ffd7ca00435ce24e548ea3274a1', '烘炉、熔炉及电炉制造', '烘炉、熔炉及电炉制造', '1536310379493011519', 1461518083062722560, 576, '', '1536310379493011515', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c3c1cb21367801302def11e5f7e04ed5', 'tree', NULL, '1536288239628644352', 1536288239628644352, 133, NULL, '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c3f468119b194c1a99edf99ae5c8066c', '制鞋业', '制鞋业', 'c3f468119b194c1a99edf99ae5c8066c', 1461518083062722560, 259, '', '41d6e99c8a134d7992628343e52ff28a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c4529689c02641f8aa9cf319eef8648e', '塑料丝、绳及编织品制造', '塑料丝、绳及编织品制造', 'c4529689c02641f8aa9cf319eef8648e', 1461518083062722560, 426, '', '50976a2f43bc4cc5955a536de9d07368', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c4ce6fd369384958bad783eef207a734', '阀门和旋塞制造', '阀门和旋塞制造', 'c4ce6fd369384958bad783eef207a734', 1461518083062722560, 569, '', '5fb0f7308897486587d113f21523204f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c50e19af8df44164a9adff705008044c', '毛织造加工', '毛织造加工', 'c50e19af8df44164a9adff705008044c', 1461518083062722560, 213, '', '3b6376f16a31444bb1b51564e8396af2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c5523500ca9a25fc48f5b89d251be5ca', '烘炉、熔炉及电炉制造', '烘炉、熔炉及电炉制造', '1536310829881569432', 1461518083062722560, 576, '', '1536310829881569428', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c5a42db4e8655a2172c2a669ac7b8acf', '专用设备制造业', '专用设备制造业', '1536311398964736184', 1461518083062722560, 598, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c5b7f439f79747a8b0418b5f3b07ff82', '其他体育', '其他体育', 'c5b7f439f79747a8b0418b5f3b07ff82', 1461518083062722560, 1372, '', 'cf82b0dc32824fb98ef01061303d5bb4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c5dcc2b1c6754393854f6b948a8ce1d5', '货运火车站', '货运火车站', 'c5dcc2b1c6754393854f6b948a8ce1d5', 1461518083062722560, 996, '', '83441daa2a8049aebbba94511aee5316', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c5eeee964f024f649db3c84852d82948', '社会人文科学研究', '社会人文科学研究', 'c5eeee964f024f649db3c84852d82948', 1461518083062722560, 1193, '', '19a60ca5cac04fb4bae6d2cb8c8fe801', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c60c62b9bfcc4346993be89d72569a0e', '地震服务', '地震服务', 'c60c62b9bfcc4346993be89d72569a0e', 1461518083062722560, 1196, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c6440c2649c34ed38c0d3a72e9d32def', '公共就业服务', '公共就业服务', 'c6440c2649c34ed38c0d3a72e9d32def', 1461518083062722560, 1167, '', 'fdd9cb4ea4a4478285b5deadde6900b9', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c645c0a03e53438895c165ddb94df20d', '塑料零件制造', '塑料零件制造', 'c645c0a03e53438895c165ddb94df20d', 1461518083062722560, 431, '', '50976a2f43bc4cc5955a536de9d07368', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c65de6f15b284b19a2eeaa8e5ddc3cd5', '其他互联网服务', '其他互联网服务', 'c65de6f15b284b19a2eeaa8e5ddc3cd5', 1461518083062722560, 1079, '', 'f23500ffa36f47dda2908527522317f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c674dd95111b487bb2cc31b220b0c14a', '其他输配电及控制设备制造', '其他输配电及控制设备制造', 'c674dd95111b487bb2cc31b220b0c14a', 1461518083062722560, 708, '', 'e6d81ec118e14452ae27560ad9c35f44', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c6814870a0e861ea2e6342e2c391213a', '石油钻采专用设备制造', '石油钻采专用设备制造', '1536310379493011559', 1461518083062722560, 601, '', '1536310379493011555', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c6bdcbb8330e42fab9b99c419d15a999', '锡冶炼', '锡冶炼', 'c6bdcbb8330e42fab9b99c419d15a999', 1461518083062722560, 488, '', 'e49064c7cacb47d19a48b381ffed1a07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c6d58b8b0e3048f9a1ce45414036aacd', '疗养院', '疗养院', 'c6d58b8b0e3048f9a1ce45414036aacd', 1461518083062722560, 1318, '', '196969e76c044d5280fd58008700d1d4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c6d636ea1c7fd9a60f7e42056fad95c9', '计算机、通信和其他电子设备制造业', '计算机、通信和其他电子设备制造业', '1536311398968930370', 1461518083062722560, 737, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c71e14ccd31d46af92ed1fd6dccfdb95', '机械化农业及园艺机具制造', '机械化农业及园艺机具制造', 'c71e14ccd31d46af92ed1fd6dccfdb95', 1461518083062722560, 636, '', '96416de0d629464ab952c86bdfc99406', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c7439fe172424ea6a92f8d7c626883da', '商业、饮食、服务专用设备制造', '商业、饮食、服务专用设备制造', 'c7439fe172424ea6a92f8d7c626883da', 1461518083062722560, 655, '', '8b87fe3dddb440b5942961d52baf7863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c7627068ad14730d253028c1f2dd525f', '房地产业', '房地产业', '1536307437964702064', 1461518083062722560, 1129, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c7807c15b3adb4279f97c739174e027d', '洗涤机械制造', '洗涤机械制造', '1536294082927472854', 1461518083062722560, 630, '', '1536294082927472846', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c7832cb0ab7d487d84f59c0a49b3aac3', '远洋货物运输', '远洋货物运输', 'c7832cb0ab7d487d84f59c0a49b3aac3', 1461518083062722560, 1016, '', 'f686b1e78ecb4b0d91fbfd2a1a605018', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c7ba1030bd574b6fb8c90e68a1a3552d', '稀土金属冶炼', '稀土金属冶炼', 'c7ba1030bd574b6fb8c90e68a1a3552d', 1461518083062722560, 499, '', '6faa325e961b4edfb8ab64b573e808fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c7c4adba557245d397578cd7cac65674', '医疗、外科及兽医用器械制造', '医疗、外科及兽医用器械制造', 'c7c4adba557245d397578cd7cac65674', 1461518083062722560, 647, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c7f8035048d140ca330bde59fd5fe9cf', '专用仪器仪表制造', '专用仪器仪表制造', '1536294082927472930', 1461518083062722560, 772, '', '1536294082927472926', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c7fd52d88c344084baf1c4dbd3621cc3', '毛皮鞣制及制品加工', '毛皮鞣制及制品加工', 'c7fd52d88c344084baf1c4dbd3621cc3', 1461518083062722560, 252, '', '41d6e99c8a134d7992628343e52ff28a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c7fd548cabdfc17f17fef670c4260794', '制造业', '制造业', '1536310379488817156', 1461518083062722560, 132, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c85b77fb1b19583b4b401aa7c3ddadc1', '风机、风扇制造', '风机、风扇制造', '1536310829881569436', 1461518083062722560, 577, '', '1536310829881569428', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c87a21e3c3154e43b41c9bd5d3b92a8e', '卷烟制造', '卷烟制造', 'c87a21e3c3154e43b41c9bd5d3b92a8e', 1461518083062722560, 204, '', '61c5ac332567456ca78da58904d39606', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c8cd07904863ddcc24c641020fc8d552', '其他日用品生产专用设备制造', '其他日用品生产专用设备制造', '1536307437964701932', 1461518083062722560, 625, '', '1536307437964701928', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c9094585d26b49f99049f8c76e8718ae', '纺织带和帘子布制造', '纺织带和帘子布制造', 'c9094585d26b49f99049f8c76e8718ae', 1461518083062722560, 238, '', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c915fdd52cd44480af9cb34c7d1b379f', '铁路运输业', '铁路运输业', 'c915fdd52cd44480af9cb34c7d1b379f', 1461518083062722560, 991, '', '842789d652984bcc9618bfe915b8dd6b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c93ab81e5436419b8b4608786cc77d71', '财务公司', '财务公司', 'c93ab81e5436419b8b4608786cc77d71', 1461518083062722560, 1096, '', 'db8176d86056497cb391d51ff575ca81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c94884fb378563e983b5fb5ca87b7f32', '精制茶加工', '精制茶加工', '1536310829881569300', 1461518083062722560, 201, '', '1536310829881569296', 0, '1');
INSERT INTO `jvs_tree` VALUES ('c9554509d7a2450b835981372b9c08ef', '图书馆', '图书馆', 'c9554509d7a2450b835981372b9c08ef', 1461518083062722560, 1361, '', '9d882fb2f70147d29752b7c7f495e603', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c98ceba8431443a88a3a9b71bbb9cbcd', '香蕉等亚热带水果种植', '香蕉等亚热带水果种植', 'c98ceba8431443a88a3a9b71bbb9cbcd', 1461518083062722560, 26, '', '01e1d829d1e245d5bf3a066ce77191f3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c9a6a25499084b35b0bd68dc09c71f88', '其他玻璃制品制造', '其他玻璃制品制造', 'c9a6a25499084b35b0bd68dc09c71f88', 1461518083062722560, 461, '', '7f127fa7b9644592b4899ee6820f5647', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c9c03ff2596c414d9859ea496dae9961', '医学研究和试验发展', '医学研究和试验发展', 'c9c03ff2596c414d9859ea496dae9961', 1461518083062722560, 1192, '', '19a60ca5cac04fb4bae6d2cb8c8fe801', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c9c626edf66f48418f70a9f1f19acf29', '绢纺和丝织加工', '绢纺和丝织加工', 'c9c626edf66f48418f70a9f1f19acf29', 1461518083062722560, 221, '', '2f6bcefd63b641198860de06c8ef18fb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('c9d197909f9a50da55cec4c4899157d7', '饲料加工', '饲料加工', NULL, 1461518083062722560, 135, '', '1536287121062293504', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ca02c93ac09c67177ac7313140b12b30', '木质家具制造', '木质家具制造', '1536307437964701776', 1461518083062722560, 288, '', '1536307437964701772', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ca05e0f6d8c64c52a682bc721fd39f69', '果品、蔬菜批发', '果品、蔬菜批发', 'ca05e0f6d8c64c52a682bc721fd39f69', 1461518083062722560, 869, '', 'b28ff0b238614f3bba8f268424209280', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ca09979b6d5b8fdac3bb098be1df8b85', '采矿、冶金、建筑专用设备制造', '采矿、冶金、建筑专用设备制造', '1536307437964701884', 1461518083062722560, 599, '', '1536307437964701880', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ca34cdb353c2870eb028b3e526ec0996', '专科医院', '专科医院', '1536294082927473014', 1461518083062722560, 1317, '', '1536294082927472998', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ca487ef1343d40f084234fc555aa3361', '居民服务、修理和其他服务业', '居民服务、修理和其他服务业', 'ca487ef1343d40f084234fc555aa3361', 1461518083062722560, 1255, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ca8ef80962fa4f0cb4975063f42ce457', '人寿保险', '人寿保险', 'ca8ef80962fa4f0cb4975063f42ce457', 1461518083062722560, 1113, '', 'f315a33e96664b5a8b8a8d1e74bacf72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ca92a64c7377946b0ac11f25634b8f5e', '石油钻采专用设备制造', '石油钻采专用设备制造', '1536307437964701888', 1461518083062722560, 601, '', '1536307437964701884', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ca9f38ae8d5346e879f286e620c9f2c0', '文化、体育和娱乐业', '文化、体育和娱乐业', '1536310829881569700', 1461518083062722560, 1340, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cac43a585ca64b3d9eb6359984cab144', '衡器制造', '衡器制造', 'cac43a585ca64b3d9eb6359984cab144', 1461518083062722560, 582, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('caf6ea049a234df98e4cef4ec6bb9c0a', '非公路休闲车及零配件制造', '非公路休闲车及零配件制造', 'caf6ea049a234df98e4cef4ec6bb9c0a', 1461518083062722560, 693, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cb1e98cb57d6c1922a579eb3e84c634c', '电池制造', '电池制造', '1536310379493011651', 1461518083062722560, 714, '', '1536310379493011639', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cb5eb6a3814d4d9b7093ce2828b8c414', '化工、木材、非金属加工专用设备制造', '化工、木材、非金属加工专用设备制造', '1536307437964701896', 1461518083062722560, 606, '', '1536307437964701880', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cb5f6870f50e43879b312b5420a05d25', '家具制造业', '家具制造业', '1536310379488817228', 1461518083062722560, 287, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cb78ff04293d91d3aa203d203ac3e2ff', '饲料加工', '饲料加工', NULL, 1461518083062722560, 135, '', '1536284719546425344', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cba04180e7974dd299be04da07fd79b6', '化学药品制剂制造', '化学药品制剂制造', 'cba04180e7974dd299be04da07fd79b6', 1461518083062722560, 397, '', 'e4a034315f244268b87181669e0a6580', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cbe91e515985425dbc019e6f8014ae04', '其他期货市场服务', '其他期货市场服务', 'cbe91e515985425dbc019e6f8014ae04', 1461518083062722560, 1107, '', '9e28bf4268f54cb8a9385fd5024c7fec', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cbf1378e6b8877e6b0633f73e7addfc7', '低速载货汽车制造', '低速载货汽车制造', '1536294082927472866', 1461518083062722560, 663, '', '1536294082927472858', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cc05639e153745b7ae5de789991a2256', '金属成形机床制造', '金属成形机床制造', 'cc05639e153745b7ae5de789991a2256', 1461518083062722560, 554, '', '85eb2a5a58c04227b32578b29f92b940', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cc063bb0e39348bba6b7a1eb14b43ab0', '农业科学研究和试验发展', '农业科学研究和试验发展', 'cc063bb0e39348bba6b7a1eb14b43ab0', 1461518083062722560, 1191, '', '19a60ca5cac04fb4bae6d2cb8c8fe801', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cc587ba90c9e0a18e467250adba47469', '文化、办公用机械制造', '文化、办公用机械制造', '1536307437964701868', 1461518083062722560, 584, '', '1536307437964701808', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cc94c380675d4b75a00493baf99db8b3', '褐煤开采洗选', '褐煤开采洗选', 'cc94c380675d4b75a00493baf99db8b3', 1461518083062722560, 85, '', 'bc265bb0211c48f8b8e8a38afaf2579e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ccb83a9ffc0609d0f261b112df433a25', '房地产业', '房地产业', '1536310829881569648', 1461518083062722560, 1129, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cd11488d45fe002e005fb2954a3b1e04', '镍氢电池制造', '镍氢电池制造', '1536307437964701988', 1461518083062722560, 716, '', '1536307437964701980', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cd1d845790d793c3578b8f8b572226df', '造纸和纸制品业', '造纸和纸制品业', '1536311398964736092', 1461518083062722560, 293, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cd4036f37a7b453ebc3e15a7c2588983', '应用电视设备及其他广播电视设备制造', '应用电视设备及其他广播电视设备制造', 'cd4036f37a7b453ebc3e15a7c2588983', 1461518083062722560, 749, '', '15c74911c46e4a99bc107e9108a890fb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cd4a0429578d45c48c39635d5d2e901e', '实验分析仪器制造', '实验分析仪器制造', 'cd4a0429578d45c48c39635d5d2e901e', 1461518083062722560, 769, '', 'd0f29cd031234e9f86540ef6ebf43e55', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cd4aa0658c7b4cd7aafeff79d2e5be55', '其他专用仪器制造', '其他专用仪器制造', 'cd4aa0658c7b4cd7aafeff79d2e5be55', 1461518083062722560, 781, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cd500f4cc4ef4eb1804e926ebaa49e9f', '工艺美术品制造', '工艺美术品制造', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 1461518083062722560, 323, '', '9df0963d73874bb6854f911bb726f362', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cd68550e12839b511bec22ee6d8530f7', '风动和电动工具制造', '风动和电动工具制造', '1536294082927472770', 1461518083062722560, 580, '', '1536294082927472754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cd828595b5a67960f63b5e286bc09d10', '轴承、齿轮和传动部件制造', '轴承、齿轮和传动部件制造', '1536310829881569420', 1461518083062722560, 571, '', '1536310829881569392', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cd8c09e056554b4a84226d0af3ee7d73', '香料、香精制造', '香料、香精制造', 'cd8c09e056554b4a84226d0af3ee7d73', 1461518083062722560, 393, '', 'b5210ed1f0304474a251e592d21f2258', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cd8c32ee3dfdba9570e0492c6f36d731', '非木竹浆制造', '非木竹浆制造', '1536294082927472706', 1461518083062722560, 296, '', '1536294082927472702', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cdbbda5c0c32e853efa319257e9cddc6', '纺织、服装和皮革加工专用设备制造', '纺织、服装和皮革加工专用设备制造', '1536307437964701936', 1461518083062722560, 626, '', '1536307437964701880', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cdcc8241026845668ce5472a631f08ee', '家用空气调节器制造', '家用空气调节器制造', 'cdcc8241026845668ce5472a631f08ee', 1461518083062722560, 720, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cde624d138924d9a8c34331138323a0d', '中药饮片加工', '中药饮片加工', 'cde624d138924d9a8c34331138323a0d', 1461518083062722560, 398, '', 'e4a034315f244268b87181669e0a6580', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ce41c65b785541e3b28c15438a7c7aa6', '金属密封件制造', '金属密封件制造', 'ce41c65b785541e3b28c15438a7c7aa6', 1461518083062722560, 592, '', 'b7d629b5dd27447dbbf8664c3521e653', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ce6ae28ae4194132b4457577b0a1da4d', '营养和保健品零售', '营养和保健品零售', 'ce6ae28ae4194132b4457577b0a1da4d', 1461518083062722560, 934, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ce707ebfcd0cb04bfa7df5994c175858', '通信设备制造', '通信设备制造', '1536310829881569584', 1461518083062722560, 743, '', '1536310829881569580', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ce7e4080e07a4d2bb33dbb2d1c8ee89d', '其他农业服务', '其他农业服务', 'ce7e4080e07a4d2bb33dbb2d1c8ee89d', 1461518083062722560, 74, '', '4d80a3b8b1be4d279344ac1771122b85', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ceb3ccce2f417af212b83854158b8694', '卫生和社会工作', '卫生和社会工作', '1536310379493011751', 1461518083062722560, 1310, '', '1536310379220381696', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cecc6d30ab22456791361548e1d0f5db', '牲畜饲养', '牲畜饲养', 'cecc6d30ab22456791361548e1d0f5db', 1461518083062722560, 48, '', '9356c86a6cb8446093e3ec27ae0ef3b5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cedba29210464644832095394cc178ae', '橡胶零件制造', '橡胶零件制造', 'cedba29210464644832095394cc178ae', 1461518083062722560, 419, '', '242dd78213414f0f9c3ac611b510ec7e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cee8f6349eeaba8af1506a385e3c71f6', '通用设备制造业', '通用设备制造业', '1536294082927472718', 1461518083062722560, 544, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cf001265955241438ff59d4085631a7f', '保健服务', '保健服务', 'cf001265955241438ff59d4085631a7f', 1461518083062722560, 1262, '', 'f6d5e5bb19ec486ba11a1afb7838a36b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf268b7fb0e040108729919c172ba257', '放射性金属矿采选', '放射性金属矿采选', 'cf268b7fb0e040108729919c172ba257', 1461518083062722560, 111, '', '245a071a1fbc4bf7b08fc1ffcf089dad', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf29a384bd4c4ab38a90c2038e0fec41', '太阳能发电', '太阳能发电', 'cf29a384bd4c4ab38a90c2038e0fec41', 1461518083062722560, 816, '', '5ecd006a532c49b6b294f268e35f4fa1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf46f0a4428749fbbbeabeeadd53969d', '汽车、摩托车、燃料及零配件专门零售', '汽车、摩托车、燃料及零配件专门零售', 'cf46f0a4428749fbbbeabeeadd53969d', 1461518083062722560, 961, '', '47cb2cc4493644aa90fc6922d3b34448', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf5ca78c726580b3ed6fbc82afb19a03', '专用设备制造业', '专用设备制造业', '1536294082927472790', 1461518083062722560, 598, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('cf7334e7ede84a7dbec8369f888bcc62', '其他不提供住宿社会工作', '其他不提供住宿社会工作', 'cf7334e7ede84a7dbec8369f888bcc62', 1461518083062722560, 1339, '', 'a002095b0fa94f118241d7287713fb09', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf82b0dc32824fb98ef01061303d5bb4', '体育', '体育', 'cf82b0dc32824fb98ef01061303d5bb4', 1461518083062722560, 1368, '', '567845af441a427eacdd14dfec55fe15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf878fe92e6446d8bb569c055ad2207b', '其他食品零售', '其他食品零售', 'cf878fe92e6446d8bb569c055ad2207b', 1461518083062722560, 937, '', 'd138659de1744d208b52d77abf92cd51', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf8840df946f453f9c70fe819da805a4', '稀土金属矿采选', '稀土金属矿采选', 'cf8840df946f453f9c70fe819da805a4', 1461518083062722560, 110, '', '245a071a1fbc4bf7b08fc1ffcf089dad', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cf8bc931c9e74810b747545033c5e121', '博物馆', '博物馆', 'cf8bc931c9e74810b747545033c5e121', 1461518083062722560, 1364, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cfd4da379eb245758615c1b60d0fbe8c', '化学农药制造', '化学农药制造', 'cfd4da379eb245758615c1b60d0fbe8c', 1461518083062722560, 365, '', 'ac8071f49ea34a98ad9f120c3a7e9273', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cfec3e9ec5e9470197eb642b58a5b980', '人造纤维（纤维素纤维）制造', '人造纤维（纤维素纤维）制造', 'cfec3e9ec5e9470197eb642b58a5b980', 1461518083062722560, 406, '', 'abda87bdef4f49788c0af9d56167c0a2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('cfffc79d9a774609bbd30cc6c8e048e1', '环境保护专用设备制造', '环境保护专用设备制造', 'cfffc79d9a774609bbd30cc6c8e048e1', 1461518083062722560, 652, '', '8b87fe3dddb440b5942961d52baf7863', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d006433159d245fe8538b459e50c2498', '粘土及其他土砂石开采', '粘土及其他土砂石开采', 'd006433159d245fe8538b459e50c2498', 1461518083062722560, 118, '', '338fddda90714633a35486487f31961e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d0159dee15c84e7497612587f32232e5', '水利、环境和公共设施管理业', '水利、环境和公共设施管理业', 'd0159dee15c84e7497612587f32232e5', 1461518083062722560, 1227, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d02079cda2c84ed2b556c9739cdd8a37', '有机化学原料制造', '有机化学原料制造', 'd02079cda2c84ed2b556c9739cdd8a37', 1461518083062722560, 355, '', '91dc97eb105d4ba29bbf67a3eee45596', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d02bd90eaf2b4083895ccecd21a67340', '银行监管服务', '银行监管服务', 'd02bd90eaf2b4083895ccecd21a67340', 1461518083062722560, 1099, '', '45e05ef36112422fa2ae90520ff7a1de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d053bffd3348ab7dd4d5f99ac756f55f', '电影放映', '电影放映', '1536307437964702128', 1461518083062722560, 1355, '', '1536307437964702120', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d0adf9d7b14447959e70251aba4796a9', '冶金专用设备制造', '冶金专用设备制造', 'd0adf9d7b14447959e70251aba4796a9', 1461518083062722560, 605, '', '3e5247bc8341490eb91662c2f0d5613f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d0db53f4ca1e439dbe39c2169579dca0', '玩具制造', '玩具制造', 'd0db53f4ca1e439dbe39c2169579dca0', 1461518083062722560, 339, '', '9df0963d73874bb6854f911bb726f362', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d0e5e56cd32e31765a5e8f08ecadcbd4', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', '1536294082927472966', 1461518083062722560, 809, '', '1536294082923278337', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d0e797a7706a410081fb6a8df71a335c', '其他畜牧业', '其他畜牧业', 'd0e797a7706a410081fb6a8df71a335c', 1461518083062722560, 61, '', '9356c86a6cb8446093e3ec27ae0ef3b5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d0ebd453a05c4e08a1bdcbc641239503', '其他专业技术服务业', '其他专业技术服务业', 'd0ebd453a05c4e08a1bdcbc641239503', 1461518083062722560, 1213, '', 'ef8532cb75574d1e89d50b62cfc96d92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d0f29cd031234e9f86540ef6ebf43e55', '通用仪器仪表制造', '通用仪器仪表制造', 'd0f29cd031234e9f86540ef6ebf43e55', 1461518083062722560, 765, '', '316c339beabb4599a6534e2870ccdf6d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d0ffcc5e893541dcac53472927b87a41', '潜水救捞及其他未列明运输设备制造', '潜水救捞及其他未列明运输设备制造', 'd0ffcc5e893541dcac53472927b87a41', 1461518083062722560, 694, '', 'fc02edb12dd7437e92f93a88c15e2702', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d10996c232b5ef111ac8f68debfaa7cc', '通用设备制造业', '通用设备制造业', '1536310379493011479', 1461518083062722560, 544, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d115351c9d2a478b4ea956cf74909367', '饲料生产专用设备制造', '饲料生产专用设备制造', '1536310829881569508', 1461518083062722560, 617, '', '1536310829881569496', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d12425b5f984be23abac2920bd5196c3', '电气机械和器材制造业', '电气机械和器材制造业', '1536310379493011639', 1461518083062722560, 697, '', '1536310379488817156', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d138659de1744d208b52d77abf92cd51', '食品、饮料及烟草制品专门零售', '食品、饮料及烟草制品专门零售', 'd138659de1744d208b52d77abf92cd51', 1461518083062722560, 929, '', '47cb2cc4493644aa90fc6922d3b34448', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d145537e89efc48ba0e4126f1deaff6e', '轴承、齿轮和传动部件制造', '轴承、齿轮和传动部件制造', '1536307437964701836', 1461518083062722560, 571, '', '1536307437964701808', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d15152d0699b4ac393614a5f6f04df30', '水产捕捞', '水产捕捞', 'd15152d0699b4ac393614a5f6f04df30', 1461518083062722560, 66, '', 'f5c88e85ebeb40b5b705d0a15fc42924', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d15aab9c846f4a21ab46650592712689', '其他通用设备制造业', '其他通用设备制造业', 'd15aab9c846f4a21ab46650592712689', 1461518083062722560, 597, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d19622421fea4348a8763cd708b8ddc1', '金属制品修理', '金属制品修理', 'd19622421fea4348a8763cd708b8ddc1', 1461518083062722560, 798, '', 'a30057bad4994bfa9049c45c55b82e81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d1b01bde003fc62bb06c17816b4e17d4', '其他传动部件制造', '其他传动部件制造', '1536310379493011511', 1461518083062722560, 574, '', '1536310379493011507', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d1ce2889e8c047b9883699591362fa5e', '棉花仓储', '棉花仓储', 'd1ce2889e8c047b9883699591362fa5e', 1461518083062722560, 1043, '', 'c3accf30125748639c0d5930c9944eb7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d1efbed9d90f6d9c785d03c7841d0c99', '锯材加工', '锯材加工', '1536310379488817200', 1461518083062722560, 267, '', '1536310379488817196', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d20843ae7fa44568b7b6f3380850b642', '化纤织物染整精加工', '化纤织物染整精加工', 'd20843ae7fa44568b7b6f3380850b642', 1461518083062722560, 225, '', 'a4d441ddb98146c5885de5fe8230d0f6', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d20d2c4a8c57aff1c1b1f18a0331c03b', '精制茶加工', '精制茶加工', '1536310379488817172', 1461518083062722560, 201, '', '1536310379488817168', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d21ff93502a34be4bdaf86bf89b8e6d3', '文艺创作与表演', '文艺创作与表演', 'd21ff93502a34be4bdaf86bf89b8e6d3', 1461518083062722560, 1358, '', 'b183152094554cbdbc98dc8ac74fb6d0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d239f61a1c14762ba426c4f1b3552183', '塑料家具制造', '塑料家具制造', '1536311398964736088', 1461518083062722560, 291, '', '1536311398964736076', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d23c646900a9475cba7cb4768e9f4b7e', '农产品初加工服务', '农产品初加工服务', 'd23c646900a9475cba7cb4768e9f4b7e', 1461518083062722560, 73, '', '4d80a3b8b1be4d279344ac1771122b85', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d2454bf57802661fe75f5c065b926468', '轴承、齿轮和传动部件制造', '轴承、齿轮和传动部件制造', '1536294082927472746', 1461518083062722560, 571, '', '1536294082927472718', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d29526550a3c4c2eb00d1e245e8244e8', '饮料及冷饮服务', '饮料及冷饮服务', 'd29526550a3c4c2eb00d1e245e8244e8', 1461518083062722560, 1057, '', 'b7677f90d185460a8e7dea5ad7a69354', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d2abbedf989169b06fc3489daa77691d', '专用设备制造业', '专用设备制造业', '1536307437964701880', 1461518083062722560, 598, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d2bbb35d44b64dc0b56f217b9ad05b65', '油料种植', '油料种植', 'd2bbb35d44b64dc0b56f217b9ad05b65', 1461518083062722560, 10, '', '5945424b0827482ca25284bb80b7fdc0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d2c997b8c95b33c68f0f6165d7a61bbc', '歌舞厅娱乐活动', '歌舞厅娱乐活动', '1536310829881569724', 1461518083062722560, 1375, '', '1536310829881569720', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d2f36cb8dcba41c7b0e3b16e1161370d', '碳酸饮料制造', '碳酸饮料制造', 'd2f36cb8dcba41c7b0e3b16e1161370d', 1461518083062722560, 195, '', 'f77c488fca9e415bb74990de42777f54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d36788a81f164ada827360e3253036c4', '其他国家机构', '其他国家机构', 'd36788a81f164ada827360e3253036c4', 1461518083062722560, 1401, '', '37a6e6dc44a84c4ebcba0085e1d2420b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d3917ed59bca4241a9fb34cbd1ae88cf', '日用塑料制品制造', '日用塑料制品制造', 'd3917ed59bca4241a9fb34cbd1ae88cf', 1461518083062722560, 430, '', '50976a2f43bc4cc5955a536de9d07368', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d39afb8696c948ba88baadc8b053221a', '水上旅客运输', '水上旅客运输', 'd39afb8696c948ba88baadc8b053221a', 1461518083062722560, 1011, '', 'b815134170f74bb08ef895c26c8fd01f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d39d3c1fc98ec43a087202ea16c8432b', '皮革、毛皮、羽毛及其制品和制鞋业', '皮革、毛皮、羽毛及其制品和制鞋业', '1536294082923278364', 1461518083062722560, 245, '', '1536294082923278340', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d3bd550e4fef4cd7862b56f2382e19a0', '非木竹材林产品采集', '非木竹材林产品采集', 'd3bd550e4fef4cd7862b56f2382e19a0', 1461518083062722560, 46, '', '13d771471e684f0daa181b376b6cd3f0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d3ce8b16b19148be8af8e2fc8af1df79', '公路工程建筑', '公路工程建筑', 'd3ce8b16b19148be8af8e2fc8af1df79', 1461518083062722560, 832, '', 'bb9b27e8b29448acbc29064678ff48ba', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d41e7573ec094e2a9ccd365c7794fb84', '金属表面处理及热处理加工', '金属表面处理及热处理加工', 'd41e7573ec094e2a9ccd365c7794fb84', 1461518083062722560, 529, '', 'fb030bf0f03346d09a84b55753afc762', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d44f118ad22e425f97ddff7b7b129e76', '砼结构构件制造', '砼结构构件制造', 'd44f118ad22e425f97ddff7b7b129e76', 1461518083062722560, 439, '', '1e55bff094854d93bb468c6f213265de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d45fb286903e4a7b842bbca10facbd64', '孤残儿童收养和庇护服务', '孤残儿童收养和庇护服务', 'd45fb286903e4a7b842bbca10facbd64', 1461518083062722560, 1335, '', '1d02fedd900d4a5db196ea9a573236df', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d4973cf85be34a23a4676581e4e89c76', '煤炭开采和洗选辅助活动', '煤炭开采和洗选辅助活动', 'd4973cf85be34a23a4676581e4e89c76', 1461518083062722560, 127, '', '41f6765fdef74d1da4ba35e198ce3473', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d4c180f0f3e0e327bf4739eeb278ffe1', '光纤、光缆制造', '光纤、光缆制造', '1536310379493011647', 1461518083062722560, 711, '', '1536310379493011643', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d4d330de05ac5f87e45b89f51b7cdb71', '中医医院', '中医医院', '1536310829881569676', 1461518083062722560, 1314, '', '1536310829881569672', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d4eb07c2a339491fa56669a0a3ad0c4a', '农林牧渔专用仪器仪表制造', '农林牧渔专用仪器仪表制造', 'd4eb07c2a339491fa56669a0a3ad0c4a', 1461518083062722560, 776, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d4ff24c9de6f490d948938c2546455fe', '起重机制造', '起重机制造', 'd4ff24c9de6f490d948938c2546455fe', 1461518083062722560, 561, '', '0425e3ce9ed84fc493944dbd4663ba4e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d502baad9883552450bad36e10e8a2b8', '地质勘探和地震专用仪器制造', '地质勘探和地震专用仪器制造', '1536310379493011699', 1461518083062722560, 777, '', '1536310379493011691', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d5050bf71cd1490a9cff1dec04ed778c', '其他农产品仓储', '其他农产品仓储', 'd5050bf71cd1490a9cff1dec04ed778c', 1461518083062722560, 1044, '', 'c3accf30125748639c0d5930c9944eb7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d50dbc169bdd44e091edf9944c59e13d', '照明器具生产专用设备制造', '照明器具生产专用设备制造', 'd50dbc169bdd44e091edf9944c59e13d', 1461518083062722560, 623, '', '19493c65e8fa413a92c97fe37446f1ff', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d53db1cd9efb0a33eba4d1bc3959546e', '纸浆制造', '纸浆制造', '1536294082927472702', 1461518083062722560, 294, '', '1536294082927472698', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d573448648704c41bcd9cdc08220218b', '耐火陶瓷制品及其他耐火材料制造', '耐火陶瓷制品及其他耐火材料制造', 'd573448648704c41bcd9cdc08220218b', 1461518083062722560, 473, '', '297d519594f5453590ad8c52ce5ce0f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d594061459c8450c9b73da2a427fc52b', '内河旅客运输', '内河旅客运输', 'd594061459c8450c9b73da2a427fc52b', 1461518083062722560, 1013, '', 'd39afb8696c948ba88baadc8b053221a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d5ba274f4a414f2aa6b6e9a34e4fbd57', '记录媒介复制', '记录媒介复制', 'd5ba274f4a414f2aa6b6e9a34e4fbd57', 1461518083062722560, 310, '', '90dce92b097a4d6d99cae39395a5af92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d5c8029881a7479b8a919b0180a59a99', '医疗实验室及医用消毒设备和器具制造', '医疗实验室及医用消毒设备和器具制造', 'd5c8029881a7479b8a919b0180a59a99', 1461518083062722560, 646, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d60c8fcf069f42f698d11ae47506af4b', '绳、索、缆制造', '绳、索、缆制造', 'd60c8fcf069f42f698d11ae47506af4b', 1461518083062722560, 237, '', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d623fc33e4684bae9e9c2156e1e6d3ec', '其他企业管理服务', '其他企业管理服务', 'd623fc33e4684bae9e9c2156e1e6d3ec', 1461518083062722560, 1154, '', '559128f608654f4582e8eb81e8ad2b78', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d63c542220d842d482e107ebfb395b7f', '金融信托与管理服务', '金融信托与管理服务', 'd63c542220d842d482e107ebfb395b7f', 1461518083062722560, 1124, '', '3bcdeee22fa44217a2505feebf9e6c9b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d64792fee7fdb0b7e34ddff8c669837d', '缝制机械制造', '缝制机械制造', '1536311398968930314', 1461518083062722560, 629, '', '1536311398968930310', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d69062cfaedf6359ae4d984e42a0be13', '木门窗、楼梯制造', '木门窗、楼梯制造', '1536310829881569348', 1461518083062722560, 278, '', '1536310829881569344', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d6a130c08875dd89c47c18a55fa2d2b9', '文化、办公用机械制造', '文化、办公用机械制造', '1536294082927472778', 1461518083062722560, 584, '', '1536294082927472718', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d6b8593a668745ac83e26e298bf07432', '喷枪及类似器具制造', '喷枪及类似器具制造', 'd6b8593a668745ac83e26e298bf07432', 1461518083062722560, 581, '', '5141899aa0c3435b9c6bdd5bb5f2990d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d6edf1e6e55a458693dd1ff9572a2a43', '绿化管理', '绿化管理', 'd6edf1e6e55a458693dd1ff9572a2a43', 1461518083062722560, 1251, '', '08a1fc9f693f48129e4bf075c2623051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d710c7c1542548559979bbf37b12fe47', '其他未列明电气机械及器材制造', '其他未列明电气机械及器材制造', 'd710c7c1542548559979bbf37b12fe47', 1461518083062722560, 736, '', 'a8fcffdb8e8a4da4af04e6a3ea3d90f5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d72218ae53404417b333d2d8e872a1d5', '机床附件制造', '机床附件制造', 'd72218ae53404417b333d2d8e872a1d5', 1461518083062722560, 557, '', '85eb2a5a58c04227b32578b29f92b940', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d731fd8c958fa72c1abc85574efecd2b', '改装汽车制造', '改装汽车制造', '1536294082927472862', 1461518083062722560, 662, '', '1536294082927472858', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d73c54ad0528485c8edca0745dbec4b6', '海水养殖', '海水养殖', 'd73c54ad0528485c8edca0745dbec4b6', 1461518083062722560, 64, '', 'e7e6b4bb13f64d21b4c77f127df970d7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d75017a567284acc935357756379fc3e', '其他未列明商务服务业', '其他未列明商务服务业', 'd75017a567284acc935357756379fc3e', 1461518083062722560, 1186, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d76df1cc16edc4531f35fda727f1d0e7', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536310379899858948', 1461518083062722560, 1190, '', '1536310379899858944', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d7bc37b40b6c4931a4d9fb8cb5f496ba', '谷物仓储', '谷物仓储', 'd7bc37b40b6c4931a4d9fb8cb5f496ba', 1461518083062722560, 1042, '', 'c3accf30125748639c0d5930c9944eb7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d7d4fd457f2344ca84056d0197464f79', '皮革、毛皮及其制品加工专用设备制造', '皮革、毛皮及其制品加工专用设备制造', 'd7d4fd457f2344ca84056d0197464f79', 1461518083062722560, 628, '', '4346899fad9a423595fb6c48789dd99d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d7f31697dc8ec7575011817269329708', '通信设备制造', '通信设备制造', '1536294082927472910', 1461518083062722560, 743, '', '1536294082927472906', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d80b75b41d25488cac7cca3383833ca3', '铁路专用设备及器材、配件制造', '铁路专用设备及器材、配件制造', 'd80b75b41d25488cac7cca3383833ca3', 1461518083062722560, 672, '', '80d9141616884b538edef0504a7dbe76', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d84ee445f7810cd1c44f6713ab66b88e', '木片加工', '木片加工', '1536310829881569332', 1461518083062722560, 268, '', '1536310829881569324', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d868e35160ed8d22d426be52f2aa8943', '印刷、制药、日化及日用品生产专用设备制造', '印刷、制药、日化及日用品生产专用设备制造', '1536307437964701928', 1461518083062722560, 618, '', '1536307437964701880', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d86d42b1a00f42c6a6e2904efe54e5c5', '彩票活动', '彩票活动', 'd86d42b1a00f42c6a6e2904efe54e5c5', 1461518083062722560, 1380, '', '1efeeb730bc14c778d6071408da57297', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d8944d25e2fe3d8409815c792cbe9637', '视听设备制造', '视听设备制造', '1536307437964702012', 1461518083062722560, 751, '', '1536307437964701996', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d896679dd4f14d6394b95f0048dea78f', '摩托车修理与维护', '摩托车修理与维护', 'd896679dd4f14d6394b95f0048dea78f', 1461518083062722560, 1269, '', '8a91d822da204f2d9eb92674273239c0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d8b22a865b36279c34b5054a734fbca7', '农副食品加工专用设备制造', '农副食品加工专用设备制造', '1536294082927472826', 1461518083062722560, 615, '', '1536294082927472822', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d8b720b62c37432cbf71d234bde30636', '特种陶瓷制品制造', '特种陶瓷制品制造', 'd8b720b62c37432cbf71d234bde30636', 1461518083062722560, 467, '', 'a402270dd3274eec896e0ea9e5f4b851', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d93d83f676294bc781906ca590d33885', '肉、禽类罐头制造', '肉、禽类罐头制造', 'd93d83f676294bc781906ca590d33885', 1461518083062722560, 171, '', '8e1163acd8d046d580f42436854753c4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d95784396bde4143b28ab476b62d8015', '建筑用木料及木材组件加工', '建筑用木料及木材组件加工', 'd95784396bde4143b28ab476b62d8015', 1461518083062722560, 277, '', '08c234aebbb444c99b04de865d8f2efb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d974c20c756c4036a1309e5d09e9ffab', '采矿业', '采矿业', 'd974c20c756c4036a1309e5d09e9ffab', 1461518083062722560, 82, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d97b5b4d509a4f68b84b5549e960c6f6', '能源矿产地质勘查', '能源矿产地质勘查', 'd97b5b4d509a4f68b84b5549e960c6f6', 1461518083062722560, 1204, '', '593642eaef7f4d56841c28795fa2f9de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d99c30b9e8d94a043e22bddd67e97899', '饲料生产专用设备制造', '饲料生产专用设备制造', '1536311398964736228', 1461518083062722560, 617, '', '1536311398964736216', 0, '1');
INSERT INTO `jvs_tree` VALUES ('d9c2d52a7352468b94e38d10acc6085c', '建筑、家具用金属配件制造', '建筑、家具用金属配件制造', 'd9c2d52a7352468b94e38d10acc6085c', 1461518083062722560, 525, '', 'c31948a1fb464bb493ac2cbd9eea7190', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('d9c9e335006114b5a22eb53b04d64e25', '电线、电缆、光缆及电工器材制造', '电线、电缆、光缆及电工器材制造', '1536310829881569556', 1461518083062722560, 709, '', '1536310829881569552', 0, '1');
INSERT INTO `jvs_tree` VALUES ('da21d68a783752da8fafc0739c3673d8', '文化、体育和娱乐业', '文化、体育和娱乐业', '1536307437964702116', 1461518083062722560, 1340, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('da33ce38d14942409f7bc43beea6a0bc', '西乐器制造', '西乐器制造', 'da33ce38d14942409f7bc43beea6a0bc', 1461518083062722560, 320, '', '8c16b25978dd4f4c9d4c18bc84cce536', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('da6e48954e0e47c7b2bc0f492f36dbd4', '环境监测专用仪器仪表制造', '环境监测专用仪器仪表制造', 'da6e48954e0e47c7b2bc0f492f36dbd4', 1461518083062722560, 773, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('da7c61e949634bb4ab1857eb851d1431', '风力发电', '风力发电', 'da7c61e949634bb4ab1857eb851d1431', 1461518083062722560, 815, '', '5ecd006a532c49b6b294f268e35f4fa1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dac06f4627e8541c7117c918a2c114b3', '饲料加工', '饲料加工', NULL, 1461518083062722560, 135, '', '1536286469489750016', 0, '1');
INSERT INTO `jvs_tree` VALUES ('daffa94a3f672f6c4160ac9de4ca4e65', '电影放映', '电影放映', '1536310379493011799', 1461518083062722560, 1355, '', '1536310379493011791', 0, '1');
INSERT INTO `jvs_tree` VALUES ('db0c1f2d10e04e18bd957bf0dbcfdd0e', '铁路旅客运输', '铁路旅客运输', 'db0c1f2d10e04e18bd957bf0dbcfdd0e', 1461518083062722560, 992, '', 'c915fdd52cd44480af9cb34c7d1b379f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('db0f0122a3c513eda3260875a893363d', '研究和试验发展', '研究和试验发展', '1536310830305193984', 1461518083062722560, 1188, '', '1536310830233890820', 0, '1');
INSERT INTO `jvs_tree` VALUES ('db8176d86056497cb391d51ff575ca81', '非货币银行服务', '非货币银行服务', 'db8176d86056497cb391d51ff575ca81', 1461518083062722560, 1094, '', '45e05ef36112422fa2ae90520ff7a1de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dba9869020844ced9879fd40197bd880', '供应用仪表及其他通用仪器制造', '供应用仪表及其他通用仪器制造', 'dba9869020844ced9879fd40197bd880', 1461518083062722560, 771, '', 'd0f29cd031234e9f86540ef6ebf43e55', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dbe151058b82403f8a3deaf1cfabf594', '石棉、云母矿采选', '石棉、云母矿采选', 'dbe151058b82403f8a3deaf1cfabf594', 1461518083062722560, 122, '', '145148bf32184b6a8311fe783ef0e544', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dbfb0ed22b074139a7460bef1a834009', '化纤织造加工', '化纤织造加工', 'dbfb0ed22b074139a7460bef1a834009', 1461518083062722560, 224, '', 'a4d441ddb98146c5885de5fe8230d0f6', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc22550138d34dbabaf1c338b18d8e32', '电子元件制造', '电子元件制造', 'dc22550138d34dbabaf1c338b18d8e32', 1461518083062722560, 760, '', '33c10b41d3a34c66aa7898793302dd15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc2608acc24745618cdf1dc1f346ee05', '合成纤维制造', '合成纤维制造', 'dc2608acc24745618cdf1dc1f346ee05', 1461518083062722560, 407, '', '29b41dc4eb2d4efea641b7978812987a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc29258a5322485bbbf92fc38d850649', '船舶修理', '船舶修理', 'dc29258a5322485bbbf92fc38d850649', 1461518083062722560, 803, '', 'eb874e229b154ae8b8db2ed8a5bd965f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc365828e0fc42fa85ef5d891f211a7e', '其他罐头食品制造', '其他罐头食品制造', 'dc365828e0fc42fa85ef5d891f211a7e', 1461518083062722560, 174, '', '8e1163acd8d046d580f42436854753c4', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc5ef9684e184da0b1f0d0b3bdeabb3c', '镁矿采选', '镁矿采选', 'dc5ef9684e184da0b1f0d0b3bdeabb3c', 1461518083062722560, 102, '', 'e3e5f433000e4a8582130236036331bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc628eebe36a60abe9d794c846a75f00', '电力、热力、燃气及水生产和供应业', '电力、热力、燃气及水生产和供应业', '1536310829881569640', 1461518083062722560, 809, '', '1536310781395415040', 0, '1');
INSERT INTO `jvs_tree` VALUES ('dc8e1fdb844d4d368f777b31e3593eb9', '贵金属冶炼', '贵金属冶炼', 'dc8e1fdb844d4d368f777b31e3593eb9', 1461518083062722560, 493, '', 'fe277f2855704704a0562cc62cff05ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc953ffbfafa461cbb61e0a0beeca1f1', '社会看护与帮助服务', '社会看护与帮助服务', 'dc953ffbfafa461cbb61e0a0beeca1f1', 1461518083062722560, 1338, '', 'a002095b0fa94f118241d7287713fb09', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dc9aeee52a1d4e67b205506f409f3448', '锻件及粉末冶金制品制造', '锻件及粉末冶金制品制造', 'dc9aeee52a1d4e67b205506f409f3448', 1461518083062722560, 541, '', '3995635d7fc74d7b97de0ae8e9a377d3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dd0396744960426ba0ced78a806e2ed3', '国际组织', '国际组织', 'dd0396744960426ba0ced78a806e2ed3', 1461518083062722560, 1422, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dd03ecfd32c0fa75655414dc0437e67f', '泵及真空设备制造', '泵及真空设备制造', '1536310379493011503', 1461518083062722560, 567, '', '1536310379493011499', 0, '1');
INSERT INTO `jvs_tree` VALUES ('dd06adb0fb4794c44dd3e1c04df45d30', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536310379493011747', 1461518083062722560, 1190, '', '1536310379493011743', 0, '1');
INSERT INTO `jvs_tree` VALUES ('dd7452169b819b5be75a70e224e4f41e', '饲料加工', '饲料加工', '1536311398964736012', 1461518083062722560, 135, '', '1536311398964736008', 0, '1');
INSERT INTO `jvs_tree` VALUES ('dd819fada651749130c758e0e38a0f69', '纸浆制造', '纸浆制造', '1536310829881569376', 1461518083062722560, 294, '', '1536310829881569372', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ddb26cb3831c4fa3bb537542097f648b', '内燃机及配件制造', '内燃机及配件制造', 'ddb26cb3831c4fa3bb537542097f648b', 1461518083062722560, 547, '', 'eeb06ef1eabf45dc9214022934a5ad13', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ddf3ce0fa10f40d5b2c9c0061c9b89f6', '其他文化艺术经纪代理', '其他文化艺术经纪代理', 'ddf3ce0fa10f40d5b2c9c0061c9b89f6', 1461518083062722560, 1384, '', '253413aebc934fbb9b4da1d295258810', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ddf96141f9c942a182c7bcc1673f2dbc', '瓶（罐）装饮用水制造', '瓶（罐）装饮用水制造', 'ddf96141f9c942a182c7bcc1673f2dbc', 1461518083062722560, 196, '', 'f77c488fca9e415bb74990de42777f54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('de117891c7e54f7ea643785c713abd78', '石墨及碳素制品制造', '石墨及碳素制品制造', 'de117891c7e54f7ea643785c713abd78', 1461518083062722560, 475, '', '15aecc175ecb4ae28c72c0208ed0c259', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('de3793d895084e82a5c8281a740d45a9', '其他室内娱乐活动', '其他室内娱乐活动', 'de3793d895084e82a5c8281a740d45a9', 1461518083062722560, 1378, '', '367085faa6ce4b71b269b4adf385b76e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('de3f7a5ca72247af82d53362d876a355', '集装箱制造', '集装箱制造', 'de3f7a5ca72247af82d53362d876a355', 1461518083062722560, 520, '', '00d90a3e54fc4c47b928bd83ae0fb741', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('de571673e4db49618b5ff01f19ca9f91', '食品、酒、饮料及茶生产专用设备制造', '食品、酒、饮料及茶生产专用设备制造', 'de571673e4db49618b5ff01f19ca9f91', 1461518083062722560, 614, '', '2efc07fcfa8841a180e277a88ffd4807', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('de6bfddeee6245ea8814cb924c2192a9', '货摊食品零售', '货摊食品零售', 'de6bfddeee6245ea8814cb924c2192a9', 1461518083062722560, 982, '', '746a5b49b5be4a56bad4573e269b6578', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('de8934031ca4a501cb81033be32170d4', '物料搬运设备制造', '物料搬运设备制造', '1536310379493011483', 1461518083062722560, 559, '', '1536310379493011479', 0, '1');
INSERT INTO `jvs_tree` VALUES ('deae65ae85247f5b74c5b3b41e60c145', '风动和电动工具制造', '风动和电动工具制造', '1536311398964736164', 1461518083062722560, 580, '', '1536311398964736148', 0, '1');
INSERT INTO `jvs_tree` VALUES ('dec6cf2ec6a04079bc2f882a44d19215', '花画工艺品制造', '花画工艺品制造', 'dec6cf2ec6a04079bc2f882a44d19215', 1461518083062722560, 327, '', 'cd500f4cc4ef4eb1804e926ebaa49e9f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('decff818289b4b84a0d4a4c0c6f0d8ca', '其他人造板制造', '其他人造板制造', 'decff818289b4b84a0d4a4c0c6f0d8ca', 1461518083062722560, 275, '', '97753ff411f04aadb0ab4b230d80c204', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('def79ee85058a07d0ba2cd42742064d2', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536307437964702076', 1461518083062722560, 1190, '', '1536307437964702072', 0, '1');
INSERT INTO `jvs_tree` VALUES ('defaae5d949a622226a36874f26a59c9', '制冷、空调设备制造', '制冷、空调设备制造', '1536294082927472766', 1461518083062722560, 579, '', '1536294082927472754', 0, '1');
INSERT INTO `jvs_tree` VALUES ('df1eaae88b974640b098cd895709f708', '集成电路制造', '集成电路制造', 'df1eaae88b974640b098cd895709f708', 1461518083062722560, 758, '', '7b5fc101b3194fbe909a9bbbd7fda9ce', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('df42202933c34078b2200d0c0fdae295', '电子乐器制造', '电子乐器制造', 'df42202933c34078b2200d0c0fdae295', 1461518083062722560, 321, '', '8c16b25978dd4f4c9d4c18bc84cce536', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('df4d0b896de5471396b850a5f6beb837', '电子测量仪器制造', '电子测量仪器制造', 'df4d0b896de5471396b850a5f6beb837', 1461518083062722560, 780, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('df7105e39fb84e148983abb78e7239a9', '玻璃保温容器制造', '玻璃保温容器制造', 'df7105e39fb84e148983abb78e7239a9', 1461518083062722560, 459, '', '7f127fa7b9644592b4899ee6820f5647', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('dfd0478638c144a6b6a1d65f8714fce5', '自行车修理', '自行车修理', 'dfd0478638c144a6b6a1d65f8714fce5', 1461518083062722560, 1278, '', '74d5892b1f97481d8539373b97b8650c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e0274cb31c084751a6fe5ca5629964a2', '农、林、牧、渔服务业', '农、林、牧、渔服务业', 'e0274cb31c084751a6fe5ca5629964a2', 1461518083062722560, 69, '', '13d75bb0e0d1450aaac9436826617835', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e04f795c609c4795ad7c583ab69fc3dd', '有线广播电视传输服务', '有线广播电视传输服务', 'e04f795c609c4795ad7c583ab69fc3dd', 1461518083062722560, 1073, '', 'f3260d4f0e554e7dabc3d81e4b13a42e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e0901f40732d4273865f490865ed50d3', '其他建筑材料制造', '其他建筑材料制造', 'e0901f40732d4273865f490865ed50d3', 1461518083062722560, 449, '', '762baad6d4d74de8996e592c528088a8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e0a4cb2d3ca44920b74df8354aa241e5', '石油及制品批发', '石油及制品批发', 'e0a4cb2d3ca44920b74df8354aa241e5', 1461518083062722560, 899, '', '40b02e3c160241a8870c0e6451672907', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e0bd11c5c9b5c4214c236782e7bdf8e0', '照明器具制造', '照明器具制造', '1536310379493011663', 1461518083062722560, 730, '', '1536310379493011639', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e0fc037e16234ca38999cd7c66de3c84', '毛巾类制品制造', '毛巾类制品制造', 'e0fc037e16234ca38999cd7c66de3c84', 1461518083062722560, 232, '', '65b1efb0ed234319ba2d96b04df0cfbf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e1392ab8d6e240c49bc48be2afd1ad5d', '其他电工器材制造', '其他电工器材制造', 'e1392ab8d6e240c49bc48be2afd1ad5d', 1461518083062722560, 713, '', '31a17bcb9cf24935a1052bbc68fa9d07', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e13eb33614484d0ebca3d9c207c9fba8', '橡胶鞋制造', '橡胶鞋制造', 'e13eb33614484d0ebca3d9c207c9fba8', 1461518083062722560, 263, '', 'c3f468119b194c1a99edf99ae5c8066c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e1784ff2d65840599aafc29394164a90', '卫生材料及医药用品制造', '卫生材料及医药用品制造', 'e1784ff2d65840599aafc29394164a90', 1461518083062722560, 402, '', 'e4a034315f244268b87181669e0a6580', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e183f028611f436fb7de29c30a916477', '人民检察院', '人民检察院', 'e183f028611f436fb7de29c30a916477', 1461518083062722560, 1400, '', '64f96eb5bcbf434a8dad552b0bdc856e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e1859d611250a4af6511e0e9ec278f05', '专用设备制造业', '专用设备制造业', '1536310829881569464', 1461518083062722560, 598, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e1bebeac0730475d8227d5fb3c7f3d53', '疾病预防控制中心', '疾病预防控制中心', 'e1bebeac0730475d8227d5fb3c7f3d53', 1461518083062722560, 1327, '', '4801a7689f0d49c8b12f7c356f357333', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e1e325d5d6a24b18963f20c6b0efe72f', '制糖业', '制糖业', 'e1e325d5d6a24b18963f20c6b0efe72f', 1461518083062722560, 139, '', '5f26a5ad4f534ac19640fbd39d9f930f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e1e6b0a4b29646b78775f21cc5577e5b', '租赁和商务服务业', '租赁和商务服务业', 'e1e6b0a4b29646b78775f21cc5577e5b', 1461518083062722560, 1136, '', '1c047feeb426485aacda4b500a0567af', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e21b8ede1bd04170b66bc088517af26a', '环境污染处理专用药剂材料制造', '环境污染处理专用药剂材料制造', 'e21b8ede1bd04170b66bc088517af26a', 1461518083062722560, 383, '', '9bd394833dd6402cb2a5999b79e4ac43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e222f63d0cbe4b659bb50ec78a197c7d', '林业', '林业', 'e222f63d0cbe4b659bb50ec78a197c7d', 1461518083062722560, 35, '', '13d75bb0e0d1450aaac9436826617835', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e268ac474641406a885b7919b7997d44', '炼钢', '炼钢', 'e268ac474641406a885b7919b7997d44', 1461518083062722560, 479, '', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e2757eb1ceef69bbf918f46a3c873b9e', '照相机及器材制造', '照相机及器材制造', '1536311398964736180', 1461518083062722560, 587, '', '1536311398964736172', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e2996ba573a4420baf27bf0e4cbd9abd', '其他金属加工机械制造', '其他金属加工机械制造', 'e2996ba573a4420baf27bf0e4cbd9abd', 1461518083062722560, 558, '', '85eb2a5a58c04227b32578b29f92b940', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e2d4ba74360841349680a9410b9322eb', '建筑装饰业', '建筑装饰业', 'e2d4ba74360841349680a9410b9322eb', 1461518083062722560, 850, '', '8ed66bafdee04fd781dc83a103dcc577', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e2def968d486c0aadcbfb4982271083d', '研究和试验发展', '研究和试验发展', '1536294082927472982', 1461518083062722560, 1188, '', '1536294082805837824', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e362587868aa4976a44c8438409067ac', '核辐射加工', '核辐射加工', 'e362587868aa4976a44c8438409067ac', 1461518083062722560, 792, '', '623299992df24d2a80a2bd611558f27e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e367e07a8743a46642e0131443129665', '广播电视节目制作及发射设备制造', '广播电视节目制作及发射设备制造', '1536310829881569592', 1461518083062722560, 747, '', '1536310829881569588', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e36b473401e34f57990cf97d36e59196', '日用杂品制造', '日用杂品制造', 'e36b473401e34f57990cf97d36e59196', 1461518083062722560, 788, '', '623299992df24d2a80a2bd611558f27e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e3750f0747f448268c0680f34ebc51d1', '铁路机车车辆配件制造', '铁路机车车辆配件制造', 'e3750f0747f448268c0680f34ebc51d1', 1461518083062722560, 671, '', '80d9141616884b538edef0504a7dbe76', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e3b65f728ee948bf87dcb4ef110b65dc', '导航、气象及海洋专用仪器制造', '导航、气象及海洋专用仪器制造', 'e3b65f728ee948bf87dcb4ef110b65dc', 1461518083062722560, 775, '', '5894cdd2eef44eb0b64faf7b0ae34f72', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e3b95549526c49588de4605faa8a48a2', '酒吧服务', '酒吧服务', 'e3b95549526c49588de4605faa8a48a2', 1461518083062722560, 1060, '', 'd29526550a3c4c2eb00d1e245e8244e8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e3bbb4a7bfcb4680bc7ecac9fe1a2168', '其他电信服务', '其他电信服务', 'e3bbb4a7bfcb4680bc7ecac9fe1a2168', 1461518083062722560, 1071, '', 'a5ef7f7b5c784ad9b3ea357ad6f98182', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e3c61aa19f7c0fc72e27d986af7be59c', '非木竹浆制造', '非木竹浆制造', '1536307437964701796', 1461518083062722560, 296, '', '1536307437964701792', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e3e5f433000e4a8582130236036331bf', '常用有色金属矿采选', '常用有色金属矿采选', 'e3e5f433000e4a8582130236036331bf', 1461518083062722560, 95, '', 'b9630eb6fbec4c15b18f6b2d89fdb1ae', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e3eea26e3904f8e8d75a8ec6d274d3c1', '印刷、制药、日化及日用品生产专用设备制造', '印刷、制药、日化及日用品生产专用设备制造', '1536310829881569512', 1461518083062722560, 618, '', '1536310829881569464', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e441a6d3132f0a0489699c1652e7401c', '炼油、化工生产专用设备制造', '炼油、化工生产专用设备制造', '1536294082927472810', 1461518083062722560, 607, '', '1536294082927472806', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e44e00ec602a654083d6711105cb7941', '精制茶加工', '精制茶加工', '1536294082923278356', 1461518083062722560, 201, '', '1536294082923278352', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e46d02ed330f4a32aeb2acda611aba43', '金属工具制造', '金属工具制造', 'e46d02ed330f4a32aeb2acda611aba43', 1461518083062722560, 513, '', 'fb030bf0f03346d09a84b55753afc762', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e48880323ac94df5a35c3ab1051edc3b', '口腔清洁用品制造', '口腔清洁用品制造', 'e48880323ac94df5a35c3ab1051edc3b', 1461518083062722560, 392, '', 'b5210ed1f0304474a251e592d21f2258', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e49064c7cacb47d19a48b381ffed1a07', '常用有色金属冶炼', '常用有色金属冶炼', 'e49064c7cacb47d19a48b381ffed1a07', 1461518083062722560, 484, '', 'fe277f2855704704a0562cc62cff05ac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e4a034315f244268b87181669e0a6580', '医药制造业', '医药制造业', 'e4a034315f244268b87181669e0a6580', 1461518083062722560, 395, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e4e947fd64424d8d875c5c17f8e29580', '妇幼保健院（所、站）', '妇幼保健院（所、站）', 'e4e947fd64424d8d875c5c17f8e29580', 1461518083062722560, 1325, '', '4801a7689f0d49c8b12f7c356f357333', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e4f130e20c7d4e6cbb193b1172d1c3a2', '非家用纺织制成品制造', '非家用纺织制成品制造', 'e4f130e20c7d4e6cbb193b1172d1c3a2', 1461518083062722560, 235, '', 'b043f4c16e124cbb9905c6d0d8e76fd1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e51ad97577d1461993910fdb489526c7', '金融信息服务', '金融信息服务', 'e51ad97577d1461993910fdb489526c7', 1461518083062722560, 1127, '', '3bcdeee22fa44217a2505feebf9e6c9b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e52b3f927a7b418e9c244539add333ef', '报纸出版', '报纸出版', 'e52b3f927a7b418e9c244539add333ef', 1461518083062722560, 1345, '', '7ef056b6bde840c3bc6b6186f8d032ed', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e53cfa37b939479e9a38ece592a0bfcc', '餐饮配送服务', '餐饮配送服务', 'e53cfa37b939479e9a38ece592a0bfcc', 1461518083062722560, 1064, '', '62af44e381044e2cba12bffa1e0b47ec', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e547bc1709c14d2eba48e5e23823f8e7', '钨钼矿采选', '钨钼矿采选', 'e547bc1709c14d2eba48e5e23823f8e7', 1461518083062722560, 109, '', '245a071a1fbc4bf7b08fc1ffcf089dad', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e5d6774cdb184ce38914ecdfe9050a52', '地板制造', '地板制造', 'e5d6774cdb184ce38914ecdfe9050a52', 1461518083062722560, 279, '', '08c234aebbb444c99b04de865d8f2efb', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e61bd3626d1144d3961dfc91623f4310', '客运汽车站', '客运汽车站', 'e61bd3626d1144d3961dfc91623f4310', 1461518083062722560, 1007, '', '0af114f6710c4fe1950cb9d026b88789', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e61ece952901e10ba6f58d33b01cc293', '农副食品加工业', '农副食品加工业', '1536310829881569288', 1461518083062722560, 133, '', '1536310829881569284', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e6461485993b4931bfcf1cf4ece8e00b', '仪器仪表修理', '仪器仪表修理', 'e6461485993b4931bfcf1cf4ece8e00b', 1461518083062722560, 807, '', 'a30057bad4994bfa9049c45c55b82e81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e668b95b7ef243dc93af1b080b0cf364', '钟表、眼镜零售', '钟表、眼镜零售', 'e668b95b7ef243dc93af1b080b0cf364', 1461518083062722560, 943, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e6cda3bcd7a34a3e99ac545b0c391c02', '航天器制造', '航天器制造', 'e6cda3bcd7a34a3e99ac545b0c391c02', 1461518083062722560, 684, '', '63c782a68b2d4768b625fb2673c9b222', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e6d2810ca4524277ae4db0e8db4a8761', '炸药及火工产品制造', '炸药及火工产品制造', 'e6d2810ca4524277ae4db0e8db4a8761', 1461518083062722560, 387, '', 'ecd416806da0431c909e98e8f3bffd4f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e6d81ec118e14452ae27560ad9c35f44', '输配电及控制设备制造', '输配电及控制设备制造', 'e6d81ec118e14452ae27560ad9c35f44', 1461518083062722560, 702, '', '52ffeaa5459542128bf67a6d04df1dda', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e6f1c964b92044e0b5851aad332caa19', '金属家具制造', '金属家具制造', 'e6f1c964b92044e0b5851aad332caa19', 1461518083062722560, 290, '', '5c0163f1f7124c4993575b0d7c6aeb99', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e6f818adf14343428413994a809b6124', '录音制作', '录音制作', 'e6f818adf14343428413994a809b6124', 1461518083062722560, 1356, '', '45b720ad902c4b4790710c3d15cc1883', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e70bbb71888a2deba74ebfa40abdeeff', '轴承、齿轮和传动部件制造', '轴承、齿轮和传动部件制造', '1536311398964736140', 1461518083062722560, 571, '', '1536311398964736112', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e736be600065e6cc7b203ea443911b59', '燃气生产和供应业', '燃气生产和供应业', '1536294082927472970', 1461518083062722560, 820, '', '1536294082927472966', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e73a93d84c414f2191d89fb3c069f9ca', '草及其他制品制造', '草及其他制品制造', 'e73a93d84c414f2191d89fb3c069f9ca', 1461518083062722560, 286, '', 'ffbf154fce954e5a83fdf7c1ca00f8ba', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e74825a1ee504cc981052f502fe958d1', '其他家具制造', '其他家具制造', 'e74825a1ee504cc981052f502fe958d1', 1461518083062722560, 292, '', '5c0163f1f7124c4993575b0d7c6aeb99', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e77d62239f224d1e92709bcb3041fa16', '日用陶瓷制品制造', '日用陶瓷制品制造', 'e77d62239f224d1e92709bcb3041fa16', 1461518083062722560, 468, '', 'a402270dd3274eec896e0ea9e5f4b851', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e792c27ee8404ea6b700ef2a508103b0', '水利管理业', '水利管理业', 'e792c27ee8404ea6b700ef2a508103b0', 1461518083062722560, 1228, '', 'd0159dee15c84e7497612587f32232e5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e7a8b172fb75406c8db8f32c48b803a7', '其他皮革制品制造', '其他皮革制品制造', 'e7a8b172fb75406c8db8f32c48b803a7', 1461518083062722560, 251, '', 'f1a4f35774454eba9c9613fab6dfb3a1', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e7e6b4bb13f64d21b4c77f127df970d7', '水产养殖', '水产养殖', 'e7e6b4bb13f64d21b4c77f127df970d7', 1461518083062722560, 63, '', 'f5c88e85ebeb40b5b705d0a15fc42924', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e7edcd8b9e675e2c035b7fc816eb3243', '汽车车身、挂车制造', '汽车车身、挂车制造', '1536310379493011635', 1461518083062722560, 665, '', '1536310379493011619', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e809bef5ac04a9d7654eb2e56f4bb861', '石油钻采专用设备制造', '石油钻采专用设备制造', '1536294082927472798', 1461518083062722560, 601, '', '1536294082927472794', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e821e1d643de40508001dfe91309f8fd', '机械设备、五金产品及电子产品批发', '机械设备、五金产品及电子产品批发', 'e821e1d643de40508001dfe91309f8fd', 1461518083062722560, 907, '', 'a7f809990927455bba2350c3cbd65540', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e833026ac9cc45259fda55125e7a7116', '羽毛（绒）制品加工', '羽毛（绒）制品加工', 'e833026ac9cc45259fda55125e7a7116', 1461518083062722560, 258, '', '126616505b0048ce98a6b7f0e6faa60b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e8375cf2bc462267fb5920620ac2b4f0', '废弃资源综合利用业', '废弃资源综合利用业', '1536307437964702052', 1461518083062722560, 794, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e84b5ee8bef459d75f4ce90bb12bc19a', '改装汽车制造', '改装汽车制造', '1536311398968930326', 1461518083062722560, 662, '', '1536311398968930322', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e85f7741d2134c12829d23f2004f01af', '马的饲养', '马的饲养', 'e85f7741d2134c12829d23f2004f01af', 1461518083062722560, 50, '', 'cecc6d30ab22456791361548e1d0f5db', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e86b2a56795f46528408444c995f6078', '糖果、巧克力制造', '糖果、巧克力制造', 'e86b2a56795f46528408444c995f6078', 1461518083062722560, 163, '', '6b6bcb3ce4704d60909fa9f6599f124b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('e8d3d3924057295c5d48bc1677a72494', '测试树', '测试树', '1536294082805837824', 1536294082805837824, 1187, NULL, '-1', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e8d6d68b7567d637c2588b0e7fe743bb', '石油钻采专用设备制造', '石油钻采专用设备制造', '1536311398964736192', 1461518083062722560, 601, '', '1536311398964736188', 0, '1');
INSERT INTO `jvs_tree` VALUES ('e8ec6bb4a5f74279875346fa5a3fdfa4', '麻类种植', '麻类种植', 'e8ec6bb4a5f74279875346fa5a3fdfa4', 1461518083062722560, 14, '', '8714f4525bd24e41bc090ac4dd94b150', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ea3d45f3386ef0f09226e6bc7f1eee0c', '镍氢电池制造', '镍氢电池制造', '1536294082927472898', 1461518083062722560, 716, '', '1536294082927472890', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ea7934ea64224ae4a75daf3126fab4f1', '普通初中教育', '普通初中教育', 'ea7934ea64224ae4a75daf3126fab4f1', 1461518083062722560, 1294, '', '204b9cd5e13545bdaad5a9f781515930', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ea805965407c4387929ffdf4e35b1b25', '电子出版物出版', '电子出版物出版', 'ea805965407c4387929ffdf4e35b1b25', 1461518083062722560, 1348, '', '7ef056b6bde840c3bc6b6186f8d032ed', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ea90a39bcfef42c9ae38b7711fb22566', '镍钴矿采选', '镍钴矿采选', 'ea90a39bcfef42c9ae38b7711fb22566', 1461518083062722560, 98, '', 'e3e5f433000e4a8582130236036331bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ead352e96e434738a95cc7acc0152ad6', '电光源制造', '电光源制造', 'ead352e96e434738a95cc7acc0152ad6', 1461518083062722560, 731, '', '052157cc3e7c4c94b921054b5038282b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ead6a9a975d74f95a8bc5cc9be791669', '航空、航天相关设备制造', '航空、航天相关设备制造', 'ead6a9a975d74f95a8bc5cc9be791669', 1461518083062722560, 685, '', '63c782a68b2d4768b625fb2673c9b222', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eae71131d4e64599b3c04654b478073e', '方便食品制造', '方便食品制造', 'eae71131d4e64599b3c04654b478073e', 1461518083062722560, 165, '', 'bdccc103aea04c328baa79ac2d2af736', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eb1764e7f69d317a2a2e6810154e3baa', '木质家具制造', '木质家具制造', '1536310829881569360', 1461518083062722560, 288, '', '1536310829881569356', 0, '1');
INSERT INTO `jvs_tree` VALUES ('eb2bead065184cf19e67349e3cc301ca', '玻璃纤维和玻璃纤维增强塑料制品制造', '玻璃纤维和玻璃纤维增强塑料制品制造', 'eb2bead065184cf19e67349e3cc301ca', 1461518083062722560, 462, '', '65a7ae426d7748eaade5fc8a25a5d23c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eb7d104296ae5a57233d0dce91dc5ba1', '歌舞厅娱乐活动', '歌舞厅娱乐活动', '1536294082927473050', 1461518083062722560, 1375, '', '1536294082927473046', 0, '1');
INSERT INTO `jvs_tree` VALUES ('eb874e229b154ae8b8db2ed8a5bd965f', '铁路、船舶、航空航天等运输设备修理', '铁路、船舶、航空航天等运输设备修理', 'eb874e229b154ae8b8db2ed8a5bd965f', 1461518083062722560, 801, '', 'a30057bad4994bfa9049c45c55b82e81', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eb8e81dd684d14a1324df2db97205191', '娱乐业', '娱乐业', '1536307437964702132', 1461518083062722560, 1373, '', '1536307437964702116', 0, '1');
INSERT INTO `jvs_tree` VALUES ('eba9a2ba39cf50eb564dd90244705c06', '中西医结合医院', '中西医结合医院', '1536311398968930470', 1461518083062722560, 1315, '', '1536311398968930462', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ebabfe380aab4b1ba376ab477416c851', '轴承制造', '轴承制造', 'ebabfe380aab4b1ba376ab477416c851', 1461518083062722560, 572, '', '2b227ad448424e66a0ef3ddb49e57624', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ebc8be7d2e8e49a2aaf2d645c179b186', '鞋和皮革修理', '鞋和皮革修理', 'ebc8be7d2e8e49a2aaf2d645c179b186', 1461518083062722560, 1279, '', '74d5892b1f97481d8539373b97b8650c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ebd4c97cfdd74defa2a1320e462f99a4', '证券经纪交易服务', '证券经纪交易服务', 'ebd4c97cfdd74defa2a1320e462f99a4', 1461518083062722560, 1103, '', '7422c3c971f147c9be4044fab97ada13', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ebdab3dd7b054281b99ac3f233860295', '节能技术推广服务', '节能技术推广服务', 'ebdab3dd7b054281b99ac3f233860295', 1461518083062722560, 1223, '', '0888e14ec3974ab29ce2919250e07b7d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ec236b7e6ef847eab841d2cf010b40ff', '黑色金属铸造', '黑色金属铸造', 'ec236b7e6ef847eab841d2cf010b40ff', 1461518083062722560, 480, '', 'ba71dda4283b4a00aabe5dcf2bbb4d26', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eccc959fe03abdbd02ef389357edd4f9', '汽车车身、挂车制造', '汽车车身、挂车制造', '1536294082927472874', 1461518083062722560, 665, '', '1536294082927472858', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ecce8ec80f012fdc177650c1ed397f9a', '其他日用品生产专用设备制造', '其他日用品生产专用设备制造', '1536294082927472842', 1461518083062722560, 625, '', '1536294082927472838', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ecd416806da0431c909e98e8f3bffd4f', '炸药、火工及焰火产品制造', '炸药、火工及焰火产品制造', 'ecd416806da0431c909e98e8f3bffd4f', 1461518083062722560, 386, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ecead1b2046e4707afd288426339d39a', '医疗用品及器材批发', '医疗用品及器材批发', 'ecead1b2046e4707afd288426339d39a', 1461518083062722560, 896, '', '5ef0d34da8ea4f35a71a790414db8990', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ecee10208d2a4923a15aa20110bf91a6', '对外事务管理机构', '对外事务管理机构', 'ecee10208d2a4923a15aa20110bf91a6', 1461518083062722560, 1393, '', 'feeac738e0214b64869a7e61bbf2505c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ecf22c328f394eeaa42105e5801a4f75', '家用电力器具制造', '家用电力器具制造', 'ecf22c328f394eeaa42105e5801a4f75', 1461518083062722560, 718, '', '52ffeaa5459542128bf67a6d04df1dda', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ed0febcb024a92711ea9f79cc1b49800', '竹、藤家具制造', '竹、藤家具制造', '1536294082927472690', 1461518083062722560, 289, '', '1536294082927472682', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ed1d8ad3b1eeaa5ccf2212c585e77000', '钟表与计时仪器制造', '钟表与计时仪器制造', '1536310379493011707', 1461518083062722560, 782, '', '1536310379493011687', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ed3a0d30eeac49ff8a4cdcd53d6e5c2b', '航空运输辅助活动', '航空运输辅助活动', 'ed3a0d30eeac49ff8a4cdcd53d6e5c2b', 1461518083062722560, 1028, '', '3b03d37482194755857827cf9bbe4be3', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ed3f49e693d0463f80ae0031b66d504e', '黄酒制造', '黄酒制造', 'ed3f49e693d0463f80ae0031b66d504e', 1461518083062722560, 191, '', 'f6f9e986c5a64965b65cc4b7569d7949', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ed5e2a884d7f44d2855775e47831449f', '其他电子设备制造', '其他电子设备制造', 'ed5e2a884d7f44d2855775e47831449f', 1461518083062722560, 763, '', '33c10b41d3a34c66aa7898793302dd15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ed6f4e9f2477409da1beda527f2ff24d', '模具制造', '模具制造', 'ed6f4e9f2477409da1beda527f2ff24d', 1461518083062722560, 611, '', '2c1dfdaf17eb41db8e66fb3f200351da', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('edbb7446f7a8426286f85b28bff99de2', '拖拉机制造', '拖拉机制造', 'edbb7446f7a8426286f85b28bff99de2', 1461518083062722560, 635, '', '96416de0d629464ab952c86bdfc99406', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ede711f040ae2e60176994c250a3d884', '电梯、自动扶梯及升降机制造', '电梯、自动扶梯及升降机制造', '1536294082927472730', 1461518083062722560, 564, '', '1536294082927472722', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ee8078cfcb0544549cba3907b82c4fc4', '森林防火服务', '森林防火服务', 'ee8078cfcb0544549cba3907b82c4fc4', 1461518083062722560, 77, '', '789befc4bd144da18ee07645854cb3cc', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eea11ab16ffe48bab6b8cd1fb0c8be6e', '淀粉及淀粉制品制造', '淀粉及淀粉制品制造', 'eea11ab16ffe48bab6b8cd1fb0c8be6e', 1461518083062722560, 154, '', 'abe8451608a641289138e19f9b7ee698', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('eeb06ef1eabf45dc9214022934a5ad13', '锅炉及原动设备制造', '锅炉及原动设备制造', 'eeb06ef1eabf45dc9214022934a5ad13', 1461518083062722560, 545, '', '1c791a5df6fe457ebc0ac073b76f1af0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ef83ece638ad038235061a14f48e240e', '照相机及器材制造', '照相机及器材制造', '1536310379493011547', 1461518083062722560, 587, '', '1536310379493011539', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ef8532cb75574d1e89d50b62cfc96d92', '专业技术服务业', '专业技术服务业', 'ef8532cb75574d1e89d50b62cfc96d92', 1461518083062722560, 1194, '', '0835d6af067244cdbd679abb37910c37', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('efb8004b987358261c41acb320034d1f', '房地产业', '房地产业', '1536311398968930438', 1461518083062722560, 1129, '', '1536311398855684096', 0, '1');
INSERT INTO `jvs_tree` VALUES ('efd3cd9b3fc745ca949140f3f401446e', '谷物种植', '谷物种植', 'efd3cd9b3fc745ca949140f3f401446e', 1461518083062722560, 3, '', 'b0aa9ed2d25f4c6181f4fa057fdef141', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f00f33731f5c4479b30cd83db6d8ef6f', '固体饮料制造', '固体饮料制造', 'f00f33731f5c4479b30cd83db6d8ef6f', 1461518083062722560, 199, '', 'f77c488fca9e415bb74990de42777f54', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f037a460330848f7a906829443e2d801', '纺织专用设备制造', '纺织专用设备制造', 'f037a460330848f7a906829443e2d801', 1461518083062722560, 627, '', '4346899fad9a423595fb6c48789dd99d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f082027e259949c4b0243d29aadc4a56', '窗帘、布艺类产品制造', '窗帘、布艺类产品制造', 'f082027e259949c4b0243d29aadc4a56', 1461518083062722560, 233, '', '65b1efb0ed234319ba2d96b04df0cfbf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f082abeb13924215b46a1d55e35c2629', '包装服务', '包装服务', 'f082abeb13924215b46a1d55e35c2629', 1461518083062722560, 1182, '', '18ca24e42dd1453daaa1cb34b8a4714c', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f0b46455403b41e5bbb4d2863a022369', '广播', '广播', 'f0b46455403b41e5bbb4d2863a022369', 1461518083062722560, 1351, '', '45b720ad902c4b4790710c3d15cc1883', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f0b46cbbbf5a882a6ddf8926d2c03766', '化学纤维制造业', '化学纤维制造业', '1536307437964701804', 1461518083062722560, 403, '', '1536307437964701700', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f0d4e09fb53a5023a469bc303261bc58', '木门窗、楼梯制造', '木门窗、楼梯制造', '1536294082927472674', 1461518083062722560, 278, '', '1536294082927472670', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f0d99f6a172f3a8911e0589a27c1aaa8', '烘炉、风机、衡器、包装等设备制造', '烘炉、风机、衡器、包装等设备制造', '1536294082927472754', 1461518083062722560, 575, '', '1536294082927472718', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f0e99da2e4993a21c65dfab02c71a19f', '照相机及器材制造', '照相机及器材制造', '1536310829881569460', 1461518083062722560, 587, '', '1536310829881569452', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f0ec1cd3fee44084bad24dfea2faa8f3', '医疗诊断、监护及治疗设备制造', '医疗诊断、监护及治疗设备制造', 'f0ec1cd3fee44084bad24dfea2faa8f3', 1461518083062722560, 644, '', 'b2eac7458a9e4b62869529e05c8b1f22', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f10c0a915cbf45cd8a9919dd5279a372', '豆类种植', '豆类种植', 'f10c0a915cbf45cd8a9919dd5279a372', 1461518083062722560, 9, '', '5945424b0827482ca25284bb80b7fdc0', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f10efde4f65542498f1b97a6882ae827', '其他稀有金属矿采选', '其他稀有金属矿采选', 'f10efde4f65542498f1b97a6882ae827', 1461518083062722560, 112, '', '245a071a1fbc4bf7b08fc1ffcf089dad', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f13cdee031a943ca8f9d0fc948a46d71', '其他自然保护', '其他自然保护', 'f13cdee031a943ca8f9d0fc948a46d71', 1461518083062722560, 1239, '', '34b3891c4b974d5791e24e2c61ab1bd5', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f1566617e51a390bc5b3a6ce75f2496a', '农副食品加工专用设备制造', '农副食品加工专用设备制造', '1536307437964701916', 1461518083062722560, 615, '', '1536307437964701912', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f15df6f38b7744db96f0d84f1053ebaf', '其他非金属矿物制品制造', '其他非金属矿物制品制造', 'f15df6f38b7744db96f0d84f1053ebaf', 1461518083062722560, 476, '', '15aecc175ecb4ae28c72c0208ed0c259', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f163cfe0882c48f5a0c077e9c7c8911f', '生物药品制造', '生物药品制造', 'f163cfe0882c48f5a0c077e9c7c8911f', 1461518083062722560, 401, '', 'e4a034315f244268b87181669e0a6580', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f1a4f35774454eba9c9613fab6dfb3a1', '皮革制品制造', '皮革制品制造', 'f1a4f35774454eba9c9613fab6dfb3a1', 1461518083062722560, 247, '', '41d6e99c8a134d7992628343e52ff28a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f1b170d3fbec409bbf9fc6cdc6d95bfe', '微电机及其他电机制造', '微电机及其他电机制造', 'f1b170d3fbec409bbf9fc6cdc6d95bfe', 1461518083062722560, 701, '', '7a259f23ded444af8a75c658e8ab752a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f1cc0d5ef61e42f6a7dc652cf650b5eb', '搪瓷制品制造', '搪瓷制品制造', 'f1cc0d5ef61e42f6a7dc652cf650b5eb', 1461518083062722560, 530, '', 'fb030bf0f03346d09a84b55753afc762', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f1e4aba3c7fe4d8abe12a4cb0a716995', '固体矿产地质勘查', '固体矿产地质勘查', 'f1e4aba3c7fe4d8abe12a4cb0a716995', 1461518083062722560, 1205, '', '593642eaef7f4d56841c28795fa2f9de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f23500ffa36f47dda2908527522317f5', '互联网和相关服务', '互联网和相关服务', 'f23500ffa36f47dda2908527522317f5', 1461518083062722560, 1076, '', '9dff8e99b53f46a08b2a82d317b1ce82', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f25cfc25244447af551c00e6012a829d', '汽车制造业', '汽车制造业', '1536311398968930322', 1461518083062722560, 660, '', '1536311398964736004', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f27972803fad4c68856b4e16c9ffecbf', '木材加工机械制造', '木材加工机械制造', 'f27972803fad4c68856b4e16c9ffecbf', 1461518083062722560, 610, '', '2c1dfdaf17eb41db8e66fb3f200351da', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f298a6278cfb45b7a8e4ffe929c7e754', '森林经营和管护', '森林经营和管护', 'f298a6278cfb45b7a8e4ffe929c7e754', 1461518083062722560, 40, '', 'e222f63d0cbe4b659bb50ec78a197c7d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f2bbbf161fba45d28d17fa1178a654cb', '稀有稀土金属压延加工', '稀有稀土金属压延加工', 'f2bbbf161fba45d28d17fa1178a654cb', 1461518083062722560, 507, '', '834d7ba750384e2eb50b08718329951f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f2dddd6c1808403185f836583368d9b7', '水的生产和供应业', '水的生产和供应业', 'f2dddd6c1808403185f836583368d9b7', 1461518083062722560, 822, '', '4218674804e549bfb3c9fcfb99ab4d56', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f315a33e96664b5a8b8a8d1e74bacf72', '人身保险', '人身保险', 'f315a33e96664b5a8b8a8d1e74bacf72', 1461518083062722560, 1112, '', '957d60e6ff6847e08c6514eb084a4b35', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f3260d4f0e554e7dabc3d81e4b13a42e', '广播电视传输服务', '广播电视传输服务', 'f3260d4f0e554e7dabc3d81e4b13a42e', 1461518083062722560, 1072, '', '3f17841046934332b6147dd9a026e57a', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f3397b6975054c019bb446c7571ea125', '涂料制造', '涂料制造', 'f3397b6975054c019bb446c7571ea125', 1461518083062722560, 368, '', 'b582e29d66aa4ac4bb3ec657198b0477', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f33e790e738b4f49bd1be6bf8272fd46', '其他未列明制造业', '其他未列明制造业', 'f33e790e738b4f49bd1be6bf8272fd46', 1461518083062722560, 793, '', '623299992df24d2a80a2bd611558f27e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f35d385b21864cdd937a7b4775e2ae40', '幻灯及投影设备制造', '幻灯及投影设备制造', 'f35d385b21864cdd937a7b4775e2ae40', 1461518083062722560, 586, '', '28431578cb7545b4afd7fd13da26977d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f363863325674ba297644b0b91b277b8', '邮政基本服务', '邮政基本服务', 'f363863325674ba297644b0b91b277b8', 1461518083062722560, 1047, '', '090c7dc402b04c499aa4878c441e823b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f371d8b8442246a0a0c970b7e44912e7', '金属丝绳及其制品制造', '金属丝绳及其制品制造', 'f371d8b8442246a0a0c970b7e44912e7', 1461518083062722560, 523, '', 'fb030bf0f03346d09a84b55753afc762', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f3819daef529413c94e3ea85f6ac27c8', '卫生洁具零售', '卫生洁具零售', 'f3819daef529413c94e3ea85f6ac27c8', 1461518083062722560, 977, '', '9ac718d3a2674cd3ba0eb93f96c19874', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f3a1a536d7b04f32a983ad89a38326f5', '客运火车站', '客运火车站', 'f3a1a536d7b04f32a983ad89a38326f5', 1461518083062722560, 995, '', '83441daa2a8049aebbba94511aee5316', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f3c390fdcae2443ea65e453fdee97827', '再保险', '再保险', 'f3c390fdcae2443ea65e453fdee97827', 1461518083062722560, 1116, '', '957d60e6ff6847e08c6514eb084a4b35', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f3cec56894d542dc9fb92edb50f748c5', '娱乐船和运动船制造', '娱乐船和运动船制造', 'f3cec56894d542dc9fb92edb50f748c5', 1461518083062722560, 678, '', '98490bfbacce404285880451a06a29fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f43139fd254a4a078b86f8cceb6574ff', '床上用品制造', '床上用品制造', 'f43139fd254a4a078b86f8cceb6574ff', 1461518083062722560, 231, '', '65b1efb0ed234319ba2d96b04df0cfbf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f4857f8c5ee1447a9ea98466762f6bae', '家用电力器具专用配件制造', '家用电力器具专用配件制造', 'f4857f8c5ee1447a9ea98466762f6bae', 1461518083062722560, 725, '', 'ecf22c328f394eeaa42105e5801a4f75', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f4b739d7d99555cf8561c86640c4b4ef', '照明器具制造', '照明器具制造', '1536311398968930366', 1461518083062722560, 730, '', '1536311398968930342', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f4ed2ec00c8ab028e82840bf87af5423', '专用仪器仪表制造', '专用仪器仪表制造', '1536307437964702020', 1461518083062722560, 772, '', '1536307437964702016', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f4f50ca42e784bfaaf36d0bf7ec1830d', '建材批发', '建材批发', 'f4f50ca42e784bfaaf36d0bf7ec1830d', 1461518083062722560, 902, '', '40b02e3c160241a8870c0e6451672907', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f5023b625ab064d2dc32320cd8fbc3e2', '锂离子电池制造', '锂离子电池制造', '1536310379493011655', 1461518083062722560, 715, '', '1536310379493011651', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f54ada8a70ee223a2aea8aa04ee00941', '光学仪器及眼镜制造', '光学仪器及眼镜制造', '1536294082927472950', 1461518083062722560, 783, '', '1536294082927472926', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f557ac6f7577db97698eb5256ebe9bf6', '其他仪器仪表制造业', '其他仪器仪表制造业', '1536294082927472958', 1461518083062722560, 786, '', '1536294082927472926', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f570ed680fb74edc87290c79458e5d93', '烟草种植', '烟草种植', 'f570ed680fb74edc87290c79458e5d93', 1461518083062722560, 16, '', '8714f4525bd24e41bc090ac4dd94b150', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f58c5513d4a441efabd2e60a2e14661c', '其他化工产品批发', '其他化工产品批发', 'f58c5513d4a441efabd2e60a2e14661c', 1461518083062722560, 906, '', '40b02e3c160241a8870c0e6451672907', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f5a2f7f3385a4c49812f4115ace7af3b', '变压器、整流器和电感器制造', '变压器、整流器和电感器制造', 'f5a2f7f3385a4c49812f4115ace7af3b', 1461518083062722560, 703, '', 'e6d81ec118e14452ae27560ad9c35f44', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f5af077d6e0c910e00e896c3576d6f76', '电梯、自动扶梯及升降机制造', '电梯、自动扶梯及升降机制造', '1536307437964701820', 1461518083062722560, 564, '', '1536307437964701812', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f5b88214f5184db3a6d8bcced3d91ad7', '石油和天然气开采业', '石油和天然气开采业', 'f5b88214f5184db3a6d8bcced3d91ad7', 1461518083062722560, 87, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f5ba54465a8a47e5bf3a270864fdf386', '其他调味品、发酵制品制造', '其他调味品、发酵制品制造', 'f5ba54465a8a47e5bf3a270864fdf386', 1461518083062722560, 178, '', 'f9dd72346d594ba1aa1468374485baf7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f5c88e85ebeb40b5b705d0a15fc42924', '渔业', '渔业', 'f5c88e85ebeb40b5b705d0a15fc42924', 1461518083062722560, 62, '', '13d75bb0e0d1450aaac9436826617835', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f5cea2667052e1b89279d8c51a48a1cb', '缝制机械制造', '缝制机械制造', '1536310379493011611', 1461518083062722560, 629, '', '1536310379493011607', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f60f3ba8db444b7da5a8bb48b1b38978', '精炼石油产品制造', '精炼石油产品制造', 'f60f3ba8db444b7da5a8bb48b1b38978', 1461518083062722560, 345, '', 'af344b73bd07415f97213c1ba915aaac', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f63e54fc595b4f26ae1ccd9c136db1b0', '农业机械批发', '农业机械批发', 'f63e54fc595b4f26ae1ccd9c136db1b0', 1461518083062722560, 908, '', 'e821e1d643de40508001dfe91309f8fd', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f6404f2d7af94e23aea5f04d4b3e7ccd', '证券市场管理服务', '证券市场管理服务', 'f6404f2d7af94e23aea5f04d4b3e7ccd', 1461518083062722560, 1102, '', '7422c3c971f147c9be4044fab97ada13', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f65ec621658e1bb01fba0ce9d82ebf56', '卫生', '卫生', '1536294082927472994', 1461518083062722560, 1311, '', '1536294082927472990', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f6648d4115ccccc2653f275f5fc32bb6', '羽毛(绒)加工及制品制造', '羽毛(绒)加工及制品制造', '1536294082923278368', 1461518083062722560, 256, '', '1536294082923278364', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f686b1e78ecb4b0d91fbfd2a1a605018', '水上货物运输', '水上货物运输', 'f686b1e78ecb4b0d91fbfd2a1a605018', 1461518083062722560, 1015, '', 'b815134170f74bb08ef895c26c8fd01f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f6a827f34ea94491842392d2dd063f92', '试验机制造', '试验机制造', 'f6a827f34ea94491842392d2dd063f92', 1461518083062722560, 770, '', 'd0f29cd031234e9f86540ef6ebf43e55', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f6c96d4d4a84467a99e973b643e6651e', '其他食品制造', '其他食品制造', 'f6c96d4d4a84467a99e973b643e6651e', 1461518083062722560, 179, '', 'bdccc103aea04c328baa79ac2d2af736', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f6d5e5bb19ec486ba11a1afb7838a36b', '居民服务业', '居民服务业', 'f6d5e5bb19ec486ba11a1afb7838a36b', 1461518083062722560, 1256, '', 'ca487ef1343d40f084234fc555aa3361', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f6ee83eb8d7c4c8695b5c26ee7251bff', '非金属船舶制造', '非金属船舶制造', 'f6ee83eb8d7c4c8695b5c26ee7251bff', 1461518083062722560, 677, '', '98490bfbacce404285880451a06a29fe', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f6f9e986c5a64965b65cc4b7569d7949', '酒的制造', '酒的制造', 'f6f9e986c5a64965b65cc4b7569d7949', 1461518083062722560, 187, '', '4848e0cf19cd4cd8ac32aebeb342e689', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f700945cef6f4537abafc7f51b7c5824', '轻质建筑材料制造', '轻质建筑材料制造', 'f700945cef6f4537abafc7f51b7c5824', 1461518083062722560, 441, '', '1e55bff094854d93bb468c6f213265de', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f70c2d03a70d4d43b7b3c4bbf44fd353', '门诊部（所）', '门诊部（所）', 'f70c2d03a70d4d43b7b3c4bbf44fd353', 1461518083062722560, 1323, '', '4801a7689f0d49c8b12f7c356f357333', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f714090565b44222858e2d4b87ff3bbb', '玻璃纤维及制品制造', '玻璃纤维及制品制造', 'f714090565b44222858e2d4b87ff3bbb', 1461518083062722560, 463, '', 'eb2bead065184cf19e67349e3cc301ca', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f73817bf67a44602a380d2874090ef6f', '音像制品出租', '音像制品出租', 'f73817bf67a44602a380d2874090ef6f', 1461518083062722560, 1147, '', '3291363a04824a4a83fa735df8baf155', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f74e5170fd574a4fba166abdba4e1d75', '结构性金属制品制造', '结构性金属制品制造', 'f74e5170fd574a4fba166abdba4e1d75', 1461518083062722560, 510, '', 'fb030bf0f03346d09a84b55753afc762', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f7537336d12f49f5b9b6a66d9437bbdc', '其他采矿业', '其他采矿业', 'f7537336d12f49f5b9b6a66d9437bbdc', 1461518083062722560, 130, '', 'd974c20c756c4036a1309e5d09e9ffab', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f75e647c17d0f7211aa220ec09dcebcd', '卫生和社会工作', '卫生和社会工作', '1536307437964702080', 1461518083062722560, 1310, '', '1536307437503328256', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f77c488fca9e415bb74990de42777f54', '饮料制造', '饮料制造', 'f77c488fca9e415bb74990de42777f54', 1461518083062722560, 194, '', '4848e0cf19cd4cd8ac32aebeb342e689', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f7a803f3d94a4c97a9d7a53b720aaddc', '合成材料制造', '合成材料制造', 'f7a803f3d94a4c97a9d7a53b720aaddc', 1461518083062722560, 373, '', 'c01cf4a89346492eb44865639a074a45', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f7b66837beea4d1db16bea2b7b9a01c4', '宗教组织', '宗教组织', 'f7b66837beea4d1db16bea2b7b9a01c4', 1461518083062722560, 1418, '', '5954a785d7a0417d91fca5ff381a0c70', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f7f7d2408f6d417ea7746c4b16346327', '城乡市容管理', '城乡市容管理', 'f7f7d2408f6d417ea7746c4b16346327', 1461518083062722560, 1250, '', '08a1fc9f693f48129e4bf075c2623051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f83fab987c2a50391af44edd8bca0fb1', '电影放映', '电影放映', '1536310829881569712', 1461518083062722560, 1355, '', '1536310829881569704', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f8587a35bdea42948e74ac7d30f8d488', '味精制造', '味精制造', 'f8587a35bdea42948e74ac7d30f8d488', 1461518083062722560, 176, '', 'f9dd72346d594ba1aa1468374485baf7', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f869025dc61843ca838794872e9aa86f', '计算机及通讯设备租赁', '计算机及通讯设备租赁', 'f869025dc61843ca838794872e9aa86f', 1461518083062722560, 1142, '', '8f386fcc48054b529a2ac3b11d704051', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f8f60b812bca4c15ac143f477661ba23', '计算机制造', '计算机制造', 'f8f60b812bca4c15ac143f477661ba23', 1461518083062722560, 738, '', '33c10b41d3a34c66aa7898793302dd15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f902a25c8b155a635d0447d1cdc751dc', '视听设备制造', '视听设备制造', '1536310829881569596', 1461518083062722560, 751, '', '1536310829881569580', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f9345077d504b7ce54c3978cbdfc9376', '工程和技术研究和试验发展', '工程和技术研究和试验发展', '1536294082927472986', 1461518083062722560, 1190, '', '1536294082927472982', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f934d3606b33452988be7ba39611d19e', '装订及印刷相关服务', '装订及印刷相关服务', 'f934d3606b33452988be7ba39611d19e', 1461518083062722560, 309, '', '90dce92b097a4d6d99cae39395a5af92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f96fc757dc42400da64763438e7d2327', '图书批发', '图书批发', 'f96fc757dc42400da64763438e7d2327', 1461518083062722560, 888, '', 'b6553f5fc13d4359acc4a0467709a7bf', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f99124c9cfe6418dbdcfbf49b2b252a3', '煤制品制造', '煤制品制造', 'f99124c9cfe6418dbdcfbf49b2b252a3', 1461518083062722560, 791, '', '623299992df24d2a80a2bd611558f27e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f99553c69ecef10cce45d9131589894d', '电线、电缆、光缆及电工器材制造', '电线、电缆、光缆及电工器材制造', '1536294082927472882', 1461518083062722560, 709, '', '1536294082927472878', 0, '1');
INSERT INTO `jvs_tree` VALUES ('f9a7b57c124f4523b1ea5ffeec9470b2', '竹材采运', '竹材采运', 'f9a7b57c124f4523b1ea5ffeec9470b2', 1461518083062722560, 43, '', '4d150f671040463cbebe29034b022008', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('f9dd72346d594ba1aa1468374485baf7', '调味品、发酵制品制造', '调味品、发酵制品制造', 'f9dd72346d594ba1aa1468374485baf7', 1461518083062722560, 175, '', 'bdccc103aea04c328baa79ac2d2af736', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fa79e6c6fbe449eaa77c9994b7e15b18', '石油和天然气开采辅助活动', '石油和天然气开采辅助活动', 'fa79e6c6fbe449eaa77c9994b7e15b18', 1461518083062722560, 128, '', '41f6765fdef74d1da4ba35e198ce3473', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fab1bfdecc2d4dc7982f0bd1e19a0cd3', '其他电池制造', '其他电池制造', 'fab1bfdecc2d4dc7982f0bd1e19a0cd3', 1461518083062722560, 717, '', '41b7992560624658b1f1f8cfa1971782', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fad6a7e804b54c91a4986e259307fd22', '物业管理', '物业管理', 'fad6a7e804b54c91a4986e259307fd22', 1461518083062722560, 1132, '', 'b58bd9253692458cbbfdf0e589c39e11', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fada5400b4ff44439d7ae64e6dc68ae9', '正餐服务', '正餐服务', 'fada5400b4ff44439d7ae64e6dc68ae9', 1461518083062722560, 1055, '', 'b7677f90d185460a8e7dea5ad7a69354', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fb030bf0f03346d09a84b55753afc762', '金属制品业', '金属制品业', 'fb030bf0f03346d09a84b55753afc762', 1461518083062722560, 509, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fb2f0ae09e894c0d8ed893878ac111ac', '新闻和出版业', '新闻和出版业', 'fb2f0ae09e894c0d8ed893878ac111ac', 1461518083062722560, 1341, '', '567845af441a427eacdd14dfec55fe15', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fc02edb12dd7437e92f93a88c15e2702', '铁路、船舶、航空航天和其他运输设备制造业', '铁路、船舶、航空航天和其他运输设备制造业', 'fc02edb12dd7437e92f93a88c15e2702', 1461518083062722560, 667, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fc093982b657c85387ae7b8d25e75f5c', '其他日用品生产专用设备制造', '其他日用品生产专用设备制造', '1536310379493011603', 1461518083062722560, 625, '', '1536310379493011599', 0, '1');
INSERT INTO `jvs_tree` VALUES ('fc34146125e21378d7613d21f160b304', '农副食品加工专用设备制造', '农副食品加工专用设备制造', '1536310829881569500', 1461518083062722560, 615, '', '1536310829881569496', 0, '1');
INSERT INTO `jvs_tree` VALUES ('fc63b303f8ff4911b5abb48925cd85c4', '社会经济咨询', '社会经济咨询', 'fc63b303f8ff4911b5abb48925cd85c4', 1461518083062722560, 1162, '', '9b6d9e6363d64e32a9e6aa0aade9cd27', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fc99895ae4c04e3c84d12316019be082', '化妆品及卫生用品零售', '化妆品及卫生用品零售', 'fc99895ae4c04e3c84d12316019be082', 1461518083062722560, 942, '', '2022ff6ed35e4ac88d19cd4254ab06c8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fcebd9020bdd417984358f7f8ada6592', '农用及园林用金属工具制造', '农用及园林用金属工具制造', 'fcebd9020bdd417984358f7f8ada6592', 1461518083062722560, 516, '', 'e46d02ed330f4a32aeb2acda611aba43', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fcfd7d4c4868e6e51561d0c2cb2d989a', '其他木材加工', '其他木材加工', '1536311398964736060', 1461518083062722560, 270, '', '1536311398964736044', 0, '1');
INSERT INTO `jvs_tree` VALUES ('fd6d54ee825f4efd904cc919729edb02', '其他未列明非金属矿采选', '其他未列明非金属矿采选', 'fd6d54ee825f4efd904cc919729edb02', 1461518083062722560, 125, '', '145148bf32184b6a8311fe783ef0e544', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fd85c4bf070348b49147009179252b9a', '电视机制造', '电视机制造', 'fd85c4bf070348b49147009179252b9a', 1461518083062722560, 752, '', '111b3d7fc3364dfea496a12261021c65', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fda69d6ec01941ab8f44bdda8eeb3402', '印刷', '印刷', 'fda69d6ec01941ab8f44bdda8eeb3402', 1461518083062722560, 305, '', '90dce92b097a4d6d99cae39395a5af92', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fdcbdab60013091e9729b03a918d08b2', '单板加工', '单板加工', '1536311398964736056', 1461518083062722560, 269, '', '1536311398964736044', 0, '1');
INSERT INTO `jvs_tree` VALUES ('fdd9cb4ea4a4478285b5deadde6900b9', '人力资源服务', '人力资源服务', 'fdd9cb4ea4a4478285b5deadde6900b9', 1461518083062722560, 1166, '', '1d4aa2be74514a73925194b48b570791', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fddede0df9ec42fd8676c1d521bcc87d', '粘土砖瓦及建筑砌块制造', '粘土砖瓦及建筑砌块制造', 'fddede0df9ec42fd8676c1d521bcc87d', 1461518083062722560, 444, '', '762baad6d4d74de8996e592c528088a8', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fe061ff9142bc582e82d49a08e74c171', '广播电视节目制作及发射设备制造', '广播电视节目制作及发射设备制造', '1536294082927472918', 1461518083062722560, 747, '', '1536294082927472914', 0, '1');
INSERT INTO `jvs_tree` VALUES ('fe1915d1650ca25ad8fa64c84f4bf31b', '广播电视设备制造', '广播电视设备制造', '1536311398968930378', 1461518083062722560, 746, '', '1536311398968930370', 0, '1');
INSERT INTO `jvs_tree` VALUES ('fe277f2855704704a0562cc62cff05ac', '有色金属冶炼和压延加工业', '有色金属冶炼和压延加工业', 'fe277f2855704704a0562cc62cff05ac', 1461518083062722560, 483, '', '398efc8b475d433682b16b4046dd883d', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fe3e3e4436c9442eae431f53420dde54', '资本市场服务', '资本市场服务', 'fe3e3e4436c9442eae431f53420dde54', 1461518083062722560, 1100, '', 'aa7eae86426348798b655780cb183d98', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fe50eb2a87044dc2808bc0de7fb4f482', '再生物资回收与批发', '再生物资回收与批发', 'fe50eb2a87044dc2808bc0de7fb4f482', 1461518083062722560, 922, '', '80c70ebf068e476ab81172056022e17e', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fe6071f3159a4791b392ff28d026d99b', '音像制品出版', '音像制品出版', 'fe6071f3159a4791b392ff28d026d99b', 1461518083062722560, 1347, '', '7ef056b6bde840c3bc6b6186f8d032ed', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('fe9456816035f492b3684f61c3d5f6a0', '电车制造', '电车制造', '1536310379493011631', 1461518083062722560, 664, '', '1536310379493011619', 0, '1');
INSERT INTO `jvs_tree` VALUES ('feeac738e0214b64869a7e61bbf2505c', '国家行政机构', '国家行政机构', 'feeac738e0214b64869a7e61bbf2505c', 1461518083062722560, 1391, '', '37a6e6dc44a84c4ebcba0085e1d2420b', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ff3f34f97a538d1b4b9f693072beb442', '物料搬运设备制造', '物料搬运设备制造', '1536310829881569396', 1461518083062722560, 559, '', '1536310829881569392', 0, '1');
INSERT INTO `jvs_tree` VALUES ('ff465ca6b2fd4769a17514d55bd520fb', '气体压缩机械制造', '气体压缩机械制造', 'ff465ca6b2fd4769a17514d55bd520fb', 1461518083062722560, 568, '', '5fb0f7308897486587d113f21523204f', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ff673b40cf374e62b8223c8894474d9e', '工会', '工会', 'ff673b40cf374e62b8223c8894474d9e', 1461518083062722560, 1409, '', 'b78db952034f49eca2e0456b36962c91', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ffbefe8a7f7f425c966fca8eed96942d', '化学矿开采', '化学矿开采', 'ffbefe8a7f7f425c966fca8eed96942d', 1461518083062722560, 119, '', '3f113a8e5ed742cca5693a4009ed9a65', 0, NULL);
INSERT INTO `jvs_tree` VALUES ('ffbf154fce954e5a83fdf7c1ca00f8ba', '竹、藤、棕、草等制品制造', '竹、藤、棕、草等制品制造', 'ffbf154fce954e5a83fdf7c1ca00f8ba', 1461518083062722560, 282, '', '423a2ec66ad24b9a9ec95c606a136fbd', 0, NULL);

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

-- ----------------------------
-- Table structure for rule_external
-- ----------------------------
DROP TABLE IF EXISTS `rule_external`;
CREATE TABLE `rule_external`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `rule_group` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口API调用第三方',
  `explain_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解释',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `field_list` json NULL COMMENT '扩展的字段集',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '逻辑引擎开放接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rule_external
-- ----------------------------

-- ----------------------------
-- Table structure for rule_log
-- ----------------------------
DROP TABLE IF EXISTS `rule_log`;
CREATE TABLE `rule_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `run_type` enum('JOB','TEST','REAL') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境',
  `req_run_key` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运行key',
  `start_time` datetime(3) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(3) NULL DEFAULT NULL COMMENT '结束时间',
  `total_execution_time` int(255) NULL DEFAULT 0 COMMENT ' 消耗时间',
  `flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `variable_map` json NULL COMMENT '请求参数',
  `result_variable_map` json NULL COMMENT '执行后的参数',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '执行状态',
  `req_data` json NULL COMMENT '请求参数',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误参数',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `logs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '打印日志',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `dept_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `sync` tinyint(1) NULL DEFAULT NULL COMMENT '是否异步执行',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `req_run_key`(`req_run_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '逻辑定义数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rule_log
-- ----------------------------

-- ----------------------------
-- Table structure for rule_option
-- ----------------------------
DROP TABLE IF EXISTS `rule_option`;
CREATE TABLE `rule_option`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `field` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段名-后台自动设置，(方法名+参数名+字段名进行拼接)',
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `map` json NULL COMMENT '参数对象',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `field`(`field`(191), `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '逻辑属性配置项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rule_option
-- ----------------------------

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
INSERT INTO `jvs`.`sys_apply` (`id`, `name`, `app_key`, `app_secret`, `describes`, `del_flag`, `scope`, `authorized_grant_types`, `authorities`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `additional_information`, `archived`, `trusted`, `auto_approve_scopes`, `registered_redirect_uris`, `login_domain`, `create_by`, `create_by_id`, `create_time`, `update_by`, `update_time`, `ips`, `remark`, `enable`, `icon`, `logo`, `bg_img`) VALUES ('1ff53290763d889bb85813d1845b3bc8c', 'JVS开发务平台', 'frame', '$2a$10$RtdtlcyALRa4BhsYWRS3CORtcvzR2sGwrdMcDdy9K7IQYN/vGre3.', 'JVS开发务平台-快速开发基础服务平台', 0, 'server,all', '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', NULL, 30000, 300000, NULL, 0, 0, 'false', NULL, 'localhost', NULL, NULL, '2021-11-15 17:31:43', 'admin', '2022-06-01 13:01:44', NULL, NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg');
INSERT INTO `jvs`.`sys_apply` (`id`, `name`, `app_key`, `app_secret`, `describes`, `del_flag`, `scope`, `authorized_grant_types`, `authorities`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `additional_information`, `archived`, `trusted`, `auto_approve_scopes`, `registered_redirect_uris`, `login_domain`, `create_by`, `create_by_id`, `create_time`, `update_by`, `update_time`, `ips`, `remark`, `enable`, `icon`, `logo`, `bg_img`) VALUES ('9ef8d2af615709b3dfd6e9ea13bbc86b', '项目任务管理', 'teamwork', '$2a$10$Ldm7n8lu.ZJ8pfX.acOj3OZlcfbprVLuzLIMvM.Mg631.WHpt8he.', '项目任务管理', 0, 'server,all', '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', NULL, 3000, 30000, NULL, 0, 0, NULL, NULL, NULL, 'admin', '1', '2021-12-20 16:46:42', 'admin', '2022-03-28 22:58:29', NULL, NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg');
INSERT INTO `jvs`.`sys_apply` (`id`, `name`, `app_key`, `app_secret`, `describes`, `del_flag`, `scope`, `authorized_grant_types`, `authorities`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `additional_information`, `archived`, `trusted`, `auto_approve_scopes`, `registered_redirect_uris`, `login_domain`, `create_by`, `create_by_id`, `create_time`, `update_by`, `update_time`, `ips`, `remark`, `enable`, `icon`, `logo`, `bg_img`) VALUES ('bbb46b6e0f779fdb156371548b000ba6', '文档库', 'knowledge', '$2a$10$t5Qu8j8XHdGEIpK0RuRS1OMNh8iM1362PDR9qDk1vCPDYTv8.lrem', 'knowledge', 0, 'server,all', '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', NULL, 30000, 300000, NULL, 0, 0, NULL, NULL, 'knowledge.bctools.cn', NULL, NULL, '2021-11-15 17:31:43', '超级管理员', '2022-05-31 16:39:24', NULL, NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg');

-- ----------------------------
-- Table structure for sys_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `sys_bulletin`;
CREATE TABLE `sys_bulletin`  (
  `id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `app_keys` json NULL COMMENT '系统应用APPID数组',
  `start_time` datetime NOT NULL COMMENT '公告生效时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '公告结束时间',
  `publish` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发布 0-待发布, 1-发布',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户id',
  `content_type` enum('IMG','TEXT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片或文本',
  `type` enum('MOBILE','PC') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC端或移动端',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统应用公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_bulletin
-- ----------------------------

-- ----------------------------
-- Table structure for sys_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_data`;
CREATE TABLE `sys_data`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `function_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称',
  `api` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `describes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户ID默认1',
  `remark` json NULL COMMENT '扩展',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据权限资源标识表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data
-- ----------------------------

-- ----------------------------
-- Table structure for sys_data_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_role`;
CREATE TABLE `sys_data_role`  (
  `role_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `data_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称',
  `tenant_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `remark` json NULL COMMENT '扩展数据权限扩展字段',
  PRIMARY KEY (`role_id`, `data_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与数据权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `jvs`.`sys_dept`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '上级部门为  可能为租户ID，先根据租户进行查询',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户ID默认1',
  `leader_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门负责人ID',
  `type` enum('dept','branchOffice') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dept' COMMENT '类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `system` enum('SYSTEM','BIZ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `create_by` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '上级id，顶级-1',
  `uniq_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一id，数据迁移用到',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
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

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `dict_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序（升序）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
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

-- ----------------------------
-- Table structure for sys_exec
-- ----------------------------
DROP TABLE IF EXISTS `sys_exec`;
CREATE TABLE `sys_exec`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bussiness_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行语句',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '函数执行' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_exec
-- ----------------------------

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
  KEY `label_2` (`label`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文件统一管理，不包含租户信息，只做文件转发和统一保存管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('ef7640b95905b6844c334a61d86e3eb2', 'Default.jpg', 'image/jpeg', 'jvs-public', 'application', '2022-06-27 19:38:36', 'application/2022/38/35/2022-06-27726159497440956416-Default.jpg', 1006065, NULL, '背景', NULL, '1');

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `name` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语法',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详细描述',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统函数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_function
-- ----------------------------

-- ----------------------------
-- Table structure for sys_gateway_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_code`;
CREATE TABLE `sys_gateway_code`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `code` int(4) NOT NULL COMMENT '具体错误码确定',
  `msg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '错误信息确定，与代码保持一致',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它信息备注',
  `matching_method` enum('PreMatch','PostMatch','PerfectMatch') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'PerfectMatch' COMMENT '匹配方式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `msg`(`msg`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'code异常码转换关系和业务类型区分表-主要用于网关返回给前端 业务返回，默认在feign标准返回给上层,代码示例为new BusinessException(\"这是一个测试异常\")' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gateway_code
-- ----------------------------
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

-- ----------------------------
-- Table structure for sys_gateway_ignore_encode
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_encode`;
CREATE TABLE `sys_gateway_ignore_encode`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '网关不加密接口，主要是mgr的地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gateway_ignore_encode
-- ----------------------------
INSERT INTO `sys_gateway_ignore_encode` VALUES ('1', '/mgr/document/only/office', '获取onlyoffice地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('3', '/mgr/document/dcLibrary/file/get/file/byte/**', '获取文件流下载地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('4', '/mgr/jvs-design/JvsAppTemplate/list', '应用模板列表地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('5', '/mgr/jvs-design/JvsAppTemplate/detail/**', '应用获取详情地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('6', '/mgr/jvs-design/JvsAppTemplate/download/**', '应用下载地址');

-- ----------------------------
-- Table structure for sys_gateway_ignore_path
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_path`;
CREATE TABLE `sys_gateway_ignore_path`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '网关路径忽略' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gateway_ignore_path
-- ----------------------------
INSERT INTO `sys_gateway_ignore_path` VALUES ('10', '/im/**', 'IM消息');
INSERT INTO `sys_gateway_ignore_path` VALUES ('11', '/auth/**', '认证授权地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('112', '/gateway/**', '多关消息注册方法');
INSERT INTO `sys_gateway_ignore_path` VALUES ('12', '/mgr/**', '开发环境默认配置所有,因为现在超级管理员所有权限都没有所以需要放开所有的');
INSERT INTO `sys_gateway_ignore_path` VALUES ('145', '/api/**', '默认api接口开放地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('146', '/oauth/api/dict/list/*', '系统字典查询接口');
INSERT INTO `sys_gateway_ignore_path` VALUES ('148', '/mgr/mail/websocket', '邮件Websocket放开');
INSERT INTO `sys_gateway_ignore_path` VALUES ('155', '/inside/**', '任务socket');

-- ----------------------------
-- Table structure for sys_gateway_ignore_xss
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_xss`;
CREATE TABLE `sys_gateway_ignore_xss`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Xss放开地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gateway_ignore_xss
-- ----------------------------
INSERT INTO `sys_gateway_ignore_xss` VALUES ('1', '/auth/**', '授权');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('10', '/mgr/jvs-auth/role/role/**', '角色权限赋予');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('11', '/mgr/document/dcLibrary/save/content/**', '文档保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('112', '/mgr/document/dcLibrary', '文档添加成员');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('12', '/mgr/jvs-design/dynamic/data/**', '列表设计保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('145', '/mgr/jvs-design/data/model/data/**', '数据模型保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('146', '/mgr/document/upload/jvs-knowledge', '知识库上传图片');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('148', '/mgr/jvs-design/form/design/check', '表单内容校验');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('155', '/mgr/jvs-design/page/design/update/**', '表单、工作流、列表页更新');

-- ----------------------------
-- Table structure for sys_gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_route`;
CREATE TABLE `sys_gateway_route`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '备注说明',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '网关路由表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_gateway_route
-- ----------------------------
INSERT INTO `sys_gateway_route` VALUES ('auth', '/auth/**', '权限', 'lb://jvs-auth');
INSERT INTO `sys_gateway_route` VALUES ('im', '/im/**', 'im', 'lb:ws://im');
INSERT INTO `sys_gateway_route` VALUES ('ot', '/api/ot-server', 'ot', 'ws://ot-server:8080');
INSERT INTO `sys_gateway_route` VALUES ('plugins', '/api/jvs-knowledge-plugins/config.js', 'plugins', 'lb://document-mgr');
INSERT INTO `sys_gateway_route` VALUES ('teamwork', '/inside/**', 'teamwork', 'lb:ws://message-push-mgr');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户ID默认1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `business_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名',
  `function_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
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
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '租户id',
  `operation_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '操作类型',
  `client_id` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '终端',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `start_time`(`start_time`) USING BTREE,
  INDEX `client_id`(`client_id`(191)) USING BTREE,
  INDEX `function_name`(`function_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请求日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址（如果为HTTP开头的，为外部地址，如果为/开头的地址，会自动拼接环境配置地址）',
  `parent_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-1' COMMENT '父菜单ID(只支持一层父级),为-1时为最上级',
  `apply_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `layer` int(255) NULL DEFAULT NULL COMMENT '层关系',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(11) NULL DEFAULT 1 COMMENT '默认排序值(用户可搜藏后自定义重新排序)',
  `new_window` tinyint(1) NULL DEFAULT 0 COMMENT '是否新窗口打开',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b7d7c1fc0412ecbb0344b1ed46f5a4f', '系统管理', NULL, '9d4de661d2888cf0b37cc070642965fa', '1ff53290763d889bb85813d1845b3bc8c', 2, NULL, 1, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('1d1219dd156b6f00cef7afcf0376f3c5', '角色管理', '/jvs-upms-ui/role', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 4, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('41efeb1a3de895bd91a988fc674df08a', '登录日志', '/jvs-upms-ui/loginlogs', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 9, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('7c233a179e4050b2b11d4e710383202e', '团队管理', '/jvs-upms-ui/group', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 1, 0, 0, NULL, '2022-06-27 19:28:43', '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('94c370101f09f399da14ff6ce2e4e4fe', '操作日志', '/jvs-upms-ui/errlogs', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 1, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('9d4de661d2888cf0b37cc070642965fa', '系统管理', '/', '1ff53290763d889bb85813d1845b3bc8c', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 1, 0, 0, '2022-06-27 19:25:11', '2022-06-27 19:25:11', '1', '超级管理员', '超级管理员');
INSERT INTO `sys_menu` VALUES ('b46a674830edf3c48962395b1bae976c', '公告管理', '/jvs-upms-ui/bulletin', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 100, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('beb0019b2cc6b0c3deeeb7a698d02568', '登录令牌', '/jvs-upms-ui/onlineUser', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 8, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('dc635856ebc3018b5cda782121eb124c', '文件管理', '/jvs-upms-ui/file', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 10, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('ddf4ab133c0bac34aa9a6833f47e7562', '岗位管理', '/jvs-upms-ui/postList', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 6, 0, 0, NULL, NULL, '1', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('e999dd44952be57f1b2de6981088fe5a', '用户管理', '/jvs-upms-ui/department', '0b7d7c1fc0412ecbb0344b1ed46f5a4f', '1ff53290763d889bb85813d1845b3bc8c', 3, NULL, 5, 0, 0, NULL, NULL, '1', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `send_type` enum('sms','email','interior') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送类型\\短信\\邮件\\站内信',
  `send_message_type` enum('broadcast','warning','notification','system','business') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型： 广播消息\\警告消息\\通知消息\\系统消息\\业务消息',
  `status` tinyint(5) UNSIGNED NOT NULL DEFAULT 2 COMMENT '发送状态(0失败;1成功;2未发送;3发送中)',
  `send_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息成功发送次数',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息来源',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送内容,如果是邮件和站内信，支持html标签功能',
  `recipients` json NULL COMMENT '批量收件人,最多500个，多余500会切分，可能是用户id，可能是用户手机号',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送返回信息,邮件和短信发送的消息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `extension` json NULL COMMENT '用于业务扩展字段方便排查问题',
  `business_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务系统,如果业务系统需要发送站内信，直接使用mq-core进行发送即可查收',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息发送日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_user_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_user_log`;
CREATE TABLE `sys_message_user_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主建',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `read_status` tinyint(1) NULL DEFAULT 0 COMMENT '读取状态,默认未读',
  `read_time` datetime NULL DEFAULT NULL COMMENT '读取时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `hide` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏,默认显示',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息来源,默认系统发送为系统,人工发送为某个人',
  `send_message_type` enum('broadcast','warning','notification','system','business') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型： 广播消息\\警告消息\\通知消息\\系统消息\\业务消息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `read_status`, `hide`, `send_message_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内信用户消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_message_user_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `permission` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源标识(随机生成-建议使用中文名称进行拼音生成以_分割) 如果添加了忽略字段集，则直接放开即可,如果删除了，会生成uuid进行占位',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源名称(为Swagger的注解名，或前端的按钮|资源名称)',
  `api` json NULL COMMENT '请求地址',
  `type` enum('button','remark') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '按钮、说明',
  `client_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端或服务端名称',
  `menu_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '将资源挂在菜单上（不能挂一级菜单）',
  `apply_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用ID',
  `remark` json NULL COMMENT '扩展',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源数据表，用于统计所有项目的请求地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
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

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色解释',
  `type` enum('tenantRole','userRole') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'userRole' COMMENT '系统角色、租户角色',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '租户ID默认1',
  `ds_type` enum('all','oneself','subordinate','custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'all' COMMENT 'all:所有部门\r\noneself: 当前部门\r\nsubordinate:当前部门及以下部门\r\ncustom:自定义部门集使用,分割',
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所有的部门数据集IDS,当ds_type为custom,时，此字段才会生效',
  `auto_grant` tinyint(1) NULL DEFAULT 0 COMMENT '加入组织后是否自动赋予该权限,此角色不允许删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('5b41137255bf881b74c645cb8862464c', '应用管理员', '应用管理员角色, 此角色信息不能删除', 'userRole', '2021-11-18 14:35:12', '2022-05-13 10:20:57', 0, '1', 'all', NULL, 1);
INSERT INTO `sys_role` VALUES ('b16a6b13e98b6eba6770e7ca0ccd4364', '系统管理员', '系统管理员', 'tenantRole', '2021-09-07 18:08:39', '2022-06-24 12:25:27', 0, '1', 'all', NULL, 0);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `type` enum('menu','button') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源类型(数据权限，和网络权限，菜单,、租户，分别对应的为sys_permission\\sys_menu\\sys_tenant',
  `permission_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源ID',
  `apply_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('5b41137255bf881b74c645cb8862464c', 'menu', '7851fc6a7f6e2c81bde8b2fb0b085a6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('5b41137255bf881b74c645cb8862464c', 'menu', '9d4de661d2888cf0b37cc070642965fa', NULL);

-- ----------------------------
-- Table structure for sys_sql
-- ----------------------------
DROP TABLE IF EXISTS `sys_sql`;
CREATE TABLE `sys_sql`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `application_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `executed_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行SQL',
  `start_time` datetime NULL DEFAULT NULL COMMENT '执行时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `consuming_time` int(2) NULL DEFAULT NULL COMMENT '消耗时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户ID默认1',
  `slow_sql` tinyint(1) NULL DEFAULT NULL COMMENT '是否是慢sql',
  `access_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `application_name`(`application_name`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'SQL执行记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sql
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司ID',
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司全称',
  `short_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统名称',
  `addr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `desc_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司简介',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `admin_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员Id',
  `login_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录域名',
  `default_index_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认首页',
  `enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用 1启用 0禁用',
  `icon` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/jvs-ui-public/icon/icon.ico' COMMENT 'icon',
  `logo` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/jvs-ui-public/img/logo.jpg' COMMENT 'logo',
  `bg_img` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/jvs-ui-public/img/backImg.jpg' COMMENT '背景图',
  `parent_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级租户id,如果是顶级租户，该值和顶级租户的id一样',
  `remark` json NULL COMMENT '备注其它信息\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司租户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `jvs`.`sys_tenant` (`id`, `name`, `short_name`, `addr`, `desc_msg`, `update_time`, `create_time`, `del_flag`, `admin_user_id`, `login_domain`, `default_index_url`, `enable`, `icon`, `logo`, `bg_img`, `parent_id`, `remark`) VALUES ('1', '重庆软开企业服务有限公司', 'JVS快速开发服务平台', '测试地址', '此为测试企业信息，如果需要私有化部署请联系我们。', '2022-06-29 10:22:49', '2021-08-27 17:41:28', '0', '1', 'aaa', NULL, 1, '/jvs-ui-public/icon/icon.ico', '/jvs-ui-public/img/logo.jpg', '/jvs-ui-public/img/backImg.jpg', NULL, '{}');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'JVS用户' COMMENT '真名',
  `user_type` enum('BACKEND_USER','FRONT_USER','OTHER_USER') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户类型。\r\n1、后端用户\r\n2、业务用户\r\n',
  `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '帐号名',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮件',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/jvs-ui-public/img/headImg.png' COMMENT '头像',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '$2a$10$rV8aIFfDTg6G2SsQdkE9C.Be1kFb0kery5akAh8pdjc3C9c.6lLiu' COMMENT '密码(默认123456)',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `cancel_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1- 注销  不要逻辑删除，删除后，业务找不到数据',
  `sex` enum('male','female','unknown') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'unknown' COMMENT '性别 ',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `invite` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邀请用户的ID做上下级关系',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`account_name`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE COMMENT '手机号索引全局唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', NULL, 'admin', NULL, '/jvs-ui-public/img/headImg.png', '$2a$10$rV8aIFfDTg6G2SsQdkE9C.Be1kFb0kery5akAh8pdjc3C9c.6lLiu', '17323369667', '2021-03-29 17:59:56', '2022-05-09 21:37:26', 0, 'male', '2021-08-27', NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of sys_user_extension
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_external_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_external_group`;
CREATE TABLE `sys_user_external_group`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `config_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱配置id',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '外部用户分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_external_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_external_mail
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_external_mail`;
CREATE TABLE `sys_user_external_mail`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id（发送人）',
  `group_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '分组id',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '外部用户邮箱' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_external_mail
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户组名称',
  `principal_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人姓名',
  `principal_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人id',
  `users` json NULL COMMENT '用户数组对象',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `operate_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备',
  `user_agent` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求标识头',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '登录成功状态',
  `login_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录类型',
  `client_id` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端',
  `tenant_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `tenant_short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端名称',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '逻辑定义数据' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for sys_user_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_mail_config`;
CREATE TABLE `sys_user_mail_config`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `sys_user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sys_user -> id',
  `mail_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱类型',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号名称',
  `send_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器地址（发送)',
  `send_port` int(32) NULL DEFAULT NULL COMMENT '端口（发送)',
  `accept_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器地址（接受）',
  `accept_port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '端口（接受）',
  `accept_ssl` int(1) NULL DEFAULT 0 COMMENT '0 未勾选 1 勾选',
  `send_ssl` int(1) NULL DEFAULT 0 COMMENT '0 未勾选 1 勾选',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `accept_protocol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受协议（POP/IMAP）',
  `send_protocol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送协议（SMTP）',
  `default_encoding` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `jndi_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Session JNDI name. When set, takes precedence over other Session settings.',
  `use_way` bigint(1) NULL DEFAULT 0 COMMENT '是否启用 0是未启用 1是启用',
  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_user_id`(`sys_user_id`) USING BTREE COMMENT '用户id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人邮箱配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_mail_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `tenant_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '5b41137255bf881b74c645cb8862464c', '1');

-- ----------------------------
-- Table structure for sys_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_tenant`;
CREATE TABLE `sys_user_tenant`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称,对应用户真名',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `employee_no` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职工编号',
  `level` int(11) NULL DEFAULT 1 COMMENT '帐号等级',
  `hire_date` date NULL DEFAULT NULL COMMENT '入职时间',
  `job_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位ID',
  `job_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `dept_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `dept_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '租户ID',
  `cancel_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1- 注销  不要逻辑删除，删除后，业务找不到数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户和用户关联表（用于确定某个租户下的所有用户）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_tenant
-- ----------------------------
INSERT INTO `sys_user_tenant` VALUES ('1', '超级管理员', '1', '0001', 1, '2018-08-31', NULL, NULL, NULL, NULL, '1', 0, '2022-06-27 17:40:18', '17323369667');

-- ----------------------------
-- Table structure for sys_wx_mp
-- ----------------------------
DROP TABLE IF EXISTS `sys_wx_mp`;
CREATE TABLE `sys_wx_mp`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subscribe_url` json NULL COMMENT '关注时发送的图片文件 每次修改文件名称不能与上次一样 多条时使用逗号分隔',
  `welcome_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关注时的欢迎语',
  `keyword_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字信息',
  `keyword_json` json NULL COMMENT '关键字对应的回复内容',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_wx_mp
-- ----------------------------
INSERT INTO `sys_wx_mp` VALUES ('fc49c834e7d4c48eb38f8ede15a24802', '[]', '欢迎关注!', '欢迎关注!', '[]', '超级管理员', '1', '2022-06-27 19:20:10', '超级管理员', '2022-06-27 19:20:10');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (4, 'jvs-design-mgr', 'jvs-design-mgr', 0, NULL, '2022-06-28 09:42:00');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time`) USING BTREE,
  INDEX `I_handle_code`(`handle_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `xxl_job_log_report` VALUES (174, '2022-06-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (175, '2022-06-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (176, '2022-06-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (177, '2022-06-28 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group`, `registry_key`(191), `registry_value`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

DROP TABLE IF EXISTS `flow_purview`;
CREATE TABLE `flow_purview`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `flow_design_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流设计id',
  `purview_group` enum('send_flow') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限组',
  `person_type` enum('all','custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员类型',
  `users` json NULL COMMENT '权限用户id集合',
  `depts` json NULL COMMENT '权限部门id集合',
  `roles` json NULL COMMENT '权限角色id集合',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流权限' ROW_FORMAT = DYNAMIC;
DROP TABLE IF EXISTS `flow_task_approval_record`;
CREATE TABLE `flow_task_approval_record`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `flow_task_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作流任务id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_flow_task_id`(`flow_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作流审批记录' ROW_FORMAT = DYNAMIC;
DROP TABLE IF EXISTS `gen_datasource`;
CREATE TABLE `gen_datasource`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `db_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型 MySQL、Oracle、PostgreSQL',
  `data_base_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `conn_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '连接名',
  `conn_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源管理' ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `gen_table_info`;
CREATE TABLE `gen_table_info`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `class_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名',
  `table_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `author` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `package_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目包名',
  `version` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目版本号',
  `backend_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后端生成路径',
  `frontend_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端生成路径',
  `module_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名',
  `sub_module_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子模块名',
  `datasource_id` bigint(20) NULL DEFAULT NULL COMMENT '数据源ID',
  `baseclass_id` bigint(20) NULL DEFAULT NULL COMMENT '基类ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `dependency_version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基础依赖版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `table_name`(`table_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成表' ROW_FORMAT = DYNAMIC;



CREATE TABLE `jvs`.`jvs_data_notice`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据模型id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知名称',
  `trigger_setting` json NULL COMMENT '触发设置',
  `receiver` json NULL COMMENT '接收者',
  `title_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '标题',
  `content_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息通知' ROW_FORMAT = DYNAMIC;



ALTER TABLE `jvs`.`jvs_chart_component` DROP INDEX `appid`;

ALTER TABLE `jvs`.`jvs_chart_component` DROP COLUMN `jvs_app_id`;

ALTER TABLE `jvs`.`jvs_data_field` ADD INDEX `model_id`(`model_id`) USING BTREE COMMENT '模型字段';

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `design_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联设计id' AFTER `id`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `file_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板文件地址' AFTER `design`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `enable_flag` tinyint(1) NULL DEFAULT 1 COMMENT '0-禁用，1-启用' AFTER `file_type`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名' AFTER `enable_flag`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id' AFTER `create_by`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名' AFTER `create_time`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id' AFTER `update_time`;

ALTER TABLE `jvs`.`jvs_print_template` ADD COLUMN `jvs_app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id' AFTER `tenant_id`;

ALTER TABLE `jvs`.`jvs_print_template` MODIFY COLUMN `design` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板设计JSON' AFTER `design_type`;

ALTER TABLE `jvs`.`jvs_print_template` MODIFY COLUMN `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' AFTER `create_by_id`;

ALTER TABLE `jvs`.`jvs_print_template` MODIFY COLUMN `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间' AFTER `update_by`;

ALTER TABLE `jvs`.`jvs_print_template` DROP COLUMN `identity`;

ALTER TABLE `jvs`.`jvs_print_template` DROP COLUMN `design_byte`;

ALTER TABLE `jvs`.`jvs_print_template` ADD INDEX `idx_design_id`(`design_id`) USING BTREE;

ALTER TABLE `jvs`.`jvs_regexp` MODIFY COLUMN `expression` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正则表达式' AFTER `name`;


ALTER TABLE `jvs`.`rule_log` MODIFY COLUMN `run_type` enum('JOB','TEST','REAL','API') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境' AFTER `id`;

CREATE TABLE `jvs`.`sys_config`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '保存对象',
  `role` tinyint(1) NULL DEFAULT NULL COMMENT '是否无权限访问',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = DYNAMIC;

ALTER TABLE `jvs`.`sys_file` MODIFY COLUMN `file_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型' AFTER `file_name`;

CREATE TABLE `jvs`.`sys_opinion`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_by_head_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈' ROW_FORMAT = DYNAMIC;

ALTER TABLE `jvs`.`sys_user_role` ADD INDEX `user_id`(`user_id`) USING BTREE;

-- ----------------------------
-- Event structure for delete_template
-- ----------------------------
DROP EVENT IF EXISTS `delete_template`;
delimiter ;;
CREATE EVENT `delete_template`
ON SCHEDULE
EVERY '1' DAY STARTS '2022-04-29 01:00:00'
ON COMPLETION PRESERVE
COMMENT '删除指定模板信息'
DO update jvs_app_template set del_flag=1 where `name` LIKE "OA无纸化办公%" and `version`="3.1.4"
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
