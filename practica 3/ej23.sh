#!/bin/bash
# Recorre un arreglo de números imprimiendo solo los pares, y luego informa 
# la cantidad de números impares

if [ $# -ne 0 ];then
    echo "No se deben enviar parametros"
    exit 1
fi

numeros=($(seq 1 10))
impares=0
for num in ${numeros[*]};do
    if [ $(expr $num % 2) -eq 0 ];then
        echo $num
    else 
        ((impares++))
    fi
done
echo "Cantidad impares: $impares"
exit 0
