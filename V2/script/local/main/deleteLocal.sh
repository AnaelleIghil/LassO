#!/bin/bash

#    ____       _      _         _                    _   ____            _           _     ____            _       _    
#   |  _ \  ___| | ___| |_ ___  | |    ___   ___ __ _| | |  _ \ _ __ ___ (_) ___  ___| |_  / ___|  ___ _ __(_)_ __ | |_  
#   | | | |/ _ \ |/ _ \ __/ _ \ | |   / _ \ / __/ _` | | | |_) | '__/ _ \| |/ _ \/ __| __| \___ \ / __| '__| | '_ \| __| 
#   | |_| |  __/ |  __/ ||  __/ | |__| (_) | (_| (_| | | |  __/| | | (_) | |  __/ (__| |_   ___) | (__| |  | | |_) | |_  
#   |____/ \___|_|\___|\__\___| |_____\___/ \___\__,_|_| |_|   |_|  \___// |\___|\___|\__| |____/ \___|_|  |_| .__/ \__| 
#                                                                      |__/                                  |_|         

echo "Welcome to the delete Script "

PS3='Please, choose what do you want to delete: '
options=("Delete All" "Delete Tables" "Delete Database" "Quit")
select opt in "${options[@]}"

do

    case $opt in 
    "Delete All")
        echo "You choose to delete all, please wait"
./script/local/deleteScripts/deleteAll.sh
        ;;

    "Delete Tables")
        echo "You choose to delete tables " 
./script/local/deleteScripts/deleteTables.sh
        ;;
        
    "Delete Database")
        echo "You choose to delete Database"
./script/local/deleteScripts/deleteDatabase.sh
        ;;
        
        "Quit")
        break
        ;;
        *) echo "invalid option $REPLY";;
    esac

done