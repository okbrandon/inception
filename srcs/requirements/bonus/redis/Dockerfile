# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/13 14:49:35 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/13 16:47:48 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

# Update and install Redis
RUN apk update && apk add --no-cache redis

# Copying redis configurator script
COPY ./tools/rd_installer.sh /tmp/rd_installer.sh
RUN chmod +x /tmp/rd_installer.sh

# Exposing Redis port
EXPOSE 6379

# Running Redis configurator script
CMD ["/bin/sh", "/tmp/rd_installer.sh"]