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
