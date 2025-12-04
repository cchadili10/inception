FROM debian:12


RUN apt update && apt install -y vsftpd ftp

RUN mkdir -p /home/ftpuser

RUN mkdir -p /var/run/vsftpd/empty
RUN chmod 755 /var/run/vsftpd/empty

RUN sed -i 's#listen=NO#listen=YES#' /etc/vsftpd.conf
RUN sed -i 's#listen_ipv6=YES#listen_ipv6=NO#' /etc/vsftpd.conf

RUN tee -a /etc/vsftpd.conf <<EOF
pasv_min_port=21000
pasv_max_port=21010
pasv_enable=YES
write_enable=YES

chroot_local_user=YES
allow_writeable_chroot=YES

seccomp_sandbox=NO

EOF
COPY tools/scp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/scp.sh

EXPOSE 21 21000-21010

ENTRYPOINT ["scp.sh"]