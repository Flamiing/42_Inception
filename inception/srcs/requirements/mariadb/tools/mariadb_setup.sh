#!/bin/bash

# Start the service MySQL:
service mysql start

# Create the table if it does not exist already:
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create a user that can manipulate the table if it does not exist already:
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grants all rights to the new user created to manipulate the database
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Change the password of the root:
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Flushes so that it refreshes and MYSQL takes the changes into account:
mysql -e "FLUSH PRIVILEGES;"

# Restarts MYSQL for the changes to take effect:
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe