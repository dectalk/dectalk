FROM debian:bullseye

RUN apt-get update
RUN apt-get --no-install-recommends -y install build-essential libasound2-dev libpulse-dev libgtk2.0-dev unzip autoconf automake git

WORKDIR /dectalk/src

CMD autoreconf -i && ./configure && make
