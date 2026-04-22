# Sub-Store

docker-compose.yml
```
services:
  sub-store:
    image: xream/sub-store:http-meta
    container_name: sub-store
    restart: always
    network_mode: host
    environment:
      SUB_STORE_BACKEND_API_HOST: 127.0.0.1
      SUB_STORE_BACKEND_API_PORT: 3001
      SUB_STORE_BACKEND_MERGE: true
      # 这是你的私密 API 路径，用于增强安全性
      SUB_STORE_FRONTEND_BACKEND_PATH: /cD7wiTGitLyoBdEguanFWmqCpHKwhLQh4opXfFhFCEpmY9K7YnPgFu9e2iiUoty2
      # HTTP-META 相关设置，通常保持默认
      PORT: 9876
      HOST: 127.0.0.1
    volumes:
      - ./data:/opt/app/data
```
SUB_STORE_FRONTEND_BACKEND_PATH需要自己设置
## 部署步骤
### 第一步：准备环境
如果你还没有安装 Docker 和 Docker Compose，建议先安装。

```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```


### 第二步：启动容器

在服务器上创建一个文件夹（如 sub-store）。

在该文件夹内创建 docker-compose.yml 文件，并填入上面的代码。

运行命令：docker compose up -d。

### 第三步：设置反向代理 (Reverse Proxy)
图片中提到，你需要一个域名（假设为 a.com），并通过 Nginx 或 Caddy 等工具将域名反向代理到服务器的 3001 端口。

### 第四步：访问与初始化
在浏览器中输入以下格式的地址来访问你的 Sub-Store 界面：
https://a.com?api=https://a.com/你的私密路径

具体到图片中的例子：
https://a.com?api=https://a.com/cD7wiTGitLyoBdEguanFWmqCpHKwhLQh4opXfFhFCEpmY9K7YnPgFu9e2iiUoty2

## 使用一段式 Shell 脚本

```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

curl -sSL https://raw.githubusercontent.com/52lkj/Sub-Store/master/deploy.sh | bash
```


```
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
```

[Sub-Store Docker 部署教程
](https://blog.52131488.xyz/2026/04/sub-store-docker-bu-shu-jiao-cheng)

