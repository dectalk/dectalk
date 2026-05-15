# Warning Cleanup Plan

## Purpose

This document tracks small, low-risk warning cleanup plans and records focused
cleanup results once they have local verification evidence.

The initial goal was to choose a small, low-risk first warning cleanup category
based on the local Unix warning baseline, while preserving DECtalk behavior and
avoiding high-risk synthesis, dictionary, API, threading, and audio areas.

The warning evidence comes from `baseline-runs/unix-001/warnings-summary.md`,
generated from the local Unix build logs. The summary is heuristic and counts
warning-like lines, not necessarily unique compiler diagnostics.

## Observed Warning Categories

The local Unix baseline warning summary reported 1,837 warning-like lines.

| Category | Count |
| --- | ---: |
| unknown compiler warning | 1,669 |
| uninitialized variable | 112 |
| format string mismatch | 24 |
| uncategorized | 23 |
| unused variable/function/parameter | 6 |
| integer conversion / truncation | 3 |

Zero-count categories in this run included:

- missing prototype / implicit declaration
- incompatible pointer type
- pointer/integer conversion
- signed/unsigned comparison
- deprecated declaration/API
- macro redefinition
- unreachable/dead code
- syntax/preprocessor

Notable warning markers from the larger `unknown compiler warning` group
included `-Wdiscarded-qualifiers`, `-Wmisleading-indentation`, `-Wparentheses`,
`-Wcomment`, `-Wchar-subscripts`, `-Wuse-after-free`, `-Wswitch`,
`-Wold-style-definition`, `-Wreturn-type`, and related diagnostics. These need
separate review before cleanup because many examples touch parser, language, or
compatibility code.

## Safest First Cleanup Category

The safest first cleanup category should be the narrow format-overflow /
format-string family, but only outside behavior-critical synthesis, dictionary,
API, threading, and audio paths.

This keeps the first cleanup PR small and reviewable. It also avoids starting in
areas that can alter speech output, dictionary behavior, public ABI, callback
timing, audio output, or platform threading behavior.

## First Concrete Cleanup Slice

Recommended first target:

- `[-Wformat-overflow=]` warnings in `liceninc.c`

Representative warning from the local baseline:

```text
liceninc.c:71:48: warning: '%s' directive writing up to 999 bytes into a region of size 991 [-Wformat-overflow=]
```

Likely files:

- `src/licunix/src/liceninc.c`
- possible mirrored or related file, if present:
  `src/license/LICENINC/liceninc.c`

Why this is lower risk:

- The baseline shows a small number of warning lines for this marker.
- The warning appears to be a bounded string formatting issue.
- The likely files are outside core synthesis, audio, threading, public API,
  and dictionary lookup paths.
- The fix is likely to be limited to bounded formatting or buffer sizing.
- A focused PR can verify that the targeted warning count decreases without
  mixing in unrelated warning categories.

Any cleanup still needs inspection before editing. If the two `liceninc.c`
files differ meaningfully, avoid mechanical mirroring and document the
difference before deciding whether both should change.

## First Cleanup Result

Status: completed and locally verified on 2026-05-15.

- Source file changed: `src/licunix/src/liceninc.c`.
- Warning targeted:
  `liceninc.c:71:48: warning: '%s' directive writing up to 999 bytes into a region of size 991 [-Wformat-overflow=]`.
- Before baseline inspected: `baseline-runs/unix-001/`.
- After baseline inspected: `baseline-runs/unix-after-liceninc-001/`.
- The cleanup changed only the `licenses:` line generation from unbounded
  `sprintf(line,"licenses:%s\n",encrypt)` to checked `snprintf` bounded by
  `sizeof(line)`.
- `autoreconf`, `configure`, `make`, and warning summarization all exited 0 in
  the after capture.
- The three before-baseline `[-Wformat-overflow=]` warnings for `liceninc.c:71`
  disappeared in the after capture.
- The after warning summary reported 2 warning-like lines, both related to the
  existing `tmpnam` linker warning at `liceninc.c:44`.
- The after `make.log` appears incremental and is much shorter than the
  original baseline log, so the warning-count drop should not be treated as
  broad whole-repo warning cleanup.
- This cleanup did not touch synthesis, audio, threading, dictionaries, public
  API files, build files, macros, `src/license/LICENINC/liceninc.c`, or the
  separate `tmpnam` warning.
- `baseline-runs/` remains local generated output and should not be committed
  unless explicitly approved.

This result is evidence for the targeted warning disappearing in the local Unix
capture. It does not prove broad behavior preservation.

## Avoid Initially

Do not touch these areas in the first warning cleanup PR:

- `src/dapi/src/lts`
- `src/dapi/src/ph`
- `src/dapi/src/vtm`
- `src/dapi/src/hlsyn`
- `src/dapi/src/dic`
- `src/dapi/src/api`
- `src/dapi/src/nt`
- public headers
- `cm_prot.h` inline/prototype warnings
- uninitialized warnings in phoneme/intonation files
- `mktemp` replacement in `dtmmio.c`

Reasons to avoid these initially:

- `lts`, `ph`, `vtm`, and `hlsyn` can affect speech, phoneme, intonation, and
  timing output.
- `dic` changes can affect dictionary generation, loading, lookup, and packaged
  dictionaries.
- `api`, public headers, and exported symbols can affect ABI compatibility.
- `nt` code includes threading, queue, pipe, callback, and audio behavior.
- `cm_prot.h` warnings may involve parser helper linkage or inline semantics.
- uninitialized warnings in phoneme/intonation code may require behavior-level
  analysis, not mechanical initialization.
- replacing `mktemp` can change file creation behavior and needs a focused
  portability/security review.

## Verification Before The First Cleanup PR

Before any source edit:

- Save the current warning summary from
  `baseline-runs/unix-001/warnings-summary.md`.
- Identify the exact target warning lines in
  `baseline-runs/unix-001/make.log`.
- Confirm the target file is outside the highest-risk paths listed in
  `docs/modernization/RISK_AREAS.md`.
- Confirm the working tree is clean except for intentional documentation or
  local generated baseline output.
- Inspect both likely `liceninc.c` files before deciding whether one or both
  need changes.
- Optionally capture a current dist manifest before source edits.
- Optionally capture current audio outputs before source edits.

Do not claim behavior preservation from these pre-checks alone.

## Verification After The First Cleanup PR

After the focused cleanup:

- Rerun the Unix build capture.
- Regenerate the warning summary.
- Confirm the targeted `-Wformat-overflow` warning lines decreased or
  disappeared.
- Confirm unrelated warning categories did not unexpectedly increase.
- Run `git diff --check`.
- Review the source diff to confirm it is limited to the planned warning slice.
- Optionally rerun audio capture and compare against the previous local
  baseline.
- Optionally recapture a dist manifest and compare it to the previous local
  manifest if one exists.

Do not claim behavior preservation unless the relevant baseline checks were
run and reviewed.

## Rollback Criteria

Rollback or revise the cleanup if:

- the build fails
- warning counts increase in unrelated categories
- generated artifacts or dist outputs unexpectedly change
- audio/file baseline output changes without explanation
- the fix touches broader source or build behavior than planned
- the fix requires changes in high-risk synthesis, dictionary, API, threading,
  audio, or public header areas
