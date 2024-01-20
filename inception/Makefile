# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alaaouam <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/16 15:22:28 by alaaouam          #+#    #+#              #
#    Updated: 2023/09/24 17:46:26 by alaaouam         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# COLOURS #

GREEN = \033[0:32m
COLOR_OFF = \033[0m

# VARIABLES #

DOCKER_COMPOSE = ./srcs/docker-compose.yml
DATA_PATH = /home/alaaouam/data
WORDPRESS_VOLUME_PATH = /home/alaaouam/data/wordpress
MARIADB_VOLUME_PATH = /home/alaaouam/data/mariadb

# RULES #

all: build

build:
	@echo "$(GREEN)<+> BUILDING CONTAINERS <+> $(COLOR_OFF)"
	@mkdir -p $(DATA_PATH)
	@mkdir -p $(WORDPRESS_VOLUME_PATH)
	@mkdir -p $(MARIADB_VOLUME_PATH)
	@sudo docker-compose -f $(DOCKER_COMPOSE) up -d --build

up:
	@echo "$(GREEN)<+> STARTING CONTAINERS <+> $(COLOR_OFF)"
	@sudo docker-compose -f $(DOCKER_COMPOSE) up -d

stop:
	@echo "$(GREEN)<+> STOPPING CONTAINERS <+> $(COLOR_OFF)"
	@sudo docker-compose -f $(DOCKER_COMPOSE) stop

down: stop
	@echo "$(GREEN)<+> DELETING BUILD <+> $(COLOR_OFF)"
	@sudo docker-compose -f $(DOCKER_COMPOSE) down -v
	
remove_data:
	@echo "$(GREEN)<+> REMOVING DATA <+> $(COLOR_OFF)"
	@sudo rm -rf $(DATA_PATH)

destroy: down remove_data
	@echo "$(GREEN)<+> REMOVING ALL IMAGES <+> $(COLOR_OFF)"
	@sudo docker system prune -af

re: destroy build

.PHONY: all build up stop remove_data down destroy re