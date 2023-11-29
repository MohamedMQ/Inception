FROM debian:bullseye

RUN apt update \
	&& apt install -y \
	php \
	php-fpm \
	php-mysql \
	php-cgi \
	curl \
	redis-tools
RUN apt install default-mysql-client -y
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php
COPY ./tools/install.sh .
RUN chmod +x ./install.sh
EXPOSE 9000
CMD [ "./install.sh" ]