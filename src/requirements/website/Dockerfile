FROM debian:bullseye

RUN apt update \
    && apt upgrade \
    && apt install -y \
    php
RUN mkdir /website
COPY website /website
CMD ["php", "-S", "0.0.0.0:9100", "-t", "/website"]