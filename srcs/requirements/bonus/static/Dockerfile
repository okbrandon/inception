# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/16 18:29:15 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/16 20:09:27 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN apk update \
	&& apk add --no-cache nodejs npm

RUN mkdir -p /app

WORKDIR /app

COPY ./conf/public /app/public
COPY ./conf/server.js /app/server.js

EXPOSE 4242

CMD ["node", "server.js"]