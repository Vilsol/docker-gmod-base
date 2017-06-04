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

RUN mkdir -p /home/steam/steamcmd/
RUN useradd -ms /bin/bash steam
RUN chown -R steam /home/steam
RUN chmod -R 744 /home/steam

USER steam

WORKDIR /home/steam/steamcmd/
RUN ["wget", "http://media.steampowered.com/client/steamcmd_linux.tar.gz"]
RUN ["tar", "-xvzf", "steamcmd_linux.tar.gz"]
RUN ./steamcmd.sh +login anonymous +quit

COPY update.sh update.sh
RUN ["/bin/bash", "update.sh", "4020", "/home/steam/gmod/"]
RUN ["/bin/bash", "update.sh", "232250", "/home/steam/content/tf2/"]

VOLUME /home/steam

EXPOSE 27015

ENV MAP="gm_flatgrass"
ENV MAX_PLAYERS="12"
ENV GAMEMODE="sandbox"

WORKDIR /home/steam/gmod/

RUN mkdir -p ~/.steam/sdk32/
RUN ln -s /home/steam/steamcmd/linux32/steamclient.so ~/.steam/sdk32/steamclient.so

COPY mount.cfg garrysmod/cfg/mount.cfg

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["./srcds_run -game garrysmod +maxplayers $MAX_PLAYERS +map $MAP +sv_gamemode $GAMEMODE"]
