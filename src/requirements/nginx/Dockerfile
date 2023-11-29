FROM debian:bullseye

RUN apt update \
    && apt install -y \
    nginx \
    openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.crt -subj "/C=MO/ST=Khouribga/L=Khouribga/O=42/CN=mmaqbour.42.fr"
COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]