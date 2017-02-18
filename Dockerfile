FROM nicjo814/docker-baseimage-xenial-x

# Environment settings
ENV HOME="/config"
ENV APTLIST=" \
	kodi"

# install packages
RUN \
	apt-get update -q && \
	apt-get install software-properties-common -qy && \
	add-apt-repository -y ppa:team-xbmc/ppa && \
	apt-get update -q && \
	apt-get install \
	$APTLIST -qy && \

# change shell to bash for user abc
 usermod -s /bin/bash abc && \

# cleanup
 cd / && \
 apt-get autoremove -y && \
 apt-get clean -y && \
 rm -rf \
 	/var/lib/apt/lists/* \
	/var/tmp/* \
	/tmp/*

# add some files
COPY root/ /

# ports and volumes
VOLUME /config
