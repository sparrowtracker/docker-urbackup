FROM centos:centos7
MAINTAINER Don Glenn <github@jaspercat.com> 

ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm"

RUN apt-get install -y python-software-properties software-properties-common btrfs-tools
RUN apt-add-repository ppa:uroni/urbackup
RUN apt-get update
RUN apt-get install -fy sqlite3 libsqlite3-dev
RUN apt-get install -y urbackup-server
RUN mkdir -p /media/BACKUP/urbackup
RUN chmod -R 777 /media/BACKUP/
RUN apt-get clean

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623
VOLUME [ "/var/urbackup", "/usr/share/urbackup" ]
ENTRYPOINT ["/usr/sbin/start_urbackup_server"]
CMD ["--no_daemon"]
