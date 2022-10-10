#!/bin/bash
# La funcion productoria multiplica todos los elementos de una arreglo
if [ $# -ne 0 ];then
    echo "No se deben enviar parametros"
    exit 1  
fi

function productoria 
{
    if [ $# -ne 0 ];then
        echo "No se deben enviar parametros a la funcion"
        return 1  
    fi
    resultado=1
    for elem in ${num[*]};do
        resultado=$(expr $resultado \* $elem)
    done
    echo $resultado #Para "devolverla"
    return 0
}

num=(10 3 5 7 9 3 5 4 )
RES=$(productoria)

echo "Elementos del arreglo: ${num[*]}"
echo "Resultado de su multiplicacion (directo funcion): $(productoria )"
echo "Resultado de su multiplicacion (variable): $RES"

exit 0
