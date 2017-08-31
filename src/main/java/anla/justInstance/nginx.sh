#!/bin/sh
# chkconfig: 2345 40 98                                     #设定，2345级别，开机第40位启动脚本，关机第98位关闭脚本。
#description: start/stop nginx server
path=/application/nginx/sbin                                #设置nginx启动命令路径
pid=/application/nginx/logs/nginx.pid                       #设定nginx pid文件路径
retval=0                                                    #设定RETVAL为0,作为返回值变量
. /etc/init.d/functions                                     #加载系统函数库，便于后面使用action等函数

start() {
    if [ ! -f $pid ];then
    #if [ `netstat -lntup|grep nginx|wc -l` -eq 0 ]; then    #也可以根据端口判断是否启动了nginx
        $path/nginx                                         #启动nginx
        retval=$?
        if [ $retval -eq 0 ];then
            action "nginx is started" /bin/true
            return $retval
        else
            action "nginx is started" /bin/false             #提示启动失败
            return $retval
        fi
    else
        echo "nginx is running"
        return 0
    fi
}
stop() {
    if [ -f $pid ];then
        $path/nginx -s stop
        retval=$?
        if [ $retval -eq 0 ];then
            action "nginx is stopped" /bin/true
            return $retval
        else
            action "nginx is stopped" /bin/false
        fi
    else
        echo "nginx is no running"
        return $retval
    fi
}
case "$1" in
    start)
        start
        retval=$?
        ;;
    stop)
        stop
        retval=$?
        ;;
    restart)
        stop
        sleep 1
        start
        retval=$?
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
exit $retval



#仅仅是一个例子，机子暂时没有安装nginx服务器，不过可以学习写法