#!/bin/bash

function update_table() {
    read -p "Enter table name: " tablename
    
    if [[ ! -f "$tablename" ]]; then
        echo -e "${RED}Table '$tablename' doesn't exist!${NC}"
        return
    fi
    
    read -p "Enter primary key value to update: " pkval
    
    if ! grep -q "^$pkval:" "$tablename"; then
        echo -e "${RED}Row with PK '$pkval' not found!${NC}"
        return
    fi
    
    local cols=()
    while IFS=: read -r type id name datatype extra; do
        if [[ "$type" == "column" ]]; then
            cols+=("$name")
        fi
    done < ".$tablename.meta"
    
    echo -e "${BLUE}Current values:${NC}"
    grep "^$pkval:" "$tablename" | tr ':' '\n' | nl -v 1
    
    read -p "Enter column number to update: " colnum
    
    if [[ "$colnum" -lt 1 || "$colnum" -gt "${#cols[@]}" ]]; then
        echo -e "${RED}Invalid column number!${NC}"
        return
    fi
    
    read -p "Enter new value for ${cols[colnum-1]}: " newval
    
    awk -F: -v pk="$pkval" -v col="$colnum" -v new="$newval" \
        'BEGIN{OFS=FS} $1==pk {$col=new} {print}' "$tablename" > temp && mv temp "$tablename"
    
    echo -e "${GREEN}Row updated successfully!${NC}"
}
