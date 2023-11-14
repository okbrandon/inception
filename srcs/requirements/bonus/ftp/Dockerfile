# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/14 13:47:47 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/14 14:19:12 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

RUN apk update && apk add --no-cache vsftpd

COPY ./conf/vsftpd.conf /tmp/vsftpd.conf
COPY ./tools/ftp_installer.sh /tmp/ftp_installer.sh

CMD ["/bin/sh", "/tmp/ftp_installer.sh"]