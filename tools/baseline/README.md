# Baseline Capture Helpers

These scripts capture read-only baseline metadata for DECtalk modernization.
They are helpers only: they do not build DECtalk, run DECtalk binaries, generate
audio, generate dictionaries, edit source files, edit build files, or prove that
behavior has been preserved.

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

## Example

```sh
mkdir -p baseline-out
tools/baseline/capture_git_state.sh baseline-out/git
tools/baseline/capture_dist_manifest.sh dist baseline-out/dist
tools/baseline/capture_symbols.sh dist baseline-out/symbols
```

Do not claim behavior preservation from these captures alone. They provide
evidence for later reviews and comparisons.
