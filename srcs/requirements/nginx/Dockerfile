# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:30:39 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/08 16:30:40 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

# Updating and installing dependencies
RUN apk update \
 && apk add --no-cache nginx openssl

# Creating needed directories
RUN mkdir -p /run/nginx /etc/nginx/ssl /var/www/html

# Creating our certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/bsoubaig-selfsigned.key \
	-out /etc/nginx/ssl/bsoubaig-selfsigned.crt \
	-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=bsoubaig/CN=bsoubaig.42.fr"

# Modifying permissions to be sure
RUN chmod -R 755 /var/www/html

# Copying our configuration
COPY ./conf/nginx.conf /etc/nginx/

# Allowing needed port
EXPOSE 443

# Running NGINX in background
CMD ["nginx", "-g", "daemon off;"]
