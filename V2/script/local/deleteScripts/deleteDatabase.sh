#!/bin/bash

echo "Welcome to the delete database script"

sudo -u posqtgres psql -f sql/deleteDatabase.sql

echo "Database and Role deleted"