#!/bin/bash

if [ $# -ne 0 ];then
    echo "No debe mandar parametros"
    exit 2
fi

arreglo=($(find /var/log -type f -name "access"))
echo ${arreglo[*]}

exit 0
