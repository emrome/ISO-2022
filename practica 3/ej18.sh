#!/bin/bash
# Verifica si el usuario pasado por parametro se ha logueado en el
# sistema. Cuando se loguea debe imprimir "Usuario XX logueado en
# el sistema. Terminando con el script

echo $0
if [ $# -ne 1 ]; then
    echo "Se debe ingresar el nombre de usuario a buscar"
    exit 1
fi

while [ "$1" != "$(who | cut -d" " -f1 | grep -w $1 )" ]; do
    echo "No se logueo todavia"
    sleep 10
done

echo "Usuario $1 logueado en el sistema"

exit 0
