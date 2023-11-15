# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    kuma_installer.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/15 15:53:55 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/15 17:33:30 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -f /app/uptime-kuma/server/server.js ]; then

	# Adjusting permissions
	echo "[INFO] Adjusting permissions..."
	chown -R root:root /app
	chmod -R 755 /app

	# Installing the application
	echo "[INFO] Installing Uptime-Kuma..."
	git clone https://github.com/louislam/uptime-kuma.git > /dev/null 2>&1
	cd /app/uptime-kuma && npm run setup > /dev/null 2>&1

	# Adjusting permissions
	echo "[INFO] Adjusting permissions..."
	chown -R root:root /app/uptime-kuma
	chmod -R 755 /app/uptime-kuma

fi

# Starting the application
echo "[INFO] Starting Uptime-Kuma..."
cd /app/uptime-kuma && node server/server.js