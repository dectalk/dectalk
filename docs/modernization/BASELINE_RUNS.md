# Baseline Runs

This file records summaries of local baseline captures. These notes are for
modernization planning only and do not prove behavior preservation.

Local output under `baseline-runs/` is generated evidence and should not be
committed unless explicitly approved.

## unix-001

- Capture date: 2026-05-15T09:53:07Z through 2026-05-15T09:53:17Z.
- Local output directory inspected: `baseline-runs/unix-001/`.
- Command used: `tools/baseline/capture_unix_build.sh baseline-runs/unix-001`.
- Git branch at capture: `cleanup`.
- Git HEAD at capture: `d890de1188b046e06797cd729d50d10837d7c45b`
  (`Add Unix build log capture helper`).

### Platform And Toolchain Notes

- `configure` reported build, host, and target as `x86_64-pc-linux-gnu`.
- `configure` used `gcc`.
- Captured install paths included `6.6.114.1-microsoft-standard-WSL2`, so this
  run appears to have been captured from a Linux environment on WSL2.
- Optional dependency probes reported `gtk+-2.0`, `libpulse-simple`, and `alsa`
  as unavailable.
- `iconv` was available.

### Captured Steps

| Step | Command | Exit Code | Log |
| --- | --- | --- | --- |
| Git state | `tools/baseline/capture_git_state.sh baseline-runs/unix-001/git` | 0 | `baseline-runs/unix-001/git/` |
| Autoreconf | `autoreconf -i` | 0 | `baseline-runs/unix-001/autoreconf.log` |
| Configure | `./configure` | 0 | `baseline-runs/unix-001/configure.log` |
| Make | `make` | 0 | `baseline-runs/unix-001/make.log` |
| Warning summary | `python3 tools/baseline/summarize_warnings.py ...` | 0 | `baseline-runs/unix-001/warnings-summary.md` |

The overall captured final exit code was 0.

### Warning Summary

`baseline-runs/unix-001/warnings-summary.md` was generated successfully.

The warning summarizer found 1,837 warning-like lines:

| Category | Count |
| --- | ---: |
| unknown compiler warning | 1,669 |
| uninitialized variable | 112 |
| format string mismatch | 24 |
| uncategorized | 23 |
| unused variable/function/parameter | 6 |
| integer conversion / truncation | 3 |

Categories with zero matches included missing prototype / implicit declaration,
incompatible pointer type, pointer/integer conversion, signed/unsigned
comparison, deprecated declaration/API, macro redefinition, unreachable/dead
code, and syntax/preprocessor.

### Notable Limitations

- This capture does not prove speech, API, dictionary, packaging, exported
  symbol, or runtime behavior preservation.
- No audio outputs were generated or compared.
- No generated dictionary hashes were captured in this run.
- No exported symbol inventory was captured in this run.
- No installed/dist manifest was captured in this run.
- Warning categorization is heuristic, and most warning-like lines were grouped
  under `unknown compiler warning`.
- `make` exited 0, but `make.log` included ignored install errors for missing
  `gspeak` and `windic` sample artifacts. The log should be reviewed alongside
  the final exit code.
- `baseline-runs/` remains local generated output and should not be committed
  unless explicitly approved.

## unix-after-liceninc-001

- Capture date: 2026-05-15T10:50:40Z through 2026-05-15T10:50:43Z.
- Local output directory inspected:
  `baseline-runs/unix-after-liceninc-001/`.
- Command used:
  `tools/baseline/capture_unix_build.sh baseline-runs/unix-after-liceninc-001`.
- Before baseline inspected: `baseline-runs/unix-001/`.
- Source file changed for this cleanup: `src/licunix/src/liceninc.c`.
- Warning targeted:
  `liceninc.c:71:48: warning: '%s' directive writing up to 999 bytes into a region of size 991 [-Wformat-overflow=]`.
- Cleanup shape: the `licenses:` line generation was changed from unbounded
  `sprintf(line,"licenses:%s\n",encrypt)` to checked `snprintf` bounded by
  `sizeof(line)`.
- Git branch at capture: `cleanup`.
- Captured git status showed the intended `src/licunix/src/liceninc.c` source
  edit and untracked local `baseline-runs/` output.

### Captured Steps

| Step | Command | Exit Code | Log |
| --- | --- | ---: | --- |
| Git state | `tools/baseline/capture_git_state.sh baseline-runs/unix-after-liceninc-001/git` | 0 | `baseline-runs/unix-after-liceninc-001/git/` |
| Autoreconf | `autoreconf -i` | 0 | `baseline-runs/unix-after-liceninc-001/autoreconf.log` |
| Configure | `./configure` | 0 | `baseline-runs/unix-after-liceninc-001/configure.log` |
| Make | `make` | 0 | `baseline-runs/unix-after-liceninc-001/make.log` |
| Warning summary | `python3 tools/baseline/summarize_warnings.py ...` | 0 | `baseline-runs/unix-after-liceninc-001/warnings-summary.md` |

The overall captured final exit code was 0.

### Cleanup Result

The before baseline `baseline-runs/unix-001/make.log` contained three
`[-Wformat-overflow=]` warning lines for `liceninc.c:71`.

The after baseline `baseline-runs/unix-after-liceninc-001/make.log` contained
no `[-Wformat-overflow=]` or `liceninc.c:71` warnings. The target warning
disappeared in this local capture.

The remaining `liceninc.c` warning in the after capture was the existing
`tmpnam` linker warning at `liceninc.c:44`. That warning was intentionally not
addressed in this narrow cleanup.

### Warning Count Notes

| Capture | Total Warning-Like Lines | `integer conversion / truncation` | `uncategorized` |
| --- | ---: | ---: | ---: |
| `baseline-runs/unix-001/` | 1,837 | 3 | 23 |
| `baseline-runs/unix-after-liceninc-001/` | 2 | 0 | 2 |

The after `make.log` was much shorter than the original baseline log
(`868` lines versus `9,203` lines), and appears to reflect an incremental
rebuild. Treat the result as evidence that the targeted `liceninc.c`
`[-Wformat-overflow=]` warning disappeared, not as proof of broad whole-repo
warning reduction.

### Verification Commands Used

- `git diff -- src/licunix/src/liceninc.c`
- `git diff --check`
- `tools/baseline/capture_unix_build.sh baseline-runs/unix-after-liceninc-001`
- inspection of `baseline-runs/unix-001/warnings-summary.md`
- inspection of `baseline-runs/unix-001/make.log`
- inspection of `baseline-runs/unix-after-liceninc-001/warnings-summary.md`
- inspection of `baseline-runs/unix-after-liceninc-001/make.log`

### Intentionally Not Changed

- No synthesis, audio, threading, dictionary, public API, or build files were
  changed.
- `src/license/LICENINC/liceninc.c` was not changed.
- The `tmpnam` warning in `src/licunix/src/liceninc.c` was not changed.
- No broad warning cleanup was attempted.
- No macros were removed or simplified.
- `baseline-runs/` remains local generated output and should not be committed
  unless explicitly approved.

### Notable Limitations

- This capture does not prove speech, API, dictionary, packaging, exported
  symbol, or runtime behavior preservation.
- No audio output capture or audio comparison was run after this source cleanup.
- No exported symbol inventory, dictionary hashes, or dist manifest were
  compared for this cleanup.
- Because the after build appears incremental, warning totals are not directly
  comparable to the original full baseline.

## audio-001

- Capture date: 2026-05-15T10:11:24Z.
- Local output directory inspected: `baseline-runs/audio-001/`.
- Command used:
  `tools/baseline/capture_audio_outputs.sh dist/say tests/golden/input baseline-runs/audio-001`.
- `say` executable: `dist/say`.
- Golden input directory: `tests/golden/input`.
- Command template: `SAY_EXE -fi INPUT_FILE -fo OUT_WAV`.

### Captured Inputs

| Input | Exit Code | Result | Audio Output |
| --- | ---: | --- | --- |
| `tests/golden/input/basic.txt` | 0 | success | `baseline-runs/audio-001/audio/basic.wav` |
| `tests/golden/input/commands.txt` | 0 | success | `baseline-runs/audio-001/audio/commands.wav` |
| `tests/golden/input/languages.txt` | 0 | success | `baseline-runs/audio-001/audio/languages.wav` |
| `tests/golden/input/numbers_dates.txt` | 0 | success | `baseline-runs/audio-001/audio/numbers_dates.wav` |

### Captured Logs

Stdout and stderr were captured under `baseline-runs/audio-001/logs/`.

Observed log files:

- `basic.stdout.txt` and `basic.stderr.txt`
- `commands.stdout.txt` and `commands.stderr.txt`
- `languages.stdout.txt` and `languages.stderr.txt`
- `numbers_dates.stdout.txt` and `numbers_dates.stderr.txt`

All observed stdout and stderr log files were empty in this capture.

### Manifest And Hashes

The run generated:

- `baseline-runs/audio-001/audio-manifest.txt`
- `baseline-runs/audio-001/audio-sha256.txt`

`audio-sha256.txt` records SHA-256 hashes generated with `sha256sum`.

Recorded audio output sizes:

| Audio Output | Size |
| --- | ---: |
| `baseline-runs/audio-001/audio/basic.wav` | 742,136 bytes |
| `baseline-runs/audio-001/audio/commands.wav` | 786,156 bytes |
| `baseline-runs/audio-001/audio/languages.wav` | 859,570 bytes |
| `baseline-runs/audio-001/audio/numbers_dates.wav` | 1,675,502 bytes |

### Notable Limitations

- This capture does not prove speech, API, dictionary, packaging, exported
  symbol, or runtime behavior preservation.
- No audio comparison was performed.
- No audio metrics such as duration, sample count, sample rate, RMS, or peak
  values were computed.
- `languages.txt` was run as one input through the single `dist/say`
  executable, not split by language-specific build or voice.
- The capture uses the helper's `-fi`/`-fo` command shape; other `say` variants
  may document different file-output options.
- Audio outputs remain local generated artifacts. Do not commit
  `baseline-runs/` unless explicitly approved.

## audio-self-compare

- Comparison date: 2026-05-15T10:24:13Z.
- Local report file inspected: `baseline-runs/audio-self-compare.md`.
- Command used:
  `python3 tools/baseline/compare_audio_outputs.py --baseline baseline-runs/audio-001 --candidate baseline-runs/audio-001 --output baseline-runs/audio-self-compare.md`.
- Baseline directory: `baseline-runs/audio-001`.
- Candidate directory: `baseline-runs/audio-001`.
- Result: `PASS`.

### Smoke-Test Summary

| Metric | Count |
| --- | ---: |
| Baseline artifacts | 4 |
| Candidate artifacts | 4 |
| Compared artifacts | 4 |
| Exact matches | 4 |
| Missing files | 0 |
| Extra files | 0 |
| Differing files | 0 |
| Unreadable files | 0 |
| WAV metadata differences | 0 |
| WAV metadata errors | 0 |

The report does not record the shell exit code directly. The comparison helper
is documented to exit 0 only when all compared artifacts match exactly, and this
self-compare report recorded `PASS`.

### What This Proves

- The comparison helper can read an existing `capture_audio_outputs.sh` output
  directory.
- The helper can compare the four captured audio artifacts by name.
- The helper can compute exact file matches and parse WAV metadata for the
  current `audio-001` files.
- The helper can write a Markdown comparison report.

### What This Does Not Prove

- This self-compare does not prove speech, API, dictionary, packaging, exported
  symbol, or runtime behavior preservation.
- It does not compare two independent captures.
- It does not validate cross-platform repeatability.
- It does not compute RMS, peak, perceptual difference, or sample-level deltas.
- `baseline-runs/` remains local generated output and should not be committed
  unless explicitly approved.
