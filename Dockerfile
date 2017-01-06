FROM ubuntu:13.10
MAINTAINER Brian Findlay <bfindlay@comlink.net>

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-software-properties software-properties-common btrfs-tools
RUN apt-add-repository ppa:uroni/urbackup
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y urbackup-server
RUN mkdir -p /media/BACKUP/urbackup
RUN apt-get clean

EXPOSE 55413
EXPOSE 55414
EXPOSE 55415
EXPOSE 35623
VOLUME [ "/var/urbackup", "/usr/share/urbackup" ]
ENTRYPOINT ["/usr/sbin/start_urbackup_server"]
CMD ["--no_daemon"]
