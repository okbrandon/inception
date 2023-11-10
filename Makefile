# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/09 14:25:34 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/09 14:36:58 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: start

start:
	@echo "Starting containers..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@make status

stop:
	@echo "Stopping containers..."
	@docker-compose -f ./srcs/docker-compose.yml down

status:
	@echo "Containers status..."
	@docker ps -a

prune:
	@echo "Pruning containers..."
	@docker system prune -a -f

.PHONE: all start stop