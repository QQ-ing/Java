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
echo 'ssserver --manager-address $(hostname -I | cut -d" " -f 1):1234 -c /etc/shadowsocks.json -d start' >> /etc/rc.d/rc.local

echo 'download kikit.jar'
echo --no-check-certificate -O kikit.jar https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/osecret-kikit.jar

echo 'create kikit_run.sh'
echo 'java -jar kikit.jar --server.host=$(hostname -I | cut -d" " -f 1) --spring.kafka.consumer.group-id=$(hostname -I | cut -d" " -f 1) 2>&1> /dev/null' > kikit_run.sh
chmod +x kikit_run.sh

echo 'write to /etc/rc.d/rc.local'
echo 'java -jar kikit.jar --server.host=$(hostname -I | cut -d" " -f 1) --spring.kafka.consumer.group-id=$(hostname -I | cut -d" " -f 1) 2>&1> /dev/null' >> /etc/rc.d/rc.local

echo 'start sserver'
sh sss_run.sh
echo 'start kikit'
sh kikit_run.sh