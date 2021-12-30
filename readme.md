# jvs框架快速部署


## 部署介绍：



JVS是面向软件开发团队可以快速实现应用的基础开发框架，采用微服务分布式框架，提供丰富的基础功能，集成众多业务引擎，它灵活性强，界面化配置对开发者友好，底层容器化构建，集合持续化构建。

JVS是“软开企服”推出的面向软件开发团队可以快速实现应用的基础开发框架




建议内存大小8G+

`安装过程中如出现其它任何问题可联系技术支持群`



## 安装docker、docker-compose

一键安装，如果有docker-compose可跳过

`curl -C- -O --retry 3 https://iptables.cn/file/docker/zebra-docker && chmod a+x zebra-docker && ./zebra-docker -I`



## 下载项目

1、直接下载方式  https://gitee.com/software-minister/jvs-docker-compose

2、git下载方式：`git clone https://gitee.com/software-minister/jvs-docker-compose.git`

3、版本下载:https://gitee.com/software-minister/jvs-docker-compose/releases/1.0.0 

## 部署项目

进入目录 `cd  jvs-docker-compose`
授权 `chmod a+x start.sh`
启动服务 `docker-compose up -d `



帐号：`admin`

密码:   `admin`

### 访问后台`http://localhost`





### 访问知识库 `http://localhost:8080`

