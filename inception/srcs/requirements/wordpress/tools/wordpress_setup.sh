#!/bin/bash

# Change working directory to the wordpress path:
cd /var/www/wordpress

# Sleep so MariaDB has more than enough time to lauch correctly:
sleep 10

# Check if wp-config.php exist:
if [ ! -e /var/www/wordpress/wd-config.php ]; then
	wp config create --allow-root \
									  --dbname=$SQL_DATABASE \
									  --dbuser=$SQL_USER \
									  --dbpass=$SQL_PASSWORD \
									  --dbhost=mariadb:3306
fi

# Core install for wordpress:
wp core install --url="$DOMAIN_NAME" \
							  --title="$SITE_TITLE" \
							  --admin_user="$ADMIN_USER" \
							  --admin_password="$ADMIN_PASSWORD" \
							  --admin_email="$ADMIN_EMAIL" \
							  --allow-root

# Create second user:
wp user create --allow-root $USER_NAME $USER_EMAIL \
							   --role=editor \
							   --user_pass=$USER_PASSWORD \

# To avoid possible problems, checks if the directory '/run/php' exists and if it doesn't is created:
if [ ! -d /run/php ]; then
	mkdir /run/php
fi

# Finally run php-fpm:
/usr/sbin/php-fpm7.3 -F