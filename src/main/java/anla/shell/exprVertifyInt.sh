#!/bin/sh
#用于判断第一个参数是否为整数
expr $1 + 1 >/dev/null 2>&1
[ $? -eq 0 ] && echo int || echo chars


#示例输出
root@anLA7856:/home/anla7856/shell# sh expr1.sh anla7856
chars
root@anLA7856:/home/anla7856/shell# sh expr1.sh 12
int
