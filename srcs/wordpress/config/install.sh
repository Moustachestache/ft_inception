#!/bin/sh/

# it's all here
# https://make.wordpress.org/cli/handbook/guides/installing/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# edit php-fdm to be on port 9001
sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php83/php-fpm.d/www.conf

# php at /etc/php83/php.ini
# do nothing?
# https://make.wordpress.org/cli/handbook/guides/quick-start/

mkdir /var/www/wordpress/
cd /var/www/wordpress/

# check if files
wp core download
wpstatus=$?

# check if db
# !db already exists, create in mariadb so heh
#wp db create

_failcount=0
while :
do
    mysqladmin ping -hmariaDB -u$_MDBUSER -p$_MDBPASSWORD
    dbstatus=$?
    if [ $dbstatus ]
    then
        break
    fi
    echo $_failcount " waiting on mariadb to be initialised - status " $dbstatus
    _failcount=$(($_failcount + 1))
    sleep 1
    if [ "$_failcount" -gt 25 ]
    then
        echo "Oops! Cannot reach database. Exiting with error code 1."
        exit 1
    fi
done

# if first run, add  the post. otherwise no
echo "install status is " $wpstatus
if [ $wpstatus ]
then
    echo "running first time scripts"
    
    # setup config
    wp config create --dbname=$_MDBNAME --dbuser=$_MDBUSER --dbpass=$_MDBPASSWORD --dbhost=mariadb --allow-root

    wp core install --url=$_DNS/wordpress --title="inception, in ception" --admin_user=$_WPADMIN --admin_password=$_WPPASSWORD --admin_email=$_WPEMAIL --skip-email

    wp user create $_WPADMIN $_WPEMAIL --user_pass=$_WPPASSWORD --role="administrator" --display_name=$_WPADMIN --allow-root

    wp post create  --post_author=$_WPADMIN --post_title="recipe 4 pickles" --post_status=publish /wp_init_post.txt ;
fi

if [ ! -d /var/www/wordpress/wp-content/themes/twentytwentytwo/ ]
then
    wp theme install --activate https://downloads.wordpress.org/theme/twentytwentytwo.1.9.zip
fi

# start infinite run lol
php-fpm83 -FO