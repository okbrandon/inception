# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    rd_installer.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 16:10:40 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/13 17:21:42 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Configuring redis
echo "[INFO] Configuring redis..."
sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/g" /etc/redis.conf
sed -i "s/.*maxmemory <bytes>.*/maxmemory 512mb/g" /etc/redis.conf
sed -i "s/.*maxmemory-policy noeviction.*/maxmemory-policy allkeys-lfu/g" /etc/redis.conf

# Starting redis
echo "[INFO] Starting redis..."
redis-server /etc/redis.conf --protected-mode no