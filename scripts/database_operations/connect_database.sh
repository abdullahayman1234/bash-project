#!/bin/bash

function connect_database() {
    read -p "Enter database name to connect: " dbname
    
    if [[ -d ~/DBMS/"$dbname" ]]; then
        cd ~/DBMS/"$dbname" || exit
        echo -e "${GREEN}Connected to database '$dbname'${NC}"
        source "${SCRIPT_DIR}/../menus/table_menu.sh"
        tablemenu
    else
        echo -e "${RED}Database '$dbname' doesn't exist!${NC}"
    fi
}
