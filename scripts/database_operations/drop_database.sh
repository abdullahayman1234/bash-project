#!/bin/bash

function drop_database() {
    read -p "Enter database name to drop: " dbname
    
    if [[ -d ~/DBMS/"$dbname" ]]; then
        rm -r ~/DBMS/"$dbname"
        echo -e "${GREEN}Database '$dbname' dropped successfully!${NC}"
    else
        echo -e "${RED}Database '$dbname' doesn't exist!${NC}"
    fi
}
