#!/bin/bash

# Guarda en un arreglo todos los archivos que terminan en .doc del
# directorio /home
if [ $# -ne 0 ];then
    echo "No se deben enviar parámetros"
    exit 1
fi

# Funciones

function buscarPos(){
    pos=0
    for file in ${files_doc[*]};do
        if [ "$file" = "$1" ];then
            break
        else
            ((pos++))
        fi
    done
    echo $pos
}

function verArchivo()
{
# Recibe el nombre de una archivo y lo imprime si existe
    if [ $# -ne 1 ];then
        echo "varArchivo () debe recibir un nombre de archivo"
        return 1
    fi
    existe=$(buscarPos $1)
    if [ $existe -lt ${#files_doc[*]} ];then
        echo "Archivo: $1"
        return 0
    else
        echo "Archivo no encontrado"
        return 4 
    fi
}

function cantidadArchivos(){
    echo "Cantidad de archivos con terminacion \".doc\": ${#files_doc[*]}"
}

function borrarArchivo(){
# Recibe el nombre del archivo a borrar
# Si usuario ingresa "Si" elimina el archivo del FileSystem
# Si usuario ingresa "No" lo elimina solo del arreglo

if [ $# -ne 1 ];then
    echo "borrarArchivo debe recibir un nombre de archivo"
    return 1
fi
existe=$(verArchivo $1) 
valor_return=$? #Si no lo guardo se pierde
if [ $valor_return -eq 4 ];then #Archivo no encontrado
    echo "(Eliminar)Archivo no encontrado"
    return 10
elif [ $valor_return -eq 0 ];then
    echo "¿Desea eliminar el archivo \"$1\" solo logicamente(s/n)?"
    read opcion
    pos=$(buscarPos $1)
    case $opcion in
        "s")
            echo "Eliminando logicamente $1..."
        ;;
        "n")
            echo "Eliminando logica y fisicamente $1..."
            $(sudo rm $1)
        ;;
    esac
    unset files_doc[pos]
fi
return 0
}

# Busca en /home los archivos con terminacion .doc

files_doc=($(sudo find "/home" -name "*.doc"))

verArchivo "/home/documento2.doc"
cantidadArchivos
borrarArchivo "/home/documento1.doc"
cantidadArchivos

exit 0
