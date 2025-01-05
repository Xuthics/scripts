#!/bin/bash

# 拉取 Docker 镜像
docker pull xuthics/clover-trader:latest

# 创建配置目录
mkdir -p config
mkdir -p keys

# 运行 Docker 容器，并设置自动重启和容器名称
docker run --name clover-trader --restart unless-stopped -v $(pwd)/config:/app/config -v $(pwd)/keys:/app/keys -d xuthics/clover-trader:latest

echo "Clover Trader 已成功安装并运行。"

# 打开 Docker 容器的日志
docker logs -f clover-trader
