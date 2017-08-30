#/bin/sh
#create by anla7856
#Source function library.
. /etc/init.d/functions
#config file path
FILE_PATH=/etc/user.conf
[ ! -f $FILE_PATH ] && touch $FILE_PATH

usage() {
    cat <<EOF
    USAGE: `basename $0` {-add|-del|-search} username
EOF
}

#judge run user
if [ $UID -ne 0 ]
  then
    echo "you are not supper user,please call root"
    exit 2
fi

#go to the case 
case "$1" in
    -a|-add)
        shift           #将$1清除，将$2替换$1
        if grep "^$1$" ${FILE_PATH} >/dev/null 2>&1   #过滤第一个参数，如果有
          then
            action $"user,$1 is exist" /bin/false
            exit
        else
          chattr -i ${FILE_PATH}      #解锁文件
          /bin/cp ${FILE_PATH} ${FILE_PATH}.${date+%F%T}
          echo "$1" >> ${FILE_PATH}     #将第一个参数，即用户名加入到文件
          [ $? -eq 0 ] && action $"Add $1" /bin/true
          chattr +i ${FILE_PATH}      #给文件枷锁
        fi
        ;;
    -d|-del)
        shift
        if [ `grep "\b$1\b" ${FILE_PATH}|wc -l` -lt 1 ]    #过滤第一个参数
          then
            action $"user,$1 is not exist." /bin/false
            exit
        else
            chattr -i ${FILE_PATH}
            /bin/cp ${FILE_PATH} ${FILE_PATH}.${date+%F%T}
            sed -i "/^${1}$/d" ${FILE_PATH}
            [ $? -eq 0 ] && action $"Del $1" /bin/true
            chattr +i ${FILE_PATH}
            exit
        fi
        ;;
    -s|-search)
        shift
        if [ `grep -w "$1" ${FILE_PATH}|wc -l` -lt 1 ]
          then
            echo $"user , $1 is not exist."
            exit
        else
            echo $"user , $1 is exist."
            exit
        fi
        ;;
     *)
        usage
        exit
        ;;
esac


#16行报错：add-user.sh: 16: [: -ne: unexpected operator
#并且提示没有这个文件： /etc/init.d/functions

        