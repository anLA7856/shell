#!/bin/sh
#总是不成功，i++问题
num=10
while [ $num -gt 0 ]
do
    echo "${num}"
    ((num=num+1))
done
