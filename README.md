[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: http://tautulli.com
[hub]: https://hub.docker.com/r/lsioarmhf/tautulli/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# lsioarmhf/tautulli
[![](https://images.microbadger.com/badges/version/lsioarmhf/tautulli.svg)](https://microbadger.com/images/lsioarmhf/tautulli "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/lsioarmhf/tautulli.svg)](https://microbadger.com/images/lsioarmhf/tautulli "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/lsioarmhf/tautulli.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/lsioarmhf/tautulli.svg)][hub][![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/armhf/armhf-tautulli)](https://ci.linuxserver.io/job/Docker-Builders/job/armhf/job/armhf-tautulli/)

[Tautulli][appurl] A python based web application for monitoring, analytics and notifications for Plex Media Server.

[![tautulli](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/tautulli-icon.png)][appurl]

## Usage

```
docker create \ 
  --name=tautulli \
  -v <path to data>:/config \
  -v <path to plex logs>:/logs:ro \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 8181:8181 \
  lsioarmhf/tautulli
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 8181` - Port for webui
* `-v /config` Contains tautulli config and database
* `-v /logs` Map this to PLex log directory - recommended RO
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for setting timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it tautulli /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application
`IMPORTANT... THIS IS THE ARMHF VERSION`

Access the webui at `<your-ip>:8181`, for more information check out [Tautulli][appurl].

## Info

* To monitor the logs of the container in realtime `docker logs -f tautulli`.

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' tautulli`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' lsioarmhf/tautulli`

## Versions

+ **10.03.18:** Rebrand to tautulli.
+ **25.01.18:** Rebase to alpine 3.7.
+ **21.07.17:** Internal git pull instead of at runtime.
+ **29.05.17:** Rebase to alpine 3.6.
+ **20.04.17:** Add pycryptodomex pip package.
+ **07.02.17:** Rebase to alpine 3.5.
+ **27.10.16:** Initial Release.
