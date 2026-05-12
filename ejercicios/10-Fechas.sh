#!/bin/bash
clear
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

var1="Fechas: 15/12/2023, 01/01/2024, 31/02/2020"
echo -e "\n${GREEN}ENCONTRAR FECHAS ${NC}\n"
sleep 1
echo -e "${GREEN}Texto:${NC} $var1"
echo -e "${GREEN}Buscar:${NC} Patrón de fecha en formato DD/MM/AAAA"
sleep 2

while true; do
    echo -ne "\nIngrese la expresion regular:${GREEN} " && read -r exp1
    t1=$(echo -e "$var1" | grep -oP "$exp1")  
    code=$(echo $?)
    r1=$(echo -e "$t1" | xargs)
    r_ok=$(echo "15/12/2023 01/01/2024 31/02/2020" | xargs)
    if [ "$code" -eq "0" ] && [ "$r1" == "$r_ok" ]; then
        echo -e "${GREEN}Respuesta Correcta:${NC} $r1" 
        sleep 3
        break
    elif [ "$code" -eq "0" ]; then
        echo -e "${RED}Respuesta Inorrecta:${NC} $r1" 

    elif [ "$code" -eq 1 ]; then
        echo -e "\n${RED}[!] No hubo coincidencias${NC}\n"
    else
        echo -e "\n${RED}[!] Expresion Incorrecta [error de sintaxys]${NC}\n"
    fi

done