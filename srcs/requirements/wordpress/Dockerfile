# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 17:36:14 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/10 19:52:32 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
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

RUN mkdir -p /var/www/html && mkdir -p /run/php
RUN adduser -S nginx && addgroup -S nginx

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./conf/wp-config.php /tmp/wp-config.php
COPY ./tools/wp_installer.sh /tmp/wp_installer.sh

RUN chmod +x /tmp/wp_installer.sh

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT ["sh", "/tmp/wp_installer.sh"]