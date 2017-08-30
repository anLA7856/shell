#!/bin/sh
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
RES='\E[0m'
usage() {
    echo "USAGE: $0 {1|2|3|4}"
    exit 1
}

menu() {
    cat <<END
    1.APPLE
    2.PEAR
    3.BANANA
END
}
choose() {
read -p "pls input your choice:" fruit
case "$fruit" in
    1)
        echo -e "${READ_COLOR}apple${RES}"
        ;;
    2)
        echo -e "${GREEN_COLOR}pear${RES}"
        ;;
    3)
        echo -e "${YELLOW_COLOR}banana${RES}"
esac
}

main() {
    menu
    choose
}

main

#老是不能正常输出红色字体，而是直接把翻译后的输出，作为字符串输出
#root@anLA7856:/home/anla7856/shell# sh colorTest.sh
#    1.APPLE
#    2.PEAR
#    3.BANANA
#pls input your choice:2
#-e \E[1;32mpear\E[0m
