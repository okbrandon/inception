# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ws_installer.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/19 18:04:50 by bsoubaig          #+#    #+#              #
#    Updated: 2024/02/19 09:59:22 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "[INFO] Adjusting permissions..."
chmod -R 755 /app/public

# Start server
echo "[INFO] Starting server..."
node server.js