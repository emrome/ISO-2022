#!/bin/bash

if [ $# -ne 1 ];then
	echo "Se debe ingresar una extension"
	exit 1
else
 echo -n > reporte.txt
 for linea in $(cat /etc/passwd | cut -d: -f 1,6);do
 	user=$(echo $linea | cut -d: -f1)
	home=$(echo $linea | cut -d: -f2)
		
	if [ -d $home ]; then
		echo $user $(sudo find $home -name "*.$1" | wc -l) >> reporte.txt
	fi
 done
fi
exit 0	
