#!/bin/bash

function delete_row() {
    read -p "Enter table name: " tablename
    
    if [[ ! -f "$tablename" ]]; then
        echo -e "${RED}Table '$tablename' doesn't exist!${NC}"
        return
    fi
    
    read -p "Enter primary key value to delete: " pkval
    
    if ! grep -q "^$pkval:" "$tablename"; then
        echo -e "${RED}Row with PK '$pkval' not found!${NC}"
        return
    fi
    
    sed -i "/^$pkval:/d" "$tablename"
    echo -e "${GREEN}Row deleted successfully!${NC}"
}
