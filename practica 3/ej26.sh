#!/bin/bash
# Recibe una cantidad desconocidad por parametro (al menos uno), donde cada 
# uno es la RUTA ABSOLUTA de un archivo o directorio.
# Debe informar si existen (y que tipo es) de aquellos que se encuentran en 
# posiciones impares. Ademas, debe informar cantidad que no existen

if [ $# -lt 1 ]; then
    echo "Debe enviar por lo menos la RUTA ABSOLUTA de un directorio o archivo"
    exit 1
fi

cant=0
pos=1
for parametro in $*; do
    if [ $(expr $pos % 2) -ne 0 ];then
        if [ -d $parametro ]; then
            echo "$parametro es un directorio"
        elif [ -f $parametro ];then
            echo "$parametro es un archivo"
        else
            ((cant++))
        fi
    fi
    ((pos++))
done

echo "Cantidad de archivos o directorios inexistentes: $cant"
exit 0
