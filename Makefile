NAME =		inception

all:	
		docker build --tag "nginxtest" srcs/nginx/
#docker compose srcs/docker-compose.yaml
		docker run --detach -p 80:80 --name nginxtestCont nginxtest

$(NAME):	all
