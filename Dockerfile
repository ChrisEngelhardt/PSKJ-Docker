FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER chris.engelhardt@me.com

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y wget bzip2

#Downgrade CUDA, TF issue: https://github.com/tensorflow/tensorflow/issues/17566#issuecomment-372490062
#RUN apt-get install --allow-downgrades -y libcudnn7=7.0.5.15-1+cuda9.0 --allow-change-held-packages


#Install MINICONDA3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && rm Miniconda.sh

ENV PATH /opt/conda/bin:$PATH

#Install Basic ANACONDA Environment
# https://github.com/tensorflow/tensorflow/issues/26182
RUN conda create -y -n jupyter_env python=3.6 anaconda && \
	/opt/conda/envs/jupyter_env/bin/pip install --no-cache-dir tensorflow-gpu==1.12.0 keras==2.1.3 jupyter-tensorboard jupyterlab

#Install custom libs
COPY ./py3Libs.txt /py3Libs.txt
RUN /opt/conda/envs/jupyter_env/bin/pip install --no-cache-dir -r py3Libs.txt



RUN conda install -c conda-forge jupyterlab



CMD ["/opt/conda/envs/jupyter_env/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
#CMD ["/opt/conda/envs/jupyter_env/bin/jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
