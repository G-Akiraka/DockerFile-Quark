### 零、介绍
* [x]   一键傻瓜部署
* [x]   一键添加用户证书，方便高安全要求使用
* [x]   支持单证书，使用用户与密码登录
* [x]   命令行工具支持，只需要敲 openvpn 即可操作
* [x]   支持用户增删查，足够傻瓜简洁方便

### 一、部署 OpenVPN
####    1.1 克隆仓库
```bash
git clone https://gitee.com/G-Akiraka/OpenVpn-Docker.git /opt/openvpn && cd /opt/openvpn
```
####    1.2 启动
```bash
# 首次必须要运行这个，日后直接输入 openvpn 即可
bash /opt/openvpn/start_openvpn.sh
```
####    1.3、部署 OpenVPN
*   根据提示选择
*   输入编号 1
```bash
# 输入私钥密码 (输入密码是看不到的)
Enter PEM pass phrase:

# 再次输入，和上个密码一样 (输入密码是看不到的)
Verifying - Enter PEM pass phrase

# 输入 CA 名称，完成回车
Common Name (eg: your user, host, or server name) [Easy-RSA CA]:

# 输入刚才设置的私钥密码
Enter pass phrase for /etc/openvpn/pki/private/ca.key:

# 再次输入刚才设置的私钥密码
Enter pass phrase for /etc/openvpn/pki/private/ca.key:
```
### 二、一个用户一个登录证书
####    2.1、添加用户证书
*   输入编号 3
*   根据提示操作
```bash
# 输入私钥密码 (输入密码是看不到的)
Enter PEM pass phrase:

# 再次输入，和上个密码一样 (输入密码是看不到的)
Verifying - Enter PEM pass phrase

# 输入创建 OpenVPN 服务时候输入的私钥密码
Enter pass phrase for /etc/openvpn/pki/private/ca.key:
```
####    2.1、提取登录证书
*   将服务器中刚才创建的 ovpn 下载到本地
*   名称为自己创建的用户名
```bash
# 目录位置
ls /data/openvpn/ovpn
```
####    2.2、客户端导入证书
*   这一步自己解决，下载个客户端，然后导入进去就行了
*   填写用户为自己创建的用户名与密码，然后连接即可

### 三、使用用户密码方式
####    3.1、使用用户密码方式
*   这种方式使用一个创建好证书，然后通过配置文件，将用户名与密码丢进去就可以了
*   通过编号 2 
*   默认用户名: test 密码: aka
*   需要多个用户和密码按照格式新增即可生效
####    3.2、添加用户证书
*   输入编号 3
*   根据提示操作
*   这里创建一个名称为 client 的用户
```bash
# 输入私钥密码 (输入密码是看不到的)
Enter PEM pass phrase:

# 再次输入，和上个密码一样 (输入密码是看不到的)
Verifying - Enter PEM pass phrase

# 输入创建 OpenVPN 服务时候输入的私钥密码
Enter pass phrase for /etc/openvpn/pki/private/ca.key:
```
####    3.3、提取登录证书配置
*   将服务器中刚才创建的 ovpn 下载到本地
*   名称为自己创建的用户名
```bash
# 目录位置
ls /data/openvpn/ovpn
```
####    3.4、配置登录证书配置
*   将得到的 clinet.ovpn 通过编辑器打开，我用 vscode
*   添加 auth-user-pass 到 clinet.ovpn 文件中
>   找到 BEGIN ENCRYPTED PRIVATE KEY 从大约第 8 行的 <key> 开始一直删到大约 62 行的 </cert> 即可，然后保存导入到 OpenVPN 客户端中

![ayKavj.png](https://s1.ax1x.com/2020/08/05/ayKavj.png)
![ayKIVx.png](https://s1.ax1x.com/2020/08/05/ayKIVx.png)