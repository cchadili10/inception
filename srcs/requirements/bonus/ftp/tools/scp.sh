#!/bin/bash
password=$(cat /run/secrets/ftpPass)

if ! id "$FTPUSER" &>/dev/null; then
    useradd -m "$FTPUSER"
fi

echo "$FTPUSER:$password" | chpasswd
chown -R "$FTPUSER":"$FTPUSER" /home/ftpuser


exec /usr/sbin/vsftpd /etc/vsftpd.conf