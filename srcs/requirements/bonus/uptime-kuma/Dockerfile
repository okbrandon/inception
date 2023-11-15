# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/15 15:39:43 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/15 20:44:31 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

# Updating and installing packages
RUN apk update \
	&& apk add --no-cache nodejs npm git \
	&& npm install pm2 -g \
	&& pm2 install pm2-logrotate

# Creating directories
RUN mkdir -p /app

# Copying files
COPY ./tools/kuma_installer.sh /tmp/kuma_installer.sh
RUN chmod 755 /tmp/kuma_installer.sh

# Expose ports
EXPOSE 3001

# Setting workdir
WORKDIR /app

# Installing Uptime-Kuma
CMD ["/bin/sh", "/tmp/kuma_installer.sh"]