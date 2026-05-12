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

var1="Evento: 2023-12-25 23:59:59, Otro: 2024-01-01 00:00:00"
echo -e "\n${GREEN}FECHA Y HORA JUNTOS${NC}\n"
sleep 1
echo -e "${GREEN}Texto:${NC} $var1"
echo -e "${GREEN}Buscar:${NC}Fecha YYYY-MM-DD seguida de hora HH:MM:SS"
sleep 2

while true; do
    echo -ne "\nIngrese la expresion regular:${GREEN} " && read -r exp1
    t1=$(echo -e "$var1" | grep -i -oP "$exp1")  
    code=$(echo $?)
    r1=$(echo -e "$t1" | xargs)
    r_ok=$(echo "2023-12-25 23:59:59 2024-01-01 00:00:00" | xargs)
    if [ "$code" -eq "0" ] && [ "$r1" == "$r_ok" ]; then
        echo -e "${GREEN}Respuesta Correcta:${NC} $r1" 
        break
    elif [ "$code" -eq "0" ]; then
        echo -e "${RED}Respuesta Inorrecta:${NC} $r1" 

    elif [ "$code" -eq 1 ]; then
        echo -e "\n${RED}[!] No hubo coincidencias${NC}\n"
    else
        echo -e "\n${RED}[!] Expresion Incorrecta [error de sintaxys]${NC}\n"
    fi

done