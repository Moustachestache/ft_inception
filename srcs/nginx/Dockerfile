FROM		alpine:3.20
RUN			apk update && apk upgrade ;\
			apk add bash ;\
			apk add nginx

#COPY		config/config /etc/nginx/conf.d/inceptionStatic.conf

COPY		data/site/ /var/www/

ENTRYPOINT	["nginx", "-g", "daemon off;"]

EXPOSE		80