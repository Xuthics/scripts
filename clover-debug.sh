#!/bin/bash

# 拉取 Docker 镜像
docker pull xuthics/clover-trader:debug

# 创建配置目录
mkdir -p config
mkdir -p keys

docker stop clover-trader
docker rm -f clover-trader 2>/dev/null
# 运行 Docker 容器，并设置自动重启和容器名称
docker run --name clover-trader --restart unless-stopped -v $(pwd)/config:/app/config -v $(pwd)/keys:/app/keys -d xuthics/clover-trader:debug
echo "[DEBUG] Clover Trader 已成功安装并运行。"

# 打开 Docker 容器的日志
docker logs -f clover-trader
