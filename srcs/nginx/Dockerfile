FROM		alpine:3.20
RUN			apk update && apk upgrade ;\
			apk add bash ;\
			apk add nginx

COPY		config/config /etc/nginx/http.d/default.conf

COPY		data/site/ /var/www/

CMD			["nginx", "-g", "daemon off;"]

EXPOSE		8080