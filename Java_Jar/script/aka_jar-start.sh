#!/bin/sh
# 日期
DATE=`date +%Y-%m-%d`
# 日志输出路径
LOGS=/usr/local/java_jar/logs
# 创建运行目录
mkdir -p /usr/local/java_jar/jarapps
# 创建日志路径
mkdir -p /usr/local/java_jar/logs

# 杀掉 jar 进程
pid=`ps -ef | grep "java -jar" | grep -v grep |awk '{print $2}'`
if [ -n "$pid" ];then
   kill -9 $pid
fi

# 查找 webapps 文件夹下的 jar 文件
for i in $( find /usr/local/java_jar/jarapps -name "*.jar" );do
    if [ -f "$i" ];then
        # 运行 jar 包，并设置 spring.profiles.active 变量
        nohup ${JAVA_HOME}/bin/java -jar ${i} --spring.profiles.active=${SPRING_PROFILES_ACTIVE} > ${LOGS}/jar_out-${DATE}.out 2>&1 &
    else
        echo "没有jar包" > ${LOGS}/jar_out-${DATE}.out 2>&1 &
    fi
done