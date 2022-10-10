#!/bin/bash

if [ $# -ne 0 ]; then
    echo "No se deben enviar parámetros"
    exit 24
fi

function inicializar(){
    array=()
    return 0
}

function agregar_elem(){
# Recibe elemento y lo agrega al final
    if [ $# -ne 1 ];then
        echo "Agregar - Número de parametros inválido"
        return 1
    fi
    echo "Agregando elemento $1"
    array+=($1) 
    return 0
}   

function eliminar_elem(){
# Recibe la posicion a eliminar
    if [ $# -ne 1 ];then
        echo "Eliminar - Número de parametros inválido"
        return 1
    elif [ $1 -ge ${#array[*]} ];then
        echo "Posición $1 inválida"
        return 2
    fi
    echo "Eliminando posicion $1"
    unset array[$1]
    return 0
}

function longitud(){
    echo "Longitud arreglo: ${#array[*]}"
    return 0
}

function imprimir(){
    echo "Imprimiendo arreglo... ${array[*]}"
    return 0
}

function inicializar_Con_Valores(){
# Recibe en $1 la longitud y en $2 el elemento a agregar en todas
# las posiciones
    if [ $# -ne 2 ];then
        echo "Inicializar con valores - Número de parametros inválido"
        return 1
    fi
    array=()
    for ((i=0; i < $1; i++)) do
        array[$i]=$2
    done
    return 0
}

# Test

inicializar

imprimir
longitud
agregar_elem 2
agregar_elem 5
agregar_elem 8
imprimir

eliminar_elem 1
imprimir

agregar_elem 6
imprimir

inicializar_Con_Valores 2 3
imprimir
 

