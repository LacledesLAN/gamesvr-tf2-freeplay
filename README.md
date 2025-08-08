# Laclede's LAN Team Fortress 2 Dedicated Freeplay Server in Docker

![Laclede's LAN Team Fortress 2 Dedicated Freeplay Server](https://raw.githubusercontent.com/LacledesLAN/gamesvr-tf2-freeplay/master/.misc/banner-tf2-freeplay.png "Laclede's LAN Team Fortress 2 Dedicated Freeplay Server")

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are heavily tailored and tweaked
for use at our charity LAN-Parties. For third-parties we recommend using this repo only as a reference example and then
building your own using [gamesvr-tf2](https://github.com/LacledesLAN/gamesvr-tf2) as the base image for your customized
server.

## Linux Container

### Download

```shell
docker pull lacledeslan/gamesvr-tf2-freeplay;
```

### Run Self Tests

The image includes a test script that can be used to verify its contents. No changes or pull-requests will be accepted
to this repository if any tests fail.

```shell
docker run -it --rm lacledeslan/gamesvr-tf2-freeplay ./ll-tests/gamesvr-tf2-freeplay.sh;
```

## Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-tf2-freeplay ./srcds_run_64 -game tf +sv_lan 1 +mapcyclefile mapcycle_LL_all.txt +randommap
```

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable,
self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game
Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks,
and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our
Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can
also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers
Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
