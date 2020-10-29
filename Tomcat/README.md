### Docker-Tomcat-8.5.47
#### 特性：
1) 默认开启 Tomcat-apr 模式
2) 添加catalina-jmx-remote.jar方便日后监控
3) 类传统部署方式，源码编译安装
4) 带catalina.out日志
5) 默认设置容器中文
6) 添加宋体字体防止个别应用乱码
7) 设置上海时区,防止时间不正常
8) 设置容器默认阿里源
9) 自定义 catalina.out 日志输出格式
10) tomcat-users 默认设置账户与密码，备注：密码由md5sum生成，构建容器成功就会有个唯一密码
# 以下功能 tomcat 8.5.47 开始支持，8.0.24 支持日志切割
11) 新增 jar 包运行，变量参数为：SPRING_PROFILES_ACTIVE 测试环 test 正式环境 prod
12) 新增 tomcat 日志切割功能

#### jar 使用方法说明
1) 如果 /usr/local/tomcat/jarapps 目录中有jar包运行，没有直接运行tomcat
2) 日志路径 /usr/local/tomcat/logs/ 以jar名称开头加日期
3) 单独更新容器中 jar 包，已经添加脚本 ，更新示例：docker exec -it tomcat:8.5.47 /root/aka_jar-update.sh

#### 目录说明：
1) tomcat路径 /usr/local/tomcat
2) 应用发布路径 /usr/local/tomcat/webapps

#### 其他说明：
自定义 catalina.out 日志方便 Logstash 匹配，也方便查看与 ELK+Kafka+Zabbinx+Grafana监控报警
```
#   Logstash 正则匹配如下
%{TIMESTAMP_ISO8601:access_time}\s+\[(?<level>[\s\S]*)\]\s+\[%{DATA:class}\](?<masg>[\s\S]*)\s+\[(?<exception_info>[\s\S]*)\]
```

#### 1、使用方法
```
git clone https://gitee.com/G-Akiraka/Docker-Tomcat.git && cd Docker-Tomcat
```
#### 2、开始构建Docker Tomcat镜像 
```
# Tomcat 版本：8.0.24 基于alpine部署,默认开启apr模式
docker build -f Build-8.0.24.yaml -t mytomcat:8.0.24 .

# Tomcat 版本：8.5.45 基于ubuntu部署,默认开启apr模式
docker build -f Build-8.5.45-by.yaml -t mytomcat:8.5.45 .

# Tomcat 版本：8.5.47 基于官方镜像，新增 jar 运行
docker build -f Build-8.5.47.yaml -t mytomcat:8.5.47 .

# Tomcat 版本：8.5.53 基于官方镜像，新增 jar 运行
docker build -f Build-8.5.53.yaml -t mytomcat:8.5.53 .

```
#### 3、运行Tomcat容器
```
docker run -d -p 8080:8080 --name mytomcat mytomcat:8.5.53
```
#### 4、查看Tomcat容器是否运行
```
docker ps
# 调试容器，如果需要的话
docker run -it mytomcat /bin/bash
```
#### 5、docker compose 示例
```
version: "2"
services:
  tomcat:
    image: mytomcat:8.5.53
    restart: always
    container_name: tomcat
    environment:
      # 我这里测试环境写test，正式环境写 prod
      SPRING_PROFILES_ACTIVE: "test"
    volumes:
      # jar 包存放位置
      - /data/wwwroot/akir/jarapps/:/usr/local/tomcat/jarapps/
      # war 包存放位置
      - /data/wwwroot/akir/webapps/:/usr/local/tomcat/webapps/
    ports:
      - "8080:8080"
```

####  感谢翔哥帮忙解决了一些技术问题