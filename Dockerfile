FROM ubuntu:12.04
MAINTAINER Vilsol

RUN apt-get update
RUN apt-get -y install 
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    net-tools \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl \
    wget \
    lib32tinfo5

RUN useradd -ms /bin/bash steam
USER steam

WORKDIR /home/steam/steamcmd/
RUN ["wget", "http://media.steampowered.com/client/steamcmd_linux.tar.gz"]
RUN ["tar", "-xvzf", "steamcmd_linux.tar.gz"]
RUN ./steamcmd.sh +login anonymous +quit

WORKDIR /

ADD update.sh update.sh
RUN ["bash", "update.sh"]

EXPOSE 27015

ENV MAP="gm_flatgrass"
ENV MAX_PLAYERS="12"
ENV GAMEMODE="sandbox"

WORKDIR /home/server/gmod/

ADD start.sh start.sh

RUN mkdir -p ~/.steam/sdk32/
RUN ln -s /home/steam/steamcmd/linux32/steamclient.so ~/.steam/sdk32/steamclient.so

CMD ["bash", "start.sh"]
