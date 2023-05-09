#!/bin/bash

#    ___       _ _   _       _   ____            _           _     _                    _ _       
#   |_ _|_ __ (_) |_(_) __ _| | |  _ \ _ __ ___ (_) ___  ___| |_  | |    ___   ___ __ _| | |_   _ 
#    | || '_ \| | __| |/ _` | | | |_) | '__/ _ \| |/ _ \/ __| __| | |   / _ \ / __/ _` | | | | | |
#    | || | | | | |_| | (_| | | |  __/| | | (_) | |  __/ (__| |_  | |__| (_) | (_| (_| | | | |_| |
#   |___|_| |_|_|\__|_|\__,_|_| |_|   |_|  \___// |\___|\___|\__| |_____\___/ \___\__,_|_|_|\__, |
#                                             |__/                                          |___/ 

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
