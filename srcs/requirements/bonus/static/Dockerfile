# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/16 18:29:15 by bsoubaig          #+#    #+#              #
#    Updated: 2024/02/19 09:58:23 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN apk update \
	&& apk add --no-cache nodejs npm git

RUN mkdir -p /app

WORKDIR /app

COPY ./conf/server.js /app/server.js
COPY ./conf/public /app/public
COPY ./tools/ws_installer.sh /tmp/ws_installer.sh

EXPOSE 4242

CMD ["/bin/sh", "/tmp/ws_installer.sh"]