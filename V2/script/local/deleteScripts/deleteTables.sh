#!/bin/bash

echo "Welcome to the supression table script "

sudo -u postgres psql -f sql/deleteTables.sql

echo "Tables deleted"
