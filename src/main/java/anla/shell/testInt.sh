#!/bin/sh
#用来无尽的判断输入的字符是整型还是字符型
while true
do
    read -p "Pls input:" a
    expr $a + 0 >/dev/null 2>&1
    [ $? -eq 0 ] && echo int || echo chars
done

#痒例输出：
Pls input:lkjlk
chars
Pls input:123
int

