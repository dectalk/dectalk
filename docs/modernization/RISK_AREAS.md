# Modernization Risk Areas

This document identifies areas that need extra care during DECtalk modernization.
It is a guide for preservation-first work, not a list of files to refactor.

## Core Principle

Behavior preservation is more important than cleanup. Do not claim behavior is
preserved unless the relevant build, dictionary, API, or audio checks were run.

## Highest-Risk Files

Treat these files as behavior-critical:

- `src/dectalkf.h`
- `src/dectalkf_klsyn.h`
- `src/dectalkf_hlsyn.h`
- `src/dapi/src/api/ttsapi.h`
- `src/dapi/src/api/tts.h`
- `src/dapi/src/api/ttsapi.c`
- `src/dapi/src/api/init.c`
- `src/dapi/src/nt/opthread.c`
- `src/dapi/src/nt/linux_audio.c`

Reasons:

- public API definitions
- exported symbols and calling conventions
- startup and initialization behavior
- compile-time feature selection
- voice ROM and synthesizer configuration
- threading, queue, event, pipe, callback, and audio behavior

## Highest-Risk Directories

Treat these directories as behavior-critical:

- `src/dapi/src/lts`
- `src/dapi/src/ph`
- `src/dapi/src/vtm`
- `src/dapi/src/hlsyn`
- `src/dapi/src/dic`
- `src/dapi/src/api`
- `src/dapi/src/nt`
- `src/dapi/src/include`

These directories contain language processing, phoneme generation, synthesizer
logic, dictionary handling, public API definitions, threading, and platform
compatibility code.

## Speech Output Risk

Avoid unverified changes in areas that can affect:

- phoneme output
- parser behavior
- intonation and timing
- default voice selection
- voice ROM selection
- sample rate
- vocal tract model behavior
- software volume behavior
- language-specific rule selection

Especially risky files include the `dectalkf_*` configuration headers and source
under `lts`, `ph`, `vtm`, and `hlsyn`.

Recommended evidence before changes:

- fixed-input audio output
- file hashes for WAV or raw outputs
- sample counts
- RMS and peak deltas
- phoneme or log output where available

## Dictionary Risk

Dictionary behavior is high risk. Do not change dictionary source, generation,
loading, lookup, compression, file names, install paths, or generated `.dic`
files without explicit baseline evidence.

Important areas:

- `src/dapi/src/dic`
- dictionary compiler project files
- dictionary build rules in Unix Makefiles
- dictionary build steps in VS6 scripts
- generated `dtalk_*.dic` files
- install and copy scripts that package dictionaries

Recommended evidence before changes:

- generated dictionary hashes
- dictionary compiler command lines
- dist tree manifests
- representative lookup or synthesis output

## Public API and Binary Compatibility Risk

Public headers and exported symbols must remain stable unless a task explicitly
approves an API change.

Important files:

- `src/dapi/src/api/ttsapi.h`
- `src/dapi/src/api/tts.h`
- `src/dapi/src/osf/dtmmedefs.h`
- installed headers under `include/dtk`

Risky changes include:

- changing public function signatures
- changing exported symbol names
- changing typedefs or struct layout
- changing callback signatures
- changing DLL or shared-library names
- changing audio format constants
- changing conditional visibility macros

Recommended evidence before changes:

- exported symbol lists
- installed header manifests
- ABI-oriented review of structs and callbacks
- downstream sample build checks

## Threading, Timing, and Audio Risk

Threading and audio code is behavior-critical because small changes can affect
timing, callbacks, synchronization, and audio output.

Important files:

- `src/dapi/src/api/ttsapi.c`
- `src/dapi/src/nt/opthread.c`
- `src/dapi/src/nt/linux_audio.c`
- `src/dapi/src/nt/pipe.c`
- `src/dapi/src/nt/spc.c`
- `src/dapi/src/vtm/sync.c`
- `src/dapi/src/vtm/playtone.c`

Risky changes include:

- thread function signature changes
- queue or pipe size changes
- sleep interval changes
- callback timing changes
- audio backend selection changes
- synchronization reset behavior changes
- `volatile` or concurrency cleanup without focused tests

Recommended evidence before changes:

- deterministic no-live-audio output mode where possible
- callback sequence logs
- audio sample counts
- deadlock or timeout-focused tests
- platform-specific build logs

## Build and Packaging Risk

The repository has several build paths that are not equivalent. Preserve them
until parity is documented.

Important areas:

- `src/configure.ac`
- `src/Makefile.in`
- `src/Makefile.sub.in`
- `src/dapi/src/Makefile.in`
- `src/dapi/src/Makefile.sub.in`
- `src/DECtalk.sln`
- `src/dapi/src/*.vcxproj`
- legacy `.dsp` and `.dsw` files
- `devops/vs2022`
- `devops/vs6`
- `.github/workflows/build.yml`
- installation and kitting scripts

Risky changes include:

- changing source membership
- changing output names
- changing install layout
- changing language variant coverage
- replacing build systems before parity exists
- changing generated dictionary locations

Recommended evidence before changes:

- build logs
- warning logs
- dist/install tree manifests
- generated artifact hashes
- source membership comparisons between build systems

## Macro Cleanup Risk

Preprocessor conditionals are deeply tied to platform, language, product, and
sound behavior. Do not remove or simplify macros casually.

High-risk macro groups include:

- language selection macros
- current platform macros
- historical target macros that still affect shared headers
- voice ROM and synthesizer feature macros
- threading and audio macros
- product integration macros such as SAPI and OLE paths

Before changing macros:

- classify each macro
- identify who defines it
- identify current target impact
- identify generated artifact impact
- capture relevant baselines

## Lower-Risk Documentation Work

Documentation-only work is low risk when it:

- describes observed behavior
- avoids changing build files
- avoids changing source files
- avoids changing generated artifacts
- clearly marks uncertainty

Even documentation should avoid claiming behavior preservation unless checks
were actually run.

## Recommended Next Safeguards

- Capture Unix and Windows build logs.
- Capture compiler warning logs by platform.
- Capture exported symbols for generated libraries.
- Capture dictionary hashes for each language.
- Capture dist tree manifests for Unix, VS2022, and VS6.
- Capture representative audio output from fixed text before refactoring.
