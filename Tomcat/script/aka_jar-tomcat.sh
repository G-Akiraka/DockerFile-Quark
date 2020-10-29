#!/bin/sh
# 日期
DATE=`date +%Y-%m-%d`
# 日志输出路径
LOGS=/usr/local/tomcat/logs

# 判断是否运行 jar 包
if [ `ls /usr/local/tomcat/jarapps/ | grep -i jar | wc -l` -eq 1 ];then
  echo "文件已存在"
  # 查找 webapps 文件夹下的 jar 文件
  find_jar=`ls /usr/local/tomcat/jarapps/*.jar`
  # 运行 jar 包，并设置 spring.profiles.active 变量
  nohup ${JAVA_HOME}/bin/java -jar ${find_jar} --spring.profiles.active=${SPRING_PROFILES_ACTIVE} > ${LOGS}/java_jar.out 2>&1 &
else
  echo "没有jar包，直接启动 tomcat" > ${LOGS}/jar_out-${DATE}.out 2>&1 &
fi

# 启动 crond 与 rsyslog 服务
if [ `cat /etc/issue | grep -i Alpine | wc -l` -eq 1 ];then
  echo "是 Alpine 系统"
  crond && rsyslogd
else
  echo " 非 Alpine 系统"
  service cron start && service rsyslog start
fi

# 启动 tomcat
/usr/local/tomcat/bin/catalina.sh start
# 输出日志
tail -f /usr/local/tomcat/logs/catalina.out