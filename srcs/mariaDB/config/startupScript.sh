#!/bin/bash


$_MDBUSER="mjochum"
$_MDBPASSWORD="mjochum"
$_MDBNAME="mjochum"

mysql_install_db --user=root --datadir=/etc/mariaDB --skip-test-db
mysqld_safe
mysqld --user=root

echo "SLIP"
sleep 100000