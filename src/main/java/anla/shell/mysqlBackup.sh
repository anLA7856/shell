#!/bin/sh
#用于备份mysql
MYUSER=root
MYPASS=123456
SOCKET=/var/run/mysqld/mysqld.sock    #通过mysql配置文件读出来的
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
DBPATH=/home/anla7856/mysql/backup
MYDUMP="mysqldump -u$MYUSER -p$MYPASS -S $SOCKET"
[ ! -d "$DBPATH" ] && mkdir $DBPATH
for dbname in `$MYCMD -e "show databases;" | sed '1,2d'|egrep -v "mysql|schema"`
do
    mkdir $DBPATH/${dbname}_$(date+%F) -p        #创建对应目录
    for table in `$MYCMD -e "show tables from $dbname;"|sed '1d'`    #操作所有表
    do
        $MYDUMP $dbname $table |gzip >$DBPATH/${dbname}_$(date + %F)/${dbname}_${table}.sql.gz
    done
done
