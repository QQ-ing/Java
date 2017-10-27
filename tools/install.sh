wget --no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.sh
chmod +x shadowsocks.sh
./shadowsocks.sh 2>&1 | tee shadowsocks.log

wget --no-check-certificate -O /etc/shadowsocks.json https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.json

echo "/etc/init.d/shadowsocks start --manager-address 127.0.0.1:1234 -c /etc/shadowsocks.json" > sss_run.sh
chmod +x sss_run.sh