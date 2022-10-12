#!/bin/bash
# Realice un script que reciba como parámetro: un path a un directorio y una de las siguientes opciones "-d" o "-f".
#Si el segundo parámetro es "-f" debe informar por la salida estándar la cantidad de archivos del direcotrio pasado como primer parámetro y causar la terminación del script
#Si el segundo parámetro es "-d" debe informar por la salida estándar la cantidad de directorios del direcotrio pasado como primer parámetro y causar la terminación del script
#Si el primer parámetro es un directorio inválido o el segundo no es "-d" o "-f" el script debe terminar con error

if [ $# -ne 2 ];then
    echo "La cantidad de parametros es incorrecta"
    exit 1
fi

if [ ! -d $1 ];then
    echo "El primer parametro no es un directorio"
    exit 2
fi

cant=0
case $2 in 
        "-f")
            for i in $(ls $1);do 
                if [ -f $1/$i ];then
                    ((cant++))
                fi
            done    
            echo "Cantidad de archivos en $1: $cant"
        ;;
        "-d")
            for i in $(ls $1);do 
                if [ -d $1/$i ];then
                    ((cant++))
                fi
            done
            echo "Cantidad de directorios en $1: $cant" 
        ;;
        *)  
            echo "El segundo parametro debe ser \"-d\" o \"-f\""
            exit 3
        ;;
esac
exit 0
        
