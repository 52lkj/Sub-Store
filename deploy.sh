#!/bin/bash

# 1. 创建工作目录
mkdir -p ~/sub-store/data
cd ~/sub-store

# 2. 直接从你的 GitHub 下载最新的 docker-compose.yml
echo "正在拉取配置文件..."
curl -O https://raw.githubusercontent.com/52lkj/Sub-Store/master/docker-compose.yml

# 3. 启动容器
echo "正在启动 Sub-Store..."
docker compose up -d

echo "------------------------------------------------"
echo "部署完成！"
echo "请确保 3001 端口已在防火墙开启。"
echo "你的 API 路径请参考 docker-compose.yml 中的环境变量。"
echo "------------------------------------------------"
