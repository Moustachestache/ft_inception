#!/bin/bash

mysql_install_db --user=root --datadir=/etc/mariaDB --skip-test-db;

mysqld_safe;

mysqladmin -uroot create $_MDBNAME;
#CREATE DATABASE your_database_name;

mysql -uroot -e "CREATE USER '$_MDBUSER' IDENTIFIED BY '$_MDBPASSWORD';";

mysql -uroot -e "GRANT ALL PRIVILEGES ON $_MDBNAME.* TO '$_MDBUSER';";

# mysqladmin -uroot create $_MDBNAME
# mysqladmin -uroot -e 'IN DATABASE $_MDBNAME'

mysqld --user=root;