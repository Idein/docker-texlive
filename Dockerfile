FROM ubuntu:22.04

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends sudo git openssh-client \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# add idein user
RUN useradd -m idein \
 && echo idein:idein | chpasswd \
 && adduser idein sudo \
 && echo 'idein ALL=NOPASSWD: ALL' >> /etc/sudoers.d/idein

USER idein
WORKDIR /home/idein
ENV HOME /home/idein

RUN sudo apt-get update \
 && sudo apt-get install -y --no-install-recommends texlive-full \
 && sudo apt-get clean \
 && sudo rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /home/idein/work
