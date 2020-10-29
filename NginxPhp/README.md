### 编译 Nginx
> 特性：
1) 默认调优好 Nginx 配置
2) 默认添加虚拟配置，宿主机ip访问即可
3) 定义Nginx日志默认 JSON 输出，方便 ELK
> 目录说明：
1) Nginx虚拟路径 /etc/nginx/conf.d
2) Nginx重写路径 /etc/nginx/conf.d/rewrite

#### 1、使用方法
```
git clone https://gitee.com/G-Akiraka/DockerFile-NginxPhp.git && cd DockerFile-NginxPhp
```
#### 2、开始构建 Docker NginxPhp 镜像 
```
docker build -f 1.14.2-php-7.4.3-fpm.yml -t nginxphp:1.14.2-php-7.4.3-fpm .
```
#### 3、运行 Nginx 容器
```
docker run -d --name nginx -p 80:80 nginxphp:1.14.2-php-7.4.3-fpm
```
#### 4、查看 Nginx 容器是否运行
```
docker ps
# 调试容器，如果需要的话
docker run -it nginx bash
```
#### 5、通过浏览器访问，默认可通过宿主机 ip 访问