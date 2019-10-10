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
mkdir /opt/kikit
wget http://43.239.158.247/abcdefb/kikit.jar -O /opt/kikit/kikit.jar
wget http://43.239.158.247/abcdefb/start.sh -O /opt/kikit/start.sh
(crontab -l 2>/dev/null; echo "*/10 * * * * wget -O - https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/v2-check-server.sh | bash") | crontab -
(crontab -l 2>/dev/null; echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew") | crontab -
wget -O - wget https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.sh | bash
wget https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.json -O /etc/shadowsocks.json
