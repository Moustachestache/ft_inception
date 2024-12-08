#!/bin/sh/

# it's all here
# https://make.wordpress.org/cli/handbook/guides/installing/

chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# php at /etc/php83/php.ini
# do nothing?
# https://make.wordpress.org/cli/handbook/guides/quick-start/

cd /var/www/

# check if files
wp core download

# check if config

wp config create --dbname=$_MDBNAME --dbuser=$_MDBUSER --dbpass=$_MDBPASSWORD --dbhost=mariadb --allow-root


# check if db
wp db create

# chek if installed
wp core install