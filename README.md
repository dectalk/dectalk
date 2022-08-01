# Fonix DECtalk
These files were found off a HTTP server on [grossgang.com](https://keybase.pub/datajake1999/Grossgang/tts/dectalk%20software%20and%20manual/Ad%202.zip)

## Building
To build DECtalk, run `./configure` and `make` in `src`.
This needs 32bit multiarch development libraries to be installed on a 64bit system:
```shell
dpkg --add-architecture i386
apt-get update
apt-get install build-essential gcc-multilib libpulse-dev:i386 libgtk2.0-dev:i386 unzip
```
(libgtk2.0-dev:i386 is only needed if you want the graphical frontend)

The result will be in the folder `dist` in the root.
