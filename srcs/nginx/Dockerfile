FROM		alpine:3.20
RUN			apk update && apk upgrade --no-cache ;\
			apk add nginx

#COPY		config/config /etc/nginx/conf.d/inceptionStatic.conf

COPY		data/site/ /var/www/

COPY		config/dockerEntrypoint.sh dockerEntrypoint.sh

ENTRYPOINT	["sh", "dockerEntrypoint.sh"]

EXPOSE		80