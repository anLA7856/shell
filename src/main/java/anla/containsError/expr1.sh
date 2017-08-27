#!/bin/sh
#本脚本用于测试程序后缀名是否为pub，但有bug
if expr "$1" : ".*\.pub" &>/dev/null
  then
    echo "you are using $1"
else
    echo "pls use *.pub file"
fi
