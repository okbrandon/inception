# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ws_installer.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/19 18:04:50 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/19 18:12:45 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -d "/app/public" ]; then
	
	mkdir /app/public

	# Scrapping website
	echo "[INFO] Scrapping website..."
	git clone https://github.com/okbrandon/brandoncodes.dev.git /app/public > /dev/null 2>&1
	chmod -R 755 /app/public
	
fi

# Start server
echo "[INFO] Starting server..."
node server.js