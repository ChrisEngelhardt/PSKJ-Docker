FROM ubuntu:18.04
MAINTAINER chris.engelhardt@me.com
EXPOSE 8888

#Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils wget bzip2 clang libpython-dev libblocksruntime-dev unzip libpython3.6-dev libxml2

#Install MINICONDA3
RUN wget --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && rm Miniconda.sh
ENV PATH /opt/conda/bin:$PATH

# Create Python3 environment
RUN conda create -y -n jupyter_py3 python=3.6 anaconda && \
	/opt/conda/envs/jupyter_py3/bin/pip install --no-cache-dir tensorflow keras jupyter-tensorboard jupyterlab matplotlib
RUN conda install -c conda-forge jupyterlab

# Create Python2 environment and register for jupyter
RUN conda create -y -n jupyter_py2 python=2 anaconda && \
	/opt/conda/envs/jupyter_py2/bin/pip install --no-cache-dir tensorflow keras jupyter-tensorboard jupyterlab matplotlib && \
	/opt/conda/envs/jupyter_py2/bin/python -m ipykernel install --user

# Install swift toolchain
RUN wget --no-check-certificate https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.3/rc1/swift-tensorflow-RELEASE-0.3-ubuntu18.04.tar.gz && \
		tar xzf swift-tensorflow-RELEASE-0.3-ubuntu18.04.tar.gz && \
		export PATH=$(pwd)/usr/bin:"${PATH}" && rm swift-tensorflow-RELEASE-0.3-ubuntu18.04.tar.gz

# Install swift jupyter interface
RUN mkdir swift && cd swift && wget --no-check-certificate https://github.com/google/swift-jupyter/archive/master.zip && unzip master.zip && rm master.zip
RUN /opt/conda/envs/jupyter_py3/bin/python /swift/swift-jupyter-master/register.py --swift-toolchain ""

CMD ["/opt/conda/envs/jupyter_py3/bin/jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/tmp"]
