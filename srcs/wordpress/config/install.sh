#!/bin/sh/

# it's all here
# https://make.wordpress.org/cli/handbook/guides/installing/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# edit php-fdm to be on port 9001
sed -i 's/listen = 127.0.0.1:9000/listen = 9001/g' /etc/php82/php-fpm.d/www.conf

# php at /etc/php83/php.ini
# do nothing?
# https://make.wordpress.org/cli/handbook/guides/quick-start/

cd /var/www/

# check if files
wp core download

# check if config

wp config create --dbname=$_MDBNAME --dbuser=$_MDBUSER --dbpass=$_MDBPASSWORD --dbhost=mariadb --allow-root

# check if db
# !db already exists, create in mariadb so heh
#wp db create

# chek if installed
wp core install --url=localhost --title="inception, in ception" --admin_user=$_WPADMIN --admin_password=$_WPPASSWORD --admin_email=$_WPEMAIL --skip-email 

# start infinite run lol
php-fpm83 -FO