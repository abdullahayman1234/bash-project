#!/bin/bash

function drop_table() {
    read -p "Enter table name to drop: " tablename
    
    if [[ -f "$tablename" ]]; then
        rm "$tablename"
        rm ".$tablename.meta"
        echo -e "${GREEN}Table '$tablename' dropped successfully!${NC}"
    else
        echo -e "${RED}Table '$tablename' doesn't exist!${NC}"
    fi
}
