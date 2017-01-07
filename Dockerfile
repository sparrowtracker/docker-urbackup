FROM ubuntu:16.10
MAINTAINER Don Glenn <github@jaspercat.com> 

ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python-software-properties software-properties-common btrfs-tools
RUN add-apt-repository ppa:uroni/urbackup
RUN apt update
RUN apt install urbackup-server
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
