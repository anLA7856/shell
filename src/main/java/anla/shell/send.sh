#!/bin/sh
#简单的例子
export LANG="zh_CN.UTF-8"
sum=15
msg_fee=15
msg_count=0
menu() {
    cat <<END
当前余额为${sum}分，每条短信需要${msg_fee}分
===========================================
        1.充值
        2.发消息
        3.退出
END
}

recharge() {
    read -p "请输入金额充值：" money
    expr $money+1 &>/dev/null           #判断金额是否为整数
    if [ $? -ne 0 ]; then
        echo "the money you input is error, must be int"
    else
        sum=$(($sum+$money))
        echo "当前余额为：$sum"
    fi
}
sendInfo() {
    if [ ${sum} -lt $msg_fee ]; then
        printf "余额不足，只有$sum ,请充值"
    else
        while true
        do
            read -p "请输入短信内容：" msg
            sum=$(($sum-$msg-fee))
            printf "Send "$msg" successfully!\n"
            printf "当前余额为：$sum\n"
            if [ $sum -lt $msg_fee ]; then
                printf "余额不足，剩余$sum分\n"
                return 1
            fi
        done
    fi
}
main() {
    while true
    do
        menu
        read -p "请输入数字选择：" men
        case "$men" in
            1)
                recharge
                ;;
            2)
                sendInfo
                ;;
            3)
                exit 1
                ;;
            *)
                printf "选择错误，只能是{1|2|3}"
                ;;
        esac
    done
}

main
