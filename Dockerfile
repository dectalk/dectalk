FROM debian:bullseye

RUN apt-get update
RUN apt-get -y install build-essential libpulse-dev libgtk2.0-dev unzip autoconf automake

WORKDIR /dectalk/src

CMD autoreconf -i && ./configure && make
