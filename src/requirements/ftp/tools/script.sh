#!/bin/bash

service vsftpd start
adduser --gecos "" --disabled-password "$FTP_USER"
echo "$FTP_USER:$FTP_PWD" | chpasswd
usermod -a -G ftp "$FTP_USER"
echo "FTP user '$FTP_USER' created."
service vsftpd stop
/usr/sbin/vsftpd /etc/vsftpd.conf