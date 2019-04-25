# Dockerized container
Basic docker container to build pyhton3 based applications.
Dependencies can be added to the dependencies.txt and will be installed with pip3.

## Importent Links
* https://github.com/google/swift-jupyter
* https://github.com/tensorflow/swift/blob/master/Installation.md#pre-built-packages
* https://github.com/apple/swift/tree/tensorflow#linux


## Tags
* 1.0-gpu (for gpu nvidia gpu support, requires nvidia-docker v2)
* 1.0-cpu (for cpu only use)


## Build
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
from string import maketrans, capitalize
ImportError: cannot import name 'maketrans' from 'string' (/opt/conda/lib/python3.7/string.py)
[118/1018] Generating obj dirs for /swift-source/build/buildbot_linux/swift-linux-x86_64/stdlib/private/SwiftPrivate/linux/x86_64/SwiftPrivate.o
[119/1018] Generating Runtime.swift from Runtime.swift.gyb with ptr size = 8
