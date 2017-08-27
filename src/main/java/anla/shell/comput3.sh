#!/bin/sh
#用于计算两个数的各种运算，具有基本判断。
#no.1 if numbers of args not equal 2 return
[ $# -ne 2 ] && {
    echo $"USAGE $0 NUM1 NUM2"
    exit 1
}

#no.2 test if args are integer
a=$1
b=$2
expr $a + $b + 110 &>/dev/null   #将两个参数一起的和和110相加，结果不保存
if [ $? -ne 0 ]         #则至少有一个不是整数
    then
        echo "you must input two integers"
        exit 2
fi

#no.3
echo "a-b=$(($a-$b))"
echo "a+b=$(($a+$b))"
echo "a*b=$(($a*$b))"
echo "a/b=$(($a/$b))"
echo "a%b=$(($a%$b))"
echo "a**b=$(($a**$b))"
