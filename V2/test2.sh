")
                        PS3='Choose an option : '
                        options=("Initial Locally" "Initial Online" "Quit")
                        select opt in "${options[@]}"
                            do 
                                case $opt in 
                                "Initial Locally")
                                echo "Welcome to the Initiate Locally Script "
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