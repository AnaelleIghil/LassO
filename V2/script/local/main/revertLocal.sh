#!/bin/bash


#    ____                     _     _                    _ _         ____            _           _    
#   |  _ \ _____   _____ _ __| |_  | |    ___   ___ __ _| | |_   _  |  _ \ _ __ ___ (_) ___  ___| |_  
#   | |_) / _ \ \ / / _ \ '__| __| | |   / _ \ / __/ _` | | | | | | | |_) | '__/ _ \| |/ _ \/ __| __| 
#   |  _ <  __/\ V /  __/ |  | |_  | |__| (_) | (_| (_| | | | |_| | |  __/| | | (_) | |  __/ (__| |_  
#   |_| \_\___| \_/ \___|_|   \__| |_____\___/ \___\__,_|_|_|\__, | |_|   |_|  \___// |\___|\___|\__| 
#                                                            |___/                |__/                

echo "Welcome to the revert Locally Script"


PS3='Please, choose what do you want to revert: '
options=("First Draft" "Event addition" "Quit")
select opt in "${options[@]}"

do

    case $opt in 
    "First Draft")
        echo "You choose to revert the first draft, please wait"
./script/local/revertScripts/

#./script/local/deleteScripts/deleteAll.sh
        ;;

    "Event addition")
        echo "You choose to revert before addition of event tables " 
./script/local/revertScripts/eventTables.sh
        ;;
        
        "Quit")
        break;;
        *) echo "invalid option $REPLY";;
    esac

done
