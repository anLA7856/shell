#!/bin/bin
#函数基本写法
usage() {
    echo $"age:$0 url "
    exit 1
}

check_url() {
    wget --spider -q -o /dev/null --tries=1 -T 5 $1
    if [ $? -eq 0 ]
      then
        echo "$1 is yes"
    else
        echo "$1 is no"
    fi
}

main() {
    if [ $# -ne 1 ]
      then
        usage
    fi
    check_url $1
}

main $*
