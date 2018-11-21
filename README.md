# Dockerized container
Basic docker container to build pyhton3 based applications.
Dependencies can be added to the dependencies.txt and will be installed with pip3.

##Used Datasets
* http://cocodataset.org/#download
* https://www-intuidoc.irisa.fr/en/imadocsen-ondb-base-de-phrases-manuscrites-en-ligne/

## Build
```
docker build -t example .
```

For all upcomming commands we pass -v argument to mount the volume with the source instead of copy it.
So we can start an interactive session and change python code without restarting the container.
**Note: Withouth the -v argument there is no code in the container**

## Start Main application
```
docker run -t  --rm -v `pwd`:/app/ example:latest
```


## Forwarding parameters for running
```
docker run -t  --rm -v `pwd`:/app/ example:latest python ./main.py PARAM1 PARAM2
```


## Start interactive session for development
```
docker run -it --rm -v `pwd`:/app/ example:latest /bin/bash
```

