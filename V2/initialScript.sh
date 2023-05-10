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
    options=("Initial On Local" "Initial online" "Delete Local" "Delete Online" "Revert Local" "Revert Online" "Quit")
    select opt in "${options[@]}"
        do

            case $opt in 
                "Initial On Local")
                    echo "You choose local initialisation"
./script/local/main/initialLocal.sh
                break
            ;;

                "Initial online")
                    echo "You choose online installation"
./script/online/initialOnline.sh
                break
           ;;

                "Delete Local")
                    echo "You choose to delete local version"
./script/local/main/deleteLocal.sh
                break
            ;;

                "Delete Online")
                    echo "You choose to delete local version"
./script/online/deleteOnline.sh
            ;;
        
                "Revert Local")
                    echo "You choose to delete local version"
./script/local/revertLocal.sh
            ;;

                "Revert Online")
                     echo "You choose to delete local version"
./script/online/revertOnline.sh
                break
            ;;
            
        "Quit")
        break
        ;;
        *) echo "invalid option $REPLY";;

    esac

done


 