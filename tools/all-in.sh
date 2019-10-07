yum -y install epel-release
yum -y install vim wget java
bash <(curl -L -s https://install.direct/go.sh)
yum -y install nginx
yum -y install yum-utils
yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional
yum -y install certbot python2-certbot-nginx
yum -y install certbot python2-certbot-nginx
