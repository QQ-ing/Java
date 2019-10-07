yum -y install epel-release
yum -y install vim wget java
bash <(curl -L -s https://install.direct/go.sh)
yum -y install nginx
yum -y install yum-utils
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum -y install certbot python2-certbot-nginx
yum -y install certbot python2-certbot-nginx
wget https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/nginx.conf -O /etc/nginx/nginx.conf
wget https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/config.json -O /etc/v2ray/config.json
wget -O - wget https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.sh | bash
wget https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/config.json -O /etc/shadowsocks.json
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
