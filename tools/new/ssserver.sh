$(hostname -I | cut -d" " -f 1) 

echo 'start ssserver'
ssserver --manager-address $(hostname -I | cut -d" " -f 1) :1234 -c /etc/shadowsocks.json -d start
echo 'ssserver ok'