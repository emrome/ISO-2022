#!/bin/bash
# Suma los elementos de dos arreglos de los cuales no se conoce su longitud
# Imprimiendo en pantalla la suma por posicion

if [ $# -ne 0 ];then
    echo "No se deben enviar parametros"
    exit 1
fi
function sumar()
{   
    if [ $# -ne 1 ];then
        return 1
    fi
    #$1 recibe la posicion a sumar
    if [ $1 -ge ${#vector1[*]} ];then #si es igual al tamaño tampoco puedo sumar porque no hay elemento en esa posicion
        echo "La suma de los elementos de la posicion $1 es ${vector2[$1]}"
    elif [ $1 -ge ${#vector2[*]} ];then 
        echo "La suma de los elementos de la posicion $1 es ${vector1[$1]}"
    else
        echo "La suma de los elementos de la posicion $1 es $(expr ${vector2[$1]} + ${vector1[$1]})"
    fi
    return 0
}

vector1=(2 5 7 9 6 4)
vector2=(4 8 9 6 45 8 5)

# Seteo cual es la longitud del vector con mayor tamaño
if [ ${#vector1[*]} -ge ${#vector2[*]} ];then
    longitud=${#vector1[*]}
else
    longitud=${#vector2[*]}
fi

echo "Vector 1: ${vector1[*]}"
echo "Vector 2: ${vector2[*]}"
 
for ((pos=0; pos < $longitud; pos++))do
    sumar $pos
done

exit 0
