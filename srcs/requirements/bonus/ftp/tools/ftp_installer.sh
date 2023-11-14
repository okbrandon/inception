# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp_installer.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/14 14:03:14 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/14 15:06:27 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Configuring ftp server
echo "[INFO] Configuring ftp server..."
mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Create ftp user
echo "[INFO] Creating ftp user..."
adduser --disabled-password $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

# Adding ftp user to ftp access
echo "[INFO] Adding ftp user to ftp access..."
echo "$FTP_USER" >> /etc/vsftpd.userlist

# Waiting for Wordpress to be installed
echo "[INFO] Waiting for Wordpress to be installed..."
while [ ! -f /var/www/html/wp-config.php ]; do
	sleep 5
done

# Small sleep to be sure
sleep 2

# Modifying permissions
echo "[INFO] Modifying permissions..."
mkdir -p /var/www/html
chown -R $FTP_USER:$FTP_USER /var/www/html

# Starting ftp server
echo "[INFO] Starting ftp server..."
vsftpd /etc/vsftpd/vsftpd.conf