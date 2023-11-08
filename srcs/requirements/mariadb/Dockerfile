# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:03:03 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/08 16:28:01 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

RUN apk update && apk add --no-cache mariadb mariadb-client openrc

COPY ./tools/db_installer.sh /tmp/db_installer.sh
RUN chmod +x /tmp/db_installer.sh

CMD ["sh", "/tmp/db_installer.sh"]