#!/bin/bash

#    ___       _ _   _       _   ____            _       _   
#   |_ _|_ __ (_) |_(_) __ _| | / ___|  ___ _ __(_)_ __ | |_ 
#    | || '_ \| | __| |/ _` | | \___ \ / __| '__| | '_ \| __|
#    | || | | | | |_| | (_| | |  ___) | (__| |  | | |_) | |_ 
#   |___|_| |_|_|\__|_|\__,_|_| |____/ \___|_|  |_| .__/ \__|
#                                                 |_|        


PS3='Please, choose an option: '
while true; do 
    clear
    options=("Initial" "Delete" "Revert " "Quit")
    select opt in "${options[@]}"
        do
            case $opt in 
                "Initial")
                    PS3='Choose where you want to initiate: '
                        options=("Initial Locally" "Initial Online" "Quit")
                        select opt in "${options[@]}"
                            do 
                                case $opt in 
                                "Initial Locally")
                                echo "Welcome to the Initiate Locally Script "
                                sudo -u postgres psql -f sql/init.sql
                                echo "Creation of the administrateur user and database"
                                touch .env 
                                echo "Creation of environnmental files"
                                echo "
                                    PGHOST=3003
                                    PGUSER=admin-LassO
                                    PGDATABASE=LassO
                                    PGPASSWORD=lasso
                                                    ">>.env 
                                echo ".env variables implemented" 
                                psql -U  "admin-LassO" -d "LassO" -f sql/tables.sql
                                echo "creation of tables"
                                break 3
                                ;;

                            "Initial Online")
                                echo "Not available yet"
                                break 3
                            ;;
                            "Quit")
                            break 2
                            ;;
                            *) echo "invalid option $REPLY";;
                        esac
                    done
                    break
                    ;;
                
                "Delete")
                    PS3='Choose where you want to delete:  '
                        while true; do
                        options=("Locally" "Online" "Quit")
                        select opt in "${options[@]}"
                            do 
                                case $opt in 
                                "Locally")
                                    PS3='What do you want to delete locally ? '
                                         options=("Delete All" "Delete Tables " "Delete Database" "Quit")
                                         select opt in "${options[@]}"
                                            do
                                                case $opt in
                                                "Delete All")
                                                        echo "Welcome to the full suppression script"
                                                        sudo -u postgres psql -f sql/deleteTables.sql
                                                        sleep 2
                                                        echo "Tables deleted"
                                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                        sleep 2
                                                        echo "Database and Role deleted"
                                                    break 3
                                                    ;;
                                                "Delete Tables")
                                                    echo "Welcome to the supression table script "
                                                    sleep 1
                                                    sudo -u postgres psql -f sql/deleteTables.sql
                                                    echo "Tables deleted"
                                                    sleep 1
                                                break 3
                                                ;;
                                                "Delete Database")
                                                    echo "Welcome to the delete database script"
                                                    sleep 1
                                                    sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                    echo "Database and Role deleted"
                                                    sleep 1
                                                break 3
                                                ;;
                                                "Quit")
                                                break 2
                                                ;;
                            "Online")
                            PS3='What do you want to delete online ? '
                                         options=("Delete All" "Delete Tables " "Delete Database" "Quit")
                                         select opt in "${options[@]}"
                                            do
                                                case $opt in
                                                "Delete All")
                                                        echo "Welcome to the full suppression script"
                                                        sudo -u postgres psql -f sql/deleteTables.sql
                                                        echo "Tables deleted"
                                                        sleep 2
                                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                        echo "Database and Role deleted"
                                                       sleep 2
                                                    break 3
                                                    ;;
                                                "Delete Tables")
                                                    echo "Welcome to the supression table script "
                                                    sleep 2
                                                    sudo -u postgres psql -f sql/deleteTables.sql
                                                    echo "Tables deleted"
                                                    sleep 2
                                                break 3
                                                ;;
                                                "Delete Database")
                                                    echo "Welcome to the delete database script"
                                                   sleep 2
                                                    sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                    echo "Database and Role deleted"
                                                    sleep 2
                                                break 3
                                                 ;;
                                                "Quit")
                                                break 2
                                                ;;
                                              

                                            *) echo "invalid option $REPLY";;
                                              
                                            "Quit")
                                                break 2
                                                ;;

                                                esac
                                                done
                                                break 
                                                ;;

        
                "Revert")
                    echo "Not available yet"
                    break 
                    ;;

        "Quit")
        break 3
        ;;
        *) echo "invalid option $REPLY";;
        esac
    done
done
