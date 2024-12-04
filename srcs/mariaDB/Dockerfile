FROM	alpine:3.20

RUN		apk update && apk upgrade ;\
            apk add mariadb mariadb-client bash;\
        mkdir /var/mariaDB

COPY    ./config/startupScript.sh  /etc/my.cnf.d/startupScript.sh
COPY    ./config/databaseCommands.txt  /databaseCommands
COPY    ./config/mariaDBConfig.conf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE  3306

CMD     [ "bash", "/etc/my.cnf.d/startupScript.sh"]