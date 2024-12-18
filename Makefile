NAME =		inception
YAML =		srcs/compose.yaml

VOLUMES = ~/goinfre/www ~/goinfre/mariaDB

BASH_DEPENDENCIES = bash ./env_generate.sh;\
					mkdir --mode=775 --parents --verbose $(VOLUMES)

all:	build logs

$(NAME):	all

folders:	
		$(BASH_DEPENDENCIES)

build:	folders
		@docker-compose -f $(YAML) build

up:	
		@docker-compose -f $(YAML) up --detach

logs:	
		@docker-compose -f $(YAML) up

stop:
		@docker-compose -f $(YAML) stop

clear:	stop
		@docker-compose -f $(YAML) rm
		@docker-compose -f $(YAML) images prune

nuke:	clear
		docker system prune -af
		docker volume prune
		rm -ri $(VOLUMES)