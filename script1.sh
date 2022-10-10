#!/bin/bash
# Recibe un usuario por parámetro
# Si no existe, finaliza con codigo de error 1
# Si existe, debe verificar cada 30 segundos si el usuario está logueado. Cuando lo esté, debe registrar en una archivo llamado <NOMBRE DE USUARIO>.log el nombre junto con la fecha.
# NO debe borrar su contenido y debe escribirse en una ubicacion apropiada 
# Al detectar 30 veces que el usuario está logueado el script debe finalizar con codigo de error 0

if [ $# -ne 1 ];then
    echo "Debe enviar un usuario por parámetro"
    exit 4
fi

if [ $(cat /etc/passwd | grep -w $1 | cut -d: -f1 | wc -l) -eq 0 ];then
    exit 1
fi

while true;do
    logueado=$(who | grep -w $1 | wc -l)
    if [ $logueado -eq 0 ];then
        sleep 30
    else
        archivo=/var/log/$1.log
        echo $1 $(date) >> $archivo
        exit 0
    fi
done

