#!/bin/sh
#每隔多少秒去访问下该网站，看是否成功。
if [ $# -ne 1 ]; then
    echo $"usage $0 url"
    exit 1
fi
while true
do
    if [ `curl -o /dev/null --connect-timeout 5 -s -w "%{http_code}" $1|egrep -w "200|301|302"|wc -l` -ne 1 ];then
        echo "$1 is error."
        #echo "$1 is error."|mail -s "$1 is error." 350493391@qq.com
    else
        echo "$1 is ok"
    fi
    sleep 10
done
