FROM ubuntu:22.04

RUN apt update -y &&  apt upgrade -y &&  apt dist-upgrade -y

RUN apt install joe wget p7zip-full curl openssh-server build-essential zlib1g-dev libcurl4-gnutls-dev libncurses5 -y

RUN wget https://altd.embarcadero.com/releases/studio/22.0/1131/LinuxPAServer22.0.tar.gz

RUN tar -xvf ./LinuxPAServer22.0.tar.gz

ENTRYPOINT ./PAServer-22.0/paserver -password=
