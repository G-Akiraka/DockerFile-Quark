#!/bin/sh
# 启动 crond 与 rsyslog 服务
crond && rsyslogd
# 启动 tomcat 服务
/usr/local/tomcat/bin/catalina.sh start
# 输出日志
tail -f /usr/local/tomcat/logs/catalina.out