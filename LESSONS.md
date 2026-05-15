# LESSONS.md

This file records discoveries, gotchas, decisions, and project-specific lessons learned while modernizing DECtalk.

The goal is to avoid rediscovering the same facts repeatedly and to help future Codex sessions preserve behavior while improving the codebase.

## How to use this file

Add a short entry whenever a task reveals something important, surprising, risky, or easy to forget.

Good entries include:

- build-system gotchas
- macro meanings
- platform-specific behavior
- warning patterns
- files that are risky to touch
- tests that caught or failed to catch something
- behavior that must be preserved
- decisions made during modernization
- commands that worked
- commands that failed and why

Keep entries concise, factual, and dated.

## Entry format

Each entry should use this structure:

### YYYY-MM-DD - Short title

#### Context

What were we trying to do?

#### Lesson

What did we learn?

#### Impact

Why does it matter?

#### Follow-up

What should be done next, if anything?

---

### 2026-05-15 - Modernization must be preservation-first

#### Context

Initial modernization planning for the DECtalk repository.

#### Lesson

This repository contains legacy C code with deeply intertwined platform, language, product, and sound-critical feature conditionals. Broad cleanup or aggressive `#ifdef` removal could change behavior even when the edit looks mechanical.

#### Impact

Before refactoring, the project needs baseline artifacts such as build logs, warning logs, exported symbols, generated dictionaries, dist manifests, and representative audio output.

#### Follow-up

Start with documentation and baseline capture before source cleanup.

---

### 2026-05-15 - Current intended targets are narrower than historical code

#### Context

The modernization target platforms were identified as Linux, Windows, macOS, and iOS.

#### Lesson

The source still contains historical branches for older or inactive targets such as OSF/Tru64, VxWorks, MS-DOS, Windows CE, Solaris/SPARC, ARM7, MIPS, PowerPC Mac, and iPAQ Linux.

#### Impact

Historical branches should be inventoried and eventually quarantined behind explicit legacy options. They should not be deleted casually, because some historical macros may still affect current builds indirectly.

#### Follow-up

Build a macro inventory before attempting preprocessor cleanup.

---

### 2026-05-15 - `dectalkf_klsyn.h` is behavior-critical

#### Context

Initial inspection showed that `src/dectalkf_klsyn.h` controls many synthesis features.

#### Lesson

This file controls behavior such as parser selection, typing mode, single-threading, intonation/timing model, voice tract model, sample rate, voice ROM selection, old-song parser compatibility, and software volume.

#### Impact

Changes to this file can alter speech output. Treat it as sound-critical configuration, not ordinary cleanup.

#### Follow-up

Include it in baseline documentation and macro inventory.

---

### 2026-05-15 - Build systems differ by platform

#### Context

Initial inspection showed that Unix-like builds and Windows builds are not equivalent.

#### Lesson

The Unix build path uses Autotools/Make and appears to build multiple language variants. The VS2022 path currently builds `Release - ENGLISH_US` for AMD64 and IA32 through custom batch files.

#### Impact

Modernization needs to preserve each build path until a replacement has proven parity. A future CMake build should be added side-by-side first, not as an immediate replacement.

#### Follow-up

Document source membership and artifact differences between Unix, VS6, and VS2022 builds.
