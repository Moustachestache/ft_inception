FROM		alpine:3.20


# https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions
RUN			apk update && apk upgrade ;\
                apk add bash mariadb-client curl \
                php83 php83-phar php83-curl php83-mysqli php83-fpm php83-iconv

COPY        ./config/install.sh install.sh
COPY        ./config/wp_init_post.txt wp_init_post.txt

EXPOSE      9000 9001

CMD [ "bash", "./install.sh" ]