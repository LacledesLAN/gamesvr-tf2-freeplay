# LL Team Fortress 2 Dedicated Freeplay Server in Docker

## Linux Container

[![](https://images.microbadger.com/badges/version/lacledeslan/gamesvr-tf2-freeplay.svg)](https://microbadger.com/images/lacledeslan/gamesvr-tf2-freeplay "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/lacledeslan/gamesvr-tf2-freeplay.svg)](https://microbadger.com/images/lacledeslan/gamesvr-tf2-freeplay "Get your own image badge on microbadger.com")

### Download

```shell
docker pull lacledeslan/gamesvr-tf2-freeplay
```

## Run self tests

```shell
docker run -it --rm lacledeslan/gamesvr-tf2-freeplay ./ll-tests/gamesvr-tf2-freeplay.sh;
```

## Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-tf2-freeplay ./srcds_run -game tf +randommap +sv_lan 1
```
