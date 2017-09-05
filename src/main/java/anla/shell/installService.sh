#!/bin/bash
#主要模拟安装任务，通过select来进行服务选择
RETVAR=0
path=/home/anla7856/shell
[ ! -d "$path" ] && mkdir $path -p
usage() {
    echo "Usage:$0 argv"
    return 1
}
installService() {
    if [ $# -ne 1 ]; then
        usage
    fi
    local RETVAL=0
    echo "start installing ${1}."
    sleep 2
    if [ ! -x "$path/${1}.sh" ]; then
        echo "$path/${1}.sh does not exist or can not be exec."
        return 1
    else
        $path/${1}.sh
        return $RETVAL
    fi
}
main() {
    PS3="`echo pls input the num you want:`"
    select var in "Install lamp" "Install lnmp" "exit"
    do
        case "$REPLY" in
            1)
                installService lamp
                RETVAL=$?
                ;;
            2)
                installService lnmp
                RETVAL=$?
                ;;
 			3)
                echo bye
                return 3
                ;;
            *)
                echo "the num you input must be {1|2|3}"
                echo "Input ERROR"
                ;;
        esac
    done
exit $RETVAL
}
main
                