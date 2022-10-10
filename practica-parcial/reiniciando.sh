#!/bin/bash

if [ $# -ne 0 ];then
	echo "NO debe ingresar parametros"
	exit 1
fi

shutdown -r +1
exit 0 
