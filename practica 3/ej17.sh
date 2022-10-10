#!/bin/bash
# Imprime en pantalla los nombres de los archivos del
# directorio actual, intercambiando minúsculas por mayúsculas
# y elimina la letra a (a o A)

if [ $# -ne 0 ];then
    echo "No se deben ingresar parámetros"
    exit 1
fi
    
for archivo in $(ls); do
    if [ -f $archivo ];then
       echo $archivo | tr -d "aA"| tr "a-zA-Z" "A-Za-z"
    fi
done
    
exit 0
