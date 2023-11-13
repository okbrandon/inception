# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp_installer.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsoubaig <bsoubaig@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 17:56:43 by bsoubaig          #+#    #+#              #
#    Updated: 2023/11/13 17:33:38 by bsoubaig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Check if the database is up
timeout=10
while ! mariadb -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e ";" ; do
	echo "[INFO] Waiting for database connection..."
	sleep 1
	timeout=$(($timeout - 1))
	if [ $timeout -eq 0 ]; then
		echo "[ERROR] Timeout while waiting for database connection."
		exit 1
	fi
done
echo "[INFO] Database connection established."

# Installing wp-cli...
echo "[INFO] Installing wp-cli..."
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Check if Wordpress is already installed
if [ ! -f /var/www/html/wp-config.php ]; then

	# Adjusting permissions
	echo "[INFO] Adjusting permissions..."
	chown -R nginx:nginx /var/www/html/
	find /var/www/html/ -type d -exec chmod 755 {} \;
	find /var/www/html/ -type f -exec chmod 644 {} \;

	# Downloading Wordpress
	echo "[INFO] Downloading Wordpress..."
	mkdir -p /var/www/html/
	wget -c https://wordpress.org/wordpress-6.4.tar.gz > /dev/null 2>&1
	tar -xvzf wordpress-6.4.tar.gz > /dev/null 2>&1
	mv wordpress/* /var/www/html/
	rm -rf wordpress
	rm -rf wordpress-6.4.tar.gz

	# Installing Wordpress using wp-cli
	echo "[INFO] Installing Wordpress using wp-cli..."
	wp config create --dbname=$WP_DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST \
		--dbcharset="utf8" \
		--dbprefix="wp_" \
		--allow-root
	wp core install --allow-root \
		--path='/var/www/html/' \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email
	wp user create --allow-root \
		--path='/var/www/html/' \
		$WP_CONTRIB_USER $WP_CONTRIB_EMAIL \
		--user_pass=$WP_CONTRIB_PASSWORD \
		--role=contributor

	# Adjusting permissions again
	echo "[INFO] Adjusting permissions..."
	chown -R nginx:nginx /var/www/html/*
	find /var/www/html/ -type d -exec chmod 755 {} \;
	find /var/www/html/ -type f -exec chmod 644 {} \;

fi

# Starting php-fpm
echo "[INFO] Starting php-fpm..."
php-fpm8 -F -R