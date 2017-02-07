FROM lsiobase/alpine.python.armhf:3.5
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"


# add local files
COPY root/ /

# ports and volumes
VOLUME /config /logs
EXPOSE 8181
