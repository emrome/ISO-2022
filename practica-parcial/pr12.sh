#!/bin/bash
# Verifique cada 3 minutos si existe el archivo /var/log/any-service/error.log. Si el archivo existe y tiene al menos una linea con el texto "FATAL ERROR": debemos comprimir y empaquetar el contenido del directorio /var/log/usr-service, guardandolo en un directorio recibido por parámetro y ademas causar la terminación apropiada. Cuando termine debemos informar la cantidad de lineas que contenian el texto "FATAL ERROR".

if [ $# -ne 1 ];then
    echo "La cantidad de parámetros es incorrecta"
    exit 1
fi

file="/var/log/any-service/error.log"
# si guardo directorio en variable dire=$1
while true;do
    if [ -f $file ];then
        cant=$(cat $file | grep "FATAL ERROR" | wc -l)
        if [ $cant -gt 0 ];then
            tar -cvzf $1/comprimido.tar.gz /var/log/usr-service/*
            # debo hacer tar -cvzf ${dire}/comprimido.tar.gz
            echo $cant
            exit 0
        fi
    fi
    sleep 3m
done

    

