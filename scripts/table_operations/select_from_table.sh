#!/bin/bash

function select_from_table() {
    read -p "Enter table name: " tablename
    
    if [[ ! -f "$tablename" ]]; then
        echo -e "${RED}Table '$tablename' doesn't exist!${NC}"
        return
    fi
    
    echo -e "${BLUE}Table: $tablename${NC}"
    
   
    awk -F: '{if (NR==1) {for (i=1; i<=NF; i++) printf "%-15s", $i; print ""}}' "$tablename"
    
    
    awk -F: '{if (NR==1) {for (i=1; i<=NF; i++) printf "---------------"; print ""}}' "$tablename"
    
    
    awk -F: '{for (i=1; i<=NF; i++) printf "%-15s", $i; print ""}' "$tablename"
}
