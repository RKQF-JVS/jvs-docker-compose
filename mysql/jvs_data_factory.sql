create database `jvs_data_factory` default character set utf8mb4 collate utf8mb4_general_ci;
use jvs_data_factory;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务编辑好的执行';

-- ----------------------------
-- Records of function_business
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_factory
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_factory`;
CREATE TABLE `jvs_data_factory` (
  `id` char(50) NOT NULL,
  `name` char(50) DEFAULT '未命名数据流' COMMENT '设计',
  `view_json` longtext COMMENT '渲染json',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` char(255) DEFAULT '没有添加描述' COMMENT '表单描述',
  `dept_id` char(50) DEFAULT NULL COMMENT '部门ID',
  `job_id` char(50) DEFAULT NULL COMMENT '岗位ID',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `enable` tinyint(1) DEFAULT '0' COMMENT '状态是否运行',
  `auto` tinyint(1) DEFAULT '0' COMMENT '是否自动运行',
  `update_run_time` datetime DEFAULT NULL COMMENT '最近一次更新时间',
  `task_id` int(55) DEFAULT NULL COMMENT '定时任务ID',
  `document_name` char(50) DEFAULT NULL COMMENT '输出文档的名称',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `integrity_is` tinyint(1) DEFAULT '0' COMMENT '是否完整',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据etl';

-- ----------------------------
-- Records of jvs_data_factory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_factory_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_factory_log`;
CREATE TABLE `jvs_data_factory_log` (
  `id` char(50) NOT NULL,
  `data_id` char(50) DEFAULT NULL COMMENT '设计',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` bigint(20) DEFAULT NULL COMMENT '时长',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建人Id',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `operate_method` enum('AUTOMATIC','MANUALLY') DEFAULT 'AUTOMATIC' COMMENT '更新方式 auto 自动 manual 手动',
  `operator_id` char(50) DEFAULT NULL COMMENT '操作人id',
  `operator_name` char(20) DEFAULT NULL COMMENT '操作人名称',
  `execution_results` tinyint(1) DEFAULT NULL COMMENT '执行结果 1成功 0失败',
  `failure_reason` text COMMENT '失败原因',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据工厂-记录';

-- ----------------------------
-- Records of jvs_data_factory_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_factory_out
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_factory_out`;
CREATE TABLE `jvs_data_factory_out` (
  `id` char(50) NOT NULL COMMENT '组件',
  `name` char(50) DEFAULT NULL COMMENT '输出表名称对应mongo模型',
  `data_id` char(50) DEFAULT NULL COMMENT '设计Id',
  `sort` int(2) DEFAULT NULL COMMENT '字段排序',
  `document_name` char(50) DEFAULT NULL COMMENT '输出库的名称',
  `fields` json DEFAULT NULL COMMENT '字段属性',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据工厂输出模型字段';

-- ----------------------------
-- Records of jvs_data_factory_out
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_source
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_source`;
CREATE TABLE `jvs_data_source` (
  `id` varchar(50) NOT NULL,
  `source_name` varchar(30) DEFAULT NULL COMMENT '来源名称',
  `source_type` enum('mysqlDataSource','mongoDataSource','dataModel') DEFAULT NULL COMMENT '来源类型 mongo mysql 这里不使用枚举 直接在代码层面限制',
  `source_host` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `source_port` int(6) DEFAULT NULL COMMENT '端口',
  `source_user_name` varchar(255) DEFAULT NULL COMMENT '登录用户名',
  `source_pwd` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `source_library_name` varchar(255) DEFAULT NULL COMMENT '库名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除 0未删除  1已删除',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  `sync_structure` tinyint(1) DEFAULT '2' COMMENT '表结构同步进度 0失败 1成功2同步中',
  `source_library_name_user` varchar(255) DEFAULT NULL COMMENT '用户自定义的名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据源配置信息';

-- ----------------------------
-- Records of jvs_data_source
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jvs_data_source_structure
-- ----------------------------
DROP TABLE IF EXISTS `jvs_data_source_structure`;
CREATE TABLE `jvs_data_source_structure` (
  `id` varchar(50) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL COMMENT '表名称',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_source_id` varchar(50) DEFAULT NULL COMMENT '数据源id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `structure` json DEFAULT NULL COMMENT '结构',
  `table_name_desc` varchar(100) DEFAULT NULL COMMENT '表描述',
  `tenant_id` char(50) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据表结构';

-- ----------------------------
-- Records of jvs_data_source_structure
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
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` char(50) NOT NULL,
  `business_name` varchar(32) DEFAULT NULL COMMENT '项目名',
  `function_name` varchar(150) DEFAULT NULL COMMENT '功能名',
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
  KEY `function_name` (`function_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='请求日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `jvs_data_factory`.`jvs_data_factory` ADD COLUMN `task` json NULL COMMENT '定时任务逻辑' AFTER `integrity_is`;

ALTER TABLE `jvs_data_factory`.`jvs_data_factory` DROP COLUMN `auto`;

ALTER TABLE `jvs_data_factory`.`jvs_data_factory` DROP COLUMN `task_id`;

ALTER TABLE `jvs_data_factory`.`jvs_data_factory_log` ADD COLUMN `out_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输出条数' AFTER `tenant_id`;

SET FOREIGN_KEY_CHECKS=1;
