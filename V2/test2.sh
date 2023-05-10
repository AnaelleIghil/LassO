PS3='Please, choose an option: '
while true; do
    clear
    options=("Initial" "Delete" "Revert" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Initial")
                PS3='Choose where you want to initiate: '
                sub_options=("Initial Locally" "Initial Online" "Quit")
                select sub_opt in "${sub_options[@]}"
                do
                    case $sub_opt in
                        "Initial Locally")
                            echo "Welcome to the Initiate Locally Script"
                            sleep 1
                            sudo -u postgres psql -f sql/init.sql
                            echo "Creation of the administrateur user and database"
                            sleep 1
                            touch .env 
                            echo "Creation of environnmental files"
                            sleep 1
                            echo "
                                    PGHOST=3003
                                    PGUSER=admin-LassO
                                    PGDATABASE=LassO
                                    PGPASSWORD=lasso
                                                    ">>.env 
                            echo ".env variables implemented"
                            sleep 1
                            psql -U  "admin-LassO" -d "LassO" -f sql/tables.sql
                            echo "creation of tables"
                            sleep 1
                            break
                            ;;
                        "Initial Online")
                            echo "Not available yet"
                            break
                            ;;
                        "Quit")
                            break 2
                            ;;
                        *) echo "Invalid option $REPLY";;
                    esac
                done
                ;;
            "Delete")
                PS3='Choose where you want to delete: '
                sub_options=("Locally" "Online" "Quit")
                select sub_opt in "${sub_options[@]}"
                do
                    case $sub_opt in
                        "Locally")
                            PS3='What do you want to delete locally? '
                            delete_options=("Delete All" "Delete Tables" "Delete Database" "Quit")
                            select delete_opt in "${delete_options[@]}"
                            do
                                case $delete_opt in
                                    "Delete All")
                                        echo "Welcome to the full suppression script"
                                        sleep 1
                                        sudo -u postgres psql -f sql/deleteTables.sql
                                        echo "Tables deleted"
                                        sleep 1
                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                        echo "Database and Role deleted"
                                        sleep 1
                                        break 3
                                        ;;
                                    "Delete Tables")
                                        echo "Welcome to the suppression table script"
                                        # Your code for deleting tables locally
                                        break 3
                                        ;;
                                    "Delete Database")
                                        echo "Welcome to the delete database script"
                                        sleep 1
                                        sudo -u postgres psql -f sql/deleteTables.sql
                                        echo "Tables deleted"
                                        sleep 1
                                        break 3
                                        ;;
                                    "Quit")
                                        break 4
                                        ;;
                                    *) echo "Invalid option $REPLY";;
                                esac
                            done
                            ;;
                        "Online")
                        PS3='What do you want to delete online ? '
                                         options=("Delete All" "Delete Tables " "Delete Database" "Quit")
                                         select opt in "${options[@]}"
                                            do
                                                case $opt in
                           "Delete All")
                                        echo "Welcome to the full suppression script"
                                        sleep 1
                                        sudo -u postgres psql -f sql/deleteTables.sql
                                        echo "Tables deleted"
                                        sleep 1
                                        sudo -u posqtgres psql -f sql/deleteDatabase.sql
                                        echo "Database and Role deleted"
                                        sleep 1
                                        break 3
                                        ;;
                                    "Delete Tables")
                                        echo "Welcome to the suppression table script"
                                        # Your code for deleting tables locally
                                        break 3
                                        ;;
                                    "Delete Database")
                                        echo "Welcome to the delete database script"
                                        sleep 1
                                        sudo -u postgres psql -f sql/deleteTables.sql
                                        echo "Tables deleted"
                                        sleep 1
                                        break 3
                                        ;;
                        "Quit")
                            break 2
                            ;;
                        *) echo "Invalid option $REPLY";;
                    esac
                done
                ;;
            "Revert")
                echo "Not available yet"
                ;;
            "Quit")
                break 2
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
done