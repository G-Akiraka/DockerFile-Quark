### 编译PHP 7.3.6版本
> 特性：
1) 默认调优好PHP-FPM配置
2) 默认添加虚拟配置，宿主机ip访问即可
3) 类传统部署方式，源码编译安装
> 目录说明：
1) PHP安装路径 /usr/local/php
2) PHP配置路径 /usr/local/php/etc
> 其他说明：
1) 默认创建www用户组与用户
2) PHP-FPM 默认运行用户组与用户 www
3) 如遇权限问题，请将项目授权chown -R www:www 项目目录
4) 具体PHP编译参数请参考Dockerfile文件内容
#### 1、使用方法
```
git clone https://github.com/G-Akiraka/DockerFile_PHP.git && cd DockerFile_PHP
```
#### 2、开始构建Docker PHP镜像 
```
docker build -f Dockerfile -t php:7.3.6 .
```
#### 3、运行PHP容器
```
docker run -d -p 9000:9000 php:7.3.6
```
#### 4、查看PHP容器是否运行
```
docker ps
# 调试容器，如果需要的话
docker run -it php:7.3.6 /bin/bash
```