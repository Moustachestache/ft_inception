NAME =		inception

all:	
		docker build --tag "nginxtest" srcs/nginx/
#docker compose srcs/docker-compose.yaml
		docker run --detach -p 8080:80 --name nginxtestCont nginxtest

$(NAME):	all
