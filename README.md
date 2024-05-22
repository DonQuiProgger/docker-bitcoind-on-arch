# Bitcoin-core in archlinux based docker image
  
<b>NOTE: This is currently work in progress.</b>  
  
Containerized Bitcoin-core on archlinux for amd64,armv7,arm64.

## Running the images

The images are on Docker Hub. Use the convenient docker run:

For arm
```
docker run --rm -ti donquiprogger/bitcoin-core:arm
```

For amd64
```
docker run --rm -ti donquiprogger/bitcoin-core:amd64
```

## Building it yourself

You can build it either using docker for arm
```
docker buildx build -f Dockerfile.arm --platform linux/arm/v7,linux/arm64 .
```

or for amd64
```
docker buildx build -f Dockerfile .
```

or using docker compose and update the Dockerfile used for building inside <b>docker-compose.yml</b>
```
docker compose build . && docker compose up
```

## Credits
Ideas have been taken from many places.


* https://github.com/lopsided98/archlinux  
    - Archlinux on arm  
    - Frequent builds using github actions
* https://github.com/ruimarinho/docker-bitcoin-core   
    - How to setup bitcoin core inside a docker
* https://github.com/archlinux/archlinux-docker
    - Dockerized archlinux