# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    db_installer.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 16:02:58 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/08 16:47:22 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Assign the ownership of the directory to the MySQL user and group
chown -R mysql:mysql /var/lib/mysql

# Initialize MySQL database
mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

# Start MySQL in the background
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &

# Wait until the MySQL server is available
while ! /usr/bin/mysqladmin ping --silent; do
	sleep 1
done

# Cleaning the database
mysql -u root -e "DROP DATABASE IF EXISTS test;"
mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -e "DELETE FROM mysql.db WHERE Db='test';"

# Inserting the data into the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'bsoubaig'@'%' IDENTIFIED BY 'CHANGE_THIS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'bsoubaig'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

# Shutdown MySQL in the background
mysqladmin shutdown

# Start MySQL in the foreground
/usr/bin/mysqld_safe --datadir=/var/lib/mysql