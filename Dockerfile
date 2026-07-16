FROM debian:bullseye AS build

RUN apt-get update
RUN apt-get --no-install-recommends -y install build-essential libasound2-dev libpulse-dev libgtk2.0-dev unzip autoconf automake git

COPY . /dectalk

WORKDIR /dectalk/src

RUN ./autogen.sh
RUN ./configure
RUN make -j

FROM scratch AS output-only

COPY --from=build /dectalk/dist ./dist

