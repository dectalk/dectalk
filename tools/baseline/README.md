# Baseline Capture Helpers

These scripts capture baseline evidence for DECtalk modernization. They are
helpers only: they do not build DECtalk unless explicitly documented for a
specific helper, generate dictionaries, edit source files, edit build files, or
prove that behavior has been preserved.

Each script writes only under a caller-specified output directory. The scripts
create that output directory if needed.

## Scripts

### `capture_git_state.sh`

Usage:

```sh
tools/baseline/capture_git_state.sh OUT_DIR
```

Writes:

- `OUT_DIR/git-status.txt`
- `OUT_DIR/git-branch.txt`
- `OUT_DIR/git-head.txt`
- `OUT_DIR/git-remotes.txt`
- `OUT_DIR/git-diff-stat.txt`

This records repository state using read-only `git` commands. It does not add,
checkout, reset, clean, commit, or otherwise modify the working tree.

If Git refuses to inspect the checkout because of safe-directory ownership
checks, run with:

```sh
GIT_SAFE_DIRECTORY=/home/yam/dectalk tools/baseline/capture_git_state.sh OUT_DIR
```

### `capture_dist_manifest.sh`

Usage:

```sh
tools/baseline/capture_dist_manifest.sh DIST_DIR OUT_DIR
```

Writes:

- `OUT_DIR/dist-manifest.txt`
- `OUT_DIR/dist-sha256.txt` when `sha256sum` or `shasum` is available

This records paths, file types, sizes, permissions, and mtimes for an existing
dist or install tree. It also captures SHA-256 hashes for regular files when a
supported hash command is available.

The script expects `DIST_DIR` to already exist. It does not run a build or create
a dist tree.

### `capture_symbols.sh`

Usage:

```sh
tools/baseline/capture_symbols.sh ARTIFACT_DIR OUT_DIR
```

Writes:

- `OUT_DIR/symbols-summary.txt`
- one `*.symbols.txt` file per inspected artifact

The script searches `ARTIFACT_DIR` for shared-library-style artifacts:

- `*.so`
- `*.so.*`
- `*.dylib`
- `*.dll`
- `*.a`

It uses available inspection tools where practical:

- `nm`
- `objdump`
- `otool`
- `dumpbin`

If one artifact cannot be inspected, the script records that failure in the
summary and continues with the remaining artifacts.

### `capture_unix_build.sh`

Usage:

```sh
tools/baseline/capture_unix_build.sh OUT_DIR
```

Writes:

- `OUT_DIR/autoreconf.log`
- `OUT_DIR/configure.log`
- `OUT_DIR/make.log`
- `OUT_DIR/build-status.txt`
- `OUT_DIR/git/` when `capture_git_state.sh` is executable
- `OUT_DIR/warnings-summary.md` when Python 3 and `summarize_warnings.py` are
  available

This captures the existing Unix build flow from `src/`:

```sh
autoreconf -i
./configure
make
```

The script records each step's exit code. If `autoreconf -i` fails, it skips
`./configure` and `make`. If `./configure` fails, it skips `make`. Warning
summary generation is best-effort and does not determine the build capture exit
code.

This helper does not run audio tools or claim behavior preservation. It is meant
to capture logs from the existing Unix build path for later review. Because the
existing Unix flow generates files under `src/`, run it from a checkout where
generated Autotools and build outputs are acceptable, or from a disposable copy.

### `summarize_warnings.py`

Usage:

```sh
python3 tools/baseline/summarize_warnings.py --output OUT.md LOG1 [LOG2 ...]
```

Writes a Markdown warning inventory with total warning-like line counts,
category counts, detected warning markers where available, and representative
examples per category. The script uses only the Python 3 standard library and
does not modify the input logs or source tree.

Warning categories are heuristic and include compiler-agnostic groups for
format strings, uninitialized variables, unused symbols, pointer/integer
conversions, and unsafe temporary-file APIs. The `unsafe temporary file API`
category catches diagnostics mentioning `tmpnam`, `mktemp`, `tempnam`, or
guidance to use `mkstemp`. This category is for inventory only; it does not fix
temporary-file behavior or imply that such behavior can be changed without a
focused review.

### `capture_audio_outputs.sh`

Usage:

```sh
tools/baseline/capture_audio_outputs.sh SAY_EXE INPUT_DIR OUT_DIR
```

Example:

```sh
tools/baseline/capture_audio_outputs.sh \
  src/samplosf/build/speak/6.6.114.1-microsoft-standard-WSL2/say \
  tests/golden/input \
  baseline-runs/audio-001
```

Writes:

- `OUT_DIR/audio/`
- `OUT_DIR/logs/`
- `OUT_DIR/commands.txt`
- `OUT_DIR/capture-status.txt`
- `OUT_DIR/audio-manifest.txt`
- `OUT_DIR/audio-sha256.txt` when `sha256sum` or `shasum` is available

The script runs a caller-supplied built `say` executable once per `*.txt` input
file. It uses file output to avoid live audio hardware where practical:

```sh
SAY_EXE -fi INPUT_FILE -fo OUT_DIR/audio/BASENAME.wav
```

It captures stdout and stderr for each input, records the exact command used,
records per-input success or failure, and continues through all inputs even if
one input fails. It exits nonzero at the end if any input failed.

This helper does not build DECtalk. It expects `SAY_EXE` to already exist and be
executable. Command-line compatibility is still part of the baseline evidence:
some checked-in `say` sources document `-fi`/`-fo`, while another sample
documents `-w` plus stdin. If a particular built `say` does not support
`-fi`/`-fo`, the failure should be kept with the captured status and logs rather
than silently treated as success.

### `compare_audio_outputs.py`

Usage:

```sh
python3 tools/baseline/compare_audio_outputs.py \
  --baseline OLD_CAPTURE_DIR \
  --candidate NEW_CAPTURE_DIR \
  --output REPORT.md
```

Example:

```sh
python3 tools/baseline/compare_audio_outputs.py \
  --baseline baseline-runs/audio-001 \
  --candidate baseline-runs/audio-002 \
  --output baseline-runs/audio-002/compare-audio-001.md
```

The script compares two directories produced by `capture_audio_outputs.sh`.
Expected inputs are capture directories with `audio/` subdirectories containing
the generated audio/file-output artifacts.

It writes a Markdown report with:

- compared directories
- summary counts
- exact match status
- missing files
- extra files
- differing file sizes and SHA-256 hashes
- WAV metadata comparison when files are valid WAV files
- limitations

Exit status is 0 only when all compared artifacts exist and match exactly by
SHA-256. It exits nonzero if files are missing, extra, unreadable, or different.

This helper uses only the Python 3 standard library. It does not require NumPy,
SciPy, ffmpeg, audio playback, or live audio hardware. It does not compute RMS,
peak, perceptual difference, or sample-level deltas.

## Limitations

- These scripts are POSIX shell scripts and use `set -eu`.
- Linux and macOS differ in `stat` and hashing tools; the scripts include
  fallbacks for common GNU and BSD/macOS forms.
- Windows DLL symbol capture is best-effort from POSIX shell. Full Windows
  export capture may require running on Windows with `dumpbin` or compatible
  LLVM tooling available.
- Symbol output formats differ by tool and platform. Treat the files as raw
  baseline artifacts until a later comparison format is defined.
- The scripts do not require live audio hardware.
- The scripts do not require DECtalk to have built successfully, except that
  `capture_dist_manifest.sh` and `capture_symbols.sh` need existing directories
  containing the artifacts you want to inspect.
- `capture_unix_build.sh` runs the existing Autotools/Make flow and therefore
  requires the usual Unix build tools such as `autoreconf`, `./configure`
  support files, `make`, a C compiler, and platform libraries.
- `capture_audio_outputs.sh` requires a previously built `say` executable and
  records file-output artifacts only. It does not compare audio, compute audio
  metrics, or prove behavior preservation.
- `compare_audio_outputs.py` performs strict file-level comparison. Exact
  equality is useful for same-platform repeatability checks, but cross-platform
  captures may need later audio-aware tolerances.

## Example

```sh
mkdir -p baseline-out
tools/baseline/capture_git_state.sh baseline-out/git
tools/baseline/capture_dist_manifest.sh dist baseline-out/dist
tools/baseline/capture_symbols.sh dist baseline-out/symbols
tools/baseline/capture_unix_build.sh baseline-out/unix-build
tools/baseline/capture_audio_outputs.sh path/to/say tests/golden/input baseline-out/audio
```

Do not claim behavior preservation from these captures alone. They provide
evidence for later reviews and comparisons.
