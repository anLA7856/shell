#!/bin/sh
#用来监控web服务状态，如果两次访问均失败，则报警。
#不过我测试时，总会报错，代码错误暂时没有找出来，以后找
#错误信息：checkUrl.sh: 13: checkUrl.sh: success: not found
checkUrl(){
timeout=5
fails=0
success=0
while true
    do
        wget --timeout=$timeout --tries=1 http://blog.csdn.net/anla_ -q -O /dev/null
        if [ $? -ne 0 ]
            then
                ((fails = fails+1))
        else
                ((success = success+1))
        fi
        if [ $success -ge 1 ]
            then
                echo $success
                exit 0
        fi
        if [ $fails -ge 2 ]
            then
                critical="sys is down"
                echo $critical|tee|mail -s "$critical" 350493391@qq.com
                exit 2
        fi
    done
}
checkUrl     #exec the function
~   