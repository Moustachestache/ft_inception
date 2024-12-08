#!/bin/bash

echo "------- MARIADB.sh run as:" $(whoami);

## RUN ONLY IF NOT INSTALLED
if [ /etc/mysql/ ]; then
    echo "------- Installing db as" $(whoami);
    mysql_install_db --user=root --datadir=/etc/mariaDB --skip-test-db --auth-root-authentication-method=normal
fi


## RUN ONLY IF NO SOCKET
echo "------- running db for the first time as " $(whoami);
nohup mysqld_safe --user=root >> /var/logs

while [ ! -S "/run/mysqld/mysqld.sock" ]; do
    echo "holding until socket initialization ..."
    sleep 1
done

## RUN ONLY IF NOT PROPERLY SETUP (NO USER FOR $MDBNAME)
if [ $(mysql -uroot -e "SHOW DATABASES" | grep "$_MDBNAME" | wc -l) == 0 ]; then

    echo "------- create db CMD"
    mysqladmin -uroot create $_MDBNAME

    echo "------- create user nd pw CMD"
    mysql -uroot -e "CREATE USER '$_MDBUSER' IDENTIFIED BY '$_MDBPASSWORD';"

    echo "------- grant privileges CMD"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON $_MDBNAME.* TO '$_MDBUSER';"

    echo "------- Peeping the socket:";
    ls /run/mysqld/
fi

echo "------- shutting down"
mysqladmin shutdown

mysqld --user=root --console