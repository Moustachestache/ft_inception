FROM	alpine:3.20

RUN		apk update && apk upgrade ;\
            apk add --no-cache mariadb mariadb-client bash;\
        mkdir --mode=777 /etc/mariaDB /run/mysqld

COPY    ./config/startupScript.sh  /etc/startupScript.sh

COPY    ./config/databaseCommands.txt  /etc/databaseCommands

COPY    ./config/mariaDBConfig.conf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE  3306

CMD     ["bash", "/etc/startupScript.sh"]
