### 编译 PHP 说明
#### 特性：
1) 基于官方镜像
2) 默认设置容器中文
3) 默认调优好配置与常用扩展
4) 添加宋体字体防止个别应用乱码
5) 设置上海时区,防止时间不正常
6) 设置容器默认163源，阿里源有可能添加php扩展找不到依赖包
#### 目录说明：
1) PHP配置路径 /usr/local/etc
#### 其他说明：
* 具体PHP优化可以参考config目录下文件
* php 7.4 开始，默认构建完成自动调优，每次单独运行容器会根据宿主机或k8s内存限制自动调整 php.ini 内存

#### 1、使用方法
```
git clone https://gitee.com/G-Akiraka/DockerFile-PHP.git && cd DockerFile-PHP
```
#### 2、开始构建Docker PHP镜像 
```
#   构建 PHP 5.6 版本
docker build -f PHP-5.6.yaml -t myphp:5.6-fpm .
#   构建 PHP 7.1 版本
docker build -f PHP-7.1.yaml -t myphp:7.1-fpm .
#   构建 PHP 7.1 alpine 版本
docker build -f PHP-7.1-fpm-alpine.yaml -t myphp:7.1-fpm-alpine .
#   构建 PHP 7.2 版本
docker build -f PHP-7.2-fpm.yaml -t myphp:7.2-fpm .
#   构建 PHP 7.4 版本
docker build -f PHP-7.4-fpm.yaml -t myphp:7.4-fpm .
```
#### 3、运行PHP容器
```
docker run -d -p 9000:9000 --name myphp myphp:7.2-fpm
```
#### 4、查看PHP容器是否运行
```
docker ps
```
#### 5、 调试容器，如果需要的话
docker exec -it myphp /bin/bash