#!/bin/sh
#实现这样一个企业级应用，多次执行某一个脚本后的进程只有一个
#可能写错的地方，if后面没换行
pidpath=/tmp/a.pid
if [ -f "$pidpath" ]    #if pid file exists
  then
    kill `cat $pidpath` >/dev/null 2>&1  #kill the last process as the number
    rm -f $pidpath
fi
echo $$ >$pidpath   #record the shell number 
sleep 300

#样例输出
root@anLA7856:/home/anla7856/shell# ps -ef|grep pid.sh|grep -v grep
root@anLA7856:/home/anla7856/shell# sh pid.sh &
[1] 9384
root@anLA7856:/home/anla7856/shell# ps -ef|grep pid.sh|grep -v grep
root      9384  3710  0 21:24 pts/18   00:00:00 sh pid.sh
root@anLA7856:/home/anla7856/shell# sh pid.sh &
[2] 9397
[1]-  已终止               sh pid.sh
root@anLA7856:/home/anla7856/shell# ps -ef|grep pid.sh|grep -v grep
root      9397  3710  0 21:24 pts/18   00:00:00 sh pid.sh
root@anLA7856:/home/anla7856/shell# 
