# Dockerized container
Basic docker container to build pyhton3 based applications.
Dependencies can be added to the dependencies.txt and will be installed with pip3.

## Importent Links
* https://github.com/google/swift-jupyter
* https://github.com/tensorflow/swift/blob/master/Installation.md#pre-built-packages
* https://github.com/apple/swift/tree/tensorflow#linux


## Tags


| Version  |  Tag  |  Info |  Build |
|----------|-------------|------|------|
| 0.6 |  0.6-gpu    | for gpu nvidia gpu support (requires nvidia-docker v2) | 
| 0.6 |    0.6-cpu   |   for cpu only use | 


## How to build
```
docker build -t psjkg .
```


## Start the container in new lab mode (default)
```
nvidia-docker run -v `pwd`/workdir:/tmp/ --privileged   -p 8888:8888 psjkg
```


## Start the container in default mode
```
nvidia- docker run -t --rm --privileged -e mode='notebook' -v `pwd`/workdir:/tmp/psjkg
```
