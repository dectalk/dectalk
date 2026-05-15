# Baseline Procedure

This document describes the first preservation-focused baseline captures for
DECtalk modernization. It is procedural documentation only. It does not add
automation, change build files, change source files, or generate baseline
artifacts by itself.

## Goals

Capture enough evidence to detect accidental changes in:

- build behavior
- compiler warnings
- exported symbols
- generated dictionaries
- dist and install layouts
- command-line tool behavior
- deterministic text-to-speech output

Baseline artifacts should be captured before source cleanup, macro cleanup,
build-system replacement, dictionary changes, or audio/threading changes.

## Non-Goals

This procedure does not:

- make warnings fatal
- remove or rewrite macros
- remove legacy build files
- change supported targets
- change generated dictionaries
- change public headers or exported symbols
- define pass/fail tolerances for audio comparison yet
- replace any existing build system

## Inputs

The initial fixed input texts live under `tests/golden/input/`:

- `basic.txt`
- `commands.txt`
- `numbers_dates.txt`
- `languages.txt`

Treat these files as stable stimuli. Do not edit them casually after baseline
artifacts have been captured. If a future change needs new coverage, prefer
adding a new input file or appending a clearly documented new section with a new
baseline capture.

## Build Log Capture

Capture complete logs for each supported build path that can be run in the
available environment.

Unix-like build path:

```sh
cd src
autoreconf -i
./configure
make
```

Windows build paths to capture separately:

- `devops/vs2022/dt_buildall.bat`
- `devops/vs2022/dt_copyfiles.bat`
- `devops/vs6/dt_buildall.bat`
- `devops/vs6/dt_copyfiles.bat`

Record:

- operating system and version
- compiler and linker versions
- environment variables that affect the build
- exact commands
- full stdout and stderr
- exit status

Do not normalize logs yet. Raw logs are useful because warning text and command
lines can reveal platform differences.

## Warning Log Capture

For each build path, record compiler warnings separately from general build
logs when practical.

Useful summary fields:

- total warning count
- warning count by compiler warning code or message
- source file associated with each warning
- build target and language variant

Warnings should be grouped by category before cleanup. Avoid random edits to
silence individual warnings without a category-level plan.

## Dist and Install Manifest Capture

After a successful build and packaging/copy step, capture the output tree.

Record:

- relative file path
- file type where useful
- file size
- file hash
- executable bit or platform equivalent where useful

Capture manifests separately for:

- Unix `dist/`
- VS2022 `dist/AMD64`
- VS2022 `dist/IA32`
- VS6 `dist/`

The output layouts are not currently equivalent. Document differences before
attempting to align them.

## Dictionary Capture

Generated dictionaries are behavior-critical artifacts.

For each generated `dtalk_*.dic`, record:

- build path that generated it
- language or region
- file size
- cryptographic hash
- dictionary compiler command line
- dictionary compiler executable hash when practical

Do not update checked-in generated dictionaries or dictionary generation rules
as part of baseline capture unless a separate task explicitly approves that
change.

## Exported Symbol Capture

Capture exported symbols for each generated shared library or DLL.

Record separately by:

- platform
- architecture
- build system
- language variant
- library or DLL name

The symbol list is especially important before touching public headers,
visibility macros, calling conventions, project files, or linker flags.

## Command-Line Tool Capture

Capture basic command-line behavior for built tools such as:

- `say`
- `speak` where scriptable
- dictionary compiler tools
- `windic` only where deterministic command-line behavior is available

Record:

- exact executable path
- command line
- stdout and stderr
- exit status
- generated files and hashes

Prefer non-interactive invocations. Avoid tests that require live audio hardware
when a wave, raw, null-audio, or log output mode is available.

## Audio and Log Output Capture

Use the fixed input files under `tests/golden/input/` to capture deterministic
speech-related artifacts.

Preferred artifacts:

- WAV or raw audio output
- text logs
- phoneme logs where supported
- syllable logs where supported

For each output, record:

- input file path and hash
- build path
- platform
- architecture
- language variant
- command line
- output file hash
- audio duration
- sample count
- sample rate
- RMS and peak values when available

Do not compare audio by hash alone across different platforms until the expected
cross-platform stability is understood. Hashes are still useful within the same
platform and build path.

After a successful build capture, use the local helper to capture file-output
audio artifacts from a built `say` executable:

```sh
tools/baseline/capture_audio_outputs.sh SAY_EXE tests/golden/input OUT_DIR
```

The helper writes audio/file-output artifacts, per-input stdout and stderr logs,
the exact commands used, a status file, and a manifest with sizes and hashes
when a SHA-256 tool is available. It does not run a build and does not require
live audio hardware when the supplied `say` supports file output.

The initial helper uses this command shape for each input:

```sh
SAY_EXE -fi INPUT_FILE -fo OUT_DIR/audio/BASENAME.wav
```

Some checked-in `say` sources document different file-output options, such as
`-w` with stdin. Treat command-line compatibility as part of the baseline
evidence and record any failures in the run notes.

Audio capture outputs are local baseline artifacts. Do not commit output under
`baseline-runs/` or any other generated artifact directory unless explicitly
approved.

After capturing a second candidate audio baseline, compare it against an older
capture with:

```sh
python3 tools/baseline/compare_audio_outputs.py \
  --baseline OLD_CAPTURE_DIR \
  --candidate NEW_CAPTURE_DIR \
  --output REPORT.md
```

The comparison helper checks expected artifacts by name, compares file sizes and
SHA-256 hashes using Python, and records WAV metadata differences when both
files are valid WAV files. Exact byte-for-byte equality is the strongest local
signal for same-platform repeatability. Metadata differences are still useful
for diagnosis because they can show sample rate, sample width, channel count,
frame count, or duration changes even before sample-level comparison exists.

Do not treat a passing comparison report as a complete behavior-preservation
proof. It is one baseline signal alongside build logs, warning summaries, dist
manifests, dictionaries, exported symbols, and command output.

## Suggested Capture Matrix

Start with the smallest useful matrix:

- Linux Autotools release build, all available language variants
- macOS Autotools release build, all available language variants
- VS2022 release build, current IA32 and AMD64 outputs
- VS6 release build, all available language variants

Expand only after the initial procedure is repeatable.

## Artifact Storage

This document does not choose a final storage layout. A future automation task
should define a directory structure for captured artifacts.

A useful future layout may separate:

- raw logs
- warning summaries
- dist manifests
- symbol lists
- dictionary hashes
- audio outputs
- audio metrics
- command output

Avoid checking large generated artifacts into the repository until the storage
policy is explicit.

## Review Checklist

Before using a baseline to approve cleanup, confirm:

- the input files are unchanged
- the build path is the same
- the same language variant was used
- generated dictionary hashes are known
- exported symbols are known
- dist manifests are known
- audio/log artifacts are captured where relevant
- any platform-specific differences are documented

## Open Questions

- Which output mode is most deterministic for Unix `say` across Linux and
  macOS?
- Which VS2022 command-line tool should be used for non-interactive audio or
  log capture?
- Which iOS build path should be used for baseline capture?
- Are generated dictionaries expected to be byte-identical across Unix and
  Windows build paths?
- Which audio delta thresholds are acceptable for same-platform and
  cross-platform comparisons?
