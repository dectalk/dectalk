# Fonix DECtalk

These files were shared by their original developer [late Edward Bruckert](https://bluegrasspals.com/pipermail/dectalk/2020-June/005253.html) on the DECtalk list in [Oct](https://bluegrasspals.com/pipermail/dectalk/2015-October/004517.html)/[Nov](https://bluegrasspals.com/pipermail/dectalk/2015-November/004535.html) 2015 and preserved on a HTTP server on [grossgang.com](https://keybase.pub/datajake1999/Grossgang/tts/DECtalk%20source%20code%20archive/Ad%202.zip). Another developer also added more code in 09/2022 which is also preserved in the [grossgang.com keybase filesystem](https://keybase.pub/datajake1999/Grossgang/tts/DECtalk%20source%20code%20archive/).

## Branches of Interest

- `master` Literally just the source code dumped into the `/src` folder.
- `develop` Working Linux/Windows binaries with i386, x64_64 and aarch64 builds working.

## Building

<details>
<summary>Setting up on Ubuntu Linux</summary>

If you're building on Ubuntu, obtain the following dependencies:

```sh
apt-get install build-essential libpulse-dev libgtk2.0-dev unzip
```

(libgtk2.0-dev is only needed if you want the graphical frontend, libpulse-dev if you want pulseaudio audio-output)

</details>
<details>
<summary>Compiling on Linux</summary>

```sh
# Run all these commands in the /src directory...
# Generates configure files
autoreconf -si

# Executes configure files
./configure

# Builds DECtalk with ALL cores (remove -j for single core)
make -j
```

The built files will be found in the `/dist` folder.

</details>
<details>
<summary>Compiling on Linux with Docker</summary>

To build DECtalk without setting up a local build environment, run `sudo docker-compose up`
(and make sure you have Docker and docker-compose installed!)

</details>
<details>
<summary>Setting up on Microsoft Windows</summary>

There's a great article on CodeProject which explains how to install Visual Studio 6.0 from scratch.
[Read it here](https://www.codeproject.com/Articles/1191047/Install-Visual-Studio-on-Windows)

You will also need to add your `vcvars32.bat` file to the environment variables.
Do this by adding `C:\Program Files (x86)\Microsoft Visual Studio\VC98\Bin` to your Windows system `PATH`.

</details>
<details>
<summary>Compiling on Microsoft Windows</summary>

The [`\devops\windows\dt_buildall.bat`](./devops/windows/dt_buildall.bat)
file is a great place to get started if you want to build individual components of DECtalk.

If you want to compile all files, execute the `\devops\windows\dt_buildall.bat` file
from the root of the project folder.

You can then collate all files together by executing the `\devops\windows\dt_copyfiles.bat` file.

</details>

## The Team

![A photograph of members captioned as: "The DECtalk Team". From left to right, stands Ron Gemma, Trung Ly, Nick Shin, Matt Schnee, Kevin Bruckert, Ed Lazar, Carl Leeber, Tom Kopee, Ed Bruckert, Ginger Lin and Rick Rahko.](./src/samples/speak/TEAM03.BMP "The original DECtalk developers!")
