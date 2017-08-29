#!/bin/sh
#等待及判断用户输入，并给出相应输出
path=/home/anla7856/shell
[ ! -d "$path" ] && mkdir $path -p
#menu
cat <<END
    1.[INSTALL lamp]
    2.[INSTALL lnmp]
    3.[exit]
END
read num
expr $num + 1 &>/dev/null
[ $? -ne 0 ] && {
        echo "the num you input must be {1|2|3}"
}
[ $num -eq 1 ] && {
        echo "start install lamp."
        sleep 2;
        [ -x "$path/lamp.sh" ] || {
                echo "$path/lamp.sh does not exist or can not be exec."
                exit 1
        }
        $path/lamp.sh
        exit $?
}
[ $num -eq 2 ] && {
        echo "start install lnmp."
        sleep 2;
        [ -x "$path/lnmp.sh" ] || {
                echo "$path/lnmp.sh does not exist or can not be exec."
                exit 1
        }
        $path/lnmp.sh
        exit $?
}
[ $num -eq 3 ] && {
        echo bye
        exit 3
}
[[ !$num =~[1-3] ]] && {
        echo "the num you input must be {1|2|3}"                                                                                                                      1,1          顶端
        echo "Input Error"
        exit 4
}
                                                                                                                                    