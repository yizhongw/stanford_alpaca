FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV CUDA_HOME=/usr/local/cuda/

RUN apt-get -y update
RUN apt-get -y install git vim 

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get -y install git-lfs

WORKDIR /stage/

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY *.py ./

# for interactive session
RUN chmod -R 777 /stage/