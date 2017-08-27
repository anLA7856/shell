#!/bin/sh
if (test -z $1) ;then
        read -p "Input Max Lines:" MAX
else
        MAX=$1
fi
i=1
while [ $i -le $MAX ]
do
    j=1
    while [ $j -le $i ]
    do
        f=$[i-1]             #f=i-1的写法
        g=$[j-1]             #g=j-1的写法
        if [ $j -eq $i ] || [$j -eq 1];then
            declare SUM_${i}_$j=1                    #声明变量头尾都是1
        else
            declare A=$[SUM_${f}_$j]                 #取上一行j列变量
            declare B=$[SUM_${f}_$g]                 #取上一行j-1列变量
            declare SUM_${i}_$j=`expr $A + $B`       #声明并计算当前变量的值
        fi
        echo -en $[SUM_${i}_$j]" "                   #输出当前变量
        let j++
    done
    echo                                             #换行
    let i++
done
#总是报错：
yangHuiTriangle.sh: 23: yangHuiTriangle.sh: let: not found
yangHuiTriangle.sh: 16: yangHuiTriangle.sh: declare: not found
-en $[SUM_1_1] 
