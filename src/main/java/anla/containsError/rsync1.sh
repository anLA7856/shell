#/bin/bash
# chkconfig: 2345 20 80
#. /etc/init.d/functions
usage() {
    echo $"usage: $0 {start|stop|restart}"
    exit 1
}

start() {
    rsync --daemon
    sleep 1
    if [ `netstat -lntup|grep rsync|wc -l` -ge 1 ]
      then
        action "rsyncd is started." /bin/true
    else
        action "rsyncd is started false" /bin/false
    fi
}

stop() {
    killall rsync &>/dev/null
    sleep 2
    if [ `netstat -lntup|grep rsync|wc -l` -eq 0 ]
      then
        action "rsyncd is stopped." /bin/true
    else
        action "rsyncd is stopped false." /bin/false
    fi
}
main() {
    if [ $# -ne 1 ]
      then
        usage
    fi
    if [ "$1" = "start" ]
      then
        start
    elif [ "$1" = "stop" ]
      then
        stop
    elif [ "$1" = "restart" ]
      then
        stop
        sleep 1
        start
    else
        usage
    fi
}
main $*


#总会报个错，说没找到action，事实上，action是/bin/bash下一个函数，类似与log