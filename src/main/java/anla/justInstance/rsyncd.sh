#!/bin/bash
# chkconfig： 2345 20 80
# description: Rsyncd Startup scripts by anla7856
if [ $# -ne 1 ]
  then
    echo $"usage:$0 {start|stop|restart}"
    exit 1
fi
if [ "$1" = "start" ]
  then
    rsync --daemon
    sleep 2
    if[ `netstat -lntup|grep rsync|wc -l` -ge 1 ]
      then
        echo "rsyncd is started."
        exit 0
    fi
elif [ "$1" = "stop" ]
  then
    killall rsync &>/dev/null
    sleep 2
    if [ `netstat -lntup|grep rsynd|wc -l` -eq 0 ]
      then
        echo "rsyncd is stopped"
        exit 0
    fi
elif [ "$1" = "restart" ]
  then
    killall rsync
    sleep 1
    killpro=`netstat -lntup|grep rsync|wc -l`
    rsync --daemon
    sleep 1
    startpro=`netstat -lntup|grep rsync|wc -l`
    if [ $killpro -eq 0 -a $startpro -ge 1 ]
      then
        echo "rsyncd is restarted."
        exit 0
    fi
else
    echo $"usage:$0 {start|stop|restart}"
    exit 1
    
    
#仅仅测试，并无法运行现在，学习写自启脚本，在/etc/init.d下面
#前面那两行chkconfig必须加上
#设置开机自动启动过程：
#chkconfig -- add rsyncd(本文件本来是不加后缀sh的)
#chkconfig -- list rsyncd
                  