## Notes
This container needs privileged permissions to run swift code.


## Importent Links
* https://github.com/google/swift-jupyter
* https://github.com/tensorflow/swift/blob/master/Installation.md#pre-built-packages
* https://github.com/apple/swift/tree/tensorflow#linux


## Tags


|  Tag  |  Info |  
|----------|-------------|
|   pskj-docker:1804-cpu (default)   |   For cpu only use. Notes: Ubuntu 18-04 |
|   pskj-docker:1804-gpu    | For gpu nvidia gpu support (requires nvidia-docker v2). Notes: Ubuntu 18-04,Cuda 10.0, Cudnn7  |


## How to build yourself
```
cd ubunut1804-(cpu/gpu)
docker build -t pskj-docker .
```

## Start the container (GPU)
```
nvidia-docker run --privileged  -p 8888:8888 chrisengelhardt/pskj-docker:1804-gpu
```

## Start the container (CPU)
```
docker run --privileged  -p 8888:8888 chrisengelhardt/pskj-docker:1804-cpu
```


## Permanently save data
To permanently save data, you need to mount a volume into the /tmp/ folder (-v)
```
docker run -v `pwd`/workdir:/tmp/  --privileged  -p 8888:8888 chrisengelhardt/pskj-docker:1804-cpu
```
