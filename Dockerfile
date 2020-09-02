FROM lpenz/debian-sarge-i386:latest

RUN apt-get update
RUN apt-get install -y gcc unzip libc6-dev build-essential autoconf automake libgtk1.2-dev

WORKDIR /dectalk

CMD autoreconf && ./configure && make
