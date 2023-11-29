#!/bin/sh

mysqld_safe &
while ! mysqladmin ping -h localhost;
do
    echo "waiting to start the db ..."
    sleep 1
done
echo "starting successed"
mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PWD';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE $DB_NAME;"
mysqladmin -u root shutdown
mysqld_safe