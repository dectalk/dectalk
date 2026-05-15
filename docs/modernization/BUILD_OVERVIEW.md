# DECtalk Build Overview

This document records the build paths observed at the start of modernization.
It is descriptive only. It does not propose removing, replacing, or changing any
existing build system.

## Scope

Modernization work should preserve the existing build behavior until replacement
or cleanup work has parity evidence. The currently intended targets are Linux,
Windows, macOS, and iOS, but the repository also contains historical build paths
and platform branches that should remain intact during baseline documentation.

## Top-Level Layout

- `src/` contains the main DECtalk source tree and most build files.
- `src/configure.ac` drives the Unix-like Autotools configuration.
- `src/Makefile.in` is the top-level Unix Makefile template.
- `src/Makefile.sub.in` coordinates lower-level Unix builds.
- `src/dapi/src/` contains the main API/library sources and several project
  files for Windows builds.
- `devops/` contains CI-oriented Windows build and copy scripts.
- `.github/workflows/build.yml` defines current CI build jobs.
- `ports/emscripten/` exists as a separate port-related area.

## Unix-Like Build Path

The Unix-like build uses Autotools and Make from `src/`.

Observed CI sequence:

```sh
cd src
autoreconf -i
./configure
make
```

Important files:

- `src/configure.ac`
- `src/Makefile.in`
- `src/Makefile.sub.in`
- `src/dapi/src/Makefile.in`
- `src/dapi/src/Makefile.sub.in`
- `src/dapi/src/*/Makefile.in`
- `src/dtalkml/src/Makefile.in`
- `src/samplosf/src/*/Makefile`
- `src/licunix/src/Makefile.in`
- `src/udicunix/src/Makefile.in`

`src/configure.ac` generates Makefiles for:

- `Makefile`
- `Makefile.sub`
- `dapi/src/Makefile`
- `dapi/src/Makefile.sub`
- `dapi/src/api/Makefile`
- `dapi/src/cmd/Makefile`
- `dapi/src/dic/Makefile`
- `dapi/src/kernel/Makefile`
- `dapi/src/lts/Makefile`
- `dapi/src/nt/Makefile`
- `dapi/src/osf/Makefile`
- `dapi/src/ph/Makefile`
- `dapi/src/vtm/Makefile`
- `dapi/src/hlsyn/Makefile`
- `dtalkml/src/Makefile`
- `samplosf/src/speak/Makefile`
- `samplosf/src/windict/Makefile`
- `samplosf/src/dtsamples/Makefile`
- `licunix/src/Makefile`
- `udicunix/src/Makefile`

The top-level Unix Makefile builds language variants through targets such as:

- `english_release`
- `uk_release`
- `spanish_release`
- `german_release`
- `latin_american_release`
- `french_release`

The Unix `all` target installs into `../dist` by default. The install target
copies libraries, dictionary tools, generated dictionaries, sample programs,
headers, documentation, bitmaps, and a generated `DECtalk.conf`.

## Unix Build Defines and Platform Branches

`src/configure.ac` sets core compile defines including:

- `LTSSIM`
- `TTSSIM`
- `ANSI`
- `BLD_DECTALK_DLL`
- `$(LANGUAGE)`
- `DECTALK_INSTALL_PREFIX`
- `ACCESS32`
- `TYPING_MODE`

Observed platform-specific branches include:

- Linux: `_REENTRANT`, `NOMME`
- macOS: `_REENTRANT`, `NOMME`, optional universal binary flags
- Solaris/SPARC: `_SPARC_SOLARIS_`, `_BIGENDIAN_`
- old PowerPC Mac: `_APPLE_MAC_`, `_BIGENDIAN_`
- iPAQ Linux: `__ipaq__`, custom cross compiler paths

Audio-related configuration currently probes PulseAudio and ALSA on Linux and
adds Apple frameworks on macOS. These details are behavior-relevant and should
be captured before any build-system cleanup.

## Windows Build Paths

The repository contains both modern Visual Studio project files and legacy
Visual Studio 6 project files.

Observed VS2022 wrapper:

- `devops/vs2022/dt_buildall.bat`
- `devops/vs2022/dt_copyfiles.bat`
- `src/DECtalk.sln`
- `src/dapi/src/DECtalk API.vcxproj`
- `src/dapi/src/Internal Dictionary Compiler.vcxproj`
- `src/samples/speak/Sample Speak Window.vcxproj`

The VS2022 wrapper currently builds:

- `Release - ENGLISH_US` for `AMD64`
- `Release - ENGLISH_US` for `IA32`

The VS2022 copy script creates separate `dist/AMD64` and `dist/IA32` trees and
copies the US DECtalk DLL, dictionary compiler, generated US dictionary, and
sample speak executable.

Observed VS6 wrapper:

- `devops/vs6/dt_buildall.bat`
- `devops/vs6/dt_copyfiles.bat`

The VS6 wrapper builds multiple language variants for the DECtalk API and
dictionary compiler:

- US English
- UK English
- Spanish
- German
- Latin American
- French

The VS6 copy script creates a single `dist/` tree with language-specific DLLs,
dictionary compiler tools, generated dictionaries, and sample executables.

## Legacy and Historical Build Files

The tree contains many historical Windows and platform-specific build artifacts,
including:

- Visual Studio 6 `.dsp` and `.dsw` files
- Windows CE build files and scripts
- installation and kitting batch scripts
- OSF documentation and sample Makefiles
- hardware and embedded-oriented directories

These files may be obsolete for current targets, but they should not be deleted
or rewritten during initial modernization. They are part of the historical build
surface and may still encode source membership, macro choices, or packaging
behavior.

## CI Build Jobs

`.github/workflows/build.yml` currently defines jobs for:

- Ubuntu latest using Autotools and Make
- macOS 13 using Autotools and Make
- Visual Studio 6 on a self-hosted Windows runner
- Visual Studio 2022 on Windows 2022

CI publishes `dist/` artifacts for each platform path. The workflow currently
targets the `develop` branch for push and pull request triggers.

## Generated and Packaged Artifacts

Important generated or packaged outputs include:

- DECtalk shared libraries or DLLs
- language-specific `dtalk_*.dic` dictionaries
- dictionary compiler binaries
- `dtalkml` library output
- sample tools such as `say`, `speak`, `windic`, `dtmemory`, `aclock`, and
  `tunecheck`
- installed headers under `include/dtk`
- documentation and bitmaps in the install tree
- generated `DECtalk.conf`

Changes that affect these outputs need baseline manifests before cleanup.

## Open Questions

- Which source files differ between Unix, VS2022, and VS6 builds?
- Which generated dictionaries are byte-stable across platforms?
- Which exported symbols are expected for each library or DLL?
- Which historical build files are still used by users outside CI?
- What is the intended iOS build path, and does it share the macOS Autotools
  path or require separate project files?

## Recommended Baseline Captures

Before changing build logic, capture:

- full build logs
- warning logs
- generated dictionary hashes
- exported symbol lists
- dist/install tree manifests
- representative command-line tool output
- deterministic WAV or raw audio output from fixed input text
