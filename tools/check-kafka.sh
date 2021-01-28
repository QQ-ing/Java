count=$(ps -ef | grep kafka |grep -v "grep" |wc -l)
if [ $count -ne 2 ];then
    sudo pkill java
    sudo rm -rf /tmp/*
    sudo sh /opt/kafka/start.sh
else
    echo "kafka -s running"
fi
