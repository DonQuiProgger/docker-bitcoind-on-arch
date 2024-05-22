# Bitcoin-core in archlinux based docker image
  
<b>NOTE: This is currently work in progress.</b>  
  
Containerized Bitcoin-core on archlinux for amd64,armv7,arm64.

## Running the images

The images are on Docker Hub. Use the convenient docker run:

```
docker run --rm -ti donquiprogger/bitcoin-core:latest
```

## Building it yourself

You can build it using the provided build script
```
docker buildx build -f Dockerfile .
```
or using docker compose
```
docker compose build . && docker compose up
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