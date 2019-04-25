# Dockerized container
Basic docker container to build pyhton3 based applications.
Dependencies can be added to the dependencies.txt and will be installed with pip3.

## Used Datasets
* http://cocodataset.org/#download
* https://www-intuidoc.irisa.fr/en/imadocsen-ondb-base-de-phrases-manuscrites-en-ligne/

## Build
```
docker build -t psjkg .
```


## Start the container in new lab mode (default)
```
docker run -v --privileged `pwd`/workdir:/tmp/  -p 8888:8888 psjkg
```


## Start the container in default mode
```
docker run -t --rm --privileged -e mode='notebook'-v `pwd`/workdir:/tmp/psjkg
```
from string import maketrans, capitalize
ImportError: cannot import name 'maketrans' from 'string' (/opt/conda/lib/python3.7/string.py)
[118/1018] Generating obj dirs for /swift-source/build/buildbot_linux/swift-linux-x86_64/stdlib/private/SwiftPrivate/linux/x86_64/SwiftPrivate.o
[119/1018] Generating Runtime.swift from Runtime.swift.gyb with ptr size = 8
