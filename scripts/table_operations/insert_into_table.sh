#!/bin/bash

function insert_into_table() {
    read -p "Enter table name: " tablename
    
    if [[ ! -f "$tablename" ]]; then
        echo -e "${RED}Table '$tablename' doesn't exist!${NC}"
        return
    fi
    
    declare -a columns
    declare -a types
    while IFS=: read -r type id name datatype extra; do
        if [[ "$type" == "column" ]]; then
            columns+=("$name")
            types+=("$datatype")
        fi
    done < ".$tablename.meta"
    
    declare -a values
    for ((i=0; i<${#columns[@]}; i++)); do
        while true; do
            read -p "Enter ${columns[i]} (${types[i]}): " value
            
            if [[ "${types[i]}" == "int" && ! "$value" =~ ^[0-9]+$ ]]; then
                echo -e "${RED}Invalid integer!${NC}"
            elif [[ "${types[i]}" == "str" && "$value" == "" ]]; then
                echo -e "${RED}Value cannot be empty!${NC}"
            else
                values+=("$value")
                break
            fi
        done
    done
    
    # Join array elements with colons
    IFS=':' eval 'joined="${values[*]}"'
    echo "$joined" >> "$tablename"
    echo -e "${GREEN}Data inserted successfully!${NC}"
}
