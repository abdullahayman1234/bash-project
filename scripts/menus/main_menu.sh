#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${SCRIPT_DIR}/../database_operations/create_database.sh"
source "${SCRIPT_DIR}/../database_operations/list_databases.sh"
source "${SCRIPT_DIR}/../database_operations/connect_database.sh"
source "${SCRIPT_DIR}/../database_operations/drop_database.sh"

function mainmenu() {
    echo -e "${BLUE}Main Menu:${NC}"
    PS3="Select an option: "
    options=(
        "Create Database"
        "List Databases"
        "Connect to Database"
        "Drop Database"
        "Exit"
    )
    
    select opt in "${options[@]}"; do
        case $REPLY in
            1) create_database ;;
            2) list_databases ;;
            3) connect_database ;;
            4) drop_database ;;
            5) 
                echo -e "${GREEN}Goodbye!${NC}"
                exit 0
                ;;
            *) 
                echo -e "${RED}Invalid option!${NC}"
                ;;
        esac
        echo ""
        mainmenu
    done
}
