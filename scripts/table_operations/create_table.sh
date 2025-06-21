#!/bin/bash

function create_table() {
    read -p "Enter table name: " tablename
    
    if [[ -z "$tablename" ]]; then
        echo -e "${RED}Table name cannot be empty!${NC}"
        return
    fi
    
    if [[ -f "$tablename" ]]; then
        echo -e "${RED}Table '$tablename' already exists!${NC}"
        return
    fi

    touch "$tablename"
    touch ".$tablename.meta"
    
    while true; do
        read -p "Enter number of columns: " colnum
        if [[ "$colnum" =~ ^[0-9]+$ ]] && [[ "$colnum" -ge 1 ]]; then
            break
        else
            echo -e "${RED}Invalid input! Please enter a positive integer.${NC}"
        fi
    done
    
    echo "table_name:$tablename" >> ".$tablename.meta"
    echo "columns:$colnum" >> ".$tablename.meta"
    echo "primary_key:1" >> ".$tablename.meta" 
    
    for ((i=1; i<=colnum; i++)); do
        while true; do
            read -p "Enter column $i name: " colname
            
            if [[ -z "$colname" ]]; then
                echo -e "${RED}Column name cannot be empty!${NC}"
                continue
            fi
            
            if [[ $i -eq 1 ]]; then
                
                echo "column:$i:$colname:int:primary" >> ".$tablename.meta"
                break
            else
               
                PS3="Select column type for $colname: "
                select type in "int" "str"; do
                    case $REPLY in
                        1|2) 
                            echo "column:$i:$colname:$type" >> ".$tablename.meta"
                            break 2  
                            ;;
                        *) 
                            echo -e "${RED}Invalid option! Please select 1 or 2.${NC}"
                            ;;
                    esac
                done
            fi
        done
    done
    
    echo -e "${GREEN}Table '$tablename' created successfully${NC}"
    PS3=""  # Reset prompt
}
