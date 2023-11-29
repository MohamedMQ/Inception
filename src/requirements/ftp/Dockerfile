FROM debian:bullseye

RUN apt update -y \
    && apt install -y \
    vsftpd \
    openssl
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/script.sh /
RUN chmod +x /script.sh
EXPOSE 21
CMD [ "/script.sh" ]