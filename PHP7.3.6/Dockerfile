FROM ubuntu:18.04
MAINTAINER akiraka@qq.com

#   设置ENV
ENV SRC_PATH="/usr/local/src"
ENV PHP_PATH="/usr/local/php"
#   设置容器中文，否则中文乱码
ENV LANG C.UTF-8
#   设置时区
ENV TZ Asia/Shanghai

#   使用阿里源并设置时间
RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

#   更新系统\安装依赖包
RUN apt-get update -y \
    && apt-get install -y vim make tzdata libssl-dev libc-client2007e-dev libfreetype6-dev libldap2-dev libmhash-dev \
    libglib2.0-dev libpng-dev libzip-dev zlib1g-dev zlib1g-dev libxml2-dev libjpeg-dev libxslt1-dev libargon2-0-dev \
    && rm -r /var/lib/apt/lists/* 

#   拷贝需要的源码包
ADD src/php-7.3.6.tar.gz ${SRC_PATH}
ADD src/curl-7.65.1.tar.gz ${SRC_PATH}
ADD src/re2c_1.1.1.orig.tar.gz ${SRC_PATH}

#   编译curl
WORKDIR ${SRC_PATH}/curl-7.65.1
RUN ./configure --prefix=/usr/local/curl
RUN make && make install
RUN ln -s /usr/local/curl/bin/curl /usr/bin/

#   编译re2c
WORKDIR $SRC_PATH/re2c-1.1.1
RUN ./configure
RUN make && make install

#   编译 PHP
RUN useradd -M -s /sbin/nologin www
WORKDIR ${SRC_PATH}/php-7.3.6
RUN ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --with-config-file-scan-dir=/usr/local/php/etc/php.d \
    --with-fpm-user=www --with-fpm-group=www --enable-fpm --disable-fileinfo --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd \
    --with-iconv-dir=/usr/local --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath \
    --enable-bcmath --enable-shmop --enable-exif --enable-sysvsem --enable-inline-optimization --enable-mbregex --enable-mbstring --with-password-argon2 \
    --with-gd --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-ftp --enable-intl --with-xsl --with-gettext --enable-zip --without-libzip \
    --enable-soap --disable-debug --with-ldap --with-curl=/usr/local/curl
RUN make && make install

#   拷贝相关文件
ADD etc ${PHP_PATH}/etc/

#   默认进入 PHP 工作目录
WORKDIR $PHP_PATH

#   删除源码文件
RUN /bin/rm -rf ${SRC_PATH}/*

#   配置端口
EXPOSE 9000

CMD ["/usr/local/php/sbin/php-fpm"]
