#!/bin/sh
# 启动 crond 与 rsyslog 服务
if [ `cat /etc/issue | grep -i Alpine | wc -l` -eq 1 ];then
  echo "是 Alpine 系统"
  crond && rsyslogd
else
  echo " 非 Alpine 系统"
  service cron start && service rsyslog start
fi

#   启动 nginx
nginx -g "daemon off;"