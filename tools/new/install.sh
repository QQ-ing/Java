echo 'start download shadowsocks.sh'
wget --no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/new/shadowsocks_install.sh
chmod +x shadowsocks.sh
echo 'finish download shadowsocks.sh'

echo 'start download shadowsocks.json'
wget --no-check-certificate -O /etc/shadowsocks.json https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/new/shadowsocks.json
echo 'finish download shadowsocks.json'

echo 'start download ssserver.sh'
wget --no-check-certificate -O /etc/shadowsocks.json https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/new/ssserver.sh
chmod +x ssserver.sh
echo 'finish download ssserver.sh'