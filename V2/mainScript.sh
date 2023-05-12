PS3='Please, choose an option: '
while true; do 
    clear
    options=("Initial" "Delete" "Revert" "Quit")
    select opt in "${options[@]}"
        do
            case $opt in 
                "Initial")
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
                                sleep 1
                                break 
                            ;;
                            "Quit")
                            break 
                            ;;
                            *) echo "invalid option $REPLY";;
                        esac
                    done 
                    break 1
                ;;

                "Delete") 
                        options=("Delete Locally" "Delete Online" "Quit")
                        select opt in "${options[@]}"
                            do 
                                case $opt in 
                                "Delete Locally")
                                    
                                        options=("Delete All" "Delete Tables" "Delete Database" "Quit")
                                        select opt in "${options[@]}"
                                        do
                                            case $opt in 
                                            "Delete All")
                                                echo "You choose to delete all, please wait"
                                                sleep 1
                                                sudo -u postgres psql -f sql/deleteTables.sql
                                                echo "Tables deleted"
                                                sleep 1
                                                sudo -u postgres psql -f sql/deleteDatabase.sql
                                                echo "Database and Role deleted"
                                                sleep 1
                                        break
                                            ;;
                                            "Delete Tables")
                                                echo "You choose to delete tables " 
                                        sleep 1
                                        sudo -u postgres psql -f sql/deleteTables.sql
                                        echo "Tables deleted"
                                        sleep 1
                                        break 
                                                ;;

                                            "Delete Database")
                                                echo "You choose to delete Database"
                                        sleep 1
                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                        echo "Database and Role deleted"
                                        sleep 1
                                        break 
                                                ;;

                                                "Quit")
                                                break
                                                ;;
                                                *) echo "invalid option $REPLY";;
                                            esac
                                        done
                                break 2
                                ;;

                            "Delete Online")
                                echo "Not available yet"
                                sleep 1
                                break 
                            ;;
                            "Quit")
                            break 
                            ;;
                            *) echo "invalid option $REPLY";;
                        esac
                    done 
                    break 1
               ;;

                "Revert")
                echo "revert loop on"
                sleep 1
                break 
                ;;

                "Quit")
    break 2
;;

         *) echo "invalid option $REPLY";;
        esac
    done
done