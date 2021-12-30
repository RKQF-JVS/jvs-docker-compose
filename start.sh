#!/bin/sh
docker-compose  up -d jvs-mysql
sleep 90
docker-compose  up -d jvs-nacos
sleep 90
docker-compose  up -d gateway
sleep 90
docker-compose  up -d jvs-ui
sleep 90
docker-compose  up -d jvs-apply-document
sleep 90



