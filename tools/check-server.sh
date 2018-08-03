if ! pgrep sss > /dev/null
then
    echo "check sss was stoped, restart sss at `date`" >>  /var/log/checksss.log
    ssserver --manager-address=127.0.0.1:1234 -c /etc/shadowsocks.json -d restart
fi

COUNT=$(ps ax | grep kikit.jar | grep java | wc -l)
if [ $COUNT -eq 0 ]; then
    echo 'start kikit'
    sh /opt/kikit/start.sh
else
    echo 'kikit is running'
fi
