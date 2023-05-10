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
                        while true; do
                        clear
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
                                break
                                ;;

                            "Initial Online")
                                echo "Not available yet"
                                break
                            ;;
                            "Quit")
                            break;;
                            *) echo "invalid option $REPLY";;
                        esac
                        break
                    done
                done
                break 
                ;;
                
                "Delete")
                    PS3='Choose where you want to delete:  '
                        while true; do
                        clear
                        options=("Locally" "Online" "Quit")
                        select opt in "${options[@]}"
                            do 
                                case $opt in 
                                "Locally")
                                    PS3='What do you want to delete locally ? '
                                        while true; do
                                        clear
                                         options=("Delete All" "Delete Tables " "Delete Database" "Quit")
                                         select opt in "${options[@]}"
                                            do
                                                case $opt in
                                                "Delete All")
                                                        echo "Welcome to the full suppression script"
                                                        sudo -u postgres psql -f sql/deleteTables.sql
                                                        echo "Tables deleted"
                                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                        echo "Database and Role deleted"
                                                    break
                                                    ;;
                                                "Delete Tables")
                                                    echo "Welcome to the supression table script "
                                                    sudo -u postgres psql -f sql/deleteTables.sql
                                                    echo "Tables deleted"
                                                break
                                                ;;
                                                "Delete Database")
                                                    echo "Welcome to the delete database script"
                                                    sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                    echo "Database and Role deleted"
                                                break
                                                ;;
                                                "Quit")
                                                break 2
                                                ;;
                                            *) echo "invalid option $REPLY";;
                                        esac
                                    done
                                done
                            break;;
                            "Online")
                            PS3='What do you want to delete online ? '
                                        while true; do
                                        clear
                                         options=("Delete All" "Delete Tables " "Delete Database" "Quit")
                                         select opt in "${options[@]}"
                                            do
                                                case $opt in
                                                "Delete All")
                                                        echo "Welcome to the full suppression script"
                                                        sudo -u postgres psql -f sql/deleteTables.sql
                                                        echo "Tables deleted"
                                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                        echo "Database and Role deleted"
                                                    break
                                                    ;;
                                                "Delete Tables")
                                                    echo "Welcome to the supression table script "
                                                    sudo -u postgres psql -f sql/deleteTables.sql
                                                    echo "Tables deleted"
                                                break
                                                ;;
                                                "Delete Database")
                                                    echo "Welcome to the delete database script"
                                                    sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                                    echo "Database and Role deleted"
                                                break
                                                ;;
                                                "Quit")
                                                break 2
                                                ;;
                                            *) echo "invalid option $REPLY";;
                                        esac
                                    done
                                done
                            break;;
                "Quit")
                    break 2
                    ;;
                *) echo "invalid option $REPLY";;
            esac
            done 
            done
            break
            ;;
        
                "Revert")
                    echo "Not available yet"
                    break
                    ;;

        "Quit")
        break 2
        ;;
        *) echo "invalid option $REPLY";;

    esac
done
done


 