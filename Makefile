NAME =		inception
YAML =		srcs/compose.yaml

all:	
		@docker-compose -f $(YAML) build
		@docker-compose -f $(YAML) up --detach


$(NAME):	all

stop:
		@docker-compose -f $(YAML) stop

clear:
		@docker-compose -f $(YAML) rm
		@docker-compose -f $(YAML) images prune

nuke:
		docker system prune -af
