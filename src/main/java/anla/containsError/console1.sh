#!/bin/bash
read -p "Please input two number:" a b
#no1
[ ${#a} -le 0 ] && {
        echo "the first num is null"
        exit 1
}
[ ${#b} -le 0 ] &&{
        echo "the second num is null"
        exit 1
}

#no2
expr $a + 1 &>/dev/null
RETVAL_A=$?
expr $b + 1 &>/dev/null
RETVAL_B=$?
if [ $RETVAL_A -ne 0 -o $RETVAL_B -ne 0 ];then
        echo "one of the num is not integer, pls input again."
        exit 1
fi

#no3
echo "a-b=$(($a-$b))"
echo "a+b=$(($a+$b))"
echo "a*b=$(($a*$b))"
echo "a/b=$(($a/$b))"
echo "a**b=$(($a**$b))"
echo "a%b=$(($a%$b))"


#输入输出问题没有错误，
但是在read后面加t参数，会提示t参数非法
另一个，第28行，也就是：eaho "a**b=$(($a**$b))"会提示无法识别**运算符