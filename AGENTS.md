# AGENTS.md

## Project goal

Modernize and clean up DECtalk while preserving existing behavior.

This is legacy C code with many historical platform, language, product, and feature conditionals. The code works, but it is difficult to read and produces many warnings on modern compilers. The modernization goal is to improve maintainability without changing speech output, public API behavior, generated dictionaries, packaging, or runtime behavior unless explicitly approved.

## Current intended targets

The intended supported targets are:

- Linux
- Windows
- macOS
- iOS

Historical targets such as OSF/Tru64, VxWorks, MS-DOS, Windows CE, Solaris/SPARC, ARM7, MIPS, old PowerPC Mac, and iPAQ Linux may be inventoried, documented, or quarantined behind explicit legacy options, but they must not be deleted or broadly rewritten without explicit approval.

## Core rule

Behavior preservation is more important than cleanup.

Do not perform broad refactoring, whole-repo formatting, aggressive warning cleanup, or preprocessor simplification unless the task explicitly asks for it and there is a clear verification strategy.

## High-risk areas

Treat these as behavior-critical:

- `src/dectalkf.h`
- `src/dectalkf_klsyn.h`
- `src/dectalkf_hlsyn.h`
- `src/dapi/src/api/ttsapi.h`
- `src/dapi/src/api/tts.h`
- `src/dapi/src/api/ttsapi.c`
- `src/dapi/src/api/init.c`
- `src/dapi/src/lts`
- `src/dapi/src/ph`
- `src/dapi/src/vtm`
- `src/dapi/src/hlsyn`
- `src/dapi/src/nt/opthread.c`
- `src/dapi/src/nt/linux_audio.c`
- dictionary loading, dictionary generation, and generated `.dic` files
- public headers
- exported symbols
- audio timing, callback, pipe, queue, and threading behavior

## Do not change without explicit approval

Do not intentionally change:

- speech output
- phoneme output
- timing behavior
- default voice
- voice ROM selection
- parser behavior
- intonation/timing model
- sample rate
- dictionary format
- dictionary lookup behavior
- public API signatures
- exported symbol names
- DLL/shared-library names
- install layout
- command-line behavior of existing tools
- language selection behavior
- threading model
- audio backend behavior

## Build systems

The repository currently contains multiple build paths. Preserve them unless the task explicitly says otherwise.

Expected existing build systems include:

- Autotools/Make for Unix-like builds
- Visual Studio solution/project files for Windows
- legacy Visual Studio 6 support
- GitHub Actions build scripts
- custom scripts under `devops/`

A new build system may be added side-by-side, but existing build systems must not be removed until parity is proven.

## Preferred workflow

For each task:

1. Inspect before editing.
2. Identify the files that need to change.
3. Prefer the smallest useful change.
4. Avoid unrelated cleanup.
5. Build or run the narrowest relevant verification command.
6. Summarize exactly what changed.
7. State what was not changed.
8. Call out uncertainty and risk.

## Commit/PR style

Prefer small, focused changes.

Good task types:

- documentation
- baseline capture scripts
- build-log capture
- warning inventory
- macro inventory
- single-file warning cleanup
- platform abstraction scaffolding
- tests around existing behavior

Avoid large mixed changes.

## Warning cleanup policy

Warnings should be reduced by category, not by random edits.

Low-risk warning cleanup includes:

- missing prototypes
- missing standard includes
- duplicate declarations
- unused parameters
- obviously incorrect format strings
- local variables that need obvious initialization
- mechanical `const` correctness where no API changes result

Medium-risk warning cleanup requires caution:

- signed/unsigned conversions
- pointer/integer casts
- size truncation
- callback signatures
- thread function signatures
- `volatile` and concurrency-related warnings

High-risk warning cleanup should be avoided unless explicitly requested:

- arithmetic changes in synthesizer code
- struct layout changes
- public header changes
- dictionary format changes
- thread lifecycle changes
- audio timing changes
- parser or phoneme logic changes

## Macro policy

Do not remove preprocessor conditionals casually.

Before simplifying macros, classify them as one of:

- current platform
- current architecture
- language selection
- sound-critical feature
- product feature
- build-system define
- historical target
- unknown

Historical-target code should first be documented and then quarantined behind explicit legacy options before deletion is considered.

## Testing and verification

When possible, prefer deterministic tests that do not require live audio hardware.

Useful verification artifacts include:

- build logs
- compiler warning logs
- exported symbols
- generated dictionaries
- installed/dist tree manifests
- command-line tool output
- WAV/raw audio output from fixed input text
- file hashes
- sample counts
- RMS/peak deltas for audio comparisons

If no test is available, say so explicitly.

## Communication style

When reporting back, include:

- summary
- files changed
- verification run
- behavior risk
- follow-up recommendations

Do not claim behavior is preserved unless the relevant checks were run.
