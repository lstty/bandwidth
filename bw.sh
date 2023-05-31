#!/bin/bash
count=$1 # 启动几个进程
nic=$2 # 接口
peer=13   # 单个消耗13m，每秒13m的数据，速率约100mbps
url=$3

while true
do
	date
    c=`ps aux | grep curl | grep -v grep | grep -w $nic | wc -l`
    echo "当前进程数量 $c"
    if [ $c -lt $count ]; then
    	echo "启动一个进程"
    	nohup curl --interface $nic --limit-rate ${peer}m $url -o /dev/null > /dev/null 2>&1 &
    fi
    sleep 1
done