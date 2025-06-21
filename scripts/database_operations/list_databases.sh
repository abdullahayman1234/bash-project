#!/bin/bash

function list_databases() {
    echo -e "${BLUE}Available Databases:${NC}"
    if [[ -z "$(ls ~/DBMS)" ]]; then
        echo -e "${YELLOW}No databases found!${NC}"
    else
        ls ~/DBMS
    fi
}
