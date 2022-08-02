# Fonix DECtalk
These files were found off a HTTP server on [grossgang.com](https://keybase.pub/datajake1999/Grossgang/tts/dectalk%20software%20and%20manual/Ad%202.zip)

## Building
To build DECtalk, run `./configure` and `make` in `src`.
This needs the following dependencies to be installed:
```shell
apt-get install build-essential libpulse-dev libgtk2.0-dev unzip
```
(libgtk2.0-dev is only needed if you want the graphical frontend)

The result will be in the folder `dist` in the root.
