FROM		alpine:3.20-stable
WORKDIR		/nginx/

RUN			apt-get update \
			apt-get install nginx

COPY		config/nginx.conf nginx.config

COPY		data/site/ /www/nginx/

EXPOSE		8000
