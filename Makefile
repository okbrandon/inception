# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 14:25:34 by bsoubaig          #+#    #+#              #
#    Updated: 2024/02/16 11:16:39 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Colors constants
PURPLE			= \033[38;5;141m
GREEN			= \033[38;5;46m
RED				= \033[0;31m
GREY			= \033[38;5;240m
RESET			= \033[0m
BOLD			= \033[1m
CLEAR			= \r\033[K

# Variables
NAME			= inception
CONTAINERS		= $(shell docker ps -a -q)
VOLUMES			= $(shell docker volume ls -q)
HOSTS			= $(shell cat /etc/hosts | grep -e 'bsoubaig.42.fr' | cut -f2- | tr -d '\n')
EXPECTED		= "bsoubaig.42.frstatus.bsoubaig.42.frstatic.bsoubaig.42.fr"

# Rules
all: start

init:
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/uptime-kuma
	@mkdir -p ~/data/mariadb

check-hosts:
	@if [ "$(HOSTS)" = "$(EXPECTED)" ]; then \
		printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: Hosts ${GREEN}already ${RESET}configured.\n${RESET}"; \
	else \
		printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: Hosts are ${RED}not configured${RESET}, please refer to GitHub.\n${RESET}"; \
	fi

start: check-hosts init
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@printf "${CLEAR}${RESET}${GREY}────────────────────────────────────────────────────────────────────────────\n${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: ${RED}${BOLD}${NAME} ${RESET}has cooked with ${GREEN}success${RESET}.${GREY}\n${RESET}${GREY}────────────────────────────────────────────────────────────────────────────\n${RESET}"
	@make status

stop:
ifneq ($(CONTAINERS),)
	@docker-compose -f ./srcs/docker-compose.yml down
	@printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: Containers ${GREEN}successfully ${RESET}stopped.\n${RESET}"
else
	@printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: There's ${RED}nothing ${RESET}to stop.\n${RESET}"
endif

status:
ifneq ($(CONTAINERS),)
	@printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: Displaying containers status...\n${RESET}"
	@docker ps -a
else
	@printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: There's ${RED}nothing ${RESET}to display.\n${RESET}"
endif

clean: stop
ifneq ($(VOLUMES),)
	@docker volume rm $$(docker volume ls -q) > /dev/null
	@docker system prune -a -f > /dev/null
	@clear
	@printf "${CLEAR}${RESET}${GREY}────────────────────────────────────────────────────────────────────────────\n${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: Project cleaned ${GREEN}successfully${RESET}.${GREY}\n${RESET}${GREY}────────────────────────────────────────────────────────────────────────────\n${RESET}"
else
	@printf "${CLEAR}${RESET}${GREEN}»${RESET} [${PURPLE}${BOLD}${NAME}${RESET}]: There's ${RED}nothing ${RESET}to clean.\n${RESET}"
endif

fclean: clean
	@rm -rf ~/data

.PHONE: all start stop status clean