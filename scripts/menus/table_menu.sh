#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${SCRIPT_DIR}/../table_operations/create_table.sh"
source "${SCRIPT_DIR}/../table_operations/list_tables.sh"
source "${SCRIPT_DIR}/../table_operations/drop_table.sh"
source "${SCRIPT_DIR}/../table_operations/insert_into_table.sh"
source "${SCRIPT_DIR}/../table_operations/select_from_table.sh"
source "${SCRIPT_DIR}/../table_operations/delete_row.sh"
source "${SCRIPT_DIR}/../table_operations/update_table.sh"
function tablemenu() {
    echo -e "$BLUE Please select an operation:"
    options=(
        "Create Table"
        "List Tables"
        "Drop Table"
        "Insert Data"
        "Select Data"
        "Delete Row"
        "Update Data"
        "Back to Main Menu"
    )
    
    select opt in "${options[@]}"; do
        case $REPLY in
            1) create_table ;;
            2) list_tables ;;
            3) drop_table ;;
            4) insert_into_table ;;
            5) select_from_table ;;
            6) delete_row ;;
            7) update_table ;;
            8) 
                cd ../..
                mainmenu
                break
                ;;
            *) 
                echo -e "$RED Invalid option"
                echo -e "$BLUE Please try again"
                ;;
        esac
    done
}
