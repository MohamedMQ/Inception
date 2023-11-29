#!/bin/bash

sed -i "s|bind 127.0.0.1 ::1|bind 0.0.0.0|g" /etc/redis/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 250MB|g" /etc/redis/redis.conf
sed -i "s|# requirepass foobared|requirepass $WP_REDIS_PWD|g" /etc/redis/redis.conf
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
sed -i 's|daemonize yes|daemonize no|g' /etc/redis/redis.conf
redis-server /etc/redis/redis.conf --daemonize no