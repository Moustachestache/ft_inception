#!/bin/bash

if [ -e ./.env ]
then
    echo ".env is present, skipping script"
    exit 0;
fi

default="UNSET_VARIABLE"

# GLOBAL BULLSHIT
_DDNS="$default"

# WORDPRESS SETUP VARIABLES
_WADMIN="$default"
_WADMINPASS="$default"
_WADMINEMAIL="$default"

# WORDPRESS USER VARIABLES
_WUSER="$default"
_WPASS="$default"
_WMAIL="$default"

# DB VARIABLES
_DBADMIN="$default"
_DBPASS="$default"
_DBNAME="$default"

echo ".-------------------------------------------------------.";
echo "|                                      ___ _ ____   __  |";
echo "|                                     / _ \ '_ \ \ / /  |";
echo "|   _                           _    |  __/ | | \ V /   |";
echo "|  (_) ___ _ __   ___ _ __ __ _| |_ (_)___|_|_|_|\_/___ |";
echo "|  | |/ _ \ '_ \ / _ \ '__/ _\` | __/ _\` | | | | '__/ _ \|";
echo "|  | |  __/ | | |  __/ | | (_| | || (_| | |_| | | |  __/|";
echo "| _/ |\___|_| |_|\___|_|  \__,_|\__\__,_|\__,_|_|  \___||";
echo "||__/                                                   |";
echo "'-------------------------------------------------------'";

# GLOBAL BULLSHIT
echo "# input your domain name (should be $USER.42.fr)"
read -e _DDNS


# WORDPRESS SETUP VARIABLES
echo "# WORDPRESS VARIABLES"
echo "##input wordpress superuser name"
read -e _WADMIN
echo "## input wordpress superuser password"
read -e _WADMINPASS
echo "## input wordpress superuser email"
read -e _WADMINEMAIL

# WORDPRESS USER VARIABLES
echo "# WORDPRESS USER VARIABLE"
echo "# !! THIS ALLOWS YOU TO LOGIN AND USE THE WEBSITE !!"
echo "## input wordpress user login"
read -e _WUSER
echo "## input wordpress user password"
read -e _WPASS
echo "## input wordpress user email"
read -e _WMAIL

# DB VARIABLES
echo "# DATABASE VARIABLE"
echo "# THIS ALLOWS THE DATABASE TO BE SUPERUSER'D AND ADMINISTERED"
echo "## input database superuser login"
read -e _DBADMIN
echo "## input database superuser password"
read -e _DBPASS
echo "## input database superuser email"
read -e _DBNAME

echo "GENERATING .ENV in"; PWD

echo "#!/bin/bash

# general
_DNS="$_DDNS"

# mariaDB - _MDB
_MDBUSER="$_DBADMIN"
_MDBPASSWORD="$_DBPASS"
_MDBNAME="$_DBNAME"

# wordpress - _WP
_WPADMIN="$_WADMIN"
_WPPASSWORD="$_WADMINPASS"
_WPEMAIL="$_WADMINEMAIL"

# user info
_USER="$_WUSER"
_PASSWORD="$_WPASS"
_USEREMAIL="$_WMAIL"
" > .env