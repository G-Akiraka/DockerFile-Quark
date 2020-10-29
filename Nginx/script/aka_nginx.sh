#!/bin/sh
#   启动 crond 与 rsyslog 服务
crond && rsyslogd

#   启动 nginx
nginx -g "daemon off;"