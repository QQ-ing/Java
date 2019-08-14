count=$(ps -ef | grep manager-address |grep -v "grep" |wc -l)
if [ $count -eq 0 ];then
    echo "check sss was stoped, restart sss at `date`" >>  /var/log/checksss.log
    ssserver --manager-address=127.0.0.1:1234 -c /etc/shadowsocks.json -d restart
else
    echo "ssserver -s running"
fi

COUNT=$(ps ax | grep kikit.jar | grep java | wc -l)
if [ $COUNT -eq 0 ]; then
    echo 'start kikit'
    sh /opt/kikit/start.sh
else
    echo 'kikit is running'
fi

SIZE=$(du /opt/kikit/logs/ | cut -f 1)
if [ $SIZE -gt 642360‬]; then
   echo 'delete logs in /opt/kikit/logs/2*'
   rm -rf /opt/kikit/logs/2*
else
    echo 'not need to delete logs'
fi
