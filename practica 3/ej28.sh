#!/bin/bash
# Recibe un directorio, y si existe, contar los archivos para los cuales el
# usuario que ejecuta el script tiene permisos de lectura y escritura, sin tener en cuenta recursividad

if [ $# -ne 1 ]; then
    echo "Parámetros inválidos"
    exit 1
elif ! [ -d $1 ];then
    echo "Directorio inexistente"
    exit 4
fi
cant_lectura=0
cant_escritura=0

for file in $(ls $1);do
    path=$1/$file
    
    if [ -f $path ];then
        if [ -r $path ];then
            ((cant_lectura++))
        fi
        if [ -w $path ];then
            ((cant_escritura++)) #No me los cuenta
        fi
    fi
done

echo "El usuario $(whoami) tiene acceso de lectura para $cant_lectura archivos del directorio $1"
echo "El usuario $(whoami) tiene acceso de escritura para $cant_escritura archivos de directorio $1"

exit 0



