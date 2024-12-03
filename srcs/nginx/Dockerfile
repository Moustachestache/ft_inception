FROM		alpine:3.20
RUN			apk update && apk upgrade ;\
			mkdir "/etc/nginx/ssl/" ;\
			mkdir "/logs/" ;\
			apk add --no-cache \
				bash \
				nginx \
				openssl;\
			mkdir -p /etc/nginx/ssl ; \
			openssl req \
				-newkey rsa:4096 \
				-x509 \
				-sha256 \
				-days 365 \
				-nodes \
				-out /etc/nginx/ssl/ssl.crt \
				-keyout /etc/nginx/ssl/ssl.key \
				-subj "/C=FR/ST=PO/L=Perpignan/O=42/CN=mjochum.42.fr/UID=mjochum"

EXPOSE		443

COPY		config/config	/etc/nginx/http.d/default.conf

COPY		www/		/var/www/

CMD			["nginx", "-e", "/logs/nginxlog.txt", "-g", "daemon off;"]