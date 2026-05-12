#!/bin/bash

chmod 744 ejercicios/*.sh


function ctrl_c(){
    echo -e "$RED\n\n[!] Saliendo...\n$NC"
    exit 1
}


#Ctrl+c 
trap ctrl_c INT

RED='\033[1;31m'
CYAN='\033[1;36m'
WHITE='\033[1;97m'
NC='\033[0m'

BLACK='\033[0;30m'        # Negro
DARK_GRAY='\033[1;30m'    # Gris oscuro
RED='\033[0;31m'          # Rojo oscuro
GREEN='\033[0;32m'        # Verde terminal clásico
YELLOW='\033[0;33m'       # Amarillo opaco
BLUE='\033[0;34m'         # Azul oscuro
MAGENTA='\033[0;35m'      # Magenta oscuro
CYAN='\033[0;36m'         # Cian suave
WHITE='\033[0;37m'        # Blanco/gris claro

NC='\033[0m'

clear

echo -e "$CYAN"

cat << "EOF"
        ╋╋╋╋╋╋╋╋╋╋╋╋┏┓
        ┏┳┳━┳━┳━┳┳┓┏┛┣━┳┳━┓
        ┃┏┫┻┫╋┃┻╋┃┫┃╋┃╋┣┫╋┃
        ┗┛┗━╋┓┣━┻┻┛┗━┻┳┛┣━┛
        ╋╋╋╋┗━┛╋╋╋╋╋╋╋┗━┛
EOF

echo -e "$NC"
echo -e "$CYAN Domina las expresiones regulares con disciplina"
echo ""
echo -e "$CYAN         Created by Zerberuz"
echo -e "$NC"

# Menú con marco cyan y texto blanco
echo -e "$CYAN┌──────────────────────────────┐$NC"
echo -e "$CYAN│$WHITE         MENÚ PRINCIPAL       $CYAN│$NC"
echo -e "$CYAN├──────────────────────────────┤$NC"
echo -e "$CYAN│$WHITE 1) Todos los ejercicios      $CYAN│$NC"
echo -e "$CYAN│$WHITE 2) Seleccionar ejercicio     $CYAN│$NC"
echo -e "$CYAN│$WHITE 3) Ejercicio 3               $CYAN│$NC"
echo -e "$CYAN│$WHITE 4) Ejercicio 4               $CYAN│$NC"
echo -e "$CYAN│$WHITE 5) Salir                     $CYAN│$NC"
echo -e "$CYAN└──────────────────────────────┘$NC"

# Ejemplo de interacción
read -p "Seleccione una opción: " opcion
case $opcion in
    1) 
        for i in  ejercicios/*sh; do
            echo -e "\n"
            read -p "¿Ejecutar $i? (s/n): " resp
            if [[ $resp == "s" ]]; then
                bash $i
            elif [[ $resp == "n" ]]; then  
                break
                
            fi 
        done 
        bash regexdojo.sh
        ;;
    2) 
        while true; do
            clear
            echo -e "$CYAN                      ┌──────────────────────────────┐$NC"
            echo -e "$CYAN                      │$WHITE      ----REGEX DOJO----      $CYAN│$NC"
            echo -e "$CYAN                      │$WHITE Options: [menu]              $CYAN│$NC"
            echo -e "$CYAN                      ├──────────────────────────────┤$NC"
            echo -e "\n"
            ej=$(ls ejercicios | awk -F"." '{print$1}' | sort -n | column) 
            echo -e "$CYAN$ej$NC"
            echo -e "\n"
            read -p "Seleccione el numero de su opcion: " opcion2
            if [ $opcion2 == "menu" ]; then
                break
            fi
            bash ejercicios/$opcion2-*.sh 2>/dev/null
        done
        bash regexdojo.sh

        ;;
    3) bash ejercicios/ej3.sh ;;
    4) bash ejercicios/ej4.sh ;;
    5) echo -e "\n${RED}[!] Saliendo...${NC}"; exit 1 ;;
    *) echo "Opción inválida" ;;
esac
