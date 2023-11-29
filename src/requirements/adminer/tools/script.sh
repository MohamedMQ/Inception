#!/bin/sh

mkdir -p /var/www/html
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
cd /var/www/html
rm -rf index.html
chmod +x /var/www/html/adminer.php
php -S 0.0.0.0:9150 -t /var/www/html