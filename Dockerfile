# BitTorrent Sync
#
# VERSION               0.1

FROM ubuntu:15.04
MAINTAINER Bertrand Chazot <bertrand@bittorrent.com>
LABEL com.getsync.version="2.4.0"

ADD https://download-cdn.getsync.com/2.4.0/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/sbin rslsync && rm -f /tmp/sync.tgz

COPY rslsync.conf /etc/
COPY run_sync /opt/

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["/opt/run_sync"]
CMD ["--log", "--config", "/etc/rslsync.conf"]
