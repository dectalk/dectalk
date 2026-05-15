# PLAN.md

## Objective

Clean up and modernize the DECtalk codebase while preserving current behavior on Linux, Windows, macOS, and iOS.

The project should become easier to build, easier to understand, easier to warning-clean, and easier to port without changing existing functionality.

## Guiding principle

Measure behavior first. Refactor second.

The current code is convoluted but functional. The first priority is to capture current behavior so later cleanup can be checked against known-good outputs.

---

## Phase 1: Baseline and documentation

Status: not started

Goals:

- Document current build systems.
- Document current supported targets.
- Document known historical targets still present in the code.
- Document generated artifacts.
- Document high-risk source areas.
- Capture warning counts.
- Capture build logs.
- Capture exported symbols.
- Capture dist/install tree manifests.
- Capture representative audio output from fixed input text.

Rules:

- Do not change engine code in this phase.
- Do not remove macros.
- Do not remove legacy target code.
- Do not change build behavior.

Suggested files:

- `docs/modernization/BUILD_OVERVIEW.md`
- `docs/modernization/RISK_AREAS.md`
- `docs/modernization/MACRO_INVENTORY.md`
- `docs/modernization/BASELINE_PROCEDURE.md`
- `tests/golden/input/`

---

## Phase 2: Reproducible local verification

Status: not started

Goals:

- Add scripts that make it easy to reproduce baseline checks locally.
- Add scripts to capture build logs and warnings.
- Add scripts to capture exported symbols.
- Add scripts to capture generated audio files.
- Add scripts to compare current output to baseline output.

Rules:

- Scripts may be added.
- Avoid source changes unless required for scriptability.
- Existing build systems must remain unchanged.

Suggested files:

- `tools/baseline/build_unix.sh`
- `tools/baseline/capture_symbols.sh`
- `tools/baseline/capture_dist_manifest.sh`
- `tools/baseline/capture_audio.sh`
- `tools/baseline/compare_audio.py`

---

## Phase 3: CI visibility

Status: not started

Goals:

- Publish build logs as CI artifacts.
- Publish warning logs as CI artifacts.
- Publish dist tree manifests as CI artifacts.
- Publish exported symbol lists as CI artifacts.
- Optionally publish golden audio outputs as CI artifacts.

Rules:

- Do not make warnings fatal yet.
- Do not remove existing CI jobs.
- Do not remove VS6 or VS2022 jobs.
- Do not change packaging layout.

---

## Phase 4: Macro inventory

Status: not started

Goals:

- Classify important macros.
- Identify which macros are active on Linux, Windows, macOS, and iOS.
- Identify historical target macros.
- Identify sound-critical feature macros.
- Identify language-selection macros.
- Identify build-system-only macros.

Rules:

- Do not delete macros during inventory.
- Do not change default feature settings.
- Do not change `dectalkf_klsyn.h` behavior.

Macro categories:

- current platform
- current architecture
- language selection
- sound-critical feature
- product feature
- build-system define
- historical target
- unknown

---

## Phase 5: Low-risk warning cleanup

Status: not started

Goals:

- Reduce warnings without changing behavior.
- Work by warning category.
- Keep changes small and reviewable.

Low-risk categories:

- missing prototypes
- missing includes
- duplicate declarations
- unused parameters
- obviously incorrect format strings
- obvious local initialization
- unreachable code caused by clearly inactive branches

Rules:

- Do not change arithmetic in synthesis code.
- Do not change public headers unless required and explicitly reviewed.
- Do not change struct layouts.
- Do not change thread behavior.
- Do not change audio behavior.
- Do not change dictionary behavior.

---

## Phase 6: Platform abstraction scaffolding

Status: not started

Goals:

- Start containing platform-specific behavior behind narrow interfaces.
- Initially wrap existing behavior rather than rewriting it.
- Reduce spread of raw `#ifdef WIN32`, `#ifdef __linux__`, and `#ifdef __APPLE__`.

Candidate abstractions:

- threads
- mutexes
- events
- sleeping/time
- filesystem paths
- dynamic library exports
- audio backends

Suggested future files:

- `src/platform/dt_platform.h`
- `src/platform/dt_thread.h`
- `src/platform/dt_thread_posix.c`
- `src/platform/dt_thread_win32.c`
- `src/platform/dt_event.h`
- `src/platform/dt_mutex.h`
- `src/platform/dt_time.h`
- `src/platform/dt_filesystem.h`
- `src/platform/dt_audio.h`

Rules:

- Do not rewrite working thread/audio code immediately.
- Do not replace `opthread.c` in one step.
- Do not split `linux_audio.c` until baseline audio checks exist.

---

## Phase 7: Side-by-side CMake build

Status: not started

Goals:

- Add CMake as a modern build option.
- Keep Autotools and Visual Studio projects intact.
- Start with the core library and a minimal tool.
- Generate `compile_commands.json` for analysis tooling.
- Eventually support Linux, Windows, macOS, and iOS from one build description.

Rules:

- CMake must initially be side-by-side.
- Do not remove Autotools.
- Do not remove Visual Studio projects.
- Do not change artifact names until compatibility is discussed.
- Do not change source membership without documenting differences.

---

## Phase 8: Historical target quarantine

Status: not started

Goals:

- Move unsupported historical target code behind explicit legacy options.
- Reduce accidental interaction between current targets and historical branches.
- Prepare for eventual removal if desired.

Historical targets to investigate:

- OSF/Tru64
- VxWorks
- MS-DOS
- Windows CE
- Solaris/SPARC
- ARM7
- MIPS
- old PowerPC Mac
- iPAQ Linux

Rules:

- Inventory first.
- Quarantine second.
- Delete only with explicit approval.

---

## Definition of done for each change

A change is not complete unless the summary states:

- what changed
- why it changed
- files changed
- verification commands run
- whether warnings changed
- whether public exports changed
- behavior risk level
- known limitations

Do not claim behavior preservation unless appropriate checks were run.

---

## Current immediate next step

Create initial modernization documentation without changing engine code.

Suggested first Codex task:

Read the repository build files and create:

- `docs/modernization/BUILD_OVERVIEW.md`
- `docs/modernization/MACRO_INVENTORY_START.md`
- `docs/modernization/RISK_AREAS.md`

Do not edit source files.
Do not change build files.
Do not remove macros.
