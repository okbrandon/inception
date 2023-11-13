# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 17:36:14 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/13 17:33:12 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

# Update and install PHP8
RUN apk update && apk upgrade \
	&& apk add --no-cache \
		curl \
		wget \
		php8 \
		php8-fpm \
		php8-mysqli \
		php8-phar \
		php8-iconv \
		mariadb-client

# Creating needed dummies
RUN mkdir -p /var/www/html && mkdir -p /run/php
RUN adduser -S nginx && addgroup -S nginx

# Copying installer and configurations
COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools/wp_installer.sh /tmp/wp_installer.sh

# Making installer executable
RUN chmod +x /tmp/wp_installer.sh

# Exposing Wordpress port
EXPOSE 9000

# Working directory
WORKDIR /var/www/html

# Running Wordpress installer script
ENTRYPOINT ["sh", "/tmp/wp_installer.sh"]