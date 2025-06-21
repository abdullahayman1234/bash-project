#!/bin/bash

function init_dbms() {
    if [[ ! -d ~/DBMS ]]; then
        mkdir ~/DBMS
        echo -e "${GREEN}Created DBMS directory at ~/DBMS${NC}"
    fi
}

function welcome_message() {
    clear
    echo -e "${BLUE}"
    echo "  ____  ____  __  __ ____  "
    echo " |  _ \| __ )|  \/  / ___| "
    echo " | | | |  _ \| |\/| \___ \ "
    echo " | |_| | |_) | |  | |___) |"
    echo " |____/|____/|_|  |_|____/ "
    echo -e "${NC}"
    echo -e "${YELLOW}Welcome to DBMS (Database Management System)${NC}"
    echo ""
}
