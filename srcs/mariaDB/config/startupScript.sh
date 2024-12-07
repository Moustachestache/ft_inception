#!/bin/bash

echo "------- MARIADB.sh run as:" $(whoami);

mysql_install_db --user=root --datadir=/etc/mariaDB --skip-test-db --auth-root-authentication-method=normal


mysqld_safe --user=root &

while [ ! -S "/run/mysqld/mysqld.sock" ]; do
    echo "hihi hoho"
    sleep 1
done

echo "------- Peeping the socket:";
ls /run/mysqld/

echo "------- check"
mysql -uroot -e "SHOW DATABASES"

echo "------- create db CMD"
mysqladmin -uroot create $_MDBNAME
#CREATE DATABASE your_database_name;

echo "------- create user nd pw CMD"
mysql -uroot -e "CREATE USER '$_MDBUSER' IDENTIFIED BY '$_MDBPASSWORD';"

echo "------- grant privileges CMD"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $_MDBNAME.* TO '$_MDBUSER';"

echo "------- Peeping the socket:";
ls /run/mysqld/
echo "END"