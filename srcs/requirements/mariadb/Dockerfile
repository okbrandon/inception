# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:03:03 by bsoubaig          #+#    #+#              #
#    Updated: 2024/02/16 11:32:54 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

# Update and install packages
RUN apk update \
	&& apk add --no-cache \
		mariadb \
		mariadb-client

# Copy files
COPY ./tools/db_installer.sh /tmp/db_installer.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf
RUN chmod +x /tmp/db_installer.sh

# Expose ports
EXPOSE 3306

# Run script
CMD ["sh", "/tmp/db_installer.sh"]