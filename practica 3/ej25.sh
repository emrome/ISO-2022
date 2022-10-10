#!/bin/bash

# Guarda en un arreglo los nombres de los usuarios del grupo users
# Si recibe como parametros:
# "-b n": Retorna el elemento de la posicion n si existe, sino informa error
# "-l": Devuelve longitud del arreglo
# "-i": Imprime todos los elementos del arreglo en pantalla

if [ $# -eq 0 ];then
    echo "Debe enviar por lo menos una opcion (-b n, -l, -i)"
    exit 2
fi
if [ $# -gt 2 ];then
    echo "Como maximo se deben enviar 2 parametros (-d n)"
    exit 1
fi

# Obtengo los usuarios del grupo "users"
users=($(cat /etc/group | grep users | cut -d: -f4 | tr "," " "))

# Ejecuto según parametro
case $1 in 
        "-b")
            if [[ ! $2 =~ ^[0-9]+$ ]] ||[ $2 -ge ${#users[*]} ] || [ $2 -lt 0 ] ;then # No existe esa posicion
                echo "Valor de n invalido"                
            else
                echo ${users[$2]}
            fi
        ;;
        
        "-l")
            echo ${#users[*]}
        ;;
        
        "-i")
            echo ${users[*]}
        ;;
esac
exit 0
