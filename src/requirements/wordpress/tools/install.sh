#!/bin/sh

if [ ! -d "/var/www/html/wordpress" ];
then       	
	mkdir -p /var/www/html/wordpress/
	cd /var/www/html/wordpress
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbhost=$DB_HOST --allow-root
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PWD --role=$WP_USER_ROLE --allow-root
	echo "WP Installation Done"

	wp config set WP_REDIS_HOST $WP_REDIS_HOST --add --allow-root
	wp config set WP_REDIS_PORT $WP_REDIS_PORT --add --allow-root
	wp config set WP_CACHE $WP_CACHE --add --allow-root
	wp config set WP_REDIS_PASSWORD $WP_REDIS_PWD --add --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
	echo "Redis Setting Up Done"
else
	echo "Wordpress is already installed."
fi
echo "Running FPM"
/usr/sbin/php-fpm7.4 -F