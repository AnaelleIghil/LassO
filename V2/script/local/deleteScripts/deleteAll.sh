#!/bin/bash

echo "Welcome to the full suppression script"

sudo -u postgres psql -f sql/deleteTables.sql

echo "Tables deleted"

sudo -u postgres psql -f sql/deleteDatabase.sql

echo "Database and Role deleted"