#!/bin/sh

ip=$1

if [ -z "$ip" ]; then
  echo "please set ip";
  exit;
fi

echo "replace ip to $ip"

sed -i -e 's/jvs-minio/'"$ip"'/g'  ./mysql/nacos.sql
sed -i -e 's/file.preview.bctools.cn/'"$ip"':20812/g'  ./mysql/nacos.sql
sed -i -e 's/documentIpAddress/'"$ip"'/g'  ./mysql/nacos.sql
sed -i -e 's/documentIpAddress/'"$ip"'/g' ./data/jvs-knowledge-plugins/config.js
