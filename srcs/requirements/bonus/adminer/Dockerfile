# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/15 10:27:53 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/15 11:48:04 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

# Upgrading and installing packages
RUN apk update && apk upgrade \
	&& apk add --no-cache \
		curl \
		wget \
		php8 \
		php8-session \
		php8-fpm \
		php8-mysqli \
		php8-phar \
		php8-iconv

# Creating html folder
RUN mkdir -p /var/www/html

# Installing adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php \
	&& mv adminer-4.8.1.php /var/www/html/index.php \
	&& chown -R root:root /var/www/html \
	&& chmod -R 644 /var/www/html/index.php

# Expose port
EXPOSE 8080

# Run php server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]