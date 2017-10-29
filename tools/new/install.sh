echo 'start download shadowsocks_install.sh'
wget --no-check-certificate -O shadowsocks_install.sh https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/new/shadowsocks_install.sh
chmod +x shadowsocks_install.sh
echo 'finish download shadowsocks_install.sh'

echo 'install shadowsocks_install.sh'
sh shadowsocks_install.sh

echo 'start download shadowsocks.json'
wget --no-check-certificate -O /etc/shadowsocks.json https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/new/shadowsocks.json
echo 'finish download shadowsocks.json'

echo 'create sss_run.sh'
echo 'ssserver --manager-address $(hostname -I | cut -d" " -f 1):1234 -c /etc/shadowsocks.json -d start' > sss_run.sh
chmod +x sss_run.sh

echo 'write to /etc/rc.d/rc.local'
echo 'sh /root/ss/sss_run.sh' >> /etc/rc.d/rc.local

echo 'download kikit.jar'
wget --no-check-certificate -O kikit.jar https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/osecret-kikit.jar

echo 'create kikit_run.sh'
echo 'java -jar kikit.jar --server.host=$(hostname -I | cut -d" " -f 1) --spring.kafka.consumer.group-id=$(hostname -I | cut -d" " -f 1) 2>&1> /dev/null' > kikit_run.sh
chmod +x kikit_run.sh

echo 'write to /etc/rc.d/rc.local'
echo 'sh /root/ss/kikit_run.sh' >> /etc/rc.d/rc.local

echo 'kill ssserver'
kill -15 $(ps aux | grep 'ssserver' | awk '{print $2}')
echo 'start ssserver'
sh sss_run.sh

echo 'kill kikit'
kill -15 $(ps aux | grep 'kikit' | awk '{print $2}')
echo 'start kikit'
sh kikit_run.sh

# 识别当前路径写到rc.local中
# ss安装完后会自动启动，需要关闭
# ss安装过程是否可以默认参数