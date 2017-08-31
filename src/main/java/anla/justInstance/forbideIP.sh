#!/bin/sh
#目的是从日志文件里面读取文件，然后分析ip，如果发现同一个ip太多，造成ddos攻击，就封掉这个ip
file=$1
#专门用于判断函数是否以.log结尾
judgeExt() {
    if expr "$1" : ".*\.log" &>/dev/null
      then
        :
    else
        echo $"usage:$0 xxx.log"
    fi
}
#分析日志，对访问的ip去重排序
ipCount() {
    grep "ESTABLISHED" $1|awk -F "[ :]+" '{ ++S[$(NF-3)]}END {for(key in S)
print S[key],key}'|sort -rn -kl|head -5 >/tmp/tmp.log
}

#防火墙封堵函数
ipt() {
    local ip=$1
    if [ `iptables -L -n|grep "$ip"|wc -l` -lt 1 ]
      then
        iptables -I INPUT -s $ip -j DROP
        echo "$line is dropped" >>/tmp/droplist_$(date +%F).log
    fi
}
main() {
    judgeExt $file
    while true
    do
        ipCount $file
        while read line
        do
            ip=`echo $line|awk '(print $2)'`
            count=`echo $line|awk '(print $1)'`
            if [ $count -gt 3 ] #去重后检测，若某ip超过3次，则封堵
              then
                ipt $ip
            fi
        done</tmp/tmp.log
        sleep 180
    done
}
main

