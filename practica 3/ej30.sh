#!/bin/bash

# Mueve todos los programas del directorio actual (archivos ejecutables) hacia el subdirectorio "bin" del directorio HOME del usuario actualmente logueado.
# Si directorio no existe debe crearlo. Además, debe indicar que archivos mueve y cuántos ha movido

if [ $# -ne 0 ];then
    echo "Script no debe recibir parámetros"
    exit 1
fi
bin="$HOME/bin"
if ! [ -d $bin ];then
    mkdir $bin
fi
movidos=0
for file in $(ls);do
    if [ -f $file ] && [ -x $file ];then
        echo "Moviendo $file a $bin"
        mv $file $bin
        ((movidos++))
    fi
done

echo "Archivos movidos a directorio $bin: $movidos"
exit 0
