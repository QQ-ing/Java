wget --no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.sh
chmod +x shadowsocks.sh
./shadowsocks.sh 2>&1 | tee shadowsocks.log

wget --no-check-certificate -O /etc/shadowsocks.json https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/shadowsocks.json

echo "/etc/init.d/shadowsocks start --manager-address 127.0.0.1:1234 -c /etc/shadowsocks.json 2>&1> /dev/null" > sss_run.sh
# or ssserver --manager-address 74.121.148.194:1234 -c /etc/shadowsocks.json -d start
chmod +x sss_run.sh

wget --no-check-certificate -O osecret-kikit.jar https://raw.githubusercontent.com/cokepluscarbon/Java/master/tools/osecret-kikit.jar
echo "java -jar osecret-kikit.jar --server.host=97.64.83.111 --spring.kafka.consumer.group-id=97.64.83.111 2>&1> /dev/null" > kikit_run.sh


### 启动ssserver

/usr/bin/python /usr/bin/ssserver --manager-address 97.64.80.173:1234 -c /etc/shadowsocks.json -d start

### 启动kikit

echo $(hostname -I | cut -d" " -f 1) 
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
ip route get 8.8.8.8 | head -1 | cut -d' ' -f8