# Macro Inventory Start

This is a starting point for a preservation-first macro inventory. It records
visible macro groups and likely classifications. It is not a cleanup plan, and
none of these macros should be removed or simplified without baseline evidence.

## Classification Categories

Use these categories from the modernization policy:

- current platform
- current architecture
- language selection
- sound-critical feature
- product feature
- build-system define
- historical target
- unknown

When a macro fits multiple categories, document the ambiguity instead of forcing
one answer too early.

## Build-System Defines

`src/configure.ac` provides the main Unix-like build defines. Common observed
defines include:

- `LTSSIM`
- `TTSSIM`
- `ANSI`
- `BLD_DECTALK_DLL`
- `DECTALK_INSTALL_PREFIX`
- `ACCESS32`
- `TYPING_MODE`
- `NOMME`
- `_REENTRANT`

The `LANGUAGE` make variable expands to language and regional defines. Observed
Unix release targets pass combinations such as:

- `ENGLISH`, `ENGLISH_US`, `ACNA`
- `ENGLISH`, `ENGLISH_UK`
- `SPANISH`, `SPANISH_SP`
- `SPANISH`, `SPANISH_LA`
- `GERMAN`
- `FRENCH`

Windows project files and batch wrappers also define language, platform, and
configuration-specific values. These need a separate pass because the VS2022 and
VS6 build surfaces differ.

## Current Platform Markers

Likely current platform macros:

- `__linux__`
- `WIN32`
- `_WIN32`
- `_WIN64`
- `__APPLE__`
- `__EMSCRIPTEN__`

Notes:

- `__APPLE__` appears in current Unix-like source branches and configure logic.
- macOS currently uses Autotools in CI.
- iOS support needs explicit documentation. The repository has Apple branches,
  but the exact iOS build path was not identified in this initial pass.
- `__EMSCRIPTEN__` appears in public API and portability headers, but it is not
  listed as a current intended target in `AGENTS.md`.

## Historical Target Markers

Historical or likely historical target macros and markers include:

- `__osf__`
- `OSF`
- `VXWORKS`
- `_SPARC_SOLARIS_`
- `_BIGENDIAN_`
- `UNDER_CE`
- `_WIN32_WCE`
- `_WIN32_WCE_EMULATION`
- `MSDOS`
- `ARM7`
- `EPSON_ARM7`
- `ARM7_NOSWI`
- `MIPS`
- `_MIPS_`
- `SH3`
- `_SH3_`
- `__ipaq__`
- `_APPLE_MAC_`
- `UNIX_AND_MIPS`

These should be inventoried and classified before any quarantine or removal is
considered. Some historical branches may still interact with current source
membership or public headers.

## Language Selection Macros

Language and region macros are behavior-critical because they affect dictionaries,
phoneme rules, parser behavior, voice data, and generated artifacts.

Observed examples:

- `ENGLISH`
- `ENGLISH_US`
- `ENGLISH_UK`
- `SPANISH`
- `SPANISH_SP`
- `SPANISH_LA`
- `GERMAN`
- `FRENCH`
- `SWAHILI`
- `ACNA`
- `NWSNOAA`
- `NWS_LA`

Do not normalize or rename these until dictionary and audio baselines exist.

## Sound-Critical Feature Macros

The highest-risk macro definitions appear in:

- `src/dectalkf_klsyn.h`
- `src/dectalkf_hlsyn.h`
- `src/dapi/src/api/ttsapi.c`
- `src/dapi/src/api/tts.h`
- `src/dapi/src/include/port.h`

Examples that should be treated as sound-critical or timing-critical:

- `NEW_BINARY_PARSER`
- `GERMAN_COMPOUND_NOUNS`
- `HLSYN`
- `ACCESS32`
- `TYPING_MODE`
- `SLOWTALK`
- `NEW_PHONES`
- `FP_VTM`
- `AD_BASE`
- `SINGLE_THREADED`
- `NEW_INTONATION`
- `PARSER_HACK_FOR_OLD_SONGS`
- `OLD_INTONATION_AND_TIMING`
- `VTM1`
- `PC_SAMPLE_RATE`
- `VOICE_ROM_DECTALK_1996M_43F`
- `VOICE_ROM_1997`
- `VOICE_ROM_1996`
- `VOICE_ROM_DECTALK_41`
- `VOICE_ROM_DECTALK_43`
- `VOICE_ROM_DTC_03_03JAN89`
- `OLD_SETTAR`
- `SOFTWARE_VOLUME`

The HLSYN configuration header has additional macros such as:

- `UPGRADES1999`
- `NEW_VOCAL_TRACT`
- `NEW_VTM`
- `NEW_TILT`
- `NEW_NOISE`
- `CHANGES_AFTER_V43`
- `VOICE_ROM_BETA5`

These can affect speech output. They should be documented with current defaults
and baseline audio before any edits.

## Product and Integration Macros

Likely product, integration, or packaging macros include:

- `SAPI_MULTI_LANGUAGE_SUPPORT`
- `SAPI_GROUP_F_INTERFACES`
- `SAPI_GROUP_H_TIMING`
- `SAPI5DECTALK`
- `OLEDECTALK`
- `CUP28PROJECT`
- `ACI_LICENSE`
- `DTALK50`
- `DTALK_50`
- `LDS_BUILD`
- `STATIC_BUILD`
- `ACCESS_SOLUTIONS`
- `DEMO`
- `DEMO_NOISE`
- `PHEDIT2`
- `API_DEBUG`
- `PRINTFDEBUG`

Some of these may affect exported interfaces, licensing paths, or integration
behavior. They should be classified from build files and call sites before any
cleanup.

## Portability and Type Macros

Portability headers emulate platform types and APIs. Important areas include:

- `src/dapi/src/include/port.h`
- `src/dapi/src/osf/dtmmedefs.h`
- `src/dapi/src/osf/dtmmiodefs.h`
- `src/dapi/src/api/ttsapi.h`
- `src/dapi/src/api/tts.h`

Observed themes:

- Windows type compatibility on Unix-like platforms
- endian handling
- audio format constants
- file and multimedia compatibility definitions
- thread and event compatibility wrappers

These definitions may look mechanical, but they can affect public API layout and
binary compatibility.

## Initial Inventory Commands

Useful read-only commands for the next pass:

```sh
rg -n "^#\\s*(if|ifdef|ifndef|elif|define)" src/dectalkf*.h src/dapi/src
rg -n "WIN32|__linux__|__APPLE__|VXWORKS|__osf__|UNDER_CE|ARM7|MSDOS" src
rg -n "ENGLISH|SPANISH|GERMAN|FRENCH|SWAHILI|ACNA" src
rg -n "HLSYN|VTM|INTONATION|VOICE_ROM|SAMPLE_RATE|TYPING_MODE" src
```

## Next Steps

- Build a table of macros with file, line, category, owner area, and observed
  build source.
- Separate current target macros from historical target macros.
- Record which macros are defined by Autotools, VS2022, VS6, and source headers.
- Mark sound-critical macros before any warning cleanup touches nearby code.
- Capture baselines before changing any macro defaults.
