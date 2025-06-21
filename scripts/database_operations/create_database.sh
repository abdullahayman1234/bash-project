#!/bin/bash

function create_database() {
    read -p "Enter database name: " dbname
    
    if [[ -z "$dbname" ]]; then
        echo -e "${RED}Database name cannot be empty!${NC}"
    elif [[ "$dbname" =~ [^a-zA-Z0-9_] ]]; then
        echo -e "${RED}Database name can only contain letters, numbers and underscores!${NC}"
    elif [[ -d ~/DBMS/"$dbname" ]]; then
        echo -e "${RED}Database '$dbname' already exists!${NC}"
    else
        mkdir ~/DBMS/"$dbname"
        echo -e "${GREEN}Database '$dbname' created successfully!${NC}"
    fi
}
