FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
MAINTAINER chris.engelhardt@me.com

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y wget bzip2
RUN apt-get install clang libpython-dev libblocksruntime-dev -y

RUN wget https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.3/rc1/swift-tensorflow-RELEASE-0.3-cuda10.0-cudnn7-ubuntu18.04.tar.gz
RUN tar xzf swift-tensorflow-RELEASE-0.3-cuda10.0-cudnn7-ubuntu18.04.tar.gz
RUN export PATH=$(pwd)/usr/bin:"${PATH}"


#Install MINICONDA3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && rm Miniconda.sh

ENV PATH /opt/conda/bin:$PATH


RUN apt-get install libpython3.6-dev libxml2 -y


# Install Python3
RUN conda create -y -n jupyter_py3 python=3.6 anaconda && \
	/opt/conda/envs/jupyter_py3/bin/pip install --no-cache-dir tensorflow-gpu keras jupyter-tensorboard jupyterlab
RUN conda install -c conda-forge jupyterlab

# Install custom libs
COPY ./py3Libs.txt /py3Libs.txt
RUN /opt/conda/envs/jupyter_py3/bin/pip install --no-cache-dir -r py3Libs.txt


# Install Python2
RUN conda create -y -n jupyter_py2 python=2 anaconda && \
	/opt/conda/envs/jupyter_py2/bin/pip install --no-cache-dir tensorflow-gpu keras jupyter-tensorboard jupyterlab
RUN /opt/conda/envs/jupyter_py2/bin/python -m ipykernel install --user

# Install custom libs
COPY ./py2Libs.txt /py2Libs.txt
RUN /opt/conda/envs/jupyter_py2/bin/pip install --no-cache-dir -r py2Libs.txt


RUN conda create -n swift-tensorflow python==3.6 && \
/opt/conda/envs/swift-tensorflow/bin/pip install jupyter numpy matplotlib
RUN apt-get install unzip -y

RUN mkdir swift && cd swift && wget https://github.com/google/swift-jupyter/archive/master.zip && unzip master.zip
RUN /opt/conda/envs/swift-tensorflow/bin/python /swift/swift-jupyter-master/register.py --swift-toolchain ""

EXPOSE 8888

CMD ["/opt/conda/envs/jupyter_py3/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
#CMD ["/opt/conda/envs/jupyter_py3/bin/jupyter", "notebook", "--ip=127.0.0.1", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
