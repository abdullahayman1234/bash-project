#!/bin/bash

function list_tables() {
    count=$(ls | grep -v '^\..*\.meta$' | wc -l)
    if [[ $count -eq 0 ]]; then
        echo -e "${RED}No tables found${NC}"
    else
        echo -e "${GREEN}Available tables:${NC}"
        ls | grep -v '^\..*\.meta$'
    fi
    echo ""
    tablemenu
}
