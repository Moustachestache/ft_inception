NAME =		inception
YAML =		srcs/compose.yaml

VOLUME_DIRECTORY = ~/goinfre

BASH_DEPENDENCIES = mkdir $(VOLUME_DIRECTORY) ; mkdir $(VOLUME_DIRECTORY)/www ; mkdir $(VOLUME_DIRECTORY)/mariaDB ;\
	chmod 777 $(VOLUME_DIRECTORY) $(VOLUME_DIRECTORY)/www $(VOLUME_DIRECTORY)/mariaDB

all:	build up

$(NAME):	all

folders:	
		$(BASH_DEPENDENCIES)

build:	
		@docker-compose -f $(YAML) build

up:	
		@docker-compose -f $(YAML) up --detach

stop:
		@docker-compose -f $(YAML) stop

clear:	stop
		@docker-compose -f $(YAML) rm
		@docker-compose -f $(YAML) images prune

nuke:	clear
		docker system prune -af
		docker volume prune
		rm -ri ~/goinfre/www/ ~/goinfre/mariaDB/