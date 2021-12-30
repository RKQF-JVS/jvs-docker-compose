#!/bin/sh
echo "初始化数据库"
docker-compose  up -d jvs-mysql
echo "等待中"
sleep 90
echo "初始化基础数据"
docker-compose  up -d jvs-nacos
echo "等待中"
sleep 90
echo "启动网关"
docker-compose  up -d gateway
echo "等待中"
sleep 90
echo "启动后台管理"
docker-compose  up -d jvs-ui
sleep 90
echo "启动企业知识库"
docker-compose  up -d jvs-apply-document
echo "等待中"
sleep 90
echo "请访问http://localhost进入后台  帐号admin,密码admin,访问http://localhost:8080进入企业知识库"



