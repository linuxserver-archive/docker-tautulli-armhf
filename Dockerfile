FROM lsiobase/alpine.python.armhf
MAINTAINER sparklyballs

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /logs
EXPOSE 8181
