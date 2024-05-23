# Bitcoin-core in archlinux based docker image
  
<b>NOTE: This is currently work in progress.</b>  
  
Containerized Bitcoin-core with archlinux. 
  
Supported architectures: amd64, arm64v8, armv7.

## Tags

|  Tag   |    Description     |
|:------:|:-------------------|
| latest  | multiarch build |
| amd64   | platform specific build |
| arm64v8 | platform specific build |
| armv7   | platform specific build |


## Running the images

The images are on Docker Hub.
```
docker run --name bitcoind -ti donquiprogger/bitcoin-core:latest
```

To communicate using rpc
```
docker exec -u bitcoind bitcoind bitcoin-cli -getinfo
```

### Docker compose

Example config
```
services:
  bitcoind:
    image: donquiprogger/bitcoin-core
    volumes:
      # bitcoin data directory
      - ./bitcoin:/home/bitcoind/.bitcoin
    environment:
      # permissions for the bitcoin data directory
      - UID=1000
      - GID=1000
    ports:
      - "8332:8332"
      - "8333:8333"
      - "18332:18332"
      - "18333:18333"
      - "18443:18443"
      - "18444:18444"
      - "38333:38333"
      - "38332:38332"
    restart: unless-stopped
    command:
      # pass arguments
      - -rpcbind=0.0.0.0
      - -rpcallowip=0.0.0.0/0
```

## Building it yourself

You can build it using the provided build script
```
docker buildx build -f Dockerfile .
```
or using docker compose
```
docker compose build && docker compose up
```

## Credits
Ideas have been taken from many places.


* https://github.com/lopsided98/archlinux  
    - Archlinux on arm  
    - Build setup
* https://github.com/ruimarinho/docker-bitcoin-core   
    - How to setup bitcoin core inside a docker
* https://github.com/archlinux/archlinux-docker
    - Dockerized archlinux