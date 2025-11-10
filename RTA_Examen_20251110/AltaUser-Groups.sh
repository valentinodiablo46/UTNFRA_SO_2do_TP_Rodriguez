#!/bin/bash
# Alta de usuarios y grupos automáticamente
# Uso: ./AltaUser-Groups.sh <usuario_para_clave> <ruta_lista_usuarios>

USUARIO=$1
LISTA=$2

# Guardamos y cambiamos el separador de campos
ANT_IFS=$IFS
IFS=,

for LINEA in $(grep -v "#" $LISTA)
do
    USUARIO_N=$(echo $LINEA | awk -F',' '{print $1}')
    GRUPO_N=$(echo $LINEA | awk -F',' '{print $2}')
    HOME_N=$(echo $LINEA | awk -F',' '{print $3}')

    echo "sudo useradd -d $HOME_N -s /bin/bash -g $GRUPO_N $USUARIO_N"
done

IFS=$ANT_IFS

