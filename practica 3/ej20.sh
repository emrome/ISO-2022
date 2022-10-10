#!/bin/bash
# Simula comportamiento PILA
if [ $# -ne 0 ]; then
    echo "No se deben enviar parametros"
    exit 255
fi

#Funciones para la pila

function push () 
{
    if [ $# -ne 1 ];then
        echo "Se debe enviar un elemento"
        return 1
    fi
    pila[${#pila[*]}]=$1 #pila+=($1)
}

function pop() 
{
    if [ $# -ne 0 ];then
        echo "No se debe enviar parametros"
        return 1
    fi
    pos=${#pila[*]}-1
    elem=${pila[pos]}
    unset pila[$pos]
    echo $elem
}

function lenght () 
{
    echo ${#pila[*]}
}

function print () 
{
    echo ${pila[*]}
}

# Testing

pila=()

# agrego elementos
for i in $(seq 1 10); do
    push $i
done
echo "Elementos: $(print)"
echo "Tamaño: $(lenght)"

# Elimino elementos
echo "Sacando elementos..."
for i in $(seq 1 3); do
    pop
done
echo "Elementos: $(print)"
echo "Tamaño: $(lenght)"

exit 0

