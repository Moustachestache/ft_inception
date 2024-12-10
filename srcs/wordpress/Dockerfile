FROM		alpine:3.20

RUN			apk update && apk upgrade ;\
                apk add bash mariadb-client curl \
                php83 php83-phar php83-curl php83-mysqli php83-fpm

COPY        ./config/install.sh install.sh

EXPOSE      9000 9001

CMD [ "bash", "./install.sh" ]