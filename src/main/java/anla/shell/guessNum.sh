#!/bin/sh
#一个猜数字游戏
total=0
export LANG="zh_CN.UTF=8"
NUM=$((RANDOM%61))
echo "当前苹果的价格是没斤 $NUM 元"
echo "=============================="
usleep 1000000
clear
echo '请问这苹果多少钱一斤？请猜0～60的数字'
apple() {
    read -p "请输入价格：" PRICE
    expr $PRICE + 1 &>/dev/null
    if [ $? -ne 0 ];then
        echo "老哥，赶紧猜数字"
        apple
    fi
}

guess() {
    ((total++))
    if [ $PRICE -eq $NUM ]; then
        echo "厉害了我的老哥，猜对了，就是$NUM元"
        if [ $total -le 3 ];then
            echo "一共猜了$total次，厉害了"
        elif [ $total -gt 3 -a $total -le 6 ]; then
            echo "猜了$total次，加油哦"
        elif [ $total -gt 6 ]; then
            echo "一共猜了$total次，行不行"
        fi
        exit 0
    elif [ $PRICE -gt $NUM ]; then
        echo "嘿嘿，这个高了，再给你一次机会"
        apple
    elif [ $PRICE -lt $NUM ]; then
        echo "价格猜低了，再试一次"
        apple
    fi
}
main() {
    apple
    while true
        do
            guess
        done
}

main
