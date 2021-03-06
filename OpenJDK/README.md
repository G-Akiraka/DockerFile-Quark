### 介绍
#### 特性：
1) 默认设置容器中文
2) 添加宋体字体防止个别应用乱码
3) 设置上海时区,防止时间不正常
4) 设置容器默认阿里源
5) 设置终端颜色包括过滤颜色
6) 安装常用包
#### 1、使用方法
```bash
git clone https://gitee.com/G-Akiraka/Docker-Alpine.git && cd Docker-Alpine
```
#### 2、开始构建镜像 
#####   2.1 Docker Alpine
```bash
# 构建 OpenJDK 8 Alpine
docker build -f openjdk_8-alpine.yaml -t myopenjdk:8-alpine .
# 构建 OpenJDK 8 Alpine Azcopy
docker build -f openjdk_8-azcopy.yaml -t myopenjdk:8-azcopy .

# 构建 OpenJDK 11 Alpine
docker build -f openjdk_11-alpine.yaml -t myopenjdk:11-alpine .
```

#####   2.2 Docker Debain
```bash
# 构建 OpenJDK 8 Slim
docker build -f openjdk_8-slim.yaml -t myopenjdk:8-slim .

# 构建 OpenJDK 8 Slim Azcopy
docker build -f openjdk_8-slim-azcopy.yaml -t myopenjdk:8-slim-azcopy .

# 构建 OpenJDK 11 Slim
docker build -f openjdk_11-slim.yaml -t myopenjdk:11-slim .
```
#### 3、运行 Alpine 容器
```bash
docker run -d --name openjdk myopenjdk:8-alpine
```
#### 4、查看 Alpine 容器是否运行
```bash
docker ps
# 调试容器，如果需要的话
docker run -it myopenjdk /bin/bash
```