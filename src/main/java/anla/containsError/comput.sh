#!/bin/sh
# add,substract,multiply and divide by anla7856
#实现一个简单计算器功能，不过暂时（2017年8月25日有bug，等后面学shell调试再进行修复）
#还有一种更简单的一行语句的示例：echo $(($1))
print_usage(){
        printf $"USAGE: $0 NUM1{+|-|*|/} NUM2\n"
        exit 1
}
if [ $# -ne 3 ]
    then
        print_usage
fi
firstNum=$1
secondNum=$3
op=$2
if [ -n "`echo $firstNum|sed 's/[0-9]//g'`" ]  #判断是否为整数
    then
        print_usage
fi
if [ "$op"!="+" ]&&[ "$op"!="-" ]&&[ "$op"!="*" ]&&[ "$op"!="/" ]
    then
        print_usage
fi
if [ -n "`echo $secondNum|sed 's/[0-9]//g'`" ]  #判断是否为整数
    then
        print_usage
fi
echo "${firstNum}${op}${secondNum}=$((${firstNum}${op}${secondNum}))"
