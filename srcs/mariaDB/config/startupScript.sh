#!/bin/bash

echo "------- MARIADB.sh run as:" $(whoami);

## RUN ONLY IF NOT INSTALLED
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "------- Installing db as root"
    mysql_install_db --user=root --datadir=/etc/mariaDB --skip-test-db

    ## CREATE SQL INSTRUCTION TO RUN INTO mysqld
    ##  merci greg mdr
    echo "FLUSH PRIVILEGES;
    USE mysql;
    CREATE DATABASE $_MDBNAME;
    CREATE USER '$_MDBUSER' IDENTIFIED BY '$_MDBPASSWORD';
    GRANT ALL PRIVILEGES ON $_MDBNAME.* TO '$_MDBUSER';
    FLUSH PRIVILEGES;" > init.sql
    mysqld -uroot --bootstrap < init.sql
    rm -f init.sql
fi

mysqld --user=root --console