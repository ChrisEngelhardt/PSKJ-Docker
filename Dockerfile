FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER chris.engelhardt@me.com

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y wget bzip2


#Install MINICONDA3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && rm Miniconda.sh

ENV PATH /opt/conda/bin:$PATH


# Install Python3
RUN conda create -y -n jupyter_py3 python=3.6 anaconda && \
	/opt/conda/envs/jupyter_py3/bin/pip install --no-cache-dir tensorflow-gpu==1.12.0 keras==2.1.3 jupyter-tensorboard jupyterlab
RUN conda install -c conda-forge jupyterlab

#Install custom libs
COPY ./py3Libs.txt /py3Libs.txt
RUN /opt/conda/envs/jupyter_py3/bin/pip install --no-cache-dir -r py3Libs.txt


# Install Python2
RUN conda create -y -n jupyter_py2 python=2 anaconda && \
	/opt/conda/envs/jupyter_py2/bin/pip install --no-cache-dir tensorflow-gpu==1.12.0 keras==2.1.3 jupyter-tensorboard jupyterlab
RUN /opt/conda/envs/jupyter_py2/bin/python -m ipykernel install --user

#Install custom libs
COPY ./py2Libs.txt /py2Libs.txt
RUN /opt/conda/envs/jupyter_py2/bin/pip install --no-cache-dir -r py2Libs.txt


EXPOSE 80

CMD ["/opt/conda/envs/jupyter_py3/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
#CMD ["/opt/conda/envs/jupyter_py3/bin/jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
